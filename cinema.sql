/*
 Navicat MySQL Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : cinema

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 15/04/2020 17:56:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_cinema
-- ----------------------------
DROP TABLE IF EXISTS `c_cinema`;
CREATE TABLE `c_cinema`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distance` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '距离',
  `minPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '起售价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_cinema
-- ----------------------------
INSERT INTO `c_cinema` VALUES (1, '万达国际影城', '北京市东城区23号', '北京', '900', 35.00);
INSERT INTO `c_cinema` VALUES (2, '幸福蓝海国际影城', '北京市西城区1020号', '北京', '200', 28.00);
INSERT INTO `c_cinema` VALUES (3, 'GTX国际影城', '北京市朝阳区2015号', '北京', '3000', 45.00);
INSERT INTO `c_cinema` VALUES (4, '民族影城', '北京市怀柔区', '北京', '890', 50.00);

-- ----------------------------
-- Table structure for c_comment
-- ----------------------------
DROP TABLE IF EXISTS `c_comment`;
CREATE TABLE `c_comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(10) NULL DEFAULT NULL,
  `ticketId` int(10) NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_comment
-- ----------------------------
INSERT INTO `c_comment` VALUES (1, '这是评论', 2, 1, '2020-04-15 10:39');
INSERT INTO `c_comment` VALUES (2, '123', 2, 1, '2020-04-15 10:39');
INSERT INTO `c_comment` VALUES (3, '', 2, 2, '2020-04-15 11:09');
INSERT INTO `c_comment` VALUES (4, '111', 2, 1, '2020-04-15 14:44');

-- ----------------------------
-- Table structure for c_order
-- ----------------------------
DROP TABLE IF EXISTS `c_order`;
CREATE TABLE `c_order`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NULL DEFAULT NULL,
  `cinemaName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影院名称',
  `seats` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座位 ,分割',
  `sumPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `ticketName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影票名称',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '播放时间',
  `createTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  `ticketId` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_order
-- ----------------------------
INSERT INTO `c_order` VALUES (8, 2, '万达国际影城', '5排4座,5排5座', 60.00, '误杀', '11:20', '2020-04-15 14:44', NULL);
INSERT INTO `c_order` VALUES (9, 2, '万达国际影城', '9排7座,9排6座,9排5座', 105.00, '至暗时刻', '15:22', '2020-04-15 14:44', NULL);
INSERT INTO `c_order` VALUES (10, 2, '万达国际影城', '1排1座,1排2座,1排3座', 105.00, '无问西东', '14:05', '2020-04-15 14:44', NULL);

-- ----------------------------
-- Table structure for c_seat
-- ----------------------------
DROP TABLE IF EXISTS `c_seat`;
CREATE TABLE `c_seat`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rows` int(10) NULL DEFAULT NULL COMMENT '行',
  `columns` int(10) NULL DEFAULT NULL COMMENT '列',
  `is` tinyint(3) NULL DEFAULT 0 COMMENT '是否售出',
  `timeId` int(10) NULL DEFAULT NULL COMMENT '关联播放时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 811 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_seat
-- ----------------------------
INSERT INTO `c_seat` VALUES (1, 1, 1, 1, 10);
INSERT INTO `c_seat` VALUES (2, 1, 1, 0, 11);
INSERT INTO `c_seat` VALUES (3, 1, 1, 0, 12);
INSERT INTO `c_seat` VALUES (4, 1, 1, 0, 13);
INSERT INTO `c_seat` VALUES (5, 1, 1, 0, 14);
INSERT INTO `c_seat` VALUES (6, 1, 1, 0, 15);
INSERT INTO `c_seat` VALUES (7, 1, 1, 0, 16);
INSERT INTO `c_seat` VALUES (8, 1, 1, 0, 17);
INSERT INTO `c_seat` VALUES (9, 1, 1, 0, 18);
INSERT INTO `c_seat` VALUES (10, 1, 2, 1, 10);
INSERT INTO `c_seat` VALUES (11, 1, 2, 0, 11);
INSERT INTO `c_seat` VALUES (12, 1, 2, 0, 12);
INSERT INTO `c_seat` VALUES (13, 1, 2, 0, 13);
INSERT INTO `c_seat` VALUES (14, 1, 2, 0, 14);
INSERT INTO `c_seat` VALUES (15, 1, 2, 0, 15);
INSERT INTO `c_seat` VALUES (16, 1, 2, 0, 16);
INSERT INTO `c_seat` VALUES (17, 1, 2, 0, 17);
INSERT INTO `c_seat` VALUES (18, 1, 2, 0, 18);
INSERT INTO `c_seat` VALUES (19, 1, 3, 1, 10);
INSERT INTO `c_seat` VALUES (20, 1, 3, 0, 11);
INSERT INTO `c_seat` VALUES (21, 1, 3, 0, 12);
INSERT INTO `c_seat` VALUES (22, 1, 3, 0, 13);
INSERT INTO `c_seat` VALUES (23, 1, 3, 0, 14);
INSERT INTO `c_seat` VALUES (24, 1, 3, 0, 15);
INSERT INTO `c_seat` VALUES (25, 1, 3, 0, 16);
INSERT INTO `c_seat` VALUES (26, 1, 3, 0, 17);
INSERT INTO `c_seat` VALUES (27, 1, 3, 0, 18);
INSERT INTO `c_seat` VALUES (28, 1, 4, 0, 10);
INSERT INTO `c_seat` VALUES (29, 1, 4, 0, 11);
INSERT INTO `c_seat` VALUES (30, 1, 4, 0, 12);
INSERT INTO `c_seat` VALUES (31, 1, 4, 0, 13);
INSERT INTO `c_seat` VALUES (32, 1, 4, 0, 14);
INSERT INTO `c_seat` VALUES (33, 1, 4, 0, 15);
INSERT INTO `c_seat` VALUES (34, 1, 4, 0, 16);
INSERT INTO `c_seat` VALUES (35, 1, 4, 0, 17);
INSERT INTO `c_seat` VALUES (36, 1, 4, 0, 18);
INSERT INTO `c_seat` VALUES (37, 1, 5, 0, 10);
INSERT INTO `c_seat` VALUES (38, 1, 5, 0, 11);
INSERT INTO `c_seat` VALUES (39, 1, 5, 0, 12);
INSERT INTO `c_seat` VALUES (40, 1, 5, 0, 13);
INSERT INTO `c_seat` VALUES (41, 1, 5, 0, 14);
INSERT INTO `c_seat` VALUES (42, 1, 5, 0, 15);
INSERT INTO `c_seat` VALUES (43, 1, 5, 0, 16);
INSERT INTO `c_seat` VALUES (44, 1, 5, 0, 17);
INSERT INTO `c_seat` VALUES (45, 1, 5, 0, 18);
INSERT INTO `c_seat` VALUES (46, 1, 6, 0, 10);
INSERT INTO `c_seat` VALUES (47, 1, 6, 0, 11);
INSERT INTO `c_seat` VALUES (48, 1, 6, 0, 12);
INSERT INTO `c_seat` VALUES (49, 1, 6, 0, 13);
INSERT INTO `c_seat` VALUES (50, 1, 6, 0, 14);
INSERT INTO `c_seat` VALUES (51, 1, 6, 0, 15);
INSERT INTO `c_seat` VALUES (52, 1, 6, 0, 16);
INSERT INTO `c_seat` VALUES (53, 1, 6, 0, 17);
INSERT INTO `c_seat` VALUES (54, 1, 6, 0, 18);
INSERT INTO `c_seat` VALUES (55, 1, 7, 0, 10);
INSERT INTO `c_seat` VALUES (56, 1, 7, 0, 11);
INSERT INTO `c_seat` VALUES (57, 1, 7, 0, 12);
INSERT INTO `c_seat` VALUES (58, 1, 7, 0, 13);
INSERT INTO `c_seat` VALUES (59, 1, 7, 0, 14);
INSERT INTO `c_seat` VALUES (60, 1, 7, 0, 15);
INSERT INTO `c_seat` VALUES (61, 1, 7, 0, 16);
INSERT INTO `c_seat` VALUES (62, 1, 7, 0, 17);
INSERT INTO `c_seat` VALUES (63, 1, 7, 0, 18);
INSERT INTO `c_seat` VALUES (64, 1, 8, 0, 10);
INSERT INTO `c_seat` VALUES (65, 1, 8, 0, 11);
INSERT INTO `c_seat` VALUES (66, 1, 8, 0, 12);
INSERT INTO `c_seat` VALUES (67, 1, 8, 0, 13);
INSERT INTO `c_seat` VALUES (68, 1, 8, 0, 14);
INSERT INTO `c_seat` VALUES (69, 1, 8, 0, 15);
INSERT INTO `c_seat` VALUES (70, 1, 8, 0, 16);
INSERT INTO `c_seat` VALUES (71, 1, 8, 0, 17);
INSERT INTO `c_seat` VALUES (72, 1, 8, 0, 18);
INSERT INTO `c_seat` VALUES (73, 1, 9, 0, 10);
INSERT INTO `c_seat` VALUES (74, 1, 9, 0, 11);
INSERT INTO `c_seat` VALUES (75, 1, 9, 0, 12);
INSERT INTO `c_seat` VALUES (76, 1, 9, 0, 13);
INSERT INTO `c_seat` VALUES (77, 1, 9, 0, 14);
INSERT INTO `c_seat` VALUES (78, 1, 9, 0, 15);
INSERT INTO `c_seat` VALUES (79, 1, 9, 0, 16);
INSERT INTO `c_seat` VALUES (80, 1, 9, 0, 17);
INSERT INTO `c_seat` VALUES (81, 1, 9, 0, 18);
INSERT INTO `c_seat` VALUES (82, 1, 10, 0, 10);
INSERT INTO `c_seat` VALUES (83, 1, 10, 0, 11);
INSERT INTO `c_seat` VALUES (84, 1, 10, 0, 12);
INSERT INTO `c_seat` VALUES (85, 1, 10, 0, 13);
INSERT INTO `c_seat` VALUES (86, 1, 10, 0, 14);
INSERT INTO `c_seat` VALUES (87, 1, 10, 0, 15);
INSERT INTO `c_seat` VALUES (88, 1, 10, 0, 16);
INSERT INTO `c_seat` VALUES (89, 1, 10, 0, 17);
INSERT INTO `c_seat` VALUES (90, 1, 10, 0, 18);
INSERT INTO `c_seat` VALUES (91, 2, 1, 0, 10);
INSERT INTO `c_seat` VALUES (92, 2, 1, 0, 11);
INSERT INTO `c_seat` VALUES (93, 2, 1, 0, 12);
INSERT INTO `c_seat` VALUES (94, 2, 1, 0, 13);
INSERT INTO `c_seat` VALUES (95, 2, 1, 0, 14);
INSERT INTO `c_seat` VALUES (96, 2, 1, 0, 15);
INSERT INTO `c_seat` VALUES (97, 2, 1, 0, 16);
INSERT INTO `c_seat` VALUES (98, 2, 1, 0, 17);
INSERT INTO `c_seat` VALUES (99, 2, 1, 0, 18);
INSERT INTO `c_seat` VALUES (100, 2, 2, 0, 10);
INSERT INTO `c_seat` VALUES (101, 2, 2, 0, 11);
INSERT INTO `c_seat` VALUES (102, 2, 2, 0, 12);
INSERT INTO `c_seat` VALUES (103, 2, 2, 0, 13);
INSERT INTO `c_seat` VALUES (104, 2, 2, 0, 14);
INSERT INTO `c_seat` VALUES (105, 2, 2, 0, 15);
INSERT INTO `c_seat` VALUES (106, 2, 2, 0, 16);
INSERT INTO `c_seat` VALUES (107, 2, 2, 0, 17);
INSERT INTO `c_seat` VALUES (108, 2, 2, 0, 18);
INSERT INTO `c_seat` VALUES (109, 2, 3, 0, 10);
INSERT INTO `c_seat` VALUES (110, 2, 3, 0, 11);
INSERT INTO `c_seat` VALUES (111, 2, 3, 0, 12);
INSERT INTO `c_seat` VALUES (112, 2, 3, 0, 13);
INSERT INTO `c_seat` VALUES (113, 2, 3, 0, 14);
INSERT INTO `c_seat` VALUES (114, 2, 3, 0, 15);
INSERT INTO `c_seat` VALUES (115, 2, 3, 0, 16);
INSERT INTO `c_seat` VALUES (116, 2, 3, 0, 17);
INSERT INTO `c_seat` VALUES (117, 2, 3, 0, 18);
INSERT INTO `c_seat` VALUES (118, 2, 4, 0, 10);
INSERT INTO `c_seat` VALUES (119, 2, 4, 0, 11);
INSERT INTO `c_seat` VALUES (120, 2, 4, 0, 12);
INSERT INTO `c_seat` VALUES (121, 2, 4, 0, 13);
INSERT INTO `c_seat` VALUES (122, 2, 4, 0, 14);
INSERT INTO `c_seat` VALUES (123, 2, 4, 0, 15);
INSERT INTO `c_seat` VALUES (124, 2, 4, 0, 16);
INSERT INTO `c_seat` VALUES (125, 2, 4, 0, 17);
INSERT INTO `c_seat` VALUES (126, 2, 4, 0, 18);
INSERT INTO `c_seat` VALUES (127, 2, 5, 0, 10);
INSERT INTO `c_seat` VALUES (128, 2, 5, 0, 11);
INSERT INTO `c_seat` VALUES (129, 2, 5, 0, 12);
INSERT INTO `c_seat` VALUES (130, 2, 5, 0, 13);
INSERT INTO `c_seat` VALUES (131, 2, 5, 0, 14);
INSERT INTO `c_seat` VALUES (132, 2, 5, 0, 15);
INSERT INTO `c_seat` VALUES (133, 2, 5, 0, 16);
INSERT INTO `c_seat` VALUES (134, 2, 5, 0, 17);
INSERT INTO `c_seat` VALUES (135, 2, 5, 0, 18);
INSERT INTO `c_seat` VALUES (136, 2, 6, 0, 10);
INSERT INTO `c_seat` VALUES (137, 2, 6, 0, 11);
INSERT INTO `c_seat` VALUES (138, 2, 6, 0, 12);
INSERT INTO `c_seat` VALUES (139, 2, 6, 0, 13);
INSERT INTO `c_seat` VALUES (140, 2, 6, 0, 14);
INSERT INTO `c_seat` VALUES (141, 2, 6, 0, 15);
INSERT INTO `c_seat` VALUES (142, 2, 6, 0, 16);
INSERT INTO `c_seat` VALUES (143, 2, 6, 0, 17);
INSERT INTO `c_seat` VALUES (144, 2, 6, 0, 18);
INSERT INTO `c_seat` VALUES (145, 2, 7, 0, 10);
INSERT INTO `c_seat` VALUES (146, 2, 7, 0, 11);
INSERT INTO `c_seat` VALUES (147, 2, 7, 0, 12);
INSERT INTO `c_seat` VALUES (148, 2, 7, 0, 13);
INSERT INTO `c_seat` VALUES (149, 2, 7, 0, 14);
INSERT INTO `c_seat` VALUES (150, 2, 7, 0, 15);
INSERT INTO `c_seat` VALUES (151, 2, 7, 0, 16);
INSERT INTO `c_seat` VALUES (152, 2, 7, 0, 17);
INSERT INTO `c_seat` VALUES (153, 2, 7, 0, 18);
INSERT INTO `c_seat` VALUES (154, 2, 8, 0, 10);
INSERT INTO `c_seat` VALUES (155, 2, 8, 0, 11);
INSERT INTO `c_seat` VALUES (156, 2, 8, 0, 12);
INSERT INTO `c_seat` VALUES (157, 2, 8, 0, 13);
INSERT INTO `c_seat` VALUES (158, 2, 8, 0, 14);
INSERT INTO `c_seat` VALUES (159, 2, 8, 0, 15);
INSERT INTO `c_seat` VALUES (160, 2, 8, 0, 16);
INSERT INTO `c_seat` VALUES (161, 2, 8, 0, 17);
INSERT INTO `c_seat` VALUES (162, 2, 8, 0, 18);
INSERT INTO `c_seat` VALUES (163, 2, 9, 0, 10);
INSERT INTO `c_seat` VALUES (164, 2, 9, 0, 11);
INSERT INTO `c_seat` VALUES (165, 2, 9, 0, 12);
INSERT INTO `c_seat` VALUES (166, 2, 9, 0, 13);
INSERT INTO `c_seat` VALUES (167, 2, 9, 0, 14);
INSERT INTO `c_seat` VALUES (168, 2, 9, 0, 15);
INSERT INTO `c_seat` VALUES (169, 2, 9, 0, 16);
INSERT INTO `c_seat` VALUES (170, 2, 9, 0, 17);
INSERT INTO `c_seat` VALUES (171, 2, 9, 0, 18);
INSERT INTO `c_seat` VALUES (172, 2, 10, 0, 10);
INSERT INTO `c_seat` VALUES (173, 2, 10, 0, 11);
INSERT INTO `c_seat` VALUES (174, 2, 10, 0, 12);
INSERT INTO `c_seat` VALUES (175, 2, 10, 0, 13);
INSERT INTO `c_seat` VALUES (176, 2, 10, 0, 14);
INSERT INTO `c_seat` VALUES (177, 2, 10, 0, 15);
INSERT INTO `c_seat` VALUES (178, 2, 10, 0, 16);
INSERT INTO `c_seat` VALUES (179, 2, 10, 0, 17);
INSERT INTO `c_seat` VALUES (180, 2, 10, 0, 18);
INSERT INTO `c_seat` VALUES (181, 3, 1, 0, 10);
INSERT INTO `c_seat` VALUES (182, 3, 1, 0, 11);
INSERT INTO `c_seat` VALUES (183, 3, 1, 0, 12);
INSERT INTO `c_seat` VALUES (184, 3, 1, 0, 13);
INSERT INTO `c_seat` VALUES (185, 3, 1, 0, 14);
INSERT INTO `c_seat` VALUES (186, 3, 1, 0, 15);
INSERT INTO `c_seat` VALUES (187, 3, 1, 0, 16);
INSERT INTO `c_seat` VALUES (188, 3, 1, 0, 17);
INSERT INTO `c_seat` VALUES (189, 3, 1, 0, 18);
INSERT INTO `c_seat` VALUES (190, 3, 2, 0, 10);
INSERT INTO `c_seat` VALUES (191, 3, 2, 0, 11);
INSERT INTO `c_seat` VALUES (192, 3, 2, 0, 12);
INSERT INTO `c_seat` VALUES (193, 3, 2, 0, 13);
INSERT INTO `c_seat` VALUES (194, 3, 2, 0, 14);
INSERT INTO `c_seat` VALUES (195, 3, 2, 0, 15);
INSERT INTO `c_seat` VALUES (196, 3, 2, 0, 16);
INSERT INTO `c_seat` VALUES (197, 3, 2, 0, 17);
INSERT INTO `c_seat` VALUES (198, 3, 2, 0, 18);
INSERT INTO `c_seat` VALUES (199, 3, 3, 0, 10);
INSERT INTO `c_seat` VALUES (200, 3, 3, 0, 11);
INSERT INTO `c_seat` VALUES (201, 3, 3, 0, 12);
INSERT INTO `c_seat` VALUES (202, 3, 3, 0, 13);
INSERT INTO `c_seat` VALUES (203, 3, 3, 0, 14);
INSERT INTO `c_seat` VALUES (204, 3, 3, 0, 15);
INSERT INTO `c_seat` VALUES (205, 3, 3, 0, 16);
INSERT INTO `c_seat` VALUES (206, 3, 3, 0, 17);
INSERT INTO `c_seat` VALUES (207, 3, 3, 0, 18);
INSERT INTO `c_seat` VALUES (208, 3, 4, 0, 10);
INSERT INTO `c_seat` VALUES (209, 3, 4, 0, 11);
INSERT INTO `c_seat` VALUES (210, 3, 4, 0, 12);
INSERT INTO `c_seat` VALUES (211, 3, 4, 0, 13);
INSERT INTO `c_seat` VALUES (212, 3, 4, 0, 14);
INSERT INTO `c_seat` VALUES (213, 3, 4, 0, 15);
INSERT INTO `c_seat` VALUES (214, 3, 4, 0, 16);
INSERT INTO `c_seat` VALUES (215, 3, 4, 0, 17);
INSERT INTO `c_seat` VALUES (216, 3, 4, 0, 18);
INSERT INTO `c_seat` VALUES (217, 3, 5, 0, 10);
INSERT INTO `c_seat` VALUES (218, 3, 5, 0, 11);
INSERT INTO `c_seat` VALUES (219, 3, 5, 0, 12);
INSERT INTO `c_seat` VALUES (220, 3, 5, 0, 13);
INSERT INTO `c_seat` VALUES (221, 3, 5, 0, 14);
INSERT INTO `c_seat` VALUES (222, 3, 5, 0, 15);
INSERT INTO `c_seat` VALUES (223, 3, 5, 0, 16);
INSERT INTO `c_seat` VALUES (224, 3, 5, 0, 17);
INSERT INTO `c_seat` VALUES (225, 3, 5, 0, 18);
INSERT INTO `c_seat` VALUES (226, 3, 6, 0, 10);
INSERT INTO `c_seat` VALUES (227, 3, 6, 0, 11);
INSERT INTO `c_seat` VALUES (228, 3, 6, 0, 12);
INSERT INTO `c_seat` VALUES (229, 3, 6, 0, 13);
INSERT INTO `c_seat` VALUES (230, 3, 6, 0, 14);
INSERT INTO `c_seat` VALUES (231, 3, 6, 0, 15);
INSERT INTO `c_seat` VALUES (232, 3, 6, 0, 16);
INSERT INTO `c_seat` VALUES (233, 3, 6, 0, 17);
INSERT INTO `c_seat` VALUES (234, 3, 6, 0, 18);
INSERT INTO `c_seat` VALUES (235, 3, 7, 0, 10);
INSERT INTO `c_seat` VALUES (236, 3, 7, 0, 11);
INSERT INTO `c_seat` VALUES (237, 3, 7, 0, 12);
INSERT INTO `c_seat` VALUES (238, 3, 7, 0, 13);
INSERT INTO `c_seat` VALUES (239, 3, 7, 0, 14);
INSERT INTO `c_seat` VALUES (240, 3, 7, 0, 15);
INSERT INTO `c_seat` VALUES (241, 3, 7, 0, 16);
INSERT INTO `c_seat` VALUES (242, 3, 7, 0, 17);
INSERT INTO `c_seat` VALUES (243, 3, 7, 0, 18);
INSERT INTO `c_seat` VALUES (244, 3, 8, 0, 10);
INSERT INTO `c_seat` VALUES (245, 3, 8, 0, 11);
INSERT INTO `c_seat` VALUES (246, 3, 8, 0, 12);
INSERT INTO `c_seat` VALUES (247, 3, 8, 0, 13);
INSERT INTO `c_seat` VALUES (248, 3, 8, 0, 14);
INSERT INTO `c_seat` VALUES (249, 3, 8, 0, 15);
INSERT INTO `c_seat` VALUES (250, 3, 8, 0, 16);
INSERT INTO `c_seat` VALUES (251, 3, 8, 0, 17);
INSERT INTO `c_seat` VALUES (252, 3, 8, 0, 18);
INSERT INTO `c_seat` VALUES (253, 3, 9, 0, 10);
INSERT INTO `c_seat` VALUES (254, 3, 9, 0, 11);
INSERT INTO `c_seat` VALUES (255, 3, 9, 0, 12);
INSERT INTO `c_seat` VALUES (256, 3, 9, 0, 13);
INSERT INTO `c_seat` VALUES (257, 3, 9, 0, 14);
INSERT INTO `c_seat` VALUES (258, 3, 9, 0, 15);
INSERT INTO `c_seat` VALUES (259, 3, 9, 0, 16);
INSERT INTO `c_seat` VALUES (260, 3, 9, 0, 17);
INSERT INTO `c_seat` VALUES (261, 3, 9, 0, 18);
INSERT INTO `c_seat` VALUES (262, 3, 10, 0, 10);
INSERT INTO `c_seat` VALUES (263, 3, 10, 0, 11);
INSERT INTO `c_seat` VALUES (264, 3, 10, 0, 12);
INSERT INTO `c_seat` VALUES (265, 3, 10, 0, 13);
INSERT INTO `c_seat` VALUES (266, 3, 10, 0, 14);
INSERT INTO `c_seat` VALUES (267, 3, 10, 0, 15);
INSERT INTO `c_seat` VALUES (268, 3, 10, 0, 16);
INSERT INTO `c_seat` VALUES (269, 3, 10, 0, 17);
INSERT INTO `c_seat` VALUES (270, 3, 10, 0, 18);
INSERT INTO `c_seat` VALUES (271, 4, 1, 0, 10);
INSERT INTO `c_seat` VALUES (272, 4, 1, 0, 11);
INSERT INTO `c_seat` VALUES (273, 4, 1, 0, 12);
INSERT INTO `c_seat` VALUES (274, 4, 1, 0, 13);
INSERT INTO `c_seat` VALUES (275, 4, 1, 0, 14);
INSERT INTO `c_seat` VALUES (276, 4, 1, 0, 15);
INSERT INTO `c_seat` VALUES (277, 4, 1, 0, 16);
INSERT INTO `c_seat` VALUES (278, 4, 1, 0, 17);
INSERT INTO `c_seat` VALUES (279, 4, 1, 0, 18);
INSERT INTO `c_seat` VALUES (280, 4, 2, 0, 10);
INSERT INTO `c_seat` VALUES (281, 4, 2, 0, 11);
INSERT INTO `c_seat` VALUES (282, 4, 2, 0, 12);
INSERT INTO `c_seat` VALUES (283, 4, 2, 0, 13);
INSERT INTO `c_seat` VALUES (284, 4, 2, 0, 14);
INSERT INTO `c_seat` VALUES (285, 4, 2, 0, 15);
INSERT INTO `c_seat` VALUES (286, 4, 2, 0, 16);
INSERT INTO `c_seat` VALUES (287, 4, 2, 0, 17);
INSERT INTO `c_seat` VALUES (288, 4, 2, 0, 18);
INSERT INTO `c_seat` VALUES (289, 4, 3, 0, 10);
INSERT INTO `c_seat` VALUES (290, 4, 3, 0, 11);
INSERT INTO `c_seat` VALUES (291, 4, 3, 0, 12);
INSERT INTO `c_seat` VALUES (292, 4, 3, 0, 13);
INSERT INTO `c_seat` VALUES (293, 4, 3, 0, 14);
INSERT INTO `c_seat` VALUES (294, 4, 3, 0, 15);
INSERT INTO `c_seat` VALUES (295, 4, 3, 0, 16);
INSERT INTO `c_seat` VALUES (296, 4, 3, 0, 17);
INSERT INTO `c_seat` VALUES (297, 4, 3, 0, 18);
INSERT INTO `c_seat` VALUES (298, 4, 4, 0, 10);
INSERT INTO `c_seat` VALUES (299, 4, 4, 0, 11);
INSERT INTO `c_seat` VALUES (300, 4, 4, 0, 12);
INSERT INTO `c_seat` VALUES (301, 4, 4, 0, 13);
INSERT INTO `c_seat` VALUES (302, 4, 4, 0, 14);
INSERT INTO `c_seat` VALUES (303, 4, 4, 0, 15);
INSERT INTO `c_seat` VALUES (304, 4, 4, 0, 16);
INSERT INTO `c_seat` VALUES (305, 4, 4, 0, 17);
INSERT INTO `c_seat` VALUES (306, 4, 4, 0, 18);
INSERT INTO `c_seat` VALUES (307, 4, 5, 0, 10);
INSERT INTO `c_seat` VALUES (308, 4, 5, 0, 11);
INSERT INTO `c_seat` VALUES (309, 4, 5, 0, 12);
INSERT INTO `c_seat` VALUES (310, 4, 5, 0, 13);
INSERT INTO `c_seat` VALUES (311, 4, 5, 0, 14);
INSERT INTO `c_seat` VALUES (312, 4, 5, 0, 15);
INSERT INTO `c_seat` VALUES (313, 4, 5, 0, 16);
INSERT INTO `c_seat` VALUES (314, 4, 5, 0, 17);
INSERT INTO `c_seat` VALUES (315, 4, 5, 0, 18);
INSERT INTO `c_seat` VALUES (316, 4, 6, 0, 10);
INSERT INTO `c_seat` VALUES (317, 4, 6, 0, 11);
INSERT INTO `c_seat` VALUES (318, 4, 6, 0, 12);
INSERT INTO `c_seat` VALUES (319, 4, 6, 0, 13);
INSERT INTO `c_seat` VALUES (320, 4, 6, 0, 14);
INSERT INTO `c_seat` VALUES (321, 4, 6, 0, 15);
INSERT INTO `c_seat` VALUES (322, 4, 6, 0, 16);
INSERT INTO `c_seat` VALUES (323, 4, 6, 0, 17);
INSERT INTO `c_seat` VALUES (324, 4, 6, 0, 18);
INSERT INTO `c_seat` VALUES (325, 4, 7, 0, 10);
INSERT INTO `c_seat` VALUES (326, 4, 7, 0, 11);
INSERT INTO `c_seat` VALUES (327, 4, 7, 0, 12);
INSERT INTO `c_seat` VALUES (328, 4, 7, 0, 13);
INSERT INTO `c_seat` VALUES (329, 4, 7, 0, 14);
INSERT INTO `c_seat` VALUES (330, 4, 7, 0, 15);
INSERT INTO `c_seat` VALUES (331, 4, 7, 0, 16);
INSERT INTO `c_seat` VALUES (332, 4, 7, 0, 17);
INSERT INTO `c_seat` VALUES (333, 4, 7, 0, 18);
INSERT INTO `c_seat` VALUES (334, 4, 8, 0, 10);
INSERT INTO `c_seat` VALUES (335, 4, 8, 0, 11);
INSERT INTO `c_seat` VALUES (336, 4, 8, 0, 12);
INSERT INTO `c_seat` VALUES (337, 4, 8, 0, 13);
INSERT INTO `c_seat` VALUES (338, 4, 8, 0, 14);
INSERT INTO `c_seat` VALUES (339, 4, 8, 0, 15);
INSERT INTO `c_seat` VALUES (340, 4, 8, 0, 16);
INSERT INTO `c_seat` VALUES (341, 4, 8, 0, 17);
INSERT INTO `c_seat` VALUES (342, 4, 8, 0, 18);
INSERT INTO `c_seat` VALUES (343, 4, 9, 0, 10);
INSERT INTO `c_seat` VALUES (344, 4, 9, 0, 11);
INSERT INTO `c_seat` VALUES (345, 4, 9, 0, 12);
INSERT INTO `c_seat` VALUES (346, 4, 9, 0, 13);
INSERT INTO `c_seat` VALUES (347, 4, 9, 0, 14);
INSERT INTO `c_seat` VALUES (348, 4, 9, 0, 15);
INSERT INTO `c_seat` VALUES (349, 4, 9, 0, 16);
INSERT INTO `c_seat` VALUES (350, 4, 9, 0, 17);
INSERT INTO `c_seat` VALUES (351, 4, 9, 0, 18);
INSERT INTO `c_seat` VALUES (352, 4, 10, 0, 10);
INSERT INTO `c_seat` VALUES (353, 4, 10, 0, 11);
INSERT INTO `c_seat` VALUES (354, 4, 10, 0, 12);
INSERT INTO `c_seat` VALUES (355, 4, 10, 0, 13);
INSERT INTO `c_seat` VALUES (356, 4, 10, 0, 14);
INSERT INTO `c_seat` VALUES (357, 4, 10, 0, 15);
INSERT INTO `c_seat` VALUES (358, 4, 10, 0, 16);
INSERT INTO `c_seat` VALUES (359, 4, 10, 0, 17);
INSERT INTO `c_seat` VALUES (360, 4, 10, 0, 18);
INSERT INTO `c_seat` VALUES (361, 5, 1, 0, 10);
INSERT INTO `c_seat` VALUES (362, 5, 1, 0, 11);
INSERT INTO `c_seat` VALUES (363, 5, 1, 0, 12);
INSERT INTO `c_seat` VALUES (364, 5, 1, 0, 13);
INSERT INTO `c_seat` VALUES (365, 5, 1, 0, 14);
INSERT INTO `c_seat` VALUES (366, 5, 1, 0, 15);
INSERT INTO `c_seat` VALUES (367, 5, 1, 0, 16);
INSERT INTO `c_seat` VALUES (368, 5, 1, 0, 17);
INSERT INTO `c_seat` VALUES (369, 5, 1, 0, 18);
INSERT INTO `c_seat` VALUES (370, 5, 2, 0, 10);
INSERT INTO `c_seat` VALUES (371, 5, 2, 0, 11);
INSERT INTO `c_seat` VALUES (372, 5, 2, 0, 12);
INSERT INTO `c_seat` VALUES (373, 5, 2, 0, 13);
INSERT INTO `c_seat` VALUES (374, 5, 2, 0, 14);
INSERT INTO `c_seat` VALUES (375, 5, 2, 0, 15);
INSERT INTO `c_seat` VALUES (376, 5, 2, 0, 16);
INSERT INTO `c_seat` VALUES (377, 5, 2, 0, 17);
INSERT INTO `c_seat` VALUES (378, 5, 2, 0, 18);
INSERT INTO `c_seat` VALUES (379, 5, 3, 0, 10);
INSERT INTO `c_seat` VALUES (380, 5, 3, 0, 11);
INSERT INTO `c_seat` VALUES (381, 5, 3, 0, 12);
INSERT INTO `c_seat` VALUES (382, 5, 3, 0, 13);
INSERT INTO `c_seat` VALUES (383, 5, 3, 0, 14);
INSERT INTO `c_seat` VALUES (384, 5, 3, 0, 15);
INSERT INTO `c_seat` VALUES (385, 5, 3, 0, 16);
INSERT INTO `c_seat` VALUES (386, 5, 3, 0, 17);
INSERT INTO `c_seat` VALUES (387, 5, 3, 0, 18);
INSERT INTO `c_seat` VALUES (388, 5, 4, 0, 10);
INSERT INTO `c_seat` VALUES (389, 5, 4, 0, 11);
INSERT INTO `c_seat` VALUES (390, 5, 4, 0, 12);
INSERT INTO `c_seat` VALUES (391, 5, 4, 0, 13);
INSERT INTO `c_seat` VALUES (392, 5, 4, 0, 14);
INSERT INTO `c_seat` VALUES (393, 5, 4, 0, 15);
INSERT INTO `c_seat` VALUES (394, 5, 4, 1, 16);
INSERT INTO `c_seat` VALUES (395, 5, 4, 0, 17);
INSERT INTO `c_seat` VALUES (396, 5, 4, 0, 18);
INSERT INTO `c_seat` VALUES (397, 5, 5, 0, 10);
INSERT INTO `c_seat` VALUES (398, 5, 5, 0, 11);
INSERT INTO `c_seat` VALUES (399, 5, 5, 0, 12);
INSERT INTO `c_seat` VALUES (400, 5, 5, 0, 13);
INSERT INTO `c_seat` VALUES (401, 5, 5, 0, 14);
INSERT INTO `c_seat` VALUES (402, 5, 5, 0, 15);
INSERT INTO `c_seat` VALUES (403, 5, 5, 1, 16);
INSERT INTO `c_seat` VALUES (404, 5, 5, 0, 17);
INSERT INTO `c_seat` VALUES (405, 5, 5, 0, 18);
INSERT INTO `c_seat` VALUES (406, 5, 6, 0, 10);
INSERT INTO `c_seat` VALUES (407, 5, 6, 0, 11);
INSERT INTO `c_seat` VALUES (408, 5, 6, 0, 12);
INSERT INTO `c_seat` VALUES (409, 5, 6, 0, 13);
INSERT INTO `c_seat` VALUES (410, 5, 6, 0, 14);
INSERT INTO `c_seat` VALUES (411, 5, 6, 0, 15);
INSERT INTO `c_seat` VALUES (412, 5, 6, 0, 16);
INSERT INTO `c_seat` VALUES (413, 5, 6, 0, 17);
INSERT INTO `c_seat` VALUES (414, 5, 6, 0, 18);
INSERT INTO `c_seat` VALUES (415, 5, 7, 0, 10);
INSERT INTO `c_seat` VALUES (416, 5, 7, 0, 11);
INSERT INTO `c_seat` VALUES (417, 5, 7, 0, 12);
INSERT INTO `c_seat` VALUES (418, 5, 7, 0, 13);
INSERT INTO `c_seat` VALUES (419, 5, 7, 0, 14);
INSERT INTO `c_seat` VALUES (420, 5, 7, 0, 15);
INSERT INTO `c_seat` VALUES (421, 5, 7, 0, 16);
INSERT INTO `c_seat` VALUES (422, 5, 7, 0, 17);
INSERT INTO `c_seat` VALUES (423, 5, 7, 0, 18);
INSERT INTO `c_seat` VALUES (424, 5, 8, 0, 10);
INSERT INTO `c_seat` VALUES (425, 5, 8, 0, 11);
INSERT INTO `c_seat` VALUES (426, 5, 8, 0, 12);
INSERT INTO `c_seat` VALUES (427, 5, 8, 0, 13);
INSERT INTO `c_seat` VALUES (428, 5, 8, 0, 14);
INSERT INTO `c_seat` VALUES (429, 5, 8, 0, 15);
INSERT INTO `c_seat` VALUES (430, 5, 8, 0, 16);
INSERT INTO `c_seat` VALUES (431, 5, 8, 0, 17);
INSERT INTO `c_seat` VALUES (432, 5, 8, 0, 18);
INSERT INTO `c_seat` VALUES (433, 5, 9, 0, 10);
INSERT INTO `c_seat` VALUES (434, 5, 9, 0, 11);
INSERT INTO `c_seat` VALUES (435, 5, 9, 0, 12);
INSERT INTO `c_seat` VALUES (436, 5, 9, 0, 13);
INSERT INTO `c_seat` VALUES (437, 5, 9, 0, 14);
INSERT INTO `c_seat` VALUES (438, 5, 9, 0, 15);
INSERT INTO `c_seat` VALUES (439, 5, 9, 0, 16);
INSERT INTO `c_seat` VALUES (440, 5, 9, 0, 17);
INSERT INTO `c_seat` VALUES (441, 5, 9, 0, 18);
INSERT INTO `c_seat` VALUES (442, 5, 10, 0, 10);
INSERT INTO `c_seat` VALUES (443, 5, 10, 0, 11);
INSERT INTO `c_seat` VALUES (444, 5, 10, 0, 12);
INSERT INTO `c_seat` VALUES (445, 5, 10, 0, 13);
INSERT INTO `c_seat` VALUES (446, 5, 10, 0, 14);
INSERT INTO `c_seat` VALUES (447, 5, 10, 0, 15);
INSERT INTO `c_seat` VALUES (448, 5, 10, 0, 16);
INSERT INTO `c_seat` VALUES (449, 5, 10, 0, 17);
INSERT INTO `c_seat` VALUES (450, 5, 10, 0, 18);
INSERT INTO `c_seat` VALUES (451, 6, 1, 0, 10);
INSERT INTO `c_seat` VALUES (452, 6, 1, 0, 11);
INSERT INTO `c_seat` VALUES (453, 6, 1, 0, 12);
INSERT INTO `c_seat` VALUES (454, 6, 1, 0, 13);
INSERT INTO `c_seat` VALUES (455, 6, 1, 0, 14);
INSERT INTO `c_seat` VALUES (456, 6, 1, 0, 15);
INSERT INTO `c_seat` VALUES (457, 6, 1, 0, 16);
INSERT INTO `c_seat` VALUES (458, 6, 1, 0, 17);
INSERT INTO `c_seat` VALUES (459, 6, 1, 0, 18);
INSERT INTO `c_seat` VALUES (460, 6, 2, 0, 10);
INSERT INTO `c_seat` VALUES (461, 6, 2, 0, 11);
INSERT INTO `c_seat` VALUES (462, 6, 2, 0, 12);
INSERT INTO `c_seat` VALUES (463, 6, 2, 0, 13);
INSERT INTO `c_seat` VALUES (464, 6, 2, 0, 14);
INSERT INTO `c_seat` VALUES (465, 6, 2, 0, 15);
INSERT INTO `c_seat` VALUES (466, 6, 2, 0, 16);
INSERT INTO `c_seat` VALUES (467, 6, 2, 0, 17);
INSERT INTO `c_seat` VALUES (468, 6, 2, 0, 18);
INSERT INTO `c_seat` VALUES (469, 6, 3, 0, 10);
INSERT INTO `c_seat` VALUES (470, 6, 3, 0, 11);
INSERT INTO `c_seat` VALUES (471, 6, 3, 0, 12);
INSERT INTO `c_seat` VALUES (472, 6, 3, 0, 13);
INSERT INTO `c_seat` VALUES (473, 6, 3, 0, 14);
INSERT INTO `c_seat` VALUES (474, 6, 3, 0, 15);
INSERT INTO `c_seat` VALUES (475, 6, 3, 0, 16);
INSERT INTO `c_seat` VALUES (476, 6, 3, 0, 17);
INSERT INTO `c_seat` VALUES (477, 6, 3, 0, 18);
INSERT INTO `c_seat` VALUES (478, 6, 4, 0, 10);
INSERT INTO `c_seat` VALUES (479, 6, 4, 0, 11);
INSERT INTO `c_seat` VALUES (480, 6, 4, 0, 12);
INSERT INTO `c_seat` VALUES (481, 6, 4, 0, 13);
INSERT INTO `c_seat` VALUES (482, 6, 4, 0, 14);
INSERT INTO `c_seat` VALUES (483, 6, 4, 0, 15);
INSERT INTO `c_seat` VALUES (484, 6, 4, 0, 16);
INSERT INTO `c_seat` VALUES (485, 6, 4, 0, 17);
INSERT INTO `c_seat` VALUES (486, 6, 4, 0, 18);
INSERT INTO `c_seat` VALUES (487, 6, 5, 0, 10);
INSERT INTO `c_seat` VALUES (488, 6, 5, 0, 11);
INSERT INTO `c_seat` VALUES (489, 6, 5, 0, 12);
INSERT INTO `c_seat` VALUES (490, 6, 5, 0, 13);
INSERT INTO `c_seat` VALUES (491, 6, 5, 0, 14);
INSERT INTO `c_seat` VALUES (492, 6, 5, 0, 15);
INSERT INTO `c_seat` VALUES (493, 6, 5, 0, 16);
INSERT INTO `c_seat` VALUES (494, 6, 5, 0, 17);
INSERT INTO `c_seat` VALUES (495, 6, 5, 0, 18);
INSERT INTO `c_seat` VALUES (496, 6, 6, 0, 10);
INSERT INTO `c_seat` VALUES (497, 6, 6, 0, 11);
INSERT INTO `c_seat` VALUES (498, 6, 6, 0, 12);
INSERT INTO `c_seat` VALUES (499, 6, 6, 0, 13);
INSERT INTO `c_seat` VALUES (500, 6, 6, 0, 14);
INSERT INTO `c_seat` VALUES (501, 6, 6, 0, 15);
INSERT INTO `c_seat` VALUES (502, 6, 6, 0, 16);
INSERT INTO `c_seat` VALUES (503, 6, 6, 0, 17);
INSERT INTO `c_seat` VALUES (504, 6, 6, 0, 18);
INSERT INTO `c_seat` VALUES (505, 6, 7, 0, 10);
INSERT INTO `c_seat` VALUES (506, 6, 7, 0, 11);
INSERT INTO `c_seat` VALUES (507, 6, 7, 0, 12);
INSERT INTO `c_seat` VALUES (508, 6, 7, 0, 13);
INSERT INTO `c_seat` VALUES (509, 6, 7, 0, 14);
INSERT INTO `c_seat` VALUES (510, 6, 7, 0, 15);
INSERT INTO `c_seat` VALUES (511, 6, 7, 0, 16);
INSERT INTO `c_seat` VALUES (512, 6, 7, 0, 17);
INSERT INTO `c_seat` VALUES (513, 6, 7, 0, 18);
INSERT INTO `c_seat` VALUES (514, 6, 8, 0, 10);
INSERT INTO `c_seat` VALUES (515, 6, 8, 0, 11);
INSERT INTO `c_seat` VALUES (516, 6, 8, 0, 12);
INSERT INTO `c_seat` VALUES (517, 6, 8, 0, 13);
INSERT INTO `c_seat` VALUES (518, 6, 8, 0, 14);
INSERT INTO `c_seat` VALUES (519, 6, 8, 0, 15);
INSERT INTO `c_seat` VALUES (520, 6, 8, 0, 16);
INSERT INTO `c_seat` VALUES (521, 6, 8, 0, 17);
INSERT INTO `c_seat` VALUES (522, 6, 8, 0, 18);
INSERT INTO `c_seat` VALUES (523, 6, 9, 0, 10);
INSERT INTO `c_seat` VALUES (524, 6, 9, 0, 11);
INSERT INTO `c_seat` VALUES (525, 6, 9, 0, 12);
INSERT INTO `c_seat` VALUES (526, 6, 9, 0, 13);
INSERT INTO `c_seat` VALUES (527, 6, 9, 0, 14);
INSERT INTO `c_seat` VALUES (528, 6, 9, 0, 15);
INSERT INTO `c_seat` VALUES (529, 6, 9, 0, 16);
INSERT INTO `c_seat` VALUES (530, 6, 9, 0, 17);
INSERT INTO `c_seat` VALUES (531, 6, 9, 0, 18);
INSERT INTO `c_seat` VALUES (532, 6, 10, 0, 10);
INSERT INTO `c_seat` VALUES (533, 6, 10, 0, 11);
INSERT INTO `c_seat` VALUES (534, 6, 10, 0, 12);
INSERT INTO `c_seat` VALUES (535, 6, 10, 0, 13);
INSERT INTO `c_seat` VALUES (536, 6, 10, 0, 14);
INSERT INTO `c_seat` VALUES (537, 6, 10, 0, 15);
INSERT INTO `c_seat` VALUES (538, 6, 10, 0, 16);
INSERT INTO `c_seat` VALUES (539, 6, 10, 0, 17);
INSERT INTO `c_seat` VALUES (540, 6, 10, 0, 18);
INSERT INTO `c_seat` VALUES (541, 7, 1, 0, 10);
INSERT INTO `c_seat` VALUES (542, 7, 1, 0, 11);
INSERT INTO `c_seat` VALUES (543, 7, 1, 0, 12);
INSERT INTO `c_seat` VALUES (544, 7, 1, 0, 13);
INSERT INTO `c_seat` VALUES (545, 7, 1, 0, 14);
INSERT INTO `c_seat` VALUES (546, 7, 1, 0, 15);
INSERT INTO `c_seat` VALUES (547, 7, 1, 0, 16);
INSERT INTO `c_seat` VALUES (548, 7, 1, 0, 17);
INSERT INTO `c_seat` VALUES (549, 7, 1, 0, 18);
INSERT INTO `c_seat` VALUES (550, 7, 2, 0, 10);
INSERT INTO `c_seat` VALUES (551, 7, 2, 0, 11);
INSERT INTO `c_seat` VALUES (552, 7, 2, 0, 12);
INSERT INTO `c_seat` VALUES (553, 7, 2, 0, 13);
INSERT INTO `c_seat` VALUES (554, 7, 2, 0, 14);
INSERT INTO `c_seat` VALUES (555, 7, 2, 0, 15);
INSERT INTO `c_seat` VALUES (556, 7, 2, 0, 16);
INSERT INTO `c_seat` VALUES (557, 7, 2, 0, 17);
INSERT INTO `c_seat` VALUES (558, 7, 2, 0, 18);
INSERT INTO `c_seat` VALUES (559, 7, 3, 0, 10);
INSERT INTO `c_seat` VALUES (560, 7, 3, 0, 11);
INSERT INTO `c_seat` VALUES (561, 7, 3, 0, 12);
INSERT INTO `c_seat` VALUES (562, 7, 3, 0, 13);
INSERT INTO `c_seat` VALUES (563, 7, 3, 0, 14);
INSERT INTO `c_seat` VALUES (564, 7, 3, 0, 15);
INSERT INTO `c_seat` VALUES (565, 7, 3, 0, 16);
INSERT INTO `c_seat` VALUES (566, 7, 3, 0, 17);
INSERT INTO `c_seat` VALUES (567, 7, 3, 0, 18);
INSERT INTO `c_seat` VALUES (568, 7, 4, 0, 10);
INSERT INTO `c_seat` VALUES (569, 7, 4, 0, 11);
INSERT INTO `c_seat` VALUES (570, 7, 4, 0, 12);
INSERT INTO `c_seat` VALUES (571, 7, 4, 0, 13);
INSERT INTO `c_seat` VALUES (572, 7, 4, 0, 14);
INSERT INTO `c_seat` VALUES (573, 7, 4, 0, 15);
INSERT INTO `c_seat` VALUES (574, 7, 4, 0, 16);
INSERT INTO `c_seat` VALUES (575, 7, 4, 0, 17);
INSERT INTO `c_seat` VALUES (576, 7, 4, 0, 18);
INSERT INTO `c_seat` VALUES (577, 7, 5, 0, 10);
INSERT INTO `c_seat` VALUES (578, 7, 5, 0, 11);
INSERT INTO `c_seat` VALUES (579, 7, 5, 0, 12);
INSERT INTO `c_seat` VALUES (580, 7, 5, 0, 13);
INSERT INTO `c_seat` VALUES (581, 7, 5, 0, 14);
INSERT INTO `c_seat` VALUES (582, 7, 5, 0, 15);
INSERT INTO `c_seat` VALUES (583, 7, 5, 0, 16);
INSERT INTO `c_seat` VALUES (584, 7, 5, 0, 17);
INSERT INTO `c_seat` VALUES (585, 7, 5, 0, 18);
INSERT INTO `c_seat` VALUES (586, 7, 6, 0, 10);
INSERT INTO `c_seat` VALUES (587, 7, 6, 0, 11);
INSERT INTO `c_seat` VALUES (588, 7, 6, 0, 12);
INSERT INTO `c_seat` VALUES (589, 7, 6, 0, 13);
INSERT INTO `c_seat` VALUES (590, 7, 6, 0, 14);
INSERT INTO `c_seat` VALUES (591, 7, 6, 0, 15);
INSERT INTO `c_seat` VALUES (592, 7, 6, 0, 16);
INSERT INTO `c_seat` VALUES (593, 7, 6, 0, 17);
INSERT INTO `c_seat` VALUES (594, 7, 6, 0, 18);
INSERT INTO `c_seat` VALUES (595, 7, 7, 0, 10);
INSERT INTO `c_seat` VALUES (596, 7, 7, 0, 11);
INSERT INTO `c_seat` VALUES (597, 7, 7, 0, 12);
INSERT INTO `c_seat` VALUES (598, 7, 7, 0, 13);
INSERT INTO `c_seat` VALUES (599, 7, 7, 0, 14);
INSERT INTO `c_seat` VALUES (600, 7, 7, 0, 15);
INSERT INTO `c_seat` VALUES (601, 7, 7, 0, 16);
INSERT INTO `c_seat` VALUES (602, 7, 7, 0, 17);
INSERT INTO `c_seat` VALUES (603, 7, 7, 0, 18);
INSERT INTO `c_seat` VALUES (604, 7, 8, 0, 10);
INSERT INTO `c_seat` VALUES (605, 7, 8, 0, 11);
INSERT INTO `c_seat` VALUES (606, 7, 8, 0, 12);
INSERT INTO `c_seat` VALUES (607, 7, 8, 0, 13);
INSERT INTO `c_seat` VALUES (608, 7, 8, 0, 14);
INSERT INTO `c_seat` VALUES (609, 7, 8, 0, 15);
INSERT INTO `c_seat` VALUES (610, 7, 8, 0, 16);
INSERT INTO `c_seat` VALUES (611, 7, 8, 0, 17);
INSERT INTO `c_seat` VALUES (612, 7, 8, 0, 18);
INSERT INTO `c_seat` VALUES (613, 7, 9, 0, 10);
INSERT INTO `c_seat` VALUES (614, 7, 9, 0, 11);
INSERT INTO `c_seat` VALUES (615, 7, 9, 0, 12);
INSERT INTO `c_seat` VALUES (616, 7, 9, 0, 13);
INSERT INTO `c_seat` VALUES (617, 7, 9, 0, 14);
INSERT INTO `c_seat` VALUES (618, 7, 9, 0, 15);
INSERT INTO `c_seat` VALUES (619, 7, 9, 0, 16);
INSERT INTO `c_seat` VALUES (620, 7, 9, 0, 17);
INSERT INTO `c_seat` VALUES (621, 7, 9, 0, 18);
INSERT INTO `c_seat` VALUES (622, 7, 10, 0, 10);
INSERT INTO `c_seat` VALUES (623, 7, 10, 0, 11);
INSERT INTO `c_seat` VALUES (624, 7, 10, 0, 12);
INSERT INTO `c_seat` VALUES (625, 7, 10, 0, 13);
INSERT INTO `c_seat` VALUES (626, 7, 10, 0, 14);
INSERT INTO `c_seat` VALUES (627, 7, 10, 0, 15);
INSERT INTO `c_seat` VALUES (628, 7, 10, 0, 16);
INSERT INTO `c_seat` VALUES (629, 7, 10, 0, 17);
INSERT INTO `c_seat` VALUES (630, 7, 10, 0, 18);
INSERT INTO `c_seat` VALUES (631, 8, 1, 0, 10);
INSERT INTO `c_seat` VALUES (632, 8, 1, 0, 11);
INSERT INTO `c_seat` VALUES (633, 8, 1, 0, 12);
INSERT INTO `c_seat` VALUES (634, 8, 1, 0, 13);
INSERT INTO `c_seat` VALUES (635, 8, 1, 0, 14);
INSERT INTO `c_seat` VALUES (636, 8, 1, 0, 15);
INSERT INTO `c_seat` VALUES (637, 8, 1, 0, 16);
INSERT INTO `c_seat` VALUES (638, 8, 1, 0, 17);
INSERT INTO `c_seat` VALUES (639, 8, 1, 0, 18);
INSERT INTO `c_seat` VALUES (640, 8, 2, 0, 10);
INSERT INTO `c_seat` VALUES (641, 8, 2, 0, 11);
INSERT INTO `c_seat` VALUES (642, 8, 2, 0, 12);
INSERT INTO `c_seat` VALUES (643, 8, 2, 0, 13);
INSERT INTO `c_seat` VALUES (644, 8, 2, 0, 14);
INSERT INTO `c_seat` VALUES (645, 8, 2, 0, 15);
INSERT INTO `c_seat` VALUES (646, 8, 2, 0, 16);
INSERT INTO `c_seat` VALUES (647, 8, 2, 0, 17);
INSERT INTO `c_seat` VALUES (648, 8, 2, 0, 18);
INSERT INTO `c_seat` VALUES (649, 8, 3, 0, 10);
INSERT INTO `c_seat` VALUES (650, 8, 3, 0, 11);
INSERT INTO `c_seat` VALUES (651, 8, 3, 0, 12);
INSERT INTO `c_seat` VALUES (652, 8, 3, 0, 13);
INSERT INTO `c_seat` VALUES (653, 8, 3, 0, 14);
INSERT INTO `c_seat` VALUES (654, 8, 3, 0, 15);
INSERT INTO `c_seat` VALUES (655, 8, 3, 0, 16);
INSERT INTO `c_seat` VALUES (656, 8, 3, 0, 17);
INSERT INTO `c_seat` VALUES (657, 8, 3, 0, 18);
INSERT INTO `c_seat` VALUES (658, 8, 4, 0, 10);
INSERT INTO `c_seat` VALUES (659, 8, 4, 0, 11);
INSERT INTO `c_seat` VALUES (660, 8, 4, 0, 12);
INSERT INTO `c_seat` VALUES (661, 8, 4, 0, 13);
INSERT INTO `c_seat` VALUES (662, 8, 4, 0, 14);
INSERT INTO `c_seat` VALUES (663, 8, 4, 0, 15);
INSERT INTO `c_seat` VALUES (664, 8, 4, 0, 16);
INSERT INTO `c_seat` VALUES (665, 8, 4, 0, 17);
INSERT INTO `c_seat` VALUES (666, 8, 4, 0, 18);
INSERT INTO `c_seat` VALUES (667, 8, 5, 0, 10);
INSERT INTO `c_seat` VALUES (668, 8, 5, 0, 11);
INSERT INTO `c_seat` VALUES (669, 8, 5, 0, 12);
INSERT INTO `c_seat` VALUES (670, 8, 5, 0, 13);
INSERT INTO `c_seat` VALUES (671, 8, 5, 0, 14);
INSERT INTO `c_seat` VALUES (672, 8, 5, 0, 15);
INSERT INTO `c_seat` VALUES (673, 8, 5, 0, 16);
INSERT INTO `c_seat` VALUES (674, 8, 5, 0, 17);
INSERT INTO `c_seat` VALUES (675, 8, 5, 0, 18);
INSERT INTO `c_seat` VALUES (676, 8, 6, 0, 10);
INSERT INTO `c_seat` VALUES (677, 8, 6, 0, 11);
INSERT INTO `c_seat` VALUES (678, 8, 6, 0, 12);
INSERT INTO `c_seat` VALUES (679, 8, 6, 0, 13);
INSERT INTO `c_seat` VALUES (680, 8, 6, 0, 14);
INSERT INTO `c_seat` VALUES (681, 8, 6, 0, 15);
INSERT INTO `c_seat` VALUES (682, 8, 6, 0, 16);
INSERT INTO `c_seat` VALUES (683, 8, 6, 0, 17);
INSERT INTO `c_seat` VALUES (684, 8, 6, 0, 18);
INSERT INTO `c_seat` VALUES (685, 8, 7, 0, 10);
INSERT INTO `c_seat` VALUES (686, 8, 7, 0, 11);
INSERT INTO `c_seat` VALUES (687, 8, 7, 0, 12);
INSERT INTO `c_seat` VALUES (688, 8, 7, 0, 13);
INSERT INTO `c_seat` VALUES (689, 8, 7, 0, 14);
INSERT INTO `c_seat` VALUES (690, 8, 7, 0, 15);
INSERT INTO `c_seat` VALUES (691, 8, 7, 0, 16);
INSERT INTO `c_seat` VALUES (692, 8, 7, 0, 17);
INSERT INTO `c_seat` VALUES (693, 8, 7, 0, 18);
INSERT INTO `c_seat` VALUES (694, 8, 8, 0, 10);
INSERT INTO `c_seat` VALUES (695, 8, 8, 0, 11);
INSERT INTO `c_seat` VALUES (696, 8, 8, 0, 12);
INSERT INTO `c_seat` VALUES (697, 8, 8, 0, 13);
INSERT INTO `c_seat` VALUES (698, 8, 8, 0, 14);
INSERT INTO `c_seat` VALUES (699, 8, 8, 0, 15);
INSERT INTO `c_seat` VALUES (700, 8, 8, 0, 16);
INSERT INTO `c_seat` VALUES (701, 8, 8, 0, 17);
INSERT INTO `c_seat` VALUES (702, 8, 8, 0, 18);
INSERT INTO `c_seat` VALUES (703, 8, 9, 0, 10);
INSERT INTO `c_seat` VALUES (704, 8, 9, 0, 11);
INSERT INTO `c_seat` VALUES (705, 8, 9, 0, 12);
INSERT INTO `c_seat` VALUES (706, 8, 9, 0, 13);
INSERT INTO `c_seat` VALUES (707, 8, 9, 0, 14);
INSERT INTO `c_seat` VALUES (708, 8, 9, 0, 15);
INSERT INTO `c_seat` VALUES (709, 8, 9, 0, 16);
INSERT INTO `c_seat` VALUES (710, 8, 9, 0, 17);
INSERT INTO `c_seat` VALUES (711, 8, 9, 0, 18);
INSERT INTO `c_seat` VALUES (712, 8, 10, 0, 10);
INSERT INTO `c_seat` VALUES (713, 8, 10, 0, 11);
INSERT INTO `c_seat` VALUES (714, 8, 10, 0, 12);
INSERT INTO `c_seat` VALUES (715, 8, 10, 0, 13);
INSERT INTO `c_seat` VALUES (716, 8, 10, 0, 14);
INSERT INTO `c_seat` VALUES (717, 8, 10, 0, 15);
INSERT INTO `c_seat` VALUES (718, 8, 10, 0, 16);
INSERT INTO `c_seat` VALUES (719, 8, 10, 0, 17);
INSERT INTO `c_seat` VALUES (720, 8, 10, 0, 18);
INSERT INTO `c_seat` VALUES (721, 9, 1, 0, 10);
INSERT INTO `c_seat` VALUES (722, 9, 1, 0, 11);
INSERT INTO `c_seat` VALUES (723, 9, 1, 0, 12);
INSERT INTO `c_seat` VALUES (724, 9, 1, 0, 13);
INSERT INTO `c_seat` VALUES (725, 9, 1, 0, 14);
INSERT INTO `c_seat` VALUES (726, 9, 1, 0, 15);
INSERT INTO `c_seat` VALUES (727, 9, 1, 0, 16);
INSERT INTO `c_seat` VALUES (728, 9, 1, 0, 17);
INSERT INTO `c_seat` VALUES (729, 9, 1, 0, 18);
INSERT INTO `c_seat` VALUES (730, 9, 2, 0, 10);
INSERT INTO `c_seat` VALUES (731, 9, 2, 0, 11);
INSERT INTO `c_seat` VALUES (732, 9, 2, 0, 12);
INSERT INTO `c_seat` VALUES (733, 9, 2, 0, 13);
INSERT INTO `c_seat` VALUES (734, 9, 2, 0, 14);
INSERT INTO `c_seat` VALUES (735, 9, 2, 0, 15);
INSERT INTO `c_seat` VALUES (736, 9, 2, 0, 16);
INSERT INTO `c_seat` VALUES (737, 9, 2, 0, 17);
INSERT INTO `c_seat` VALUES (738, 9, 2, 0, 18);
INSERT INTO `c_seat` VALUES (739, 9, 3, 0, 10);
INSERT INTO `c_seat` VALUES (740, 9, 3, 0, 11);
INSERT INTO `c_seat` VALUES (741, 9, 3, 0, 12);
INSERT INTO `c_seat` VALUES (742, 9, 3, 0, 13);
INSERT INTO `c_seat` VALUES (743, 9, 3, 0, 14);
INSERT INTO `c_seat` VALUES (744, 9, 3, 0, 15);
INSERT INTO `c_seat` VALUES (745, 9, 3, 0, 16);
INSERT INTO `c_seat` VALUES (746, 9, 3, 0, 17);
INSERT INTO `c_seat` VALUES (747, 9, 3, 0, 18);
INSERT INTO `c_seat` VALUES (748, 9, 4, 0, 10);
INSERT INTO `c_seat` VALUES (749, 9, 4, 0, 11);
INSERT INTO `c_seat` VALUES (750, 9, 4, 0, 12);
INSERT INTO `c_seat` VALUES (751, 9, 4, 0, 13);
INSERT INTO `c_seat` VALUES (752, 9, 4, 0, 14);
INSERT INTO `c_seat` VALUES (753, 9, 4, 0, 15);
INSERT INTO `c_seat` VALUES (754, 9, 4, 0, 16);
INSERT INTO `c_seat` VALUES (755, 9, 4, 0, 17);
INSERT INTO `c_seat` VALUES (756, 9, 4, 0, 18);
INSERT INTO `c_seat` VALUES (757, 9, 5, 0, 10);
INSERT INTO `c_seat` VALUES (758, 9, 5, 0, 11);
INSERT INTO `c_seat` VALUES (759, 9, 5, 0, 12);
INSERT INTO `c_seat` VALUES (760, 9, 5, 1, 13);
INSERT INTO `c_seat` VALUES (761, 9, 5, 0, 14);
INSERT INTO `c_seat` VALUES (762, 9, 5, 0, 15);
INSERT INTO `c_seat` VALUES (763, 9, 5, 0, 16);
INSERT INTO `c_seat` VALUES (764, 9, 5, 0, 17);
INSERT INTO `c_seat` VALUES (765, 9, 5, 0, 18);
INSERT INTO `c_seat` VALUES (766, 9, 6, 0, 10);
INSERT INTO `c_seat` VALUES (767, 9, 6, 0, 11);
INSERT INTO `c_seat` VALUES (768, 9, 6, 0, 12);
INSERT INTO `c_seat` VALUES (769, 9, 6, 1, 13);
INSERT INTO `c_seat` VALUES (770, 9, 6, 0, 14);
INSERT INTO `c_seat` VALUES (771, 9, 6, 0, 15);
INSERT INTO `c_seat` VALUES (772, 9, 6, 0, 16);
INSERT INTO `c_seat` VALUES (773, 9, 6, 0, 17);
INSERT INTO `c_seat` VALUES (774, 9, 6, 0, 18);
INSERT INTO `c_seat` VALUES (775, 9, 7, 0, 10);
INSERT INTO `c_seat` VALUES (776, 9, 7, 0, 11);
INSERT INTO `c_seat` VALUES (777, 9, 7, 0, 12);
INSERT INTO `c_seat` VALUES (778, 9, 7, 1, 13);
INSERT INTO `c_seat` VALUES (779, 9, 7, 0, 14);
INSERT INTO `c_seat` VALUES (780, 9, 7, 0, 15);
INSERT INTO `c_seat` VALUES (781, 9, 7, 0, 16);
INSERT INTO `c_seat` VALUES (782, 9, 7, 0, 17);
INSERT INTO `c_seat` VALUES (783, 9, 7, 0, 18);
INSERT INTO `c_seat` VALUES (784, 9, 8, 0, 10);
INSERT INTO `c_seat` VALUES (785, 9, 8, 0, 11);
INSERT INTO `c_seat` VALUES (786, 9, 8, 0, 12);
INSERT INTO `c_seat` VALUES (787, 9, 8, 0, 13);
INSERT INTO `c_seat` VALUES (788, 9, 8, 0, 14);
INSERT INTO `c_seat` VALUES (789, 9, 8, 0, 15);
INSERT INTO `c_seat` VALUES (790, 9, 8, 0, 16);
INSERT INTO `c_seat` VALUES (791, 9, 8, 0, 17);
INSERT INTO `c_seat` VALUES (792, 9, 8, 0, 18);
INSERT INTO `c_seat` VALUES (793, 9, 9, 0, 10);
INSERT INTO `c_seat` VALUES (794, 9, 9, 0, 11);
INSERT INTO `c_seat` VALUES (795, 9, 9, 0, 12);
INSERT INTO `c_seat` VALUES (796, 9, 9, 0, 13);
INSERT INTO `c_seat` VALUES (797, 9, 9, 0, 14);
INSERT INTO `c_seat` VALUES (798, 9, 9, 0, 15);
INSERT INTO `c_seat` VALUES (799, 9, 9, 0, 16);
INSERT INTO `c_seat` VALUES (800, 9, 9, 0, 17);
INSERT INTO `c_seat` VALUES (801, 9, 9, 0, 18);
INSERT INTO `c_seat` VALUES (802, 9, 10, 0, 10);
INSERT INTO `c_seat` VALUES (803, 9, 10, 0, 11);
INSERT INTO `c_seat` VALUES (804, 9, 10, 0, 12);
INSERT INTO `c_seat` VALUES (805, 9, 10, 0, 13);
INSERT INTO `c_seat` VALUES (806, 9, 10, 0, 14);
INSERT INTO `c_seat` VALUES (807, 9, 10, 0, 15);
INSERT INTO `c_seat` VALUES (808, 9, 10, 0, 16);
INSERT INTO `c_seat` VALUES (809, 9, 10, 0, 17);
INSERT INTO `c_seat` VALUES (810, 9, 10, 0, 18);

-- ----------------------------
-- Table structure for c_ticket
-- ----------------------------
DROP TABLE IF EXISTS `c_ticket`;
CREATE TABLE `c_ticket`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评分',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上映时间',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `actor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主演',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上映地点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_ticket
-- ----------------------------
INSERT INTO `c_ticket` VALUES (1, '无问西东', '8.5', '2020年4月25日', '爱情/喜剧', '影片讲述了四个不同时代却同样出自清华大学的年轻人，对青春满怀期待，也因为时代变革在矛盾与挣扎中一路前行，最终找寻到真实自我的故事', '/static/1.jpg', '章子怡，黄晓明，张震，王力宏，陈楚生，铁政', '中国大陆/120分钟');
INSERT INTO `c_ticket` VALUES (2, '至暗时刻', '7.9', '2017年9月10日', '传记/历史', '该片讲述二战时面临来自内部的偏见与外部的法西斯战争，温斯顿·丘吉尔抵住压力，带领英国人民奋起反抗，赢得敦刻尔克战役的胜利，度过了黎明前最黑暗的时刻的故事', '/static/2.jpg', '加里·奥德曼，莉莉·詹姆斯，本·门德尔森，克里斯汀', '中国大陆/135分钟');
INSERT INTO `c_ticket` VALUES (3, '寄生虫', '9.1', '2019年5月21日', '剧情片', '影片讲述住在廉价的半地下室出租房里的一家四口，原本均是无业游民。在长子基宇隐瞒真实学历，去一户住着豪宅的富有家庭担任家教后，一家人的生活渐渐起了变化', '/static/3.jpg', '宋康昊，李善均，崔宇植，赵茹珍，朴素丹', '中国大陆/132分钟');
INSERT INTO `c_ticket` VALUES (4, '误杀', '7.7', '2019年12月13日', '剧情/悬疑/犯罪', '李维杰与妻子阿玉来泰打拼17年，膝下育有两个女儿，年届四十的他靠开设网络公司为生，为人也颇得小镇居民的好感，而这一切美好却被突如其来的不速之客打破。这个充斥走私，贩毒活动的边陲小镇，各种权力交织碾压公平正义。李维杰的大女儿被督察长的儿子强暴，因反抗误杀对方。李维杰曾亲眼 目睹督察长滥用私刑，深知法律无用，为了维护女儿，捍卫家人，李维杰埋尸掩盖一切证据，在时间与空间的交错缝隙中，与警方在身心层面，展开了殊死一搏的较量。', '/static/4.jpg', '肖央 / 谭卓 / 陈冲 / 姜皓文 / 秦沛 ', '中国大陆/112分钟');

-- ----------------------------
-- Table structure for c_ticket_join
-- ----------------------------
DROP TABLE IF EXISTS `c_ticket_join`;
CREATE TABLE `c_ticket_join`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticketId` int(10) NULL DEFAULT NULL,
  `cinemaId` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_ticket_join
-- ----------------------------
INSERT INTO `c_ticket_join` VALUES (1, 1, 1);
INSERT INTO `c_ticket_join` VALUES (2, 2, 1);
INSERT INTO `c_ticket_join` VALUES (3, 3, 1);
INSERT INTO `c_ticket_join` VALUES (4, 4, 1);
INSERT INTO `c_ticket_join` VALUES (5, 1, 2);
INSERT INTO `c_ticket_join` VALUES (6, 2, 2);
INSERT INTO `c_ticket_join` VALUES (7, 3, 2);
INSERT INTO `c_ticket_join` VALUES (8, 4, 2);
INSERT INTO `c_ticket_join` VALUES (9, 1, 3);
INSERT INTO `c_ticket_join` VALUES (10, 2, 3);
INSERT INTO `c_ticket_join` VALUES (11, 3, 3);
INSERT INTO `c_ticket_join` VALUES (12, 1, 4);
INSERT INTO `c_ticket_join` VALUES (13, 2, 4);

-- ----------------------------
-- Table structure for c_ticket_time
-- ----------------------------
DROP TABLE IF EXISTS `c_ticket_time`;
CREATE TABLE `c_ticket_time`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticketId` int(10) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `room` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_ticket_time
-- ----------------------------
INSERT INTO `c_ticket_time` VALUES (10, 1, 35.00, '14:05', '国语', '2号厅');
INSERT INTO `c_ticket_time` VALUES (11, 1, 35.00, '15:22', '国语', '3号厅');
INSERT INTO `c_ticket_time` VALUES (12, 2, 40.00, '18:00', '英语', '2号厅');
INSERT INTO `c_ticket_time` VALUES (13, 2, 35.00, '15:22', '英语', '5号厅');
INSERT INTO `c_ticket_time` VALUES (14, 3, 40.00, '19:00', '英语', '5号厅');
INSERT INTO `c_ticket_time` VALUES (15, 3, 45.00, '20:20', '英语', '6号厅');
INSERT INTO `c_ticket_time` VALUES (16, 4, 30.00, '11:20', '国语', '1号厅');
INSERT INTO `c_ticket_time` VALUES (17, 4, 30.00, '14:20', '国语', '2号厅');
INSERT INTO `c_ticket_time` VALUES (18, 4, 30.00, '18:20', '国语', '2号厅');

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `collect` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES (2, 'user', '123456', '卢本伟', '1');
INSERT INTO `c_user` VALUES (4, 'admin', '123456', '呵呵哒', NULL);

SET FOREIGN_KEY_CHECKS = 1;
