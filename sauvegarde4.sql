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
  `date_ajout` datetime DEFAULT current_timestamp() COMMENT 'Date de création de l''annotation',
  PRIMARY KEY (`id_annotation`),
  KEY `courrier_id` (`courrier_id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `courrier_annotations_ibfk_1` FOREIGN KEY (`courrier_id`) REFERENCES `courriers` (`id_courrier`) ON DELETE CASCADE,
  CONSTRAINT `courrier_annotations_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courrier_annotations`
--

LOCK TABLES `courrier_annotations` WRITE;
/*!40000 ALTER TABLE `courrier_annotations` DISABLE KEYS */;
INSERT INTO `courrier_annotations` VALUES
(40,90,6,'goooooooooooood','2025-03-27 11:18:49'),
(41,95,2,'Courrier répondu (ID réponse: 103)','2025-04-04 11:24:35'),
(42,94,2,'Courrier répondu (ID réponse: 106)','2025-04-04 15:26:59');
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
  `type_action` enum('création','modification','validation','archivage','envoi') NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_historique`),
  KEY `courrier_id` (`courrier_id`),
  KEY `idx_utilisateur_id_historique` (`utilisateur_id`),
  KEY `idx_historique_courrier_date` (`courrier_id`,`date_action`),
  CONSTRAINT `courrier_historique_ibfk_1` FOREIGN KEY (`courrier_id`) REFERENCES `courriers` (`id_courrier`) ON DELETE CASCADE,
  CONSTRAINT `courrier_historique_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courrier_historique`
--

