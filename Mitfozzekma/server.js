
const express = require("express");
const path = require("path");
const mysql = require("mysql2/promise");
const crypto = require("crypto");
const bcrypt = require("bcryptjs");
const fs = require("fs");

const app = express();
const PORT = 3000;

const dbConfig = {
  host: "127.0.0.1",
  port: 3306,
  user: "root",
  password: "",
  database: "mitfozzekma",
  charset: "utf8mb4"
};
const AUTH_SECRET = process.env.MITFOZZEKMA_AUTH_SECRET || "Mitfozzekma@2026";

const USER_TABLE_SQL =
  "CREATE TABLE IF NOT EXISTS `felhasznalo` (" +
  "`idfelhasznalo` int(11) NOT NULL AUTO_INCREMENT," +
  "`felhasznalonev` varchar(60) NOT NULL," +
  "`email` varchar(120) NOT NULL," +
  "`jelszo_hash` varchar(255) NOT NULL," +
  "`teljes_nev` varchar(120) DEFAULT NULL," +
  "`telefon` varchar(30) DEFAULT NULL," +
  "`szerepkor` enum('felhasznalo','admin') NOT NULL DEFAULT 'felhasznalo'," +
  "`allapot` enum('aktiv','inaktiv','tiltott') NOT NULL DEFAULT 'aktiv'," +
  "`letrehozva` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP," +
  "`utolso_frissites` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP," +
  "`profil_kep` MEDIUMTEXT DEFAULT NULL," +
  "`kedvelt_receptek` JSON DEFAULT NULL," +
  "UNIQUE KEY `uq_felhasznalo_email` (`email`)," +
  "UNIQUE KEY `uq_felhasznalo_felhasznalonev` (`felhasznalonev`)," +
  "PRIMARY KEY (`idfelhasznalo`)" +
  ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

const RECIPES_TABLE_SQL =
  "CREATE TABLE IF NOT EXISTS `receptek` (" +
  "`idreceptek` int(11) NOT NULL AUTO_INCREMENT," +
  "`hozzavalo` varchar(255) DEFAULT NULL," +
  "`ido` text DEFAULT NULL," +
  "`meal` varchar(50) DEFAULT NULL," +
  "`unnepi_etelek` varchar(50) DEFAULT NULL," +
  "`kulonlegesseg` varchar(50) DEFAULT NULL," +
  "`kepek` MEDIUMTEXT DEFAULT NULL," +
  "`recept_hozzaadas` text DEFAULT NULL," +
  "`allergens` varchar(255) DEFAULT NULL," +
  "`edes` varchar(10) DEFAULT NULL," +
  "`sos` varchar(10) DEFAULT NULL," +
  "`felhasznalo_id` int(11) DEFAULT NULL," +
  "`kaloria` varchar(20) DEFAULT NULL," +
  "PRIMARY KEY (`idreceptek`)" +
  ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

// Egyszerűsített tábla inicializálás csak induláskor
async function initTables() {
  const conn = await mysql.createConnection(dbConfig);
  await conn.execute(`CREATE TABLE IF NOT EXISTS felhasznalo (
    idfelhasznalo int(11) NOT NULL AUTO_INCREMENT,
    felhasznalonev varchar(60) NOT NULL,
    email varchar(120) NOT NULL,
    jelszo_hash varchar(255) NOT NULL,
    teljes_nev varchar(120) DEFAULT NULL,
    telefon varchar(30) DEFAULT NULL,
    szerepkor enum('felhasznalo','admin') NOT NULL DEFAULT 'felhasznalo',
    allapot enum('aktiv','inaktiv','tiltott') NOT NULL DEFAULT 'aktiv',
    letrehozva datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    utolso_frissites datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    profil_kep MEDIUMTEXT DEFAULT NULL,
    kedvelt_receptek JSON DEFAULT NULL,
    UNIQUE KEY uq_felhasznalo_email (email),
    UNIQUE KEY uq_felhasznalo_felhasznalonev (felhasznalonev),
    PRIMARY KEY (idfelhasznalo)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4`);
  await conn.execute(`CREATE TABLE IF NOT EXISTS receptek (
    idreceptek int(11) NOT NULL AUTO_INCREMENT,
    hozzavalo varchar(255) DEFAULT NULL,
    ido text DEFAULT NULL,
    meal varchar(50) DEFAULT NULL,
    unnepi_etelek varchar(50) DEFAULT NULL,
    kulonlegesseg varchar(50) DEFAULT NULL,
    kepek MEDIUMTEXT DEFAULT NULL,
    recept_hozzaadas text DEFAULT NULL,
    allergens varchar(255) DEFAULT NULL,
    edes varchar(10) DEFAULT NULL,
    sos varchar(10) DEFAULT NULL,
    felhasznalo_id int(11) DEFAULT NULL,
    kaloria VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (idreceptek)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4`);
  await conn.end();
}

