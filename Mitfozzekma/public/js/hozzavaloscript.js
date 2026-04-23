// ===============================
// 0) RECEPTEK - legyen globálisan elérhető
// ===============================
var RECIPTEK = window.RECIPTEK || [];

// receptek betöltése az API-ból
fetch('/api/recipes')
  .then(function(response) {
    if (!response.ok) throw new Error('hiba');
    return response.json();
  })
  .then(function(recipes) {
    RECIPTEK = recipes;
    if (typeof renderRecipes === 'function') {
      // ha van kiválasztott hozzávaló, akkor szűrjük
      if (selected.size > 0) {
        renderRecipes("contains");
      } else {
        renderRecipes("all");
      }
    }
  })
  .catch(function(error) {
    console.error('hiba:', error);
    // fallback - ha nincs API, akkor üres tömb
    RECIPTEK = [];
  });
  
// ===============================
// 1) KATEGÓRIÁK + HOZZÁVALÓK
// ===============================
const FOOD = {
  "Zöldségek": [
    "paradicsom", "uborka", "paprika", "vöröshagyma", "fokhagyma",
    "sárgarépa", "zeller", "cékla", "retek", "burgonya", "édesburgonya", "újburgonya",
    "cukkini", "padlizsán", "brokkoli", "karfiol", "káposzta", "saláta",
    "rukkola", "spenót", "zöldbab", "borsó", "kukorica", "gomba", "sütőtök",
    "olajbogyó", "csicseriborsó", "lencse", "bab"
  ],
  "Gyümölcsök": [
    "alma", "banán", "narancs", "citrom", "körte", "szőlő",
    "eper", "málna", "áfonya", "barack", "ananász", "mangó", "gránátalma", "avokádó",
    "meggy", "blueberry", "kék áfonya", "vörös áfonya", "gránátalmamag"
  ],
  "Húsok": [
    "csirkemell", "csirkecomb", "pulykamell", "marhahús", "sertéshús",
    "darált hús", "sonka", "szalonna", "kolbász", "csirkehús", "pulykahús"
  ],
  "Halak": ["lazac", "tonhal", "tőkehal", "harcsa", "garnéla", "hal"],
  "Tejtermékek": [
    "tej", "vaj", "tejszín", "tejföl", "joghurt", "görög joghurt", "túró", 
    "sajt", "mozzarella", "feta", "szendvicssajt", "cheddar sajt", "gouda sajt"
  ],
  "Alap": [
    "tojás", "kenyér", "kifli", "tortilla", "zabpehely", "liszt", "rizs", 
    "tészta", "spagetti", "bulgur", "quinoa", "zsemlemorzsa", "kenyérkocka",
    "müzli", "granola", "mazsola"
  ],
  "Olaj / Szósz": [
    "olívaolaj", "napraforgóolaj", "kókuszolaj", "olaj", "ecet", "balzsamecet", 
    "mustár", "majonéz", "szójaszósz", "ketchup", "paradicsompüré", "tahini",
    "humusz", "tzatziki"
  ],
  "Fűszerek": [
    "só", "bors", "pirospaprika", "oregánó", "bazsalikom", "rozmaring", 
    "kakukkfű", "fahéj", "kömény", "chili", "kumin", "paprika", "szerecsendió",
    "petrezselyem", "koriander", "vanília", "vörös paprika"
  ],
  "Édesítők": [
    "méz", "cukor", "virágméz", "folyékony méz"
  ],
  "Magvak / Diófélék": [
    "mandula", "dió", "mogyoró", "kesudió", "napraforgómag", "tökmag",
    "mandulaosvaj", "mogyoróvaj", "kakaó nibs"
  ],
  "Italok": [
    "kávé", "eszpresszó", "tej", "mandulatej", "víz", "vörösbor", 
    "húsleves", "zöldségleves", "csirkealaplé", "marhaalaplé", "zöldségleves"
  ],
  "Egyéb": [
    "sütőpor", "protein por", "sportbár", "keksz", "étcsokoládé", "krém",
    "spirulina", "zellerzöld"
  ]
};