LOCK TABLES `courrier_historique` WRITE;
/*!40000 ALTER TABLE `courrier_historique` DISABLE KEYS */;
INSERT INTO `courrier_historique` VALUES
(90,90,32,'Transfert du courrier au destinataire final','2025-03-27 11:16:32','modification',NULL,NULL),
(91,90,6,'Orientation du courrier vers la direction: Direction de la Centralisation, de la Statistique et des Émissions','2025-03-27 11:17:34','modification',NULL,NULL),
(92,90,6,'Orientation du courrier vers la direction: Direction Informatiques','2025-03-27 11:18:34','modification',NULL,NULL),
(93,90,6,'Ajout d\'une annotation','2025-03-27 11:18:49','modification',NULL,NULL),
(94,90,6,'Changement de statut: de \'transféré\' à \'traité\'','2025-03-27 11:19:05','modification',NULL,NULL),
(95,90,2,'Envoi du courrier à la direction: Direction de la Centralisation, de la Statistique et des Émissions','2025-03-27 11:21:53','envoi',NULL,NULL),
(96,90,2,'Envoi du courrier à la direction: Direction Informatiques','2025-03-27 11:21:53','envoi',NULL,NULL),
(97,NULL,2,'Enregistrement initial d\'un courrier ','2025-03-27 15:10:00','création',NULL,NULL),
(98,NULL,3,'Enregistrement initial d\'un courrier ','2025-03-27 15:20:52','création',NULL,NULL),
(99,91,32,'Transfert du courrier au destinataire final','2025-03-27 15:21:24','modification',NULL,NULL),
(100,93,2,'Enregistrement initial d\'un courrier ','2025-03-27 15:36:31','création',NULL,NULL),
(101,94,2,'Enregistrement initial d\'un courrier ','2025-04-03 13:38:02','création',NULL,NULL),
(102,94,32,'Transfert du courrier au destinataire final','2025-04-03 13:44:51','modification',NULL,NULL),
(103,95,2,'Enregistrement initial d\'un courrier ','2025-04-03 13:49:41','création',NULL,NULL),
(104,96,2,'Enregistrement initial d\'un courrier ','2025-04-03 14:55:33','création',NULL,NULL),
(105,97,2,'Enregistrement initial d\'un courrier ','2025-04-03 14:56:19','création',NULL,NULL),
(106,98,2,'Enregistrement initial d\'un courrier ','2025-04-03 14:57:17','création',NULL,NULL),
(107,99,2,'Enregistrement initial d\'un courrier ','2025-04-03 14:58:24','création',NULL,NULL),
(108,100,2,'Enregistrement initial d\'un courrier ','2025-04-03 14:59:26','création',NULL,NULL),
(109,101,2,'Enregistrement initial d\'un courrier ','2025-04-03 15:15:02','création',NULL,NULL),
(110,102,2,'Enregistrement initial d\'un courrier ','2025-04-04 11:23:55','création',NULL,NULL),
(111,103,2,'Enregistrement d\'un courrier départ interne','2025-04-04 11:24:35','création',NULL,NULL),
(112,95,2,'Réponse créée (ID réponse: 103)','2025-04-04 11:24:35','modification',NULL,NULL),
(113,104,2,'Enregistrement initial d\'un courrier ','2025-04-04 15:16:40','création',NULL,NULL),
(114,105,2,'Enregistrement initial d\'un courrier ','2025-04-04 15:26:22','création',NULL,NULL),
(115,106,2,'Enregistrement d\'un courrier départ interne','2025-04-04 15:26:59','création',NULL,NULL),
(116,94,2,'Réponse créée (ID réponse: 106)','2025-04-04 15:26:59','modification',NULL,NULL);
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
  `statut` enum('en attente','traité','archivé','en attente d''envoi') DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL COMMENT 'Date d''envoi par le service courrier',
  PRIMARY KEY (`id_orientation`),
  KEY `courrier_id` (`courrier_id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  KEY `direction_id` (`direction_id`),
  CONSTRAINT `courrier_orientations_ibfk_1` FOREIGN KEY (`courrier_id`) REFERENCES `courriers` (`id_courrier`) ON DELETE CASCADE,
  CONSTRAINT `courrier_orientations_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL,
  CONSTRAINT `courrier_orientations_ibfk_3` FOREIGN KEY (`direction_id`) REFERENCES `directions` (`id_direction`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courrier_orientations`
--

LOCK TABLES `courrier_orientations` WRITE;
/*!40000 ALTER TABLE `courrier_orientations` DISABLE KEYS */;
INSERT INTO `courrier_orientations` VALUES
(26,90,6,5,'2025-03-27 11:17:34','en attente','','2025-03-27 11:21:53'),
(27,90,6,11,'2025-03-27 11:18:34','en attente','jjjjjjjjjjjjjjjjjjj','2025-03-27 11:21:53');
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
  `direction_expediteur_id` int(11) DEFAULT NULL,
  `courrier_origine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_courrier`),
  KEY `expediteur_id` (`expediteur_id`),
  KEY `destinataire_id` (`destinataire_id`),
  KEY `direction_destinataire_id` (`direction_destinataire_id`),
  KEY `idx_date_reception` (`date_reception`),
  KEY `idx_date_validation` (`date_validation`),
  KEY `FK_ExpeditionDirection` (`direction_expediteur_id`),
  KEY `idx_courrier_origine` (`courrier_origine_id`),
  CONSTRAINT `FK_CourrierOrigine` FOREIGN KEY (`courrier_origine_id`) REFERENCES `courriers` (`id_courrier`) ON DELETE SET NULL,
  CONSTRAINT `FK_ExpeditionDirection` FOREIGN KEY (`direction_expediteur_id`) REFERENCES `directions` (`id_direction`) ON DELETE SET NULL,
  CONSTRAINT `courriers_ibfk_1` FOREIGN KEY (`expediteur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL,
  CONSTRAINT `courriers_ibfk_2` FOREIGN KEY (`destinataire_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL,
  CONSTRAINT `courriers_ibfk_3` FOREIGN KEY (`direction_destinataire_id`) REFERENCES `directions` (`id_direction`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courriers`
--

LOCK TABLES `courriers` WRITE;
/*!40000 ALTER TABLE `courriers` DISABLE KEYS */;
INSERT INTO `courriers` VALUES
(90,'interne','traité','standard',11,NULL,'direction',6,12,'2025-03-27 11:15:08',NULL,NULL,'../../pdf/courrier_1743070508.pdf',NULL,'demande d\'audience','RAS',NULL,NULL,NULL,NULL),
(91,'interne','transféré','standard',11,NULL,'direction',6,12,'2025-03-27 15:10:00',NULL,NULL,'../../pdf/courrier_1743084600.pdf',NULL,'zserze','zeez',NULL,NULL,NULL,NULL),
(92,'interne','en attente','standard',11,NULL,'direction',NULL,5,'2025-03-27 15:20:52',NULL,NULL,'../../pdf/courrier_1743085252.pdf',NULL,'j;l k:','klk',NULL,NULL,NULL,NULL),
(93,'interne','en attente','standard',11,NULL,'direction',NULL,12,'2025-03-27 15:36:31',NULL,NULL,'../../pdf/courrier_1743086191.pdf',NULL,'ytr','tyju',NULL,NULL,NULL,NULL),
(94,'interne','traité','standard',11,NULL,'direction',6,12,'2025-04-03 13:38:02',NULL,NULL,'../../pdf/courrier_1743680282.pdf',NULL,'Demande de stage','Demande de stage d\'un développeur web',NULL,NULL,NULL,NULL),
(95,'interne','traité','standard',9,NULL,'direction',NULL,11,'2025-04-03 13:49:41',NULL,NULL,'../../pdf/courrier_1743680981.pdf',NULL,'demande de d\'audience','RAS',NULL,NULL,NULL,NULL),
(96,'interne','validé','standard',11,NULL,'direction',NULL,12,'2025-04-03 14:55:33',NULL,NULL,'../../pdf/courrier_1743684933.pdf',NULL,'demande de d\'audience','ras',NULL,NULL,NULL,NULL),
(97,'interne','en attente','standard',11,NULL,'direction',NULL,12,'2025-04-03 14:56:19',NULL,NULL,'../../pdf/courrier_1743684979.pdf',NULL,'Demande de stage','RAS',NULL,NULL,NULL,NULL),
(98,'interne','en attente','standard',11,NULL,'direction',NULL,12,'2025-04-03 14:57:17',NULL,NULL,'../../pdf/courrier_1743685037.pdf',NULL,'Demande de d\'augmentation','RAS',NULL,NULL,NULL,NULL),
(99,'interne','en attente','standard',11,NULL,'direction',NULL,12,'2025-04-03 14:58:24',NULL,NULL,'../../pdf/courrier_1743685104.pdf',NULL,'Demande de congé','RAS',NULL,NULL,NULL,NULL),
(100,'interne','en attente','standard',11,NULL,'direction',NULL,12,'2025-04-03 14:59:26',NULL,NULL,'../../pdf/courrier_1743685166.pdf',NULL,'Demande de congéS','ras',NULL,NULL,NULL,NULL),
(101,'interne','validé','standard',11,NULL,'direction',NULL,12,'2025-04-03 15:15:02',NULL,NULL,'../../pdf/courrier_1743686102.pdf',NULL,'erve','ervfge',NULL,NULL,NULL,NULL),
(102,'interne','en attente','standard',14,NULL,'direction',NULL,19,'2025-04-04 11:23:55',NULL,NULL,'../../pdf/courrier_1743758635.pdf',NULL,'zee','zeze',NULL,NULL,NULL,NULL),
(103,'interne','transféré','standard',11,NULL,'direction',NULL,9,'2025-04-04 11:24:35',NULL,NULL,'../../pdf/courrier_1743758675.pdf',NULL,'RE: demande de d\'audience','zefzeaef',NULL,NULL,NULL,95),
(104,'interne','en attente','standard',8,NULL,'utilisateur',NULL,12,'2025-04-04 15:16:40',NULL,NULL,'../../pdf/courrier_1743772600.pdf',NULL,'jyhty','yjh',NULL,NULL,NULL,NULL),
(105,'interne','en attente','standard',8,NULL,'utilisateur',NULL,3,'2025-04-04 15:26:22',NULL,NULL,'../../pdf/courrier_1743773182.pdf',NULL,'7I8','787',NULL,NULL,NULL,NULL),
(106,'interne','en attente','standard',20,NULL,'utilisateur',NULL,11,'2025-04-04 15:26:59',NULL,NULL,'../../pdf/courrier_1743773219.pdf',NULL,'RE: Demande de stage','I9O89',NULL,NULL,NULL,94);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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
(11,'Direction Informatiques','DI'),
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
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id_habilitation`),
  KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `habilitations_scca_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilitations_scca`
--

LOCK TABLES `habilitations_scca` WRITE;
/*!40000 ALTER TABLE `habilitations_scca` DISABLE KEYS */;
INSERT INTO `habilitations_scca` VALUES
(1,2,1,1,1,1,'2025-03-06','2025-02-28'),
(2,4,1,1,1,1,'2025-03-28','2025-03-31'),
(3,3,1,1,1,1,'2025-03-27','2025-03-30');
/*!40000 ALTER TABLE `habilitations_scca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_actions`
--

DROP TABLE IF EXISTS `journal_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_actions` (
  `id_journal` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `detail_action` text DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL COMMENT 'Module du système concerné',
  `ip_address` varchar(45) DEFAULT NULL,
  `date_action` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_journal`),
  KEY `utilisateur_id` (`utilisateur_id`),
  KEY `idx_date_action` (`date_action`),
  CONSTRAINT `journal_actions_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_actions`
--

LOCK TABLES `journal_actions` WRITE;
/*!40000 ALTER TABLE `journal_actions` DISABLE KEYS */;
INSERT INTO `journal_actions` VALUES
(1,1,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-03-27 14:33:28'),
(2,2,'Ajout','Ajout des habilitations pour l\'utilisateur ID: 2',NULL,NULL,'2025-03-27 14:57:41'),
(3,2,'Ajout','Ajout des habilitations pour l\'utilisateur ID: 4','Gestion Habilitations','172.17.40.108','2025-03-27 15:05:14'),
(4,2,'Modification','Modification des habilitations pour l\'utilisateur ID: 4','Gestion Habilitations','172.17.40.108','2025-03-27 15:06:36'),
(5,2,'Ajout','Ajout des habilitations pour l\'utilisateur ID: 3','Gestion Habilitations','172.17.40.108','2025-03-27 15:12:18'),
(6,3,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-03-27 15:12:56'),
(7,2,'Modification','Modification des habilitations pour l\'utilisateur ID: 3','Gestion Habilitations','172.17.40.108','2025-03-27 15:13:20'),
(8,1,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-03-27 15:21:12'),
(9,32,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-03-27 15:21:29'),
(10,6,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-03-27 15:23:26'),
(11,1,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-03-27 15:23:37'),
(12,2,'Modification','Modification des habilitations pour l\'utilisateur ID: 4','Gestion Habilitations','172.17.40.108','2025-03-27 15:30:43'),
(13,2,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-03-27 15:31:42'),
(14,2,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-03-27 15:31:57'),
(15,1,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 13:34:53'),
(16,2,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 13:36:11'),
(17,32,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 13:44:13'),
(18,32,'Déconnexion','Déconnexion du système','Authentification','172.17.40.96','2025-04-03 13:45:18'),
(19,6,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 13:45:43'),
(20,1,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 14:39:54'),
(21,3,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 14:53:52'),
(22,2,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 14:54:49'),
(23,3,'Déconnexion','Déconnexion du système','Authentification','172.17.40.96','2025-04-03 15:22:09'),
(24,32,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 15:22:14'),
(25,6,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 15:25:56'),
(26,1,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 15:49:56'),
(27,2,'Déconnexion','Déconnexion du système','Authentification','172.17.40.96','2025-04-03 16:07:57'),
(28,2,'Connexion','Connexion au système','Authentification','172.17.40.96','2025-04-03 16:08:04'),
(29,1,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 09:46:18'),
(30,1,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-04-04 09:47:22'),
(31,1,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 09:47:39'),
(32,1,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-04-04 09:59:48'),
(33,2,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 10:01:08'),
(34,2,'création','Enregistrement d\'un courrier départ interne (Courrier #103)','Gestion Courrier','172.17.40.108','2025-04-04 11:24:35'),
(35,1,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 11:59:48'),
(36,1,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-04-04 11:59:58'),
(37,2,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-04-04 12:00:06'),
(38,1,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 12:00:12'),
(39,1,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-04-04 12:05:37'),
(40,2,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 12:05:44'),
(41,2,'Déconnexion','Déconnexion du système','Authentification','172.17.40.108','2025-04-04 12:07:04'),
(42,1,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 12:07:10'),
(43,32,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 12:07:58'),
(44,1,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 13:24:47'),
(45,2,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 13:25:19'),
(46,1,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 14:42:29'),
(47,2,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 14:48:54'),
(48,2,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 15:07:56'),
(49,2,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 15:09:02'),
(50,2,'Connexion','Connexion au système','Authentification','172.17.40.108','2025-04-04 15:25:17'),
(51,2,'création','Enregistrement d\'un courrier départ interne (Courrier #106)','Gestion Courrier','172.17.40.108','2025-04-04 15:26:59');
/*!40000 ALTER TABLE `journal_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_connexion`
--

DROP TABLE IF EXISTS `journal_connexion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_connexion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date_action` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `journal_connexion_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_connexion`
--

LOCK TABLES `journal_connexion` WRITE;
/*!40000 ALTER TABLE `journal_connexion` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_connexion` ENABLE KEYS */;
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
  `type` varchar(50) DEFAULT 'notification' COMMENT 'Type de notification (nouveau_courrier, changement_statut, etc.)',
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
(1,'Application',12),
(2,'Maintenance et Exploitation',12),
(3,'Informatisation',12),
(4,'Service du Budget et du Matériel',2),
(5,'Service des Applications Informatiques',11),
(6,'Service d\'Exploitation & Maintenance',11),
(7,'Service de l\'Informatisation',11),
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
(27,'Cabinet du DVF',3),
(28,'Service des Vérifications Nationales et Internationales',3),
(29,'Service des Vérifications des Situations Fiscales d\'Ensemble',3),
(30,'Service des Enquetes et Recoupements',3),
(31,'Cellule Prix de Transfert',3),
(32,'Cabinet du DGE',7),
(33,'Service de Gestion et du Contentieux',7),
(34,'Recette',7),
(35,'Brigade de Recouvrement',7),
(36,'Brigade de Contrôle',7),
(37,'Service d\'Accueil et d\'Information',7),
(38,'Service de l\'Informatique et des statistiques',7),
(39,'Archive',13),
(40,'Service des Ressources et des Moyens',7),
(41,'Centre de Traitement Informatique',NULL),
(42,'Cabinet du DPIE',14),
(43,'Cabinet DPIEA',14),
(44,'Service des Ressources et des Moyens',14),
(45,'Service de Gestion des Affaires Domaniales',14),
(46,'Service de l\'Informatique et des Statistiques',14),
(47,'Brigade de Contrôle',14),
(48,'CIPEP NORD',14),
(49,'Cellule TVA',14),
(50,'Brigade de Contrôle',14),
(51,'Service de Gestion des Affaires Domaniales',14),
(52,'Service des Ressources et des Moyens',14),
(53,'Bureau des Impôts de MOANDA',15),
(54,'Centre des Impôts de Lambaréné',16),
(55,'Service de Gestion et du Contentieux',16),
(56,'Brigade de Contrôle',16),
(57,'Service des Ressources et des Moyens',16),
(58,'Centre des Impôts de Mouila',17),
(59,'Brigade de Contrôle',17),
(60,'Service de l\'Informatique & des Statistiques',17),
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
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES
(1,'SIMBA','Stane','simbastan5@gmail.com','$2y$10$fxTqbfcnmO1fxremLJFV6e6gL9oo6jw2e0OIToaGLsr5xvUZfkzaO','admin',11,7,NULL),
(2,'NDONGO épse REKOULA','Prisca Rolande','prisca-rolande.ndongo@dgi.ga','$2y$10$2ClIJ7apZSRWrHC.oeY2vucUrw036c4.ICxuct/AVg5jzIgrLmK9.','chef_scca',13,39,'136061M'),
(3,'OUFOULA IMOUCK','Rose','rose.oufoula-imouck@dgi.ga','$2y$10$u.9kzaqD7SivG0Un8uPyauaPXEXsLEjU6D6kH7cgUVekjmieXsoXe','agent_scca',13,39,'92029703F'),
(4,'KOUMBA KOUMBA','Amelie Olivia','amelie-olivia.koumba-koumba@dgi.ga','$2y$10$5/uxzAtRZTb12k1hBRsz8OUA1gEbYdpi5rjl.uILnjKTusjS04gOO','agent_scca',13,39,'62007782H'),
(5,'MBA NDONG','William-Didier','william-didier.mba-ndong@dgi.ga','$2y$10$6Bdwuf41Mwa9XzbeTWXA9Ozl9VAnVSNZav.oTSS3/6qN413tGxhQ6','chef_service',11,5,NULL),
(6,'BOUMAH','Eric','eric.boumah@dgi.ga','$2y$10$FycqSj3qlsQCfIOJzIBpzeg83d39Cco/EVrw3bvLEBe/DM.JdbeqC','dg',12,NULL,'20250403E'),
(7,'NYANGONE','Diane Kaïda','diene-kaida.nyangone.dgi.ga','$2y$10$lHkTRVikCWgLkkq5v2fUy.LEbY1G5oq0Ofj1sPVP1eqqaP3T8pB7y','secretaire',2,NULL,'20250403N'),
(8,'OMBOUMA','Fabien Junior','fabien.ombouma@dgi.ga','$2y$10$UblvFVu8NCZZwaYaoLhCo.Ctuvga5EA.2cSgg4F31HXlelFElngz.','directeur',11,NULL,'20250403F'),
(9,'ANDJEMBE AMIRI','Larissa','larissa.adjembe@dgi.ga','$2y$10$75PRbyfLw9Irymzi.l.1iuDiJYWnm7YlOBLAUqmzgVQKAQNHZf1Gy','secretaire',11,NULL,'20250403L'),
(10,'NKOME NZOGHE','Gérard','gerard.nkoume@dgi.ga','$2y$10$FixjnL6xSMj9G5DmX5iRf.G0MWr05KaTZgEQ5Ur8cUPm13KxJ/XAW','directeur',2,NULL,'20250403N'),
(11,'POATY BOUANGA','Didace','poaty@dgi.ga','$2y$10$573Ch2Urmwpm0ONRFhhIze5anzC0QVSG6P.NLqKoH8Pkd11UyFPOe','agent',9,NULL,'111813F'),
(12,'BOUSSOUGOU','Régis','regis@dgi.ga','$2y$10$L2EwUjcfSOoZfHRTJr.LmOg6F7pZlDfv3npCJCiD5lwVBJsIc1YPu','charge_etude',12,NULL,'138631Z'),
(13,'ANGUE BOUSSOUGOU Epse MINKO MINKO','Stéphanie','stephanie@dgi.ga','$2y$10$w69krIII9zmIzhz6D4Cj3e0jqvvWOB3Jc.A.lY3AYQKK3/VoGs9WO','directeur',10,NULL,'139849D'),
(14,'DIVOUNGUI MAGANGA','Franck Armel','armel@dgi.ga','$2y$10$p9SghGE4CzUYqpzYXBS2ouVg.1KNdcibJUcgxb9q1/zbPOTcQwxzy','agent',10,NULL,'184159T'),
(15,'ETOGHO Epse NZOUBOU','Hermine Pascale','pascale@dgi.ga','$2y$10$Kf8tGgd0eoTZ/MzchbN3/O3bMX.etUtMSUW.64EEZHcxzwHuhdL3y','directeur',5,NULL,'142111N'),
(16,'OYINI LEMANDI','Zita Flora','zita@dgi.ga','$2y$10$esaHGAel8R/hGAcw8xtAku6r8Ksq5HUF9NkfQFv.gyDDOjgHu.NWm','directeur_adjoint',5,NULL,'136190Y'),
(17,'ALLANDZI EVOUONY','Rachelle','rachelle@dgi.ga','$2y$10$4X41l.6KlaTlLndTjKv85OCmTyE2KxTcIHkQIXgU4/YixpNSz0tKG','secretaire',5,NULL,'119826R'),
(18,'NDZOUMBANGOYE','Ghislain','ghislain@dgi.ga','$2y$10$d3I0WQh9UFAGSUl8eu2.9OrfEqT.clmzBjUKNwJzoGyB496LZJSla','directeur',6,NULL,'163303C'),
(19,'MBA NKOGHE Elzie Frédérique','Marcelle','marcelle@dgi.ga','$2y$10$nIObtrsBV/VWjlY2xhMnduT9kxSE.ilPjlTnLG5zb9J7UEfyCEqGa','secretaire',6,NULL,'202203017140T'),
(20,'CAPITO','Carl-Eugène','carl@dgi.ga','$2y$10$GhZm/m..NZaw5CzJXuwGp.R8cXEAn6A4YYKCCB93r.DufEy4VouwO','directeur',4,NULL,'126002G'),
(21,'MAGANGA MOUVELHOT','Carine','carine@dgi.ga','$2y$10$MQtiq6W7QobapgycqrDETOqXGx87SvkqeDGuAjy2tn3ogHt0V/rVa','secretaire',4,NULL,'138722E'),
(22,'EYOUGA','Pamphile','pamphile@dgi.ga','$2y$10$ssuHgfdtAGf5GaKtPXO62OAsCsMFWTtz2yIE/A2eajfLtqnJBpsq6','adjoint_dg',12,NULL,'136275P'),
(32,'ARISSANI','Laetitia','laetitia.arissani@dgi.ga','$2y$10$L0dfWAU.gRTUFR3LRvRz5edvFojymobLD5avGHjQTWF5uptf9gLxK','secretaire_dg',12,NULL,'163325A');
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

-- Dump completed on 2025-04-04 15:59:01
