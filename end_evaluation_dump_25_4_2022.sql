-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: online_shopping
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Temporary view structure for view `all_products`
--

DROP TABLE IF EXISTS `all_products`;
/*!50001 DROP VIEW IF EXISTS `all_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_products` AS SELECT 
 1 AS `product_id`,
 1 AS `Product_name`,
 1 AS `Price`,
 1 AS `GST_Percentage`,
 1 AS `Discount_Percentage`,
 1 AS `Total_Available_Stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `average_cost_of_orders_for_each_day`
--

DROP TABLE IF EXISTS `average_cost_of_orders_for_each_day`;
/*!50001 DROP VIEW IF EXISTS `average_cost_of_orders_for_each_day`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `average_cost_of_orders_for_each_day` AS SELECT 
 1 AS `date(transaction_time)`,
 1 AS `average_cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `complains`
--

DROP TABLE IF EXISTS `complains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complains` (
  `complaint_number` int NOT NULL AUTO_INCREMENT,
  `customer_ID` int DEFAULT NULL,
  `order_ID` int DEFAULT NULL,
  `service_employee_id` int DEFAULT NULL,
  `date_of_creation` timestamp NULL DEFAULT NULL,
  `details` varchar(250) DEFAULT NULL,
  `resolved` char(1) DEFAULT NULL,
  PRIMARY KEY (`complaint_number`),
  KEY `customer_ID` (`customer_ID`),
  KEY `order_ID` (`order_ID`),
  KEY `service_employee_id` (`service_employee_id`),
  CONSTRAINT `complains_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `complains_ibfk_2` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`order_ID`),
  CONSTRAINT `complains_ibfk_3` FOREIGN KEY (`service_employee_id`) REFERENCES `service_employee` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complains`
--

/*!40000 ALTER TABLE `complains` DISABLE KEYS */;
INSERT INTO `complains` VALUES (1,50,12,48,'2021-07-12 15:53:12','extra','N'),(2,95,28,31,'2021-07-12 15:53:12','not delivered','Y'),(3,91,18,26,'2021-07-12 15:53:12','wrong item','N'),(4,88,31,39,'2021-07-12 15:53:12','bad product','Y'),(5,81,39,25,'2021-07-12 15:53:12','extra','Y'),(6,18,17,43,'2021-07-12 15:53:12','not working','Y'),(7,62,13,21,'2021-07-12 15:53:12','spam bot refund','Y'),(8,95,28,45,'2021-07-12 15:53:12','refund me plox','Y'),(9,35,9,48,'2021-07-12 15:53:12','GIMME MONEEE','N'),(10,55,11,48,'2021-07-12 15:53:12','Delivery took time','N'),(11,101,52,48,'2022-04-23 13:02:18','not overclockable enough','N'),(12,101,52,48,'2022-04-23 13:02:27','resolve','N'),(14,102,55,21,'2022-04-23 14:56:16','Not delivered yet!','Y'),(15,102,55,21,'2022-04-23 14:56:25','where is it?','Y'),(17,102,55,21,'2022-04-23 14:56:38','need order!','Y'),(18,102,56,47,'2022-04-23 15:13:01','it\'s too good, can\'t see loading screens now','N'),(19,102,56,25,'2022-04-23 15:13:07','why is it so good?','N'),(20,102,59,43,'2022-04-24 11:24:58','testing','N'),(21,102,59,45,'2022-04-24 11:25:01','test','N');
/*!40000 ALTER TABLE `complains` ENABLE KEYS */;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `Coupon_Code` varchar(30) NOT NULL,
  `Discount_Percentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Coupon_Code`),
  CONSTRAINT `coupon_chk_1` CHECK ((`discount_percentage` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES ('1',10.32),('10',23.62),('11',21.25),('12',28.90),('13',24.85),('14',11.23),('15',26.77),('16',2.45),('17',22.47),('18',22.16),('19',27.68),('2',6.64),('20',19.53),('21',25.18),('22',18.29),('23',14.30),('24',13.31),('25',7.78),('26',27.32),('27',29.71),('28',26.11),('29',26.52),('3',9.92),('30',20.42),('31',4.66),('32',1.46),('33',7.91),('34',3.93),('35',26.93),('36',28.00),('37',14.84),('38',18.14),('39',4.37),('4',22.70),('40',2.17),('41',14.12),('42',4.41),('43',10.95),('44',16.88),('45',12.48),('46',19.43),('47',9.94),('48',21.41),('49',23.49),('5',21.71),('50',12.22),('51',27.84),('52',22.63),('53',26.94),('54',28.94),('55',20.04),('56',6.66),('57',26.00),('58',26.92),('59',17.60),('6',27.84),('60',21.35),('61',15.93),('62',16.22),('63',10.58),('64',13.05),('65',8.62),('66',20.51),('67',6.51),('68',21.74),('69',13.92),('7',7.03),('70',21.07),('71',14.47),('72',11.56),('73',5.63),('74',27.86),('75',25.87),('76',21.18),('77',22.95),('78',4.19),('79',10.85),('8',18.15),('80',13.86),('81',26.47),('82',23.50),('83',3.12),('84',21.62),('85',12.44),('86',6.84),('87',27.09),('88',25.43),('89',21.26),('9',29.24),('90',19.85),('91',6.54),('92',28.13),('93',29.44),('94',28.70),('95',11.79),('96',20.61),('97',1.69),('98',11.09);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` int NOT NULL AUTO_INCREMENT,
  `First_name` varchar(30) NOT NULL,
  `Last_name` varchar(30) NOT NULL,
  `House_number` decimal(30,0) DEFAULT NULL,
  `Locality` varchar(30) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `pincode` decimal(6,0) DEFAULT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `email_address` (`email_address`),
  KEY `email_password_index_customer` (`email_address`,`password`),
  CONSTRAINT `customer_chk_1` CHECK ((`House_number` >= 0)),
  CONSTRAINT `customer_chk_2` CHECK ((`pincode` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Shurlock','Sadgrove',3978,'Eastlawn','Na Muen',872979,'ssadgrove0@sitemeter.com','LJc5AVRCdR'),(2,'Allin','Millward',77919,'Gerald','Erie',469017,'amillward1@techcrunch.com','Cg8hpuQk2zK'),(3,'Algernon','Clemoes',2140,'Menomonie','Mulan',739352,'aclemoes2@stumbleupon.com','teh1Xj'),(4,'Mariele','Eady',3,'Montana','Riyadh',674094,'meady3@topsy.com','n3pq9BM'),(5,'Forrest','Silcock',5,'Barnett','Ponikiew',288549,'fsilcock4@1688.com','wGmQ0qd'),(6,'Cherilyn','Stubbs',1,'Oriole','Talacogon',326232,'cstubbs5@abc.net.au','K4B2VeOX'),(7,'Pegeen','Belfelt',5932,'Kenwood','Toritama',109048,'pbelfelt6@npr.org','j2XLLuhoZ3O'),(8,'Niki','Shaddock',2102,'Linden','Al Metlaoui',449833,'nshaddock7@cloudflare.com','8z4SFkBS3lcb'),(9,'Agneta','Shawcross',7,'Meadow Valley','Štítina',607446,'ashawcross8@1und1.de','c5hGjO5lHyK'),(10,'Murry','Shepstone',3359,'Esker','Luoshanchuan',791387,'mshepstone9@prweb.com','1roHumY'),(11,'Shawnee','Mertin',246,'Sloan','Zhoupi',181088,'smertina@a8.net','CpHo4JRlq'),(12,'Tadeas','Rennels',8863,'Dakota','Menghai',492017,'trennelsb@istockphoto.com','wgVf82aDC'),(13,'Feodor','Kernermann',93674,'Karstens','Tukan',852903,'fkernermannc@disqus.com','SWQJXPM7Ag'),(14,'Wadsworth','Scatchar',4503,'Oak Valley','Girihieum',634139,'wscatchard@economist.com','MhhrEC'),(15,'Gabrielle','Kwiek',5021,'Transport','Taquile',988281,'gkwieke@arstechnica.com','WIHkBC1J9kWv'),(16,'Richmond','Pimblott',4,'Talisman','Ducheng',802493,'rpimblottf@amazon.co.jp','kf82Cu1bD7'),(17,'Alberik','Galtone',47,'Arkansas','Le Lamentin',421659,'agaltoneg@e-recht24.de','3DiCYNMMD'),(18,'Cacilie','Gerriessen',821,'Pankratz','Laveiras',785517,'cgerriessenh@youtu.be','ONcE64l1iH'),(19,'Tabbi','O\'Sullivan',5956,'Southridge','Sinop',888060,'tosullivani@stumbleupon.com','tcONFUnZXF'),(20,'Lenore','Folshom',8,'Tony','Tatuí',658205,'lfolshomj@printfriendly.com','VuXYEb8tXAB'),(21,'Padraic','Cogle',64,'Melvin','Cumming',661872,'pcoglek@topsy.com','EvyCfgFKse'),(22,'Zolly','Malarkey',9438,'Acker','Svojat',411467,'zmalarkeyl@sakura.ne.jp','AnUdJjrAN7'),(23,'Judd','Langmead',797,'Browning','Courbevoie',393126,'jlangmeadm@timesonline.co.uk','YEZFQC9bONOH'),(24,'Dex','Posnett',4,'Havey','Río Tercero',996342,'dposnettn@walmart.com','gx4V7GL'),(25,'Jeralee','McGraffin',1,'Nelson','Gensi',235624,'jmcgraffino@psu.edu','fKenm2cCKwH5'),(26,'Alley','Gorner',78024,'Pennsylvania','Fort-de-France',516120,'agornerp@redcross.org','EWnPxB'),(27,'Rafe','Handyside',29511,'Old Shore','Nobeoka',348756,'rhandysideq@imgur.com','jceTSO'),(28,'Reena','Riccioppo',33882,'Superior','Seoul',933245,'rriccioppor@flickr.com','9Z32nhSHtuL'),(29,'Jodie','Dunderdale',7,'Buell','Bhola',784878,'jdunderdales@simplemachines.org','QGOwj4XQ8xqF'),(30,'Felita','Durno',656,'Shopko','Gwandu',749587,'fdurnot@icq.com','Mxrt3Yfp6VY'),(31,'Joel','Jewson',889,'Anzinger','El Benque',722249,'jjewsonu@state.gov','0wnexwJsAv'),(32,'Henderson','Choppen',46919,'Montana','Bhola',256803,'hchoppenv@usgs.gov','b8JQyr'),(33,'Odelia','Di Maria',7141,'Mitchell','Bilo',355193,'odimariaw@cdbaby.com','v4kprbjWShKD'),(34,'Otha','Petrecz',7,'Thackeray','Staraya Toropa',288586,'opetreczx@bravesites.com','yRJbQolb'),(35,'Earl','Side',8,'Del Mar','Changping',915489,'esidey@hp.com','VFIv5CCBl'),(36,'Casie','Grichukhin',87,'Fallview','Kurjan',823582,'cgrichukhinz@cdbaby.com','mowIb8k41XVc'),(37,'Demetri','Speechly',990,'Golf','Plato',158783,'dspeechly10@bluehost.com','gtiUH5uvDn'),(38,'Ruby','Atkyns',485,'Anthes','Donghoufang',269929,'ratkyns11@howstuffworks.com','ZqcGa5VNKG6x'),(39,'Jervis','Winfindine',3062,'Larry','Mae Ramat',124823,'jwinfindine12@dmoz.org','iceAecpqy7de'),(40,'Cindra','Hapke',1,'Fordem','Yazykovo',596481,'chapke13@lulu.com','iJkM6x1oBR'),(41,'Gaynor','Fernihough',399,'Loftsgordon','Socorro',500461,'gfernihough14@hao123.com','vTG49YIC1Vn'),(42,'Roseann','Cosstick',279,'Fieldstone','Dengzhou',574076,'rcosstick15@amazon.de','IV3hU2WAD'),(43,'Roberto','Pauluzzi',46772,'Del Sol','Kingersheim',978567,'rpauluzzi16@taobao.com','yGnqtDeYETkf'),(44,'Kellia','Wolfendell',22,'Kedzie','Uhniv',546114,'kwolfendell17@ocn.ne.jp','PqYGvrA'),(45,'Phineas','Vel',82739,'Sloan','Mossoró',793548,'pvel18@jalbum.net','tnQJcLi'),(46,'Lawrence','Wainscoat',17,'Maywood','Palmeira das Missões',289412,'lwainscoat19@last.fm','7I9MiqQskipQ'),(47,'Ruddie','Ivashkov',4,'Summerview','Třešť',496617,'rivashkov1a@nsw.gov.au','sPzc3XgAC'),(48,'Con','Rentoll',6,'Kropf','Wangfu',779298,'crentoll1b@reverbnation.com','poTRTk'),(49,'Bill','Rattery',4618,'Welch','Bác Ái',516646,'brattery1c@mapy.cz','FWmuWOu'),(50,'Nanette','Mahomet',83033,'Heath','Mossoró',146891,'nmahomet1d@usa.gov','KahdGEG'),(51,'Correna','Northcott',9736,'Arrowood','Monteiro',898761,'cnorthcott1e@omniture.com','nXpVHgs'),(52,'Blondelle','Tomadoni',37284,'Eastwood','Trollhättan',292747,'btomadoni1f@globo.com','n5ZIeU'),(53,'Wildon','McMylor',647,'Donald','Tsagaanchuluut',461551,'wmcmylor1g@yahoo.co.jp','ruTdgV6uNB7'),(54,'Clywd','Capstake',4574,'Ridge Oak','Sharkawshchyna',350734,'ccapstake1h@wikimedia.org','MorGhJ'),(55,'Zacharias','Adair',7,'Washington','Porsgrunn',619140,'zadair1i@shop-pro.jp','r8nqcFT'),(56,'Munroe','Tucsell',2062,'Kennedy','Sedlice',111241,'mtucsell1j@addtoany.com','pMIB7l'),(57,'Neville','Jemison',4,'New Castle','Yuannan',101129,'njemison1k@cbc.ca','qm3UUbgHQ'),(58,'Sherye','Hallatt',9070,'Garrison','Sedlice',181954,'shallatt1l@bravesites.com','OjTiRF2bMlXw'),(59,'Siffre','Christophersen',2,'Pearson','Banjar Tegal Belodan',567655,'schristophersen1m@mit.edu','aVcGtG8rKFa'),(60,'Carol-jean','Spurryer',8423,'Toban','Donetsk',683752,'cspurryer1n@gnu.org','AI8Bm7n'),(61,'Nefen','Biskup',67310,'Eggendart','Banjar Batuaji Kaja',511481,'nbiskup1o@microsoft.com','ciiU0ZniwO'),(62,'Morty','Guillon',3,'Schmedeman','Parachinar',957677,'mguillon1p@reuters.com','gObqXR'),(63,'Earlie','Chattaway',7,'1st','Luofang',105938,'echattaway1q@mayoclinic.com','8cgC9ewWYKr'),(64,'Leeann','Spight',95,'Florence','Marapat',626224,'lspight1r@com.com','R6Zr4jfg5kl'),(65,'Jory','Burgiss',7961,'Dorton','Jimsar',529984,'jburgiss1s@stanford.edu','tSGe5j7qT9p'),(66,'Jacky','Greenroad',13387,'Hoard','Huadi',144446,'jgreenroad1t@dion.ne.jp','Waa7rQSD'),(67,'Sada','Kynton',37,'American','Socos',743868,'skynton1u@elpais.com','CbrbVOvo8aJ'),(68,'Casie','Galvan',976,'Fieldstone','Jimsar',864940,'cgalvan1v@ocn.ne.jp','MmGAwOo0'),(69,'Burch','Camock',368,'Badeau','Turnišče',527190,'bcamock1w@umn.edu','93k2T3T'),(70,'Jobye','Louedey',9843,'Eliot','Varginha',275791,'jlouedey1x@infoseek.co.jp','tiG2Nw2'),(71,'Chris','Newlove',29,'Morningstar','Sokyryany',349060,'cnewlove1y@arizona.edu','rwHmvs85He8'),(72,'Merv','Gabbitis',0,'Springs','Žulová',982135,'mgabbitis1z@vistaprint.com','NjU8fuHxw2d'),(73,'Artair','Tuma',50,'Northfield','Ivanteyevka',358049,'atuma20@kickstarter.com','A99sqMfIT'),(74,'Ransell','Kleuer',1,'Fuller','Paty do Alferes',153669,'rkleuer21@booking.com','CG5FkHO'),(75,'Vincents','Searby',244,'Crest Line','Campo Maior',538432,'vsearby22@list-manage.com','MwHR7bn7sa69'),(76,'Caterina','Stanbury',31,'Farmco','Taipingxu',979496,'cstanbury23@jiathis.com','DTZRCjbnPkF'),(77,'Berthe','Rego',797,'Summerview','Semarapura',304521,'brego24@abc.net.au','hxFuV4CYZ'),(78,'Gothart','Sketch',2,'Magdeline','Qianxu Zhen',246951,'gsketch25@cafepress.com','iWhAxxtBA'),(79,'Owen','Venny',84,'Sutteridge','Jadów',803458,'ovenny26@jigsy.com','LqvVCbt'),(80,'Dene','McNysche',67,'Schurz','Lodja',933118,'dmcnysche27@aol.com','nygXhUL'),(81,'Franzen','Rubenczyk',300,'Maryland','Elói Mendes',422734,'frubenczyk28@twitter.com','oXvW0uF7'),(82,'Estelle','Smedley',14277,'Di Loreto','Sinajana Village',504227,'esmedley29@npr.org','N67Uu0UIek'),(83,'Dani','Boij',6,'Randy','Negla',546903,'dboij2a@discuz.net','JcoxcL'),(84,'Pancho','Meegan',5,'Lotheville','Lizhai',667428,'pmeegan2b@baidu.com','gQb207E'),(85,'Camile','Fincham',0,'Magdeline','Tsuyama',669930,'cfincham2c@stanford.edu','ZxH5f75flrd'),(86,'Tanner','Niesel',78,'Haas','Dahuaishu',439089,'tniesel2d@naver.com','oBMEba7'),(87,'Sidonnie','Poore',9350,'Victoria','Portorož',554343,'spoore2e@storify.com','kZOl7k9p1iA'),(88,'Xever','Rijkeseis',452,'Becker','San Andres',661761,'xrijkeseis2f@edublogs.org','9hJ8pkxIL6C'),(89,'Northrop','Milbank',6052,'Namekagon','Megati Kelod',290346,'nmilbank2g@parallels.com','G0GqWm'),(90,'Irena','Katzmann',4,'Jackson','Pining',200541,'ikatzmann2h@vimeo.com','trFZxj664LG'),(91,'Augie','Follos',64009,'Warrior','Chuqui Chuqui',667760,'afollos2i@skype.com','YFQ7Fn'),(92,'Patricio','Penni',219,'Vahlen','Puerto Barrios',108936,'ppenni2j@purevolume.com','5e7gmRn65'),(93,'Kerry','Wellstood',97,'Quincy','Bongandanga',505818,'kwellstood2k@wisc.edu','uQI3YGM3k2'),(94,'Bartlett','McKerley',3,'Tony','Sankoutang',906838,'bmckerley2l@imgur.com','soJghorq8v'),(95,'Janot','Iacopetti',2928,'Lunder','Nayak',827349,'jiacopetti2m@opera.com','CGfdkHTwvhnT'),(96,'Hayward','Haeslier',6941,'Maple Wood','San Juan',328237,'hhaeslier2n@reverbnation.com','ZGpBTJ'),(97,'Iolande','Windibank',85564,'Little Fleur','Farriar',533423,'iwindibank2o@imageshack.us','fPOKvZ1Xc'),(98,'Cassondra','Raycroft',6,'Mallard','Novo',681832,'craycroft2p@usatoday.com','Fy1GMxdci'),(99,'Minnaminnie','Pietrzak',512,'David','Stony Hill',413768,'mpietrzak2q@sohu.com','p9BXgU1qGcP8'),(100,'Maegan','Ranfield',50839,'4th','Pragen Selatan',482296,'mranfield2r@discovery.com','Cw8rOq0LnB'),(101,'Ryzen','Lover',53,'AMD','AMD',343,'ryze@n','ryze'),(102,'test','test',3434,'test','test',340,'test@test','test');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

--
-- Temporary view structure for view `customer_cart`
--

DROP TABLE IF EXISTS `customer_cart`;
/*!50001 DROP VIEW IF EXISTS `customer_cart`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_cart` AS SELECT 
 1 AS `Customer_ID`,
 1 AS `Product_ID`,
 1 AS `Product_Name`,
 1 AS `Quantity`,
 1 AS `Price_Per_Unit_Discount_and_Tax_Inclusive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_complaints`
--

DROP TABLE IF EXISTS `customer_complaints`;
/*!50001 DROP VIEW IF EXISTS `customer_complaints`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_complaints` AS SELECT 
 1 AS `customer_ID`,
 1 AS `customer_name`,
 1 AS `Employee_ID`,
 1 AS `employee_name`,
 1 AS `Employee_Department`,
 1 AS `Employee_Position`,
 1 AS `Order_ID`,
 1 AS `Date_of_Complaint_Creation`,
 1 AS `Complaint_Details`,
 1 AS `Resolution_Status`,
 1 AS `complaint_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!50001 DROP VIEW IF EXISTS `customer_order`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_order` AS SELECT 
 1 AS `Customer_ID`,
 1 AS `customer_name`,
 1 AS `Order_ID`,
 1 AS `Product_ID`,
 1 AS `Product_Name`,
 1 AS `Quantity`,
 1 AS `Total_Price`,
 1 AS `Delivery_address`,
 1 AS `Transaction_Time`,
 1 AS `Delivery_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `order_ID` int NOT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Warehouse_ID` int DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`order_ID`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `delivery_ibfk_4` FOREIGN KEY (`Warehouse_ID`) REFERENCES `warehouse` (`Warehouse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,58,5,4,'2022-04-24 11:37:11'),(2,84,16,1,'2021-01-11 09:00:48'),(3,86,79,4,'2021-10-01 03:39:27'),(4,77,28,1,'2021-08-24 15:44:00'),(5,64,73,2,'2021-06-22 18:58:38'),(6,90,51,4,'2021-05-08 00:55:40'),(7,53,69,5,'2021-09-23 15:27:51'),(8,84,5,5,'2021-10-27 07:41:29'),(9,83,19,2,'2021-07-20 05:55:57'),(10,68,67,5,'2021-07-12 15:53:12'),(11,87,38,2,'2021-11-04 07:44:25'),(12,82,72,1,'2021-09-12 07:37:00'),(13,95,33,1,'2021-10-04 12:40:05'),(14,68,26,3,'2021-10-11 10:51:34'),(15,79,55,2,'2021-05-25 12:00:14'),(16,96,52,3,'2021-01-06 23:57:40'),(17,84,65,5,'2021-01-22 11:37:16'),(18,52,81,1,'2021-08-04 04:20:15'),(19,92,29,2,'2021-10-01 07:15:00'),(20,64,20,1,'2021-05-10 07:20:46'),(21,99,62,5,'2021-08-03 11:48:15'),(22,76,59,1,'2021-11-19 00:24:05'),(23,79,43,1,'2021-02-07 01:12:39'),(24,79,35,2,'2021-03-13 07:27:41'),(25,52,79,4,'2021-02-24 10:07:47'),(26,95,24,2,'2021-01-16 11:45:18'),(27,59,66,4,'2021-02-24 07:25:33'),(28,56,11,4,'2021-06-27 00:01:48'),(29,62,69,2,'2021-07-16 05:46:12'),(30,69,21,2,'2022-04-23 14:16:40'),(31,53,10,1,'2021-12-29 07:34:54'),(32,55,10,3,'2021-09-02 12:34:13'),(33,90,91,3,'2021-08-27 15:11:48'),(34,66,79,5,'2021-02-05 14:27:10'),(35,74,53,5,'2021-04-19 22:59:36'),(36,72,43,1,'2021-07-29 09:31:46'),(37,74,31,5,'2021-06-06 01:30:47'),(38,91,69,5,'2021-02-20 22:57:28'),(39,60,27,1,'2021-06-20 16:25:24'),(40,54,58,5,'2021-03-16 06:14:30'),(41,76,11,2,'2021-05-28 10:06:39'),(42,57,88,1,'2021-05-29 12:13:28'),(43,95,46,3,'2021-11-07 20:49:04'),(44,58,15,3,'2022-04-24 11:37:12'),(45,97,63,5,'2021-10-07 14:33:40'),(46,67,12,4,'2021-03-15 22:30:19'),(47,61,54,4,'2021-10-19 12:52:55'),(48,82,49,5,'2021-05-18 23:31:46'),(49,79,46,2,'2021-06-12 01:36:42'),(50,57,60,3,'2021-04-26 19:22:32'),(51,54,101,1,'2022-04-23 12:57:44'),(52,58,101,1,'2022-04-24 11:37:12'),(53,87,101,1,'2022-04-23 12:59:20'),(54,58,4,1,'2022-04-24 11:37:13'),(55,58,102,1,'2022-04-24 11:37:13'),(56,97,102,1,'2022-04-23 15:15:58'),(57,80,102,1,'2022-04-23 16:05:54'),(58,63,102,4,NULL),(59,92,102,2,'2022-04-24 11:30:36');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;

--
-- Temporary view structure for view `delivery_guy`
--

DROP TABLE IF EXISTS `delivery_guy`;
/*!50001 DROP VIEW IF EXISTS `delivery_guy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `delivery_guy` AS SELECT 
 1 AS `Order_ID`,
 1 AS `Employee_ID`,
 1 AS `Delivery_date`,
 1 AS `Customer_address`,
 1 AS `Warehouse_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `delivery_partner`
--

DROP TABLE IF EXISTS `delivery_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_partner` (
  `Employee_ID` int NOT NULL,
  `Vehicle_ID` varchar(30) DEFAULT NULL,
  `Vehicle_Type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `delivery_partner_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partner`
--

/*!40000 ALTER TABLE `delivery_partner` DISABLE KEYS */;
INSERT INTO `delivery_partner` VALUES (51,'WA63LS3871','Bike'),(52,'MU16TE7580','Bike'),(53,'MJ64PW9232','Van'),(54,'MU47TZ6174','Bike'),(55,'BN51IB8337','Tempo'),(56,'JN68VM3359','Bike'),(57,'QV41IW8451','Tempo'),(58,'VQ54MO2556','Bike'),(59,'GG27HT7337','Van'),(60,'QM43AD2048','Tempo'),(61,'SZ50TI2162','Tempo'),(62,'RH48BV6512','Tempo'),(63,'CB42IM8233','Tempo'),(64,'ZK39KB6341','Bike'),(65,'VT51GT8301','Tempo'),(66,'WD34UM1403','Bike'),(67,'QX53BX5639','Tempo'),(68,'WK48MB2898','Tempo'),(69,'IV29WY5103','Bike'),(70,'OT75OR2418','Van'),(71,'GX98IJ7089','Tempo'),(72,'GD14SJ5149','Tempo'),(73,'XM28ZL9240','Van'),(74,'MG10MX4360','Tempo'),(75,'WX24FB4547','Van'),(76,'ES38NL9463','Bike'),(77,'AK31YP2140 ','Van'),(78,'VP17ZS3028 ','Van'),(79,'UI19VT4166 ','Tempo'),(80,'YT84YL7561 ','Tempo'),(81,'HT41OJ5604','Bike'),(82,'OP64GA5711','Bike'),(83,'AV62BO7211','Tempo'),(84,'ZM98CP3319','Bike'),(85,'QX42LV9819','Tempo'),(86,'RR39NW5372','Van'),(87,'IQ13VC4604','Tempo'),(88,'BJ74TX3469','Van'),(89,'GT80JW4653','Van'),(90,'BW86ON4594','Van'),(91,'IW22RP1633','Tempo'),(92,'VQ82XX3792','Van'),(93,'AK69KL9549','Van'),(94,'VD55VM9277','Van'),(95,'HQ40BI3920','Tempo'),(96,'BE83IM3967','Tempo'),(97,'ZQ61NH6892','Tempo'),(98,'HM51AB2565','Van'),(99,'MG27HB6980','Bike'),(100,'ST66ST7930','Van');
/*!40000 ALTER TABLE `delivery_partner` ENABLE KEYS */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Employee_ID` int NOT NULL AUTO_INCREMENT,
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
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Email_address` (`Email_address`),
  CONSTRAINT `employee_chk_1` CHECK ((`Pincode` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Leora','Hengoed',147502,'Polygender','Support','5.4','4','7/1/2021','1/25/2022','lhengoed0@theglobeandmail.com',98,'Nova','Mayantoc',59,1523251683,'ab8031efb80ee4e6476534a5045e4201'),(2,'Noach','Menault',125248,'Female','Services','1.1','3','6/3/2021','12/15/2021','nmenault1@ucsd.edu',7236,'Hazelcrest','Chambellan',7,5676013065,'5c77ccf130c16c6836bf2705d31e0889'),(3,'Renelle','Semorad',118603,'Female','Engineering','5.6','2','6/25/2021','6/18/2021','rsemorad2@guardian.co.uk',878,'Summerview','Tamuning-Tumon-Harmon Village',43,6346746623,'8462415a27e68056bfbd607cd857bfae'),(4,'first','second',226488,'Male','Human Resources','8.0','2','11/5/2021','4/2/2021','zcantwell3@discuz.net',2,'Ludington','Mabua',44510,7934004516,'33c8d1b6c448513f81061cb8305ab19b'),(5,'Gunner','Witchell',246769,'Male','Human Resources','8.4','4','6/15/2021','2/14/2022','gwitchell4@bloglines.com',3,'Florence','Boxholm',32,9551160774,'784594df2b649c3ab2f960a2effa46df'),(6,'Jedidiah','Samways',133745,'Female','Research and Development','5.6','5','10/9/2021','12/11/2021','jsamways5@edublogs.org',176,'Eastwood','Shangganshan',155,7354624494,'b4ad0a2ba12902ec4df3a666534bb622'),(7,'Delinda','Fallow',162340,'Male','Engineering','1.5','4','10/11/2021','7/1/2021','dfallow6@tamu.edu',37,'Dryden','Panji',16311,1194772704,'453615e313f968f7fddb49b879df3d33'),(8,'Matilda','Dannohl',117875,'Male','Engineering','2.6','2','7/27/2021','6/1/2021','mdannohl7@google.ru',33484,'Hollow Ridge','Selaawi',718,6674210495,'8c4e8902d5a5e1551636c76ed4edbef4'),(9,'Marys','Hune',113945,'Male','Research and Development','4.3','2','10/25/2021','12/28/2021','mhune8@tinypic.com',56670,'Monument','Gulcha',2439,3971658563,'4adb81dcb292360cdca3cfb2ed26587b'),(10,'Malinde','Pendleberry',171612,'Female','Sales','4.0','4','3/10/2021','8/8/2021','mpendleberry9@ovh.net',76,'Barby','Tuka',31,1037639269,'5c4f7feb54069b3e8ac281385d2b83ec'),(11,'Hernando','Villar',223005,'Bigender','Accounting','1.0','2','8/26/2021','11/1/2021','hvillara@huffingtonpost.com',11,'Delladonna','Naranjo',14,5189683343,'1e72f355fd95217e044f8e8431fd6866'),(12,'Collie','Murtagh',285470,'Female','Accounting','8.3','2','9/9/2021','1/27/2022','cmurtaghb@whitehouse.gov',53,'Gina','Novokubansk',5,1904148228,'7a59810fa22e85ab402e0c05ddaa644b'),(13,'Larisa','Blazejewski',193621,'Male','Services','4.4','3','12/17/2021','10/10/2021','lblazejewskic@microsoft.com',3861,'Monterey','Noupoort',61,8617507189,'4476e3bea207c838d36c690f24468c5c'),(14,'Jade','Orht',142527,'Female','Legal','6.3','2','5/2/2021','8/29/2021','jorhtd@desdev.cn',12290,'Eggendart','Gubeikou',4,9436719991,'be100b249350a99445233ece0655c535'),(15,'Laurianne','Gregore',183394,'Female','Legal','6.6','4','8/11/2021','12/17/2021','lgregoree@ihg.com',8,'Utah','Washington',4157,2029518177,'e1500673ea6d6c7790dfb039f3bde957'),(16,'Laureen','Brymner',99872,'Male','Business Development','3.3','2','3/6/2021','1/9/2022','lbrymnerf@creativecommons.org',28406,'Aberg','Shumyachi',46,1531798105,'9ccdefe851867ec3ef7a429aac0e915a'),(17,'Norean','Boise',274231,'Female','Marketing','7.8','1','10/21/2021','8/26/2021','nboiseg@bbb.org',9302,'Warbler','Hanover',10,7438472436,'b405a0550ea1dac3052a184996e96778'),(18,'Gusty','Roback',82145,'Genderqueer','Marketing','1.1','4','7/24/2021','2/28/2021','grobackh@amazon.de',10,'Knutson','Novi Karlovci',7521,3612829629,'a6c1e05ec6995a62596d155c8b989c91'),(19,'Juliet','Verdy',191945,'Male','Sales','9.4','2','11/2/2021','8/16/2021','jverdyi@soup.io',647,'Delaware','Aygeshat',1264,8113865094,'77c71247493e47e6ea6f8c446fe16015'),(20,'Camey','Barden',185803,'Female','Marketing','8.3','3','1/18/2022','8/13/2021','cbardenj@infoseek.co.jp',8,'Ridgeview','Mamponteng',7,4646782770,'b58dbe9065cf00f05ccab87a61d03b78'),(21,'Reginauld','Feares',113206,'Female','Research and Development','6.0','1','4/12/2021','11/16/2021','rfearesk@people.com.cn',72,'7th','Jianping',61,5648595084,'1623f10ea7a6a563790de968729fd49e'),(22,'Francesca','Glanders',148811,'Female','Training','6.8','3','1/25/2022','10/25/2021','fglandersl@hp.com',1786,'Spaight','Sumilao',37288,5872049061,'f4d84d361771679c5bb1f45c502a6963'),(23,'Armando','Whillock',185751,'Female','Support','1.7','1','5/19/2021','4/4/2021','awhillockm@ucoz.com',8547,'Thompson','Bibrka',40,5603773343,'c62160000047d543d0e6ce067e5097fd'),(24,'Raddie','Ledington',153511,'Female','Training','4.9','5','10/29/2021','11/10/2021','rledingtonn@shutterfly.com',2045,'Maryland','Isheyevka',3,1993601504,'b22e0daab4f24d0cc8223a97e2c18b76'),(25,'Kristy','MacGraith',114773,'Female','Training','8.0','3','11/21/2021','4/26/2021','kmacgraitho@bravesites.com',219,'8th','Berëzovka',34863,8363085007,'f4df66fa058e6f9e325f48d60a5ef6ab'),(26,'Louisa','Sommerled',259875,'Male','Business Development','1.7','3','11/21/2021','2/1/2022','lsommerledp@webnode.com',841,'Meadow Ridge','Levallois-Perret',9883,6074482127,'f655c49aaa9685291f3cd83c96d04f82'),(27,'Wilek','Hacker',144149,'Male','Research and Development','4.8','5','5/20/2021','9/4/2021','test@testing',25,'Heffernan','Piggs Peak',6689,5489177257,'test'),(28,'Kara-lynn','Pumphrey',142268,'Female','Services','9.1','2','11/28/2021','1/26/2022','kpumphreyr@goo.ne.jp',3,'Kedzie','Gaopu',5,3875401508,'5f96b34b2112cb5ef8296d43c781d1a6'),(29,'Hadria','Bjorkan',234865,'Male','Services','5.5','2','7/27/2021','1/8/2022','hbjorkans@usda.gov',218,'Vahlen','Gravataí',95247,7452282102,'b55918c1aa457b77a6fd96e7224e6cac'),(30,'Cordie','Snarr',216098,'Female','Business Development','1.1','4','11/28/2021','10/27/2021','csnarrt@phpbb.com',807,'Meadow Vale','Roma',2,2615980377,'14b84530ea6eb4d10caa44543a833e93'),(31,'Mahala','O\'Mailey',245979,'Male','Legal','5.3','3','8/29/2021','11/7/2021','momaileyu@ibm.com',5592,'Calypso','Tsengel',853,6652515955,'0bbe7637469fa1169553184c7445d858'),(32,'Aeriel','Tutchell',94861,'Female','Product Man ment','6.4','4','3/21/2021','3/30/2021','atutchellv@npr.org',77,'Old Gate','Tucson',4840,5201102191,'8f8b10b0339b9235c8bfc25748f5ebfa'),(33,'Joshua','Burnham',184501,'Genderfluid','Business Development','6.1','4','8/22/2021','12/4/2021','jburnhamw@xrea.com',50153,'Independence','Caminauit',1930,7127359769,'3afa2f9e22b37c6836a8f77382227b5d'),(34,'Benoite','Treagust',258512,'Female','Legal','7.1','4','10/1/2021','7/29/2021','btreagustx@people.com.cn',48786,'Waxwing','Limón',6,3138700945,'c465e342403bce4e5653f242b90dcd10'),(35,'Joly','Cordeau',214068,'Female','Marketing','6.7','1','12/13/2021','9/19/2021','jcordeauy@usnews.com',39,'Ramsey','Baiyin',28,4092748289,'1b9e09645aa7ca00652e902af9d7fa26'),(36,'Anica','Pane',241748,'Male','Marketing','9.9','2','12/28/2021','11/20/2021','apanez@posterous.com',702,'La Follette','Barobo',7,9481290792,'d6b067ef12295c431b6cfe5b9a2f832b'),(37,'Tiebold','Sneesbie',193797,'Male','Engineering','5.3','3','6/19/2021','6/30/2021','tsneesbie10@wisc.edu',8,'Doe Crossing','Nikolayevsk',850,7454288594,'4a71a5efdb75cc8edf858a656a74185d'),(38,'Bridgette','De Bischop',257522,'Non-binary','Marketing','6.1','2','1/21/2022','10/22/2021','bdebischop11@theguardian.com',45,'Corscot','Jingzhou',317,4231182839,'9f5454e27c8fbbd788b60e164769ec66'),(39,'Kim','Marke',231549,'Female','Marketing','4.4','5','5/31/2021','12/28/2021','kmarke12@dedecms.com',43,'Graedel','Conner',84,8951580854,'194534dcfdfc4422ae4adba1b9dd2bf5'),(40,'Torey','O\'Clery',210180,'Male','Accounting','1.8','1','8/1/2021','12/28/2021','toclery13@ask.com',38,'Stephen','Kharkhorin',11450,1373293919,'4b7014db7835da459fe7f6f01884f7f5'),(41,'Bernie','MacAne',221117,'Female','Accounting','5.5','4','10/2/2021','10/12/2021','bmacane14@paypal.com',4608,'Jana','Indaiatuba',52703,3944417076,'66039f495245f34ed1535784faf673ce'),(42,'Mufinella','Colthard',169121,'Female','Research and Development','6.7','1','3/30/2021','11/4/2021','mcolthard15@ucoz.ru',0,'Tomscot','Polanica-Zdrój',46417,9641970994,'c16cacccdaca1ed99743036a31190265'),(43,'Lacey','Dimock',201499,'Male','Legal','3.1','4','2/2/2022','9/14/2021','ldimock16@nature.com',77184,'Leroy','Ivry-sur-Seine',4,9335811774,'14cbff65434fc29971f2422f8b150080'),(44,'Leshia','O\'Cahill',160116,'Male','Services','6.1','3','11/7/2021','9/12/2021','locahill17@census.gov',903,'Pearson','Xinzhai',744,8081887214,'15b17fb4d48952afc6c80d7854241323'),(45,'Lily','Letten',203779,'Non-binary','Product Man ment','9.4','4','10/26/2021','9/18/2021','lletten18@technorati.com',6279,'Graedel','Niagara Falls',984,6526434001,'6c964eefeef9ef4ca5d6c50516eca8dc'),(46,'Dennison','Canny',291241,'Female','Human Resources','8.5','5','3/21/2021','8/22/2021','dcanny19@nytimes.com',6,'Almo','Naval',2,8845515594,'057d247d6bbbacaa5f4382fd6061875c'),(47,'Gusty','Kalisch',166633,'Female','Legal','4.0','1','12/4/2021','1/21/2022','gkalisch1a@ca.gov',5286,'Green Ridge','Manacsac',36,2949562486,'876ade9c2695c49da594fe96717bd25e'),(48,'Flossi','Fayter',247787,'Male','Human Resources','8.0','4','11/20/2021','3/8/2021','ffayter1b@baidu.com',77720,'Tennyson','Luopioinen',18,2454427450,'5eb58d482c28e72abf1dff29f319ed0b'),(49,'Almeria','Amy',213739,'Male','Sales','5.8','1','10/16/2021','4/5/2021','aamy1c@istockphoto.com',14,'Northland','Fuyang',708,2147589030,'0f46cd39ed4e34dbeca16e7bcc525663'),(50,'Robbie','Lowensohn',187758,'Female','Legal','1.3','5','4/8/2021','4/7/2021','rlowensohn1d@stanford.edu',5042,'Prairie Rose','Lashma',464,9345773365,'71860567fed217ef0adbcedadf35b50d'),(51,'Reamonn','Pikett',254670,'Female','Legal','9.5','5','3/3/2021','2/3/2022','rpikett1e@google.ca',92602,'Pleasure','Ust’-Koksa',173,2756209793,'6604e8a8d0e37f817eef2b947fff97a8'),(52,'Fleur','Parzizek',137194,'Male','Legal','9.0','3','11/5/2021','1/19/2022','fparzizek1f@nyu.edu',6,'Ohio','Löddeköpinge',0,4325633758,'bf88e89d960d70e83264a7a3335550dd'),(53,'Kyle','Mulder',181827,'Male','Marketing','8.9','3','3/6/2021','4/3/2021','kmulder1g@ucoz.ru',905,'Packers','Khashuri',88885,1463251312,'fe4365921c06d8e34ad12b78f778f2ca'),(54,'Marc','Oriel',186114,'Female','Product Man ment','7.5','3','10/27/2021','8/26/2021','moriel1h@goodreads.com',17492,'Division','Carcassonne',1389,4864865969,'3ac87a0bed02e07246206f2703bda5d3'),(55,'Carly','Penquet',186786,'Male','Sales','3.8','3','3/28/2021','1/21/2022','cpenquet1i@seesaa.net',17,'Declaration','Durham',3,9197573644,'f05039cd05f5cbbf76fbcb768a9a44ee'),(56,'Manolo','Walkingshaw',231721,'Male','Research and Development','5.3','5','3/29/2021','10/20/2021','mwalkingshaw1j@dell.com',34,'Goodland','La Roche-sur-Yon',73361,2677346093,'0be1ce7864777b1ffcbf8c57f9402ee1'),(57,'Honor','Farnin',247162,'Male','Training','3.8','3','4/15/2021','3/13/2021','hfarnin1k@yolasite.com',53907,'Mcguire','Bakau',7451,2746231762,'305fefe1a1040e95552ba3673b58418f'),(58,'Vicky','Franzewitch',161215,'Female','Services','5.1','2','11/26/2021','7/14/2021','vfranzewitch1l@hao123.com',5,'Buell','Nová Role',0,9206448170,'c23bc51a3cad4a5beef76eb86c762710'),(59,'Jory','Symms',188189,'Female','Sales','8.5','3','12/16/2021','3/13/2021','jsymms1m@cafepress.com',1855,'Waubesa','Rennes',47,1904444406,'0eba28fb6ded673f9557d7ce1586e3a4'),(60,'Leslie','Skala',108311,'Female','Human Resources','1.8','2','9/27/2021','4/7/2021','lskala1n@twitpic.com',5110,'Warner','Qinhe',7,2741121627,'40e25624d25f16744f4e85c9385a7252'),(61,'Marji','Mechic',184738,'Female','Product Man ment','6.6','2','1/25/2022','4/19/2021','mmechic1o@taobao.com',33302,'Cherokee','Šventoji',3033,7838750160,'504f640e718d2e6fe784bdecf39fecdc'),(62,'Bridie','Benton',222417,'Male','Sales','6.7','5','4/18/2021','6/29/2021','bbenton1p@oracle.com',8,'Lake View','Tayāsīr',80,2501171191,'b962a9874f584ead6e437219f27a4214'),(63,'Constantina','Kingscote',93229,'Female','Human Resources','3.1','2','1/6/2022','7/13/2021','ckingscote1q@cdbaby.com',58,'Blaine','Al Khāniq',5760,7339683012,'7dd27dae807abcd36437d1967fa0367d'),(64,'Bryant','Tinson',123123,'Female','Research and Development','6.2','1','5/8/2021','1/17/2022','btinson1r@dell.com',4,'Rowland','Na Klang',2,2347672403,'b545c6a94f5127dc224d260aae90d5ea'),(65,'Bevvy','Suatt',147229,'Female','Marketing','3.7','2','11/27/2021','10/26/2021','bsuatt1s@macromedia.com',27,'Ridgeway','Lenningen',1149,4554595487,'7fb775d3621a4af47ae77b419cd3d708'),(66,'Ellsworth','Barbosa',295682,'Female','Marketing','9.2','5','5/8/2021','1/31/2022','ebarbosa1t@posterous.com',49,'Darwin','Labuan',7,1254859767,'843371ff2225b8bafa8f637234347bb6'),(67,'Nola','Crabb',266851,'Female','Accounting','7.7','5','10/22/2021','11/13/2021','ncrabb1u@answers.com',1997,'Harbort','Peteranec',84879,9704376411,'8edc2c612c154ee786b8e1a86f249c9d'),(68,'Maudie','Hannaford',260872,'Female','Human Resources','9.0','3','2/1/2022','7/2/2021','mhannaford1v@desdev.cn',21785,'Bunker Hill','Aktogay',5,2256255732,'1a7505cc7ebc57e42a6ac1618dbf9d67'),(69,'Rorie','Arkill',248623,'Bigender','Legal','1.3','1','9/21/2021','12/8/2021','rarkill1w@soundcloud.com',4,'Michigan','Ozëry',2545,8367322695,'4e09df55d91ad18b02701dec10e659a8'),(70,'Therine','Alexsandrovich',240166,'Female','Human Resources','9.6','4','10/22/2021','3/16/2021','talexsandrovich1x@cbsnews.com',4,'Namekagon','Kylmäkoski',97281,9742531111,'93f8fc6cc034eece95481c7a119c90f2'),(71,'Carolyne','Steljes',179235,'Female','Training','9.1','2','12/20/2021','3/4/2021','csteljes1y@ftc.gov',71,'Roth','Yantan',3,6804071043,'5128a9154f77f131d7785af2061a2c72'),(72,'Gusty','Inkpin',123423,'Male','Support','8.1','2','9/27/2021','4/27/2021','ginkpin1z@china.com.cn',534,'Hoard','Francisco Villa',41377,6717610479,'48c73d56be755ebbe3eae9e67e6bc0b1'),(73,'Reba','Poetz',189319,'Female','Training','5.4','3','7/11/2021','11/16/2021','rpoetz20@cbsnews.com',94840,'Forster','Hyattsville',676,3015639330,'0e0c08900bd61bef41172d7f95d58f8d'),(74,'Torrey','Moberley',91975,'Male','Research and Development','4.3','2','10/11/2021','11/16/2021','tmoberley21@sitemeter.com',38903,'Lillian','Ratchasan',8,8111222314,'7fa25884b421f75e55f1ba5bb1f898bd'),(75,'Chere','Collinette',154481,'Male','Research and Development','7.6','3','1/2/2022','12/10/2021','ccollinette22@bravesites.com',4,'6th','Henglu',5991,2642858000,'179bbc7d2533c0f0ad6fb966242592de'),(76,'Remy','Bryce',158136,'Male','Business Development','9.7','5','12/27/2021','1/13/2022','rbryce23@disqus.com',89499,'Fair Oaks','Matiguás',63004,7916677535,'d97cf2fec3b1be92a3c43faea06fed97'),(77,'Lillian','Farncomb',153858,'Female','Human Resources','1.3','3','3/10/2021','6/21/2021','lfarncomb24@un.org',1771,'Twin Pines','Bull Savanna',3725,7904687292,'b27321a548aefe89691fe1cca9ad7c1d'),(78,'Boigie','Shawel',151159,'Female','Marketing','7.4','5','2/9/2022','10/5/2021','bshawel25@hexun.com',1626,'Rutledge','Krajan Dua Sumbersari',1,2674579489,'b79d86c5d17900cab8a8a923e7822c22'),(79,'Merwin','Horick',78085,'Female','Research and Development','2.3','5','5/12/2021','12/4/2021','mhorick26@loc.gov',90983,'Victoria','Liupai',32872,1545202453,'443db30f8021a05d7d45a7443cbc8752'),(80,'Alejandrina','Sharrem',246832,'Female','Product Man ment','3.5','1','10/12/2021','3/18/2021','asharrem27@hhs.gov',7,'Canary','Normandin',936,5747189716,'b79735e56130c280c1a92b2e6425dbbe'),(81,'Gannie','Foxwell',100472,'Female','Training','2.1','5','4/7/2021','2/12/2022','gfoxwell28@hp.com',79,'Maryland','Lazarevac',19,9658875905,'bd3d2d4ee26101935d9a63ea6b9614b9'),(82,'Eric','Dudhill',130679,'Female','Human Resources','8.0','5','11/11/2021','11/21/2021','edudhill29@biglobe.ne.jp',4340,'Spohn','Tayirove',6381,5498924243,'66d8351e2e8c2af524f33d195afa5615'),(83,'Oralee','McGilleghole',174012,'Female','Sales','5.9','5','12/28/2021','2/25/2022','omcgilleghole2a@free.fr',7381,'Maryland','Adela',661,9553147926,'14e59c426a7ac1164dfc25f3a4f2e91e'),(84,'Orbadiah','Baldock',229353,'Genderqueer','Legal','2.2','4','6/25/2021','1/28/2022','obaldock2b@yale.edu',132,'Debs','Chisong',257,4051834591,'102c7e472fa190682fa37d46294301f7'),(85,'Bliss','MacMeeking',146400,' nder','Training','9.9','1','11/20/2021','11/13/2021','bmacmeeking2c@nydailynews.com',8,'Dorton','Stockholm',22,7337561250,'3e478c8152d5d0f20845360e5989e433'),(86,'Laetitia','Sandison',253231,'Male','Legal','8.5','5','5/28/2021','7/18/2021','lsandison2d@google.com.hk',848,'Forest Run','Porsgrunn',63803,2327228418,'2025501a02097db323b277cf681f5114'),(87,'Ferris','Conor',201599,'Male','Marketing','2.5','4','12/27/2021','8/25/2021','fconor2e@dedecms.com',4,'Crowley','Gaoping',83,8735083667,'dbe32442b3c528548e101e5cb2f14300'),(88,'Viv','Matieu',253462,'Male','Marketing','4.5','2','12/20/2021','11/12/2021','vmatieu2f@eventbrite.com',731,'Russell','Naukšēni',79232,8625173212,'2807c4c9ff3ba58449f3e618d1a207e9'),(89,'Gerry','Bawle',173770,'Female','Business Development','7.7','4','3/26/2021','3/11/2021','gbawle2g@gnu.org',6586,'Express','Kota Kinabalu',35,7786150140,'a145a1b1318332fae11cc0d2926b9aba'),(90,'Guglielmo','Gilbard',128694,'Male','Support','8.2','1','7/1/2021','9/13/2021','ggilbard2h@edublogs.org',9,'Lien','Awka',6801,3166017638,'b10d65b95646ae7b58cff7aefcbdc7f2'),(91,'Jeanna','Chesnut',80303,'Male','Human Resources','3.7','1','11/13/2021','2/10/2022','jchesnut2i@nymag.com',802,'Forster','Jiaotan',45,2672826587,'bb6a360739586df8d44e6eaf04079d0e'),(92,'Stephanus','Wringe',220796,'Female','Services','3.8','5','5/8/2021','10/26/2021','swringe2j@drupal.org',23,'Rigney','Qingkou',9670,2224875712,'29ef4aacb207ab02c43dc59642e9c3b5'),(93,'Marty','Rummer',128525,'Male','Product Man ment','7.4','3','4/28/2021','1/20/2022','mrummer2k@1und1.de',24,'Lerdahl','Guadalupe Victoria',0,7126483626,'44950b8d7ea02cd072c4bc8899fa6887'),(94,'Eldin','Antonomoli',173941,'Male','Research and Development','6.0','4','10/27/2021','3/1/2021','eantonomoli2l@narod.ru',8397,'Summer Ridge','Mokotów',5,4463812880,'aaf8ea8f43d69ea4cda7ad7c5b65ac60'),(95,'Rosabella','Frazer',95709,'Female','Services','5.4','5','11/23/2021','4/9/2021','rfrazer2m@booking.com',6469,'Eagle Crest','Didi Lilo',64,9603518228,'c5a3b6aa355655e0486e51a4f9305adf'),(96,'third','fourth',223830,'Female','Training','1.0','2','1/5/2022','5/7/2021','rferriby2n@phoca.cz',1,'Fairfield','Rukem',984,4675432204,'d722680411c0e2acf3306ea6ef34ed35'),(97,'Perren','MacDougall',191027,'Polygender','Research and Development','4.0','3','5/18/2021','12/2/2021','pmacdougall2o@usgs.gov',94370,'Maryland','Velké Bílovice',68,3713970242,'8df8ef17b621418e057a6d196a034424'),(98,'Sky','Grimwood',252079,'Female','Support','4.3','2','12/29/2021','1/7/2022','sgrimwood2p@businesswire.com',646,'Sherman','Calubcub Dos',3,8494544427,'267d16e506e51cddd26a804be871edd3'),(99,'Ade','Mulqueen',211363,'Female','Engineering','3.2','3','10/29/2021','7/9/2021','amulqueen2q@mapquest.com',986,'Redwing','Svirsk',64,4114852416,'8d0288f48fc4415feb667759418424cb'),(100,'Leisha','Skelhorn',230553,'Female','Support','1.3','1','5/20/2021','11/16/2021','lskelhorn2r@newsvine.com',43,'Dakota','Marxog',2,6667684834,'516e4dbb5e7c0007ad7ddac3568b8389');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `passwd` BEFORE INSERT ON `employee` FOR EACH ROW if new.password is NULL THEN
        set new.password = MD5(new.email_address);
    end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `most_valuable_customer`
--

DROP TABLE IF EXISTS `most_valuable_customer`;
/*!50001 DROP VIEW IF EXISTS `most_valuable_customer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_valuable_customer` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `order_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `quantity` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`order_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`order_ID`),
  CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `order_products_chk_1` CHECK (((`quantity` > 0) and (`quantity` <= 10)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,55,9),(1,62,10),(1,73,3),(2,1,1),(2,46,9),(2,50,1),(3,21,9),(3,40,7),(3,87,5),(4,2,4),(4,81,8),(4,89,1),(5,80,9),(5,88,8),(5,92,5),(6,13,7),(6,14,7),(6,44,1),(7,3,5),(7,22,10),(7,70,7),(8,21,5),(8,25,2),(8,98,4),(9,10,7),(9,34,4),(9,79,5),(10,46,8),(10,72,2),(10,77,7),(11,11,3),(11,45,3),(11,90,1),(12,17,2),(12,42,1),(12,56,1),(13,31,4),(13,54,4),(13,84,10),(14,40,10),(14,77,9),(14,88,1),(15,12,6),(15,49,8),(15,90,5),(16,40,3),(16,45,5),(16,90,9),(17,12,7),(17,31,4),(17,55,5),(18,54,10),(18,55,3),(18,93,2),(19,9,5),(19,31,7),(19,76,10),(20,18,4),(20,65,8),(20,68,9),(21,77,8),(21,80,7),(22,10,7),(22,16,6),(23,67,9),(23,71,10),(24,48,1),(24,65,10),(25,20,2),(25,92,2),(26,63,7),(26,74,6),(27,82,8),(27,92,6),(28,17,1),(28,59,7),(29,39,1),(29,77,3),(30,27,1),(30,85,4),(31,53,7),(32,1,9),(33,90,2),(34,15,9),(35,61,8),(36,68,6),(37,59,2),(38,44,1),(39,56,8),(40,76,1),(41,3,10),(42,68,6),(43,30,5),(44,12,5),(45,67,1),(46,89,6),(47,82,5),(48,92,6),(49,97,8),(50,80,10),(51,105,10),(52,104,10),(53,2,6),(54,105,6),(55,106,8),(56,105,10),(56,106,10),(57,2,4),(58,1,7),(59,38,8),(59,90,5);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_ID` int NOT NULL AUTO_INCREMENT,
  `Total_Price` decimal(20,2) DEFAULT NULL,
  `Taxes` decimal(30,2) DEFAULT NULL,
  `Total_Discount_Percentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`order_ID`),
  CONSTRAINT `orders_chk_1` CHECK ((`Total_price` > 0)),
  CONSTRAINT `orders_chk_2` CHECK ((`Taxes` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,62089.49,27.65,9.13),(2,23387.82,8.85,24.41),(3,63751.88,24.84,6.42),(4,99487.90,16.38,18.82),(5,9520.38,14.08,7.94),(6,21205.05,9.00,10.30),(7,23811.41,20.66,13.95),(8,90866.35,10.86,18.89),(9,44023.32,14.33,7.83),(10,40075.63,11.44,21.78),(11,87547.27,29.90,17.12),(12,72935.72,21.99,27.74),(13,33007.60,29.53,7.67),(14,NULL,15.46,28.27),(15,73452.45,10.66,8.11),(16,31590.77,7.51,10.46),(17,72144.71,15.05,25.22),(18,35129.39,8.41,16.09),(19,23374.42,11.39,14.89),(20,28473.57,16.84,5.40),(21,68324.26,7.80,29.89),(22,8254.45,29.05,19.00),(23,85859.17,9.47,28.57),(24,14168.52,24.90,23.71),(25,68352.13,19.02,3.36),(26,6533.48,22.33,4.52),(27,5320.18,14.48,0.64),(28,69121.93,14.86,6.63),(29,15884.33,15.12,11.19),(30,61956.41,22.28,17.52),(31,38021.82,6.63,14.94),(32,64359.20,18.02,5.96),(33,37225.47,15.84,26.16),(34,36613.01,6.08,29.51),(35,62902.54,17.73,15.10),(36,16129.00,11.35,26.46),(37,80768.74,16.48,21.18),(38,30886.05,19.32,17.29),(39,48429.05,18.79,15.30),(40,78696.04,13.52,24.69),(41,30848.25,28.00,20.74),(42,19637.06,6.31,17.48),(43,35763.10,18.76,17.96),(44,5398.04,21.99,20.82),(45,79465.05,9.71,23.07),(46,94433.35,29.47,15.36),(47,77875.17,24.13,17.30),(48,6996.77,11.28,14.71),(49,9614.46,6.84,10.73),(50,74700.23,15.59,7.19),(51,10.00,0.00,50.00),(52,10.00,0.00,50.00),(53,5652.00,23.16,21.48),(54,6.00,0.00,50.00),(55,4000000.00,43.00,30.00),(56,5000010.00,21.50,40.00),(57,3768.00,23.16,21.48),(58,115864.00,15.17,7.41),(59,557803.00,19.12,17.54);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Price` decimal(15,2) DEFAULT NULL,
  `Product_name` varchar(50) DEFAULT NULL,
  `Discount_Percentage` decimal(5,2) DEFAULT NULL,
  `GST_percentage` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Product_ID`),
  CONSTRAINT `product_chk_1` CHECK ((`Price` > 0)),
  CONSTRAINT `product_chk_2` CHECK ((`Discount_Percentage` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,16552.00,'Eggplant Italian',7.41,15.17),(2,942.00,'Fruit Salad Deluxe',21.48,23.16),(3,9447.00,'Bread - White Mini Epi',2.31,14.24),(4,61251.00,'Mints - Striped Red',8.83,20.57),(5,78679.00,'Wine - Rioja Campo Viejo',2.34,16.99),(6,18914.00,'Myers Planters Punch',1.76,22.07),(7,58727.00,'Bread - Flat Bread',12.60,18.94),(8,71735.00,'Apricots Fresh',18.00,29.74),(9,74247.00,'Bag Stand',12.74,10.49),(10,72034.00,'Snapple Raspberry Tea',3.29,27.90),(11,15793.00,'Baking Soda',8.54,29.24),(12,69549.00,'Fruit Salad Deluxe',8.92,10.28),(13,91085.00,'Cassis',11.44,16.03),(14,60815.00,'Gatorade - Lemon Lime',6.25,21.63),(15,32790.00,'Soap - Hand Soap',1.63,27.95),(16,74123.00,'Bay Leaf',22.02,15.87),(17,69034.00,'Napkin - Dinner, White',13.55,15.99),(18,33445.00,'Milk - Condensed',16.50,12.90),(19,96694.00,'Soup - Campbells, Minestrone',2.66,19.49),(20,15979.00,'Cheese - St. Andre',29.61,24.32),(21,81962.00,'Chocolate - Milk, Callets',13.51,15.09),(22,81615.00,'Spice - Chili Powder Mexican',27.69,23.32),(23,68097.00,'Wine - Magnotta - Belpaese',24.69,28.81),(24,64854.00,'Banana - Green',22.35,23.40),(25,61979.00,'Mop Head - Cotton, 24 Oz',13.73,11.60),(26,8306.00,'Stock - Fish',3.29,18.68),(27,8534.00,'Pork - Belly Fresh',22.06,20.22),(28,89384.00,'Trout - Hot Smkd, Dbl Fillet',5.18,25.32),(29,94381.00,'Lettuce - Iceberg',21.79,11.70),(30,66285.00,'Wine - Beringer Founders Estate',5.53,17.57),(31,96495.00,'Potatoes - Idaho 100 Count',19.98,10.58),(32,47979.00,'Eggplant - Regular',12.71,24.69),(33,16131.00,'Filter - Coffee',4.31,22.93),(34,79284.00,'Soup Campbells Turkey Veg.',29.71,11.88),(35,33515.00,'Pail For Lid 1537',4.72,13.13),(36,95460.00,'Lamb - Rack',15.94,13.35),(37,42654.00,'Table Cloth 62x114 White',0.32,29.46),(38,68786.00,'Pepper Squash',24.27,14.68),(39,65685.00,'Shrimp - Black Tiger 13/15',16.40,25.16),(40,43017.00,'Pail For Lid 1537',5.95,24.51),(41,22447.00,'Quail - Whole, Bone - In',3.60,15.37),(42,47347.00,'Cheese - Parmesan Grated',15.34,22.79),(43,12829.00,'Bowl 12 Oz - Showcase 92012',28.15,29.95),(44,68820.00,'Cauliflower',18.57,19.76),(45,16547.00,'Puree - Mocha',5.02,19.77),(46,89756.00,'Wine - Magnotta - Pinot Gris Sr',18.86,11.22),(47,30059.00,'Salt - Rock, Course',27.74,24.62),(48,15181.00,'Bagel - Whole White Sesame',12.47,29.67),(49,47651.00,'Milk - 2%',3.44,16.51),(50,57290.00,'Crab - Dungeness, Whole',21.94,29.06),(51,59573.00,'Pasta - Cheese / Spinach Bauletti',5.71,26.52),(52,57201.00,'Mushroom - Shitake, Fresh',22.07,15.42),(53,14529.00,'Sparkling Wine - Rose, Freixenet',17.56,22.14),(54,23049.00,'Pepper - Orange',12.86,25.27),(55,9636.00,'Beets - Candy Cane, Organic',12.00,20.16),(56,69114.00,'Tart Shells - Savory, 2',11.27,19.57),(57,80604.00,'Wine - Ej Gallo Sierra Valley',6.67,17.50),(58,71394.00,'Appetizer - Mango Chevre',26.35,25.41),(59,72858.00,'Chips Potato Reg 43g',27.12,20.97),(60,62056.00,'Piping - Bags Quizna',16.33,22.73),(61,57113.00,'Thermometer Digital',1.98,28.26),(62,15529.00,'Tilapia - Fillets',14.46,18.32),(63,51707.00,'Yogurt - Banana, 175 Gr',26.18,17.07),(64,83264.00,'Rice - Jasmine Sented',14.83,20.65),(65,35132.00,'Appetizer - Escargot Puff',11.16,14.82),(66,72569.00,'Wine - Crozes Hermitage E.',24.32,21.41),(67,96424.00,'Anisette - Mcguiness',20.99,28.10),(68,83272.00,'Cheese - Comte',30.00,16.64),(69,83360.00,'Juice - Clamato, 341 Ml',19.11,25.19),(70,67248.00,'Mackerel Whole Fresh',18.36,13.09),(71,56141.00,'Persimmons',16.64,21.23),(72,55105.00,'Coffee - 10oz Cup 92961',1.52,10.11),(73,14035.00,'Wine - Saint - Bris 2002, Sauv',20.19,12.18),(74,25158.00,'Wine - Chablis 2003 Champs',16.08,12.15),(75,49659.00,'Wine - Red, Colio Cabernet',15.87,28.81),(76,18047.00,'Juice - Happy Planet',10.01,10.53),(77,89207.00,'Pork - Loin, Bone - In',13.43,13.72),(78,50439.00,'Mortadella',23.37,27.00),(79,40913.00,'Crab - Blue, Frozen',25.64,23.81),(80,47600.00,'Rice - Brown',25.27,13.11),(81,26673.00,'Spinach - Frozen',11.42,11.02),(82,94927.00,'Raisin - Dark',21.02,22.84),(83,96493.00,'Calaloo',15.38,23.16),(84,21884.00,'Island Oasis - Ice Cream Mix',1.40,14.14),(85,43312.00,'Mace',4.11,20.71),(86,96516.00,'Syrup - Monin, Amaretta',23.42,13.83),(87,15085.00,'Cheese - Brie, Cups 125g',13.37,28.74),(88,73511.00,'Sauce - Soya, Dark',27.04,12.81),(89,42089.00,'Pasta - Lasagne, Fresh',16.68,17.74),(90,1503.00,'Cake Circle, Foil, Scallop',10.81,23.55),(91,92620.00,'Cheese - Bakers Cream Cheese',15.80,10.96),(92,44635.00,'Russian Prince',14.80,29.05),(93,52063.00,'Bread - Italian Sesame Poly',23.63,19.30),(94,88405.00,'Sugar - Palm',24.54,19.32),(95,63232.00,'Lamb - Bones',24.19,22.64),(96,63512.00,'Energy Drink - Franks Pineapple',18.95,10.79),(97,22513.00,'Pork - Ham, Virginia',28.09,12.16),(98,50582.00,'Quail - Jumbo Boneless',22.76,10.12),(99,70128.00,'Cheese - Bocconcini',22.39,25.21),(100,70080.00,'Napkin White - Starched',4.08,29.40),(104,1.00,'Ryzen 9 5950X',50.00,0.00),(105,1.00,'Ryzen 9 5950',50.00,0.00),(106,500000.00,'Elden Hammer',30.00,43.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_stock_warehouse` AFTER INSERT ON `product` FOR EACH ROW insert into Stores values (1, new.product_id, 0) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `service_employee`
--

DROP TABLE IF EXISTS `service_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_employee` (
  `Employee_ID` int NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `service_employee_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_employee`
--

/*!40000 ALTER TABLE `service_employee` DISABLE KEYS */;
INSERT INTO `service_employee` VALUES (21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50);
/*!40000 ALTER TABLE `service_employee` ENABLE KEYS */;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `customer_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`customer_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `shopping_cart_chk_1` CHECK (((`Quantity` > 0) and (`Quantity` <= 10)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (5,50,1),(6,30,10),(7,25,2),(13,88,6),(26,34,10),(26,85,8),(35,2,1),(36,32,1),(36,78,5),(40,29,7),(41,73,10),(50,75,10),(50,91,10),(53,41,2),(58,76,5),(59,32,2),(70,31,4),(70,82,6),(72,23,10),(72,59,1),(72,90,10),(73,53,4),(74,83,10),(78,26,9),(79,61,10),(87,6,1),(93,68,4),(94,26,5),(98,36,3);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `Warehouse_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Stocks` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`Warehouse_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`Warehouse_ID`) REFERENCES `warehouse` (`Warehouse_ID`),
  CONSTRAINT `stores_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `stores_chk_1` CHECK ((`stocks` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,2,2055),(1,5,5760),(1,9,1932),(1,14,4455),(1,15,6817),(1,16,6221),(1,24,4360),(1,27,3423),(1,28,7875),(1,31,7103),(1,37,4272),(1,45,3791),(1,47,2504),(1,48,5160),(1,70,4441),(1,74,7687),(1,77,7694),(1,78,1634),(1,82,6195),(1,83,8827),(1,89,6410),(1,94,8783),(1,98,6973),(1,99,2219),(1,104,54990),(1,105,4974),(1,106,12),(2,5,135),(2,8,9310),(2,10,432),(2,13,7187),(2,21,1445),(2,22,5363),(2,29,3349),(2,30,368),(2,33,5873),(2,34,681),(2,38,7818),(2,41,3757),(2,50,893),(2,51,3961),(2,55,5119),(2,67,6080),(2,69,7495),(2,71,5397),(2,75,1366),(2,76,7928),(2,79,6310),(2,81,5282),(2,87,3446),(2,90,3322),(3,4,1544),(3,5,135),(3,7,9736),(3,11,4049),(3,17,8028),(3,18,7346),(3,42,7168),(3,44,5356),(3,52,8822),(3,54,4488),(3,59,6708),(3,60,3929),(3,61,956),(3,66,689),(3,68,5301),(3,72,3939),(3,86,1126),(3,88,9951),(3,91,3593),(3,92,7954),(3,97,883),(4,1,8953),(4,3,2456),(4,12,8410),(4,20,706),(4,25,2024),(4,26,60),(4,36,4710),(4,40,3861),(4,63,5724),(4,64,3507),(4,65,3562),(4,73,2149),(4,93,3895),(5,6,4640),(5,19,9332),(5,23,695),(5,32,3865),(5,35,3235),(5,39,7485),(5,43,569),(5,46,9581),(5,49,4683),(5,53,37),(5,56,7646),(5,57,8731),(5,58,5349),(5,62,2720),(5,80,9095),(5,84,2998),(5,85,8445),(5,95,2460),(5,96,2511),(5,100,4822);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_cart` AFTER UPDATE ON `stores` FOR EACH ROW if new.stocks = 0 THEN
        delete from Shopping_cart where Shopping_cart.product_id = new.product_id;
    end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `scalp_customers` AFTER UPDATE ON `stores` FOR EACH ROW if new.stocks < 100 then
            update Product set Product.Total_Discount_Percentage = Product.Total_Discount_Percentage/2;
        end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!50001 DROP VIEW IF EXISTS `suppliers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `suppliers` AS SELECT 
 1 AS `vendor_ID`,
 1 AS `Vendor_Name`,
 1 AS `Vendor_Address`,
 1 AS `Product_ID`,
 1 AS `Product_Name`,
 1 AS `Unit_price`,
 1 AS `GST_Percentage`,
 1 AS `Quantity_Supplied`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `Vendor_id` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Vendor_id`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`Vendor_id`) REFERENCES `vendor` (`Vendor_id`),
  CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `supplies_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,16,4),(1,60,3),(1,73,6),(1,85,5),(3,19,1),(3,30,7),(3,36,5),(3,79,8),(4,1,7),(5,49,9),(5,94,6),(6,91,9),(8,22,5),(10,55,4),(11,27,2),(12,65,7),(17,38,2),(19,18,7),(20,9,9),(24,70,3),(25,4,5),(25,17,7),(25,77,4),(27,74,2),(28,29,5),(28,99,9),(29,71,4),(30,83,4),(30,86,1),(31,7,7),(32,75,7),(34,33,9),(34,51,2),(36,20,9),(36,28,1),(40,87,5),(41,13,5),(41,69,2),(42,81,5),(44,5,3),(45,42,9),(46,44,8),(46,53,8),(47,26,9),(52,37,9),(56,23,9),(56,32,5),(57,3,6),(57,93,2),(58,58,4),(58,76,2),(58,97,7),(60,41,2),(60,54,7),(60,56,7),(60,82,2),(61,35,5),(61,84,3),(62,34,3),(63,62,6),(63,63,6),(63,89,8),(65,40,9),(66,45,3),(67,12,7),(68,39,3),(69,95,7),(70,61,4),(70,66,4),(71,15,1),(71,57,8),(72,64,8),(73,46,7),(78,80,1),(79,50,8),(81,24,2),(81,72,7),(81,100,2),(82,96,8),(83,2,7),(83,31,6),(83,48,3),(83,98,3),(84,14,4),(84,90,1),(86,59,6),(86,67,6),(86,88,1),(87,21,8),(89,6,4),(89,68,2),(90,10,4),(90,52,8),(91,8,1),(97,11,6),(98,43,3),(99,47,4),(100,25,2),(100,78,4),(100,92,6),(101,3,777),(101,5,100),(101,104,55000),(101,105,5000),(102,106,30);
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `order_ID` int NOT NULL,
  `Payment_Method` varchar(30) DEFAULT NULL,
  `Transaction_Status` tinyint(1) DEFAULT NULL,
  `transaction_time` timestamp NULL DEFAULT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Coupon_Code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Coupon_Code` (`Coupon_Code`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`Coupon_Code`) REFERENCES `coupon` (`Coupon_Code`),
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'Net Banking',1,'2021-07-18 17:19:53',40,'6'),(2,'Card',1,'2021-08-13 16:00:53',68,'7'),(3,'Net Banking',1,'2021-09-30 18:26:52',44,'8'),(4,'UPI',0,'2021-09-08 22:53:11',38,'9'),(5,'UPI',1,'2021-10-06 08:39:50',97,'10'),(6,'UPI',1,'2021-04-17 02:04:30',31,'11'),(7,'UPI',1,'2021-03-27 20:22:38',29,'12'),(8,'UPI',1,'2021-01-19 17:55:37',39,'13'),(9,'Card',1,'2021-03-08 00:16:42',35,'14'),(10,'Net Banking',0,'2021-01-17 21:12:42',24,'15'),(11,'Net Banking',1,'2021-08-25 01:47:05',55,'16'),(12,'UPI',0,'2021-09-12 01:21:13',50,'17'),(13,'Net Banking',1,'2021-02-09 12:15:03',62,'18'),(14,'Card',1,'2021-05-04 17:44:35',2,'19'),(15,'UPI',1,'2021-03-11 21:44:14',39,'20'),(16,'Net Banking',0,'2021-07-19 08:20:36',81,'21'),(17,'Card',1,'2021-12-07 13:17:40',18,'22'),(18,'UPI',0,'2021-12-19 07:01:29',91,'23'),(19,'UPI',0,'2021-12-04 21:49:53',43,'24'),(20,'Net Banking',0,'2021-04-22 18:57:13',95,'25'),(21,'Card',0,'2021-12-10 11:02:24',8,'26'),(22,'Card',1,'2021-10-07 17:19:36',91,'27'),(23,'Net Banking',0,'2021-10-26 09:23:18',25,'28'),(24,'Card',1,'2021-06-14 22:45:18',82,'29'),(25,'Card',1,'2021-11-28 17:37:52',70,'30'),(26,'Card',1,'2021-08-03 09:08:08',34,'31'),(27,'UPI',1,'2021-07-10 03:11:59',90,'32'),(28,'UPI',1,'2021-06-17 06:34:49',95,'33'),(29,'UPI',0,'2021-09-14 01:44:32',46,'34'),(30,'Net Banking',0,'2021-05-06 17:39:31',55,'35'),(31,'Card',0,'2021-07-24 02:01:55',88,'36'),(32,'UPI',0,'2021-05-07 10:03:26',58,'37'),(33,'Net Banking',0,'2021-04-12 20:05:38',35,'38'),(34,'Card',0,'2021-04-25 07:20:02',32,'39'),(35,'Net Banking',1,'2021-07-31 23:06:23',19,'40'),(36,'Card',1,'2021-08-17 14:35:20',34,'41'),(37,'UPI',0,'2021-01-23 03:30:00',52,'42'),(38,'Net Banking',1,'2021-09-13 17:09:53',18,'43'),(39,'Net Banking',1,'2021-01-17 21:40:36',81,'44'),(40,'UPI',0,'2021-01-08 19:57:01',29,'45'),(41,'Card',0,'2021-01-10 12:07:50',21,'46'),(42,'UPI',0,'2021-02-24 08:09:31',11,'47'),(43,'UPI',1,'2021-01-24 00:10:28',27,'48'),(44,'Card',0,'2021-11-02 01:57:11',43,'49'),(45,'Card',0,'2021-01-09 04:48:21',98,'50'),(46,'Net Banking',0,'2021-09-07 05:03:25',92,'51'),(47,'Net Banking',1,'2021-05-12 11:24:14',75,'52'),(48,'UPI',0,'2021-10-14 00:25:32',40,'53'),(49,'UPI',0,'2021-03-11 12:56:47',57,'54'),(50,'UPI',0,'2021-04-08 00:27:30',5,'55'),(51,'test',1,'2022-04-23 12:57:44',101,NULL),(52,'test',1,'2022-04-23 12:58:05',101,NULL),(53,'test',1,'2022-04-23 12:59:20',101,NULL),(54,'test',1,'2022-04-23 14:23:49',4,NULL),(55,'test',1,'2022-04-23 14:56:06',102,NULL),(56,'test',1,'2022-04-23 15:12:43',102,NULL),(57,'test',1,'2022-04-23 16:05:09',102,NULL),(58,'test',1,'2022-04-23 16:06:07',102,NULL),(59,'test',1,'2022-04-24 11:24:42',102,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `Vendor_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `Plot_number` decimal(30,0) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `pincode` decimal(6,0) DEFAULT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`Vendor_id`),
  UNIQUE KEY `email_address` (`email_address`),
  KEY `email_password_index_vendor` (`email_address`,`password`),
  CONSTRAINT `vendor_chk_1` CHECK ((`Plot_number` >= 0)),
  CONSTRAINT `vendor_chk_2` CHECK ((`pincode` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Hester','Goldsbrough',6,'As Saffānīyah',8335,'hgogh0@techcrunch.com','E9exn7Utg'),(2,'Phaidra','Gethen',38535,'Kabongan Kidul',8060,'pgethen1@usatoday.com','ithXXi0YuzZ'),(3,'Hardy','Matthews',7515,'Marly',4054,'hmatthews2@cafepress.com','Y0EPB87Eu5u'),(4,'Sheela','Lagne',21,'Summerside',1141,'slagne3@disqus.com','EUYEUBa'),(5,'Marci','Percy',2,'Bambari',44764,'mpercy4@google.ru','dV0rSuF8wo'),(6,'Lenci','Fortnon',371,'Cilampuyang',363,'lfortnon5@dot.gov','Zq7YcjflLkhn'),(7,'Biddie','Ruusa',87412,'Dijon',499,'bruusa6@wikimedia.org','ufMTzPQr'),(8,'Jenilee','Sale',39,'Baimangpu',6511,'jsale7@paypal.com','Iiadc6J'),(9,'Concordia','Lushey',10376,'El Paso',95,'clushey8@so-net.ne.jp','BBBAPz8I6eK'),(10,'Patty','Weatherburn',3966,'Pura',1,'pweatherburn9@bravesites.com','MSUcEk'),(11,'Blanch','Floyde',2053,'Caohezhang',73266,'bfloydea@hc360.com','avnOxWS'),(12,'Perry','Wavell',85,'Arfará',6,'pwavellb@dion.ne.jp','EmqvVPu4GV'),(13,'Crista','Imos',845,'Francisco I Madero',48,'cimosc@bloomberg.com','NwkhdxF'),(14,'Uriah','Esby',724,'Andapa',22,'uesbyd@icio.us','5Mr7ZLGfy'),(15,'Arvin','Emons',83,'Huanglong',27829,'aemonse@nasa.gov','rpPnQpMvVro'),(16,'Orlan','Cheeney',7,'Esposende',74,'ocheeneyf@newsvine.com','LLCW1F'),(17,'Dov','Beiderbecke',935,'Carreira',88,'dbeiderbeckeg@typepad.com','IaUWIylEv'),(18,'Kaia','Alpes',215,'Mīrpur Māthelo',358,'kalpesh@quantcast.com','0IqSEVBk'),(19,'Amalle','Vane',6,'Muararupit',9,'avanei@fc2.com','ogXfI3'),(20,'Myrtia','McPhillips',0,'Phu Kradueng',922,'mmcphillipsj@sina.com.cn','7t432S2ibgJK'),(21,'Moria','Cloake',268,'Hujirt',58,'mcloakek@biglobe.ne.jp','QYQJCB'),(22,'Nedi','Blaasch',66,'Boljevci',1,'nblaaschl@sourceforge.net','bfSzafP9i'),(23,'Cori','Montes',13,'Castelo',1986,'cmontesm@wisc.edu','YwuCLh'),(24,'Gayelord','Lillee',84,'Ḩawallī',17202,'glilleen@lulu.com','afYZyoR'),(25,'Lucila','Juniper',589,'Toubao',854,'ljunipero@reference.com','NVm1qX5h0d'),(26,'Shepherd','Gronowe',6,'Porsgrunn',3,'sgronowep@de.vu','WmtMVCvMa'),(27,'Lancelot','Kilcullen',53526,'Taoyuan',51443,'lkilcullenq@va.gov','3OHaQnd'),(28,'Sayre','Hearle',4566,'Zbytków',47,'shearler@ocn.ne.jp','IxAC90pFTo'),(29,'Dexter','Jellico',731,'Ulapes',8908,'djellicos@scientificamerican.com','WDYcgg'),(30,'Ardelle','McGrail',375,'Maguilling',29,'amcgrailt@webnode.com','7mWLiH9vJ'),(31,'Gardiner','Varnals',16,'Noeltoko',1,'gvarnalsu@nba.com','pwRSpDNlTDNp'),(32,'Saudra','Fishburn',720,'Karangtengah',56767,'sfishburnv@discovery.com','5OAm8gk'),(33,'Samson','Druhan',56,'Provo',7,'sdruhanw@washington.edu','52yseJ133'),(34,'Pegeen','Foukx',2011,'Mātli',10,'pfoukxx@time.com','xm0qIrffx7'),(35,'Norean','Josephy',8,'Mari',2,'njosephyy@cisco.com','qF9FZT093R'),(36,'Gertrud','Goodrick',91,'Shchukino',66,'ggoodrickz@friendfeed.com','kGIznHW'),(37,'Lily','Piperley',5,'Paris La Défense',15,'lpiperley10@instagram.com','djLHBTB'),(38,'Ardelle','Kensington',259,'Tsinandali',61,'akensington11@friendfeed.com','spP9jTt1j'),(39,'Pascale','Doring',345,'Namur',64,'pdoring12@bigcartel.com','dB1EhIeyXu'),(40,'Hayden','Marchello',8,'Rawa',5665,'hmarchello13@usatoday.com','IGqxNVCP2'),(41,'Lyssa','Indge',26334,'Bandar-e Māhshahr',3137,'lindge14@state.gov','Nrwk5X4'),(42,'Liliane','Gowdridge',733,'Lyon',0,'lgowdridge15@de.vu','l5Fnlqmjp1'),(43,'Marcelle','Beckley',67,'Sawaengha',977,'mbeckley16@accuweather.com','Cai953Os00'),(44,'Harli','Elsworth',49878,'Lianfa',46,'helsworth17@usda.gov','bK114wIl2c'),(45,'Cleveland','Jarrett',1430,'Al Maşlūb',73707,'cjarrett18@csmonitor.com','do8TYRzBk'),(46,'Ange','Ferrand',5154,'Karmah an Nuzul',8121,'aferrand19@answers.com','k0cPvpZ8x'),(47,'Gusty','MacCathay',34,'Manis Mekarwangi',224,'gmaccat@google.com.au','lHsClM'),(48,'Griff','Rosenzwig',46,'Kaset Sombun',47439,'grosenzwig1b@dedecms.com','Yp1Yff3H8Dx'),(49,'Morly','Losemann',37,'Pontivy',61,'mlosemann1c@rce.com','Sqfts5RAz'),(50,'Mikey','Quare',7810,'Kabūdarāhang',2691,'mquare1d@cbc.ca','kn1OXSg'),(51,'Keene','Nassi',737,'Panikian',438,'knassi1e@perso-orange.fr','PEWcYk'),(52,'Stearne','Dreghorn',554,'Stari Banovci',3673,'sdreghorn1f@typepad.com','yMPaHwzl8'),(53,'Bertie','Bonwick',2,'Kulpin',74842,'bbonwick1g@live.com','YHPKfB7IB'),(54,'Caspar','Deakins',77,'Daxi',5434,'cdeakins1h@godaddy.com','6T13vz'),(55,'Torre','Fluger',92,'Sidomekar',81624,'tfluger1i@github.io','DGHxmnPlw084'),(56,'Gabby','Croucher',587,'Casal da Anja',238,'gcroucher1j@cafepress.com','mWqIXZ'),(57,'Beverlie','Janku',750,'Al ‘Ashshah',338,'bjanku1k@yahoo.co.jp','ok6oRYVi'),(58,'Lemmy','Lortz',84150,'Parelhas',925,'llortz1l@imageshack.us','l1RQhP0vc'),(59,'Teriann','MacElholm',3,'Ikeda',211,'tmacelholm1m@ehow.com','MZzEyhjj8q'),(60,'Dore','Chilcotte',51,'Shaydon',5725,'dchilcotte1n@sciencedaily.com','T0Sf0yG2'),(61,'Kelsey','Mannix',4765,'Thap Khlo',322,'kmannix1o@indiatimes.com','5Yt8jXWZL'),(62,'Darsey','Walaron',20832,'Luojiaping',7603,'dwalaron1p@cdc.gov','IfY2sokhknzB'),(63,'Flora','Featherstonehaugh',67702,'Changhe',4829,'ffeatherstonehaugh1q@webnode.com','iG9A91okLDg'),(64,'Gary','Nacey',5,'Rimbo',911,'gnacey1r@jigsy.com','zL5Aps'),(65,'Gwendolen','Fricke',7331,'Zhongxiang',44240,'gfricke1s@oaic.gov.au','JmDB02DxOOt'),(66,'Gardy','Vinau',54,'Dahe',96,'gvinau1t@sakura.ne.jp','GJNqcnYrUoT'),(67,'Jeannie','Hegdonne',2888,'Cikondang',789,'jhegdonne1u@tinypic.com','ZOQeoBZD9'),(68,'Alethea','Filon',66,'Jiashan',9,'afilon1v@imageshack.us','BQ6zC8cOMJ'),(69,'Whitaker','McKintosh',5270,'Oakland',7,'wmckintosh1w@arizona.edu','fMSJ62'),(70,'Francois','Luchelli',66389,'Baykit',837,'fluchelli1x@ustream.tv','u7rtiPA4gd'),(71,'Duffie','Birtwhistle',805,'Choroszcz',14,'dbirtwhistle1y@ovh.net','BNETbEm'),(72,'Israel','Duchant',47772,'Jaroměřice',487,'iduchant1z@cyberchimps.com','uUUtzVKlT4'),(73,'Adrianna','Mulryan',3,'Pampa de los Guanacos',4509,'amulryan20@surveymonkey.com','R50bjUB82c'),(74,'Gardner','Prettjohn',472,'Uppsala',47,'gprettjohn21@blogtalkradio.com','J47m08B'),(75,'Holt','Brechin',2374,'Dīla',9174,'hbrechin22@shareasale.com','7sUuy3e'),(76,'Teressa','Gunningham',310,'Karuri',81573,'tgunningham23@over-blog.com','l2xErkN7M'),(77,'Germana','Dun',85,'Baixiang',62,'gdun24@quantcast.com','dsjQE4ebFyN'),(78,'Lindy','Pennycook',2239,'Xinwo',7486,'lpennycook25@linkedin.com','a8gHTxdUEQ'),(79,'Phoebe','Daws',0,'Huanfeng',4034,'pdaws26@ucla.edu','CRuOfnwCP'),(80,'Gasper','Lissemore',842,'Amsterdam Westpoort',53,'glissemore27@sphinn.com','OUwGrYrw7'),(81,'Neddie','Eden',8495,'Majengo',6232,'neden28@sakura.ne.jp','eubj8E'),(82,'Elisabeth','Eggers',34619,'Mílos',69,'eeggers29@redcross.org','qaw06vkZ4aH'),(83,'Almeta','Pinwill',723,'Mangaldan',9612,'apinwill2a@hhs.gov','xj4HCDVIEIqi'),(84,'Marleah','Groundwater',1997,'Mostek',3005,'mgroundwater2b@cmu.edu','DbAUqxrw3H'),(85,'Annabelle','Mattingly',694,'General Alvear',35875,'amattingly2c@state.gov','JlvrCadOL'),(86,'Lauren','Brumham',6,'Tambobamba',1,'lbrumham2d@goodreads.com','HFY0IUz0Avj'),(87,'Trey','Petruska',45162,'Dongxi',299,'tpetruska2e@etsy.com','XUIGuYUfM'),(88,'Susan','Rahlof',49,'Tonoas Municipal Building',628,'srahlof2f@hexun.com','0Nql0f5keWDJ'),(89,'Roxane','Seatter',9494,'Bontoc',5866,'rseatter2g@free.fr','BUrNFk'),(90,'Jessalyn','Stearley',1668,'Tembeling',94342,'jstearley2h@cdbaby.com','4tT441knrB'),(91,'Kristos','Doel',84,'Vatutino',75,'kdoel2i@nhs.uk','27PbZKdP'),(92,'Ellwood','Mouncey',3,'Gagarin',391,'emouncey2j@paypal.com','kYq6IybDas4j'),(93,'Tessy','Hartlebury',2844,'Alta',77,'thartlebury2k@state.tx.us','n0EjXDpztzbM'),(94,'Peri','Danbye',0,'Carrefour',8,'pdanbye2l@netscape.com','WgT51NC'),(95,'Diarmid','Pancoust',35,'Greytown',4,'dpancoust2m@skype.com','SAdGFlZNI'),(96,'Artur','Woollam',43,'Amarillo',1146,'awoollam2n@geocities.jp','YvWtow0'),(97,'Bianka','Jaquin',2,'Emiliano Zapata',0,'bjaquin2o@ucsd.edu','8m9uzG2AqWG'),(98,'Burg','Berkeley',237,'Saint-Cloud',497,'bberkeley2p@google.es','0FxXLddMag6'),(99,'Dorthy','Galletley',537,'Maraã',1890,'dgalletley2q@miibeian.gov.cn','fS7NwAb4qPd'),(100,'Mozelle','Islep',81,'Tracal',57309,'mislep2r@purevolume.com','4FY8gQh'),(101,'test','test',314134,'dest',30340,'distortion2@dist','dist'),(102,'elden','ring',53,'lands between',304,'elden@ring','ring');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `Warehouse_ID` int NOT NULL AUTO_INCREMENT,
  `Plot_number` decimal(30,0) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `pincode` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`Warehouse_ID`),
  CONSTRAINT `warehouse_chk_1` CHECK ((`plot_number` >= 0)),
  CONSTRAINT `warehouse_chk_2` CHECK ((`pincode` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,99,'San Quintin',793623),(2,20,'Hampton',991302),(3,86,'Unidos',556905),(4,29,'Stockholm',196614),(5,67,'Omaha',821660);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;

--
-- Table structure for table `warehouse_worker`
--

DROP TABLE IF EXISTS `warehouse_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_worker` (
  `Employee_ID` int NOT NULL,
  `Warehouse_ID` int DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  CONSTRAINT `warehouse_worker_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  CONSTRAINT `warehouse_worker_ibfk_2` FOREIGN KEY (`Warehouse_ID`) REFERENCES `warehouse` (`Warehouse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_worker`
--

/*!40000 ALTER TABLE `warehouse_worker` DISABLE KEYS */;
INSERT INTO `warehouse_worker` VALUES (9,1),(13,1),(14,1),(19,1),(20,1),(1,2),(7,2),(16,2),(5,3),(17,3),(2,4),(3,4),(4,4),(6,4),(8,4),(10,4),(11,4),(12,4),(15,4),(18,5);
/*!40000 ALTER TABLE `warehouse_worker` ENABLE KEYS */;

--
-- Temporary view structure for view `warehouse_worker_view`
--

DROP TABLE IF EXISTS `warehouse_worker_view`;
/*!50001 DROP VIEW IF EXISTS `warehouse_worker_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `warehouse_worker_view` AS SELECT 
 1 AS `Warehouse_ID`,
 1 AS `Product_id`,
 1 AS `Stocks`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `all_products`
--

/*!50001 DROP VIEW IF EXISTS `all_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_products` AS select `product`.`Product_ID` AS `product_id`,`product`.`Product_name` AS `Product_name`,`product`.`Price` AS `Price`,`product`.`GST_percentage` AS `GST_Percentage`,`product`.`Discount_Percentage` AS `Discount_Percentage`,(select sum(`stores`.`Stocks`) from `stores` where (`stores`.`Product_ID` = `product`.`Product_ID`)) AS `Total_Available_Stock` from (`product` join `stores`) where (`product`.`Product_ID` = `stores`.`Product_ID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `average_cost_of_orders_for_each_day`
--

/*!50001 DROP VIEW IF EXISTS `average_cost_of_orders_for_each_day`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `average_cost_of_orders_for_each_day` AS select cast(`transaction`.`transaction_time` as date) AS `date(transaction_time)`,avg(`orders`.`Total_Price`) OVER (ORDER BY cast(`transaction`.`transaction_time` as date) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)  AS `average_cost` from (`transaction` join `orders` on((`transaction`.`order_ID` = `orders`.`order_ID`))) where (`transaction`.`Transaction_Status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_cart`
--

/*!50001 DROP VIEW IF EXISTS `customer_cart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_cart` AS select `shopping_cart`.`customer_ID` AS `Customer_ID`,`shopping_cart`.`Product_ID` AS `Product_ID`,`product`.`Product_name` AS `Product_Name`,`shopping_cart`.`quantity` AS `Quantity`,round((((`product`.`Price` * (100 - `product`.`Discount_Percentage`)) * (100 + `product`.`GST_percentage`)) / 10000),2) AS `Price_Per_Unit_Discount_and_Tax_Inclusive` from (`shopping_cart` join `product` on((`shopping_cart`.`Product_ID` = `product`.`Product_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_complaints`
--

/*!50001 DROP VIEW IF EXISTS `customer_complaints`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_complaints` AS select `customer`.`Customer_ID` AS `customer_ID`,concat(`customer`.`First_name`,' ',`customer`.`Last_name`) AS `customer_name`,`complains`.`service_employee_id` AS `Employee_ID`,concat(`employee`.`First_Name`,' ',`employee`.`Last_Name`) AS `employee_name`,`employee`.`Department` AS `Employee_Department`,`employee`.`Position` AS `Employee_Position`,`complains`.`order_ID` AS `Order_ID`,`complains`.`date_of_creation` AS `Date_of_Complaint_Creation`,`complains`.`details` AS `Complaint_Details`,`complains`.`resolved` AS `Resolution_Status`,`complains`.`complaint_number` AS `complaint_number` from (`employee` join (`complains` join `customer` on((`complains`.`customer_ID` = `customer`.`Customer_ID`)))) where (`complains`.`service_employee_id` = `employee`.`Employee_ID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_order`
--

/*!50001 DROP VIEW IF EXISTS `customer_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order` AS select `customer`.`Customer_ID` AS `Customer_ID`,concat(`customer`.`First_name`,' ',`customer`.`Last_name`) AS `customer_name`,`orders`.`order_ID` AS `Order_ID`,`product`.`Product_ID` AS `Product_ID`,`product`.`Product_name` AS `Product_Name`,`order_products`.`quantity` AS `Quantity`,((((`order_products`.`quantity` * `product`.`Price`) * (100 - `product`.`Discount_Percentage`)) * (100 + `product`.`GST_percentage`)) / 10000) AS `Total_Price`,concat(`customer`.`House_number`,' ',`customer`.`Locality`,' ',`customer`.`City`,' ',`customer`.`pincode`) AS `Delivery_address`,`transaction`.`transaction_time` AS `Transaction_Time`,`del`.`delivery_date` AS `Delivery_Date` from (((((`orders` join `order_products`) join `transaction`) join `product`) join `customer`) join `delivery` `del`) where ((`orders`.`order_ID` = `order_products`.`order_ID`) and (`order_products`.`Product_ID` = `product`.`Product_ID`) and (`orders`.`order_ID` = `transaction`.`order_ID`) and (`transaction`.`Customer_ID` = `customer`.`Customer_ID`) and (`del`.`order_ID` = `orders`.`order_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `delivery_guy`
--

/*!50001 DROP VIEW IF EXISTS `delivery_guy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `delivery_guy` AS select `delivery`.`order_ID` AS `Order_ID`,`delivery`.`Employee_ID` AS `Employee_ID`,`delivery`.`delivery_date` AS `Delivery_date`,concat(`customer`.`House_number`,' ',`customer`.`Locality`,' ',`customer`.`City`,' ',`customer`.`pincode`) AS `Customer_address`,concat(`warehouse`.`Plot_number`,' ',`warehouse`.`City`,' ',`warehouse`.`pincode`) AS `Warehouse_address` from ((`delivery` join `customer`) join `warehouse`) where ((`customer`.`Customer_ID` = `delivery`.`Customer_ID`) and (`delivery`.`Warehouse_ID` = `warehouse`.`Warehouse_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_valuable_customer`
--

/*!50001 DROP VIEW IF EXISTS `most_valuable_customer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_valuable_customer` AS select `t`.`Customer_id` AS `customer_id`,rank() OVER (ORDER BY `t`.`total_order_cost` desc )  AS `customer_rank` from (select `transaction`.`Customer_ID` AS `Customer_id`,sum(`orders`.`Total_Price`) AS `total_order_cost` from (`transaction` join `orders` on((`transaction`.`order_ID` = `orders`.`order_ID`))) group by `transaction`.`Customer_ID`) `t` order by `customer_rank` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `suppliers`
--

/*!50001 DROP VIEW IF EXISTS `suppliers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `suppliers` AS select `vendor`.`Vendor_id` AS `vendor_ID`,concat(`vendor`.`first_name`,' ',`vendor`.`last_name`) AS `Vendor_Name`,concat(`vendor`.`Plot_number`,' ',`vendor`.`City`,' ',`vendor`.`pincode`) AS `Vendor_Address`,`product`.`Product_ID` AS `Product_ID`,`product`.`Product_name` AS `Product_Name`,`product`.`Price` AS `Unit_price`,`product`.`GST_percentage` AS `GST_Percentage`,`supplies`.`Quantity` AS `Quantity_Supplied` from ((`vendor` join `supplies`) join `product`) where ((`vendor`.`Vendor_id` = `supplies`.`Vendor_id`) and (`supplies`.`Product_ID` = `product`.`Product_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `warehouse_worker_view`
--

/*!50001 DROP VIEW IF EXISTS `warehouse_worker_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `warehouse_worker_view` AS select `stores`.`Warehouse_ID` AS `Warehouse_ID`,`stores`.`Product_ID` AS `Product_id`,`stores`.`Stocks` AS `Stocks` from (`stores` join `warehouse_worker` on((`stores`.`Warehouse_ID` = `warehouse_worker`.`Warehouse_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 18:00:18