// ===============================
// 2) ELEMEK (HTML ID-k alapján!)
// ===============================
var ingredientGroups = document.getElementById("ingredientGroups");
var ingredientSearch = document.getElementById("ingredientSearch");
var clearAllBtn = document.getElementById("clearAll");

var hozzavaloLista = document.getElementById("hozzavaloLista");

var btnMutatMind = document.getElementById("btnMutatMind");
var btnMutatCsakKesz = document.getElementById("btnMutatCsakKesz");
var receptEredmeny = document.getElementById("receptEredmeny");

// ===============================
// 3) STATE + STORAGE
// ===============================
var STORAGE_KEY = "mitfozzek_hozzavalok";
var selected = new Set();

function loadSelected() {
  try {
    selected = new Set(JSON.parse(localStorage.getItem(STORAGE_KEY) || "[]"));
  } catch {
    selected = new Set();
  }
}
function saveSelected() {
  localStorage.setItem(STORAGE_KEY, JSON.stringify([...selected]));
}

// ===============================
// 4) SEGÉD
// ===============================
function norm(s) {
  return (s || "").toString().toLowerCase().trim();
}

// A recept összetevő sokszor ilyen: "50g zabpehely", "1 teáskanál méz"
// Itt az a lényeg: benne van-e valamelyik kiválasztott alapanyag szóként/részszóként
function ingredientIsCovered(ingredientStr) {
  if (!ingredientStr) return false;
  var ing = " " + norm(ingredientStr) + " ";
  var selectedArray = Array.from(selected);
  for (var i = 0; i < selectedArray.length; i++) {
    var sel = selectedArray[i];
    var s = norm(sel);
    if (!s) continue;
    if (ing.indexOf(" " + s + " ") !== -1 || ing.indexOf(s) !== -1) {
      return true;
    }
  }
  return false;
}

// ellenőrzi, hogy a recept tartalmazza-e a kiválasztott hozzávalók közül legalább egyet
function recipeContainsSelected(recipe) {
  if (!recipe || !Array.isArray(recipe.ingredients) || recipe.ingredients.length === 0) {
    return false;
  }
  if (selected.size === 0) {
    return true; // ha nincs kiválasztott, akkor minden recept megfelel
  }
  // legalább egy hozzávaló legyen lefedve
  for (var i = 0; i < recipe.ingredients.length; i++) {
    if (ingredientIsCovered(recipe.ingredients[i])) {
      return true;
    }
  }
  return false;
}

function recipeCookable(recipe) {
  // ha nincs hozzávaló lista, tekintsük nem elkészíthetőnek
  if (!recipe || !Array.isArray(recipe.ingredients) || recipe.ingredients.length === 0) {
    return false;
  }

  // ha nincs kiválasztott hozzávaló, akkor egyik sem elkészíthető
  if (selected.size === 0) {
    return false;
  }

  // SZIGORÚ: minden hozzávaló legyen lefedve
  for (var i = 0; i < recipe.ingredients.length; i++) {
    if (!ingredientIsCovered(recipe.ingredients[i])) {
      return false;
    }
  }
  return true;
}