//Segédfüggvények adatbázishoz
function ensureUserTable(conn) {   
  return conn.execute(USER_TABLE_SQL);   
}

function ensureRecipesUserColumn(conn) {   
  return conn.execute(RECIPES_TABLE_SQL)   
    .then(function() {
      return conn.execute(   
        "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'receptek' AND COLUMN_NAME = 'felhasznalo_id'"
      );
    })
    .then(function(r) {
      if (r[0][0].c === 0) {   // ha 0, nincs ilyen oszlop
        return conn.execute("ALTER TABLE `receptek` ADD COLUMN `felhasznalo_id` INT(11) DEFAULT NULL");
      }
    });
}

function ensureRecipesKaloriaColumn(conn) {   // kaloria oszlop hozzáadása ha hiányzik
  return conn.execute(   // megnézi, van-e kaloria oszlop
    "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'receptek' AND COLUMN_NAME = 'kaloria'"
  ).then(function(r) {
    if (r[0][0].c === 0) {   // ha nincs, hozzáadja
      return conn.execute("ALTER TABLE `receptek` ADD COLUMN `kaloria` VARCHAR(20) DEFAULT NULL");
    }
  });
}

function ensureUserProfilKepColumn(conn) {   // profil_kep oszlop hozzáadása ha hiányzik
  return conn.execute(
    "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'felhasznalo' AND COLUMN_NAME = 'profil_kep'"
  ).then(function(r) {
    if (r[0][0].c === 0) {
      return conn.execute("ALTER TABLE `felhasznalo` ADD COLUMN `profil_kep` MEDIUMTEXT DEFAULT NULL");
    }
  });
}

function ensureUserProfilKepMediumText(conn) {   // profil_kep MEDIUMTEXT (base64 képekhez, ne csonkoljon)
  return conn.execute(
    "SELECT DATA_TYPE, CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'felhasznalo' AND COLUMN_NAME = 'profil_kep'"
  ).then(function(r) {
    if (r[0].length > 0 && (r[0][0].DATA_TYPE === 'text' && r[0][0].CHARACTER_MAXIMUM_LENGTH < 1000000)) {
      return conn.execute("ALTER TABLE `felhasznalo` MODIFY COLUMN `profil_kep` MEDIUMTEXT DEFAULT NULL");
    }
  }).catch(function() { return; });
}

function ensureUserKedveltReceptekColumn(conn) {   // kedvelt_receptek oszlop hozzáadása ha hiányzik
  return conn.execute(
    "SELECT COUNT(*) AS c FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'felhasznalo' AND COLUMN_NAME = 'kedvelt_receptek'"
  ).then(function(r) {
    if (r[0][0].c === 0) {
      return conn.execute("ALTER TABLE `felhasznalo` ADD COLUMN `kedvelt_receptek` JSON DEFAULT NULL");
    }
  });
}

function ensureRecipesKepekMediumText(conn) {   // kepek oszlop MEDIUMTEXT (base64 képekhez)
  return conn.execute(
    "SELECT DATA_TYPE, CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'receptek' AND COLUMN_NAME = 'kepek'"
  ).then(function(r) {
    if (r[0].length > 0 && (r[0][0].DATA_TYPE === 'varchar' || (r[0][0].CHARACTER_MAXIMUM_LENGTH && r[0][0].CHARACTER_MAXIMUM_LENGTH < 100000))) {
      return conn.execute("ALTER TABLE `receptek` MODIFY COLUMN `kepek` MEDIUMTEXT DEFAULT NULL");
    }
  }).catch(function() { return; });
}

