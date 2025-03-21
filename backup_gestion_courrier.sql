-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gestion_courrier
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courrier_annotations`
--

DROP TABLE IF EXISTS `courrier_annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courrier_annotations` (
  `id_annotation` int(11) NOT NULL AUTO_INCREMENT,
  `courrier_id` int(11) DEFAULT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `annotation` text NOT NULL,
  `date_ajout` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_annotation`),
  KEY `courrier_id` (`courrier_id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `courrier_annotations_ibfk_1` FOREIGN KEY (`courrier_id`) REFERENCES `courriers` (`id_courrier`) ON DELETE CASCADE,
  CONSTRAINT `courrier_annotations_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courrier_annotations`
--

LOCK TABLES `courrier_annotations` WRITE;
/*!40000 ALTER TABLE `courrier_annotations` DISABLE KEYS */;
INSERT INTO `courrier_annotations` VALUES
(1,35,14,'sdqdazzdzadzad','2025-02-27 12:12:39'),
(2,35,14,'jjdsjjfsf','2025-02-27 12:12:50'),
(3,35,14,'sdfsf','2025-02-27 12:17:50'),
(4,35,14,'sdfsf','2025-02-27 12:17:51'),
(5,35,14,'sdfsf','2025-02-27 12:17:51'),
(6,35,14,'sdfsf','2025-02-27 12:17:51'),
(7,35,14,'sdfsf','2025-02-27 12:17:51'),
(8,35,14,'sdfsf','2025-02-27 12:17:52'),
(9,35,14,'qsdqsdq','2025-02-27 12:20:33'),
(10,35,14,'sqdsdq','2025-02-27 12:28:39'),
(11,35,14,'sqdsdq','2025-02-27 12:28:39'),
(12,35,14,'sqdsdq','2025-02-27 12:28:40'),
(13,35,14,'sqdsdq','2025-02-27 12:28:40'),
(14,35,14,'qsqd','2025-02-27 12:29:41'),
(15,46,14,'QSDSFQ','2025-03-05 08:40:14'),
(16,46,14,'FDEBVGREAZ','2025-03-05 08:47:26'),
(17,46,14,'FDEBVGREAZ','2025-03-05 08:47:27'),
(18,46,14,'FDEBVGREAZ','2025-03-05 08:47:28'),
(19,46,14,'FDEBVGREAZ','2025-03-05 08:47:28'),
(20,46,14,'SDQFQ','2025-03-05 08:47:49'),
(21,46,14,'sdf','2025-03-05 08:50:56'),
(22,48,14,'Faites moi s ça vite','2025-03-05 08:53:09'),
(23,49,14,'=p\np^\np','2025-03-05 13:51:32'),
(24,55,14,'AVIS FAVORABLE','2025-03-13 14:01:41'),
(25,57,14,'RAS','2025-03-18 11:14:20'),
(27,56,14,'zaza','2025-03-18 11:50:14'),
(32,57,14,'fitcher','2025-03-18 15:44:12');
/*!40000 ALTER TABLE `courrier_annotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courrier_historique`
--

DROP TABLE IF EXISTS `courrier_historique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courrier_historique` (
  `id_historique` int(11) NOT NULL AUTO_INCREMENT,
  `courrier_id` int(11) DEFAULT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `action` text NOT NULL,
  `date_action` datetime DEFAULT current_timestamp(),
  `type_action` enum('création','modification','validation','archivage') NOT NULL,
  PRIMARY KEY (`id_historique`),
  KEY `courrier_id` (`courrier_id`),
  KEY `idx_utilisateur_id_historique` (`utilisateur_id`),
  CONSTRAINT `courrier_historique_ibfk_1` FOREIGN KEY (`courrier_id`) REFERENCES `courriers` (`id_courrier`) ON DELETE CASCADE,
  CONSTRAINT `courrier_historique_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courrier_historique`
--

LOCK TABLES `courrier_historique` WRITE;
/*!40000 ALTER TABLE `courrier_historique` DISABLE KEYS */;
INSERT INTO `courrier_historique` VALUES
(1,54,15,'Transfert du courrier au destinataire final','2025-03-18 10:38:53','modification'),
(2,57,15,'Transfert du courrier au destinataire final','2025-03-18 10:39:01','modification'),
(3,56,15,'Transfert du courrier au destinataire final','2025-03-18 10:39:03','modification'),
(4,57,14,'Ajout d\'une annotation','2025-03-18 11:14:20','modification'),
(5,57,14,'Ajout d\'une annotation','2025-03-18 11:20:31','modification'),
(6,56,14,'Ajout d\'une annotation','2025-03-18 11:50:14','modification'),
(7,57,14,'Ajout d\'une annotation','2025-03-18 12:14:29','modification'),
(8,57,14,'Ajout d\'une annotation','2025-03-18 12:14:29','modification'),
(9,57,14,'Suppression d\'une annotation','2025-03-18 15:37:44','modification'),
(10,57,14,'Suppression d\'une annotation','2025-03-18 15:38:35','modification'),
(11,57,14,'Ajout d\'une annotation','2025-03-18 15:38:41','modification'),
(12,57,14,'Suppression d\'une annotation','2025-03-18 15:41:30','modification'),
(13,57,14,'Ajout d\'une annotation','2025-03-18 15:41:37','modification'),
(14,57,14,'Suppression d\'une annotation','2025-03-18 15:42:19','modification'),
(15,57,14,'Suppression d\'une annotation','2025-03-18 15:42:26','modification'),
(16,57,14,'Ajout d\'une annotation','2025-03-18 15:44:12','modification'),
(17,56,14,'Ajout d\'une annotation','2025-03-18 16:04:22','modification'),
(18,56,14,'Suppression d\'une annotation','2025-03-18 16:04:53','modification'),
(19,57,14,'Orientation du courrier vers la direction: Direction de la Vérification Fiscale','2025-03-19 11:28:19','modification'),
(20,57,14,'Suppression de l\'orientation vers la direction: Direction de la Vérification Fiscale','2025-03-19 11:28:31','modification'),
(21,57,14,'Orientation du courrier vers la direction: Direction de la Législation et du Contentieux','2025-03-19 11:28:35','modification');
/*!40000 ALTER TABLE `courrier_historique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courrier_orientations`
--

DROP TABLE IF EXISTS `courrier_orientations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courrier_orientations` (
  `id_orientation` int(11) NOT NULL AUTO_INCREMENT,
  `courrier_id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `direction_id` int(11) DEFAULT NULL,
  `date_orientation` datetime DEFAULT current_timestamp(),
  `statut` enum('en attente','traité','archivé') NOT NULL DEFAULT 'en attente',
  `commentaire` text DEFAULT NULL,
  PRIMARY KEY (`id_orientation`),
  KEY `courrier_id` (`courrier_id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  KEY `direction_id` (`direction_id`),
  CONSTRAINT `courrier_orientations_ibfk_1` FOREIGN KEY (`courrier_id`) REFERENCES `courriers` (`id_courrier`) ON DELETE CASCADE,
  CONSTRAINT `courrier_orientations_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL,
  CONSTRAINT `courrier_orientations_ibfk_3` FOREIGN KEY (`direction_id`) REFERENCES `directions` (`id_direction`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courrier_orientations`
--

LOCK TABLES `courrier_orientations` WRITE;
/*!40000 ALTER TABLE `courrier_orientations` DISABLE KEYS */;
INSERT INTO `courrier_orientations` VALUES
(2,57,14,8,'2025-03-19 11:28:35','en attente','');
/*!40000 ALTER TABLE `courrier_orientations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courriers`
--

DROP TABLE IF EXISTS `courriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courriers` (
  `id_courrier` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('interne','externe') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` enum('en attente','validé','transféré','traité','archivé','rejeté','supprimé') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'en attente',
  `urgence` enum('standard','urgent','personnel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'standard',
  `expediteur_id` int(11) DEFAULT NULL,
  `expediteur_externe` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expediteur_type` varchar(50) DEFAULT NULL,
  `destinataire_id` int(11) DEFAULT NULL,
  `direction_destinataire_id` int(11) DEFAULT NULL,
  `date_reception` datetime DEFAULT current_timestamp(),
  `date_validation` datetime DEFAULT NULL,
  `date_archive` datetime DEFAULT NULL,
  `fichier_pdf` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objet` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motif_rejet` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_courrier`),
  KEY `expediteur_id` (`expediteur_id`),
  KEY `destinataire_id` (`destinataire_id`),
  KEY `direction_destinataire_id` (`direction_destinataire_id`),
  KEY `idx_date_reception` (`date_reception`),
  KEY `idx_date_validation` (`date_validation`),
  CONSTRAINT `courriers_ibfk_1` FOREIGN KEY (`expediteur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL,
  CONSTRAINT `courriers_ibfk_2` FOREIGN KEY (`destinataire_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL,
  CONSTRAINT `courriers_ibfk_3` FOREIGN KEY (`direction_destinataire_id`) REFERENCES `directions` (`id_direction`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courriers`
--

LOCK TABLES `courriers` WRITE;
/*!40000 ALTER TABLE `courriers` DISABLE KEYS */;
INSERT INTO `courriers` VALUES
(2,'interne','validé','standard',10,NULL,'utilisateur',NULL,4,'2025-02-16 11:29:50',NULL,NULL,'pdf/courrier_1739701790.pdf',NULL,'zion basket','dicker','ytyhtry',NULL),
(3,'interne','transféré','standard',4,NULL,'utilisateur',NULL,11,'2025-02-16 12:04:27',NULL,NULL,'../../pdf/courrier_1739703867.pdf',NULL,'zeze','t(rrt','test 1',NULL),
(4,'interne','transféré','standard',3,NULL,'direction',NULL,13,'2025-02-16 12:25:02',NULL,NULL,'../../pdf/courrier_1739705102.pdf',NULL,'sdsd','sdds',NULL,NULL),
(5,'interne','transféré','urgent',3,NULL,'direction',NULL,2,'2025-02-16 12:25:59',NULL,NULL,'../../pdf/courrier_1739705159.pdf',NULL,'trt','trtrt',NULL,NULL),
(7,'externe','transféré','standard',NULL,'a','',NULL,1,'2025-02-16 12:53:03',NULL,NULL,'../../pdf/courrier_1739706783.pdf','062','zeze','rtrt',NULL,'simbastan5@gmail.com'),
(8,'externe','validé','standard',NULL,'Stane tst3d','',NULL,1,'2025-02-16 12:53:43',NULL,NULL,NULL,'06207803','zeze','zeezeze',NULL,'simbastan5@gmail.com'),
(9,'externe','transféré','urgent',NULL,'Stane tst3d','',NULL,1,'2025-02-16 12:54:13',NULL,NULL,'../../pdf/courrier_1739706853.pdf','06207803','zeze','zeezeze',NULL,'simbastan5@gmail.com'),
(10,'externe','transféré','personnel',NULL,'Stane tst3','',9,1,'2025-02-16 13:22:25',NULL,NULL,NULL,'eze','ze','ere',NULL,NULL),
(11,'externe','transféré','standard',NULL,'trt','',NULL,1,'2025-02-16 13:36:51',NULL,NULL,'../../pdf/courrier_1739709411.pdf','56545465465','trt','trt',NULL,'simbastan5@gmail.com'),
(12,'externe','transféré','urgent',NULL,'Marcel fleury','',NULL,1,'2025-02-16 13:37:53',NULL,NULL,'../../pdf/courrier_1739709473.pdf','062466582','demande','test 23',NULL,'simbastan5@gmail.com'),
(13,'externe','en attente','personnel',NULL,'Minko','',9,NULL,'2025-02-16 13:41:54',NULL,NULL,NULL,'062466582','sdsd','dezeze',NULL,NULL),
(14,'interne','transféré','standard',1,NULL,'utilisateur',NULL,9,'2025-02-16 13:54:10',NULL,NULL,'../../pdf/courrier_1739710450.pdf',NULL,'zeze','ezefzdf',NULL,NULL),
(15,'interne','transféré','standard',7,NULL,'utilisateur',NULL,1,'2025-02-16 13:56:33',NULL,NULL,'../../pdf/courrier_1739710593.pdf',NULL,'zezerfre','erzdfsqdfxw',NULL,NULL),
(16,'externe','transféré','standard',NULL,'sattza','',NULL,1,'2025-02-16 14:06:16',NULL,NULL,'../../pdf/courrier_1739711176.pdf','6516515','sdjskdj','dsdsjdjh',NULL,'ssaejiae@gmail.com'),
(17,'externe','transféré','standard',NULL,'refrdgfdgf','',NULL,1,'2025-02-16 14:07:19',NULL,NULL,'../../pdf/courrier_1739711239.pdf','58948495','dsjfisdkmd,nfz','oj,sidfkop,sd',NULL,'gergeregr@gmail.com'),
(18,'interne','transféré','standard',1,NULL,'utilisateur',NULL,7,'2025-02-16 14:22:34',NULL,NULL,'../../pdf/courrier_1739712154.pdf',NULL,'gref','fgggggggg',NULL,NULL),
(19,'interne','transféré','standard',3,NULL,'utilisateur',NULL,11,'2025-02-16 14:25:58',NULL,NULL,'../../pdf/courrier_1739712358.pdf',NULL,'dfgvdg','dfgsd',NULL,NULL),
(21,'interne','en attente','standard',10,NULL,'utilisateur',NULL,13,'2025-02-16 14:33:08',NULL,NULL,'../../pdf/courrier_1739712788.pdf',NULL,'regfeg','fdsgfg',NULL,NULL),
(22,'interne','en attente','standard',1,NULL,'direction',NULL,9,'2025-02-16 14:33:49',NULL,NULL,'../../pdf/courrier_1739712829.pdf',NULL,'zerezg','fdsgdsf',NULL,NULL),
(23,'externe','en attente','urgent',NULL,'efrgfdg','',NULL,1,'2025-02-16 14:35:12',NULL,NULL,'../../pdf/courrier_1739712912.pdf','65416521','rgfasdqgfs','refsqdfs',NULL,'gdsfgsdfg@gmail.com'),
(24,'interne','en attente','standard',3,NULL,'utilisateur',NULL,9,'2025-02-16 14:37:39',NULL,NULL,'../../pdf/courrier_1739713059.pdf',NULL,'dvbfdsgb','dfsg',NULL,NULL),
(25,'interne','en attente','standard',10,NULL,'utilisateur',NULL,11,'2025-02-16 14:45:38',NULL,NULL,'../../pdf/courrier_1739713538.pdf',NULL,'tgdgfdsg','fdsg',NULL,NULL),
(26,'interne','en attente','standard',9,NULL,'utilisateur',NULL,1,'2025-02-16 14:51:05',NULL,NULL,'../../pdf/courrier_1739713865.pdf',NULL,'ezfrzer','ererz',NULL,NULL),
(27,'interne','en attente','urgent',3,NULL,'direction',NULL,11,'2025-02-16 15:14:23',NULL,NULL,'../../pdf/courrier_1739715263.pdf',NULL,'erzgtre','dfsgdf',NULL,NULL),
(28,'interne','en attente','standard',10,NULL,'utilisateur',NULL,2,'2025-02-16 15:18:42',NULL,NULL,'../../pdf/courrier_1739715522.pdf',NULL,'rtr','tryrey',NULL,NULL),
(29,'interne','en attente','standard',4,NULL,'utilisateur',NULL,2,'2025-02-16 15:24:28',NULL,NULL,'../../pdf/courrier_1739715868.pdf',NULL,'sdrszz','erzerz',NULL,NULL),
(30,'interne','en attente','urgent',8,NULL,'direction',NULL,2,'2025-02-16 15:45:34',NULL,NULL,'../../pdf/courrier_1739717134.pdf',NULL,'defdg','dfsdf',NULL,NULL),
(31,'interne','en attente','standard',5,NULL,'direction',NULL,11,'2025-02-16 15:59:26',NULL,NULL,'../../pdf/courrier_1739717966.pdf',NULL,'dfxfs','fgdfgfsd',NULL,NULL),
(32,'externe','transféré','standard',NULL,'efrgfdg','',NULL,1,'2025-02-16 16:03:51',NULL,NULL,'../../pdf/courrier_1739718231.pdf','65416521','rgfasdqgfs','erret',NULL,'gdsfgsdfg@gmail.com'),
(33,'externe','transféré','standard',NULL,'efrgfdg','',NULL,1,'2025-02-16 16:05:03',NULL,NULL,'../../pdf/courrier_1739718303.pdf','65416521','rgfasdqgfs','erre',NULL,'gdsfgsdfg@gmail.com'),
(34,'interne','en attente','standard',10,NULL,'utilisateur',NULL,8,'2025-02-17 19:42:47',NULL,NULL,'../../pdf/courrier_1739817767.pdf',NULL,'zerfer','rezt',NULL,NULL),
(35,'interne','transféré','standard',3,NULL,'direction',NULL,5,'2025-02-21 09:51:31',NULL,NULL,NULL,NULL,'hvghyigfy','uoi',NULL,NULL),
(36,'interne','en attente','standard',8,NULL,'direction',NULL,8,'2025-02-21 10:59:47',NULL,NULL,NULL,NULL,'sfdfsd','sdfsd',NULL,NULL),
(37,'interne','en attente','standard',11,NULL,'direction',NULL,13,'2025-02-21 12:41:25',NULL,NULL,NULL,NULL,'demande de stage','RAS',NULL,NULL),
(38,'externe','transféré','personnel',NULL,'Valori',NULL,12,NULL,'2025-02-25 14:21:35',NULL,NULL,NULL,'1031020','demande de stage','yty',NULL,'nsamddd@gmail.com'),
(39,'interne','transféré','standard',3,NULL,'direction',NULL,11,'2025-02-25 14:25:29',NULL,NULL,NULL,NULL,'demande de stage','ibgu',NULL,NULL),
(40,'interne','transféré','standard',8,NULL,'direction',NULL,11,'2025-02-25 14:59:49',NULL,NULL,NULL,NULL,'demande de stageihouh','dzf',NULL,NULL),
(41,'externe','en attente','standard',NULL,'Valoried',NULL,NULL,12,'2025-02-25 15:27:47',NULL,NULL,NULL,'1031020','demande de stage','sdf',NULL,'nsamddd@gmail.com'),
(42,'interne','en attente','standard',7,NULL,'direction',NULL,2,'2025-02-25 15:28:15',NULL,NULL,NULL,NULL,'sdsf','dfsdf',NULL,NULL),
(43,'interne','en attente','standard',3,NULL,'direction',NULL,1,'2025-02-25 15:28:51',NULL,NULL,NULL,NULL,'zdada','aze',NULL,NULL),
(44,'interne','en attente','standard',11,NULL,'direction',NULL,11,'2025-02-25 15:29:57',NULL,NULL,NULL,NULL,'zfrzer','zerzrz',NULL,NULL),
(45,'externe','en attente','standard',NULL,'Valoezerz',NULL,NULL,12,'2025-02-25 15:52:13',NULL,NULL,NULL,'64886153','demande de stage','yty',NULL,'nsamddd@gmail.com'),
(46,'interne','traité','standard',11,NULL,'direction',NULL,9,'2025-02-27 10:09:45',NULL,NULL,'../../pdf/courrier_1740647385.pdf',NULL,'sdfsfd','ezeze',NULL,NULL),
(47,'externe','en attente','personnel',NULL,'Valery Nzam',NULL,12,NULL,'2025-02-27 10:26:06',NULL,NULL,NULL,'4546','EZEZE','EZE',NULL,NULL),
(48,'interne','traité','standard',2,NULL,'direction',NULL,11,'2025-02-27 11:40:15',NULL,NULL,'../../pdf/courrier_1740652815.pdf',NULL,'demande de stage','web dev',NULL,NULL),
(49,'interne','traité','standard',11,NULL,'direction',NULL,11,'2025-03-04 09:51:15',NULL,NULL,'../../pdf/courrier_1741078275.pdf',NULL,'Demande de stage : en informatique','dev WEB',NULL,NULL),
(50,'interne','transféré','urgent',11,NULL,'direction',NULL,7,'2025-03-04 12:54:02',NULL,NULL,'../../pdf/courrier_1741089242.pdf',NULL,'accord pour congé','Accord pour congé de 10 jours de Monsieur OKONGO',NULL,NULL),
(51,'externe','en attente','standard',NULL,'CNAMGS',NULL,NULL,12,'2025-03-05 13:05:57',NULL,NULL,'../../pdf/courrier_1741176357.pdf','64886153','demande de stage','RAS',NULL,'nsamddd@gmail.com'),
(52,'interne','en attente','urgent',24,NULL,'utilisateur',NULL,15,'2025-03-05 13:16:53',NULL,NULL,'../../pdf/courrier_1741177013.pdf',NULL,'^demande de reforme de vehicule','duster',NULL,NULL),
(53,'interne','transféré','standard',11,NULL,'direction',NULL,2,'2025-03-13 13:41:08',NULL,NULL,'../../pdf/courrier_1741869668.pdf',NULL,'Demande de stage','RAS',NULL,NULL),
(54,'externe','transféré','standard',NULL,'DGSG',NULL,5,12,'2025-03-13 13:56:30',NULL,NULL,NULL,'','Demande de sta','',NULL,'jean@gmail.com'),
(55,'interne','traité','standard',11,NULL,'direction',NULL,12,'2025-03-13 13:58:54',NULL,NULL,'../../pdf/courrier_1741870734.pdf',NULL,'demande de derogation','RAS',NULL,NULL),
(56,'interne','transféré','standard',11,NULL,'direction',5,12,'2025-03-18 09:21:45',NULL,NULL,'../../pdf/courrier_1742286105.pdf',NULL,'ytuityui','uytiuyi',NULL,NULL),
(57,'interne','transféré','standard',11,NULL,'direction',6,12,'2025-03-18 10:02:59',NULL,NULL,'../../pdf/courrier_1742288579.pdf',NULL,'ugkiuiui','iuiuiui',NULL,NULL),
(58,'externe','en attente','standard',NULL,'George',NULL,NULL,12,'2025-03-18 16:09:50',NULL,NULL,'../../pdf/courrier_1742310590.pdf','054645364213','Demande de stage','demande stage dans le domaine de l\'informatique',NULL,'george@gmail.com');
/*!40000 ALTER TABLE `courriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directions`
--

DROP TABLE IF EXISTS `directions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directions` (
  `id_direction` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) NOT NULL,
  `acronyme` varchar(10) NOT NULL,
  PRIMARY KEY (`id_direction`),
  UNIQUE KEY `acronyme` (`acronyme`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directions`
--

LOCK TABLES `directions` WRITE;
/*!40000 ALTER TABLE `directions` DISABLE KEYS */;
INSERT INTO `directions` VALUES
(1,'Recette Principale des Impôts','RPI'),
(2,'Direction des Ressources Humaines et des Moyens','DRHM'),
(3,'Direction de la Vérification Fiscale','DVF'),
(4,'Direction des Régimes Spécifiques','DRS'),
(5,'Direction de la Centralisation, de la Statistique et des Émissions','DCSE'),
(6,'Direction des Études et de la Prospective','DEP'),
(7,'Direction des Grandes Entreprises','DGE'),
(8,'Direction de la Législation et du Contentieux','DLC'),
(9,'Inspection des Services','IS'),
(10,'Service des Relations Publiques','SRP'),
(11,'Direction Informatique','DI'),
(12,'Cabinet DG','DG'),
(13,'Service Central du Courrier et des Archives','SCCA'),
(14,'Direction Provinciale des Impôts de l\'Estuaire','DPIE'),
(15,'Direction Provinciale des Impôts du Haut-Ogooué','DPIHO'),
(16,'Direction des Impôts du Moyen Ogooué','DIMO'),
(17,'Direction Provinciale des Impôts de la Ngounié','DPIN'),
(18,'Direction Provinciale des Impôts de l\'Ogooué Maritime','DPIM'),
(19,'Direction Provinciale des Impôts du Woleu Ntem','DPIWN');
/*!40000 ALTER TABLE `directions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilitations_scca`
--

DROP TABLE IF EXISTS `habilitations_scca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilitations_scca` (
  `id_habilitation` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) DEFAULT NULL,
  `peut_enregistrer` tinyint(1) DEFAULT 0,
  `peut_valider` tinyint(1) DEFAULT 0,
  `peut_modifier` tinyint(1) DEFAULT 0,
  `peut_supprimer` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_habilitation`),
  KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `habilitations_scca_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilitations_scca`
--

LOCK TABLES `habilitations_scca` WRITE;
/*!40000 ALTER TABLE `habilitations_scca` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilitations_scca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_generales`
--

DROP TABLE IF EXISTS `notes_generales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes_generales` (
  `id_note` int(11) NOT NULL AUTO_INCREMENT,
  `auteur_id` int(11) DEFAULT NULL,
  `contenu` text NOT NULL,
  `date_publication` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_note`),
  KEY `auteur_id` (`auteur_id`),
  CONSTRAINT `notes_generales_ibfk_1` FOREIGN KEY (`auteur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_generales`
--

LOCK TABLES `notes_generales` WRITE;
/*!40000 ALTER TABLE `notes_generales` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_generales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id_notification` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `courrier_id` int(11) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `date_envoi` datetime DEFAULT current_timestamp(),
  `lu` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_notification`),
  KEY `idx_utilisateur_id_notifications` (`utilisateur_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) NOT NULL,
  `direction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_service`),
  KEY `direction_id` (`direction_id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`direction_id`) REFERENCES `directions` (`id_direction`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES
(1,'Application',11),
(2,'Maintenance et Exploitation',11),
(3,'Informatisation',11),
(4,'Service du Budget et du Matériel',2),
(5,'Service des Applications Informatiques',NULL),
(6,'Service d\'Exploitation & Maintenance',NULL),
(7,'Service de l\'Informatisation',NULL),
(8,'Service des Emissions',5),
(9,'Service des Immatriculations',5),
(10,'Service des Statistiques et prévisions',5),
(11,'Recette Principale',1),
(12,'Service Central du Recouvrement',1),
(13,'Service du Contrôle et des Vérifications',1),
(14,'Service Central de la Comptabilité',1),
(15,'Service Analyse Quantitative et de Modelisation Fiscale',6),
(16,'Service d\'Analyses Macroeconomiques',6),
(17,'Service des Etudes',6),
(18,'Cabinet du DLC',8),
(19,'Service de la Législation',8),
(20,'Service du Contentieux',8),
(21,'Service des Relations Internationales',8),
(22,'Service de la Documentation',8),
(23,'Cabinet du DRS',4),
(24,'Service des Incitations Fiscales pour le Developpement',4),
(25,'Service Chargé des Zones Economiques Speciales',4),
(26,'Service de Gestion Fiscales des Mines: Petrole et Forets',4),
(27,'Cabinet du DVF',NULL),
(28,'Service des Vérifications Nationales et Internationales',NULL),
(29,'Service des Vérifications des Situations Fiscales d\'Ensemble',NULL),
(30,'Service des Enquetes et Recoupements',NULL),
(31,'Cellule Prix de Transfert',NULL),
(32,'Cabinet du DGE',7),
(33,'Service de Gestion et du Contentieux',7),
(34,'Recette',7),
(35,'Brigade de Recouvrement',7),
(36,'Brigade de Contrôle',7),
(37,'Service d\'Accueil et d\'Information',7),
(38,'Service de l\'Informatique et des statistiques',7),
(39,'Archive',7),
(40,'Service des Ressources et des Moyens',7),
(41,'Centre de Traitement Informatique',7),
(42,'Cabinet du DPIE',14),
(43,'Cabinet DPIEA',14),
(44,'Service des Ressources et des Moyens',14),
(45,'Service de Gestion des Affaires Domaniales',14),
(46,'Service de l\'Informatique et des Statistiques',14),
(47,'Brigade de Contrôle',14),
(48,'CIPEP NORD',14),
(49,'Cellule TVA',14),
(50,'Brigade de Contrôle',15),
(51,'Service de Gestion des Affaires Domaniales',15),
(52,'Service des Ressources et des Moyens',15),
(53,'Bureau des Impôts de MOANDA',15),
(54,'Centre des Impôts de Lambaréné',16),
(55,'Service de Gestion et du Contentieux',16),
(56,'Brigade de Contrôle',17),
(57,'Service des Ressources et des Moyens',17),
(58,'Centre des Impôts de Mouila',17),
(59,'Brigade de Contrôle',18),
(60,'Service de l\'Informatique & des Statistiques',18),
(61,'CIME POG',18),
(62,'Centre des Impôts d\'Oyem',19),
(63,'Service de Gestion et du Contentieux',19);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) NOT NULL,
  `prenom` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` enum('admin','chef_scca','agent_scca','secretaire_dg','dg','adjoint_dg','charge_etude','chef_service','secretaire','directeur','directeur_adjoint','agent','') NOT NULL,
  `direction_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `matricule` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `email` (`email`),
  KEY `direction_id` (`direction_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`direction_id`) REFERENCES `directions` (`id_direction`) ON DELETE SET NULL,
  CONSTRAINT `utilisateurs_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id_service`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES
(1,'Dupont','Jean','jean.dupont@example.com','482c811da5d5b4bc6d497ffa98491e38','admin',1,NULL,NULL),
(2,'Martin','Sophie','sophie.martin@example.com','482c811da5d5b4bc6d497ffa98491e38','chef_scca',2,NULL,NULL),
(3,'Durand','Paul','paul.durand@example.com','482c811da5d5b4bc6d497ffa98491e38','agent_scca',3,NULL,NULL),
(4,'Bernard','Alice','alice.bernard@example.com','482c811da5d5b4bc6d497ffa98491e38','secretaire_dg',4,NULL,NULL),
(5,'Moreau','Julien','julien.moreau@example.com','482c811da5d5b4bc6d497ffa98491e38','dg',5,NULL,NULL),
(6,'Lefevre','Camille','camille.lefevre@example.com','482c811da5d5b4bc6d497ffa98491e38','adjoint_dg',6,NULL,NULL),
(7,'Girard','Nicolas','nicolas.girard@example.com','482c811da5d5b4bc6d497ffa98491e38','charge_etude',7,NULL,NULL),
(8,'Lemoine','Elodie','elodie.lemoine@example.com','482c811da5d5b4bc6d497ffa98491e38','chef_service',8,NULL,NULL),
(9,'Faure','Pierre','pierre.faure@example.com','482c811da5d5b4bc6d497ffa98491e38','directeur',9,NULL,NULL),
(10,'Chevalier','Lucie','lucie.chevalier@example.com','482c811da5d5b4bc6d497ffa98491e38','directeur_adjoint',10,NULL,NULL),
(11,'SIMBA','Stane','simbastan5@gmail.com','$2y$10$fxTqbfcnmO1fxremLJFV6e6gL9oo6jw2e0OIToaGLsr5xvUZfkzaO','admin',11,1,NULL),
(12,'Minko','Marcel','simbastan38@gmail.com','$2y$10$kBkaNW3PzZ7nw.M27lT53OruFtsCUZVXlBH.Q.JpEr4HFZOKX/xVu','admin',11,2,'20250403S'),
(13,'Mavourou','Djim','djim@gmail.com','$2y$10$E8d2CICFzUD0eUHatzE6puydB76siCaUxBrrDW18wX0osqRDoCA1m','admin',11,1,NULL),
(14,'Mapila','Jean','jeanmap@gmail.com','$2y$10$boNiA/.ZrWdOomuant4VPel/o7QdAhtKpHBigHzvF55du8kcl8Q12','dg',12,NULL,'20250403M'),
(15,'Army','Marcelle','marcy@gmail.com','$2y$10$0bYTS5VgkS882A3nQogZfeboYvnpTPcFVOb2WndCl9vG6b3A3pNpy','secretaire_dg',12,1,'20250403A'),
(16,'valery','Bibang','biva@gmail.com','$2y$10$p7HS4H3vpzakgq.r2SrMaevhyW/XbjXc/SWvAdzCHf3DbhuiP5v5m','chef_scca',13,1,NULL),
(17,'Victoro','Mombo','vicmbo@gmail.com','$2y$10$ydsfjcAUoyrxKnK5Cs5lvurMzLJRViZ4IR18OsjKwYDh6fZPkjBQu','agent',11,1,NULL),
(18,'Amir','Salif','salif@gmail.com','$2y$10$GGoz2diA1ONugXGAQTOCKO02vwNh6RqTBwO5ouf0QQ0IDD6eZGlgm','agent',8,18,NULL),
(20,'Hatem','Harfa','harf@gmail.com','$2y$10$duyRQcN2hPR8Taf4lDDAO.T85XBUbT8SJYThP9dpBvD0fViQevmj.','charge_etude',12,NULL,NULL),
(21,'Jeremy','Doku','doje@gmail.com','$2y$10$EJexw0QrEfRh0fIZcQBvYONDgr4Tl/BYf/BiSX390spCC11nOWNV6','secretaire',11,NULL,NULL),
(22,'Bob','jean','bob@gmail.com','$2y$10$MIDzqQAC1btuSRZzjrBcd.QiFMDW1tw2vMZVgv4tEBzGzcFOYq/TC','agent_scca',13,NULL,NULL),
(23,'NDONGO épse REKOULA','Prisca Rolande','prisca@dgi.ga','$2y$10$2ClIJ7apZSRWrHC.oeY2vucUrw036c4.ICxuct/AVg5jzIgrLmK9.','chef_scca',13,NULL,'136061M'),
(24,'OUFOULA IMOUCK','Rose','rose@dgi.ga','$2y$10$u.9kzaqD7SivG0Un8uPyauaPXEXsLEjU6D6kH7cgUVekjmieXsoXe','agent_scca',13,NULL,'92029703F'),
(25,'KOUMBA KOUMBA','Amelie Olivia','amelie@dgi.ga','$2y$10$5/uxzAtRZTb12k1hBRsz8OUA1gEbYdpi5rjl.uILnjKTusjS04gOO','agent_scca',13,NULL,'62007782H'),
(26,'MBA NDONG','William','william-didier.mba-ndong@dgi.ga','$2y$10$6Bdwuf41Mwa9XzbeTWXA9Ozl9VAnVSNZav.oTSS3/6qN413tGxhQ6','chef_service',11,1,NULL),
(27,'Cruz','Bryan','bray@gmail.com','$2y$10$pWcXYiRReJCdVCp02a6ypea4ZZme85MuAnQb2twyAtnAnyb0CCFoS','agent',11,1,'20250403B');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-19 12:01:19