// ===============================
// 5) UI: kiválasztott hozzávalók lista (jobb oldal)
// ===============================
function renderSelectedList() {
  if (!hozzavaloLista) return;

  hozzavaloLista.innerHTML = "";
  const arr = [...selected].sort((a, b) => a.localeCompare(b, "hu"));

  if (arr.length === 0) {
    const li = document.createElement("li");
    li.className = "list-group-item text-muted";
    li.textContent = "Még nincs kiválasztott hozzávaló.";
    hozzavaloLista.appendChild(li);
    return;
  }

  arr.forEach((item) => {
    const li = document.createElement("li");
    li.className = "list-group-item d-flex justify-content-between align-items-center";

    const span = document.createElement("span");
    span.textContent = item;

    const btn = document.createElement("button");
    btn.type = "button";
    btn.className = "btn btn-sm btn-outline-danger";
    btn.textContent = "Törlés";
    btn.addEventListener("click", function() {
      selected.delete(item);
      saveSelected();

      var cb = document.querySelector('input[type="checkbox"][data-food="' + CSS.escape(item) + '"]');
      if (cb) cb.checked = false;

      renderSelectedList();
      // ha van kiválasztott hozzávaló, akkor szűrjük
      if (selected.size > 0 && currentFilterMode !== "cookable") {
        renderRecipes("contains");
      } else if (selected.size === 0) {
        renderRecipes("all");
      } else {
        renderRecipes(currentFilterMode);
      }
    });

    li.appendChild(span);
    li.appendChild(btn);
    hozzavaloLista.appendChild(li);
  });
}

// ===============================
// 6) UI: Kategóriák (mindig láthatók, nincs lenyíló)
// ===============================
function createAccordionItem(catName, items, idx) {
  const item = document.createElement("div");
  item.className = "ingredient-category-block";

  const header = document.createElement("div");
  header.className = "ingredient-category-header";
  header.textContent = catName;

  const body = document.createElement("div");
  body.className = "ingredient-category-body";

  const grid = document.createElement("div");
  grid.className = "row g-2";

  items
    .slice()
    .sort((a, b) => a.localeCompare(b, "hu"))
    .forEach((food) => {
      const safeId = `cb_${idx}_${food}`.replace(/[^\w]+/g, "_");

      const col = document.createElement("div");
      col.className = "col-12 col-md-6 col-lg-4";

      const wrap = document.createElement("div");
      wrap.className = "ingredient-checkbox-wrap";

      const cb = document.createElement("input");
      cb.type = "checkbox";
      cb.className = "form-check-input m-0";
      cb.id = safeId;
      cb.dataset.food = food;
      cb.checked = selected.has(food);

      const label = document.createElement("label");
      label.className = "m-0 flex-grow-1";
      label.setAttribute("for", safeId);
      label.textContent = food;

      cb.addEventListener("change", function() {
        if (cb.checked) selected.add(food);
        else selected.delete(food);

        saveSelected();
        renderSelectedList();
        if (selected.size > 0 && currentFilterMode !== "cookable") {
          renderRecipes("contains");
        } else if (selected.size === 0) {
          renderRecipes("all");
        } else {
          renderRecipes(currentFilterMode);
        }
      });

      wrap.appendChild(cb);
      wrap.appendChild(label);

      col.appendChild(wrap);
      grid.appendChild(col);
    });

  body.appendChild(grid);
  item.appendChild(header);
  item.appendChild(body);

  return item;
}

function renderCategories(filterText = "") {
  if (!ingredientGroups) return;

  ingredientGroups.innerHTML = "";
  const f = norm(filterText);

  let idx = 0;
  Object.entries(FOOD).forEach(([cat, items]) => {
    const filtered = items.filter((x) => norm(x).includes(f));
    if (filtered.length === 0) return;

    ingredientGroups.appendChild(createAccordionItem(cat, filtered, idx));
    idx++;
  });
}

// ===============================
// 7) UI: Recept render
// ===============================
var currentFilterMode = "all"; // "all" = összes, "contains" = tartalmazza, "cookable" = csak elkészíthető

