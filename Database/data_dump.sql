-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: online_retail_store
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `online_retail_store`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `online_retail_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `online_retail_store`;

--
-- Table structure for table `Coupon`
--

DROP TABLE IF EXISTS `Coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Coupon` (
  `Coupon_Code` varchar(30) NOT NULL,
  `Discount_Percentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Coupon_Code`),
  CONSTRAINT `Coupon_chk_1` CHECK ((`discount_percentage` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coupon`
--

LOCK TABLES `Coupon` WRITE;
/*!40000 ALTER TABLE `Coupon` DISABLE KEYS */;
INSERT INTO `Coupon` VALUES ('1',10.32),('10',23.62),('11',21.25),('12',28.90),('13',24.85),('14',11.23),('15',26.77),('16',2.45),('17',22.47),('18',22.16),('19',27.68),('2',6.64),('20',19.53),('21',25.18),('22',18.29),('23',14.30),('24',13.31),('25',7.78),('26',27.32),('27',29.71),('28',26.11),('29',26.52),('3',9.92),('30',20.42),('31',4.66),('32',1.46),('33',7.91),('34',3.93),('35',26.93),('36',28.00),('37',14.84),('38',18.14),('39',4.37),('4',22.70),('40',2.17),('41',14.12),('42',4.41),('43',10.95),('44',16.88),('45',12.48),('46',19.43),('47',9.94),('48',21.41),('49',23.49),('5',21.71),('50',12.22),('51',27.84),('52',22.63),('53',26.94),('54',28.94),('55',20.04),('56',6.66),('57',26.00),('58',26.92),('59',17.60),('6',27.84),('60',21.35),('61',15.93),('62',16.22),('63',10.58),('64',13.05),('65',8.62),('66',20.51),('67',6.51),('68',21.74),('69',13.92),('7',7.03),('70',21.07),('71',14.47),('72',11.56),('73',5.63),('74',27.86),('75',25.87),('76',21.18),('77',22.95),('78',4.19),('79',10.85),('8',18.15),('80',13.86),('81',26.47),('82',23.50),('83',3.12),('84',21.62),('85',12.44),('86',6.84),('87',27.09),('88',25.43),('89',21.26),('9',29.24),('90',19.85),('91',6.54),('92',28.13),('93',29.44),('94',28.70),('95',11.79),('96',20.61),('97',1.69),('98',11.09);
/*!40000 ALTER TABLE `Coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customer_ID` decimal(30,0) NOT NULL,
  `First_name` varchar(30) NOT NULL,
  `Last_name` varchar(30) NOT NULL,
  `House_number` decimal(30,0) DEFAULT NULL,
  `Locality` varchar(30) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `pincode` decimal(6,0) DEFAULT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`customer_ID`),
  UNIQUE KEY `email_address` (`email_address`),
  CONSTRAINT `Customer_chk_1` CHECK ((`House_number` >= 0)),
  CONSTRAINT `Customer_chk_2` CHECK ((`pincode` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Shurlock','Sadgrove',3978,'Eastlawn','Na Muen',872979,'ssadgrove0@sitemeter.com','LJc5AVRCdR'),(2,'Allin','Millward',77919,'Gerald','Erie',469017,'amillward1@techcrunch.com','Cg8hpuQk2zK'),(3,'Algernon','Clemoes',2140,'Menomonie','Mulan',739352,'aclemoes2@stumbleupon.com','teh1Xj'),(4,'Mariele','Eady',3,'Montana','Riyadh',674094,'meady3@topsy.com','n3pq9BM'),(5,'Forrest','Silcock',5,'Barnett','Ponikiew',288549,'fsilcock4@1688.com','wGmQ0qd'),(6,'Cherilyn','Stubbs',1,'Oriole','Talacogon',326232,'cstubbs5@abc.net.au','K4B2VeOX'),(7,'Pegeen','Belfelt',5932,'Kenwood','Toritama',109048,'pbelfelt6@npr.org','j2XLLuhoZ3O'),(8,'Niki','Shaddock',2102,'Linden','Al Metlaoui',449833,'nshaddock7@cloudflare.com','8z4SFkBS3lcb'),(9,'Agneta','Shawcross',7,'Meadow Valley','Štítina',607446,'ashawcross8@1und1.de','c5hGjO5lHyK'),(10,'Murry','Shepstone',3359,'Esker','Luoshanchuan',791387,'mshepstone9@prweb.com','1roHumY'),(11,'Shawnee','Mertin',246,'Sloan','Zhoupi',181088,'smertina@a8.net','CpHo4JRlq'),(12,'Tadeas','Rennels',8863,'Dakota','Menghai',492017,'trennelsb@istockphoto.com','wgVf82aDC'),(13,'Feodor','Kernermann',93674,'Karstens','Tukan',852903,'fkernermannc@disqus.com','SWQJXPM7Ag'),(14,'Wadsworth','Scatchar',4503,'Oak Valley','Girihieum',634139,'wscatchard@economist.com','MhhrEC'),(15,'Gabrielle','Kwiek',5021,'Transport','Taquile',988281,'gkwieke@arstechnica.com','WIHkBC1J9kWv'),(16,'Richmond','Pimblott',4,'Talisman','Ducheng',802493,'rpimblottf@amazon.co.jp','kf82Cu1bD7'),(17,'Alberik','Galtone',47,'Arkansas','Le Lamentin',421659,'agaltoneg@e-recht24.de','3DiCYNMMD'),(18,'Cacilie','Gerriessen',821,'Pankratz','Laveiras',785517,'cgerriessenh@youtu.be','ONcE64l1iH'),(19,'Tabbi','O\'Sullivan',5956,'Southridge','Sinop',888060,'tosullivani@stumbleupon.com','tcONFUnZXF'),(20,'Lenore','Folshom',8,'Tony','Tatuí',658205,'lfolshomj@printfriendly.com','VuXYEb8tXAB'),(21,'Padraic','Cogle',64,'Melvin','Cumming',661872,'pcoglek@topsy.com','EvyCfgFKse'),(22,'Zolly','Malarkey',9438,'Acker','Svojat',411467,'zmalarkeyl@sakura.ne.jp','AnUdJjrAN7'),(23,'Judd','Langmead',797,'Browning','Courbevoie',393126,'jlangmeadm@timesonline.co.uk','YEZFQC9bONOH'),(24,'Dex','Posnett',4,'Havey','Río Tercero',996342,'dposnettn@walmart.com','gx4V7GL'),(25,'Jeralee','McGraffin',1,'Nelson','Gensi',235624,'jmcgraffino@psu.edu','fKenm2cCKwH5'),(26,'Alley','Gorner',78024,'Pennsylvania','Fort-de-France',516120,'agornerp@redcross.org','EWnPxB'),(27,'Rafe','Handyside',29511,'Old Shore','Nobeoka',348756,'rhandysideq@imgur.com','jceTSO'),(28,'Reena','Riccioppo',33882,'Superior','Seoul',933245,'rriccioppor@flickr.com','9Z32nhSHtuL'),(29,'Jodie','Dunderdale',7,'Buell','Tosu',784878,'jdunderdales@simplemachines.org','QGOwj4XQ8xqF'),(30,'Felita','Durno',656,'Shopko','Gwandu',749587,'fdurnot@icq.com','Mxrt3Yfp6VY'),(31,'Joel','Jewson',889,'Anzinger','El Benque',722249,'jjewsonu@state.gov','0wnexwJsAv'),(32,'Henderson','Choppen',46919,'Montana','Bhola',256803,'hchoppenv@usgs.gov','b8JQyr'),(33,'Odelia','Di Maria',7141,'Mitchell','Bilo',355193,'odimariaw@cdbaby.com','v4kprbjWShKD'),(34,'Otha','Petrecz',7,'Thackeray','Staraya Toropa',288586,'opetreczx@bravesites.com','yRJbQolb'),(35,'Earl','Side',8,'Del Mar','Changping',915489,'esidey@hp.com','VFIv5CCBl'),(36,'Casie','Grichukhin',87,'Fallview','Kurjan',823582,'cgrichukhinz@cdbaby.com','mowIb8k41XVc'),(37,'Demetri','Speechly',990,'Golf','Plato',158783,'dspeechly10@bluehost.com','gtiUH5uvDn'),(38,'Ruby','Atkyns',485,'Anthes','Donghoufang',269929,'ratkyns11@howstuffworks.com','ZqcGa5VNKG6x'),(39,'Jervis','Winfindine',3062,'Larry','Mae Ramat',124823,'jwinfindine12@dmoz.org','iceAecpqy7de'),(40,'Cindra','Hapke',1,'Fordem','Yazykovo',596481,'chapke13@lulu.com','iJkM6x1oBR'),(41,'Gaynor','Fernihough',399,'Loftsgordon','Socorro',500461,'gfernihough14@hao123.com','vTG49YIC1Vn'),(42,'Roseann','Cosstick',279,'Fieldstone','Dengzhou',574076,'rcosstick15@amazon.de','IV3hU2WAD'),(43,'Roberto','Pauluzzi',46772,'Del Sol','Kingersheim',978567,'rpauluzzi16@taobao.com','yGnqtDeYETkf'),(44,'Kellia','Wolfendell',22,'Kedzie','Uhniv',546114,'kwolfendell17@ocn.ne.jp','PqYGvrA'),(45,'Phineas','Vel',82739,'Sloan','Mossoró',793548,'pvel18@jalbum.net','tnQJcLi'),(46,'Lawrence','Wainscoat',17,'Maywood','Palmeira das Missões',289412,'lwainscoat19@last.fm','7I9MiqQskipQ'),(47,'Ruddie','Ivashkov',4,'Summerview','Třešť',496617,'rivashkov1a@nsw.gov.au','sPzc3XgAC'),(48,'Con','Rentoll',6,'Kropf','Wangfu',779298,'crentoll1b@reverbnation.com','poTRTk'),(49,'Bill','Rattery',4618,'Welch','Bác Ái',516646,'brattery1c@mapy.cz','FWmuWOu'),(50,'Nanette','Mahomet',83033,'Heath','Amuñgan',146891,'nmahomet1d@usa.gov','KahdGEG'),(51,'Correna','Northcott',9736,'Arrowood','Monteiro',898761,'cnorthcott1e@omniture.com','nXpVHgs'),(52,'Blondelle','Tomadoni',37284,'Eastwood','Trollhättan',292747,'btomadoni1f@globo.com','n5ZIeU'),(53,'Wildon','McMylor',647,'Donald','Tsagaanchuluut',461551,'wmcmylor1g@yahoo.co.jp','ruTdgV6uNB7'),(54,'Clywd','Capstake',4574,'Ridge Oak','Sharkawshchyna',350734,'ccapstake1h@wikimedia.org','MorGhJ'),(55,'Zacharias','Adair',7,'Washington','Porsgrunn',619140,'zadair1i@shop-pro.jp','r8nqcFT'),(56,'Munroe','Tucsell',2062,'Kennedy','Sedlice',111241,'mtucsell1j@addtoany.com','pMIB7l'),(57,'Neville','Jemison',4,'New Castle','Yuannan',101129,'njemison1k@cbc.ca','qm3UUbgHQ'),(58,'Sherye','Hallatt',9070,'Garrison','Zhoukoudian',181954,'shallatt1l@bravesites.com','OjTiRF2bMlXw'),(59,'Siffre','Christophersen',2,'Pearson','Banjar Tegal Belodan',567655,'schristophersen1m@mit.edu','aVcGtG8rKFa'),(60,'Carol-jean','Spurryer',8423,'Toban','Donetsk',683752,'cspurryer1n@gnu.org','AI8Bm7n'),(61,'Nefen','Biskup',67310,'Eggendart','Banjar Batuaji Kaja',511481,'nbiskup1o@microsoft.com','ciiU0ZniwO'),(62,'Morty','Guillon',3,'Schmedeman','Parachinar',957677,'mguillon1p@reuters.com','gObqXR'),(63,'Earlie','Chattaway',7,'1st','Luofang',105938,'echattaway1q@mayoclinic.com','8cgC9ewWYKr'),(64,'Leeann','Spight',95,'Florence','Marapat',626224,'lspight1r@com.com','R6Zr4jfg5kl'),(65,'Jory','Burgiss',7961,'Dorton','Jimsar',529984,'jburgiss1s@stanford.edu','tSGe5j7qT9p'),(66,'Jacky','Greenroad',13387,'Hoard','Huadi',144446,'jgreenroad1t@dion.ne.jp','Waa7rQSD'),(67,'Sada','Kynton',37,'American','Socos',743868,'skynton1u@elpais.com','CbrbVOvo8aJ'),(68,'Casie','Galvan',976,'Fieldstone','Orlando',864940,'cgalvan1v@ocn.ne.jp','MmGAwOo0'),(69,'Burch','Camock',368,'Badeau','Turnišče',527190,'bcamock1w@umn.edu','93k2T3T'),(70,'Jobye','Louedey',9843,'Eliot','Varginha',275791,'jlouedey1x@infoseek.co.jp','tiG2Nw2'),(71,'Chris','Newlove',29,'Morningstar','Sokyryany',349060,'cnewlove1y@arizona.edu','rwHmvs85He8'),(72,'Merv','Gabbitis',0,'Springs','Žulová',982135,'mgabbitis1z@vistaprint.com','NjU8fuHxw2d'),(73,'Artair','Tuma',50,'Northfield','Ivanteyevka',358049,'atuma20@kickstarter.com','A99sqMfIT'),(74,'Ransell','Kleuer',1,'Fuller','Paty do Alferes',153669,'rkleuer21@booking.com','CG5FkHO'),(75,'Vincents','Searby',244,'Crest Line','Campo Maior',538432,'vsearby22@list-manage.com','MwHR7bn7sa69'),(76,'Caterina','Stanbury',31,'Farmco','Taipingxu',979496,'cstanbury23@jiathis.com','DTZRCjbnPkF'),(77,'Berthe','Rego',797,'Summerview','Semarapura',304521,'brego24@abc.net.au','hxFuV4CYZ'),(78,'Gothart','Sketch',2,'Magdeline','Qianxu Zhen',246951,'gsketch25@cafepress.com','iWhAxxtBA'),(79,'Owen','Venny',84,'Sutteridge','Jadów',803458,'ovenny26@jigsy.com','LqvVCbt'),(80,'Dene','McNysche',67,'Schurz','Lodja',933118,'dmcnysche27@aol.com','nygXhUL'),(81,'Franzen','Rubenczyk',300,'Maryland','Elói Mendes',422734,'frubenczyk28@twitter.com','oXvW0uF7'),(82,'Estelle','Smedley',14277,'Di Loreto','Sinajana Village',504227,'esmedley29@npr.org','N67Uu0UIek'),(83,'Dani','Boij',6,'Randy','Negla',546903,'dboij2a@discuz.net','JcoxcL'),(84,'Pancho','Meegan',5,'Lotheville','Lizhai',667428,'pmeegan2b@baidu.com','gQb207E'),(85,'Camile','Fincham',0,'Magdeline','Tsuyama',669930,'cfincham2c@stanford.edu','ZxH5f75flrd'),(86,'Tanner','Niesel',78,'Haas','Dahuaishu',439089,'tniesel2d@naver.com','oBMEba7'),(87,'Sidonnie','Poore',9350,'Victoria','Portorož',554343,'spoore2e@storify.com','kZOl7k9p1iA'),(88,'Xever','Rijkeseis',452,'Becker','San Andres',661761,'xrijkeseis2f@edublogs.org','9hJ8pkxIL6C'),(89,'Northrop','Milbank',6052,'Namekagon','Megati Kelod',290346,'nmilbank2g@parallels.com','G0GqWm'),(90,'Irena','Katzmann',4,'Jackson','Pining',200541,'ikatzmann2h@vimeo.com','trFZxj664LG'),(91,'Augie','Follos',64009,'Warrior','Chuqui Chuqui',667760,'afollos2i@skype.com','YFQ7Fn'),(92,'Patricio','Penni',219,'Vahlen','Puerto Barrios',108936,'ppenni2j@purevolume.com','5e7gmRn65'),(93,'Kerry','Wellstood',97,'Quincy','Bongandanga',505818,'kwellstood2k@wisc.edu','uQI3YGM3k2'),(94,'Bartlett','McKerley',3,'Tony','Sankoutang',906838,'bmckerley2l@imgur.com','soJghorq8v'),(95,'Janot','Iacopetti',2928,'Lunder','Nayak',827349,'jiacopetti2m@opera.com','CGfdkHTwvhnT'),(96,'Hayward','Haeslier',6941,'Maple Wood','San Juan',328237,'hhaeslier2n@reverbnation.com','ZGpBTJ'),(97,'Iolande','Windibank',85564,'Little Fleur','Farriar',533423,'iwindibank2o@imageshack.us','fPOKvZ1Xc'),(98,'Cassondra','Raycroft',6,'Mallard','Novo',681832,'craycroft2p@usatoday.com','Fy1GMxdci'),(99,'Minnaminnie','Pietrzak',512,'David','Stony Hill',413768,'mpietrzak2q@sohu.com','p9BXgU1qGcP8'),(100,'Maegan','Ranfield',50839,'4th','Pragen Selatan',482296,'mranfield2r@discovery.com','Cw8rOq0LnB');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_phone`
--

DROP TABLE IF EXISTS `Customer_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_phone` (
  `Customer_ID` decimal(30,0) NOT NULL,
  `Phone_number` decimal(30,0) NOT NULL,
  PRIMARY KEY (`Phone_number`,`Customer_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `Customer_phone_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_phone`
--

LOCK TABLES `Customer_phone` WRITE;
/*!40000 ALTER TABLE `Customer_phone` DISABLE KEYS */;
INSERT INTO `Customer_phone` VALUES (1,9489757734),(1,9550425356),(1,9619714416),(2,9417769663),(2,9972236365),(3,9444621922),(3,9488743923),(3,9670458482),(4,9292518772),(5,9320119370),(6,9006818026),(6,9076830678),(6,9109026157),(6,9869919957),(7,9071442335),(7,9145277814),(7,9510621755),(7,9689516560),(8,9249277446),(8,9679638618),(8,9784454629),(9,9945392803),(9,9949709096),(10,9410870911),(10,9695915934),(11,9210201388),(12,9139026792),(12,9404339963),(12,9451665650),(12,9796288480),(12,9854109812),(13,9024213131),(13,9314357967),(13,9670127283),(13,9727848097),(13,9915884329),(14,9679807319),(14,9897135625),(15,9024782729),(15,9327095696),(15,9470873104),(15,9703747093),(15,9723805807),(16,9355835221),(16,9356225410),(16,9450600456),(16,9662761826),(17,9245331179),(17,9666872597),(17,9904111560),(19,9305503917),(19,9307225260),(19,9487179855),(20,9064804612),(20,9788557350),(21,9262485219),(21,9346752104),(21,9516611591),(21,9564517774),(21,9573261131),(22,9865776005),(23,9024667776),(23,9307589873),(23,9498135979),(23,9654712286),(23,9678508959),(24,9220396862),(25,9323154210),(25,9407489656),(25,9687959234),(26,9170254959),(26,9450359725),(26,9970516559),(27,9098468054),(27,9221702174),(27,9296476102),(27,9617453180),(27,9846749363),(28,9022888134),(28,9082017728),(28,9198537334),(28,9218952226),(28,9276580972),(28,9547526677),(30,9217543423),(31,9162802619),(31,9315260673),(31,9487974257),(31,9749858108),(32,9766780484),(32,9838649701),(32,9882712015),(32,9915087697),(33,9489939265),(33,9801460751),(33,9875898391),(34,9079235941),(34,9702871971),(35,9682683836),(35,9821910221),(35,9849433017),(35,9984623467),(36,9142117102),(36,9539265881),(36,9623840564),(36,9927389698),(37,9213164294),(37,9360959443),(37,9768801939),(38,9296276986),(38,9569801782),(38,9848669142),(38,9889018694),(39,9104953051),(39,9582852437),(39,9678710349),(39,9842965524),(40,9026377792),(40,9093865469),(40,9165544844),(40,9203760996),(40,9597352419),(40,9600491061),(40,9615569084),(40,9663032040),(41,9007706856),(41,9107466069),(41,9385309508),(41,9524940566),(41,9533267568),(41,9697238640),(42,9287694803),(42,9331234796),(42,9853061429),(42,9962367121),(44,9472629880),(44,9622863163),(44,9928433547),(45,9118854161),(45,9334347460),(45,9895780347),(47,9837784603),(47,9941133530),(48,9303368413),(48,9330073711),(48,9342907844),(48,9889464700),(49,9336604877),(49,9684326818),(49,9982062775),(50,9090007356),(50,9471116791),(51,9075049573),(51,9228020139),(51,9243161453),(51,9719933736),(51,9979028429),(52,9253577830),(52,9672315052),(52,9806459578),(52,9844929830),(53,9078495525),(53,9851823111),(54,9288051857),(55,9327411037),(55,9416767853),(55,9821000222),(55,9915231796),(56,9024392133),(56,9344034331),(57,9332000294),(57,9822898633),(57,9926180455),(58,9758047792),(58,9851574487),(59,9537583632),(59,9851343073),(60,9771314912),(61,9536036336),(61,9892271417),(62,9250824239),(62,9650455563),(63,9053481217),(63,9230338271),(63,9240372727),(63,9512727681),(64,9376699732),(64,9450021887),(64,9701069799),(65,9047889396),(66,9069431297),(66,9195798948),(66,9946177264),(67,9304067905),(67,9573706143),(67,9644221911),(67,9733380462),(68,9709940698),(68,9713432667),(68,9750440985),(69,9532174047),(70,9003452340),(70,9196930413),(70,9591090053),(70,9836846409),(71,9444363657),(72,9056253843),(72,9148912210),(72,9830383788),(72,9837267665),(73,9339011433),(73,9461139738),(74,9314291897),(74,9408738344),(74,9477497814),(74,9522731175),(74,9759449380),(74,9810869644),(75,9105319097),(75,9435007766),(75,9619025054),(75,9825615272),(76,9316891145),(76,9414812993),(76,9605074588),(76,9875518499),(77,9016830662),(77,9266618509),(77,9506416697),(77,9855773020),(77,9877374618),(78,9146063540),(78,9518949781),(78,9588691369),(78,9605400141),(78,9693322113),(78,9696242603),(80,9277246605),(81,9433659239),(81,9447898833),(81,9458768692),(81,9753297068),(82,9035920128),(82,9132902139),(82,9147782842),(82,9336847380),(82,9709836017),(83,9194114790),(83,9440377703),(84,9061007199),(84,9130358801),(84,9131130150),(84,9313747630),(84,9464167618),(84,9808330314),(85,9095416292),(85,9234755167),(85,9255891944),(85,9521846765),(85,9600622962),(85,9891673333),(85,9944949938),(87,9186604346),(87,9373272408),(88,9709915994),(89,9068816328),(89,9978747834),(90,9761997381),(91,9249260511),(91,9893190043),(91,9967901744),(91,9982315429),(92,9486359984),(92,9909090692),(92,9998419600),(93,9254517955),(93,9994797279),(94,9215184699),(94,9557672353),(94,9577643813),(94,9832086007),(95,9252991368),(95,9396067136),(95,9548933819),(95,9670348767),(96,9138683645),(96,9149364006),(97,9013529381),(97,9328591279),(97,9598784710),(98,9185417452),(98,9548896617),(98,9569797742),(99,9214842321),(99,9574145993),(99,9632127107),(100,9030667340),(100,9564784625),(100,9587094766),(100,9686115601);
/*!40000 ALTER TABLE `Customer_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `Order_ID` decimal(30,0) NOT NULL,
  `Employee_ID` decimal(30,0) DEFAULT NULL,
  `Customer_ID` decimal(30,0) DEFAULT NULL,
  `Warehouse_ID` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  CONSTRAINT `Delivery_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`order_ID`),
  CONSTRAINT `Delivery_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  CONSTRAINT `Delivery_ibfk_3` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`customer_ID`),
  CONSTRAINT `Delivery_ibfk_4` FOREIGN KEY (`Warehouse_ID`) REFERENCES `Warehouse` (`Warehouse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
INSERT INTO `Delivery` VALUES (1,97,40,1),(2,97,68,3),(3,60,44,4),(4,56,38,1),(5,85,97,1),(6,60,31,2),(7,54,29,1),(8,94,39,3),(9,68,35,3),(10,65,24,3),(11,93,55,3),(12,63,50,1),(13,82,62,4),(14,80,2,2),(15,81,39,2),(16,82,81,5),(17,96,18,4),(18,60,91,4),(19,52,43,4),(20,87,95,5),(21,78,8,1),(22,85,91,4),(23,72,25,4),(24,84,82,2),(25,50,70,4),(26,76,34,1),(27,87,90,2),(28,69,95,5),(29,92,46,4),(30,61,55,5),(31,96,88,5),(32,65,58,1),(33,77,35,3),(34,77,32,1),(35,65,19,3),(36,52,34,4),(37,65,52,3),(38,57,18,2),(39,54,81,5),(40,76,29,2),(41,90,21,1),(42,67,11,3),(43,76,27,4),(44,98,43,5),(45,83,98,1),(46,90,92,3),(47,72,75,4),(48,90,40,2),(49,96,57,2),(50,74,5,5);
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery_Partner`
--

DROP TABLE IF EXISTS `Delivery_Partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery_Partner` (
  `Employee_ID` decimal(30,0) NOT NULL,
  `Vehicle_ID` varchar(30) DEFAULT NULL,
  `Vehicle_Type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `Delivery_Partner_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery_Partner`
--

LOCK TABLES `Delivery_Partner` WRITE;
/*!40000 ALTER TABLE `Delivery_Partner` DISABLE KEYS */;
INSERT INTO `Delivery_Partner` VALUES (51,'WA63LS3871','Bike'),(52,'MU16TE7580','Bike'),(53,'MJ64PW9232','Van'),(54,'MU47TZ6174','Bike'),(55,'BN51IB8337','Tempo'),(56,'JN68VM3359','Bike'),(57,'QV41IW8451','Tempo'),(58,'VQ54MO2556','Bike'),(59,'GG27HT7337','Van'),(60,'QM43AD2048','Tempo'),(61,'SZ50TI2162','Tempo'),(62,'RH48BV6512','Tempo'),(63,'CB42IM8233','Tempo'),(64,'ZK39KB6341','Bike'),(65,'VT51GT8301','Tempo'),(66,'WD34UM1403','Bike'),(67,'QX53BX5639','Tempo'),(68,'WK48MB2898','Tempo'),(69,'IV29WY5103','Bike'),(70,'OT75OR2418','Van'),(71,'GX98IJ7089','Tempo'),(72,'GD14SJ5149','Tempo'),(73,'XM28ZL9240','Van'),(74,'MG10MX4360','Tempo'),(75,'WX24FB4547','Van'),(76,'ES38NL9463','Bike'),(77,'AK31YP2140 ','Van'),(78,'VP17ZS3028 ','Van'),(79,'UI19VT4166 ','Tempo'),(80,'YT84YL7561 ','Tempo'),(81,'HT41OJ5604','Bike'),(82,'OP64GA5711','Bike'),(83,'AV62BO7211','Tempo'),(84,'ZM98CP3319','Bike'),(85,'QX42LV9819','Tempo'),(86,'RR39NW5372','Van'),(87,'IQ13VC4604','Tempo'),(88,'BJ74TX3469','Van'),(89,'GT80JW4653','Van'),(90,'BW86ON4594','Van'),(91,'IW22RP1633','Tempo'),(92,'VQ82XX3792','Van'),(93,'AK69KL9549','Van'),(94,'VD55VM9277','Van'),(95,'HQ40BI3920','Tempo'),(96,'BE83IM3967','Tempo'),(97,'ZQ61NH6892','Tempo'),(98,'HM51AB2565','Van'),(99,'MG27HB6980','Bike'),(100,'ST66ST7930','Van');
/*!40000 ALTER TABLE `Delivery_Partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Employee_ID` decimal(30,0) NOT NULL,
  `age` int NOT NULL,
  `First_Name` varchar(30) NOT NULL,
  `Last_Name` varchar(30) DEFAULT NULL,
  `Salary` decimal(30,0) NOT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Department` varchar(30) DEFAULT NULL,
  `Performance` varchar(30) DEFAULT NULL,
  `Position` varchar(30) NOT NULL,
  `Date_of_joining` char(30) NOT NULL,
  `Date_of_birth` char(30) NOT NULL,
  `Email_address` varchar(50) NOT NULL,
  `House_No` decimal(30,0) DEFAULT NULL,
  `Locality` varchar(30) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `Pincode` decimal(6,0) DEFAULT NULL,
  `Phone_number` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Email_address` (`Email_address`),
  CONSTRAINT `Employee_chk_1` CHECK ((`age` between 18 and 300)),
  CONSTRAINT `Employee_chk_2` CHECK ((`Pincode` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,66,'Leora','Hengoed',0,'Polygender','Support','5.4','4','7/1/2021','1/25/2022','lhengoed0@theglobeandmail.com',98,'Nova','Mayantoc',59,1523251683),(2,92,'Noach','Menault',0,'Female','Services','1.1','3','6/3/2021','12/15/2021','nmenault1@ucsd.edu',7236,'Hazelcrest','Chambellan',7,5676013065),(3,94,'Renelle','Semorad',0,'Female','Engineering','5.6','2','6/25/2021','6/18/2021','rsemorad2@guardian.co.uk',878,'Summerview','Tamuning-Tumon-Harmon Village',43,6346746623),(4,24,'first','second',0,'Male','Human Resources','8.0','2','11/5/2021','4/2/2021','zcantwell3@discuz.net',2,'Ludington','Mabua',44510,7934004516),(5,75,'Gunner','Witchell',0,'Male','Human Resources','8.4','4','6/15/2021','2/14/2022','gwitchell4@bloglines.com',3,'Florence','Boxholm',32,9551160774),(6,84,'Jedidiah','Samways',0,'Female','Research and Development','5.6','5','10/9/2021','12/11/2021','jsamways5@edublogs.org',176,'Eastwood','Shangganshan',155,7354624494),(7,88,'Delinda','Fallow',0,'Male','Engineering','1.5','4','10/11/2021','7/1/2021','dfallow6@tamu.edu',37,'Dryden','Panji',16311,1194772704),(8,81,'Matilda','Dannohl',0,'Male','Engineering','2.6','2','7/27/2021','6/1/2021','mdannohl7@google.ru',33484,'Hollow Ridge','Selaawi',718,6674210495),(9,74,'Marys','Hune',0,'Male','Research and Development','4.3','2','10/25/2021','12/28/2021','mhune8@tinypic.com',56670,'Monument','Gul’cha',2439,3971658563),(10,25,'Malinde','Pendleberry',0,'Female','Sales','4.0','4','3/10/2021','8/8/2021','mpendleberry9@ovh.net',76,'Barby','Tuka',31,1037639269),(11,76,'Hernando','Villar',0,'Bigender','Accounting','1.0','2','8/26/2021','11/1/2021','hvillara@huffingtonpost.com',11,'Delladonna','Naranjo',14,5189683343),(12,40,'Collie','Murtagh',0,'Female','Accounting','8.3','2','9/9/2021','1/27/2022','cmurtaghb@whitehouse.gov',53,'Gina','Novokubansk',5,1904148228),(13,19,'Larisa','Blazejewski',0,'Male','Services','4.4','3','12/17/2021','10/10/2021','lblazejewskic@microsoft.com',3861,'Monterey','Noupoort',61,8617507189),(14,99,'Jade','Orht',0,'Female','Legal','6.3','2','5/2/2021','8/29/2021','jorhtd@desdev.cn',12290,'Eggendart','Gubeikou',4,9436719991),(15,57,'Laurianne','Gregore',0,'Female','Legal','6.6','4','8/11/2021','12/17/2021','lgregoree@ihg.com',8,'Utah','Washington',4157,2029518177),(16,50,'Laureen','Brymner',0,'Male','Business Development','3.3','2','3/6/2021','1/9/2022','lbrymnerf@creativecommons.org',28406,'Aberg','Shumyachi',46,1531798105),(17,46,'Norean','Boise',0,'Female','Marketing','7.8','1','10/21/2021','8/26/2021','nboiseg@bbb.org',9302,'Warbler','Hanover',10,7438472436),(18,93,'Gusty','Roback',0,'Genderqueer','Marketing','1.1','4','7/24/2021','2/28/2021','grobackh@amazon.de',10,'Knutson','Novi Karlovci',7521,3612829629),(19,55,'Juliet','Verdy',0,'Male','Sales','9.4','2','11/2/2021','8/16/2021','jverdyi@soup.io',647,'Delaware','Aygeshat',1264,8113865094),(20,52,'Camey','Barden',0,'Female','Marketing','8.3','3','1/18/2022','8/13/2021','cbardenj@infoseek.co.jp',8,'Ridgeview','Mamponteng',7,4646782770),(21,27,'Reginauld','Feares',0,'Female','Research and Development','6.0','1','4/12/2021','11/16/2021','rfearesk@people.com.cn',72,'7th','Jianping',61,5648595084),(22,75,'Francesca','Glanders',0,'Female','Training','6.8','3','1/25/2022','10/25/2021','fglandersl@hp.com',1786,'Spaight','Sumilao',37288,5872049061),(23,65,'Armando','Whillock',0,'Female','Support','1.7','1','5/19/2021','4/4/2021','awhillockm@ucoz.com',8547,'Thompson','Bibrka',40,5603773343),(24,99,'Raddie','Ledington',0,'Female','Training','4.9','5','10/29/2021','11/10/2021','rledingtonn@shutterfly.com',2045,'Maryland','Isheyevka',3,1993601504),(25,85,'Kristy','MacGraith',0,'Female','Training','8.0','3','11/21/2021','4/26/2021','kmacgraitho@bravesites.com',219,'8th','Berëzovka',34863,8363085007),(26,93,'Louisa','Sommerled',0,'Male','Business Development','1.7','3','11/21/2021','2/1/2022','lsommerledp@webnode.com',841,'Meadow Ridge','Levallois-Perret',9883,6074482127),(27,95,'Wilek','Hacker',0,'Male','Research and Development','4.8','5','5/20/2021','9/4/2021','whackerq@wordpress.com',25,'Heffernan','Piggs Peak',6689,5489177257),(28,50,'Kara-lynn','Pumphrey',0,'Female','Services','9.1','2','11/28/2021','1/26/2022','kpumphreyr@goo.ne.jp',3,'Kedzie','Gaopu',5,3875401508),(29,83,'Hadria','Bjorkan',0,'Male','Services','5.5','2','7/27/2021','1/8/2022','hbjorkans@usda.gov',218,'Vahlen','Gravataí',95247,7452282102),(30,69,'Cordie','Snarr',0,'Female','Business Development','1.1','4','11/28/2021','10/27/2021','csnarrt@phpbb.com',807,'Meadow Vale','Roma',2,2615980377),(31,25,'Mahala','O\'Mailey',0,'Male','Legal','5.3','3','8/29/2021','11/7/2021','momaileyu@ibm.com',5592,'Calypso','Tsengel',853,6652515955),(32,30,'Aeriel','Tutchell',0,'Female','Product Management','6.4','4','3/21/2021','3/30/2021','atutchellv@npr.org',77,'Old Gate','Tucson',4840,5201102191),(33,47,'Joshua','Burnham',0,'Genderfluid','Business Development','6.1','4','8/22/2021','12/4/2021','jburnhamw@xrea.com',50153,'Independence','Caminauit',1930,7127359769),(34,92,'Benoite','Treagust',0,'Female','Legal','7.1','4','10/1/2021','7/29/2021','btreagustx@people.com.cn',48786,'Waxwing','Limón',6,3138700945),(35,81,'Joly','Cordeau',0,'Female','Marketing','6.7','1','12/13/2021','9/19/2021','jcordeauy@usnews.com',39,'Ramsey','Baiyin',28,4092748289),(36,66,'Anica','Pane',0,'Male','Marketing','9.9','2','12/28/2021','11/20/2021','apanez@posterous.com',702,'La Follette','Barobo',7,9481290792),(37,70,'Tiebold','Sneesbie',0,'Male','Engineering','5.3','3','6/19/2021','6/30/2021','tsneesbie10@wisc.edu',8,'Doe Crossing','Nikolayevsk',850,7454288594),(38,18,'Bridgette','De Bischop',0,'Non-binary','Marketing','6.1','2','1/21/2022','10/22/2021','bdebischop11@theguardian.com',45,'Corscot','Jingzhou',317,4231182839),(39,24,'Kim','Marke',0,'Female','Marketing','4.4','5','5/31/2021','12/28/2021','kmarke12@dedecms.com',43,'Graedel','Conner',84,8951580854),(40,70,'Torey','O\'Clery',0,'Male','Accounting','1.8','1','8/1/2021','12/28/2021','toclery13@ask.com',38,'Stephen','Kharkhorin',11450,1373293919),(41,58,'Bernie','MacAne',0,'Female','Accounting','5.5','4','10/2/2021','10/12/2021','bmacane14@paypal.com',4608,'Jana','Indaiatuba',52703,3944417076),(42,80,'Mufinella','Colthard',0,'Female','Research and Development','6.7','1','3/30/2021','11/4/2021','mcolthard15@ucoz.ru',0,'Tomscot','Polanica-Zdrój',46417,9641970994),(43,20,'Lacey','Dimock',0,'Male','Legal','3.1','4','2/2/2022','9/14/2021','ldimock16@nature.com',77184,'Leroy','Ivry-sur-Seine',4,9335811774),(44,85,'Leshia','O\'Cahill',0,'Male','Services','6.1','3','11/7/2021','9/12/2021','locahill17@census.gov',903,'Pearson','Xinzhai',744,8081887214),(45,97,'Lily','Letten',0,'Non-binary','Product Management','9.4','4','10/26/2021','9/18/2021','lletten18@technorati.com',6279,'Graedel','Niagara Falls',984,6526434001),(46,70,'Dennison','Canny',0,'Female','Human Resources','8.5','5','3/21/2021','8/22/2021','dcanny19@nytimes.com',6,'Almo','Naval',2,8845515594),(47,43,'Gusty','Kalisch',0,'Female','Legal','4.0','1','12/4/2021','1/21/2022','gkalisch1a@ca.gov',5286,'Green Ridge','Manacsac',36,2949562486),(48,48,'Flossi','Fayter',0,'Male','Human Resources','8.0','4','11/20/2021','3/8/2021','ffayter1b@baidu.com',77720,'Tennyson','Luopioinen',18,2454427450),(49,85,'Almeria','Amy',0,'Male','Sales','5.8','1','10/16/2021','4/5/2021','aamy1c@istockphoto.com',14,'Northland','Fuyang',708,2147589030),(50,87,'Robbie','Lowensohn',0,'Female','Legal','1.3','5','4/8/2021','4/7/2021','rlowensohn1d@stanford.edu',5042,'Prairie Rose','Lashma',464,9345773365),(51,97,'Reamonn','Pikett',0,'Female','Legal','9.5','5','3/3/2021','2/3/2022','rpikett1e@google.ca',92602,'Pleasure','Ust’-Koksa',173,2756209793),(52,90,'Fleur','Parzizek',0,'Male','Legal','9.0','3','11/5/2021','1/19/2022','fparzizek1f@nyu.edu',6,'Ohio','Löddeköpinge',0,4325633758),(53,39,'Kyle','Mulder',0,'Male','Marketing','8.9','3','3/6/2021','4/3/2021','kmulder1g@ucoz.ru',905,'Packers','Khashuri',88885,1463251312),(54,37,'Marc','Oriel',0,'Female','Product Management','7.5','3','10/27/2021','8/26/2021','moriel1h@goodreads.com',17492,'Division','Carcassonne',1389,4864865969),(55,96,'Carly','Penquet',0,'Male','Sales','3.8','3','3/28/2021','1/21/2022','cpenquet1i@seesaa.net',17,'Declaration','Durham',3,9197573644),(56,29,'Manolo','Walkingshaw',0,'Male','Research and Development','5.3','5','3/29/2021','10/20/2021','mwalkingshaw1j@dell.com',34,'Goodland','La Roche-sur-Yon',73361,2677346093),(57,81,'Honor','Farnin',0,'Male','Training','3.8','3','4/15/2021','3/13/2021','hfarnin1k@yolasite.com',53907,'Mcguire','Bakau',7451,2746231762),(58,41,'Vicky','Franzewitch',0,'Female','Services','5.1','2','11/26/2021','7/14/2021','vfranzewitch1l@hao123.com',5,'Buell','Nová Role',0,9206448170),(59,87,'Jory','Symms',0,'Female','Sales','8.5','3','12/16/2021','3/13/2021','jsymms1m@cafepress.com',1855,'Waubesa','Rennes',47,1904444406),(60,98,'Leslie','Skala',0,'Female','Human Resources','1.8','2','9/27/2021','4/7/2021','lskala1n@twitpic.com',5110,'Warner','Qinhe',7,2741121627),(61,78,'Marji','Mechic',0,'Female','Product Management','6.6','2','1/25/2022','4/19/2021','mmechic1o@taobao.com',33302,'Cherokee','Šventoji',3033,7838750160),(62,98,'Bridie','Benton',0,'Male','Sales','6.7','5','4/18/2021','6/29/2021','bbenton1p@oracle.com',8,'Lake View','Tayāsīr',80,2501171191),(63,50,'Constantina','Kingscote',0,'Female','Human Resources','3.1','2','1/6/2022','7/13/2021','ckingscote1q@cdbaby.com',58,'Blaine','Al Khāniq',5760,7339683012),(64,24,'Bryant','Tinson',0,'Female','Research and Development','6.2','1','5/8/2021','1/17/2022','btinson1r@dell.com',4,'Rowland','Na Klang',2,2347672403),(65,75,'Bevvy','Suatt',0,'Female','Marketing','3.7','2','11/27/2021','10/26/2021','bsuatt1s@macromedia.com',27,'Ridgeway','Lenningen',1149,4554595487),(66,86,'Ellsworth','Barbosa',0,'Female','Marketing','9.2','5','5/8/2021','1/31/2022','ebarbosa1t@posterous.com',49,'Darwin','Labuan',7,1254859767),(67,53,'Nola','Crabb',0,'Female','Accounting','7.7','5','10/22/2021','11/13/2021','ncrabb1u@answers.com',1997,'Harbort','Peteranec',84879,9704376411),(68,54,'Maudie','Hannaford',0,'Female','Human Resources','9.0','3','2/1/2022','7/2/2021','mhannaford1v@desdev.cn',21785,'Bunker Hill','Aktogay',5,2256255732),(69,82,'Rorie','Arkill',0,'Bigender','Legal','1.3','1','9/21/2021','12/8/2021','rarkill1w@soundcloud.com',4,'Michigan','Ozëry',2545,8367322695),(70,61,'Therine','Alexsandrovich',0,'Female','Human Resources','9.6','4','10/22/2021','3/16/2021','talexsandrovich1x@cbsnews.com',4,'Namekagon','Kylmäkoski',97281,9742531111),(71,40,'Carolyne','Steljes',0,'Female','Training','9.1','2','12/20/2021','3/4/2021','csteljes1y@ftc.gov',71,'Roth','Yantan',3,6804071043),(72,84,'Gusty','Inkpin',0,'Male','Support','8.1','2','9/27/2021','4/27/2021','ginkpin1z@china.com.cn',534,'Hoard','Francisco Villa',41377,6717610479),(73,53,'Reba','Poetz',0,'Female','Training','5.4','3','7/11/2021','11/16/2021','rpoetz20@cbsnews.com',94840,'Forster','Hyattsville',676,3015639330),(74,79,'Torrey','Moberley',0,'Male','Research and Development','4.3','2','10/11/2021','11/16/2021','tmoberley21@sitemeter.com',38903,'Lillian','Ratchasan',8,8111222314),(75,66,'Chere','Collinette',0,'Male','Research and Development','7.6','3','1/2/2022','12/10/2021','ccollinette22@bravesites.com',4,'6th','Henglu',5991,2642858000),(76,76,'Remy','Bryce',0,'Male','Business Development','9.7','5','12/27/2021','1/13/2022','rbryce23@disqus.com',89499,'Fair Oaks','Matiguás',63004,7916677535),(77,92,'Lillian','Farncomb',0,'Female','Human Resources','1.3','3','3/10/2021','6/21/2021','lfarncomb24@un.org',1771,'Twin Pines','Bull Savanna',3725,7904687292),(78,66,'Boigie','Shawel',0,'Female','Marketing','7.4','5','2/9/2022','10/5/2021','bshawel25@hexun.com',1626,'Rutledge','Krajan Dua Sumbersari',1,2674579489),(79,67,'Merwin','Horick',0,'Female','Research and Development','2.3','5','5/12/2021','12/4/2021','mhorick26@loc.gov',90983,'Victoria','Liupai',32872,1545202453),(80,55,'Alejandrina','Sharrem',0,'Female','Product Management','3.5','1','10/12/2021','3/18/2021','asharrem27@hhs.gov',7,'Canary','Normandin',936,5747189716),(81,94,'Gannie','Foxwell',0,'Female','Training','2.1','5','4/7/2021','2/12/2022','gfoxwell28@hp.com',79,'Maryland','Lazarevac',19,9658875905),(82,28,'Eric','Dudhill',0,'Female','Human Resources','8.0','5','11/11/2021','11/21/2021','edudhill29@biglobe.ne.jp',4340,'Spohn','Tayirove',6381,5498924243),(83,71,'Oralee','McGilleghole',0,'Female','Sales','5.9','5','12/28/2021','2/25/2022','omcgilleghole2a@free.fr',7381,'Maryland','Adela',661,9553147926),(84,43,'Orbadiah','Baldock',0,'Genderqueer','Legal','2.2','4','6/25/2021','1/28/2022','obaldock2b@yale.edu',132,'Debs','Chisong',257,4051834591),(85,26,'Bliss','MacMeeking',0,'Agender','Training','9.9','1','11/20/2021','11/13/2021','bmacmeeking2c@nydailynews.com',8,'Dorton','Stockholm',22,7337561250),(86,81,'Laetitia','Sandison',0,'Male','Legal','8.5','5','5/28/2021','7/18/2021','lsandison2d@google.com.hk',848,'Forest Run','Porsgrunn',63803,2327228418),(87,22,'Ferris','Conor',0,'Male','Marketing','2.5','4','12/27/2021','8/25/2021','fconor2e@dedecms.com',4,'Crowley','Gaoping',83,8735083667),(88,51,'Viv','Matieu',0,'Male','Marketing','4.5','2','12/20/2021','11/12/2021','vmatieu2f@eventbrite.com',731,'Russell','Naukšēni',79232,8625173212),(89,93,'Gerry','Bawle',0,'Female','Business Development','7.7','4','3/26/2021','3/11/2021','gbawle2g@gnu.org',6586,'Express','Kota Kinabalu',35,7786150140),(90,36,'Guglielmo','Gilbard',0,'Male','Support','8.2','1','7/1/2021','9/13/2021','ggilbard2h@edublogs.org',9,'Lien','Awka',6801,3166017638),(91,96,'Jeanna','Chesnut',0,'Male','Human Resources','3.7','1','11/13/2021','2/10/2022','jchesnut2i@nymag.com',802,'Forster','Jiaotan',45,2672826587),(92,49,'Stephanus','Wringe',0,'Female','Services','3.8','5','5/8/2021','10/26/2021','swringe2j@drupal.org',23,'Rigney','Qingkou',9670,2224875712),(93,27,'Marty','Rummer',0,'Male','Product Management','7.4','3','4/28/2021','1/20/2022','mrummer2k@1und1.de',24,'Lerdahl','Guadalupe Victoria',0,7126483626),(94,41,'Eldin','Antonomoli',0,'Male','Research and Development','6.0','4','10/27/2021','3/1/2021','eantonomoli2l@narod.ru',8397,'Summer Ridge','Mokotów',5,4463812880),(95,86,'Rosabella','Frazer',0,'Female','Services','5.4','5','11/23/2021','4/9/2021','rfrazer2m@booking.com',6469,'Eagle Crest','Didi Lilo',64,9603518228),(96,25,'third','fourth',0,'Female','Training','1.0','2','1/5/2022','5/7/2021','rferriby2n@phoca.cz',1,'Fairfield','Rukem',984,4675432204),(97,75,'Perren','MacDougall',0,'Polygender','Research and Development','4.0','3','5/18/2021','12/2/2021','pmacdougall2o@usgs.gov',94370,'Maryland','Velké Bílovice',68,3713970242),(98,23,'Sky','Grimwood',0,'Female','Support','4.3','2','12/29/2021','1/7/2022','sgrimwood2p@businesswire.com',646,'Sherman','Calubcub Dos',3,8494544427),(99,29,'Ade','Mulqueen',0,'Female','Engineering','3.2','3','10/29/2021','7/9/2021','amulqueen2q@mapquest.com',986,'Redwing','Svirsk',64,4114852416),(100,74,'Leisha','Skelhorn',0,'Female','Support','1.3','1','5/20/2021','11/16/2021','lskelhorn2r@newsvine.com',43,'Dakota','Marxog',2,6667684834);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_ID` decimal(30,0) NOT NULL,
  `Total_Price` decimal(20,2) DEFAULT NULL,
  `Taxes` decimal(30,2) DEFAULT NULL,
  `Total_Discount_Percentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`order_ID`),
  CONSTRAINT `Orders_chk_1` CHECK ((`Total_price` > 0)),
  CONSTRAINT `Orders_chk_2` CHECK ((`Taxes` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,62089.49,27.65,9.13),(2,23387.82,8.85,24.41),(3,63751.88,24.84,6.42),(4,99487.90,16.38,18.82),(5,9520.38,14.08,7.94),(6,21205.05,9.00,10.30),(7,23811.41,20.66,13.95),(8,90866.35,10.86,18.89),(9,44023.32,14.33,7.83),(10,40075.63,11.44,21.78),(11,87547.27,29.90,17.12),(12,72935.72,21.99,27.74),(13,33007.60,29.53,7.67),(14,2704.33,15.46,28.27),(15,73452.45,10.66,8.11),(16,31590.77,7.51,10.46),(17,72144.71,15.05,25.22),(18,35129.39,8.41,16.09),(19,23374.42,11.39,14.89),(20,28473.57,16.84,5.40),(21,68324.26,7.80,29.89),(22,8254.45,29.05,19.00),(23,85859.17,9.47,28.57),(24,14168.52,24.90,23.71),(25,68352.13,19.02,3.36),(26,6533.48,22.33,4.52),(27,5320.18,14.48,0.64),(28,69121.93,14.86,6.63),(29,15884.33,15.12,11.19),(30,61956.41,22.28,17.52),(31,38021.82,6.63,14.94),(32,64359.20,18.02,5.96),(33,37225.47,15.84,26.16),(34,36613.01,6.08,29.51),(35,62902.54,17.73,15.10),(36,16129.00,11.35,26.46),(37,80768.74,16.48,21.18),(38,30886.05,19.32,17.29),(39,48429.05,18.79,15.30),(40,78696.04,13.52,24.69),(41,30848.25,28.00,20.74),(42,19637.06,6.31,17.48),(43,35763.10,18.76,17.96),(44,5398.04,21.99,20.82),(45,79465.05,9.71,23.07),(46,94433.35,29.47,15.36),(47,77875.17,24.13,17.30),(48,6996.77,11.28,14.71),(49,9614.46,6.84,10.73),(50,74700.23,15.59,7.19);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `Product_ID` decimal(30,0) NOT NULL,
  `Price` decimal(15,2) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Discount_Percentage` decimal(5,2) DEFAULT NULL,
  `GST_percentage` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Product_ID`),
  CONSTRAINT `Product_chk_1` CHECK ((`Price` > 0)),
  CONSTRAINT `Product_chk_2` CHECK ((`Discount_Percentage` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,16552.00,'Eggplant Italian',7.41,15.17),(2,942.00,'Fruit Salad Deluxe',21.48,23.16),(3,9447.00,'Bread - White Mini Epi',2.31,14.24),(4,61251.00,'Mints - Striped Red',8.83,20.57),(5,78679.00,'Wine - Rioja Campo Viejo',2.34,16.99),(6,18914.00,'Myers Planters Punch',1.76,22.07),(7,58727.00,'Bread - Flat Bread',12.60,18.94),(8,71735.00,'Apricots Fresh',18.00,29.74),(9,74247.00,'Bag Stand',12.74,10.49),(10,72034.00,'Snapple Raspberry Tea',3.29,27.90),(11,15793.00,'Baking Soda',8.54,29.24),(12,69549.00,'Fruit Salad Deluxe',8.92,10.28),(13,91085.00,'Cassis',11.44,16.03),(14,60815.00,'Gatorade - Lemon Lime',6.25,21.63),(15,32790.00,'Soap - Hand Soap',1.63,27.95),(16,74123.00,'Bay Leaf',22.02,15.87),(17,69034.00,'Napkin - Dinner, White',13.55,15.99),(18,33445.00,'Milk - Condensed',16.50,12.90),(19,96694.00,'Soup - Campbells, Minestrone',2.66,19.49),(20,15979.00,'Cheese - St. Andre',29.61,24.32),(21,81962.00,'Chocolate - Milk, Callets',13.51,15.09),(22,81615.00,'Spice - Chili Powder Mexican',27.69,23.32),(23,68097.00,'Wine - Magnotta - Belpaese',24.69,28.81),(24,64854.00,'Banana - Green',22.35,23.40),(25,61979.00,'Mop Head - Cotton, 24 Oz',13.73,11.60),(26,8306.00,'Stock - Fish',3.29,18.68),(27,8534.00,'Pork - Belly Fresh',22.06,20.22),(28,89384.00,'Trout - Hot Smkd, Dbl Fillet',5.18,25.32),(29,94381.00,'Lettuce - Iceberg',21.79,11.70),(30,66285.00,'Wine - Beringer Founders Estate',5.53,17.57),(31,96495.00,'Potatoes - Idaho 100 Count',19.98,10.58),(32,47979.00,'Eggplant - Regular',12.71,24.69),(33,16131.00,'Filter - Coffee',4.31,22.93),(34,79284.00,'Soup Campbells Turkey Veg.',29.71,11.88),(35,33515.00,'Pail For Lid 1537',4.72,13.13),(36,95460.00,'Lamb - Rack',15.94,13.35),(37,42654.00,'Table Cloth 62x114 White',0.32,29.46),(38,68786.00,'Pepper Squash',24.27,14.68),(39,65685.00,'Shrimp - Black Tiger 13/15',16.40,25.16),(40,43017.00,'Pail For Lid 1537',5.95,24.51),(41,22447.00,'Quail - Whole, Bone - In',3.60,15.37),(42,47347.00,'Cheese - Parmesan Grated',15.34,22.79),(43,12829.00,'Bowl 12 Oz - Showcase 92012',28.15,29.95),(44,68820.00,'Cauliflower',18.57,19.76),(45,16547.00,'Puree - Mocha',5.02,19.77),(46,89756.00,'Wine - Magnotta - Pinot Gris Sr',18.86,11.22),(47,30059.00,'Salt - Rock, Course',27.74,24.62),(48,15181.00,'Bagel - Whole White Sesame',12.47,29.67),(49,47651.00,'Milk - 2%',3.44,16.51),(50,57290.00,'Crab - Dungeness, Whole',21.94,29.06),(51,59573.00,'Pasta - Cheese / Spinach Bauletti',5.71,26.52),(52,57201.00,'Mushroom - Shitake, Fresh',22.07,15.42),(53,14529.00,'Sparkling Wine - Rose, Freixenet',17.56,22.14),(54,23049.00,'Pepper - Orange',12.86,25.27),(55,9636.00,'Beets - Candy Cane, Organic',12.00,20.16),(56,69114.00,'Tart Shells - Savory, 2',11.27,19.57),(57,80604.00,'Wine - Ej Gallo Sierra Valley',6.67,17.50),(58,71394.00,'Appetizer - Mango Chevre',26.35,25.41),(59,72858.00,'Chips Potato Reg 43g',27.12,20.97),(60,62056.00,'Piping - Bags Quizna',16.33,22.73),(61,57113.00,'Thermometer Digital',1.98,28.26),(62,15529.00,'Tilapia - Fillets',14.46,18.32),(63,51707.00,'Yogurt - Banana, 175 Gr',26.18,17.07),(64,83264.00,'Rice - Jasmine Sented',14.83,20.65),(65,35132.00,'Appetizer - Escargot Puff',11.16,14.82),(66,72569.00,'Wine - Crozes Hermitage E.',24.32,21.41),(67,96424.00,'Anisette - Mcguiness',20.99,28.10),(68,83272.00,'Cheese - Comte',30.00,16.64),(69,83360.00,'Juice - Clamato, 341 Ml',19.11,25.19),(70,67248.00,'Mackerel Whole Fresh',18.36,13.09),(71,56141.00,'Persimmons',16.64,21.23),(72,55105.00,'Coffee - 10oz Cup 92961',1.52,10.11),(73,14035.00,'Wine - Saint - Bris 2002, Sauv',20.19,12.18),(74,25158.00,'Wine - Chablis 2003 Champs',16.08,12.15),(75,49659.00,'Wine - Red, Colio Cabernet',15.87,28.81),(76,18047.00,'Juice - Happy Planet',10.01,10.53),(77,89207.00,'Pork - Loin, Bone - In',13.43,13.72),(78,50439.00,'Mortadella',23.37,27.00),(79,40913.00,'Crab - Blue, Frozen',25.64,23.81),(80,47600.00,'Rice - Brown',25.27,13.11),(81,26673.00,'Spinach - Frozen',11.42,11.02),(82,94927.00,'Raisin - Dark',21.02,22.84),(83,96493.00,'Calaloo',15.38,23.16),(84,21884.00,'Island Oasis - Ice Cream Mix',1.40,14.14),(85,43312.00,'Mace',4.11,20.71),(86,96516.00,'Syrup - Monin, Amaretta',23.42,13.83),(87,15085.00,'Cheese - Brie, Cups 125g',13.37,28.74),(88,73511.00,'Sauce - Soya, Dark',27.04,12.81),(89,42089.00,'Pasta - Lasagne, Fresh',16.68,17.74),(90,1503.00,'Cake Circle, Foil, Scallop',10.81,23.55),(91,92620.00,'Cheese - Bakers Cream Cheese',15.80,10.96),(92,44635.00,'Russian Prince',14.80,29.05),(93,52063.00,'Bread - Italian Sesame Poly',23.63,19.30),(94,88405.00,'Sugar - Palm',24.54,19.32),(95,63232.00,'Lamb - Bones',24.19,22.64),(96,63512.00,'Energy Drink - Franks Pineapple',18.95,10.79),(97,22513.00,'Pork - Ham, Virginia',28.09,12.16),(98,50582.00,'Quail - Jumbo Boneless',22.76,10.12),(99,70128.00,'Cheese - Bocconcini',22.39,25.21),(100,70080.00,'Napkin White - Starched',4.08,29.40);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service_Employee`
--

DROP TABLE IF EXISTS `Service_Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service_Employee` (
  `Employee_ID` decimal(30,0) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `Service_Employee_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service_Employee`
--

LOCK TABLES `Service_Employee` WRITE;
/*!40000 ALTER TABLE `Service_Employee` DISABLE KEYS */;
INSERT INTO `Service_Employee` VALUES (21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50);
/*!40000 ALTER TABLE `Service_Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shopping_Cart`
--

DROP TABLE IF EXISTS `Shopping_Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shopping_Cart` (
  `customer_ID` decimal(30,0) NOT NULL,
  `Product_ID` decimal(30,0) NOT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`customer_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `Shopping_Cart_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `Customer` (`customer_ID`),
  CONSTRAINT `Shopping_Cart_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shopping_Cart`
--

LOCK TABLES `Shopping_Cart` WRITE;
/*!40000 ALTER TABLE `Shopping_Cart` DISABLE KEYS */;
INSERT INTO `Shopping_Cart` VALUES (4,62,9),(5,50,11),(6,30,10),(7,25,2),(13,88,6),(26,34,10),(26,85,8),(35,2,11),(36,32,11),(36,78,5),(40,29,7),(41,73,10),(50,75,10),(50,91,10),(53,41,2),(58,76,5),(59,32,2),(70,31,4),(70,82,6),(72,23,10),(72,59,1),(72,90,10),(73,53,4),(74,83,10),(78,26,9),(79,61,10),(87,6,11),(93,68,4),(94,26,5),(98,36,3);
/*!40000 ALTER TABLE `Shopping_Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stores`
--

DROP TABLE IF EXISTS `Stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stores` (
  `Warehouse_ID` decimal(30,0) NOT NULL,
  `Product_ID` decimal(30,0) NOT NULL,
  `Stocks` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`Warehouse_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `Stores_ibfk_1` FOREIGN KEY (`Warehouse_ID`) REFERENCES `Warehouse` (`Warehouse_ID`),
  CONSTRAINT `Stores_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`),
  CONSTRAINT `Stores_chk_1` CHECK ((`stocks` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stores`
--

LOCK TABLES `Stores` WRITE;
/*!40000 ALTER TABLE `Stores` DISABLE KEYS */;
INSERT INTO `Stores` VALUES (1,2,2065),(1,5,5750),(1,9,1932),(1,14,4455),(1,15,6817),(1,16,6221),(1,24,4360),(1,27,3423),(1,28,7875),(1,31,7103),(1,37,4272),(1,45,3791),(1,47,2504),(1,48,5160),(1,70,4441),(1,74,7687),(1,77,7694),(1,78,1634),(1,82,6195),(1,83,8827),(1,89,6410),(1,94,8783),(1,98,6973),(1,99,2219),(2,8,9310),(2,10,432),(2,13,7187),(2,21,1445),(2,22,5363),(2,29,3349),(2,30,368),(2,33,5873),(2,34,681),(2,38,7826),(2,41,3757),(2,50,893),(2,51,3961),(2,55,5119),(2,67,6080),(2,69,7495),(2,71,5397),(2,75,1366),(2,76,7928),(2,79,6310),(2,81,5282),(2,87,3446),(2,90,3327),(3,4,1544),(3,7,9736),(3,11,4049),(3,17,8028),(3,18,7346),(3,42,7168),(3,44,5356),(3,52,8822),(3,54,4488),(3,59,6708),(3,60,3929),(3,61,956),(3,66,689),(3,68,5301),(3,72,3939),(3,86,1126),(3,88,9951),(3,91,3593),(3,92,7954),(3,97,883),(4,1,8955),(4,3,1679),(4,12,8410),(4,20,706),(4,25,2024),(4,26,60),(4,36,4710),(4,40,3861),(4,63,5724),(4,64,3507),(4,65,3562),(4,73,2149),(4,93,3895),(5,6,4640),(5,19,9332),(5,23,695),(5,32,3865),(5,35,3235),(5,39,7485),(5,43,569),(5,46,9581),(5,49,4683),(5,53,37),(5,56,7646),(5,57,8731),(5,58,5349),(5,62,2720),(5,80,9095),(5,84,2998),(5,85,8445),(5,95,2460),(5,96,2511),(5,100,4822);
/*!40000 ALTER TABLE `Stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplies`
--

DROP TABLE IF EXISTS `Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplies` (
  `Vendor_ID` decimal(30,0) NOT NULL,
  `Product_ID` decimal(30,0) NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Vendor_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `Supplies_ibfk_1` FOREIGN KEY (`Vendor_ID`) REFERENCES `Vendor` (`Vendor_id`),
  CONSTRAINT `Supplies_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplies`
--

LOCK TABLES `Supplies` WRITE;
/*!40000 ALTER TABLE `Supplies` DISABLE KEYS */;
INSERT INTO `Supplies` VALUES (1,16,469),(1,60,334),(1,73,693),(1,85,551),(3,19,188),(3,30,758),(3,36,56),(3,79,830),(4,1,785),(5,49,919),(5,94,62),(6,91,986),(8,22,51),(10,55,432),(11,27,21),(12,65,770),(17,38,238),(19,18,70),(20,9,971),(24,70,320),(25,4,521),(25,17,737),(25,77,458),(27,74,23),(28,29,519),(28,99,972),(29,71,448),(30,83,484),(30,86,190),(31,7,786),(32,75,7),(34,33,999),(34,51,223),(36,20,988),(36,28,101),(40,87,511),(41,13,500),(41,69,219),(42,81,592),(44,5,397),(45,42,983),(46,44,876),(46,53,895),(47,26,91),(52,37,941),(56,23,90),(56,32,51),(57,3,635),(57,93,202),(58,58,421),(58,76,217),(58,97,794),(60,41,276),(60,54,769),(60,56,747),(60,82,265),(61,35,548),(61,84,31),(62,34,341),(63,62,620),(63,63,656),(63,89,888),(65,40,943),(66,45,398),(67,12,789),(68,39,31),(69,95,774),(70,61,440),(70,66,495),(71,15,175),(71,57,804),(72,64,854),(73,46,74),(78,80,177),(79,50,812),(81,24,265),(81,72,773),(81,100,122),(82,96,884),(83,2,760),(83,31,619),(83,48,312),(83,98,328),(84,14,455),(84,90,170),(86,59,648),(86,67,650),(86,88,185),(87,21,897),(89,6,408),(89,68,20),(90,10,402),(90,52,822),(91,8,179),(97,11,665),(98,43,301),(99,47,439),(100,25,245),(100,78,494),(100,92,612);
/*!40000 ALTER TABLE `Supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaction` (
  `Order_ID` decimal(30,0) NOT NULL,
  `Payment_Method` varchar(30) DEFAULT NULL,
  `Transaction_Status` tinyint(1) DEFAULT NULL,
  `transaction_time` timestamp NULL DEFAULT NULL,
  `Customer_ID` decimal(30,0) DEFAULT NULL,
  `Coupon_Code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Coupon_Code` (`Coupon_Code`),
  CONSTRAINT `Transaction_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`customer_ID`),
  CONSTRAINT `Transaction_ibfk_2` FOREIGN KEY (`Coupon_Code`) REFERENCES `Coupon` (`Coupon_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES (1,'Net Banking',1,'2021-07-18 17:19:53',40,'6'),(2,'Card',1,'2021-08-13 16:00:53',68,'7'),(3,'Net Banking',1,'2021-09-30 18:26:52',44,'8'),(4,'UPI',0,'2021-09-08 22:53:11',38,'9'),(5,'UPI',1,'2021-10-06 08:39:50',97,'10'),(6,'UPI',1,'2021-04-17 02:04:30',31,'11'),(7,'UPI',1,'2021-03-27 20:22:38',29,'12'),(8,'UPI',1,'2021-01-19 17:55:37',39,'13'),(9,'Card',1,'2021-03-08 00:16:42',35,'14'),(10,'Net Banking',0,'2021-01-17 21:12:42',24,'15'),(11,'Net Banking',1,'2021-08-25 01:47:05',55,'16'),(12,'UPI',0,'2021-09-12 01:21:13',50,'17'),(13,'Net Banking',1,'2021-02-09 12:15:03',62,'18'),(14,'Card',1,'2021-05-04 17:44:35',2,'19'),(15,'UPI',1,'2021-03-11 21:44:14',39,'20'),(16,'Net Banking',0,'2021-07-19 08:20:36',81,'21'),(17,'Card',1,'2021-12-07 13:17:40',18,'22'),(18,'UPI',0,'2021-12-19 07:01:29',91,'23'),(19,'UPI',0,'2021-12-04 21:49:53',43,'24'),(20,'Net Banking',0,'2021-04-22 18:57:13',95,'25'),(21,'Card',0,'2021-12-10 11:02:24',8,'26'),(22,'Card',1,'2021-10-07 17:19:36',91,'27'),(23,'Net Banking',0,'2021-10-26 09:23:18',25,'28'),(24,'Card',1,'2021-06-14 22:45:18',82,'29'),(25,'Card',1,'2021-11-28 17:37:52',70,'30'),(26,'Card',1,'2021-08-03 09:08:08',34,'31'),(27,'UPI',1,'2021-07-10 03:11:59',90,'32'),(28,'UPI',1,'2021-06-17 06:34:49',95,'33'),(29,'UPI',0,'2021-09-14 01:44:32',46,'34'),(30,'Net Banking',0,'2021-05-06 17:39:31',55,'35'),(31,'Card',0,'2021-07-24 02:01:55',88,'36'),(32,'UPI',0,'2021-05-07 10:03:26',58,'37'),(33,'Net Banking',0,'2021-04-12 20:05:38',35,'38'),(34,'Card',0,'2021-04-25 07:20:02',32,'39'),(35,'Net Banking',1,'2021-07-31 23:06:23',19,'40'),(36,'Card',1,'2021-08-17 14:35:20',34,'41'),(37,'UPI',0,'2021-01-23 03:30:00',52,'42'),(38,'Net Banking',1,'2021-09-13 17:09:53',18,'43'),(39,'Net Banking',1,'2021-01-17 21:40:36',81,'44'),(40,'UPI',0,'2021-01-08 19:57:01',29,'45'),(41,'Card',0,'2021-01-10 12:07:50',21,'46'),(42,'UPI',0,'2021-02-24 08:09:31',11,'47'),(43,'UPI',1,'2021-01-24 00:10:28',27,'48'),(44,'Card',0,'2021-11-02 01:57:11',43,'49'),(45,'Card',0,'2021-01-09 04:48:21',98,'50'),(46,'Net Banking',0,'2021-09-07 05:03:25',92,'51'),(47,'Net Banking',1,'2021-05-12 11:24:14',75,'52'),(48,'UPI',0,'2021-10-14 00:25:32',40,'53'),(49,'UPI',0,'2021-03-11 12:56:47',57,'54'),(50,'UPI',0,'2021-04-08 00:27:30',5,'55');
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendor` (
  `Vendor_id` decimal(30,0) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `Plot_number` decimal(30,0) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `pincode` decimal(6,0) DEFAULT NULL,
  `Vendor_out_of_business` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Vendor_id`),
  CONSTRAINT `Vendor_chk_1` CHECK ((`Plot_number` >= 0)),
  CONSTRAINT `Vendor_chk_2` CHECK ((`pincode` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendor`
--

LOCK TABLES `Vendor` WRITE;
/*!40000 ALTER TABLE `Vendor` DISABLE KEYS */;
INSERT INTO `Vendor` VALUES (1,'Otes','Renwick',34373,'Palaióchora',803147,0),(2,'Junette','Barnhart',40094,'Muara Siberut',827734,0),(3,'Allissa','Biggerstaff',8999,'Victoria',778846,0),(4,'Madelaine','Kissick',320,'Zhangxi',709932,0),(5,'Mallorie','Tutill',92284,'Oslo',776945,0),(6,'Juliane','O\'Finan',481,'Cruzeiro',123220,0),(7,'Lynnell','Devlin',37765,'Guaratinguetá',174234,0),(8,'Shanta','Greg',136,'Lākshām',428485,0),(9,'Alic','Sywell',4061,'Suphan Buri',619089,0),(10,'Joyann','Pidwell',2,'Baidoa',904749,0),(11,'Kimble','McAlarney',64100,'Mjamaoué',855149,0),(12,'Minnaminnie','Yonge',182,'Pasar',925203,0),(13,'Raviv','Eyer',4,'Bao’an',852404,0),(14,'Janek','Gossage',525,'Cumming',659351,0),(15,'Dicky','Hrihorovich',31607,'Gävle',252198,0),(16,'Yevette','Antoszczyk',65,'Strömsund',453380,0),(17,'Merle','Wenzel',8,'Waipawa',716951,0),(18,'Shellysheldon','Baunton',849,'Nogueira da Regedoura',958339,0),(19,'Tad','Longthorn',73,'Eisen',159310,0),(20,'Seka','Arnolds',589,'Batroûn',769079,0),(21,'Eirena','Downe',55728,'Witzenhausen',147505,0),(22,'Cassie','Novic',8,'Kodinsk',790770,0),(23,'Enos','Dicks',2191,'Kanaya',510648,0),(24,'Adriaens','Izhakov',2183,'Songjianghe',983827,0),(25,'Milton','Nenci',0,'Sapadun',293425,0),(26,'Hadley','Eaton',8,'Terny',440236,0),(27,'Kelcie','Esche',29,'Kushchëvskaya',961581,0),(28,'Gertrudis','O\'Nion',4,'Denver',304206,0),(29,'Paul','Dewen',73141,'Flandes',671437,0),(30,'Nat','Kiledal',3883,'Huanipaca',338829,0),(31,'Cathee','Rawood',14,'Zhigong',310214,0),(32,'Deedee','Sneesbie',927,'Saurimo',749022,0),(33,'Edin','Daens',5,'Padabeunghar',628261,0),(34,'Berna','Bick',4515,'Tierimu',431115,0),(35,'Cassandre','Kestin',2137,'Karangsembung',734995,0),(36,'Elsie','Bruhnsen',74821,'Imotski',239496,0),(37,'Velma','Gaveltone',62,'Teplice',281832,0),(38,'Markos','Ratledge',3,'Santa Maria Oliveira',183821,0),(39,'Wendy','Oxenden',54,'Xiaomenjia',740904,0),(40,'Howard','Harmar',1,'Guiping',285613,0),(41,'Poppy','Everest',747,'Songshan',332522,0),(42,'Kristi','de Marco',7,'Luftinjë',716283,0),(43,'Juieta','Thomasson',35171,'Akim Swedru',940662,0),(44,'Garret','Toffanini',84,'Jurh',835933,0),(45,'Dewey','Camous',61702,'Káto Dhiminió',772053,0),(46,'Thorsten','Fabry',568,'Borlänge',722698,0),(47,'Ari','Russi',89,'Bohus',837786,0),(48,'Maggi','Kreutzer',53464,'Seren Barat',554170,0),(49,'Milt','Sille',38,'Petaling Jaya',586716,0),(50,'Sela','Sickert',9023,'Helmsange',131330,0),(51,'Cherish','Buglar',1803,'Yazman',931293,0),(52,'Deb','LAbbet',4,'Khvatovka',206137,0),(53,'Tymothy','Jee',51,'Dahuangwei',754789,0),(54,'Emyle','Vaugham',650,'Krasne',502275,0),(55,'Kean','Hackford',468,'Pervoural’sk',508980,0),(56,'Vittorio','Bellchamber',8141,'Нераште',986257,0),(57,'Tandi','Whitney',279,'Ganzhou',145550,0),(58,'Lonnard','Mifflin',70,'Qixian',915567,0),(59,'Gertrude','Sate',51765,'Baiqi',793648,0),(60,'Delmer','Costar',4475,'Bells Corners',725064,0),(61,'Jayme','Donnersberg',76,'Gorna Oryakhovitsa',617541,0),(62,'Ruperta','MacArthur',64,'Linhó',332952,0),(63,'Erena','Luquet',11648,'Huilongshan',828273,0),(64,'Haroun','Rowbottam',1,'Guanbuqiao',664844,0),(65,'Marga','Bestar',8913,'Hullo',686310,0),(66,'Neila','Pendleton',88,'Bang Pa-in',767257,0),(67,'Thomasin','Moy',29607,'Namballe',620429,0),(68,'Helsa','Harrema',8,'Sehwān',530051,0),(69,'Amandie','Leschelle',3,'La Serena',546575,0),(70,'Mora','Cosford',9,'Stockholm',710499,0),(71,'Dolph','Hammerberg',68933,'Hidalgo',886983,0),(72,'Neron','Pfaffel',833,'Krrabë',835398,0),(73,'Licha','Woolis',18,'Nawal',296592,0),(74,'Sophey','Alesi',2,'Stockholm',394287,0),(75,'Ernie','Rapport',72113,'Qionghai',491503,0),(76,'Michele','Botham',464,'Zorgo',713449,0),(77,'Mattie','Turn',191,'Lianzhou',576732,0),(78,'Earl','Urridge',878,'Covão da Carvalha',185403,0),(79,'Reg','Gumm',36210,'Banī Khaddāsh',891442,0),(80,'Nance','Lamey',9,'Polanka Wielka',598674,0),(81,'Tate','Phifer',64659,'Novi Beograd',521118,0),(82,'Barr','Sture',14528,'Malabonot',153543,0),(83,'Camella','Seares',10669,'Novoukrainskiy',363179,0),(84,'Naoma','Urey',352,'Xing’an',492191,0),(85,'Merla','Sirette',4143,'Charlotte',169462,0),(86,'Katlin','Antoni',5,'Karabanovo',470308,0),(87,'Sonya','Jeavon',79934,'Säter',591669,0),(88,'Carly','Le Leu',451,'Lacdayan',966123,0),(89,'Larina','Pettitt',96,'Gengqing',515689,0),(90,'Cortney','Lehr',3,'Solana',412671,0),(91,'Shell','Venneur',12,'Walakeri',656366,0),(92,'Truman','Glantz',96945,'Iporá',334829,0),(93,'Nichole','Maghull',5,'Hämeenkoski',545143,0),(94,'Natasha','Eim',4,'Nova Pazova',318782,0),(95,'Ammamaria','Grutchfield',5,'Blizne',308615,0),(96,'Kameko','Ferrara',46,'San Jacinto',651094,0),(97,'Federico','Rickards',6866,'Bābol',353101,0),(98,'Baily','Lamp',2719,'Damatulan',403162,0),(99,'Nadia','Threadgall',192,'Río de Oro',999530,0),(100,'Anders','Garlette',0,'Vinsady',540491,0);
/*!40000 ALTER TABLE `Vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendor_phone`
--

DROP TABLE IF EXISTS `Vendor_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendor_phone` (
  `Vendor_ID` decimal(30,0) NOT NULL,
  `Phone_number` decimal(30,0) NOT NULL,
  PRIMARY KEY (`Phone_number`,`Vendor_ID`),
  KEY `Vendor_ID` (`Vendor_ID`),
  CONSTRAINT `Vendor_phone_ibfk_1` FOREIGN KEY (`Vendor_ID`) REFERENCES `Vendor` (`Vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendor_phone`
--

LOCK TABLES `Vendor_phone` WRITE;
/*!40000 ALTER TABLE `Vendor_phone` DISABLE KEYS */;
INSERT INTO `Vendor_phone` VALUES (1,9247407269),(1,9353925329),(1,9391904704),(1,9627398866),(2,9682891133),(2,9723160778),(2,9880986125),(2,9945850783),(3,9902930793),(4,9011078624),(4,9404613777),(5,9046416326),(5,9383628333),(5,9590709165),(5,9922343207),(5,9991384031),(6,9154904965),(6,9409549696),(7,9256141757),(7,9620218696),(7,9650882010),(7,9735910634),(8,9012062890),(8,9265329087),(8,9556167292),(8,9716716451),(8,9980639724),(9,9386074751),(9,9467994422),(9,9978082021),(10,9129648791),(10,9245327148),(10,9348971177),(10,9865380572),(11,9185739558),(11,9463803402),(11,9847776293),(11,9858724362),(12,9240544047),(12,9460758328),(13,9434370455),(14,9030785097),(14,9587706253),(14,9618051204),(15,9053636267),(15,9871841730),(15,9923901366),(15,9991245069),(18,9029315906),(18,9075224248),(18,9779588764),(19,9149953761),(19,9162165935),(20,9373772952),(21,9075787061),(21,9281958153),(21,9290206035),(21,9552334497),(21,9557859513),(21,9742700830),(22,9096894321),(22,9189934716),(22,9786754130),(23,9109963045),(23,9361334129),(23,9503418016),(23,9544202108),(25,9731032653),(25,9957818835),(26,9202634389),(26,9204376368),(26,9433001687),(26,9690328425),(26,9812980603),(27,9240599504),(27,9573481644),(27,9936927090),(29,9121094983),(29,9923480080),(30,9633141600),(30,9674769594),(30,9749397059),(30,9846861533),(31,9300744639),(31,9366642085),(32,9176420504),(32,9810034157),(32,9869712905),(32,9882509309),(32,9924290249),(33,9395057668),(34,9093085881),(34,9194098431),(34,9223870202),(34,9536098331),(34,9568534655),(35,9658885561),(36,9150075173),(36,9353212326),(36,9404350982),(36,9926652801),(37,9434425824),(37,9553830545),(37,9569262049),(37,9751694923),(37,9802579509),(38,9018507704),(38,9336282619),(38,9357760139),(38,9606128796),(38,9985618972),(39,9528612495),(39,9756665976),(40,9137907116),(40,9177489598),(40,9401532222),(41,9289814910),(42,9239491869),(42,9375125432),(42,9466630347),(42,9738568045),(42,9864936088),(43,9151208273),(43,9435542953),(43,9591916307),(43,9817359267),(43,9888644898),(43,9935071178),(44,9216208910),(44,9634450905),(44,9655310350),(45,9037136738),(45,9068754187),(45,9568331486),(45,9786648154),(45,9882539400),(46,9127585384),(46,9460783535),(46,9484766111),(48,9400904160),(48,9609646385),(48,9657553635),(48,9822698532),(49,9056393534),(49,9522192653),(49,9731085331),(50,9049391325),(51,9009354070),(51,9245847920),(51,9643322621),(51,9677051612),(52,9014039693),(52,9402262897),(52,9719830537),(52,9772126291),(52,9953672225),(53,9604676650),(54,9086615483),(54,9545170901),(55,9178265483),(56,9079127915),(56,9282319127),(56,9910148241),(57,9568083238),(58,9396612496),(59,9617745036),(59,9794642962),(60,9189334323),(60,9259237497),(61,9205578113),(61,9216367153),(61,9285234011),(61,9368694772),(61,9583171276),(61,9682541853),(62,9384423827),(62,9588298180),(62,9703259703),(62,9960424597),(62,9975464654),(63,9053081506),(63,9591226100),(63,9634727016),(63,9752252972),(64,9205512949),(64,9551517293),(65,9085965351),(65,9732782279),(65,9849991687),(66,9061899587),(66,9078056849),(66,9183129293),(66,9206291418),(66,9312296760),(66,9462906165),(66,9538221725),(66,9704465255),(66,9757802044),(66,9814683403),(67,9107750243),(67,9609099307),(67,9634248315),(68,9003688733),(68,9235140490),(68,9785565289),(68,9945197548),(68,9973834018),(69,9369070263),(69,9428717769),(69,9528403933),(69,9825025477),(69,9899748801),(70,9314875168),(70,9642449741),(71,9683578698),(71,9790640561),(71,9908351219),(72,9249960494),(72,9435803352),(73,9299697230),(73,9584193319),(73,9792912710),(75,9071194136),(75,9096306584),(75,9246349498),(75,9429502721),(75,9480897672),(76,9108733350),(76,9182134732),(76,9327515623),(76,9553346498),(78,9104009555),(78,9237994747),(78,9855435045),(79,9248033479),(79,9250825864),(79,9677382812),(80,9719736518),(81,9466222581),(81,9662820250),(82,9206543228),(82,9257808066),(83,9242407479),(83,9307204961),(83,9777035348),(83,9955941045),(84,9190098197),(84,9431879233),(84,9952695844),(84,9987583282),(85,9233078037),(85,9321530124),(85,9544835711),(86,9421234822),(87,9312824892),(87,9384003816),(87,9492335469),(87,9585112676),(88,9374228698),(88,9411463262),(88,9474192004),(88,9476524222),(88,9518227909),(88,9628265943),(88,9910828018),(89,9074145752),(89,9109973274),(89,9721044279),(90,9225585781),(90,9388382588),(90,9487332083),(90,9624277489),(92,9094124650),(92,9102421614),(92,9150719085),(92,9160700767),(92,9630946265),(92,9685973451),(93,9814999102),(94,9031210662),(94,9223561469),(94,9422937299),(94,9430841994),(94,9715160145),(94,9953620568),(95,9094376644),(95,9166711466),(95,9890012861),(96,9480768931),(97,9131080526),(97,9233032222),(97,9247084395),(97,9648173808),(98,9452894176),(98,9814730870),(98,9930955751),(99,9444738424),(100,9583114043),(100,9806680228),(100,9936482220);
/*!40000 ALTER TABLE `Vendor_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouse`
--

DROP TABLE IF EXISTS `Warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Warehouse` (
  `Warehouse_ID` decimal(30,0) NOT NULL,
  `Plot_number` decimal(30,0) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `pincode` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`Warehouse_ID`),
  CONSTRAINT `Warehouse_chk_1` CHECK ((`plot_number` >= 0)),
  CONSTRAINT `Warehouse_chk_2` CHECK ((`pincode` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse`
--

LOCK TABLES `Warehouse` WRITE;
/*!40000 ALTER TABLE `Warehouse` DISABLE KEYS */;
INSERT INTO `Warehouse` VALUES (1,99,'San Quintin',793623),(2,20,'Hampton',991302),(3,86,'Unidos',556905),(4,29,'Stockholm',196614),(5,67,'Omaha',821660);
/*!40000 ALTER TABLE `Warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouse_Worker`
--

DROP TABLE IF EXISTS `Warehouse_Worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Warehouse_Worker` (
  `Employee_ID` decimal(30,0) NOT NULL,
  `Warehouse_ID` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  CONSTRAINT `Warehouse_Worker_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  CONSTRAINT `Warehouse_Worker_ibfk_2` FOREIGN KEY (`Warehouse_ID`) REFERENCES `Warehouse` (`Warehouse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse_Worker`
--

LOCK TABLES `Warehouse_Worker` WRITE;
/*!40000 ALTER TABLE `Warehouse_Worker` DISABLE KEYS */;
INSERT INTO `Warehouse_Worker` VALUES (9,1),(13,1),(14,1),(19,1),(20,1),(1,2),(7,2),(16,2),(5,3),(17,3),(2,4),(3,4),(4,4),(6,4),(8,4),(10,4),(11,4),(12,4),(15,4),(18,5);
/*!40000 ALTER TABLE `Warehouse_Worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouse_phone`
--

DROP TABLE IF EXISTS `Warehouse_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Warehouse_phone` (
  `Warehouse_ID` decimal(30,0) NOT NULL,
  `Phone_number` decimal(30,0) NOT NULL,
  PRIMARY KEY (`Phone_number`,`Warehouse_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  CONSTRAINT `Warehouse_phone_ibfk_1` FOREIGN KEY (`Warehouse_ID`) REFERENCES `Warehouse` (`Warehouse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse_phone`
--

LOCK TABLES `Warehouse_phone` WRITE;
/*!40000 ALTER TABLE `Warehouse_phone` DISABLE KEYS */;
INSERT INTO `Warehouse_phone` VALUES (1,9154496880),(1,9450679380),(1,9458106197),(1,9657706381),(1,9891045934),(1,9923252418),(2,9610554752),(2,9716221845),(2,9762027321),(3,9488583004),(3,9653172917),(4,9311274244),(4,9885883262),(4,9920312369),(4,9930018684),(4,9935515025),(5,9058021150),(5,9253892237),(5,9542143193),(5,9844878834);
/*!40000 ALTER TABLE `Warehouse_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complains`
--

DROP TABLE IF EXISTS `complains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complains` (
  `complaint_number` decimal(30,0) NOT NULL,
  `customer_ID` decimal(30,0) DEFAULT NULL,
  `order_id` decimal(30,0) DEFAULT NULL,
  `service_employee_id` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`complaint_number`),
  KEY `customer_ID` (`customer_ID`),
  KEY `order_id` (`order_id`),
  KEY `service_employee_id` (`service_employee_id`),
  CONSTRAINT `complains_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `Customer` (`customer_ID`),
  CONSTRAINT `complains_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_ID`),
  CONSTRAINT `complains_ibfk_3` FOREIGN KEY (`service_employee_id`) REFERENCES `Service_Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complains`
--

LOCK TABLES `complains` WRITE;
/*!40000 ALTER TABLE `complains` DISABLE KEYS */;
INSERT INTO `complains` VALUES (1,50,12,48),(2,95,28,31),(3,91,18,26),(4,88,31,39),(5,81,39,25),(6,18,17,43),(7,62,13,21),(8,95,28,45),(9,35,9,50),(10,55,11,41);
/*!40000 ALTER TABLE `complains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `order_id` decimal(30,0) NOT NULL,
  `product_id` decimal(30,0) NOT NULL,
  `quantity` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_ID`),
  CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`Product_ID`),
  CONSTRAINT `order_products_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,55,9),(1,62,10),(1,73,3),(2,1,1),(2,46,9),(2,50,1),(3,21,9),(3,40,7),(3,87,5),(4,2,4),(4,81,8),(4,89,1),(5,80,9),(5,88,8),(5,92,5),(6,13,7),(6,14,7),(6,44,1),(7,3,5),(7,22,10),(7,70,7),(8,21,5),(8,25,2),(8,98,4),(9,10,7),(9,34,4),(9,79,5),(10,46,8),(10,72,2),(10,77,7),(11,11,3),(11,45,3),(11,90,1),(12,17,2),(12,42,1),(12,56,1),(13,31,4),(13,54,4),(13,84,10),(14,40,10),(14,77,9),(14,88,1),(15,12,6),(15,49,8),(15,90,5),(16,40,3),(16,45,5),(16,90,9),(17,12,7),(17,31,4),(17,55,5),(18,54,10),(18,55,3),(18,93,2),(19,9,5),(19,31,7),(19,76,10),(20,18,4),(20,65,8),(20,68,9),(21,77,8),(21,80,7),(22,10,7),(22,16,6),(23,67,9),(23,71,10),(24,48,1),(24,65,10),(25,20,2),(25,92,2),(26,63,7),(26,74,6),(27,82,8),(27,92,6),(28,17,1),(28,59,7),(29,39,1),(29,77,3),(30,27,1),(30,85,4),(31,53,7),(32,1,9),(33,90,2),(34,15,9),(35,61,8),(36,68,6),(37,59,2),(38,44,1),(39,56,8),(40,76,1),(41,3,10),(42,68,6),(43,30,5),(44,12,5),(45,67,1),(46,89,6),(47,82,5),(48,92,6),(49,97,8),(50,80,10);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_photo`
--

DROP TABLE IF EXISTS `product_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_photo` (
  `Product_ID` decimal(30,0) NOT NULL,
  `Photos_url` varchar(300) NOT NULL,
  PRIMARY KEY (`Product_ID`,`Photos_url`),
  CONSTRAINT `product_photo_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_photo`
--

LOCK TABLES `product_photo` WRITE;
/*!40000 ALTER TABLE `product_photo` DISABLE KEYS */;
INSERT INTO `product_photo` VALUES (1,'ROCGZ8996U1ECKM0N83'),(2,'040TKZJDL'),(2,'R4NP463'),(2,'YQAIOMU'),(3,'198LCSGXCM7P0VATBM853LT'),(3,'7Q6BSOZLOD'),(3,'Y60KUZL9KZCSRZ09U5XGQX7F2'),(3,'Z7ELIHGZV0DBN90RKV'),(4,'BFTQWH7GRQQM'),(4,'E1ZPY3'),(4,'EB0SKNE'),(5,'X8MCF7PU796XFXY4SLHVYO'),(6,'91FSIBL'),(6,'EGUCSL7Q5GE4YUWERXV2FLZDH'),(7,'76H2QY0CVI94R7RGE5T'),(7,'FYHKBFC2DVY80JOXE'),(7,'KJRYJ2X6X2EM581XIVQ'),(7,'R4MAG33WHFAZ0CBJP40EL'),(7,'Z2QEJR95FBFTVC1PW'),(8,'4B8P3U597'),(8,'H18CEKHGG'),(8,'R4HTOW2AIN5D2BMQ329ZUH'),(9,'C4QAFMVF1EQEF6QT'),(9,'VVQ3M87JOGL91SMOZ'),(10,'20E59E'),(10,'J0JSSTL5'),(10,'K7GH8PHM'),(10,'WN8GUNP3VDFTTRUNNYH7HINW'),(11,'0G2ZPIXQLGRSW7FHHVZM'),(11,'2ZN1NL44'),(11,'BQYYZM2KVOMN'),(11,'JIG6KCDHO'),(11,'WJ3ESU507VULBM3XK5NPHGKLK'),(12,'T4O8HH93Y'),(13,'B3D3X3BNHJ2OE1SU'),(14,'2NZU5D'),(14,'90VQDSO8L7YQE'),(14,'C86CM2VM4W1'),(14,'M11BPDN4A1N5J5I'),(14,'Y0S1USDR0HQZY'),(15,'ET79NKIO6SZHGKXINTAON6L'),(15,'Q406DA6HXY9O8NOX0LF4C'),(16,'GSM69OT3QF'),(16,'JN259LI9GUSW672QNVM8'),(16,'LGEPWARN'),(17,'32CQM3OL5T'),(17,'8DCANRAGUOM4P4MA'),(17,'DA8KK4R9'),(18,'F5QSSYUVSHN'),(18,'FMMJNCC5FPMKXQO'),(18,'LEE7W0CQ'),(19,'EUYRHLZ'),(19,'SAM4X9J3X0'),(19,'WGK4IF'),(20,'QOKM80QU78I2PDFLMA4RI'),(20,'ZEFKQT0LO7GOBJ9'),(21,'1X87VNZNAPDJEEXC8A67'),(21,'8RFMS5TLIHVAPROOEH3NV'),(21,'W35RZDAXKKT'),(22,'57TWO529OQJHZHN8V2Y7ZA90'),(22,'84KI86'),(22,'DIFVX33A4VY15DR'),(22,'DJMDO0FGD'),(23,'07HPCP'),(23,'097P72B7TGKG3DD066KLV29A6'),(23,'NYAXNCSX'),(24,'DW4FBE69PTLR6JFROM'),(25,'E9D83U'),(25,'LWNDLV5NFU'),(26,'QD6GB7SCNWARNYVLZV66J'),(27,'802GSMJ8R2XPRA9DYK0'),(28,'E4ZYC27KENT04'),(28,'POVO81J'),(29,'4SGOWVQM2NR71MBBS7WHMLSG3'),(29,'TP3PFLT9HQXZJYJ75ZN'),(29,'W09CCA'),(30,'GSO3X1KFEC06'),(31,'H04P7H60CEV'),(31,'ZEL40T5A4KBMEFX2P9FA7'),(31,'ZG3Q1ID3H2'),(32,'61K7C8G1HYILGR0BU'),(32,'S237DCST94G6XA7W'),(33,'23LZ0M'),(33,'7JI1CO6SNOLFM6MULYE1'),(33,'OEZ4H8TV0WY8DXB56OLMAH5'),(33,'XIY38EYOR0OIZ3S'),(34,'Y3VZP3LWGJD'),(35,'1EMYS9O2LUS11VUUTNF8'),(36,'77KL9B1VOLJ86BFXM'),(37,'O5WF7R0RFJLZF535QU8B'),(37,'ZWFOM6TD32XVFRB614UJSBJ6'),(38,'0WID65IGKP1LFQK'),(39,'11403JKT2ZFYR4ZOJVYD7M0'),(39,'3MSMYZC'),(39,'8IUPNJ3G06K5A7ZNK'),(39,'LAEWDMGU3'),(39,'WY884LOWZKV0NTG79X'),(40,'2EYLJ2NH1ZLK'),(40,'4PG62WJ84YF6'),(40,'57GIRIZFIU8LA6TQRQ3JGQ'),(40,'OLGOQ4UTIUPO'),(40,'SZJDW08SL7AJPLJ3'),(41,'BHPMJRN2273N1PHHH'),(41,'ETMWMTHTI3GRH4W4GRRSEQ2W1'),(41,'JBQA2W1UGRGJR5'),(42,'400ZVH23Y'),(42,'H620X4ULAAF9SA42I3SPR6'),(42,'LUI7M7JB3OMC7JSA'),(42,'VHZ1O1SQ8HDMY77'),(43,'2WCO480QJQHDZO823'),(43,'9ECQQXBEUF9C8K5BMEXEQIBB'),(43,'TXZ1UOQ'),(43,'W1IRZ5AO0'),(43,'Z8I4GBYNQCAXVP5'),(44,'J75GJN2X5DSRBJJP0TPY'),(44,'LJ98GK2L8'),(45,'JKYR6HAB4SAYCI0NPM9RV'),(45,'OW8KHHR6VKQYC3AQPM'),(46,'AGV0GP9Z2MQ'),(46,'SZLL8IQ9LPNTNDA7IYQN09JR'),(46,'WI0GVXYDPXQI64M2B'),(47,'4RPIN7L6DTRW3OF'),(47,'FQ0P4W'),(47,'IWHVLFR26I191G'),(47,'UDOW0WLMD30TDODM6LGY'),(48,'121KB3NHJ'),(48,'5O6NUAFP42M032KADFMAQ'),(48,'A8LB56BIQ4P6B3UVYUUOZ34'),(49,'1QP2U0I0FVO8E9ZY0MK2'),(49,'2UFQNTHEHSWARAU2RRUQ4B9I2'),(49,'6XKH7PREXCNUK0DQ1Q9A'),(49,'S9S02OWGZ1K2L60UV'),(49,'TV5FNXL'),(50,'WLAM6V2I86'),(51,'9DCP1G37A'),(51,'EK1XMYYEYG9VIO1JWM'),(51,'H3TMSFVKCC3U'),(51,'JQQQCS1J11HG7S'),(51,'WFFTK21YVW'),(52,'HBSE7ULXZURS4WX'),(53,'JILXPUYV62O0YQUQC6X'),(54,'1VIC43NL2YWK6KE'),(54,'98W3KSQOADUB812QI'),(54,'F6GK6P'),(54,'KQ05TWBSJ8GS8Y'),(54,'UN4QZJR5BCWMBX1'),(55,'D9RENHY8BIK3S5Y9BVS'),(55,'EEV1UVEUJLX8HPB0L'),(55,'H4CJBIIJ5QVE21LJ1LU9H'),(55,'X9BGN17'),(56,'9M6Y4MYN6E'),(56,'I78OPLX73YQN90BW5XX'),(56,'PZD8BVCB1'),(56,'QMMCQEYPE'),(56,'XFY5W4N3ADQV7U'),(57,'2CH60AS64I4MNJZ3PQMB'),(57,'JH55IGB'),(57,'QLX2GWANQHZAUYIUP1NUM'),(58,'K9TNB088DEXB'),(59,'12KXFL87TOSMTGFYP'),(59,'44VFW6MMML44VKD505EL51E'),(59,'LWMMRBPXUE'),(59,'Q8XNFLH79ISY90UJTLTVBDK0'),(60,'6J57Z8GOE5HTWU3YY'),(60,'M8IJOUJD7ZJV29DE4PNEE3'),(60,'SQXYOACA'),(61,'BQ8ISK41F6DYI7'),(61,'LL9N3XENQK295'),(62,'QYDN7D4ET35BM0CEH5TE'),(62,'RSBDQPPB0VTKQK8I'),(62,'TJMIT3GF'),(62,'WUFQXVT3U1SOAYJVBZPI'),(62,'YTEQUNMUD8K'),(63,'ETXUO3YHX34ZW'),(64,'1TBL4LW0S9MSYSTGF'),(64,'WKU14O6OTDQO3U1YFQYN'),(64,'XIULJ8KJQ8GXL0SGMW'),(64,'ZQSOSP'),(65,'W9TJHOJJ191I4Y29C'),(66,'32ACZJN1Y5DF1F2SGVENMYMC5'),(66,'6CVMA53L'),(66,'B29IDC6G50TM4U0T0AFNW'),(66,'TD8S3MMLYIEQ'),(66,'V6TZKZVLAOZ'),(67,'91D206YWS2PIKAVHLKJ'),(67,'EJXD5JI77CEGT7477'),(68,'OL381D'),(68,'ZKNA3CREQOLH40UW'),(69,'QP0NFBYEJDKG'),(70,'BXVVZYD6J8P6'),(71,'5BMLUIMVU461A'),(71,'7BJHT4PGSV26Y'),(71,'GERDPV68NCQ45XMIV89E9LI9'),(72,'142PZF1XAH1BZ'),(72,'LYNL882GOAOZQ6WN1J9T4'),(73,'86V8D031'),(73,'D8ZFV899GBN7JTK'),(73,'YZWP1H08PGMLUQI63AMZMASE'),(74,'5DWJNOOF94BORE2FCRL'),(74,'5RG4ICKW2Y7AUI41ZAC'),(75,'6MQP7584OSG'),(75,'GT7RDFGU5SPM8HMNUENAFM'),(75,'JC3U0GB5KV7RYGVZ'),(75,'T3ZQZ80WF3ZF'),(75,'ZV17H3VQFQH3A57T4ONXPV'),(76,'2CWDYZ168W1WC'),(76,'DH9388XFCRN4TACGLE0YWKEZ9'),(77,'0CF02JJZTESMFL00CQSHOT'),(77,'47U4QS'),(77,'MEOXPOM7ZVKR0XW'),(77,'OXA2QAD'),(78,'0K4E51H'),(79,'8ZUZMET7HOD2SG6BYNW0M'),(79,'LTOPCSGAZ0EV5YMKJD6YCNBHD'),(79,'S7J5N0TQE4JFR6NSJAA'),(80,'0AL37ZFPZYYJG'),(80,'9GJARHL5Q8YJJS8Q'),(80,'BTG3069SBQ7WYKY763C20JOA'),(80,'FT594P7'),(81,'8FCDNZZBFKLSIU077K5'),(81,'ANHGMN92'),(82,'041N20JW69'),(82,'1IC6VA8CB438F98DQ'),(82,'LV0WOBXZ1U'),(82,'NAXN14I8AKNC4S2IMWDV6S'),(82,'NDK61WNGB093A4A'),(83,'C0L2I92'),(84,'JDQ279AJODAZZX6G'),(84,'WD32H2F3V'),(84,'WKVBXM0'),(85,'0XA0X5QONXT0UHBY'),(85,'S854F7CU4RC64U'),(86,'8W7AWYTWRT'),(86,'KQ9C2UC9XKZ7D5'),(86,'YEDLGC5QXV5AS4B6'),(87,'DGK4EMUGM7F8J20EUZV7K5'),(87,'GST1RDLHQ8V85JY'),(88,'69FWV8P'),(88,'NSSTMZH97RCEWBAHQIXPYUB'),(89,'7IQ63VPJ'),(89,'H19VBVR6MXPPH8QG'),(89,'T8D261H0QFXYM0SGVIL9'),(89,'UTW9RT0MM2Y1F5'),(89,'UYPLLZ7HVIOBNQPSOZIPRY'),(90,'9Y0F22248VBBS9VLJDUQK'),(90,'H2WS69T'),(91,'E5SJ5ISGFVTVZCCM9JYX'),(91,'V0GPMCNH2N0NU'),(91,'WFE4OE8OPMZN'),(91,'Z35X277'),(92,'3GWY8TKGBVS1VF3ICD0ZI3'),(93,'H61ZDXTMXBW'),(94,'JECGAYFGU5SQSQHWITYKVCG4T'),(94,'JSR24CGDDEIK8T942'),(94,'UZZIKF1BA8UG'),(94,'W92KJDFTXW0BYRD'),(95,'2YH1Y5570'),(95,'35HULS'),(95,'GPXM2M0CFASIH0'),(95,'KDMU4Q0'),(96,'EEBDXULLBELLB2'),(96,'G2QBK6U'),(96,'IT8S4M1MIX5'),(96,'JVFWK4XMX'),(96,'YXFRSE7F29O6'),(97,'89R6T2BH'),(97,'AGDMZFKCJO'),(97,'E0S0YZQO0PLLA'),(97,'LA6WXCDXJGVLTJVH'),(97,'X0Q6SG10MG0YEFMDJIB4U52HC'),(98,'MD9I3D16WP'),(98,'MXDTHDNZ43'),(99,'YZEIJ1SR9DSZS8EM'),(100,'2GRNDENSPEXUES0RP1TRLBX'),(100,'JMB7NYOOC2LY6KVFMG76UT'),(100,'MH9JEC8DAHF'),(100,'XLVTHSDKN1WYG');
/*!40000 ALTER TABLE `product_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_rating`
--

DROP TABLE IF EXISTS `product_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_rating` (
  `Product_ID` decimal(30,0) NOT NULL,
  `customer_id` decimal(30,0) NOT NULL,
  `Rating` decimal(1,0) NOT NULL,
  PRIMARY KEY (`Product_ID`,`customer_id`,`Rating`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `product_rating_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`),
  CONSTRAINT `product_rating_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_ID`),
  CONSTRAINT `product_rating_chk_1` CHECK ((`Rating` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_rating`
--

LOCK TABLES `product_rating` WRITE;
/*!40000 ALTER TABLE `product_rating` DISABLE KEYS */;
INSERT INTO `product_rating` VALUES (38,1,5),(89,1,1),(97,1,5),(52,2,2),(63,2,4),(6,3,5),(9,3,1),(98,3,4),(28,4,3),(58,4,1),(11,5,3),(61,5,5),(63,5,1),(67,5,5),(31,6,5),(74,6,4),(80,6,3),(45,7,4),(44,8,4),(60,8,3),(83,8,3),(42,9,1),(49,9,4),(54,9,1),(78,9,5),(94,9,1),(5,11,3),(50,11,1),(64,11,4),(31,12,2),(56,12,3),(78,12,3),(11,13,2),(40,13,4),(49,13,1),(92,13,1),(96,13,1),(98,13,4),(99,13,3),(15,14,1),(23,14,1),(95,14,2),(56,16,4),(96,16,3),(47,17,4),(62,17,1),(88,17,4),(93,17,1),(50,18,3),(77,18,1),(44,19,2),(35,20,1),(50,20,4),(18,21,5),(13,22,2),(69,22,5),(11,23,4),(18,23,5),(20,23,5),(44,23,3),(28,24,4),(41,24,1),(77,24,3),(26,25,4),(39,25,1),(78,25,5),(6,26,3),(2,27,3),(7,28,5),(21,28,4),(26,28,2),(47,28,3),(55,28,2),(70,28,5),(14,29,4),(73,29,3),(81,29,4),(83,29,1),(86,29,3),(25,30,2),(37,30,1),(40,30,3),(9,31,5),(25,31,4),(76,32,2),(10,33,4),(18,33,1),(32,33,2),(58,33,1),(74,33,5),(12,34,5),(23,34,4),(43,34,5),(84,34,5),(86,34,5),(19,35,3),(20,35,4),(63,35,5),(94,35,3),(25,38,4),(34,38,3),(54,38,2),(55,38,3),(68,38,3),(73,38,3),(82,38,2),(90,38,5),(37,39,4),(79,39,1),(58,40,1),(76,40,4),(68,41,1),(20,42,2),(29,42,1),(55,42,2),(70,42,3),(31,43,5),(46,43,1),(3,44,2),(23,44,3),(92,44,4),(19,45,1),(39,45,1),(87,45,2),(96,45,2),(17,46,1),(37,46,3),(46,46,3),(71,46,2),(85,47,1),(8,48,2),(54,48,5),(78,48,1),(95,48,1),(96,48,5),(6,49,4),(49,49,5),(53,49,1),(57,49,3),(90,49,2),(96,49,3),(12,50,2),(15,50,3),(31,51,4),(74,51,1),(14,52,4),(52,52,3),(89,52,2),(4,53,1),(9,53,2),(11,53,3),(41,53,5),(55,53,5),(17,54,3),(27,54,3),(33,54,5),(36,54,5),(48,54,4),(65,54,3),(84,54,3),(20,56,1),(47,56,1),(64,56,2),(95,56,5),(17,57,5),(47,57,1),(83,57,1),(5,58,5),(98,58,5),(30,59,2),(60,59,1),(92,59,3),(61,60,1),(68,60,1),(77,60,3),(3,61,1),(33,61,4),(50,61,5),(94,61,2),(77,62,1),(93,62,4),(1,63,3),(21,63,4),(22,63,3),(46,63,2),(52,63,3),(72,63,2),(28,64,3),(54,64,2),(85,65,1),(16,66,4),(81,66,4),(34,67,1),(47,67,2),(71,67,5),(30,68,1),(53,68,2),(94,68,5),(40,69,3),(49,69,5),(69,69,2),(75,69,2),(45,70,4),(76,70,4),(6,71,5),(35,71,2),(38,71,3),(41,71,1),(62,72,4),(70,72,1),(79,73,3),(91,73,2),(7,74,3),(32,74,4),(50,75,1),(56,75,2),(66,75,4),(94,75,2),(35,76,1),(55,76,3),(84,76,5),(33,77,2),(36,77,3),(57,77,3),(92,77,5),(7,78,1),(15,78,5),(92,78,5),(32,79,4),(5,80,3),(41,80,2),(1,81,2),(27,81,1),(90,81,3),(93,81,1),(11,82,1),(29,82,5),(23,83,2),(57,84,1),(58,84,5),(76,84,2),(14,85,1),(44,85,2),(60,85,4),(78,85,5),(84,85,3),(9,86,4),(31,86,3),(43,86,5),(75,86,4),(77,86,5),(83,86,4),(98,86,2),(7,87,3),(39,87,2),(89,87,3),(30,88,2),(62,88,2),(3,89,1),(28,89,2),(94,89,2),(13,90,2),(25,90,4),(58,90,1),(13,91,3),(34,91,3),(48,91,3),(82,91,4),(2,92,5),(4,92,2),(37,92,4),(46,92,5),(62,92,4),(100,92,3),(43,93,5),(57,93,2),(65,93,4),(91,93,3),(97,93,1),(2,94,5),(63,94,5),(84,94,4),(88,94,3),(1,95,1),(81,95,2),(2,96,5),(73,96,1),(80,96,4),(53,97,5),(64,97,5),(93,97,3),(16,98,5),(77,98,2),(83,98,2),(19,99,1),(36,99,5),(38,99,3),(53,99,3),(87,99,2),(26,100,2);
/*!40000 ALTER TABLE `product_rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-27 22:33:18