//Middleware-ek (mindennapos kérésfeldolgozás)
app.use(express.json({ limit: '2mb' }));
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));


// Egyszerűsített jelszókezelés és utilityk
const hashPassword = pw => {
  const salt = crypto.randomBytes(16).toString("hex");
  const hash = crypto.scryptSync(pw, salt, 64).toString("hex");
  return salt + ":" + hash;
};
const checkPassword = (pw, stored) => {
  if (!stored) return false;
  if (stored === pw) return true;
  if (stored.startsWith("$2a$") || stored.startsWith("$2b$") || stored.startsWith("$2y$")) return bcrypt.compareSync(pw, stored);
  if (!stored.includes(":")) return false;
  const [salt, hash] = stored.split(":");
  return hash === crypto.scryptSync(pw, salt, 64).toString("hex");
};
const createAuthToken = user => {
  const id = user.idfelhasznalo || user.id || "";
  const email = user.email || "";
  return crypto.createHash("sha256").update(String(id) + "|" + email + "|" + AUTH_SECRET).digest("hex");
};
const toClientUserPayload = user => {
  let kedveltReceptek = [];
  try { if (user.kedvelt_receptek) kedveltReceptek = JSON.parse(user.kedvelt_receptek); } catch(e) {}
  return {
    id: user.idfelhasznalo,
    username: user.felhasznalonev,
    email: user.email,
    role: user.szerepkor,
    token: createAuthToken(user),
    profilKep: user.profil_kep || null,
    favoriteRecipes: kedveltReceptek
  };
};

//Adatbázis sor átalakítása kliensnek megfelelő recept objektummá
function dbRowToRecipe(row) {
  var recept = row.recept_hozzaadas || "";
  var firstLineEnd = recept.indexOf("\n\n");
  var title = firstLineEnd >= 0 ? recept.substring(0, firstLineEnd).trim() : recept.split("\n")[0] || "";
  var stepsStr = firstLineEnd >= 0 ? recept.substring(firstLineEnd + 2).trim() : recept;
  var ingredients = row.hozzavalo || "";
  var ingArr = ingredients ? ingredients.split(",").map(function(s) { return s.trim(); }).filter(Boolean) : [];
  return {
    id: row.idreceptek,
    title: title || "Recept",
    time: row.ido || "",
    meal: row.meal || "",
    type: row.kulonlegesseg || "", 
    kaloria: row.kaloria || null,
    image: row.kepek || "",
    ingredients: ingArr.length > 0 ? ingArr : ingredients,
    steps: stepsStr ? [stepsStr] : [], 
    userId: row.felhasznalo_id || null 
  };
}

//API végpontok

app.get("/api/recipes", (req, res) => {
  mysql.createConnection(dbConfig)
    .then(conn => conn.execute("SELECT * FROM receptek ORDER BY idreceptek")
      .then(result => {
        conn.end();
        res.json(result[0].map(dbRowToRecipe));
      })
      .catch(err => { conn.end(); throw err; })
    )
    .catch(err => {
      console.error("db hiba:", err);
      res.status(500).json({ error: "database_error" });
    });
});