function renderRecipes(filterMode) {
  if (!receptEredmeny) return;
  
  currentFilterMode = filterMode || "all";
  receptEredmeny.innerHTML = "";

  if (!Array.isArray(RECIPTEK) || RECIPTEK.length === 0) {
    receptEredmeny.innerHTML = `<div class="col-12"><div class="alert alert-warning mb-0">
      <strong>Nincs betöltve recept lista.</strong> Várj egy kicsit, amíg betöltődnek a receptek az adatbázisból.
    </div></div>`;
    updateStats(0, 0, 0);
    return;
  }

  // szűrés
  var list = [];
  if (filterMode === "cookable") {
    // csak azokat, ahol MINDEN hozzávaló megvan
    for (var idx = 0; idx < RECIPTEK.length; idx++) {
      if (recipeCookable(RECIPTEK[idx])) {
        list.push(RECIPTEK[idx]);
      }
    }
  } else if (filterMode === "contains" || (filterMode === "all" && selected.size > 0)) {
    // tartalmazza a kiválasztott hozzávalókat (legalább egy)
    for (var idx = 0; idx < RECIPTEK.length; idx++) {
      if (recipeContainsSelected(RECIPTEK[idx])) {
        list.push(RECIPTEK[idx]);
      }
    }
  } else {
    // összes recept
    list = RECIPTEK;
  }
  
  // elkészíthető receptek száma
  var cookableCount = 0;
  for (var idx2 = 0; idx2 < RECIPTEK.length; idx2++) {
    if (recipeCookable(RECIPTEK[idx2])) {
      cookableCount++;
    }
  }
  
  // tartalmazza a kiválasztott hozzávalókat
  var containsCount = 0;
  if (selected.size > 0) {
    for (var idx3 = 0; idx3 < RECIPTEK.length; idx3++) {
      if (recipeContainsSelected(RECIPTEK[idx3])) {
        containsCount++;
      }
    }
  }

  // Rendezés: legkevesebb hiányzó hozzávaló kerüljön legfelülre
  list.sort(function(a, b) {
    var missingA = 0, missingB = 0;
    if (a.ingredients) {
      for (var m = 0; m < a.ingredients.length; m++) {
        if (!ingredientIsCovered(a.ingredients[m])) missingA++;
      }
    }
    if (b.ingredients) {
      for (var n = 0; n < b.ingredients.length; n++) {
        if (!ingredientIsCovered(b.ingredients[n])) missingB++;
      }
    }
    return missingA - missingB;
  });

  updateStats(list.length, cookableCount, containsCount);

  if (list.length === 0) {
    var msg = onlyCookable 
      ? "Nincs olyan recept, amit a kiválasztott hozzávalókkal elkészíthetsz. Próbálj több hozzávalót kiválasztani!"
      : "Nincs találat.";
    receptEredmeny.innerHTML = `<div class="col-12"><div class="alert alert-info mb-0">
      ${msg}
    </div></div>`;
    return;
  }

  for (var i = 0; i < list.length; i++) {
    var r = list[i];
    var col = document.createElement("div");
    col.className = "col-12 col-md-6 col-lg-4";

    var cookable = recipeCookable(r);
    var missingCount = 0;
    if (!cookable && r.ingredients) {
      for (var j = 0; j < r.ingredients.length; j++) {
        if (!ingredientIsCovered(r.ingredients[j])) {
          missingCount++;
        }
      }
    }

    var imgHtml = r.image 
      ? `<img src="${r.image}" class="card-img-top" alt="${r.title || "Recept"}" style="height: 200px; object-fit: cover;">`
      : `<div class="card-img-top bg-light d-flex align-items-center justify-content-center" style="height: 200px;">
           <span class="text-muted">📷 Nincs kép</span>
         </div>`;

    var mealBadge = r.meal ? `<span class="badge bg-info me-1">${r.meal}</span>` : "";
    var timeBadge = r.time ? `<span class="badge bg-secondary me-1">⏱️ ${r.time} perc</span>` : "";
    var calBadge = (r.kaloria || r.calories) ? `<span class="badge bg-warning text-dark me-1">🔥 ${r.kaloria || r.calories} kcal</span>` : "";

    col.innerHTML = `
      <div class="card recipe-card h-100 shadow-sm">
        ${imgHtml}
        <div class="card-body d-flex flex-column">
          <div class="d-flex justify-content-between align-items-start gap-2 mb-2">
            <h5 class="card-title mb-0 flex-grow-1">${r.title || "Névtelen recept"}</h5>
            <span class="badge ${cookable ? "bg-success" : "bg-warning"} badge-cookable">
              ${cookable ? "✅ Elkészíthető" : "⚠️ Hiányzik " + missingCount}
            </span>
          </div>
          <div class="mb-2">
            ${mealBadge}
            ${timeBadge}
            ${calBadge}
          </div>
          <div class="small flex-grow-1">
            <strong>Hozzávalók (${(r.ingredients || []).length}):</strong>
            <ul class="mb-0 mt-1" style="max-height: 120px; overflow-y: auto;">
              ${(function() {
                var ingredients = (r.ingredients || []).slice(0, 8);
                var html = "";
                for (var idx = 0; idx < ingredients.length; idx++) {
                  var x = ingredients[idx];
                  var covered = ingredientIsCovered(x);
                  html += '<li class="' + (covered ? "text-success" : "text-muted") + '">' + (covered ? "✓" : "✗") + " " + x + "</li>";
                }
                return html;
              })()}
              ${(r.ingredients || []).length > 8 ? '<li class="text-muted small">... és még ' + ((r.ingredients || []).length - 8) + ' hozzávaló</li>' : ""}
            </ul>
          </div>
          <div class="mt-3">
            <button class="btn btn-sm w-100 view-recipe-btn" data-recipe-index="${i}">
              Megnézem
            </button>
          </div>
        </div>
      </div>
    `;

    receptEredmeny.appendChild(col);
    
    // Event listener hozzáadása a "Megnézem" gombhoz (IIFE a closure bug elkerülésére)
    var viewBtn = col.querySelector('.view-recipe-btn');
    if (viewBtn) {
      viewBtn.addEventListener('click', (function(rec) {
        return function() {
          openRecipeModal(rec);
        };
      })(r));
    }
  }
}

