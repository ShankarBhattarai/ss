/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.0.10-MariaDB : Database - ss
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `ss`;

/*Table structure for table `providers` */

DROP TABLE IF EXISTS `providers`;

CREATE TABLE `providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `providers` */

insert  into `providers`(`id`,`shortname`,`name`) values (1,'shankar','Shankar Bhattarai'),(2,'dinesh','Dinesh K. Roy');

/*Table structure for table `servers` */

DROP TABLE IF EXISTS `servers`;

CREATE TABLE `servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `passkey` varchar(200) NOT NULL,
  `rrdstep` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `servers` */

insert  into `servers`(`id`,`provider`,`name`,`passkey`,`rrdstep`) values (1,1,'vaio','ab69137a60ec019a1ccec2ca0a3897595280b7cf',300),(2,2,'dinesh','7a2b3a7f079948aba665a220b24e4c728480ee24',300);

/*Table structure for table `stats` */

DROP TABLE IF EXISTS `stats`;

CREATE TABLE `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serverid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `uptime` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `memtotal` int(11) NOT NULL,
  `memused` int(11) NOT NULL,
  `memfree` int(11) NOT NULL,
  `membuffers` int(11) NOT NULL,
  `disktotal` int(11) NOT NULL,
  `diskused` int(11) NOT NULL,
  `diskfree` int(11) NOT NULL,
  `load1` float NOT NULL,
  `load5` float NOT NULL,
  `load15` float NOT NULL,
  `interfaces` text NOT NULL,
  `processes` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serverid_uniq` (`serverid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `stats` */

insert  into `stats`(`id`,`serverid`,`time`,`uptime`,`status`,`memtotal`,`memused`,`memfree`,`membuffers`,`disktotal`,`diskused`,`diskfree`,`load1`,`load5`,`load15`,`interfaces`,`processes`) values (9,1,1438674868,'16:58',1,5870,4348,1521,2397,35,18,20,0.49,0.59,0.64,'{\"eth0\":[59676361,86945,0,0,0,0,0,0,11703826,74677,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":227}');

/*Table structure for table `stats_current` */

DROP TABLE IF EXISTS `stats_current`;

CREATE TABLE `stats_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serverid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `uptime` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `memtotal` int(11) NOT NULL,
  `memused` int(11) NOT NULL,
  `memfree` int(11) NOT NULL,
  `membuffers` int(11) NOT NULL,
  `disktotal` int(11) NOT NULL,
  `diskused` int(11) NOT NULL,
  `diskfree` int(11) NOT NULL,
  `load1` float NOT NULL,
  `load5` float NOT NULL,
  `load15` float NOT NULL,
  `interfaces` text NOT NULL,
  `processes` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serverid_uniq` (`serverid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `stats_current` */

insert  into `stats_current`(`id`,`serverid`,`time`,`uptime`,`status`,`memtotal`,`memused`,`memfree`,`membuffers`,`disktotal`,`diskused`,`diskfree`,`load1`,`load5`,`load15`,`interfaces`,`processes`) values (1,1,1438687978,'1:47',1,5870,5450,419,3764,136,78,62,0.1,0.34,0.88,'{\"eth0\":[843852160,637525,0,0,0,0,0,0,70810421,463191,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":254}');

/*Table structure for table `stats_history` */

DROP TABLE IF EXISTS `stats_history`;

CREATE TABLE `stats_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serverid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `uptime` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `memtotal` int(11) NOT NULL,
  `memused` int(11) NOT NULL,
  `memfree` int(11) NOT NULL,
  `membuffers` int(11) NOT NULL,
  `disktotal` int(11) NOT NULL,
  `diskused` int(11) NOT NULL,
  `diskfree` int(11) NOT NULL,
  `load1` float NOT NULL,
  `load5` float NOT NULL,
  `load15` float NOT NULL,
  `interfaces` text NOT NULL,
  `processes` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_uniq` (`time`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

/*Data for the table `stats_history` */

insert  into `stats_history`(`id`,`serverid`,`time`,`uptime`,`status`,`memtotal`,`memused`,`memfree`,`membuffers`,`disktotal`,`diskused`,`diskfree`,`load1`,`load5`,`load15`,`interfaces`,`processes`) values (201,1,1438687978,'1:47',1,5870,5450,419,3764,136,78,62,0.1,0.34,0.88,'{\"eth0\":[843852160,637525,0,0,0,0,0,0,70810421,463191,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":254}'),(200,1,1438687918,'1:46',1,5870,5462,407,3764,136,78,62,0.11,0.4,0.93,'{\"eth0\":[843833140,637422,0,0,0,0,0,0,70752828,463065,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":254}'),(199,1,1438687858,'1:45',1,5870,5424,445,3759,136,78,62,0.29,0.49,1,'{\"eth0\":[843804152,637302,0,0,0,0,0,0,70690391,462913,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":250}'),(198,1,1438687798,'1:44',1,5870,5293,577,3759,136,78,62,0.03,0.5,1.04,'{\"eth0\":[843737733,637018,0,0,0,0,0,0,70565642,462611,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":249}'),(197,1,1438687739,'1:43',1,5870,5291,578,3759,136,78,62,0.09,0.62,1.1,'{\"eth0\":[843734068,636982,0,0,0,0,0,0,70560231,462577,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":250}'),(196,1,1438687679,'1:42',1,5870,5287,583,3759,136,78,62,0.24,0.75,1.18,'{\"eth0\":[843730548,636949,0,0,0,0,0,0,70555613,462547,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":250}'),(195,1,1438687618,'1:41',1,5870,5303,567,3756,136,78,62,0.5,0.9,1.25,'{\"eth0\":[843708136,636826,0,0,0,0,0,0,70532237,462448,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":253}'),(194,1,1438687558,'1:40',1,5870,5293,577,3699,136,78,62,0.58,0.97,1.29,'{\"eth0\":[843703766,636785,0,0,0,0,0,0,70526328,462406,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":254}'),(193,1,1438687498,'1:39',1,5870,4707,1163,3417,136,78,62,0.12,1.01,1.33,'{\"eth0\":[830896363,627924,0,0,0,0,0,0,70204670,457888,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":244}'),(192,1,1438687438,'1:38',1,5870,4735,1135,3415,136,78,62,0.33,1.23,1.41,'{\"eth0\":[827095519,624495,0,0,0,0,0,0,69901762,455377,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":255}'),(191,1,1438687378,'1:37',1,5870,4689,1180,3414,136,78,62,0.15,1.43,1.49,'{\"eth0\":[825628347,623249,0,0,0,0,0,0,69806838,454469,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":244}'),(190,1,1438687318,'1:36',1,5870,4695,1174,3412,136,78,62,0.42,1.75,1.58,'{\"eth0\":[825617951,623149,0,0,0,0,0,0,69795698,454397,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":245}'),(189,1,1438687258,'1:35',1,5870,4560,1309,3416,136,78,62,1.13,2.14,1.69,'{\"eth0\":[825527414,622913,0,0,0,0,0,0,69766289,454176,0,0,0,0,0,0]}','{\"runsvc\":2,\"allsvc\":3,\"svcs\":{\"\\/usr\\/sbin\\/mysqld\":true,\"\\/usr\\/sbin\\/sshd\":true,\"\\/usr\\/sbin\\/httpd\":false},\"allps\":245}'),(188,1,1438687200,'1:34',1,5870,4570,1299,3426,136,78,62,1.82,2.47,1.76,'{\"eth0\":[

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