app.post("/api/recipes", function(req, res) {   // új recept, POST /api/recipes (bejelentkezés kell)
  const userId = req.headers["x-auth-user"];
  const token = req.headers["x-auth-token"];
  if (!userId || !token) return res.status(401).json({ success: false, error: "login_required" });
  const body = req.body || {};
  const title = body.title || body.hozzavalo || "";
  const time = body.time || body.ido || "";
  const meal = body.meal || "";
  const type = body.type || body.kulonlegesseg || "";
  const steps = Array.isArray(body.steps) ? body.steps.join("\n") : (body.steps || body.recept_hozzaadas || "");
  const ingredients = Array.isArray(body.ingredients) ? body.ingredients.join(", ") : (body.ingredients || body.hozzavalo || "");
  const imageUrl = body.image || body.kepek || "";
  const kaloria = body.kaloria ? String(body.kaloria).trim() : null;
  mysql.createConnection(dbConfig)
    .then(conn => conn.execute("SELECT * FROM felhasznalo WHERE idfelhasznalo = ?", [userId])
      .then(result => {
        const user = result[0][0];
        if (!user || createAuthToken(user) !== token) {
          conn.end();
          return Promise.reject({ status: 401 });
        }
        const receptHozzaadas = (title ? title + "\n\n" : "") + steps;
        return conn.execute(
          "INSERT INTO receptek (hozzavalo, ido, meal, kulonlegesseg, kepek, recept_hozzaadas, allergens, felhasznalo_id, kaloria) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
          [ingredients, String(time), meal, type, (imageUrl && imageUrl.length > 0 && imageUrl.length <= 2097152) ? imageUrl : (imageUrl && imageUrl.length <= 500 ? imageUrl : ""), receptHozzaadas, body.allergens || "none", userId, kaloria]
        ).then(insertResult => {
          conn.end();
          res.json({ success: true, id: insertResult[0].insertId });
        });
      })
      .catch(err => { conn.end(); throw err; })
    )
    .catch(err => {
      if (err.status === 401) return res.status(401).json({ success: false, error: "login_required" });
      res.status(500).json({ success: false, error: "server_error" });
    });
});

app.put("/api/recipes/:id", function(req, res) {
  const recipeId = parseInt(req.params.id, 10);
  if (isNaN(recipeId)) return res.status(400).json({ success: false, error: "invalid_id" });
  const userId = req.headers["x-auth-user"];
  const token = req.headers["x-auth-token"];
  if (!userId || !token) return res.status(401).json({ success: false, error: "login_required" });
  const body = req.body || {};
  const title = body.title || body.hozzavalo || "";
  const time = body.time || body.ido || "";
  const meal = body.meal || "";
  const type = body.type || body.kulonlegesseg || "";
  const steps = Array.isArray(body.steps) ? body.steps.join("\n") : (body.steps || body.recept_hozzaadas || "");
  const ingredients = Array.isArray(body.ingredients) ? body.ingredients.join(", ") : (body.ingredients || body.hozzavalo || "");
  const imageUrl = body.image || body.kepek || "";
  const kaloria = body.kaloria ? String(body.kaloria).trim() : null;
  mysql.createConnection(dbConfig)
    .then(conn => conn.execute("SELECT * FROM felhasznalo WHERE idfelhasznalo = ?", [userId])
      .then(result => {
        const user = result[0][0];
        if (!user || createAuthToken(user) !== token) {
          conn.end();
          return Promise.reject({ status: 401 });
        }
        return conn.execute("SELECT felhasznalo_id FROM receptek WHERE idreceptek = ?", [recipeId])
          .then(r => {
            const row = r[0][0];
            if (!row) { conn.end(); return Promise.reject({ status: 404 }); }
            if (String(row.felhasznalo_id) !== String(userId)) {
              conn.end();
              return Promise.reject({ status: 403 });
            }
            const receptHozzaadas = (title ? title + "\n\n" : "") + steps;
            return conn.execute(
              "UPDATE receptek SET hozzavalo=?, ido=?, meal=?, kulonlegesseg=?, kepek=?, recept_hozzaadas=?, allergens=?, kaloria=? WHERE idreceptek=? AND felhasznalo_id=?",
              [ingredients, String(time), meal, type, (imageUrl && imageUrl.length > 0 && imageUrl.length <= 2097152) ? imageUrl : (imageUrl && imageUrl.length <= 500 ? imageUrl : ""), receptHozzaadas, body.allergens || "none", kaloria, recipeId, userId]
            ).then(() => { conn.end(); });
          });
      })
      .catch(err => { conn.end(); throw err; })
    )
    .then(() => res.json({ success: true }))
    .catch(err => {
      if (err.status === 401) return res.status(401).json({ success: false, error: "login_required" });
      if (err.status === 403) return res.status(403).json({ success: false, error: "forbidden" });
      if (err.status === 404) return res.status(404).json({ success: false, error: "not_found" });
      console.error(err);
      res.status(500).json({ success: false, error: "server_error" });
    });
});