function updateStats(total, cookable, contains) {
  var statsContainer = document.getElementById("statsContainer");
  var statsCount = document.getElementById("statsCount");
  var statsText = document.getElementById("statsText");
  
  if (statsContainer && statsCount && statsText) {
    if (currentFilterMode === "cookable") {
      statsCount.textContent = cookable;
      statsText.textContent = cookable === 1 ? "elkészíthető recept" : "elkészíthető recept";
    } else if (currentFilterMode === "contains" || (currentFilterMode === "all" && selected.size > 0)) {
      statsCount.textContent = total;
      statsText.textContent = total === 1 ? "recept tartalmazza a kiválasztott hozzávalókat" : "recept tartalmazza a kiválasztott hozzávalókat";
    } else {
      statsCount.textContent = total;
      statsText.textContent = total === 1 ? "recept összesen" : "recept összesen";
      if (cookable > 0) {
        statsText.textContent += " (" + cookable + " elkészíthető)";
      }
    }
    statsContainer.style.display = "block";
  }
}

// ===============================
// 8) INIT + ESEMÉNYEK
// ===============================
document.addEventListener("DOMContentLoaded", function() {
  // ha bármelyik fő elem hiányzik, azt logoljuk
  var must = [
    ["ingredientGroups", ingredientGroups],
    ["ingredientSearch", ingredientSearch],
    ["clearAll", clearAllBtn],
    ["btnMutatMind", btnMutatMind],
    ["btnMutatCsakKesz", btnMutatCsakKesz],
    ["receptEredmeny", receptEredmeny],
    ["hozzavaloLista", hozzavaloLista],
  ];
  var missing = [];
  for (var m = 0; m < must.length; m++) {
    if (!must[m][1]) {
      missing.push(must[m][0]);
    }
  }
  if (missing.length) {
    console.error("Hiányzó elemek (ID):", missing);
  }

  loadSelected();
  renderCategories("");
  renderSelectedList();
  // ha van kiválasztott hozzávaló, akkor alapértelmezetten szűrjük
  if (selected.size > 0) {
    renderRecipes("contains");
  } else {
    renderRecipes("all");
  }

  if (ingredientSearch) {
    ingredientSearch.addEventListener("input", function(e) {
      renderCategories(e.target.value);
    });
  }

  if (clearAllBtn) {
    clearAllBtn.addEventListener("click", function() {
      selected = new Set();
      saveSelected();

      var checkboxes = document.querySelectorAll('input[type="checkbox"][data-food]');
      for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = false;
      }
      renderSelectedList();
      // ha van kiválasztott hozzávaló, akkor szűrjük
      if (selected.size > 0 && currentFilterMode !== "cookable") {
        renderRecipes("contains");
      } else {
        renderRecipes(currentFilterMode);
      }
    });
  }

  if (btnMutatMind) {
    btnMutatMind.addEventListener("click", function() {
      renderRecipes("all");
      btnMutatMind.classList.add("active");
      if (btnMutatCsakKesz) btnMutatCsakKesz.classList.remove("active");
    });
  }

  if (btnMutatCsakKesz) {
    btnMutatCsakKesz.addEventListener("click", function() {
      console.log("Csak elkészíthető gomb kattintva");
      console.log("Kiválasztott hozzávalók:", Array.from(selected));
      console.log("Receptek száma:", RECIPTEK.length);
      renderRecipes("cookable");
      btnMutatCsakKesz.classList.add("active");
      if (btnMutatMind) btnMutatMind.classList.remove("active");
    });
  }
  
  // aktív gomb jelzése - ha van kiválasztott hozzávaló, akkor "contains" mód
  if (selected.size > 0) {
    if (btnMutatCsakKesz) btnMutatCsakKesz.classList.add("active");
  } else {
    if (btnMutatMind) btnMutatMind.classList.add("active");
  }
  
  // sötét mód váltó
  var themeToggle = document.getElementById('themeToggle');
  if (themeToggle) {
    var savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
      document.body.classList.add('dark-mode');
      themeToggle.setAttribute('aria-pressed', true);
      themeToggle.textContent = '☀️';
    }
    themeToggle.addEventListener('click', function() {
      document.body.classList.toggle('dark-mode');
      var isDarkMode = document.body.classList.contains('dark-mode');
      localStorage.setItem('theme', isDarkMode ? 'dark' : 'light');
      themeToggle.setAttribute('aria-pressed', isDarkMode);
      themeToggle.textContent = isDarkMode ? '☀️' : '🌙';
    });
  }
});

