-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: sangit
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (62),(62),(62);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `id` bigint NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `id` bigint NOT NULL,
  `albumart` varchar(255) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `duration` bigint NOT NULL,
  `mediapath` varchar(255) DEFAULT NULL,
  `rating` bigint NOT NULL,
  `ratingCount` bigint NOT NULL,
  `song` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userid` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (31,'\\static\\media\\img\\BekhayaliTujheKitnaChahneLageHum.JPEG','Kabir Singh',240,'\\static\\media\\Bekhayali01 Bekhayali - Kabir Singh (SongsMp3.Com).mp3',4,1,'Bekhayali01 Bekhayali - Kabir Singh (SongsMp3.Com).mp3','Bekhayali',30),(32,'\\static\\media\\img\\Shayad22387-Love Aaj Kal.jpg','Love Aaj Kal',240,'\\static\\media\\ShayadShayad - Love Aaj Kal.mp3',5,1,'ShayadShayad - Love Aaj Kal.mp3','Shayad',30),(33,'\\static\\media\\img\\Tum Saath HoAgarTumSaathHo.JPEG','Tamasha',240,'\\static\\media\\Tum Saath Ho03 Tum Saath Ho (SongsMp3.Com).mp3',0,0,'Tum Saath Ho03 Tum Saath Ho (SongsMp3.Com).mp3','Tum Saath Ho',30),(34,'\\static\\media\\img\\Ve Maahi5513-Kesari 2019.jpg','Kesari',240,'\\static\\media\\Ve Maahi04 Ve Maahi - Kesari (SongsMp3.Com).mp3',0,0,'Ve Maahi04 Ve Maahi - Kesari (SongsMp3.Com).mp3','Ve Maahi',30),(35,'\\static\\media\\img\\DuniyaaDuniyaa.jpg','Luka Chuppi',240,'\\static\\media\\Duniyaa05 Duniyaa - Luka Chuppi (SongsMp3.Com).mp3',4,1,'Duniyaa05 Duniyaa - Luka Chuppi (SongsMp3.Com).mp3','Duniyaa',30),(36,'\\static\\media\\img\\Teri Mitti5513-Kesari 2019.jpg','Kesari',240,'\\static\\media\\Teri Mitti03 Teri Mitti - Kesari (SongsMp3.Com).mp3',0,0,'Teri Mitti03 Teri Mitti - Kesari (SongsMp3.Com).mp3','Teri Mitti',30),(39,'\\static\\media\\img\\Dheeme Dheemepati-patni-aur-woh-r_5dbcffe3dd528.jpg','Pati Patni Aur Woh',240,'\\static\\media\\Dheeme DheemeDheeme Dheeme - Pati Patni Aur Woh (SongsMp3.Com).mp3',4,1,'Dheeme DheemeDheeme Dheeme - Pati Patni Aur Woh (SongsMp3.Com).mp3','Dheeme Dheeme',30),(40,'\\static\\media\\img\\Haan Main Galat22387-Love Aaj Kal.jpg','Love Aaj Kal',240,'\\static\\media\\Haan Main GalatHaan Main Galat - Love Aaj Kal (SongsMp3.Com).mp3',3,1,'Haan Main GalatHaan Main Galat - Love Aaj Kal (SongsMp3.Com).mp3','Haan Main Galat',30),(41,'\\static\\media\\img\\Tujhe Kitna Chahne LageKabirSingh.jpg','Kabir Sing',240,'\\static\\media\\Tujhe Kitna Chahne LageTujhe Kitna Chahne Lage - Kabir Singh.mp3',0,0,'Tujhe Kitna Chahne LageTujhe Kitna Chahne Lage - Kabir Singh.mp3','Tujhe Kitna Chahne Lage',30),(45,'\\static\\media\\img\\Dance MonkeyDanceMonkey.jpg','Tones and I',240,'\\static\\media\\Dance MonkeyTones and I - Dance Monkey.mp3',5,1,'Dance MonkeyTones and I - Dance Monkey.mp3','Dance Monkey',44),(46,'\\static\\media\\img\\SenoritaSenorita.jpg','Shawn Mendes, Camila Cabello',240,'\\static\\media\\SenoritaShawn Mendes, Camila Cabello - Señorita.mp3',0,0,'SenoritaShawn Mendes, Camila Cabello - Señorita.mp3','Senorita',44),(47,'\\static\\media\\img\\BelieverBeliever.JPEG','Imagine Dragons',240,'\\static\\media\\BelieverImagine Dragons - Believer.mp3',0,0,'BelieverImagine Dragons - Believer.mp3','Believer',44),(49,'\\static\\media\\img\\Memories8f33b7dba524bd01a22a4c28aac60eb8.jpg','Maroon 5',240,'\\static\\media\\MemoriesMaroon 5 - Memories.mp3',0,0,'MemoriesMaroon 5 - Memories.mp3','Memories',1),(50,'\\static\\media\\img\\Get You The Moonkina.jpg','Kina',240,'\\static\\media\\Get You The MoonKina - get you the moon (ft. Snow).mp3',0,0,'Get You The MoonKina - get you the moon (ft. Snow).mp3','Get You The Moon',1),(52,'\\static\\media\\img\\Death bed`index.jpg','Powfu',240,'\\static\\media\\Death bed`Powfu - death bed (feat. Beabadoobee).mp3',0,0,'Death bed`Powfu - death bed (feat. Beabadoobee).mp3','Death bed`',1),(53,'\\static\\media\\img\\blindingLight500.jpg','The Weekend',240,'\\static\\media\\Blinding LightsBlinding Lights.mp3',0,0,'Blinding LightsBlinding Lights.mp3','Blinding Lights',1),(54,'\\static\\media\\img\\I Just wanna shinesddefault4.jpg','Fitz & The Tantrums',240,'\\static\\media\\I Just wanna shineI Just Wanna Shine.mp3',0,0,'I Just wanna shineI Just Wanna Shine.mp3','I Just wanna shine',1),(55,'\\static\\media\\img\\Break My Heartsddefault (2).jpg','Dua Lipa',240,'\\static\\media\\Break My HeartBreak My Heart.mp3',0,0,'Break My HeartBreak My Heart.mp3','Break My Heart',1),(56,'\\static\\media\\img\\Bad At Lovehalsey.jpg','Halsey',240,'\\static\\media\\Bad At LoveHalsey - Bad At Love.mp3',0,0,'Bad At LoveHalsey - Bad At Love.mp3','Bad At Love',1),(57,'\\static\\media\\img\\You Should Be Sadhalsey.jpg','Halsey',240,'\\static\\media\\You Should Be SadHalsey - You should be sad.mp3',0,0,'You Should Be SadHalsey - You should be sad.mp3','You Should Be Sad',44),(58,'\\static\\media\\img\\shapeOfYouCover.png','Ed Sheeran',240,'\\static\\media\\Shape Of YouEd Sheeran Shape of you NEW SONG 2017.mp3',0,0,'Shape Of YouEd Sheeran Shape of you NEW SONG 2017.mp3','Shape Of You',44),(59,'\\static\\media\\img\\Good Things Fall Apartsddefault5.jpg','Illenium',240,'\\static\\media\\Good Things Fall ApartGood Things Fall Apart.mp3',0,0,'Good Things Fall ApartGood Things Fall Apart.mp3','Good Things Fall Apart',44);
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `visibilty` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK357ywqb3bldwydt7e89fag803` (`user_id`),
  CONSTRAINT `FK357ywqb3bldwydt7e89fag803` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (29,'PopularHindiSongs','global',1),(42,'PopularEnglishSongs','global',1),(61,'MyHindiPlaylist','global',60);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_music`
--

DROP TABLE IF EXISTS `playlist_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_music` (
  `playlists_id` bigint NOT NULL,
  `songList_id` bigint NOT NULL,
  PRIMARY KEY (`playlists_id`,`songList_id`),
  KEY `FKnmma55gp8q1x05vnlc10kxmmt` (`songList_id`),
  CONSTRAINT `FK3y5jh9acbrok58h64gpvfpiw5` FOREIGN KEY (`playlists_id`) REFERENCES `playlist` (`id`),
  CONSTRAINT `FKnmma55gp8q1x05vnlc10kxmmt` FOREIGN KEY (`songList_id`) REFERENCES `music` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_music`
