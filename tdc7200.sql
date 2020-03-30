# Host: 127.0.0.1  (Version: 5.5.15)
# Date: 2020-03-05 19:40:52
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'a','a'),(2,'aaa','1'),(3,'mmm','111'),(4,'li','1'),(5,'aa','aa'),(6,'1','1');

#
# Structure for table "daydata"
#

DROP TABLE IF EXISTS `daydata`;
CREATE TABLE `daydata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year_` int(11) DEFAULT NULL,
  `data` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_daydata_user` (`uid`),
  CONSTRAINT `fk_daydata_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "daydata"
#

INSERT INTO `daydata` VALUES (1,1,2,3,2020,33.30);
