/*
Navicat MySQL Data Transfer

Source Server         : lalala
Source Server Version : 50554
Source Host           : 180.76.174.6:3306
Source Database       : ruby

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-05-28 17:20:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `addressable_type` varchar(255) DEFAULT NULL,
  `addressable_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addresses_on_addressable_id` (`addressable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', '望京西-地铁站', '40.001109', '116.455596', '', 'User', '2', '2017-02-24 15:57:23', '2017-02-24 15:57:23');
INSERT INTO `addresses` VALUES ('2', '海淀黄庄-地铁站', '39.981865', '116.324348', '', 'User', '2', '2017-02-24 15:57:49', '2017-02-24 15:57:49');
INSERT INTO `addresses` VALUES ('3', '中关村-地铁站', '39.989956', '116.323066', '', 'Station', '2', '2017-02-24 16:14:06', '2017-02-24 16:26:57');
INSERT INTO `addresses` VALUES ('4', '中关村-地铁站', '39.989956', '116.323066', '', 'Courier', '1', '2017-02-24 16:14:06', '2017-02-24 16:26:57');
INSERT INTO `addresses` VALUES ('5', '望京西-地铁站', '40.001109', '116.455596', '', 'Factory', '1', '2017-02-24 15:57:23', '2017-02-24 15:57:23');

-- ----------------------------
-- Table structure for ar_internal_metadata
-- ----------------------------
DROP TABLE IF EXISTS `ar_internal_metadata`;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ar_internal_metadata
-- ----------------------------
INSERT INTO `ar_internal_metadata` VALUES ('environment', 'development', '2017-02-24 15:24:20', '2017-02-24 15:24:20');

-- ----------------------------
-- Table structure for cal_rules
-- ----------------------------
DROP TABLE IF EXISTS `cal_rules`;
CREATE TABLE `cal_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base` float DEFAULT NULL,
  `extra` float DEFAULT NULL,
  `person_type` int(11) DEFAULT NULL COMMENT '0:取送 1:工厂',
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cal_rules
-- ----------------------------
INSERT INTO `cal_rules` VALUES ('1', '1', '0.5', '0', null, '2017-05-17 22:48:08', '2017-05-20 08:28:36');
INSERT INTO `cal_rules` VALUES ('2', '1', '0.99', '1', null, '2017-05-17 22:48:20', '2017-05-18 16:32:00');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '洗衣', 'test1', '0', '2017-02-24 15:41:59', '2017-04-14 16:56:33');
INSERT INTO `categories` VALUES ('2', '洗鞋', 'category-1487430865976', '0', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `categories` VALUES ('3', '洗家纺', 'category-1487430865976', '0', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `categories` VALUES ('4', '窗帘清洗', 'category-1487430865976', '0', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `categories` VALUES ('8', '144123', '', '0', '2017-05-27 02:02:30', '2017-05-27 02:02:30');

-- ----------------------------
-- Table structure for categories_cities
-- ----------------------------
DROP TABLE IF EXISTS `categories_cities`;
CREATE TABLE `categories_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_cities_on_city_id` (`city_id`),
  KEY `index_categories_cities_on_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories_cities
-- ----------------------------
INSERT INTO `categories_cities` VALUES ('1', '1', '1');
INSERT INTO `categories_cities` VALUES ('2', '1', '2');
INSERT INTO `categories_cities` VALUES ('3', '1', '3');
INSERT INTO `categories_cities` VALUES ('4', '1', '4');
INSERT INTO `categories_cities` VALUES ('5', '2', '1');
INSERT INTO `categories_cities` VALUES ('6', '2', '3');
INSERT INTO `categories_cities` VALUES ('7', '3', '1');

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cities_on_region_id` (`region_id`),
  CONSTRAINT `fk_rails_e0ef2914ca` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES ('1', '北京市', '110100', '2017-02-24 15:43:21', '2017-02-24 15:43:21');
INSERT INTO `cities` VALUES ('2', '天津市', '120100', '2017-02-24 15:48:05', '2017-02-24 15:48:05');
INSERT INTO `cities` VALUES ('3', '北京市', '110100', '2017-04-08 08:58:50', '2017-04-08 08:58:50');
INSERT INTO `cities` VALUES ('4', '', null, '2017-04-08 09:06:11', '2017-04-08 09:06:11');

-- ----------------------------
-- Table structure for cities_promotion_rules
-- ----------------------------
DROP TABLE IF EXISTS `cities_promotion_rules`;
CREATE TABLE `cities_promotion_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `promotion_rule_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cities_promotion_rules_on_city_id` (`city_id`),
  KEY `index_cities_promotion_rules_on_promotion_rule_id` (`promotion_rule_id`),
  CONSTRAINT `fk_rails_5fb2354136` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `fk_rails_e7275526d5` FOREIGN KEY (`promotion_rule_id`) REFERENCES `promotion_rules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cities_promotion_rules
-- ----------------------------

-- ----------------------------
-- Table structure for cities_workers
-- ----------------------------
DROP TABLE IF EXISTS `cities_workers`;
CREATE TABLE `cities_workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cities_workers_on_city_id` (`city_id`),
  KEY `index_cities_workers_on_worker_id` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cities_workers
-- ----------------------------
INSERT INTO `cities_workers` VALUES ('1', '1', '3');
INSERT INTO `cities_workers` VALUES ('2', '2', '3');
INSERT INTO `cities_workers` VALUES ('3', '2', '1');

-- ----------------------------
-- Table structure for coupon_lists
-- ----------------------------
DROP TABLE IF EXISTS `coupon_lists`;
CREATE TABLE `coupon_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `validity_type` int(11) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `fixed_begin_term` int(11) DEFAULT NULL,
  `fixed_term` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_lists
-- ----------------------------
INSERT INTO `coupon_lists` VALUES ('24', '2周年大促', '2', '2017-05-01', '2017-06-30', '1', '1', '2017-05-18 14:29:15', '2017-05-18 14:29:15');
INSERT INTO `coupon_lists` VALUES ('34', '2.5周年', '1', '2017-05-19', '2017-05-19', '1', '1', '2017-05-19 15:51:19', '2017-05-20 06:47:59');
INSERT INTO `coupon_lists` VALUES ('36', '演示用', '1', '2017-05-18', '2017-06-15', '1', '1', '2017-05-26 15:36:39', '2017-05-26 15:36:39');
INSERT INTO `coupon_lists` VALUES ('37', '演示6', '1', '2017-05-10', '2017-06-23', '1', '1', '2017-05-27 02:05:45', '2017-05-27 02:05:45');

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_list_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vaild_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_coupons_on_coupon_list_id` (`coupon_list_id`),
  KEY `index_coupons_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_ff28daec78` FOREIGN KEY (`coupon_list_id`) REFERENCES `coupon_lists` (`id`),
  CONSTRAINT `fk_rails_69b54b3afe` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES ('18', '24', '3', '2017-05-20', '2017-05-21', '2017-05-19 15:41:49', '2017-05-19 15:41:49');
INSERT INTO `coupons` VALUES ('27', '34', '3', '2017-05-21', '2017-05-22', '2017-05-20 03:05:56', '2017-05-20 03:05:56');
INSERT INTO `coupons` VALUES ('30', '24', '3', '2017-05-21', '2017-05-22', '2017-05-20 03:06:05', '2017-05-20 03:06:05');
INSERT INTO `coupons` VALUES ('32', '24', '3', '2017-05-21', '2017-05-22', '2017-05-20 03:06:14', '2017-05-20 03:06:14');
INSERT INTO `coupons` VALUES ('33', '24', '3', '2017-05-21', '2017-05-22', '2017-05-20 03:06:17', '2017-05-20 03:06:17');
INSERT INTO `coupons` VALUES ('34', '24', '3', '2017-05-21', '2017-05-22', '2017-05-20 03:06:20', '2017-05-20 03:06:20');
INSERT INTO `coupons` VALUES ('35', '24', '3', '2017-05-21', '2017-05-22', '2017-05-20 08:33:22', '2017-05-20 08:33:22');
INSERT INTO `coupons` VALUES ('37', '34', '11', '2017-05-27', '2017-05-28', '2017-05-26 15:06:10', '2017-05-26 15:06:10');
INSERT INTO `coupons` VALUES ('39', '36', '11', '2017-05-28', '2017-05-29', '2017-05-27 01:34:06', '2017-05-27 01:34:06');
INSERT INTO `coupons` VALUES ('40', '36', '13', '2017-05-28', '2017-05-29', '2017-05-27 01:54:30', '2017-05-27 01:54:30');
INSERT INTO `coupons` VALUES ('42', '34', '13', '2017-05-28', '2017-05-29', '2017-05-27 01:54:34', '2017-05-27 01:54:34');

-- ----------------------------
-- Table structure for courier_addresses
-- ----------------------------
DROP TABLE IF EXISTS `courier_addresses`;
CREATE TABLE `courier_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `community` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `house_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of courier_addresses
-- ----------------------------
INSERT INTO `courier_addresses` VALUES ('1', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-07 01:40:57', '2017-05-07 01:40:57');
INSERT INTO `courier_addresses` VALUES ('2', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-07 01:49:57', '2017-05-07 01:49:57');
INSERT INTO `courier_addresses` VALUES ('3', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-07 01:50:55', '2017-05-07 01:50:55');
INSERT INTO `courier_addresses` VALUES ('4', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-07 01:53:21', '2017-05-07 01:53:21');
INSERT INTO `courier_addresses` VALUES ('5', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-07 07:05:51', '2017-05-07 07:05:51');
INSERT INTO `courier_addresses` VALUES ('6', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-19 12:51:24', '2017-05-19 12:51:24');
INSERT INTO `courier_addresses` VALUES ('7', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-19 13:12:04', '2017-05-19 13:12:04');
INSERT INTO `courier_addresses` VALUES ('8', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:05:54', '2017-05-20 03:05:54');
INSERT INTO `courier_addresses` VALUES ('9', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:08:33', '2017-05-20 03:08:33');
INSERT INTO `courier_addresses` VALUES ('10', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:18:17', '2017-05-20 03:18:17');
INSERT INTO `courier_addresses` VALUES ('11', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:28:06', '2017-05-20 03:28:06');
INSERT INTO `courier_addresses` VALUES ('12', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:28:49', '2017-05-20 03:28:49');
INSERT INTO `courier_addresses` VALUES ('13', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:30:40', '2017-05-20 03:30:40');
INSERT INTO `courier_addresses` VALUES ('14', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:33:09', '2017-05-20 03:33:09');
INSERT INTO `courier_addresses` VALUES ('15', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:34:09', '2017-05-20 03:34:09');
INSERT INTO `courier_addresses` VALUES ('16', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:35:21', '2017-05-20 03:35:21');
INSERT INTO `courier_addresses` VALUES ('17', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:38:35', '2017-05-20 03:38:35');
INSERT INTO `courier_addresses` VALUES ('18', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:39:24', '2017-05-20 03:39:24');
INSERT INTO `courier_addresses` VALUES ('19', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:40:02', '2017-05-20 03:40:02');
INSERT INTO `courier_addresses` VALUES ('20', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 03:41:00', '2017-05-20 03:41:00');
INSERT INTO `courier_addresses` VALUES ('21', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 07:34:55', '2017-05-20 07:34:55');
INSERT INTO `courier_addresses` VALUES ('22', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-21 08:08:48', '2017-05-21 08:08:48');
INSERT INTO `courier_addresses` VALUES ('23', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-26 14:56:14', '2017-05-26 14:56:14');
INSERT INTO `courier_addresses` VALUES ('24', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-26 14:57:18', '2017-05-26 14:57:18');
INSERT INTO `courier_addresses` VALUES ('25', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-26 14:58:28', '2017-05-26 14:58:28');
INSERT INTO `courier_addresses` VALUES ('26', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-26 14:59:10', '2017-05-26 14:59:10');
INSERT INTO `courier_addresses` VALUES ('27', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-26 15:05:17', '2017-05-26 15:05:17');
INSERT INTO `courier_addresses` VALUES ('28', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-26 15:33:55', '2017-05-26 15:33:55');
INSERT INTO `courier_addresses` VALUES ('29', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-27 10:01:41', '2017-05-27 10:01:41');
INSERT INTO `courier_addresses` VALUES ('30', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-27 10:02:12', '2017-05-27 10:02:12');

-- ----------------------------
-- Table structure for courier_cards
-- ----------------------------
DROP TABLE IF EXISTS `courier_cards`;
CREATE TABLE `courier_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` float DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courier_cards
-- ----------------------------
INSERT INTO `courier_cards` VALUES ('1', '13746.4', '1', null, '2017-05-17 23:51:26', '2017-05-27 01:58:45');
INSERT INTO `courier_cards` VALUES ('2', '2', '2', null, '2017-05-17 23:51:34', '2017-05-18 23:51:38');
INSERT INTO `courier_cards` VALUES ('3', '0', '3', null, '2017-05-18 13:13:46', '2017-05-18 13:13:46');
INSERT INTO `courier_cards` VALUES ('4', '0', '4', null, '2017-05-26 15:13:04', '2017-05-26 15:13:04');

-- ----------------------------
-- Table structure for courier_logs
-- ----------------------------
DROP TABLE IF EXISTS `courier_logs`;
CREATE TABLE `courier_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` int(11) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courier_logs
-- ----------------------------
INSERT INTO `courier_logs` VALUES ('1', null, '310', '1', '收入', '2017-05-18 14:01:17', '2017-05-18 14:01:17');
INSERT INTO `courier_logs` VALUES ('2', null, '413', '1', '收入', '2017-05-18 14:01:19', '2017-05-18 14:01:19');
INSERT INTO `courier_logs` VALUES ('3', null, '103', '1', '收入', '2017-05-18 14:02:50', '2017-05-18 14:02:50');
INSERT INTO `courier_logs` VALUES ('4', null, '103', '1', '收入', '2017-05-18 14:02:52', '2017-05-18 14:02:52');
INSERT INTO `courier_logs` VALUES ('5', null, '9.88', '1', '收入', '2017-05-20 04:01:17', '2017-05-20 04:01:17');
INSERT INTO `courier_logs` VALUES ('6', null, '9.88', '1', '收入', '2017-05-20 04:04:35', '2017-05-20 04:04:35');
INSERT INTO `courier_logs` VALUES ('7', null, '9.88', '1', '收入', '2017-05-20 04:04:48', '2017-05-20 04:04:48');
INSERT INTO `courier_logs` VALUES ('8', null, '9.88', '1', '收入', '2017-05-20 04:06:01', '2017-05-20 04:06:01');
INSERT INTO `courier_logs` VALUES ('9', null, '9.88', '1', '收入', '2017-05-20 04:06:41', '2017-05-20 04:06:41');
INSERT INTO `courier_logs` VALUES ('10', null, '9.88', '1', '收入', '2017-05-20 04:07:33', '2017-05-20 04:07:33');
INSERT INTO `courier_logs` VALUES ('11', null, '9.88', '1', '收入', '2017-05-20 04:25:50', '2017-05-20 04:25:50');
INSERT INTO `courier_logs` VALUES ('12', null, '9.88', '1', '收入', '2017-05-20 06:29:59', '2017-05-20 06:29:59');
INSERT INTO `courier_logs` VALUES ('13', null, '9.88', '1', '收入', '2017-05-20 06:30:01', '2017-05-20 06:30:01');
INSERT INTO `courier_logs` VALUES ('14', null, '9.88', '1', '收入', '2017-05-20 06:30:01', '2017-05-20 06:30:01');
INSERT INTO `courier_logs` VALUES ('15', null, '6001', '1', '收入', '2017-05-20 08:36:14', '2017-05-20 08:36:14');
INSERT INTO `courier_logs` VALUES ('16', null, '6001', '1', '收入', '2017-05-20 08:36:16', '2017-05-20 08:36:16');
INSERT INTO `courier_logs` VALUES ('17', null, '6', '1', '收入', '2017-05-21 08:23:11', '2017-05-21 08:23:11');
INSERT INTO `courier_logs` VALUES ('18', null, '4', '1', '收入', '2017-05-21 08:23:13', '2017-05-21 08:23:13');
INSERT INTO `courier_logs` VALUES ('19', null, '22', '1', '收入', '2017-05-21 08:23:14', '2017-05-21 08:23:14');
INSERT INTO `courier_logs` VALUES ('20', null, '894.5', '1', '收入', '2017-05-21 08:23:15', '2017-05-21 08:23:15');
INSERT INTO `courier_logs` VALUES ('21', null, '67', '1', '收入', '2017-05-26 15:33:21', '2017-05-26 15:33:21');
INSERT INTO `courier_logs` VALUES ('22', null, '28', '1', '收入', '2017-05-27 01:29:32', '2017-05-27 01:29:32');
INSERT INTO `courier_logs` VALUES ('23', null, '5', '1', '收入', '2017-05-27 01:39:14', '2017-05-27 01:39:14');
INSERT INTO `courier_logs` VALUES ('24', null, '10', '1', '收入', '2017-05-27 01:58:45', '2017-05-27 01:58:45');

-- ----------------------------
-- Table structure for couriers
-- ----------------------------
DROP TABLE IF EXISTS `couriers`;
CREATE TABLE `couriers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_couriers_on_mobile` (`mobile`),
  UNIQUE KEY `index_couriers_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of couriers
-- ----------------------------
INSERT INTO `couriers` VALUES ('1', '18600000002', '', '1', null, null, null, '1', '2017-02-27 02:35:00', '2017-02-27 02:35:00', '127.0.0.1', '127.0.0.1', null, '1', '1', '2017-02-27 02:35:00', '2017-05-07 01:52:23');
INSERT INTO `couriers` VALUES ('2', '1', '1', '1', null, null, null, '0', null, null, null, null, null, '1', '1', '2017-05-07 01:38:57', '2017-05-26 16:04:51');
INSERT INTO `couriers` VALUES ('3', '18811442000', '123@qq.com', '123456', null, null, null, '0', null, null, null, null, null, '啦啦', '1', '2017-05-18 13:13:46', '2017-05-18 13:13:46');

-- ----------------------------
-- Table structure for couriers_stations
-- ----------------------------
DROP TABLE IF EXISTS `couriers_stations`;
CREATE TABLE `couriers_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_id` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of couriers_stations
-- ----------------------------
INSERT INTO `couriers_stations` VALUES ('15', '3', '1', '2017-05-26 16:05:13', '2017-05-26 16:05:13');
INSERT INTO `couriers_stations` VALUES ('16', '3', '3', '2017-05-26 16:05:13', '2017-05-26 16:05:13');
INSERT INTO `couriers_stations` VALUES ('17', '1', '6', '2017-05-27 02:04:13', '2017-05-27 02:04:13');
INSERT INTO `couriers_stations` VALUES ('18', '1', '1', '2017-05-27 02:04:13', '2017-05-27 02:04:13');

-- ----------------------------
-- Table structure for factories
-- ----------------------------
DROP TABLE IF EXISTS `factories`;
CREATE TABLE `factories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_factories_on_mobile` (`mobile`),
  UNIQUE KEY `index_factories_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factories
-- ----------------------------
INSERT INTO `factories` VALUES ('1', '18600000002', '', '123456', null, null, null, '1', '2017-02-27 02:34:22', '2017-02-27 02:34:22', '127.0.0.1', '127.0.0.1', '111111', '1234567890', '1', '2017-02-27 02:34:22', '2017-05-26 16:05:21');
INSERT INTO `factories` VALUES ('2', '1', '1', '123456', null, null, null, '0', null, null, null, null, '111111', '0000000', '0', '2017-05-07 02:54:54', '2017-05-07 06:42:26');
INSERT INTO `factories` VALUES ('3', '2', '2', '2', null, null, null, '0', null, null, null, null, '2', null, '0', '2017-05-07 07:44:02', '2017-05-07 07:44:02');
INSERT INTO `factories` VALUES ('4', '18811442000', '123@qq.com', '123456', null, null, null, '0', null, null, null, null, '啦啦', '', '1', '2017-05-18 13:14:23', '2017-05-26 16:05:36');

-- ----------------------------
-- Table structure for factories_stations
-- ----------------------------
DROP TABLE IF EXISTS `factories_stations`;
CREATE TABLE `factories_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_id` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of factories_stations
-- ----------------------------
INSERT INTO `factories_stations` VALUES ('18', '2', '3', '2017-05-07 06:42:27', '2017-05-07 06:42:27');
INSERT INTO `factories_stations` VALUES ('19', '2', '3', '2017-05-07 06:42:27', '2017-05-07 06:42:27');
INSERT INTO `factories_stations` VALUES ('24', '4', '1', '2017-05-26 16:05:36', '2017-05-26 16:05:36');
INSERT INTO `factories_stations` VALUES ('25', '1', '5', '2017-05-27 01:41:35', '2017-05-27 01:41:35');
INSERT INTO `factories_stations` VALUES ('26', '1', '1', '2017-05-27 01:41:35', '2017-05-27 01:41:35');

-- ----------------------------
-- Table structure for factory_addresses
-- ----------------------------
DROP TABLE IF EXISTS `factory_addresses`;
CREATE TABLE `factory_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `community` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `house_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `factory_id` int(11) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of factory_addresses
-- ----------------------------
INSERT INTO `factory_addresses` VALUES ('1', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-07 02:58:28', '2017-05-07 02:58:28');
INSERT INTO `factory_addresses` VALUES ('2', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-07 07:46:11', '2017-05-07 07:46:11');
INSERT INTO `factory_addresses` VALUES ('3', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-19 12:50:23', '2017-05-19 12:50:23');
INSERT INTO `factory_addresses` VALUES ('4', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-19 13:15:25', '2017-05-19 13:15:25');
INSERT INTO `factory_addresses` VALUES ('5', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 04:10:19', '2017-05-20 04:10:19');
INSERT INTO `factory_addresses` VALUES ('6', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-20 04:24:33', '2017-05-20 04:24:33');
INSERT INTO `factory_addresses` VALUES ('7', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-26 15:00:54', '2017-05-26 15:00:54');
INSERT INTO `factory_addresses` VALUES ('8', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-26 15:01:54', '2017-05-26 15:01:54');
INSERT INTO `factory_addresses` VALUES ('9', null, null, null, null, null, null, null, '1', '39.9604', '116.395', '2017-05-27 10:17:18', '2017-05-27 10:17:18');

-- ----------------------------
-- Table structure for factory_cards
-- ----------------------------
DROP TABLE IF EXISTS `factory_cards`;
CREATE TABLE `factory_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` float DEFAULT NULL,
  `factory_id` int(11) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory_cards
-- ----------------------------
INSERT INTO `factory_cards` VALUES ('1', '0', '4', null, '2017-05-18 13:14:23', '2017-05-18 13:14:23');
INSERT INTO `factory_cards` VALUES ('2', '26458.1', '1', null, '2017-05-18 21:14:46', '2017-05-27 01:58:45');
INSERT INTO `factory_cards` VALUES ('3', '1', '2', null, '2017-05-18 21:14:55', '2017-05-18 21:14:57');
INSERT INTO `factory_cards` VALUES ('4', '1', '3', null, '2017-05-18 21:15:04', '2017-05-18 21:15:07');

-- ----------------------------
-- Table structure for factory_logs
-- ----------------------------
DROP TABLE IF EXISTS `factory_logs`;
CREATE TABLE `factory_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` int(11) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `factory_id` int(11) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory_logs
-- ----------------------------
INSERT INTO `factory_logs` VALUES ('1', null, '131.68', '1', '收入', '2017-05-26 15:33:21', '2017-05-26 15:33:21');
INSERT INTO `factory_logs` VALUES ('2', null, '54.46', '1', '收入', '2017-05-27 01:29:32', '2017-05-27 01:29:32');
INSERT INTO `factory_logs` VALUES ('3', null, '8.92', '1', '收入', '2017-05-27 01:39:14', '2017-05-27 01:39:14');
INSERT INTO `factory_logs` VALUES ('4', null, '18.82', '1', '收入', '2017-05-27 01:58:45', '2017-05-27 01:58:45');

-- ----------------------------
-- Table structure for factory_process_records
-- ----------------------------
DROP TABLE IF EXISTS `factory_process_records`;
CREATE TABLE `factory_process_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `process_on` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_factory_process_records_on_factory_id` (`factory_id`),
  KEY `index_factory_process_records_on_category_id` (`category_id`),
  KEY `index_factory_process_records_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_aafa6b58d0` FOREIGN KEY (`factory_id`) REFERENCES `factories` (`id`),
  CONSTRAINT `fk_rails_bc06e9c2be` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_rails_f447ff84e3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory_process_records
-- ----------------------------

-- ----------------------------
-- Table structure for factory_settlement_records
-- ----------------------------
DROP TABLE IF EXISTS `factory_settlement_records`;
CREATE TABLE `factory_settlement_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `settlement_on` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `money` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_factory_settlement_records_on_factory_id` (`factory_id`),
  KEY `index_factory_settlement_records_on_category_id` (`category_id`),
  KEY `index_factory_settlement_records_on_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory_settlement_records
-- ----------------------------

-- ----------------------------
-- Table structure for factory_settlement_rules
-- ----------------------------
DROP TABLE IF EXISTS `factory_settlement_rules`;
CREATE TABLE `factory_settlement_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `factory_id` int(11) DEFAULT NULL,
  `settlement_rule_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_factory_settlement_rules_on_factory_id` (`factory_id`),
  KEY `index_factory_settlement_rules_on_settlement_rule_id` (`settlement_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory_settlement_rules
-- ----------------------------

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_items_on_product_id` (`product_id`),
  KEY `index_items_on_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', '1', '11', '2', '2', '2017-05-26 16:02:49', '2017-05-26 16:02:49');
INSERT INTO `items` VALUES ('2', '1', '11', '2', '3', '2017-05-26 16:07:11', '2017-05-26 16:07:11');
INSERT INTO `items` VALUES ('3', '1', '21', '3', '3', '2017-05-26 16:07:11', '2017-05-26 16:07:11');
INSERT INTO `items` VALUES ('4', '2', '31', '4', '4', '2017-05-26 16:10:54', '2017-05-26 16:10:54');
INSERT INTO `items` VALUES ('5', '1', '101', '5', '4', '2017-05-26 16:10:54', '2017-05-26 16:10:54');
INSERT INTO `items` VALUES ('6', '1', '131', '8', '5', '2017-05-26 16:11:04', '2017-05-26 16:11:04');
INSERT INTO `items` VALUES ('7', '1', '131', '8', '6', '2017-05-26 16:24:42', '2017-05-26 16:24:42');
INSERT INTO `items` VALUES ('8', '1', '131', '8', '7', '2017-05-26 16:24:53', '2017-05-26 16:24:53');
INSERT INTO `items` VALUES ('9', '1', '43', '1', '8', '2017-05-27 01:26:13', '2017-05-27 01:26:13');
INSERT INTO `items` VALUES ('10', '1', '11', '2', '8', '2017-05-27 01:26:13', '2017-05-27 01:26:13');
INSERT INTO `items` VALUES ('11', '1', '131', '8', '9', '2017-05-27 01:34:42', '2017-05-27 01:34:42');
INSERT INTO `items` VALUES ('12', '1', '11', '2', '10', '2017-05-27 01:34:53', '2017-05-27 01:34:53');
INSERT INTO `items` VALUES ('13', '1', '21', '3', '11', '2017-05-27 01:57:01', '2017-05-27 01:57:01');
INSERT INTO `items` VALUES ('14', '1', '311', '14', '12', '2017-05-27 01:58:38', '2017-05-27 01:58:38');
INSERT INTO `items` VALUES ('15', '1', '11', '2', '13', '2017-05-27 01:58:59', '2017-05-27 01:58:59');

-- ----------------------------
-- Table structure for order_promotions
-- ----------------------------
DROP TABLE IF EXISTS `order_promotions`;
CREATE TABLE `order_promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` int(11) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `premise` float DEFAULT NULL,
  `coupon_list_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_promotions_on_coupon_list_id` (`coupon_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_promotions
-- ----------------------------
INSERT INTO `order_promotions` VALUES ('17', '3', '10', '20', '24', '2017-05-18 14:29:15', '2017-05-18 14:29:15');
INSERT INTO `order_promotions` VALUES ('27', '1', '4', '60', '34', '2017-05-19 15:51:19', '2017-05-20 06:48:10');
INSERT INTO `order_promotions` VALUES ('29', '1', '3', '10', '36', '2017-05-26 15:36:39', '2017-05-26 15:36:39');
INSERT INTO `order_promotions` VALUES ('30', '1', '12', '10', '37', '2017-05-27 02:05:45', '2017-05-27 02:05:45');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `courier_status` int(11) DEFAULT '0',
  `voucher_status` int(11) DEFAULT '0',
  `cleaning_status` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `waybill_id` int(11) DEFAULT NULL,
  `factory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_category_id` (`category_id`),
  KEY `index_orders_on_user_id` (`user_id`),
  KEY `index_orders_on_address_id` (`address_id`),
  KEY `index_orders_on_waybill_id` (`waybill_id`),
  KEY `index_orders_on_factory_id` (`factory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('3', '1', '11', '8', '32', '4', '0', '0', '0', '2017-05-26 16:07:11', '2017-05-27 01:52:01', '6', '1');
INSERT INTO `orders` VALUES ('4', '1', '11', '8', '163', '5', '0', '0', '0', '2017-05-26 16:10:54', '2017-05-27 10:11:41', '8', '1');
INSERT INTO `orders` VALUES ('5', '2', '11', '8', '131', '9', '0', '0', '0', '2017-05-26 16:11:04', '2017-05-26 16:13:56', '9', '1');
INSERT INTO `orders` VALUES ('6', '2', '11', '8', '131', '4', '0', '0', '0', '2017-05-26 16:24:42', '2017-05-26 17:04:16', '11', '1');
INSERT INTO `orders` VALUES ('7', '2', '11', '8', '131', '1', '0', '0', '0', '2017-05-26 16:24:53', '2017-05-26 16:24:53', '12', '1');
INSERT INTO `orders` VALUES ('8', '1', '11', '8', '54', '1', '1', '0', '0', '2017-05-27 01:26:13', '2017-05-27 01:29:32', '26', '1');
INSERT INTO `orders` VALUES ('9', '2', '11', '8', '131', '1', '0', '0', '0', '2017-05-27 01:34:42', '2017-05-27 01:34:42', '33', '1');
INSERT INTO `orders` VALUES ('10', '1', '11', '8', '8', '1', '1', '0', '0', '2017-05-27 01:34:53', '2017-05-27 01:39:14', '34', '1');
INSERT INTO `orders` VALUES ('11', '1', '13', '11', '18', '1', '1', '0', '0', '2017-05-27 01:57:01', '2017-05-27 01:58:45', '44', '1');
INSERT INTO `orders` VALUES ('12', '4', '13', '9', '311', '1', '1', '0', '0', '2017-05-27 01:58:37', '2017-05-27 01:59:29', '50', '1');
INSERT INTO `orders` VALUES ('13', '1', '13', '9', '11', '1', '1', '0', '0', '2017-05-27 01:58:59', '2017-05-27 02:00:34', '52', '1');

-- ----------------------------
-- Table structure for orders_status
-- ----------------------------
DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE `orders_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders_status
-- ----------------------------
INSERT INTO `orders_status` VALUES ('1', '派单中');
INSERT INTO `orders_status` VALUES ('2', '取件中');
INSERT INTO `orders_status` VALUES ('3', '待支付');
INSERT INTO `orders_status` VALUES ('4', '送往加工店');
INSERT INTO `orders_status` VALUES ('5', '清洗中');
INSERT INTO `orders_status` VALUES ('6', '送回中');
INSERT INTO `orders_status` VALUES ('7', '已签收');
INSERT INTO `orders_status` VALUES ('8', '备用');
INSERT INTO `orders_status` VALUES ('9', '申请退单');
INSERT INTO `orders_status` VALUES ('10', '订单取消');
INSERT INTO `orders_status` VALUES ('11', '订单取消(退款完成)');

-- ----------------------------
-- Table structure for price_rules
-- ----------------------------
DROP TABLE IF EXISTS `price_rules`;
CREATE TABLE `price_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_price_rules_on_city_id` (`city_id`),
  KEY `index_price_rules_on_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price_rules
-- ----------------------------
INSERT INTO `price_rules` VALUES ('1', '1', '1', '1', '2017-02-24', '2017-02-24 15:49:44', '2017-02-24 15:49:44');
INSERT INTO `price_rules` VALUES ('2', '2', '1', '2', '2017-02-24', '2017-02-24 15:49:56', '2017-02-24 15:49:56');
INSERT INTO `price_rules` VALUES ('3', '3', '1', '3', '2017-02-24', '2017-02-24 15:50:04', '2017-02-24 15:50:04');
INSERT INTO `price_rules` VALUES ('4', '4', '1', '4', '2017-02-24', '2017-02-24 15:50:13', '2017-02-24 15:50:13');

-- ----------------------------
-- Table structure for prices
-- ----------------------------
DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price1` float DEFAULT '0',
  `price2` float DEFAULT '0',
  `price3` float DEFAULT '0',
  `price4` float DEFAULT '0',
  `price5` float DEFAULT '0',
  `price6` float DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_prices_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_b8ee0bfea1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prices
-- ----------------------------
INSERT INTO `prices` VALUES ('1', '43', '2', '3', '4', '5', '6', '1', '2017-02-24 15:47:26', '2017-05-07 08:19:52');
INSERT INTO `prices` VALUES ('2', '11', '12', '13', '14', '15', '16', '2', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('3', '21', '22', '23', '24', '25', '26', '3', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('4', '31', '32', '33', '34', '35', '36', '4', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('5', '101', '102', '103', '104', '105', '106', '5', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('6', '111', '112', '113', '114', '115', '116', '6', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('7', '121', '122', '123', '124', '125', '126', '7', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('8', '131', '132', '133', '134', '135', '136', '8', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('9', '201', '202', '203', '204', '205', '206', '9', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('10', '211', '212', '213', '214', '215', '216', '10', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('11', '221', '222', '223', '224', '225', '226', '11', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('12', '231', '232', '233', '234', '235', '236', '12', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('13', '301', '302', '303', '304', '305', '306', '13', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('14', '311', '312', '313', '314', '315', '316', '14', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('15', '321', '322', '323', '324', '325', '326', '15', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('16', '331', '332', '333', '334', '335', '336', '16', '2017-02-24 15:47:26', '2017-02-24 15:47:26');
INSERT INTO `prices` VALUES ('17', '1', '0', '0', '0', '0', '0', '17', '2017-04-21 14:09:19', '2017-04-21 14:09:19');
INSERT INTO `prices` VALUES ('18', '1', '0', '0', '0', '0', '0', '21', '2017-04-21 14:10:27', '2017-04-21 14:10:27');
INSERT INTO `prices` VALUES ('19', '1', '0', '0', '0', '0', '0', null, '2017-04-21 14:11:41', '2017-04-21 14:11:41');
INSERT INTO `prices` VALUES ('20', '1', '0', '0', '0', '0', '0', null, '2017-04-21 14:12:09', '2017-04-21 14:12:09');
INSERT INTO `prices` VALUES ('21', '1', '0', '0', '0', '0', '0', null, '2017-04-21 14:14:40', '2017-04-21 14:14:40');
INSERT INTO `prices` VALUES ('22', '1', '0', '0', '0', '0', '0', null, '2017-04-21 14:15:46', '2017-04-21 14:15:46');
INSERT INTO `prices` VALUES ('23', '1', '0', '0', '0', '0', '0', null, '2017-04-21 14:15:46', '2017-04-21 14:15:46');
INSERT INTO `prices` VALUES ('24', '888', '0', '0', '0', '0', '0', '25', '2017-04-22 02:47:58', '2017-04-22 02:47:58');
INSERT INTO `prices` VALUES ('25', '888', '0', '0', '0', '0', '0', '26', '2017-04-22 02:59:51', '2017-04-22 02:59:51');
INSERT INTO `prices` VALUES ('26', '888', '0', '0', '0', '0', '0', '27', '2017-04-22 03:00:45', '2017-04-22 03:00:45');
INSERT INTO `prices` VALUES ('27', '888', '0', '0', '0', '0', '0', '28', '2017-04-22 03:20:05', '2017-04-22 03:20:05');
INSERT INTO `prices` VALUES ('28', '888', '0', '0', '0', '0', '0', '29', '2017-04-22 03:22:15', '2017-04-22 03:22:15');
INSERT INTO `prices` VALUES ('29', '888', '0', '0', '0', '0', '0', '30', '2017-04-22 03:23:41', '2017-04-22 03:23:41');
INSERT INTO `prices` VALUES ('30', '888', '0', '0', '0', '0', '0', '31', '2017-04-22 03:24:48', '2017-04-22 03:24:48');
INSERT INTO `prices` VALUES ('31', '888', '0', '0', '0', '0', '0', '32', '2017-04-22 03:25:56', '2017-04-22 03:25:56');
INSERT INTO `prices` VALUES ('32', '888', '0', '0', '0', '0', '0', '33', '2017-04-22 03:30:23', '2017-04-22 03:30:23');
INSERT INTO `prices` VALUES ('33', '888', '0', '0', '0', '0', '0', '34', '2017-04-22 03:31:08', '2017-04-22 03:31:08');
INSERT INTO `prices` VALUES ('34', '888', '0', '0', '0', '0', '0', '35', '2017-04-22 03:31:29', '2017-04-22 03:31:29');
INSERT INTO `prices` VALUES ('35', '888', '0', '0', '0', '0', '0', '36', '2017-04-22 03:33:24', '2017-04-22 03:33:24');
INSERT INTO `prices` VALUES ('36', '888', '0', '0', '0', '0', '0', '37', '2017-04-22 03:33:43', '2017-04-22 03:33:43');
INSERT INTO `prices` VALUES ('37', null, '0', '0', '0', '0', '0', '38', '2017-05-20 04:02:34', '2017-05-20 04:02:34');
INSERT INTO `prices` VALUES ('38', null, '0', '0', '0', '0', '0', '39', '2017-05-20 04:12:06', '2017-05-20 04:12:06');
INSERT INTO `prices` VALUES ('39', '4', '0', '0', '0', '0', '0', '40', '2017-05-27 02:02:16', '2017-05-27 02:02:16');
INSERT INTO `prices` VALUES ('40', '4', '0', '0', '0', '0', '0', '41', '2017-05-27 02:02:16', '2017-05-27 02:02:16');

-- ----------------------------
-- Table structure for product_items
-- ----------------------------
DROP TABLE IF EXISTS `product_items`;
CREATE TABLE `product_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_product_items_on_order_id` (`order_id`),
  KEY `index_product_items_on_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_items
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_category_id` (`category_id`),
  CONSTRAINT `fk_rails_fb915499a4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'T恤', '12ewfsdf', '1', '1', '2017-02-24 15:41:59', '2017-04-22 03:34:36');
INSERT INTO `products` VALUES ('2', '衬衫', 'category-1487430865976', '0', '1', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('3', '呢子大衣', 'category-1487430865976', '0', '1', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('4', '羽绒服', 'category-1487430865976', '0', '1', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('5', '西服', 'category-1487430865976', '0', '1', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('6', '羊毛衫', 'category-1487430865976', '0', '1', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('7', '卫衣', 'category-1487430865976', '0', '1', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('8', '帆布鞋', 'category-1487430865976', '0', '2', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('9', '床单', 'category-1487430865976', '0', '3', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('10', '被套', 'category-1487430865976', '0', '3', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('11', '枕巾', 'category-1487430865976', '0', '3', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('12', '绒枕芯', 'category-1487430865976', '0', '3', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('13', '被子', 'category-1487430865976', '0', '3', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('14', '大窗帘', 'category-1487430865976', '0', '4', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('15', '小窗帘', 'category-1487430865976', '0', '4', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('16', '特大窗帘', 'category-1487430865976', '0', '4', '2017-02-24 15:41:59', '2017-02-24 15:41:59');
INSERT INTO `products` VALUES ('17', '皮鞋', 'test1', '0', '2', '2017-04-14 15:49:32', '2017-04-14 15:49:32');
INSERT INTO `products` VALUES ('21', '翻毛绒鞋', '黄图', '0', '2', '2017-04-21 14:12:09', '2017-04-21 14:12:09');
INSERT INTO `products` VALUES ('22', '大保健', '黄图', '1', '1', '2017-04-21 14:14:40', '2017-04-21 14:14:40');
INSERT INTO `products` VALUES ('23', '大保健', '黄图', '1', '1', '2017-04-21 14:15:46', '2017-04-21 14:15:46');
INSERT INTO `products` VALUES ('24', '大保健', '黄图', '1', '1', '2017-04-21 14:15:46', '2017-04-21 14:15:46');
INSERT INTO `products` VALUES ('25', '人也是', '12ewfsdf', '1', '1', '2017-04-22 02:47:58', '2017-04-22 02:47:58');
INSERT INTO `products` VALUES ('26', '人也是', '12ewfsdf', '1', '1', '2017-04-22 02:59:51', '2017-04-22 02:59:51');
INSERT INTO `products` VALUES ('27', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:00:45', '2017-04-22 03:00:45');
INSERT INTO `products` VALUES ('28', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:20:05', '2017-04-22 03:20:05');
INSERT INTO `products` VALUES ('29', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:22:15', '2017-04-22 03:22:15');
INSERT INTO `products` VALUES ('30', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:23:41', '2017-04-22 03:23:41');
INSERT INTO `products` VALUES ('31', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:24:48', '2017-04-22 03:24:48');
INSERT INTO `products` VALUES ('32', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:25:56', '2017-04-22 03:25:56');
INSERT INTO `products` VALUES ('33', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:30:23', '2017-04-22 03:30:23');
INSERT INTO `products` VALUES ('34', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:31:08', '2017-04-22 03:31:08');
INSERT INTO `products` VALUES ('35', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:31:29', '2017-04-22 03:31:29');
INSERT INTO `products` VALUES ('36', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:33:24', '2017-04-22 03:33:24');
INSERT INTO `products` VALUES ('37', '人也是', '12ewfsdf', '1', '1', '2017-04-22 03:33:43', '2017-04-22 03:33:43');
INSERT INTO `products` VALUES ('38', 'rewrer', 'rewrw', '1', '3', '2017-05-20 04:02:34', '2017-05-20 04:02:34');
INSERT INTO `products` VALUES ('39', 'dsef', 'fsd', '1', '1', '2017-05-20 04:12:06', '2017-05-20 04:12:06');
INSERT INTO `products` VALUES ('40', '1123', 'image/default.png', '0', '1', '2017-05-27 02:02:16', '2017-05-27 02:02:16');
INSERT INTO `products` VALUES ('41', '1123', 'image/default.png', '0', '1', '2017-05-27 02:02:16', '2017-05-27 02:02:16');

-- ----------------------------
-- Table structure for promotion_rules
-- ----------------------------
DROP TABLE IF EXISTS `promotion_rules`;
CREATE TABLE `promotion_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_on` date DEFAULT NULL,
  `end_on` date DEFAULT NULL,
  `coupon_list_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_promotion_rules_on_coupon_list_id` (`coupon_list_id`),
  CONSTRAINT `fk_rails_4215db7442` FOREIGN KEY (`coupon_list_id`) REFERENCES `coupon_lists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of promotion_rules
-- ----------------------------

-- ----------------------------
-- Table structure for regions
-- ----------------------------
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_regions_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=820001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of regions
-- ----------------------------
INSERT INTO `regions` VALUES ('110000', '北京市', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('110100', '北京市', '110000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('110101', '东城区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110102', '西城区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110105', '朝阳区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110106', '丰台区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110107', '石景山区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110108', '海淀区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110109', '门头沟区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110111', '房山区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110112', '通州区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110113', '顺义区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110114', '昌平区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110115', '大兴区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110116', '怀柔区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110117', '平谷区', '110100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110228', '密云县', '110200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('110229', '延庆县', '110200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120000', '天津市', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('120100', '天津市', '120000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('120101', '和平区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120102', '河东区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120103', '河西区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120104', '南开区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120105', '河北区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120106', '红桥区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120110', '东丽区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120111', '西青区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120112', '津南区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120113', '北辰区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120114', '武清区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120115', '宝坻区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120116', '滨海新区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120117', '宁河区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120118', '静海区', '120100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('120225', '蓟县', '120200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130000', '河北省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('130100', '石家庄市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('130102', '长安区', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130104', '桥西区', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130105', '新华区', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130107', '井陉矿区', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130108', '裕华区', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130109', '藁城区', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130110', '鹿泉区', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130111', '栾城区', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130121', '井陉县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130123', '正定县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130125', '行唐县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130126', '灵寿县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130127', '高邑县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130128', '深泽县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130129', '赞皇县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130130', '无极县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130131', '平山县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130132', '元氏县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130133', '赵县', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130183', '晋州市', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130184', '新乐市', '130100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130200', '唐山市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('130202', '路南区', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130203', '路北区', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130204', '古冶区', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130205', '开平区', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130207', '丰南区', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130208', '丰润区', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130209', '曹妃甸区', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130223', '滦县', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130224', '滦南县', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130225', '乐亭县', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130227', '迁西县', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130229', '玉田县', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130281', '遵化市', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130283', '迁安市', '130200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130300', '秦皇岛市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('130302', '海港区', '130300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130303', '山海关区', '130300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130304', '北戴河区', '130300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130306', '抚宁区', '130300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130321', '青龙满族自治县', '130300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130322', '昌黎县', '130300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130324', '卢龙县', '130300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130400', '邯郸市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('130402', '邯山区', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130403', '丛台区', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130404', '复兴区', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130406', '峰峰矿区', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130421', '邯郸县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130423', '临漳县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130424', '成安县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130425', '大名县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130426', '涉县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130427', '磁县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130428', '肥乡县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130429', '永年县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130430', '邱县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130431', '鸡泽县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130432', '广平县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130433', '馆陶县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130434', '魏县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130435', '曲周县', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130481', '武安市', '130400', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130500', '邢台市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('130502', '桥东区', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130503', '桥西区', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130521', '邢台县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130522', '临城县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130523', '内丘县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130524', '柏乡县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130525', '隆尧县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130526', '任县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130527', '南和县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130528', '宁晋县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130529', '巨鹿县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130530', '新河县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130531', '广宗县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130532', '平乡县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130533', '威县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130534', '清河县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130535', '临西县', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130581', '南宫市', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130582', '沙河市', '130500', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130600', '保定市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('130602', '竞秀区', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130606', '莲池区', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130607', '满城区', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130608', '清苑区', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130609', '徐水区', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130623', '涞水县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130624', '阜平县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130626', '定兴县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130627', '唐县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130628', '高阳县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130629', '容城县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130630', '涞源县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130631', '望都县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130632', '安新县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130633', '易县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130634', '曲阳县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130635', '蠡县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130636', '顺平县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130637', '博野县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130638', '雄县', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130681', '涿州市', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130683', '安国市', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130684', '高碑店市', '130600', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130700', '张家口市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('130702', '桥东区', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130703', '桥西区', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130705', '宣化区', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130706', '下花园区', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130721', '宣化县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130722', '张北县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130723', '康保县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130724', '沽源县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130725', '尚义县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130726', '蔚县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130727', '阳原县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130728', '怀安县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130729', '万全县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130730', '怀来县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130731', '涿鹿县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130732', '赤城县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130733', '崇礼县', '130700', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130800', '承德市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('130802', '双桥区', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130803', '双滦区', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130804', '鹰手营子矿区', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130821', '承德县', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130822', '兴隆县', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130823', '平泉县', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130824', '滦平县', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130825', '隆化县', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130826', '丰宁满族自治县', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130827', '宽城满族自治县', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130828', '围场满族蒙古族自治县', '130800', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130900', '沧州市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('130902', '新华区', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130903', '运河区', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130921', '沧县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130922', '青县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130923', '东光县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130924', '海兴县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130925', '盐山县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130926', '肃宁县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130927', '南皮县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130928', '吴桥县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130929', '献县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130930', '孟村回族自治县', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130981', '泊头市', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130982', '任丘市', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130983', '黄骅市', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('130984', '河间市', '130900', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131000', '廊坊市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('131002', '安次区', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131003', '广阳区', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131022', '固安县', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131023', '永清县', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131024', '香河县', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131025', '大城县', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131026', '文安县', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131028', '大厂回族自治县', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131081', '霸州市', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131082', '三河市', '131000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131100', '衡水市', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('131102', '桃城区', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131121', '枣强县', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131122', '武邑县', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131123', '武强县', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131124', '饶阳县', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131125', '安平县', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131126', '故城县', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131127', '景县', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131128', '阜城县', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131181', '冀州市', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('131182', '深州市', '131100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('139000', '省直辖县级行政区划', '130000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('139001', '定州市', '139000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('139002', '辛集市', '139000', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140000', '山西省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('140100', '太原市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('140105', '小店区', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140106', '迎泽区', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140107', '杏花岭区', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140108', '尖草坪区', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140109', '万柏林区', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140110', '晋源区', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140121', '清徐县', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140122', '阳曲县', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140123', '娄烦县', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140181', '古交市', '140100', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140200', '大同市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('140202', '城区', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140203', '矿区', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140211', '南郊区', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140212', '新荣区', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140221', '阳高县', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140222', '天镇县', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140223', '广灵县', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140224', '灵丘县', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140225', '浑源县', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140226', '左云县', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140227', '大同县', '140200', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140300', '阳泉市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('140302', '城区', '140300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140303', '矿区', '140300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140311', '郊区', '140300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140321', '平定县', '140300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140322', '盂县', '140300', '3', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('140400', '长治市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('140402', '城区', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140411', '郊区', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140421', '长治县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140423', '襄垣县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140424', '屯留县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140425', '平顺县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140426', '黎城县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140427', '壶关县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140428', '长子县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140429', '武乡县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140430', '沁县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140431', '沁源县', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140481', '潞城市', '140400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140500', '晋城市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('140502', '城区', '140500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140521', '沁水县', '140500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140522', '阳城县', '140500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140524', '陵川县', '140500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140525', '泽州县', '140500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140581', '高平市', '140500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140600', '朔州市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('140602', '朔城区', '140600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140603', '平鲁区', '140600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140621', '山阴县', '140600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140622', '应县', '140600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140623', '右玉县', '140600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140624', '怀仁县', '140600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140700', '晋中市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('140702', '榆次区', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140721', '榆社县', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140722', '左权县', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140723', '和顺县', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140724', '昔阳县', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140725', '寿阳县', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140726', '太谷县', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140727', '祁县', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140728', '平遥县', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140729', '灵石县', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140781', '介休市', '140700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140800', '运城市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('140802', '盐湖区', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140821', '临猗县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140822', '万荣县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140823', '闻喜县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140824', '稷山县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140825', '新绛县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140826', '绛县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140827', '垣曲县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140828', '夏县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140829', '平陆县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140830', '芮城县', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140881', '永济市', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140882', '河津市', '140800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140900', '忻州市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('140902', '忻府区', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140921', '定襄县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140922', '五台县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140923', '代县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140924', '繁峙县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140925', '宁武县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140926', '静乐县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140927', '神池县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140928', '五寨县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140929', '岢岚县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140930', '河曲县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140931', '保德县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140932', '偏关县', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('140981', '原平市', '140900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141000', '临汾市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('141002', '尧都区', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141021', '曲沃县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141022', '翼城县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141023', '襄汾县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141024', '洪洞县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141025', '古县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141026', '安泽县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141027', '浮山县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141028', '吉县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141029', '乡宁县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141030', '大宁县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141031', '隰县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141032', '永和县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141033', '蒲县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141034', '汾西县', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141081', '侯马市', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141082', '霍州市', '141000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141100', '吕梁市', '140000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('141102', '离石区', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141121', '文水县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141122', '交城县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141123', '兴县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141124', '临县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141125', '柳林县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141126', '石楼县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141127', '岚县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141128', '方山县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141129', '中阳县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141130', '交口县', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141181', '孝义市', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('141182', '汾阳市', '141100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150000', '内蒙古自治区', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('150100', '呼和浩特市', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('150102', '新城区', '150100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150103', '回民区', '150100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150104', '玉泉区', '150100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150105', '赛罕区', '150100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150121', '土默特左旗', '150100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150122', '托克托县', '150100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150123', '和林格尔县', '150100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150124', '清水河县', '150100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150125', '武川县', '150100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150200', '包头市', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('150202', '东河区', '150200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150203', '昆都仑区', '150200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150204', '青山区', '150200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150205', '石拐区', '150200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150206', '白云鄂博矿区', '150200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150207', '九原区', '150200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150221', '土默特右旗', '150200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150222', '固阳县', '150200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150300', '乌海市', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('150302', '海勃湾区', '150300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150303', '海南区', '150300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150304', '乌达区', '150300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150400', '赤峰市', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('150402', '红山区', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150403', '元宝山区', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150404', '松山区', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150421', '阿鲁科尔沁旗', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150422', '巴林左旗', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150423', '巴林右旗', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150424', '林西县', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150425', '克什克腾旗', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150426', '翁牛特旗', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150428', '喀喇沁旗', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150429', '宁城县', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150430', '敖汉旗', '150400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150500', '通辽市', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('150502', '科尔沁区', '150500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150521', '科尔沁左翼中旗', '150500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150522', '科尔沁左翼后旗', '150500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150523', '开鲁县', '150500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150524', '库伦旗', '150500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150525', '奈曼旗', '150500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150526', '扎鲁特旗', '150500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150581', '霍林郭勒市', '150500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150600', '鄂尔多斯市', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('150602', '东胜区', '150600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150621', '达拉特旗', '150600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150622', '准格尔旗', '150600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150623', '鄂托克前旗', '150600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150624', '鄂托克旗', '150600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150625', '杭锦旗', '150600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150626', '乌审旗', '150600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150627', '伊金霍洛旗', '150600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150700', '呼伦贝尔市', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('150702', '海拉尔区', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150703', '扎赉诺尔区', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150721', '阿荣旗', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150723', '鄂伦春自治旗', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150724', '鄂温克族自治旗', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150725', '陈巴尔虎旗', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150726', '新巴尔虎左旗', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150727', '新巴尔虎右旗', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150781', '满洲里市', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150782', '牙克石市', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150783', '扎兰屯市', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150784', '额尔古纳市', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150785', '根河市', '150700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150800', '巴彦淖尔市', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('150802', '临河区', '150800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150821', '五原县', '150800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150822', '磴口县', '150800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150823', '乌拉特前旗', '150800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150824', '乌拉特中旗', '150800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150825', '乌拉特后旗', '150800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150826', '杭锦后旗', '150800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150900', '乌兰察布市', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('150902', '集宁区', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150921', '卓资县', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150922', '化德县', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150923', '商都县', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150924', '兴和县', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150925', '凉城县', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150926', '察哈尔右翼前旗', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150927', '察哈尔右翼中旗', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150928', '察哈尔右翼后旗', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150929', '四子王旗', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('150981', '丰镇市', '150900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152200', '兴安盟', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('152201', '乌兰浩特市', '152200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152202', '阿尔山市', '152200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152221', '科尔沁右翼前旗', '152200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152222', '科尔沁右翼中旗', '152200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152223', '扎赉特旗', '152200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152224', '突泉县', '152200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152500', '锡林郭勒盟', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('152501', '二连浩特市', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152502', '锡林浩特市', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152522', '阿巴嘎旗', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152523', '苏尼特左旗', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152524', '苏尼特右旗', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152525', '东乌珠穆沁旗', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152526', '西乌珠穆沁旗', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152527', '太仆寺旗', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152528', '镶黄旗', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152529', '正镶白旗', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152530', '正蓝旗', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152531', '多伦县', '152500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152900', '阿拉善盟', '150000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('152921', '阿拉善左旗', '152900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152922', '阿拉善右旗', '152900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('152923', '额济纳旗', '152900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210000', '辽宁省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('210100', '沈阳市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('210102', '和平区', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210103', '沈河区', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210104', '大东区', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210105', '皇姑区', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210106', '铁西区', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210111', '苏家屯区', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210112', '浑南区', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210113', '沈北新区', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210114', '于洪区', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210122', '辽中县', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210123', '康平县', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210124', '法库县', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210181', '新民市', '210100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210200', '大连市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('210202', '中山区', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210203', '西岗区', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210204', '沙河口区', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210211', '甘井子区', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210212', '旅顺口区', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210213', '金州区', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210224', '长海县', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210281', '瓦房店市', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210282', '普兰店市', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210283', '庄河市', '210200', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210300', '鞍山市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('210302', '铁东区', '210300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210303', '铁西区', '210300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210304', '立山区', '210300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210311', '千山区', '210300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210321', '台安县', '210300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210323', '岫岩满族自治县', '210300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210381', '海城市', '210300', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210400', '抚顺市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('210402', '新抚区', '210400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210403', '东洲区', '210400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210404', '望花区', '210400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210411', '顺城区', '210400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210421', '抚顺县', '210400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210422', '新宾满族自治县', '210400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210423', '清原满族自治县', '210400', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210500', '本溪市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('210502', '平山区', '210500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210503', '溪湖区', '210500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210504', '明山区', '210500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210505', '南芬区', '210500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210521', '本溪满族自治县', '210500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210522', '桓仁满族自治县', '210500', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210600', '丹东市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('210602', '元宝区', '210600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210603', '振兴区', '210600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210604', '振安区', '210600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210624', '宽甸满族自治县', '210600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210681', '东港市', '210600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210682', '凤城市', '210600', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210700', '锦州市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('210702', '古塔区', '210700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210703', '凌河区', '210700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210711', '太和区', '210700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210726', '黑山县', '210700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210727', '义县', '210700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210781', '凌海市', '210700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210782', '北镇市', '210700', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210800', '营口市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('210802', '站前区', '210800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210803', '西市区', '210800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210804', '鲅鱼圈区', '210800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210811', '老边区', '210800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210881', '盖州市', '210800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210882', '大石桥市', '210800', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210900', '阜新市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('210902', '海州区', '210900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210903', '新邱区', '210900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210904', '太平区', '210900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210905', '清河门区', '210900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210911', '细河区', '210900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210921', '阜新蒙古族自治县', '210900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('210922', '彰武县', '210900', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211000', '辽阳市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('211002', '白塔区', '211000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211003', '文圣区', '211000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211004', '宏伟区', '211000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211005', '弓长岭区', '211000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211011', '太子河区', '211000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211021', '辽阳县', '211000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211081', '灯塔市', '211000', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211100', '盘锦市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('211102', '双台子区', '211100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211103', '兴隆台区', '211100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211121', '大洼县', '211100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211122', '盘山县', '211100', '3', '2017-02-24 15:38:00', '2017-02-24 15:38:00');
INSERT INTO `regions` VALUES ('211200', '铁岭市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('211202', '银州区', '211200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211204', '清河区', '211200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211221', '铁岭县', '211200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211223', '西丰县', '211200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211224', '昌图县', '211200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211281', '调兵山市', '211200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211282', '开原市', '211200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211300', '朝阳市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('211302', '双塔区', '211300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211303', '龙城区', '211300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211321', '朝阳县', '211300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211322', '建平县', '211300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211381', '北票市', '211300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211382', '凌源市', '211300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211400', '葫芦岛市', '210000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('211402', '连山区', '211400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211403', '龙港区', '211400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211404', '南票区', '211400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211421', '绥中县', '211400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211422', '建昌县', '211400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('211481', '兴城市', '211400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220000', '吉林省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('220100', '长春市', '220000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('220102', '南关区', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220103', '宽城区', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220104', '朝阳区', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220105', '二道区', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220106', '绿园区', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220112', '双阳区', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220113', '九台区', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220122', '农安县', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220182', '榆树市', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220183', '德惠市', '220100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220200', '吉林市', '220000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('220202', '昌邑区', '220200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220203', '龙潭区', '220200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220204', '船营区', '220200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220211', '丰满区', '220200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220221', '永吉县', '220200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220281', '蛟河市', '220200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220282', '桦甸市', '220200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220283', '舒兰市', '220200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220284', '磐石市', '220200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220300', '四平市', '220000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('220302', '铁西区', '220300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220303', '铁东区', '220300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220322', '梨树县', '220300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220323', '伊通满族自治县', '220300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220381', '公主岭市', '220300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220382', '双辽市', '220300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220400', '辽源市', '220000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('220402', '龙山区', '220400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220403', '西安区', '220400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220421', '东丰县', '220400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220422', '东辽县', '220400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220500', '通化市', '220000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('220502', '东昌区', '220500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220503', '二道江区', '220500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220521', '通化县', '220500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220523', '辉南县', '220500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220524', '柳河县', '220500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220581', '梅河口市', '220500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220582', '集安市', '220500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220600', '白山市', '220000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('220602', '浑江区', '220600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220605', '江源区', '220600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220621', '抚松县', '220600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220622', '靖宇县', '220600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220623', '长白朝鲜族自治县', '220600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220681', '临江市', '220600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220700', '松原市', '220000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('220702', '宁江区', '220700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220722', '长岭县', '220700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220723', '乾安县', '220700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220781', '扶余市', '220700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220800', '白城市', '220000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('220802', '洮北区', '220800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220821', '镇赉县', '220800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220822', '通榆县', '220800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220881', '洮南市', '220800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('220882', '大安市', '220800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('222400', '延边朝鲜族自治州', '220000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('222401', '延吉市', '222400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('222402', '图们市', '222400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('222403', '敦化市', '222400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('222404', '珲春市', '222400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('222405', '龙井市', '222400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('222406', '和龙市', '222400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('222424', '汪清县', '222400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('222426', '安图县', '222400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230000', '黑龙江省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('230100', '哈尔滨市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('230102', '道里区', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230103', '南岗区', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230104', '道外区', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230108', '平房区', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230109', '松北区', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230110', '香坊区', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230111', '呼兰区', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230112', '阿城区', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230113', '双城区', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230123', '依兰县', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230124', '方正县', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230125', '宾县', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230126', '巴彦县', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230127', '木兰县', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230128', '通河县', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230129', '延寿县', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230183', '尚志市', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230184', '五常市', '230100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230200', '齐齐哈尔市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('230202', '龙沙区', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230203', '建华区', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230204', '铁锋区', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230205', '昂昂溪区', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230206', '富拉尔基区', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230207', '碾子山区', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230208', '梅里斯达斡尔族区', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230221', '龙江县', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230223', '依安县', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230224', '泰来县', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230225', '甘南县', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230227', '富裕县', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230229', '克山县', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230230', '克东县', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230231', '拜泉县', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230281', '讷河市', '230200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230300', '鸡西市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('230302', '鸡冠区', '230300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230303', '恒山区', '230300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230304', '滴道区', '230300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230305', '梨树区', '230300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230306', '城子河区', '230300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230307', '麻山区', '230300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230321', '鸡东县', '230300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230381', '虎林市', '230300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230382', '密山市', '230300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230400', '鹤岗市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('230402', '向阳区', '230400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230403', '工农区', '230400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230404', '南山区', '230400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230405', '兴安区', '230400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230406', '东山区', '230400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230407', '兴山区', '230400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230421', '萝北县', '230400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230422', '绥滨县', '230400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230500', '双鸭山市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('230502', '尖山区', '230500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230503', '岭东区', '230500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230505', '四方台区', '230500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230506', '宝山区', '230500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230521', '集贤县', '230500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230522', '友谊县', '230500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230523', '宝清县', '230500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230524', '饶河县', '230500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230600', '大庆市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('230602', '萨尔图区', '230600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230603', '龙凤区', '230600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230604', '让胡路区', '230600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230605', '红岗区', '230600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230606', '大同区', '230600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230621', '肇州县', '230600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230622', '肇源县', '230600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230623', '林甸县', '230600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230700', '伊春市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('230702', '伊春区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230703', '南岔区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230704', '友好区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230705', '西林区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230706', '翠峦区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230707', '新青区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230708', '美溪区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230709', '金山屯区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230710', '五营区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230711', '乌马河区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230712', '汤旺河区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230713', '带岭区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230714', '乌伊岭区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230715', '红星区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230716', '上甘岭区', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230722', '嘉荫县', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230781', '铁力市', '230700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230800', '佳木斯市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('230803', '向阳区', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230804', '前进区', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230805', '东风区', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230811', '郊区', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230822', '桦南县', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230826', '桦川县', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230828', '汤原县', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230833', '抚远县', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230881', '同江市', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230882', '富锦市', '230800', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230900', '七台河市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('230902', '新兴区', '230900', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230903', '桃山区', '230900', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230904', '茄子河区', '230900', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('230921', '勃利县', '230900', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231000', '牡丹江市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('231002', '东安区', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231003', '阳明区', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231004', '爱民区', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231005', '西安区', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231024', '东宁县', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231025', '林口县', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231081', '绥芬河市', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231083', '海林市', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231084', '宁安市', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231085', '穆棱市', '231000', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231100', '黑河市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('231102', '爱辉区', '231100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231121', '嫩江县', '231100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231123', '逊克县', '231100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231124', '孙吴县', '231100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231181', '北安市', '231100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231182', '五大连池市', '231100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231200', '绥化市', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('231202', '北林区', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231221', '望奎县', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231222', '兰西县', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231223', '青冈县', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231224', '庆安县', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231225', '明水县', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231226', '绥棱县', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231281', '安达市', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231282', '肇东市', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('231283', '海伦市', '231200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('232700', '大兴安岭地区', '230000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('232721', '呼玛县', '232700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('232722', '塔河县', '232700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('232723', '漠河县', '232700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310000', '上海市', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('310100', '上海市', '310000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('310101', '黄浦区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310104', '徐汇区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310105', '长宁区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310106', '静安区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310107', '普陀区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310108', '闸北区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310109', '虹口区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310110', '杨浦区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310112', '闵行区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310113', '宝山区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310114', '嘉定区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310115', '浦东新区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310116', '金山区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310117', '松江区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310118', '青浦区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310120', '奉贤区', '310100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('310230', '崇明县', '310200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320000', '江苏省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('320100', '南京市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('320102', '玄武区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320104', '秦淮区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320105', '建邺区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320106', '鼓楼区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320111', '浦口区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320113', '栖霞区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320114', '雨花台区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320115', '江宁区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320116', '六合区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320117', '溧水区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320118', '高淳区', '320100', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320200', '无锡市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('320202', '崇安区', '320200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320203', '南长区', '320200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320204', '北塘区', '320200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320205', '锡山区', '320200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320206', '惠山区', '320200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320211', '滨湖区', '320200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320281', '江阴市', '320200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320282', '宜兴市', '320200', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320300', '徐州市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('320302', '鼓楼区', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320303', '云龙区', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320305', '贾汪区', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320311', '泉山区', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320312', '铜山区', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320321', '丰县', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320322', '沛县', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320324', '睢宁县', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320381', '新沂市', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320382', '邳州市', '320300', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320400', '常州市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('320402', '天宁区', '320400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320404', '钟楼区', '320400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320411', '新北区', '320400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320412', '武进区', '320400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320413', '金坛区', '320400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320481', '溧阳市', '320400', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320500', '苏州市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('320505', '虎丘区', '320500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320506', '吴中区', '320500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320507', '相城区', '320500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320508', '姑苏区', '320500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320509', '吴江区', '320500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320581', '常熟市', '320500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320582', '张家港市', '320500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320583', '昆山市', '320500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320585', '太仓市', '320500', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320600', '南通市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('320602', '崇川区', '320600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320611', '港闸区', '320600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320612', '通州区', '320600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320621', '海安县', '320600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320623', '如东县', '320600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320681', '启东市', '320600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320682', '如皋市', '320600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320684', '海门市', '320600', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320700', '连云港市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('320703', '连云区', '320700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320706', '海州区', '320700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320707', '赣榆区', '320700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320722', '东海县', '320700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320723', '灌云县', '320700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320724', '灌南县', '320700', '3', '2017-02-24 15:38:01', '2017-02-24 15:38:01');
INSERT INTO `regions` VALUES ('320800', '淮安市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('320802', '清河区', '320800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320803', '淮安区', '320800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320804', '淮阴区', '320800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320811', '清浦区', '320800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320826', '涟水县', '320800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320829', '洪泽县', '320800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320830', '盱眙县', '320800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320831', '金湖县', '320800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320900', '盐城市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('320902', '亭湖区', '320900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320903', '盐都区', '320900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320904', '大丰区', '320900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320921', '响水县', '320900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320922', '滨海县', '320900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320923', '阜宁县', '320900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320924', '射阳县', '320900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320925', '建湖县', '320900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('320981', '东台市', '320900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321000', '扬州市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('321002', '广陵区', '321000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321003', '邗江区', '321000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321012', '江都区', '321000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321023', '宝应县', '321000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321081', '仪征市', '321000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321084', '高邮市', '321000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321100', '镇江市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('321102', '京口区', '321100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321111', '润州区', '321100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321112', '丹徒区', '321100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321181', '丹阳市', '321100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321182', '扬中市', '321100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321183', '句容市', '321100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321200', '泰州市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('321202', '海陵区', '321200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321203', '高港区', '321200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321204', '姜堰区', '321200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321281', '兴化市', '321200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321282', '靖江市', '321200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321283', '泰兴市', '321200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321300', '宿迁市', '320000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('321302', '宿城区', '321300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321311', '宿豫区', '321300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321322', '沭阳县', '321300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321323', '泗阳县', '321300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('321324', '泗洪县', '321300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330000', '浙江省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('330100', '杭州市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('330102', '上城区', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330103', '下城区', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330104', '江干区', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330105', '拱墅区', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330106', '西湖区', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330108', '滨江区', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330109', '萧山区', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330110', '余杭区', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330111', '富阳区', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330122', '桐庐县', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330127', '淳安县', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330182', '建德市', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330185', '临安市', '330100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330200', '宁波市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('330203', '海曙区', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330204', '江东区', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330205', '江北区', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330206', '北仑区', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330211', '镇海区', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330212', '鄞州区', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330225', '象山县', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330226', '宁海县', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330281', '余姚市', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330282', '慈溪市', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330283', '奉化市', '330200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330300', '温州市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('330302', '鹿城区', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330303', '龙湾区', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330304', '瓯海区', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330305', '洞头区', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330324', '永嘉县', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330326', '平阳县', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330327', '苍南县', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330328', '文成县', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330329', '泰顺县', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330381', '瑞安市', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330382', '乐清市', '330300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330400', '嘉兴市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('330402', '南湖区', '330400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330411', '秀洲区', '330400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330421', '嘉善县', '330400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330424', '海盐县', '330400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330481', '海宁市', '330400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330482', '平湖市', '330400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330483', '桐乡市', '330400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330500', '湖州市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('330502', '吴兴区', '330500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330503', '南浔区', '330500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330521', '德清县', '330500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330522', '长兴县', '330500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330523', '安吉县', '330500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330600', '绍兴市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('330602', '越城区', '330600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330603', '柯桥区', '330600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330604', '上虞区', '330600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330624', '新昌县', '330600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330681', '诸暨市', '330600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330683', '嵊州市', '330600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330700', '金华市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('330702', '婺城区', '330700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330703', '金东区', '330700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330723', '武义县', '330700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330726', '浦江县', '330700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330727', '磐安县', '330700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330781', '兰溪市', '330700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330782', '义乌市', '330700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330783', '东阳市', '330700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330784', '永康市', '330700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330800', '衢州市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('330802', '柯城区', '330800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330803', '衢江区', '330800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330822', '常山县', '330800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330824', '开化县', '330800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330825', '龙游县', '330800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330881', '江山市', '330800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330900', '舟山市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('330902', '定海区', '330900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330903', '普陀区', '330900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330921', '岱山县', '330900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('330922', '嵊泗县', '330900', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331000', '台州市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('331002', '椒江区', '331000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331003', '黄岩区', '331000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331004', '路桥区', '331000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331021', '玉环县', '331000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331022', '三门县', '331000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331023', '天台县', '331000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331024', '仙居县', '331000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331081', '温岭市', '331000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331082', '临海市', '331000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331100', '丽水市', '330000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('331102', '莲都区', '331100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331121', '青田县', '331100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331122', '缙云县', '331100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331123', '遂昌县', '331100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331124', '松阳县', '331100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331125', '云和县', '331100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331126', '庆元县', '331100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331127', '景宁畲族自治县', '331100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('331181', '龙泉市', '331100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340000', '安徽省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('340100', '合肥市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('340102', '瑶海区', '340100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340103', '庐阳区', '340100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340104', '蜀山区', '340100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340111', '包河区', '340100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340121', '长丰县', '340100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340122', '肥东县', '340100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340123', '肥西县', '340100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340124', '庐江县', '340100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340181', '巢湖市', '340100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340200', '芜湖市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('340202', '镜湖区', '340200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340203', '弋江区', '340200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340207', '鸠江区', '340200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340208', '三山区', '340200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340221', '芜湖县', '340200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340222', '繁昌县', '340200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340223', '南陵县', '340200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340225', '无为县', '340200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340300', '蚌埠市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('340302', '龙子湖区', '340300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340303', '蚌山区', '340300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340304', '禹会区', '340300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340311', '淮上区', '340300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340321', '怀远县', '340300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340322', '五河县', '340300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340323', '固镇县', '340300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340400', '淮南市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('340402', '大通区', '340400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340403', '田家庵区', '340400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340404', '谢家集区', '340400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340405', '八公山区', '340400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340406', '潘集区', '340400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340421', '凤台县', '340400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340500', '马鞍山市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('340503', '花山区', '340500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340504', '雨山区', '340500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340506', '博望区', '340500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340521', '当涂县', '340500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340522', '含山县', '340500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340523', '和县', '340500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340600', '淮北市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('340602', '杜集区', '340600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340603', '相山区', '340600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340604', '烈山区', '340600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340621', '濉溪县', '340600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340700', '铜陵市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('340702', '铜官山区', '340700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340703', '狮子山区', '340700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340711', '郊区', '340700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340721', '铜陵县', '340700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340800', '安庆市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('340802', '迎江区', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340803', '大观区', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340811', '宜秀区', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340822', '怀宁县', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340823', '枞阳县', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340824', '潜山县', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340825', '太湖县', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340826', '宿松县', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340827', '望江县', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340828', '岳西县', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('340881', '桐城市', '340800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341000', '黄山市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('341002', '屯溪区', '341000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341003', '黄山区', '341000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341004', '徽州区', '341000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341021', '歙县', '341000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341022', '休宁县', '341000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341023', '黟县', '341000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341024', '祁门县', '341000', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341100', '滁州市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('341102', '琅琊区', '341100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341103', '南谯区', '341100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341122', '来安县', '341100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341124', '全椒县', '341100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341125', '定远县', '341100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341126', '凤阳县', '341100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341181', '天长市', '341100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341182', '明光市', '341100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341200', '阜阳市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('341202', '颍州区', '341200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341203', '颍东区', '341200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341204', '颍泉区', '341200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341221', '临泉县', '341200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341222', '太和县', '341200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341225', '阜南县', '341200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341226', '颍上县', '341200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341282', '界首市', '341200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341300', '宿州市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('341302', '埇桥区', '341300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341321', '砀山县', '341300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341322', '萧县', '341300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341323', '灵璧县', '341300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341324', '泗县', '341300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341500', '六安市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('341502', '金安区', '341500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341503', '裕安区', '341500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341521', '寿县', '341500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341522', '霍邱县', '341500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341523', '舒城县', '341500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341524', '金寨县', '341500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341525', '霍山县', '341500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341600', '亳州市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('341602', '谯城区', '341600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341621', '涡阳县', '341600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341622', '蒙城县', '341600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341623', '利辛县', '341600', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341700', '池州市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('341702', '贵池区', '341700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341721', '东至县', '341700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341722', '石台县', '341700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341723', '青阳县', '341700', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341800', '宣城市', '340000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('341802', '宣州区', '341800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341821', '郎溪县', '341800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341822', '广德县', '341800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341823', '泾县', '341800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341824', '绩溪县', '341800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341825', '旌德县', '341800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('341881', '宁国市', '341800', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350000', '福建省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('350100', '福州市', '350000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('350102', '鼓楼区', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350103', '台江区', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350104', '仓山区', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350105', '马尾区', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350111', '晋安区', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350121', '闽侯县', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350122', '连江县', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350123', '罗源县', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350124', '闽清县', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350125', '永泰县', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350128', '平潭县', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350181', '福清市', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350182', '长乐市', '350100', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350200', '厦门市', '350000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('350203', '思明区', '350200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350205', '海沧区', '350200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350206', '湖里区', '350200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350211', '集美区', '350200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350212', '同安区', '350200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350213', '翔安区', '350200', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350300', '莆田市', '350000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('350302', '城厢区', '350300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350303', '涵江区', '350300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350304', '荔城区', '350300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350305', '秀屿区', '350300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350322', '仙游县', '350300', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350400', '三明市', '350000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('350402', '梅列区', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350403', '三元区', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350421', '明溪县', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350423', '清流县', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350424', '宁化县', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350425', '大田县', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350426', '尤溪县', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350427', '沙县', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350428', '将乐县', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350429', '泰宁县', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350430', '建宁县', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350481', '永安市', '350400', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350500', '泉州市', '350000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('350502', '鲤城区', '350500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350503', '丰泽区', '350500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350504', '洛江区', '350500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350505', '泉港区', '350500', '3', '2017-02-24 15:38:02', '2017-02-24 15:38:02');
INSERT INTO `regions` VALUES ('350521', '惠安县', '350500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350524', '安溪县', '350500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350525', '永春县', '350500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350526', '德化县', '350500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350527', '金门县', '350500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350581', '石狮市', '350500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350582', '晋江市', '350500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350583', '南安市', '350500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350600', '漳州市', '350000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('350602', '芗城区', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350603', '龙文区', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350622', '云霄县', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350623', '漳浦县', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350624', '诏安县', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350625', '长泰县', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350626', '东山县', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350627', '南靖县', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350628', '平和县', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350629', '华安县', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350681', '龙海市', '350600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350700', '南平市', '350000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('350702', '延平区', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350703', '建阳区', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350721', '顺昌县', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350722', '浦城县', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350723', '光泽县', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350724', '松溪县', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350725', '政和县', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350781', '邵武市', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350782', '武夷山市', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350783', '建瓯市', '350700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350800', '龙岩市', '350000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('350802', '新罗区', '350800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350803', '永定区', '350800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350821', '长汀县', '350800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350823', '上杭县', '350800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350824', '武平县', '350800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350825', '连城县', '350800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350881', '漳平市', '350800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350900', '宁德市', '350000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('350902', '蕉城区', '350900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350921', '霞浦县', '350900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350922', '古田县', '350900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350923', '屏南县', '350900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350924', '寿宁县', '350900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350925', '周宁县', '350900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350926', '柘荣县', '350900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350981', '福安市', '350900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('350982', '福鼎市', '350900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360000', '江西省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('360100', '南昌市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('360102', '东湖区', '360100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360103', '西湖区', '360100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360104', '青云谱区', '360100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360105', '湾里区', '360100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360111', '青山湖区', '360100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360112', '新建区', '360100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360121', '南昌县', '360100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360123', '安义县', '360100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360124', '进贤县', '360100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360200', '景德镇市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('360202', '昌江区', '360200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360203', '珠山区', '360200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360222', '浮梁县', '360200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360281', '乐平市', '360200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360300', '萍乡市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('360302', '安源区', '360300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360313', '湘东区', '360300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360321', '莲花县', '360300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360322', '上栗县', '360300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360323', '芦溪县', '360300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360400', '九江市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('360402', '庐山区', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360403', '浔阳区', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360421', '九江县', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360423', '武宁县', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360424', '修水县', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360425', '永修县', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360426', '德安县', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360427', '星子县', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360428', '都昌县', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360429', '湖口县', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360430', '彭泽县', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360481', '瑞昌市', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360482', '共青城市', '360400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360500', '新余市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('360502', '渝水区', '360500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360521', '分宜县', '360500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360600', '鹰潭市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('360602', '月湖区', '360600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360622', '余江县', '360600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360681', '贵溪市', '360600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360700', '赣州市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('360702', '章贡区', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360703', '南康区', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360721', '赣县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360722', '信丰县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360723', '大余县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360724', '上犹县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360725', '崇义县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360726', '安远县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360727', '龙南县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360728', '定南县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360729', '全南县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360730', '宁都县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360731', '于都县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360732', '兴国县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360733', '会昌县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360734', '寻乌县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360735', '石城县', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360781', '瑞金市', '360700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360800', '吉安市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('360802', '吉州区', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360803', '青原区', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360821', '吉安县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360822', '吉水县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360823', '峡江县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360824', '新干县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360825', '永丰县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360826', '泰和县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360827', '遂川县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360828', '万安县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360829', '安福县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360830', '永新县', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360881', '井冈山市', '360800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360900', '宜春市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('360902', '袁州区', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360921', '奉新县', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360922', '万载县', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360923', '上高县', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360924', '宜丰县', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360925', '靖安县', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360926', '铜鼓县', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360981', '丰城市', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360982', '樟树市', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('360983', '高安市', '360900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361000', '抚州市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('361002', '临川区', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361021', '南城县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361022', '黎川县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361023', '南丰县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361024', '崇仁县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361025', '乐安县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361026', '宜黄县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361027', '金溪县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361028', '资溪县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361029', '东乡县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361030', '广昌县', '361000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361100', '上饶市', '360000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('361102', '信州区', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361103', '广丰区', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361121', '上饶县', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361123', '玉山县', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361124', '铅山县', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361125', '横峰县', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361126', '弋阳县', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361127', '余干县', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361128', '鄱阳县', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361129', '万年县', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361130', '婺源县', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('361181', '德兴市', '361100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370000', '山东省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('370100', '济南市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('370102', '历下区', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370103', '市中区', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370104', '槐荫区', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370105', '天桥区', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370112', '历城区', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370113', '长清区', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370124', '平阴县', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370125', '济阳县', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370126', '商河县', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370181', '章丘市', '370100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370200', '青岛市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('370202', '市南区', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370203', '市北区', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370211', '黄岛区', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370212', '崂山区', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370213', '李沧区', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370214', '城阳区', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370281', '胶州市', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370282', '即墨市', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370283', '平度市', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370285', '莱西市', '370200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370300', '淄博市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('370302', '淄川区', '370300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370303', '张店区', '370300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370304', '博山区', '370300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370305', '临淄区', '370300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370306', '周村区', '370300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370321', '桓台县', '370300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370322', '高青县', '370300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370323', '沂源县', '370300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370400', '枣庄市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('370402', '市中区', '370400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370403', '薛城区', '370400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370404', '峄城区', '370400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370405', '台儿庄区', '370400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370406', '山亭区', '370400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370481', '滕州市', '370400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370500', '东营市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('370502', '东营区', '370500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370503', '河口区', '370500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370521', '垦利县', '370500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370522', '利津县', '370500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370523', '广饶县', '370500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370600', '烟台市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('370602', '芝罘区', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370611', '福山区', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370612', '牟平区', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370613', '莱山区', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370634', '长岛县', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370681', '龙口市', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370682', '莱阳市', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370683', '莱州市', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370684', '蓬莱市', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370685', '招远市', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370686', '栖霞市', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370687', '海阳市', '370600', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370700', '潍坊市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('370702', '潍城区', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370703', '寒亭区', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370704', '坊子区', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370705', '奎文区', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370724', '临朐县', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370725', '昌乐县', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370781', '青州市', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370782', '诸城市', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370783', '寿光市', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370784', '安丘市', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370785', '高密市', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370786', '昌邑市', '370700', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370800', '济宁市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('370811', '任城区', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370812', '兖州区', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370826', '微山县', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370827', '鱼台县', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370828', '金乡县', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370829', '嘉祥县', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370830', '汶上县', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370831', '泗水县', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370832', '梁山县', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370881', '曲阜市', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370883', '邹城市', '370800', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370900', '泰安市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('370902', '泰山区', '370900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370911', '岱岳区', '370900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370921', '宁阳县', '370900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370923', '东平县', '370900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370982', '新泰市', '370900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('370983', '肥城市', '370900', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371000', '威海市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('371002', '环翠区', '371000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371003', '文登区', '371000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371082', '荣成市', '371000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371083', '乳山市', '371000', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371100', '日照市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('371102', '东港区', '371100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371103', '岚山区', '371100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371121', '五莲县', '371100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371122', '莒县', '371100', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371200', '莱芜市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('371202', '莱城区', '371200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371203', '钢城区', '371200', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371300', '临沂市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('371302', '兰山区', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371311', '罗庄区', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371312', '河东区', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371321', '沂南县', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371322', '郯城县', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371323', '沂水县', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371324', '兰陵县', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371325', '费县', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371326', '平邑县', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371327', '莒南县', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371328', '蒙阴县', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371329', '临沭县', '371300', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371400', '德州市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('371402', '德城区', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371403', '陵城区', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371422', '宁津县', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371423', '庆云县', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371424', '临邑县', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371425', '齐河县', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371426', '平原县', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371427', '夏津县', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371428', '武城县', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371481', '乐陵市', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371482', '禹城市', '371400', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371500', '聊城市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('371502', '东昌府区', '371500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371521', '阳谷县', '371500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371522', '莘县', '371500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371523', '茌平县', '371500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371524', '东阿县', '371500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371525', '冠县', '371500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371526', '高唐县', '371500', '3', '2017-02-24 15:38:03', '2017-02-24 15:38:03');
INSERT INTO `regions` VALUES ('371581', '临清市', '371500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371600', '滨州市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('371602', '滨城区', '371600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371603', '沾化区', '371600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371621', '惠民县', '371600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371622', '阳信县', '371600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371623', '无棣县', '371600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371625', '博兴县', '371600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371626', '邹平县', '371600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371700', '菏泽市', '370000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('371702', '牡丹区', '371700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371721', '曹县', '371700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371722', '单县', '371700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371723', '成武县', '371700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371724', '巨野县', '371700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371725', '郓城县', '371700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371726', '鄄城县', '371700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371727', '定陶县', '371700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('371728', '东明县', '371700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410000', '河南省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('410100', '郑州市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('410102', '中原区', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410103', '二七区', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410104', '管城回族区', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410105', '金水区', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410106', '上街区', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410108', '惠济区', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410122', '中牟县', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410181', '巩义市', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410182', '荥阳市', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410183', '新密市', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410184', '新郑市', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410185', '登封市', '410100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410200', '开封市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('410202', '龙亭区', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410203', '顺河回族区', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410204', '鼓楼区', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410205', '禹王台区', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410211', '金明区', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410212', '祥符区', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410221', '杞县', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410222', '通许县', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410223', '尉氏县', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410225', '兰考县', '410200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410300', '洛阳市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('410302', '老城区', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410303', '西工区', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410304', '瀍河回族区', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410305', '涧西区', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410306', '吉利区', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410311', '洛龙区', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410322', '孟津县', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410323', '新安县', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410324', '栾川县', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410325', '嵩县', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410326', '汝阳县', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410327', '宜阳县', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410328', '洛宁县', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410329', '伊川县', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410381', '偃师市', '410300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410400', '平顶山市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('410402', '新华区', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410403', '卫东区', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410404', '石龙区', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410411', '湛河区', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410421', '宝丰县', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410422', '叶县', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410423', '鲁山县', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410425', '郏县', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410481', '舞钢市', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410482', '汝州市', '410400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410500', '安阳市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('410502', '文峰区', '410500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410503', '北关区', '410500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410505', '殷都区', '410500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410506', '龙安区', '410500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410522', '安阳县', '410500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410523', '汤阴县', '410500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410526', '滑县', '410500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410527', '内黄县', '410500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410581', '林州市', '410500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410600', '鹤壁市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('410602', '鹤山区', '410600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410603', '山城区', '410600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410611', '淇滨区', '410600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410621', '浚县', '410600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410622', '淇县', '410600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410700', '新乡市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('410702', '红旗区', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410703', '卫滨区', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410704', '凤泉区', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410711', '牧野区', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410721', '新乡县', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410724', '获嘉县', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410725', '原阳县', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410726', '延津县', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410727', '封丘县', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410728', '长垣县', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410781', '卫辉市', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410782', '辉县市', '410700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410800', '焦作市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('410802', '解放区', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410803', '中站区', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410804', '马村区', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410811', '山阳区', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410821', '修武县', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410822', '博爱县', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410823', '武陟县', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410825', '温县', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410882', '沁阳市', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410883', '孟州市', '410800', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410900', '濮阳市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('410902', '华龙区', '410900', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410922', '清丰县', '410900', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410923', '南乐县', '410900', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410926', '范县', '410900', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410927', '台前县', '410900', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('410928', '濮阳县', '410900', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411000', '许昌市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('411002', '魏都区', '411000', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411023', '许昌县', '411000', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411024', '鄢陵县', '411000', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411025', '襄城县', '411000', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411081', '禹州市', '411000', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411082', '长葛市', '411000', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411100', '漯河市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('411102', '源汇区', '411100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411103', '郾城区', '411100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411104', '召陵区', '411100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411121', '舞阳县', '411100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411122', '临颍县', '411100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411200', '三门峡市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('411202', '湖滨区', '411200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411221', '渑池县', '411200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411222', '陕县', '411200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411224', '卢氏县', '411200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411281', '义马市', '411200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411282', '灵宝市', '411200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411300', '南阳市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('411302', '宛城区', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411303', '卧龙区', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411321', '南召县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411322', '方城县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411323', '西峡县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411324', '镇平县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411325', '内乡县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411326', '淅川县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411327', '社旗县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411328', '唐河县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411329', '新野县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411330', '桐柏县', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411381', '邓州市', '411300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411400', '商丘市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('411402', '梁园区', '411400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411403', '睢阳区', '411400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411421', '民权县', '411400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411422', '睢县', '411400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411423', '宁陵县', '411400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411424', '柘城县', '411400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411425', '虞城县', '411400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411426', '夏邑县', '411400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411481', '永城市', '411400', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411500', '信阳市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('411502', '浉河区', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411503', '平桥区', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411521', '罗山县', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411522', '光山县', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411523', '新县', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411524', '商城县', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411525', '固始县', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411526', '潢川县', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411527', '淮滨县', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411528', '息县', '411500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411600', '周口市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('411602', '川汇区', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411621', '扶沟县', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411622', '西华县', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411623', '商水县', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411624', '沈丘县', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411625', '郸城县', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411626', '淮阳县', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411627', '太康县', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411628', '鹿邑县', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411681', '项城市', '411600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411700', '驻马店市', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('411702', '驿城区', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411721', '西平县', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411722', '上蔡县', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411723', '平舆县', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411724', '正阳县', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411725', '确山县', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411726', '泌阳县', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411727', '汝南县', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411728', '遂平县', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('411729', '新蔡县', '411700', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('419000', '省直辖县级行政区划', '410000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('419001', '济源市', '419000', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420000', '湖北省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('420100', '武汉市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('420102', '江岸区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420103', '江汉区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420104', '硚口区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420105', '汉阳区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420106', '武昌区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420107', '青山区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420111', '洪山区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420112', '东西湖区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420113', '汉南区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420114', '蔡甸区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420115', '江夏区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420116', '黄陂区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420117', '新洲区', '420100', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420200', '黄石市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('420202', '黄石港区', '420200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420203', '西塞山区', '420200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420204', '下陆区', '420200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420205', '铁山区', '420200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420222', '阳新县', '420200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420281', '大冶市', '420200', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420300', '十堰市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('420302', '茅箭区', '420300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420303', '张湾区', '420300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420304', '郧阳区', '420300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420322', '郧西县', '420300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420323', '竹山县', '420300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420324', '竹溪县', '420300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420325', '房县', '420300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420381', '丹江口市', '420300', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420500', '宜昌市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('420502', '西陵区', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420503', '伍家岗区', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420504', '点军区', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420505', '猇亭区', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420506', '夷陵区', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420525', '远安县', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420526', '兴山县', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420527', '秭归县', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420528', '长阳土家族自治县', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420529', '五峰土家族自治县', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420581', '宜都市', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420582', '当阳市', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420583', '枝江市', '420500', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420600', '襄阳市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('420602', '襄城区', '420600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420606', '樊城区', '420600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420607', '襄州区', '420600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420624', '南漳县', '420600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420625', '谷城县', '420600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420626', '保康县', '420600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420682', '老河口市', '420600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420683', '枣阳市', '420600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420684', '宜城市', '420600', '3', '2017-02-24 15:38:04', '2017-02-24 15:38:04');
INSERT INTO `regions` VALUES ('420700', '鄂州市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('420702', '梁子湖区', '420700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420703', '华容区', '420700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420704', '鄂城区', '420700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420800', '荆门市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('420802', '东宝区', '420800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420804', '掇刀区', '420800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420821', '京山县', '420800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420822', '沙洋县', '420800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420881', '钟祥市', '420800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420900', '孝感市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('420902', '孝南区', '420900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420921', '孝昌县', '420900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420922', '大悟县', '420900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420923', '云梦县', '420900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420981', '应城市', '420900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420982', '安陆市', '420900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('420984', '汉川市', '420900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421000', '荆州市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('421002', '沙市区', '421000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421003', '荆州区', '421000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421022', '公安县', '421000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421023', '监利县', '421000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421024', '江陵县', '421000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421081', '石首市', '421000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421083', '洪湖市', '421000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421087', '松滋市', '421000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421100', '黄冈市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('421102', '黄州区', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421121', '团风县', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421122', '红安县', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421123', '罗田县', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421124', '英山县', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421125', '浠水县', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421126', '蕲春县', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421127', '黄梅县', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421181', '麻城市', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421182', '武穴市', '421100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421200', '咸宁市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('421202', '咸安区', '421200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421221', '嘉鱼县', '421200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421222', '通城县', '421200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421223', '崇阳县', '421200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421224', '通山县', '421200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421281', '赤壁市', '421200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421300', '随州市', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('421303', '曾都区', '421300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421321', '随县', '421300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('421381', '广水市', '421300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('422800', '恩施土家族苗族自治州', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('422801', '恩施市', '422800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('422802', '利川市', '422800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('422822', '建始县', '422800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('422823', '巴东县', '422800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('422825', '宣恩县', '422800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('422826', '咸丰县', '422800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('422827', '来凤县', '422800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('422828', '鹤峰县', '422800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('429000', '省直辖县级行政区划', '420000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('429004', '仙桃市', '429000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('429005', '潜江市', '429000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('429006', '天门市', '429000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('429021', '神农架林区', '429000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430000', '湖南省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('430100', '长沙市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('430102', '芙蓉区', '430100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430103', '天心区', '430100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430104', '岳麓区', '430100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430105', '开福区', '430100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430111', '雨花区', '430100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430112', '望城区', '430100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430121', '长沙县', '430100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430124', '宁乡县', '430100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430181', '浏阳市', '430100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430200', '株洲市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('430202', '荷塘区', '430200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430203', '芦淞区', '430200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430204', '石峰区', '430200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430211', '天元区', '430200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430221', '株洲县', '430200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430223', '攸县', '430200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430224', '茶陵县', '430200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430225', '炎陵县', '430200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430281', '醴陵市', '430200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430300', '湘潭市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('430302', '雨湖区', '430300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430304', '岳塘区', '430300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430321', '湘潭县', '430300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430381', '湘乡市', '430300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430382', '韶山市', '430300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430400', '衡阳市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('430405', '珠晖区', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430406', '雁峰区', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430407', '石鼓区', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430408', '蒸湘区', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430412', '南岳区', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430421', '衡阳县', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430422', '衡南县', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430423', '衡山县', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430424', '衡东县', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430426', '祁东县', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430481', '耒阳市', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430482', '常宁市', '430400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430500', '邵阳市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('430502', '双清区', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430503', '大祥区', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430511', '北塔区', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430521', '邵东县', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430522', '新邵县', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430523', '邵阳县', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430524', '隆回县', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430525', '洞口县', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430527', '绥宁县', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430528', '新宁县', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430529', '城步苗族自治县', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430581', '武冈市', '430500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430600', '岳阳市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('430602', '岳阳楼区', '430600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430603', '云溪区', '430600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430611', '君山区', '430600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430621', '岳阳县', '430600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430623', '华容县', '430600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430624', '湘阴县', '430600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430626', '平江县', '430600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430681', '汨罗市', '430600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430682', '临湘市', '430600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430700', '常德市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('430702', '武陵区', '430700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430703', '鼎城区', '430700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430721', '安乡县', '430700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430722', '汉寿县', '430700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430723', '澧县', '430700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430724', '临澧县', '430700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430725', '桃源县', '430700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430726', '石门县', '430700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430781', '津市市', '430700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430800', '张家界市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('430802', '永定区', '430800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430811', '武陵源区', '430800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430821', '慈利县', '430800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430822', '桑植县', '430800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430900', '益阳市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('430902', '资阳区', '430900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430903', '赫山区', '430900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430921', '南县', '430900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430922', '桃江县', '430900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430923', '安化县', '430900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('430981', '沅江市', '430900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431000', '郴州市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('431002', '北湖区', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431003', '苏仙区', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431021', '桂阳县', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431022', '宜章县', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431023', '永兴县', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431024', '嘉禾县', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431025', '临武县', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431026', '汝城县', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431027', '桂东县', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431028', '安仁县', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431081', '资兴市', '431000', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431100', '永州市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('431102', '零陵区', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431103', '冷水滩区', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431121', '祁阳县', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431122', '东安县', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431123', '双牌县', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431124', '道县', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431125', '江永县', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431126', '宁远县', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431127', '蓝山县', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431128', '新田县', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431129', '江华瑶族自治县', '431100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431200', '怀化市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('431202', '鹤城区', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431221', '中方县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431222', '沅陵县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431223', '辰溪县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431224', '溆浦县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431225', '会同县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431226', '麻阳苗族自治县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431227', '新晃侗族自治县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431228', '芷江侗族自治县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431229', '靖州苗族侗族自治县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431230', '通道侗族自治县', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431281', '洪江市', '431200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431300', '娄底市', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('431302', '娄星区', '431300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431321', '双峰县', '431300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431322', '新化县', '431300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431381', '冷水江市', '431300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('431382', '涟源市', '431300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('433100', '湘西土家族苗族自治州', '430000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('433101', '吉首市', '433100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('433122', '泸溪县', '433100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('433123', '凤凰县', '433100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('433124', '花垣县', '433100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('433125', '保靖县', '433100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('433126', '古丈县', '433100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('433127', '永顺县', '433100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('433130', '龙山县', '433100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440000', '广东省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('440100', '广州市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('440103', '荔湾区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440104', '越秀区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440105', '海珠区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440106', '天河区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440111', '白云区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440112', '黄埔区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440113', '番禺区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440114', '花都区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440115', '南沙区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440117', '从化区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440118', '增城区', '440100', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440200', '韶关市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('440203', '武江区', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440204', '浈江区', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440205', '曲江区', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440222', '始兴县', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440224', '仁化县', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440229', '翁源县', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440232', '乳源瑶族自治县', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440233', '新丰县', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440281', '乐昌市', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440282', '南雄市', '440200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440300', '深圳市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('440303', '罗湖区', '440300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440304', '福田区', '440300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440305', '南山区', '440300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440306', '宝安区', '440300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440307', '龙岗区', '440300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440308', '盐田区', '440300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440400', '珠海市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('440402', '香洲区', '440400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440403', '斗门区', '440400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440404', '金湾区', '440400', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440500', '汕头市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('440507', '龙湖区', '440500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440511', '金平区', '440500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440512', '濠江区', '440500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440513', '潮阳区', '440500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440514', '潮南区', '440500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440515', '澄海区', '440500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440523', '南澳县', '440500', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440600', '佛山市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('440604', '禅城区', '440600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440605', '南海区', '440600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440606', '顺德区', '440600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440607', '三水区', '440600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440608', '高明区', '440600', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440700', '江门市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('440703', '蓬江区', '440700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440704', '江海区', '440700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440705', '新会区', '440700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440781', '台山市', '440700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440783', '开平市', '440700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440784', '鹤山市', '440700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440785', '恩平市', '440700', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440800', '湛江市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('440802', '赤坎区', '440800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440803', '霞山区', '440800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440804', '坡头区', '440800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440811', '麻章区', '440800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440823', '遂溪县', '440800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440825', '徐闻县', '440800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440881', '廉江市', '440800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440882', '雷州市', '440800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440883', '吴川市', '440800', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440900', '茂名市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('440902', '茂南区', '440900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440904', '电白区', '440900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440981', '高州市', '440900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440982', '化州市', '440900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('440983', '信宜市', '440900', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441200', '肇庆市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('441202', '端州区', '441200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441203', '鼎湖区', '441200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441204', '高要区', '441200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441223', '广宁县', '441200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441224', '怀集县', '441200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441225', '封开县', '441200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441226', '德庆县', '441200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441284', '四会市', '441200', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441300', '惠州市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('441302', '惠城区', '441300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441303', '惠阳区', '441300', '3', '2017-02-24 15:38:05', '2017-02-24 15:38:05');
INSERT INTO `regions` VALUES ('441322', '博罗县', '441300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441323', '惠东县', '441300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441324', '龙门县', '441300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441400', '梅州市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('441402', '梅江区', '441400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441403', '梅县区', '441400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441422', '大埔县', '441400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441423', '丰顺县', '441400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441424', '五华县', '441400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441426', '平远县', '441400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441427', '蕉岭县', '441400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441481', '兴宁市', '441400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441500', '汕尾市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('441502', '城区', '441500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441521', '海丰县', '441500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441523', '陆河县', '441500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441581', '陆丰市', '441500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441600', '河源市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('441602', '源城区', '441600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441621', '紫金县', '441600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441622', '龙川县', '441600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441623', '连平县', '441600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441624', '和平县', '441600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441625', '东源县', '441600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441700', '阳江市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('441702', '江城区', '441700', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441704', '阳东区', '441700', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441721', '阳西县', '441700', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441781', '阳春市', '441700', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441800', '清远市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('441802', '清城区', '441800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441803', '清新区', '441800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441821', '佛冈县', '441800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441823', '阳山县', '441800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441825', '连山壮族瑶族自治县', '441800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441826', '连南瑶族自治县', '441800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441881', '英德市', '441800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441882', '连州市', '441800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('441900', '东莞市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('442000', '中山市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('445100', '潮州市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('445102', '湘桥区', '445100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445103', '潮安区', '445100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445122', '饶平县', '445100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445200', '揭阳市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('445202', '榕城区', '445200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445203', '揭东区', '445200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445222', '揭西县', '445200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445224', '惠来县', '445200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445281', '普宁市', '445200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445300', '云浮市', '440000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('445302', '云城区', '445300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445303', '云安区', '445300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445321', '新兴县', '445300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445322', '郁南县', '445300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('445381', '罗定市', '445300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450000', '广西壮族自治区', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('450100', '南宁市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('450102', '兴宁区', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450103', '青秀区', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450105', '江南区', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450107', '西乡塘区', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450108', '良庆区', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450109', '邕宁区', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450110', '武鸣区', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450123', '隆安县', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450124', '马山县', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450125', '上林县', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450126', '宾阳县', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450127', '横县', '450100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450200', '柳州市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('450202', '城中区', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450203', '鱼峰区', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450204', '柳南区', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450205', '柳北区', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450221', '柳江县', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450222', '柳城县', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450223', '鹿寨县', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450224', '融安县', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450225', '融水苗族自治县', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450226', '三江侗族自治县', '450200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450300', '桂林市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('450302', '秀峰区', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450303', '叠彩区', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450304', '象山区', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450305', '七星区', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450311', '雁山区', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450312', '临桂区', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450321', '阳朔县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450323', '灵川县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450324', '全州县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450325', '兴安县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450326', '永福县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450327', '灌阳县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450328', '龙胜各族自治县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450329', '资源县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450330', '平乐县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450331', '荔浦县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450332', '恭城瑶族自治县', '450300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450400', '梧州市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('450403', '万秀区', '450400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450405', '长洲区', '450400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450406', '龙圩区', '450400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450421', '苍梧县', '450400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450422', '藤县', '450400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450423', '蒙山县', '450400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450481', '岑溪市', '450400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450500', '北海市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('450502', '海城区', '450500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450503', '银海区', '450500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450512', '铁山港区', '450500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450521', '合浦县', '450500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450600', '防城港市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('450602', '港口区', '450600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450603', '防城区', '450600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450621', '上思县', '450600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450681', '东兴市', '450600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450700', '钦州市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('450702', '钦南区', '450700', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450703', '钦北区', '450700', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450721', '灵山县', '450700', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450722', '浦北县', '450700', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450800', '贵港市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('450802', '港北区', '450800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450803', '港南区', '450800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450804', '覃塘区', '450800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450821', '平南县', '450800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450881', '桂平市', '450800', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450900', '玉林市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('450902', '玉州区', '450900', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450903', '福绵区', '450900', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450921', '容县', '450900', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450922', '陆川县', '450900', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450923', '博白县', '450900', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450924', '兴业县', '450900', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('450981', '北流市', '450900', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451000', '百色市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('451002', '右江区', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451021', '田阳县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451022', '田东县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451023', '平果县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451024', '德保县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451026', '那坡县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451027', '凌云县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451028', '乐业县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451029', '田林县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451030', '西林县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451031', '隆林各族自治县', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451081', '靖西市', '451000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451100', '贺州市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('451102', '八步区', '451100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451121', '昭平县', '451100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451122', '钟山县', '451100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451123', '富川瑶族自治县', '451100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451200', '河池市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('451202', '金城江区', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451221', '南丹县', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451222', '天峨县', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451223', '凤山县', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451224', '东兰县', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451225', '罗城仫佬族自治县', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451226', '环江毛南族自治县', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451227', '巴马瑶族自治县', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451228', '都安瑶族自治县', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451229', '大化瑶族自治县', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451281', '宜州市', '451200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451300', '来宾市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('451302', '兴宾区', '451300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451321', '忻城县', '451300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451322', '象州县', '451300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451323', '武宣县', '451300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451324', '金秀瑶族自治县', '451300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451381', '合山市', '451300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451400', '崇左市', '450000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('451402', '江州区', '451400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451421', '扶绥县', '451400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451422', '宁明县', '451400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451423', '龙州县', '451400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451424', '大新县', '451400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451425', '天等县', '451400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('451481', '凭祥市', '451400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460000', '海南省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('460100', '海口市', '460000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('460105', '秀英区', '460100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460106', '龙华区', '460100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460107', '琼山区', '460100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460108', '美兰区', '460100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460200', '三亚市', '460000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('460202', '海棠区', '460200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460203', '吉阳区', '460200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460204', '天涯区', '460200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460205', '崖州区', '460200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460300', '三沙市', '460000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('460321', '西沙群岛', '460300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460322', '南沙群岛', '460300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('460323', '中沙群岛的岛礁及其海域', '460300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469000', '省直辖县级行政区划', '460000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('469001', '五指山市', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469002', '琼海市', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469003', '儋州市', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469005', '文昌市', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469006', '万宁市', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469007', '东方市', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469021', '定安县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469022', '屯昌县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469023', '澄迈县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469024', '临高县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469025', '白沙黎族自治县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469026', '昌江黎族自治县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469027', '乐东黎族自治县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469028', '陵水黎族自治县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469029', '保亭黎族苗族自治县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('469030', '琼中黎族苗族自治县', '469000', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500000', '重庆市', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('500100', '重庆市', '500000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('500101', '万州区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500102', '涪陵区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500103', '渝中区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500104', '大渡口区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500105', '江北区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500106', '沙坪坝区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500107', '九龙坡区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500108', '南岸区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500109', '北碚区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500110', '綦江区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500111', '大足区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500112', '渝北区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500113', '巴南区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500114', '黔江区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500115', '长寿区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500116', '江津区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500117', '合川区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500118', '永川区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500119', '南川区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500120', '璧山区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500151', '铜梁区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500152', '潼南区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500153', '荣昌区', '500100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500228', '梁平县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500229', '城口县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500230', '丰都县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500231', '垫江县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500232', '武隆县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500233', '忠县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500234', '开县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500235', '云阳县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500236', '奉节县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500237', '巫山县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500238', '巫溪县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500240', '石柱土家族自治县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500241', '秀山土家族苗族自治县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500242', '酉阳土家族苗族自治县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('500243', '彭水苗族土家族自治县', '500200', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510000', '四川省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('510100', '成都市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('510104', '锦江区', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510105', '青羊区', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510106', '金牛区', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510107', '武侯区', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510108', '成华区', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510112', '龙泉驿区', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510113', '青白江区', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510114', '新都区', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510115', '温江区', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510121', '金堂县', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510122', '双流县', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510124', '郫县', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510129', '大邑县', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510131', '蒲江县', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510132', '新津县', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510181', '都江堰市', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510182', '彭州市', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510183', '邛崃市', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510184', '崇州市', '510100', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510300', '自贡市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('510302', '自流井区', '510300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510303', '贡井区', '510300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510304', '大安区', '510300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510311', '沿滩区', '510300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510321', '荣县', '510300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510322', '富顺县', '510300', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510400', '攀枝花市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('510402', '东区', '510400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510403', '西区', '510400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510411', '仁和区', '510400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510421', '米易县', '510400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510422', '盐边县', '510400', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510500', '泸州市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('510502', '江阳区', '510500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510503', '纳溪区', '510500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510504', '龙马潭区', '510500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510521', '泸县', '510500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510522', '合江县', '510500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510524', '叙永县', '510500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510525', '古蔺县', '510500', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510600', '德阳市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('510603', '旌阳区', '510600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510623', '中江县', '510600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510626', '罗江县', '510600', '3', '2017-02-24 15:38:06', '2017-02-24 15:38:06');
INSERT INTO `regions` VALUES ('510681', '广汉市', '510600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510682', '什邡市', '510600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510683', '绵竹市', '510600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510700', '绵阳市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('510703', '涪城区', '510700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510704', '游仙区', '510700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510722', '三台县', '510700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510723', '盐亭县', '510700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510724', '安县', '510700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510725', '梓潼县', '510700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510726', '北川羌族自治县', '510700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510727', '平武县', '510700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510781', '江油市', '510700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510800', '广元市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('510802', '利州区', '510800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510811', '昭化区', '510800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510812', '朝天区', '510800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510821', '旺苍县', '510800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510822', '青川县', '510800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510823', '剑阁县', '510800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510824', '苍溪县', '510800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510900', '遂宁市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('510903', '船山区', '510900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510904', '安居区', '510900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510921', '蓬溪县', '510900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510922', '射洪县', '510900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('510923', '大英县', '510900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511000', '内江市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('511002', '市中区', '511000', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511011', '东兴区', '511000', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511024', '威远县', '511000', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511025', '资中县', '511000', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511028', '隆昌县', '511000', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511100', '乐山市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('511102', '市中区', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511111', '沙湾区', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511112', '五通桥区', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511113', '金口河区', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511123', '犍为县', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511124', '井研县', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511126', '夹江县', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511129', '沐川县', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511132', '峨边彝族自治县', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511133', '马边彝族自治县', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511181', '峨眉山市', '511100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511300', '南充市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('511302', '顺庆区', '511300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511303', '高坪区', '511300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511304', '嘉陵区', '511300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511321', '南部县', '511300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511322', '营山县', '511300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511323', '蓬安县', '511300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511324', '仪陇县', '511300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511325', '西充县', '511300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511381', '阆中市', '511300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511400', '眉山市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('511402', '东坡区', '511400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511403', '彭山区', '511400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511421', '仁寿县', '511400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511423', '洪雅县', '511400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511424', '丹棱县', '511400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511425', '青神县', '511400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511500', '宜宾市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('511502', '翠屏区', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511503', '南溪区', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511521', '宜宾县', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511523', '江安县', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511524', '长宁县', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511525', '高县', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511526', '珙县', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511527', '筠连县', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511528', '兴文县', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511529', '屏山县', '511500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511600', '广安市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('511602', '广安区', '511600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511603', '前锋区', '511600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511621', '岳池县', '511600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511622', '武胜县', '511600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511623', '邻水县', '511600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511681', '华蓥市', '511600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511700', '达州市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('511702', '通川区', '511700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511703', '达川区', '511700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511722', '宣汉县', '511700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511723', '开江县', '511700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511724', '大竹县', '511700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511725', '渠县', '511700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511781', '万源市', '511700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511800', '雅安市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('511802', '雨城区', '511800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511803', '名山区', '511800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511822', '荥经县', '511800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511823', '汉源县', '511800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511824', '石棉县', '511800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511825', '天全县', '511800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511826', '芦山县', '511800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511827', '宝兴县', '511800', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511900', '巴中市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('511902', '巴州区', '511900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511903', '恩阳区', '511900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511921', '通江县', '511900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511922', '南江县', '511900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('511923', '平昌县', '511900', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('512000', '资阳市', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('512002', '雁江区', '512000', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('512021', '安岳县', '512000', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('512022', '乐至县', '512000', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('512081', '简阳市', '512000', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('513221', '汶川县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513222', '理县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513223', '茂县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513224', '松潘县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513225', '九寨沟县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513226', '金川县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513227', '小金县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513228', '黑水县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513229', '马尔康县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513230', '壤塘县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513231', '阿坝县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513232', '若尔盖县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513233', '红原县', '513200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513300', '甘孜藏族自治州', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('513301', '康定市', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513322', '泸定县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513323', '丹巴县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513324', '九龙县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513325', '雅江县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513326', '道孚县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513327', '炉霍县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513328', '甘孜县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513329', '新龙县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513330', '德格县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513331', '白玉县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513332', '石渠县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513333', '色达县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513334', '理塘县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513335', '巴塘县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513336', '乡城县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513337', '稻城县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513338', '得荣县', '513300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513400', '凉山彝族自治州', '510000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('513401', '西昌市', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513422', '木里藏族自治县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513423', '盐源县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513424', '德昌县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513425', '会理县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513426', '会东县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513427', '宁南县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513428', '普格县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513429', '布拖县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513430', '金阳县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513431', '昭觉县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513432', '喜德县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513433', '冕宁县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513434', '越西县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513435', '甘洛县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513436', '美姑县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('513437', '雷波县', '513400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520000', '贵州省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('520100', '贵阳市', '520000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('520102', '南明区', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520103', '云岩区', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520111', '花溪区', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520112', '乌当区', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520113', '白云区', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520115', '观山湖区', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520121', '开阳县', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520122', '息烽县', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520123', '修文县', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520181', '清镇市', '520100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520200', '六盘水市', '520000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('520201', '钟山区', '520200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520203', '六枝特区', '520200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520221', '水城县', '520200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520222', '盘县', '520200', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520300', '遵义市', '520000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('520302', '红花岗区', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520303', '汇川区', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520321', '遵义县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520322', '桐梓县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520323', '绥阳县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520324', '正安县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520327', '凤冈县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520328', '湄潭县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520329', '余庆县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520330', '习水县', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520381', '赤水市', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520382', '仁怀市', '520300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520400', '安顺市', '520000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('520402', '西秀区', '520400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520403', '平坝区', '520400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520422', '普定县', '520400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520424', '关岭布依族苗族自治县', '520400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520425', '紫云苗族布依族自治县', '520400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520500', '毕节市', '520000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('520502', '七星关区', '520500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520521', '大方县', '520500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520522', '黔西县', '520500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520523', '金沙县', '520500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520524', '织金县', '520500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520525', '纳雍县', '520500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520526', '威宁彝族回族苗族自治县', '520500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520527', '赫章县', '520500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520600', '铜仁市', '520000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('520602', '碧江区', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520603', '万山区', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520621', '江口县', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520622', '玉屏侗族自治县', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520623', '石阡县', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520624', '思南县', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520625', '印江土家族苗族自治县', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520626', '德江县', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520627', '沿河土家族自治县', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('520628', '松桃苗族自治县', '520600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('522301', '兴义市', '522300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522322', '兴仁县', '522300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522323', '普安县', '522300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522324', '晴隆县', '522300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522325', '贞丰县', '522300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522326', '望谟县', '522300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522327', '册亨县', '522300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522328', '安龙县', '522300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('522601', '凯里市', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522622', '黄平县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522623', '施秉县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522624', '三穗县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522625', '镇远县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522626', '岑巩县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522627', '天柱县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522628', '锦屏县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522629', '剑河县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522630', '台江县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522631', '黎平县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522632', '榕江县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522633', '从江县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522634', '雷山县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522635', '麻江县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522636', '丹寨县', '522600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522700', '黔南布依族苗族自治州', '520000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('522701', '都匀市', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522702', '福泉市', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522722', '荔波县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522723', '贵定县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522725', '瓮安县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522726', '独山县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522727', '平塘县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522728', '罗甸县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522729', '长顺县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522730', '龙里县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522731', '惠水县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('522732', '三都水族自治县', '522700', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530000', '云南省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('530100', '昆明市', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('530102', '五华区', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530103', '盘龙区', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530111', '官渡区', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530112', '西山区', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530113', '东川区', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530114', '呈贡区', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530122', '晋宁县', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530124', '富民县', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530125', '宜良县', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530126', '石林彝族自治县', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530127', '嵩明县', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530129', '寻甸回族彝族自治县', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530181', '安宁市', '530100', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530300', '曲靖市', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('530302', '麒麟区', '530300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530321', '马龙县', '530300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530322', '陆良县', '530300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530323', '师宗县', '530300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530324', '罗平县', '530300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530325', '富源县', '530300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530326', '会泽县', '530300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530328', '沾益县', '530300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530381', '宣威市', '530300', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530400', '玉溪市', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('530402', '红塔区', '530400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530421', '江川县', '530400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530422', '澄江县', '530400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530423', '通海县', '530400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530424', '华宁县', '530400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530425', '易门县', '530400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530426', '峨山彝族自治县', '530400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530427', '新平彝族傣族自治县', '530400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530500', '保山市', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('530502', '隆阳区', '530500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530521', '施甸县', '530500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530523', '龙陵县', '530500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530524', '昌宁县', '530500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530581', '腾冲市', '530500', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530600', '昭通市', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('530602', '昭阳区', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530621', '鲁甸县', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530622', '巧家县', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530623', '盐津县', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530624', '大关县', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530625', '永善县', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530626', '绥江县', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530627', '镇雄县', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530628', '彝良县', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530629', '威信县', '530600', '3', '2017-02-24 15:38:07', '2017-02-24 15:38:07');
INSERT INTO `regions` VALUES ('530630', '水富县', '530600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530700', '丽江市', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('530702', '古城区', '530700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530721', '玉龙纳西族自治县', '530700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530722', '永胜县', '530700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530723', '华坪县', '530700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530724', '宁蒗彝族自治县', '530700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530800', '普洱市', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('530802', '思茅区', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530821', '宁洱哈尼族彝族自治县', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530822', '墨江哈尼族自治县', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530823', '景东彝族自治县', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530824', '景谷傣族彝族自治县', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530828', '澜沧拉祜族自治县', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530829', '西盟佤族自治县', '530800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530900', '临沧市', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('530902', '临翔区', '530900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530921', '凤庆县', '530900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530922', '云县', '530900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530923', '永德县', '530900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530924', '镇康县', '530900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530926', '耿马傣族佤族自治县', '530900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('530927', '沧源佤族自治县', '530900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532300', '楚雄彝族自治州', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('532301', '楚雄市', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532322', '双柏县', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532323', '牟定县', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532324', '南华县', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532325', '姚安县', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532326', '大姚县', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532327', '永仁县', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532328', '元谋县', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532329', '武定县', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532331', '禄丰县', '532300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('532501', '个旧市', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532502', '开远市', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532503', '蒙自市', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532504', '弥勒市', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532523', '屏边苗族自治县', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532524', '建水县', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532525', '石屏县', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532527', '泸西县', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532528', '元阳县', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532529', '红河县', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532531', '绿春县', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532532', '河口瑶族自治县', '532500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532600', '文山壮族苗族自治州', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('532601', '文山市', '532600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532622', '砚山县', '532600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532623', '西畴县', '532600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532624', '麻栗坡县', '532600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532625', '马关县', '532600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532626', '丘北县', '532600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532627', '广南县', '532600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532628', '富宁县', '532600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532800', '西双版纳傣族自治州', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('532801', '景洪市', '532800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532822', '勐海县', '532800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532823', '勐腊县', '532800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532900', '大理白族自治州', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('532901', '大理市', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532922', '漾濞彝族自治县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532923', '祥云县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532924', '宾川县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532925', '弥渡县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532926', '南涧彝族自治县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532927', '巍山彝族回族自治县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532928', '永平县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532929', '云龙县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532930', '洱源县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532931', '剑川县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('532932', '鹤庆县', '532900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('533102', '瑞丽市', '533100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533103', '芒市', '533100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533122', '梁河县', '533100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533123', '盈江县', '533100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533124', '陇川县', '533100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533300', '怒江傈僳族自治州', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('533321', '泸水县', '533300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533323', '福贡县', '533300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533325', '兰坪白族普米族自治县', '533300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533400', '迪庆藏族自治州', '530000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('533401', '香格里拉市', '533400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533422', '德钦县', '533400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('533423', '维西傈僳族自治县', '533400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540000', '西藏自治区', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('540100', '拉萨市', '540000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('540102', '城关区', '540100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540121', '林周县', '540100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540122', '当雄县', '540100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540123', '尼木县', '540100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540124', '曲水县', '540100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540125', '堆龙德庆县', '540100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540126', '达孜县', '540100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540127', '墨竹工卡县', '540100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540200', '日喀则市', '540000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('540202', '桑珠孜区', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540221', '南木林县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540222', '江孜县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540223', '定日县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540224', '萨迦县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540225', '拉孜县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540226', '昂仁县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540227', '谢通门县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540228', '白朗县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540229', '仁布县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540230', '康马县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540231', '定结县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540232', '仲巴县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540233', '亚东县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540234', '吉隆县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540235', '聂拉木县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540236', '萨嘎县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540237', '岗巴县', '540200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540300', '昌都市', '540000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('540302', '卡若区', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540321', '江达县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540322', '贡觉县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540323', '类乌齐县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540324', '丁青县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540325', '察雅县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540326', '八宿县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540327', '左贡县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540328', '芒康县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540329', '洛隆县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540330', '边坝县', '540300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540400', '林芝市', '540000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('540402', '巴宜区', '540400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540421', '工布江达县', '540400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540422', '米林县', '540400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540423', '墨脱县', '540400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540424', '波密县', '540400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540425', '察隅县', '540400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('540426', '朗县', '540400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542200', '山南地区', '540000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('542221', '乃东县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542222', '扎囊县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542223', '贡嘎县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542224', '桑日县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542225', '琼结县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542226', '曲松县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542227', '措美县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542228', '洛扎县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542229', '加查县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542231', '隆子县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542232', '错那县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542233', '浪卡子县', '542200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542400', '那曲地区', '540000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('542421', '那曲县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542422', '嘉黎县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542423', '比如县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542424', '聂荣县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542425', '安多县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542426', '申扎县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542427', '索县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542428', '班戈县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542429', '巴青县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542430', '尼玛县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542431', '双湖县', '542400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542500', '阿里地区', '540000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('542521', '普兰县', '542500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542522', '札达县', '542500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542523', '噶尔县', '542500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542524', '日土县', '542500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542525', '革吉县', '542500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542526', '改则县', '542500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('542527', '措勤县', '542500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610000', '陕西省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('610100', '西安市', '610000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('610102', '新城区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610103', '碑林区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610104', '莲湖区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610111', '灞桥区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610112', '未央区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610113', '雁塔区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610114', '阎良区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610115', '临潼区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610116', '长安区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610117', '高陵区', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610122', '蓝田县', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610124', '周至县', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610125', '户县', '610100', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610200', '铜川市', '610000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('610202', '王益区', '610200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610203', '印台区', '610200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610204', '耀州区', '610200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610222', '宜君县', '610200', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610300', '宝鸡市', '610000', '2', '2017-02-24 15:37:58', '2017-02-24 15:37:58');
INSERT INTO `regions` VALUES ('610302', '渭滨区', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610303', '金台区', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610304', '陈仓区', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610322', '凤翔县', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610323', '岐山县', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610324', '扶风县', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610326', '眉县', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610327', '陇县', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610328', '千阳县', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610329', '麟游县', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610330', '凤县', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610331', '太白县', '610300', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610400', '咸阳市', '610000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('610402', '秦都区', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610403', '杨陵区', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610404', '渭城区', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610422', '三原县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610423', '泾阳县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610424', '乾县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610425', '礼泉县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610426', '永寿县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610427', '彬县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610428', '长武县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610429', '旬邑县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610430', '淳化县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610431', '武功县', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610481', '兴平市', '610400', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610500', '渭南市', '610000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('610502', '临渭区', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610521', '华县', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610522', '潼关县', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610523', '大荔县', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610524', '合阳县', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610525', '澄城县', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610526', '蒲城县', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610527', '白水县', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610528', '富平县', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610581', '韩城市', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610582', '华阴市', '610500', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610600', '延安市', '610000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('610602', '宝塔区', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610621', '延长县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610622', '延川县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610623', '子长县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610624', '安塞县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610625', '志丹县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610626', '吴起县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610627', '甘泉县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610628', '富县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610629', '洛川县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610630', '宜川县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610631', '黄龙县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610632', '黄陵县', '610600', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610700', '汉中市', '610000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('610702', '汉台区', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610721', '南郑县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610722', '城固县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610723', '洋县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610724', '西乡县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610725', '勉县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610726', '宁强县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610727', '略阳县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610728', '镇巴县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610729', '留坝县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610730', '佛坪县', '610700', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610800', '榆林市', '610000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('610802', '榆阳区', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610821', '神木县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610822', '府谷县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610823', '横山县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610824', '靖边县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610825', '定边县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610826', '绥德县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610827', '米脂县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610828', '佳县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610829', '吴堡县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610830', '清涧县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610831', '子洲县', '610800', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610900', '安康市', '610000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('610902', '汉滨区', '610900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610921', '汉阴县', '610900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610922', '石泉县', '610900', '3', '2017-02-24 15:38:08', '2017-02-24 15:38:08');
INSERT INTO `regions` VALUES ('610923', '宁陕县', '610900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('610924', '紫阳县', '610900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('610925', '岚皋县', '610900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('610926', '平利县', '610900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('610927', '镇坪县', '610900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('610928', '旬阳县', '610900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('610929', '白河县', '610900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('611000', '商洛市', '610000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('611002', '商州区', '611000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('611021', '洛南县', '611000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('611022', '丹凤县', '611000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('611023', '商南县', '611000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('611024', '山阳县', '611000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('611025', '镇安县', '611000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('611026', '柞水县', '611000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620000', '甘肃省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('620100', '兰州市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('620102', '城关区', '620100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620103', '七里河区', '620100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620104', '西固区', '620100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620105', '安宁区', '620100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620111', '红古区', '620100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620121', '永登县', '620100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620122', '皋兰县', '620100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620123', '榆中县', '620100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620200', '嘉峪关市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('620300', '金昌市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('620302', '金川区', '620300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620321', '永昌县', '620300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620400', '白银市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('620402', '白银区', '620400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620403', '平川区', '620400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620421', '靖远县', '620400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620422', '会宁县', '620400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620423', '景泰县', '620400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620500', '天水市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('620502', '秦州区', '620500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620503', '麦积区', '620500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620521', '清水县', '620500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620522', '秦安县', '620500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620523', '甘谷县', '620500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620524', '武山县', '620500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620525', '张家川回族自治县', '620500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620600', '武威市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('620602', '凉州区', '620600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620621', '民勤县', '620600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620622', '古浪县', '620600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620623', '天祝藏族自治县', '620600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620700', '张掖市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('620702', '甘州区', '620700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620721', '肃南裕固族自治县', '620700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620722', '民乐县', '620700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620723', '临泽县', '620700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620724', '高台县', '620700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620725', '山丹县', '620700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620800', '平凉市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('620802', '崆峒区', '620800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620821', '泾川县', '620800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620822', '灵台县', '620800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620823', '崇信县', '620800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620824', '华亭县', '620800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620825', '庄浪县', '620800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620826', '静宁县', '620800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620900', '酒泉市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('620902', '肃州区', '620900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620921', '金塔县', '620900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620922', '瓜州县', '620900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620923', '肃北蒙古族自治县', '620900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620981', '玉门市', '620900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('620982', '敦煌市', '620900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621000', '庆阳市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('621002', '西峰区', '621000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621021', '庆城县', '621000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621022', '环县', '621000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621023', '华池县', '621000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621024', '合水县', '621000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621025', '正宁县', '621000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621026', '宁县', '621000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621027', '镇原县', '621000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621100', '定西市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('621102', '安定区', '621100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621121', '通渭县', '621100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621122', '陇西县', '621100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621123', '渭源县', '621100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621124', '临洮县', '621100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621125', '漳县', '621100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621126', '岷县', '621100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621200', '陇南市', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('621202', '武都区', '621200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621221', '成县', '621200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621222', '文县', '621200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621223', '宕昌县', '621200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621224', '康县', '621200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621225', '西和县', '621200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621226', '礼县', '621200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621227', '徽县', '621200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('621228', '两当县', '621200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('622900', '临夏回族自治州', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('622901', '临夏市', '622900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('622921', '临夏县', '622900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('622922', '康乐县', '622900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('622923', '永靖县', '622900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('622924', '广河县', '622900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('622925', '和政县', '622900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('622926', '东乡族自治县', '622900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('623000', '甘南藏族自治州', '620000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('623001', '合作市', '623000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('623021', '临潭县', '623000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('623022', '卓尼县', '623000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('623023', '舟曲县', '623000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('623024', '迭部县', '623000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('623025', '玛曲县', '623000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('623026', '碌曲县', '623000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('623027', '夏河县', '623000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630000', '青海省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('630100', '西宁市', '630000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('630102', '城东区', '630100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630103', '城中区', '630100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630104', '城西区', '630100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630105', '城北区', '630100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630121', '大通回族土族自治县', '630100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630122', '湟中县', '630100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630123', '湟源县', '630100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630200', '海东市', '630000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('630202', '乐都区', '630200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630203', '平安区', '630200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630222', '民和回族土族自治县', '630200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630223', '互助土族自治县', '630200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630224', '化隆回族自治县', '630200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('630225', '循化撒拉族自治县', '630200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632200', '海北藏族自治州', '630000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('632221', '门源回族自治县', '632200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632222', '祁连县', '632200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632223', '海晏县', '632200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632224', '刚察县', '632200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632300', '黄南藏族自治州', '630000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('632321', '同仁县', '632300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632322', '尖扎县', '632300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632323', '泽库县', '632300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632324', '河南蒙古族自治县', '632300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632500', '海南藏族自治州', '630000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('632521', '共和县', '632500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632522', '同德县', '632500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632523', '贵德县', '632500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632524', '兴海县', '632500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632525', '贵南县', '632500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632600', '果洛藏族自治州', '630000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('632621', '玛沁县', '632600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632622', '班玛县', '632600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632623', '甘德县', '632600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632624', '达日县', '632600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632625', '久治县', '632600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632626', '玛多县', '632600', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632700', '玉树藏族自治州', '630000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('632701', '玉树市', '632700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632722', '杂多县', '632700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632723', '称多县', '632700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632724', '治多县', '632700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632725', '囊谦县', '632700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632726', '曲麻莱县', '632700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('632801', '格尔木市', '632800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632802', '德令哈市', '632800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632821', '乌兰县', '632800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632822', '都兰县', '632800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('632823', '天峻县', '632800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640000', '宁夏回族自治区', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('640100', '银川市', '640000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('640104', '兴庆区', '640100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640105', '西夏区', '640100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640106', '金凤区', '640100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640121', '永宁县', '640100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640122', '贺兰县', '640100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640181', '灵武市', '640100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640200', '石嘴山市', '640000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('640202', '大武口区', '640200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640205', '惠农区', '640200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640221', '平罗县', '640200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640300', '吴忠市', '640000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('640302', '利通区', '640300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640303', '红寺堡区', '640300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640323', '盐池县', '640300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640324', '同心县', '640300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640381', '青铜峡市', '640300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640400', '固原市', '640000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('640402', '原州区', '640400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640422', '西吉县', '640400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640423', '隆德县', '640400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640424', '泾源县', '640400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640425', '彭阳县', '640400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640500', '中卫市', '640000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('640502', '沙坡头区', '640500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640521', '中宁县', '640500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('640522', '海原县', '640500', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650000', '新疆维吾尔自治区', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('650100', '乌鲁木齐市', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('650102', '天山区', '650100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650103', '沙依巴克区', '650100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650104', '新市区', '650100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650105', '水磨沟区', '650100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650106', '头屯河区', '650100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650107', '达坂城区', '650100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650109', '米东区', '650100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650121', '乌鲁木齐县', '650100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650200', '克拉玛依市', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('650202', '独山子区', '650200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650203', '克拉玛依区', '650200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650204', '白碱滩区', '650200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650205', '乌尔禾区', '650200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650400', '吐鲁番市', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('650402', '高昌区', '650400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650421', '鄯善县', '650400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('650422', '托克逊县', '650400', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652200', '哈密地区', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('652201', '哈密市', '652200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652222', '巴里坤哈萨克自治县', '652200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652223', '伊吾县', '652200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652300', '昌吉回族自治州', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('652301', '昌吉市', '652300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652302', '阜康市', '652300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652323', '呼图壁县', '652300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652324', '玛纳斯县', '652300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652325', '奇台县', '652300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652327', '吉木萨尔县', '652300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652328', '木垒哈萨克自治县', '652300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('652701', '博乐市', '652700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652702', '阿拉山口市', '652700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652722', '精河县', '652700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652723', '温泉县', '652700', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('652801', '库尔勒市', '652800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652822', '轮台县', '652800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652823', '尉犁县', '652800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652824', '若羌县', '652800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652825', '且末县', '652800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652826', '焉耆回族自治县', '652800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652827', '和静县', '652800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652828', '和硕县', '652800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652829', '博湖县', '652800', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652900', '阿克苏地区', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('652901', '阿克苏市', '652900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652922', '温宿县', '652900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652923', '库车县', '652900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652924', '沙雅县', '652900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652925', '新和县', '652900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652926', '拜城县', '652900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652927', '乌什县', '652900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652928', '阿瓦提县', '652900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('652929', '柯坪县', '652900', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('653001', '阿图什市', '653000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653022', '阿克陶县', '653000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653023', '阿合奇县', '653000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653024', '乌恰县', '653000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653100', '喀什地区', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('653101', '喀什市', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653121', '疏附县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653122', '疏勒县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653123', '英吉沙县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653124', '泽普县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653125', '莎车县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653126', '叶城县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653127', '麦盖提县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653128', '岳普湖县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653129', '伽师县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653130', '巴楚县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653200', '和田地区', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('653201', '和田市', '653200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653221', '和田县', '653200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653222', '墨玉县', '653200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653223', '皮山县', '653200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653224', '洛浦县', '653200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653225', '策勒县', '653200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653226', '于田县', '653200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('653227', '民丰县', '653200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654000', '伊犁哈萨克自治州', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('654002', '伊宁市', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654003', '奎屯市', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654004', '霍尔果斯市', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654021', '伊宁县', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654022', '察布查尔锡伯自治县', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654023', '霍城县', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654024', '巩留县', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654025', '新源县', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654026', '昭苏县', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654027', '特克斯县', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654028', '尼勒克县', '654000', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654200', '塔城地区', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('654201', '塔城市', '654200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654202', '乌苏市', '654200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654221', '额敏县', '654200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654223', '沙湾县', '654200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654224', '托里县', '654200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654225', '裕民县', '654200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654300', '阿勒泰地区', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('654301', '阿勒泰市', '654300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654321', '布尔津县', '654300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654322', '富蕴县', '654300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654323', '福海县', '654300', '3', '2017-02-24 15:38:09', '2017-02-24 15:38:09');
INSERT INTO `regions` VALUES ('654324', '哈巴河县', '654300', '3', '2017-02-24 15:38:10', '2017-02-24 15:38:10');
INSERT INTO `regions` VALUES ('654325', '青河县', '654300', '3', '2017-02-24 15:38:10', '2017-02-24 15:38:10');
INSERT INTO `regions` VALUES ('654326', '吉木乃县', '654300', '3', '2017-02-24 15:38:10', '2017-02-24 15:38:10');
INSERT INTO `regions` VALUES ('659000', '自治区直辖县级行政区划', '650000', '2', '2017-02-24 15:37:59', '2017-02-24 15:37:59');
INSERT INTO `regions` VALUES ('659001', '石河子市', '659000', '3', '2017-02-24 15:38:10', '2017-02-24 15:38:10');
INSERT INTO `regions` VALUES ('659002', '阿拉尔市', '659000', '3', '2017-02-24 15:38:10', '2017-02-24 15:38:10');
INSERT INTO `regions` VALUES ('659003', '图木舒克市', '659000', '3', '2017-02-24 15:38:10', '2017-02-24 15:38:10');
INSERT INTO `regions` VALUES ('659004', '五家渠市', '659000', '3', '2017-02-24 15:38:10', '2017-02-24 15:38:10');
INSERT INTO `regions` VALUES ('710000', '台湾省', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('810000', '香港特别行政区', null, '1', '2017-02-24 15:37:57', '2017-02-24 15:37:57');
INSERT INTO `regions` VALUES ('820000', '澳门特别行政区', null, '1', '2017-02-24 15:37:58', '2017-02-24 15:37:58');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_name` (`name`),
  KEY `index_roles_on_name_and_resource_type_and_resource_id` (`name`,`resource_type`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('2', 'yunying', null, null, '2017-02-24 15:30:57', '2017-02-24 15:30:57', '总部运营', '');
INSERT INTO `roles` VALUES ('3', 'fenchengshi', null, null, '2017-02-24 15:31:07', '2017-02-24 15:31:07', '分城市运营', '');
INSERT INTO `roles` VALUES ('4', '警察', null, null, '2017-04-14 17:16:58', '2017-04-14 17:16:58', '公安局', null);

-- ----------------------------
-- Table structure for schema_migrations
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO `schema_migrations` VALUES ('20170217075940');
INSERT INTO `schema_migrations` VALUES ('20170217084446');
INSERT INTO `schema_migrations` VALUES ('20170217090039');
INSERT INTO `schema_migrations` VALUES ('20170217091048');
INSERT INTO `schema_migrations` VALUES ('20170217100430');
INSERT INTO `schema_migrations` VALUES ('20170218050238');
INSERT INTO `schema_migrations` VALUES ('20170218142304');
INSERT INTO `schema_migrations` VALUES ('20170220051609');
INSERT INTO `schema_migrations` VALUES ('20170221014839');
INSERT INTO `schema_migrations` VALUES ('20170221020032');
INSERT INTO `schema_migrations` VALUES ('20170221055331');
INSERT INTO `schema_migrations` VALUES ('20170221061958');
INSERT INTO `schema_migrations` VALUES ('20170221072426');
INSERT INTO `schema_migrations` VALUES ('20170222033846');
INSERT INTO `schema_migrations` VALUES ('20170222074032');
INSERT INTO `schema_migrations` VALUES ('20170222081256');
INSERT INTO `schema_migrations` VALUES ('20170222092357');
INSERT INTO `schema_migrations` VALUES ('20170222151520');
INSERT INTO `schema_migrations` VALUES ('20170222153418');
INSERT INTO `schema_migrations` VALUES ('20170223021159');
INSERT INTO `schema_migrations` VALUES ('20170223063134');
INSERT INTO `schema_migrations` VALUES ('20170223063345');
INSERT INTO `schema_migrations` VALUES ('20170227073145');
INSERT INTO `schema_migrations` VALUES ('20170227085655');
INSERT INTO `schema_migrations` VALUES ('20170227091333');
INSERT INTO `schema_migrations` VALUES ('20170420023042');
INSERT INTO `schema_migrations` VALUES ('20170420032224');
INSERT INTO `schema_migrations` VALUES ('20170420080725');
INSERT INTO `schema_migrations` VALUES ('20170420081020');
INSERT INTO `schema_migrations` VALUES ('20170420081148');
INSERT INTO `schema_migrations` VALUES ('20170420083220');
INSERT INTO `schema_migrations` VALUES ('20170420083234');
INSERT INTO `schema_migrations` VALUES ('20170420144908');
INSERT INTO `schema_migrations` VALUES ('20170421134735');
INSERT INTO `schema_migrations` VALUES ('20170421134755');
INSERT INTO `schema_migrations` VALUES ('20170421134804');
INSERT INTO `schema_migrations` VALUES ('20170421134812');
INSERT INTO `schema_migrations` VALUES ('20170422013246');
INSERT INTO `schema_migrations` VALUES ('20170422013302');
INSERT INTO `schema_migrations` VALUES ('20170512063258');
INSERT INTO `schema_migrations` VALUES ('20170512063312');
INSERT INTO `schema_migrations` VALUES ('20170512143745');
INSERT INTO `schema_migrations` VALUES ('20170512144246');
INSERT INTO `schema_migrations` VALUES ('20170512144339');
INSERT INTO `schema_migrations` VALUES ('20170512144448');
INSERT INTO `schema_migrations` VALUES ('20170512144716');
INSERT INTO `schema_migrations` VALUES ('20170512144822');
INSERT INTO `schema_migrations` VALUES ('20170512144946');
INSERT INTO `schema_migrations` VALUES ('20170512145030');
INSERT INTO `schema_migrations` VALUES ('20170512145207');
INSERT INTO `schema_migrations` VALUES ('20170512145316');
INSERT INTO `schema_migrations` VALUES ('20170512145450');
INSERT INTO `schema_migrations` VALUES ('20170517094940');
INSERT INTO `schema_migrations` VALUES ('20170517144427');
INSERT INTO `schema_migrations` VALUES ('20170517144429');
INSERT INTO `schema_migrations` VALUES ('20170517144432');
INSERT INTO `schema_migrations` VALUES ('20170517144613');
INSERT INTO `schema_migrations` VALUES ('20170517144635');
INSERT INTO `schema_migrations` VALUES ('20170517155318');
INSERT INTO `schema_migrations` VALUES ('20170517155327');

-- ----------------------------
-- Table structure for settlement_prices
-- ----------------------------
DROP TABLE IF EXISTS `settlement_prices`;
CREATE TABLE `settlement_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settlement_rule_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settlement_prices_on_settlement_rule_id` (`settlement_rule_id`),
  KEY `index_settlement_prices_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_e6259d5046` FOREIGN KEY (`settlement_rule_id`) REFERENCES `settlement_rules` (`id`),
  CONSTRAINT `fk_rails_cbce5a341c` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settlement_prices
-- ----------------------------

-- ----------------------------
-- Table structure for settlement_rules
-- ----------------------------
DROP TABLE IF EXISTS `settlement_rules`;
CREATE TABLE `settlement_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settlement_rules_on_category_id` (`category_id`),
  KEY `index_settlement_rules_on_city_id` (`city_id`),
  CONSTRAINT `fk_rails_42d269dd40` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_rails_b8c6322fa8` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settlement_rules
-- ----------------------------

-- ----------------------------
-- Table structure for station_addresses
-- ----------------------------
DROP TABLE IF EXISTS `station_addresses`;
CREATE TABLE `station_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `community` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `house_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of station_addresses
-- ----------------------------
INSERT INTO `station_addresses` VALUES ('1', '演示2', '18810816259', '男', '北京市', '西城区', '西长安街', '', null, '39.9152', '116.394', '2017-04-13 22:27:22', '2017-05-27 01:39:55');
INSERT INTO `station_addresses` VALUES ('3', '展示1', '111111', null, '北京市', '东城区', '河泊厂胡同', '45号', null, '39.9004', '116.421', '2017-05-07 06:02:37', '2017-05-07 06:02:37');
INSERT INTO `station_addresses` VALUES ('4', '演示2', '18810816259', null, '北京市', '西城区', '西长安街', '', null, '39.9152', '116.394', '2017-05-27 01:39:55', '2017-05-27 01:39:55');
INSERT INTO `station_addresses` VALUES ('5', '1111', '18810816259', null, '北京市', '东城区', '草厂头条', '7号', null, '39.9028', '116.412', '2017-05-27 01:41:22', '2017-05-27 01:41:22');
INSERT INTO `station_addresses` VALUES ('6', '123124123', '123124124', null, '北京市', '东城区', '故宫东门外', '', null, '39.923', '116.406', '2017-05-27 02:03:52', '2017-05-27 02:03:52');

-- ----------------------------
-- Table structure for stations
-- ----------------------------
DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stations_on_region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stations
-- ----------------------------
INSERT INTO `stations` VALUES ('2', '中关村站', '2017-02-24 16:14:06', '2017-02-24 16:26:57', '110108');

-- ----------------------------
-- Table structure for tests
-- ----------------------------
DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tests
-- ----------------------------

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `community` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `house_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES ('1', '渣渣5号', '18811442447', '', '南京', '不知道的地方', '大桥', '桥洞4号', '1', '54.6566', '445.768', '2017-04-21 13:58:36', '2017-04-21 13:58:36');
INSERT INTO `user_addresses` VALUES ('2', 'ts', '18500087587', '', '天津市', '和平区', 'hepinggongyuan', '1234', '9', '39.9603', '116.355', '2017-05-07 01:51:57', '2017-05-07 02:25:35');
INSERT INTO `user_addresses` VALUES ('3', 'ts87', '18500000008', '', '北京市', '海淀区', 'bjtu', '6', '9', '39.9603', '116.355', '2017-05-07 02:25:58', '2017-05-07 02:25:58');
INSERT INTO `user_addresses` VALUES ('4', 'test', '18600000002', '', '北京市', '东城区', 'buzhidao', '123', '3', '39.9603', '116.355', '2017-05-07 02:50:29', '2017-05-07 02:50:29');
INSERT INTO `user_addresses` VALUES ('5', 'tsts', '18500000002', '', '北京市', '西城区', 'xicheng', '123', '5', '39.9603', '116.355', '2017-05-07 06:21:16', '2017-05-07 06:21:16');
INSERT INTO `user_addresses` VALUES ('6', 'tt', '18600000002', '', '天津市', '和平区', 'hjk', '567', '3', '39.9603', '116.355', '2017-05-07 06:31:24', '2017-05-07 06:31:24');
INSERT INTO `user_addresses` VALUES ('7', 'ts', '18600000001', '', '北京市', '东城区', 'haha', '1605', '2', '39.9603', '116.355', '2017-05-20 07:40:05', '2017-05-20 07:40:05');
INSERT INTO `user_addresses` VALUES ('8', 'ts', '18500000001', '', '北京市', '海淀区', 'Beijing Jiaotong University', 'Xueyuan Apartment', '11', '39.9603', '116.355', '2017-05-26 15:26:02', '2017-05-26 15:26:02');
INSERT INTO `user_addresses` VALUES ('9', 'ts', '18500000008', '', '北京市', '海淀区', 'bjtu', '1605', '13', '39.9603', '116.355', '2017-05-27 01:55:47', '2017-05-27 01:55:47');
INSERT INTO `user_addresses` VALUES ('11', 'ts', '18500000008', '', '北京市', '东城区', 'bjtu', '123', '13', '39.9603', '116.355', '2017-05-27 01:56:52', '2017-05-27 01:56:52');

-- ----------------------------
-- Table structure for user_card_charge_settings
-- ----------------------------
DROP TABLE IF EXISTS `user_card_charge_settings`;
CREATE TABLE `user_card_charge_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` float DEFAULT NULL,
  `money_give` float DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_card_charge_settings_on_city_id` (`city_id`),
  CONSTRAINT `fk_rails_3662e32833` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_card_charge_settings
-- ----------------------------
INSERT INTO `user_card_charge_settings` VALUES ('1', '50', '10', null, '2017-05-17 14:02:14', '2017-05-17 14:02:14');
INSERT INTO `user_card_charge_settings` VALUES ('2', '60', '19', null, '2017-05-25 22:26:25', '2017-05-11 22:26:50');
INSERT INTO `user_card_charge_settings` VALUES ('3', '10', '50', null, '2017-05-17 14:31:06', '2017-05-17 14:31:06');
INSERT INTO `user_card_charge_settings` VALUES ('7', '100', '1', null, '2017-05-18 16:16:45', '2017-05-18 16:16:45');
INSERT INTO `user_card_charge_settings` VALUES ('9', '54', '22', null, '2017-05-20 08:32:11', '2017-05-20 08:32:11');

-- ----------------------------
-- Table structure for user_card_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_card_logs`;
CREATE TABLE `user_card_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` int(11) DEFAULT NULL,
  `real_money` float DEFAULT NULL,
  `fake_money` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `loggable_type` varchar(255) DEFAULT NULL,
  `loggable_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_card_logs
-- ----------------------------
INSERT INTO `user_card_logs` VALUES ('1', '0', '15', '14', '10', '操作员充值', '0', '2017-05-26 15:32:52', '2017-05-26 15:32:52');
INSERT INTO `user_card_logs` VALUES ('2', '0', '10', '50', '10', '操作员充值', '1', '2017-05-26 15:33:04', '2017-05-26 15:33:04');
INSERT INTO `user_card_logs` VALUES ('3', '0', '66', '6', '11', '操作员充值', '0', '2017-05-26 15:33:18', '2017-05-26 15:33:18');
INSERT INTO `user_card_logs` VALUES ('4', '0', '60', '19', '11', '操作员充值', '1', '2017-05-26 15:33:29', '2017-05-26 15:33:29');
INSERT INTO `user_card_logs` VALUES ('5', '0', '66', '6', '11', '操作员充值', '0', '2017-05-26 15:34:19', '2017-05-26 15:34:19');
INSERT INTO `user_card_logs` VALUES ('6', '0', '60', '19', '11', '操作员充值', '1', '2017-05-26 15:34:23', '2017-05-26 15:34:23');
INSERT INTO `user_card_logs` VALUES ('7', '0', '66', '6', '10', '操作员充值', '0', '2017-05-26 15:34:42', '2017-05-26 15:34:42');
INSERT INTO `user_card_logs` VALUES ('8', '0', '50', '10', '10', '操作员充值', '1', '2017-05-26 15:34:54', '2017-05-26 15:34:54');
INSERT INTO `user_card_logs` VALUES ('9', '0', '55', '0', '11', '用户充值', '0', '2017-05-26 15:41:17', '2017-05-26 15:41:17');
INSERT INTO `user_card_logs` VALUES ('10', '1', '32', '0', '11', '用户支付', '1', '2017-05-26 16:08:08', '2017-05-26 16:08:08');
INSERT INTO `user_card_logs` VALUES ('11', '1', '131', '0', '11', '用户支付', '1', '2017-05-26 16:39:11', '2017-05-26 16:39:11');
INSERT INTO `user_card_logs` VALUES ('12', '0', '0', '131', '11', '订单退款', '1', '2017-05-26 17:04:16', '2017-05-26 17:04:16');
INSERT INTO `user_card_logs` VALUES ('13', '1', '0', '54', '11', '用户支付', '1', '2017-05-27 01:28:07', '2017-05-27 01:28:07');
INSERT INTO `user_card_logs` VALUES ('14', '1', '0', '8', '11', '用户支付', '1', '2017-05-27 01:36:06', '2017-05-27 01:36:06');
INSERT INTO `user_card_logs` VALUES ('15', '0', '0', '32', '11', '订单退款', '1', '2017-05-27 01:52:02', '2017-05-27 01:52:02');
INSERT INTO `user_card_logs` VALUES ('16', '0', '50', '10', '13', '操作员充值', '1', '2017-05-27 01:54:16', '2017-05-27 01:54:16');
INSERT INTO `user_card_logs` VALUES ('17', '0', '2', '0', '13', '用户充值', '0', '2017-05-27 01:55:01', '2017-05-27 01:55:01');
INSERT INTO `user_card_logs` VALUES ('18', '1', '18', '0', '13', '用户支付', '1', '2017-05-27 01:58:02', '2017-05-27 01:58:02');
INSERT INTO `user_card_logs` VALUES ('19', '1', '11', '0', '13', '用户支付', '1', '2017-05-27 01:59:52', '2017-05-27 01:59:52');
INSERT INTO `user_card_logs` VALUES ('20', '0', '0', '11', '13', '订单退款', '1', '2017-05-27 02:00:35', '2017-05-27 02:00:35');
INSERT INTO `user_card_logs` VALUES ('21', '0', '60', '19', '13', '操作员充值', '1', '2017-05-27 02:05:01', '2017-05-27 02:05:01');

-- ----------------------------
-- Table structure for user_cards
-- ----------------------------
DROP TABLE IF EXISTS `user_cards`;
CREATE TABLE `user_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_money` float DEFAULT NULL,
  `fake_money` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_cards
-- ----------------------------
INSERT INTO `user_cards` VALUES ('1', '260', '106', '2', '2017-05-04 14:45:12', '2017-05-26 15:19:30');
INSERT INTO `user_cards` VALUES ('2', '5869', '520', '3', '2017-04-28 13:41:53', '2017-05-26 15:28:43');
INSERT INTO `user_cards` VALUES ('3', '201', '101', '4', '2017-05-13 13:42:05', '2017-05-13 07:54:20');
INSERT INTO `user_cards` VALUES ('4', '2', '2', '5', '2017-05-13 13:42:14', '2017-05-13 13:42:17');
INSERT INTO `user_cards` VALUES ('5', '3', '3', '6', '2017-05-25 13:42:24', '2017-05-13 13:42:27');
INSERT INTO `user_cards` VALUES ('6', '4', '4', '7', '2017-05-13 13:45:19', '2017-05-13 13:45:21');
INSERT INTO `user_cards` VALUES ('7', '5', '5', '8', '2017-05-13 13:45:30', '2017-05-19 13:45:33');
INSERT INTO `user_cards` VALUES ('8', '6', '6', '9', '2017-05-05 13:45:41', '2017-05-13 13:45:43');
INSERT INTO `user_cards` VALUES ('9', '185', '124', '10', '2017-05-18 13:16:00', '2017-05-26 15:34:54');
INSERT INTO `user_cards` VALUES ('10', '0', '101', '11', '2017-05-26 14:58:37', '2017-05-27 01:52:01');
INSERT INTO `user_cards` VALUES ('11', '0', '0', '12', '2017-05-27 01:53:48', '2017-05-27 01:53:48');
INSERT INTO `user_cards` VALUES ('12', '83', '40', '13', '2017-05-27 01:53:52', '2017-05-27 02:05:01');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_mobile` (`mobile`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', '18600000001', '18600000001@qq.com', '123456', null, null, null, '3', '2017-03-22 09:21:07', '2017-02-24 15:56:05', '127.0.0.1', '127.0.0.1', 'user1', '2017-02-24 15:34:00', '2017-03-22 09:21:07');
INSERT INTO `users` VALUES ('3', '18600000002', '18600000002@qq.com', '123456', null, null, null, '0', null, null, null, null, 'tyuty', '2017-04-15 01:36:01', '2017-04-15 01:36:01');
INSERT INTO `users` VALUES ('10', '18811442000', '123@qq.com', '123456', null, null, null, '0', null, null, null, null, '啦啦', '2017-05-18 13:16:00', '2017-05-18 13:16:00');
INSERT INTO `users` VALUES ('11', '18500000001', '18500000001@qq.com', '123456', null, null, null, '0', null, null, null, null, 'ts', '2017-05-26 14:58:37', '2017-05-26 14:58:37');
INSERT INTO `users` VALUES ('12', '18500000002', '18500000002@qq.com', '123456', null, null, null, '0', null, null, null, null, 'ts', '2017-05-27 01:53:45', '2017-05-27 01:53:45');
INSERT INTO `users` VALUES ('13', '18500000008', '18500000008@qq.com', '123456', null, null, null, '0', null, null, null, null, 'ts', '2017-05-27 01:53:52', '2017-05-27 01:53:52');

-- ----------------------------
-- Table structure for waybills
-- ----------------------------
DROP TABLE IF EXISTS `waybills`;
CREATE TABLE `waybills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT '0',
  `sender_type` varchar(255) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_type` varchar(255) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `waybill_id` int(11) DEFAULT NULL,
  `exp_time` datetime DEFAULT NULL,
  `actual_time` datetime DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_waybills_on_waybill_id` (`waybill_id`),
  KEY `index_waybills_on_order_id` (`order_id`),
  KEY `index_waybills_on_sender_type_and_sender_id` (`sender_type`,`sender_id`),
  KEY `index_waybills_on_receiver_type_and_receiver_id` (`receiver_type`,`receiver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of waybills
-- ----------------------------
INSERT INTO `waybills` VALUES ('1', '1', '骑手即将取件', null, null, null, null, '2017-04-26 17:26:00', null, '1', '2017-05-26 15:26:49', '2017-05-26 15:26:49');
INSERT INTO `waybills` VALUES ('2', '2', '你的黑土骑士正在飞奔到你身边取件', null, null, null, null, '2017-05-20 15:59:25', null, '1', '2017-05-26 15:32:44', '2017-05-26 15:32:44');
INSERT INTO `waybills` VALUES ('3', '3', '你需要付钱洗衣了', null, null, null, null, '2017-05-20 15:59:25', null, '1', '2017-05-26 15:32:47', '2017-05-26 15:32:47');
INSERT INTO `waybills` VALUES ('4', '7', '你已经签收了你的干净衣服', null, null, null, null, '2017-05-20 15:59:25', null, '1', '2017-05-26 15:33:21', '2017-05-26 15:33:21');
INSERT INTO `waybills` VALUES ('5', '1', '骑手即将取件', null, null, null, null, '2017-04-27 06:02:00', null, '2', '2017-05-26 16:02:49', '2017-05-26 16:02:49');
INSERT INTO `waybills` VALUES ('6', '1', '骑手即将取件', null, null, null, null, '2017-04-27 06:07:00', null, '3', '2017-05-26 16:07:11', '2017-05-26 16:07:11');
INSERT INTO `waybills` VALUES ('7', '4', '你的黑土骑士正载着你的衣服奔向洗衣房', null, null, null, null, '2017-05-26 16:08:08', null, '3', '2017-05-26 16:08:08', '2017-05-26 16:08:08');
INSERT INTO `waybills` VALUES ('8', '1', '骑手即将取件', null, null, null, null, '2017-04-27 06:10:00', null, '4', '2017-05-26 16:10:54', '2017-05-26 16:10:54');
INSERT INTO `waybills` VALUES ('9', '1', '骑手即将取件', null, null, null, null, '2017-04-27 00:11:00', null, '5', '2017-05-26 16:11:04', '2017-05-26 16:11:04');
INSERT INTO `waybills` VALUES ('11', '1', '骑手即将取件', null, null, null, null, null, null, '6', '2017-05-26 16:24:42', '2017-05-26 16:24:42');
INSERT INTO `waybills` VALUES ('12', '1', '骑手即将取件', null, null, null, null, '2017-04-27 00:24:00', null, '7', '2017-05-26 16:24:53', '2017-05-26 16:24:53');
INSERT INTO `waybills` VALUES ('14', '9', '申请退单', null, null, null, null, '2017-05-26 16:33:53', null, '4', '2017-05-26 16:33:53', '2017-05-26 16:33:53');
INSERT INTO `waybills` VALUES ('15', '11', '完成退款', null, null, null, null, '2017-05-26 16:34:02', null, '4', '2017-05-26 16:34:02', '2017-05-26 16:34:02');
INSERT INTO `waybills` VALUES ('16', '4', '你的黑土骑士正载着你的衣服奔向洗衣房', null, null, null, null, '2017-05-26 16:39:11', null, '6', '2017-05-26 16:39:11', '2017-05-26 16:39:11');
INSERT INTO `waybills` VALUES ('24', '9', '申请退单', null, null, null, null, '2017-05-26 17:03:13', null, '6', '2017-05-26 17:03:13', '2017-05-26 17:03:13');
INSERT INTO `waybills` VALUES ('25', '11', '完成退款', null, null, null, null, '2017-05-26 17:04:16', null, '6', '2017-05-26 17:04:16', '2017-05-26 17:04:16');
INSERT INTO `waybills` VALUES ('26', '1', '骑手即将取件', null, null, null, null, '2017-04-27 01:04:00', null, '8', '2017-05-27 01:26:13', '2017-05-27 01:26:13');
INSERT INTO `waybills` VALUES ('27', '2', '你的黑土骑士正在飞奔到你身边取件', null, null, null, null, '2017-05-20 15:59:25', null, '8', '2017-05-27 01:27:26', '2017-05-27 01:27:26');
INSERT INTO `waybills` VALUES ('28', '3', '你需要付钱洗衣了', null, null, null, null, '2017-05-20 15:59:25', null, '8', '2017-05-27 01:27:33', '2017-05-27 01:27:33');
INSERT INTO `waybills` VALUES ('29', '4', '你的黑土骑士正载着你的衣服奔向洗衣房', null, null, null, null, '2017-05-27 01:28:07', null, '8', '2017-05-27 01:28:07', '2017-05-27 01:28:07');
INSERT INTO `waybills` VALUES ('30', '5', '你的脏衣服正在被洗衣机蹂躏', null, null, null, null, '2017-05-20 15:59:25', null, '8', '2017-05-27 01:29:02', '2017-05-27 01:29:02');
INSERT INTO `waybills` VALUES ('31', '6', '你的白云骑士正带着你的干净衣服奔向你身边', null, null, null, null, '2017-05-20 15:59:25', null, '8', '2017-05-27 01:29:09', '2017-05-27 01:29:09');
INSERT INTO `waybills` VALUES ('32', '7', '你已经签收了你的干净衣服', null, null, null, null, '2017-05-20 15:59:25', null, '8', '2017-05-27 01:29:32', '2017-05-27 01:29:32');
INSERT INTO `waybills` VALUES ('33', '1', '骑手即将取件', null, null, null, null, '2017-04-27 01:12:00', null, '9', '2017-05-27 01:34:42', '2017-05-27 01:34:42');
INSERT INTO `waybills` VALUES ('34', '1', '骑手即将取件', null, null, null, null, '2017-04-27 01:13:00', null, '10', '2017-05-27 01:34:53', '2017-05-27 01:34:53');
INSERT INTO `waybills` VALUES ('35', '2', '你的黑土骑士正在飞奔到你身边取件', null, null, null, null, '2017-05-20 15:59:25', null, '10', '2017-05-27 01:35:14', '2017-05-27 01:35:14');
INSERT INTO `waybills` VALUES ('36', '3', '你需要付钱洗衣了', null, null, null, null, '2017-05-20 15:59:25', null, '10', '2017-05-27 01:35:22', '2017-05-27 01:35:22');
INSERT INTO `waybills` VALUES ('37', '4', '你的黑土骑士正载着你的衣服奔向洗衣房', null, null, null, null, '2017-05-27 01:36:06', null, '10', '2017-05-27 01:36:06', '2017-05-27 01:36:06');
INSERT INTO `waybills` VALUES ('38', '5', '你的脏衣服正在被洗衣机蹂躏', null, null, null, null, '2017-05-20 15:59:25', null, '10', '2017-05-27 01:38:23', '2017-05-27 01:38:23');
INSERT INTO `waybills` VALUES ('39', '6', '你的白云骑士正带着你的干净衣服奔向你身边', null, null, null, null, '2017-05-20 15:59:25', null, '10', '2017-05-27 01:38:32', '2017-05-27 01:38:32');
INSERT INTO `waybills` VALUES ('40', '7', '你已经签收了你的干净衣服', null, null, null, null, '2017-05-20 15:59:25', null, '10', '2017-05-27 01:39:14', '2017-05-27 01:39:14');
INSERT INTO `waybills` VALUES ('42', '9', '申请退单', null, null, null, null, '2017-05-27 01:51:55', null, '3', '2017-05-27 01:51:55', '2017-05-27 01:51:55');
INSERT INTO `waybills` VALUES ('43', '11', '完成退款', null, null, null, null, '2017-05-27 01:52:02', null, '3', '2017-05-27 01:52:02', '2017-05-27 01:52:02');
INSERT INTO `waybills` VALUES ('44', '1', '骑手即将取件', null, null, null, null, '2017-04-27 01:34:00', null, '11', '2017-05-27 01:57:01', '2017-05-27 01:57:01');
INSERT INTO `waybills` VALUES ('45', '2', '你的黑土骑士正在飞奔到你身边取件', null, null, null, null, '2017-05-20 15:59:25', null, '11', '2017-05-27 01:57:19', '2017-05-27 01:57:19');
INSERT INTO `waybills` VALUES ('46', '3', '你需要付钱洗衣了', null, null, null, null, '2017-05-20 15:59:25', null, '11', '2017-05-27 01:57:26', '2017-05-27 01:57:26');
INSERT INTO `waybills` VALUES ('47', '4', '你的黑土骑士正载着你的衣服奔向洗衣房', null, null, null, null, '2017-05-27 01:58:02', null, '11', '2017-05-27 01:58:02', '2017-05-27 01:58:02');
INSERT INTO `waybills` VALUES ('48', '5', '你的脏衣服正在被洗衣机蹂躏', null, null, null, null, '2017-05-20 15:59:25', null, '11', '2017-05-27 01:58:28', '2017-05-27 01:58:28');
INSERT INTO `waybills` VALUES ('49', '6', '你的白云骑士正带着你的干净衣服奔向你身边', null, null, null, null, '2017-05-20 15:59:25', null, '11', '2017-05-27 01:58:35', '2017-05-27 01:58:35');
INSERT INTO `waybills` VALUES ('50', '1', '骑手即将取件', null, null, null, null, '2017-04-27 06:36:00', null, '12', '2017-05-27 01:58:37', '2017-05-27 01:58:38');
INSERT INTO `waybills` VALUES ('51', '7', '你已经签收了你的干净衣服', null, null, null, null, '2017-05-20 15:59:25', null, '11', '2017-05-27 01:58:44', '2017-05-27 01:58:44');
INSERT INTO `waybills` VALUES ('52', '1', '骑手即将取件', null, null, null, null, '2017-04-27 05:37:00', null, '13', '2017-05-27 01:58:59', '2017-05-27 01:58:59');
INSERT INTO `waybills` VALUES ('53', '2', '你的黑土骑士正在飞奔到你身边取件', null, null, null, null, '2017-05-20 15:59:25', null, '12', '2017-05-27 01:59:24', '2017-05-27 01:59:24');
INSERT INTO `waybills` VALUES ('54', '2', '你的黑土骑士正在飞奔到你身边取件', null, null, null, null, '2017-05-20 15:59:25', null, '13', '2017-05-27 01:59:25', '2017-05-27 01:59:25');
INSERT INTO `waybills` VALUES ('55', '3', '你需要付钱洗衣了', null, null, null, null, '2017-05-20 15:59:25', null, '12', '2017-05-27 01:59:29', '2017-05-27 01:59:29');
INSERT INTO `waybills` VALUES ('56', '3', '你需要付钱洗衣了', null, null, null, null, '2017-05-20 15:59:25', null, '13', '2017-05-27 01:59:31', '2017-05-27 01:59:31');
INSERT INTO `waybills` VALUES ('57', '4', '你的黑土骑士正载着你的衣服奔向洗衣房', null, null, null, null, '2017-05-27 01:59:52', null, '13', '2017-05-27 01:59:52', '2017-05-27 01:59:52');
INSERT INTO `waybills` VALUES ('59', '9', '申请退单', null, null, null, null, '2017-05-27 02:00:28', null, '13', '2017-05-27 02:00:28', '2017-05-27 02:00:28');
INSERT INTO `waybills` VALUES ('60', '11', '完成退款', null, null, null, null, '2017-05-27 02:00:34', null, '13', '2017-05-27 02:00:34', '2017-05-27 02:00:34');
INSERT INTO `waybills` VALUES ('61', '5', '你的脏衣服正在被洗衣机蹂躏', null, null, null, null, '2017-05-20 15:59:25', null, '4', '2017-05-27 10:11:41', '2017-05-27 10:11:41');

-- ----------------------------
-- Table structure for waybills_status
-- ----------------------------
DROP TABLE IF EXISTS `waybills_status`;
CREATE TABLE `waybills_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of waybills_status
-- ----------------------------
INSERT INTO `waybills_status` VALUES ('1', '你的黑土骑士正在飞奔到你身边取件');
INSERT INTO `waybills_status` VALUES ('2', '你的黑土骑士正载着你的衣服奔向洗衣房');
INSERT INTO `waybills_status` VALUES ('3', '你需要付钱洗衣了');
INSERT INTO `waybills_status` VALUES ('4', '你的脏衣服正在被洗衣机蹂躏');
INSERT INTO `waybills_status` VALUES ('5', '你的白云骑士正带着你的干净衣服奔向你身边');
INSERT INTO `waybills_status` VALUES ('6', '你已经签收了你的干净衣服');

-- ----------------------------
-- Table structure for worker_cards
-- ----------------------------
DROP TABLE IF EXISTS `worker_cards`;
CREATE TABLE `worker_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` float DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker_cards
-- ----------------------------

-- ----------------------------
-- Table structure for worker_logs
-- ----------------------------
DROP TABLE IF EXISTS `worker_logs`;
CREATE TABLE `worker_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` int(11) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker_logs
-- ----------------------------

-- ----------------------------
-- Table structure for worker_roles
-- ----------------------------
DROP TABLE IF EXISTS `worker_roles`;
CREATE TABLE `worker_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_worker_roles_on_worker_id` (`worker_id`),
  KEY `index_worker_roles_on_role_id` (`role_id`),
  CONSTRAINT `fk_rails_51200667c2` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`),
  CONSTRAINT `fk_rails_c0fb2e6713` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker_roles
-- ----------------------------
INSERT INTO `worker_roles` VALUES ('2', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `worker_roles` VALUES ('5', '5', '4', '0000-00-00 00:00:00', '2017-05-20 07:40:25');
INSERT INTO `worker_roles` VALUES ('6', '6', '4', '0000-00-00 00:00:00', '2017-05-20 07:38:13');
INSERT INTO `worker_roles` VALUES ('7', '2', '4', '2017-05-20 07:23:14', '2017-05-20 07:23:14');
INSERT INTO `worker_roles` VALUES ('9', '4', '4', '2017-05-20 07:26:45', '2017-05-20 07:26:45');
INSERT INTO `worker_roles` VALUES ('10', '3', '3', '2017-05-20 07:27:22', '2017-05-20 07:40:33');

-- ----------------------------
-- Table structure for workers
-- ----------------------------
DROP TABLE IF EXISTS `workers`;
CREATE TABLE `workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_workers_on_email` (`email`),
  UNIQUE KEY `index_workers_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workers
-- ----------------------------
INSERT INTO `workers` VALUES ('1', 'admin@washing.com', '123456', null, null, null, '20', '2017-04-14 07:08:34', '2017-04-14 06:42:23', '192.168.134.1', '192.168.134.1', null, '2017-02-24 15:26:55', '2017-05-18 14:21:01');
INSERT INTO `workers` VALUES ('2', 'yunying@washing.com', '123456', '7ecd0edc93096fe505f90c19427b657653adf6d803e34bcd7867595693fd7235', '2017-03-22 09:06:04', null, '15', '2017-04-10 14:52:17', '2017-04-10 14:51:59', '127.0.0.1', '127.0.0.1', null, '2017-02-24 15:34:39', '2017-05-18 14:20:10');
INSERT INTO `workers` VALUES ('3', 'fenchengshi@washing.com', '123456', null, null, null, '11', '2017-04-10 14:52:51', '2017-04-08 08:53:31', '127.0.0.1', '127.0.0.1', null, '2017-02-24 15:34:49', '2017-05-18 14:18:55');
INSERT INTO `workers` VALUES ('4', '123@qq.com', '123456', null, null, null, '0', null, null, null, null, null, '2017-04-15 09:04:28', '2017-04-15 09:04:28');
INSERT INTO `workers` VALUES ('5', '111@qq.com', '123456', null, null, null, '0', null, null, null, null, null, '2017-04-15 09:05:46', '2017-04-15 09:05:46');
INSERT INTO `workers` VALUES ('6', 'fsdfs@qq.com', '123456', null, null, null, '0', null, null, null, null, null, '2017-04-19 06:37:29', '2017-04-19 06:37:29');
INSERT INTO `workers` VALUES ('7', 'test@qq.com', '111', null, null, null, '0', null, null, null, null, null, '2017-05-26 14:50:18', '2017-05-26 14:50:18');
