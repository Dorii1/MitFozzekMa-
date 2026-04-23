-- =============================================================================
-- MitFőzzekMa – Adatbázis (felhasználók, etelek, receptek, hűtőm, kérdőív)
-- =============================================================================
-- 1. LÉPÉS: mysql -u root -p < adatbazis/mitfozzekma.sql
-- 2. LÉPÉS: mysql -u root -p mitfozzekma < adatbazis/mitfozzekma_receptek.sql
--    (ez betölti az 141 ételek kategóriát + 153 receptet)
-- =============================================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `mitfozzekma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mitfozzekma`;

-- Felesleges / régi táblák törlése (ha léteztek)
DROP TRIGGER IF EXISTS `tr_receptek_after_insert`;
DROP TRIGGER IF EXISTS `tr_receptek_after_update`;
DROP TRIGGER IF EXISTS `tr_receptek_after_delete`;
DROP TABLE IF EXISTS `receptek_naplo`;
DROP TABLE IF EXISTS `receptek`;
DROP TABLE IF EXISTS `kerdoiv`;
DROP TABLE IF EXISTS `hutom`;
DROP TABLE IF EXISTS `etelek`;
DROP TABLE IF EXISTS `felhasznalo`;
DROP TABLE IF EXISTS `bejelentkezes`;
DROP TABLE IF EXISTS `index`;