app.delete("/api/recipes/:id", function(req, res) {  
  const recipeId = parseInt(req.params.id, 10);
  if (isNaN(recipeId)) return res.status(400).json({ success: false, error: "invalid_id" });
  const userId = req.headers["x-auth-user"];
  const token = req.headers["x-auth-token"];
  if (!userId || !token) return res.status(401).json({ success: false, error: "login_required" });
  mysql.createConnection(dbConfig)
    .then(conn => conn.execute("SELECT * FROM felhasznalo WHERE idfelhasznalo = ?", [userId])
      .then(result => {
        const user = result[0][0];
        if (!user || createAuthToken(user) !== token) {
          conn.end();
          return Promise.reject({ status: 401 });
        }
        return conn.execute("DELETE FROM receptek WHERE idreceptek = ? AND felhasznalo_id = ?", [recipeId, userId])
          .then(r => {
            conn.end();
            return r[0].affectedRows > 0 ? Promise.resolve() : Promise.reject({ status: 404 });
          });
      })
      .catch(err => { conn.end(); throw err; })
    )
    .then(() => res.json({ success: true }))
    .catch(err => {
      if (err.status === 401) return res.status(401).json({ success: false, error: "login_required" });
      if (err.status === 404) return res.status(404).json({ success: false, error: "not_found" });
      res.status(500).json({ success: false, error: "server_error" });
    });
});

app.post("/api/register", function(req, res) {   
  const username = req.body.username;
  const email = req.body.email;
  const password = req.body.password;
  if (!username || !email || !password) return res.status(400).json({ success: false, error: "missing_fields" });
  if (password.length < 4) return res.status(400).json({ success: false, error: "weak_password" });
  let profilKep = req.body.profilKep || null;
  if (profilKep && profilKep.length > 500000) profilKep = null;
  mysql.createConnection(dbConfig)
    .then(conn => {
      const hashed = hashPassword(password);
      return conn.execute(
        "INSERT INTO felhasznalo (felhasznalonev, email, jelszo_hash, profil_kep, kedvelt_receptek) VALUES (?, ?, ?, ?, ?)",
        [username, email, hashed, profilKep, JSON.stringify([])]
      ).then(() => { conn.end(); res.json({ success: true }); })
        .catch(err => {
          conn.end();
          if (err.code === "ER_DUP_ENTRY") {
            res.status(409).json({ success: false, error: "user_exists" });
          } else {
            res.status(500).json({ success: false, error: "server_error" });
          }
        });
    })
    .catch(() => res.status(500).json({ success: false, error: "server_error" }));
});

app.post("/api/login", function(req, res) {  
  const username = req.body.username;
  const password = req.body.password;
  if (!username || !password) return res.status(400).json({ success: false, error: "missing_fields" });
  mysql.createConnection(dbConfig)
    .then(conn => conn.execute("SELECT * FROM felhasznalo WHERE felhasznalonev = ?", [username])
      .then(result => {
        conn.end();
        const user = result[0][0];
        if (!user) return res.status(401).json({ success: false, error: "invalid_credentials" });
        if (!checkPassword(password, user.jelszo_hash)) return res.status(401).json({ success: false, error: "invalid_credentials" });
        res.json({ success: true, user: toClientUserPayload(user) });
      })
      .catch(() => { conn.end(); res.status(500).json({ success: false, error: "server_error" }); })
    )
    .catch(() => res.status(500).json({ success: false, error: "server_error" }));
});

app.post("/api/user/favorites", function(req, res) {
  const userId = req.headers["x-auth-user"];
  const token = req.headers["x-auth-token"];
  const favoriteRecipes = req.body.favoriteRecipes || [];
  if (!userId || !token) return res.status(401).json({ success: false, error: "login_required" });
  mysql.createConnection(dbConfig)
    .then(conn => conn.execute("SELECT * FROM felhasznalo WHERE idfelhasznalo = ?", [userId])
      .then(result => {
        const user = result[0][0];
        if (!user || createAuthToken(user) !== token) {
          conn.end();
          return Promise.reject({ status: 401 });
        }
        return conn.execute(
          "UPDATE felhasznalo SET kedvelt_receptek = ? WHERE idfelhasznalo = ?",
          [JSON.stringify(favoriteRecipes), userId]
        ).then(() => { conn.end(); res.json({ success: true }); });
      })
      .catch(err => { conn.end(); throw err; })
    )
    .catch(err => {
      if (err.status === 401) return res.status(401).json({ success: false, error: "login_required" });
      res.status(500).json({ success: false, error: "server_error" });
    });
});


