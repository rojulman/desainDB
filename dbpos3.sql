-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: dbpos3
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jenis_produk`
--

DROP TABLE IF EXISTS `jenis_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_produk`
--

LOCK TABLES `jenis_produk` WRITE;
/*!40000 ALTER TABLE `jenis_produk` DISABLE KEYS */;
INSERT INTO `jenis_produk` VALUES (1,'elektronik'),(2,'furniture'),(3,'makanan'),(4,'minuman'),(5,'komputer');
/*!40000 ALTER TABLE `jenis_produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kartu`
--

DROP TABLE IF EXISTS `kartu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kartu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(6) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `iuran` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_UNIQUE` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kartu`
--

LOCK TABLES `kartu` WRITE;
/*!40000 ALTER TABLE `kartu` DISABLE KEYS */;
INSERT INTO `kartu` VALUES (1,'GOLD','Gold Utama',0.05,100000),(2,'PLAT','Platinum Jaya',0.1,150000),(3,'SLV','Silver',0.025,50000),(4,'NO','Non Member',0,0);
/*!40000 ALTER TABLE `kartu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `tmp_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `kartu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pelanggan_kartu1_idx` (`kartu_id`),
  KEY `idx_nama_pelanggan` (`nama`),
  KEY `idx_tgllahir_pelanggan` (`tgl_lahir`),
  CONSTRAINT `fk_pelanggan_kartu1` FOREIGN KEY (`kartu_id`) REFERENCES `kartu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1,'C001','Agung Sedayu','L','Solo','2010-01-01','sedayu@gmail.com',1),(2,'C002','Pandan Wangi','P','Yogyakarta','1982-03-20','wangi@gmail.com',2),(3,'C003','Sekar Mirah','P','Kediri','1983-02-20','mirah@yahoo.com',1),(4,'C004','Swandaru Geni','L','Kediri','1981-01-04','swandaru@yahoo.com',4),(5,'C005','Pradabashu','L','Pati','1985-04-02','prada85@gmail.com',2),(6,'C006','Gayatri Dwi','P','Jakarta','1987-11-28','gaya87@gmail.com',1),(7,'C007','Dewi Gyat','P','Jakarta','1988-12-01','giyat@gmail.com',1),(8,'C008','Andre Haru','L','Surabaya','1990-07-15','andre.haru@gmail.com',4),(9,'C009','Ahmad Hasan','L','Surabaya','1992-10-15','ahasan@gmail.com',4),(10,'C010','Cassanndra','P','Belfast','1990-11-20','casa90@gmail.com',1),(11,'C011','Fredelina Putri','P','Bogor','2000-05-16','fred@gmail.com',2),(12,'C012','Rara Wulan','P','Yogyakarta','1999-06-26','rarawulan@gmail.com',2),(13,'C013','Mas Agus','L','Cirebon','1985-08-08','agusmas@gmail.com',1),(14,'C013','Septian Chandra','L','Semarang','1998-09-11','chandrasep@gmail.com',1);
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nokuitansi` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `ke` int(11) DEFAULT NULL,
  `pesanan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nokuitansi_UNIQUE` (`nokuitansi`),
  KEY `fk_pembayaran_pesanan1_idx` (`pesanan_id`),
  CONSTRAINT `fk_pembayaran_pesanan1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembelian`
--

DROP TABLE IF EXISTS `pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` varchar(45) DEFAULT NULL,
  `nomor` varchar(10) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomor_UNIQUE` (`nomor`),
  KEY `fk_1_idx` (`produk_id`),
  KEY `fk_2_idx` (`vendor_id`),
  CONSTRAINT `fk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembelian`
--

LOCK TABLES `pembelian` WRITE;
/*!40000 ALTER TABLE `pembelian` DISABLE KEYS */;
INSERT INTO `pembelian` VALUES (1,'2019-07-24','AO01-00001',1,10,3500000,1),(2,'2019-07-24','AO01-00002',2,10,5500000,1),(3,'2019-07-24','AO01-00003',3,10,3500000,1),(4,'2019-07-25','BO01-00001',1,15,3500000,2),(5,'2019-07-25','BO01-00002',2,15,5500000,2),(6,'2019-07-25','BO01-00003',3,15,3500000,2);
/*!40000 ALTER TABLE `pembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan`
--

DROP TABLE IF EXISTS `pesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pelanggan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pesanan_customer_idx` (`pelanggan_id`),
  CONSTRAINT `fk_pesanan_customer` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan`
--

LOCK TABLES `pesanan` WRITE;
/*!40000 ALTER TABLE `pesanan` DISABLE KEYS */;
INSERT INTO `pesanan` VALUES (1,'2015-11-04',25000,1),(2,'2015-11-04',150000,3),(3,'2015-11-04',450000,6),(4,'2015-11-04',700000,7),(5,'2015-11-04',1250000,10),(6,'2015-11-04',300000,2),(7,'2015-11-04',875000,5),(8,'2015-11-04',800000,4),(9,'2015-11-04',1800000,8),(10,'2015-11-04',2250000,9),(11,'2016-01-05',825000,3),(12,'2016-01-05',1500000,5),(13,'2016-01-05',2600000,8),(14,'2016-01-05',3150000,9),(15,'2016-01-05',4500000,12),(16,'2016-01-05',1600000,4),(17,'2016-01-05',2975000,7),(18,'2016-01-05',2700000,6),(19,'2016-01-05',4750000,10),(20,'2016-01-05',5500000,11),(21,'2016-02-03',5250000,10),(22,'2016-02-03',2200000,4),(23,'2016-02-03',8050000,14),(24,'2016-02-03',1800000,3),(25,'2016-02-03',5625000,9),(26,'2016-02-03',4550000,7),(27,'2016-02-03',9450000,14),(28,'2016-02-03',700000,1),(29,'2016-02-03',6525000,9),(30,'2016-02-03',3000000,4),(31,'2016-02-03',8525000,11),(32,'2016-02-03',8800000,11),(33,'2016-02-03',825000,1),(34,'2016-02-03',3400000,4),(35,'2016-02-03',11375000,13),(36,'2016-02-03',900000,1),(37,'2016-02-03',925000,1),(38,'2016-02-03',8550000,9),(39,'2016-02-03',975000,1),(40,'2016-02-03',6000000,6),(41,'2019-07-26',0,2),(42,'2019-07-26',0,14),(46,'2019-07-26',0,9),(51,'2019-07-26',0,1),(64,'2019-07-26',0,4),(68,'2019-07-26',0,12),(73,'2019-07-26',0,13),(76,'2019-07-26',0,5),(77,'2019-07-26',0,3),(79,'2019-07-26',0,10),(94,'2019-07-29',0,11),(99,'2019-07-29',0,4),(102,'2019-07-29',0,7),(106,'2019-07-29',0,4),(110,'2019-07-29',0,5),(111,'2019-07-29',0,14),(114,'2019-07-29',0,4),(121,'2019-07-29',0,11),(147,'2019-07-29',0,13),(152,'2019-07-29',0,10);
/*!40000 ALTER TABLE `pesanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan_items`
--

DROP TABLE IF EXISTS `pesanan_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produk_id` int(11) NOT NULL,
  `pesanan_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pesanan_items_pesanan1_idx` (`pesanan_id`),
  KEY `fk_pesanan_items_produk1_idx` (`produk_id`),
  CONSTRAINT `fk_pesanan_items_pesanan1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pesanan_items_produk1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan_items`
--

LOCK TABLES `pesanan_items` WRITE;
/*!40000 ALTER TABLE `pesanan_items` DISABLE KEYS */;
INSERT INTO `pesanan_items` VALUES (1,1,1,1,5040000),(2,3,1,1,4680000),(3,5,2,5,3500),(6,5,3,10,3500),(7,1,3,1,5040000),(9,5,5,10,3500),(10,5,6,20,3500);
/*!40000 ALTER TABLE `pesanan_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `harga_beli` double DEFAULT NULL,
  `harga_jual` double DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `min_stok` int(11) DEFAULT NULL,
  `jenis_produk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_UNIQUE` (`kode`),
  KEY `fk_produk_jenis_produk1_idx` (`jenis_produk_id`),
  CONSTRAINT `fk_produk_jenis_produk1` FOREIGN KEY (`jenis_produk_id`) REFERENCES `jenis_produk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES (1,'TV01','Televisi 21 inch',3500000,3850000,10,2,1),(2,'TV02','Televisi 40 inch',5500000,6050000,8,2,1),(3,'K001','Kulkas 2 pintu',3500000,3850000,12,2,1),(4,'M001','Meja Makan',500000,550000,2,3,2),(5,'TK01','Teh Kotak',3000,3300,12,10,4),(6,'PC01','PC Desktop HP',7000000,7700000,18,2,5),(7,'TB01','Teh Botol',2000,2200,106,10,4),(8,'AC01','Notebook Acer',8000000,8800000,2,2,5),(9,'LN01','Notebook Lenovo',9000000,9900000,1,2,5),(10,'L004','Laptop HP',12000000,13200000,2,5,5);
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomor` varchar(4) DEFAULT NULL,
  `nama` varchar(40) NOT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `kontak` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomor` (`nomor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'V001','PT Buana Dewi','Bogor','Dewi Sri'),(2,'V002','PT Kawan Sejati','Bekasi','Wawan De'),(3,'V003','CV Asli Jawa','Purwokerto','Tole Adi'),(4,'V004','PT Hayo Maju','Jakarta','Dadan Kusuma');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-29  9:44:58
