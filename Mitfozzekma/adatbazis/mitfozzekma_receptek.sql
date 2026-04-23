SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE `mitfozzekma`;

CREATE TABLE IF NOT EXISTS `etelek` (
  `idetelek` int(11) NOT NULL,
  `foetel` varchar(45) NOT NULL,
  `eloetel` varchar(45) NOT NULL,
  `leves` varchar(45) DEFAULT NULL,
  `desszert` varchar(45) DEFAULT NULL,
  `nasi` varchar(45) DEFAULT NULL,
  `proteindus` varchar(45) DEFAULT NULL,
  `kaloriaszegeny` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idetelek`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `receptek` (
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
  PRIMARY KEY (`idreceptek`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Ételek: 141 sor (összes kategória)
DELETE FROM `etelek`;
INSERT INTO `etelek` (`idetelek`, `foetel`, `eloetel`, `leves`, `desszert`, `nasi`, `proteindus`, `kaloriaszegeny`) VALUES
(1, 'Zabkása', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', 'Zöldséges leves'),
(2, 'Túrós gyümölcsös tál', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(3, 'Sonkás-sajtos szendvics', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', NULL),
(4, 'Tükörtojás avokádóval-pirítóssal', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', 'Paradicsomos tészta (light)'),
(5, 'Görög joghurtos magvak mézzel', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(6, 'Almás-fahéjas zabkása', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', NULL),
(7, 'Friss zöld smoothie', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', 'Tonhalsaláta light'),
(8, 'Palacsinta friss gyümölcsökkel-joghurttal', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(9, 'Gombás tojásrántotta', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', NULL),
(10, 'Sült karfiol hummusszal', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', 'Zöldbab főzelék'),
(11, 'Joghurt müzlivel, és gyümölcsökkel', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL),
(12, 'Sajtos-szalonnás szendvics', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(13, 'Alma mandulával és mézzel', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', 'Cézár saláta (light)'),
(14, 'Granola gyümölccsel és joghurttal', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', NULL),
(15, 'Kávé kekszel és csokoládéval', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(16, 'Toast avokádóval és tojással', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', 'Párolt zöldség'),
(17, 'Túró strudel', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', NULL),
(18, 'Gombaleves', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(19, 'Sült alma fahéjjal és joghurttal', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', 'Quinoa saláta'),
(20, 'Protein turmix sportbárral', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', NULL),
(21, 'Brokkolis csirkemell rizssel', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL),
(22, 'Bazsalikomos paradicsomleves kenyérrel', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', 'Sült padlizsán'),
(23, 'Bolognai spagetti', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', NULL),
(24, 'Sült lazac újburgonyával és zöld főzelékkel', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', NULL),
(25, 'Húsleves nokedlivel', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', 'Zöldségleves'),
(26, 'Marhapörkölt rizzsel vagy nokedlivel', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', NULL),
(27, 'Csirkesaláta olajbogyóval', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', NULL),
(28, 'Rántott hús sült krumplival és uborkasalátával', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', 'Csirkemell saláta'),
(29, 'Zöldséges rizs cukkinivel és paradicsommal', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', NULL),
(30, 'Majonézes tonhalsaláta', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', NULL),
(31, 'Sajtos sonkás szendvics', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', 'Zöldséges leves'),
(32, 'Joghurt granolával', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(33, 'Magvas kenyér vajjal és lekvárral', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', NULL),
(34, 'Csirkés wrap salátával és tzatzikivel', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', 'Paradicsomos tészta (light)'),
(35, 'Vegán lencse saláta', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(36, 'Humusz zöldséggel és kenyérrel', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', NULL),
(37, 'Lekváros túrós zsemle', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', 'Tonhalsaláta light'),
(38, 'Sózott pörkölt nasi', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(39, 'Almás joghurt mézzel és fahéjjal', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', NULL),
(40, 'Lazac sütőtökkel és rukkolával', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', 'Zöldbab főzelék'),
(41, 'Zöldségleves növényi alappal', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL),
(42, 'Gombapaprikás nokedlivel', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(43, 'Sült csirkemell cukkinivel', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', 'Cézár saláta (light)'),
(44, 'Párolt hal zöldséggel és citrommal', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', NULL),
(45, 'Szalonnás bab krumplival', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(46, 'Gránátalmás feta saláta', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', 'Párolt zöldség'),
(47, 'Csicsókás csirke rizzsel', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', NULL),
(48, 'Tofu saláta szójaszósszal', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(49, 'Sült zöldségek humusszal és kenyérrel', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', 'Quinoa saláta'),
(50, 'Csirkemell saláta', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', NULL),
(51, 'Párolt zöldségek citrommal', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL),
(52, 'Tonhalsaláta light majonézzel', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', 'Sült padlizsán'),
(53, 'Roston csirkemell sült zöldségekkel', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', NULL),
(54, 'Paprikás cukkinni paradicsommal', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', NULL),
(55, 'Grillezett halfilé párolt zöldséggel', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', 'Zöldségleves'),
(56, 'Lencse saláta', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', NULL),
(57, 'Csirkecomb cukkinivel és paprikával', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', NULL),
(58, 'Zöldség pörkölt', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', 'Csirkemell saláta'),
(59, 'Fehérjés smoothie', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', NULL),
(60, 'Quinoás csirkemell zöldséggel', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', NULL),
(61, 'Sült marhahús sütőtökkel és zöld főzelékkel', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', 'Zöldséges leves'),
(62, 'Tonhal rizzsel', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(63, 'Grillezett csicsóka lazaccal és zöldséggel', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', NULL),
(64, 'Csicseriborsó saláta', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', 'Paradicsomos tészta (light)'),
(65, 'Tonhal quinoa tál', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(66, 'Fűszeres marhaszelet vele sült zöldségekkel', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', NULL),
(67, 'Tojásos avokádó tál', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', 'Tonhalsaláta light'),
(68, 'Protein smoothie', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(69, 'Sült csirke mediterrán módra', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', NULL),
(70, 'Sült csirke', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', 'Zöldbab főzelék'),
(71, 'Bruschetta', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL),
(72, 'Paradicsomleves', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(73, 'Tiramisu', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', 'Cézár saláta (light)'),
(74, 'Sós ropogós', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', NULL),
(75, 'Tojásos wrap', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(76, 'Zöldséges quinoa', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', 'Párolt zöldség'),
(77, 'Párolt lazac', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', NULL),
(78, 'Avokádó krém', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(79, 'Zöldségleves', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', 'Quinoa saláta'),
(80, 'Almás pite', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', NULL),
(81, 'Gyümölcsjoghurt', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL),
(82, 'Görög joghurtos tál', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', 'Sült padlizsán'),
(83, 'Citrusos csirkesaláta', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', NULL),
(84, 'Bolognai spagetti', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', NULL),
(85, 'Caprese saláta', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', 'Zöldségleves'),
(86, 'Húsleves', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', NULL),
(87, 'Csokoládétorta', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', NULL),
(88, 'Sajtfalat', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', 'Csirkemell saláta'),
(89, 'Quinoa zöldségtál', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', NULL),
(90, 'Parmezános cukkini', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', NULL),
(91, 'Sütőtökös rizottó', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', 'Zöldséges leves'),
(92, 'Füstölt lazacos kanapé', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(93, 'Brokkolikrém', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', NULL),
(94, 'Vaníliafagyi', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', 'Paradicsomos tészta (light)'),
(95, 'Magvak mix', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(96, 'Lazacos saláta', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', NULL),
(97, 'Padlizsán pesto', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', 'Tonhalsaláta light'),
(98, 'Csirke curry', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(99, 'Gombás pirítós', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', NULL),
(100, 'Minestrone', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', 'Zöldbab főzelék'),
(101, 'Citromtorta', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL),
(102, 'Zöldség chips', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(103, 'Banános zabkása', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', 'Cézár saláta (light)'),
(104, 'Zöldséges leves', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', NULL),
(105, 'Marhasteak', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(106, 'Füstölt sajt tál', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', 'Párolt zöldség'),
(107, 'Karcagi leves', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', NULL),
(108, 'Szakács puding', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(109, 'Keksz', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', 'Quinoa saláta'),
(110, 'Tofu saláta', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', NULL),
(111, 'Cézár saláta (light)', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL),
(112, 'Vegetáriánus lasagne', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', 'Sült padlizsán'),
(113, 'Sült paprika', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', NULL),
(114, 'Karfiol krém', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', NULL),
(115, 'Sütőtökös desszert', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', 'Zöldségleves'),
(116, 'Gyümölcssaláta', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', NULL),
(117, 'Csicseriborsó tál', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', NULL),
(118, 'Zöldséges pite', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', 'Csirkemell saláta'),
(119, 'Szalonnás sültkrumpli', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', NULL),
(120, 'Kaviáros falat', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', NULL),
(121, 'Csirkeleves', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', 'Zöldséges leves'),
(122, 'Málnás pohár', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(123, 'Olívabogyó', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', NULL),
(124, 'Csirkés wrap', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', 'Paradicsomos tészta (light)'),
(125, 'Paradicsomos tészta (light)', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(126, 'Rizses hús', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', NULL),
(127, 'Cézár előétel', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', 'Tonhalsaláta light'),
(128, 'Zöldborsó főzelék', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(129, 'Mogyorós édesség', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', NULL),
(130, 'Mini wurst', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', 'Zöldbab főzelék'),
(131, 'Tonhalas saláta', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL),
(132, 'Sült zöldségek', 'Húsleves', 'Húsleves', 'Almás pite', 'Sajtfalat', 'Citrusos csirkesaláta', NULL),
(133, 'Gordon bleu', 'Zöldségleves', 'Paradicsomleves', 'Csokoládétorta', 'Magvak mix', 'Tonhalas saláta', 'Cézár saláta (light)'),
(134, 'Fűszeres retek', 'Brokkolikrém', 'Zöldborsó főzelék', 'Palacsinta', 'Olívabogyó', 'Tojásos wrap', NULL),
(135, 'Hideg gyümölcsleves', 'Gombaleves', 'Babgulyás', 'Rétes', 'Bacon chips', 'Csirkemell', NULL),
(136, 'Panna cotta', 'Minestrone', 'Jókai bableves', 'Dobostorta', 'Sült krumpli', 'Lazacos saláta', 'Párolt zöldség'),
(137, 'Mogyoró', 'Karfiol krém', 'Palócleves', 'Somlói galuska', 'Keksz', 'Tofu saláta', NULL),
(138, 'Burrito proteindús', 'Gyümölcsleves', 'Bableves', 'Gesztenyepüré', 'Mogyoró', 'Parmezános cukkini', NULL),
(139, 'Sült padlizsán alacsony kcal', 'Tyúkleves', 'Krumplileves', 'Vaníliafagyi', 'Sózott mogyoró', 'Burrito proteindús', 'Quinoa saláta'),
(140, 'Gombás risotto', 'Halászlé', 'Tojásleves', 'Málnás pohár', 'Popcorn', 'Grillezett lazac', NULL),
(141, 'Csokoládés brownie', 'Paradicsomleves', 'Gulyásleves', 'Tiramisu', 'Sós ropogós', 'Zöldséges quinoa', NULL);

-- Receptek: 153 db (141 + 12 magyar főétel, receptek_teljes alapján)
-- Trigger-ek ideiglenes letiltása (gyorsabb INSERT)
DROP TRIGGER IF EXISTS `tr_receptek_after_insert`;
DROP TRIGGER IF EXISTS `tr_receptek_after_update`;
DROP TRIGGER IF EXISTS `tr_receptek_after_delete`;

DELETE FROM `receptek`;

INSERT INTO `receptek` (`hozzavalo`, `ido`, `meal`, `unnepi_etelek`, `kulonlegesseg`, `kepek`, `recept_hozzaadas`, `allergens`, `edes`, `sos`, `kaloria`, `felhasznalo_id`) VALUES
('50g zabpehely, 2 tojás, 1 banán, 250ml tej, 1 teáskanál méz, só, fahéj (ízlés szerint)', '10', 'reggeli', 'nem', 'egyszerű', 'https://image-api.nosalty.hu/nosalty/images/recipes/Gw/Xq/vegan-sult-zabkasa-afonya-banan.jpeg?w=3000&fit=crop&s=80c26cab112217c927379a0b33cac3e3', 'Zabkása

1. LÉPÉS - A tej előkészítése:
   - Egy közepes méretű fazékba öntsd az 250ml tejet.
   - Melegítsd fel közepes lángon, de ne forrald fel!
   - A tejnek csak melegnek kell lennie, nem forrónak.
   - Ha túl forró lesz, hagyd egy kicsit hűlni.

2. LÉPÉS - A zabpehely hozzáadása:
   - Amikor a tej meleg, add hozzá az 50g zabpelyhet.
   - Keverd jól össze egy kanállal, hogy ne legyen csomós.
   - Csökkentsd a lángot alacsonyra.

3. LÉPÉS - A zabkása főzése:
   - Folyamatosan keverd a zabkását, hogy ne égjen le az aljára.
   - Főzd 5 percig, amíg a zabpehely megpuhul és a tej besűrűsödik.
   - Ha túl sűrű lesz, adj hozzá még egy kevés tejet.
   - Ha túl híg, főzd még 1-2 percig.
   - A zabkásának krémes állagúnak kell lennie.

4. LÉPÉS - A tojások sütése:
   - Közben egy másik serpenyőt melegíts fel közepes lángon.
   - Add hozzá az 1 teáskanál olívaolajat vagy vajat.
   - Amikor a serpenyő meleg, törd bele a 2 tojást.
   - Süsd tükörtojásnak 3-4 percig, amíg a fehérje megdermed.
   - A sárgájának még lágyan maradnia kell.
   - Ha szeretnéd, fordítsd meg a tojást, de csak rövid ideig.

5. LÉPÉS - A banán előkészítése:
   - Az 1 banánt hámozd meg.
   - Szeleteld fel vékony karikákra vagy kockákra.
   - Tárold félre tálalásig.

6. LÉPÉS - Tálalás:
   - Az elkészült zabkását öntsd egy tányérba.
   - Helyezz rá egy sült tojást.
   - Szórd rá a felkarikázott banánt.
   - Csepegtess rá 1 teáskanál mézet.
   - Szórj rá egy csipet fahéjat.
   - Végül sózd az ízlésed szerint.

7. LÉPÉS - Végleges befejezés:
   - Jól keverd össze az összes összetevőt.
   - Melegen fogyaszd azonnal.
   - Ha szeretnéd, adj hozzá még egy kevés tejet a tetejére.

TIPP: Ha szeretnéd, helyezz rá még friss gyümölcsöket vagy magvakat is!', 'none', 'nem', 'nem', '320', NULL),
('250g túró, 2 teáskanál méz, 100g eper, 50g málna, 50g kék áfonya', '8', 'reggeli', 'nem', 'gyors', 'https://kep.cdn.indexvas.hu/1/0/3797/37972/379723/37972375_7bbf9d8275b779da3362274876564fc1_wm.jpg', 'Túrós gyümölcsös tál

1. LÉPÉS - A túró előkészítése:
   - Egy közepes méretű tálba helyezd az 250g túrót.
   - Egy kanál segítségével simítsd be egyenletesen a tál aljára.
   - Ha a túró túl kemény, keverd össze egy villával, hogy krémesebb legyen.

2. LÉPÉS - A méz hozzáadása:
   - Csepegtess rá 2 teáskanál folyékony mézet a túró tetejére.
   - Keverd jól össze a túróval egy kanállal vagy villával.
   - A méznek egyenletesen el kell oszlania a túróban.

3. LÉPÉS - A gyümölcsök előkészítése:
   - Alaposan moss meg minden gyümölcsöt hideg vízben.
   - Szárítsd le papírtörlővel vagy tiszta konyharuhával.
   - A 100g meggyet vágd ketté és vedd ki a magját.
   - Az 100g epert szeleteld fel vékony szeletekre vagy felezd meg.
   - Az 50g málnát és 50g blueberryt hagyd egészben, vagy ha nagyobbak, felezd meg.

4. LÉPÉS - A gyümölcsök elhelyezése:
   - Szórd rá egyenletesen az összes előkészített gyümölcsöt a túrós masszára.
   - Próbáld szépen elosztani, hogy minden részén legyen gyümölcs.
   - Először a meggyet, aztán az epert, majd a málnát és végül a blueberryt.

5. LÉPÉS - Végleges díszítés:
   - Ha szeretnéd, szórj rá még egy csipet mézet a gyümölcsök tetejére.
   - Ez ad egy extra fényt és édességet.

6. LÉPÉS - Tálalás:
   - Azonnal fogyaszd frissen, hogy a gyümölcsök ropogósak maradjanak.
   - Ha nem azonnal fogyasztod, tárold hűtőben, de ne több mint 1-2 órát.
   - A hűtőben tárolás után a gyümölcsök puhábbak lesznek.

TIPP: Ha szeretnéd, szórj rá még egy kevés mogyorót vagy mandulát a tetejére extra crunchért!', 'none', 'nem', 'nem', '245', NULL),
('1 kifli (kb. 60g), 60g sonka (4-5 szelet), 50g szendvicssajt (2-3 szelet), 1 teáskanál vaj, 1 teáskanál mustár (opcionális)', '7', 'reggeli', 'nem', 'szendvics', 'https://www.hidegtalvarazs.hu/wp-content/uploads/2015/11/sonkas_sajtos_web.jpg', 'Sonkás-sajtos szendvics

1. LÉPÉS - A kifli előkészítése:
   - Vegyél elő egy friss kiflit (kb. 60g).
   - Egy éles késsel vágd hosszúságban ketté, hogy két fél kiflit kapj.
   - A kifli belső részét nézd meg, és ha szükséges, egyenlítsd ki egy kicsit.

2. LÉPÉS - A vaj és mustár kenése:
   - Vegyél elő 1 teáskanál vajat és ha szeretnéd, 1 teáskanál mustárt.
   - A vajat kend meg egyenletesen a kifli alsó felének belső részére.
   - Ha szeretnéd, kend rá a mustárt is a vajra, vagy hagyd ki, ha nem szereted.
   - A kenésnek vékony rétegnek kell lennie, ne legyen túl sok.

3. LÉPÉS - A sonka elhelyezése:
   - Vegyél elő 60g sonkát (kb. 4-5 szelet).
   - A sonka szeleteket helyezd rá egyenletesen a kifli alsó felére.
   - Próbáld úgy elhelyezni, hogy minden részén legyen sonka.
   - Ha a szeletek túl nagyok, hajlítsd be őket vagy vágd kisebbre.

4. LÉPÉS - A sajt elhelyezése:
   - Vegyél elő 50g szendvicssajtot (kb. 2-3 szelet).
   - A sajt szeleteket helyezd rá a sonka tetejére.
   - Próbáld úgy elhelyezni, hogy lefedje a sonkát.
   - A sajt segít összetartani a szendvicset és ad egy jó ízt.

5. LÉPÉS - A szendvics összeállítása:
   - Tedd rá a kifli felső felét a sajt tetejére.
   - Nyomd össze egy kicsit, hogy jól összetapadjon.
   - Ha szükséges, egyenlítsd ki a széleit.

6. LÉPÉS - Melegítés (opcionális):
   - Ha szeretnéd, hogy a sajt megolvadjon, csomagold be fóliába.
   - Vagy helyezd egy serpenyőbe mérsékelt hőn.
   - Melegítsd 2-3 percig, amíg a sajt megolvad és a szendvics meleg lesz.
   - Figyeld, nehogy megégjen!

7. LÉPÉS - Tálalás:
   - Az elkészült szendvicset helyezd egy tányérra.
   - Ha melegítetted, azonnal tálald, mert a legjobb íz melegen van.
   - Ha hidegen szeretnéd, azonnal fogyaszthatod.

TIPP: Ha szeretnéd, adj hozzá még egy levél sálátát vagy paradicsomszeletet a sonka és sajt közé extra frissességet!', 'none', 'nem', 'nem', '380', NULL),
('2 tojás, 1 érett avokádó, 2 szelet teljes kiőrlésű kenyér, 1 teáskanál olívaolaj, só, bors, citromlé', '12', 'reggeli', 'nem', 'trendi', 'https://cdn.mindmegette.hu/2024/02/P1hB8GYUBdpEHRpoZWKi10_oIxkFVUTI_UoSJ_Rd6nY/fill/0/0/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzU5YzU2M2MzZDM4MDQ1MDM4N2Y0YjY4MmRkYzJjMjAw.webp', 'Tükörtojás avokádóval-pirítóssal

1. LÉPÉS - A kenyér pirítása:
   - Vegyél elő 2 szelet teljes kiőrlésű kenyeret.
   - Egy kenyérpirítót vagy serpenyőt használj a pirításhoz.
   - Pirítsd meg mindkét oldalát aranybarnára, kb. 2-3 percig mindkét oldalon.
   - Ha serpenyőben pirítasz, használj egy kevés vajat vagy olívaolajat.
   - A pirított kenyeret tedd félre egy tányérra.

2. LÉPÉS - Az avokádó előkészítése:
   - Vegyél elő 1 érett avokádót (a héja sötétzöld vagy fekete legyen, és puha legyen).
   - Vágd ketté hosszúságban egy éles késsel, majd forgasd el, hogy szétváljon.
   - A magot vedd ki egy kanállal vagy késsel.
   - A húst merőkanállal szósd ki egy tálba.
   - Nyomd össze egy villával, hogy krémes legyen.

3. LÉPÉS - Az avokádó fűszerezése:
   - Sózd és borsozd az avokádó krémet az ízlésed szerint.
   - Csepegtess rá egy kevés citromlét (kb. 1/2 teáskanál).
   - Keverd jól össze, hogy minden összetevő egyenletesen el legyen osztva.
   - Az avokádó kréme most készen áll a kenésre.

4. LÉPÉS - A tükörtojás sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá az 1 teáskanál olívaolajat és várj, amíg felmelegszik.
   - Törd bele a 2 tojást óvatosan, hogy ne törjön a sárgája.
   - Süsd 3-4 percig, amíg a fehérje megdermed és fehér lesz.
   - A sárgájának még lágyan maradnia kell (ne legyen teljesen megfőzve).
   - Ha szeretnéd, fordítsd meg rövid ideig, de csak akkor, ha keményebb sárgát szeretnél.

5. LÉPÉS - A szendvics összeállítása:
   - A pirított kenyérszeletekre kend rá az avokádó krémet egyenletesen.
   - Próbáld úgy elosztani, hogy minden részén legyen avokádó.
   - Helyezz rá egy-egy tükörtojást mindkét kenyérszeletre.
   - Vagy ha csak egy szendvicset készítesz, helyezd rá mindkét tojást.

6. LÉPÉS - Végleges díszítés:
   - Szórj rá egy csipet vörös paprikát a tetejére díszítésként.
   - Ez ad egy szép színt és egy kis fűszerességet.
   - Ha szeretnéd, adj hozzá még egy kevés sót és borsot.

7. LÉPÉS - Tálalás:
   - Azonnal tálald melegen, mert a legjobb íz frissen készülve van.
   - A tojásnak még melegnek kell lennie.
   - Egy tányérra helyezd és azonnal fogyaszd.

TIPP: Ha szeretnéd, adj hozzá még egy kevés feta sajtot vagy paradicsomszeleteket extra ízért!', 'none', 'nem', 'nem', '420', NULL),
('200ml görög joghurt (0% zsír), 30g mandula (vagy vegyes magvak), 2 teáskanál virágméz, 1 teáskanál vörös áfonya vagy gránátalmamag', '5', 'reggeli', 'nem', 'egészséges', 'https://magazin.klarstein.hu/wp-content/uploads/2022/03/KS_Magazine_0222_Griechischer-Joghurt-mit-Honig-und-Nussen_1300x1300px.jpg', 'Görög joghurtos magvak mézzel

1. LÉPÉS - A joghurt előkészítése:
   - Vegyél elő egy szép tálat vagy poharat a tálaláshoz.
   - Győződj meg róla, hogy tiszta és száraz.
   - Ha átlátszó poharat használsz, szép rétegezést láthatsz.

2. LÉPÉS - A mandula előkészítése:
   - Vegyél elő 30g mandulát vagy vegyes magvakat.
   - Ha egész mandulád van, durvára aprítsd egy késsel vagy aprítógéppel.
   - Ha már morzsolt mandulád van, használd azt.
   - A mandulának durván aprítottnak kell lennie, ne legyen túl finomra vágva.

3. LÉPÉS - Az első réteg elhelyezése:
   - Ha rétegezni szeretnél, öntsd az első 100ml joghurtot az aljára.
   - Szórd rá az aprított mandulák felét (kb. 15g) egyenletesen.
   - Próbáld úgy elosztani, hogy minden részén legyen mandula.

4. LÉPÉS - A második réteg:
   - Öntsd rá a maradék 100ml joghurtot a mandula tetejére.
   - Ez alkotja a második réteget.
   - Próbáld úgy önteni, hogy szép réteg legyen.

5. LÉPÉS - A felső réteg díszítése:
   - Szórd rá a maradék mandulát (kb. 15g) a második joghurtrétegre.
   - Csepegtess rá 2 teáskanál virágmézet egyenletesen.
   - A méznek szép mintát kell alkotnia a tetején.

6. LÉPÉS - A gyümölcsök hozzáadása:
   - Szórd rá 1 teáskanál vörös áfonyát vagy gránátalmamag szemeket a tetejére.
   - Ez ad egy szép színt és extra ízt.
   - Próbáld szépen elosztani.

7. LÉPÉS - Tálalás:
   - Azonnal tálald hidegen, hogy a legjobb íz legyen.
   - A müzli és magvak ropogósak maradnak hidegen.
   - Egy kanállal fogyaszd, hogy minden réteget együtt egyél.

TIPP: Ha szeretnéd, adj hozzá még egy kevés kókuszreszeléket vagy chia magot extra egészségért!', 'none', 'nem', 'nem', '220', NULL),
('50g zabpehely, 250ml víz, 1 közepes alma, 1 teáskanál fahéj, 1 szál fahéj (opcionális), 1 teáskanál méz', '10', 'reggeli', 'nem', 'meleg', 'https://viblance.com/wp-content/uploads/2024/09/1718972752150-1-e1719490293627-630x530-1.jpg', 'Almás-fahéjas zabkása

1. LÉPÉS - A víz forralása:
   - Egy közepes méretű fazékba öntsd a 250ml vizet.
   - Tedd fel közepes lángra és várj, amíg felforr.
   - A víznek teljesen felforráshoz kell érnie.
   - Közben készítsd elő az almát.

2. LÉPÉS - Az alma előkészítése:
   - Vegyél elő 1 közepes almát.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg egy késsel vagy hámozóval.
   - Vágd ki a magházat és a szárát.
   - Apróra vágd kockákra vagy vékony szeletekre.
   - Minél kisebb darabokra vágod, annál gyorsabban megfő.

3. LÉPÉS - A zabpehely hozzáadása:
   - Amikor a víz felforrt, add hozzá az 50g zabpelyhet.
   - Keverd jól össze egy kanállal, hogy ne legyen csomós.
   - Add hozzá az alma darabkákat is.
   - Keverd össze újra.

4. LÉPÉS - A főzés:
   - Csökkentsd a lángot közepes-alacsonyra.
   - Folyamatosan keverd a zabkását, hogy ne égjen le az aljára.
   - Főzd kb. 5-7 percig, amíg a zabpehely megpuhul.
   - Az almának is meg kell puhulnia.
   - Ha túl sűrű lesz, adj hozzá még egy kevés vizet.
   - Ha túl híg, főzd még 1-2 percig.

5. LÉPÉS - A fahéj hozzáadása:
   - Amikor a zabkása megfelelő konzisztenciához ér, szórd rá az 1 teáskanál fahéjat.
   - Keverd jól össze, hogy a fahéj egyenletesen el legyen osztva.
   - Főzd még 1 percig, hogy az ízek összeérjenek.

6. LÉPÉS - A méz hozzáadása:
   - Vedd le a tűzről a zabkását.
   - Csepegtess rá 1 teáskanál mézet.
   - Keverd jól össze.
   - A méz adja az édességet.

7. LÉPÉS - Díszítés és tálalás:
   - Ha van, helyezz rá egy szál fahéjat dísznek a tetejére.
   - Melegen tálald egy tányérba.
   - Azonnal fogyaszd, mert a legjobb íz melegen van.

TIPP: Ha szeretnéd, adj hozzá még egy kevés mogyorót vagy mandulát a tetejére extra crunchért!', 'none', 'nem', 'nem', '320', NULL),
('1 nagyobb banán (fagyasztott), 100g friss spenót, 200ml tej (vagy mandulatej), 30g mandula (vagy 2 teáskanál mandulaosvaj), 1 teáskanál méz, 1/2 teáskanál spirulina (opcionális)', '6', 'reggeli', 'nem', 'ital', 'https://image-api.nosalty.hu/nosalty/images/recipes/tV/yw/ananaszos-zold-smoothie.jpeg?w=1200&h=920&s=42850f77eb6adfca8fe81ccd98138fae', 'Friss zöld smoothie

1. LÉPÉS - A banán előkészítése:
   - Vegyél elő 1 nagyobb banánt, ami megfagyasztva van (előző nap tedd be a fagyasztóba).
   - Ha nincs megfagyasztva, fagyaszd be legalább 2-3 órára előre.
   - A megfagyasztott banánt vedd ki a fagyasztóból és hagyd egy kicsit olvadni (kb. 5 perc).
   - Szeleteld fel nagyobb darabokra, hogy könnyebben turmixolható legyen.

2. LÉPÉS - A spenót előkészítése:
   - Vegyél elő 100g friss spenótot.
   - Alaposan mosd meg hideg vízben, hogy eltávolítsd a szennyeződéseket.
   - Szárítsd le papírtörlővel vagy centrifuga salátaszárítóval.
   - Ha nagy levelek vannak, tépd kisebbre.

3. LÉPÉS - A turmixgép előkészítése:
   - Vegyél elő egy turmixgépet vagy botmixert.
   - Győződj meg róla, hogy tiszta és száraz.
   - A turmixgépbe kezdj el rétegezni az összetevőket.

4. LÉPÉS - Az összetevők hozzáadása (sorrendben):
   - Először tedd bele a megfagyasztott banán darabokat.
   - Add hozzá a 100g friss spenótot.
   - Öntsd rá a 200ml tejet vagy mandulatejet.
   - Add hozzá a 30g mandulát vagy 2 teáskanál mandulaosvajat.
   - Csepegtess rá 1 teáskanál mézet.
   - Végül add hozzá az 1/2 teáskanál zöld port (spirulina), ha szeretnéd.

5. LÉPÉS - A turmixolás:
   - Csatold rá a turmixgép fedelét biztonságosan.
   - Kezdj el turmixolni közepes sebességen.
   - Fokozatosan növeld a sebességet maximumra.
   - Turmixold körülbelül 1-2 percig, amíg teljesen sima és krémis lesz.
   - Ha szükséges, állítsd meg és keverd össze kézzel, majd folytasd.

6. LÉPÉS - A konzisztencia beállítása:
   - Ha túl sűrű a smoothie, adj hozzá még egy kevés tejet (kb. 50ml).
   - Turmixold újra 20 másodpercig.
   - Ha túl híg, adj hozzá még egy kevés banánt vagy jégkockát.
   - A smoothienek krémesnek és simának kell lennie.

7. LÉPÉS - Tálalás:
   - Öntsd egy magas pohárba frissen.
   - Azonnal fogyaszd, hogy a legjobb íz és szín legyen.
   - A zöld szín megmarad, ha azonnal fogyasztod.
   - Ha szeretnéd, díszítsd még egy szelet banánnal vagy spenótlevéllel.

TIPP: A smoothie legjobb frissen készítve, de ha tárolni szeretnéd, tedd hűtőbe és fogyaszd 1-2 órán belül!', 'none', 'nem', 'nem', '180', NULL),
('120g teljes kiőrlésű liszt, 200ml tej, 2 tojás, 1 teáskanál cukor, 1 csipet só, 1/2 teáskanál sütőpor, 150ml görög joghurt, 100g eper, 50g málna, 50g blueberry, 1 teáskanál méz', '20', 'reggeli', 'nem', 'édes', 'https://kep.index.hu/1/0/2910/29100/291004/29100405_8b49c091f0251b7f979e239833b21d14_wm.jpg', 'Palacsinta friss gyümölcsökkel-joghurttal

1. LÉPÉS - A tészta előkészítése:
   - Egy nagy tálba tedd a 2 tojást és 1 teáskanál cukrot.
   - Verd fel habosra egy villával vagy keverőgéppel, amíg világossárga és habos nem lesz.
   - A keverés ideje kb. 2-3 perc kézzel.

2. LÉPÉS - A liszt és fűszerek hozzáadása:
   - Egy másik tálban keverd össze a 120g teljes kiőrlésű lisztet, 1 csipet sóval és 1/2 teáskanál sütőporral.
   - Szitáld át a lisztet, hogy ne legyen csomós.
   - Fokozatosan add hozzá a lisztet a tojás-cukor keverékhez.
   - Közben öntsd hozzá a 200ml tejet is.
   - Keverd jól össze, hogy egyenletes, híg állagú massza legyen.

3. LÉPÉS - A tészta pihentetése:
   - Hagyd állni a tésztát legalább 10 percig.
   - Ez fontos, hogy a liszt megduzzadjon és a tészta simább legyen.
   - Ha túl sűrű, adj hozzá még egy kevés tejet.

4. LÉPÉS - A palacsinták sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Olajozd be egy kevés olajjal vagy vajjal.
   - Amikor a serpenyő meleg, önts egy kiskanállal tésztát a közepére.
   - Forgasd körbe a serpenyőt, hogy a tészta egyenletesen elterüljön.
   - Süsd kb. 1 percig egyik oldalon, amíg aranybarna lesz.
   - Fordítsd meg és süsd még 30 másodpercig a másik oldalon.
   - Ismételd meg, amíg mind a 4 palacsintát meg nem készíted.

5. LÉPÉS - A gyümölcsök előkészítése:
   - Alaposan mosd meg a 100g epert, 50g málnát és 50g blueberryt.
   - Szárítsd le papírtörlővel.
   - Az epert szeleteld fel vékony szeletekre vagy felezd meg.
   - A málnát és blueberryt hagyd egészben.

6. LÉPÉS - A palacsinták töltése:
   - Minden palacsintát tálj egy-egy tányérra.
   - Kend meg 30ml görög joghurttal minden palacsintát.
   - Szórd rá a friss gyümölcsöket (eper, málna, blueberry) egyenletesen.
   - Tedd rá a következő palacsintát és ismételd meg a rétegezést.

7. LÉPÉS - Végleges díszítés:
   - A legfelső palacsintát tálald felül.
   - Csepegtess rá 1 teáskanál mézet a tetejére.
   - Szórd rá még egy kevés gyümölcsöt díszítésként.
   - Azonnal tálald melegen.

TIPP: A palacsinták legjobbak frissen készítve, de ha szeretnéd, tarthatod melegen is egy kicsit!', 'none', 'nem', 'nem', '220', NULL),
('3 tojás, 200g vegyes gomba, 1 teáskanál olívaolaj, 1/2 vöröshagyma, só, bors, friss petrezselyem (opcionális)', '12', 'reggeli', 'nem', 'sós', 'https://tesco.hu//imgglobal/content_platform/recipes/main/7b/7bf4d20e2aac9a4268d6fa79b190eab6.jpg', 'Gombás tojásrántotta

1. LÉPÉS - A gombák előkészítése:
   - Vegyél elő 200g vegyes gombát (csiperke, laska vagy shiitake).
   - Alaposan tisztítsd meg hideg vízben vagy egy nedves konyharuhával.
   - Vágd le a gombák szárát, ha szükséges.
   - Szeleteld fel vagy darabolj nagyobb darabokra egy éles késsel.
   - A szeleteknek kb. 0,5 cm vastagoknak kell lenniük.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1/2 vöröshagymát.
   - Hámozd meg és finomra aprítsd meg.
   - A hagymának nagyon finomra kell vágva lennie.

3. LÉPÉS - A gombák párolása:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá az 1 teáskanál olívaolajat.
   - Amikor az olaj meleg, add hozzá a finomra vágott hagymát.
   - Pirítsd 1 percig, amíg illatos lesz és üveges.
   - Add hozzá a gombaszeleteket.
   - Párold 5-6 percig, amíg a gombák levet eresztenek és megpuhulnak.
   - Folyamatosan keverd, hogy ne égjen le.
   - A gombáknak aranybarnának kell lenniük.

4. LÉPÉS - A tojások előkészítése:
   - Egy tálba törd bele a 3 tojást.
   - Verd fel egy villával vagy keverőgéppel, amíg egyenletes nem lesz.
   - Sózd és borsozz az ízlésed szerint.
   - A tojásnak simának és habosnak kell lennie.

5. LÉPÉS - A rántotta készítése:
   - Amikor a gombák megpuhultak, öntsd rá a verített tojást.
   - Folyamatosan keverd egy kanállal vagy spatulával.
   - Pirítsd 4-5 percig közepes lángon.
   - Ne hagyd túl szárazra válni!
   - A rántottának egy kicsit fénylősnek és krémesnek kell maradnia.
   - Ha szeretnéd, fordítsd meg egyszer, de nem kötelező.

6. LÉPÉS - A petrezselyem hozzáadása:
   - Ha szeretnéd, vágd apróra a friss petrezselymet.
   - Szórd rá a rántotta tetejére.
   - Ez ad egy friss ízt és szép színt.

7. LÉPÉS - Tálalás:
   - Azonnal tálald melegen egy tányérra.
   - A rántotta legjobb melegen, frissen készítve.
   - Ha szeretnéd, szolgáld fel pirítóssal vagy friss kenyérrel.

TIPP: A rántotta nem szabad túl szárazra válni - a krémes állag a legjobb!', 'none', 'nem', 'nem', '280', NULL),
('300g karfiol, 3 teáskanál olívaolaj, 1/2 teáskanál kumin, 1/2 teáskanál paprika, só, bors, 1 konzerv csicseriborsó (400g), 3 gerezd fokhagyma, 3 teáskanál tahini, 2 evőkanál citromlé, 2 teáskanál olívaolaj (humuszhoz)', '18', 'reggeli', 'nem', 'vegetáriánus', 'https://production.streetkitchen-cdn.com/sult-karfiolsteak-kapiapaprikas-humusszal-3-scaled-A3Js9F.webp', 'Sült karfiol hummusszal

1. LÉPÉS - A karfiol előkészítése:
   - Vegyél elő 300g karfiolt.
   - Alaposan mosd meg hideg vízben.
   - Vágd le a leveleket és a szárát.
   - Bontsd részekre nagyobb rózsákká.
   - A rózsáknak kb. 3-4 cm-eseknek kell lenniük.

2. LÉPÉS - A karfiol fűszerezése:
   - Egy nagy tálba helyezd a karfiol rózsákat.
   - Add hozzá a 3 teáskanál olívaolajat.
   - Szórd rá az 1/2 teáskanál kumint, 1/2 teáskanál paprikát.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze, hogy minden rózsa be legyen kenve.

3. LÉPÉS - A karfiol sütése:
   - Előmelegítsd a sütőt 220°C-ra.
   - Egy sütőpapírral bélelt tepsibe terítsd el a karfiol rózsákat.
   - Tartsd kb. 2-3 cm távolságot közöttük.
   - Süsd 20-25 percig, amíg szépre barnul a vége és ropogós lesz.
   - Közben fordítsd meg egyszer, hogy mindkét oldala szép legyen.

4. LÉPÉS - A humusz előkészítése (közben):
   - Nyisd ki az 1 konzervált csicseriborsót (400g).
   - Csepegtesse le a levét egy szűrőn.
   - Öblítsd le alaposan hideg vízben.
   - Hagyd lecsepegni.

5. LÉPÉS - A humusz készítése:
   - Egy turmixgépbe tedd a lecsepegtetett csicseriborsót.
   - Add hozzá a 3 gerezd megtisztított és apróra vágott fokhagymát.
   - Add hozzá a 3 teáskanál tahinit.
   - Öntsd hozzá a 2 evőkanál citromlét.
   - Add hozzá a 2 teáskanál olívaolajat.
   - Turmixold 2-3 percig, amíg teljesen krémes nem lesz.

6. LÉPÉS - A humusz konzisztenciájának beállítása:
   - Ha túl sűrű, adj hozzá még egy kevés vizet (kb. 1-2 evőkanál).
   - Turmixold újra, amíg sima nem lesz.
   - A humusznak krémesnek és simának kell lennie.
   - Sózd az ízlésed szerint.

7. LÉPÉS - Tálalás:
   - A sült karfiolt helyezd egy tányérba.
   - Készíts egy kis halmot a humuszból a karfiol mellé vagy közepére.
   - Melegen fogyaszd azonnal.
   - Ha szeretnéd, díszítsd még egy kevés olívaolajjal és petrezselyemmel.

TIPP: A karfiol legjobb ropogósan, de ne legyen túl barnába sütve!', 'none', 'nem', 'nem', '220', NULL),
('150ml természetes joghurt, 50g müzli, 1 evőkanál virágméz, 50g kevert friss gyümölcs', '6', '10órai', 'nem', 'gyors', 'https://m.blog.hu/zo/zoldtej/image/joghurt_muzli.jpg', 'Joghurt müzlivel, és gyümölcsökkel

1. LÉPÉS - A pohár/tál előkészítése:
   - Vegyél elő egy szép poharat vagy tálat a tálaláshoz.
   - Győződj meg róla, hogy tiszta és száraz.
   - Ha átlátszó poharat használsz, szép rétegezést láthatsz.

2. LÉPÉS - Az első réteg - joghurt:
   - Öntsd bele a 150ml természetes joghurtot az aljára.
   - A joghurtnak egyenletesen kell elterülnie.
   - Ha túl sűrű, keverd össze egy kanállal.

3. LÉPÉS - A második réteg - müzli:
   - Szórd rá az 50g müzli felét (kb. 25g) a joghurt tetejére.
   - Próbáld egyenletesen elosztani.
   - A müzli adja a crunch-t és az ízt.

4. LÉPÉS - A harmadik réteg - méz:
   - Csepegtess rá 1/2 evőkanál virágmézet a müzli tetejére.
   - A méznek szép mintát kell alkotnia.
   - Ne legyen túl sok, mert túl édes lesz.

5. LÉPÉS - A negyedik réteg - gyümölcsök:
   - Helyezd rá az összes kevert friss gyümölcsöt (50g) rétegként.
   - Próbáld szépen elosztani, hogy minden részén legyen gyümölcs.
   - A gyümölcsök adnak egy friss ízt és szép színt.

6. LÉPÉS - Az ötödik réteg - maradék müzli:
   - Szórd rá a maradék müzlit (kb. 25g) a gyümölcsök tetejére.
   - Ez ad egy extra crunch-t.

7. LÉPÉS - Végleges díszítés:
   - Csepegtess rá még egy 1/2 evőkanál mézet az egész tetejére.
   - Ez ad egy szép fényt és extra édességet.
   - Próbáld szépen elosztani.

8. LÉPÉS - Tálalás:
   - Azonnal fogyaszd, hogy a müzli crunch-je megmaradjon.
   - Ha túl sokáig hagyod, a müzli megpuhul.
   - Egy kanállal fogyaszd, hogy minden réteget együtt egyél.

TIPP: A müzli legjobb frissen, de ha szeretnéd, tárold hűtőben és fogyaszd 1-2 órán belül!', 'none', 'nem', 'nem', '220', NULL),
('2 szelet kenyér (vagy 1 kifli), 3 szelet füstölt szalonna, 2 szelet cheddar sajt, 1 teáskanál majonéz, 1 levél saláta, 1 szelet paradicsom', '8', '10órai', 'nem', 'szendvics', 'https://gastrohobbi.hu/wp-content/uploads/2017/05/IMG_0794-1200x900.jpg', 'Sajtos-szalonnás szendvics

1. LÉPÉS - A szalonna sütése:
   - Vegyél elő 3 szelet füstölt szalonnát.
   - Egy serpenyőt melegíts fel közepes lángon.
   - Tedd bele a szalonna szeleteket.
   - Süsd 3-4 percig, amíg ropogóssá válik és aranybarna lesz.
   - Fordítsd meg egyszer, hogy mindkét oldala szép legyen.
   - Tedd félre papírtörlőre, hogy lecsöpögjön a felesleges zsír.

2. LÉPÉS - A kenyér pirítása:
   - Vegyél elő 2 szelet kenyeret vagy 1 kiflit.
   - Pirítsd meg mindkét oldalát aranybarnára.
   - Ha kenyérpirítót használsz, kb. 2-3 percig.
   - Ha serpenyőben, használj egy kevés vajat.

3. LÉPÉS - A kenyér kenése:
   - Kend meg a pirított kenyérszeleteket vajon vagy majonézzel.
   - A kenésnek vékony rétegnek kell lennie.
   - Ez ad egy jó ízt és segít összetartani a szendvicset.

4. LÉPÉS - A szalonna elhelyezése:
   - Helyezd rá a sült szalonna szeleteket a kenyér egyik felére.
   - Próbáld úgy elhelyezni, hogy minden részén legyen szalonna.
   - Ha a szeletek túl nagyok, hajlítsd be őket.

5. LÉPÉS - A sajt elhelyezése:
   - Helyezd rá a 2 szelet cheddar sajtot a szalonna tetejére.
   - A sajt segít összetartani és ad egy jó ízt.
   - Próbáld úgy elhelyezni, hogy lefedje a szalonnát.

6. LÉPÉS - A zöldségek hozzáadása:
   - Helyezd rá az 1 levél sálátát a sajt tetejére.
   - Tedd rá az 1 szelet paradicsomot is.
   - Ez ad egy friss ízt és szép színt.

7. LÉPÉS - A szendvics összeállítása:
   - Tedd rá a másik kenyérszeletet a tetejére.
   - Nyomd össze egy kicsit, hogy jól összetapadjon.
   - Ha szükséges, vágd ketté átlósan.

8. LÉPÉS - Melegítés (opcionális):
   - Ha szeretnéd, hogy a sajt megolvadjon, melegítsd meg 1-2 percig.
   - Vagy mikróban, vagy serpenyőben alacsony lángon.
   - Figyeld, nehogy megégjen!

9. LÉPÉS - Tálalás:
   - Azonnal tálald melegen egy tányérra.
   - A legjobb íz melegen van.
   - Ha hidegen szeretnéd, azonnal fogyaszthatod.

TIPP: A szalonna legjobb ropogósan, de ne legyen túl barnába sütve!', 'none', 'nem', 'nem', '380', NULL),
('1 nagyobb alma, 40g morzsolt mandula, 1 teáskanál méz, 1 csipet fahéj, citromlé (opcionális)', '5', '10órai', 'nem', 'egészséges', 'https://cdn.betterme.world/articles/wp-content/uploads/2023/05/source-297-rotated.jpg', 'Alma mandulával és mézzel

1. LÉPÉS - Az alma előkészítése:
   - Vegyél elő 1 nagyobb gala vagy fuji almát.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg egy késsel vagy hámozóval (opcionális, de ajánlott).
   - Vágd ki a magházat és a szárát.
   - Vékonyra szeleteld fel (kb. 0,5 cm vastag szeletek).
   - A szeleteknek egyenleteseknek kell lenniük.

2. LÉPÉS - A tál előkészítése:
   - Vegyél elő egy szép tálat a tálaláshoz.
   - Győződj meg róla, hogy tiszta és száraz.
   - Helyezd bele az almaszeleteket egyenletesen.

3. LÉPÉS - A mandula elhelyezése:
   - Szórd rá az összes morzsolt mandulát (40g) egyenletesen az almaszeletekre.
   - Próbáld úgy elosztani, hogy minden szeleten legyen mandula.
   - A mandula adja a crunch-t és az ízt.

4. LÉPÉS - A méz hozzáadása:
   - Csepegtess rá 1 teáskanál virágmézet az almára.
   - A méznek szép mintát kell alkotnia.
   - Próbáld egyenletesen elosztani.
   - Ne legyen túl sok, mert túl édes lesz.

5. LÉPÉS - A fahéj hozzáadása:
   - Szórj rá 1 csipet fahéjat a tetejére.
   - Ez ad egy szép ízt és illatot.
   - Próbáld egyenletesen elosztani.

6. LÉPÉS - A citromlé hozzáadása (opcionális):
   - Ha szeretnéd, csepegtess rá egy kevés citromlét az almára.
   - Ez megakadályozza, hogy az alma megbarnuljon.
   - Ad egy friss ízt is.
   - Csak egy kevés kell, ne legyen túl sok.

7. LÉPÉS - Tálalás:
   - Azonnal fogyaszd frissen.
   - A legjobb íz frissen készítve van.
   - Ha szeretnéd, díszítsd még egy kevés mandulával a tetejére.

TIPP: Az alma legjobb frissen, de ha tárolni szeretnéd, tedd hűtőbe és fogyaszd 1-2 órán belül!', 'none', 'nem', 'nem', '120', NULL),
('200ml görög joghurt, 50g granola, 50g eper, 30g friss ananász, 20g szőlő, 1 evőkanál méz', '7', '10órai', 'nem', 'crunchy', 'https://ecofamily.hu/shop_ordered/66388/pic/Blog/243_05.jpg', 'Granola gyümölccsel és joghurttal

1. LÉPÉS - A pohár előkészítése:
   - Vegyél elő egy átlátszó poharat a tálaláshoz.
   - Győződj meg róla, hogy tiszta és száraz.
   - Az átlátszó pohárban szép rétegezést láthatsz.

2. LÉPÉS - Az első réteg - joghurt:
   - Öntsd bele az első 100ml görög joghurtot az aljára.
   - A joghurtnak egyenletesen kell elterülnie.
   - Ha túl sűrű, keverd össze egy kanállal.

3. LÉPÉS - A második réteg - granola:
   - Szórd rá a granola felét (kb. 25g) a joghurt tetejére.
   - Próbáld egyenletesen elosztani.
   - A granola adja a crunch-t és az ízt.

4. LÉPÉS - A harmadik réteg - eper:
   - Helyezd rá az eper szeleteket (50g) rétegként.
   - Próbáld szépen elosztani.
   - Az eper ad egy friss ízt és szép színt.

5. LÉPÉS - A negyedik réteg - ananász:
   - Add hozzá az ananász darabokat (30g) az eper mellé.
   - Próbáld egyenletesen elosztani.
   - Az ananász ad egy édes ízt.

6. LÉPÉS - Az ötödik réteg - szőlő:
   - Add hozzá az összes szőlőt (20g).
   - Próbáld szépen elosztani.
   - A szőlő ad egy friss ízt.

7. LÉPÉS - A hatodik réteg - maradék joghurt:
   - Töltsd rá a maradék 100ml joghurtot a gyümölcsök tetejére.
   - Próbáld úgy önteni, hogy szép réteg legyen.

8. LÉPÉS - A hetedik réteg - maradék granola:
   - Szórd rá az összes maradék granolát (kb. 25g) a joghurt tetejére.
   - Ez ad egy extra crunch-t.

9. LÉPÉS - Végleges díszítés:
   - Csepegtess rá 1 evőkanál virágmézet az egész tetejére.
   - Ez ad egy szép fényt és extra édességet.
   - Próbáld szépen elosztani.

10. LÉPÉS - Tálalás:
    - Azonnal fogyaszd frissen.
    - A legjobb íz frissen készítve van.
    - Egy kanállal fogyaszd, hogy minden réteget együtt egyél.

TIPP: A granola legjobb frissen, de ha szeretnéd, tárold hűtőbe és fogyaszd 1-2 órán belül!', 'none', 'nem', 'nem', '220', NULL),
('250ml eszpresszó vagy klasszikus kávé, 3 db diós keksz, 30g étcsokoládé, 30ml tej vagy krém', '6', 'desszert', 'nem', 'sütemény', 'https://izboltiz.cafeblog.hu/files/2017/02/IMG_9375.jpg', 'Kávé kekszel és csokoládéval

KEKSZ ELKÉSZÍTÉSE (ha nincs kész keksz):

1. LÉPÉS - A keksz tészta előkészítése:
   - Egy nagy tálba tedd a 200g lisztet, 100g vajat (szobahőmérsékleten puha), 50g cukrot, 1 tojást, 1 teáskanál sütőport és 1 csipet sót.
   - A vajat keverd össze a cukorral egy villával vagy keverőgéppel, amíg világossárga és habos nem lesz.
   - Add hozzá a tojást és keverd jól össze.
   - Fokozatosan add hozzá a lisztet, sütőport és sót, majd kézzel dagassz össze sima, rugalmas tésztává.
   - Ha túl ragadós, adj hozzá még egy kevés lisztet. Ha túl száraz, adj hozzá egy csepp tejet.

2. LÉPÉS - A keksz formázása:
   - A tésztát csomagold be frissentartó fóliába és tedd hűtőbe legalább 30 percig pihentetni.
   - A hűtés után a tésztát nyújtsd ki kb. 0,5 cm vastagságúra egy lisztezett felületen.
   - Kerek vagy szíves formájú kekszformákkal vagy egy pohár szájával vágd ki a kekszeket.
   - A kekszformákat helyezd egy sütőpapírral bélelt tepsire, kb. 2-3 cm távolságra egymástól.

3. LÉPÉS - A keksz sütése:
   - Előmelegítsd a sütőt 180°C-ra.
   - A kekszeket süsd 12-15 percig, amíg aranybarnák lesznek a széleken.
   - Figyeld a kekszeket, nehogy megégjenek! Ha szükséges, csökkentsd a hőmérsékletet.
   - A sütés után hagyd kihűlni a kekszeket a tepsiben 5 percig, majd helyezd át egy rácsra teljesen kihűlni.

KÁVÉ ÉS CSOKOLÁDÉ ELKÉSZÍTÉSE:

4. LÉPÉS - A kávé főzése:
   - Forralj fel 250ml friss vizet egy kávéfőzőben vagy fazékban.
   - Ha eszpresszót készítesz, használj eszpresszó gépet vagy moka kávéfőzőt. Ha klasszikus kávét, akkor csöpögtesd a kávét a szokásos módon.
   - A kávé erősségét az ízlésed szerint állítsd be.
   - A főzés után hagyd állni 1-2 percig, hogy az ízek kifejlődjenek.

5. LÉPÉS - A tej/krém hozzáadása:
   - Melegítsd fel a 30ml tejet vagy krémet egy kis fazékban vagy mikróban, de ne forrald fel!
   - Ha szeretnéd, verd fel a tejet habosra egy habverővel vagy habverőgéppel.
   - Óvatosan öntsd a meleg tejet vagy krémet a kávé tetejére, hogy szép réteget alkosson.

6. LÉPÉS - A csokoládé előkészítése:
   - A 30g étcsokoládét vágd apró kockákra vagy szeletekbe egy éles késsel.
   - Ha szeretnéd, hogy könnyebben olvadjon, tedd egy tálba és olvaszd meg vízfürdőben vagy mikróban rövid ideig.
   - Hagyd kihűlni egy kicsit, hogy ne legyen túl forró.

7. LÉPÉS - Tálalás:
   - Egy szép tányérra vagy tálcára helyezd a 3 db diós kekszet.
   - A kávét tálald egy melegített csészében vagy nagy pohárban.
   - A csokoládé szeleteket helyezd egy kis tálkában a kávé mellé.
   - A kekszeket egyenként mártogasd a kávéba, majd egyen közben egy-egy csokoládé szeletet.
   - A csokoládé felolvad a szádban, miközben a keksz ropogós marad.
   - Melegen fogyaszd, kb. 15-20 percen belül, hogy a keksz ne váljon túl puha legyen.

TIPP: Ha szeretnéd, szórj rá egy csipet fahéjat vagy kakaóport a kávé tetejére díszítésként!', 'none', 'nem', 'nem', '220', NULL),
('2 szelet teljes kiőrlésű kenyér, 1 érett avokádó, 2 tojás, 1 teáskanál olívaolaj, só, bors, citromlé, 1 csipet vörös paprika', '10', '10órai', 'nem', 'trendy', 'https://st3.depositphotos.com/1884173/14734/i/450/depositphotos_147347803-stock-photo-toast-with-avocado-and-egg.jpg', 'Toast avokádóval és tojással

1. LÉPÉS - A kenyér pirítása:
   - Vegyél elő 2 szelet teljes kiőrlésű kenyeret.
   - Egy kenyérpirítót vagy serpenyőt használj a pirításhoz.
   - Pirítsd meg mindkét oldalát aranybarnára, kb. 2-3 percig mindkét oldalon.
   - Ha serpenyőben pirítasz, használj egy kevés vajat vagy olívaolajat.
   - A pirított kenyeret tedd félre egy tányérra.

2. LÉPÉS - Az avokádó előkészítése:
   - Vegyél elő 1 érett avokádót (a héja sötétzöld vagy fekete legyen, és puha legyen).
   - Vágd ketté hosszúságban egy éles késsel, majd forgasd el, hogy szétváljon.
   - A magot vedd ki egy kanállal vagy késsel.
   - A húst merőkanállal szósd ki egy tálba.
   - Nyomd össze egy villával, hogy krémes legyen.
   - Vagy szeleteld fel vékony szeletekre.

3. LÉPÉS - Az avokádó fűszerezése:
   - Sózd és borsozd az avokádó krémet vagy szeleteket az ízlésed szerint.
   - Csepegtess rá citromlét (kb. 1/2 teáskanál).
   - Keverd jól össze, ha krémet készítettél.

4. LÉPÉS - A tükörtojás sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá az 1 teáskanál olívaolajat és várj, amíg felmelegszik.
   - Törd bele a 2 tojást óvatosan, hogy ne törjön a sárgája.
   - Süsd 3-4 percig, amíg a fehérje megdermed és fehér lesz.
   - A sárgájának még lágyan maradnia kell.
   - Ha szeretnéd, fordítsd meg rövid ideig.

5. LÉPÉS - A toast összeállítása:
   - A pirított kenyérszeletekre kend rá vagy helyezd rá az avokádó krémet/szeleteket.
   - Próbáld úgy elosztani, hogy minden részén legyen avokádó.
   - Helyezz rá egy-egy tükörtojást mindkét kenyérszeletre.
   - Vagy ha csak egy toastot készítesz, helyezd rá mindkét tojást.

6. LÉPÉS - Végleges díszítés:
   - Szórj rá egy csipet vörös paprikát a tetejére.
   - Ez ad egy szép színt és egy kis fűszerességet.
   - Ha szeretnéd, adj hozzá még egy kevés sót és borsot.

7. LÉPÉS - Tálalás:
   - Azonnal tálald melegen egy tányérra.
   - A legjobb íz frissen készülve van.
   - A tojásnak még melegnek kell lennie.

TIPP: Az avokádó legjobb érett állapotban, de ne legyen túl puha!', 'none', 'nem', 'nem', '450', NULL),
('250g liszt, 100ml tej, 1 tojás, 50g vaj, 1 csipet só, 1 teáskanál cukor, 300g túró, 2 tojás (töltés), 100g cukor (töltés), 50g mazsola, 1 teáskanál vanília, 1 teáskanál fahéj', '25', 'desszert', 'nem', 'édes', 'https://bitethebutter.wordpress.com/wp-content/uploads/2015/07/img_1611.jpg?w=604&h=403', 'Túró strudel

1. LÉPÉS - A tészta előkészítése:
   - Egy nagy tálba keverd össze a 250g lisztet, 1 csipet sóval és 1 teáskanál cukorral.
   - Szitáld át a lisztet, hogy ne legyen csomós.
   - Egy kút közepén tedd az 1 tojást és 100ml tejet.
   - Keverd össze a liszttel, amíg sima tészta nem lesz.

2. LÉPÉS - A vaj hozzáadása:
   - Add hozzá az 50g puha vajat a tésztához.
   - Dagasszd össze kézzel, amíg sima és rugalmas tészta nem lesz.
   - Ha túl ragadós, adj hozzá még egy kevés lisztet.
   - Ha túl száraz, adj hozzá még egy kevés tejet.

3. LÉPÉS - A tészta pihentetése:
   - Csomagold be frissentartó fóliába.
   - Tedd hűtőbe legalább 30 percig.
   - Ez fontos, hogy a tészta könnyebben kezelhető legyen.

4. LÉPÉS - A töltés előkészítése:
   - Egy tálba keverd össze a 300g túrót.
   - Add hozzá a 2 tojást és keverd jól össze.
   - Add hozzá a 100g cukrot és keverd össze.
   - Add hozzá a 50g mazsolát.
   - Add hozzá az 1 teáskanál vaníliát és 1 teáskanál fahéjat.
   - Keverd jól össze, hogy minden összetevő egyenletesen el legyen osztva.

5. LÉPÉS - A tészta nyújtása:
   - Lisztezd meg a munkafelületet.
   - Vedd ki a tésztát a hűtőből.
   - Nyújtsd ki egyenletesen, kb. 0,5 cm vastagságúra.
   - Próbáld téglalap alakúra nyújtani.

6. LÉPÉS - A töltés elhelyezése:
   - Kend meg a tésztát a töltéssel egyenletesen.
   - Hagyj kb. 2 cm széles szélt üresen mindkét oldalon.
   - A töltésnek egyenletesen el kell oszlania.

7. LÉPÉS - A strudel formázása:
   - Tekerdd fel csigaként a tésztát a töltéssel együtt.
   - Óvatosan tekerd, hogy ne törjön a tészta.
   - A széleket nyomd össze, hogy ne szivárogjon ki a töltés.

8. LÉPÉS - A sütés előkészítése:
   - Előmelegítsd a sütőt 190°C-ra.
   - Egy tepsit vajazz be vagy bélelj sütőpapírral.
   - Helyezd bele a strudelt.

9. LÉPÉS - A sütés:
   - Süsd 25-30 percig, amíg aranybarna lesz.
   - Közben fordítsd meg egyszer, hogy mindkét oldala szép legyen.
   - Figyeld, nehogy megégjen!

10. LÉPÉS - Tálalás:
    - Hagyd kihűlni 10 percig a sütés után.
    - Vágd fel szeletekre.
    - Melegen vagy hidegen tálald.
    - Ha szeretnéd, szolgáld fel porcukorral vagy tejszínhabbal.

TIPP: A strudel legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '250', NULL),
('300g vegyes gomba, 1 liter húsleves vagy zöldségleves, 1/2 vöröshagyma, 2 gerezd fokhagyma, 100ml tejszín, 1 teáskanál szerecsendió, só, bors, kenyérkocka', '15', '10órai', 'nem', 'meleg', 'https://www.budgetbytes.com/wp-content/uploads/2024/02/Mushroom-Soup-Side.jpg', 'Gombaleves

1. LÉPÉS - A gombák előkészítése:
   - Vegyél elő 300g vegyes gombát.
   - Alaposan tisztítsd meg hideg vízben vagy egy nedves konyharuhával.
   - Vágd le a gombák szárát, ha szükséges.
   - Szeleteld fel vagy darabolj nagyobb darabokra.
   - A szeleteknek kb. 0,5-1 cm vastagoknak kell lenniük.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1/2 vöröshagymát.
   - Hámozd meg és finomra aprítsd meg.
   - A hagymának nagyon finomra kell vágva lennie.

3. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Nyomd ki vagy aprítsd finomra.
   - A fokhagymának finomra kell vágva lennie.

4. LÉPÉS - A hagyma és fokhagyma pirítása:
   - Egy fazékban melegítsd fel egy teáskanál olajon.
   - Add hozzá a finomra vágott hagymát.
   - Pirítsd 1 percig, amíg illatos lesz és üveges.
   - Add hozzá a fokhagymát és pirítsd még 30 másodpercig.

5. LÉPÉS - A gombák párolása:
   - Add hozzá a gombaszeleteket.
   - Párold kb. 8 percig, amíg a gombák levet eresztenek és megpuhulnak.
   - Folyamatosan keverd, hogy ne égjen le.
   - A gombáknak aranybarnának kell lenniük.

6. LÉPÉS - A leves hozzáadása:
   - Öntsd fel az 1 liter húslevest vagy zöldséglevest.
   - Forrald fel.
   - Főzd 3-4 percig, amíg a gombák teljesen megpuhulnak.

7. LÉPÉS - A fűszerek hozzáadása:
   - Add hozzá az 1 teáskanál szerecsendiót.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - A tejszín hozzáadása:
   - Lassan öntsd fel a 100ml tejszínt.
   - Főzd még 2-3 percig, de ne forrald fel!
   - A tejszín adja a krémes állagot.

9. LÉPÉS - Tálalás:
   - Tálald forrón kenyérkockákkal.
   - Ha szeretnéd, díszítsd még egy kevés petrezselyemmel.
   - Azonnal fogyaszd melegen.

TIPP: A leves legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '180', NULL),
('2 alma, 1 teáskanál fahéj, 1 teáskanál méz vagy cukor, 20g vaj vagy kókuszolaj, 200ml görög joghurt, 1 csipet só', '12', 'desszert', 'nem', 'meleg édes', 'https://videkize.hu/wp-content/uploads/2020/12/7701097Sultalmafahejasmusszal01-scaled.jpg', 'Sült alma fahéjjal és joghurttal

1. LÉPÉS - Az almák előkészítése:
   - Vegyél elő 2 nagyobb almát.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg egy késsel vagy hámozóval.
   - Vágd ki a magházat és a szárát.
   - Vágd felváló (félbe), hogy két felet kapj.

2. LÉPÉS - A töltés előkészítése:
   - Egy kis tálban keverd össze az 1 teáskanál fahéjat.
   - Add hozzá az 1 teáskanál mézet vagy cukrot.
   - Keverd jól össze.

3. LÉPÉS - Az alma töltése:
   - Helyezd az alma feleket egy tepsibe.
   - Az üreg közepébe helyezz egy kevés vajat (20g) vagy kókuszolajat.
   - Szórd rá a fahéj-méz keveréket.
   - Próbáld úgy elosztani, hogy minden részén legyen.

4. LÉPÉS - A sütés előkészítése:
   - Előmelegítsd a sütőt 180°C-ra.
   - Egy tepsit bélelj sütőpapírral.
   - Helyezd bele az almákat.

5. LÉPÉS - A sütés:
   - Süsd 15-20 percig, amíg az almák megpuhulnak és aranybarnák lesznek.
   - Közben nézd meg, hogy ne égjenek meg.
   - Az almáknak puha, de még formájuknak meg kell maradnia.

6. LÉPÉS - A joghurt előkészítése:
   - Egy tálba helyezd a 200ml görög joghurtot.
   - Ha túl sűrű, keverd össze egy kanállal.
   - Sózd egy csipet sóval, ha szeretnéd.

7. LÉPÉS - Tálalás:
   - A frissen sült, még meleg almákat helyezd egy tálba.
   - Öntsd rá a görög joghurtot.
   - Melegen fogyaszd azonnal.
   - Ha szeretnéd, díszítsd még egy kevés fahéjjal vagy mézzel.

TIPP: Az alma legjobb frissen sütve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '220', NULL),
('250ml mandulatej, 30g vanília protein por, 1 fagyasztott banán, 1 teáskanál mandulaosvaj, 1 evőkanál kakaó nibs, 1 db protein sportbár', '8', '10órai', 'nem', 'protein', 'https://data.ketomix.cz/data/tmp/0/6/4626_0.hu.jpg?1728645166_1', 'Protein turmix sportbárral

1. LÉPÉS - A banán előkészítése:
   - Vegyél elő 1 nagyobb fagyasztott banánt.
   - Ha nincs megfagyasztva, fagyaszd be legalább 2-3 órára előre.
   - A megfagyasztott banánt vedd ki a fagyasztóból.
   - Szeleteld fel nagyobb darabokra, hogy könnyebben turmixolható legyen.

2. LÉPÉS - A turmixgép előkészítése:
   - Vegyél elő egy turmixgépet vagy botmixert.
   - Győződj meg róla, hogy tiszta és száraz.
   - A turmixgépbe kezdj el rétegezni az összetevőket.

3. LÉPÉS - Az összetevők hozzáadása (sorrendben):
   - Először öntsd bele a 250ml mandulatejet.
   - Add hozzá az 1 adag (30g) vanília protein port.
   - Tedd bele a fagyasztott banán darabokat.
   - Add hozzá az 1 teáskanál mandulaosvajat.
   - Add hozzá az 1 evőkanál kakaó nibset.

4. LÉPÉS - A turmixolás:
   - Csatold rá a turmixgép fedelét biztonságosan.
   - Kezdj el turmixolni közepes sebességen.
   - Fokozatosan növeld a sebességet maximumra.
   - Turmixold körülbelül 1-2 percig, amíg teljesen sima és krémis lesz.
   - Ha szükséges, állítsd meg és keverd össze kézzel, majd folytasd.

5. LÉPÉS - A konzisztencia beállítása:
   - Ha túl sűrű, adj hozzá még egy kevés mandulatejet (kb. 50ml).
   - Turmixold újra 20 másodpercig.
   - Ha túl híg, adj hozzá még egy kevés banánt vagy jégkockát.
   - A smoothienek krémesnek és simának kell lennie.

6. LÉPÉS - Tálalás:
   - Öntsd egy magas pohárba frissen.
   - Azonnal fogyaszd a protein sportbárral.
   - A sportbár ad egy extra proteint és ízt.
   - Ha szeretnéd, díszítsd még egy kevés kakaó nibsszel a tetejére.

TIPP: A smoothie legjobb frissen készítve, de ha tárolni szeretnéd, tedd hűtőbe és fogyaszd 1-2 órán belül!', 'none', 'nem', 'nem', '220', NULL);

INSERT INTO `receptek` (`hozzavalo`, `ido`, `meal`, `unnepi_etelek`, `kulonlegesseg`, `kepek`, `recept_hozzaadas`, `allergens`, `edes`, `sos`, `kaloria`, `felhasznalo_id`) VALUES
('300g csirkemell, 150g basmati rizs (szárazon), 400g brokkoli, 2 gerezd fokhagyma, 2 teáskanál szójaszósz, 1 teáskanál olívaolaj, só, bors', '30', 'foetel', 'nem', 'klasszikus', 'https://tastychicken.muszaj.com/wp-content/uploads/2024/02/besameles-brokkolis-csirkemell-rizzsel-735x400.jpg.webp', 'Brokkolis csirkemell rizssel

1. LÉPÉS - A rizs főzése:
   - Egy fazékban forrald fel sós vizet.
   - Add hozzá a 150g basmati rizst (szárazon).
   - Főzd 15-18 percig, amíg puha lesz.
   - Közben folyamatosan keverd, hogy ne ragadjon le.
   - Ha szükséges, adj hozzá még egy kevés vizet.
   - Amikor kész, szűrd le és hagyd állni.

2. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 300g csirkemell filét.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Vágd felére vagy kockákra (kb. 2-3 cm-es darabok).
   - Sózd és borsozd az ízlésed szerint.

3. LÉPÉS - A csirkemell sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá az 1 teáskanál olívaolajat.
   - Amikor az olaj meleg, add hozzá a csirkemell darabokat.
   - Süsd 8-10 percig, amíg teljesen átsül és aranybarna lesz.
   - Folyamatosan keverd, hogy ne égjen le.
   - A húsnak teljesen átsültnek kell lennie.

4. LÉPÉS - A fokhagyma hozzáadása:
   - Add hozzá a 2 gerezd apróra vágott fokhagymát.
   - Pirítsd még 1 percig, amíg illatos lesz.
   - Figyeld, nehogy megégjen!

5. LÉPÉS - A szójaszósz hozzáadása:
   - Add hozzá a 2 teáskanál szójaszószt.
   - Keverd össze 1-2 percig.
   - A szósz adja az ízt és a színt.

6. LÉPÉS - A brokkoli előkészítése:
   - Vegyél elő 400g friss brokkolit.
   - Alaposan mosd meg hideg vízben.
   - Fejtsd részekre (rózsákká).
   - Vágd le a szárát, ha szükséges.

7. LÉPÉS - A brokkoli párolása:
   - Egy fazékban forrald fel vizet.
   - Add hozzá a brokkoli rózsákat.
   - Párold 5-6 percig, amíg al dente marad (ropogós, de puha).
   - Ne főzd túl, mert puhává válik!
   - Szűrd le és hagyd lecsepegni.

8. LÉPÉS - Tálalás:
   - Egy tálba helyezz egy adag rizst.
   - Helyezd rá a csirkemell keveréket.
   - Végül helyezd rá a brokkoli rózsákat.
   - Sózd és borsozz az ízlésed szerint.
   - Melegen fogyaszd azonnal.

TIPP: A brokkoli legjobb al dente állapotban, ne főzd túl!', 'none', 'nem', 'nem', '350', NULL),
('800g friss paradicsom, 500ml zöldségleves, 1 fej vöröshagyma, 3 gerezd fokhagyma, friss bazsalikom, 100ml tejszín, 2 teáskanál olívaolaj, só, bors, 2 szelet teljes kiőrlésű kenyér', '25', 'foetel', 'nem', 'könnyű', 'https://receptvadasz.hu/wp-content/uploads/2021/01/kenyeres-paradicsomleves-vagy-paradicsomos-kenyerleves-ez-toszkan-pappa-al-pomodoro.jpg', 'Bazsalikomos paradicsomleves kenyérrel

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát.
   - Hámozd meg és finomra aprítsd meg.
   - A hagymának nagyon finomra kell vágva lennie.

2. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 3 gerezd fokhagymát.
   - Nyomd ki vagy aprítsd finomra.
   - A fokhagymának finomra kell vágva lennie.

3. LÉPÉS - A hagyma és fokhagyma pirítása:
   - Egy fazékban melegítsd fel a 2 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát.
   - Pirítsd 2 percig, amíg illatos lesz és üveges.
   - Add hozzá a fokhagymát és pirítsd még 30 másodpercig.

4. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 800g friss paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Vágd fel nagyobb darabokra vagy kockákra.
   - A paradicsomnak kb. 2-3 cm-es darabokra kell vágva lennie.

5. LÉPÉS - A paradicsom hozzáadása:
   - Add hozzá a paradicsom darabokat a hagymához.
   - Főzd 15-18 percig, amíg a paradicsom szétesik.
   - Folyamatosan keverd, hogy ne égjen le.
   - A paradicsomnak teljesen meg kell puhulnia.

6. LÉPÉS - A leves hozzáadása:
   - Öntsd fel a 500ml zöldséglevest.
   - Forrald fel.
   - Főzd még 5 percig.

7. LÉPÉS - A leves turmixolása:
   - Turmixold le egy turmixgéppel vagy botmixerrel.
   - Vagy szűrd át finom szitán.
   - A levesnek simának és krémesnek kell lennie.

8. LÉPÉS - A tejszín és bazsalikom hozzáadása:
   - Add hozzá a 100ml tejszínt.
   - Add hozzá a kb. 15g friss bazsalikom levelet.
   - Főzd még 2-3 percig, de ne forrald fel!
   - A tejszín adja a krémes állagot.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

10. LÉPÉS - A kenyér előkészítése:
    - Pirítsd meg a 2 szelet teljes kiőrlésű kenyeret.
    - Pirítsd aranybarnára mindkét oldalát.

11. LÉPÉS - Tálalás:
    - Tálald forrón a levest.
    - Szolgáld fel a pirított kenyérszeletekkel.
    - Ha szeretnéd, díszítsd még egy kevés bazsalikommal.
    - Azonnal fogyaszd melegen.

TIPP: A leves legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '180', NULL),
('400g darált marhahús, 250g spagetti, 400g aprított paradicsom, 1 fej vöröshagyma, 3 gerezd fokhagyma, 1 sárgarépa, 1 szál zeller, 2 evőkanál olívaolaj, 100ml vörösbor, 1 evőkanál paradicsompüré, só, bors, 1 teáskanál oregánó', '35', 'foetel', 'nem', 'olasz', 'https://cdn.mindmegette.hu/2024/04/Oi7egB33Q-1h1AmWFCekQ3-LQohh1LQNm2AXR3EqaEU/fill/0/0/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50L2U4OWE5Mjk5YTcyYjRjOWY5MTkyNTMwNTE3NzExZmVm.webp', 'Bolognai spagetti

1. LÉPÉS - A hús előkészítése:
   - Vegyél elő 400g darált marhahúst.
   - Ha szükséges, sózd és borsozd.
   - Készítsd elő a többi hozzávalót.

2. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 fej vöröshagymát, 3 gerezd fokhagymát, 1 sárgarépát és 1 szál zellerzöldet.
   - Hámozd meg és aprítsd finomra mindegyiket.
   - A zöldségeknek nagyon finomra kell vágva lenniük.

3. LÉPÉS - A hús sütése:
   - Egy nagy serpenyőt melegíts fel a 2 evőkanál olívaolajjal.
   - Add hozzá a darált marhahúst.
   - Süsd 8-10 percig, amíg teljesen átsül és aranybarna lesz.
   - Folyamatosan keverd, hogy ne égjen le.
   - A húsnak teljesen átsültnek kell lennie.

4. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá az apróra vágott hagymát, fokhagymát, sárgarépát és zellerzöldet.
   - Párold 5 percig, amíg a zöldségek megpuhulnak.
   - Folyamatosan keverd.

5. LÉPÉS - A bor hozzáadása:
   - Öntsd fel a 100ml vörösbort.
   - Hagyd 3 percig forrni.
   - A bor adja az ízt és a színt.

6. LÉPÉS - A paradicsom hozzáadása:
   - Add hozzá a 400g aprított paradicsomot.
   - Add hozzá az 1 evőkanál paradicsompürét.
   - Add hozzá az 1 teáskanál oregánót.
   - Főzd 15-20 percig szimmerizálva (alacsony lángon).
   - Folyamatosan keverd.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.
   - A szósznak sűrűnek kell lennie.

8. LÉPÉS - A spagetti főzése:
   - Egy nagy fazékban forrald fel sós vizet.
   - Add hozzá a 250g spagettit.
   - Főzd az étkezési utasítások szerint (általában 8-12 perc).
   - Folyamatosan keverd, hogy ne ragadjon össze.
   - Amikor kész, szűrd le és hagyd lecsepegni.

9. LÉPÉS - Tálalás:
   - Egy tálba helyezz egy adag spagettit.
   - Öntsd rá a bolognai szószt.
   - Melegen fogyaszd azonnal.
   - Ha szeretnéd, szórj rá még egy kevés reszelt sajtot.

TIPP: A szósz legjobb hosszú főzéssel, hogy az ízek összeérjenek!', 'none', 'nem', 'nem', '480', NULL),
('300g lazac filé, 400g újburgonya, 300g spenót (vagy leveles zöld), 2 teáskanál olívaolaj, 1 citrom, 1 teáskanál friss rozmaring, só, bors, 100ml tejszín', '25', 'foetel', 'nem', 'prémium', 'https://www.beatbull.net/images/orig/0359.jpg', 'Sült lazac újburgonyával és zöld főzelékkel

1. LÉPÉS - Az újburgonya főzése:
   - Vegyél elő 400g újburgonyát.
   - Alaposan mosd meg hideg vízben.
   - Egy fazékban forrald fel sós vizet.
   - Add hozzá az újburgonyákat.
   - Főzd 15-18 percig, amíg puha lesz.
   - Próbáld meg egy villával, hogy kész-e.
   - Amikor kész, szűrd le és hagyd lecsepegni.

2. LÉPÉS - A lazac előkészítése:
   - Vegyél elő 300g lazac filét.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Sózd és borsozd az ízlésed szerint.

3. LÉPÉS - A lazac sütése:
   - Előmelegítsd a sütőt 180°C-ra.
   - Egy sütőpapírral bélelt tepsibe helyezd a lazac filét.
   - Kend meg olívaolajjal (2 teáskanál).
   - Helyezz rá egy citromszeletet.
   - Szórd rá az 1 teáskanál friss rozmaringot.
   - Süsd 12-15 percig, amíg a lazac átsül.
   - Figyeld, nehogy túl süljön!

4. LÉPÉS - A spenót előkészítése:
   - Vegyél elő 300g spenótot vagy más leveles zöldséget.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Ha nagy levelek vannak, tépd kisebbre.

5. LÉPÉS - A spenót sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá egy kevés olívaolajat.
   - Add hozzá a spenótot.
   - Pirítsd 2-3 percig, amíg összeesik.

6. LÉPÉS - A tejszín hozzáadása:
   - Öntsd fel a 100ml tejszínt.
   - Főzd 3-4 percig, amíg a tejszín besűrűsödik.
   - Sózd és borsozz az ízlésed szerint.

7. LÉPÉS - Tálalás:
   - Egy tálba helyezz egy adag újburgonyát.
   - Helyezd rá a sült lazac filét.
   - Helyezd mellé a zöld főzeléket.
   - Csepegtess rá néhány cseppet citromlédből.
   - Melegen fogyaszd azonnal.

TIPP: A lazac legjobb közepesen sülve, ne legyen túl száraz!', 'none', 'nem', 'nem', '380', NULL),
('800g csont vagy csirkehús, 2 liter víz, 1 sárgarépa, 1 fehér hagyma, zellerzöld, 1/2 káposzta, só, bors, 2 tojás (nokedli), 200g liszt (nokedli), 1 csipet só (nokedli)', '45', 'foetel', 'nem', 'tradicionális', 'https://misihusihu.cdn.shoprenter.hu/custom/misihusihu/image/cache/w0h0q100np1/blogs/husleves-husok/gyogyito-husleves.png?v=null.1710849375', 'Húsleves nokedlivel

1. LÉPÉS - A hús előkészítése:
   - Vegyél elő 800g csontot vagy csirkehúst.
   - Alaposan mosd meg hideg vízben.
   - Ha szükséges, vágd kisebbre.

2. LÉPÉS - A leves főzése:
   - Egy nagy fazékban forrald fel 2 liter vizet.
   - Add hozzá a csontot vagy húst.
   - Forrald 5 percig, majd szűrd le a habot.
   - Ez fontos, hogy tiszta legyen a leves.

3. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 nagyobb sárgarépát, 1 szál fehér hagymát és 1 szál zellerzöldet.
   - Alaposan mosd meg hideg vízben.
   - Vágd nagyobb darabokra (kb. 3-4 cm-esek).

4. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá a sárgarépát, fehér hagymát és zellerzöldet a leveshez.
   - Főzd 30-35 percig, amíg a hús megpuhul.
   - Folyamatosan keverd és szűrd le a habot.

5. LÉPÉS - A leves szűrése:
   - Szűrd át a levest egy szitán.
   - Tárold félre a húst és zöldségeket.
   - Tedd vissza a levest a fazékba.

6. LÉPÉS - A káposzta hozzáadása:
   - Vegyél elő 1/2 káposztát.
   - Vágd kisebbre vagy szeleteld fel.
   - Add hozzá a leveshez.
   - Főzd még 10 percig.

7. LÉPÉS - A nokedli tészta előkészítése:
   - Egy tálba keverd össze a 2 tojást.
   - Add hozzá a 200g lisztet és 1 csipet sót.
   - Keverd össze, amíg sima tészta nem lesz.
   - Ha túl sűrű, adj hozzá még egy kevés vizet.
   - Ha túl híg, adj hozzá még egy kevés lisztet.

8. LÉPÉS - A nokedli főzése:
   - Amikor a leves forr, egy teáskanál segítségével csöpögtesd a tésztát a levesbe.
   - Kisebb darabokra csöpögtesd.
   - Főzd 8-10 percig, amíg a nokedlik fölötte lebegnek.
   - Folyamatosan keverd, hogy ne ragadjanak össze.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Tálald forrón a levest a nokedlivel.
    - Ha szeretnéd, add hozzá vissza a húst és zöldségeket.
    - Melegen fogyaszd azonnal.

TIPP: A leves legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '180', NULL),
('700g marhahús, 1 fej vöröshagyma, 4 teáskanál paprika, 1 paradicsom, 400g burgonya, 200ml marhaalaplé, 2 teáskanál olívaolaj, só, bors, 150g basmati rizs', '60', 'foetel', 'nem', 'magyaros', 'https://production.streetkitchen-cdn.com/tokeletes-marhaporkolt-2-1618x855-SMF5sh.webp', 'Marhapörkölt rizzsel vagy nokedlivel

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát.
   - Hámozd meg és aprítsd finomra.
   - A hagymának nagyon finomra kell vágva lennie.

2. LÉPÉS - A hagyma pirítása:
   - Egy nagy serpenyőt vagy fazékba melegítsd fel a 2 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát.
   - Pirítsd 2-3 percig, amíg illatos lesz és üveges.

3. LÉPÉS - A paprika hozzáadása:
   - Szórd rá a 4 teáskanál paprikát.
   - Rögtön keverd össze, hogy ne égjen le.
   - A paprika adja a színt és az ízt.

4. LÉPÉS - A hús hozzáadása:
   - Add hozzá a 700g marhahúst.
   - Süsd 5-6 percig, amíg megpírósodik.
   - Folyamatosan keverd, hogy ne égjen le.
   - A húsnak aranybarnának kell lennie.

5. LÉPÉS - A paradicsom és leves hozzáadása:
   - Add hozzá az 1 paradicsomdadogot (vagy aprított paradicsomot).
   - Öntsd fel a 200ml marhatermelőt.
   - Főzd fedő alatt 45-50 percig szimmerizálva (alacsony lángon).
   - Folyamatosan keverd és nézd meg, hogy ne száradjon ki.
   - Ha szükséges, adj hozzá még egy kevés vizet.

6. LÉPÉS - A burgonya hozzáadása:
   - Vegyél elő 400g burgonyát.
   - Hámozd meg és vágd kockákra (kb. 2-3 cm-esek).
   - Az utolsó 10 percben add hozzá a burgonyát.
   - Főzd, amíg a burgonya megpuhul.

7. LÉPÉS - A rizs főzése (közben):
   - Egy fazékban forrald fel sós vizet.
   - Add hozzá a 150g basmati rizst.
   - Főzd 15-18 percig, amíg puha lesz.
   - Szűrd le és hagyd lecsepegni.

8. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

9. LÉPÉS - Tálalás:
   - Egy tálba helyezz egy adag rizst.
   - Öntsd rá a pörköltöt.
   - Melegen fogyaszd azonnal.
   - Ha szeretnéd, szolgáld fel nokedlivel is.

TIPP: A pörkölt legjobb hosszú főzéssel, hogy a hús megpuhuljon!', 'none', 'nem', 'nem', '480', NULL),
('400g sült csirkemell, 200g vegyes saláta, 100g fekete olajbogyó, 1 paradicsom, 1 uborka, 1/2 piros paprika, 2 evőkanál olívaolaj, 1 evőkanál balzsamecet, só, bors, 1 citrom leve', '20', 'foetel', 'nem', 'könnyű', 'https://lacikonyha.hu/assets/uploads/2020/07/Lacikonyha-olajbogyos-csirkesalata-1200x500.jpg', 'Csirkesaláta olajbogyóval

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 400g sült csirkemell filét.
   - Ha nincs sülve, süsd meg előre.
   - Szeleteld vagy apróra darabold.
   - A daraboknak kb. 2-3 cm-eseknek kell lenniük.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 200g vegyes salátát.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel vagy centrifuga salátaszárítóval.
   - Tépd kisebbre, ha szükséges.

3. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.
   - Próbáld egyenletesen elosztani.

4. LÉPÉS - A csirkemell elhelyezése:
   - Helyezd rá a csirkemell szeleteket a salátára.
   - Próbáld úgy elosztani, hogy minden részén legyen csirke.

5. LÉPÉS - Az olajbogyó elhelyezése:
   - Szórd rá az 100g fekete olajbogyót.
   - Próbáld egyenletesen elosztani.
   - Az olajbogyó ad egy sós ízt.

6. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 paradicsomot, 1 uborkát és 1/2 piros paprikát.
   - Alaposan mosd meg mindegyiket.
   - A paradicsomot darabold kockákra.
   - Az uborkát szeleteld vékonyra.
   - A paprikát vágd csíkokra.

7. LÉPÉS - A zöldségek elhelyezése:
   - Szórd rá a paradicsomot, uborkát és paprikát a salátára.
   - Próbáld szépen elosztani.

8. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze a 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál balzsamikó ecetet.
   - Add hozzá az 1/2 citrom levét.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

9. LÉPÉS - Tálalás:
   - Öntsd meg az elkészült salátát a dresszinggel.
   - Keverd jól össze, hogy minden részén legyen dresszing.
   - Azonnal tálald frissen.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '200', NULL),
('400g hús (sertés/pulyka), 1 tojás, 100g liszt, 100g zsemlemorzsa, 400g burgonya, 500ml olaj (sütéshez), 2 uborka, 1 evőkanál ecet, 1 teáskanál cukor, só, bors', '25', 'foetel', 'nem', 'klasszikus', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiAvc-rlCnnReYpgME9cc7Oqg2HB8rDJ7CvcZgsRetZU_-T8lDH-D7pOG580Ml_PtO8NztZEldUtqIXHrAcxfaIzH-pGePYTse_G6ik3C1HWuR8i82050Q30NUz6Ky-ysbPT-7100CL5l0/s1600/2011.+augusztus+4.+366.jpg', 'Rántott hús sült krumplival és uborkasalátával

1. LÉPÉS - A hús előkészítése:
   - Vegyél elő 400g hústepsi vagy pulyka filét.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Nyomd vékonyra egy húsklopfolóval vagy késsel.
   - A húsnak kb. 1 cm vastagnak kell lennie.

2. LÉPÉS - A rántás előkészítése:
   - Készítsd elő három tálat: egyet a 100g lisztnek, egyet a felvert 1 tojásnak, és egyet a 100g morzsának.
   - A tojást verd fel egy villával vagy keverőgéppel.
   - A morzsát helyezd egy tálba.

3. LÉPÉS - A hús rántása:
   - Először rántsd be a húst a lisztbe, hogy minden részén legyen.
   - Utána rántsd be a felvert tojásba.
   - Végül rántsd be a morzsába.
   - Próbáld úgy, hogy minden részén legyen rántás.

4. LÉPÉS - A hús sütése:
   - Egy serpenyőben melegítsd fel a 500ml olajat.
   - Amikor forró, add hozzá a rántott hús darabokat.
   - Süsd 4-5 percig, amíg aranybarna lesz.
   - Fordítsd meg egyszer, hogy mindkét oldala szép legyen.
   - Tedd félre papírtörlőre, hogy lecsöpögjön a felesleges olaj.

5. LÉPÉS - A burgonya előkészítése:
   - Vegyél elő 400g burgonyát.
   - Hámozd meg és vágd felváló (félbe vagy negyedekre).
   - Alaposan mosd meg hideg vízben.

6. LÉPÉS - A burgonya sütése:
   - Egy tepsibe vagy serpenyőbe helyezd a burgonyát.
   - Süsd 180°C-on vagy serpenyőben, amíg ropogóssá válik.
   - Folyamatosan keverd, hogy ne égjen le.
   - A burgonyának aranybarnának kell lennie.

7. LÉPÉS - Az uborkasaláta előkészítése:
   - Vegyél elő 2 uborkát.
   - Alaposan mosd meg hideg vízben.
   - Vékonyra szeleteld.

8. LÉPÉS - Az uborkasaláta készítése:
   - Egy tálba helyezd az uborkaszeleteket.
   - Add hozzá az 1 evőkanál ecetet.
   - Add hozzá az 1 teáskanál cukrot.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.
   - Hagyd állni legalább 10 percig, hogy az ízek összeérjenek.

9. LÉPÉS - Tálalás:
   - Egy tányérra helyezd a rántott húst.
   - Helyezd mellé a sült krumplit.
   - Helyezd mellé az uborkasalátát.
   - Melegen fogyaszd azonnal.

TIPP: A rántott hús legjobb frissen sütve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '400', NULL),
('200g basmati rizs, 2 cukkini, 3 paradicsom, 1 fej vöröshagyma, 2 gerezd fokhagyma, 1 piros paprika, 400ml zöldségleves, 2 teáskanál olívaolaj, bazsalikom, só, bors', '22', 'foetel', 'nem', 'vegetáriánus', 'https://gastrohobbi.hu/wp-content/uploads/2022/08/IMG_8129.jpg', 'Zöldséges rizs cukkinivel és paradicsommal

1. LÉPÉS - A rizs előkészítése:
   - Vegyél elő 200g basmati rizst.
   - Alaposan mosd meg hideg vízben.
   - Szűrd le és hagyd lecsepegni.

2. LÉPÉS - A rizs pirítása:
   - Egy fazékban melegítsd fel egy kevés olívaolajat.
   - Add hozzá a rizst.
   - Pirítsd 2-3 percig, amíg átlátszó lesz.
   - Folyamatosan keverd, hogy ne égjen le.

3. LÉPÉS - A rizs főzése:
   - Öntsd fel a 400ml zöldséglevest.
   - Forrald fel.
   - Főzd 15-18 percig, amíg puha lesz.
   - Folyamatosan keverd, hogy ne ragadjon le.
   - Ha szükséges, adj hozzá még egy kevés vizet.

4. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.
   - A hagymának nagyon finomra kell vágva lennie.

5. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel a 2 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz és üveges.

6. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 2 cukkinit, 3 paradicsomdadogot és 1 piros paprikát.
   - Alaposan mosd meg mindegyiket.
   - A cukkinit és paprikát vágd kockákra (kb. 2-3 cm-esek).
   - A paradicsomdadogokat vágd kisebbre.

7. LÉPÉS - A zöldségek párolása:
   - Add hozzá a cukkinit és paprikát a hagymához.
   - Párold 5-6 percig, amíg megpuhulnak.
   - Folyamatosan keverd.

8. LÉPÉS - A paradicsom és bazsalikom hozzáadása:
   - Add hozzá a paradicsomdadogokat.
   - Add hozzá az 1 csokor bazsalikom levelet.
   - Főzd még 2-3 percig.

9. LÉPÉS - A rizs és zöldségek összekeverése:
   - Keverd össze az elkészült rizst a zöldségekkel.
   - Próbáld úgy, hogy minden részén legyen zöldség.

10. LÉPÉS - Fűszerezés:
    - Sózd és borsozz az ízlésed szerint.
    - Keverd jól össze.

11. LÉPÉS - Tálalás:
    - Melegen tálald egy tálba.
    - Ha szeretnéd, díszítsd még egy kevés bazsalikommal.
    - Azonnal fogyaszd melegen.

TIPP: A rizs legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '350', NULL),
('185g tonhal (konzerv), 150g vegyes saláta, 100g majonéz, 1 paradicsom, 1/2 uborka, 1/4 vöröshagyma, 1/2 citrom leve, só, bors', '15', 'foetel', 'nem', 'gyors', 'https://noihirek.hu/pictures/gasztro/majonezes_tonhalsalata_1.jpg', 'Majonézes tonhalsaláta

1. LÉPÉS - A tonhal előkészítése:
   - Vegyél elő 1 doboz (185g) tonhalt.
   - Nyisd ki a dobozt.
   - Csepegtesse le az olajból vagy sóból egy szűrőn.
   - Hagyd lecsepegni.
   - Ha szükséges, aprítsd kisebbre.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 150g vegyes salátát.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel vagy centrifuga salátaszárítóval.
   - Tépd kisebbre, ha szükséges.

3. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.
   - Próbáld egyenletesen elosztani.

4. LÉPÉS - A tonhal-majonéz keverék előkészítése:
   - Egy tálban keverd össze a tonhalt a 100g majonézzel.
   - Keverd jól össze, hogy minden részén legyen majonéz.
   - A keveréknek krémesnek kell lennie.

5. LÉPÉS - A tonhal-majonéz elhelyezése:
   - Helyezd rá a tonhal-majonéz keveréket a salátára.
   - Próbáld úgy elosztani, hogy minden részén legyen.

6. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 paradicsomot, 1/2 uborkát és 1/4 vöröshagymát.
   - Alaposan mosd meg mindegyiket.
   - A paradicsomot darabold kockákra.
   - Az uborkát szeleteld vékonyra.
   - A vöröshagymát vágd vékonyra vagy aprítsd finomra.

7. LÉPÉS - A zöldségek elhelyezése:
   - Szórd rá a paradicsomot, uborkát és vöröshagymát a salátára.
   - Próbáld szépen elosztani.

8. LÉPÉS - A citromlé hozzáadása:
   - Csepegtess rá 1/2 citrom levét a salátára.
   - Ez ad egy friss ízt.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Azonnal tálald frissen.
    - A saláta legjobb frissen készítve.
    - Ha szeretnéd, díszítsd még egy kevés citromszelettel.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '200', NULL),
('1 kifli vagy 2 szelet kenyér, 60g sonka, 50g gouda sajt, paradicsom szelet, salátalevél, 1 teáskanál majonéz, só, bors', '8', 'uzsonna', 'nem', 'gyors', 'https://eu-images.contentstack.com/v3/assets/blt8a8b3dccd7b97af6/blte1659a579eb24126/686fad70776c11ff3234d1ad/71ec9b22c6aab7aa9933_Toasted_ham_and_cheese_sandwich_595x450.jpg', 'Sajtos sonkás szendvics

1. LÉPÉS - A kenyér előkészítése:
   - Vegyél elő 1 kiflit vagy 2 szelet kenyeret.
   - Ha kiflit használsz, vágd hosszúságban ketté.
   - Ha kenyérszeleteket, készítsd elő mindkét szeletet.

2. LÉPÉS - A majonéz kenése:
   - Kend meg a kenyérszeleteket vagy kifli felét az 1 teáskanál majonézzel.
   - A kenésnek vékony rétegnek kell lennie.
   - Ez ad egy jó ízt és segít összetartani a szendvicset.

3. LÉPÉS - A sonka elhelyezése:
   - Helyezd rá a 60g sonka szeleteket a majonéz tetejére.
   - Próbáld úgy elosztani, hogy minden részén legyen sonka.
   - Ha a szeletek túl nagyok, hajlítsd be őket.

4. LÉPÉS - A sajt elhelyezése:
   - Helyezd rá a 50g gouda sajt szeleteket a sonka tetejére.
   - A sajt segít összetartani és ad egy jó ízt.
   - Próbáld úgy elosztani, hogy lefedje a sonkát.

5. LÉPÉS - A zöldségek hozzáadása:
   - Helyezd rá az 1 paradicsom szeletet a sajt tetejére.
   - Helyezd rá az 1 levél sálátát is.
   - Ez ad egy friss ízt és szép színt.

6. LÉPÉS - A szendvics összeállítása:
   - Tedd rá a másik kenyérszeletet vagy kifli felét a tetejére.
   - Nyomd össze egy kicsit, hogy jól összetapadjon.
   - Ha szükséges, egyenlítsd ki a széleit.

7. LÉPÉS - Melegítés (opcionális):
   - Ha szeretnéd, hogy a sajt megolvadjon, melegítsd meg serpenyőben 1-2 percig.
   - Vagy mikróban rövid ideig.
   - Figyeld, nehogy megégjen!

8. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.

9. LÉPÉS - Tálalás:
   - Azonnal tálald egy tányérra.
   - Ha melegítetted, azonnal fogyaszd, mert a legjobb íz melegen van.
   - Ha hidegen szeretnéd, azonnal fogyaszthatod.

TIPP: A szendvics legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '380', NULL),
('150ml görög joghurt, 50g granola, 30g szőlő, 1 teáskanál méz, 1 csipet vanília', '6', 'uzsonna', 'nem', 'egészséges', 'https://m.blog.hu/ga/gastrotherapy/image/mezes_alom_reggeli.png', 'Joghurt granolával

1. LÉPÉS - A pohár/tál előkészítése:
   - Vegyél elő egy szép poharat vagy tálat a tálaláshoz.
   - Győződj meg róla, hogy tiszta és száraz.
   - Ha átlátszó poharat használsz, szép rétegezést láthatsz.

2. LÉPÉS - Az első réteg - joghurt:
   - Öntsd bele a 150ml görög joghurtot az aljára.
   - A joghurtnak egyenletesen kell elterülnie.
   - Ha túl sűrű, keverd össze egy kanállal.

3. LÉPÉS - A második réteg - granola:
   - Szórd rá az 50g granolát a joghurt tetejére.
   - Próbáld egyenletesen elosztani.
   - A granola adja a crunch-t és az ízt.

4. LÉPÉS - A harmadik réteg - szőlő:
   - Helyezd rá a 30g szőlőt rétegként.
   - Próbáld szépen elosztani.
   - A szőlő ad egy friss ízt és szép színt.

5. LÉPÉS - A méz hozzáadása:
   - Csepegtess rá 1 teáskanál virágmézet a tetejére.
   - A méznek szép mintát kell alkotnia.
   - Próbáld egyenletesen elosztani.

6. LÉPÉS - A vanília hozzáadása:
   - Szórj rá 1 csipet vaníliát a tetejére.
   - Ez ad egy szép ízt és illatot.
   - Próbáld egyenletesen elosztani.

7. LÉPÉS - Tálalás:
   - Azonnal fogyaszd, hogy a granola crunch-je megmaradjon.
   - Ha túl sokáig hagyod, a granola megpuhul.
   - Egy kanállal fogyaszd, hogy minden réteget együtt egyél.

TIPP: A granola legjobb frissen, de ha szeretnéd, tárold hűtőbe és fogyaszd 1-2 órán belül!', 'none', 'nem', 'nem', '220', NULL),
('1 szelet magvas kenyér, 1 teáskanál vaj, 2 teáskanál lekvár, 1 csipet só', '7', 'uzsonna', 'nem', 'édes', 'https://i.pinimg.com/originals/8b/7a/cb/8b7acb654541129dee152fff1a92d047.jpg', 'Magvas kenyér vajjal és lekvárral

1. LÉPÉS - A kenyér előkészítése:
   - Vegyél elő 1 szelet magvas kenyeret.
   - Egy kenyérpirítót vagy serpenyőt használj a pirításhoz.
   - Pirítsd meg aranybarnára mindkét oldalát, kb. 2-3 percig mindkét oldalon.
   - Ha serpenyőben pirítasz, használj egy kevés vajat vagy olívaolajat.
   - A pirított kenyeret tedd félre egy tányérra.

2. LÉPÉS - A vaj kenése:
   - Várj egy kicsit, hogy a kenyér egy kicsit hűljön (de még meleg legyen).
   - Kend meg az 1 teáskanál vajon egyenletesen.
   - A vajnak meg kell olvadnia a meleg kenyéren.
   - A kenésnek vékony rétegnek kell lennie.

3. LÉPÉS - A lekvár hozzáadása:
   - Vigyél rá a 2 teáskanál lekvárt (eper, szilva vagy málna) egyenletesen a vaj tetejére.
   - Próbáld úgy elosztani, hogy minden részén legyen lekvár.
   - A lekvárnak vékony rétegnek kell lennie.

4. LÉPÉS - A só hozzáadása (opcionális):
   - Ha szeretnéd, szórj rá egy csipet sót a vajon.
   - Ez kiemeli az édességet.
   - Csak egy kevés kell, ne legyen túl sok.

5. LÉPÉS - Tálalás:
   - Azonnal tálald melegen egy tányérra.
   - A legjobb íz melegen van.
   - Ha szeretnéd, szolgáld fel egy pohár tejjel vagy kávéval.

TIPP: A kenyér legjobb frissen pirítva, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '200', NULL),
('1 tortilla, 150g sült csirkemell csíkok, 100g vegyes saláta, 50g tzatziki, 30g feta, 1/2 paradicsom, 1/4 uborka', '12', 'uzsonna', 'nem', 'trendy', 'https://www.maggi.hu/sites/default/files/srh_recipes/8dcc53267267b9ff0fb1e96d04ca28fc.png', 'Csirkés wrap salátával és tzatzikivel

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 150g sült csirkemell csíkokat.
   - Ha nincs sülve, süsd meg előre és vágd csíkokra.
   - A csíkoknak kb. 1-2 cm széleseknek kell lenniük.

2. LÉPÉS - A tortilla előkészítése:
   - Vegyél elő 1 tortilla lapot.
   - Helyezd egy lapos felületre.
   - Ha szükséges, melegítsd meg egy serpenyőben vagy mikróban rövid ideig.

3. LÉPÉS - A tzatziki kenése:
   - Vigyél rá a 50g tzatziki szószt vékony rétegként az egész felületre.
   - Próbáld úgy elosztani, hogy minden részén legyen szósz.
   - Hagyj kb. 2 cm szélt üresen mindkét oldalon.

4. LÉPÉS - A saláta elhelyezése:
   - Helyezd rá a 100g vegyes salátákat a tzatziki tetejére.
   - Próbáld úgy elosztani, hogy minden részén legyen saláta.
   - A saláta ad egy friss ízt és ropogósságot.

5. LÉPÉS - A csirkemell elhelyezése:
   - Helyezd rá a csirkemell csíkokat a saláta tetejére.
   - Próbáld úgy elosztani, hogy minden részén legyen csirke.

6. LÉPÉS - A sajt és zöldségek hozzáadása:
   - Szórd rá a 30g feta sajtot.
   - Helyezd rá az 1/2 paradicsom szeletet.
   - Helyezd rá az 1/4 uborka szeletet.
   - Próbáld szépen elosztani.

7. LÉPÉS - A wrap összehajtása:
   - A szélekről összehajtod a tortillát.
   - Óvatosan tekerd fel, hogy ne szivárogjon ki a töltés.
   - A széleket nyomd össze, hogy jól összetapadjon.

8. LÉPÉS - Tálalás:
   - Azonnal tálald egy tányérra.
   - Ha szeretnéd, vágd ketté átlósan.
   - Fogyaszd frissen.
   - Ha később szeretnéd fogyasztani, csomagold be fóliába.

TIPP: A wrap legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '200', NULL),
('150g főtt lencse, 100g vegyes saláta (spenót/rukkola), 1 paradicsom, 1/2 uborka, 1/4 piros paprika, 2 evőkanál olívaolaj, 1 evőkanál citromlé, 1 teáskanál кориander, só, bors', '15', 'uzsonna', 'nem', 'vegán', 'https://production.streetkitchen-cdn.com/a-legfinomabb-lencsesalata-2-scaled-y8qNvm.webp', 'Vegán lencse saláta

1. LÉPÉS - A lencse előkészítése:
   - Vegyél elő 150g főzött lencsét.
   - Ha nincs főzve, főzd meg előre sós vízben 20-25 percig.
   - Szűrd le és hagyd lecsepegni.
   - A lencsének puha, de még formájának meg kell maradnia.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 100g vegyes salátát (spenót, rucola).
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel vagy centrifuga salátaszárítóval.
   - Tépd kisebbre, ha szükséges.

3. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.
   - Próbáld egyenletesen elosztani.

4. LÉPÉS - A lencse elhelyezése:
   - Helyezd rá a főzött lencsét a salátára.
   - Próbáld úgy elosztani, hogy minden részén legyen lencse.

5. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 paradicsomot, 1/2 uborkát és 1/4 piros paprikát.
   - Alaposan mosd meg mindegyiket.
   - A paradicsomot darabold kockákra.
   - Az uborkát szeleteld vékonyra.
   - A paprikát vágd csíkokra.

6. LÉPÉS - A zöldségek elhelyezése:
   - Szórd rá a paradicsomot, uborkát és paprikát a salátára.
   - Próbáld szépen elosztani.

7. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze a 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál citrom levét.
   - Add hozzá az 1 teáskanál koriandert.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Öntsd meg az elkészült salátát a dresszinggel.
   - Keverd jól össze, hogy minden részén legyen dresszing.
   - Azonnal tálald frissen.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '200', NULL),
('150g humusz, 100g friss zöldség (répa/uborka/cseresznyeparadicsom), 2 szelet teljes kiőrlésű kenyér, 1 teáskanál olívaolaj, 1 csipet paprika', '10', 'uzsonna', 'nem', 'egészséges', 'https://image-api.nosalty.hu/nosalty/images/recipes/OW/tR/zoldfuszer-hummusz-szendvics.jpg?w=3000&fit=crop&s=e7f30791587f141a514a49dca3283adf', 'Humusz zöldséggel és kenyérrel

1. LÉPÉS - A humusz előkészítése:
   - Vegyél elő 150g humuszt.
   - Egy tálba helyezd a humuszt.
   - Kend el egy kanál segítségével, hogy szép legyen.

2. LÉPÉS - A humusz díszítése:
   - Csepegtess rá 1 teáskanál olívaolajat a tetejére.
   - Szórj rá 1 csipet paprikát a tetejére.
   - Ez ad egy szép színt és extra ízt.

3. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 100g friss zöldséget (sárgarépa, uborka, cseresznye paradicsom).
   - Alaposan mosd meg mindegyiket hideg vízben.
   - A sárgarépát vágd rudakba (kb. 5-7 cm hosszúak).
   - Az uborkát szeleteld vékonyra vagy rudakba.
   - A cseresznye paradicsomot felezd meg.

4. LÉPÉS - A kenyér előkészítése:
   - Vegyél elő 1 kenyérkockát vagy 2 szelet teljes kiőrlésű kenyeret.
   - Ha kenyérkockát, vágd kisebbre.
   - Ha kenyérszeleteket, vágd kockákra vagy hagyd szeletekben.

5. LÉPÉS - Tálalás:
   - Szervírozd az összes zöldséget és kenyérszeleteket a humusz mellett.
   - Próbáld szépen elrendezni.
   - Mártogass a humuszba és fogyaszd.
   - A zöldségek adnak egy friss ízt és ropogósságot.

TIPP: A humusz legjobb frissen, de tárolható hűtőben 3-5 napig!', 'none', 'nem', 'nem', '280', NULL),
('1 túrós zsemle, 1 teáskanál lekvár, 1 teáskanál méz (opcionális), 1 csipet fahéj', '8', 'uzsonna', 'nem', 'édes', 'https://image-api.nosalty.hu/nosalty/images/recipes/I4/QY/lekvaros-turos-toltott-zsomle.jpeg?w=1500&fit=crop&s=7ae7e4cb9a970113d260758665628dd9', 'Lekváros túrós zsemle

1. LÉPÉS - A zsemle előkészítése:
   - Vegyél elő 1 túrós zsemlét.
   - Egy éles késsel készíts egy vágást a zsemlébe.
   - Ne vágd teljesen ketté, csak nyisd ki.
   - A zsemlének nyitott formában kell lennie.

2. LÉPÉS - A lekvár hozzáadása:
   - Vigyél rá az 1 teáskanál lekvárt (eper vagy szilva) a zsemle tetejére.
   - Próbáld úgy elosztani, hogy minden részén legyen lekvár.
   - A lekvárnak vékony rétegnek kell lennie.

3. LÉPÉS - A méz hozzáadása (opcionális):
   - Ha szeretnéd, csepegtess rá 1 teáskanál mézet a lekvár tetejére.
   - Ez ad egy extra édességet.
   - Próbáld egyenletesen elosztani.

4. LÉPÉS - A fahéj hozzáadása:
   - Szórj rá 1 csipet fahéjat a tetejére.
   - Ez ad egy szép ízt és illatot.
   - Próbáld egyenletesen elosztani.

5. LÉPÉS - Tálalás:
   - Azonnal tálald melegen egy tányérra.
   - A zsemléhez egy pohár tej vagy kávé is jól passzol.
   - Fogyaszd frissen.

TIPP: A zsemle legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '245', NULL),
('30g sózott pörkölt nasi (chips), 1 pohár kefir vagy joghurt (opcionális)', '12', 'uzsonna', 'nem', 'pikáns', 'https://cdn.myshoptet.com/usr/www.vidammokus.hu/user/shop/big/1030_kesu-sul.jpg?6747749b', 'Sózott pörkölt nasi

1. LÉPÉS - A nasi előkészítése:
   - Vegyél elő 1 zsák (30g) sózott pörkölt nasit (chipeket).
   - Nyisd ki a zsákot.
   - Ha szeretnéd, öntsd egy tálba.
   - Vagy egyen közvetlenül a zsákból.

2. LÉPÉS - A kefir vagy joghurt előkészítése (opcionális):
   - Ha szeretnéd, önts egy pohár kefirt vagy joghurtot mellé kiegészítésnek.
   - Ez enyhíti a pikánciát.
   - A kefir vagy joghurt ad egy friss ízt.

3. LÉPÉS - Tálalás:
   - Csipegesd a nasit egyenként vagy kis adagokban.
   - Ha kefirt vagy joghurtot használsz, mártogass bele.
   - Friss és gyors uzsonna egy hirtelen nagy éhséghez.
   - Fogyaszd azonnal.

TIPP: A nasi legjobb frissen, de tárolható légmentesen zárható dobozban 1-2 hétig!', 'none', 'nem', 'nem', '200', NULL),
('150ml görög joghurt, 1 közepes alma, 1 teáskanál méz, 1/2 teáskanál fahéj, 1 csipet vaníliapor (opcionális)', '10', 'uzsonna', 'nem', 'finom', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhO9UuroC8HG0A42uT6zKJYJgzR2SvGNUu_iruAPETVxgjZ01AoziZW4d_HGBlhR0lud-Y0AONuGgkfND7L26Iz2-k6U5ZIV6uaB1V-WYZJ9bL6uF7CbOWvaI9U2ECgjrK6t6U3Bg6ZsFBQ/s1600/m%C3%A9zes+al%C3%A1s+joghurt+033.jpg', 'Almás joghurt mézzel és fahéjjal

1. LÉPÉS - Az alma előkészítése:
   - Vegyél elő 1 közepes almát.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg egy késsel vagy hámozóval (opcionális).
   - Vágd ki a magházat és a szárát.
   - Lereszeld vagy vágd felváló darabokra.
   - A daraboknak kb. 1-2 cm-eseknek kell lenniük.

2. LÉPÉS - A joghurt előkészítése:
   - Egy tálba helyezd a 150ml görög joghurtot.
   - Ha túl sűrű, keverd össze egy kanállal.
   - A joghurtnak krémesnek kell lennie.

3. LÉPÉS - Az alma hozzáadása:
   - Keverd bele az alma darabkákat a joghurtba.
   - Próbáld úgy, hogy minden részén legyen alma.
   - Keverd jól össze.

4. LÉPÉS - A méz hozzáadása:
   - Csepegtess rá 1 teáskanál virágmézet.
   - Keverd jól össze, hogy a méz egyenletesen el legyen osztva.
   - A méz adja az édességet.

5. LÉPÉS - A fahéj hozzáadása:
   - Szórj rá 1/2 teáskanál fahéjat.
   - Keverd jól össze.
   - A fahéj ad egy szép ízt és illatot.

6. LÉPÉS - A vaníliapor hozzáadása (opcionális):
   - Ha szeretnéd, szórj rá 1 csipet vaníliaport.
   - Keverd jól össze.
   - Ez ad egy extra ízt.

7. LÉPÉS - Tálalás:
   - Jól keverd össze az összes összetevőt.
   - Azonnal tálald hideg formában.
   - A legjobb íz hidegen van.

TIPP: A joghurt legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '220', NULL),
('300g lazac, 400g sütőtök, 2 teáskanál olívaolaj,  maréknyi rukkola, rozmaring, citrom, só, bors', '25', 'vacsora', 'nem', 'könnyű', 'https://4.bp.blogspot.com/-o9nL--3zcFU/VfK28jd5V1I/AAAAAAAAHsU/m_9wsNyJSYw/s1600/hal-sutotok.jpg', 'Lazac sütőtökkel és rukkolával

1. LÉPÉS - A sütőtök előkészítése:
   - Vegyél elő 400g sütőtököt.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg egy késsel vagy hámozóval.
   - Vágd ki a magházat és a szárát.
   - Vágd felváló (félbe vagy negyedekre).
   - Vágd kockákra (kb. 2-3 cm-esek).

2. LÉPÉS - A sütőtök fűszerezése:
   - Egy tálba helyezd a sütőtök kockákat.
   - Kend meg 1 teáskanál olívaolajjal.
   - Sózd és borsozz az ízlésed szerint.
   - Szórj rá 1/2 teáskanál rozmaringot.
   - Keverd jól össze.

3. LÉPÉS - A sütő előkészítése:
   - Előmelegítsd a sütőt 180°C-ra.
   - Egy sütőpapírral bélelt tepsibe terítsd el a sütőtök kockákat.
   - Tartsd kb. 2-3 cm távolságot közöttük.

4. LÉPÉS - A sütőtök első sütése:
   - Süsd 15 percig.
   - Közben fordítsd meg egyszer, hogy mindkét oldala szép legyen.
   - A sütőtöknek aranybarnának kell lennie.

5. LÉPÉS - A lazac előkészítése:
   - Vegyél elő 300g lazac filét.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Sózd és borsozd az ízlésed szerint.

6. LÉPÉS - A lazac elhelyezése:
   - Helyezd a lazac filét a tépsi másik felére.
   - Kend meg 1 teáskanál olívaolajjal.
   - Helyezz rá egy citromszeletet.
   - Szórj rá friss rozmaringot.
   - Sózd és borsozz.

7. LÉPÉS - A közös sütés:
   - Közösítsd a tépsi.
   - Süsd még 12-15 percig, amíg a lazac megsül.
   - Figyeld, nehogy túl süljön!
   - A lazacnak átsültnek, de még nedvesnek kell lennie.

8. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Helyezd mellé a sült sütőtököt.
   - Csepegtess rá még egy kevés citromlédből.
   - Azonnal fogyaszd melegen.

TIPP: A lazac legjobb közepesen sülve, ne legyen túl száraz!', 'none', 'nem', 'nem', '380', NULL);

INSERT INTO `receptek` (`hozzavalo`, `ido`, `meal`, `unnepi_etelek`, `kulonlegesseg`, `kepek`, `recept_hozzaadas`, `allergens`, `edes`, `sos`, `kaloria`, `felhasznalo_id`) VALUES
('1 liter zöldségleves, 100g sárgarépa, 100g burgonya, 100g brokkoli, 1 fej vöröshagyma, 2 gerezd fokhagyma, olívaolaj, 1 teáskanál kumin, só, bors', '30', 'vacsora', 'nem', 'könnyű', 'https://www.unileverfoodsolutions.hu/dam/global-ufs/mcos/see/hungary/calcmenu/recipes/HU-recipes/In-Development/z%C3%B6ldbors%C3%B3-leves-(7-10-%C3%A9ves-korcsoport-allerg%C3%A9nmentes-alappal)/main-header.jpg', 'Zöldségleves növényi alappal

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.
   - A hagymának nagyon finomra kell vágva lennie.

2. LÉPÉS - A hagyma pirítása:
   - Egy fazékban melegítsd fel a 100ml pálmaolajat vagy olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz és üveges.
   - Folyamatosan keverd, hogy ne égjen le.

3. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 100g sárgarépát, 100g burgonyát és 100g brokkolit.
   - Alaposan mosd meg mindegyiket hideg vízben.
   - Hámozd meg a sárgarépát és burgonyát.
   - Vágd kockákra (kb. 2-3 cm-esek).
   - A brokkolit fejtsd részekre.

4. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá az összes zöldséget a hagymához.
   - Szórd rá az 1 teáskanál kumint.
   - Keverd jól össze.

5. LÉPÉS - A leves hozzáadása:
   - Öntsd fel az 1 liter zöldséglevest.
   - Forrald fel.
   - Főzd 15-20 percig, amíg az összes zöldség puha lesz.
   - Folyamatosan keverd.

6. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

7. LÉPÉS - Tálalás:
   - Tálald forrón egy tálba.
   - Ha szeretnéd, díszítsd még egy kevés petrezselyemmel.
   - Azonnal fogyaszd melegen.

TIPP: A leves legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '180', NULL),
('400g gomba, 1 fej vöröshagyma, 2 gerezd fokhagyma, 2 teáskanál paprika, 100ml tejszín, 2 teáskanál olívaolaj, 200g nokedli, só, bors', '30', 'vacsora', 'nem', 'vegetáriánus', 'https://kep.index.hu/1/0/4005/40059/400596/40059659_25ec6f04b612034ea3741595f6ff87ba_wm.jpg', 'Gombapaprikás nokedlivel

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.
   - A hagymának nagyon finomra kell vágva lennie.

2. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel a 2 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz és üveges.

3. LÉPÉS - A gombák előkészítése:
   - Vegyél elő 400g vegyes gombát.
   - Alaposan tisztítsd meg hideg vízben.
   - Vágd le a szárát, ha szükséges.
   - Szeleteld fel (kb. 0,5 cm vastagok).

4. LÉPÉS - A gombák párolása:
   - Add hozzá a gombaszeleteket a hagymához.
   - Párold 8 percig, amíg levet eresztenek.
   - Folyamatosan keverd, hogy ne égjen le.
   - A gombáknak aranybarnának kell lenniük.

5. LÉPÉS - A paprika hozzáadása:
   - Szórd rá a 2 teáskanál paprikát.
   - Rögtön keverd össze, hogy ne égjen le.
   - Főzz még 1-2 percig.

6. LÉPÉS - A tejszín hozzáadása:
   - Öntsd fel a 100ml tejszínt.
   - Keverd össze.
   - Főzz még 3-4 percig.
   - A tejszín adja a krémes állagot.

7. LÉPÉS - A nokedli főzése (közben):
   - Egy fazékban forrald fel sós vizet.
   - Add hozzá a 200g nokedlit (friss vagy fagyasztott).
   - Főzd 8-10 percig, amíg fölötte lebegnek.
   - Szűrd le és hagyd lecsepegni.

8. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

9. LÉPÉS - Tálalás:
   - Egy tálba helyezz egy adag nokedlit.
   - Öntsd rá a gombapaprikást.
   - Melegen fogyaszd azonnal.

TIPP: A gombapaprikás legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '420', NULL),
('300g csirkemell, 300g cukkini, 2 teáskanál olívaolaj, 2 gerezd fokhagyma, 1 citrom (lé és héj), só, bors, 1 teáskanál oregánó', '22', 'vacsora', 'nem', 'könnyű', 'https://kep.cdn.index.hu/1/0/4949/49495/494953/49495398_3773062_b80c2553ba37f280b3c9effe75483bb9_wm.jpg', 'Sült csirkemell cukkinivel

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 300g csirkemell filét.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Vágd nagyobb darabokra (kb. 3-4 cm-esek).
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A cukkinni előkészítése:
   - Vegyél elő 300g cukkinit.
   - Alaposan mosd meg hideg vízben.
   - Vágd le a szárát és végét.
   - Szeleteld fel (kb. 0,5-1 cm vastagok).

3. LÉPÉS - A csirkemell sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá a 2 teáskanál olívaolajat.
   - Amikor az olaj meleg, add hozzá a csirkemell darabokat.
   - Pirítsd 4-5 percig, amíg megpírósodik.
   - Folyamatosan keverd, hogy ne égjen le.

4. LÉPÉS - A fokhagyma hozzáadása:
   - Add hozzá a 2 gerezd apróra vágott fokhagymát.
   - Forgass 30 másodpercig, amíg illatos lesz.
   - Figyeld, nehogy megégjen!

5. LÉPÉS - A cukkinni hozzáadása:
   - Add hozzá a cukkini szeleteket a csirkéhez.
   - Párold 5-6 percig, amíg puha lesz.
   - Folyamatosan keverd.

6. LÉPÉS - A fűszerek hozzáadása:
   - Az utolsó 2 percben szórd rá az 1 teáskanál origánót.
   - Add hozzá a citrom zeststet.
   - Csepegtess rá a citrom levét.
   - Keverd jól össze.

7. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Azonnal fogyaszd melegen.
   - Ha szeretnéd, díszítsd még egy kevés citromszelettel.

TIPP: A csirkemell legjobb frissen sütve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '350', NULL),
('300g hal, 100g sárgarépa, 100g brokkoli, 100g zöldpaprika, 1 fej vöröshagyma, 1 citrom, 200ml hal- vagy zöldségleves, 1 teáskanál olívaolaj, só, bors, petrezselyem', '20', 'vacsora', 'nem', 'könnyű', 'https://cdn.recipes.lidl/images/recipes/hu-HU/d7f47b2d-791d-4edd-a921-16dee1eb1e29/detail_1264x4941714748194_aromatizalt-lazac-1560x878.jpg', 'Párolt hal zöldséggel és citrommal

1. LÉPÉS - A hal előkészítése:
   - Vegyél elő 300g hallét (tonhal vagy fehér hal).
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 100g sárgarépát, 100g brokkolit és 100g zöldpaprikát.
   - Alaposan mosd meg mindegyiket hideg vízben.
   - A sárgarépát vágd csíkokra vagy kockákra.
   - A brokkolit fejtsd részekre.
   - A paprikát vágd csíkokra.

3. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát.
   - Hámozd meg és aprítsd finomra.

4. LÉPÉS - A hal és zöldségek elhelyezése:
   - Egy fazékba vagy párolóba helyezd a hallét.
   - Szórd rá a zöldségeket a hal körül.
   - Helyezd rá az apróra vágott vöröshagymát.
   - Helyezz rá egy citromszeletet.

5. LÉPÉS - A leves hozzáadása:
   - Öntsd fel a 200ml hal vagy zöldséglevest.
   - Fóliával fedj le.
   - Párolj 12-15 percig alacsony hőn.
   - A halnak átsültnek kell lennie.

6. LÉPÉS - A citromlé hozzáadása:
   - Az utolsó 2 percben csepegtess rá citrom levét.
   - Ez ad egy friss ízt.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Szórj rá 1 teáskanál friss petrezselymet.

8. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Helyezd mellé a zöldségeket.
   - Azonnal fogyaszd melegen.

TIPP: A hal legjobb frissen párolva, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '280', NULL),
('300g konzerv bab, 200g szalonna, 300g burgonya, 1 fej vöröshagyma, 2 gerezd fokhagyma, 1 teáskanál paprika, 500ml alaplé, só, bors', '35', 'vacsora', 'nem', 'rustic', 'https://kep.index.hu/1/0/4500/45003/450033/45003370_7c5e2ddd801104b00da00add68b6d51d_wm.jpg', 'Szalonnás bab krumplival

1. LÉPÉS - A szalonna előkészítése:
   - Vegyél elő 200g szalonnát.
   - Vágd fel kis darabkákra (kb. 1-2 cm-esek).

2. LÉPÉS - A szalonna pirítása:
   - Egy nagy fazékban pirítsd meg a szalonna darabokat 3-4 percig.
   - Amíg ropogóssá válik.
   - Folyamatosan keverd, hogy ne égjen le.
   - Tedd félre a zsírt, ha túl sok van.

3. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

4. LÉPÉS - A hagyma pirítása:
   - Add hozzá az apróra vágott hagymát és fokhagymát a szalonához.
   - Pirítsd még 2 percig, amíg illatos lesz.

5. LÉPÉS - A burgonya előkészítése:
   - Vegyél elő 300g burgonyát.
   - Hámozd meg és vágd kockákra (kb. 2-3 cm-esek).

6. LÉPÉS - A burgonya hozzáadása:
   - Add hozzá a burgonyát a szalonához.
   - Szórd rá az 1 teáskanál paprikát.
   - Keverd jól össze.

7. LÉPÉS - A leves hozzáadása:
   - Öntsd fel az 500ml babtisztító vagy húslevest.
   - Főzd 15 percig, amíg a burgonya puha lesz.
   - Folyamatosan keverd.

8. LÉPÉS - A bab hozzáadása:
   - Add hozzá a 300g konzerv babot (vagy friss főzött).
   - Főzz még 5 percig.
   - A babnak melegnek kell lennie.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Tálald forrón egy tálba.
    - Azonnal fogyaszd melegen.

TIPP: A bab legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '420', NULL),
('150g vegyes saláta, 100g gránátalmamag, 100g feta, 50g pirított napraforgómag, 2 evőkanál olívaolaj, 1 evőkanál balzsamecet, só, bors', '15', 'vacsora', 'nem', 'könnyű', 'https://mandimu.hu/cdn/shop/articles/salat-mit-quinoa-feta-und-granatapfel.jpg?v=1757691173&width=1600', 'Gránátalmás feta saláta

1. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 150g vegyes salátát (romana, spenót).
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel vagy centrifuga salátaszárítóval.
   - Tépd kisebbre, ha szükséges.

2. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.
   - Próbáld egyenletesen elosztani.

3. LÉPÉS - A gránátalmamag elhelyezése:
   - Szórd rá a 100g gránátalmamag szemeket egyenletesen.
   - Próbáld úgy elosztani, hogy minden részén legyen.
   - A gránátalmamag ad egy édes ízt és szép színt.

4. LÉPÉS - A feta sajt előkészítése:
   - Vegyél elő 100g feta sajtot.
   - Apróra zúzd vagy szeletekre vágd.
   - A sajtnak kb. 1-2 cm-es darabokra kell vágva lennie.

5. LÉPÉS - A feta sajt elhelyezése:
   - Szórd rá a feta sajt darabokat a salátára.
   - Próbáld szépen elosztani.
   - A sajt ad egy sós ízt.

6. LÉPÉS - A napraforgómag elhelyezése:
   - Szórd rá a 50g pirított napraforgómagot.
   - Próbáld egyenletesen elosztani.
   - A mag ad egy crunch-t.

7. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze a 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál balzsamikó ecetet.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Öntsd meg az elkészült salátát a dresszinggel.
   - Keverd jól össze, hogy minden részén legyen dresszing.
   - Azonnal tálald frissen.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '200', NULL),
('300g csirke, 200g csicsóka, 150g basmati rizs, 1 fej vöröshagyma, 2 gerezd fokhagyma, 1 teáskanál paprika, 300ml csirkealaplé, 2 teáskanál olívaolaj, só, bors', '25', 'vacsora', 'nem', 'paprikás', 'https://kep.index.hu/1/0/4063/40630/406304/40630453_3100541_a0d287b1576bae1df8b971ac196612fb_wm.jpg', 'Csicsókás csirke rizzsel

1. LÉPÉS - A rizs főzése:
   - Egy fazékban forrald fel sós vizet.
   - Add hozzá a 150g basmati rizst (szárazon).
   - Főzd 15-18 percig, amíg puha lesz.
   - Folyamatosan keverd, hogy ne ragadjon le.
   - Amikor kész, szűrd le és hagyd állni.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel a 2 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz és üveges.

4. LÉPÉS - A csirke előkészítése:
   - Vegyél elő 300g csirkecombot vagy szegyet.
   - Alaposan mosd meg hideg vízben.
   - Vágd nagyobb darabokra (kb. 3-4 cm-esek).
   - Sózd és borsozz az ízlésed szerint.

5. LÉPÉS - A csirke sütése:
   - Add hozzá a csirkés darabokat a hagymához.
   - Süsd 5-6 percig, amíg megpírósodik.
   - Folyamatosan keverd, hogy ne égjen le.

6. LÉPÉS - A paprika hozzáadása:
   - Szórd rá az 1 teáskanál paprikát.
   - Rögtön keverd össze, hogy ne égjen le.

7. LÉPÉS - A csicsóka előkészítése:
   - Vegyél elő 200g csicsókát.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg egy késsel vagy hámozóval.
   - Szeleteld fel (kb. 0,5-1 cm vastagok).

8. LÉPÉS - A csicsóka hozzáadása:
   - Add hozzá a csicsóka szeleteket a csirkéhez.
   - Keverd jól össze.

9. LÉPÉS - A leves hozzáadása:
   - Öntsd fel a 300ml csirketermelőt.
   - Főzz 12-15 percig szimmerizálva (alacsony lángon).
   - Folyamatosan keverd.
   - A csicsóka és csirke meg kell puhuljon.

10. LÉPÉS - Fűszerezés:
    - Sózd és borsozz az ízlésed szerint.
    - Keverd jól össze.

11. LÉPÉS - Tálalás:
    - Egy tálba helyezz egy adag rizst.
    - Öntsd rá a csicsókás csirkét.
    - Melegen fogyaszd azonnal.

TIPP: A csicsóka legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '350', NULL),
('300g tofu, 200g vegyes saláta, 1 paradicsom, 1/2 uborka, 1 piros paprika, 100g mangó, 2 teáskanál szójaszósz, 1 teáskanál ecet, 1 teáskanál rizsecet, 1 teáskanál méz', '18', 'vacsora', 'nem', 'vegán', 'https://i0.wp.com/zest.hu/wp-content/uploads/csipos-tofu-salata.jpg?fit=1015%2C724&ssl=1', 'Tofu saláta szójaszósszal

1. LÉPÉS - A tofu előkészítése:
   - Vegyél elő 300g szirózott tofut.
   - Szárítsd le papírtörlővel.
   - Vágd kockákra (kb. 2-3 cm-esek).

2. LÉPÉS - A tofu sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá egy kevés olívaolajat.
   - Add hozzá a tofu kockákat.
   - Süsd 5-6 percig, amíg aranybarna lesz.
   - Folyamatosan keverd, hogy ne égjen le.
   - Fordítsd meg egyszer, hogy mindkét oldala szép legyen.

3. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 200g vegyes salátát.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Tépd kisebbre, ha szükséges.

4. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.

5. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 paradicsomot, 1/2 uborkát, 1 piros paprikát és 100g mangót.
   - Alaposan mosd meg mindegyiket.
   - A paradicsomot darabold kockákra.
   - Az uborkát szeleteld vékonyra.
   - A paprikát vágd csíkokra.
   - A mangót vágd kockákra.

6. LÉPÉS - A zöldségek elhelyezése:
   - Szórd rá az összes zöldséget és gyümölcsöt a salátára.

7. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze a 2 teáskanál szójaszószt.
   - Add hozzá az 1 teáskanál szeszt.
   - Add hozzá az 1 teáskanál rizs ecetet.
   - Add hozzá az 1 teáskanál mézet.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Öntsd meg az elkészült salátát a dresszing felével.
   - Helyezd rá a sült tofu kockákat a saláta tetejére.
   - Öntsd rá a maradék dresszinget.
   - Azonnal tálald frissen.

TIPP: A tofu legjobb frissen sütve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '200', NULL),
('400g vegyes zöldség (paprika/cukkini/padlizsán/répa), 2 teáskanál olívaolaj, 1 teáskanál kumin, 1 teáskanál oregánó, 200g humusz, 2 szelet kenyér, só, bors', '22', 'vacsora', 'nem', 'könnyű', 'https://image-api.nosalty.hu/nosalty/images/recipes/Eq/Ls/sult-zeller-hummusz.jpg?w=6000&fit=crop&s=6ee255ecb4438e5ea07e58b0c1f1dcbd', 'Sült zöldségek humusszal és kenyérrel

1. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 400g vegyes zöldséget (paprika, cukkinni, padlizsán, sárgarépa).
   - Alaposan mosd meg mindegyiket hideg vízben.
   - Hámozd meg a padlizsánt és sárgarépát.
   - Vágd nagyobb darabokra vagy szeletekre (kb. 2-3 cm-esek).

2. LÉPÉS - A zöldségek fűszerezése:
   - Egy tálba helyezd az összes zöldséget.
   - Kend meg a 2 teáskanál olívaolajjal.
   - Szórd rá az 1 teáskanál kumint és 1 teáskanál oregánót.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

3. LÉPÉS - A sütés előkészítése:
   - Előmelegítsd a sütőt 200°C-ra.
   - Egy sütőpapírral bélelt tepsibe terítsd el a zöldségeket.
   - Tartsd kb. 2-3 cm távolságot közöttük.

4. LÉPÉS - A zöldségek sütése:
   - Süsd 20-25 percig, amíg puha és ropogós lesz.
   - Közben fordítsd meg egyszer, hogy mindkét oldala szép legyen.
   - A zöldségeknek aranybarnának kell lenniük.

5. LÉPÉS - A humusz előkészítése:
   - Egy tálba helyezd a 200g humuszt.
   - Kend el egy kanál segítségével.

6. LÉPÉS - A kenyér előkészítése:
   - Vegyél elő 2 szelet teljes kiőrlésű kenyeret.
   - Ha szeretnéd, pirítsd meg aranybarnára.

7. LÉPÉS - Tálalás:
   - Helyezd a humuszt egy tálba.
   - Szórd rá a sült zöldségeket.
   - Helyezd mellé a kenyeret.
   - Mártogass és fogyaszd.

TIPP: A zöldségek legjobb frissen sütve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '180', NULL),
('300g sült csirkemell, 200g vegyes saláta, 100g paradicsom, 50g uborka, 1 evőkanál balzsamecet, 1 teáskanál olívaolaj, só, bors, friss bazsalikom', '20', 'kalóriaszegény', 'nem', 'diet', 'https://kep.index.hu/1/0/3396/33961/339613/33961351_2600523_ee7beaf0f409a8b9540a134b8127f6dd_wm.jpg', 'Csirkemell saláta

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 300g sült csirkemell filét.
   - Ha nincs sülve, süsd meg előre.
   - Szeleteld vagy apróra darabold.
   - A daraboknak kb. 2-3 cm-eseknek kell lenniük.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 200g vegyes salátát (spenót, rucola, romana).
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Tépd kisebbre, ha szükséges.

3. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.

4. LÉPÉS - A csirkemell elhelyezése:
   - Helyezd rá a csirkemell szeleteket a salátára.

5. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 100g pomidvort és 50g uborkát.
   - Alaposan mosd meg mindegyiket.
   - A paradicsomot darabold kockákra.
   - Az uborkát szeleteld vékonyra.

6. LÉPÉS - A zöldségek elhelyezése:
   - Szórd rá a paradicsomot és uborkát a salátára.

7. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze az 1 evőkanál balzsamikó ecetet.
   - Add hozzá az 1 teáskanál olívaolajat.
   - Add hozzá az 1 teáskanál friss bazsalikomot.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Öntsd meg az elkészült salátát a dresszinggel.
   - Keverd jól össze.
   - Azonnal tálald frissen.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '200', NULL),
('150g brokkoli, 100g sárgarépa, 100g cukkini, 1 fej vöröshagyma, 1 citrom (lé és héj), 500ml víz, 1 teáskanál olívaolaj, só, bors, petrezselyem', '15', 'kalóriaszegény', 'nem', 'könnyű', 'https://lacorte.hu/wp53/wp-content/uploads/2021/08/paroltzold.jpg', 'Párolt zöldségek citrommal

1. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 150g brokkolit, 100g sárgarépát és 100g cukkinit.
   - Alaposan mosd meg mindegyiket hideg vízben.
   - A brokkolit fejtsd részekre.
   - A sárgarépát vágd csíkokra vagy kockákra.
   - A cukkinit szeleteld fel.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hagyma párolása:
   - Egy fazékban melegítsd fel az 1 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát.
   - Párold 1-2 percig, amíg illatos lesz.

4. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá az összes zöldséget a hagymához.
   - Öntsd fel az 500ml vizet.
   - Főzd 8-10 percig, amíg al dente maradnak.
   - Folyamatosan keverd.

5. LÉPÉS - A citrom hozzáadása:
   - Az utolsó 2 percben csepegtess rá citrom levét.
   - Szórj rá citrom zeststet.
   - Ez ad egy friss ízt.

6. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Szórj rá 1 teáskanál friss petrezselymet.

7. LÉPÉS - Tálalás:
   - Tálald hidegen vagy melegen ízléshez.
   - Azonnal fogyaszd.

TIPP: A zöldségek legjobb al dente állapotban, ne főzd túl!', 'none', 'nem', 'nem', '180', NULL),
('185g tonhal, 150g vegyes saláta, 100g light majonéz, 1 paradicsom, 1/2 uborka, 1/4 piros paprika, 1 citrom leve, só, bors', '10', 'kalóriaszegény', 'nem', 'gyors', 'https://kep.index.hu/1/0/4984/49840/498403/49840398_50853b9597184382e43c8795683d5e24_wm.jpg', 'Tonhalsaláta light majonézzel

1. LÉPÉS - A tonhal előkészítése:
   - Vegyél elő 1 doboz (185g) tonhalt.
   - Nyisd ki a dobozt.
   - Csepegtesse le az olajból vagy sóból egy szűrőn.
   - Hagyd lecsepegni.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 150g vegyes salátát (romana, spenót).
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Tépd kisebbre, ha szükséges.

3. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.

4. LÉPÉS - A tonhal-majonéz keverék előkészítése:
   - Egy tálban keverd össze a tonhalt a 100g light majonézzel.
   - Keverd jól össze.

5. LÉPÉS - A tonhal-majonéz elhelyezése:
   - Helyezd rá a tonhal-majonéz keveréket a salátára.

6. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 paradicsomot, 1/2 uborkát és 1/4 piros paprikát.
   - Alaposan mosd meg mindegyiket.
   - A paradicsomot darabold kockákra.
   - Az uborkát szeleteld vékonyra.
   - A paprikát vágd csíkokra.

7. LÉPÉS - A zöldségek elhelyezése:
   - Szórd rá a paradicsomot, uborkát és paprikát a salátára.

8. LÉPÉS - A citromlé hozzáadása:
   - Csepegtess rá 1 citrom levét.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Azonnal tálald frissen.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '200', NULL),
('300g csirkemell, 200g vegyes zöldség, 1 teáskanál olívaolaj, 2 gerezd fokhagyma, 1 teáskanál fűszerpaprika, 1 teáskanál oregánó, só, bors', '25', 'kalóriaszegény', 'nem', 'könnyű', 'https://www.tepszi.hu/wp-content/uploads/2016/03/P1230653.jpg', 'Roston csirkemell sült zöldségekkel

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 300g csirkemell filét.
   - Alaposan mosd meg hideg vízben.
   - Vágd nagyobb darabokra.
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 200g vegyes zöldséget (paprika, cukkinni, padlizsán).
   - Alaposan mosd meg mindegyiket.
   - Vágd nagyobb darabokra vagy szeletekre.

3. LÉPÉS - A csirkemell sütése:
   - Egy grillpanellaiban vagy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Helyezd rá a csirkés darabokat.
   - Süsd 5-6 percig mindkét oldalon, amíg megpírósodik.

4. LÉPÉS - A zöldségek és fokhagyma hozzáadása:
   - Az utolsó 3 percben add hozzá a zöldségeket.
   - Add hozzá az apróra vágott 2 gerezd fokhagymát.
   - Szórd rá az 1 teáskanál fűszerpaprikát és 1 teáskanál origánót.

5. LÉPÉS - Tálalás:
   - Tálald a roston csirkét a grillezett zöldségek mellett.
   - Melegen fogyaszd azonnal.

TIPP: A csirkemell legjobb frissen sütve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '350', NULL),
('300g cukkini, 2 paradicsom, 1 piros paprika, 1 fej vöröshagyma, 2 gerezd fokhagyma, 1 teáskanál paprika, 1 teáskanál olívaolaj, 100ml víz, só, bors, bazsalikom', '18', 'kalóriaszegény', 'nem', 'könnyű', 'https://kep.index.hu/1/0/4444/44444/444448/44444830_d8e6f349578f1ed2efd9d512b000ac23_wm.jpg', 'Paprikás cukkinni paradicsommal

1. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 300g cukkinit, 2 paradicsomot és 1 piros paprikát.
   - Alaposan mosd meg mindegyiket.
   - A cukkinit szeleteld vagy vágd kockákra.
   - A paradicsomot darabold.
   - A paprikát vágd csíkokra.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz.

4. LÉPÉS - A paprika hozzáadása:
   - Szórd rá az 1 teáskanál paprikát.
   - Rögtön keverd össze, hogy ne égjen le.

5. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá a cukkinit és paradicsomot.
   - Öntsd fel az 100ml vizet.
   - Főzd 10-12 percig szimmerizálva.

6. LÉPÉS - A bazsalikom hozzáadása:
   - Az utolsó 1 percben szórj rá 1 teáskanál friss bazsalikomot.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Azonnal fogyaszd melegen.

TIPP: A cukkinni legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '220', NULL),
('300g halfilé, 150g brokkoli, 100g sárgarépa, 1 citrom, 1 teáskanál olívaolaj, rozmaring, só, bors', '20', 'kalóriaszegény', 'nem', 'könnyű', 'https://ocdn.eu/images/pulscms/NmE7MDA_/554de011-feab-4f3b-b003-0d996b523f74.jpeg', 'Grillezett halfilé párolt zöldséggel

1. LÉPÉS - A hal előkészítése:
   - Vegyél elő 300g halfilét (lazac, tonhal vagy fehér hal).
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A hal grillezése:
   - Egy grillpanellaiban vagy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Helyezd rá a halfilét.
   - Helyezz rá friss rozmaringot és citrom szeletet.
   - Grillezd vagy pirítsd 4-5 percig mindkét oldalon.

3. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 150g brokkolit és 100g sárgarépát.
   - Alaposan mosd meg mindegyiket.
   - Apróra vagy egyenletes darabokra vágd.

4. LÉPÉS - A zöldségek párolása:
   - Egy fazékban forrald fel vizet.
   - Add hozzá a zöldségeket.
   - Párold 6-7 percig, amíg al dente maradnak.

5. LÉPÉS - A citromlé hozzáadása:
   - Az utolsó 1 percben csepegtess rá citrom levét.

6. LÉPÉS - Tálalás:
   - Tálald a grillezett halfilét a párolt zöldségek mellett.
   - Melegen fogyaszd azonnal.

TIPP: A hal legjobb frissen grillezve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '400', NULL),
('150g főtt lencse, 100g vegyes saláta, 1 paradicsom, 1/2 uborka, 50g sárgarépa, 1 evőkanál olívaolaj, 1 evőkanál balzsamecet, 1 teáskanál koriander, só, bors', '20', 'kalóriaszegény', 'nem', 'vegán', 'https://kep.index.hu/1/0/2910/29100/291009/29100903_c854e34c813807f7f1c7dfc86efbbcba_wm.jpg', 'Lencse saláta

1. LÉPÉS - A lencse előkészítése:
   - Vegyél elő 150g főzött lencsét.
   - Ha nincs főzve, főzd meg előre sós vízben 20-25 percig.
   - Szűrd le és hagyd lecsepegni.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 100g vegyes salátát (spenót, rucola).
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Tépd kisebbre, ha szükséges.

3. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.

4. LÉPÉS - A lencse elhelyezése:
   - Helyezd rá a főzött lencsét a salátára.

5. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 paradicsomot, 1/2 uborkát és 50g sárgarépát.
   - Alaposan mosd meg mindegyiket.
   - A paradicsomot darabold kockákra.
   - Az uborkát szeleteld vékonyra.
   - A sárgarépát lereszeld.

6. LÉPÉS - A zöldségek elhelyezése:
   - Szórd rá a paradicsomot, uborkát és sárgarépát a salátára.

7. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze az 1 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál balzsamikó ecetet.
   - Add hozzá az 1 teáskanál koriandert.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Öntsd meg az elkészült salátát a dresszinggel.
   - Keverd jól össze.
   - Azonnal tálald frissen.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '200', NULL),
('300g csirkecomb (bőr nélkül), 300g cukkini, 1 piros paprika, 1 fej vöröshagyma, 2 gerezd fokhagyma, 1 teáskanál paprika, 1 teáskanál olívaolaj, 100ml csirkealaplé, só, bors', '22', 'kalóriaszegény', 'nem', 'könnyű', 'https://img-global.cpcdn.com/recipes/a043117088d4aab6/680x781f0.5_0.5_1.0q80/csirkecombok-cukkinivel-low-carb-recept-foto.jpg', 'Csirkecomb cukkinivel és paprikával

1. LÉPÉS - A csirkecomb előkészítése:
   - Vegyél elő 300g csirkecombot (bőr nélkül).
   - Alaposan mosd meg hideg vízben.
   - Vágd nagyobb darabokra.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz.

4. LÉPÉS - A csirkecomb sütése:
   - Add hozzá a csirkés darabokat.
   - Süsd 5-6 percig, amíg megpírósodik.

5. LÉPÉS - A paprika hozzáadása:
   - Szórd rá az 1 teáskanál paprikát.
   - Rögtön keverd össze.

6. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 300g cukkinit és 1 piros paprikát.
   - Alaposan mosd meg mindegyiket.
   - A cukkinit szeleteld fel.
   - A paprikát vágd csíkokra.

7. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá a cukkinit és paprikát a csirkéhez.
   - Öntsd fel az 100ml csirketermelőt.
   - Főzz 10-12 percig szimmerizálva.

8. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

9. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Azonnal fogyaszd melegen.

TIPP: A csirkecomb legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '350', NULL),
('300g vegyes zöldség, 1 fej vöröshagyma, 2 gerezd fokhagyma, 1 teáskanál paprika, 1 teáskanál olívaolaj, 200ml zöldségleves, só, bors, erős paprika (opcionális)', '25', 'kalóriaszegény', 'nem', 'könnyű', 'https://image-api.nosalty.hu/nosalty/images/articles/1v/OI/cg1kmxNFy3AbUGZeT4xe84BkkVU9qQ4hl4eYDrW7.jpeg?w=1200&h=1200&s=973401aeb3e6a72eb5e064b4e68ac175', 'Zöldség pörkölt

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

2. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz.

3. LÉPÉS - A paprika hozzáadása:
   - Szórd rá az 1 teáskanál paprikát.
   - Rögtön keverd össze, hogy ne égjen le.

4. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 300g vegyes zöldséget (paprika, cukkinni, paradicsom, sárgarépa).
   - Alaposan mosd meg mindegyiket.
   - Vágd nagyobb darabokra.

5. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá a zöldségeket a hagymához.
   - Öntsd fel a 200ml zöldséglevest.
   - Főzz 12-15 percig szimmerizálva.

6. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Opcionálisan szórj rá 1 csipet erős paprikát.
   - Keverd jól össze.

7. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Azonnal fogyaszd melegen.

TIPP: A pörkölt legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '180', NULL),
('250ml víz vagy mandulatej, 30g protein por, 1 fagyasztott banán, 1 teáskanál kókuszolaj (opcionális), 1 csipet fahéj', '5', 'kalóriaszegény', 'nem', 'gyors', 'https://muscleandfitness.hu/images/peanut-butter-banana.jpg', 'Fehérjés smoothie

1. LÉPÉS - A banán előkészítése:
   - Vegyél elő 1 banánt (fagyasztott).
   - Ha nincs megfagyasztva, fagyaszd be legalább 2-3 órára előre.
   - Szeleteld fel nagyobb darabokra.

2. LÉPÉS - A turmixgép előkészítése:
   - Vegyél elő egy turmixgépet vagy botmixert.
   - Győződj meg róla, hogy tiszta és száraz.

3. LÉPÉS - Az összetevők hozzáadása:
   - Öntsd bele a 250ml vizet vagy mandulatejet.
   - Add hozzá az 1 adag (30g) vaníliás protein port.
   - Tedd bele a fagyasztott banán darabokat.

4. LÉPÉS - A turmixolás:
   - Turmixold 1-2 percig, amíg teljes és sima nem lesz.

5. LÉPÉS - A kiegészítők hozzáadása (opcionális):
   - Ha szeretnéd, add hozzá az 1 teáskanál kókusz olajat.
   - Szórj rá 1 csipet fahéjat.
   - Turmixold újra 10 másodpercig.

6. LÉPÉS - Tálalás:
   - Egy pohárba öntsd a turmixot.
   - Azonnal fogyaszd.

TIPP: A smoothie legjobb frissen készítve, de tárolható hűtőbe és fogyaszd 1-2 órán belül!', 'none', 'nem', 'nem', '180', NULL),
('300g csirkemell, 150g quinoa (szárazon), 200g vegyes zöldség, 1 fej vöröshagyma, 2 gerezd fokhagyma, 1 teáskanál olívaolaj, 300ml csirkealaplé, só, bors, 1 teáskanál oregánó', '25', 'proteindús', 'nem', 'sportolónak', 'https://www.ceruzabab.hu/wp-content/uploads/2020/05/qionoas-csirke-1.jpg', 'Quinoás csirkemell zöldséggel

1. LÉPÉS - A quinoa főzése:
   - Egy fazékban főzd a 150g quinoát a 300ml csirketermelőben.
   - Főzd 15-18 percig, amíg puha lesz.
   - Folyamatosan keverd, hogy ne ragadjon le.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz.

4. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 300g csirkemell filét.
   - Alaposan mosd meg hideg vízben.
   - Vágd kockákra.

5. LÉPÉS - A csirkemell sütése:
   - Add hozzá a csirkés kockákat a hagymához.
   - Süsd 6-7 percig, amíg megpírósodik.

6. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 200g vegyes zöldséget (paprika, brokkoli, sárgarépa).
   - Alaposan mosd meg mindegyiket.
   - Apróra vagy egyenletes darabokra vágd.

7. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá a zöldségeket a csirkéhez.
   - Főzz még 5-6 percig.
   - Szórd rá az 1 teáskanál oregánót.

8. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

9. LÉPÉS - Tálalás:
   - Egy tálba helyezz egy adag quinoát.
   - Helyezd rá a csirkés zöldség keveréket.
   - Melegen fogyaszd azonnal.

TIPP: A quinoa legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '350', NULL);

INSERT INTO `receptek` (`hozzavalo`, `ido`, `meal`, `unnepi_etelek`, `kulonlegesseg`, `kepek`, `recept_hozzaadas`, `allergens`, `edes`, `sos`, `kaloria`, `felhasznalo_id`) VALUES
('400g marhasteak, 300g sütőtök, 200g spenót (vagy zöld köret), 2 gerezd fokhagyma, rozmaring, 1 teáskanál olívaolaj, só, bors, 100ml tejszín (körethez)', '35', 'proteindús', 'nem', 'klasszikus', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFIEry4lNoXLOpxrXYVUQm-daj-MZcYg38TQ&s', 'Sült marhahús sütőtökkel és zöld főzelékkel

1. LÉPÉS - A sütőtök előkészítése:
   - Vegyél elő 300g sütőtököt.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg és vágd kockákra.

2. LÉPÉS - A sütőtök fűszerezése:
   - Egy tálba helyezd a sütőtök kockákat.
   - Kend meg az 1 teáskanál olívaolaj felével.
   - Sózd és borsozz.
   - Szórd rá rozmaringot.

3. LÉPÉS - A sütőtök sütése:
   - Előmelegítsd a sütőt 180°C-ra.
   - Egy sütőpapírral bélelt tepsibe terítsd el a sütőtök kockákat.
   - Süsd 15-20 percig.

4. LÉPÉS - A marhahús előkészítése:
   - Vegyél elő 400g marhahús steaket.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Sózd és borsozz az ízlésed szerint.

5. LÉPÉS - A marhahús sütése:
   - Egy grillpanellaiban vagy serpenyőben sütögesd 3-4 percig mindkét oldalon.
   - A húsnak közepesen sültnek kell lennie.

6. LÉPÉS - A spenót előkészítése:
   - Vegyél elő 200g spenótot vagy más zöld főzeléket.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.

7. LÉPÉS - A spenót sütése:
   - Egy serpenyőben pirítsd meg a spenótot.
   - Öntsd fel a 100ml tejszínt.
   - Főzz 3-4 percig.

8. LÉPÉS - Tálalás:
   - Tálald a sült marhahúst a sütőtök és zöld főzelék mellett.
   - Melegen fogyaszd azonnal.

TIPP: A marhahús legjobb közepesen sülve, ne legyen túl száraz!', 'none', 'nem', 'nem', '400', NULL),
('300g tonhal, 150g basmati rizs (szárazon), 50g zöldség (brokkoli/sárgarépa), 1 paradicsom, 1 teáskanál olívaolaj, 1 teáskanál szójaszósz, 1 citrom leve', '15', 'proteindús', 'nem', 'gyors', 'https://manomenu.hu/wp-content/uploads/2021/07/tonhalas-rizs-buzas-gabriella.jpg', 'Tonhal rizzsel

1. LÉPÉS - A rizs főzése:
   - Egy fazékban forrald fel sós vizet.
   - Add hozzá a 150g basmati rizst (szárazon).
   - Főzd 15-18 percig, amíg puha lesz.
   - Szűrd le és hagyd állni.

2. LÉPÉS - A tonhal előkészítése:
   - Vegyél elő 300g friss vagy konzervált tonhalt.
   - Ha friss, alaposan mosd meg hideg vízben.
   - Ha konzervált, csepegtesse le az olajból.

3. LÉPÉS - A tonhal sütése:
   - Egy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Ha friss tonhal, süsd 4-5 percig mindkét oldalon.
   - Ha konzervált, csak melegítsd meg.

4. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 50g zöldséget (brokkoli, sárgarépa).
   - Alaposan mosd meg mindegyiket.
   - Apróra vágd.

5. LÉPÉS - A zöldségek párolása:
   - Egy fazékban forrald fel vizet.
   - Add hozzá a zöldségeket.
   - Párold 5-6 percig, amíg al dente maradnak.

6. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 1 paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Darabold kockákra.

7. LÉPÉS - Tálalás:
   - Egy tálba helyezz egy adag rizst.
   - Helyezd rá az elkészült tonhalat.
   - Helyezd mellé a párolt zöldségeket.
   - Csepegtess rá 1 teáskanál szójaszószt és 1 citrom levét.
   - Melegen fogyaszd azonnal.

TIPP: A tonhal legjobb frissen sütve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '280', NULL),
('300g lazac, 200g csicsóka, 150g vegyes saláta, 1 paradicsom, 1/2 uborka, 1 teáskanál olívaolaj, 1 teáskanál bazsalikomos olívaolaj, 1 citrom, só, bors', '20', 'proteindús', 'nem', 'szép', 'https://image-api.nosalty.hu/nosalty/images/recipes/Fc/fk/grillezett-lazac-zoldsegekkel.jpeg?w=6000&fit=crop&s=c094ff2cbaf8a275651b9abb67101465', 'Grillezett csicsóka lazaccal és zöldséggel

1. LÉPÉS - A csicsóka előkészítése:
   - Vegyél elő 200g csicsókát.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg egy késsel vagy hámozóval.
   - Szeleteld fel (kb. 0,5-1 cm vastagok).

2. LÉPÉS - A csicsóka grillezése:
   - Egy grillpanellaiban vagy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Helyezd rá a csicsóka szeleteket.
   - Grillezd 3-4 percig mindkét oldalon, amíg aranybarna lesz.

3. LÉPÉS - A lazac előkészítése:
   - Vegyél elő 300g lazac filét.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Sózd és borsozz az ízlésed szerint.

4. LÉPÉS - A lazac grillezése:
   - Helyezd rá a lazac filét a grillpanellaira vagy serpenyőbe.
   - Grillezd 4-5 percig mindkét oldalon.
   - Figyeld, nehogy túl süljön!

5. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 150g vegyes salátát.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Tépd kisebbre, ha szükséges.

6. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 paradicsomot és 1/2 uborkát.
   - Alaposan mosd meg mindegyiket.
   - A paradicsomot darabold kockákra.
   - Az uborkát szeleteld vékonyra.

7. LÉPÉS - A saláta összeállítása:
   - Egy tálba helyezd a salátákat alapként.
   - Add hozzá a paradicsomot és uborkát.

8. LÉPÉS - Tálalás:
   - Helyezd rá a grillezett csicsóka szeleteket és lazac filét a saláta tetejére.
   - Csepegtess rá az 1 teáskanál bazsalikomos olívaolajat és citrom levét.
   - Azonnal fogyaszd frissen.

TIPP: A lazac legjobb közepesen grillezve, ne legyen túl száraz!', 'none', 'nem', 'nem', '400', NULL),
('200g főtt csicseriborsó, 100g vegyes saláta, 1 paradicsom, 1/2 uborka, 50g feta, 50g pirított napraforgómag, 1 evőkanál olívaolaj, 1 evőkanál citromlé, 1/2 teáskanál кориander, só, bors', '12', 'proteindús', 'nem', 'vegán', 'https://kep.index.hu/1/0/6210/62107/621073/62107311_5a7d0e476dbb8688fe0a181a46604870_wm.jpg', 'Csicseriborsó saláta

1. LÉPÉS - A csicseriborsó előkészítése:
   - Vegyél elő 200g főzött csicseriborsót.
   - Ha nincs főzve, főzd meg előre sós vízben 20-25 percig.
   - Szűrd le és hagyd lecsepegni.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 100g vegyes salátát (spenót, rucola).
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Tépd kisebbre, ha szükséges.

3. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.

4. LÉPÉS - A csicseriborsó elhelyezése:
   - Helyezd rá a főzött csicseriborsót a salátára.

5. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 paradicsomot és 1/2 uborkát.
   - Alaposan mosd meg mindegyiket.
   - A paradicsomot darabold kockákra.
   - Az uborkát szeleteld vékonyra.

6. LÉPÉS - A zöldségek elhelyezése:
   - Szórd rá a paradicsomot és uborkát a salátára.

7. LÉPÉS - A feta sajt előkészítése:
   - Vegyél elő 50g feta sajtot.
   - Apróra zúzd vagy szeletekre vágd.

8. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze az 1 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál citrom levét.
   - Add hozzá az 1/2 teáskanál koriandert.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

9. LÉPÉS - Tálalás:
   - Öntsd meg az elkészült salátát a dresszinggel.
   - Szórd rá az 50g pirított napraforgómagot és 50g feta sajtot.
   - Keverd jól össze.
   - Azonnal tálald frissen.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '200', NULL),
('300g tonhal, 150g quinoa (szárazon), 100g vegyes zöldség, 50g avokádó, 1 evőkanál szójaszósz, 1 teáskanál ecet, 1 teáskanál rizsecet, 1 teáskanál méz, 1 teáskanál olívaolaj', '20', 'proteindús', 'nem', 'tenger', 'https://i.redd.it/9x86ps7ctkze1.jpeg', 'Tonhal quinoa tál

1. LÉPÉS - A quinoa főzése:
   - Egy fazékban forrald fel sós vizet.
   - Add hozzá a 150g quinoát (szárazon).
   - Főzd 15-18 percig, amíg puha lesz.
   - Szűrd le és hagyd állni.

2. LÉPÉS - A tonhal előkészítése:
   - Vegyél elő 300g friss tonhalt.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Sózd és borsozz az ízlésed szerint.

3. LÉPÉS - A tonhal sütése:
   - Egy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Helyezd rá a tonhalat.
   - Süsd 4-5 percig mindkét oldalon.

4. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 100g vegyes zöldséget.
   - Alaposan mosd meg mindegyiket.
   - Apróra vágd.

5. LÉPÉS - A zöldségek párolása:
   - Egy fazékban forrald fel vizet.
   - Add hozzá a zöldségeket.
   - Párold 3-4 percig, amíg al dente maradnak.

6. LÉPÉS - Az avokádó előkészítése:
   - Vegyél elő 50g avokádót.
   - Hámozd meg és szeleteld fel.

7. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze az 1 evőkanál szójaszószt.
   - Add hozzá az 1 teáskanál szeszt.
   - Add hozzá az 1 teáskanál rizs ecetet.
   - Add hozzá az 1 teáskanál mézet.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Egy tálba helyezz egy adag quinoát alapként.
   - Helyezd rá az elkészült tonhalat.
   - Helyezd mellé a párolt zöldségeket.
   - Helyezd rá az avokádó szeleteket.
   - Öntsd meg a dresszinggel.
   - Melegen fogyaszd azonnal.

TIPP: A quinoa tál legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '300', NULL),
('400g sovány marhahús, 2 gerezd fokhagyma, 1 teáskanál olívaolaj, 1 teáskanál fűszerpaprika, 100g californiai paprika, 100g cukkini, 1 teáskanál oregánó, só, bors', '30', 'proteindús', 'nem', 'sült', 'https://kep.index.hu/1/0/3137/31372/313729/31372913_177be4ac3f6c7d946b25461f604a4a04_wm.jpg', 'Fűszeres marhaszelet vele sült zöldségekkel

1. LÉPÉS - A marhahús előkészítése:
   - Vegyél elő 400g sovány marhahúst.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Vágd nagyobb darabokra.
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A marhahús sütése:
   - Egy grillpanellaiban vagy serpenyőben melegítsd fel az 1 teáskanál olívaolajat.
   - Helyezd rá a marhahús darabokat.
   - Süsd 5-6 percig mindkét oldalon, amíg megpírósodik.

3. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 200g vegyes zöldséget (paprika, cukkinni, sárgarépa).
   - Alaposan mosd meg mindegyiket.
   - Szeleteld vagy vágd csíkokra.

4. LÉPÉS - A zöldségek hozzáadása:
   - Az utolsó 5 percben add hozzá a zöldségeket a húshoz.
   - Párold, amíg megpuhulnak.

5. LÉPÉS - A fűszerek hozzáadása:
   - Szórd rá az apróra vágott 2 gerezd fokhagymát.
   - Szórd rá az 1 teáskanál fűszerpaprikát.
   - Szórd rá az 1 teáskanál origánót.
   - Keverd jól össze.

6. LÉPÉS - Tálalás:
   - Tálald a sült marhahúst a párolt zöldségek mellett.
   - Melegen fogyaszd azonnal.

TIPP: A marhahús legjobb közepesen sülve, ne legyen túl száraz!', 'none', 'nem', 'nem', '180', NULL),
('3 főtt tojás, 1 érett avokádó, 100g vegyes saláta, 50g rukkola, 1 paradicsom, 50g csicseriborsó (opcionális), 1 evőkanál olívaolaj, 1 evőkanál citromlé, só, bors, 1 csipet vörös paprika', '10', 'proteindús', 'nem', 'reggeli', 'https://kep.index.hu/1/0/5392/53922/539228/53922875_3981775_53ba0a349dba8f7cfc50a82e6974d6b8_wm.jpg', 'Tojásos avokádó tál

1. LÉPÉS - A tojások főzése:
   - Egy fazékban forrald fel vizet.
   - Tedd bele a 3 tojást.
   - Főzd 8-10 percig, amíg keményre fő.
   - Hagyd lehűlni, majd hámozd meg.
   - Felváló és szeleteld fel.

2. LÉPÉS - Az avokádó előkészítése:
   - Vegyél elő 1 érett avokádót.
   - Hámozd meg és szeleteld fel.

3. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 100g vegyes salátát és 50g rucolát.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Tépd kisebbre, ha szükséges.

4. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.

5. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Darabold kockákra.

6. LÉPÉS - A csicseriborsó előkészítése (opcionális):
   - Ha szeretnéd, vegyél elő 50g csicseriborsót.
   - Főzd meg előre vagy használj konzerváltat.

7. LÉPÉS - A tál összeállítása:
   - Helyezd el szépséges módon a paradicsomot és avokádó szeleteket.
   - Helyezd rá a felváló tojás szeleteket az avokádó mellé.
   - Opcionálisan szórd rá a csicseriborsót.

8. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze az 1 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál citrom levét.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

9. LÉPÉS - Tálalás:
   - Öntsd meg az elkészült tálon a dresszinggel.
   - Szórd rá 1 csipet vörös paprikát.
   - Azonnal tálald frissen.

TIPP: A tál legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '450', NULL),
('250ml görög joghurt, 30g fehérjepor, 1 fagyasztott banán, 30g mandulaosvaj, 1 evőkanál kakaó nibs (opcionális), 1 csipet fahéj', '5', 'proteindús', 'nem', 'ital', 'https://hips.hearstapps.com/hmg-prod/images/flax-protein-shake-1024x682-642f1ed239f60.jpeg?crop=0.536xw:1.00xh;0.423xw,0', 'Protein smoothie

1. LÉPÉS - A banán előkészítése:
   - Vegyél elő 1 banánt (fagyasztott).
   - Ha nincs megfagyasztva, fagyaszd be legalább 2-3 órára előre.
   - Szeleteld fel nagyobb darabokra.

2. LÉPÉS - A turmixgép előkészítése:
   - Vegyél elő egy turmixgépet vagy botmixert.
   - Győződj meg róla, hogy tiszta és száraz.

3. LÉPÉS - Az összetevők hozzáadása:
   - Öntsd bele a 250ml görög joghurtot.
   - Add hozzá az 1 adag (30g) fehérjeport (vaníliás vagy csokoládés).
   - Tedd bele a fagyasztott banán darabokat.

4. LÉPÉS - A turmixolás:
   - Turmixold 1-2 percig, amíg teljes és sima nem lesz.

5. LÉPÉS - A kiegészítők hozzáadása:
   - Add hozzá a 30g mandulaösvajat.
   - Add hozzá az 1 evőkanál kakaó nibset (opcionális).
   - Turmixold újra 20-30 másodpercig.

6. LÉPÉS - A fahéj hozzáadása:
   - Szórj rá 1 csipet fahéjat.
   - Keverd jól össze.

7. LÉPÉS - Tálalás:
   - Egy magas pohárba öntsd a turmixot.
   - Azonnal fogyaszd.
   - Ez egy kiváló edzés utáni protein koktél.

TIPP: A smoothie legjobb frissen készítve, de tárolható hűtőbe és fogyaszd 1-2 órán belül!', 'none', 'nem', 'nem', '180', NULL),
('400g csirkecomb vagy csirkemell, 100g zöld olajbogyó, 100g fekete olajbogyó, 1 paradicsom, 100g füstölt paprika szósz (vagy arrabbiata), 2 gerezd fokhagyma, 1 teáskanál olívaolaj, 1 teáskanál oregánó, só, bors', '35', 'proteindús', 'nem', 'különleges', 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=600&q=80', 'Sült csirke mediterrán módra

1. LÉPÉS - A csirke előkészítése:
   - Vegyél elő 400g csirkecombot vagy szegyet.
   - Alaposan mosd meg hideg vízben.
   - Vágd nagyobb darabokra.
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A csirke sütése:
   - Egy nagyobb fazékban vagy sütő edényben melegítsd fel az 1 teáskanál olívaolajat.
   - Helyezd rá a csirkés darabokat.
   - Süsd 6-7 percig mindkét oldalon, amíg megpírósodik.

3. LÉPÉS - A fokhagyma hozzáadása:
   - Szórd rá az apróra vágott 2 gerezd fokhagymát.
   - Forgass 30 másodpercig.

4. LÉPÉS - Az olajbogyó hozzáadása:
   - Add hozzá az 100g zöld és 100g fekete olajbogyót.
   - Keverd jól össze.

5. LÉPÉS - A szósz hozzáadása:
   - Add hozzá a 100g füstölt paprika szószt vagy arrabiatát.
   - Keverd jól össze.

6. LÉPÉS - A paradicsom hozzáadása:
   - Vegyél elő 1 paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Szeleteld fel.
   - Add hozzá a keverékhez.

7. LÉPÉS - A fűszerek hozzáadása:
   - Szórd rá az 1 teáskanál oregánót.
   - Keverd jól össze.

8. LÉPÉS - A sütés befejezése:
   - Fedő alatt süss 15-20 percig, amíg az összes komponens elkeveredik.
   - Folyamatosan keverd.

9. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Esetleg rizzsel vagy kenyérrel mellékelve.
   - Azonnal fogyaszd melegen.

TIPP: A csirke legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '350', NULL),
('500g csirkemell filé, 2 teáskanál olívaolaj, 2 gerezd fokhagyma, 1 teáskanál fűszerpaprika, 1 teáskanál oregánó, só, bors, 1 citrom', '25', 'foetel', 'nem', 'klasszikus', 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?q=80&w=600', 'Sült csirke

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 500g csirkemell filét.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Vágd nagyobb darabokra.
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A csirkemell sütése:
   - Egy serpenyőt melegítsd fel az 2 teáskanál olívaolajjal.
   - Helyezd rá a csirkés darabokat.
   - Süsd 6-7 percig mindkét oldalon, amíg megpírósodik.
   - Folyamatosan keverd, hogy ne égjen le.

3. LÉPÉS - A fokhagyma hozzáadása:
   - Szórd rá az apróra vágott 2 gerezd fokhagymát.
   - Forgass 30 másodpercig, amíg illatos lesz.
   - Figyeld, nehogy megégjen!

4. LÉPÉS - A fűszerek hozzáadása:
   - Szórd rá az 1 teáskanál fűszerpaprikát.
   - Szórd rá az 1 teáskanál oregánót.
   - Keverd jól össze.

5. LÉPÉS - A főzés befejezése:
   - Főzz még 5-6 percig, amíg teljesen megsül.
   - Folyamatosan keverd.
   - A húsnak teljesen átsültnek kell lennie.

6. LÉPÉS - A citromlé hozzáadása:
   - Az utolsó percben csepegtess rá citrom levét.
   - Ez ad egy friss ízt.

7. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Azonnal fogyaszd melegen.
   - Ha szeretnéd, szolgáld fel rizzsel vagy zöldségekkel.

TIPP: A csirkemell legjobb frissen sütve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '350', NULL),
('4 szelet teljes kiőrlésű kenyér, 3 paradicsom, 2 gerezd fokhagyma, 1 csokor friss bazsalikom, 2 evőkanál olívaolaj, só, bors, 50g parmezán (opcionális)', '10', '10órai', 'nem', 'olasz', 'https://images.unsplash.com/photo-1572441713132-51c75654db73?q=80&w=600', 'Bruschetta

1. LÉPÉS - A kenyér pirítása:
   - Vegyél elő 4 szelet teljes kiőrlésű kenyeret.
   - Egy kenyérpirítót vagy serpenyőt használj a pirításhoz.
   - Pirítsd meg mindkét oldalát aranybarnára, kb. 2-3 percig mindkét oldalon.
   - Ha serpenyőben pirítasz, használj egy kevés olívaolajat.
   - A pirított kenyeret tedd félre egy tányérra.

2. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 3 paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Apróra vágd kockákra.
   - Tedd egy tálba.

3. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.
   - Add hozzá a paradicsomhoz.

4. LÉPÉS - A bazsalikom előkészítése:
   - Vegyél elő 1 csokor friss bazsalikomot.
   - Finomra vágd.
   - Add hozzá a paradicsomhoz.

5. LÉPÉS - A paradicsomos keverék készítése:
   - Add hozzá az 2 evőkanál olívaolajat.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.
   - Hagyd állni legalább 10 percig, hogy az ízek összeérjenek.

6. LÉPÉS - A bruschetta összeállítása:
   - A pirított kenyérszeletekre kend rá a paradicsomos keveréket egyenletesen.
   - Próbáld úgy elosztani, hogy minden részén legyen paradicsom.

7. LÉPÉS - A parmezán hozzáadása (opcionális):
   - Ha szeretnéd, szórd rá a reszelt parmezánt.
   - Ez ad egy extra ízt.

8. LÉPÉS - Tálalás:
   - Azonnal tálald egy tányérra.
   - A legjobb íz frissen készítve van.

TIPP: A bruschetta legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '220', NULL),
('800g friss paradicsom, 500ml zöldségleves, 1 fej vöröshagyma, 3 gerezd fokhagyma, 1 nagy csokor friss bazsalikom, 100ml tejszín, 2 teáskanál olívaolaj, só, bors', '25', 'foetel', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Paradicsomleves

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 3 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.
   - A hagymának nagyon finomra kell vágva lennie.

2. LÉPÉS - A hagyma pirítása:
   - Egy fazékban melegítsd fel a 2 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát.
   - Pirítsd 2 percig, amíg illatos lesz és üveges.

3. LÉPÉS - A fokhagyma hozzáadása:
   - Add hozzá a 3 gerezd apróra vágott fokhagymát.
   - Forgass 30 másodpercig, amíg illatos lesz.
   - Figyeld, nehogy megégjen!

4. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 800g friss paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Darabold össze vagy vágd kockákra.

5. LÉPÉS - A paradicsom hozzáadása:
   - Add hozzá a paradicsom darabokat a hagymához.
   - Öntsd fel a 500ml zöldséglevest.
   - Forrald fel.

6. LÉPÉS - A főzés:
   - Főzd 15-18 percig, amíg a paradicsom szétesik.
   - Folyamatosan keverd, hogy ne égjen le.

7. LÉPÉS - A leves turmixolása:
   - Turmixold le egy turmixgéppel vagy botmixerrel.
   - Vagy szűrd át finom szitán.
   - A levesnek simának és krémesnek kell lennie.

8. LÉPÉS - A tejszín és bazsalikom hozzáadása:
   - Add hozzá a 100ml tejszínt.
   - Add hozzá a kb. 15g friss bazsalikom levelet.
   - Főzd még 2-3 percig, de ne forrald fel!

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Tálald forrón egy tálba.
    - Ha szeretnéd, díszítsd még egy kevés bazsalikommal.
    - Azonnal fogyaszd melegen.

TIPP: A leves legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '180', NULL),
('250g mascarpone, 200ml tejszín, 3 tojás, 100g cukor, 200ml erős kávé, 2 evőkanál kakaópor, 200g babapiskóta, 2 evőkanál rum (opcionális)', '30', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?q=80&w=600', 'Tiramisu

1. LÉPÉS - A tojások szétválasztása:
   - Vegyél elő 3 tojást.
   - Válaszd szét a sárgáját és fehérjét.
   - Mindkettőt tedd külön tálba.

2. LÉPÉS - A sárgáják keverése:
   - A sárgájákat keverd össze a 100g cukorral.
   - Keverd jól össze, amíg világossárga és habos nem lesz.

3. LÉPÉS - A mascarpone hozzáadása:
   - Add hozzá a 250g mascarpone-t a sárgájákhoz.
   - Keverd jól össze, amíg sima nem lesz.

4. LÉPÉS - A tejszín habosítása:
   - Verd fel a 200ml tejszínt kemény habbá.
   - Egy habverővel vagy habverőgéppel.
   - A habnak keménynek kell lennie.

5. LÉPÉS - A tojásfehérje habosítása:
   - Verd fel a tojásfehérjét kemény habbá.
   - Egy habverővel vagy habverőgéppel.
   - A habnak keménynek kell lennie.

6. LÉPÉS - A keverékek összekeverése:
   - Óvatosan keverd össze a mascarpone keveréket a tejszínhabbal.
   - Utána óvatosan keverd össze a tojásfehérje habbal.
   - Ne keverd túl erősen, hogy a hab ne essen össze!

7. LÉPÉS - A kávé előkészítése:
   - Főzz erős kávét (200ml).
   - Hagyd lehűlni.
   - Ha szeretnéd, keverd össze a rummal (2 evőkanál).

8. LÉPÉS - A rétegezés:
   - Egy tálba vagy tálcára helyezd az első réteg babapiskótát (200g).
   - Mártogasd a babapiskótákat a kávéba.
   - Rá egy réteg mascarpone keverék.
   - Ismételd meg a rétegezést.

9. LÉPÉS - A kakaópor hozzáadása:
   - A tetejére szórd a 2 evőkanál kakaóport.
   - Próbáld egyenletesen elosztani.

10. LÉPÉS - Hűtés:
    - Tedd hűtőbe legalább 4 órát.
    - A legjobb íz hűtés után van.

TIPP: A tiramisu legjobb hűtés után, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '200', NULL),
('200g teljes kiőrlésű liszt, 100ml víz, 50ml olívaolaj, 1 teáskanál só, 1 teáskanál fűszerpaprika, 1 teáskanál fokhagymapor', '20', '10órai', 'nem', 'nasi', 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?q=80&w=600', 'Sós ropogós

1. LÉPÉS - A liszt és fűszerek keverése:
   - Egy tálba keverd össze a 200g teljes kiőrlésű lisztet.
   - Add hozzá az 1 teáskanál sót.
   - Add hozzá az 1 teáskanál fűszerpaprikát.
   - Add hozzá az 1 teáskanál fokhagymaport.
   - Keverd jól össze.

2. LÉPÉS - A folyadékok hozzáadása:
   - Add hozzá a 100ml vizet.
   - Add hozzá a 50ml olívaolajat.
   - Keverd össze.

3. LÉPÉS - A tészta dagasztása:
   - Dagasztd sima tésztáig.
   - Ha túl ragadós, adj hozzá még egy kevés lisztet.
   - Ha túl száraz, adj hozzá még egy kevés vizet.

4. LÉPÉS - A tészta nyújtása:
   - Lisztezd meg a munkafelületet.
   - Nyújtsd ki vékonyra (kb. 0,3-0,5 cm vastagságúra).

5. LÉPÉS - A tészta formázása:
   - Vágd kisebb darabokra vagy formáld ki.
   - Próbáld úgy, hogy egyenletesek legyenek.

6. LÉPÉS - A sütés előkészítése:
   - Előmelegítsd a sütőt 180°C-ra.
   - Egy sütőpapírral bélelt tepsibe helyezd a tészta darabokat.
   - Tartsd kb. 2-3 cm távolságot közöttük.

7. LÉPÉS - A sütés:
   - Süsd 12-15 percig, amíg aranybarna és ropogós lesz.
   - Közben fordítsd meg egyszer, hogy mindkét oldala szép legyen.
   - Figyeld, nehogy megégjen!

8. LÉPÉS - Kihűtés:
   - Hagyd kihűlni a tepsiben 5 percig.
   - Utána helyezd át egy rácsra teljesen kihűlni.

9. LÉPÉS - Tárolás:
   - Amikor teljesen kihűlt, tárold légmentesen zárva.
   - Szobahőmérsékleten tárold, száraz helyen.

TIPP: A ropogós legjobb frissen sütve, de tárolható légmentesen zárva 1-2 hétig!', 'none', 'nem', 'nem', '220', NULL),
('2 tortilla lap, 4 tojás, 100g sonka, 50g sajt, 50g saláta, 1 paradicsom, 2 evőkanál majonéz, só, bors', '12', 'proteindús', 'nem', 'gyors', 'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?q=80&w=600', 'Tojásos wrap

1. LÉPÉS - A tojás előkészítése:
   - Vegyél elő 4 tojást.
   - Egy tálba verd fel.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

2. LÉPÉS - A tojás sütése:
   - Egy serpenyőben melegítsd fel egy kevés olívaolajat.
   - Öntsd bele a verített tojást.
   - Süsd rántottának 3-4 percig, amíg megdermed.
   - Fordítsd meg egyszer, hogy mindkét oldala szép legyen.
   - Tedd félre és hagyd kihűlni egy kicsit.

3. LÉPÉS - A tortilla melegítése:
   - Vegyél elő 2 tortilla lapot.
   - Melegítsd meg serpenyőben vagy mikróban 30 másodpercig.
   - A tortillának melegnek, de még formázhatóknak kell lennie.

4. LÉPÉS - A majonéz kenése:
   - Minden tortilla lapra kend rá 1 evőkanál majonézt.
   - Próbáld úgy elosztani, hogy minden részén legyen majonéz.
   - Hagyj kb. 2 cm szélt üresen mindkét oldalon.

5. LÉPÉS - A töltés elhelyezése:
   - Helyezd rá a 50g salátát.
   - Helyezd rá a 100g sonkát.
   - Helyezd rá a sült tojást.
   - Helyezd rá a 50g sajtot.
   - Helyezd rá a paradicsom szeleteket.
   - Próbáld úgy elosztani, hogy minden részén legyen töltés.

6. LÉPÉS - A wrap összehajtása:
   - A szélekről összehajtod a tortillát.
   - Óvatosan tekerd fel szorosan.
   - A széleket nyomd össze, hogy jól összetapadjon.

7. LÉPÉS - Tálalás:
   - Azonnal tálald egy tányérra.
   - Ha szeretnéd, vágd ketté átlósan.
   - Fogyaszd frissen.
   - Ha később szeretnéd fogyasztani, csomagold be fóliába.

TIPP: A wrap legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '280', NULL),
('150g quinoa, 300ml zöldségleves, 200g vegyes zöldség (paprika, cukkinni, brokkoli), 1 fej vöröshagyma, 2 gerezd fokhagyma, 2 evőkanál olívaolaj, 1 csokor petrezselyem, só, bors', '20', 'kalóriaszegény', 'nem', 'egészséges', 'https://images.unsplash.com/photo-1512058564366-18510be2db19?q=80&w=600', 'Zöldséges quinoa

1. LÉPÉS - A quinoa előkészítése:
   - Vegyél elő 150g quinoát.
   - Öblítsd le hideg vízben alaposan.
   - Szűrd le és hagyd lecsepegni.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hagyma pirítása:
   - Egy fazékban melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz és üveges.

4. LÉPÉS - A quinoa hozzáadása:
   - Add hozzá a quinoát a hagymához.
   - Pirítsd 1-2 percig.

5. LÉPÉS - A leves hozzáadása:
   - Öntsd fel a 300ml zöldséglevest.
   - Főzd 15-18 percig, amíg a quinoa megpuhul és a folyadék elpárolog.
   - Folyamatosan keverd, hogy ne ragadjon le.

6. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 200g vegyes zöldséget (paprika, cukkinni, brokkoli).
   - Alaposan mosd meg mindegyiket.
   - Apróra vágd.

7. LÉPÉS - A zöldségek párolása:
   - Egy fazékban forrald fel vizet.
   - Add hozzá a zöldségeket.
   - Párold 5-6 percig, amíg al dente maradnak.

8. LÉPÉS - Az összekeverés:
   - Keverd össze az elkészült quinoát a párolt zöldségekkel.
   - Próbáld úgy, hogy minden részén legyen zöldség.

9. LÉPÉS - A petrezselyem hozzáadása:
   - Szórd rá az 1 csokor friss petrezselymet.
   - Keverd jól össze.

10. LÉPÉS - Fűszerezés:
    - Sózd és borsozz az ízlésed szerint.
    - Keverd jól össze.

11. LÉPÉS - Tálalás:
    - Melegen tálald egy tálba.
    - Azonnal fogyaszd melegen.

TIPP: A quinoa legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '300', NULL),
('300g lazac filé, 200ml hal vagy zöldségleves, 1 citrom (lé és szelet), 1 teáskanál friss rozmaring, 1 teáskanál olívaolaj, só, bors, 1 teáskanál friss petrezselyem', '15', 'foetel', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?q=80&w=600', 'Párolt lazac

1. LÉPÉS - A lazac előkészítése:
   - Vegyél elő 300g lazac filét.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A lazac elhelyezése:
   - Egy párolóba vagy fazékba helyezd a lazac filét.
   - Helyezz rá citrom szeletet.
   - Szórd rá az 1 teáskanál friss rozmaringot.

3. LÉPÉS - A leves hozzáadása:
   - Öntsd fel a 200ml hal vagy zöldséglevest.
   - Fedő alatt párold 10-12 percig alacsony hőn.
   - A lazacnak átsültnek kell lennie.

4. LÉPÉS - A citromlé hozzáadása:
   - Az utolsó 2 percben csepegtess rá citrom levét.
   - Ez ad egy friss ízt.

5. LÉPÉS - A petrezselyem hozzáadása:
   - Szórd rá az 1 teáskanál friss petrezselymet.
   - Keverd jól össze.

6. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Azonnal fogyaszd melegen.
   - Ha szeretnéd, szolgáld fel rizzsel vagy zöldségekkel.

TIPP: A lazac legjobb közepesen párolva, ne legyen túl száraz!', 'none', 'nem', 'nem', '380', NULL),
('2 érett avokádó, 1 citrom leve, 2 gerezd fokhagyma, 1 paradicsom, 1/2 vöröshagyma, 1 csipet koriander, só, bors, 2 evőkanál olívaolaj', '10', '10órai', 'nem', 'egészséges', 'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?q=80&w=600', 'Avokádó krém

1. LÉPÉS - Az avokádó előkészítése:
   - Vegyél elő 2 érett avokádót.
   - Vágd ketté hosszúságban egy éles késsel.
   - Vedd ki a magot egy kanállal vagy késsel.
   - Merőkanállal szósd ki a húst egy tálba.

2. LÉPÉS - Az avokádó összenyomása:
   - Nyomd össze egy villával, hogy krémes legyen.
   - Próbáld úgy, hogy sima legyen, de még maradjon benne egy kis textúra.

3. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.
   - Add hozzá az avokádóhoz.

4. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1/2 vöröshagymát.
   - Hámozd meg és aprítsd finomra.
   - Add hozzá az avokádóhoz.

5. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 1 paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Apróra vágd kockákra.
   - Add hozzá az avokádóhoz.

6. LÉPÉS - A folyadékok hozzáadása:
   - Csepegtess rá citrom levét.
   - Add hozzá az 2 evőkanál olívaolajat.
   - Keverd jól össze.

7. LÉPÉS - Fűszerezés:
   - Fűszerezd sóval, borssal és korianderrel (1 csipet).
   - Keverd jól össze.
   - Próbáld meg, hogy jó ízű legyen.

8. LÉPÉS - Tálalás:
   - Tálald pirítósra kenve vagy zöldségekkel.
   - Azonnal fogyaszd frissen.
   - Ha szeretnéd, díszítsd még egy kevés olívaolajjal.

TIPP: Az avokádó krém legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '450', NULL),
('1 liter zöldségleves, 200g sárgarépa, 200g burgonya, 200g brokkoli, 1 fej vöröshagyma, 2 gerezd fokhagyma, 100ml tejszín, 2 teáskanál olívaolaj, 1 teáskanál kumin, só, bors, 1 csokor petrezselyem', '30', 'foetel', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Zöldségleves

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

2. LÉPÉS - A hagyma pirítása:
   - Egy fazékban melegítsd fel a 2 teáskanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz és üveges.

3. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 200g sárgarépát, 200g burgonyát és 200g brokkolit.
   - Alaposan mosd meg mindegyiket.
   - Hámozd meg a sárgarépát és burgonyát.
   - Vágd kockákra.
   - A brokkolit fejtsd részekre.

4. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá az összes zöldséget a hagymához.
   - Szórd rá az 1 teáskanál kumint.
   - Keverd jól össze.

5. LÉPÉS - A leves hozzáadása:
   - Öntsd fel az 1 liter zöldséglevest.
   - Forrald fel.

6. LÉPÉS - A főzés:
   - Főzd 15-20 percig, amíg az összes zöldség puha lesz.
   - Folyamatosan keverd.

7. LÉPÉS - A leves turmixolása (opcionális):
   - Turmixold le simára vagy hagyd darabosnak.
   - Ha turmixolsz, turmixold amíg sima nem lesz.

8. LÉPÉS - A tejszín hozzáadása:
   - Add hozzá a 100ml tejszínt.
   - Főzz még 2-3 percig, de ne forrald fel!

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Szórd rá az 1 csokor friss petrezselymet.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Tálald forrón egy tálba.
    - Azonnal fogyaszd melegen.

TIPP: A leves legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '180', NULL),
('500g liszt, 200g vaj, 100g cukor, 1 tojás, 1kg alma, 2 teáskanál fahéj, 50g mazsola, 1 citrom leve', '45', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1621303837174-89787a7d4729?q=80&w=600', 'Almás pite

1. LÉPÉS - A tészta előkészítése:
   - Egy tálba keverd össze a 500g lisztet.
   - Add hozzá a 200g vajat (szobahőmérsékleten puha).
   - Add hozzá a 100g cukrot.
   - Add hozzá az 1 tojást.
   - Keverd össze.

2. LÉPÉS - A tészta dagasztása:
   - Dagasztd sima tésztáig.
   - Ha túl ragadós, adj hozzá még egy kevés lisztet.
   - Ha túl száraz, adj hozzá még egy kevés vizet.

3. LÉPÉS - A tészta pihentetése:
   - Csomagold be frissentartó fóliába.
   - Tedd hűtőbe 30 percig.

4. LÉPÉS - Az almák előkészítése:
   - Vegyél elő 1kg almát.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg egy késsel vagy hámozóval.
   - Vágd ki a magházat és a szárát.
   - Szeleteld fel vékony szeletekre.

5. LÉPÉS - Az alma fűszerezése:
   - Egy tálba helyezd az alma szeleteket.
   - Keverd össze a 2 teáskanál fahéjjal.
   - Add hozzá a 50g mazsolát.
   - Csepegtess rá citrom levét.
   - Keverd jól össze.

6. LÉPÉS - A tészta nyújtása:
   - Lisztezd meg a munkafelületet.
   - Vedd ki a tésztát a hűtőből.
   - Nyújtsd ki egyenletesen.
   - Vágd ketté: egy részt az aljára, egy részt a tetejére.

7. LÉPÉS - A pite összeállítása:
   - Egy vajazott tepsibe helyezd az alsó tészta réteget.
   - Helyezd rá a töltést (alma szeletek).
   - Fedd le a felső tészta réteggel vagy rácsos mintával.
   - A széleket nyomd össze.

8. LÉPÉS - A sütés előkészítése:
   - Előmelegítsd a sütőt 180°C-ra.

9. LÉPÉS - A sütés:
   - Süsd 35-40 percig, amíg aranybarna lesz.
   - Közben nézd meg, hogy ne égjen meg.

10. LÉPÉS - Kihűtés:
    - Hagyd kihűlni 10 percig a sütés után.
    - Utána vágd fel szeletekre.

TIPP: A pite legjobb frissen sütve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '380', NULL);

INSERT INTO `receptek` (`hozzavalo`, `ido`, `meal`, `unnepi_etelek`, `kulonlegesseg`, `kepek`, `recept_hozzaadas`, `allergens`, `edes`, `sos`, `kaloria`, `felhasznalo_id`) VALUES
('200ml görög joghurt, 150g vegyes gyümölcs (eper, málna, banán), 2 teáskanál méz, 1 csipet vanília', '5', '10órai', 'nem', 'gyors', 'https://images.unsplash.com/photo-1488477181946-6428a0291777?q=80&w=600', 'Gyümölcsjoghurt

1. LÉPÉS - A joghurt előkészítése:
   - Egy tálba tölts az 200ml görög joghurtot.
   - Ha túl sűrű, keverd össze egy kanállal.
   - A joghurtnak krémesnek kell lennie.

2. LÉPÉS - A gyümölcsök előkészítése:
   - Vegyél elő 150g vegyes gyümölcsöt (eper, málna, banán).
   - Alaposan mosd meg mindegyiket hideg vízben.
   - Szárítsd le papírtörlővel.
   - Szeleteld fel vagy vágd kockákra.

3. LÉPÉS - A gyümölcsök elhelyezése:
   - Szórd rá a gyümölcsöket a joghurtra egyenletesen.
   - Próbáld úgy elosztani, hogy minden részén legyen gyümölcs.

4. LÉPÉS - A méz hozzáadása:
   - Csepegtess rá 2 teáskanál mézet.
   - Próbáld egyenletesen elosztani.
   - A méz adja az édességet.

5. LÉPÉS - A vanília hozzáadása:
   - Szórj rá 1 csipet vaníliát.
   - Keverd jól össze.

6. LÉPÉS - Tálalás:
   - Jól keverd össze az összes összetevőt.
   - Azonnal tálald hidegen.
   - A legjobb íz hidegen van.

TIPP: A joghurt legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '220', NULL),
('200ml görög joghurt, 50g feta sajt, 100g olajbogyó, 50g uborka, 1 paradicsom, 2 evőkanál olívaolaj, 1 evőkanál citrom leve, só, bors, 1 csokor friss bazsalikom', '10', 'proteindús', 'nem', 'mediterrán', 'https://images.unsplash.com/photo-1494597564530-871f2b93ac55?w=600&q=80', 'Görög joghurtos tál

1. LÉPÉS - A joghurt előkészítése:
   - Egy tálba helyezd az 200ml görög joghurtot.
   - Ha túl sűrű, keverd össze egy kanállal.

2. LÉPÉS - A feta sajt előkészítése:
   - Vegyél elő 50g feta sajtot.
   - Apróra zúzd vagy szeletekre vágd.
   - Szórd rá a joghurtra.

3. LÉPÉS - Az olajbogyó előkészítése:
   - Vegyél elő 100g olajbogyót.
   - Ha nagyok, felezd meg.
   - Szórd rá a joghurtra.

4. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 50g uborkát és 1 paradicsomot.
   - Alaposan mosd meg mindegyiket.
   - Az uborkát szeleteld vékonyra.
   - A paradicsomot darabold kockákra.

5. LÉPÉS - A zöldségek elhelyezése:
   - Szórd rá az uborkát és paradicsomot a joghurtra.

6. LÉPÉS - A dresszing hozzáadása:
   - Csepegtess rá az 2 evőkanál olívaolajat.
   - Csepegtess rá az 1 evőkanál citrom levét.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Szórd rá az 1 csokor friss bazsalikomot.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Azonnal tálald frissen.
   - A legjobb íz hidegen van.

TIPP: A tál legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '220', NULL),
('300g sült csirkemell, 200g vegyes saláta, 1 narancs, 1 grapefruit, 50g mogyoró, 2 evőkanál olívaolaj, 1 evőkanál citrom leve, só, bors', '15', 'kalóriaszegény', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=600', 'Citrusos csirkesaláta

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 300g sült csirkemellet.
   - Ha nincs sülve, süsd meg előre.
   - Szeleteld fel.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 200g vegyes salátát.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Tépd kisebbre, ha szükséges.

3. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.

4. LÉPÉS - A citrusos gyümölcsök előkészítése:
   - Vegyél elő 1 narancsot és 1 grapefruitot.
   - Hámozd meg mindkettőt.
   - Szeleteld fel.
   - Szórd rá a salátára.

5. LÉPÉS - A csirkemell elhelyezése:
   - Helyezd rá a csirkemell szeleteket a salátára.

6. LÉPÉS - A mogyoró előkészítése:
   - Vegyél elő 50g mogyorót.
   - Durvára aprítsd.
   - Szórd rá a salátára.

7. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze az 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál citrom levét.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Öntsd meg a salátát a dresszinggel.
   - Keverd jól össze.
   - Azonnal tálald frissen.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '200', NULL),
('400g darált marhahús, 250g spaghetti, 400g aprított paradicsom, 1 fej vöröshagyma, 3 gerezd fokhagyma, 1 sárgarépa, 1 szál zellerzöld, 2 evőkanál olívaolaj, 100ml vörösbor, 1 evőkanál paradicsompüré, só, bors, 1 teáskanál oregánó', '35', 'foetel', 'nem', 'olasz', 'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=600&q=80', 'Bolognai spagetti

1. LÉPÉS - A hús előkészítése:
   - Vegyél elő 400g darált marhahúst.
   - Ha szükséges, sózd és borsozd.

2. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 fej vöröshagymát, 3 gerezd fokhagymát, 1 sárgarépát és 1 szál zellerzöldet.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hús sütése:
   - Egy nagy serpenyőt melegítsd fel a 2 evőkanál olívaolajjal.
   - Add hozzá a darált marhahúst.
   - Süsd 8-10 percig, amíg teljesen átsül.

4. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá az apróra vágott zöldségeket.
   - Párold 5 percig.

5. LÉPÉS - A bor hozzáadása:
   - Öntsd fel a 100ml vörösbort.
   - Hagyd 3 percig forrni.

6. LÉPÉS - A paradicsom hozzáadása:
   - Add hozzá a 400g aprított paradicsomot.
   - Add hozzá az 1 evőkanál paradicsompürét.
   - Add hozzá az 1 teáskanál oregánót.
   - Főzd 15-20 percig szimmerizálva.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.

8. LÉPÉS - A spagetti főzése:
   - Főzz 250g spagettit sós vízben.
   - Főzd az étkezési utasítások szerint.

9. LÉPÉS - Tálalás:
   - Tálald a spagetti fölé az elkészült bolognai szószt.
   - Melegen fogyaszd azonnal.

TIPP: A szósz legjobb hosszú főzéssel, hogy az ízek összeérjenek!', 'none', 'nem', 'nem', '480', NULL),
('200g mozzarella, 3 paradicsom, 1 csokor friss bazsalikom, 3 evőkanál olívaolaj, 1 evőkanál balzsamikó ecet, só, bors', '10', '10órai', 'nem', 'olasz', 'https://images.unsplash.com/photo-1615367423057-4b46b6aad05d?q=80&w=600', 'Caprese saláta

1. LÉPÉS - A mozzarella előkészítése:
   - Vegyél elő 200g mozzarellát.
   - Szeleteld fel vékony szeletekre (kb. 0,5-1 cm vastagok).
   - A szeleteknek egyenleteseknek kell lenniük.

2. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 3 paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Szeleteld fel vékony szeletekre (kb. 0,5-1 cm vastagok).
   - A szeleteknek egyenleteseknek kell lenniük.

3. LÉPÉS - A rétegezés:
   - Egy tálban vagy tányéron rétegezd váltakozva a mozzarellát és paradicsomot.
   - Próbáld úgy, hogy szép rétegek legyenek.
   - Először egy paradicsom szelet, aztán egy mozzarella szelet, és így tovább.

4. LÉPÉS - A bazsalikom elhelyezése:
   - Vegyél elő 1 csokor friss bazsalikomot.
   - Szórd rá a bazsalikom leveleket a salátára.
   - Próbáld egyenletesen elosztani.

5. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze az 3 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál balzsamikó ecetet.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

6. LÉPÉS - Tálalás:
   - Öntsd meg a salátát a dresszinggel.
   - Azonnal tálald frissen.
   - A legjobb íz hidegen van.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '200', NULL),
('800g csont vagy csirkehús, 2 liter víz, 1 nagyobb sárgarépa, 1 szál fehér hagyma, 1 szál zellerzöld, 1/2 káposzta, só, bors, 1 csokor petrezselyem', '45', 'foetel', 'nem', 'tradicionális', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Húsleves

1. LÉPÉS - A hús előkészítése:
   - Vegyél elő 800g csontot vagy csirkehúst.
   - Alaposan mosd meg hideg vízben.
   - Ha szükséges, vágd kisebbre.

2. LÉPÉS - A leves főzése:
   - Egy nagy fazékban forrald fel 2 liter vizet.
   - Add hozzá a csontot vagy húst.
   - Forrald 5 percig, majd szűrd le a habot.

3. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 1 nagyobb sárgarépát, 1 szál fehér hagymát és 1 szál zellerzöldet.
   - Alaposan mosd meg mindegyiket.
   - Vágd nagyobb darabokra (kb. 3-4 cm-esek).

4. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá a zöldségeket a leveshez.
   - Főzd 30-35 percig, amíg a hús megpuhul.
   - Folyamatosan keverd és szűrd le a habot.

5. LÉPÉS - A leves szűrése:
   - Szűrd át a levest egy szitán.
   - Tárold félre a húst és zöldségeket.
   - Tedd vissza a levest a fazékba.

6. LÉPÉS - A káposzta hozzáadása:
   - Vegyél elő 1/2 káposztát.
   - Vágd kisebbre vagy szeleteld fel.
   - Add hozzá a leveshez.
   - Főzz még 10 percig.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Szórd rá az 1 csokor friss petrezselymet.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Tálald forrón egy tálba.
   - Ha szeretnéd, add hozzá vissza a húst és zöldségeket.
   - Azonnal fogyaszd melegen.

TIPP: A leves legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '180', NULL),
('200g étcsokoládé, 150g vaj, 4 tojás, 150g cukor, 100g liszt, 50g kakaópor, 1 teáskanál sütőpor', '50', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?q=80&w=600', 'Csokoládétorta

1. LÉPÉS - A csokoládé és vaj olvasztása:
   - Vegyél elő 200g étcsokoládét és 150g vajat.
   - Vágd fel a csokoládét kisebb darabokra.
   - Egy vízfürdőben vagy mikróban olvaszd meg a csokoládét és vajat.
   - Keverd össze, amíg sima nem lesz.
   - Hagyd kihűlni egy kicsit.

2. LÉPÉS - A tojások szétválasztása:
   - Vegyél elő 4 tojást.
   - Válaszd szét a sárgáját és fehérjét.
   - Mindkettőt tedd külön tálba.

3. LÉPÉS - A sárgáják keverése:
   - A sárgájákat keverd össze a 150g cukorral.
   - Keverd jól össze, amíg világossárga és habos nem lesz.

4. LÉPÉS - A csokoládé-vaj keverék hozzáadása:
   - Add hozzá a csokoládé-vaj keveréket a sárgájákhoz.
   - Keverd jól össze.

5. LÉPÉS - A liszt és kakaópor hozzáadása:
   - Egy másik tálban keverd össze a 100g lisztet, 50g kakaóport és 1 teáskanál sütőport.
   - Szitáld át, hogy ne legyen csomós.
   - Fokozatosan add hozzá a csokoládé-sárgája keverékhez.
   - Keverd jól össze.

6. LÉPÉS - A tojásfehérje habosítása:
   - Verd fel a tojásfehérjét kemény habbá.
   - Egy habverővel vagy habverőgéppel.
   - A habnak keménynek kell lennie.

7. LÉPÉS - A tojásfehérje hab hozzáadása:
   - Óvatosan keverd össze a tojásfehérje habot a csokoládé keverékhez.
   - Ne keverd túl erősen, hogy a hab ne essen össze!
   - Fokozatosan keverd be.

8. LÉPÉS - A sütés előkészítése:
   - Előmelegítsd a sütőt 180°C-ra.
   - Egy vajazott tepsibe öntsd a keveréket.
   - Próbáld egyenletesen elosztani.

9. LÉPÉS - A sütés:
   - Süsd 30-35 percig, amíg a torta megpuhul.
   - Próbáld meg egy fogpiszkálóval: ha kijön tiszta, kész.
   - Ne süsd túl, mert száraz lesz!

10. LÉPÉS - Kihűtés:
    - Hagyd teljesen kihűlni a sütés után.
    - A torta legjobb hűtés után.

TIPP: A torta legjobb hűtés után, de tárolható hűtőben 3-5 napig!', 'none', 'nem', 'nem', '380', NULL),
('200g vegyes sajt (cheddar, gouda, füstölt sajt), 50g dió, 50g mogyoró, 2 evőkanál méz, 1 teáskanál fahéj', '8', '10órai', 'nem', 'nasi', 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?q=80&w=600', 'Sajtfalat

1. LÉPÉS - A sajtok előkészítése:
   - Vegyél elő 200g vegyes sajtot (cheddar, gouda, füstölt sajt).
   - Vágd kockákra (kb. 2-3 cm-esek).
   - A kockáknak egyenleteseknek kell lenniük.

2. LÉPÉS - A dió előkészítése:
   - Vegyél elő 50g diót.
   - Durvára aprítsd egy késsel vagy aprítógéppel.
   - A diónak durván aprítottnak kell lennie.

3. LÉPÉS - A mogyoró előkészítése:
   - Vegyél elő 50g mogyorót.
   - Durvára aprítsd egy késsel vagy aprítógéppel.
   - A mogyorónak durván aprítottnak kell lennie.

4. LÉPÉS - A tál összeállítása:
   - Egy tálba helyezd a sajt kockákat.
   - Szórd rá a diót és mogyorót.
   - Próbáld egyenletesen elosztani.

5. LÉPÉS - A méz hozzáadása:
   - Csepegtess rá az 2 evőkanál mézet.
   - Próbáld egyenletesen elosztani.
   - A méz adja az édességet.

6. LÉPÉS - A fahéj hozzáadása:
   - Szórj rá 1 teáskanál fahéjat.
   - Próbáld egyenletesen elosztani.
   - A fahéj ad egy szép ízt és illatot.

7. LÉPÉS - Tálalás:
   - Azonnal tálald egy tányérra.
   - Fogyaszd frissen.

TIPP: A sajtfalat legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '220', NULL),
('150g quinoa, 300ml zöldségleves, 200g vegyes zöldség (paprika, brokkoli, sárgarépa), 1 fej vöröshagyma, 2 evőkanál olívaolaj, 1 csokor petrezselyem, só, bors', '20', 'proteindús', 'nem', 'egészséges', 'https://images.unsplash.com/photo-1512058564366-18510be2db19?q=80&w=600', 'Quinoa zöldségtál

1. LÉPÉS - A quinoa előkészítése:
   - Vegyél elő 150g quinoát.
   - Öblítsd le hideg vízben alaposan.
   - Szűrd le és hagyd lecsepegni.

2. LÉPÉS - A quinoa főzése:
   - Egy fazékban főzd a quinoát a 300ml zöldséglevessel.
   - Főzd 15-18 percig, amíg puha lesz.
   - Folyamatosan keverd, hogy ne ragadjon le.

3. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát.
   - Hámozd meg és aprítsd finomra.

4. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát.
   - Pirítsd 2 percig, amíg illatos lesz.

5. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 200g vegyes zöldséget (paprika, brokkoli, sárgarépa).
   - Alaposan mosd meg mindegyiket.
   - Apróra vágd.

6. LÉPÉS - A zöldségek párolása:
   - Egy fazékban forrald fel vizet.
   - Add hozzá a zöldségeket.
   - Párold 5-6 percig, amíg al dente maradnak.

7. LÉPÉS - Az összekeverés:
   - Keverd össze az elkészült quinoát a zöldségekkel.
   - Próbáld úgy, hogy minden részén legyen zöldség.

8. LÉPÉS - A petrezselyem hozzáadása:
   - Szórd rá az 1 csokor friss petrezselymet.
   - Keverd jól össze.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Melegen tálald egy tálba.
    - Azonnal fogyaszd melegen.

TIPP: A quinoa tál legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '300', NULL),
('400g cukkinni, 50g parmezán, 2 evőkanál olívaolaj, 2 gerezd fokhagyma, só, bors, 1 csokor bazsalikom', '15', 'kalóriaszegény', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600&q=80', 'Parmezános cukkini

1. LÉPÉS - A cukkinni előkészítése:
   - Vegyél elő 400g cukkinit.
   - Alaposan mosd meg hideg vízben.
   - Vágd le a szárát és végét.
   - Szeleteld fel (kb. 0,5-1 cm vastagok).

2. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A fokhagyma pirítása:
   - Egy serpenyőben melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott fokhagymát.
   - Pirítsd 1 percig, amíg illatos lesz.
   - Figyeld, nehogy megégjen!

4. LÉPÉS - A cukkinni sütése:
   - Add hozzá a cukkini szeleteket.
   - Süsd 8-10 percig, amíg puha lesz.
   - Folyamatosan keverd, hogy ne égjen le.
   - A cukkinninak aranybarnának kell lennie.

5. LÉPÉS - A parmezán hozzáadása:
   - Vegyél elő 50g parmezánt.
   - Reszeld le.
   - Szórd rá a reszelt parmezánt.
   - Főzz még 2 percig, amíg a sajt megolvad.

6. LÉPÉS - A bazsalikom hozzáadása:
   - Szórd rá az 1 csokor bazsalikomot.
   - Keverd jól össze.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Melegen tálald egy tányérba.
   - Azonnal fogyaszd melegen.

TIPP: A cukkinni legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '220', NULL),
('300g rizottó rizs, 400g sütőtök, 1 liter húsleves, 1 fej vöröshagyma, 100g parmezán, 100ml fehérbor, 2 evőkanál olívaolaj, só, bors', '35', 'foetel', 'nem', 'olasz', 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?q=80&w=600', 'Sütőtökös rizottó

1. LÉPÉS - A sütőtök előkészítése:
   - Vegyél elő 400g sütőtököt.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg és vágd kockákra.

2. LÉPÉS - A sütőtök sütése:
   - Előmelegítsd a sütőt 180°C-ra.
   - Egy sütőpapírral bélelt tepsibe terítsd el a sütőtök kockákat.
   - Süsd 20 percig, amíg puha lesz.

3. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát.
   - Hámozd meg és aprítsd finomra.

4. LÉPÉS - A hagyma pirítása:
   - Egy fazékban melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát.
   - Pirítsd 2 percig, amíg illatos lesz.

5. LÉPÉS - A rizs hozzáadása:
   - Add hozzá a 300g rizottó rizst.
   - Pirítsd 2 percig.

6. LÉPÉS - A bor hozzáadása:
   - Öntsd fel a 100ml fehérbort.
   - Hagyd elpárologni.

7. LÉPÉS - A leves hozzáadása:
   - Folyamatosan keverve add hozzá a húslevest fokozatosan.
   - Főzz 18-20 percig, amíg a rizs megpuhul.
   - Folyamatosan keverd!

8. LÉPÉS - A sütőtök és parmezán hozzáadása:
   - Add hozzá a sült sütőtököt.
   - Add hozzá a reszelt parmezánt (100g).
   - Keverd jól össze.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Melegen tálald egy tányérba.
    - Azonnal fogyaszd melegen.

TIPP: A rizottó legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '480', NULL),
('4 szelet teljes kiőrlésű kenyér, 150g füstölt lazac, 100g krémsajt, 1 citrom, 1 csokor kapor, só, bors', '10', '10órai', 'nem', 'trendi', 'https://images.unsplash.com/photo-1509722747041-616f39b57569?q=80&w=600', 'Füstölt lazacos kanapé

1. LÉPÉS - A kenyér pirítása:
   - Vegyél elő 4 szelet teljes kiőrlésű kenyeret.
   - Egy kenyérpirítót vagy serpenyőt használj a pirításhoz.
   - Pirítsd meg mindkét oldalát aranybarnára, kb. 2-3 percig mindkét oldalon.
   - Ha serpenyőben pirítasz, használj egy kevés olívaolajat.
   - A pirított kenyeret tedd félre egy tányérra.

2. LÉPÉS - A krémsajt kenése:
   - Vegyél elő 100g krémsajtot.
   - Kend rá a krémsajtot a pirított kenyérszeletekre egyenletesen.
   - Próbáld úgy elosztani, hogy minden részén legyen krémsajt.
   - A kenésnek vékony rétegnek kell lennie.

3. LÉPÉS - A füstölt lazac előkészítése:
   - Vegyél elő 150g füstölt lazacot.
   - Szeleteld fel vékony szeletekre.
   - A szeleteknek kb. 2-3 cm széleseknek kell lenniük.

4. LÉPÉS - A füstölt lazac elhelyezése:
   - Helyezd rá a füstölt lazac szeleteket a krémsajt tetejére.
   - Próbáld úgy elosztani, hogy minden részén legyen lazac.
   - A lazacnak szépen el kell terülnie.

5. LÉPÉS - A citromlé hozzáadása:
   - Csepegtess rá citrom levét a lazac tetejére.
   - Ez ad egy friss ízt.
   - Próbáld egyenletesen elosztani.

6. LÉPÉS - A kapor hozzáadása:
   - Vegyél elő 1 csokor kaprot.
   - Finomra vágd.
   - Szórd rá a kapor leveleket a lazac tetejére.
   - Próbáld egyenletesen elosztani.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Csak egy kevés kell, mert a lazac már sós.

8. LÉPÉS - Tálalás:
   - Azonnal tálald egy tányérra.
   - A legjobb íz frissen készítve van.
   - Fogyaszd frissen.

TIPP: A kanapé legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '380', NULL),
('500g brokkoli, 500ml zöldségleves, 1 fej vöröshagyma, 2 gerezd fokhagyma, 100ml tejszín, 2 evőkanál olívaolaj, só, bors', '25', 'foetel', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Brokkolikrém

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

2. LÉPÉS - A hagyma pirítása:
   - Egy fazékban melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz és üveges.

3. LÉPÉS - A brokkoli előkészítése:
   - Vegyél elő 500g brokkolit.
   - Alaposan mosd meg hideg vízben.
   - Fejtsd részekre (rózsákká).
   - Vágd le a szárát, ha szükséges.

4. LÉPÉS - A brokkoli hozzáadása:
   - Add hozzá a brokkoli rózsákat a hagymához.
   - Öntsd fel a 500ml zöldséglevest.
   - Főzd 15 percig, amíg a brokkoli puha lesz.
   - Folyamatosan keverd.

5. LÉPÉS - A leves turmixolása:
   - Turmixold le simára egy turmixgéppel vagy botmixerrel.
   - A levesnek teljesen simának és krémesnek kell lennie.
   - Ha szükséges, turmixold újra.

6. LÉPÉS - A tejszín hozzáadása:
   - Add hozzá a 100ml tejszínt.
   - Főzz még 2-3 percig, de ne forrald fel!
   - A tejszín adja a krémes állagot.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Tálald forrón egy tálba.
   - Ha szeretnéd, díszítsd még egy kevés tejszínnel vagy petrezselyemmel.
   - Azonnal fogyaszd melegen.

TIPP: A leves legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '480', NULL),
('500ml tejszín, 200ml tej, 100g cukor, 4 tojás sárgája, 1 teáskanál vanília kivonat', '240', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?q=80&w=600', 'Vaníliafagyi

1. LÉPÉS - A tejszín habosítása:
   - Vegyél elő 500ml tejszínt.
   - Verd fel kemény habbá egy habverővel vagy habverőgéppel.
   - A habnak keménynek kell lennie.
   - Tedd félre.

2. LÉPÉS - A tojás sárgáják előkészítése:
   - Vegyél elő 4 tojást.
   - Válaszd szét a sárgáját és fehérjét.
   - A sárgájákat tedd egy tálba.

3. LÉPÉS - A sárgáják keverése:
   - Keverd össze a sárgájákat a 100g cukorral.
   - Add hozzá az 1 teáskanál vanília kivonatot.
   - Keverd jól össze, amíg világossárga és habos nem lesz.

4. LÉPÉS - A tej hozzáadása:
   - Add hozzá a 200ml tejet.
   - Keverd jól össze.

5. LÉPÉS - A vízfürdős melegítés:
   - Egy vízfürdőben melegítsd fel a keveréket.
   - Folyamatosan keverd, hogy ne essen össze.
   - Melegítsd, amíg besűrűsödik (kb. 5-8 perc).
   - Ne forrald fel!

6. LÉPÉS - Kihűtés:
   - Hagyd teljesen kihűlni.
   - Tedd hűtőbe legalább 1 órát.

7. LÉPÉS - A tejszínhab hozzáadása:
   - Keverd össze a kihűlt keveréket a tejszínhabbal.
   - Óvatosan keverd össze, hogy a hab ne essen össze!

8. LÉPÉS - A fagyasztás:
   - Fagyaszd le fagylaltgépben vagy fagyasztóban.
   - Kevergetve 3-4 órán át.
   - Ha fagyasztóban, keverd össze minden 30-60 percben.

9. LÉPÉS - Tálalás:
   - Amikor kész, tálald egy tálkában.
   - Fogyaszd hidegen.

TIPP: A fagyi legjobb hűtés után, de tárolható fagyasztóban 1-2 hétig!', 'none', 'nem', 'nem', '200', NULL),
('50g napraforgómag, 50g tökmag, 50g lenmag, 50g chia mag, 1 teáskanál olívaolaj, 1 teáskanál só', '15', '10órai', 'nem', 'nasi', 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?q=80&w=600', 'Magvak mix

1. LÉPÉS - A magvak előkészítése:
   - Vegyél elő 50g napraforgómagot, 50g tökmagot, 50g lenmagot és 50g chia magot.
   - Alaposan nézd meg, hogy nincs-e bennük szennyeződés.
   - Ha szükséges, szűrd át.

2. LÉPÉS - A magvak keverése:
   - Egy tálban keverd össze az összes magot.
   - Próbáld úgy, hogy egyenletesen el legyenek osztva.

3. LÉPÉS - Az olaj és só hozzáadása:
   - Add hozzá az 1 teáskanál olívaolajat.
   - Add hozzá az 1 teáskanál sót.
   - Keverd jól össze, hogy minden magon legyen olaj és só.

4. LÉPÉS - A pirítás előkészítése:
   - Egy serpenyőt melegítsd fel közepes lángon.
   - Várj, amíg felmelegszik.

5. LÉPÉS - A magvak pirítása:
   - Add hozzá a magvakat a serpenyőbe.
   - Pirítsd 5-6 percig, amíg aranybarna lesz.
   - Folyamatosan keverd, hogy ne égjen le.
   - A magvaknak ropogósnak kell lenniük.

6. LÉPÉS - Kihűtés:
   - Hagyd kihűlni teljesen.
   - Tedd egy tálba vagy tányérra.

7. LÉPÉS - Tárolás:
   - Amikor teljesen kihűlt, tárold légmentesen zárva.
   - Szobahőmérsékleten tárold, száraz helyen.

8. LÉPÉS - Tálalás:
   - Fogyaszd frissen vagy tárold későbbre.
   - Jó nasi vagy reggeli kiegészítés.

TIPP: A magvak mix legjobb frissen pirítva, de tárolható légmentesen zárva 1-2 hétig!', 'none', 'nem', 'nem', '220', NULL),
('200g lazac filé, 150g vegyes saláta, 100g avokádó, 50g olajbogyó, 2 evőkanál olívaolaj, 1 evőkanál citrom leve, só, bors', '15', 'proteindús', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=600&q=80', 'Lazacos saláta

1. LÉPÉS - A lazac előkészítése:
   - Vegyél elő 200g lazac filét.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A lazac sütése:
   - Egy serpenyőben melegítsd fel egy kevés olívaolajat.
   - Helyezd rá a lazac filét.
   - Süsd 4-5 percig mindkét oldalon.
   - A lazacnak átsültnek kell lennie.

3. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 150g vegyes salátát.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Tépd kisebbre, ha szükséges.

4. LÉPÉS - A saláta alaptál előkészítése:
   - Egy nagy tálba helyezd a salátákat alapként.

5. LÉPÉS - Az avokádó előkészítése:
   - Vegyél elő 100g avokádót.
   - Hámozd meg és szeleteld fel.
   - Helyezd rá a salátára.

6. LÉPÉS - Az olajbogyó előkészítése:
   - Vegyél elő 50g olajbogyót.
   - Ha nagyok, felezd meg.
   - Szórd rá a salátára.

7. LÉPÉS - A dresszing előkészítése:
   - Egy kis tálban keverd össze az 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál citrom levét.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Tálalás:
   - Helyezd rá a sült lazacot a saláta tetejére.
   - Öntsd meg a dresszinggel.
   - Keverd jól össze.
   - Azonnal tálald frissen.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 órán belül!', 'none', 'nem', 'nem', '200', NULL),
('2 padlizsán, 50g pincesajt, 2 gerezd fokhagyma, 50g fenyőmag, 3 evőkanál olívaolaj, só, bors', '25', 'kalóriaszegény', 'nem', 'mediterrán', 'https://images.unsplash.com/photo-1546069901-d5bfd2c066b1?w=600&q=80', 'Padlizsán pesto

1. LÉPÉS - A padlizsán előkészítése:
   - Vegyél elő 2 padlizsánt.
   - Alaposan mosd meg hideg vízben.
   - Vágd le a szárát.

2. LÉPÉS - A padlizsán sütése:
   - Előmelegítsd a sütőt 200°C-ra.
   - Egy sütőpapírral bélelt tepsibe helyezd a padlizsánt.
   - Süsd 20 percig, amíg puha lesz.
   - A padlizsánnak teljesen meg kell puhulnia.

3. LÉPÉS - A padlizsán hámozása:
   - Hagyd kihűlni.
   - Hámozd meg a héját.
   - A húsát tedd félre.

4. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Hámozd meg.

5. LÉPÉS - A turmixolás:
   - Egy turmixgépbe tedd a padlizsán húst.
   - Add hozzá a fokhagymát.
   - Add hozzá az 50g pincesajtot.
   - Add hozzá az 50g fenyőmagot.
   - Add hozzá az 3 evőkanál olívaolajat.
   - Turmixold le simára.
   - A pestónak krémesnek és simának kell lennie.

6. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

7. LÉPÉS - Tálalás:
   - Tálald tésztával vagy kenyérrel.
   - Fogyaszd frissen.

TIPP: A pesto legjobb frissen készítve, de tárolható hűtőben 3-5 napig!', 'none', 'nem', 'nem', '220', NULL),
('400g csirkemell, 400ml kókusztej, 2 evőkanál curry por, 1 fej vöröshagyma, 2 gerezd fokhagyma, 1 sárgarépa, 2 evőkanál olívaolaj, só, bors', '30', 'foetel', 'nem', 'indiai', 'https://images.unsplash.com/photo-1588166524941-3bf61a9c41db?q=80&w=600', 'Csirke curry

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 400g csirkemellet.
   - Alaposan mosd meg hideg vízben.
   - Szárítsd le papírtörlővel.
   - Vágd kockákra (kb. 2-3 cm-esek).
   - Sózd és borsozz az ízlésed szerint.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz.

4. LÉPÉS - A curry por hozzáadása:
   - Add hozzá a 2 evőkanál curry port.
   - Keverd 30 másodpercig, hogy ne égjen le.
   - A curry adja az ízt és színt.

5. LÉPÉS - A csirkemell sütése:
   - Add hozzá a csirkés kockákat.
   - Süsd 5 percig, amíg megpírósodik.
   - Folyamatosan keverd.

6. LÉPÉS - A sárgarépa előkészítése:
   - Vegyél elő 1 sárgarépát.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg és vágd kockákra.

7. LÉPÉS - A sárgarépa hozzáadása:
   - Add hozzá a sárgarépa kockákat a csirkéhez.
   - Keverd jól össze.

8. LÉPÉS - A kókusztej hozzáadása:
   - Öntsd fel a 400ml kókusztejet.
   - Főzz 15-20 percig, amíg a csirke és sárgarépa megpuhul.
   - Folyamatosan keverd.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Tálald rizzsel egy tányérba.
    - Melegen fogyaszd azonnal.

TIPP: A curry legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '350', NULL),
('4 szelet teljes kiőrlésű kenyér, 300g gomba, 2 gerezd fokhagyma, 50g vaj, 100ml tejszín, só, bors, 1 csokor petrezselyem', '15', '10órai', 'nem', 'klasszikus', 'https://images.unsplash.com/photo-1579737570043-6ef5f41d4760?w=600&q=80', 'Gombás pirítós

1. LÉPÉS - A gombák előkészítése:
   - Vegyél elő 300g gombát.
   - Alaposan tisztítsd meg hideg vízben.
   - Vágd le a szárát, ha szükséges.
   - Szeleteld fel (kb. 0,5 cm vastagok).

2. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A fokhagyma pirítása:
   - Egy serpenyőben melegítsd fel az 50g vajat.
   - Add hozzá a finomra vágott fokhagymát.
   - Pirítsd 1 percig, amíg illatos lesz.
   - Figyeld, nehogy megégjen!

4. LÉPÉS - A gombák sütése:
   - Add hozzá a gombaszeleteket.
   - Süsd 8-10 percig, amíg levet eresztenek és megpuhulnak.
   - Folyamatosan keverd, hogy ne égjen le.
   - A gombáknak aranybarnának kell lenniük.

5. LÉPÉS - A tejszín hozzáadása:
   - Öntsd fel a 100ml tejszínt.
   - Főzz 3-4 percig, amíg besűrűsödik.
   - A tejszín adja a krémes állagot.

6. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Szórd rá az 1 csokor petrezselymet.
   - Keverd jól össze.

7. LÉPÉS - A kenyér pirítása:
   - Vegyél elő 4 szelet teljes kiőrlésű kenyeret.
   - Pirítsd meg mindkét oldalát aranybarnára.

8. LÉPÉS - Tálalás:
   - Kend rá a gombás keveréket a pirított kenyérre.
   - Próbáld úgy elosztani, hogy minden részén legyen gomba.
   - Melegen tálald egy tányérra.
   - Azonnal fogyaszd melegen.

TIPP: A pirítós legjobb frissen készítve, de tárolható hűtőben 1-2 napig!', 'none', 'nem', 'nem', '220', NULL),
('1 liter húsleves, 200g tészta, 200g paradicsom, 200g bab, 1 fej vöröshagyma, 2 gerezd fokhagyma, 2 evőkanál olívaolaj, só, bors, 1 csokor bazsalikom', '30', 'foetel', 'nem', 'olasz', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Minestrone

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg és aprítsd finomra.

2. LÉPÉS - A hagyma pirítása:
   - Egy fazékban melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2 percig, amíg illatos lesz.

3. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 200g paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Darabold kockákra.

4. LÉPÉS - A bab előkészítése:
   - Vegyél elő 200g babot.
   - Ha konzervált, csepegtesse le a levét.
   - Ha friss, főzd meg előre.

5. LÉPÉS - A paradicsom és bab hozzáadása:
   - Add hozzá a paradicsomot és babot a hagymához.
   - Keverd jól össze.

6. LÉPÉS - A leves hozzáadása:
   - Öntsd fel az 1 liter húslevest.
   - Forrald fel.

7. LÉPÉS - A főzés:
   - Főzd 15 percig.
   - Folyamatosan keverd.

8. LÉPÉS - A tészta hozzáadása:
   - Add hozzá a 200g tésztát.
   - Főzz még 10 percig, amíg a tészta megpuhul.
   - Folyamatosan keverd.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Szórd rá az 1 csokor bazsalikomot.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Tálald forrón egy tálba.
    - Azonnal fogyaszd melegen.

TIPP: A leves legjobb frissen készítve, de tárolható hűtőben 2-3 napig!', 'none', 'nem', 'nem', '480', NULL);

INSERT INTO `receptek` (`hozzavalo`, `ido`, `meal`, `unnepi_etelek`, `kulonlegesseg`, `kepek`, `recept_hozzaadas`, `allergens`, `edes`, `sos`, `kaloria`, `felhasznalo_id`) VALUES
('200g liszt, 150g vaj, 100g cukor, 3 tojás, 2 citrom leve és héja, 1 teáskanál sütőpor', '45', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600&q=80', 'Citromtorta

1. LÉPÉS - A sütő előkészítése:
   - Melegítsd elő a sütőt 180°C-ra.
   - Vajazd be egy 20-22 cm-es tortaformát vagy tepsit.

2. LÉPÉS - A vaj és cukor keverése:
   - Vegyél elő 150g vajat (szobahőmérsékleten puha).
   - Egy nagy tálba helyezd a vajat és 100g cukrot.
   - Keverd habosra elektromos keverővel vagy kézzel, amíg világossárga és habos lesz (2-3 perc).

3. LÉPÉS - A tojások hozzáadása:
   - Vegyél elő 3 tojást.
   - Add hozzá a tojásokat egyenként, mindegyik után alaposan keverve.
   - Várj, amíg az előző tojás teljesen beolvad, mielőtt hozzáadnád a következőt.

4. LÉPÉS - A citrom előkészítése:
   - Vegyél elő 2 friss citromot.
   - Mossa meg alaposan a citromokat.
   - Reszeld le a citrom héját finom reszelővel (csak a sárga részt, ne a fehér húst).
   - Fáraszd ki a citrom levét (kb. 4-5 evőkanál).

5. LÉPÉS - A citrom hozzáadása:
   - Add hozzá a reszelt citromhéjat a tésztához.
   - Add hozzá a citromlevet is.
   - Keverd jól össze.

6. LÉPÉS - A száraz hozzávalók előkészítése:
   - Vegyél elő 200g lisztet és 1 teáskanál sütőport.
   - Egy külön tálba szitáld át a lisztet és sütőport.
   - Keverd össze, hogy egyenletesen el legyenek keverve.

7. LÉPÉS - A liszt hozzáadása:
   - Add hozzá a lisztet és sütőport lassan, folyamatosan keverve.
   - Ne keverd túl sokáig, csak amíg sima lesz a tészta.
   - Ne használj elektromos keverőt ezen a ponton, hogy ne legyen túl kemény a tészta.

8. LÉPÉS - A tészta formázása:
   - Öntsd a tésztát a vajazott formába vagy tepsibe.
   - Simítsd el egyenletesen a tetejét.

9. LÉPÉS - A sütés:
   - Helyezd be a sütőbe 180°C-on.
   - Süsd 35-40 percig, amíg a teteje aranybarna és egy fogpiszkáló, amit beleszúrsz, tiszta jön ki.
   - Közben ne nyisd ki a sütőt az első 25 percben.

10. LÉPÉS - Hűtés és tálalás:
    - Vedd ki a sütőből és hagyd kihűlni a formában 10 percig.
    - Ezután vedd ki a formából és hagyd teljesen kihűlni egy rácsos tálcán.
    - Tálald hidegen vagy langyoson, porcukorral megszórva.

TIPP: A torta még jobb lesz, ha egy éjszakát hűtőben pihenteted!', 'none', 'nem', 'nem', '380', NULL),
('300g vegyes zöldség (sárgarépa, cékla, padlizsán), 3 evőkanál olívaolaj, só, bors, 1 teáskanál fűszerpaprika', '25', '10órai', 'nem', 'nasi', 'https://images.unsplash.com/photo-1601050690597-df0568f70950?q=80&w=600', 'Zöldség chips

1. LÉPÉS - A sütő előkészítése:
   - Melegítsd elő a sütőt 180°C-ra.
   - Vegyél elő egy sütőpapírt és egy tepsit.

2. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 300g vegyes zöldséget (sárgarépa, cékla, padlizsán).
   - Alaposan mosd meg minden zöldséget hideg vízben.
   - Hámozd meg a sárgarépát és céklát.
   - A padlizsánt nem kell meghámozni, csak alaposan mosd meg.

3. LÉPÉS - A zöldségek szeletelése:
   - Vágd vékonyra a zöldségeket (2-3 mm vastagságú szeletek).
   - Használj mandolint vagy éles kést a vékony szeletekhez.
   - Fontos, hogy azonos vastagságúak legyenek, hogy egyenletesen süljenek.

4. LÉPÉS - A fűszerezés előkészítése:
   - Vegyél elő 3 evőkanál olívaolajat.
   - Egy nagy tálba öntsd az olívaolajat.
   - Add hozzá a sót, borsot és 1 teáskanál fűszerpaprikát.
   - Keverd össze.

5. LÉPÉS - A zöldségek fűszerezése:
   - Add hozzá a zöldség szeleteket az olajos fűszerkeverékhez.
   - Keverd jól össze, hogy minden szelet egyenletesen be legyen kenve.
   - Ügyelj rá, hogy ne legyenek túl sok olajban, csak vékonyan legyenek bekenve.

6. LÉPÉS - A tepsibe helyezés:
   - Béleld ki a tepsit sütőpapírral.
   - Terítsd el a zöldség szeleteket egyenletesen egy rétegben.
   - Fontos, hogy ne legyenek egymásra rakva, mert akkor nem lesznek ropogósak.

7. LÉPÉS - A sütés:
   - Helyezd be a sütőbe 180°C-on.
   - Süsd 20-25 percig, amíg ropogósak lesznek.
   - Félidőben (10-12 perc után) fordítsd meg a szeleteket, hogy mindkét oldaluk egyenletesen süljön.
   - Figyeld, hogy ne égjenek meg - a cékla gyorsabban készül, mint a sárgarépa.

8. LÉPÉS - A készre sütés ellenőrzése:
   - A chips kész, ha ropogósak és széleik enyhén megbarnultak.
   - Ha még puha, süsd tovább 2-3 percig.

9. LÉPÉS - Hűtés:
   - Vedd ki a sütőből és hagyd kihűlni a tepsiben 5 percig.
   - Ezután vedd le a sütőpapírról és helyezd egy tálcára.

10. LÉPÉS - Tálalás:
    - Tálald azonnal, amikor még meleg és ropogós.
    - Tárolható légmentesen zárható dobozban 2-3 napig.

TIPP: Ha nem elég ropogós, süsd még 2-3 percig alacsonyabb hőmérsékleten (160°C)!', 'none', 'nem', 'nem', '180', NULL),
('50g zabpehely, 250ml tej, 1 banán, 1 teáskanál méz, 1 csipet fahéj, 30g mogyoró', '10', 'proteindús', 'nem', 'reggeli', 'https://images.unsplash.com/photo-1570197788417-0e82375c9371?q=80&w=600', 'Banános zabkása

1. LÉPÉS - A hozzávalók előkészítése:
   - Vegyél elő 50g zabpelyhet.
   - Vegyél elő 250ml tejet (tej, mandulatej, zabtej stb.).
   - Vegyél elő 1 érett banánt.
   - Vegyél elő 1 teáskanál mézet.
   - Vegyél elő 1 csipet fahéjat.
   - Vegyél elő 30g mogyorót (vagy más diófélét).

2. LÉPÉS - A tej melegítése:
   - Egy közepes méretű fazékba öntsd a 250ml tejet.
   - Melegítsd közepes lángon, amíg forrni kezd.
   - Figyeld, hogy ne főjön túl, csak forrjon fel.

3. LÉPÉS - A zabpehely hozzáadása:
   - Amikor a tej forrni kezd, add hozzá a 50g zabpelyhet.
   - Azonnal keverd össze, hogy ne legyenek csomók.
   - Csökkentsd a lángot közepes-alacsonyra.

4. LÉPÉS - A főzés:
   - Főzd folyamatos keverés mellett 5 percig.
   - A zabkása kész, amikor sűrű és krémes állagú lesz.
   - Ha túl sűrű, adj hozzá egy kis tejet.
   - Ha túl folyékony, főzz még 1-2 percig.

5. LÉPÉS - A banán előkészítése:
   - Hámozd meg az 1 banánt.
   - Vágd fel vékony szeletekre vagy kockákra.
   - Fél banánt tarts meg a tálaláshoz.

6. LÉPÉS - A banán hozzáadása:
   - Add hozzá a banán felét a zabkásához.
   - Keverd jól össze, hogy a banán részben össze legyen keverve.
   - Főzz még 1 percig, hogy a banán enyhén megpuhuljon.

7. LÉPÉS - A méz hozzáadása:
   - Vedd le a tűzről a zabkását.
   - Csepegtess rá 1 teáskanál mézet.
   - Keverd jól össze.

8. LÉPÉS - A fahéj hozzáadása:
   - Szórd rá 1 csipet fahéjat.
   - Keverd össze.

9. LÉPÉS - A mogyoró előkészítése:
   - A 30g mogyorót durvára aprítsd vagy darabold fel.
   - Ha egész mogyorót használsz, csak durvára törd össze.

10. LÉPÉS - Tálalás:
    - Öntsd a zabkását egy tálba.
    - Tegyél rá a megmaradt banán szeleteket.
    - Szórd rá a mogyorót.
    - Tálald azonnal melegen.

TIPP: Ha szeretnéd, adj hozzá friss gyümölcsöket (eper, málna) vagy magvakat (chia, lenmag) extra tápanyagért!', 'none', 'nem', 'nem', '320', NULL),
('1 liter zöldségleves, 300g vegyes zöldség (brokkoli, sárgarépa, cukkinni), 1 fej vöröshagyma, 2 evőkanál olívaolaj, só, bors, 1 csokor petrezselyem', '20', 'kalóriaszegény', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Zöldséges leves

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát.
   - Hámozd meg és aprítsd finomra.

2. LÉPÉS - A hagyma pirítása:
   - Egy fazékban melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát.
   - Pirítsd 2-3 percig közepes lángon, amíg üveges lesz és illatos.

3. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 300g vegyes zöldséget (brokkoli, sárgarépa, cukkinni).
   - Alaposan mosd meg minden zöldséget hideg vízben.
   - Hámozd meg a sárgarépát.
   - A brokkolit rózsáira szedd.
   - A cukkinnit hámozd meg és távolítsd el a magokat.

4. LÉPÉS - A zöldségek vágása:
   - Vágd kockákra a sárgarépát (kb. 1 cm-es kockák).
   - Vágd kockákra a cukkinnit (kb. 1 cm-es kockák).
   - A brokkolit hagyd kisebb rózsáknak.

5. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá a zöldségeket a pirított hagymához.
   - Keverd jól össze.
   - Pirítsd 2-3 percig, hogy a zöldségek enyhén megpuhuljanak.

6. LÉPÉS - A leves hozzáadása:
   - Öntsd fel az 1 liter zöldséglevest.
   - Forrald fel közepes lángon.

7. LÉPÉS - A főzés:
   - Főzd 15 percig közepes lángon.
   - Folyamatosan keverd, hogy ne égjen le.
   - A zöldségek késznek számítanak, amikor puha lesznek, de még nem szétfőttek.

8. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Ízesítsd tovább, ha szükséges.

9. LÉPÉS - A petrezselyem előkészítése:
   - Vegyél elő 1 csokor friss petrezselymet.
   - Alaposan mosd meg.
   - Finomra vágd.

10. LÉPÉS - Tálalás:
    - Szórd rá a finomra vágott petrezselymet.
    - Tálald forrón egy tálba.
    - Azonnal fogyaszd melegen.

TIPP: Ha szeretnéd krémesebbé tenni, turmixold össze egy részét és keverd vissza a levesbe!', 'none', 'nem', 'nem', '180', NULL),
('400g marhahús steak, 2 teáskanál olívaolaj, 2 gerezd fokhagyma, só, bors, 1 teáskanál friss rozmaring', '20', 'foetel', 'nem', 'prémium', 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?q=80&w=600', 'Marhasteak

1. LÉPÉS - A steak előkészítése:
   - Vegyél elő 400g marhahús steaket (kb. 2 db, egyenként 200g).
   - Ha fagyasztott, hagyd teljesen felolvadni a hűtőben.
   - Vegyél ki a hűtőből 30 percet a sütés előtt, hogy szobahőmérsékletű legyen.

2. LÉPÉS - A steak szárazítása:
   - Töröld le a steakeket papírtörlővel mindkét oldalról.
   - Fontos, hogy száraz legyen a felülete, hogy jól süljön.

3. LÉPÉS - A fűszerezés:
   - Sózd bőven mindkét oldalát a steakeknek.
   - Borsozd frissen őrölt borssal mindkét oldalát.
   - Hagyd állni 5 percig, hogy a só bejárja a húst.

4. LÉPÉS - A serpenyő előkészítése:
   - Vegyél elő egy vastag falú serpenyőt (vas vagy rozsdamentes acél).
   - Melegítsd fel erős lángon 2-3 percig, amíg nagyon forró lesz.
   - Add hozzá a 2 teáskanál olívaolajat.

5. LÉPÉS - A steak sütése - első oldal:
   - Helyezd be a steakeket a forró serpenyőbe.
   - Süsd 3-4 percig erős lángon az első oldalon.
   - Ne mozgasd, amíg nem kell megfordítani.
   - A steak kész, amikor aranybarna kérget kap.

6. LÉPÉS - A steak megfordítása:
   - Fordítsd meg a steakeket.
   - Süsd még 3-4 percig a másik oldalon.
   - Közepes hőmérsékleten süsd.

7. LÉPÉS - A fokhagyma és rozmaring hozzáadása:
   - Az utolsó percben add hozzá az apróra vágott 2 gerezd fokhagymát.
   - Add hozzá az 1 teáskanál friss rozmaringot (finomra vágva).
   - Keverd át a serpenyőben, hogy a steakek körül legyenek.

8. LÉPÉS - A steak készre sütése:
   - A steak kész, ha közepesen átsült (medium) - belül rózsaszín, kívül aranybarna.
   - Ha ritkábban szeretnéd, süsd kevesebb ideig.
   - Ha jobban átsültet szeretnéd, süsd tovább.

9. LÉPÉS - Pihentetés:
   - Vedd ki a steakeket a serpenyőből.
   - Helyezd egy tálcára vagy deszkára.
   - Hagyd pihenni 5 percig - ez kritikus fontosságú!
   - Ne vágd fel azonnal, mert kifolyik a leves.

10. LÉPÉS - Tálalás:
    - Vágd fel vékony szeletekre vagy tálald egészben.
    - Öntsd rá a serpenyőből a fokhagymás-olajos levet.
    - Tálald azonnal melegen.

TIPP: A steak tökéletes, ha belül rózsaszín, kívül aranybarna. A pihentetés elengedhetetlen a szaftos húshoz!', 'none', 'nem', 'nem', '450', NULL),
('200g füstölt sajt, 100g olajbogyó, 50g dió, 2 evőkanál olívaolaj, 1 evőkanál balzsamikó ecet, só, bors', '10', '10órai', 'nem', 'nasi', 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?q=80&w=600', 'Füstölt sajt tál

1. LÉPÉS - A sajt előkészítése:
   - Vegyél elő 200g füstölt sajtot (pl. füstölt trappista, gouda, vagy füstölt mozzarella).
   - Vágd kockákra (kb. 1-1,5 cm-es kockák).
   - Helyezd egy tálba.

2. LÉPÉS - Az olajbogyó előkészítése:
   - Vegyél elő 100g olajbogyót (fekete vagy zöld).
   - Ha magos, távolítsd el a magokat.
   - Vágd fel félbe vagy hagyd egészben, ahogy szereted.
   - Add hozzá a sajthoz a tálba.

3. LÉPÉS - A dió előkészítése:
   - Vegyél elő 50g diót.
   - Durvára aprítsd vagy törd össze kézzel.
   - Ne legyen túl finomra aprítva, legyen benne textúra.
   - Szórd rá a sajt és olajbogyó tetejére.

4. LÉPÉS - A dresszing előkészítése:
   - Vegyél elő egy kis tálat a dresszinghez.
   - Öntsd bele a 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál balzsamikó ecetet.
   - Sózd és borsozd az ízlésed szerint.

5. LÉPÉS - A dresszing keverése:
   - Keverd jól össze a dresszinget egy villával vagy kis habverővel.
   - Próbáld meg, hogy jó legyen az íze.
   - Ha túl savanyú, adj hozzá még olívaolajat.
   - Ha túl semleges, adj hozzá még ecetet.

6. LÉPÉS - A dresszing hozzáadása:
   - Öntsd meg a sajt-olajbogyó-dió keveréket a dresszinggel.
   - Keverd jól össze, hogy minden darab be legyen kenve.

7. LÉPÉS - Az ízesítés:
   - Ízesítsd még, ha szükséges.
   - Próbáld meg, hogy jó legyen az íze.

8. LÉPÉS - Pihentetés:
   - Hagyd állni 5-10 percig, hogy az ízek összeérjenek.
   - Ne tálald azonnal, hagyd, hogy a sajt felszívja a dresszinget.

9. LÉPÉS - Tálalás előkészítése:
   - Keverd át még egyszer, mielőtt tálalnád.
   - Ellenőrizd, hogy minden egyenletesen el legyen osztva.

10. LÉPÉS - Tálalás:
    - Tálald egy szép tálban vagy kis tálakban.
    - Szolgáld frissen készítve.
    - Ideális előételként vagy nasi módjára.

TIPP: Ha szeretnéd, adj hozzá friss bazsalikomot vagy petrezselymet a tetejére tálalás előtt!', 'none', 'nem', 'nem', '220', NULL),
('800g csirkehús, 1 liter víz, 200g tészta, 1 fej vöröshagyma, 2 gerezd fokhagyma, só, bors, 1 csokor petrezselyem', '40', 'foetel', 'nem', 'tradicionális', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Karcagi leves

1. LÉPÉS - A csirkehús előkészítése:
   - Vegyél elő 800g csirkehúst (comb, mell vagy egész csirke).
   - Ha szükséges, vágd kisebb darabokra.
   - Alaposan mosd meg hideg vízben.

2. LÉPÉS - A főzés kezdete:
   - Egy nagy fazékba helyezd a csirkehúst.
   - Öntsd fel 1 liter hideg vízzel.
   - Add hozzá egy csipet sót.
   - Forrald fel erős lángon.

3. LÉPÉS - A hab eltávolítása:
   - Amikor forrni kezd, habzani fog a teteje.
   - Szedd le a habot egy szűrőkanállal vagy kanállal.
   - Ismételd meg, amíg már nem jön fel hab.

4. LÉPÉS - A főzés folytatása:
   - Csökkentsd a lángot közepesre.
   - Főzd 25 percig, amíg a hús megpuhul.
   - Folyamatosan figyeld, hogy ne főjön túl.

5. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg mindkettőt.
   - Aprítsd finomra a vöröshagymát.
   - Aprítsd finomra vagy nyomd át a fokhagymát.

6. LÉPÉS - A hagyma hozzáadása:
   - Add hozzá a finomra vágott hagymát és fokhagymát a leveshez.
   - Főzz még 10 percig közepes lángon.
   - Keverd át időnként.

7. LÉPÉS - A tészta előkészítése:
   - Vegyél elő 200g tésztát (csiga, cső, vagy bármilyen kis tészta).
   - Ha nagyobb tészta, törd kisebb darabokra.

8. LÉPÉS - A tészta hozzáadása:
   - Add hozzá a tésztát a leveshez.
   - Főzz még 8-10 percig, amíg a tészta megpuhul.
   - Folyamatosan keverd, hogy ne ragadjon le.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Ízesítsd tovább, ha szükséges.
   - Próbáld meg, hogy jó legyen az íze.

10. LÉPÉS - A petrezselyem és tálalás:
    - Vegyél elő 1 csokor friss petrezselymet.
    - Alaposan mosd meg.
    - Finomra vágd.
    - Szórd rá a leves tetejére.
    - Tálald forrón egy tálba.
    - Azonnal fogyaszd melegen.

TIPP: A leves még jobb lesz másnap, amikor az ízek összeérnek! Tárolható hűtőben 2-3 napig.', 'none', 'nem', 'nem', '180', NULL),
('500ml tej, 100g cukor, 4 tojás sárgája, 50g liszt, 1 teáskanál vanília, 50g mazsola', '30', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1551024506-0bccd828d307?q=80&w=600', 'Szakács puding

1. LÉPÉS - A hozzávalók előkészítése:
   - Vegyél elő 500ml tejet.
   - Vegyél elő 100g cukrot.
   - Vegyél elő 4 tojást.
   - Vegyél elő 50g lisztet.
   - Vegyél elő 1 teáskanál vaníliát (vanília kivonat vagy vaníliás cukor).
   - Vegyél elő 50g mazsolát.

2. LÉPÉS - A tojások szétválasztása:
   - Válaszd szét a 4 tojást - csak a sárgájára van szükségünk.
   - Tedd félre a fehérjét (nem használjuk).
   - A 4 tojássárgát helyezd egy közepes méretű tálba.

3. LÉPÉS - A tojássárgák keverése:
   - Add hozzá a 100g cukrot a tojássárgákhoz.
   - Keverd habosra elektromos keverővel vagy kézzel, amíg világossárga és habos lesz (2-3 perc).

4. LÉPÉS - A liszt hozzáadása:
   - Add hozzá a 50g lisztet a tojássárgákhoz.
   - Keverd jól össze, amíg sima lesz.
   - Ne legyenek csomók.

5. LÉPÉS - A tej melegítése:
   - Egy fazékba öntsd a 500ml tejet.
   - Melegítsd közepes lángon, amíg forrni kezd.
   - Figyeld, hogy ne főjön túl.

6. LÉPÉS - A tej hozzáadása a tojáshoz:
   - Lassan, folyamatosan keverve add hozzá a meleg tejet a tojás-cukor-liszt keverékhez.
   - Fontos, hogy lassan add hozzá, különben a tojás megfő.
   - Add hozzá folyamatosan keverve, amíg minden tej be nem kerül.

7. LÉPÉS - A főzés:
   - Öntsd vissza az egészet a fazékba.
   - Főzd közepes-alacsony lángon 10-12 percig, folyamatosan keverve.
   - Fontos, hogy folyamatosan keverd, különben leég vagy csomós lesz.
   - A puding kész, amikor besűrűsödik és krémes állagú lesz.

8. LÉPÉS - A vanília és mazsola hozzáadása:
   - Amikor a puding besűrűsödött, add hozzá az 1 teáskanál vaníliát.
   - Add hozzá a 50g mazsolát.
   - Keverd jól össze.

9. LÉPÉS - Hűtés:
   - Vedd le a tűzről.
   - Öntsd tálakba vagy egy nagy tálba.
   - Hagyd kihűlni szobahőmérsékleten 10 percig.
   - Ezután helyezd hűtőbe legalább 2-3 órára, hogy teljesen kihűljön.

10. LÉPÉS - Tálalás:
    - Tálald hidegen.
    - Szolgáld tálakban, tetejét megszórhatod kakaóporral vagy vaníliás cukorral.
    - Ideális hideg desszertként.

TIPP: A puding még jobb lesz, ha egy éjszakát hűtőben pihenteted! Ha csomós lesz, turmixold össze simára.', 'none', 'nem', 'nem', '200', NULL),
('200g liszt, 100g vaj, 50g cukor, 1 tojás, 1 teáskanál sütőpor, 1 csipet só', '25', 'desszert', 'nem', 'nasi', 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=600&q=80', 'Keksz

A vajat keverd össze a cukorral. Add hozzá a tojást. A lisztet, sütőport és sót keverd össze, majd add hozzá. Dagasztd sima tésztáig. Nyújtsd ki és formáld ki a kekszeket. 180°C-on süsd 12-15 percig. Hűtsd le.', 'none', 'nem', 'nem', '220', NULL),
('300g tofu, 200g vegyes saláta, 1 paradicsom, 1/2 uborka, 2 evőkanál szójaszósz, 1 evőkanál olívaolaj, só, bors', '15', 'proteindús', 'nem', 'vegán', 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600&q=80', 'Tofu saláta

1. LÉPÉS - A tofu előkészítése:
   - Vegyél elő 300g tofut (kemény vagy közepes keménységű).
   - Szárazítsd le papírtörlővel, hogy eltávolítsd a felesleges vizet.
   - Vágd kockákra (kb. 2 cm-es kockák).

2. LÉPÉS - A tofu sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá 1 evőkanál olívaolajat.
   - Helyezd be a tofu kockákat.
   - Süsd 5-6 percig, amíg aranybarnák lesznek mindkét oldalon.
   - Fordítsd meg időnként, hogy mindkét oldaluk egyenletesen süljön.

3. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 200g vegyes salátát (jégsaláta, rukkola, spenót stb.).
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le saláta centrifuga segítségével vagy papírtörlővel.
   - Tépd kisebb darabokra vagy hagyd nagyobb leveleknek.
   - Helyezd egy nagy tálba.

4. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 1 friss paradicsomot.
   - Alaposan mosd meg.
   - Vágd kockákra vagy szeletekre.
   - Add hozzá a salátához.

5. LÉPÉS - Az uborka előkészítése:
   - Vegyél elő 1/2 uborkát.
   - Alaposan mosd meg.
   - Hámozd meg, ha szükséges (a héj lehet keserű).
   - Vágd vékony szeletekre vagy kockákra.
   - Add hozzá a salátához.

6. LÉPÉS - A sült tofu hozzáadása:
   - Amikor a tofu kész és aranybarna, vedd ki a serpenyőből.
   - Helyezd rá a salátára a tálban.
   - Hagyd kihűlni 2-3 percig.

7. LÉPÉS - A dresszing előkészítése:
   - Vegyél elő egy kis tálat a dresszinghez.
   - Öntsd bele a 2 evőkanál szójaszószt.
   - Add hozzá az 1 evőkanál olívaolajat.
   - Sózd és borsozd az ízlésed szerint.

8. LÉPÉS - A dresszing keverése:
   - Keverd jól össze a dresszinget egy villával vagy kis habverővel.
   - Próbáld meg, hogy jó legyen az íze.
   - Ha túl erős, adj hozzá még olívaolajat.
   - Ha túl semleges, adj hozzá még szójaszószt.

9. LÉPÉS - A dresszing hozzáadása:
   - Öntsd meg a salátát a dresszinggel.
   - Keverd jól össze, hogy minden darab be legyen kenve.
   - Ügyelj rá, hogy a tofu is be legyen kenve.

10. LÉPÉS - Tálalás:
    - Tálald azonnal, amikor még friss.
    - Ideális könnyű ebédként vagy vacsoraként.
    - Szolgáld egy szép tálban.

TIPP: Ha szeretnéd, adj hozzá szezámmagot vagy pirított mogyorót extra textúráért és ízért!', 'none', 'nem', 'nem', '200', NULL),
('200g saláta, 100g csirkemell, 50g parmezán, 2 evőkanál olívaolaj, 1 evőkanál citrom leve, só, bors', '15', 'kalóriaszegény', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=600', 'Cézár saláta (light)

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 100g csirkemellet.
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le papírtörlővel.
   - Sózd és borsozd mindkét oldalát.

2. LÉPÉS - A csirkemell sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá 1 evőkanál olívaolajat.
   - Helyezd be a csirkemellet.
   - Süsd 5-6 percig mindkét oldalon, amíg átsül és aranybarna lesz.
   - Ellenőrizd, hogy belül is átsült-e (nem lehet rózsaszín).

3. LÉPÉS - A csirkemell hűtése és szeletelése:
   - Vedd ki a serpenyőből és hagyd kihűlni 5 percig.
   - Vágd vékony szeletekre vagy kockákra.
   - Tedd félre.

4. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 200g salátát (jégsaláta, római saláta stb.).
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le saláta centrifuga segítségével vagy papírtörlővel.
   - Tépd kisebb darabokra vagy hagyd nagyobb leveleknek.
   - Helyezd egy nagy tálba.

5. LÉPÉS - A csirkemell hozzáadása:
   - Add hozzá a szeletelt csirkemellet a salátához.
   - Keverd jól össze.

6. LÉPÉS - A parmezán előkészítése:
   - Vegyél elő 50g parmezánt.
   - Reszeld finomra reszelővel.
   - Szórd rá a salátára.

7. LÉPÉS - A dresszing előkészítése:
   - Vegyél elő egy kis tálat a dresszinghez.
   - Öntsd bele a 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál citrom levét.
   - Sózd és borsozd az ízlésed szerint.

8. LÉPÉS - A dresszing keverése:
   - Keverd jól össze a dresszinget egy villával vagy kis habverővel.
   - Próbáld meg, hogy jó legyen az íze.
   - Ha túl savanyú, adj hozzá még olívaolajat.
   - Ha túl semleges, adj hozzá még citrom levét.

9. LÉPÉS - A dresszing hozzáadása:
   - Öntsd meg a salátát a dresszinggel.
   - Keverd jól össze, hogy minden darab be legyen kenve.

10. LÉPÉS - Tálalás:
    - Tálald azonnal, amikor még friss.
    - Ideális könnyű ebédként vagy vacsoraként.
    - Szolgáld egy szép tálban.

TIPP: Ha szeretnéd, adj hozzá krutonokat vagy pirított kenyérkockákat extra ropogósságért!', 'none', 'nem', 'nem', '200', NULL),
('250g lasagne tészta, 400g paradicsom, 200g ricotta, 100g parmezán, 1 fej vöröshagyma, 2 gerezd fokhagyma, 2 evőkanál olívaolaj, só, bors, 1 csokor bazsalikom', '50', 'foetel', 'nem', 'olasz', 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?q=80&w=600', 'Vegetáriánus lasagne

1. LÉPÉS - A sütő előkészítése:
   - Melegítsd elő a sütőt 180°C-ra.
   - Vegyél elő egy 20x30 cm-es tepsit vagy lasagne formát.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg mindkettőt.
   - Aprítsd finomra a vöröshagymát.
   - Aprítsd finomra vagy nyomd át a fokhagymát.

3. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2-3 percig közepes lángon, amíg üveges lesz és illatos.

4. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 400g paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Vágd kockákra vagy darabold fel.
   - Ha konzervált paradicsomot használsz, használd az egészet levével együtt.

5. LÉPÉS - A paradicsomos szósz készítése:
   - Add hozzá a paradicsomot a hagymához.
   - Főzz 10 percig közepes lángon, amíg a paradicsom megpuhul.
   - Keverd időnként.
   - Ha szükséges, turmixold össze simára vagy hagyd darabosnak.
   - Sózd és borsozz az ízlésed szerint.

6. LÉPÉS - A ricotta előkészítése:
   - Vegyél elő 200g ricottát.
   - Keverd át egy villával, hogy krémes legyen.
   - Ha szükséges, sózd és borsozd.

7. LÉPÉS - A parmezán előkészítése:
   - Vegyél elő 100g parmezánt.
   - Reszeld finomra reszelővel.

8. LÉPÉS - A lasagne rétegezése:
   - Először önts egy vékony réteg paradicsomos szószt a tepsibe.
   - Helyezd rá a lasagne tészta lapokat (250g, szükség szerint).
   - Önts rá még egy réteg paradicsomos szószt.
   - Kenj rá ricottát.
   - Ismételd meg a rétegezést: tészta, paradicsomos szósz, ricotta.
   - Az utolsó réteg legyen paradicsomos szósz.

9. LÉPÉS - A parmezán hozzáadása:
   - Szórd rá a reszelt parmezánt a tetejére.
   - Egyenletesen oszd el.

10. LÉPÉS - A sütés:
    - Helyezd be a sütőbe 180°C-on.
    - Süsd 35-40 percig, amíg a teteje aranybarna és a tészta megpuhult.
    - Közben ne nyisd ki a sütőt az első 25 percben.

11. LÉPÉS - A bazsalikom és tálalás:
    - Vegyél elő 1 csokor friss bazsalikomot.
    - Alaposan mosd meg.
    - Finomra vágd vagy tépd fel.
    - Szórd rá a lasagne tetejére tálalás előtt.
    - Hagyd kihűlni 5-10 percig, mielőtt felszeletelnéd.
    - Tálald melegen.

TIPP: A lasagne még jobb lesz másnap, amikor az ízek összeérnek! Tárolható hűtőben 2-3 napig.', 'none', 'nem', 'nem', '480', NULL),
('4 piros paprika, 2 evőkanál olívaolaj, 2 gerezd fokhagyma, só, bors, 1 evőkanál balzsamikó ecet', '20', '10órai', 'nem', 'mediterrán', 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600&q=80', 'Sült paprika

1. LÉPÉS - A sütő előkészítése:
   - Melegítsd elő a sütőt 200°C-ra.
   - Vegyél elő egy tepsit és sütőpapírt.

2. LÉPÉS - A paprika előkészítése:
   - Vegyél elő 4 piros paprikát.
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le.
   - Távolítsd el a szárát és a magokat belülről.
   - Vágd félbe vagy hagyd egésznek.

3. LÉPÉS - A paprika sütése:
   - Béleld ki a tepsit sütőpapírral.
   - Helyezd rá a paprikákat belső felével lefelé.
   - Helyezd be a sütőbe 200°C-on.
   - Süsd 15 percig, amíg a héj megfeketedik és megpuhul.
   - Fordítsd meg félidőben, ha szükséges.

4. LÉPÉS - A paprika hűtése és hámozása:
   - Vedd ki a sütőből.
   - Helyezd egy tálba és takard le, vagy helyezd egy zacskóba.
   - Hagyd 5-10 percig, hogy gőzöljön és könnyebb legyen a hámozás.
   - Hámozd meg a paprikákat - a megfeketedett héj könnyen lejön.

5. LÉPÉS - A paprika szeletelése:
   - Vágd fel vékony csíkokra vagy szeletekre.
   - Helyezd egy tálba.

6. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Hámozd meg.
   - Aprítsd finomra vagy nyomd át.

7. LÉPÉS - A dresszing előkészítése:
   - Vegyél elő egy kis tálat a dresszinghez.
   - Öntsd bele a 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál balzsamikó ecetet.
   - Add hozzá az apróra vágott fokhagymát.
   - Sózd és borsozd az ízlésed szerint.

8. LÉPÉS - A dresszing keverése:
   - Keverd jól össze a dresszinget egy villával vagy kis habverővel.
   - Próbáld meg, hogy jó legyen az íze.

9. LÉPÉS - A dresszing hozzáadása:
   - Öntsd meg a paprikát a dresszinggel.
   - Keverd jól össze, hogy minden darab be legyen kenve.

10. LÉPÉS - Pihentetés és tálalás:
    - Hagyd állni 10-15 percig, hogy az ízek összeérjenek.
    - Tálald hidegen vagy melegen.
    - Ideális előételként vagy köretként.

TIPP: A sült paprika még jobb lesz, ha egy éjszakát hűtőben pihenteted! Tárolható hűtőben 3-4 napig.', 'none', 'nem', 'nem', '220', NULL),
('500g karfiol, 500ml zöldségleves, 1 fej vöröshagyma, 100ml tejszín, 2 evőkanál olívaolaj, só, bors', '25', 'foetel', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Karfiol krém

1. LÉPÉS - A karfiol előkészítése:
   - Vegyél elő 500g karfiolt.
   - Alaposan mosd meg hideg vízben.
   - Vágd rózsáira vagy kisebb darabokra.
   - Távolítsd el a vastag szárát.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hagyma pirítása:
   - Egy fazékban melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát.
   - Pirítsd 2-3 percig közepes lángon, amíg üveges lesz és illatos.

4. LÉPÉS - A karfiol hozzáadása:
   - Add hozzá a karfiol rózsáit a hagymához.
   - Keverd jól össze.
   - Pirítsd 2-3 percig, hogy enyhén megpuhuljon.

5. LÉPÉS - A leves hozzáadása:
   - Öntsd fel az 500ml zöldséglevest.
   - Forrald fel közepes lángon.

6. LÉPÉS - A főzés:
   - Főzd 15 percig közepes lángon, amíg a karfiol teljesen megpuhul.
   - Folyamatosan keverd, hogy ne égjen le.
   - A karfiol kész, amikor könnyen átszúrható villával.

7. LÉPÉS - A turmixolás:
   - Vedd le a tűzről.
   - Turmixold le simára botmixerrel vagy turmixgépben.
   - Ügyelj rá, hogy ne legyenek darabok.
   - Ha túl sűrű, adj hozzá még egy kis levest.

8. LÉPÉS - A tejszín hozzáadása:
   - Add hozzá a 100ml tejszínt.
   - Keverd jól össze.

9. LÉPÉS - A főzés folytatása:
   - Helyezd vissza a tűzre.
   - Főzz még 2-3 percig közepes lángon.
   - Ne forrald fel, csak melegítsd.
   - Folyamatosan keverd.

10. LÉPÉS - Fűszerezés és tálalás:
    - Sózd és borsozz az ízlésed szerint.
    - Próbáld meg, hogy jó legyen az íze.
    - Tálald forrón egy tálba.
    - Azonnal fogyaszd melegen.

TIPP: Ha szeretnéd, szórd rá pirított magvakat vagy friss petrezselymet a tetejére tálalás előtt!', 'none', 'nem', 'nem', '220', NULL),
('400g sütőtök, 200ml tejszín, 100g cukor, 2 tojás, 1 teáskanál fahéj, 1 teáskanál vanília', '40', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1621303837174-89787a7d4729?q=80&w=600', 'Sütőtökös desszert

1. LÉPÉS - A sütő előkészítése:
   - Melegítsd elő a sütőt 180°C-ra.
   - Vegyél elő egy tepsit és sütőpapírt.

2. LÉPÉS - A sütőtök előkészítése:
   - Vegyél elő 400g sütőtököt.
   - Alaposan mosd meg hideg vízben.
   - Vágd félbe és távolítsd el a magokat.
   - Hámozd meg vagy hagyd a héján (a héj ehető, de ha kemény, hámozd le).
   - Vágd kockákra vagy szeletekre.

3. LÉPÉS - A sütőtök első sütése:
   - Béleld ki a tepsit sütőpapírral.
   - Helyezd rá a sütőtök darabokat.
   - Helyezd be a sütőbe 180°C-on.
   - Süsd 25 percig, amíg megpuhul és könnyen átszúrható villával.
   - Fordítsd meg félidőben, ha szükséges.

4. LÉPÉS - A sütőtök hűtése és pürésítése:
   - Vedd ki a sütőből és hagyd kihűlni 10 percig.
   - Pürésítsd botmixerrel vagy villával, amíg sima lesz.
   - Hagyd teljesen kihűlni.

5. LÉPÉS - A tojások előkészítése:
   - Vegyél elő 2 tojást.
   - Törj be egy tálba.
   - Keverd át villával.

6. LÉPÉS - A keverék előkészítése:
   - Egy nagy tálba helyezd a sütőtök pürét.
   - Add hozzá a 200ml tejszínt.
   - Add hozzá a 100g cukrot.
   - Add hozzá a 2 tojást.
   - Add hozzá az 1 teáskanál fahéjat.
   - Add hozzá az 1 teáskanál vaníliát.

7. LÉPÉS - A keverék keverése:
   - Keverd jól össze minden hozzávalót.
   - Ügyelj rá, hogy sima és egyenletes legyen.
   - Ne legyenek csomók.

8. LÉPÉS - A tepsibe öntés:
   - Vegyél elő egy 20x20 cm-es tepsit vagy formát.
   - Vajazd be vagy béleld ki sütőpapírral.
   - Öntsd bele a keveréket.
   - Simítsd el egyenletesen.

9. LÉPÉS - A második sütés:
   - Helyezd be a sütőbe 180°C-on.
   - Süsd 25-30 percig, amíg a teteje aranybarna és a közepén egy fogpiszkáló tiszta jön ki.
   - Közben ne nyisd ki a sütőt az első 20 percben.

10. LÉPÉS - Hűtés és tálalás:
    - Vedd ki a sütőből és hagyd kihűlni szobahőmérsékleten 30 percig.
    - Ezután helyezd hűtőbe legalább 2-3 órára, hogy teljesen kihűljön.
    - Tálald hidegen.
    - Szolgáld kockákban vagy szeletekben.

TIPP: A desszert még jobb lesz, ha egy éjszakát hűtőben pihenteted! Tárolható hűtőben 3-4 napig.', 'none', 'nem', 'nem', '200', NULL),
('200g vegyes gyümölcs (alma, banán, eper, málna), 2 evőkanál méz, 1 citrom leve, 1 csipet fahéj', '10', 'desszert', 'nem', 'nasi', 'https://images.unsplash.com/photo-1488477181946-6428a0291777?q=80&w=600', 'Gyümölcssaláta

1. LÉPÉS - A gyümölcsök előkészítése:
   - Vegyél elő 200g vegyes gyümölcsöt (alma, banán, eper, málna).
   - Alaposan mosd meg minden gyümölcsöt hideg vízben.
   - Szárazítsd le.

2. LÉPÉS - Az alma előkészítése:
   - Hámozd meg az almát.
   - Távolítsd el a magházat.
   - Vágd kockákra vagy szeletekre.
   - Azonnal csepegtess rá citrom levét, hogy ne barnuljon meg.

3. LÉPÉS - A banán előkészítése:
   - Hámozd meg a banánt.
   - Vágd vékony szeletekre vagy kockákra.
   - Azonnal add hozzá a salátához, hogy ne barnuljon meg.

4. LÉPÉS - Az eper előkészítése:
   - Távolítsd el az eper szárát.
   - Ha nagy, vágd félbe vagy negyedelj.
   - Ha kicsi, hagyd egésznek.

5. LÉPÉS - A málna előkészítése:
   - Alaposan mosd meg a málna.
   - Szárazítsd le.
   - Ha nagy, vágd félbe.
   - Ha kicsi, hagyd egésznek.

6. LÉPÉS - A saláta összeállítása:
   - Egy nagy tálba helyezd az összes előkészített gyümölcsöt.
   - Keverd jól össze.

7. LÉPÉS - A citrom levének hozzáadása:
   - Vegyél elő 1 citromot.
   - Fáraszd ki a levét (kb. 2-3 evőkanál).
   - Csepegtess rá a gyümölcsre.
   - Keverd jól össze, hogy minden darab be legyen kenve.

8. LÉPÉS - A méz hozzáadása:
   - Csepegtess rá 2 evőkanál mézet.
   - Keverd jól össze, hogy egyenletesen el legyen osztva.

9. LÉPÉS - A fahéj hozzáadása:
   - Szórd rá 1 csipet fahéjat.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Tálald azonnal hidegen.
    - Ideális reggeliként, uzsonnaként vagy desszertként.
    - Szolgáld egy szép tálban.

TIPP: A saláta legjobb frissen készítve, de tárolható hűtőben 1-2 óráig!', 'none', 'nem', 'nem', '200', NULL),
('200g főzött csicseriborsó, 150g vegyes saláta, 1 paradicsom, 50g feta sajt, 2 evőkanál olívaolaj, 1 evőkanál citrom leve, só, bors', '12', 'proteindús', 'nem', 'vegán', 'https://images.unsplash.com/photo-1546069901-d5bfd2c066b1?w=600&q=80', 'Csicseriborsó tál

1. LÉPÉS - A csicseriborsó előkészítése:
   - Vegyél elő 200g főzött csicseriborsót.
   - Ha konzervált, csepegtesse le a levét és mosd meg hideg vízben.
   - Ha friss, főzd meg előre, amíg puha lesz.
   - Helyezd egy nagy tálba.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 150g vegyes salátát (jégsaláta, rukkola, spenót stb.).
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le saláta centrifuga segítségével vagy papírtörlővel.
   - Tépd kisebb darabokra vagy hagyd nagyobb leveleknek.
   - Add hozzá a csicseriborsóhoz.

3. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 1 friss paradicsomot.
   - Alaposan mosd meg.
   - Vágd kockákra vagy szeletekre.
   - Add hozzá a tálhoz.

4. LÉPÉS - A feta sajt előkészítése:
   - Vegyél elő 50g feta sajtot.
   - Apróra zúzd vagy vágd kockákra.
   - Szórd rá a tálra.

5. LÉPÉS - A dresszing előkészítése:
   - Vegyél elő egy kis tálat a dresszinghez.
   - Öntsd bele a 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál citrom levét.
   - Sózd és borsozd az ízlésed szerint.

6. LÉPÉS - A dresszing keverése:
   - Keverd jól össze a dresszinget egy villával vagy kis habverővel.
   - Próbáld meg, hogy jó legyen az íze.
   - Ha túl savanyú, adj hozzá még olívaolajat.
   - Ha túl semleges, adj hozzá még citrom levét.

7. LÉPÉS - A dresszing hozzáadása:
   - Öntsd meg a tálat a dresszinggel.
   - Keverd jól össze, hogy minden darab be legyen kenve.

8. LÉPÉS - Az ízesítés:
   - Ízesítsd még, ha szükséges.
   - Próbáld meg, hogy jó legyen az íze.

9. LÉPÉS - Pihentetés:
   - Hagyd állni 5-10 percig, hogy az ízek összeérjenek.
   - Ne tálald azonnal.

10. LÉPÉS - Tálalás:
    - Tálald azonnal, amikor még friss.
    - Ideális könnyű ebédként vagy vacsoraként.
    - Szolgáld egy szép tálban.

TIPP: Ha szeretnéd, adj hozzá pirított magvakat vagy olajbogyót extra ízért és textúráért!', 'none', 'nem', 'nem', '380', NULL),
('300g liszt, 150g vaj, 400g vegyes zöldség (spenót, brokkoli, sárgarépa), 3 tojás, 100ml tejszín, só, bors', '45', 'kalóriaszegény', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=600&q=80', 'Zöldséges pite

1. LÉPÉS - A sütő előkészítése:
   - Melegítsd elő a sütőt 180°C-ra.
   - Vegyél elő egy 20x30 cm-es tepsit.

2. LÉPÉS - A tészta előkészítése:
   - Vegyél elő 300g lisztet és 150g vajat.
   - Egy tálba helyezd a lisztet.
   - Add hozzá a vajat (szobahőmérsékleten puha vagy apróra vágva).
   - Keverd össze kézzel vagy villával, amíg morzsa állagú lesz.

3. LÉPÉS - A tészta dagasztása:
   - Dagasztd sima tésztáig.
   - Ha túl száraz, adj hozzá egy kis vizet.
   - Ha túl nedves, adj hozzá még lisztet.
   - Csomagold be frissentartó fóliába és hagyd pihenni 30 percig a hűtőben.

4. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 400g vegyes zöldséget (spenót, brokkoli, sárgarépa).
   - Alaposan mosd meg minden zöldséget hideg vízben.
   - A spenótot tépd kisebb darabokra.
   - A brokkolit rózsáira szedd.
   - A sárgarépát hámozd meg és vágd kockákra.

5. LÉPÉS - A zöldségek párolása:
   - Egy serpenyőben vagy fazékban párold a zöldségeket 5 percig.
   - Add hozzá egy kis vizet vagy olívaolajat.
   - Folyamatosan keverd.
   - A zöldségek késznek számítanak, amikor enyhén megpuhulnak, de még nem szétfőttek.

6. LÉPÉS - A zöldségek hűtése:
   - Vedd le a tűzről és hagyd kihűlni 10 percig.
   - Szűrd le a felesleges vizet, ha van.

7. LÉPÉS - A töltelék előkészítése:
   - Vegyél elő 3 tojást és 100ml tejszínt.
   - Egy tálba törj be a 3 tojást.
   - Keverd át villával.
   - Add hozzá a 100ml tejszínt.
   - Keverd jól össze.

8. LÉPÉS - A töltelék összeállítása:
   - Add hozzá a párolt zöldségeket a tojás-tejszín keverékhez.
   - Keverd jól össze.
   - Sózd és borsozz az ízlésed szerint.

9. LÉPÉS - A tészta kinyújtása:
   - Vedd ki a tésztát a hűtőből.
   - Nyújtsd ki egy deszkán vagy munkafelületen.
   - Legyen kb. 3-4 mm vastag.
   - Helyezd a tepsibe.
   - Nyomd le az oldalakat és alját.

10. LÉPÉS - A töltelék hozzáadása és sütés:
    - Öntsd bele a zöldséges tölteléket a tésztába.
    - Simítsd el egyenletesen.
    - Helyezd be a sütőbe 180°C-on.
    - Süsd 35-40 percig, amíg a tészta aranybarna és a töltelék megsül.
    - Közben ne nyisd ki a sütőt az első 25 percben.

11. LÉPÉS - Hűtés és tálalás:
    - Vedd ki a sütőből és hagyd kihűlni 10 percig.
    - Vágd szeletekre.
    - Tálald melegen vagy hidegen.

TIPP: A pite még jobb lesz másnap, amikor az ízek összeérnek! Tárolható hűtőben 2-3 napig.', 'none', 'nem', 'nem', '380', NULL),
('500g burgonya, 200g szalonna, 2 gerezd fokhagyma, 2 evőkanál olívaolaj, só, bors, 1 csokor petrezselyem', '30', 'foetel', 'nem', 'klasszikus', 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?q=80&w=600', 'Szalonnás sültkrumpli

1. LÉPÉS - A burgonya előkészítése:
   - Vegyél elő 500g burgonyát.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg vagy hagyd a héján (ha tetszik).
   - Vágd egyenletes kockákra (kb. 2 cm-es kockák).
   - Szárazítsd le papírtörlővel.

2. LÉPÉS - A szalonna előkészítése:
   - Vegyél elő 200g szalonnát.
   - Vágd kis darabkákra vagy csíkokra (kb. 1 cm-es darabok).

3. LÉPÉS - A szalonna pirítása:
   - Egy nagy serpenyőben vagy tepsiben melegítsd fel közepes lángon.
   - Add hozzá a szalonna darabokat.
   - Pirítsd 3-4 percig, amíg ropogós lesz és kiengedi a zsírt.
   - Folyamatosan keverd.

4. LÉPÉS - A burgonya hozzáadása:
   - Add hozzá a burgonya kockákat a szalonnához.
   - Keverd jól össze, hogy minden kocka be legyen kenve a zsírral.

5. LÉPÉS - A sütés:
   - Süsd 20-25 percig közepes lángon.
   - Folyamatosan keverd, hogy egyenletesen süljön.
   - A burgonya kész, amikor ropogós kívül és puha belül.
   - Ha szükséges, süsd tovább, amíg aranybarna lesz.

6. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Hámozd meg.
   - Aprítsd finomra vagy nyomd át.

7. LÉPÉS - A fokhagyma hozzáadása:
   - Az utolsó percben add hozzá az apróra vágott fokhagymát.
   - Keverd jól össze.
   - Főzz még 1 percig, hogy a fokhagyma illatos legyen, de ne égjen meg.

8. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Próbáld meg, hogy jó legyen az íze.

9. LÉPÉS - A petrezselyem előkészítése:
   - Vegyél elő 1 csokor friss petrezselymet.
   - Alaposan mosd meg.
   - Finomra vágd.

10. LÉPÉS - Tálalás:
    - Szórd rá a finomra vágott petrezselymet.
    - Tálald azonnal melegen.
    - Ideális ebédként vagy vacsoraként.

TIPP: Ha szeretnéd, adj hozzá fűszerpaprikát vagy csípős paprikát extra ízért!', 'none', 'nem', 'nem', '480', NULL),
('4 szelet fehér kenyér, 100g kaviár, 100g krémsajt, 1 citrom, 1 csokor kapor', '10', '10órai', 'nem', 'luxus', 'https://images.unsplash.com/photo-1509722747041-616f39b57569?q=80&w=600', 'Kaviáros falat

1. LÉPÉS - A kenyér előkészítése:
   - Vegyél elő 4 szelet fehér kenyeret.
   - Vágd kisebb darabokra vagy hagyd egésznek (kanapé méretűre).
   - Ha szükséges, vágd le a héját.

2. LÉPÉS - A kenyér piritása:
   - Egy piritóban vagy serpenyőben pirítsd meg a kenyeret.
   - Pirítsd aranybarnára mindkét oldalon.
   - Hagyd kihűlni 2-3 percig.

3. LÉPÉS - A krémsajt előkészítése:
   - Vegyél elő 100g krémsajtot (pl. Philadelphia, vagy más krémsajt).
   - Hagyd szobahőmérsékletűre, hogy könnyebb legyen kenni.
   - Keverd át egy villával, ha szükséges.

4. LÉPÉS - A krémsajt kenése:
   - Kenj rá egy vékony réteg krémsajtot minden kenyérszeletre.
   - Egyenletesen oszd el.
   - Ne legyen túl vastag réteg.

5. LÉPÉS - A kaviár előkészítése:
   - Vegyél elő 100g kaviárt.
   - Nyisd ki azonnal előtt, hogy tálalnád.
   - Ne keverd össze, hagyd egésznek.

6. LÉPÉS - A kaviár hozzáadása:
   - Helyezd rá a kaviárt a krémsajtra egyenletesen.
   - Ne nyomd össze, hagyd, hogy szép legyen.
   - Használj egy kis kanalat vagy tálat a kaviár hozzáadásához.

7. LÉPÉS - A citrom előkészítése:
   - Vegyél elő 1 friss citromot.
   - Fáraszd ki a levét (kb. 1-2 evőkanál).

8. LÉPÉS - A citrom levének hozzáadása:
   - Csepegtess rá egy kis citrom levét minden kaviáros falatra.
   - Ne legyen túl sok, csak egy kis csepp.

9. LÉPÉS - A kapor előkészítése:
   - Vegyél elő 1 csokor friss kaprot.
   - Alaposan mosd meg.
   - Finomra vágd vagy hagyd leveleknek.

10. LÉPÉS - Tálalás:
    - Szórd rá a kaprot a kaviáros falatokra.
    - Tálald azonnal.
    - Ideális előételként vagy luxus nasi módjára.
    - Szolgáld egy szép tálcán vagy tálban.

TIPP: A kaviáros falat legjobb frissen készítve! Ne készítsd előre, mert a kenyér puha lesz.', 'none', 'nem', 'nem', '220', NULL);

INSERT INTO `receptek` (`hozzavalo`, `ido`, `meal`, `unnepi_etelek`, `kulonlegesseg`, `kepek`, `recept_hozzaadas`, `allergens`, `edes`, `sos`, `kaloria`, `felhasznalo_id`) VALUES
('600g csirkehús, 1.5 liter víz, 200g tészta, 1 fej vöröshagyma, 2 gerezd fokhagyma, só, bors, 1 csokor petrezselyem', '40', 'foetel', 'nem', 'tradicionális', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Csirkeleves

1. LÉPÉS - A csirkehús előkészítése:
   - Vegyél elő 600g csirkehúst (comb, mell vagy egész csirke).
   - Ha szükséges, vágd kisebb darabokra.
   - Alaposan mosd meg hideg vízben.

2. LÉPÉS - A főzés kezdete:
   - Egy nagy fazékba helyezd a csirkehúst.
   - Öntsd fel 1.5 liter hideg vízzel.
   - Add hozzá egy csipet sót.
   - Forrald fel erős lángon.

3. LÉPÉS - A hab eltávolítása:
   - Amikor forrni kezd, habzani fog a teteje.
   - Szedd le a habot egy szűrőkanállal vagy kanállal.
   - Ismételd meg, amíg már nem jön fel hab.

4. LÉPÉS - A főzés folytatása:
   - Csökkentsd a lángot közepesre.
   - Főzd 25 percig, amíg a hús megpuhul.
   - Folyamatosan figyeld, hogy ne főjön túl.

5. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg mindkettőt.
   - Aprítsd finomra a vöröshagymát.
   - Aprítsd finomra vagy nyomd át a fokhagymát.

6. LÉPÉS - A hagyma hozzáadása:
   - Add hozzá a finomra vágott hagymát és fokhagymát a leveshez.
   - Főzz még 10 percig közepes lángon.
   - Keverd át időnként.

7. LÉPÉS - A tészta előkészítése:
   - Vegyél elő 200g tésztát (csiga, cső, vagy bármilyen kis tészta).
   - Ha nagyobb tészta, törd kisebb darabokra.

8. LÉPÉS - A tészta hozzáadása:
   - Add hozzá a tésztát a leveshez.
   - Főzz még 8-10 percig, amíg a tészta megpuhul.
   - Folyamatosan keverd, hogy ne ragadjon le.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Ízesítsd tovább, ha szükséges.
   - Próbáld meg, hogy jó legyen az íze.

10. LÉPÉS - A petrezselyem és tálalás:
    - Vegyél elő 1 csokor friss petrezselymet.
    - Alaposan mosd meg.
    - Finomra vágd.
    - Szórd rá a leves tetejére.
    - Tálald forrón egy tálba.
    - Azonnal fogyaszd melegen.

TIPP: A leves még jobb lesz másnap, amikor az ízek összeérnek! Tárolható hűtőben 2-3 napig.', 'none', 'nem', 'nem', '180', NULL),
('200g málna, 200ml tejszín, 100g cukor, 4 tojás sárgája, 1 teáskanál vanília', '30', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1488477181946-6428a0291777?q=80&w=600', 'Málnás pohár

1. LÉPÉS - A tejszín előkészítése:
   - Vegyél elő 200ml tejszínt.
   - Helyezd hűtőbe legalább 30 percig, hogy hideg legyen.
   - Vegyél elő egy nagy tálat és egy habverőt vagy elektromos keverőt.

2. LÉPÉS - A tejszín habverése:
   - Öntsd a hideg tejszínt a tálba.
   - Verd fel kemény habbá elektromos keverővel vagy kézi habverővel.
   - A hab kész, amikor kemény és nem folyik le, ha fordítod a tálat.
   - Tedd félre.

3. LÉPÉS - A tojások szétválasztása:
   - Vegyél elő 4 tojást.
   - Válaszd szét a tojásokat - csak a sárgájára van szükségünk.
   - Tedd félre a fehérjét (nem használjuk).
   - A 4 tojássárgát helyezd egy közepes méretű tálba.

4. LÉPÉS - A tojássárgák keverése:
   - Add hozzá a 100g cukrot a tojássárgákhoz.
   - Keverd habosra elektromos keverővel vagy kézzel, amíg világossárga és habos lesz (2-3 perc).

5. LÉPÉS - A vanília hozzáadása:
   - Add hozzá az 1 teáskanál vaníliát.
   - Keverd jól össze.

6. LÉPÉS - A tejszínhab hozzáadása:
   - Lassan, folyamatosan keverve add hozzá a tejszínhabot a tojássárgákhoz.
   - Fontos, hogy lassan add hozzá, különben összeesik a hab.
   - Keverd össze, amíg sima és egyenletes lesz.

7. LÉPÉS - A málna előkészítése:
   - Vegyél elő 200g málnát.
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le.
   - Törd össze villával vagy kézzel, hogy pép legyen belőle.
   - Hagyd egy részét egésznek a tálaláshoz.

8. LÉPÉS - A málna hozzáadása:
   - Add hozzá a málnapépet a keverékhez.
   - Keverd jól össze, hogy egyenletesen el legyen osztva.

9. LÉPÉS - A rétegezés:
   - Vegyél elő poharakat vagy tálakat.
   - Rétegezd: először egy réteg málnás krémet, majd egy réteg egész málnát.
   - Ismételd meg a rétegezést.
   - A tetején legyen egy réteg málnás krém.

10. LÉPÉS - Hűtés és tálalás:
    - Helyezd hűtőbe legalább 2-3 órára, hogy teljesen kihűljön.
    - Tálald hidegen.
    - Szolgáld poharakban vagy tálakban.

TIPP: A málnás pohár még jobb lesz, ha egy éjszakát hűtőben pihenteted! Tárolható hűtőben 2-3 napig.', 'none', 'nem', 'nem', '200', NULL),
('200g olívabogyó (fekete és zöld), 2 evőkanál olívaolaj, 1 gerezd fokhagyma, 1 csipet oregánó', '5', '10órai', 'nem', 'nasi', 'https://images.unsplash.com/photo-1494597564530-871f2b93ac55?w=600&q=80', 'Olívabogyó

1. LÉPÉS - Az olívabogyó előkészítése:
   - Vegyél elő 200g olívabogyót (fekete és zöld keverék).
   - Ha magos, távolítsd el a magokat (opcionális).
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le.
   - Helyezd egy tálba.

2. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 1 gerezd fokhagymát.
   - Hámozd meg.
   - Aprítsd finomra vagy nyomd át.

3. LÉPÉS - A fokhagyma hozzáadása:
   - Add hozzá az apróra vágott fokhagymát az olívabogyóhoz.
   - Keverd jól össze.

4. LÉPÉS - Az olívaolaj hozzáadása:
   - Csepegtess rá 2 evőkanál olívaolajat.
   - Keverd jól össze, hogy minden olívabogyó be legyen kenve.

5. LÉPÉS - Az oregánó hozzáadása:
   - Szórd rá 1 csipet oregánót.
   - Keverd jól össze.

6. LÉPÉS - Az ízesítés:
   - Ízesítsd még, ha szükséges.
   - Próbáld meg, hogy jó legyen az íze.
   - Ha túl semleges, adj hozzá még fokhagymát vagy oregánót.

7. LÉPÉS - Pihentetés:
   - Hagyd állni 10-15 percig, hogy az ízek összeérjenek.
   - Ne tálald azonnal.

8. LÉPÉS - Tálalás:
   - Tálald azonnal, amikor még friss.
   - Ideális előételként vagy nasi módjára.
   - Szolgáld egy szép tálban.

TIPP: Az olívabogyó még jobb lesz, ha egy éjszakát hűtőben pihenteted! Tárolható hűtőben 1-2 hétig.', 'none', 'nem', 'nem', '220', NULL),
('2 tortilla lap, 200g sült csirkemell, 100g saláta, 50g sajt, 50g paradicsom, 2 evőkanál majonéz, só, bors', '12', 'proteindús', 'nem', 'gyors', 'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?q=80&w=600', 'Csirkés wrap

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 200g sült csirkemellet.
   - Ha még nincs sütve, süsd meg előre.
   - Vágd vékony szeletekre vagy kockákra.
   - Tedd félre.

2. LÉPÉS - A tortilla lapok előkészítése:
   - Vegyél elő 2 tortilla lapot.
   - Ha fagyasztott, hagyd felolvadni.
   - Ha szobahőmérsékletű, használd közvetlenül.

3. LÉPÉS - A tortilla lapok melegítése:
   - Egy serpenyőben vagy mikróban melegítsd meg a tortilla lapokat.
   - Melegítsd 10-15 másodpercig mindkét oldalon, hogy puha legyen.
   - Ne süsd túl, csak melegítsd.

4. LÉPÉS - A majonéz kenése:
   - Vegyél elő 2 evőkanál majonézt.
   - Kenj rá egy vékony réteg majonézt minden tortilla lapra.
   - Egyenletesen oszd el.

5. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 100g salátát.
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le.
   - Tépd kisebb darabokra vagy hagyd nagyobb leveleknek.

6. LÉPÉS - A saláta hozzáadása:
   - Helyezd rá a salátát a tortilla lapokra.
   - Egyenletesen oszd el.

7. LÉPÉS - A csirkemell hozzáadása:
   - Helyezd rá a szeletelt csirkemellet a salátára.
   - Egyenletesen oszd el.

8. LÉPÉS - A sajt előkészítése:
   - Vegyél elő 50g sajtot (pl. trappista, cheddar).
   - Reszeld vagy vágd kockákra.

9. LÉPÉS - A sajt hozzáadása:
   - Szórd rá a sajtot a csirkemellre.

10. LÉPÉS - A paradicsom előkészítése:
    - Vegyél elő 50g paradicsomot.
    - Alaposan mosd meg.
    - Vágd kockákra vagy szeletekre.

11. LÉPÉS - A paradicsom hozzáadása:
    - Helyezd rá a paradicsomot a sajtra.

12. LÉPÉS - Fűszerezés:
    - Sózd és borsozz az ízlésed szerint.

13. LÉPÉS - A wrap összehajtása:
    - Hajtsd be az oldalakat.
    - Tekerd fel szorosan, mint egy burritót.
    - Ügyelj rá, hogy ne folyjon ki a töltelék.

14. LÉPÉS - Tálalás:
    - Tálald azonnal.
    - Ha tárolni szeretnéd, csomagold be fóliába vagy ételfóliába.
    - Ideális gyors ebédként vagy vacsoraként.

TIPP: Ha szeretnéd, adj hozzá avokádót, uborkát vagy más zöldségeket extra ízért és textúráért!', 'none', 'nem', 'nem', '380', NULL),
('250g tészta, 400g paradicsom, 1 fej vöröshagyma, 2 gerezd fokhagyma, 2 evőkanál olívaolaj, só, bors, 1 csokor bazsalikom', '20', 'kalóriaszegény', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=600&q=80', 'Paradicsomos tészta (light)

1. LÉPÉS - A víz forralása:
   - Egy nagy fazékba öntsd a vizet.
   - Add hozzá a sót (kb. 1 evőkanál 1 liter vízhez).
   - Forrald fel erős lángon.

2. LÉPÉS - A tészta főzése:
   - Amikor a víz forr, add hozzá a 250g tésztát.
   - Főzd a csomagoláson szereplő idő szerint (általában 8-12 perc).
   - Folyamatosan keverd, hogy ne ragadjon le.
   - A tészta kész, amikor "al dente" (kicsit kemény, de nem nyers).

3. LÉPÉS - A tészta leszűrése:
   - Szűrd le a tésztát, de tartsd meg egy kis főzővizet.
   - Tedd félre.

4. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg mindkettőt.
   - Aprítsd finomra a vöröshagymát.
   - Aprítsd finomra vagy nyomd át a fokhagymát.

5. LÉPÉS - A hagyma pirítása:
   - Egy serpenyőben melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2-3 percig közepes lángon, amíg üveges lesz és illatos.

6. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 400g paradicsomot.
   - Alaposan mosd meg hideg vízben.
   - Vágd kockákra vagy darabold fel.
   - Ha konzervált paradicsomot használsz, használd az egészet levével együtt.

7. LÉPÉS - A paradicsomos szósz készítése:
   - Add hozzá a paradicsomot a hagymához.
   - Főzz 10 percig közepes lángon, amíg a paradicsom megpuhul.
   - Keverd időnként.
   - Ha szükséges, turmixold össze simára vagy hagyd darabosnak.

8. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Próbáld meg, hogy jó legyen az íze.

9. LÉPÉS - A tészta összekeverése:
   - Add hozzá a főtt tésztát a paradicsomos szószhoz.
   - Keverd jól össze, hogy minden tészta be legyen kenve.
   - Ha szükséges, adj hozzá egy kis főzővizet, hogy ne legyen túl száraz.

10. LÉPÉS - A bazsalikom és tálalás:
    - Vegyél elő 1 csokor friss bazsalikomot.
    - Alaposan mosd meg.
    - Finomra vágd vagy tépd fel.
    - Szórd rá a tésztára.
    - Tálald azonnal melegen.

TIPP: Ha szeretnéd, adj hozzá reszelt parmezánt vagy olajbogyót extra ízért!', 'none', 'nem', 'nem', '450', NULL),
('400g hús, 200g rizs, 1 fej vöröshagyma, 2 gerezd fokhagyma, 2 evőkanál olívaolaj, 300ml húsleves, só, bors', '35', 'foetel', 'nem', 'klasszikus', 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?q=80&w=600', 'Rizses hús

1. LÉPÉS - A hús előkészítése:
   - Vegyél elő 400g húst (marha, sertés vagy csirke).
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le papírtörlővel.
   - Vágd kockákra (kb. 2 cm-es kockák).

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg mindkettőt.
   - Aprítsd finomra a vöröshagymát.
   - Aprítsd finomra vagy nyomd át a fokhagymát.

3. LÉPÉS - A hagyma pirítása:
   - Egy nagy serpenyőben vagy fazékban melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát és fokhagymát.
   - Pirítsd 2-3 percig közepes lángon, amíg üveges lesz és illatos.

4. LÉPÉS - A hús hozzáadása:
   - Add hozzá a hús kockákat a hagymához.
   - Süsd 5 percig közepes lángon, amíg mindkét oldala aranybarna lesz.
   - Folyamatosan keverd.

5. LÉPÉS - A rizs előkészítése:
   - Vegyél elő 200g rizst.
   - Alaposan mosd meg hideg vízben, amíg tiszta lesz a víz.
   - Szűrd le.

6. LÉPÉS - A rizs hozzáadása:
   - Add hozzá a rizst a húshoz.
   - Keverd jól össze.

7. LÉPÉS - A leves hozzáadása:
   - Öntsd fel a 300ml húslevest.
   - Forrald fel erős lángon.

8. LÉPÉS - A főzés:
   - Csökkentsd a lángot közepes-alacsonyra.
   - Főzz 20-25 percig, amíg a rizs megpuhul és felszívja a levet.
   - Folyamatosan keverd, hogy ne ragadjon le.
   - Ha szükséges, adj hozzá még egy kis levest vagy vizet.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Próbáld meg, hogy jó legyen az íze.
   - Ízesítsd tovább, ha szükséges.

10. LÉPÉS - Tálalás:
    - Tálald azonnal melegen.
    - Ideális ebédként vagy vacsoraként.
    - Szolgáld egy szép tálban.

TIPP: Ha szeretnéd, adj hozzá zöldségeket (répa, zöldborsó) extra ízért és színért!', 'none', 'nem', 'nem', '400', NULL),
('150g saláta, 100g csirkemell, 50g parmezán, 2 evőkanál olívaolaj, 1 evőkanál citrom leve, só, bors', '15', '10órai', 'nem', 'klasszikus', 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=600', 'Cézár előétel

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 100g csirkemellet.
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le papírtörlővel.
   - Sózd és borsozd mindkét oldalát.

2. LÉPÉS - A csirkemell sütése:
   - Egy serpenyőt melegíts fel közepes lángon.
   - Add hozzá 1 evőkanál olívaolajat.
   - Helyezd be a csirkemellet.
   - Süsd 5-6 percig mindkét oldalon, amíg átsül és aranybarna lesz.
   - Ellenőrizd, hogy belül is átsült-e (nem lehet rózsaszín).

3. LÉPÉS - A csirkemell hűtése és szeletelése:
   - Vedd ki a serpenyőből és hagyd kihűlni 5 percig.
   - Vágd vékony szeletekre vagy kockákra.
   - Tedd félre.

4. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 150g salátát (jégsaláta, római saláta stb.).
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le saláta centrifuga segítségével vagy papírtörlővel.
   - Tépd kisebb darabokra vagy hagyd nagyobb leveleknek.
   - Helyezd egy nagy tálba.

5. LÉPÉS - A csirkemell hozzáadása:
   - Add hozzá a szeletelt csirkemellet a salátához.
   - Keverd jól össze.

6. LÉPÉS - A parmezán előkészítése:
   - Vegyél elő 50g parmezánt.
   - Reszeld finomra reszelővel.
   - Szórd rá a salátára.

7. LÉPÉS - A dresszing előkészítése:
   - Vegyél elő egy kis tálat a dresszinghez.
   - Öntsd bele a 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál citrom levét.
   - Sózd és borsozd az ízlésed szerint.

8. LÉPÉS - A dresszing keverése:
   - Keverd jól össze a dresszinget egy villával vagy kis habverővel.
   - Próbáld meg, hogy jó legyen az íze.
   - Ha túl savanyú, adj hozzá még olívaolajat.
   - Ha túl semleges, adj hozzá még citrom levét.

9. LÉPÉS - A dresszing hozzáadása:
   - Öntsd meg a salátát a dresszinggel.
   - Keverd jól össze, hogy minden darab be legyen kenve.

10. LÉPÉS - Tálalás:
    - Tálald azonnal, amikor még friss.
    - Ideális előételként vagy könnyű ebédként.
    - Szolgáld egy szép tálban.

TIPP: Ha szeretnéd, adj hozzá krutonokat vagy pirított kenyérkockákat extra ropogósságért!', 'none', 'nem', 'nem', '220', NULL),
('500g zöldborsó, 1 fej vöröshagyma, 2 evőkanál olívaolaj, 200ml víz, só, bors, 1 csokor petrezselyem', '20', 'foetel', 'nem', 'tradicionális', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=600&q=80', 'Zöldborsó főzelék

1. LÉPÉS - A zöldborsó előkészítése:
   - Vegyél elő 500g zöldborsót.
   - Ha friss, hámozd ki a hüvelyekből.
   - Ha fagyasztott, hagyd felolvadni.
   - Ha konzervált, csepegtesse le a levét és mosd meg hideg vízben.
   - Alaposan mosd meg hideg vízben.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát.
   - Hámozd meg és aprítsd finomra.

3. LÉPÉS - A hagyma pirítása:
   - Egy fazékban vagy serpenyőben melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott hagymát.
   - Pirítsd 2-3 percig közepes lángon, amíg üveges lesz és illatos.

4. LÉPÉS - A zöldborsó hozzáadása:
   - Add hozzá a zöldborsót a hagymához.
   - Keverd jól össze.
   - Pirítsd 2-3 percig, hogy enyhén megpuhuljon.

5. LÉPÉS - A víz hozzáadása:
   - Öntsd fel a 200ml vizet.
   - Forrald fel közepes lángon.

6. LÉPÉS - A főzés:
   - Főzz 15 percig közepes lángon, amíg a borsó puha lesz.
   - Folyamatosan keverd, hogy ne égjen le.
   - Ha szükséges, adj hozzá még egy kis vizet.
   - A borsó kész, amikor puha, de még nem szétfőtt.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.
   - Próbáld meg, hogy jó legyen az íze.
   - Ízesítsd tovább, ha szükséges.

8. LÉPÉS - A petrezselyem előkészítése:
   - Vegyél elő 1 csokor friss petrezselymet.
   - Alaposan mosd meg.
   - Finomra vágd.

9. LÉPÉS - A petrezselyem hozzáadása:
   - Szórd rá a finomra vágott petrezselymet.
   - Keverd jól össze.

10. LÉPÉS - Tálalás:
    - Tálald azonnal melegen.
    - Ideális ebédként vagy vacsoraként köretként.
    - Szolgáld egy szép tálban.

TIPP: Ha szeretnéd, adj hozzá tejszínt vagy vajat a végén extra krémes ízért!', 'none', 'nem', 'nem', '480', NULL),
('200g mogyoró, 100g cukor, 2 evőkanál víz, 1 teáskanál vanília', '20', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?q=80&w=600', 'Mogyorós édesség

1. LÉPÉS - A mogyoró előkészítése:
   - Vegyél elő 200g mogyorót.
   - Ha pörkölt, használd közvetlenül.
   - Ha nyers, pörköld meg először egy serpenyőben 5-10 percig, amíg aranybarna lesz.
   - Hagyd kihűlni.

2. LÉPÉS - A mogyoró aprítása:
   - Durvára aprítsd a mogyorót kézi aprítóval vagy konyhai robotgéppel.
   - Ne legyen túl finomra aprítva, legyen benne textúra.
   - Tedd félre.

3. LÉPÉS - A cukor előkészítése:
   - Vegyél elő 100g cukrot.
   - Egy kis fazékba vagy serpenyőbe helyezd.

4. LÉPÉS - A víz hozzáadása:
   - Add hozzá a 2 evőkanál vizet a cukorhoz.
   - Keverd össze.

5. LÉPÉS - A cukor olvasztása:
   - Melegítsd közepes lángon, amíg a cukor feloldódik.
   - Főzd tovább, amíg karamellizálódik és aranybarna lesz.
   - Folyamatosan keverd, hogy ne égjen meg.
   - Ne érintsd meg, mert nagyon forró!

6. LÉPÉS - A mogyoró hozzáadása:
   - Amikor a cukor karamellizálódott, add hozzá a durvára aprított mogyorót.
   - Keverd jól össze, hogy minden mogyoró be legyen kenve a karamellal.

7. LÉPÉS - A vanília hozzáadása:
   - Add hozzá az 1 teáskanál vaníliát.
   - Keverd jól össze.

8. LÉPÉS - A keverék hűtése:
   - Vedd le a tűzről.
   - Hagyd kihűlni 5-10 percig, amíg kezelhető lesz.

9. LÉPÉS - A formázás:
   - Amikor már kezelhető, de még meleg, formáld ki golyókat vagy kockákat.
   - Használj nedves kezeket, hogy ne ragadjon.
   - Helyezd egy tálcára vagy deszkára.

10. LÉPÉS - Hűtés és tálalás:
    - Hagyd teljesen kihűlni szobahőmérsékleten.
    - Ezután helyezd hűtőbe legalább 1-2 órára, hogy kemény legyen.
    - Tálald hidegen.
    - Szolgáld egy szép tálban.

TIPP: Az édesség tárolható légmentesen zárható dobozban hűtőben 1-2 hétig!', 'none', 'nem', 'nem', '200', NULL),
('4 db mini wurst, 4 szelet kenyér, 2 evőkanál mustár, 1 evőkanál ketchup', '10', '10órai', 'nem', 'nasi', 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600&q=80', 'Mini wurst

1. LÉPÉS - A mini wurst előkészítése:
   - Vegyél elő 4 db mini wurstot.
   - Ha fagyasztott, hagyd felolvadni.
   - Alaposan mosd meg hideg vízben.

2. LÉPÉS - A mini wurst főzése:
   - Egy fazékba öntsd a vizet.
   - Forrald fel.
   - Add hozzá a mini wurstokat.
   - Főzd 5-7 percig, amíg átsülnek.
   - Vagy süsd meg egy serpenyőben 5-7 percig, amíg aranybarnák lesznek.

3. LÉPÉS - A mini wurst hűtése:
   - Vedd ki a vízből vagy serpenyőből.
   - Hagyd kihűlni 2-3 percig.

4. LÉPÉS - A kenyér előkészítése:
   - Vegyél elő 4 szelet kenyeret.
   - Vágd kisebb darabokra vagy hagyd egésznek.

5. LÉPÉS - A kenyér piritása:
   - Egy piritóban vagy serpenyőben pirítsd meg a kenyeret.
   - Pirítsd aranybarnára mindkét oldalon.
   - Hagyd kihűlni 1-2 percig.

6. LÉPÉS - A mini wurst elhelyezése:
   - Helyezd rá a mini wurstokat a kenyérre.
   - Egyenletesen oszd el.

7. LÉPÉS - A mustár előkészítése:
   - Vegyél elő 2 evőkanál mustárt.
   - Kenj rá mustárt minden mini wurstra.
   - Egyenletesen oszd el.

8. LÉPÉS - A ketchup előkészítése:
   - Vegyél elő 1 evőkanál ketchupot.
   - Csepegtess rá ketchupot minden mini wurstra.
   - Egyenletesen oszd el.

9. LÉPÉS - Tálalás előkészítése:
   - Ellenőrizd, hogy minden mini wurst jól van kikészítve.
   - Ha szükséges, adj hozzá még mustárt vagy ketchupot.

10. LÉPÉS - Tálalás:
    - Tálald azonnal melegen.
    - Ideális gyors nasi módjára vagy reggeliként.
    - Szolgáld egy szép tálcán vagy tálban.

TIPP: Ha szeretnéd, adj hozzá sajtot vagy zöldségeket extra ízért!', 'none', 'nem', 'nem', '220', NULL),
('200g tonhal, 150g vegyes saláta, 1 paradicsom, 1/2 uborka, 2 evőkanál olívaolaj, 1 evőkanál citrom leve, só, bors', '12', 'proteindús', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=600&q=80', 'Tonhalas saláta

1. LÉPÉS - A tonhal előkészítése:
   - Vegyél elő 200g tonhalt (konzervált vagy friss).
   - Ha konzervált, csepegtesse le a levét és szétválaszd villával.
   - Ha friss, főzd meg előre és hűtsd le.
   - Szeleteld fel vagy hagyd darabosnak.

2. LÉPÉS - A saláta előkészítése:
   - Vegyél elő 150g vegyes salátát (jégsaláta, rukkola, spenót stb.).
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le saláta centrifuga segítségével vagy papírtörlővel.
   - Tépd kisebb darabokra vagy hagyd nagyobb leveleknek.
   - Helyezd egy nagy tálba.

3. LÉPÉS - A paradicsom előkészítése:
   - Vegyél elő 1 friss paradicsomot.
   - Alaposan mosd meg.
   - Vágd kockákra vagy szeletekre.
   - Add hozzá a salátához.

4. LÉPÉS - Az uborka előkészítése:
   - Vegyél elő 1/2 uborkát.
   - Alaposan mosd meg.
   - Hámozd meg, ha szükséges (a héj lehet keserű).
   - Vágd vékony szeletekre vagy kockákra.
   - Add hozzá a salátához.

5. LÉPÉS - A dresszing előkészítése:
   - Vegyél elő egy kis tálat a dresszinghez.
   - Öntsd bele a 2 evőkanál olívaolajat.
   - Add hozzá az 1 evőkanál citrom levét.
   - Sózd és borsozd az ízlésed szerint.

6. LÉPÉS - A dresszing keverése:
   - Keverd jól össze a dresszinget egy villával vagy kis habverővel.
   - Próbáld meg, hogy jó legyen az íze.
   - Ha túl savanyú, adj hozzá még olívaolajat.
   - Ha túl semleges, adj hozzá még citrom levét.

7. LÉPÉS - A dresszing hozzáadása:
   - Öntsd meg a salátát a dresszinggel.
   - Keverd jól össze, hogy minden darab be legyen kenve.

8. LÉPÉS - A tonhal hozzáadása:
   - Helyezd rá a tonhalt a saláta tetejére.
   - Egyenletesen oszd el.

9. LÉPÉS - Tálalás:
   - Tálald azonnal, amikor még friss.
   - Ideális könnyű ebédként vagy vacsoraként.
   - Szolgáld egy szép tálban.

TIPP: Ha szeretnéd, adj hozzá olajbogyót vagy kaprot extra ízért!', 'none', 'nem', 'nem', '200', NULL),
('400g vegyes zöldség (paprika, cukkinni, padlizsán), 3 evőkanál olívaolaj, 2 gerezd fokhagyma, só, bors, 1 teáskanál oregánó', '25', 'kalóriaszegény', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600&q=80', 'Sült zöldségek

1. LÉPÉS - A sütő előkészítése:
   - Melegítsd elő a sütőt 200°C-ra.
   - Vegyél elő egy tepsit és sütőpapírt.

2. LÉPÉS - A zöldségek előkészítése:
   - Vegyél elő 400g vegyes zöldséget (paprika, cukkinni, padlizsán).
   - Alaposan mosd meg minden zöldséget hideg vízben.
   - A paprikát távolítsd el a szárát és magokat.
   - A cukkinnit hámozd meg és távolítsd el a magokat.
   - A padlizsánt hámozd meg vagy hagyd a héján.

3. LÉPÉS - A zöldségek vágása:
   - Vágd nagyobb darabokra (kb. 3-4 cm-es darabok).
   - Fontos, hogy azonos méretűek legyenek, hogy egyenletesen süljenek.
   - A paprikát vágd csíkokra vagy nagyobb darabokra.
   - A cukkinnit vágd kockákra vagy szeletekre.
   - A padlizsánt vágd kockákra vagy szeletekre.

4. LÉPÉS - A tepsibe helyezés:
   - Béleld ki a tepsit sütőpapírral.
   - Helyezd rá a zöldségeket egyenletesen egy rétegben.
   - Ne legyenek egymásra rakva.

5. LÉPÉS - Az olívaolaj kenése:
   - Kend meg minden zöldség darabot 3 evőkanál olívaolajjal.
   - Egyenletesen oszd el.
   - Használj ecsetet vagy kezedet.

6. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Hámozd meg.
   - Aprítsd finomra vagy nyomd át.

7. LÉPÉS - A fűszerezés:
   - Szórd rá az apróra vágott fokhagymát.
   - Szórd rá az 1 teáskanál oregánót.
   - Sózd és borsozd az ízlésed szerint.
   - Keverd át, hogy minden darab be legyen fűszerezve.

8. LÉPÉS - A sütés:
   - Helyezd be a sütőbe 200°C-on.
   - Süsd 20-25 percig, amíg puha és ropogós lesz.
   - Félidőben (10-12 perc után) fordítsd meg a zöldségeket, hogy mindkét oldaluk egyenletesen süljön.
   - Figyeld, hogy ne égjenek meg.

9. LÉPÉS - A készre sütés ellenőrzése:
   - A zöldségek késznek számítanak, amikor puha belül és ropogós kívül.
   - Ha még kemény, süsd tovább 2-3 percig.

10. LÉPÉS - Tálalás:
    - Vedd ki a sütőből és hagyd kihűlni 2-3 percig.
    - Tálald azonnal melegen.
    - Ideális köretként vagy főételként.

TIPP: Ha szeretnéd, adj hozzá reszelt parmezánt vagy friss bazsalikomot a tetejére tálalás előtt!', 'none', 'nem', 'nem', '180', NULL),
('400g csirkemell, 100g sonka, 100g sajt, 2 tojás, 100g liszt, 100g morzsa, 500ml olaj, só, bors', '30', 'foetel', 'nem', 'klasszikus', 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?q=80&w=600', 'Gordon bleu

1. LÉPÉS - A csirkemell előkészítése:
   - Vegyél elő 400g csirkemellet.
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le papírtörlővel.
   - Vágd fel vékonyra (kb. 1 cm vastag szeletek).
   - Ütögesd meg húskalapáccsal, hogy még vékonyabb legyen.

2. LÉPÉS - A sonka és sajt előkészítése:
   - Vegyél elő 100g sonkát és 100g sajtot (pl. trappista, cheddar).
   - A sonkát vágd vékonyra vagy használj sonkaszeleteket.
   - A sajtot vágd vékonyra vagy reszeld.

3. LÉPÉS - A töltelék elhelyezése:
   - Minden csirkemell szeletre helyezz egy réteg sonkát.
   - A sonka tetejére helyezz egy réteg sajtot.
   - Ügyelj rá, hogy ne menjen ki a szélekből.

4. LÉPÉS - A csomagolás:
   - Tekerd fel a csirkemellet a sonka és sajt körül.
   - Rögzítsd fogvájókkal vagy fogvájó tűvel, hogy ne essen szét.
   - Ügyelj rá, hogy szorosan legyen becsomagolva.

5. LÉPÉS - A rántás előkészítése:
   - Vegyél elő 3 tálat.
   - Az első tálba helyezd a 100g lisztet.
   - A második tálba törj be a 2 tojást és keverd át villával.
   - A harmadik tálba helyezd a 100g morzsát (zsemlemorzsa vagy panko).

6. LÉPÉS - A rántás:
   - Először forgasd meg a csirkemellet a lisztben, hogy minden oldala be legyen kenve.
   - Utána mártogasd a tojásba, hogy minden oldala be legyen kenve.
   - Végül forgasd meg a morzsában, hogy minden oldala be legyen kenve.
   - Ügyelj rá, hogy egyenletesen legyen rántva.

7. LÉPÉS - Az olaj melegítése:
   - Egy nagy serpenyőben melegítsd fel a 500ml olajat.
   - Melegítsd közepes lángon, amíg forró lesz (kb. 170-180°C).
   - Teszteld egy kis morzsával - ha azonnal elkezd sülni, kész.

8. LÉPÉS - A sütés:
   - Helyezd be a rántott csirkemellet a forró olajba.
   - Süsd 4-5 percig mindkét oldalon, amíg aranybarna lesz.
   - Fordítsd meg időnként.
   - Ügyelj rá, hogy belül is átsüljön.

9. LÉPÉS - A leszűrés:
   - Vedd ki az olajból és helyezd papírtörlőre, hogy lecsöpögjön a felesleges olaj.
   - Hagyd kihűlni 2-3 percig.

10. LÉPÉS - Fűszerezés és tálalás:
    - Sózd és borsozz az ízlésed szerint.
    - Távolítsd el a fogvájókat vagy tűket.
    - Tálald azonnal melegen.
    - Ideális ebédként vagy vacsoraként.

TIPP: A Gordon bleu legjobb frissen sütve! Szolgáld sült krumplival vagy salátával!', 'none', 'nem', 'nem', '480', NULL),
('300g retek, 2 evőkanál olívaolaj, 1 evőkanál balzsamikó ecet, 1 teáskanál fűszerpaprika, só, bors', '10', '10órai', 'nem', 'nasi', 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600&q=80', 'Fűszeres retek

1. LÉPÉS - A retek előkészítése:
   - Vegyél elő 300g retket.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg vagy hagyd a héján (ha tetszik).
   - Szárazítsd le.

2. LÉPÉS - A retek szeletelése:
   - Vágd vékonyra szeletekre (kb. 2-3 mm vastagságú).
   - Használj mandolint vagy éles kést.
   - Fontos, hogy egyenletesen vastagak legyenek.

3. LÉPÉS - A tálba helyezés:
   - Egy tálba helyezd a retek szeleteket.
   - Egyenletesen oszd el.

4. LÉPÉS - Az olívaolaj hozzáadása:
   - Add hozzá a 2 evőkanál olívaolajat.
   - Keverd jól össze, hogy minden szelet be legyen kenve.

5. LÉPÉS - A balzsamikó ecet hozzáadása:
   - Add hozzá az 1 evőkanál balzsamikó ecetet.
   - Keverd jól össze.

6. LÉPÉS - A fűszerpaprika hozzáadása:
   - Szórd rá az 1 teáskanál fűszerpaprikát.
   - Keverd jól össze.

7. LÉPÉS - Fűszerezés:
   - Sózd és borsozd az ízlésed szerint.
   - Keverd jól össze.

8. LÉPÉS - Az ízesítés:
   - Próbáld meg, hogy jó legyen az íze.
   - Ha túl savanyú, adj hozzá még olívaolajat.
   - Ha túl semleges, adj hozzá még ecetet vagy fűszerpaprikát.

9. LÉPÉS - Hűtés:
   - Helyezd hűtőbe legalább 30 percig, hogy az ízek összeérjenek.
   - Ne tálald azonnal.

10. LÉPÉS - Tálalás:
    - Tálald hidegen.
    - Ideális előételként vagy köretként.
    - Szolgáld egy szép tálban.

TIPP: A retek még jobb lesz, ha egy éjszakát hűtőben pihenteted! Tárolható hűtőben 2-3 napig.', 'none', 'nem', 'nem', '220', NULL),
('500g vegyes gyümölcs (cseresznye, meggy, eper), 500ml víz, 100g cukor, 1 citrom leve, 1 teáskanál vanília', '20', 'foetel', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Hideg gyümölcsleves

1. LÉPÉS - A gyümölcsök előkészítése:
   - Vegyél elő 500g vegyes gyümölcsöt (cseresznye, meggy, eper).
   - Alaposan mosd meg minden gyümölcsöt hideg vízben.
   - A cseresznyét és meggyet távolítsd el a magokat.
   - Az epret távolítsd el a szárát.
   - Vágd kisebb darabokra vagy hagyd egésznek.

2. LÉPÉS - A gyümölcs törése:
   - Törd össze a gyümölcsöket villával vagy kézzel, hogy pép legyen belőlük.
   - Hagyd egy részét egésznek a textúráért.

3. LÉPÉS - A víz forralása:
   - Egy fazékba öntsd a 500ml vizet.
   - Forrald fel erős lángon.

4. LÉPÉS - A cukor hozzáadása:
   - Add hozzá a 100g cukrot a forró vízhez.
   - Keverd, amíg feloldódik.
   - Főzz még 2-3 percig, amíg szirup lesz belőle.

5. LÉPÉS - A gyümölcs hozzáadása:
   - Add hozzá a törött gyümölcsöt a forró sziruphoz.
   - Keverd jól össze.

6. LÉPÉS - A főzés:
   - Főzz 10 percig közepes lángon.
   - Folyamatosan keverd, hogy ne égjen le.
   - A gyümölcs kész, amikor megpuhul és a szirup sűrű lesz.

7. LÉPÉS - A citrom levének hozzáadása:
   - Vegyél elő 1 citromot.
   - Fáraszd ki a levét (kb. 2-3 evőkanál).
   - Add hozzá a leveshez.
   - Keverd jól össze.

8. LÉPÉS - A vanília hozzáadása:
   - Add hozzá az 1 teáskanál vaníliát.
   - Keverd jól össze.

9. LÉPÉS - Hűtés:
   - Vedd le a tűzről.
   - Hagyd kihűlni szobahőmérsékleten 30 percig.
   - Ezután helyezd hűtőbe legalább 2-3 órára, hogy teljesen hideg legyen.

10. LÉPÉS - Tálalás:
    - Tálald hidegen.
    - Szolgáld tálakban vagy poharakban.
    - Ideális nyári desszertként vagy előételként.

TIPP: A leves még jobb lesz, ha egy éjszakát hűtőben pihenteted! Tárolható hűtőben 3-4 napig.', 'none', 'nem', 'nem', '180', NULL),
('500ml tejszín, 100g cukor, 1 teáskanál vanília, 3 teáskanál zselatin, 200ml víz', '180', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1551024506-0bccd828d307?q=80&w=600', 'Panna cotta

1. LÉPÉS - A zselatin előkészítése:
   - Vegyél elő 3 teáskanál zselatint.
   - Egy kis tálba helyezd.
   - Öntsd fel a 200ml hideg vízzel.
   - Hagyd állni 5-10 percig, amíg megduzzad.

2. LÉPÉS - A tejszín melegítése:
   - Egy fazékba öntsd a 500ml tejszínt.
   - Melegítsd közepes lángon, amíg forrni kezd.
   - Ne forrald fel, csak melegítsd.

3. LÉPÉS - A cukor és vanília hozzáadása:
   - Add hozzá a 100g cukrot a meleg tejszínhez.
   - Add hozzá az 1 teáskanál vaníliát.
   - Keverd, amíg a cukor feloldódik.

4. LÉPÉS - A zselatin hozzáadása:
   - Add hozzá a megduzzadt zselatint a meleg tejszínhez.
   - Keverd folyamatosan, amíg a zselatin teljesen feloldódik.
   - Ne forrald fel, csak melegítsd, amíg feloldódik.

5. LÉPÉS - A szűrés:
   - Szűrd le egy finom szűrőn, hogy ne legyenek csomók.
   - Ügyelj rá, hogy sima legyen.

6. LÉPÉS - A poharakba öntés:
   - Vegyél elő poharakat vagy formákat.
   - Öntsd bele a keveréket.
   - Egyenletesen oszd el.

7. LÉPÉS - Hűtés:
   - Hagyd kihűlni szobahőmérsékleten 10 percig.
   - Ezután helyezd hűtőbe legalább 4 órát (vagy éjszakára), hogy teljesen megdermedjen.
   - Ne mozgasd, amíg meg nem dermedt.

8. LÉPÉS - A készre dermedés ellenőrzése:
   - A panna cotta kész, amikor kemény és nem folyik, ha fordítod a poharat.
   - Ha még folyékony, hagyd még hűtőben.

9. LÉPÉS - Tálalás előkészítése:
   - Ha formákban készítetted, merítsd be forró vízbe 10 másodpercig, hogy könnyen ki lehessen venni.
   - Fordítsd ki egy tálra.

10. LÉPÉS - Tálalás:
    - Tálald hidegen.
    - Szolgáld poharakban vagy tálakban.
    - Ideális desszertként.

TIPP: A panna cotta még jobb lesz, ha egy éjszakát hűtőben pihenteted! Tárolható hűtőben 3-4 napig. Szolgáld friss gyümölcsökkel vagy bogyókkal!', 'none', 'nem', 'nem', '200', NULL),
('200g mogyoró, 2 evőkanál olívaolaj, 1 teáskanál só, 1 teáskanál fűszerpaprika', '15', '10órai', 'nem', 'nasi', 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?q=80&w=600', 'Mogyoró

1. LÉPÉS - A mogyoró előkészítése:
   - Vegyél elő 200g mogyorót.
   - Ha pörkölt, használd közvetlenül.
   - Ha nyers, pörköld meg először egy serpenyőben 5-10 percig, amíg aranybarna lesz.
   - Hagyd kihűlni.

2. LÉPÉS - A mogyoró fűszerezése:
   - Egy tálba helyezd a mogyorót.
   - Add hozzá a 2 evőkanál olívaolajat.
   - Keverd jól össze, hogy minden mogyoró be legyen kenve.

3. LÉPÉS - A só hozzáadása:
   - Szórd rá az 1 teáskanál sót.
   - Keverd jól össze.

4. LÉPÉS - A fűszerpaprika hozzáadása:
   - Szórd rá az 1 teáskanál fűszerpaprikát.
   - Keverd jól össze.

5. LÉPÉS - A pirítás:
   - Egy serpenyőben melegítsd fel közepes lángon.
   - Add hozzá a fűszerezett mogyorót.
   - Pirítsd 5-6 percig, folyamatosan keverve.
   - A mogyoró kész, amikor aranybarna lesz és illatos.

6. LÉPÉS - A hűtés:
   - Vedd le a tűzről.
   - Hagyd kihűlni szobahőmérsékleten 10 percig.
   - Ne tálald azonnal, hagyd, hogy teljesen kihűljön.

7. LÉPÉS - Tálalás:
   - Tálald azonnal vagy tárold légmentesen zárva.
   - Ideális nasi módjára vagy előételként.
   - Szolgáld egy szép tálban.

TIPP: A mogyoró tárolható légmentesen zárható dobozban hűtőben 1-2 hétig!', 'none', 'nem', 'nem', '220', NULL),
('2 tortilla lap, 200g hús, 150g bab, 100g rizs, 50g sajt, 50g saláta, 2 evőkanál szósz, só, bors', '20', 'proteindús', 'nem', 'mexikói', 'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?q=80&w=600', 'Burrito proteindús

1. LÉPÉS - A hús előkészítése:
   - Vegyél elő 200g húst (marha, sertés vagy csirke).
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le papírtörlővel.
   - Vágd kockákra vagy csíkokra.

2. LÉPÉS - A hús sütése:
   - Egy serpenyőben melegítsd fel közepes lángon.
   - Add hozzá a húst.
   - Süsd 5-7 percig, amíg átsül és aranybarna lesz.
   - Folyamatosan keverd.
   - Darabold össze villával vagy kézzel.
   - Sózd és borsozd.

3. LÉPÉS - A bab előkészítése:
   - Vegyél elő 150g babot.
   - Ha konzervált, melegítsd fel egy serpenyőben vagy mikróban.
   - Ha friss, főzd meg előre.
   - Darabold össze villával, ha szükséges.

4. LÉPÉS - A rizs előkészítése:
   - Vegyél elő 100g főtt rizst.
   - Ha még nincs főve, főzd meg előre.
   - Melegítsd fel egy serpenyőben vagy mikróban.

5. LÉPÉS - A tortilla lapok előkészítése:
   - Vegyél elő 2 tortilla lapot.
   - Ha fagyasztott, hagyd felolvadni.
   - Ha szobahőmérsékletű, használd közvetlenül.

6. LÉPÉS - A tortilla lapok melegítése:
   - Egy serpenyőben vagy mikróban melegítsd meg a tortilla lapokat.
   - Melegítsd 10-15 másodpercig mindkét oldalon, hogy puha legyen.
   - Ne süsd túl, csak melegítsd.

7. LÉPÉS - A töltelék elhelyezése:
   - Minden tortilla lap közepére helyezz rizst.
   - Add hozzá a babot.
   - Add hozzá a húst.
   - Add hozzá a 50g sajtot (reszelt vagy kockákra vágva).
   - Add hozzá a 50g salátát (előkészítve és szárazítva).

8. LÉPÉS - A szósz hozzáadása:
   - Kend rá a 2 evőkanál szószt (pl. salsa, guacamole, vagy más szósz).
   - Egyenletesen oszd el.

9. LÉPÉS - Fűszerezés:
   - Sózd és borsozz az ízlésed szerint.

10. LÉPÉS - A burrito összehajtása:
    - Hajtsd be az oldalakat.
    - Tekerd fel szorosan, mint egy burritót.
    - Ügyelj rá, hogy ne folyjon ki a töltelék.

11. LÉPÉS - Tálalás:
    - Tálald azonnal melegen.
    - Ideális proteindús ebédként vagy vacsoraként.
    - Szolgáld egy szép tálcán vagy tálban.

TIPP: Ha szeretnéd, adj hozzá avokádót, paradicsomot vagy más zöldségeket extra ízért és textúráért!', 'none', 'nem', 'nem', '380', NULL),
('400g padlizsán, 2 evőkanál olívaolaj, 2 gerezd fokhagyma, só, bors, 1 csokor bazsalikom', '25', 'kalóriaszegény', 'nem', 'könnyű', 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600&q=80', 'Sült padlizsán alacsony kcal

1. LÉPÉS - A sütő előkészítése:
   - Melegítsd elő a sütőt 200°C-ra.
   - Vegyél elő egy tepsit és sütőpapírt.

2. LÉPÉS - A padlizsán előkészítése:
   - Vegyél elő 400g padlizsánt.
   - Alaposan mosd meg hideg vízben.
   - Hámozd meg vagy hagyd a héján (a héj ehető).
   - Szárazítsd le.

3. LÉPÉS - A padlizsán szeletelése:
   - Vágd vékonyra szeletekre (kb. 1 cm vastagságú).
   - Használj éles kést.
   - Fontos, hogy egyenletesen vastagak legyenek.

4. LÉPÉS - A tepsibe helyezés:
   - Béleld ki a tepsit sütőpapírral.
   - Helyezd rá a padlizsán szeleteket egyenletesen egy rétegben.
   - Ne legyenek egymásra rakva.

5. LÉPÉS - Az olívaolaj kenése:
   - Kend meg minden padlizsán szeletet 2 evőkanál olívaolajjal.
   - Egyenletesen oszd el.
   - Használj ecsetet vagy kezedet.

6. LÉPÉS - A fokhagyma előkészítése:
   - Vegyél elő 2 gerezd fokhagymát.
   - Hámozd meg.
   - Aprítsd finomra vagy nyomd át.

7. LÉPÉS - A fűszerezés:
   - Szórd rá az apróra vágott fokhagymát.
   - Sózd és borsozd az ízlésed szerint.
   - Keverd át, hogy minden szelet be legyen fűszerezve.

8. LÉPÉS - A sütés:
   - Helyezd be a sütőbe 200°C-on.
   - Süsd 20-25 percig, amíg puha lesz és aranybarna lesz.
   - Félidőben (10-12 perc után) fordítsd meg a szeleteket, hogy mindkét oldaluk egyenletesen süljön.
   - Figyeld, hogy ne égjenek meg.

9. LÉPÉS - A bazsalikom előkészítése:
   - Vegyél elő 1 csokor friss bazsalikomot.
   - Alaposan mosd meg.
   - Finomra vágd vagy tépd fel.

10. LÉPÉS - Tálalás:
    - Vedd ki a sütőből és hagyd kihűlni 2-3 percig.
    - Szórd rá a finomra vágott bazsalikomot.
    - Tálald azonnal melegen.
    - Ideális köretként vagy főételként.

TIPP: Ha szeretnéd, adj hozzá reszelt parmezánt vagy olajbogyót extra ízért!', 'none', 'nem', 'nem', '220', NULL),
('200g rizs, 300g gomba, 1 fej vöröshagyma, 2 gerezd fokhagyma, 100ml fehérbor, 500ml húsleves, 50g parmezán, 2 evőkanál olívaolaj, só, bors, 1 csokor petrezselyem', '30', 'foetel', 'nem', 'olasz', 'https://images.unsplash.com/photo-1476124369491-e7addf5db371?q=80&w=600', 'Gombás risotto

1. LÉPÉS - A gomba előkészítése:
   - Vegyél elő 300g gombát (pl. csiperke, shiitake, vagy vegyes).
   - Alaposan mosd meg hideg vízben.
   - Szárazítsd le papírtörlővel.
   - Vágd vékonyra szeletekre vagy kockákra.

2. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 1 fej vöröshagymát és 2 gerezd fokhagymát.
   - Hámozd meg mindkettőt.
   - Aprítsd finomra a vöröshagymát.
   - Aprítsd finomra vagy nyomd át a fokhagymát.

3. LÉPÉS - A hagyma pirítása:
   - Egy nagy serpenyőben vagy fazékban melegítsd fel a 2 evőkanál olívaolajat.
   - Add hozzá a finomra vágott vöröshagymát.
   - Pirítsd 2-3 percig közepes lángon, amíg üveges lesz és illatos.

4. LÉPÉS - A rizs hozzáadása:
   - Add hozzá a 200g rizst (risotto rizs, pl. arborio).
   - Keverd jól össze a hagymával.
   - Pirítsd 2 percig, amíg a rizs üveges lesz.

5. LÉPÉS - A fehérbor hozzáadása:
   - Öntsd fel a 100ml fehérborral.
   - Keverd folyamatosan.
   - Főzd, amíg a bor elpárolog (kb. 2-3 perc).

6. LÉPÉS - A gomba hozzáadása:
   - Add hozzá a gombát és fokhagymát.
   - Keverd jól össze.
   - Pirítsd 2-3 percig, amíg a gomba megpuhul.

7. LÉPÉS - A húsleves hozzáadása:
   - Lassan, folyamatosan keverve öntsön hozzá húslevest (500ml).
   - Add hozzá egy kis adagot (kb. 100ml) egyszerre.
   - Főzd, amíg felszívódik, majd add hozzá a következő adagot.
   - Ismételd meg, amíg minden leves be nem kerül.
   - Folyamatosan keverd, hogy ne ragadjon le.

8. LÉPÉS - A főzés folytatása:
   - Főzd 15-20 percig közepes lángon, amíg a rizs megpuhul és krémes lesz.
   - A rizs kész, amikor puha, de még van benne egy kis "csípés" (al dente).
   - Ha szükséges, adj hozzá még egy kis levest vagy vizet.

9. LÉPÉS - A parmezán hozzáadása:
   - Vegyél elő 50g parmezánt.
   - Reszeld finomra reszelővel.
   - Add hozzá a risottóhoz.
   - Keverd jól össze.

10. LÉPÉS - Fűszerezés:
    - Sózd és borsozz az ízlésed szerint.
    - Próbáld meg, hogy jó legyen az íze.

11. LÉPÉS - A petrezselyem és tálalás:
    - Vegyél elő 1 csokor friss petrezselymet.
    - Alaposan mosd meg.
    - Finomra vágd.
    - Szórd rá a risottó tetejére.
    - Tálald azonnal melegen.
    - Ideális ebédként vagy vacsoraként.

TIPP: A risotto legjobb frissen készítve! Folyamatosan keverd, hogy krémes legyen!', 'none', 'nem', 'nem', '480', NULL);

INSERT INTO `receptek` (`hozzavalo`, `ido`, `meal`, `unnepi_etelek`, `kulonlegesseg`, `kepek`, `recept_hozzaadas`, `allergens`, `edes`, `sos`, `kaloria`, `felhasznalo_id`) VALUES
('200g étcsokoládé, 150g vaj, 150g cukor, 3 tojás, 100g liszt, 30g kakaópor, 1 teáskanál sütőpor, 1 csipet só', '45', 'desszert', 'nem', 'édes', 'https://images.unsplash.com/photo-1564355808539-22fda35bed7e?w=600&q=80', 'Csokoládés brownie

1. LÉPÉS - A sütő előkészítése:
   - Melegítsd elő a sütőt 180°C-ra.
   - Vegyél elő egy 20x20 cm-es tepsit vagy formát.
   - Béleld ki sütőpapírral.

2. LÉPÉS - A csokoládé és vaj olvasztása:
   - Vegyél elő 200g étcsokoládét és 150g vajat.
   - Vágd kisebb darabokra.
   - Egy tálba helyezd.
   - Olvaszd meg vízgőz fölött vagy mikróban.
   - Ha mikróban, süsd 30 másodpercenként, keverve, amíg teljesen felolvad.
   - Hagyd kihűlni 5 percig.

3. LÉPÉS - A tojások előkészítése:
   - Vegyél elő 3 tojást.
   - Egy nagy tálba törj be a tojásokat.
   - Keverd át villával.

4. LÉPÉS - A cukor hozzáadása:
   - Add hozzá a 150g cukrot a tojásokhoz.
   - Keverd habosra elektromos keverővel vagy kézzel, amíg világossárga és habos lesz (2-3 perc).

5. LÉPÉS - A csokoládé-vaj keverék hozzáadása:
   - Lassan add hozzá a kihűlt csokoládé-vaj keveréket a tojás-cukor keverékhez.
   - Keverd jól össze, amíg sima lesz.

6. LÉPÉS - A száraz hozzávalók előkészítése:
   - Vegyél elő 100g lisztet, 30g kakaóport, 1 teáskanál sütőport és 1 csipet sót.
   - Egy külön tálba szitáld át a lisztet, kakaóport, sütőport és sót.
   - Keverd össze, hogy egyenletesen el legyenek keverve.

7. LÉPÉS - A száraz hozzávalók hozzáadása:
   - Add hozzá a lisztet, kakaóport, sütőport és sót a csokoládés keverékhez.
   - Keverd jól össze, amíg sima lesz.
   - Ne keverd túl sokáig, csak amíg össze nem keveredik.

8. LÉPÉS - A tepsibe öntés:
   - Öntsd a tésztát a sütőpapírral bélelt tepsibe.
   - Simítsd el egyenletesen.

9. LÉPÉS - A sütés:
   - Helyezd be a sütőbe 180°C-on.
   - Süsd 25-30 percig, amíg a teteje aranybarna és egy fogpiszkáló, amit beleszúrsz, nedves jön ki (ne legyen teljesen száraz).
   - Közben ne nyisd ki a sütőt az első 20 percben.

10. LÉPÉS - Hűtés és tálalás:
    - Vedd ki a sütőből és hagyd kihűlni a tepsiben 30 percig.
    - Ezután vedd ki a formából és hagyd teljesen kihűlni egy rácsos tálcán.
    - Vágd szeletekre.
    - Tálald melegen vagy hidegen.

TIPP: A brownie még jobb lesz másnap, amikor az ízek összeérnek! Tárolható légmentesen zárható dobozban hűtőben 3-4 napig. Szolgáld tejszínhabbal vagy fagylalttal!', 'none', 'nem', 'nem', '350', NULL),
('4 fej vöröshagyma, 1 kg piros paprika, 500g paradicsom, 3 evőkanál sertészsír vagy olívaolaj, 2 evőkanál fűszerpaprika, 1 teáskanál köménymag, só, bors, 4 tojás (opcionális)', '45', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Lecsó tojással

1. LÉPÉS - A hagyma előkészítése:
   - Vegyél elő 4 fej vöröshagymát.
   - Hámozd meg és vágd félkarikákra vagy szeletekre.
   - Tedd félre.

2. LÉPÉS - A zsír melegítése:
   - Egy nagy lábasban melegítsd fel a 3 evőkanál sertészsírt vagy olívaolajt.
   - Add hozzá a hagymát.
   - Dinszteld 4-5 percig közepes lángon, amíg üveges lesz.
   - Keverd folyamatosan.

3. LÉPÉS - A paprika hozzáadása:
   - Vegyél elő 1 kg piros paprikát.
   - Mosd meg, vágd háromszögekre vagy karikákra, vedd ki a magházat.
   - Add hozzá a hagymához.
   - Pirítsd 2 percig.

4. LÉPÉS - A paradicsom hozzáadása:
   - Vegyél elő 500g paradicsomot.
   - Szeleteld fel és add hozzá a lábashoz.
   - Keverd jól össze.

5. LÉPÉS - Fűszerezés:
   - Szórd rá a 2 evőkanál fűszerpaprikát és 1 teáskanál köménymagot.
   - Sózd és borsozz az ízlésed szerint.
   - Keverd alaposan.

6. LÉPÉS - Főzés:
   - Fedő alatt főzd 20-30 percig közepes lángon.
   - A zöldségeknek meg kell puhulniuk, a lecsónak sűrű, szaftos állagúnak kell lennie.
   - Ha szükséges, adj hozzá kevés vizet.

7. LÉPÉS - Tojás (opcionális):
   - Ha tojásos lecsót készítesz, törd bele a 4 tojást a forró lecsóba.
   - Keverd és főzd 3-4 percig, amíg a tojás megdermed.
   - Keverd össze a lecsóval.

8. LÉPÉS - Tálalás:
   - Friss kenyérrel tálald forrón.
   - Azonnal fogyaszd.

TIPP: A lecsó legjobb friss, ropogós kenyérrel! Opcionálisan kolbászt is adhatsz hozzá!', 'none', 'nem', 'igen', '180', NULL),
('500g liszt, 25g friss élesztő, 300ml langyos víz, 1 teáskanál cukor, 1 teáskanál só, bő olaj a sütéshez, 4 gerezd fokhagyma, 200g tejföl, 150g reszelt sajt', '90', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1509722747041-616f39b57569?q=80&w=600', 'Lángos tejföllel és sajttal

1. LÉPÉS - Az élesztő aktiválása:
   - Egy kis tálba törd az 25g friss élesztőt.
   - Add hozzá az 1 teáskanál cukrot és 50ml langyos vizet.
   - Keverd össze és hagyd 5 percig, amíg habosodni kezd.

2. LÉPÉS - A tészta dagasztása:
   - Egy nagy tálba szitáld a 500g lisztet.
   - Add hozzá a sót, az aktivált élesztőt és a maradék 250ml langyos vizet.
   - Dagaszd jól össze 8-10 percig, amíg sima, rugalmas tésztát kapsz.
   - A tésztának lágyan ragadósnak kell lennie.

3. LÉPÉS - Kelesztés:
   - A tésztát takard le tiszta konyharuhával.
   - Hagyd kelni meleg helyen 1 órán át, amíg duplájára nő.

4. LÉPÉS - A tészta formázása:
   - A megkelt tésztát nyomkodd le.
   - Oszd 6-8 egyenlő részre.
   - Nyújtsd ki egyenként kör alakúra, kb. 1 cm vastagságig.
   - Középen nyomj lyukat.

5. LÉPÉS - Sütés:
   - Egy serpenyőben vagy mély fazékban hevítsd fel bő olajat (kb. 170°C).
   - Egyenként süsd a lángosokat 2-3 percig mindkét oldalon, amíg aranybarnák.
   - Szűrd le és tedd papírtörlőre a felesleges olaj eltávolításához.

6. LÉPÉS - A fokhagyma bedörzsölése:
   - Nyomd át a 4 gerezd fokhagymát.
   - Dörzsöld be vele a forró lángos tetejét.

7. LÉPÉS - Tálalás:
   - Kenj rá bőven tejfölt.
   - Szórd meg reszelt sajttal.
   - Azonnal fogyaszd forrón.

TIPP: A lángos a legjobb frissen, forrón! Próbáld ki fokhagymás tejföl nélkül is, ha édeset szeretnél!', 'gluten', 'nem', 'igen', '420', NULL),
('600g sertéstarja, 100g szalonna, 4 gerezd fokhagyma, 4 evőkanál liszt, 2 evőkanál fűszerpaprika, 1 fej vöröshagyma, 2 evőkanál olaj, só, bors, 1 evőkanál balzsamecet', '60', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?q=80&w=600', 'Cigánypecsenye

1. LÉPÉS - A hús előkészítése:
   - Vegyél elő 600g sertéstarját.
   - Vágd ujjnyi vastag szeletekre.
   - Nyomd jól vékonyabbra húsklopfolóval, ha szükséges.

2. LÉPÉS - A pácolás:
   - Egy tálba tedd a hússzeleteket.
   - Szórd rá a 2 gerezd összenyomott fokhagymát, sót és borsot.
   - Önts rá 1 evőkanál olajat.
   - Hagyd állni legalább 30 percig (ideális 1 óra).

3. LÉPÉS - A rántás előkészítése:
   - Egy tányérra keverd össze a 4 evőkanál lisztet és 2 evőkanál fűszerpaprikát.
   - A pácolt hússzeleteket forgasd meg a paprikás lisztben mindkét oldalról.

4. LÉPÉS - A szalonna sütése:
   - Egy nagy serpenyőben süsd meg a 100g szalonnát közepes lángon.
   - Amíg ropogós, vedd ki és tedd félre.
   - A serpenyőben maradó zsírban folytasd.

5. LÉPÉS - A hús sütése:
   - A forró szalonnazsírban süsd a rántott hússzeleteket nagy lángon.
   - 3-4 percig mindkét oldalon, amíg aranybarnák.
   - Ne süsd túl sokáig, maradjon szaftos.

6. LÉPÉS - A hagyma karamellizálása:
   - A vöröshagymát vágd vékony karikákra.
   - Egy másik serpenyőben 1 evőkanál olajon pirítsd üvegesre.
   - Add hozzá a balzsamecetet, sózd.
   - Főzd 5 percig, amíg szép aranybarna.

7. LÉPÉS - Tálalás:
   - Tálald a cigánypecsenyét a karamellizált hagymával és ropogós szalonnával.
   - Szolgáld fel friss kenyérrel vagy burgonyapürével.

TIPP: A cigánypecsenye íze a paprikás rántásban rejlik - ne spórolj a fűszerpaprikával!', 'none', 'nem', 'igen', '380', NULL),
('1 kg csirkehús, 2 fej vöröshagyma, 3 evőkanál fűszerpaprika, 2 paradicsom, 2 paprika, 200ml tejföl, 2 evőkanál liszt, 2 evőkanál olaj, 200ml víz, só, bors, 2 babérlevél, majoránna', '55', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1588166524941-3bf61a9c41db?q=80&w=600', 'Paprikás csirke nokedlivel

1. LÉPÉS - A hagyma dinsztelése:
   - Egy nagy lábasban melegítsd fel a 2 evőkanál olajat.
   - Add hozzá a finomra vágott vöröshagymát.
   - Dinszteld 5 percig, amíg üveges lesz.

2. LÉPÉS - A paprika hozzáadása:
   - Vegedd le a tűzről és szórd rá a 3 evőkanál fűszerpaprikát.
   - Azonnal keverd össze, hogy ne égjen meg.
   - Add hozzá a feldarabolt paradicsomot és paprikát.

3. LÉPÉS - A csirke hozzáadása:
   - Add hozzá a 1 kg csirkehúst (comb, mell, szárny).
   - Pirítsd 5 percig mindkét oldalon.
   - Öntsd fel 200ml vízzel.
   - Add hozzá a babérlevelet, majoránnát, sót és borsot.

4. LÉPÉS - Főzés:
   - Fedő alatt főzd 35-40 percig közepes-alacsony lángon.
   - A húsnak teljesen meg kell puhulnia.
   - Ha szükséges, adj hozzá még vizet.

5. LÉPÉS - A habarás készítése:
   - Egy kis tálban keverd össze a 200ml tejfölt és 2 evőkanál lisztet.
   - Add hozzá egy kevés meleg szaftot, keverd simára.
   - Öntsd vissza a lábasba és keverd össze.
   - Főzd még 5 percig, ne forrald fel erősen.

6. LÉPÉS - Tálalás:
   - Tálald nokedlivel vagy galuskával.
   - Azonnal fogyaszd forrón.

TIPP: A paprikás csirke a magyar konyha egyik kedvence - a habarás teszi krémesé!', 'none', 'nem', 'igen', '320', NULL),
('500g marhalábszár, 2 fej vöröshagyma, 3 evőkanál fűszerpaprika, 2 sárgarépa, 2 szál zeller, 4 burgonya, 2 paprika, 1 paradicsom, 1 teáskanál köménymag, 1.5 liter víz, só, bors, 2 babérlevél, petrezselyem', '90', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Gulyásleves

1. LÉPÉS - A hús előkészítése:
   - Vegyél elő 500g marhalábszárt.
   - Vágd kockákra (kb. 2-3 cm).
   - Mosd meg és szárítsd le.

2. LÉPÉS - A hagyma pirítása:
   - Egy nagy lábasban olvassz 2 evőkanál sertészsírt vagy olajat.
   - Add hozzá a finomra vágott vöröshagymát.
   - Pirítsd 5 percig, amíg aranybarna.

3. LÉPÉS - A paprika hozzáadása:
   - Vegedd le a tűzről.
   - Szórd rá a 3 evőkanál fűszerpaprikát.
   - Azonnal keverd össze, adj hozzá 2 dl vizet.
   - Add hozzá a húskockákat.

4. LÉPÉS - A zöldségek hozzáadása:
   - Add hozzá a kockára vágott sárgarépát, zellert, paprikát és paradicsomot.
   - Öntsd fel 1.5 liter vízzel.
   - Add hozzá a köménymagot, babérlevelet, sót és borsot.

5. LÉPÉS - Főzés:
   - Forrald fel, majd csökkentsd a lángot.
   - Fedő alatt főzd 60-70 percig, amíg a hús megpuhul.
   - Az utolsó 20 percben add hozzá a kockára vágott burgonyát.

6. LÉPÉS - Tálalás:
   - Szórd meg friss petrezselyemmel.
   - Tálald forrón, friss kenyérrel.

TIPP: A gulyásleves íze másnap még jobb! Opcionálisan készíts hozzá csipetkét!', 'none', 'nem', 'igen', '280', NULL),
('600g savanyú káposzta, 500g darált sertéshús, 150g rizs, 1 fej vöröshagyma, 2 gerezd fokhagyma, 2 evőkanál fűszerpaprika, 150g füstölt kolbász, 100g szalonna, 150ml tejföl, só, bors, 1 babérlevél', '120', 'foetel', 'igen', 'magyaros', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Töltött káposzta

1. LÉPÉS - A töltelék készítése:
   - Egy tálba keverd össze a 500g darált húst, 150g főtt rizst, finomra vágott hagymát és fokhagymát.
   - Add hozzá a fűszerpaprikát, sót és borsot.
   - Keverd jól össze.

2. LÉPÉS - A káposztalevelek előkészítése:
   - Vegyél elő 600g savanyú káposztát.
   - Válaszd szét a leveleket.
   - Ha túl nagyok, vágd ketté.
   - A vastag erét vágd vékonyabbra.

3. LÉPÉS - Töltés:
   - Egy káposztalevélre tegyél egy evőkanálnyi tölteléket.
   - Göngyöld fel szorosan, tedd félre.
   - Ismételd meg az összes levéllel.

4. LÉPÉS - Az alj elkészítése:
   - Egy nagy lábas alját béleld savanyú káposztalevelekkel.
   - Tedd rá a szalonnát és a kolbászdarabbokat.
   - Helyezd rá a töltött káposzta göngyölegeket szorosan egymás mellé.

5. LÉPÉS - Főzés:
   - Öntsd fel vízzel, hogy ellepje.
   - Add hozzá a babérlevelet.
   - Fedő alatt főzd 90 percig alacsony lángon.
   - A káposztának és a húsnak meg kell puhulnia.

6. LÉPÉS - Tálalás:
   - Tálald tejföllel és friss kenyérrel.
   - Melegen fogyaszd.

TIPP: A töltött káposzta ünnepi étel - a füstölt húsok adják az igazi ízt!', 'none', 'nem', 'igen', '350', NULL),
('800g burgonya, 4 tojás, 200g virsli, 200ml tejföl, 1 fej vöröshagyma, 100g szalonna, só, bors, 2 evőkanál olaj, petrezselyem', '60', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?q=80&w=600', 'Rakott krumpli

1. LÉPÉS - A burgonya főzése:
   - Vegyél elő 800g burgonyát.
   - Hámozd meg és főzd sós vízben 20 percig, amíg puha.
   - Szűrd le és hagyd kihűlni.
   - Vágd vékony karikákra.

2. LÉPÉS - A tojás főzése:
   - Főzd keményre a 4 tojást.
   - Hámozd meg és vágd karikákra.

3. LÉPÉS - A virsli és hagyma előkészítése:
   - A 200g virslit vágd karikákra.
   - A vöröshagymát vágd vékony karikákra.
   - A szalonnát vágd kockákra.

4. LÉPÉS - Rétegezés:
   - Egy sütőtűrésű tálat kenj ki olajjal.
   - Egy réteg burgonyát helyezz az aljára.
   - Szórd meg sóval és borssal.
   - Rétegezd: virsli, tojás, hagyma.
   - Ismételd a burgonya réteget.
   - A tetejére kerüljön burgonya.

5. LÉPÉS - A tejföl és szalonna:
   - A tetejét kenj be 200ml tejföllel.
   - Szórd meg a szalonnakockákkal.
   - Ha szeretnéd, adj hozzá még tejfölt a rétegek közé is.

6. LÉPÉS - Sütés:
   - Melegítsd elő a sütőt 180°C-ra.
   - Süsd 40-45 percig, amíg a teteje szép barna és a burgonya átmelegedett.
   - Az utolsó 10 percben növeld 200°C-ra a kérgesedéshez.

7. LÉPÉS - Tálalás:
   - Szórd meg friss petrezselyemmel.
   - Tálald forrón, salátával.

TIPP: A rakott krumpli másnap is finom - melegítsd fel sütőben!', 'none', 'nem', 'igen', '380', NULL),
('400g bab (fehér vagy piros), 200g füstölt csülök, 1 fej vöröshagyma, 2 gerezd fokhagyma, 2 evőkanál fűszerpaprika, 1 sárgarépa, 1 szál zeller, 2 evőkanál olaj, 1.2 liter víz, só, bors, 2 babérlevél, 1 evőkanál ecet, tejföl', '90', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Bableves

1. LÉPÉS - A bab áztatása:
   - Az 400g babot öntsd vízbe és áztasd 8-12 óráig (vagy használj konzerv babot).
   - Szűrd le és mosd meg.

2. LÉPÉS - A hagyma pirítása:
   - Egy nagy lábasban melegítsd fel a 2 evőkanál olajat.
   - Add hozzá a finomra vágott vöröshagymát és fokhagymát.
   - Pirítsd 3 percig.

3. LÉPÉS - A paprika hozzáadása:
   - Vegedd le a tűzről.
   - Szórd rá a 2 evőkanál fűszerpaprikát.
   - Keverd össze, adj hozzá 1 dl vizet.

4. LÉPÉS - A bab és hús hozzáadása:
   - Add hozzá a babot és a kockára vágott füstölt csülköt.
   - Add hozzá a sárgarépát és zellert kockákra vágva.
   - Öntsd fel 1.2 liter vízzel.
   - Add hozzá a babérlevelet, sót és borsot.

5. LÉPÉS - Főzés:
   - Forrald fel, majd csökkentsd a lángot.
   - Fedő alatt főzd 60-75 percig, amíg a bab puha.
   - Ha szükséges, adj hozzá vizet.
   - Az utolsó percben add hozzá az ecetet.

6. LÉPÉS - Tálalás:
   - Tálald tejföllel és friss kenyérrel.
   - Opcionálisan adj hozzá ecetet a tányérba.

TIPP: A bableves jellegzetes magyar étel - a füstölt csülök nélkülözhetetlen!', 'none', 'nem', 'igen', '290', NULL),
('300g darált sertéshús, 6 db palacsinta, 1 fej vöröshagyma, 2 evőkanál fűszerpaprika, 1 paradicsom, 200ml tejföl, 2 evőkanál liszt, 2 evőkanál olaj, 300ml húsleves, só, bors, 150g liszt (palacsintahoz), 2 tojás, 400ml tej', '50', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?q=80&w=600', 'Hortobágyi palacsinta

1. LÉPÉS - A palacsinták sütése:
   - Keverd össze 150g lisztet, 2 tojást és 400ml tejet.
   - Süss 6 vékony palacsintát serpenyőben.
   - Tedd félre.

2. LÉPÉS - A töltelék készítése:
   - Egy serpenyőben pirítsd meg a finomra vágott hagymát olajon.
   - Add hozzá a 300g darált húst, süsd 5 percig.
   - Szórd rá a fűszerpaprikát, add hozzá a paradicsomot.
   - Főzd 10 percig, sózd és borsozd.

3. LÉPÉS - Töltés:
   - Minden palacsintára tedd a hústöltelék egyhatodát.
   - Göngyöld fel szorosan.
   - Helyezd sütőtűrésű tálba egymás mellé.

4. LÉPÉS - A szósz készítése:
   - A 300ml húslevest keverd össze 200ml tejföllel és 2 evőkanál liszttel.
   - Főzd 5 percig, amíg besűrűsödik.
   - Öntsd a palacsintákra.

5. LÉPÉS - Sütés:
   - Melegítsd elő a sütőt 180°C-ra.
   - Süsd 15-20 percig, amíg a teteje barnul.
   - A szósznak bugyborékolnia kell.

6. LÉPÉS - Tálalás:
   - Tálald forrón, friss salátával.
   - A hortobágyi palacsinta a magyar konyha klasszikusa.

TIPP: A maradék palacsintákat másnap is finomak melegítve!', 'gluten', 'nem', 'igen', '380', NULL),
('500g túró, 100g búzadara, 2 tojás, 50g liszt, 1 csipet só, 100g zsemlemorzsa, 50g vaj, 2 evőkanál porcukor, 1 teáskanál fahéj, 200g tejföl', '35', 'desszert', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1488477181946-6428a0291777?q=80&w=600', 'Túrógombóc tejföllel

1. LÉPÉS - A túró előkészítése:
   - Szűrd le a 500g túrót, ha nedves.
   - Egy tálba törd össze villával.
   - Add hozzá a 2 tojást, 50g lisztet, 1 csipet sót és 100g búzadarát.
   - Keverd jól össze, amíg sima tésztát kapsz.

2. LÉPÉS - A gombócok formázása:
   - Nedves kézzel formálj kb. 2 cm-es gombócokat a tésztából.
   - Tedd félre egy enyén lisztezett tálcára.

3. LÉPÉS - Forralás:
   - Egy nagy fazékban forralj bő sós vizet.
   - Lassan ejtsd be a gombócokat (ne túl sokat egyszerre).
   - Amikor feljönnek a víz tetejére, főzd még 2-3 percig.
   - Szűrd le kanallal.

4. LÉPÉS - A morzsa pirítása:
   - Egy serpenyőben olvassz 50g vajat.
   - Add hozzá a 100g zsemlemorzsát.
   - Pirítsd 3-4 percig, amíg aranybarna és ropogós.
   - Keverd folyamatosan.

5. LÉPÉS - Tálalás:
   - A forró gombócokat forgasd meg a pirított morzsában.
   - Tálald tejföllel, porcukorral és fahéjjal.
   - Azonnal fogyaszd.

TIPP: A túrógombóc édes-sós - tökéletes ebéd vagy uzsonna! Opcionálisan mazsolát is adhatsz a tésztához!', 'gluten', 'igen', 'igen', '320', NULL),
('1.5 kg ponty vagy vegyes hal, 2 fej vöröshagyma, 4 gerezd fokhagyma, 2 paprika, 2 paradicsom, 3 evőkanál fűszerpaprika (édes és csípős), 2 liter víz, 2 evőkanál olaj, só, bors', '90', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600', 'Halászlé

1. LÉPÉS - A hal előkészítése:
   - Vegyél elő 1.5 kg pontyot vagy vegyes halat (harcsa, keszeg).
   - Pikkeld meg, tisztítsd le.
   - A hal fejét, farokrészét és csontjait tedd félre az alapléhez.
   - A halfilét vágd nagyobb darabokra.

2. LÉPÉS - Az alaplé készítése:
   - Egy nagy lábasban melegítsd fel a 2 evőkanál olajat.
   - Add hozzá a finomra vágott vöröshagymát és fokhagymát.
   - Pirítsd 3 percig.
   - Add hozzá a hal fejet, farokrészt, csontjait.
   - Öntsd fel 2 liter vízzel.
   - Forrald fel, majd csökkentsd a lángot.
   - Főzd 45-60 percig, amíg az alaplé erős ízű lesz.
   - Szűrd le, a csontokat és fejet dobd ki.

3. LÉPÉS - A paprika hozzáadása:
   - A tiszta levet melegítsd fel.
   - Vegedd le a tűzről.
   - Szórd rá a 3 evőkanál fűszerpaprikát.
   - Azonnal keverd össze, hogy ne égjen meg.

4. LÉPÉS - A zöldségek és halfilé:
   - Add hozzá a kockára vágott paprikát és paradicsomot.
   - Add hozzá a halfilé darabokat.
   - Főzd 8-10 percig, amíg a hal átsül.
   - Sózd és borsozd az ízlésed szerint.

5. LÉPÉS - Tálalás:
   - Tálald forrón, friss kenyérrel.
   - Hagyományosan csípős paprikával és tejföllel is szolgálhatod.

TIPP: A halászlé a Tisza és Duna menti klasszikus - a friss hal a titka!', 'none', 'nem', 'igen', '220', NULL),
('500g tarhonya vagy csusza tészta, 400g túró, 150g füstölt szalonna, 200ml tejföl, 2 evőkanál zsír vagy olaj, só, bors', '35', 'foetel', 'nem', 'magyaros', 'https://images.unsplash.com/photo-1551183053-bf91a1d81141?q=80&w=600', 'Túrós csusza

1. LÉPÉS - A tészta főzése:
   - Egy nagy fazékban forralj bő sós vizet.
   - Add hozzá a 500g tarhonyát vagy csusza tésztát.
   - Főzd a csomagolás utasítása szerint (kb. 8-12 perc), amíg puha.
   - Szűrd le, de tartsd melegen.

2. LÉPÉS - A szalonna sütése:
   - A 150g füstölt szalonnát vágd kockákra.
   - Egy serpenyőben süsd ropogósra közepes lángon.
   - A kiolvadt zsírban maradhat - ez adja az ízt.
   - Tedd félre.

3. LÉPÉS - A túró előkészítése:
   - A 400g túrót törd össze villával egy tálban.
   - Sózd és borsozd enyhén.
   - Ha túl száraz, keverj hozzá 1-2 evőkanál tejfölt.

4. LÉPÉS - Az összerakás:
   - Egy nagy serpenyőben melegítsd fel a 2 evőkanál zsírt vagy olajat.
   - Add hozzá a lecsepegtetett tésztát.
   - Keverd át 1-2 percig.
   - Add hozzá a túrót és a ropogós szalonnát (a zsírjával együtt).
   - Keverd jól össze, amíg minden meleg.

5. LÉPÉS - Tálalás:
   - Tálald azonnal forrón.
   - Locsold rá bőven a 200ml tejfölt.
   - A szalonna a tetején vagy keverve - ízlés szerint.

TIPP: A túrós csusza egy igazi magyar „vasárnapi” étel - egyszerű, de fantasztikusan finom!', 'gluten', 'nem', 'igen', '380', NULL);

-- Trigger-ek újra létrehozása
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

-- Ebéd → Főétel: a főételek az etelek.foetel szerint (meal = foetel)
UPDATE `receptek` SET `meal` = 'foetel' WHERE `meal` = 'ebéd';

-- Túrógombóc → desszert kategória
UPDATE `receptek` SET `meal` = 'desszert' WHERE `recept_hozzaadas` LIKE 'Túrógombóc tejföllel%';

-- Desszert kategória biztosítása (ha régi adat volt, javítás)
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = '10órai' AND `recept_hozzaadas` LIKE 'Túró strudel%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = '10órai' AND `recept_hozzaadas` LIKE 'Sült alma fahéjjal és joghurttal%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = '10órai' AND `recept_hozzaadas` LIKE 'Kávé kekszel és csokoládéval%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = '10órai' AND `recept_hozzaadas` LIKE 'Gyümölcssaláta%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = '10órai' AND `recept_hozzaadas` LIKE 'Keksz%A vajat keverd%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Tiramisu%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Almás pite%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Csokoládétorta%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Vaníliafagyi%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Citromtorta%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Szakács puding%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Sütőtökös desszert%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Málnás pohár%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Mogyorós édesség%';
UPDATE `receptek` SET `meal` = 'desszert' WHERE `meal` = 'uzsonna' AND `recept_hozzaadas` LIKE 'Panna cotta%';

-- Összesen 153 recept beszúrva (141 + 12 magyar főétel).
