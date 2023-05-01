CREATE DATABASE  IF NOT EXISTS `little_lemon_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `little_lemon_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: little_lemon_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `BookingID` int NOT NULL,
  `Date` date NOT NULL,
  `TableNo` int NOT NULL,
  `Staff_StaffID` int NOT NULL,
  `Customers_CustomerID` int NOT NULL,
  `Orders_OrderID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_Bookings_Staff_idx` (`Staff_StaffID`),
  KEY `fk_Bookings_Customers1_idx` (`Customers_CustomerID`),
  KEY `fk_Bookings_Orders1_idx` (`Orders_OrderID`),
  CONSTRAINT `fk_Bookings_Customers1` FOREIGN KEY (`Customers_CustomerID`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `fk_Bookings_Orders1` FOREIGN KEY (`Orders_OrderID`) REFERENCES `Orders` (`OrderID`),
  CONSTRAINT `fk_Bookings_Staff` FOREIGN KEY (`Staff_StaffID`) REFERENCES `Staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `ContactNumber` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuItems`
--

DROP TABLE IF EXISTS `MenuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItems` (
  `MenuItemID` int NOT NULL,
  `Starter` varchar(45) NOT NULL,
  `Dessert` varchar(45) NOT NULL,
  `Course` varchar(45) NOT NULL,
  `Drinks` varchar(45) NOT NULL,
  PRIMARY KEY (`MenuItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItems`
--

LOCK TABLES `MenuItems` WRITE;
/*!40000 ALTER TABLE `MenuItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `MenuItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menus`
--

DROP TABLE IF EXISTS `Menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menus` (
  `MenuID` int NOT NULL,
  `MenuName` varchar(100) NOT NULL,
  `Orders_OrderID` int NOT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `fk_Menu_Orders1_idx` (`Orders_OrderID`),
  CONSTRAINT `fk_Menu_Orders1` FOREIGN KEY (`Orders_OrderID`) REFERENCES `Orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menus`
--

LOCK TABLES `Menus` WRITE;
/*!40000 ALTER TABLE `Menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menus_has_MenuItems`
--

DROP TABLE IF EXISTS `Menus_has_MenuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menus_has_MenuItems` (
  `Menus_MenuID` int NOT NULL,
  `MenuItems_MenuItemID` int NOT NULL,
  PRIMARY KEY (`Menus_MenuID`,`MenuItems_MenuItemID`),
  KEY `fk_Menus_has_MenuItems_MenuItems1_idx` (`MenuItems_MenuItemID`),
  KEY `fk_Menus_has_MenuItems_Menus1_idx` (`Menus_MenuID`),
  CONSTRAINT `fk_Menus_has_MenuItems_MenuItems1` FOREIGN KEY (`MenuItems_MenuItemID`) REFERENCES `MenuItems` (`MenuItemID`),
  CONSTRAINT `fk_Menus_has_MenuItems_Menus1` FOREIGN KEY (`Menus_MenuID`) REFERENCES `Menus` (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menus_has_MenuItems`
--

LOCK TABLES `Menus_has_MenuItems` WRITE;
/*!40000 ALTER TABLE `Menus_has_MenuItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `Menus_has_MenuItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDeliveryStatus`
--

DROP TABLE IF EXISTS `OrderDeliveryStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDeliveryStatus` (
  `OrderDeliveryID` int NOT NULL,
  `DeliveryDate` date NOT NULL,
  `DeliveryStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderDeliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDeliveryStatus`
--

LOCK TABLES `OrderDeliveryStatus` WRITE;
/*!40000 ALTER TABLE `OrderDeliveryStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderDeliveryStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL,
  `OrderDate` date NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` int NOT NULL,
  `OrderDeliveryStatus_OrderDeliveryID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Orders_OrderDeliveryStatus1_idx` (`OrderDeliveryStatus_OrderDeliveryID`),
  CONSTRAINT `fk_Orders_OrderDeliveryStatus1` FOREIGN KEY (`OrderDeliveryStatus_OrderDeliveryID`) REFERENCES `OrderDeliveryStatus` (`OrderDeliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` int NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Salary` varchar(45) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 14:44:34
