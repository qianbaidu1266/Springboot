/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : miaosha

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-08-14 19:41:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` double(10,0) NOT NULL DEFAULT '0',
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales` int(11) NOT NULL DEFAULT '0',
  `img_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', 'iPhone11', '5999', '2020苹果最新款', '115', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1960860096,980843594&fm=26&gp=0.jpg');
INSERT INTO `item` VALUES ('2', '华为Mate30', '7000', '2020华为旗舰', '218', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2318576532,3379688057&fm=26&gp=0.jpg');
INSERT INTO `item` VALUES ('3', '华为P40pro', '45000', '2020华为最强拍照手机', '42', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3977264313,1680677191&fm=15&gp=0.jpg');
INSERT INTO `item` VALUES ('4', '小米10', '4999', '2020小米旗舰', '57', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4159531862,4008198079&fm=26&gp=0.jpg');
INSERT INTO `item` VALUES ('12', 'oppo FindX2', '5000', 'oppo拍照手机', '5', 'https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=5344f6dab11ea8d395227204a70b30cf/43a7d933c895d143cdf5a54264f082025baf07cb.jpg');
INSERT INTO `item` VALUES ('17', '华为笔记本', '9000', '华为MateBook笔记本', '4', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1531877701,3755970171&fm=26&gp=0.jpg');
INSERT INTO `item` VALUES ('18', '小米透明电视', '4999', '小米10周年透明电视', '3', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4225541308,328075847&fm=11&gp=0.jpg');
INSERT INTO `item` VALUES ('19', '鼠标', '100', '罗技无线鼠标', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=36327462,1684638348&fm=26&gp=0.jpg');

-- ----------------------------
-- Table structure for item_stock
-- ----------------------------
DROP TABLE IF EXISTS `item_stock`;
CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of item_stock
-- ----------------------------
INSERT INTO `item_stock` VALUES ('1', '4985', '1');
INSERT INTO `item_stock` VALUES ('2', '1949', '2');
INSERT INTO `item_stock` VALUES ('3', '186', '3');
INSERT INTO `item_stock` VALUES ('4', '993', '4');
INSERT INTO `item_stock` VALUES ('12', '95', '12');
INSERT INTO `item_stock` VALUES ('17', '1996', '17');
INSERT INTO `item_stock` VALUES ('18', '1997', '18');
INSERT INTO `item_stock` VALUES ('19', '399', '19');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `item_price` double(25,2) NOT NULL DEFAULT '0.00',
  `amount` int(11) NOT NULL DEFAULT '0',
  `order_price` double(10,2) NOT NULL DEFAULT '0.00',
  `promo_id` int(11) NOT NULL DEFAULT '0' COMMENT '非0表示为秒杀商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('2020081100006600', '30', '3', '1000.00', '1', '1000.00', '0');
INSERT INTO `order_info` VALUES ('2020081100006700', '30', '3', '1000.00', '1', '1000.00', '3');
INSERT INTO `order_info` VALUES ('2020081100006800', '30', '3', '1000.00', '1', '1000.00', '3');
INSERT INTO `order_info` VALUES ('2020081100006900', '30', '1', '500.00', '1', '500.00', '1');
INSERT INTO `order_info` VALUES ('2020081100007000', '30', '4', '4999.00', '1', '4999.00', '0');
INSERT INTO `order_info` VALUES ('2020081100007100', '30', '1', '5999.00', '1', '5999.00', '0');
INSERT INTO `order_info` VALUES ('2020081100007200', '30', '3', '1000.00', '1', '1000.00', '3');
INSERT INTO `order_info` VALUES ('2020081100007300', '30', '2', '2000.00', '1', '2000.00', '2');
INSERT INTO `order_info` VALUES ('2020081100007400', '30', '1', '5999.00', '1', '5999.00', '0');
INSERT INTO `order_info` VALUES ('2020081200007500', '30', '3', '1000.00', '1', '1000.00', '3');
INSERT INTO `order_info` VALUES ('2020081200007600', '30', '4', '1500.00', '1', '1500.00', '4');
INSERT INTO `order_info` VALUES ('2020081300007700', '30', '4', '1500.00', '1', '1500.00', '4');
INSERT INTO `order_info` VALUES ('2020081300007800', '30', '1', '500.00', '1', '500.00', '1');
INSERT INTO `order_info` VALUES ('2020081300007900', '30', '4', '1500.00', '1', '1500.00', '4');
INSERT INTO `order_info` VALUES ('2020081300008000', '30', '4', '1500.00', '1', '1500.00', '4');
INSERT INTO `order_info` VALUES ('2020081300008100', '43', '12', '5000.00', '1', '5000.00', '0');
INSERT INTO `order_info` VALUES ('2020081300008200', '43', '1', '500.00', '1', '500.00', '1');
INSERT INTO `order_info` VALUES ('2020081300008300', '43', '12', '5000.00', '1', '5000.00', '0');
INSERT INTO `order_info` VALUES ('2020081300008400', '43', '4', '1500.00', '1', '1500.00', '4');
INSERT INTO `order_info` VALUES ('2020081300008500', '43', '4', '1500.00', '1', '1500.00', '4');
INSERT INTO `order_info` VALUES ('2020081300008700', '30', '17', '9000.00', '1', '9000.00', '0');
INSERT INTO `order_info` VALUES ('2020081300008800', '30', '17', '3500.00', '1', '3500.00', '6');
INSERT INTO `order_info` VALUES ('2020081300008900', '30', '18', '4999.00', '1', '4999.00', '0');
INSERT INTO `order_info` VALUES ('2020081400009000', '30', '1', '500.00', '1', '500.00', '1');
INSERT INTO `order_info` VALUES ('2020081400009100', '30', '1', '500.00', '1', '500.00', '1');
INSERT INTO `order_info` VALUES ('2020081400009200', '30', '3', '1000.00', '1', '1000.00', '3');
INSERT INTO `order_info` VALUES ('2020081400009300', '30', '18', '4999.00', '1', '4999.00', '0');
INSERT INTO `order_info` VALUES ('2020081400009400', '30', '17', '3500.00', '1', '3500.00', '6');
INSERT INTO `order_info` VALUES ('2020081400009500', '30', '18', '4999.00', '1', '4999.00', '0');
INSERT INTO `order_info` VALUES ('2020081400009600', '43', '1', '500.00', '1', '500.00', '1');
INSERT INTO `order_info` VALUES ('2020081400009700', '43', '19', '100.00', '1', '100.00', '0');
INSERT INTO `order_info` VALUES ('2020081400009800', '46', '12', '5000.00', '1', '5000.00', '0');
INSERT INTO `order_info` VALUES ('2020081400009900', '46', '1', '500.00', '1', '500.00', '1');

-- ----------------------------
-- Table structure for promo
-- ----------------------------
DROP TABLE IF EXISTS `promo`;
CREATE TABLE `promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `promo_item_price` double NOT NULL DEFAULT '0',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of promo
-- ----------------------------
INSERT INTO `promo` VALUES ('1', 'iPhone11抢购活动', '2020-08-11 15:47:10', '1', '500', '2020-08-30 21:39:28');
INSERT INTO `promo` VALUES ('2', '华为mate30', '2020-08-27 19:38:35', '2', '2000', '2020-09-06 16:38:48');
INSERT INTO `promo` VALUES ('3', '华为P40pro', '2020-08-11 17:08:52', '3', '1000', '2020-08-29 20:08:56');
INSERT INTO `promo` VALUES ('4', '小米10', '2020-08-12 10:55:43', '4', '1500', '2020-09-06 10:55:50');
INSERT INTO `promo` VALUES ('6', '华为笔记本', '2020-08-13 20:54:29', '17', '3500', '2020-08-14 20:54:39');

