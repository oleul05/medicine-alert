-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.26


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema medical
--

CREATE DATABASE IF NOT EXISTS medical;
USE medical;

--
-- Definition of table `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
CREATE TABLE `medical_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `disease` varchar(100) DEFAULT NULL,
  `severity` varchar(45) DEFAULT NULL,
  `hospital` varchar(45) DEFAULT NULL,
  `medicinename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medical_history`
--

/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;


--
-- Definition of table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicinename` varchar(45) DEFAULT NULL,
  `reactionwith` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` (`id`,`medicinename`,`reactionwith`) VALUES 
 (1,'Levothyroxine','Escitalopram,Azithromycin'),
 (2,'Hydrocodone/APAP','Metformin,Sertraline'),
 (3,'Amoxicillin','Furosemide,Omeprazole,Trazodone'),
 (4,'Lisinopril','Esomeprazole,Atorvastatin'),
 (5,'Esomeprazole','Lisinopril,Atorvastatin'),
 (6,'Atorvastatin','Lisinopril,Esomeprazole'),
 (7,'Simvastatin',NULL),
 (8,'Clopidogrel',NULL),
 (9,'Montelukast',NULL),
 (10,'Rosuvastatin',NULL),
 (11,'Metoprolol',NULL),
 (12,'Escitalopram',NULL),
 (13,'Azithromycin','Levothyroxine'),
 (14,'Albuterol',NULL),
 (15,'Hydrochlorothiazide',NULL),
 (16,'Metformin',NULL),
 (17,'Sertraline',NULL),
 (18,'Ibuprofen',NULL),
 (19,'Zolpidem',NULL),
 (20,'Furosemide',NULL),
 (21,'Omeprazole',NULL),
 (22,'Trazodone',NULL),
 (23,'Valsartan',NULL),
 (24,'Tramadol',NULL),
 (25,'Duloxetine',NULL),
 (26,'Warfarin',NULL),
 (27,'Amlodipine',NULL),
 (28,'Oxycodone/APAP',NULL),
 (29,'Quetiapine',NULL),
 (30,'Promethazine',NULL),
 (31,'Fluticasone',NULL),
 (32,'Alprazolam',NULL);
INSERT INTO `medicine` (`id`,`medicinename`,`reactionwith`) VALUES 
 (33,'Clonazepam',NULL),
 (34,'Benazepril',NULL),
 (35,'Meloxicam',NULL),
 (36,'Citalopram',NULL),
 (37,'Cephalexin',NULL),
 (38,'Tiotropium',NULL),
 (39,'Gabapentin',NULL),
 (40,'Aripiprazole',NULL),
 (41,'Potassium',NULL),
 (42,'Cyclobenzaprine',NULL),
 (43,'Methylprednisolone',NULL),
 (44,'Methylphenidate',NULL),
 (45,'Loratadine',NULL),
 (46,'Carvedilol',NULL),
 (47,'Carisoprodol',NULL),
 (48,'Digoxin',NULL),
 (49,'Memantine',NULL),
 (50,'Atenolol',NULL),
 (51,'Diazepam',NULL),
 (52,'Oxycodone',NULL),
 (53,'Risedronate',NULL),
 (54,'Folic Acid',NULL),
 (55,'Losartan + HCTZ',NULL),
 (56,'Prednisone',NULL),
 (57,'Prednisolone',NULL),
 (58,'Alendronate',NULL),
 (59,'Pantoprazole',NULL),
 (60,'Tamsulosin',NULL),
 (61,'Triamterene + HCTZ',NULL),
 (62,'Paroxetine',NULL),
 (63,'Buprenorphine + Naloxone',NULL),
 (64,'Enalapril',NULL),
 (65,'Lovastatin',NULL),
 (66,'Pioglitazone',NULL),
 (67,'Pravastatin',NULL),
 (68,'Fluoxetine',NULL),
 (69,'Insulin Detemir',NULL);
INSERT INTO `medicine` (`id`,`medicinename`,`reactionwith`) VALUES 
 (70,'Fluconazole',NULL),
 (71,'Levofloxacin',NULL),
 (72,'Rivaroxaban',NULL),
 (73,'Celecoxib',NULL),
 (74,'Codeine / APAP',NULL),
 (75,'Mometasone',NULL),
 (76,'Ciprofloxacin',NULL),
 (77,'Pregabalin',NULL),
 (78,'Insulin Aspart',NULL),
 (79,'Venlafaxine',NULL),
 (80,'Lorazepam',NULL),
 (81,'Ezetimibe',NULL),
 (82,'Estrogen',NULL),
 (83,'Allopurinol',NULL),
 (84,'Penicillin',NULL),
 (85,'Sitagliptin',NULL),
 (86,'Amitriptyline',NULL),
 (87,'Clonidine',NULL),
 (88,'Latanoprost',NULL),
 (89,'Lisdexamfetamine',NULL),
 (90,'Fluticasone + Salmeterol',NULL),
 (91,'Budesonide + Formoterol',NULL),
 (92,'Dexlansoprazole',NULL),
 (93,'Glyburide',NULL),
 (94,'Olanzapine',NULL),
 (95,'Tolterodine',NULL),
 (96,'Ranitidine',NULL),
 (97,'Famotidine',NULL),
 (98,'Diltiazem',NULL),
 (99,'Insulin Glargine',NULL),
 (100,'Lisinopril + HCTZ',NULL);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;


--
-- Definition of table `patient_details`
--

DROP TABLE IF EXISTS `patient_details`;
CREATE TABLE `patient_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bloodgroup` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `disease` varchar(100) DEFAULT NULL,
  `hospital` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_details`
--

/*!40000 ALTER TABLE `patient_details` DISABLE KEYS */;
INSERT INTO `patient_details` (`id`,`patient_name`,`dob`,`address`,`bloodgroup`,`gender`,`disease`,`hospital`) VALUES 
 (8,'Bob Dilon','1984-02-09','Test','A+','male','Common Cold','Hospital 1');
/*!40000 ALTER TABLE `patient_details` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `password` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`username`,`fname`,`lname`,`password`) VALUES 
 (1,'xyz@gmail.com','Ashis','User','123456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