function getAdminConnection(req, res) {
  const userId = req.headers["x-auth-user"];
  const token = req.headers["x-auth-token"];
  if (!userId || !token) {
    res.status(401).json({ success: false, error: "missing_auth" });
    return Promise.resolve(null);
  }
  return mysql.createConnection(dbConfig)
    .then(conn => conn.execute("SELECT * FROM felhasznalo WHERE idfelhasznalo = ?", [userId])
      .then(result => {
        const adminUser = result[0][0];
        if (!adminUser) {
          res.status(401).json({ success: false, error: "invalid_user" });
          conn.end();
          return null;
        }
        if (createAuthToken(adminUser) !== token) {
          res.status(403).json({ success: false, error: "invalid_token" });
          conn.end();
          return null;
        }
        if (adminUser.szerepkor !== "admin") {
          res.status(403).json({ success: false, error: "not_authorized" });
          conn.end();
          return null;
        }
        return { conn, adminUser };
      })
      .catch(err => { conn.end(); throw err; })
    );
}


app.get("/api/admin/users", (req, res) => {
  getAdminConnection(req, res)
    .then(ctx => {
      if (!ctx) return;
      const conn = ctx.conn;
      conn.execute("SELECT idfelhasznalo AS id, felhasznalonev AS username, email, szerepkor AS role, allapot, letrehozva FROM felhasznalo ORDER BY idfelhasznalo")
        .then(result => {
          conn.end();
          res.json({ success: true, users: result[0] });
        })
        .catch(err => { conn.end(); res.status(500).json({ success: false, error: "server_error" }); });
    })
    .catch(() => { if (!res.headersSent) res.status(500).json({ success: false, error: "server_error" }); });
});

app.get("/api/admin/recipes", function(req, res) {   
  getAdminConnection(req, res)
    .then(ctx => {
      if (!ctx) return;
      const conn = ctx.conn;
      conn.execute(
        "SELECT r.idreceptek, r.meal, r.kulonlegesseg, r.unnepi_etelek, r.recept_hozzaadas, r.felhasznalo_id, u.felhasznalonev AS author " +
        "FROM receptek r LEFT JOIN felhasznalo u ON r.felhasznalo_id = u.idfelhasznalo " +
        "ORDER BY r.idreceptek DESC"
      )
        .then(result => {
          conn.end();
          res.json({ success: true, recipes: result[0] });
        })
        .catch(err => { conn.end(); res.status(500).json({ success: false, error: "server_error" }); });
    })
    .catch(() => { if (!res.headersSent) res.status(500).json({ success: false, error: "server_error" }); });
});

app.delete("/api/admin/users/:id", function(req, res) {   
  const userId = parseInt(req.params.id, 10);
  if (isNaN(userId)) return res.status(400).json({ success: false, error: "invalid_id" });
  getAdminConnection(req, res)
    .then(ctx => {
      if (!ctx) return;
      const conn = ctx.conn;
      const adminId = ctx.adminUser.idfelhasznalo;
      if (userId === adminId) {
        conn.end();
        return res.status(403).json({ success: false, error: "cannot_delete_self" });
      }
      conn.execute("DELETE FROM receptek WHERE felhasznalo_id = ?", [userId])
        .then(() => conn.execute("DELETE FROM felhasznalo WHERE idfelhasznalo = ?", [userId]))
        .then(result => {
          conn.end();
          if (result[0].affectedRows === 0) return res.status(404).json({ success: false, error: "user_not_found" });
          res.json({ success: true });
        })
        .catch(() => { conn.end(); res.status(500).json({ success: false, error: "server_error" }); });
    })
    .catch(() => { if (!res.headersSent) res.status(500).json({ success: false, error: "server_error" }); });
});

