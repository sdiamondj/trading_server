/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : trading

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 21/04/2020 14:22:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_game
-- ----------------------------
DROP TABLE IF EXISTS `t_game`;
CREATE TABLE `t_game`  (
  `game_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '游戏id，主键',
  `game_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游戏名称',
  `game_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏图片',
  `game_type` smallint(4) NOT NULL DEFAULT 0 COMMENT '0-未分类 1-客户端游戏 2-网页游戏 3-手机游戏 4-其他游戏 默认0',
  PRIMARY KEY (`game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`  (
  `goods_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_game` int(8) NOT NULL COMMENT '商品所属游戏id',
  `goods_seller` int(8) NOT NULL COMMENT '商品所属卖家id',
  `goods_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `goods_state` smallint(4) NOT NULL DEFAULT 0 COMMENT '0-待审核 1-已上架 2-已下架 3-交易中 4-已售出 5-审核不通过 默认0',
  `goods_game_server` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品所属游戏服务器',
  `goods_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '商品更新时间',
  `goods_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简介',
  `goods_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_buyer` int(8) NOT NULL COMMENT '买家id',
  `order_goods` int(8) NOT NULL COMMENT '商品id',
  `order_state` smallint(4) NOT NULL DEFAULT 1 COMMENT '0-待付款 1-买家已付款，待卖家发货 2-卖家已发货 3-已确认收货 4-已完成 5-已取消 默认1(系统暂无法接入支付模块)',
  `order_create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '订单创建时间',
  `order_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '订单更新时间',
  `order_receiving_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单所填收货账号',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '用户主键 8位自增',
  `user_phone` bigint(15) NOT NULL COMMENT '用户手机号,唯一',
  `user_nickname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '游戏玩家' COMMENT '用户昵称,默认为游戏玩家',
  `user_sex` tinyint(2) NULL DEFAULT 0 COMMENT '0-保密 1-男 2-女 默认0',
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'logo.png' COMMENT '用户头像，此字段暂为保留字段',
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码(暂定加密存储)',
  `user_register_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '用户注册时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_phone`(`user_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
