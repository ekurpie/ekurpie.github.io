CREATE DATABASE  IF NOT EXISTS `counterstrike` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `counterstrike`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: counterstrike
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `Game_ID` varchar(10) NOT NULL,
  `Match_Team_1` varchar(20) NOT NULL,
  `Match_Team_2` varchar(20) NOT NULL,
  `Winner` varchar(20) NOT NULL,
  `Elapsed_Time` time NOT NULL,
  PRIMARY KEY (`Game_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES ('001','ENCE','Spirit','Spirit','09:30:00'),('002','Vitality','GODSENT','Vitality','13:00:00'),('003','Astralis','NiP','NiP','17:00:00'),('004','forZe','Complexity','forZe','14:25:00'),('005','Natus Vincere','North','North','13:55:00'),('006','fnatic','BIG','BIG','17:00:00'),('007','NiP','Spirit','NiP','09:30:00'),('008','Astralis','GODSENT','Astralis','13:10:00'),('009','Vitality','ENCE','Vitality','17:00:00'),('010','forZe','North','forZe','09:25:00'),('011','Natus Vincere','BIG','BIG','13:00:00'),('012','fnatic','Complexity','fnatic','17:00:00'),('013','NiP','GODSENT','NiP','09:25:00'),('014','Vitality','Spirit','Spirit','13:00:00'),('015','Astralis','Ence','Astralis','17:00:00'),('016','BIG','Complexity','Complexity','14:25:00'),('017','Natus Vincere','forZe','Natus Vincere','18:25:00'),('018','fnatic','North','fnatic','18:05:00'),('019','ENCE','GODSENT','GODSENT','09:25:00'),('020','Astralis','Spirit','Astralis','09:25:00'),('021','Vitality','NiP','Vitality','17:05:00'),('022','fnatic','forZe','fnatic','09:25:00'),('023','North','BIG','North','13:15:00'),('024','Natus Vincere','Complexity','Natus Vincere','17:00:00'),('025','North','Complexity','Complexity','13:25:00'),('026','Natus Vincere','fnatic','Natus Vincere','13:25:00'),('027','BIG','forZe','forZe','13:25:00'),('028','GODSENT','Spirit','GODSENT','17:35:00'),('029','NiP','ENCE','ENCE','17:35:00'),('030','Astralis','Vitality','Astralis','22:35:00'),('031','FaZe','TYLOO','FaZe','09:25:00'),('032','OG','TYLOO','OG','09:30:00'),('033','G2','TYLOO','G2','09:25:00'),('034','mousesports','FaZe','mousesports','09:30:00');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `guest_player`
--

DROP TABLE IF EXISTS `guest_player`;
/*!50001 DROP VIEW IF EXISTS `guest_player`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `guest_player` AS SELECT 
 1 AS `Player_Alias`,
 1 AS `Player_Nationality`,
 1 AS `Kills`,
 1 AS `Deaths`,
 1 AS `Kill_Death_Average`,
 1 AS `Kill_Death_Difference`,
 1 AS `Rifle_Kills`,
 1 AS `Grenade_Kills`,
 1 AS `SMG_Kills`,
 1 AS `Pistol_Kills`,
 1 AS `Other_weapon`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league` (
  `League_ID` char(5) NOT NULL,
  `Event_Name` varchar(50) NOT NULL,
  `Event_Prizepool` varchar(50) DEFAULT NULL,
  `Event_Date` date NOT NULL,
  `Event_Location` varchar(50) DEFAULT NULL,
  `Event_Team_Count` int DEFAULT NULL,
  `Date_Ended` date DEFAULT NULL,
  `Winning_Team` varchar(20) NOT NULL,
  PRIMARY KEY (`League_ID`),
  KEY `Winning_Team` (`Winning_Team`),
  CONSTRAINT `league_ibfk_1` FOREIGN KEY (`Winning_Team`) REFERENCES `team` (`Team_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES ('00001','ESL PRO LEAGUE EU 11','TBA','2020-03-16','ONLINE',18,'2020-04-12','TBD'),('00002','FLASHPOINT','$1,000,000','2020-03-13','Los Angeles,CA',12,'2020-04-19','TBD'),('00003','ESL PRO LEAGUE NA 11','TBA','2020-03-26','ONLINE',6,'2020-04-12','TBD');
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league_game`
--

DROP TABLE IF EXISTS `league_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league_game` (
  `Game_ID` varchar(10) NOT NULL,
  `League_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`Game_ID`,`League_ID`),
  KEY `League_ID` (`League_ID`),
  CONSTRAINT `league_game_ibfk_1` FOREIGN KEY (`Game_ID`) REFERENCES `game` (`Game_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `league_game_ibfk_2` FOREIGN KEY (`League_ID`) REFERENCES `league` (`League_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league_game`
--

LOCK TABLES `league_game` WRITE;
/*!40000 ALTER TABLE `league_game` DISABLE KEYS */;
INSERT INTO `league_game` VALUES ('001','00001'),('002','00001'),('003','00001'),('004','00001'),('005','00001'),('006','00001'),('007','00001'),('008','00001'),('009','00001'),('010','00001'),('011','00001'),('012','00001'),('013','00001'),('014','00001'),('015','00001'),('016','00001'),('017','00001'),('018','00001'),('019','00001'),('020','00001'),('021','00001'),('022','00001'),('023','00001'),('024','00001'),('025','00001'),('026','00001'),('027','00001'),('028','00001'),('029','00001'),('030','00001'),('031','00001'),('032','00001'),('033','00001'),('034','00001');
/*!40000 ALTER TABLE `league_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participate`
--

DROP TABLE IF EXISTS `participate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participate` (
  `League_ID` varchar(5) NOT NULL,
  `Team_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`League_ID`,`Team_Name`),
  KEY `Team_Name` (`Team_Name`),
  CONSTRAINT `participate_ibfk_1` FOREIGN KEY (`League_ID`) REFERENCES `league` (`League_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participate_ibfk_2` FOREIGN KEY (`Team_Name`) REFERENCES `team` (`Team_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participate`
--

LOCK TABLES `participate` WRITE;
/*!40000 ALTER TABLE `participate` DISABLE KEYS */;
INSERT INTO `participate` VALUES ('00001','BIG'),('00001','Complexity'),('00001','ENCE'),('00001','FaZe'),('00001','fnatic'),('00001','forZe'),('00001','G2'),('00001','GODSENT'),('00001','mousesports'),('00001','Natus Vincere'),('00001','NiP'),('00001','North'),('00001','OG'),('00001','Spirit'),('00001','TYLOO'),('00001','Virtus.pro'),('00001','Vitality');
/*!40000 ALTER TABLE `participate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `Player_ID` varchar(5) NOT NULL,
  `Player_Alias` varchar(20) NOT NULL,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(30) NOT NULL,
  `Player_Age` int NOT NULL,
  `Player_Nationality` varchar(30) DEFAULT NULL,
  `Kills` int DEFAULT NULL,
  `Deaths` int DEFAULT NULL,
  `Kill_Death_Average` decimal(10,2) DEFAULT NULL,
  `Kills_Per_Round` int DEFAULT NULL,
  `Kill_Death_Difference` decimal(10,2) DEFAULT NULL,
  `Rifle_Kills` int DEFAULT NULL,
  `Grenade_Kills` int DEFAULT NULL,
  `SMG_Kills` int DEFAULT NULL,
  `Pistol_Kills` int DEFAULT NULL,
  `Other_Weapon` int DEFAULT NULL,
  PRIMARY KEY (`Player_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('11000','Perfecto','Iiya','Zalutskiy',20,'Russia',10782,4475,1.07,1,307.00,3429,59,341,799,13),('12000','JaCkz','Audric','Jug',27,'France',12932,12327,1.05,1,605.00,9429,126,1032,2138,47),('12323','Kurpie','Evan','Kurpiewski',0,'America',232134,123123,232133.00,13213,123.00,123123,123123,12231,1312,12323),('13000','huNter-','Nermanja','Kovač',24,'Bosnia',21319,17872,1.19,1,3447.00,14964,297,2143,3418,264),('14000','KennyS','Kenny','Schrub',24,'France',33520,27331,1.23,1,6189.00,7745,650,678,6792,154),('15000','nexa','Nermanja','Isakovič',22,'Serbia',8000,14156,1.15,1,2107.00,11882,205,1074,2715,72),('16000','AmaNEk','François','Delaunay',26,'France',12874,11418,1.13,1,1456.00,7174,147,1939,1965,143),('17000','karrigan','Finn','Andersen',29,'Denmark',26748,28920,0.92,1,-2172.00,16158,361,2025,4610,165),('18000','ropz','Robin','Kool',20,'Estonia',14027,11814,1.19,1,2213.00,10681,68,549,2390,61),('19000','woxic','Özgür','Eker',21,'Turkey',15990,13018,1.23,1,2972.00,4431,124,361,2567,53),('20000','device','Nicolia','Reedtz',24,'Denmark',29530,23479,1.26,1,6051.00,12311,359,1383,5704,105),('21000','frozen','David','Čerňanský',17,'Slovakia',16519,13733,1.20,1,2786.00,11529,226,596,3062,74),('22000','chrisJ','Chris','Jong',29,'Netherlands',28306,26657,1.06,1,1642.00,10587,296,1384,5254,112),('23000','flusha','Robin',' Rönnquist',26,'Sweden',29556,26546,1.11,1,3010.00,19814,801,2258,5422,226),('24000','Brollan','Ludvig','Brolin',17,'Sweden',12254,11219,1.09,1,1035.00,8955,175,828,2017,69),('25000','KRIMZ','Freddy','Johansson',25,'Sweden',26605,23779,1.12,1,2826.00,19938,273,1020,4644,146),('26000','JW','Jesper','Wecksell',25,'Sweden',32171,29670,1.08,1,2501.00,12322,522,1081,6508,930),('27000','Golden','Maikil','Selim',26,'Sweden',10251,11254,0.91,1,-1003.00,6946,166,856,1971,130),('30000','dupreeh','Peter','Rasmussen',27,'Denmark',30238,26370,1.15,1,3868.00,21107,260,1739,5477,241),('40000','Magisk','Emil','Reif',22,'Denmark',19932,16925,1.18,1,3007.00,14999,274,894,3410,45),('50000','gla1ve','Lukas','Rossander',24,'Denmark',22954,22155,1.04,1,799.00,16253,426,1837,3750,32),('60000','s1mple','Aleksandr','Kostyliev',22,'Ukraine',25294,19321,1.31,1,5973.00,11139,119,692,4411,195),('70000','flamie','Egor','Vasilyev',22,'Russia',24754,22955,1.08,1,1759.00,17634,231,1237,4231,71),('80000','electronic','Denis','Sharipov',21,'Russia',17561,15212,1.15,1,2349.00,13076,198,1106,2965,65),('90000','Boombl4','Kirill','Mikhailov',21,'Russia',12764,12270,1.04,1,494.00,8251,175,1437,2387,160);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `player_BEFORE_INSERT` BEFORE INSERT ON `player` FOR EACH ROW BEGIN

IF (New.player_age < 0) then
	Set New.Player_Age = 0;

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `player_game`
--

DROP TABLE IF EXISTS `player_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_game` (
  `Player_ID` varchar(5) NOT NULL,
  `Game_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Player_ID`,`Game_ID`),
  KEY `Game_ID` (`Game_ID`),
  CONSTRAINT `player_game_ibfk_1` FOREIGN KEY (`Game_ID`) REFERENCES `game` (`Game_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_game_ibfk_2` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`Player_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_game`
--

LOCK TABLES `player_game` WRITE;
/*!40000 ALTER TABLE `player_game` DISABLE KEYS */;
INSERT INTO `player_game` VALUES ('20000','003'),('30000','003'),('40000','003'),('50000','003'),('11000','005'),('60000','005'),('70000','005'),('80000','005'),('90000','005'),('23000','006'),('24000','006'),('25000','006'),('26000','006'),('27000','006'),('20000','008'),('30000','008'),('40000','008'),('50000','008'),('11000','011'),('60000','011'),('70000','011'),('80000','011'),('90000','011'),('23000','012'),('24000','012'),('25000','012'),('26000','012'),('27000','012'),('20000','015'),('30000','015'),('40000','015'),('50000','015'),('11000','017'),('60000','017'),('70000','017'),('80000','017'),('90000','017'),('23000','018'),('24000','018'),('25000','018'),('26000','018'),('27000','018'),('20000','020'),('30000','020'),('40000','020'),('50000','020'),('23000','022'),('24000','022'),('25000','022'),('26000','022'),('27000','022'),('11000','024'),('60000','024'),('70000','024'),('80000','024'),('90000','024'),('11000','026'),('23000','026'),('24000','026'),('25000','026'),('26000','026'),('27000','026'),('60000','026'),('70000','026'),('80000','026'),('90000','026'),('20000','030'),('30000','030'),('40000','030'),('50000','030'),('12000','033'),('13000','033'),('14000','033'),('15000','033'),('16000','033'),('17000','034'),('18000','034'),('19000','034'),('21000','034'),('22000','034');
/*!40000 ALTER TABLE `player_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replay`
--

DROP TABLE IF EXISTS `replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replay` (
  `Game_ID` varchar(10) NOT NULL,
  `Replay_Name` varchar(100) NOT NULL,
  `Map1_Link` varchar(100) NOT NULL,
  PRIMARY KEY (`Game_ID`,`Replay_Name`,`Map1_Link`),
  CONSTRAINT `replay_ibfk_1` FOREIGN KEY (`Game_ID`) REFERENCES `game` (`Game_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replay`
--

LOCK TABLES `replay` WRITE;
/*!40000 ALTER TABLE `replay` DISABLE KEYS */;
INSERT INTO `replay` VALUES ('034','ESL S 11 EU mousesports V FaZe','https://www.twitch.tv/videos/577405094?t=04h44m58s');
/*!40000 ALTER TABLE `replay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rounds`
--

DROP TABLE IF EXISTS `rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rounds` (
  `Game_ID` varchar(10) NOT NULL,
  `Round_Number` int NOT NULL,
  `Winning_team` varchar(20) NOT NULL,
  PRIMARY KEY (`Game_ID`,`Round_Number`,`Winning_team`),
  KEY `Winning_team` (`Winning_team`),
  CONSTRAINT `rounds_ibfk_1` FOREIGN KEY (`Game_ID`) REFERENCES `game` (`Game_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rounds_ibfk_2` FOREIGN KEY (`Winning_team`) REFERENCES `team` (`Team_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rounds`
--

LOCK TABLES `rounds` WRITE;
/*!40000 ALTER TABLE `rounds` DISABLE KEYS */;
INSERT INTO `rounds` VALUES ('006',74,'BIG'),('011',65,'BIG'),('016',80,'Complexity'),('025',50,'Complexity'),('029',70,'ENCE'),('031',50,'FaZe'),('012',47,'fnatic'),('018',77,'fnatic'),('022',81,'fnatic'),('004',86,'forZe'),('010',54,'forZe'),('027',79,'forZe'),('033',72,'G2'),('019',84,'GODSENT'),('028',54,'GODSENT'),('034',78,'mousesports'),('017',93,'Natus Vincere'),('024',82,'Natus Vincere'),('026',53,'Natus Vincere'),('003',46,'NiP'),('007',51,'NiP'),('013',50,'NiP'),('005',52,'North'),('023',69,'North'),('032',52,'OG'),('001',48,'Spirit'),('014',75,'Spirit'),('002',54,'Vitality'),('009',80,'Vitality'),('021',55,'Vitality');
/*!40000 ALTER TABLE `rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `Team_Name` varchar(20) NOT NULL,
  `Team_Ranking` int DEFAULT NULL,
  `Team_Average_Age` int DEFAULT NULL,
  `Team_Location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Team_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('fnatic',5,24,'Sweden'),('G2',3,25,'France'),('mousesports',4,24,'Europe'),('Natus Vincere',1,22,'Russia');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_player`
--

DROP TABLE IF EXISTS `team_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_player` (
  `Team_Name` varchar(20) NOT NULL,
  `Player_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`Team_Name`,`Player_ID`),
  KEY `Player_ID` (`Player_ID`),
  CONSTRAINT `team_player_ibfk_1` FOREIGN KEY (`Team_Name`) REFERENCES `team` (`Team_Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_player_ibfk_2` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`Player_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_player`
--

LOCK TABLES `team_player` WRITE;
/*!40000 ALTER TABLE `team_player` DISABLE KEYS */;
INSERT INTO `team_player` VALUES ('Natus Vincere','11000'),('G2','12000'),('G2','13000'),('G2','14000'),('G2','15000'),('G2','16000'),('mousesports','17000'),('mousesports','18000'),('mousesports','19000'),('mousesports','21000'),('mousesports','22000'),('fnatic','23000'),('fnatic','24000'),('fnatic','25000'),('fnatic','26000'),('fnatic','27000'),('Natus Vincere','60000'),('Natus Vincere','70000'),('Natus Vincere','80000'),('Natus Vincere','90000');
/*!40000 ALTER TABLE `team_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_player`
--

DROP TABLE IF EXISTS `user_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_player` (
  `Username` varchar(20) NOT NULL,
  `Player_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`Username`,`Player_ID`),
  KEY `Player_ID` (`Player_ID`),
  CONSTRAINT `user_player_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `userbase` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_player_ibfk_2` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`Player_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_player`
--

LOCK TABLES `user_player` WRITE;
/*!40000 ALTER TABLE `user_player` DISABLE KEYS */;
INSERT INTO `user_player` VALUES ('00010','11000'),('00011','12000'),('00012','13000'),('00013','14000'),('00014','15000'),('00015','16000'),('00016','17000'),('00017','18000'),('00018','19000'),('00002','20000'),('00019','21000'),('00020','22000'),('00021','23000'),('00022','24000'),('00023','25000'),('00024','26000'),('00025','27000'),('00003','30000'),('00004','40000'),('00005','50000'),('00006','60000'),('00007','70000'),('00008','80000'),('00009','90000');
/*!40000 ALTER TABLE `user_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userbase`
--

DROP TABLE IF EXISTS `userbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userbase` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userbase`
--

LOCK TABLES `userbase` WRITE;
/*!40000 ALTER TABLE `userbase` DISABLE KEYS */;
INSERT INTO `userbase` VALUES ('00001','eGu^?7=F$T$H6bjt2r43'),('00002','4QBFCQ3X-@dtK4w$cZ@J'),('00003','WYsL$#GP2uV!Jm#Jqy!p'),('00004','L!tAtMtugC-?sa6ma4F$'),('00005','&U#DM7u5z!vEHEzXrk%M'),('00006','mj5?NMjj2vDdUSE*Uu#V'),('00007','tu#w#Ukbj3S6b%He=YP8'),('00008','b!FQ+F3$BU+4^wnm$@9^'),('00009','$VLu-EW8mW+YA3^s9j^5'),('00010','m9G_pjKYp-Cujkqd5a$H'),('00011','nt^XY-_H!acpNB69#F3@'),('00012','=Dcmn5X7^EyMM*?NFaA^'),('00013','GP4zc5F@E%R7%?3Cksc?'),('00014','GU&xVvL+f&59T*h@kp=='),('00015','G!3p8+SC_ma9j7An67-E'),('00016','qDXf_6#NN8ptp&GGT8%+'),('00017','f5EVN+ztARUCrWNK+7QD'),('00018','&PebV=Cm#^GK8q_?G$tm'),('00019','JH4c+=ZzFYaxa++DP!ay'),('00020','2sL$x6L5fS__yyE_7Bqw'),('00021','pF!+Z6sv+yC3bY3NcL_H'),('00022','E@mkH=6gN=P_Es7Hq_qt'),('00023','n4!q6+!HHG7uf*=8YKKM'),('00024','ujmpUT83G4BsmYw*W#dW'),('00025','MHgr!x$GE?9_Q3v&^Ym9'),('1','1'),('Jeff','Jeff2'),('lefty','righty'),('narayans','narayans'),('root','Zingbob23'),('theclass','theclass');
/*!40000 ALTER TABLE `userbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch`
--

DROP TABLE IF EXISTS `watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watch` (
  `Game_ID` char(10) NOT NULL,
  `Replay_Name` varchar(100) NOT NULL,
  `Map1_link` varchar(100) NOT NULL,
  `Username` varchar(20) NOT NULL,
  PRIMARY KEY (`Game_ID`,`Replay_Name`,`Map1_link`,`Username`),
  KEY `Username` (`Username`),
  CONSTRAINT `watch_ibfk_1` FOREIGN KEY (`Game_ID`, `Replay_Name`, `Map1_link`) REFERENCES `replay` (`Game_ID`, `Replay_Name`, `Map1_Link`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `watch_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `userbase` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch`
--

LOCK TABLES `watch` WRITE;
/*!40000 ALTER TABLE `watch` DISABLE KEYS */;
INSERT INTO `watch` VALUES ('034','ESL S 11 EU mousesports V FaZe','https://www.twitch.tv/videos/577405094?t=04h44m58s','00017');
/*!40000 ALTER TABLE `watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'counterstrike'
--

--
-- Dumping routines for database 'counterstrike'
--
/*!50003 DROP FUNCTION IF EXISTS `Full_Name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Full_Name`(
	`First_name` Varchar(20),
	`Last_Name` Varchar(20)
) RETURNS varchar(55) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

RETURN concat(First_name, ' ' , Last_Name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Match_results` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Match_results`()
BEGIN
select * from game;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `New_Game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Skyler`@`%` PROCEDURE `New_Game`(
	IN `gameID` VARCHAR(3),
	IN `matchTeam1` VARCHAR(20),
	IN `matchTeam2` VARCHAR(20),
	IN `winner` VARCHAR(20),
	IN `elapsedTime` TIME
)
BEGIN
INSERT INTO game VALUES(gameID,matchTeam1,matchTeam2,winner,elapsedTime);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `New_Player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Skyler`@`%` PROCEDURE `New_Player`(
	IN `playerId` VARCHAR(5),
	IN `playerAlias` VARCHAR(20),
	IN `firstName` VARCHAR(20),
	IN `lastName` VARCHAR(30),
	IN `playerAge` INT,
	IN `playerNation` VARCHAR(30),
	IN `kills` INT,
	IN `deaths` INT,
	IN `kda` DECIMAL(10,2),
	IN `kpr` INT,
	IN `kdd` DECIMAL(10,2),
	IN `rKills` INT,
	IN `gKills` INT,
	IN `smgKills` INT,
	IN `pKills` INT,
	IN `oKills` INT
)
BEGIN
INSERT INTO player values(playerId,playerAlias,firstName,lastName,playerAge,playerNation,kills,deaths,kda,kpr,kdd,rKills,gKills,smgKills,pKills,oKills);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `New_Team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Skyler`@`%` PROCEDURE `New_Team`(
	IN `Team_Name` VARCHAR(20),
	IN `Team_Ranking` INT,
	IN `Team_Average` INT,
	IN `Team_Location` VARCHAR(20)
)
BEGIN
insert into team values (Team_Name,Team_Ranking,Team_Average,Team_Location);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `New_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `New_User`(
	IN `Username` VARCHAR(20),
	IN `Password_ID` varchar(20)
)
BEGIN
insert into Userbase values (Username,Password_ID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Players_In_a_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Players_In_a_game`(
	IN `ID_Field` varchar(10)
)
BEGIN
SELECT * FROM player, player_game WHERE player.Player_ID = player_game.Player_ID AND game_id = ID_Field ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Player_Comparison` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Player_Comparison`(
	IN `Player_1` VARCHAR(20),
	IN `Player_2` VARCHAR(20)
)
BEGIN
SELECT p.Player_Alias,t.Player_Alias,(p.kills - t.kills) AS Kills_Comparison, (p.deaths - t.deaths) AS Deaths_Comparison,
(p.Kill_Death_Average - t.Kill_Death_Average) AS Kill_Death_Average_Comparison, (p.Kills_Per_Round - t.Kills_Per_Round) AS Kills_Per_Round_Comparison,(p.Kill_Death_Difference - t.Kill_Death_Difference) AS Kill_Death_Difference_Comparison,
(p.Rifle_Kills - t.Rifle_Kills) AS Rifle_Kills_Comparison, (p.grenade_kills - t.grenade_Kills) AS Grenade_kills_Comparison, (p.SMG_Kills - t.SMG_Kills) AS SMG_Kills_Comparison,(p.Pistol_Kills - t.Pistol_Kills) AS Pistol_Kills_Comparison,
(p.Other_Weapon - t.Other_Weapon) AS Other_Weapon_Comparison
FROM player AS p, player AS t WHERE p.player_Alias = Player_1 AND t.player_Alias = Player_2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Player_nationalities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Player_nationalities`()
BEGIN
SELECT player_nationality, COUNT(*) FROM player GROUP BY player_nationality;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `player_statistics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `player_statistics`()
BEGIN
select * from player;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `remove_player`(
	IN `Player_remove` VARCHAR(20)
)
BEGIN
DELETE FROM player WHERE player_id = Player_remove;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Remove_Team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Skyler`@`%` PROCEDURE `Remove_Team`(
	IN `team_remove` VARCHAR(20)
)
BEGIN 
DELETE FROM team WHERE Team_Name = team_remove;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Remove_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Skyler`@`%` PROCEDURE `Remove_User`(
	IN `user_remove` VARCHAR(20)
)
BEGIN
DELETE FROM userbase WHERE Username = user_remove;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Team_statistics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Team_statistics`()
BEGIN
Select * from Team;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `guest_player`
--

/*!50001 DROP VIEW IF EXISTS `guest_player`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `guest_player` AS select `player`.`Player_Alias` AS `Player_Alias`,`player`.`Player_Nationality` AS `Player_Nationality`,`player`.`Kills` AS `Kills`,`player`.`Deaths` AS `Deaths`,`player`.`Kill_Death_Average` AS `Kill_Death_Average`,`player`.`Kill_Death_Difference` AS `Kill_Death_Difference`,`player`.`Rifle_Kills` AS `Rifle_Kills`,`player`.`Grenade_Kills` AS `Grenade_Kills`,`player`.`SMG_Kills` AS `SMG_Kills`,`player`.`Pistol_Kills` AS `Pistol_Kills`,`player`.`Other_Weapon` AS `Other_weapon` from `player` */;
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

-- Dump completed on 2020-04-27  0:38:53