// Normalizálja a listát (tömb vagy string)
function normalizeList(value) {
  if (!value) return [];
  if (Array.isArray(value)) return value;
  var parts = String(value).split(/\n|\r|,|;/);
  var result = [];
  for (var i = 0; i < parts.length; i++) {
    var trimmed = parts[i].trim();
    if (trimmed.length > 0) result.push(trimmed);
  }
  return result;
}

// Függvény, ami arányosan módosítja a hozzávalók mennyiségét
function adjustIngredientsForServes(ingredients, serves, baseServes) {
  if (!ingredients || ingredients.length === 0) return ingredients;
  if (!serves || serves <= 0) serves = baseServes || 4;
  if (!baseServes || baseServes <= 0) baseServes = 4;
  
  var ratio = serves / baseServes;
  var adjusted = [];
  
  for (var i = 0; i < ingredients.length; i++) {
    var ing = ingredients[i];
    // Regex, ami kinyeri a számot a hozzávaló elejéről (pl. "2 db tojás" -> 2)
    var match = ing.match(/^(\d+(?:[.,]\d+)?)\s*(.*)$/);
    
    if (match) {
      var originalAmount = parseFloat(match[1].replace(',', '.'));
      var rest = match[2];
      var newAmount = originalAmount * ratio;
      
      // Kerekítjük 2 tizedesjegyre, de ha egész szám, akkor nem mutatjuk a tizedesjegyet
      if (newAmount % 1 === 0) {
        adjusted.push(Math.round(newAmount) + ' ' + rest);
      } else {
        adjusted.push(newAmount.toFixed(2).replace(/\.?0+$/, '') + ' ' + rest);
      }
    } else {
      // Ha nincs szám az elején, akkor változatlanul hagyjuk
      adjusted.push(ing);
    }
  }
  
  return adjusted;
}

