-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- 服务器版本: 5.1.29
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_department` (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '科室id',
  `departmentName` varchar(20)  NOT NULL COMMENT '科室名称',
  `departmentDesc` varchar(5000)  NULL COMMENT '科室介绍',
  `birthDate` varchar(20)  NULL COMMENT '成立日期',
  `chargeMan` varchar(20)  NULL COMMENT '负责人',
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_doctor` (
  `doctorNumber` varchar(20)  NOT NULL COMMENT 'doctorNumber',
  `password` varchar(20)  NULL COMMENT '登录密码',
  `departmentObj` int(11) NOT NULL COMMENT '所在科室',
  `doctorName` varchar(20)  NOT NULL COMMENT '医生姓名',
  `sex` varchar(4)  NOT NULL COMMENT '性别',
  `doctorPhoto` varchar(60)  NOT NULL COMMENT '医生照片',
  `birthDate` varchar(20)  NULL COMMENT '出生日期',
  `position` varchar(20)  NOT NULL COMMENT '医生职位',
  `experience` varchar(20)  NOT NULL COMMENT '工作经验',
  `contactWay` varchar(20)  NULL COMMENT '联系方式',
  `goodAt` varchar(200)  NULL COMMENT '擅长',
  `doctorDesc` varchar(8000)  NOT NULL COMMENT '医生介绍',
  PRIMARY KEY (`doctorNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_patient` (
  `patientId` int(11) NOT NULL AUTO_INCREMENT COMMENT '病人id',
  `doctorObj` varchar(20)  NOT NULL COMMENT '医生',
  `patientName` varchar(20)  NOT NULL COMMENT '病人姓名',
  `sex` varchar(4)  NOT NULL COMMENT '性别',
  `cardNumber` varchar(30)  NOT NULL COMMENT '身份证号',
  `telephone` varchar(20)  NOT NULL COMMENT '联系电话',
  `illnessCase` varchar(8000)  NOT NULL COMMENT '病人病例',
  `addTime` varchar(20)  NULL COMMENT '登记时间',
  PRIMARY KEY (`patientId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_orderInfo` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约id',
  `userObj` varchar(30)  NOT NULL COMMENT '预约用户',
  `doctorObj` varchar(20)  NOT NULL COMMENT '预约医生',
  `orderDate` varchar(20)  NULL COMMENT '预约日期',
  `timeInterval` varchar(20)  NOT NULL COMMENT '时段',
  `telephone` varchar(20)  NOT NULL COMMENT '联系电话',
  `orderTime` varchar(20)  NULL COMMENT '下单时间',
  `checkState` varchar(20)  NOT NULL COMMENT '处理状态',
  `replyContent` varchar(800)  NOT NULL COMMENT '医生回复',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_news` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻id',
  `newsTitle` varchar(100)  NOT NULL COMMENT '新闻标题',
  `newsPhoto` varchar(60)  NOT NULL COMMENT '新闻图片',
  `newsContent` varchar(8000)  NOT NULL COMMENT '新闻内容',
  `newsDate` varchar(20)  NULL COMMENT '新闻日期',
  `newsFrom` varchar(30)  NULL COMMENT '新闻来源',
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_leaveword` (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `leaveTitle` varchar(80)  NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000)  NOT NULL COMMENT '留言内容',
  `userObj` varchar(30)  NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20)  NULL COMMENT '留言时间',
  `replyContent` varchar(1000)  NULL COMMENT '管理回复',
  `replyTime` varchar(20)  NULL COMMENT '回复时间',
  PRIMARY KEY (`leaveWordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '登录密码',
  `name` varchar(20)  NOT NULL COMMENT '姓名',
  `gender` varchar(4)  NOT NULL COMMENT '性别',
  `birthDate` varchar(20)  NULL COMMENT '出生日期',
  `userPhoto` varchar(60)  NOT NULL COMMENT '用户照片',
  `telephone` varchar(20)  NOT NULL COMMENT '联系电话',
  `email` varchar(50)  NOT NULL COMMENT '邮箱',
  `address` varchar(80)  NULL COMMENT '家庭地址',
  `regTime` varchar(20)  NULL COMMENT '注册时间',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE t_doctor ADD CONSTRAINT FOREIGN KEY (departmentObj) REFERENCES t_department(departmentId);
ALTER TABLE t_patient ADD CONSTRAINT FOREIGN KEY (doctorObj) REFERENCES t_doctor(doctorNumber);
ALTER TABLE t_orderInfo ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_orderInfo ADD CONSTRAINT FOREIGN KEY (doctorObj) REFERENCES t_doctor(doctorNumber);
ALTER TABLE t_leaveword ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