--

LOCK TABLES `playlist_music` WRITE;
/*!40000 ALTER TABLE `playlist_music` DISABLE KEYS */;
INSERT INTO `playlist_music` VALUES (29,31),(61,31),(29,32),(29,33),(29,34),(29,35),(29,36),(29,39),(29,40),(61,40),(29,41),(42,45),(42,46),(42,47),(42,49),(42,50),(42,52),(42,53),(42,54),(42,55),(42,56),(42,57),(42,58),(42,59);
/*!40000 ALTER TABLE `playlist_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_num` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photopath` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_e6gkqunxajvyxl5uctpl2vl2p` (`email`),
  UNIQUE KEY `UK_6dr2wsihagn27ci73y0b0t26l` (`mobile_num`),
  UNIQUE KEY `UK_jreodf78a7pl5qidfh43axdfb` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','archisman.pathak@hotmail.com','9874232503','Archisman Pathak','$2a$12$fT4tfNO1ENQyq0a6uMmC.ultGpdNGsd3G/ij66NwqvmjhzKB3g2Bm','\\uploadedFiles\\index.png','archisman'),(30,'mp','archisman.pathak@yahoo.com','03323186534','Indian Music Provider','$2a$12$EScB2YLrxDRe/x1ejgTZ5.EOFrtmr7oZdzT87Rcs47f.UZ822iEVe','\\uploadedFiles\\index.jpg','indmp'),(44,'mp','archisman.pathak@mail.com','03323186533','English Music Provider','$2a$12$Yun9J1Xlq5JZMuDFkJ7/oOWHaD4izzuc9LeMQOdT/oPoCMq6tfk.i','\\uploadedFiles\\englishMusic.jpg','enmp'),(60,'user','someuser@gmail.com','9874030123','User Account','$2a$12$F9bFO5G282xqFHncUCHwvea83dFtmg7chueQ9zTFhJkE.n13lJJ0u','\\uploadedFiles\\halsey.jpg','useracc');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_playlist`
--

DROP TABLE IF EXISTS `user_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_playlist` (
  `User_id` bigint NOT NULL,
  `playlists_id` bigint NOT NULL,
  PRIMARY KEY (`User_id`,`playlists_id`),
  UNIQUE KEY `UK_rhq6nhne9ctl74p2xfm0bogc5` (`playlists_id`),
  CONSTRAINT `FK65wviw3iqdrrect2nvpbvikvc` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKo9rdt40vjjvqpw3e6nu1i00f3` FOREIGN KEY (`playlists_id`) REFERENCES `playlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_playlist`
--

LOCK TABLES `user_playlist` WRITE;
/*!40000 ALTER TABLE `user_playlist` DISABLE KEYS */;
INSERT INTO `user_playlist` VALUES (60,61);
/*!40000 ALTER TABLE `user_playlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-25 22:59:09