app.delete("/api/admin/recipes/:id", function(req, res) {   
  var recipeId = parseInt(req.params.id, 10); 
  if (isNaN(recipeId)) {
    return res.status(400).json({ success: false, error: "invalid_id" });
  }
  getAdminConnection(req, res)   
    .then(function(ctx) {
      if (!ctx) return;   
      var conn = ctx.conn;
      conn.execute(RECIPES_TABLE_SQL) 
        .then(function() {
          return conn.execute("DELETE FROM `receptek` WHERE `idreceptek` = ?", [recipeId]);  
        })
        .then(function(result) {
          conn.end();
          if (result[0].affectedRows === 0) {
            return res.status(404).json({ success: false, error: "recipe_not_found" });
          }
          res.json({ success: true });
        })
        .catch(function(err) {
          conn.end();
          console.error(err);
          res.status(500).json({ success: false, error: "server_error" });
        });
    })
    .catch(function(err) {
      if (!res.headersSent) res.status(500).json({ success: false, error: "server_error" });
    });
});

var oldalak = [   
  ["/", "index.html"],
  ["/index.html", "index.html"],
  ["/bejelentkezes.html", "bejelentkezes.html"],
  ["/regisztracio.html", "regisztracio.html"],
  ["/konyham.html", "konyham.html"],
  ["/receptjeim.html", "receptjeim.html"],
  ["/elerhetoseg.html", "elerhetoseg.html"],
  ["/admin.html", "admin.html"]
];
oldalak.forEach(function(route) {  
  app.get(route[0], function(req, res) {
    res.sendFile(path.join(__dirname, "public", "html", route[1]));
  });
});

app.use(function(req, res) {   
  res.sendFile(path.join(__dirname, "public", "html", "index.html"));  
});

function initializeDatabase() {
  return mysql.createConnection(dbConfig)
    .then(function(conn) {

      return conn.execute(USER_TABLE_SQL)
        .then(function() { return conn.execute(RECIPES_TABLE_SQL); })
        .then(function() { return ensureRecipesUserColumn(conn); })
        .then(function() { return ensureRecipesKaloriaColumn(conn); })
        .then(function() { return ensureUserProfilKepColumn(conn); })
        .then(function() { return ensureUserProfilKepMediumText(conn); })
        .then(function() { return ensureUserKedveltReceptekColumn(conn); })
        .then(function() {

          var sqlFilePath = path.join(__dirname, "adatbazis", "mitfozzekma_receptek.sql");
          try {
            var sqlContent = fs.readFileSync(sqlFilePath, "utf8");
      
            return conn.execute("SELECT COUNT(*) as cnt FROM receptek")
              .then(function(result) {
                var count = result[0][0].cnt || 0;
                
                if (count === 0) {
                  console.log("Receptek betöltése az SQL fájlból...");
                  
                  var deleteMatch = sqlContent.match(/DELETE FROM `receptek`[;]?/);
                  var insertMatches = sqlContent.match(/INSERT INTO `receptek`[^;]*VALUES[^;]*(?:,[^;]*)*[;]/gs);
                  
                  if (insertMatches && insertMatches.length > 0) {
                    var promises = [];
                    for (var i = 0; i < insertMatches.length; i++) {
                      var insertCmd = insertMatches[i].trim();
                      if (insertCmd.endsWith(';')) {
                        insertCmd = insertCmd.slice(0, -1);
                      }
                      promises.push(
                        conn.execute(insertCmd).catch(function(err) {
                          console.log("SQL betöltési figyelmeztetés (ez normális):", err.message.substring(0, 80));
                          return null;
                        })
                      );
                    }
                    return Promise.all(promises);
                  } else {
                    console.log("Nem találhatók receptek az SQL fájlban");
                    return null;
                  }
                } else {
                  console.log("Receptek már betöltve (" + count + " db)");
                  return null;
                }
              });
          } catch (e) {
            console.log(" SQL fájl betöltési hiba:", e.message);
            return null;
          }
        })
        .then(function() {
          conn.end();
          console.log("Sikeres csatlakozás az adatbázishoz.");
        })
        .catch(function(err) {
          conn.end();
          console.error("Adatbázis hiba:", err.message);
        });
    })
    .catch(function(err) {
      console.error("Nem sikerült kapcsolódni az adatbázishoz:", err.message);
    });
}

initializeDatabase().then(function() {
  app.listen(PORT, function() {
    console.log("Szerver fut: http://localhost:" + PORT);
  });
}).catch(function(err) {
  console.error("Szerver nem indul:", err.message);
  process.exit(1);
});