-- -----------------------------------------------------------------------------
-- 1. FELHASZNÁLÓK
-- -----------------------------------------------------------------------------
CREATE TABLE `felhasznalo` (
  `idfelhasznalo` int(11) NOT NULL AUTO_INCREMENT,
  `felhasznalonev` varchar(60) NOT NULL,
  `email` varchar(120) NOT NULL,
  `jelszo_hash` varchar(255) NOT NULL,
  `teljes_nev` varchar(120) DEFAULT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `szerepkor` enum('felhasznalo','admin') NOT NULL DEFAULT 'felhasznalo',
  `allapot` enum('aktiv','inaktiv','tiltott') NOT NULL DEFAULT 'aktiv',
  `letrehozva` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utolso_frissites` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idfelhasznalo`),
  UNIQUE KEY `uq_felhasznalo_email` (`email`),
  UNIQUE KEY `uq_felhasznalo_felhasznalonev` (`felhasznalonev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- 2. ÉTELEK KATEGÓRIÁK (javaslatokhoz)
-- -----------------------------------------------------------------------------
CREATE TABLE `etelek` (
  `idetelek` int(11) NOT NULL AUTO_INCREMENT,
  `foetel` varchar(45) NOT NULL,
  `eloetel` varchar(45) NOT NULL,
  `leves` varchar(45) DEFAULT NULL,
  `desszert` varchar(45) DEFAULT NULL,
  `nasi` varchar(45) DEFAULT NULL,
  `proteindus` varchar(45) DEFAULT NULL,
  `kaloriaszegeny` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idetelek`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- 3. RECEPTEK
-- -----------------------------------------------------------------------------
CREATE TABLE `receptek` (
  `idreceptek` int(11) NOT NULL AUTO_INCREMENT,
  `hozzavalo` text DEFAULT NULL,
  `ido` varchar(50) DEFAULT NULL,
  `meal` varchar(50) DEFAULT NULL,
  `unnepi_etelek` varchar(50) DEFAULT NULL,
  `kulonlegesseg` varchar(50) DEFAULT NULL,
  `kepek` varchar(500) DEFAULT NULL,
  `recept_hozzaadas` text DEFAULT NULL,
  `allergens` varchar(255) DEFAULT NULL,
  `edes` varchar(10) DEFAULT NULL,
  `sos` varchar(10) DEFAULT NULL,
  `kaloria` varchar(20) DEFAULT NULL,
  `felhasznalo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idreceptek`),
  KEY `fk_receptek_felhasznalo` (`felhasznalo_id`),
  CONSTRAINT `fk_receptek_felhasznalo` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalo` (`idfelhasznalo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- 4. HŰTŐM (Konyhám – felhasználónkénti hozzávalók)
-- -----------------------------------------------------------------------------
CREATE TABLE `hutom` (
  `idhutom` int(11) NOT NULL AUTO_INCREMENT,
  `felhasznalo_id` int(11) NOT NULL,
  `tartalma` varchar(100) NOT NULL,
  PRIMARY KEY (`idhutom`),
  KEY `fk_hutom_felhasznalo` (`felhasznalo_id`),
  CONSTRAINT `fk_hutom_felhasznalo` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalo` (`idfelhasznalo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- 5. KÉRDŐÍV (kérdőív kitöltések)
-- -----------------------------------------------------------------------------
CREATE TABLE `kerdoiv` (
  `idkerdoiv` int(11) NOT NULL AUTO_INCREMENT,
  `felhasznalo_id` int(11) DEFAULT NULL,
  `fo_mennyiseg` varchar(45) DEFAULT NULL,
  `erzekenyseg` varchar(45) DEFAULT NULL,
  `ido` varchar(45) DEFAULT NULL,
  `nehezseg` varchar(45) DEFAULT NULL,
  `eteltipus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idkerdoiv`),
  KEY `fk_kerdoiv_felhasznalo` (`felhasznalo_id`),
  CONSTRAINT `fk_kerdoiv_felhasznalo` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalo` (`idfelhasznalo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- 6. RECEPTEK NAPLÓ (trigger napló)
-- -----------------------------------------------------------------------------
CREATE TABLE `receptek_naplo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idreceptek` int(11) DEFAULT NULL,
  `muvelet` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `recept_cim` varchar(255) DEFAULT NULL,
  `felhasznalo_id` int(11) DEFAULT NULL,
  `idopont` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- ADATOK – minden táblában
-- =============================================================================

-- Felhasználók (több sor, teljes adatokkal)
INSERT INTO `felhasznalo` (`idfelhasznalo`, `felhasznalonev`, `email`, `jelszo_hash`, `teljes_nev`, `telefon`, `szerepkor`, `allapot`) VALUES
(1, 'admin', 'admin@mitfozzekma.hu', 'mitfozzekma_01234', 'Adminisztrátor', '+36123456789', 'admin', 'aktiv'),
(2, 'tesztuser', 'teszt@mitfozzekma.hu', 'tesztjelszo_hash_1234', 'Teszt Elek', '+36201112222', 'felhasznalo', 'aktiv');

-- Ételek kategóriák
INSERT INTO `etelek` (`idetelek`, `foetel`, `eloetel`, `leves`, `desszert`, `nasi`, `proteindus`, `kaloriaszegeny`) VALUES
(1, 'Bruschetta', 'Paradicsomleves', 'Tiramisu', 'Sós ropogós', 'Tojásos wrap', 'Zöldséges quinoa', NULL),
(2, 'Avokádó krém', 'Zöldségleves', 'Almás pite', 'Gyümölcsjoghurt', 'Görög joghurtos tál', 'Citrusos csirkesaláta', NULL),
(3, 'Caprese saláta', 'Húsleves', 'Csokoládétorta', 'Sajtfalat', 'Quinoa zöldségtál', 'Parmezános cukkini', NULL),
(4, 'Füstölt lazacos kanapé', 'Brokkolikrém', 'Vaníliafagyi', 'Magvak mix', 'Lazacos saláta', 'Padlizsán pesto', NULL),
(5, 'Gombás pirítós', 'Minestrone', 'Citromtorta', 'Zöldség chips', 'Banános zabkása', 'Zöldséges leves', NULL),
(6, 'Füstölt sajt tál', 'Karcagi leves', 'Szakács puding', 'Keksz', 'Tofu saláta', 'Cézár saláta (light)', NULL),
(7, 'Sült paprika', 'Karfiol krém', 'Sütőtökös desszert', 'Gyümölcssaláta', 'Csicseriborsó tál', 'Zöldséges pite', NULL),
(8, 'Kaviáros falat', 'Csirkeleves', 'Málnás pohár', 'Olívabogyó', 'Csirkés wrap', 'Paradicsomos tészta (light)', NULL),
(9, 'Cézár előétel', 'Zöldborsó főzelék', 'Mogyorós édesség', 'Mini wurst', 'Tonhalas saláta', 'Sült zöldségek', NULL),
(10, 'Fűszeres retek', 'Hideg gyümölcsleves', 'Panna cotta', 'Mogyoró', 'Burrito proteindús', 'Sült padlizsán alacsony kcal', NULL);

-- Receptek (minta – a teljes 141 recept: mitfozzekma_receptek_teljes.sql)
INSERT INTO `receptek` (`hozzavalo`, `ido`, `meal`, `unnepi_etelek`, `kulonlegesseg`, `kepek`, `recept_hozzaadas`, `allergens`, `edes`, `sos`, `kaloria`, `felhasznalo_id`) VALUES
('50g zabpehely, 2 tojás, 1 banán, 250ml tej, méz, fahéj', '10', 'reggeli', 'nem', 'egyszerű', NULL, 'Zabkása\n\n1. Tej felmelegítése. 2. Zabpehely, főzés. 3. Tálalás banánnal, mézzel.', 'none', 'nem', 'igen', '320', NULL),
('250g túró, méz, eper, málna, áfonya', '8', 'reggeli', 'nem', 'gyors', NULL, 'Túrós gyümölcsös tál\n\n1. Túró krémesítése. 2. Gyümölcsök rá. 3. Méz a tetejére.', 'tej', 'igen', 'nem', '245', NULL),
('1 kifli, 60g sonka, 50g sajt, vaj, mustár', '7', 'reggeli', 'nem', 'szendvics', NULL, 'Sonkás-sajtos szendvics\n\n1. Kifli kettévágása. 2. Vaj, mustár. 3. Sonka, sajt. 4. Összezárás.', 'gluten,tej', 'nem', 'igen', '380', NULL),
('2 tojás, avokádó, 2 szelet kenyér, olívaolaj', '12', 'reggeli', 'nem', 'trendi', NULL, 'Tükörtojás avokádóval\n\n1. Kenyér pirítása. 2. Avokádó krémesítése. 3. Tükörtojás. 4. Tálalás.', 'none', 'nem', 'igen', '420', 2),
('200g csirkemell, rizs, zöldségek, fűszerek', '35', 'foetel', 'nem', 'egyszerű', NULL, 'Csirkés rizs\n\n1. Csirke szeletelés. 2. Rizs főzése. 3. Csirke sütése. 4. Tálalás.', 'none', 'nem', 'igen', '480', NULL),
('300g tészta, paradicsomszósz, bazsalikom, mozzarella', '25', 'foetel', 'nem', 'egyszerű', NULL, 'Paradicsomos tészta\n\n1. Tészta főzése. 2. Szósz összekeverése. 3. Összerakás, tálalás.', 'gluten', 'nem', 'igen', '520', 2),
('150g lazac, citrom, fűszerek, olívaolaj', '20', 'vacsora', 'nem', 'gyors', NULL, 'Sült lazac\n\n1. Lazac fűszerezése. 2. Sütés. 3. Citrommal tálalás.', 'none', 'nem', 'igen', '350', NULL),
('tojás, cukor, liszt, tej, vanília', '45', 'desszert', 'nem', 'közepes', NULL, 'Palacsinta\n\n1. Tészta keverése. 2. Sütés serpenyőben. 3. Tálalás mézzel vagy lekváral.', 'tej,tojás', 'igen', 'nem', '280', 2),
('400g marhahús, hagyma, paprika, rizs', '50', 'foetel', 'nem', 'közepes', NULL, 'Marhapörkölt\n\n1. Hús pirítása. 2. Hagyma, paprika. 3. Pörkölt főzés. 4. Rizzsel tálalás.', 'none', 'nem', 'igen', '550', NULL),
('zöldségek, csirkealaplé, metélőhagyma', '30', 'foetel', 'nem', 'egyszerű', NULL, 'Zöldséges leves\n\n1. Zöldségek felvágása. 2. Leves főzése. 3. Tálalás.', 'none', 'nem', 'igen', '180', NULL);

-- Hűtőm (összes élelmiszer a hozzavaloscript.js FOOD objektumból)
INSERT INTO `hutom` (`felhasznalo_id`, `tartalma`) VALUES
(2, 'paradicsom'), (2, 'uborka'), (2, 'paprika'), (2, 'vöröshagyma'), (2, 'fokhagyma'),
(2, 'sárgarépa'), (2, 'zeller'), (2, 'cékla'), (2, 'retek'), (2, 'burgonya'),
(2, 'édesburgonya'), (2, 'újburgonya'), (2, 'cukkini'), (2, 'padlizsán'), (2, 'brokkoli'),
(2, 'karfiol'), (2, 'káposzta'), (2, 'saláta'), (2, 'rukkola'), (2, 'spenót'),
(2, 'zöldbab'), (2, 'borsó'), (2, 'kukorica'), (2, 'gomba'), (2, 'sütőtök'),
(2, 'olajbogyó'), (2, 'csicseriborsó'), (2, 'lencse'), (2, 'bab'),
(2, 'alma'), (2, 'banán'), (2, 'narancs'), (2, 'citrom'), (2, 'körte'), (2, 'szőlő'),
(2, 'eper'), (2, 'málna'), (2, 'áfonya'), (2, 'barack'), (2, 'ananász'), (2, 'mangó'),
(2, 'gránátalma'), (2, 'avokádó'), (2, 'meggy'), (2, 'blueberry'), (2, 'kék áfonya'),
(2, 'vörös áfonya'), (2, 'gránátalmamag'),
(2, 'csirkemell'), (2, 'csirkecomb'), (2, 'pulykamell'), (2, 'marhahús'), (2, 'sertéshús'),
(2, 'darált hús'), (2, 'sonka'), (2, 'szalonna'), (2, 'kolbász'), (2, 'csirkehús'), (2, 'pulykahús'),
(2, 'lazac'), (2, 'tonhal'), (2, 'tőkehal'), (2, 'harcsa'), (2, 'garnéla'), (2, 'hal'),
(2, 'tej'), (2, 'vaj'), (2, 'tejszín'), (2, 'tejföl'), (2, 'joghurt'), (2, 'görög joghurt'),
(2, 'túró'), (2, 'sajt'), (2, 'mozzarella'), (2, 'feta'), (2, 'szendvicssajt'),
(2, 'cheddar sajt'), (2, 'gouda sajt'),
(2, 'tojás'), (2, 'kenyér'), (2, 'kifli'), (2, 'tortilla'), (2, 'zabpehely'), (2, 'liszt'),
(2, 'rizs'), (2, 'tészta'), (2, 'spagetti'), (2, 'bulgur'), (2, 'quinoa'),
(2, 'zsemlemorzsa'), (2, 'kenyérkocka'), (2, 'müzli'), (2, 'granola'), (2, 'mazsola'),
(2, 'olívaolaj'), (2, 'napraforgóolaj'), (2, 'kókuszolaj'), (2, 'olaj'), (2, 'ecet'),
(2, 'balzsamecet'), (2, 'mustár'), (2, 'majonéz'), (2, 'szójaszósz'), (2, 'ketchup'),
(2, 'paradicsompüré'), (2, 'tahini'), (2, 'humusz'), (2, 'tzatziki'),
(2, 'só'), (2, 'bors'), (2, 'pirospaprika'), (2, 'oregánó'), (2, 'bazsalikom'),
(2, 'rozmaring'), (2, 'kakukkfű'), (2, 'fahéj'), (2, 'kömény'), (2, 'chili'),
(2, 'kumin'), (2, 'paprika'), (2, 'szerecsendió'), (2, 'petrezselyem'), (2, 'koriander'),
(2, 'vanília'), (2, 'vörös paprika'),
(2, 'méz'), (2, 'cukor'), (2, 'virágméz'), (2, 'folyékony méz'),
(2, 'mandula'), (2, 'dió'), (2, 'mogyoró'), (2, 'kesudió'), (2, 'napraforgómag'),
(2, 'tökmag'), (2, 'mandulaosvaj'), (2, 'mogyoróvaj'), (2, 'kakaó nibs'),
(2, 'kávé'), (2, 'eszpresszó'), (2, 'mandulatej'), (2, 'víz'), (2, 'vörösbor'),
(2, 'húsleves'), (2, 'zöldségleves'), (2, 'csirkealaplé'), (2, 'marhaalaplé'),
(2, 'sütőpor'), (2, 'protein por'), (2, 'sportbár'), (2, 'keksz'), (2, 'étcsokoládé'),
(2, 'krém'), (2, 'spirulina'), (2, 'zellerzöld');

-- Kérdőív kitöltések (felhasznalo_id: 2=tesztuser, NULL=vendég)
INSERT INTO `kerdoiv` (`felhasznalo_id`, `fo_mennyiseg`, `erzekenyseg`, `ido`, `nehezseg`, `eteltipus`) VALUES
(2, '4', 'nincs', '30', 'egyszerű', 'foetel'),
(2, '2', 'laktóz', '20', 'gyors', 'reggeli'),
(2, '6', 'gluten', '45', 'közepes', 'vacsora'),
(2, '2', 'nincs', '15', 'egyszerű', 'reggeli'),
(2, '4', 'nincs', '60', 'nehéz', 'foetel'),
(NULL, '2', 'nincs', '25', 'gyors', 'uzsonna');

-- -----------------------------------------------------------------------------
-- Trigger-ek (recept változás naplózása)
-- -----------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER `tr_receptek_after_insert` AFTER INSERT ON `receptek` FOR EACH ROW
BEGIN
  INSERT INTO `receptek_naplo` (`idreceptek`, `muvelet`, `recept_cim`, `felhasznalo_id`)
  VALUES (NEW.idreceptek, 'INSERT', TRIM(SUBSTRING_INDEX(COALESCE(NEW.recept_hozzaadas, ''), '\n', 1)), NEW.felhasznalo_id);
END$$
CREATE TRIGGER `tr_receptek_after_update` AFTER UPDATE ON `receptek` FOR EACH ROW
BEGIN
  INSERT INTO `receptek_naplo` (`idreceptek`, `muvelet`, `recept_cim`, `felhasznalo_id`)
  VALUES (NEW.idreceptek, 'UPDATE', TRIM(SUBSTRING_INDEX(COALESCE(NEW.recept_hozzaadas, ''), '\n', 1)), NEW.felhasznalo_id);
END$$
CREATE TRIGGER `tr_receptek_after_delete` AFTER DELETE ON `receptek` FOR EACH ROW
BEGIN
  INSERT INTO `receptek_naplo` (`idreceptek`, `muvelet`, `recept_cim`, `felhasznalo_id`)
  VALUES (OLD.idreceptek, 'DELETE', TRIM(SUBSTRING_INDEX(COALESCE(OLD.recept_hozzaadas, ''), '\n', 1)), OLD.felhasznalo_id);
END$$
DELIMITER ;

SET FOREIGN_KEY_CHECKS = 1;

-- Kész. Táblák: felhasznalo, etelek, receptek, hutom, kerdoiv, receptek_naplo.
-- Következő: futtasd a mitfozzekma_receptek.sql-t a 153 recept betöltéséhez!
