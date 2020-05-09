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

 Date: 09/05/2020 10:20:55
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
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_game
-- ----------------------------
INSERT INTO `t_game` VALUES (00000001, '英雄联盟', 'yxlm.jpg', 1);
INSERT INTO `t_game` VALUES (00000003, '王者荣耀', 'wzry.jpg', 3);
INSERT INTO `t_game` VALUES (00000004, '地下城与勇士', 'dxcyys.jpg', 1);
INSERT INTO `t_game` VALUES (00000005, '和平精英', 'hpjy.png', 3);
INSERT INTO `t_game` VALUES (00000006, '阴阳师', 'yys.jpg', 3);
INSERT INTO `t_game` VALUES (00000007, '穿越火线', 'cyhx.jpg', 1);
INSERT INTO `t_game` VALUES (00000008, '剑灵', 'jl.jpg', 1);
INSERT INTO `t_game` VALUES (00000009, '明日之后', 'mrzh.jpg', 3);
INSERT INTO `t_game` VALUES (00000010, '跑跑卡丁车手游', 'ppkdcsy.png', 3);
INSERT INTO `t_game` VALUES (00000011, 'QQ华夏', 'qqhx.jpg', 1);
INSERT INTO `t_game` VALUES (00000012, 'QQ三国', 'qqsg.jpg', 1);
INSERT INTO `t_game` VALUES (00000013, '天涯明月刀', 'tymyd.jpg', 1);
INSERT INTO `t_game` VALUES (00000014, '三国杀', 'sgs.jpg', 2);
INSERT INTO `t_game` VALUES (00000015, '热血江湖', 'rxjh.jpg', 1);
INSERT INTO `t_game` VALUES (00000016, '大天使之剑', 'dtszj.jpg', 2);
INSERT INTO `t_game` VALUES (00000017, 'Q币', 'qb.jpg', 4);
INSERT INTO `t_game` VALUES (00000018, '奥奇传说', 'aqcs.jpg', 2);
INSERT INTO `t_game` VALUES (00000019, '弹弹堂', 'ddt.jpg', 2);
INSERT INTO `t_game` VALUES (00000020, '烽火战国', 'fhzg.jpg', 2);
INSERT INTO `t_game` VALUES (00000021, '街机三国', 'jjsg.jpg', 2);
INSERT INTO `t_game` VALUES (00000022, '洛克王国', 'lkwg.jpg', 2);
INSERT INTO `t_game` VALUES (00000023, '灭神', 'ms.png', 2);
INSERT INTO `t_game` VALUES (00000024, '赛尔号', 'seh.jpg', 2);
INSERT INTO `t_game` VALUES (00000025, '坦克大战', 'tkdz.jpg', 2);
INSERT INTO `t_game` VALUES (00000026, 'FIFA OL4', 'fifa4.jpg', 1);
INSERT INTO `t_game` VALUES (00000027, '反恐精英OL', 'fkjyol.jpg', 1);
INSERT INTO `t_game` VALUES (00000028, '魔兽世界', 'mssj.jpg', 1);
INSERT INTO `t_game` VALUES (00000029, '新天龙八部', 'xtlbb.jpg', 1);
INSERT INTO `t_game` VALUES (00000030, '阿拉德之怒', 'aldzn.jpg', 3);
INSERT INTO `t_game` VALUES (00000031, '第五人格', 'dwrg.jpg', 3);
INSERT INTO `t_game` VALUES (00000032, '火影忍者', 'hyrz.jpg', 3);
INSERT INTO `t_game` VALUES (00000033, '炉石传说', 'lscs.jpg', 3);
INSERT INTO `t_game` VALUES (00000034, '梦幻西游手游', 'mhxysy.jpg', 3);
INSERT INTO `t_game` VALUES (00000035, 'QQ飞车手游', 'qqfcsy.jpg', 3);
INSERT INTO `t_game` VALUES (00000036, '完美世界手游', 'wmsjsy.jpg', 3);
INSERT INTO `t_game` VALUES (00000037, '爱奇艺会员', 'aqyhy.jpg', 4);
INSERT INTO `t_game` VALUES (00000038, '电信充值', 'dxcz.jpg', 4);
INSERT INTO `t_game` VALUES (00000039, '联通充值卡', 'ltczk.jpg', 4);
INSERT INTO `t_game` VALUES (00000040, '移动充值卡', 'ydczk.jpg', 4);
INSERT INTO `t_game` VALUES (00000041, '优酷会员', 'ykhy.jpg', 4);
INSERT INTO `t_game` VALUES (00000042, '网易一卡通', 'wyykt.jpg', 4);

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
  `goods_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'logo.png' COMMENT '商品图片',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES (00000015, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000016, 'LOL十万点券 黑玫', 1, 40, 900.00, 1, '黑色玫瑰', '2020-05-02 13:26:03', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000017, 'LOL十万点券 黑玫', 1, 40, 900.00, 4, '黑色玫瑰', '2020-05-02 13:40:57', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000018, 'LOL十万点券 黑玫', 1, 40, 900.00, 1, '黑色玫瑰', '2020-05-02 13:26:10', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000019, 'LOL十万点券 黑玫', 1, 40, 900.00, 4, '黑色玫瑰', '2020-05-04 16:23:03', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000020, 'LOL十万点券 黑玫', 1, 40, 900.00, 4, '黑色玫瑰', '2020-05-04 16:23:45', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000021, 'LOL十万点券 黑玫', 1, 40, 900.00, 1, '黑色玫瑰', '2020-05-02 13:26:11', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000022, 'LOL十万点券 黑玫', 1, 40, 900.00, 1, '黑色玫瑰', '2020-05-02 13:26:11', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000023, 'LOL十万点券 黑玫', 1, 40, 900.00, 1, '黑色玫瑰', '2020-05-02 13:26:11', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000024, 'LOL十万点券 黑玫', 1, 40, 900.00, 1, '黑色玫瑰', '2020-05-02 13:26:11', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000025, 'LOL十万点券 黑玫', 1, 40, 900.00, 4, '黑色玫瑰', '2020-05-02 13:40:59', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000026, 'LOL十万点券 1区', 1, 40, 900.00, 4, '艾欧尼亚', '2020-05-02 13:40:43', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000027, 'LOL十万点券 1区', 1, 40, 900.00, 1, '艾欧尼亚', '2020-05-02 13:26:13', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000028, 'LOL十万点券 1区', 1, 40, 900.00, 1, '艾欧尼亚', '2020-05-02 13:26:13', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000029, 'LOL十万点券 1区', 1, 40, 900.00, 1, '艾欧尼亚', '2020-05-02 13:26:14', '十万点券9折出售，官方直冲，有需要的直接拍下，24小时在线发货', '1588396316212yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000030, '7150点券直冲', 3, 40, 599.00, 1, '苹果QQ72区', '2020-05-02 13:26:14', '24小时在线发货', '1588396662734wzry.jpg');
INSERT INTO `t_goods` VALUES (00000031, '7150点券直冲', 3, 40, 599.00, 1, '苹果QQ73区', '2020-05-02 13:26:15', '24小时在线发货', '1588396662734wzry.jpg');
INSERT INTO `t_goods` VALUES (00000032, '7150点券直冲', 3, 40, 599.00, 4, '苹果QQ74区', '2020-05-07 19:42:44', '24小时在线发货', '1588396662734wzry.jpg');
INSERT INTO `t_goods` VALUES (00000033, '7150点券直冲', 3, 40, 599.00, 4, '安卓QQ74区', '2020-05-02 13:41:02', '24小时在线发货', '1588396662734wzry.jpg');
INSERT INTO `t_goods` VALUES (00000034, '7150点券直冲', 3, 40, 599.00, 1, '安卓QQ25区', '2020-05-02 13:26:16', '24小时在线发货', '1588396662734wzry.jpg');
INSERT INTO `t_goods` VALUES (00000035, '7150点券直冲', 3, 40, 599.00, 1, '安卓QQ1区', '2020-05-02 13:26:16', '24小时在线发货', '1588396662734wzry.jpg');
INSERT INTO `t_goods` VALUES (00000036, '7150点券直冲', 3, 40, 599.00, 1, '安卓QQ5区', '2020-05-02 13:26:17', '24小时在线发货', '1588396662734wzry.jpg');
INSERT INTO `t_goods` VALUES (00000037, '7150点券直冲', 3, 40, 599.00, 1, '安卓微信52区', '2020-05-02 13:26:17', '24小时在线发货', '1588396662734wzry.jpg');
INSERT INTO `t_goods` VALUES (00000038, '7106点券直冲', 5, 40, 599.00, 1, '安卓QQ12区', '2020-05-02 13:26:18', '24小时在线发货', '1588396809155hpjy.png');
INSERT INTO `t_goods` VALUES (00000039, '7106点券直冲', 5, 40, 599.00, 1, '安卓QQ12区', '2020-05-02 13:26:18', '24小时在线发货', '1588396809155hpjy.png');
INSERT INTO `t_goods` VALUES (00000040, '7106点券直冲', 5, 40, 599.00, 1, '安卓QQ12区', '2020-05-02 13:26:18', '24小时在线发货', '1588396809155hpjy.png');
INSERT INTO `t_goods` VALUES (00000041, '7106点券直冲', 5, 40, 599.00, 1, '安卓QQ18区', '2020-05-02 13:26:18', '24小时在线发货', '1588396809155hpjy.png');
INSERT INTO `t_goods` VALUES (00000042, '7106点券直冲', 5, 40, 599.00, 1, '安卓QQ18区', '2020-05-02 13:26:19', '24小时在线发货', '1588396809155hpjy.png');
INSERT INTO `t_goods` VALUES (00000043, '十亿游戏币', 4, 40, 70.00, 1, '浙江2区', '2020-05-02 13:26:19', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000044, '十亿游戏币', 4, 40, 70.00, 1, '浙江2区', '2020-05-02 13:26:20', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000045, '十亿游戏币', 4, 40, 70.00, 4, '浙江2区', '2020-05-04 16:29:36', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000046, '十亿游戏币', 4, 40, 70.00, 4, '浙江2区', '2020-05-02 13:42:06', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000047, '十亿游戏币', 4, 40, 70.00, 1, '浙江2区', '2020-05-02 13:26:21', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000048, '十亿游戏币', 4, 40, 70.00, 1, '浙江2区', '2020-05-02 13:26:21', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000049, '十亿游戏币', 4, 40, 70.00, 1, '浙江3区', '2020-05-02 13:26:22', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000050, '百亿游戏币', 4, 40, 700.00, 1, '浙江1区', '2020-05-02 13:44:55', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000051, '百亿游戏币', 4, 40, 700.00, 1, '浙江1区', '2020-05-02 13:44:56', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000052, '百亿游戏币', 4, 40, 700.00, 1, '浙江1区', '2020-05-05 12:24:24', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000053, '百亿游戏币', 4, 40, 700.00, 1, '浙江1区', '2020-05-05 12:24:25', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000054, '百亿游戏币', 4, 40, 700.00, 1, '浙江1区', '2020-05-05 12:24:25', '24小时在线发货', '1588397076581dxcyys.jpg');
INSERT INTO `t_goods` VALUES (00000055, '优酷会员年卡', 41, 40, 99.00, 1, '无', '2020-05-05 12:24:26', '优酷会员年卡限时特价99元,VIP影视畅爽观看', '1588581319840youku.jpg');
INSERT INTO `t_goods` VALUES (00000056, '优酷会员年卡', 41, 40, 99.00, 1, '无', '2020-05-05 12:24:26', '优酷会员年卡限时特价99元,VIP影视畅爽观看', '1588581319840youku.jpg');
INSERT INTO `t_goods` VALUES (00000057, '优酷会员年卡', 41, 40, 99.00, 1, '无', '2020-05-05 12:24:26', '优酷会员年卡限时特价99元,VIP影视畅爽观看', '1588581319840youku.jpg');
INSERT INTO `t_goods` VALUES (00000058, '优酷会员年卡', 41, 40, 99.00, 1, '无', '2020-05-05 12:24:27', '优酷会员年卡限时特价99元,VIP影视畅爽观看', '1588581319840youku.jpg');
INSERT INTO `t_goods` VALUES (00000059, '优酷会员年卡', 41, 40, 99.00, 1, '无', '2020-05-05 12:24:27', '优酷会员年卡限时特价99元,VIP影视畅爽观看', '1588581319840youku.jpg');
INSERT INTO `t_goods` VALUES (00000060, '优酷会员年卡', 41, 40, 99.00, 1, '无', '2020-05-05 12:24:28', '优酷会员年卡限时特价99元,VIP影视畅爽观看', '1588581319840youku.jpg');
INSERT INTO `t_goods` VALUES (00000061, '爱奇艺会员年卡', 37, 40, 99.00, 1, '无', '2020-05-05 12:24:29', '爱奇艺年卡限时99元出售，购买即享一年京东VIP赠送', '1588652029994aqyhy.jpg');
INSERT INTO `t_goods` VALUES (00000062, '爱奇艺会员年卡', 37, 40, 99.00, 1, '无', '2020-05-05 12:24:29', '爱奇艺年卡限时99元出售，购买即享一年京东VIP赠送', '1588652029994aqyhy.jpg');
INSERT INTO `t_goods` VALUES (00000063, '爱奇艺会员年卡', 37, 40, 99.00, 1, '无', '2020-05-05 12:24:30', '爱奇艺年卡限时99元出售，购买即享一年京东VIP赠送', '1588652029994aqyhy.jpg');
INSERT INTO `t_goods` VALUES (00000064, '爱奇艺会员年卡', 37, 40, 99.00, 1, '无', '2020-05-05 12:24:30', '爱奇艺年卡限时99元出售，购买即享一年京东VIP赠送', '1588652029994aqyhy.jpg');
INSERT INTO `t_goods` VALUES (00000065, '爱奇艺会员年卡', 37, 40, 99.00, 1, '无', '2020-05-05 12:24:30', '爱奇艺年卡限时99元出售，购买即享一年京东VIP赠送', '1588652029994aqyhy.jpg');
INSERT INTO `t_goods` VALUES (00000066, '爱奇艺会员年卡', 37, 40, 99.00, 1, '无', '2020-05-05 12:24:31', '爱奇艺年卡限时99元出售，购买即享一年京东VIP赠送', '1588652029994aqyhy.jpg');
INSERT INTO `t_goods` VALUES (00000067, '6星满级蜜桃', 6, 32, 60.00, 1, '双平台(两情相悦)', '2020-05-05 12:24:31', '一口价，不还价，不讲价', '15886523596896xmt.jpg');
INSERT INTO `t_goods` VALUES (00000068, '328魂玉充值代充', 6, 32, 347.00, 1, '苹果-全区', '2020-05-05 12:24:31', '24小时在线发货', '1588652482723yys.jpg');
INSERT INTO `t_goods` VALUES (00000069, '328魂玉充值代充', 6, 32, 347.00, 1, '苹果-全区', '2020-05-05 12:24:31', '24小时在线发货', '1588652482723yys.jpg');
INSERT INTO `t_goods` VALUES (00000070, '328魂玉充值代充', 6, 32, 347.00, 1, '苹果-全区', '2020-05-05 12:24:32', '24小时在线发货', '1588652482723yys.jpg');
INSERT INTO `t_goods` VALUES (00000071, '328魂玉充值代充', 6, 32, 347.00, 1, '苹果-全区', '2020-05-05 12:24:32', '24小时在线发货', '1588652482723yys.jpg');
INSERT INTO `t_goods` VALUES (00000072, '328魂玉充值代充', 6, 32, 347.00, 1, '苹果-全区', '2020-05-05 12:24:33', '24小时在线发货', '1588652482723yys.jpg');
INSERT INTO `t_goods` VALUES (00000073, '328魂玉充值代充', 6, 32, 347.00, 1, '苹果-全区', '2020-05-05 12:24:33', '24小时在线发货', '1588652482723yys.jpg');
INSERT INTO `t_goods` VALUES (00000074, '2980信用点代充', 9, 32, 297.00, 1, '苹果-全区', '2020-05-05 12:24:34', '24小时在线发货', '1588652601170mrzh.jpg');
INSERT INTO `t_goods` VALUES (00000075, '2980信用点代充', 9, 32, 297.00, 1, '苹果-全区', '2020-05-05 12:24:34', '24小时在线发货', '1588652601170mrzh.jpg');
INSERT INTO `t_goods` VALUES (00000076, '2980信用点代充', 9, 32, 297.00, 1, '苹果-全区', '2020-05-05 12:24:34', '24小时在线发货', '1588652601170mrzh.jpg');
INSERT INTO `t_goods` VALUES (00000077, '2980信用点代充', 9, 32, 297.00, 1, '苹果-全区', '2020-05-05 12:24:35', '24小时在线发货', '1588652601170mrzh.jpg');
INSERT INTO `t_goods` VALUES (00000078, '2980信用点代充', 9, 32, 297.00, 4, '苹果-全区', '2020-05-05 12:26:05', '24小时在线发货', '1588652601170mrzh.jpg');
INSERT INTO `t_goods` VALUES (00000079, '2980信用点代充', 9, 32, 297.00, 4, '苹果-全区', '2020-05-05 12:40:39', '24小时在线发货', '1588652601170mrzh.jpg');
INSERT INTO `t_goods` VALUES (00000080, '2980信用点代充', 9, 32, 297.00, 1, '苹果-全区', '2020-05-05 12:24:36', '24小时在线发货', '1588652601170mrzh.jpg');
INSERT INTO `t_goods` VALUES (00000081, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000082, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000083, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000084, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000085, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000086, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000087, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000088, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000089, '5月新礼包永久CDK', 35, 42, 88.00, 4, '全区全服', '2020-05-05 12:41:26', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000090, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000091, '5月新礼包永久CDK', 35, 42, 88.00, 1, '全区全服', '2020-05-05 12:32:30', '有概率出永久A、永久道具等', '1588653100764libao.png');
INSERT INTO `t_goods` VALUES (00000092, 'CF火麒麟英雄级武器', 7, 42, 388.00, 1, '浙江1区', '2020-05-05 12:35:24', '原价888,现价388,预购从速,库存有限', '1588653289985cfhuoqilin.png');
INSERT INTO `t_goods` VALUES (00000093, 'CF火麒麟英雄级武器', 7, 42, 388.00, 1, '浙江1区', '2020-05-05 12:35:24', '原价888,现价388,预购从速,库存有限', '1588653289985cfhuoqilin.png');
INSERT INTO `t_goods` VALUES (00000094, 'CF火麒麟英雄级武器', 7, 42, 388.00, 1, '浙江1区', '2020-05-05 12:35:24', '原价888,现价388,预购从速,库存有限', '1588653289985cfhuoqilin.png');
INSERT INTO `t_goods` VALUES (00000095, 'CF火麒麟英雄级武器', 7, 42, 388.00, 1, '浙江1区', '2020-05-05 12:35:24', '原价888,现价388,预购从速,库存有限', '1588653289985cfhuoqilin.png');
INSERT INTO `t_goods` VALUES (00000096, 'CF火麒麟英雄级武器', 7, 42, 388.00, 1, '浙江1区', '2020-05-05 12:35:24', '原价888,现价388,预购从速,库存有限', '1588653289985cfhuoqilin.png');
INSERT INTO `t_goods` VALUES (00000097, 'CF火麒麟英雄级武器', 7, 42, 388.00, 1, '浙江1区', '2020-05-05 12:35:24', '原价888,现价388,预购从速,库存有限', '1588653289985cfhuoqilin.png');
INSERT INTO `t_goods` VALUES (00000098, 'CF火麒麟英雄级武器', 7, 42, 388.00, 4, '浙江1区', '2020-05-05 12:53:05', '原价888,现价388,预购从速,库存有限', '1588653289985cfhuoqilin.png');
INSERT INTO `t_goods` VALUES (00000099, '1251金寄售', 8, 42, 96.50, 1, '联通1区-月华神', '2020-05-05 12:37:57', '24小时发货', '1588653454333jl.jpg');
INSERT INTO `t_goods` VALUES (00000100, '1251金寄售', 8, 42, 96.50, 4, '联通1区-月华神', '2020-05-05 12:39:48', '24小时发货', '1588653454333jl.jpg');
INSERT INTO `t_goods` VALUES (00000101, '1251金寄售', 8, 42, 96.50, 1, '联通1区-月华神', '2020-05-05 12:37:57', '24小时发货', '1588653454333jl.jpg');
INSERT INTO `t_goods` VALUES (00000102, '1251金寄售', 8, 42, 96.50, 1, '联通1区-月华神', '2020-05-05 12:37:57', '24小时发货', '1588653454333jl.jpg');
INSERT INTO `t_goods` VALUES (00000103, '1251金寄售', 8, 42, 96.50, 1, '联通1区-月华神', '2020-05-05 12:37:57', '24小时发货', '1588653454333jl.jpg');
INSERT INTO `t_goods` VALUES (00000104, '1251金寄售', 8, 42, 96.50, 1, '联通1区-月华神', '2020-05-05 12:37:57', '24小时发货', '1588653454333jl.jpg');
INSERT INTO `t_goods` VALUES (00000105, '19700万金钱', 12, 47, 500.00, 1, '得陇望蜀', '2020-05-05 12:44:35', '秒发货，不收手续费', '1588653850203qqsg.jpg');
INSERT INTO `t_goods` VALUES (00000106, '19700万金钱', 12, 47, 500.00, 1, '得陇望蜀', '2020-05-05 12:44:35', '秒发货，不收手续费', '1588653850203qqsg.jpg');
INSERT INTO `t_goods` VALUES (00000107, '19700万金钱', 12, 47, 500.00, 1, '得陇望蜀', '2020-05-05 12:44:35', '秒发货，不收手续费', '1588653850203qqsg.jpg');
INSERT INTO `t_goods` VALUES (00000108, '19700万金钱', 12, 47, 500.00, 1, '得陇望蜀', '2020-05-05 12:44:35', '秒发货，不收手续费', '1588653850203qqsg.jpg');
INSERT INTO `t_goods` VALUES (00000109, '19700万金钱', 12, 47, 500.00, 1, '得陇望蜀', '2020-05-05 12:44:35', '秒发货，不收手续费', '1588653850203qqsg.jpg');
INSERT INTO `t_goods` VALUES (00000110, '19700万金钱', 12, 47, 500.00, 1, '得陇望蜀', '2020-05-05 12:44:35', '秒发货，不收手续费', '1588653850203qqsg.jpg');
INSERT INTO `t_goods` VALUES (00000111, '19700万金钱', 12, 47, 500.00, 1, '得陇望蜀', '2020-05-05 12:44:35', '秒发货，不收手续费', '1588653850203qqsg.jpg');
INSERT INTO `t_goods` VALUES (00000112, '10金元宝', 11, 47, 280.00, 1, '魔云岭', '2020-05-05 12:46:16', '绿色安全产品，请放心购买', '1588653956315qqhx.jpg');
INSERT INTO `t_goods` VALUES (00000113, '10金元宝', 11, 47, 280.00, 1, '魔云岭', '2020-05-05 12:46:16', '绿色安全产品，请放心购买', '1588653956315qqhx.jpg');
INSERT INTO `t_goods` VALUES (00000114, '10金元宝', 11, 47, 280.00, 1, '魔云岭', '2020-05-05 12:46:16', '绿色安全产品，请放心购买', '1588653956315qqhx.jpg');
INSERT INTO `t_goods` VALUES (00000115, '10金元宝', 11, 47, 280.00, 1, '魔云岭', '2020-05-05 12:46:16', '绿色安全产品，请放心购买', '1588653956315qqhx.jpg');
INSERT INTO `t_goods` VALUES (00000116, '10金元宝', 11, 47, 280.00, 1, '魔云岭', '2020-05-05 12:46:16', '绿色安全产品，请放心购买', '1588653956315qqhx.jpg');
INSERT INTO `t_goods` VALUES (00000117, '10金元宝', 11, 47, 280.00, 1, '魔云岭', '2020-05-05 12:46:16', '绿色安全产品，请放心购买', '1588653956315qqhx.jpg');
INSERT INTO `t_goods` VALUES (00000118, '10金元宝', 11, 47, 280.00, 1, '魔云岭', '2020-05-05 12:46:16', '绿色安全产品，请放心购买', '1588653956315qqhx.jpg');
INSERT INTO `t_goods` VALUES (00000119, '10金元宝', 11, 47, 280.00, 1, '魔云岭', '2020-05-05 12:46:16', '绿色安全产品，请放心购买', '1588653956315qqhx.jpg');
INSERT INTO `t_goods` VALUES (00000120, '极品账号出售', 10, 47, 998.00, 1, 'QQ33区', '2020-05-05 13:08:29', '上班没时间玩低价甩卖', '1588654124590pp.jpg');
INSERT INTO `t_goods` VALUES (00000121, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000122, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000123, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000124, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000125, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000126, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000127, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000128, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000129, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000130, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000131, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:11', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000132, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000133, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:08', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000134, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:06', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000135, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:57:33', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000136, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000137, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-02 13:09:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000138, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:04', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000139, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000140, 'lol二十万点券 秒发', 1, 1, 1997.00, 4, '艾欧尼亚', '2020-05-05 13:00:05', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000141, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000142, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000143, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000144, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000145, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-05 12:56:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000182, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-05 12:56:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000183, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-05 12:56:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000184, 'lol一万点券 秒发', 1, 1, 95.00, 1, '艾欧尼亚', '2020-05-05 12:56:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000185, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:42:34', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000186, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:42:32', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000187, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:42:30', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000188, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:42:29', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000189, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:42:27', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000190, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:42:26', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000191, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:42:24', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000192, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:39:58', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000193, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:40:00', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000194, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:40:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000195, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:40:03', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000196, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:40:05', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000197, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:40:07', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000198, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:40:08', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000199, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:40:10', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000200, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:40:12', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000201, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:36:49', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000202, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:36:51', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000203, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:36:53', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000204, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:36:54', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000205, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:36:56', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000206, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:36:57', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000207, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:36:59', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000208, 'lol一万点券 秒发', 1, 1, 95.00, 4, '艾欧尼亚', '2020-05-08 10:37:02', '10000点券速发，官方价100现价95，要的兄弟速度拍了', '1588395829545yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000209, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000210, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000211, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000212, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000213, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000214, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000215, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000216, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000217, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000218, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000219, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000220, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000221, '50000点券LOL', 1, 48, 450.00, 1, '黑色玫瑰', '2020-05-09 10:12:51', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000222, '50000点券LOL', 1, 48, 450.00, 4, '黑色玫瑰', '2020-05-09 10:17:14', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000223, '50000点券LOL', 1, 48, 450.00, 4, '黑色玫瑰', '2020-05-09 10:14:57', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000224, '50000点券LOL', 1, 48, 450.00, 4, '黑色玫瑰', '2020-05-09 10:14:55', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');
INSERT INTO `t_goods` VALUES (00000225, '50000点券LOL', 1, 48, 450.00, 4, '黑色玫瑰', '2020-05-09 10:14:53', '官方直冲，24小时在线发货。', '1588990220040yxlm.jpg');

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
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (00000037, 1, 25, 4, '2020-05-02 13:27:05', '2020-05-02 13:29:31', '听丶风吹过的夏天');
INSERT INTO `t_order` VALUES (00000038, 1, 17, 4, '2020-05-02 13:27:29', '2020-05-02 13:29:28', '听丶风吹过的夏天');
INSERT INTO `t_order` VALUES (00000039, 1, 33, 4, '2020-05-02 13:27:55', '2020-05-02 13:29:33', 'EDG丶DiamondJ');
INSERT INTO `t_order` VALUES (00000040, 25, 26, 4, '2020-05-01 13:34:08', '2020-05-01 13:40:43', 'huya神超');
INSERT INTO `t_order` VALUES (00000041, 18, 46, 4, '2020-05-01 13:41:53', '2020-05-01 13:42:21', '冬瓜....');
INSERT INTO `t_order` VALUES (00000042, 28, 19, 4, '2020-05-04 16:22:27', '2020-05-04 16:23:12', 'huya丶红莲3');
INSERT INTO `t_order` VALUES (00000043, 28, 20, 4, '2020-05-03 16:23:33', '2020-05-03 16:23:39', 'huya丶红莲3');
INSERT INTO `t_order` VALUES (00000044, 1, 45, 4, '2020-05-04 16:29:26', '2020-05-04 16:29:43', '东东哦哦哦');
INSERT INTO `t_order` VALUES (00000045, 1, 78, 4, '2020-05-05 12:25:57', '2020-05-05 12:26:13', '凯斯海湾-Diamondj');
INSERT INTO `t_order` VALUES (00000046, 37, 100, 4, '2020-05-05 12:39:42', '2020-05-05 12:39:54', '圆月弯刀');
INSERT INTO `t_order` VALUES (00000047, 37, 79, 4, '2020-05-05 12:40:24', '2020-05-05 12:40:29', '风啊啊啊风');
INSERT INTO `t_order` VALUES (00000048, 37, 89, 4, '2020-05-01 12:41:18', '2020-05-01 12:41:32', '763439273');
INSERT INTO `t_order` VALUES (00000049, 47, 98, 4, '2020-05-05 12:52:55', '2020-05-05 12:53:10', '撕破伤口丶');
INSERT INTO `t_order` VALUES (00000050, 42, 133, 4, '2020-05-05 12:55:02', '2020-05-05 12:56:16', 'huya神超');
INSERT INTO `t_order` VALUES (00000051, 42, 134, 4, '2020-05-05 12:55:24', '2020-05-05 12:56:18', 'huya神超');
INSERT INTO `t_order` VALUES (00000052, 42, 138, 4, '2020-05-05 12:55:36', '2020-05-05 12:56:19', 'huya神超');
INSERT INTO `t_order` VALUES (00000053, 42, 131, 4, '2020-05-03 12:55:45', '2020-05-03 12:56:20', 'huya神超');
INSERT INTO `t_order` VALUES (00000054, 42, 139, 4, '2020-05-03 12:55:53', '2020-05-03 12:55:53', 'huya神超');
INSERT INTO `t_order` VALUES (00000055, 42, 135, 4, '2020-05-05 12:57:16', '2020-05-05 12:57:22', 'huya神超');
INSERT INTO `t_order` VALUES (00000056, 19, 140, 4, '2020-05-01 12:59:58', '2020-05-01 12:59:58', '我的瞎子贼溜');
INSERT INTO `t_order` VALUES (00000057, 44, 32, 4, '2020-05-07 19:41:59', '2020-05-07 19:45:06', 'douyu丶CC');
INSERT INTO `t_order` VALUES (00000058, 37, 202, 4, '2020-05-08 10:35:43', '2020-05-08 10:37:14', '4AMGODV');
INSERT INTO `t_order` VALUES (00000059, 37, 208, 4, '2020-05-08 10:35:52', '2020-05-08 10:37:16', '4AMGODV');
INSERT INTO `t_order` VALUES (00000060, 37, 207, 4, '2020-05-08 10:36:01', '2020-05-08 10:37:17', '4AMGODV');
INSERT INTO `t_order` VALUES (00000061, 37, 206, 4, '2020-05-08 10:36:10', '2020-05-08 10:37:19', '4AMGODV');
INSERT INTO `t_order` VALUES (00000062, 37, 201, 4, '2020-05-08 10:36:16', '2020-05-08 10:37:20', '4AMGODV');
INSERT INTO `t_order` VALUES (00000063, 37, 205, 4, '2020-05-08 10:36:22', '2020-05-08 10:37:26', '4AMGODV');
INSERT INTO `t_order` VALUES (00000064, 37, 204, 4, '2020-05-08 10:36:28', '2020-05-08 10:37:28', '4AMGODV');
INSERT INTO `t_order` VALUES (00000065, 37, 203, 4, '2020-05-08 10:36:36', '2020-05-08 10:37:31', '4AMGODV');
INSERT INTO `t_order` VALUES (00000066, 34, 200, 4, '2020-05-08 10:38:25', '2020-05-08 10:39:32', '4AMxxxlu');
INSERT INTO `t_order` VALUES (00000067, 34, 199, 4, '2020-05-08 10:38:40', '2020-05-08 10:39:34', '4AMxxxlu');
INSERT INTO `t_order` VALUES (00000068, 34, 198, 4, '2020-05-08 10:38:47', '2020-05-08 10:39:35', '4AMxxxlu');
INSERT INTO `t_order` VALUES (00000069, 34, 197, 4, '2020-05-08 10:38:52', '2020-05-08 10:39:37', '4AMxxxlu');
INSERT INTO `t_order` VALUES (00000070, 34, 196, 4, '2020-05-08 10:38:58', '2020-05-08 10:39:39', '4AMxxxlu');
INSERT INTO `t_order` VALUES (00000071, 34, 195, 4, '2020-05-08 10:39:04', '2020-05-08 10:39:41', '4AMxxxlu');
INSERT INTO `t_order` VALUES (00000072, 34, 194, 4, '2020-05-08 10:39:11', '2020-05-08 10:39:42', '4AMxxxlu');
INSERT INTO `t_order` VALUES (00000073, 34, 193, 4, '2020-05-08 10:39:18', '2020-05-08 10:39:44', '4AMxxxlu');
INSERT INTO `t_order` VALUES (00000074, 34, 192, 4, '2020-05-08 10:39:25', '2020-05-08 10:39:46', '4AMxxxlu');
INSERT INTO `t_order` VALUES (00000075, 31, 191, 4, '2020-05-07 10:41:26', '2020-05-07 10:42:42', '疾风剑豪丶马云');
INSERT INTO `t_order` VALUES (00000076, 31, 190, 4, '2020-05-06 10:41:33', '2020-05-06 10:42:44', '疾风剑豪丶马云');
INSERT INTO `t_order` VALUES (00000077, 31, 189, 4, '2020-05-07 10:41:39', '2020-05-07 10:42:45', '疾风剑豪丶马云');
INSERT INTO `t_order` VALUES (00000078, 31, 188, 4, '2020-05-06 10:41:44', '2020-05-06 10:42:47', '疾风剑豪丶马云');
INSERT INTO `t_order` VALUES (00000079, 31, 187, 4, '2020-05-08 10:41:50', '2020-05-08 10:42:48', '疾风剑豪丶马云');
INSERT INTO `t_order` VALUES (00000080, 31, 186, 4, '2020-05-08 10:41:56', '2020-05-08 10:42:50', '疾风剑豪丶马云');
INSERT INTO `t_order` VALUES (00000081, 31, 185, 4, '2020-05-08 10:42:02', '2020-05-08 10:42:52', '疾风剑豪丶马云');
INSERT INTO `t_order` VALUES (00000082, 49, 225, 4, '2020-05-09 10:14:18', '2020-05-09 10:15:10', '修罗道吾乃');
INSERT INTO `t_order` VALUES (00000083, 49, 224, 4, '2020-05-09 10:14:31', '2020-05-09 10:15:08', '吾乃修罗道');
INSERT INTO `t_order` VALUES (00000084, 49, 223, 4, '2020-05-09 10:14:46', '2020-05-09 10:15:06', '修罗道吾乃');
INSERT INTO `t_order` VALUES (00000085, 50, 222, 4, '2020-05-09 10:16:58', '2020-05-09 10:17:08', '听丶风吹过的夏天');

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
  `user_is_admin` int(8) NOT NULL DEFAULT 0 COMMENT '用户是否为管理员 0-不是 1-是 默认-0',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_phone`(`user_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (00000001, 15797898656, 'DiamondJ', 1, '1588395676914yiyi.jpg', '1234', '1997-12-07 12:17:50', 1);
INSERT INTO `t_user` VALUES (00000002, 18352878865, 'GLM', 2, 'logo.png', '0528', '2020-05-02 12:18:24', 1);
INSERT INTO `t_user` VALUES (00000017, 15797898657, '山寨DJ', 1, 'logo.png', '1234', '2020-05-02 12:33:48', 0);
INSERT INTO `t_user` VALUES (00000018, 15797898658, '山寨二号DJ', 1, 'logo.png', '1234', '2020-05-02 12:33:46', 0);
INSERT INTO `t_user` VALUES (00000019, 15797898659, '还是DJ啊', 0, 'logo.png', '1234', '2020-05-02 12:34:08', 0);
INSERT INTO `t_user` VALUES (00000020, 15797898660, '不想玩了啊', 2, 'logo.png', '1234', '2020-05-02 12:34:32', 0);
INSERT INTO `t_user` VALUES (00000021, 15797898661, 'superDJ', 0, 'logo.png', '1234', '2020-05-02 12:37:39', 0);
INSERT INTO `t_user` VALUES (00000022, 15797898662, 'GoodBoy', 1, 'logo.png', '1234', '2020-05-02 12:38:07', 0);
INSERT INTO `t_user` VALUES (00000023, 15797898663, 'prettygirl', 2, 'logo.png', '1234', '2020-05-02 12:38:27', 0);
INSERT INTO `t_user` VALUES (00000024, 15797898664, '兄弟们给我冲', 1, 'logo.png', '1234', '2020-05-02 12:44:53', 0);
INSERT INTO `t_user` VALUES (00000025, 15797898665, '奥力给', 2, 'logo.png', '1234', '2020-05-02 12:45:36', 0);
INSERT INTO `t_user` VALUES (00000026, 15797898666, '阿里巴巴-马云', 1, 'logo.png', '1234', '2020-05-02 12:45:55', 0);
INSERT INTO `t_user` VALUES (00000027, 15797898667, '腾讯-马化腾', 1, 'logo.png', '1234', '2020-05-02 12:46:13', 0);
INSERT INTO `t_user` VALUES (00000028, 15797898668, '小米-雷军', 1, 'logo.png', '1234', '2020-05-02 12:46:28', 0);
INSERT INTO `t_user` VALUES (00000029, 15797898669, '字节跳动-张一鸣', 1, 'logo.png', '1234', '2020-05-02 12:46:54', 0);
INSERT INTO `t_user` VALUES (00000030, 15797898670, '阿里巴巴的小弟', 2, 'logo.png', '1234', '2020-05-02 12:48:50', 0);
INSERT INTO `t_user` VALUES (00000031, 15797898671, '阿里巴巴的小妹', 2, 'logo.png', '1234', '2020-05-02 12:49:09', 0);
INSERT INTO `t_user` VALUES (00000032, 15797898672, '阿里巴巴的哥哥', 1, 'logo.png', '1234', '2020-05-02 12:49:26', 0);
INSERT INTO `t_user` VALUES (00000033, 15797898673, '4AM-GODV', 1, 'logo.png', '1234', '2020-05-02 12:51:00', 0);
INSERT INTO `t_user` VALUES (00000034, 15797898674, '4AM-Longz', 1, 'logo.png', '1234', '2020-05-02 12:51:25', 0);
INSERT INTO `t_user` VALUES (00000035, 15797898675, 'EDGClearlove', 1, 'logo.png', '1234', '2020-05-02 12:52:03', 0);
INSERT INTO `t_user` VALUES (00000036, 15797898676, 'loli', 2, 'logo.png', '1234', '2020-05-02 12:52:50', 0);
INSERT INTO `t_user` VALUES (00000037, 15797898677, 'god', 0, 'logo.png', '1234', '2020-05-02 12:53:04', 0);
INSERT INTO `t_user` VALUES (00000038, 15797898678, 'tencent', 0, 'logo.png', '1234', '2020-05-02 12:56:02', 0);
INSERT INTO `t_user` VALUES (00000039, 15797898679, 'let us go', 2, 'logo.png', '1234', '2020-05-02 12:58:57', 0);
INSERT INTO `t_user` VALUES (00000040, 18888888888, '职业商人', 0, 'logo.png', '1234', '2020-05-02 13:10:49', 0);
INSERT INTO `t_user` VALUES (00000041, 15797898680, '虎牙唐伯虎', 0, 'logo.png', '1234', '2020-05-05 12:27:26', 0);
INSERT INTO `t_user` VALUES (00000042, 15797898681, '虎牙秋香', 2, 'logo.png', '1234', '2020-05-05 12:27:44', 0);
INSERT INTO `t_user` VALUES (00000043, 15797898682, '斗鱼祝枝山', 1, 'logo.png', '1234', '2020-05-05 12:27:59', 0);
INSERT INTO `t_user` VALUES (00000044, 15797898683, '马化腾他爹', 0, 'logo.png', '1234', '2020-05-05 12:28:15', 0);
INSERT INTO `t_user` VALUES (00000045, 15797898684, '游戏玩家', 2, 'logo.png', '1234', '2020-05-05 12:28:33', 0);
INSERT INTO `t_user` VALUES (00000046, 15797898685, '游戏玩家', 2, 'logo.png', '1234', '2020-05-05 12:28:43', 0);
INSERT INTO `t_user` VALUES (00000047, 15797898686, 'uzi', 1, 'logo.png', '1234', '2020-05-05 12:29:00', 0);
INSERT INTO `t_user` VALUES (00000048, 15797898652, '游戏玩家', 0, 'logo.png', '1234', '2020-05-09 10:09:00', 0);
INSERT INTO `t_user` VALUES (00000049, 15797898638, '游戏玩家', 0, 'logo.png', '1234', '2020-05-09 10:13:50', 0);
INSERT INTO `t_user` VALUES (00000050, 15797898612, '小橘子', 2, '1588990649865qqfcsy.jpg', '1234', '2020-05-09 10:16:26', 0);

SET FOREIGN_KEY_CHECKS = 1;
