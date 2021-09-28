-- 1,2题
CREATE TABLE `group_info`  (
  `record_date` datetime NULL DEFAULT NULL,
  `game_id` int NULL DEFAULT NULL,
  `group_member_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_info
-- ----------------------------
INSERT INTO `group_info` VALUES ('2021-09-24 10:20:20', 1002, 'account_1,2343,\"小可爱\";account_2,3456,\"大老板\";account_99,2423,\"就这\"');
INSERT INTO `group_info` VALUES ('2021-09-12 10:20:20', 1865, 'account_45,758,\"小九\";account_34,3212,\"公主殿下\";account_99,2423,\"就这\";account_36,85341,\"喵喵“');
INSERT INTO `group_info` VALUES ('2021-09-24 11:20:20', 1003, 'account_6,3454,\"小1\";account_2,3456,\"大老板\";account_99,2423,\"就这\"');
INSERT INTO `group_info` VALUES ('2021-09-12 11:20:20', 1866, 'account_45,758,\"小九\";account_34,3212,\"公主殿下\";account_99,2423,\"就这\";account_36,85341,\"喵喵“');

-- ----------------------------
-- Table structure for group_result
-- ----------------------------
DROP TABLE IF EXISTS `group_result`;
CREATE TABLE `group_result`  (
  `record_date` datetime NULL DEFAULT NULL,
  `game_id` int NULL DEFAULT NULL,
  `score_after` int NULL DEFAULT NULL,
  `score_before` int NULL DEFAULT NULL,
  `result` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_result
-- ----------------------------
INSERT INTO `group_result` VALUES ('2021-09-24 10:20:20', 1002, 433, -50, 2);
INSERT INTO `group_result` VALUES ('2021-09-12 10:20:20', 1865, 786, 100, 1);
INSERT INTO `group_result` VALUES ('2021-09-24 11:20:20', 1003, 533, 100, 1);
INSERT INTO `group_result` VALUES ('2021-09-12 11:20:20', 1866, 886, 100, 1);


--- 3,4题

create table player_loginout_log(
record_date datetime,
account_id varchar(20),
login_type int
);

create table player_play_log(
record_date datetime,
account_id varchar(20),
game_type char(1),
status int
);

insert into player_loginout_log values('2021-06-11 18:26:08','account_23', 1);
insert into player_loginout_log values('2021-06-11 23:20:36','account_23', 2);
insert into player_loginout_log values('2021-06-12 18:48:50','account_23', 1);
insert into player_loginout_log values('2021-06-12 21:23:53','account_23', 2);
insert into player_loginout_log values('2021-06-11 10:46:09','account_44', 1);
insert into player_loginout_log values('2021-06-11 22:21:16','account_44', 2);

insert into player_loginout_log values('2021-06-13 12:48:50','account_23', 1);
insert into player_loginout_log values('2021-06-13 21:23:53','account_23', 2);

insert into player_loginout_log values('2021-06-14 12:48:50','account_21', 1);
insert into player_loginout_log values('2021-06-14 21:23:53','account_21', 2);
insert into player_loginout_log values('2021-06-12 18:48:50','account_21', 1);
insert into player_loginout_log values('2021-06-12 21:23:53','account_21', 2);

insert into player_loginout_log values('2021-06-12 18:48:50','account_22', 1);
insert into player_loginout_log values('2021-06-12 21:23:53','account_22', 2);


insert into player_play_log values('2021-06-11 18:33:06','account_23','A',1);
insert into player_play_log values('2021-06-11 19:07:22','account_23','A',2);
insert into player_play_log values('2021-06-12 18:59:11','account_23','A',1);
insert into player_play_log values('2021-06-12 20:06:52','account_23','A',2);
insert into player_play_log values('2021-06-12 20:07:13','account_23','A',1);
insert into player_play_log values('2021-06-12 20:20:05','account_23','A',2);

insert into player_play_log values('2021-06-13 18:59:11','account_23','A',1);
insert into player_play_log values('2021-06-13 20:06:52','account_23','A',2);
insert into player_play_log values('2021-06-13 20:07:13','account_23','A',1);
insert into player_play_log values('2021-06-13 20:20:05','account_23','A',2);

insert into player_play_log values('2021-06-11 10:49:22','account_44','B',1);
insert into player_play_log values('2021-06-11 22:11:16','account_44','B',2);


insert into player_play_log values('2021-06-14 10:49:22','account_21','B',1);
insert into player_play_log values('2021-06-14 22:11:16','account_21','B',2);
insert into player_play_log values('2021-06-13 18:59:11','account_21','A',1);
insert into player_play_log values('2021-06-13 20:06:52','account_21','A',2);
insert into player_play_log values('2021-06-13 20:07:13','account_21','A',1);
insert into player_play_log values('2021-06-13 20:20:05','account_21','A',2);

