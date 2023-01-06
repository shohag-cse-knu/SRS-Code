/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.0.38-MariaDB : Database - ruforum_bd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `ruforum_bd`;

/*Table structure for table `push_notification` */

DROP TABLE IF EXISTS `push_notification`;

CREATE TABLE `push_notification` (
  `push_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `browserid` varchar(100) NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`push_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `push_notification` */

insert  into `push_notification`(`push_id`,`browserid`,`userid`,`dateline`) values (29,'daf587b3-066d-4aa9-b2ce-f25ad310c110',303125,157670000),(30,'daf587b3-066d-4aa9-b2ce-f25ad310c110',303125,1576753538),(31,'daf587b3-066d-4aa9-b2ce-f25ad310c110',303125,1576755331),(32,'daf587b3-066d-4aa9-b2ce-f25ad310c110',303125,1576757437),(33,'daf587b3-066d-4aa9-b2ce-f25ad310c110',303125,1576757554),(34,'daf587b3-066d-4aa9-b2ce-f25ad310c110',303125,1576757692),(35,'daf587b3-066d-4aa9-b2ce-f25ad310c110',303108,1578576427);

/*Table structure for table `push_notification_key` */

DROP TABLE IF EXISTS `push_notification_key`;

CREATE TABLE `push_notification_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appId` varchar(100) NOT NULL,
  `authKey` varchar(100) NOT NULL,
  `active` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `push_notification_key` */

insert  into `push_notification_key`(`id`,`appId`,`authKey`,`active`) values (1,'825eca01-a720-4049-bc21-0513c5c25564','OTRhYmRmMzEtM2M1Yi00ZTRmLTk5YzgtZDkyMjM2YzVmMDg4',1);

/*Table structure for table `push_notification_send` */

DROP TABLE IF EXISTS `push_notification_send`;

CREATE TABLE `push_notification_send` (
  `push_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `threadid` int(10) unsigned NOT NULL,
  `sendstatus` int(10) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`push_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `push_notification_send` */

insert  into `push_notification_send`(`push_id`,`userid`,`threadid`,`sendstatus`,`dateline`) values (2,303125,119079,1,1576757673),(4,303128,96435,1,1578576510),(6,303119,96435,1,1578577342);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