-- ----------------------------
-- Table structure for sequence_info
-- ----------------------------
DROP TABLE IF EXISTS `sequence_info`;
CREATE TABLE `sequence_info` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `current_value` int(11) NOT NULL,
  `step` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sequence_info
-- ----------------------------
INSERT INTO `sequence_info` VALUES ('order_info', '100', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` tinyint(255) NOT NULL DEFAULT '0' COMMENT '//1 代表男性，2代表女性',
  `age` int(11) NOT NULL DEFAULT '0',
  `telphone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `register_mod` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '//通过手机号，微信，支付宝账号注册',
  `third_party_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`telphone`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '第一个用户', '1', '20', '13269139499', 'bywechat', '');
INSERT INTO `user_info` VALUES ('30', 'hi', '1', '15', '13269139455', '', '');
INSERT INTO `user_info` VALUES ('42', 'hi', '1', '19', '13269139466', '', '');
INSERT INTO `user_info` VALUES ('43', '警察', '1', '30', '110', '', '');
INSERT INTO `user_info` VALUES ('44', '南山忆', '2', '25', '1326139400', '', '');
INSERT INTO `user_info` VALUES ('45', 'hello', '2', '20', '13269139411', '', '');
INSERT INTO `user_info` VALUES ('46', 'hahaha', '1', '27', '1234', '', '');

-- ----------------------------
-- Table structure for user_password
-- ----------------------------
DROP TABLE IF EXISTS `user_password`;
CREATE TABLE `user_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encrpt_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_password_id_uindex` (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_password
-- ----------------------------
INSERT INTO `user_password` VALUES ('1', 'ICy5YqxZB1uWSwcVLSNLcA==', '30');
INSERT INTO `user_password` VALUES ('39', 'ICy5YqxZB1uWSwcVLSNLcA==', '42');
INSERT INTO `user_password` VALUES ('40', 'X5P5g1JN7z3KRkRp0s+fPg==', '43');
INSERT INTO `user_password` VALUES ('41', 'ICy5YqxZB1uWSwcVLSNLcA==', '44');
INSERT INTO `user_password` VALUES ('42', 'ICy5YqxZB1uWSwcVLSNLcA==', '45');
INSERT INTO `user_password` VALUES ('43', 'ICy5YqxZB1uWSwcVLSNLcA==', '46');
