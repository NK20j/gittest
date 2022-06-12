-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: java20
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `chiTietDonHang`
--

DROP TABLE IF EXISTS `chiTietDonHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chiTietDonHang` (
  `donHangCode` int NOT NULL AUTO_INCREMENT,
  `sanPhamCode` int NOT NULL,
  `soLuong` int NOT NULL,
  `giaBan` int NOT NULL,
  `giamGia` int NOT NULL,
  `thanhTien` int NOT NULL,
  KEY `chiTiet_donHang_idx` (`donHangCode`),
  KEY `chiTiet_sanPham_idx` (`sanPhamCode`),
  CONSTRAINT `chiTiet_donHang` FOREIGN KEY (`donHangCode`) REFERENCES `donHang` (`donHangCode`),
  CONSTRAINT `chiTiet_sanPham` FOREIGN KEY (`sanPhamCode`) REFERENCES `sanPham` (`sanPhamCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chiTietDonHang`
--

LOCK TABLES `chiTietDonHang` WRITE;
/*!40000 ALTER TABLE `chiTietDonHang` DISABLE KEYS */;
INSERT INTO `chiTietDonHang` VALUES (1,2,10,30000000,0,6000000),(2,3,5,30000000,20000,28383839);
/*!40000 ALTER TABLE `chiTietDonHang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-17 20:44:01