// Recept modal megnyitása
function openRecipeModal(recipe) {
  var modalEl = document.getElementById("recipeModal");
  if (!modalEl) return;
  var titleEl = document.getElementById("recipeModalTitle");
  var imgEl = document.getElementById("recipeModalImg");
  var ingEl = document.getElementById("recipeModalIngredients");
  var stepsEl = document.getElementById("recipeModalSteps");
  var servesInput = document.getElementById("servesInput");
  
  // Tároljuk az eredeti receptet és hozzávalókat
  var originalIngredients = normalizeList(recipe.ingredients);
  var baseServes = 4; // Alapértelmezett főszám
  
  if (titleEl) titleEl.textContent = recipe.title || "Recept";
  var metaEl = document.getElementById("recipeModalMeta");
  var baseKaloria = parseFloat(recipe.kaloria || recipe.calories) || 0;
  function updateMeta() {
    if (!metaEl) return;
    var parts = [];
    if (recipe.time) parts.push("⏱️ " + recipe.time + " min");
    if (baseKaloria > 0) {
      var currentServes = servesInput ? parseInt(servesInput.value, 10) || baseServes : baseServes;
      var scaledKaloria = Math.round(baseKaloria * (currentServes / baseServes));
      parts.push("🔥 " + scaledKaloria + " kcal");
    }
    metaEl.textContent = parts.join(" • ");
    metaEl.style.display = parts.length ? "block" : "none";
  }
  updateMeta();
  if (recipe.image && imgEl) {
    imgEl.src = recipe.image;
    imgEl.alt = recipe.title || "Recept kép";
    imgEl.classList.remove("d-none");
  } else if (imgEl) {
    imgEl.classList.add("d-none");
  }
  
  // Függvény, ami frissíti a hozzávalók megjelenítését és a kalóriát
  function updateIngredients() {
    updateMeta();
    if (!ingEl) return;
    ingEl.innerHTML = "";
    
    if (originalIngredients.length === 0) {
      ingEl.innerHTML = '<li class="list-group-item text-muted">Nincs megadva hozzávaló.</li>';
      return;
    }
    
    var currentServes = servesInput ? parseInt(servesInput.value) || baseServes : baseServes;
    var adjustedIngredients = adjustIngredientsForServes(originalIngredients, currentServes, baseServes);
    
    for (var i = 0; i < adjustedIngredients.length; i++) {
      var li = document.createElement("li");
      li.className = "list-group-item";
      li.textContent = adjustedIngredients[i];
      ingEl.appendChild(li);
    }
  }
  
  // Kezdeti megjelenítés
  updateIngredients();
  
  // Event listener a főszám változásához (először eltávolítjuk a régi listener-eket, ha vannak)
  if (servesInput) {
    // Klónozzuk az input mezőt, hogy eltávolítsuk az összes event listener-t
    var newServesInput = servesInput.cloneNode(true);
    servesInput.parentNode.replaceChild(newServesInput, servesInput);
    servesInput = newServesInput;
    
    servesInput.addEventListener('input', updateIngredients);
    servesInput.addEventListener('change', updateIngredients);
  }
  
  if (stepsEl) {
    stepsEl.innerHTML = "";
    // Ha a részletes formátumot tartalmazza (LÉPÉS szóval), egyetlen stringként kezeljük
    var steps;
    if (Array.isArray(recipe.steps) && recipe.steps.length === 1 && 
        typeof recipe.steps[0] === 'string' && 
        recipe.steps[0].includes('LÉPÉS') && recipe.steps[0].includes('\n')) {
      steps = recipe.steps; // Egyetlen stringként hagyjuk
    } else {
      steps = normalizeList(recipe.steps);
    }
    
    if (steps.length === 0) {
      stepsEl.innerHTML = '<li class="list-group-item text-muted">Nincs megadva elkészítés.</li>';
    } else {
      // Ha a lépések egyetlen hosszú szövegben vannak (részletes formátum), formázzuk szépen
      if (steps.length === 1 && typeof steps[0] === 'string' && steps[0].includes('\n')) {
        var detailedSteps = steps[0];
        // Szétbontjuk a \n karakterek mentén
        var stepLines = detailedSteps.split('\n');
        var stepNumber = 0;
        var currentStepContent = [];
        
        for (var k = 0; k < stepLines.length; k++) {
          var line = stepLines[k].trim();
          if (line.length === 0) continue;
          
          // Ha új lépés kezdődik (számmal vagy "LÉPÉS" szóval)
          if (line.match(/^\d+\.\s*LÉPÉS/i) || line.match(/^\d+\.\s*-/)) {
            // Ha volt előző lépés, mentsük el
            if (stepNumber > 0 && currentStepContent.length > 0) {
              var stepLi = document.createElement("li");
              stepLi.className = "list-group-item";
              stepLi.style.cssText = 'padding: 12px 16px; border-left: 4px solid #45d328;';
              // Eltávolítjuk a vezető sorszámot (pl. "1. " vagy "1. LÉPÉS - " rész)
              var titleText = currentStepContent[0].replace(/^\d+\.\s*LÉPÉS\s*-\s*/, '').replace(/^\d+\.\s*/, '');
              stepLi.innerHTML = '<strong>' + titleText + '</strong>' + 
                (currentStepContent.length > 1 ? '<br>' + currentStepContent.slice(1).join('<br>') : '');
              stepsEl.appendChild(stepLi);
            }
            // Új lépés kezdése
            stepNumber++;
            currentStepContent = [line];
          } else if (line.startsWith('-') || line.startsWith('•')) {
            // Alpontok
            currentStepContent.push('&nbsp;&nbsp;' + line);
          } else {
            // Normál szöveg
            if (currentStepContent.length === 0) {
              currentStepContent.push(line);
            } else {
              currentStepContent.push(line);
            }
          }
        }
        
        // Az utolsó lépés hozzáadása
        if (stepNumber > 0 && currentStepContent.length > 0) {
          var stepLi = document.createElement("li");
          stepLi.className = "list-group-item";
          stepLi.style.cssText = 'padding: 12px 16px; border-left: 4px solid #45d328;';
          // Eltávolítjuk a vezető sorszámot (pl. "1. " vagy "1. LÉPÉS - " rész)
          var titleText = currentStepContent[0].replace(/^\d+\.\s*LÉPÉS\s*-\s*/, '').replace(/^\d+\.\s*/, '');
          stepLi.innerHTML = '<strong>' + titleText + '</strong>' + 
            (currentStepContent.length > 1 ? '<br>' + currentStepContent.slice(1).join('<br>') : '');
          stepsEl.appendChild(stepLi);
        }
        
        // Ha nem találtunk formázott lépéseket, jelenítsük meg egyszerűen
        if (stepNumber === 0) {
          var stepLi = document.createElement("li");
          stepLi.className = "list-group-item";
          stepLi.style.cssText = 'padding: 12px 16px;';
          stepLi.innerHTML = detailedSteps.replace(/\n/g, '<br>');
          stepsEl.appendChild(stepLi);
        }
      } else {
        // Normál lépések megjelenítése számozással
        for (var j = 0; j < steps.length; j++) {
          var stepLi = document.createElement("li");
          stepLi.className = "list-group-item";
          stepLi.style.cssText = 'padding: 12px 16px; border-left: 4px solid #45d328;';
          // Ha tartalmaz \n karaktereket, formázzuk HTML-ben
          if (steps[j].includes('\n')) {
            stepLi.innerHTML = steps[j].replace(/\n/g, '<br>');
          } else {
            stepLi.textContent = steps[j];
          }
          stepsEl.appendChild(stepLi);
        }
      }
    }
  }
  
  var modal = new bootstrap.Modal(modalEl);
  modal.show();
}
