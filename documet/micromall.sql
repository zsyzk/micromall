/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : micromall_db

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2016-06-13 15:30:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hcc_tb_account`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_account`;
CREATE TABLE `hcc_tb_account` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `acc_total` decimal(20,2) DEFAULT NULL COMMENT '单位：M',
  `acc_current` decimal(20,2) DEFAULT NULL COMMENT '单位：M',
  `state` int(11) DEFAULT NULL COMMENT '0:无效\r\n            1:有效\r\n            2:锁定',
  `acc_area_type` varchar(5) DEFAULT NULL,
  `acc_carrier` varchar(5) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`acc_id`),
  UNIQUE KEY `hoo_idx_account_user_id` (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_account
-- ----------------------------

-- ----------------------------
-- Table structure for `hcc_tb_account_detail`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_account_detail`;
CREATE TABLE `hcc_tb_account_detail` (
  `acc_detail_id` int(11) NOT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `acc_area` varchar(5) DEFAULT NULL,
  `acc_carrier` varchar(5) DEFAULT NULL,
  `acc_channel_from` varchar(10) DEFAULT NULL COMMENT 'web\r\n            app\r\n            wx\r\n            wap\r\n            具体参见渠道管理',
  `acc_active` varchar(10) DEFAULT NULL COMMENT '1下载app/点击广告/发布消息...\r\n            2.赠送/购买...',
  `acc_value` decimal(20,2) DEFAULT NULL,
  `state` smallint(2) DEFAULT NULL COMMENT '0  未使用\r\n            1  已使用\r\n            2  过期\r\n            \r\n            ',
  `valid_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `detail_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`acc_detail_id`),
  UNIQUE KEY `hoo_idx_account_detail_acc_id` (`acc_id`),
  UNIQUE KEY `hoo_idx_account_detail_crea_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_account_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `hcc_tb_account_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_account_recharge`;
CREATE TABLE `hcc_tb_account_recharge` (
  `acc_recharge_id` int(11) NOT NULL,
  `recharge_type` varchar(10) DEFAULT NULL COMMENT '1、使用\r\n            2、转换\r\n            3、赠送\r\n            4、作废\r\n            5、过期\r\n            参数配置表 FLOW_OPER_TYPE;',
  `rule_id` int(11) DEFAULT NULL,
  `source_acc_id` int(11) DEFAULT NULL,
  `source_detail_id` int(11) DEFAULT NULL,
  `dest_acc_id` int(11) DEFAULT NULL,
  `dest_detail_id` int(11) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `recharge_user` int(11) DEFAULT NULL,
  `oper_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`acc_recharge_id`),
  UNIQUE KEY `hoo_idx_account_recharge_id` (`acc_recharge_id`),
  UNIQUE KEY `hoo_idx_account_recharge_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量币交易记录';

-- ----------------------------
-- Records of hcc_tb_account_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for `hcc_tb_account_rule`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_account_rule`;
CREATE TABLE `hcc_tb_account_rule` (
  `acc_rule_id` int(11) NOT NULL,
  `acc_rule_name` varchar(32) DEFAULT NULL,
  `acc_rule_type` int(11) DEFAULT NULL COMMENT '1.赠送\r\n            2.转换\r\n            参考参数配置表中的类型：RULE_TYPE  的配置数据\r\n            ',
  `rate` decimal(10,2) DEFAULT NULL COMMENT '格式：10:1  \r\n            意义：10M兑换成1M',
  `acc_rule_desc` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `mod_date` datetime DEFAULT NULL,
  `mod_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`acc_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量使用规则配置';

-- ----------------------------
-- Records of hcc_tb_account_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `hcc_tb_area_bigimg`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_area_bigimg`;
CREATE TABLE `hcc_tb_area_bigimg` (
  `bigimgid` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` int(11) DEFAULT NULL,
  `bigimg` varchar(256) DEFAULT NULL,
  `imgtype` int(11) DEFAULT NULL COMMENT '1：小图片 smail\r\n            2：中图片 middle\r\n            3：大图片 hdpi',
  `state` int(11) DEFAULT '1' COMMENT '1：正常\r\n            0：删除',
  PRIMARY KEY (`bigimgid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_area_bigimg
-- ----------------------------
INSERT INTO `hcc_tb_area_bigimg` VALUES ('1', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4h2AbrPQAAKumcZv4UQ940.png', '1', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('2', '5', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb3pOAWUhVAAH2XJ-uq4Y990.png', '1', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('3', '403', 'http://img1.uhuibao.com/M00/03/7F/05qaYVOOrpmAIAZqAAkVVGMybN8392.png', '1', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('4', '403', 'http://img1.uhuibao.com/M00/03/7F/05qaYVOOrqmAekEiAAvqH_kipG8996.png', '2', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('5', '403', 'http://img1.uhuibao.com/M00/03/7F/05qaYVOOrqGAOQ6uAAl5WLU-YRY559.png', '3', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('6', '404', 'http://img1.uhuibao.com/M00/03/7F/05qaYVOOsFqAX7dPAAvWFkcZHjA559.png', '1', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('7', '404', 'http://img1.uhuibao.com/M00/03/7F/05qaYVOOsJWAR_q7AAvea_OGt2M716.png', '2', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('8', '404', 'http://img1.uhuibao.com/M00/03/7F/05qaYVOOsJ6AZLV9AAiQfKHDaaQ558.png', '3', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('9', '5', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb3xGAcggGAAPDsVTkhEo026.png', '2', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('10', '5', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb30CAAUs9AAZnn_WLZH4654.png', '3', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('11', '5', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb32CAO5AiAAUnHd1wioQ956.png', '4', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('12', '5', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4PyAZEBIAAW9jYUJ56U762.png', '5', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('13', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4oiAfiS5AAV75Mu2dLY772.png', '2', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('14', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4uiAJjCjAAmsyal9G8g389.png', '3', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('15', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4xGAVUe-AAdfD3wCI5g679.png', '4', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('16', '4', 'http://img1.uhuibao.com/M00/03/AF/05qaYVOb4yCAKZ4tAAh6m9aniic233.png', '5', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('17', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4h2AbrPQAAKumcZv4UQ940.png', '1', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('18', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4oiAfiS5AAV75Mu2dLY772.png', '2', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('19', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4uiAJjCjAAmsyal9G8g389.png', '3', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('20', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4xGAVUe-AAdfD3wCI5g679.png', '4', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('21', '4', 'http://img1.uhuibao.com/M00/03/AF/05qaYVOb4yCAKZ4tAAh6m9aniic233.png', '5', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('22', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4h2AbrPQAAKumcZv4UQ940.png', '1', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('23', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4oiAfiS5AAV75Mu2dLY772.png', '2', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('24', '4', 'http://img1.uhuibao.com/M00/03/CA/05qaYVOnwDiAT4k9AAW_DcuCuIU769.png', '3', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('25', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4xGAVUe-AAdfD3wCI5g679.png', '4', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('26', '4', 'http://img1.uhuibao.com/M00/03/AF/05qaYVOb4yCAKZ4tAAh6m9aniic233.png', '5', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('27', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4h2AbrPQAAKumcZv4UQ940.png', '1', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('28', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4oiAfiS5AAV75Mu2dLY772.png', '2', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('29', '4', 'http://img1.uhuibao.com/M00/03/CA/05qaYVOnwGKAZF2vAAdfD3wCI5g057.png', '3', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('30', '4', 'http://img1.uhuibao.com/M00/03/AE/05qaYVOb4xGAVUe-AAdfD3wCI5g679.png', '4', '1');
INSERT INTO `hcc_tb_area_bigimg` VALUES ('31', '4', 'http://img1.uhuibao.com/M00/03/AF/05qaYVOb4yCAKZ4tAAh6m9aniic233.png', '5', '1');

-- ----------------------------
-- Table structure for `hcc_tb_area_range`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_area_range`;
CREATE TABLE `hcc_tb_area_range` (
  `areaid` int(11) NOT NULL AUTO_INCREMENT,
  `areaname` varchar(64) DEFAULT NULL,
  `minlatitude` varchar(32) DEFAULT NULL,
  `maxlatitude` varchar(32) DEFAULT NULL,
  `minlongitude` varchar(32) DEFAULT NULL,
  `maxlongitude` varchar(32) DEFAULT NULL,
  `areaimg` varchar(256) DEFAULT NULL,
  `areatype` int(11) DEFAULT NULL,
  `ishot` int(11) DEFAULT '0' COMMENT '是否热门 1：热门 0：不是热门',
  `parendid` int(11) DEFAULT NULL,
  `area_code` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`areaid`)
) ENGINE=InnoDB AUTO_INCREMENT=9014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_area_range
-- ----------------------------
INSERT INTO `hcc_tb_area_range` VALUES ('1', '中华人民共和国', null, null, null, null, null, '1', '0', '0', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4866', '北京市', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4867', '辖区', null, null, null, null, null, '4', '0', '4866', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4868', '东城区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4869', '西城区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4870', '崇文区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4871', '宣武区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4872', '朝阳区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4873', '丰台区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4874', '石景山区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4875', '海淀区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4876', '门头沟区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4877', '房山区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4878', '通州区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4879', '顺义区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4880', '昌平区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4881', '大兴区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4882', '怀柔区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4883', '平谷区', null, null, null, null, null, '5', '0', '4867', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4884', '辖县', null, null, null, null, null, '4', '0', '4866', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4885', '密云县', null, null, null, null, null, '5', '0', '4884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4886', '延庆县', null, null, null, null, null, '5', '0', '4884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4887', '天津市', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4888', '辖区', null, null, null, null, null, '4', '0', '4887', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4889', '和平区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4890', '河东区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4891', '河西区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4892', '南开区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4893', '河北区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4894', '红桥区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4895', '塘沽区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4896', '汉沽区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4897', '大港区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4898', '东丽区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4899', '西青区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4900', '津南区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4901', '北辰区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4902', '武清区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4903', '宝坻区', null, null, null, null, null, '5', '0', '4888', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4904', '辖县', null, null, null, null, null, '4', '0', '4887', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4905', '宁河县', null, null, null, null, null, '5', '0', '4904', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4906', '静海县', null, null, null, null, null, '5', '0', '4904', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4907', '蓟　县', null, null, null, null, null, '5', '0', '4904', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4908', '河北省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4909', '石家庄市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4910', '市辖区', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4911', '长安区', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4912', '桥东区', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4913', '桥西区', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4914', '新华区', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4915', '井陉矿区', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4916', '裕华区', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4917', '井陉县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4918', '正定县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4919', '栾城县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4920', '行唐县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4921', '灵寿县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4922', '高邑县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4923', '深泽县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4924', '赞皇县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4925', '无极县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4926', '平山县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4927', '元氏县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4928', '赵　县', null, null, null, null, null, '5', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4929', '辛集市', null, null, null, null, null, '4', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4930', '藁城市', null, null, null, null, null, '4', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4931', '晋州市', null, null, null, null, null, '4', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4932', '新乐市', null, null, null, null, null, '4', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4933', '鹿泉市', null, null, null, null, null, '4', '0', '4909', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4934', '唐山市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4935', '市辖区', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4936', '路南区', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4937', '路北区', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4938', '古冶区', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4939', '开平区', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4940', '丰南区', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4941', '丰润区', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4942', '滦　县', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4943', '滦南县', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4944', '乐亭县', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4945', '迁西县', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4946', '玉田县', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4947', '唐海县', null, null, null, null, null, '5', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4948', '遵化市', null, null, null, null, null, '4', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4949', '迁安市', null, null, null, null, null, '4', '0', '4934', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4950', '秦皇岛市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4951', '市辖区', null, null, null, null, null, '5', '0', '4950', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4952', '海港区', null, null, null, null, null, '5', '0', '4950', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4953', '山海关区', null, null, null, null, null, '5', '0', '4950', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4954', '北戴河区', null, null, null, null, null, '5', '0', '4950', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4955', '青龙满族自治县', null, null, null, null, null, '5', '0', '4950', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4956', '昌黎县', null, null, null, null, null, '5', '0', '4950', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4957', '抚宁县', null, null, null, null, null, '5', '0', '4950', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4958', '卢龙县', null, null, null, null, null, '5', '0', '4950', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4959', '邯郸市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4960', '市辖区', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4961', '邯山区', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4962', '丛台区', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4963', '复兴区', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4964', '峰峰矿区', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4965', '邯郸县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4966', '临漳县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4967', '成安县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4968', '大名县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4969', '涉　县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4970', '磁　县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4971', '肥乡县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4972', '永年县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4973', '邱　县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4974', '鸡泽县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4975', '广平县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4976', '馆陶县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4977', '魏　县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4978', '曲周县', null, null, null, null, null, '5', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4979', '武安市', null, null, null, null, null, '4', '0', '4959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4980', '邢台市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4981', '市辖区', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4982', '桥东区', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4983', '桥西区', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4984', '邢台县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4985', '临城县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4986', '内丘县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4987', '柏乡县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4988', '隆尧县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4989', '任　县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4990', '南和县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4991', '宁晋县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4992', '巨鹿县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4993', '新河县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4994', '广宗县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4995', '平乡县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4996', '威　县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4997', '清河县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4998', '临西县', null, null, null, null, null, '5', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('4999', '南宫市', null, null, null, null, null, '4', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5000', '沙河市', null, null, null, null, null, '4', '0', '4980', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5001', '保定市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5002', '市辖区', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5003', '新市区', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5004', '北市区', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5005', '南市区', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5006', '满城县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5007', '清苑县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5008', '涞水县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5009', '阜平县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5010', '徐水县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5011', '定兴县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5012', '唐　县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5013', '高阳县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5014', '容城县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5015', '涞源县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5016', '望都县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5017', '安新县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5018', '易　县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5019', '曲阳县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5020', '蠡　县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5021', '顺平县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5022', '博野县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5023', '雄　县', null, null, null, null, null, '5', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5024', '涿州市', null, null, null, null, null, '4', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5025', '定州市', null, null, null, null, null, '4', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5026', '安国市', null, null, null, null, null, '4', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5027', '高碑店市', null, null, null, null, null, '4', '0', '5001', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5028', '张家口市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5029', '市辖区', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5030', '桥东区', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5031', '桥西区', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5032', '宣化区', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5033', '下花园区', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5034', '宣化县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5035', '张北县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5036', '康保县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5037', '沽源县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5038', '尚义县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5039', '蔚　县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5040', '阳原县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5041', '怀安县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5042', '万全县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5043', '怀来县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5044', '涿鹿县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5045', '赤城县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5046', '崇礼县', null, null, null, null, null, '5', '0', '5028', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5047', '承德市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5048', '市辖区', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5049', '双桥区', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5050', '双滦区', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5051', '鹰手营子矿区', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5052', '承德县', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5053', '兴隆县', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5054', '平泉县', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5055', '滦平县', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5056', '隆化县', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5057', '丰宁满族自治县', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5058', '宽城满族自治县', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5059', '围场满族蒙古族自治县', null, null, null, null, null, '5', '0', '5047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5060', '沧州市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5061', '市辖区', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5062', '新华区', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5063', '运河区', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5064', '沧　县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5065', '青　县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5066', '东光县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5067', '海兴县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5068', '盐山县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5069', '肃宁县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5070', '南皮县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5071', '吴桥县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5072', '献　县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5073', '孟村回族自治县', null, null, null, null, null, '5', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5074', '泊头市', null, null, null, null, null, '4', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5075', '任丘市', null, null, null, null, null, '4', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5076', '黄骅市', null, null, null, null, null, '4', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5077', '河间市', null, null, null, null, null, '4', '0', '5060', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5078', '廊坊市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5079', '市辖区', null, null, null, null, null, '5', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5080', '安次区', null, null, null, null, null, '5', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5081', '广阳区', null, null, null, null, null, '5', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5082', '固安县', null, null, null, null, null, '5', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5083', '永清县', null, null, null, null, null, '5', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5084', '香河县', null, null, null, null, null, '5', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5085', '大城县', null, null, null, null, null, '5', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5086', '文安县', null, null, null, null, null, '5', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5087', '大厂回族自治县', null, null, null, null, null, '5', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5088', '霸州市', null, null, null, null, null, '4', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5089', '三河市', null, null, null, null, null, '4', '0', '5078', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5090', '衡水市', null, null, null, null, null, '4', '0', '4908', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5091', '市辖区', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5092', '桃城区', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5093', '枣强县', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5094', '武邑县', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5095', '武强县', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5096', '饶阳县', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5097', '安平县', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5098', '故城县', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5099', '景　县', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5100', '阜城县', null, null, null, null, null, '5', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5101', '冀州市', null, null, null, null, null, '4', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5102', '深州市', null, null, null, null, null, '4', '0', '5090', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5103', '山西省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5104', '太原市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5105', '市辖区', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5106', '小店区', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5107', '迎泽区', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5108', '杏花岭区', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5109', '尖草坪区', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5110', '万柏林区', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5111', '晋源区', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5112', '清徐县', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5113', '阳曲县', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5114', '娄烦县', null, null, null, null, null, '5', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5115', '古交市', null, null, null, null, null, '4', '0', '5104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5116', '大同市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5117', '市辖区', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5118', '城　区', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5119', '矿　区', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5120', '南郊区', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5121', '新荣区', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5122', '阳高县', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5123', '天镇县', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5124', '广灵县', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5125', '灵丘县', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5126', '浑源县', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5127', '左云县', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5128', '大同县', null, null, null, null, null, '5', '0', '5116', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5129', '阳泉市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5130', '市辖区', null, null, null, null, null, '5', '0', '5129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5131', '城　区', null, null, null, null, null, '5', '0', '5129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5132', '矿　区', null, null, null, null, null, '5', '0', '5129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5133', '郊　区', null, null, null, null, null, '5', '0', '5129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5134', '平定县', null, null, null, null, null, '5', '0', '5129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5135', '盂　县', null, null, null, null, null, '5', '0', '5129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5136', '长治市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5137', '市辖区', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5138', '城　区', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5139', '郊　区', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5140', '长治县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5141', '襄垣县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5142', '屯留县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5143', '平顺县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5144', '黎城县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5145', '壶关县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5146', '长子县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5147', '武乡县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5148', '沁　县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5149', '沁源县', null, null, null, null, null, '5', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5150', '潞城市', null, null, null, null, null, '4', '0', '5136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5151', '晋城市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5152', '市辖区', null, null, null, null, null, '5', '0', '5151', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5153', '城　区', null, null, null, null, null, '5', '0', '5151', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5154', '沁水县', null, null, null, null, null, '5', '0', '5151', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5155', '阳城县', null, null, null, null, null, '5', '0', '5151', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5156', '陵川县', null, null, null, null, null, '5', '0', '5151', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5157', '泽州县', null, null, null, null, null, '5', '0', '5151', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5158', '高平市', null, null, null, null, null, '4', '0', '5151', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5159', '朔州市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5160', '市辖区', null, null, null, null, null, '5', '0', '5159', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5161', '朔城区', null, null, null, null, null, '5', '0', '5159', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5162', '平鲁区', null, null, null, null, null, '5', '0', '5159', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5163', '山阴县', null, null, null, null, null, '5', '0', '5159', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5164', '应　县', null, null, null, null, null, '5', '0', '5159', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5165', '右玉县', null, null, null, null, null, '5', '0', '5159', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5166', '怀仁县', null, null, null, null, null, '5', '0', '5159', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5167', '晋中市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5168', '市辖区', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5169', '榆次区', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5170', '榆社县', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5171', '左权县', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5172', '和顺县', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5173', '昔阳县', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5174', '寿阳县', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5175', '太谷县', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5176', '祁　县', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5177', '平遥县', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5178', '灵石县', null, null, null, null, null, '5', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5179', '介休市', null, null, null, null, null, '4', '0', '5167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5180', '运城市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5181', '市辖区', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5182', '盐湖区', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5183', '临猗县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5184', '万荣县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5185', '闻喜县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5186', '稷山县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5187', '新绛县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5188', '绛　县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5189', '垣曲县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5190', '夏　县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5191', '平陆县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5192', '芮城县', null, null, null, null, null, '5', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5193', '永济市', null, null, null, null, null, '4', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5194', '河津市', null, null, null, null, null, '4', '0', '5180', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5195', '忻州市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5196', '市辖区', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5197', '忻府区', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5198', '定襄县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5199', '五台县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5200', '代　县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5201', '繁峙县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5202', '宁武县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5203', '静乐县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5204', '神池县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5205', '五寨县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5206', '岢岚县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5207', '河曲县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5208', '保德县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5209', '偏关县', null, null, null, null, null, '5', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5210', '原平市', null, null, null, null, null, '4', '0', '5195', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5211', '临汾市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5212', '市辖区', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5213', '尧都区', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5214', '曲沃县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5215', '翼城县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5216', '襄汾县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5217', '洪洞县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5218', '古　县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5219', '安泽县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5220', '浮山县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5221', '吉　县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5222', '乡宁县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5223', '大宁县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5224', '隰　县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5225', '永和县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5226', '蒲　县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5227', '汾西县', null, null, null, null, null, '5', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5228', '侯马市', null, null, null, null, null, '4', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5229', '霍州市', null, null, null, null, null, '4', '0', '5211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5230', '吕梁市', null, null, null, null, null, '4', '0', '5103', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5231', '市辖区', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5232', '离石区', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5233', '文水县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5234', '交城县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5235', '兴　县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5236', '临　县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5237', '柳林县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5238', '石楼县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5239', '岚　县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5240', '方山县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5241', '中阳县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5242', '交口县', null, null, null, null, null, '5', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5243', '孝义市', null, null, null, null, null, '4', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5244', '汾阳市', null, null, null, null, null, '4', '0', '5230', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5245', '内蒙古自治区', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5246', '呼和浩特市', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5247', '市辖区', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5248', '新城区', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5249', '回民区', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5250', '玉泉区', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5251', '赛罕区', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5252', '土默特左旗', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5253', '托克托县', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5254', '和林格尔县', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5255', '清水河县', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5256', '武川县', null, null, null, null, null, '5', '0', '5246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5257', '包头市', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5258', '市辖区', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5259', '东河区', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5260', '昆都仑区', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5261', '青山区', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5262', '石拐区', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5263', '白云矿区', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5264', '九原区', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5265', '土默特右旗', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5266', '固阳县', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5267', '达尔罕茂明安联合旗', null, null, null, null, null, '5', '0', '5257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5268', '乌海市', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5269', '市辖区', null, null, null, null, null, '5', '0', '5268', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5270', '海勃湾区', null, null, null, null, null, '5', '0', '5268', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5271', '海南区', null, null, null, null, null, '5', '0', '5268', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5272', '乌达区', null, null, null, null, null, '5', '0', '5268', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5273', '赤峰市', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5274', '市辖区', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5275', '红山区', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5276', '元宝山区', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5277', '松山区', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5278', '阿鲁科尔沁旗', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5279', '巴林左旗', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5280', '巴林右旗', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5281', '林西县', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5282', '克什克腾旗', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5283', '翁牛特旗', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5284', '喀喇沁旗', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5285', '宁城县', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5286', '敖汉旗', null, null, null, null, null, '5', '0', '5273', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5287', '通辽市', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5288', '市辖区', null, null, null, null, null, '5', '0', '5287', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5289', '科尔沁区', null, null, null, null, null, '5', '0', '5287', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5290', '科尔沁左翼中旗', null, null, null, null, null, '5', '0', '5287', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5291', '科尔沁左翼后旗', null, null, null, null, null, '5', '0', '5287', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5292', '开鲁县', null, null, null, null, null, '5', '0', '5287', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5293', '库伦旗', null, null, null, null, null, '5', '0', '5287', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5294', '奈曼旗', null, null, null, null, null, '5', '0', '5287', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5295', '扎鲁特旗', null, null, null, null, null, '5', '0', '5287', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5296', '霍林郭勒市', null, null, null, null, null, '4', '0', '5287', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5297', '鄂尔多斯市', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5298', '东胜区', null, null, null, null, null, '5', '0', '5297', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5299', '达拉特旗', null, null, null, null, null, '5', '0', '5297', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5300', '准格尔旗', null, null, null, null, null, '5', '0', '5297', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5301', '鄂托克前旗', null, null, null, null, null, '5', '0', '5297', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5302', '鄂托克旗', null, null, null, null, null, '5', '0', '5297', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5303', '杭锦旗', null, null, null, null, null, '5', '0', '5297', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5304', '乌审旗', null, null, null, null, null, '5', '0', '5297', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5305', '伊金霍洛旗', null, null, null, null, null, '5', '0', '5297', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5306', '呼伦贝尔市', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5307', '市辖区', null, null, null, null, null, '5', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5308', '海拉尔区', null, null, null, null, null, '5', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5309', '阿荣旗', null, null, null, null, null, '5', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5310', '莫力达瓦达斡尔族自治旗', null, null, null, null, null, '5', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5311', '鄂伦春自治旗', null, null, null, null, null, '5', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5312', '鄂温克族自治旗', null, null, null, null, null, '5', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5313', '陈巴尔虎旗', null, null, null, null, null, '5', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5314', '新巴尔虎左旗', null, null, null, null, null, '5', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5315', '新巴尔虎右旗', null, null, null, null, null, '5', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5316', '满洲里市', null, null, null, null, null, '4', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5317', '牙克石市', null, null, null, null, null, '4', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5318', '扎兰屯市', null, null, null, null, null, '4', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5319', '额尔古纳市', null, null, null, null, null, '4', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5320', '根河市', null, null, null, null, null, '4', '0', '5306', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5321', '巴彦淖尔市', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5322', '市辖区', null, null, null, null, null, '5', '0', '5321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5323', '临河区', null, null, null, null, null, '5', '0', '5321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5324', '五原县', null, null, null, null, null, '5', '0', '5321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5325', '磴口县', null, null, null, null, null, '5', '0', '5321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5326', '乌拉特前旗', null, null, null, null, null, '5', '0', '5321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5327', '乌拉特中旗', null, null, null, null, null, '5', '0', '5321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5328', '乌拉特后旗', null, null, null, null, null, '5', '0', '5321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5329', '杭锦后旗', null, null, null, null, null, '5', '0', '5321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5330', '乌兰察布市', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5331', '市辖区', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5332', '集宁区', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5333', '卓资县', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5334', '化德县', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5335', '商都县', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5336', '兴和县', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5337', '凉城县', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5338', '察哈尔右翼前旗', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5339', '察哈尔右翼中旗', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5340', '察哈尔右翼后旗', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5341', '四子王旗', null, null, null, null, null, '5', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5342', '丰镇市', null, null, null, null, null, '4', '0', '5330', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5343', '兴安盟', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5344', '乌兰浩特市', null, null, null, null, null, '4', '0', '5343', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5345', '阿尔山市', null, null, null, null, null, '4', '0', '5343', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5346', '科尔沁右翼前旗', null, null, null, null, null, '5', '0', '5343', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5347', '科尔沁右翼中旗', null, null, null, null, null, '5', '0', '5343', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5348', '扎赉特旗', null, null, null, null, null, '5', '0', '5343', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5349', '突泉县', null, null, null, null, null, '5', '0', '5343', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5350', '锡林郭勒盟', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5351', '二连浩特市', null, null, null, null, null, '4', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5352', '锡林浩特市', null, null, null, null, null, '4', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5353', '阿巴嘎旗', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5354', '苏尼特左旗', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5355', '苏尼特右旗', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5356', '东乌珠穆沁旗', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5357', '西乌珠穆沁旗', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5358', '太仆寺旗', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5359', '镶黄旗', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5360', '正镶白旗', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5361', '正蓝旗', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5362', '多伦县', null, null, null, null, null, '5', '0', '5350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5363', '阿拉善盟', null, null, null, null, null, '4', '0', '5245', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5364', '阿拉善左旗', null, null, null, null, null, '5', '0', '5363', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5365', '阿拉善右旗', null, null, null, null, null, '5', '0', '5363', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5366', '额济纳旗', null, null, null, null, null, '5', '0', '5363', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5367', '辽宁省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5368', '沈阳市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5369', '市辖区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5370', '和平区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5371', '沈河区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5372', '大东区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5373', '皇姑区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5374', '铁西区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5375', '苏家屯区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5376', '东陵区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5377', '新城子区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5378', '于洪区', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5379', '辽中县', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5380', '康平县', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5381', '法库县', null, null, null, null, null, '5', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5382', '新民市', null, null, null, null, null, '4', '0', '5368', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5383', '大连市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5384', '市辖区', null, null, null, null, null, '5', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5385', '中山区', null, null, null, null, null, '5', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5386', '西岗区', null, null, null, null, null, '5', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5387', '沙河口区', null, null, null, null, null, '5', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5388', '甘井子区', null, null, null, null, null, '5', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5389', '旅顺口区', null, null, null, null, null, '5', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5390', '金州区', null, null, null, null, null, '5', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5391', '长海县', null, null, null, null, null, '5', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5392', '瓦房店市', null, null, null, null, null, '4', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5393', '普兰店市', null, null, null, null, null, '4', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5394', '庄河市', null, null, null, null, null, '4', '0', '5383', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5395', '鞍山市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5396', '市辖区', null, null, null, null, null, '5', '0', '5395', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5397', '铁东区', null, null, null, null, null, '5', '0', '5395', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5398', '铁西区', null, null, null, null, null, '5', '0', '5395', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5399', '立山区', null, null, null, null, null, '5', '0', '5395', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5400', '千山区', null, null, null, null, null, '5', '0', '5395', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5401', '台安县', null, null, null, null, null, '5', '0', '5395', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5402', '岫岩满族自治县', null, null, null, null, null, '5', '0', '5395', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5403', '海城市', null, null, null, null, null, '4', '0', '5395', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5404', '抚顺市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5405', '市辖区', null, null, null, null, null, '5', '0', '5404', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5406', '新抚区', null, null, null, null, null, '5', '0', '5404', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5407', '东洲区', null, null, null, null, null, '5', '0', '5404', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5408', '望花区', null, null, null, null, null, '5', '0', '5404', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5409', '顺城区', null, null, null, null, null, '5', '0', '5404', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5410', '抚顺县', null, null, null, null, null, '5', '0', '5404', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5411', '新宾满族自治县', null, null, null, null, null, '5', '0', '5404', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5412', '清原满族自治县', null, null, null, null, null, '5', '0', '5404', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5413', '本溪市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5414', '市辖区', null, null, null, null, null, '5', '0', '5413', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5415', '平山区', null, null, null, null, null, '5', '0', '5413', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5416', '溪湖区', null, null, null, null, null, '5', '0', '5413', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5417', '明山区', null, null, null, null, null, '5', '0', '5413', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5418', '南芬区', null, null, null, null, null, '5', '0', '5413', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5419', '本溪满族自治县', null, null, null, null, null, '5', '0', '5413', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5420', '桓仁满族自治县', null, null, null, null, null, '5', '0', '5413', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5421', '丹东市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5422', '市辖区', null, null, null, null, null, '5', '0', '5421', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5423', '元宝区', null, null, null, null, null, '5', '0', '5421', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5424', '振兴区', null, null, null, null, null, '5', '0', '5421', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5425', '振安区', null, null, null, null, null, '5', '0', '5421', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5426', '宽甸满族自治县', null, null, null, null, null, '5', '0', '5421', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5427', '东港市', null, null, null, null, null, '4', '0', '5421', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5428', '凤城市', null, null, null, null, null, '4', '0', '5421', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5429', '锦州市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5430', '市辖区', null, null, null, null, null, '5', '0', '5429', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5431', '古塔区', null, null, null, null, null, '5', '0', '5429', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5432', '凌河区', null, null, null, null, null, '5', '0', '5429', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5433', '太和区', null, null, null, null, null, '5', '0', '5429', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5434', '黑山县', null, null, null, null, null, '5', '0', '5429', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5435', '义　县', null, null, null, null, null, '5', '0', '5429', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5436', '凌海市', null, null, null, null, null, '4', '0', '5429', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5437', '北宁市', null, null, null, null, null, '4', '0', '5429', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5438', '营口市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5439', '市辖区', null, null, null, null, null, '5', '0', '5438', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5440', '站前区', null, null, null, null, null, '5', '0', '5438', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5441', '西市区', null, null, null, null, null, '5', '0', '5438', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5442', '鲅鱼圈区', null, null, null, null, null, '5', '0', '5438', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5443', '老边区', null, null, null, null, null, '5', '0', '5438', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5444', '盖州市', null, null, null, null, null, '4', '0', '5438', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5445', '大石桥市', null, null, null, null, null, '4', '0', '5438', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5446', '阜新市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5447', '市辖区', null, null, null, null, null, '5', '0', '5446', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5448', '海州区', null, null, null, null, null, '5', '0', '5446', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5449', '新邱区', null, null, null, null, null, '5', '0', '5446', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5450', '太平区', null, null, null, null, null, '5', '0', '5446', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5451', '清河门区', null, null, null, null, null, '5', '0', '5446', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5452', '细河区', null, null, null, null, null, '5', '0', '5446', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5453', '阜新蒙古族自治县', null, null, null, null, null, '5', '0', '5446', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5454', '彰武县', null, null, null, null, null, '5', '0', '5446', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5455', '辽阳市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5456', '市辖区', null, null, null, null, null, '5', '0', '5455', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5457', '白塔区', null, null, null, null, null, '5', '0', '5455', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5458', '文圣区', null, null, null, null, null, '5', '0', '5455', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5459', '宏伟区', null, null, null, null, null, '5', '0', '5455', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5460', '弓长岭区', null, null, null, null, null, '5', '0', '5455', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5461', '太子河区', null, null, null, null, null, '5', '0', '5455', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5462', '辽阳县', null, null, null, null, null, '5', '0', '5455', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5463', '灯塔市', null, null, null, null, null, '4', '0', '5455', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5464', '盘锦市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5465', '市辖区', null, null, null, null, null, '5', '0', '5464', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5466', '双台子区', null, null, null, null, null, '5', '0', '5464', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5467', '兴隆台区', null, null, null, null, null, '5', '0', '5464', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5468', '大洼县', null, null, null, null, null, '5', '0', '5464', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5469', '盘山县', null, null, null, null, null, '5', '0', '5464', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5470', '铁岭市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5471', '市辖区', null, null, null, null, null, '5', '0', '5470', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5472', '银州区', null, null, null, null, null, '5', '0', '5470', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5473', '清河区', null, null, null, null, null, '5', '0', '5470', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5474', '铁岭县', null, null, null, null, null, '5', '0', '5470', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5475', '西丰县', null, null, null, null, null, '5', '0', '5470', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5476', '昌图县', null, null, null, null, null, '5', '0', '5470', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5477', '调兵山市', null, null, null, null, null, '4', '0', '5470', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5478', '开原市', null, null, null, null, null, '4', '0', '5470', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5479', '朝阳市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5480', '市辖区', null, null, null, null, null, '5', '0', '5479', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5481', '双塔区', null, null, null, null, null, '5', '0', '5479', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5482', '龙城区', null, null, null, null, null, '5', '0', '5479', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5483', '朝阳县', null, null, null, null, null, '5', '0', '5479', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5484', '建平县', null, null, null, null, null, '5', '0', '5479', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5485', '喀喇沁左翼蒙古族自治县', null, null, null, null, null, '5', '0', '5479', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5486', '北票市', null, null, null, null, null, '4', '0', '5479', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5487', '凌源市', null, null, null, null, null, '4', '0', '5479', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5488', '葫芦岛市', null, null, null, null, null, '4', '0', '5367', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5489', '市辖区', null, null, null, null, null, '5', '0', '5488', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5490', '连山区', null, null, null, null, null, '5', '0', '5488', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5491', '龙港区', null, null, null, null, null, '5', '0', '5488', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5492', '南票区', null, null, null, null, null, '5', '0', '5488', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5493', '绥中县', null, null, null, null, null, '5', '0', '5488', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5494', '建昌县', null, null, null, null, null, '5', '0', '5488', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5495', '兴城市', null, null, null, null, null, '4', '0', '5488', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5496', '吉林省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5497', '长春市', null, null, null, null, null, '4', '0', '5496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5498', '市辖区', null, null, null, null, null, '5', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5499', '南关区', null, null, null, null, null, '5', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5500', '宽城区', null, null, null, null, null, '5', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5501', '朝阳区', null, null, null, null, null, '5', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5502', '二道区', null, null, null, null, null, '5', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5503', '绿园区', null, null, null, null, null, '5', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5504', '双阳区', null, null, null, null, null, '5', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5505', '农安县', null, null, null, null, null, '5', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5506', '九台市', null, null, null, null, null, '4', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5507', '榆树市', null, null, null, null, null, '4', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5508', '德惠市', null, null, null, null, null, '4', '0', '5497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5509', '吉林市', null, null, null, null, null, '4', '0', '5496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5510', '市辖区', null, null, null, null, null, '5', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5511', '昌邑区', null, null, null, null, null, '5', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5512', '龙潭区', null, null, null, null, null, '5', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5513', '船营区', null, null, null, null, null, '5', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5514', '丰满区', null, null, null, null, null, '5', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5515', '永吉县', null, null, null, null, null, '5', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5516', '蛟河市', null, null, null, null, null, '4', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5517', '桦甸市', null, null, null, null, null, '4', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5518', '舒兰市', null, null, null, null, null, '4', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5519', '磐石市', null, null, null, null, null, '4', '0', '5509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5520', '四平市', null, null, null, null, null, '4', '0', '5496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5521', '市辖区', null, null, null, null, null, '5', '0', '5520', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5522', '铁西区', null, null, null, null, null, '5', '0', '5520', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5523', '铁东区', null, null, null, null, null, '5', '0', '5520', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5524', '梨树县', null, null, null, null, null, '5', '0', '5520', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5525', '伊通满族自治县', null, null, null, null, null, '5', '0', '5520', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5526', '公主岭市', null, null, null, null, null, '4', '0', '5520', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5527', '双辽市', null, null, null, null, null, '4', '0', '5520', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5528', '辽源市', null, null, null, null, null, '4', '0', '5496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5529', '市辖区', null, null, null, null, null, '5', '0', '5528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5530', '龙山区', null, null, null, null, null, '5', '0', '5528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5531', '西安区', null, null, null, null, null, '5', '0', '5528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5532', '东丰县', null, null, null, null, null, '5', '0', '5528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5533', '东辽县', null, null, null, null, null, '5', '0', '5528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5534', '通化市', null, null, null, null, null, '4', '0', '5496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5535', '市辖区', null, null, null, null, null, '5', '0', '5534', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5536', '东昌区', null, null, null, null, null, '5', '0', '5534', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5537', '二道江区', null, null, null, null, null, '5', '0', '5534', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5538', '通化县', null, null, null, null, null, '5', '0', '5534', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5539', '辉南县', null, null, null, null, null, '5', '0', '5534', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5540', '柳河县', null, null, null, null, null, '5', '0', '5534', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5541', '梅河口市', null, null, null, null, null, '4', '0', '5534', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5542', '集安市', null, null, null, null, null, '4', '0', '5534', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5543', '白山市', null, null, null, null, null, '4', '0', '5496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5544', '市辖区', null, null, null, null, null, '5', '0', '5543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5545', '八道江区', null, null, null, null, null, '5', '0', '5543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5546', '抚松县', null, null, null, null, null, '5', '0', '5543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5547', '靖宇县', null, null, null, null, null, '5', '0', '5543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5548', '长白朝鲜族自治县', null, null, null, null, null, '5', '0', '5543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5549', '江源县', null, null, null, null, null, '5', '0', '5543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5550', '临江市', null, null, null, null, null, '4', '0', '5543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5551', '松原市', null, null, null, null, null, '4', '0', '5496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5552', '市辖区', null, null, null, null, null, '5', '0', '5551', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5553', '宁江区', null, null, null, null, null, '5', '0', '5551', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5554', '前郭尔罗斯蒙古族自治县', null, null, null, null, null, '5', '0', '5551', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5555', '长岭县', null, null, null, null, null, '5', '0', '5551', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5556', '乾安县', null, null, null, null, null, '5', '0', '5551', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5557', '扶余县', null, null, null, null, null, '5', '0', '5551', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5558', '白城市', null, null, null, null, null, '4', '0', '5496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5559', '市辖区', null, null, null, null, null, '5', '0', '5558', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5560', '洮北区', null, null, null, null, null, '5', '0', '5558', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5561', '镇赉县', null, null, null, null, null, '5', '0', '5558', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5562', '通榆县', null, null, null, null, null, '5', '0', '5558', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5563', '洮南市', null, null, null, null, null, '4', '0', '5558', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5564', '大安市', null, null, null, null, null, '4', '0', '5558', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5565', '延边朝鲜族自治州', null, null, null, null, null, '4', '0', '5496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5566', '延吉市', null, null, null, null, null, '4', '0', '5565', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5567', '图们市', null, null, null, null, null, '4', '0', '5565', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5568', '敦化市', null, null, null, null, null, '4', '0', '5565', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5569', '珲春市', null, null, null, null, null, '4', '0', '5565', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5570', '龙井市', null, null, null, null, null, '4', '0', '5565', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5571', '和龙市', null, null, null, null, null, '4', '0', '5565', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5572', '汪清县', null, null, null, null, null, '5', '0', '5565', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5573', '安图县', null, null, null, null, null, '5', '0', '5565', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5574', '黑龙江省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5575', '哈尔滨市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5576', '市辖区', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5577', '道里区', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5578', '南岗区', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5579', '道外区', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5580', '香坊区', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5581', '动力区', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5582', '平房区', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5583', '松北区', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5584', '呼兰区', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5585', '依兰县', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5586', '方正县', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5587', '宾　县', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5588', '巴彦县', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5589', '木兰县', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5590', '通河县', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5591', '延寿县', null, null, null, null, null, '5', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5592', '阿城市', null, null, null, null, null, '4', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5593', '双城市', null, null, null, null, null, '4', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5594', '尚志市', null, null, null, null, null, '4', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5595', '五常市', null, null, null, null, null, '4', '0', '5575', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5596', '齐齐哈尔市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5597', '市辖区', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5598', '龙沙区', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5599', '建华区', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5600', '铁锋区', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5601', '昂昂溪区', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5602', '富拉尔基区', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5603', '碾子山区', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5604', '梅里斯达斡尔族区', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5605', '龙江县', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5606', '依安县', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5607', '泰来县', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5608', '甘南县', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5609', '富裕县', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5610', '克山县', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5611', '克东县', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5612', '拜泉县', null, null, null, null, null, '5', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5613', '讷河市', null, null, null, null, null, '4', '0', '5596', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5614', '鸡西市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5615', '市辖区', null, null, null, null, null, '5', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5616', '鸡冠区', null, null, null, null, null, '5', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5617', '恒山区', null, null, null, null, null, '5', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5618', '滴道区', null, null, null, null, null, '5', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5619', '梨树区', null, null, null, null, null, '5', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5620', '城子河区', null, null, null, null, null, '5', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5621', '麻山区', null, null, null, null, null, '5', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5622', '鸡东县', null, null, null, null, null, '5', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5623', '虎林市', null, null, null, null, null, '4', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5624', '密山市', null, null, null, null, null, '4', '0', '5614', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5625', '鹤岗市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5626', '市辖区', null, null, null, null, null, '5', '0', '5625', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5627', '向阳区', null, null, null, null, null, '5', '0', '5625', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5628', '工农区', null, null, null, null, null, '5', '0', '5625', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5629', '南山区', null, null, null, null, null, '5', '0', '5625', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5630', '兴安区', null, null, null, null, null, '5', '0', '5625', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5631', '东山区', null, null, null, null, null, '5', '0', '5625', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5632', '兴山区', null, null, null, null, null, '5', '0', '5625', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5633', '萝北县', null, null, null, null, null, '5', '0', '5625', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5634', '绥滨县', null, null, null, null, null, '5', '0', '5625', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5635', '双鸭山市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5636', '市辖区', null, null, null, null, null, '5', '0', '5635', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5637', '尖山区', null, null, null, null, null, '5', '0', '5635', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5638', '岭东区', null, null, null, null, null, '5', '0', '5635', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5639', '四方台区', null, null, null, null, null, '5', '0', '5635', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5640', '宝山区', null, null, null, null, null, '5', '0', '5635', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5641', '集贤县', null, null, null, null, null, '5', '0', '5635', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5642', '友谊县', null, null, null, null, null, '5', '0', '5635', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5643', '宝清县', null, null, null, null, null, '5', '0', '5635', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5644', '饶河县', null, null, null, null, null, '5', '0', '5635', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5645', '大庆市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5646', '市辖区', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5647', '萨尔图区', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5648', '龙凤区', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5649', '让胡路区', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5650', '红岗区', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5651', '大同区', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5652', '肇州县', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5653', '肇源县', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5654', '林甸县', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5655', '杜尔伯特蒙古族自治县', null, null, null, null, null, '5', '0', '5645', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5656', '伊春市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5657', '市辖区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5658', '伊春区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5659', '南岔区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5660', '友好区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5661', '西林区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5662', '翠峦区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5663', '新青区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5664', '美溪区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5665', '金山屯区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5666', '五营区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5667', '乌马河区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5668', '汤旺河区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5669', '带岭区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5670', '乌伊岭区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5671', '红星区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5672', '上甘岭区', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5673', '嘉荫县', null, null, null, null, null, '5', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5674', '铁力市', null, null, null, null, null, '4', '0', '5656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5675', '佳木斯市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5676', '市辖区', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5677', '永红区', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5678', '向阳区', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5679', '前进区', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5680', '东风区', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5681', '郊　区', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5682', '桦南县', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5683', '桦川县', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5684', '汤原县', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5685', '抚远县', null, null, null, null, null, '5', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5686', '同江市', null, null, null, null, null, '4', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5687', '富锦市', null, null, null, null, null, '4', '0', '5675', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5688', '七台河市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5689', '市辖区', null, null, null, null, null, '5', '0', '5688', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5690', '新兴区', null, null, null, null, null, '5', '0', '5688', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5691', '桃山区', null, null, null, null, null, '5', '0', '5688', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5692', '茄子河区', null, null, null, null, null, '5', '0', '5688', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5693', '勃利县', null, null, null, null, null, '5', '0', '5688', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5694', '牡丹江市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5695', '市辖区', null, null, null, null, null, '5', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5696', '东安区', null, null, null, null, null, '5', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5697', '阳明区', null, null, null, null, null, '5', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5698', '爱民区', null, null, null, null, null, '5', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5699', '西安区', null, null, null, null, null, '5', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5700', '东宁县', null, null, null, null, null, '5', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5701', '林口县', null, null, null, null, null, '5', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5702', '绥芬河市', null, null, null, null, null, '4', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5703', '海林市', null, null, null, null, null, '4', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5704', '宁安市', null, null, null, null, null, '4', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5705', '穆棱市', null, null, null, null, null, '4', '0', '5694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5706', '黑河市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5707', '市辖区', null, null, null, null, null, '5', '0', '5706', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5708', '爱辉区', null, null, null, null, null, '5', '0', '5706', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5709', '嫩江县', null, null, null, null, null, '5', '0', '5706', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5710', '逊克县', null, null, null, null, null, '5', '0', '5706', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5711', '孙吴县', null, null, null, null, null, '5', '0', '5706', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5712', '北安市', null, null, null, null, null, '4', '0', '5706', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5713', '五大连池市', null, null, null, null, null, '4', '0', '5706', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5714', '绥化市', null, null, null, null, null, '4', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5715', '市辖区', null, null, null, null, null, '5', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5716', '北林区', null, null, null, null, null, '5', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5717', '望奎县', null, null, null, null, null, '5', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5718', '兰西县', null, null, null, null, null, '5', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5719', '青冈县', null, null, null, null, null, '5', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5720', '庆安县', null, null, null, null, null, '5', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5721', '明水县', null, null, null, null, null, '5', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5722', '绥棱县', null, null, null, null, null, '5', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5723', '安达市', null, null, null, null, null, '4', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5724', '肇东市', null, null, null, null, null, '4', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5725', '海伦市', null, null, null, null, null, '4', '0', '5714', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5726', '大兴安岭地区', null, null, null, null, null, '5', '0', '5574', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5727', '呼玛县', null, null, null, null, null, '5', '0', '5726', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5728', '塔河县', null, null, null, null, null, '5', '0', '5726', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5729', '漠河县', null, null, null, null, null, '5', '0', '5726', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5730', '上海市', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5731', '辖区', null, null, null, null, null, '4', '0', '5730', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5732', '黄浦区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5733', '卢湾区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5734', '徐汇区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5735', '长宁区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5736', '静安区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5737', '普陀区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5738', '闸北区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5739', '虹口区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5740', '杨浦区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5741', '闵行区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5742', '宝山区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5743', '嘉定区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5744', '浦东新区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5745', '金山区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5746', '松江区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5747', '青浦区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5748', '南汇区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5749', '奉贤区', null, null, null, null, null, '5', '0', '5731', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5750', '辖县', null, null, null, null, null, '4', '0', '5730', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5751', '崇明县', null, null, null, null, null, '5', '0', '5750', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5752', '江苏省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5753', '南京市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5754', '市辖区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5755', '玄武区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5756', '白下区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5757', '秦淮区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5758', '建邺区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5759', '鼓楼区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5760', '下关区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5761', '浦口区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5762', '栖霞区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5763', '雨花台区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5764', '江宁区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5765', '六合区', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5766', '溧水县', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5767', '高淳县', null, null, null, null, null, '5', '0', '5753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5768', '无锡市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5769', '市辖区', null, null, null, null, null, '5', '0', '5768', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5770', '崇安区', null, null, null, null, null, '5', '0', '5768', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5771', '南长区', null, null, null, null, null, '5', '0', '5768', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5772', '北塘区', null, null, null, null, null, '5', '0', '5768', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5773', '锡山区', null, null, null, null, null, '5', '0', '5768', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5774', '惠山区', null, null, null, null, null, '5', '0', '5768', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5775', '滨湖区', null, null, null, null, null, '5', '0', '5768', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5776', '江阴市', null, null, null, null, null, '4', '0', '5768', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5777', '宜兴市', null, null, null, null, null, '4', '0', '5768', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5778', '徐州市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5779', '市辖区', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5780', '鼓楼区', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5781', '云龙区', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5782', '九里区', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5783', '贾汪区', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5784', '泉山区', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5785', '丰　县', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5786', '沛　县', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5787', '铜山县', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5788', '睢宁县', null, null, null, null, null, '5', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5789', '新沂市', null, null, null, null, null, '4', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5790', '邳州市', null, null, null, null, null, '4', '0', '5778', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5791', '常州市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5792', '市辖区', null, null, null, null, null, '5', '0', '5791', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5793', '天宁区', null, null, null, null, null, '5', '0', '5791', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5794', '钟楼区', null, null, null, null, null, '5', '0', '5791', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5795', '戚墅堰区', null, null, null, null, null, '5', '0', '5791', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5796', '新北区', null, null, null, null, null, '5', '0', '5791', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5797', '武进区', null, null, null, null, null, '5', '0', '5791', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5798', '溧阳市', null, null, null, null, null, '4', '0', '5791', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5799', '金坛市', null, null, null, null, null, '4', '0', '5791', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5800', '苏州市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5801', '市辖区', null, null, null, null, null, '5', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5802', '沧浪区', null, null, null, null, null, '5', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5803', '平江区', null, null, null, null, null, '5', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5804', '金阊区', null, null, null, null, null, '5', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5805', '虎丘区', null, null, null, null, null, '5', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5806', '吴中区', null, null, null, null, null, '5', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5807', '相城区', null, null, null, null, null, '5', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5808', '常熟市', null, null, null, null, null, '4', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5809', '张家港市', null, null, null, null, null, '4', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5810', '昆山市', null, null, null, null, null, '4', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5811', '吴江市', null, null, null, null, null, '4', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5812', '太仓市', null, null, null, null, null, '4', '0', '5800', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5813', '南通市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5814', '市辖区', null, null, null, null, null, '5', '0', '5813', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5815', '崇川区', null, null, null, null, null, '5', '0', '5813', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5816', '港闸区', null, null, null, null, null, '5', '0', '5813', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5817', '海安县', null, null, null, null, null, '5', '0', '5813', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5818', '如东县', null, null, null, null, null, '5', '0', '5813', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5819', '启东市', null, null, null, null, null, '4', '0', '5813', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5820', '如皋市', null, null, null, null, null, '4', '0', '5813', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5821', '通州市', null, null, null, null, null, '4', '0', '5813', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5822', '海门市', null, null, null, null, null, '4', '0', '5813', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5823', '连云港市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5824', '市辖区', null, null, null, null, null, '5', '0', '5823', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5825', '连云区', null, null, null, null, null, '5', '0', '5823', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5826', '新浦区', null, null, null, null, null, '5', '0', '5823', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5827', '海州区', null, null, null, null, null, '5', '0', '5823', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5828', '赣榆县', null, null, null, null, null, '5', '0', '5823', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5829', '东海县', null, null, null, null, null, '5', '0', '5823', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5830', '灌云县', null, null, null, null, null, '5', '0', '5823', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5831', '灌南县', null, null, null, null, null, '5', '0', '5823', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5832', '淮安市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5833', '市辖区', null, null, null, null, null, '5', '0', '5832', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5834', '清河区', null, null, null, null, null, '5', '0', '5832', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5835', '楚州区', null, null, null, null, null, '5', '0', '5832', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5836', '淮阴区', null, null, null, null, null, '5', '0', '5832', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5837', '清浦区', null, null, null, null, null, '5', '0', '5832', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5838', '涟水县', null, null, null, null, null, '5', '0', '5832', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5839', '洪泽县', null, null, null, null, null, '5', '0', '5832', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5840', '盱眙县', null, null, null, null, null, '5', '0', '5832', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5841', '金湖县', null, null, null, null, null, '5', '0', '5832', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5842', '盐城市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5843', '市辖区', null, null, null, null, null, '5', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5844', '亭湖区', null, null, null, null, null, '5', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5845', '盐都区', null, null, null, null, null, '5', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5846', '响水县', null, null, null, null, null, '5', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5847', '滨海县', null, null, null, null, null, '5', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5848', '阜宁县', null, null, null, null, null, '5', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5849', '射阳县', null, null, null, null, null, '5', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5850', '建湖县', null, null, null, null, null, '5', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5851', '东台市', null, null, null, null, null, '4', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5852', '大丰市', null, null, null, null, null, '4', '0', '5842', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5853', '扬州市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5854', '市辖区', null, null, null, null, null, '5', '0', '5853', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5855', '广陵区', null, null, null, null, null, '5', '0', '5853', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5856', '邗江区', null, null, null, null, null, '5', '0', '5853', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5857', '郊　区', null, null, null, null, null, '5', '0', '5853', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5858', '宝应县', null, null, null, null, null, '5', '0', '5853', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5859', '仪征市', null, null, null, null, null, '4', '0', '5853', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5860', '高邮市', null, null, null, null, null, '4', '0', '5853', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5861', '江都市', null, null, null, null, null, '4', '0', '5853', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5862', '镇江市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5863', '市辖区', null, null, null, null, null, '5', '0', '5862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5864', '京口区', null, null, null, null, null, '5', '0', '5862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5865', '润州区', null, null, null, null, null, '5', '0', '5862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5866', '丹徒区', null, null, null, null, null, '5', '0', '5862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5867', '丹阳市', null, null, null, null, null, '4', '0', '5862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5868', '扬中市', null, null, null, null, null, '4', '0', '5862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5869', '句容市', null, null, null, null, null, '4', '0', '5862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5870', '泰州市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5871', '市辖区', null, null, null, null, null, '5', '0', '5870', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5872', '海陵区', null, null, null, null, null, '5', '0', '5870', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5873', '高港区', null, null, null, null, null, '5', '0', '5870', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5874', '兴化市', null, null, null, null, null, '4', '0', '5870', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5875', '靖江市', null, null, null, null, null, '4', '0', '5870', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5876', '泰兴市', null, null, null, null, null, '4', '0', '5870', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5877', '姜堰市', null, null, null, null, null, '4', '0', '5870', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5878', '宿迁市', null, null, null, null, null, '4', '0', '5752', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5879', '市辖区', null, null, null, null, null, '5', '0', '5878', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5880', '宿城区', null, null, null, null, null, '5', '0', '5878', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5881', '宿豫区', null, null, null, null, null, '5', '0', '5878', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5882', '沭阳县', null, null, null, null, null, '5', '0', '5878', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5883', '泗阳县', null, null, null, null, null, '5', '0', '5878', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5884', '泗洪县', null, null, null, null, null, '5', '0', '5878', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5885', '浙江省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5886', '杭州市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5887', '市辖区', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5888', '上城区', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5889', '下城区', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5890', '江干区', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5891', '拱墅区', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5892', '西湖区', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5893', '滨江区', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5894', '萧山区', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5895', '余杭区', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5896', '桐庐县', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5897', '淳安县', null, null, null, null, null, '5', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5898', '建德市', null, null, null, null, null, '4', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5899', '富阳市', null, null, null, null, null, '4', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5900', '临安市', null, null, null, null, null, '4', '0', '5886', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5901', '宁波市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5902', '市辖区', null, null, null, null, null, '5', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5903', '海曙区', null, null, null, null, null, '5', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5904', '江东区', null, null, null, null, null, '5', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5905', '江北区', null, null, null, null, null, '5', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5906', '北仑区', null, null, null, null, null, '5', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5907', '镇海区', null, null, null, null, null, '5', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5908', '鄞州区', null, null, null, null, null, '5', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5909', '象山县', null, null, null, null, null, '5', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5910', '宁海县', null, null, null, null, null, '5', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5911', '余姚市', null, null, null, null, null, '4', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5912', '慈溪市', null, null, null, null, null, '4', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5913', '奉化市', null, null, null, null, null, '4', '0', '5901', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5914', '温州市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5915', '市辖区', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5916', '鹿城区', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5917', '龙湾区', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5918', '瓯海区', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5919', '洞头县', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5920', '永嘉县', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5921', '平阳县', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5922', '苍南县', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5923', '文成县', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5924', '泰顺县', null, null, null, null, null, '5', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5925', '瑞安市', null, null, null, null, null, '4', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5926', '乐清市', null, null, null, null, null, '4', '0', '5914', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5927', '嘉兴市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5928', '市辖区', null, null, null, null, null, '5', '0', '5927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5929', '秀城区', null, null, null, null, null, '5', '0', '5927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5930', '秀洲区', null, null, null, null, null, '5', '0', '5927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5931', '嘉善县', null, null, null, null, null, '5', '0', '5927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5932', '海盐县', null, null, null, null, null, '5', '0', '5927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5933', '海宁市', null, null, null, null, null, '4', '0', '5927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5934', '平湖市', null, null, null, null, null, '4', '0', '5927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5935', '桐乡市', null, null, null, null, null, '4', '0', '5927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5936', '湖州市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5937', '市辖区', null, null, null, null, null, '5', '0', '5936', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5938', '吴兴区', null, null, null, null, null, '5', '0', '5936', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5939', '南浔区', null, null, null, null, null, '5', '0', '5936', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5940', '德清县', null, null, null, null, null, '5', '0', '5936', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5941', '长兴县', null, null, null, null, null, '5', '0', '5936', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5942', '安吉县', null, null, null, null, null, '5', '0', '5936', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5943', '绍兴市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5944', '市辖区', null, null, null, null, null, '5', '0', '5943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5945', '越城区', null, null, null, null, null, '5', '0', '5943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5946', '绍兴县', null, null, null, null, null, '5', '0', '5943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5947', '新昌县', null, null, null, null, null, '5', '0', '5943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5948', '诸暨市', null, null, null, null, null, '4', '0', '5943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5949', '上虞市', null, null, null, null, null, '4', '0', '5943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5950', '嵊州市', null, null, null, null, null, '4', '0', '5943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5951', '金华市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5952', '市辖区', null, null, null, null, null, '5', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5953', '婺城区', null, null, null, null, null, '5', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5954', '金东区', null, null, null, null, null, '5', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5955', '武义县', null, null, null, null, null, '5', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5956', '浦江县', null, null, null, null, null, '5', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5957', '磐安县', null, null, null, null, null, '5', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5958', '兰溪市', null, null, null, null, null, '4', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5959', '义乌市', null, null, null, null, null, '4', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5960', '东阳市', null, null, null, null, null, '4', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5961', '永康市', null, null, null, null, null, '4', '0', '5951', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5962', '衢州市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5963', '市辖区', null, null, null, null, null, '5', '0', '5962', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5964', '柯城区', null, null, null, null, null, '5', '0', '5962', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5965', '衢江区', null, null, null, null, null, '5', '0', '5962', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5966', '常山县', null, null, null, null, null, '5', '0', '5962', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5967', '开化县', null, null, null, null, null, '5', '0', '5962', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5968', '龙游县', null, null, null, null, null, '5', '0', '5962', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5969', '江山市', null, null, null, null, null, '4', '0', '5962', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5970', '舟山市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5971', '市辖区', null, null, null, null, null, '5', '0', '5970', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5972', '定海区', null, null, null, null, null, '5', '0', '5970', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5973', '普陀区', null, null, null, null, null, '5', '0', '5970', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5974', '岱山县', null, null, null, null, null, '5', '0', '5970', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5975', '嵊泗县', null, null, null, null, null, '5', '0', '5970', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5976', '台州市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5977', '市辖区', null, null, null, null, null, '5', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5978', '椒江区', null, null, null, null, null, '5', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5979', '黄岩区', null, null, null, null, null, '5', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5980', '路桥区', null, null, null, null, null, '5', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5981', '玉环县', null, null, null, null, null, '5', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5982', '三门县', null, null, null, null, null, '5', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5983', '天台县', null, null, null, null, null, '5', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5984', '仙居县', null, null, null, null, null, '5', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5985', '温岭市', null, null, null, null, null, '4', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5986', '临海市', null, null, null, null, null, '4', '0', '5976', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5987', '丽水市', null, null, null, null, null, '4', '0', '5885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5988', '市辖区', null, null, null, null, null, '5', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5989', '莲都区', null, null, null, null, null, '5', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5990', '青田县', null, null, null, null, null, '5', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5991', '缙云县', null, null, null, null, null, '5', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5992', '遂昌县', null, null, null, null, null, '5', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5993', '松阳县', null, null, null, null, null, '5', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5994', '云和县', null, null, null, null, null, '5', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5995', '庆元县', null, null, null, null, null, '5', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5996', '景宁畲族自治县', null, null, null, null, null, '5', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5997', '龙泉市', null, null, null, null, null, '4', '0', '5987', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5998', '安徽省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('5999', '合肥市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6000', '市辖区', null, null, null, null, null, '5', '0', '5999', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6001', '瑶海区', null, null, null, null, null, '5', '0', '5999', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6002', '庐阳区', null, null, null, null, null, '5', '0', '5999', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6003', '蜀山区', null, null, null, null, null, '5', '0', '5999', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6004', '包河区', null, null, null, null, null, '5', '0', '5999', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6005', '长丰县', null, null, null, null, null, '5', '0', '5999', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6006', '肥东县', null, null, null, null, null, '5', '0', '5999', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6007', '肥西县', null, null, null, null, null, '5', '0', '5999', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6008', '芜湖市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6009', '市辖区', null, null, null, null, null, '5', '0', '6008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6010', '镜湖区', null, null, null, null, null, '5', '0', '6008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6011', '马塘区', null, null, null, null, null, '5', '0', '6008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6012', '新芜区', null, null, null, null, null, '5', '0', '6008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6013', '鸠江区', null, null, null, null, null, '5', '0', '6008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6014', '芜湖县', null, null, null, null, null, '5', '0', '6008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6015', '繁昌县', null, null, null, null, null, '5', '0', '6008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6016', '南陵县', null, null, null, null, null, '5', '0', '6008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6017', '蚌埠市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6018', '市辖区', null, null, null, null, null, '5', '0', '6017', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6019', '龙子湖区', null, null, null, null, null, '5', '0', '6017', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6020', '蚌山区', null, null, null, null, null, '5', '0', '6017', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6021', '禹会区', null, null, null, null, null, '5', '0', '6017', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6022', '淮上区', null, null, null, null, null, '5', '0', '6017', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6023', '怀远县', null, null, null, null, null, '5', '0', '6017', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6024', '五河县', null, null, null, null, null, '5', '0', '6017', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6025', '固镇县', null, null, null, null, null, '5', '0', '6017', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6026', '淮南市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6027', '市辖区', null, null, null, null, null, '5', '0', '6026', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6028', '大通区', null, null, null, null, null, '5', '0', '6026', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6029', '田家庵区', null, null, null, null, null, '5', '0', '6026', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6030', '谢家集区', null, null, null, null, null, '5', '0', '6026', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6031', '八公山区', null, null, null, null, null, '5', '0', '6026', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6032', '潘集区', null, null, null, null, null, '5', '0', '6026', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6033', '凤台县', null, null, null, null, null, '5', '0', '6026', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6034', '马鞍山市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6035', '市辖区', null, null, null, null, null, '5', '0', '6034', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6036', '金家庄区', null, null, null, null, null, '5', '0', '6034', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6037', '花山区', null, null, null, null, null, '5', '0', '6034', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6038', '雨山区', null, null, null, null, null, '5', '0', '6034', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6039', '当涂县', null, null, null, null, null, '5', '0', '6034', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6040', '淮北市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6041', '市辖区', null, null, null, null, null, '5', '0', '6040', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6042', '杜集区', null, null, null, null, null, '5', '0', '6040', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6043', '相山区', null, null, null, null, null, '5', '0', '6040', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6044', '烈山区', null, null, null, null, null, '5', '0', '6040', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6045', '濉溪县', null, null, null, null, null, '5', '0', '6040', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6046', '铜陵市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6047', '市辖区', null, null, null, null, null, '5', '0', '6046', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6048', '铜官山区', null, null, null, null, null, '5', '0', '6046', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6049', '狮子山区', null, null, null, null, null, '5', '0', '6046', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6050', '郊　区', null, null, null, null, null, '5', '0', '6046', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6051', '铜陵县', null, null, null, null, null, '5', '0', '6046', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6052', '安庆市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6053', '市辖区', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6054', '迎江区', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6055', '大观区', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6056', '郊　区', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6057', '怀宁县', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6058', '枞阳县', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6059', '潜山县', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6060', '太湖县', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6061', '宿松县', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6062', '望江县', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6063', '岳西县', null, null, null, null, null, '5', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6064', '桐城市', null, null, null, null, null, '4', '0', '6052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6065', '黄山市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6066', '市辖区', null, null, null, null, null, '5', '0', '6065', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6067', '屯溪区', null, null, null, null, null, '5', '0', '6065', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6068', '黄山区', null, null, null, null, null, '5', '0', '6065', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6069', '徽州区', null, null, null, null, null, '5', '0', '6065', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6070', '歙　县', null, null, null, null, null, '5', '0', '6065', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6071', '休宁县', null, null, null, null, null, '5', '0', '6065', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6072', '黟　县', null, null, null, null, null, '5', '0', '6065', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6073', '祁门县', null, null, null, null, null, '5', '0', '6065', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6074', '滁州市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6075', '市辖区', null, null, null, null, null, '5', '0', '6074', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6076', '琅琊区', null, null, null, null, null, '5', '0', '6074', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6077', '南谯区', null, null, null, null, null, '5', '0', '6074', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6078', '来安县', null, null, null, null, null, '5', '0', '6074', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6079', '全椒县', null, null, null, null, null, '5', '0', '6074', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6080', '定远县', null, null, null, null, null, '5', '0', '6074', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6081', '凤阳县', null, null, null, null, null, '5', '0', '6074', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6082', '天长市', null, null, null, null, null, '4', '0', '6074', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6083', '明光市', null, null, null, null, null, '4', '0', '6074', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6084', '阜阳市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6085', '市辖区', null, null, null, null, null, '5', '0', '6084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6086', '颍州区', null, null, null, null, null, '5', '0', '6084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6087', '颍东区', null, null, null, null, null, '5', '0', '6084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6088', '颍泉区', null, null, null, null, null, '5', '0', '6084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6089', '临泉县', null, null, null, null, null, '5', '0', '6084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6090', '太和县', null, null, null, null, null, '5', '0', '6084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6091', '阜南县', null, null, null, null, null, '5', '0', '6084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6092', '颍上县', null, null, null, null, null, '5', '0', '6084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6093', '界首市', null, null, null, null, null, '4', '0', '6084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6094', '宿州市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6095', '市辖区', null, null, null, null, null, '5', '0', '6094', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6096', '墉桥区', null, null, null, null, null, '5', '0', '6094', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6097', '砀山县', null, null, null, null, null, '5', '0', '6094', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6098', '萧　县', null, null, null, null, null, '5', '0', '6094', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6099', '灵璧县', null, null, null, null, null, '5', '0', '6094', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6100', '泗　县', null, null, null, null, null, '5', '0', '6094', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6101', '巢湖市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6102', '市辖区', null, null, null, null, null, '5', '0', '6101', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6103', '居巢区', null, null, null, null, null, '5', '0', '6101', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6104', '庐江县', null, null, null, null, null, '5', '0', '6101', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6105', '无为县', null, null, null, null, null, '5', '0', '6101', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6106', '含山县', null, null, null, null, null, '5', '0', '6101', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6107', '和　县', null, null, null, null, null, '5', '0', '6101', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6108', '六安市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6109', '市辖区', null, null, null, null, null, '5', '0', '6108', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6110', '金安区', null, null, null, null, null, '5', '0', '6108', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6111', '裕安区', null, null, null, null, null, '5', '0', '6108', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6112', '寿　县', null, null, null, null, null, '5', '0', '6108', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6113', '霍邱县', null, null, null, null, null, '5', '0', '6108', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6114', '舒城县', null, null, null, null, null, '5', '0', '6108', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6115', '金寨县', null, null, null, null, null, '5', '0', '6108', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6116', '霍山县', null, null, null, null, null, '5', '0', '6108', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6117', '亳州市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6118', '市辖区', null, null, null, null, null, '5', '0', '6117', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6119', '谯城区', null, null, null, null, null, '5', '0', '6117', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6120', '涡阳县', null, null, null, null, null, '5', '0', '6117', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6121', '蒙城县', null, null, null, null, null, '5', '0', '6117', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6122', '利辛县', null, null, null, null, null, '5', '0', '6117', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6123', '池州市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6124', '市辖区', null, null, null, null, null, '5', '0', '6123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6125', '贵池区', null, null, null, null, null, '5', '0', '6123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6126', '东至县', null, null, null, null, null, '5', '0', '6123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6127', '石台县', null, null, null, null, null, '5', '0', '6123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6128', '青阳县', null, null, null, null, null, '5', '0', '6123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6129', '宣城市', null, null, null, null, null, '4', '0', '5998', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6130', '市辖区', null, null, null, null, null, '5', '0', '6129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6131', '宣州区', null, null, null, null, null, '5', '0', '6129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6132', '郎溪县', null, null, null, null, null, '5', '0', '6129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6133', '广德县', null, null, null, null, null, '5', '0', '6129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6134', '泾　县', null, null, null, null, null, '5', '0', '6129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6135', '绩溪县', null, null, null, null, null, '5', '0', '6129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6136', '旌德县', null, null, null, null, null, '5', '0', '6129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6137', '宁国市', null, null, null, null, null, '4', '0', '6129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6138', '福建省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6139', '福州市', null, null, null, null, null, '4', '0', '6138', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6140', '市辖区', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6141', '鼓楼区', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6142', '台江区', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6143', '仓山区', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6144', '马尾区', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6145', '晋安区', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6146', '闽侯县', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6147', '连江县', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6148', '罗源县', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6149', '闽清县', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6150', '永泰县', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6151', '平潭县', null, null, null, null, null, '5', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6152', '福清市', null, null, null, null, null, '4', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6153', '长乐市', null, null, null, null, null, '4', '0', '6139', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6154', '厦门市', null, null, null, null, null, '4', '0', '6138', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6155', '市辖区', null, null, null, null, null, '5', '0', '6154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6156', '思明区', null, null, null, null, null, '5', '0', '6154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6157', '海沧区', null, null, null, null, null, '5', '0', '6154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6158', '湖里区', null, null, null, null, null, '5', '0', '6154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6159', '集美区', null, null, null, null, null, '5', '0', '6154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6160', '同安区', null, null, null, null, null, '5', '0', '6154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6161', '翔安区', null, null, null, null, null, '5', '0', '6154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6162', '莆田市', null, null, null, null, null, '4', '0', '6138', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6163', '市辖区', null, null, null, null, null, '5', '0', '6162', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6164', '城厢区', null, null, null, null, null, '5', '0', '6162', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6165', '涵江区', null, null, null, null, null, '5', '0', '6162', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6166', '荔城区', null, null, null, null, null, '5', '0', '6162', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6167', '秀屿区', null, null, null, null, null, '5', '0', '6162', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6168', '仙游县', null, null, null, null, null, '5', '0', '6162', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6169', '三明市', null, null, null, null, null, '4', '0', '6138', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6170', '市辖区', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6171', '梅列区', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6172', '三元区', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6173', '明溪县', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6174', '清流县', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6175', '宁化县', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6176', '大田县', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6177', '尤溪县', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6178', '沙　县', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6179', '将乐县', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6180', '泰宁县', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6181', '建宁县', null, null, null, null, null, '5', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6182', '永安市', null, null, null, null, null, '4', '0', '6169', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6183', '泉州市', null, null, null, null, null, '4', '0', '6138', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6184', '市辖区', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6185', '鲤城区', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6186', '丰泽区', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6187', '洛江区', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6188', '泉港区', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6189', '惠安县', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6190', '安溪县', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6191', '永春县', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6192', '德化县', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6193', '金门县', null, null, null, null, null, '5', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6194', '石狮市', null, null, null, null, null, '4', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6195', '晋江市', null, null, null, null, null, '4', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6196', '南安市', null, null, null, null, null, '4', '0', '6183', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6197', '漳州市', null, null, null, null, null, '4', '0', '6138', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6198', '市辖区', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6199', '芗城区', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6200', '龙文区', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6201', '云霄县', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6202', '漳浦县', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6203', '诏安县', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6204', '长泰县', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6205', '东山县', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6206', '南靖县', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6207', '平和县', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6208', '华安县', null, null, null, null, null, '5', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6209', '龙海市', null, null, null, null, null, '4', '0', '6197', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6210', '南平市', null, null, null, null, null, '4', '0', '6138', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6211', '市辖区', null, null, null, null, null, '5', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6212', '延平区', null, null, null, null, null, '5', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6213', '顺昌县', null, null, null, null, null, '5', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6214', '浦城县', null, null, null, null, null, '5', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6215', '光泽县', null, null, null, null, null, '5', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6216', '松溪县', null, null, null, null, null, '5', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6217', '政和县', null, null, null, null, null, '5', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6218', '邵武市', null, null, null, null, null, '4', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6219', '武夷山市', null, null, null, null, null, '4', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6220', '建瓯市', null, null, null, null, null, '4', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6221', '建阳市', null, null, null, null, null, '4', '0', '6210', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6222', '龙岩市', null, null, null, null, null, '4', '0', '6138', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6223', '市辖区', null, null, null, null, null, '5', '0', '6222', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6224', '新罗区', null, null, null, null, null, '5', '0', '6222', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6225', '长汀县', null, null, null, null, null, '5', '0', '6222', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6226', '永定县', null, null, null, null, null, '5', '0', '6222', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6227', '上杭县', null, null, null, null, null, '5', '0', '6222', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6228', '武平县', null, null, null, null, null, '5', '0', '6222', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6229', '连城县', null, null, null, null, null, '5', '0', '6222', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6230', '漳平市', null, null, null, null, null, '4', '0', '6222', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6231', '宁德市', null, null, null, null, null, '4', '0', '6138', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6232', '市辖区', null, null, null, null, null, '5', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6233', '蕉城区', null, null, null, null, null, '5', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6234', '霞浦县', null, null, null, null, null, '5', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6235', '古田县', null, null, null, null, null, '5', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6236', '屏南县', null, null, null, null, null, '5', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6237', '寿宁县', null, null, null, null, null, '5', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6238', '周宁县', null, null, null, null, null, '5', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6239', '柘荣县', null, null, null, null, null, '5', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6240', '福安市', null, null, null, null, null, '4', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6241', '福鼎市', null, null, null, null, null, '4', '0', '6231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6242', '江西省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6243', '南昌市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6244', '市辖区', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6245', '东湖区', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6246', '西湖区', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6247', '青云谱区', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6248', '湾里区', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6249', '青山湖区', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6250', '南昌县', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6251', '新建县', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6252', '安义县', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6253', '进贤县', null, null, null, null, null, '5', '0', '6243', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6254', '景德镇市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6255', '市辖区', null, null, null, null, null, '5', '0', '6254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6256', '昌江区', null, null, null, null, null, '5', '0', '6254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6257', '珠山区', null, null, null, null, null, '5', '0', '6254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6258', '浮梁县', null, null, null, null, null, '5', '0', '6254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6259', '乐平市', null, null, null, null, null, '4', '0', '6254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6260', '萍乡市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6261', '市辖区', null, null, null, null, null, '5', '0', '6260', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6262', '安源区', null, null, null, null, null, '5', '0', '6260', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6263', '湘东区', null, null, null, null, null, '5', '0', '6260', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6264', '莲花县', null, null, null, null, null, '5', '0', '6260', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6265', '上栗县', null, null, null, null, null, '5', '0', '6260', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6266', '芦溪县', null, null, null, null, null, '5', '0', '6260', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6267', '九江市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6268', '市辖区', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6269', '庐山区', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6270', '浔阳区', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6271', '九江县', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6272', '武宁县', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6273', '修水县', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6274', '永修县', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6275', '德安县', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6276', '星子县', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6277', '都昌县', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6278', '湖口县', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6279', '彭泽县', null, null, null, null, null, '5', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6280', '瑞昌市', null, null, null, null, null, '4', '0', '6267', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6281', '新余市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6282', '市辖区', null, null, null, null, null, '5', '0', '6281', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6283', '渝水区', null, null, null, null, null, '5', '0', '6281', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6284', '分宜县', null, null, null, null, null, '5', '0', '6281', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6285', '鹰潭市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6286', '市辖区', null, null, null, null, null, '5', '0', '6285', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6287', '月湖区', null, null, null, null, null, '5', '0', '6285', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6288', '余江县', null, null, null, null, null, '5', '0', '6285', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6289', '贵溪市', null, null, null, null, null, '4', '0', '6285', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6290', '赣州市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6291', '市辖区', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6292', '章贡区', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6293', '赣　县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6294', '信丰县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6295', '大余县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6296', '上犹县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6297', '崇义县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6298', '安远县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6299', '龙南县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6300', '定南县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6301', '全南县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6302', '宁都县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6303', '于都县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6304', '兴国县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6305', '会昌县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6306', '寻乌县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6307', '石城县', null, null, null, null, null, '5', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6308', '瑞金市', null, null, null, null, null, '4', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6309', '南康市', null, null, null, null, null, '4', '0', '6290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6310', '吉安市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6311', '市辖区', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6312', '吉州区', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6313', '青原区', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6314', '吉安县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6315', '吉水县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6316', '峡江县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6317', '新干县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6318', '永丰县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6319', '泰和县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6320', '遂川县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6321', '万安县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6322', '安福县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6323', '永新县', null, null, null, null, null, '5', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6324', '井冈山市', null, null, null, null, null, '4', '0', '6310', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6325', '宜春市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6326', '市辖区', null, null, null, null, null, '5', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6327', '袁州区', null, null, null, null, null, '5', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6328', '奉新县', null, null, null, null, null, '5', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6329', '万载县', null, null, null, null, null, '5', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6330', '上高县', null, null, null, null, null, '5', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6331', '宜丰县', null, null, null, null, null, '5', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6332', '靖安县', null, null, null, null, null, '5', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6333', '铜鼓县', null, null, null, null, null, '5', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6334', '丰城市', null, null, null, null, null, '4', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6335', '樟树市', null, null, null, null, null, '4', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6336', '高安市', null, null, null, null, null, '4', '0', '6325', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6337', '抚州市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6338', '市辖区', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6339', '临川区', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6340', '南城县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6341', '黎川县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6342', '南丰县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6343', '崇仁县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6344', '乐安县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6345', '宜黄县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6346', '金溪县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6347', '资溪县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6348', '东乡县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6349', '广昌县', null, null, null, null, null, '5', '0', '6337', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6350', '上饶市', null, null, null, null, null, '4', '0', '6242', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6351', '市辖区', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6352', '信州区', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6353', '上饶县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6354', '广丰县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6355', '玉山县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6356', '铅山县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6357', '横峰县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6358', '弋阳县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6359', '余干县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6360', '鄱阳县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6361', '万年县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6362', '婺源县', null, null, null, null, null, '5', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6363', '德兴市', null, null, null, null, null, '4', '0', '6350', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6364', '山东省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6365', '济南市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6366', '市辖区', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6367', '历下区', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6368', '市中区', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6369', '槐荫区', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6370', '天桥区', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6371', '历城区', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6372', '长清区', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6373', '平阴县', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6374', '济阳县', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6375', '商河县', null, null, null, null, null, '5', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6376', '章丘市', null, null, null, null, null, '4', '0', '6365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6377', '青岛市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6378', '市辖区', null, null, null, null, null, '5', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6379', '市南区', null, null, null, null, null, '5', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6380', '市北区', null, null, null, null, null, '5', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6381', '四方区', null, null, null, null, null, '5', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6382', '黄岛区', null, null, null, null, null, '5', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6383', '崂山区', null, null, null, null, null, '5', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6384', '李沧区', null, null, null, null, null, '5', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6385', '城阳区', null, null, null, null, null, '5', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6386', '胶州市', null, null, null, null, null, '4', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6387', '即墨市', null, null, null, null, null, '4', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6388', '平度市', null, null, null, null, null, '4', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6389', '胶南市', null, null, null, null, null, '4', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6390', '莱西市', null, null, null, null, null, '4', '0', '6377', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6391', '淄博市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6392', '市辖区', null, null, null, null, null, '5', '0', '6391', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6393', '淄川区', null, null, null, null, null, '5', '0', '6391', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6394', '张店区', null, null, null, null, null, '5', '0', '6391', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6395', '博山区', null, null, null, null, null, '5', '0', '6391', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6396', '临淄区', null, null, null, null, null, '5', '0', '6391', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6397', '周村区', null, null, null, null, null, '5', '0', '6391', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6398', '桓台县', null, null, null, null, null, '5', '0', '6391', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6399', '高青县', null, null, null, null, null, '5', '0', '6391', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6400', '沂源县', null, null, null, null, null, '5', '0', '6391', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6401', '枣庄市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6402', '市辖区', null, null, null, null, null, '5', '0', '6401', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6403', '市中区', null, null, null, null, null, '5', '0', '6401', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6404', '薛城区', null, null, null, null, null, '5', '0', '6401', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6405', '峄城区', null, null, null, null, null, '5', '0', '6401', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6406', '台儿庄区', null, null, null, null, null, '5', '0', '6401', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6407', '山亭区', null, null, null, null, null, '5', '0', '6401', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6408', '滕州市', null, null, null, null, null, '4', '0', '6401', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6409', '东营市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6410', '市辖区', null, null, null, null, null, '5', '0', '6409', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6411', '东营区', null, null, null, null, null, '5', '0', '6409', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6412', '河口区', null, null, null, null, null, '5', '0', '6409', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6413', '垦利县', null, null, null, null, null, '5', '0', '6409', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6414', '利津县', null, null, null, null, null, '5', '0', '6409', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6415', '广饶县', null, null, null, null, null, '5', '0', '6409', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6416', '烟台市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6417', '市辖区', null, null, null, null, null, '5', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6418', '芝罘区', null, null, null, null, null, '5', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6419', '福山区', null, null, null, null, null, '5', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6420', '牟平区', null, null, null, null, null, '5', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6421', '莱山区', null, null, null, null, null, '5', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6422', '长岛县', null, null, null, null, null, '5', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6423', '龙口市', null, null, null, null, null, '4', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6424', '莱阳市', null, null, null, null, null, '4', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6425', '莱州市', null, null, null, null, null, '4', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6426', '蓬莱市', null, null, null, null, null, '4', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6427', '招远市', null, null, null, null, null, '4', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6428', '栖霞市', null, null, null, null, null, '4', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6429', '海阳市', null, null, null, null, null, '4', '0', '6416', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6430', '潍坊市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6431', '市辖区', null, null, null, null, null, '5', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6432', '潍城区', null, null, null, null, null, '5', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6433', '寒亭区', null, null, null, null, null, '5', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6434', '坊子区', null, null, null, null, null, '5', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6435', '奎文区', null, null, null, null, null, '5', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6436', '临朐县', null, null, null, null, null, '5', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6437', '昌乐县', null, null, null, null, null, '5', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6438', '青州市', null, null, null, null, null, '4', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6439', '诸城市', null, null, null, null, null, '4', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6440', '寿光市', null, null, null, null, null, '4', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6441', '安丘市', null, null, null, null, null, '4', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6442', '高密市', null, null, null, null, null, '4', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6443', '昌邑市', null, null, null, null, null, '4', '0', '6430', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6444', '济宁市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6445', '市辖区', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6446', '市中区', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6447', '任城区', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6448', '微山县', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6449', '鱼台县', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6450', '金乡县', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6451', '嘉祥县', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6452', '汶上县', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6453', '泗水县', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6454', '梁山县', null, null, null, null, null, '5', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6455', '曲阜市', null, null, null, null, null, '4', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6456', '兖州市', null, null, null, null, null, '4', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6457', '邹城市', null, null, null, null, null, '4', '0', '6444', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6458', '泰安市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6459', '市辖区', null, null, null, null, null, '5', '0', '6458', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6460', '泰山区', null, null, null, null, null, '5', '0', '6458', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6461', '岱岳区', null, null, null, null, null, '5', '0', '6458', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6462', '宁阳县', null, null, null, null, null, '5', '0', '6458', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6463', '东平县', null, null, null, null, null, '5', '0', '6458', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6464', '新泰市', null, null, null, null, null, '4', '0', '6458', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6465', '肥城市', null, null, null, null, null, '4', '0', '6458', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6466', '威海市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6467', '市辖区', null, null, null, null, null, '5', '0', '6466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6468', '环翠区', null, null, null, null, null, '5', '0', '6466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6469', '文登市', null, null, null, null, null, '4', '0', '6466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6470', '荣成市', null, null, null, null, null, '4', '0', '6466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6471', '乳山市', null, null, null, null, null, '4', '0', '6466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6472', '日照市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6473', '市辖区', null, null, null, null, null, '5', '0', '6472', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6474', '东港区', null, null, null, null, null, '5', '0', '6472', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6475', '岚山区', null, null, null, null, null, '5', '0', '6472', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6476', '五莲县', null, null, null, null, null, '5', '0', '6472', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6477', '莒　县', null, null, null, null, null, '5', '0', '6472', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6478', '莱芜市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6479', '市辖区', null, null, null, null, null, '5', '0', '6478', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6480', '莱城区', null, null, null, null, null, '5', '0', '6478', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6481', '钢城区', null, null, null, null, null, '5', '0', '6478', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6482', '临沂市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6483', '市辖区', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6484', '兰山区', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6485', '罗庄区', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6486', '河东区', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6487', '沂南县', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6488', '郯城县', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6489', '沂水县', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6490', '苍山县', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6491', '费　县', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6492', '平邑县', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6493', '莒南县', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6494', '蒙阴县', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6495', '临沭县', null, null, null, null, null, '5', '0', '6482', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6496', '德州市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6497', '市辖区', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6498', '德城区', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6499', '陵　县', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6500', '宁津县', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6501', '庆云县', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6502', '临邑县', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6503', '齐河县', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6504', '平原县', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6505', '夏津县', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6506', '武城县', null, null, null, null, null, '5', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6507', '乐陵市', null, null, null, null, null, '4', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6508', '禹城市', null, null, null, null, null, '4', '0', '6496', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6509', '聊城市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6510', '市辖区', null, null, null, null, null, '5', '0', '6509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6511', '东昌府区', null, null, null, null, null, '5', '0', '6509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6512', '阳谷县', null, null, null, null, null, '5', '0', '6509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6513', '莘　县', null, null, null, null, null, '5', '0', '6509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6514', '茌平县', null, null, null, null, null, '5', '0', '6509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6515', '东阿县', null, null, null, null, null, '5', '0', '6509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6516', '冠　县', null, null, null, null, null, '5', '0', '6509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6517', '高唐县', null, null, null, null, null, '5', '0', '6509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6518', '临清市', null, null, null, null, null, '4', '0', '6509', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6519', '滨州市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6520', '市辖区', null, null, null, null, null, '5', '0', '6519', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6521', '滨城区', null, null, null, null, null, '5', '0', '6519', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6522', '惠民县', null, null, null, null, null, '5', '0', '6519', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6523', '阳信县', null, null, null, null, null, '5', '0', '6519', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6524', '无棣县', null, null, null, null, null, '5', '0', '6519', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6525', '沾化县', null, null, null, null, null, '5', '0', '6519', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6526', '博兴县', null, null, null, null, null, '5', '0', '6519', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6527', '邹平县', null, null, null, null, null, '5', '0', '6519', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6528', '荷泽市', null, null, null, null, null, '4', '0', '6364', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6529', '市辖区', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6530', '牡丹区', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6531', '曹　县', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6532', '单　县', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6533', '成武县', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6534', '巨野县', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6535', '郓城县', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6536', '鄄城县', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6537', '定陶县', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6538', '东明县', null, null, null, null, null, '5', '0', '6528', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6539', '河南省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6540', '郑州市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6541', '市辖区', null, null, null, null, null, '5', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6542', '中原区', null, null, null, null, null, '5', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6543', '二七区', null, null, null, null, null, '5', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6544', '管城回族区', null, null, null, null, null, '5', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6545', '金水区', null, null, null, null, null, '5', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6546', '上街区', null, null, null, null, null, '5', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6547', '邙山区', null, null, null, null, null, '5', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6548', '中牟县', null, null, null, null, null, '5', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6549', '巩义市', null, null, null, null, null, '4', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6550', '荥阳市', null, null, null, null, null, '4', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6551', '新密市', null, null, null, null, null, '4', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6552', '新郑市', null, null, null, null, null, '4', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6553', '登封市', null, null, null, null, null, '4', '0', '6540', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6554', '开封市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6555', '市辖区', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6556', '龙亭区', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6557', '顺河回族区', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6558', '鼓楼区', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6559', '南关区', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6560', '郊　区', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6561', '杞　县', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6562', '通许县', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6563', '尉氏县', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6564', '开封县', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6565', '兰考县', null, null, null, null, null, '5', '0', '6554', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6566', '洛阳市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6567', '市辖区', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6568', '老城区', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6569', '西工区', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6570', '廛河回族区', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6571', '涧西区', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6572', '吉利区', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6573', '洛龙区', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6574', '孟津县', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6575', '新安县', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6576', '栾川县', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6577', '嵩　县', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6578', '汝阳县', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6579', '宜阳县', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6580', '洛宁县', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6581', '伊川县', null, null, null, null, null, '5', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6582', '偃师市', null, null, null, null, null, '4', '0', '6566', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6583', '平顶山市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6584', '市辖区', null, null, null, null, null, '5', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6585', '新华区', null, null, null, null, null, '5', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6586', '卫东区', null, null, null, null, null, '5', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6587', '石龙区', null, null, null, null, null, '5', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6588', '湛河区', null, null, null, null, null, '5', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6589', '宝丰县', null, null, null, null, null, '5', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6590', '叶　县', null, null, null, null, null, '5', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6591', '鲁山县', null, null, null, null, null, '5', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6592', '郏　县', null, null, null, null, null, '5', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6593', '舞钢市', null, null, null, null, null, '4', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6594', '汝州市', null, null, null, null, null, '4', '0', '6583', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6595', '安阳市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6596', '市辖区', null, null, null, null, null, '5', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6597', '文峰区', null, null, null, null, null, '5', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6598', '北关区', null, null, null, null, null, '5', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6599', '殷都区', null, null, null, null, null, '5', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6600', '龙安区', null, null, null, null, null, '5', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6601', '安阳县', null, null, null, null, null, '5', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6602', '汤阴县', null, null, null, null, null, '5', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6603', '滑　县', null, null, null, null, null, '5', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6604', '内黄县', null, null, null, null, null, '5', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6605', '林州市', null, null, null, null, null, '4', '0', '6595', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6606', '鹤壁市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6607', '市辖区', null, null, null, null, null, '5', '0', '6606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6608', '鹤山区', null, null, null, null, null, '5', '0', '6606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6609', '山城区', null, null, null, null, null, '5', '0', '6606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6610', '淇滨区', null, null, null, null, null, '5', '0', '6606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6611', '浚　县', null, null, null, null, null, '5', '0', '6606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6612', '淇　县', null, null, null, null, null, '5', '0', '6606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6613', '新乡市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6614', '市辖区', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6615', '红旗区', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6616', '卫滨区', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6617', '凤泉区', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6618', '牧野区', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6619', '新乡县', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6620', '获嘉县', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6621', '原阳县', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6622', '延津县', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6623', '封丘县', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6624', '长垣县', null, null, null, null, null, '5', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6625', '卫辉市', null, null, null, null, null, '4', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6626', '辉县市', null, null, null, null, null, '4', '0', '6613', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6627', '焦作市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6628', '市辖区', null, null, null, null, null, '5', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6629', '解放区', null, null, null, null, null, '5', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6630', '中站区', null, null, null, null, null, '5', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6631', '马村区', null, null, null, null, null, '5', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6632', '山阳区', null, null, null, null, null, '5', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6633', '修武县', null, null, null, null, null, '5', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6634', '博爱县', null, null, null, null, null, '5', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6635', '武陟县', null, null, null, null, null, '5', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6636', '温　县', null, null, null, null, null, '5', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6637', '济源市', null, null, null, null, null, '4', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6638', '沁阳市', null, null, null, null, null, '4', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6639', '孟州市', null, null, null, null, null, '4', '0', '6627', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6640', '濮阳市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6641', '市辖区', null, null, null, null, null, '5', '0', '6640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6642', '华龙区', null, null, null, null, null, '5', '0', '6640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6643', '清丰县', null, null, null, null, null, '5', '0', '6640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6644', '南乐县', null, null, null, null, null, '5', '0', '6640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6645', '范　县', null, null, null, null, null, '5', '0', '6640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6646', '台前县', null, null, null, null, null, '5', '0', '6640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6647', '濮阳县', null, null, null, null, null, '5', '0', '6640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6648', '许昌市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6649', '市辖区', null, null, null, null, null, '5', '0', '6648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6650', '魏都区', null, null, null, null, null, '5', '0', '6648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6651', '许昌县', null, null, null, null, null, '5', '0', '6648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6652', '鄢陵县', null, null, null, null, null, '5', '0', '6648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6653', '襄城县', null, null, null, null, null, '5', '0', '6648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6654', '禹州市', null, null, null, null, null, '4', '0', '6648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6655', '长葛市', null, null, null, null, null, '4', '0', '6648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6656', '漯河市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6657', '市辖区', null, null, null, null, null, '5', '0', '6656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6658', '源汇区', null, null, null, null, null, '5', '0', '6656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6659', '郾城区', null, null, null, null, null, '5', '0', '6656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6660', '召陵区', null, null, null, null, null, '5', '0', '6656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6661', '舞阳县', null, null, null, null, null, '5', '0', '6656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6662', '临颍县', null, null, null, null, null, '5', '0', '6656', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6663', '三门峡市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6664', '市辖区', null, null, null, null, null, '5', '0', '6663', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6665', '湖滨区', null, null, null, null, null, '5', '0', '6663', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6666', '渑池县', null, null, null, null, null, '5', '0', '6663', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6667', '陕　县', null, null, null, null, null, '5', '0', '6663', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6668', '卢氏县', null, null, null, null, null, '5', '0', '6663', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6669', '义马市', null, null, null, null, null, '4', '0', '6663', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6670', '灵宝市', null, null, null, null, null, '4', '0', '6663', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6671', '南阳市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6672', '市辖区', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6673', '宛城区', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6674', '卧龙区', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6675', '南召县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6676', '方城县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6677', '西峡县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6678', '镇平县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6679', '内乡县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6680', '淅川县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6681', '社旗县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6682', '唐河县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6683', '新野县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6684', '桐柏县', null, null, null, null, null, '5', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6685', '邓州市', null, null, null, null, null, '4', '0', '6671', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6686', '商丘市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6687', '市辖区', null, null, null, null, null, '5', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6688', '梁园区', null, null, null, null, null, '5', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6689', '睢阳区', null, null, null, null, null, '5', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6690', '民权县', null, null, null, null, null, '5', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6691', '睢　县', null, null, null, null, null, '5', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6692', '宁陵县', null, null, null, null, null, '5', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6693', '柘城县', null, null, null, null, null, '5', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6694', '虞城县', null, null, null, null, null, '5', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6695', '夏邑县', null, null, null, null, null, '5', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6696', '永城市', null, null, null, null, null, '4', '0', '6686', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6697', '信阳市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6698', '市辖区', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6699', '师河区', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6700', '平桥区', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6701', '罗山县', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6702', '光山县', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6703', '新　县', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6704', '商城县', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6705', '固始县', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6706', '潢川县', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6707', '淮滨县', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6708', '息　县', null, null, null, null, null, '5', '0', '6697', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6709', '周口市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6710', '市辖区', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6711', '川汇区', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6712', '扶沟县', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6713', '西华县', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6714', '商水县', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6715', '沈丘县', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6716', '郸城县', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6717', '淮阳县', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6718', '太康县', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6719', '鹿邑县', null, null, null, null, null, '5', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6720', '项城市', null, null, null, null, null, '4', '0', '6709', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6721', '驻马店市', null, null, null, null, null, '4', '0', '6539', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6722', '市辖区', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6723', '驿城区', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6724', '西平县', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6725', '上蔡县', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6726', '平舆县', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6727', '正阳县', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6728', '确山县', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6729', '泌阳县', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6730', '汝南县', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6731', '遂平县', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6732', '新蔡县', null, null, null, null, null, '5', '0', '6721', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6733', '湖北省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6734', '武汉市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6735', '市辖区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6736', '江岸区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6737', '江汉区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6738', '乔口区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6739', '汉阳区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6740', '武昌区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6741', '青山区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6742', '洪山区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6743', '东西湖区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6744', '汉南区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6745', '蔡甸区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6746', '江夏区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6747', '黄陂区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6748', '新洲区', null, null, null, null, null, '5', '0', '6734', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6749', '黄石市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6750', '市辖区', null, null, null, null, null, '5', '0', '6749', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6751', '黄石港区', null, null, null, null, null, '5', '0', '6749', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6752', '西塞山区', null, null, null, null, null, '5', '0', '6749', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6753', '下陆区', null, null, null, null, null, '5', '0', '6749', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6754', '铁山区', null, null, null, null, null, '5', '0', '6749', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6755', '阳新县', null, null, null, null, null, '5', '0', '6749', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6756', '大冶市', null, null, null, null, null, '4', '0', '6749', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6757', '十堰市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6758', '市辖区', null, null, null, null, null, '5', '0', '6757', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6759', '茅箭区', null, null, null, null, null, '5', '0', '6757', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6760', '张湾区', null, null, null, null, null, '5', '0', '6757', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6761', '郧　县', null, null, null, null, null, '5', '0', '6757', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6762', '郧西县', null, null, null, null, null, '5', '0', '6757', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6763', '竹山县', null, null, null, null, null, '5', '0', '6757', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6764', '竹溪县', null, null, null, null, null, '5', '0', '6757', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6765', '房　县', null, null, null, null, null, '5', '0', '6757', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6766', '丹江口市', null, null, null, null, null, '4', '0', '6757', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6767', '宜昌市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6768', '市辖区', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6769', '西陵区', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6770', '伍家岗区', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6771', '点军区', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6772', '猇亭区', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6773', '夷陵区', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6774', '远安县', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6775', '兴山县', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6776', '秭归县', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6777', '长阳土家族自治县', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6778', '五峰土家族自治县', null, null, null, null, null, '5', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6779', '宜都市', null, null, null, null, null, '4', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6780', '当阳市', null, null, null, null, null, '4', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6781', '枝江市', null, null, null, null, null, '4', '0', '6767', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6782', '襄樊市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6783', '市辖区', null, null, null, null, null, '5', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6784', '襄城区', null, null, null, null, null, '5', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6785', '樊城区', null, null, null, null, null, '5', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6786', '襄阳区', null, null, null, null, null, '5', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6787', '南漳县', null, null, null, null, null, '5', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6788', '谷城县', null, null, null, null, null, '5', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6789', '保康县', null, null, null, null, null, '5', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6790', '老河口市', null, null, null, null, null, '4', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6791', '枣阳市', null, null, null, null, null, '4', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6792', '宜城市', null, null, null, null, null, '4', '0', '6782', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6793', '鄂州市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6794', '市辖区', null, null, null, null, null, '5', '0', '6793', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6795', '梁子湖区', null, null, null, null, null, '5', '0', '6793', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6796', '华容区', null, null, null, null, null, '5', '0', '6793', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6797', '鄂城区', null, null, null, null, null, '5', '0', '6793', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6798', '荆门市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6799', '市辖区', null, null, null, null, null, '5', '0', '6798', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6800', '东宝区', null, null, null, null, null, '5', '0', '6798', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6801', '掇刀区', null, null, null, null, null, '5', '0', '6798', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6802', '京山县', null, null, null, null, null, '5', '0', '6798', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6803', '沙洋县', null, null, null, null, null, '5', '0', '6798', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6804', '钟祥市', null, null, null, null, null, '4', '0', '6798', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6805', '孝感市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6806', '市辖区', null, null, null, null, null, '5', '0', '6805', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6807', '孝南区', null, null, null, null, null, '5', '0', '6805', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6808', '孝昌县', null, null, null, null, null, '5', '0', '6805', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6809', '大悟县', null, null, null, null, null, '5', '0', '6805', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6810', '云梦县', null, null, null, null, null, '5', '0', '6805', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6811', '应城市', null, null, null, null, null, '4', '0', '6805', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6812', '安陆市', null, null, null, null, null, '4', '0', '6805', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6813', '汉川市', null, null, null, null, null, '4', '0', '6805', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6814', '荆州市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6815', '市辖区', null, null, null, null, null, '5', '0', '6814', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6816', '沙市区', null, null, null, null, null, '5', '0', '6814', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6817', '荆州区', null, null, null, null, null, '5', '0', '6814', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6818', '公安县', null, null, null, null, null, '5', '0', '6814', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6819', '监利县', null, null, null, null, null, '5', '0', '6814', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6820', '江陵县', null, null, null, null, null, '5', '0', '6814', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6821', '石首市', null, null, null, null, null, '4', '0', '6814', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6822', '洪湖市', null, null, null, null, null, '4', '0', '6814', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6823', '松滋市', null, null, null, null, null, '4', '0', '6814', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6824', '黄冈市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6825', '市辖区', null, null, null, null, null, '5', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6826', '黄州区', null, null, null, null, null, '5', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6827', '团风县', null, null, null, null, null, '5', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6828', '红安县', null, null, null, null, null, '5', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6829', '罗田县', null, null, null, null, null, '5', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6830', '英山县', null, null, null, null, null, '5', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6831', '浠水县', null, null, null, null, null, '5', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6832', '蕲春县', null, null, null, null, null, '5', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6833', '黄梅县', null, null, null, null, null, '5', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6834', '麻城市', null, null, null, null, null, '4', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6835', '武穴市', null, null, null, null, null, '4', '0', '6824', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6836', '咸宁市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6837', '市辖区', null, null, null, null, null, '5', '0', '6836', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6838', '咸安区', null, null, null, null, null, '5', '0', '6836', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6839', '嘉鱼县', null, null, null, null, null, '5', '0', '6836', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6840', '通城县', null, null, null, null, null, '5', '0', '6836', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6841', '崇阳县', null, null, null, null, null, '5', '0', '6836', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6842', '通山县', null, null, null, null, null, '5', '0', '6836', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6843', '赤壁市', null, null, null, null, null, '4', '0', '6836', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6844', '随州市', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6845', '市辖区', null, null, null, null, null, '5', '0', '6844', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6846', '曾都区', null, null, null, null, null, '5', '0', '6844', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6847', '广水市', null, null, null, null, null, '4', '0', '6844', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6848', '恩施土家族苗族自治州', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6849', '恩施市', null, null, null, null, null, '4', '0', '6848', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6850', '利川市', null, null, null, null, null, '4', '0', '6848', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6851', '建始县', null, null, null, null, null, '5', '0', '6848', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6852', '巴东县', null, null, null, null, null, '5', '0', '6848', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6853', '宣恩县', null, null, null, null, null, '5', '0', '6848', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6854', '咸丰县', null, null, null, null, null, '5', '0', '6848', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6855', '来凤县', null, null, null, null, null, '5', '0', '6848', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6856', '鹤峰县', null, null, null, null, null, '5', '0', '6848', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6857', '省直辖行政单位', null, null, null, null, null, '4', '0', '6733', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6858', '仙桃市', null, null, null, null, null, '4', '0', '6857', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6859', '潜江市', null, null, null, null, null, '4', '0', '6857', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6860', '天门市', null, null, null, null, null, '4', '0', '6857', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6861', '神农架林区', null, null, null, null, null, '5', '0', '6857', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6862', '湖南省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6863', '长沙市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6864', '市辖区', null, null, null, null, null, '5', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6865', '芙蓉区', null, null, null, null, null, '5', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6866', '天心区', null, null, null, null, null, '5', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6867', '岳麓区', null, null, null, null, null, '5', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6868', '开福区', null, null, null, null, null, '5', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6869', '雨花区', null, null, null, null, null, '5', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6870', '长沙县', null, null, null, null, null, '5', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6871', '望城县', null, null, null, null, null, '5', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6872', '宁乡县', null, null, null, null, null, '5', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6873', '浏阳市', null, null, null, null, null, '4', '0', '6863', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6874', '株洲市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6875', '市辖区', null, null, null, null, null, '5', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6876', '荷塘区', null, null, null, null, null, '5', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6877', '芦淞区', null, null, null, null, null, '5', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6878', '石峰区', null, null, null, null, null, '5', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6879', '天元区', null, null, null, null, null, '5', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6880', '株洲县', null, null, null, null, null, '5', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6881', '攸　县', null, null, null, null, null, '5', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6882', '茶陵县', null, null, null, null, null, '5', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6883', '炎陵县', null, null, null, null, null, '5', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6884', '醴陵市', null, null, null, null, null, '4', '0', '6874', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6885', '湘潭市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6886', '市辖区', null, null, null, null, null, '5', '0', '6885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6887', '雨湖区', null, null, null, null, null, '5', '0', '6885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6888', '岳塘区', null, null, null, null, null, '5', '0', '6885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6889', '湘潭县', null, null, null, null, null, '5', '0', '6885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6890', '湘乡市', null, null, null, null, null, '4', '0', '6885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6891', '韶山市', null, null, null, null, null, '4', '0', '6885', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6892', '衡阳市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6893', '市辖区', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6894', '珠晖区', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6895', '雁峰区', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6896', '石鼓区', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6897', '蒸湘区', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6898', '南岳区', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6899', '衡阳县', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6900', '衡南县', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6901', '衡山县', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6902', '衡东县', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6903', '祁东县', null, null, null, null, null, '5', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6904', '耒阳市', null, null, null, null, null, '4', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6905', '常宁市', null, null, null, null, null, '4', '0', '6892', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6906', '邵阳市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6907', '市辖区', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6908', '双清区', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6909', '大祥区', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6910', '北塔区', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6911', '邵东县', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6912', '新邵县', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6913', '邵阳县', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6914', '隆回县', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6915', '洞口县', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6916', '绥宁县', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6917', '新宁县', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6918', '城步苗族自治县', null, null, null, null, null, '5', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6919', '武冈市', null, null, null, null, null, '4', '0', '6906', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6920', '岳阳市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6921', '市辖区', null, null, null, null, null, '5', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6922', '岳阳楼区', null, null, null, null, null, '5', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6923', '云溪区', null, null, null, null, null, '5', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6924', '君山区', null, null, null, null, null, '5', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6925', '岳阳县', null, null, null, null, null, '5', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6926', '华容县', null, null, null, null, null, '5', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6927', '湘阴县', null, null, null, null, null, '5', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6928', '平江县', null, null, null, null, null, '5', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6929', '汨罗市', null, null, null, null, null, '4', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6930', '临湘市', null, null, null, null, null, '4', '0', '6920', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6931', '常德市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6932', '市辖区', null, null, null, null, null, '5', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6933', '武陵区', null, null, null, null, null, '5', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6934', '鼎城区', null, null, null, null, null, '5', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6935', '安乡县', null, null, null, null, null, '5', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6936', '汉寿县', null, null, null, null, null, '5', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6937', '澧　县', null, null, null, null, null, '5', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6938', '临澧县', null, null, null, null, null, '5', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6939', '桃源县', null, null, null, null, null, '5', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6940', '石门县', null, null, null, null, null, '5', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6941', '津市市', null, null, null, null, null, '4', '0', '6931', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6942', '张家界市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6943', '市辖区', null, null, null, null, null, '5', '0', '6942', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6944', '永定区', null, null, null, null, null, '5', '0', '6942', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6945', '武陵源区', null, null, null, null, null, '5', '0', '6942', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6946', '慈利县', null, null, null, null, null, '5', '0', '6942', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6947', '桑植县', null, null, null, null, null, '5', '0', '6942', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6948', '益阳市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6949', '市辖区', null, null, null, null, null, '5', '0', '6948', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6950', '资阳区', null, null, null, null, null, '5', '0', '6948', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6951', '赫山区', null, null, null, null, null, '5', '0', '6948', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6952', '南　县', null, null, null, null, null, '5', '0', '6948', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6953', '桃江县', null, null, null, null, null, '5', '0', '6948', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6954', '安化县', null, null, null, null, null, '5', '0', '6948', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6955', '沅江市', null, null, null, null, null, '4', '0', '6948', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6956', '郴州市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6957', '市辖区', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6958', '北湖区', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6959', '苏仙区', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6960', '桂阳县', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6961', '宜章县', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6962', '永兴县', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6963', '嘉禾县', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6964', '临武县', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6965', '汝城县', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6966', '桂东县', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6967', '安仁县', null, null, null, null, null, '5', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6968', '资兴市', null, null, null, null, null, '4', '0', '6956', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6969', '永州市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6970', '市辖区', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6971', '芝山区', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6972', '冷水滩区', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6973', '祁阳县', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6974', '东安县', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6975', '双牌县', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6976', '道　县', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6977', '江永县', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6978', '宁远县', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6979', '蓝山县', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6980', '新田县', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6981', '江华瑶族自治县', null, null, null, null, null, '5', '0', '6969', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6982', '怀化市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6983', '市辖区', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6984', '鹤城区', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6985', '中方县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6986', '沅陵县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6987', '辰溪县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6988', '溆浦县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6989', '会同县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6990', '麻阳苗族自治县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6991', '新晃侗族自治县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6992', '芷江侗族自治县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6993', '靖州苗族侗族自治县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6994', '通道侗族自治县', null, null, null, null, null, '5', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6995', '洪江市', null, null, null, null, null, '4', '0', '6982', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6996', '娄底市', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6997', '市辖区', null, null, null, null, null, '5', '0', '6996', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6998', '娄星区', null, null, null, null, null, '5', '0', '6996', null);
INSERT INTO `hcc_tb_area_range` VALUES ('6999', '双峰县', null, null, null, null, null, '5', '0', '6996', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7000', '新化县', null, null, null, null, null, '5', '0', '6996', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7001', '冷水江市', null, null, null, null, null, '4', '0', '6996', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7002', '涟源市', null, null, null, null, null, '4', '0', '6996', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7003', '湘西土家族苗族自治州', null, null, null, null, null, '4', '0', '6862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7004', '吉首市', null, null, null, null, null, '4', '0', '7003', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7005', '泸溪县', null, null, null, null, null, '5', '0', '7003', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7006', '凤凰县', null, null, null, null, null, '5', '0', '7003', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7007', '花垣县', null, null, null, null, null, '5', '0', '7003', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7008', '保靖县', null, null, null, null, null, '5', '0', '7003', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7009', '古丈县', null, null, null, null, null, '5', '0', '7003', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7010', '永顺县', null, null, null, null, null, '5', '0', '7003', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7011', '龙山县', null, null, null, null, null, '5', '0', '7003', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7012', '广东省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7013', '广州市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7014', '市辖区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7015', '东山区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7016', '荔湾区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7017', '越秀区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7018', '海珠区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7019', '天河区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7020', '芳村区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7021', '白云区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7022', '黄埔区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7023', '番禺区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7024', '花都区', null, null, null, null, null, '5', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7025', '增城市', null, null, null, null, null, '4', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7026', '从化市', null, null, null, null, null, '4', '0', '7013', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7027', '韶关市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7028', '市辖区', null, null, null, null, null, '5', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7029', '武江区', null, null, null, null, null, '5', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7030', '浈江区', null, null, null, null, null, '5', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7031', '曲江区', null, null, null, null, null, '5', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7032', '始兴县', null, null, null, null, null, '5', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7033', '仁化县', null, null, null, null, null, '5', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7034', '翁源县', null, null, null, null, null, '5', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7035', '乳源瑶族自治县', null, null, null, null, null, '5', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7036', '新丰县', null, null, null, null, null, '5', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7037', '乐昌市', null, null, null, null, null, '4', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7038', '南雄市', null, null, null, null, null, '4', '0', '7027', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7039', '深圳市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7040', '市辖区', null, null, null, null, null, '5', '0', '7039', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7041', '罗湖区', null, null, null, null, null, '5', '0', '7039', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7042', '福田区', null, null, null, null, null, '5', '0', '7039', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7043', '南山区', null, null, null, null, null, '5', '0', '7039', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7044', '宝安区', null, null, null, null, null, '5', '0', '7039', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7045', '龙岗区', null, null, null, null, null, '5', '0', '7039', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7046', '盐田区', null, null, null, null, null, '5', '0', '7039', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7047', '珠海市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7048', '市辖区', null, null, null, null, null, '5', '0', '7047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7049', '香洲区', null, null, null, null, null, '5', '0', '7047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7050', '斗门区', null, null, null, null, null, '5', '0', '7047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7051', '金湾区', null, null, null, null, null, '5', '0', '7047', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7052', '汕头市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7053', '市辖区', null, null, null, null, null, '5', '0', '7052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7054', '龙湖区', null, null, null, null, null, '5', '0', '7052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7055', '金平区', null, null, null, null, null, '5', '0', '7052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7056', '濠江区', null, null, null, null, null, '5', '0', '7052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7057', '潮阳区', null, null, null, null, null, '5', '0', '7052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7058', '潮南区', null, null, null, null, null, '5', '0', '7052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7059', '澄海区', null, null, null, null, null, '5', '0', '7052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7060', '南澳县', null, null, null, null, null, '5', '0', '7052', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7061', '佛山市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7062', '市辖区', null, null, null, null, null, '5', '0', '7061', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7063', '禅城区', null, null, null, null, null, '5', '0', '7061', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7064', '南海区', null, null, null, null, null, '5', '0', '7061', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7065', '顺德区', null, null, null, null, null, '5', '0', '7061', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7066', '三水区', null, null, null, null, null, '5', '0', '7061', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7067', '高明区', null, null, null, null, null, '5', '0', '7061', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7068', '江门市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7069', '市辖区', null, null, null, null, null, '5', '0', '7068', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7070', '蓬江区', null, null, null, null, null, '5', '0', '7068', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7071', '江海区', null, null, null, null, null, '5', '0', '7068', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7072', '新会区', null, null, null, null, null, '5', '0', '7068', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7073', '台山市', null, null, null, null, null, '4', '0', '7068', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7074', '开平市', null, null, null, null, null, '4', '0', '7068', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7075', '鹤山市', null, null, null, null, null, '4', '0', '7068', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7076', '恩平市', null, null, null, null, null, '4', '0', '7068', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7077', '湛江市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7078', '市辖区', null, null, null, null, null, '5', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7079', '赤坎区', null, null, null, null, null, '5', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7080', '霞山区', null, null, null, null, null, '5', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7081', '坡头区', null, null, null, null, null, '5', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7082', '麻章区', null, null, null, null, null, '5', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7083', '遂溪县', null, null, null, null, null, '5', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7084', '徐闻县', null, null, null, null, null, '5', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7085', '廉江市', null, null, null, null, null, '4', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7086', '雷州市', null, null, null, null, null, '4', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7087', '吴川市', null, null, null, null, null, '4', '0', '7077', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7088', '茂名市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7089', '市辖区', null, null, null, null, null, '5', '0', '7088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7090', '茂南区', null, null, null, null, null, '5', '0', '7088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7091', '茂港区', null, null, null, null, null, '5', '0', '7088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7092', '电白县', null, null, null, null, null, '5', '0', '7088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7093', '高州市', null, null, null, null, null, '4', '0', '7088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7094', '化州市', null, null, null, null, null, '4', '0', '7088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7095', '信宜市', null, null, null, null, null, '4', '0', '7088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7096', '肇庆市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7097', '市辖区', null, null, null, null, null, '5', '0', '7096', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7098', '端州区', null, null, null, null, null, '5', '0', '7096', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7099', '鼎湖区', null, null, null, null, null, '5', '0', '7096', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7100', '广宁县', null, null, null, null, null, '5', '0', '7096', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7101', '怀集县', null, null, null, null, null, '5', '0', '7096', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7102', '封开县', null, null, null, null, null, '5', '0', '7096', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7103', '德庆县', null, null, null, null, null, '5', '0', '7096', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7104', '高要市', null, null, null, null, null, '4', '0', '7096', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7105', '四会市', null, null, null, null, null, '4', '0', '7096', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7106', '惠州市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7107', '市辖区', null, null, null, null, null, '5', '0', '7106', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7108', '惠城区', null, null, null, null, null, '5', '0', '7106', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7109', '惠阳区', null, null, null, null, null, '5', '0', '7106', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7110', '博罗县', null, null, null, null, null, '5', '0', '7106', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7111', '惠东县', null, null, null, null, null, '5', '0', '7106', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7112', '龙门县', null, null, null, null, null, '5', '0', '7106', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7113', '梅州市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7114', '市辖区', null, null, null, null, null, '5', '0', '7113', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7115', '梅江区', null, null, null, null, null, '5', '0', '7113', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7116', '梅　县', null, null, null, null, null, '5', '0', '7113', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7117', '大埔县', null, null, null, null, null, '5', '0', '7113', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7118', '丰顺县', null, null, null, null, null, '5', '0', '7113', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7119', '五华县', null, null, null, null, null, '5', '0', '7113', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7120', '平远县', null, null, null, null, null, '5', '0', '7113', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7121', '蕉岭县', null, null, null, null, null, '5', '0', '7113', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7122', '兴宁市', null, null, null, null, null, '4', '0', '7113', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7123', '汕尾市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7124', '市辖区', null, null, null, null, null, '5', '0', '7123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7125', '城　区', null, null, null, null, null, '5', '0', '7123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7126', '海丰县', null, null, null, null, null, '5', '0', '7123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7127', '陆河县', null, null, null, null, null, '5', '0', '7123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7128', '陆丰市', null, null, null, null, null, '4', '0', '7123', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7129', '河源市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7130', '市辖区', null, null, null, null, null, '5', '0', '7129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7131', '源城区', null, null, null, null, null, '5', '0', '7129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7132', '紫金县', null, null, null, null, null, '5', '0', '7129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7133', '龙川县', null, null, null, null, null, '5', '0', '7129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7134', '连平县', null, null, null, null, null, '5', '0', '7129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7135', '和平县', null, null, null, null, null, '5', '0', '7129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7136', '东源县', null, null, null, null, null, '5', '0', '7129', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7137', '阳江市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7138', '市辖区', null, null, null, null, null, '5', '0', '7137', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7139', '江城区', null, null, null, null, null, '5', '0', '7137', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7140', '阳西县', null, null, null, null, null, '5', '0', '7137', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7141', '阳东县', null, null, null, null, null, '5', '0', '7137', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7142', '阳春市', null, null, null, null, null, '4', '0', '7137', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7143', '清远市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7144', '市辖区', null, null, null, null, null, '5', '0', '7143', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7145', '清城区', null, null, null, null, null, '5', '0', '7143', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7146', '佛冈县', null, null, null, null, null, '5', '0', '7143', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7147', '阳山县', null, null, null, null, null, '5', '0', '7143', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7148', '连山壮族瑶族自治县', null, null, null, null, null, '5', '0', '7143', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7149', '连南瑶族自治县', null, null, null, null, null, '5', '0', '7143', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7150', '清新县', null, null, null, null, null, '5', '0', '7143', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7151', '英德市', null, null, null, null, null, '4', '0', '7143', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7152', '连州市', null, null, null, null, null, '4', '0', '7143', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7153', '东莞市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7154', '中山市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7155', '潮州市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7156', '市辖区', null, null, null, null, null, '5', '0', '7155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7157', '湘桥区', null, null, null, null, null, '5', '0', '7155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7158', '潮安县', null, null, null, null, null, '5', '0', '7155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7159', '饶平县', null, null, null, null, null, '5', '0', '7155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7160', '揭阳市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7161', '市辖区', null, null, null, null, null, '5', '0', '7160', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7162', '榕城区', null, null, null, null, null, '5', '0', '7160', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7163', '揭东县', null, null, null, null, null, '5', '0', '7160', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7164', '揭西县', null, null, null, null, null, '5', '0', '7160', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7165', '惠来县', null, null, null, null, null, '5', '0', '7160', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7166', '普宁市', null, null, null, null, null, '4', '0', '7160', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7167', '云浮市', null, null, null, null, null, '4', '0', '7012', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7168', '市辖区', null, null, null, null, null, '5', '0', '7167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7169', '云城区', null, null, null, null, null, '5', '0', '7167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7170', '新兴县', null, null, null, null, null, '5', '0', '7167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7171', '郁南县', null, null, null, null, null, '5', '0', '7167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7172', '云安县', null, null, null, null, null, '5', '0', '7167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7173', '罗定市', null, null, null, null, null, '4', '0', '7167', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7174', '广西壮族自治区', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7175', '南宁市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7176', '市辖区', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7177', '兴宁区', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7178', '青秀区', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7179', '江南区', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7180', '西乡塘区', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7181', '良庆区', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7182', '邕宁区', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7183', '武鸣县', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7184', '隆安县', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7185', '马山县', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7186', '上林县', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7187', '宾阳县', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7188', '横　县', null, null, null, null, null, '5', '0', '7175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7189', '柳州市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7190', '市辖区', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7191', '城中区', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7192', '鱼峰区', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7193', '柳南区', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7194', '柳北区', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7195', '柳江县', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7196', '柳城县', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7197', '鹿寨县', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7198', '融安县', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7199', '融水苗族自治县', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7200', '三江侗族自治县', null, null, null, null, null, '5', '0', '7189', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7201', '桂林市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7202', '市辖区', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7203', '秀峰区', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7204', '叠彩区', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7205', '象山区', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7206', '七星区', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7207', '雁山区', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7208', '阳朔县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7209', '临桂县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7210', '灵川县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7211', '全州县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7212', '兴安县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7213', '永福县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7214', '灌阳县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7215', '龙胜各族自治县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7216', '资源县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7217', '平乐县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7218', '荔蒲县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7219', '恭城瑶族自治县', null, null, null, null, null, '5', '0', '7201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7220', '梧州市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7221', '市辖区', null, null, null, null, null, '5', '0', '7220', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7222', '万秀区', null, null, null, null, null, '5', '0', '7220', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7223', '蝶山区', null, null, null, null, null, '5', '0', '7220', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7224', '长洲区', null, null, null, null, null, '5', '0', '7220', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7225', '苍梧县', null, null, null, null, null, '5', '0', '7220', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7226', '藤　县', null, null, null, null, null, '5', '0', '7220', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7227', '蒙山县', null, null, null, null, null, '5', '0', '7220', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7228', '岑溪市', null, null, null, null, null, '4', '0', '7220', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7229', '北海市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7230', '市辖区', null, null, null, null, null, '5', '0', '7229', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7231', '海城区', null, null, null, null, null, '5', '0', '7229', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7232', '银海区', null, null, null, null, null, '5', '0', '7229', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7233', '铁山港区', null, null, null, null, null, '5', '0', '7229', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7234', '合浦县', null, null, null, null, null, '5', '0', '7229', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7235', '防城港市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7236', '市辖区', null, null, null, null, null, '5', '0', '7235', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7237', '港口区', null, null, null, null, null, '5', '0', '7235', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7238', '防城区', null, null, null, null, null, '5', '0', '7235', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7239', '上思县', null, null, null, null, null, '5', '0', '7235', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7240', '东兴市', null, null, null, null, null, '4', '0', '7235', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7241', '钦州市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7242', '市辖区', null, null, null, null, null, '5', '0', '7241', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7243', '钦南区', null, null, null, null, null, '5', '0', '7241', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7244', '钦北区', null, null, null, null, null, '5', '0', '7241', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7245', '灵山县', null, null, null, null, null, '5', '0', '7241', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7246', '浦北县', null, null, null, null, null, '5', '0', '7241', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7247', '贵港市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7248', '市辖区', null, null, null, null, null, '5', '0', '7247', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7249', '港北区', null, null, null, null, null, '5', '0', '7247', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7250', '港南区', null, null, null, null, null, '5', '0', '7247', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7251', '覃塘区', null, null, null, null, null, '5', '0', '7247', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7252', '平南县', null, null, null, null, null, '5', '0', '7247', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7253', '桂平市', null, null, null, null, null, '4', '0', '7247', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7254', '玉林市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7255', '市辖区', null, null, null, null, null, '5', '0', '7254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7256', '玉州区', null, null, null, null, null, '5', '0', '7254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7257', '容　县', null, null, null, null, null, '5', '0', '7254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7258', '陆川县', null, null, null, null, null, '5', '0', '7254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7259', '博白县', null, null, null, null, null, '5', '0', '7254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7260', '兴业县', null, null, null, null, null, '5', '0', '7254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7261', '北流市', null, null, null, null, null, '4', '0', '7254', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7262', '百色市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7263', '市辖区', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7264', '右江区', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7265', '田阳县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7266', '田东县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7267', '平果县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7268', '德保县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7269', '靖西县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7270', '那坡县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7271', '凌云县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7272', '乐业县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7273', '田林县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7274', '西林县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7275', '隆林各族自治县', null, null, null, null, null, '5', '0', '7262', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7276', '贺州市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7277', '市辖区', null, null, null, null, null, '5', '0', '7276', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7278', '八步区', null, null, null, null, null, '5', '0', '7276', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7279', '昭平县', null, null, null, null, null, '5', '0', '7276', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7280', '钟山县', null, null, null, null, null, '5', '0', '7276', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7281', '富川瑶族自治县', null, null, null, null, null, '5', '0', '7276', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7282', '河池市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7283', '市辖区', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7284', '金城江区', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7285', '南丹县', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7286', '天峨县', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7287', '凤山县', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7288', '东兰县', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7289', '罗城仫佬族自治县', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7290', '环江毛南族自治县', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7291', '巴马瑶族自治县', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7292', '都安瑶族自治县', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7293', '大化瑶族自治县', null, null, null, null, null, '5', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7294', '宜州市', null, null, null, null, null, '4', '0', '7282', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7295', '来宾市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7296', '市辖区', null, null, null, null, null, '5', '0', '7295', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7297', '兴宾区', null, null, null, null, null, '5', '0', '7295', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7298', '忻城县', null, null, null, null, null, '5', '0', '7295', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7299', '象州县', null, null, null, null, null, '5', '0', '7295', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7300', '武宣县', null, null, null, null, null, '5', '0', '7295', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7301', '金秀瑶族自治县', null, null, null, null, null, '5', '0', '7295', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7302', '合山市', null, null, null, null, null, '4', '0', '7295', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7303', '崇左市', null, null, null, null, null, '4', '0', '7174', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7304', '市辖区', null, null, null, null, null, '5', '0', '7303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7305', '江洲区', null, null, null, null, null, '5', '0', '7303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7306', '扶绥县', null, null, null, null, null, '5', '0', '7303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7307', '宁明县', null, null, null, null, null, '5', '0', '7303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7308', '龙州县', null, null, null, null, null, '5', '0', '7303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7309', '大新县', null, null, null, null, null, '5', '0', '7303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7310', '天等县', null, null, null, null, null, '5', '0', '7303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7311', '凭祥市', null, null, null, null, null, '4', '0', '7303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7312', '海南省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7313', '海口市', null, null, null, null, null, '4', '0', '7312', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7314', '市辖区', null, null, null, null, null, '5', '0', '7313', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7315', '秀英区', null, null, null, null, null, '5', '0', '7313', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7316', '龙华区', null, null, null, null, null, '5', '0', '7313', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7317', '琼山区', null, null, null, null, null, '5', '0', '7313', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7318', '美兰区', null, null, null, null, null, '5', '0', '7313', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7319', '三亚市', null, null, null, null, null, '4', '0', '7312', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7320', '市辖区', null, null, null, null, null, '5', '0', '7319', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7321', '省直辖县级行政单位', null, null, null, null, null, '4', '0', '7312', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7322', '五指山市', null, null, null, null, null, '4', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7323', '琼海市', null, null, null, null, null, '4', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7324', '儋州市', null, null, null, null, null, '4', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7325', '文昌市', null, null, null, null, null, '4', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7326', '万宁市', null, null, null, null, null, '4', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7327', '东方市', null, null, null, null, null, '4', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7328', '定安县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7329', '屯昌县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7330', '澄迈县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7331', '临高县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7332', '白沙黎族自治县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7333', '昌江黎族自治县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7334', '乐东黎族自治县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7335', '陵水黎族自治县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7336', '保亭黎族苗族自治县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7337', '琼中黎族苗族自治县', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7338', '西沙群岛', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7339', '南沙群岛', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7340', '中沙群岛的岛礁及其海域', null, null, null, null, null, '5', '0', '7321', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7341', '重庆市', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7342', '辖区', null, null, null, null, null, '4', '0', '7341', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7343', '万州区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7344', '涪陵区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7345', '渝中区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7346', '大渡口区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7347', '江北区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7348', '沙坪坝区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7349', '九龙坡区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7350', '南岸区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7351', '北碚区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7352', '万盛区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7353', '双桥区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7354', '渝北区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7355', '巴南区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7356', '黔江区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7357', '长寿区', null, null, null, null, null, '5', '0', '7342', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7358', '辖县', null, null, null, null, null, '4', '0', '7341', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7359', '綦江县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7360', '潼南县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7361', '铜梁县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7362', '大足县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7363', '荣昌县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7364', '璧山县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7365', '梁平县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7366', '城口县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7367', '丰都县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7368', '垫江县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7369', '武隆县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7370', '忠　县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7371', '开　县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7372', '云阳县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7373', '奉节县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7374', '巫山县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7375', '巫溪县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7376', '石柱土家族自治县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7377', '秀山土家族苗族自治县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7378', '酉阳土家族苗族自治县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7379', '彭水苗族土家族自治县', null, null, null, null, null, '5', '0', '7358', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7380', '辖市', null, null, null, null, null, '4', '0', '7341', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7381', '江津市', null, null, null, null, null, '5', '0', '7380', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7382', '合川市', null, null, null, null, null, '5', '0', '7380', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7383', '永川市', null, null, null, null, null, '5', '0', '7380', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7384', '南川市', null, null, null, null, null, '5', '0', '7380', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7385', '四川省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7386', '成都市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7387', '市辖区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7388', '锦江区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7389', '青羊区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7390', '金牛区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7391', '武侯区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7392', '成华区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7393', '龙泉驿区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7394', '青白江区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7395', '新都区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7396', '温江区', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7397', '金堂县', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7398', '双流县', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7399', '郫　县', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7400', '大邑县', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7401', '蒲江县', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7402', '新津县', null, null, null, null, null, '5', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7403', '都江堰市', null, null, null, null, null, '4', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7404', '彭州市', null, null, null, null, null, '4', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7405', '邛崃市', null, null, null, null, null, '4', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7406', '崇州市', null, null, null, null, null, '4', '0', '7386', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7407', '自贡市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7408', '市辖区', null, null, null, null, null, '5', '0', '7407', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7409', '自流井区', null, null, null, null, null, '5', '0', '7407', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7410', '贡井区', null, null, null, null, null, '5', '0', '7407', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7411', '大安区', null, null, null, null, null, '5', '0', '7407', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7412', '沿滩区', null, null, null, null, null, '5', '0', '7407', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7413', '荣　县', null, null, null, null, null, '5', '0', '7407', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7414', '富顺县', null, null, null, null, null, '5', '0', '7407', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7415', '攀枝花市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7416', '市辖区', null, null, null, null, null, '5', '0', '7415', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7417', '东　区', null, null, null, null, null, '5', '0', '7415', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7418', '西　区', null, null, null, null, null, '5', '0', '7415', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7419', '仁和区', null, null, null, null, null, '5', '0', '7415', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7420', '米易县', null, null, null, null, null, '5', '0', '7415', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7421', '盐边县', null, null, null, null, null, '5', '0', '7415', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7422', '泸州市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7423', '市辖区', null, null, null, null, null, '5', '0', '7422', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7424', '江阳区', null, null, null, null, null, '5', '0', '7422', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7425', '纳溪区', null, null, null, null, null, '5', '0', '7422', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7426', '龙马潭区', null, null, null, null, null, '5', '0', '7422', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7427', '泸　县', null, null, null, null, null, '5', '0', '7422', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7428', '合江县', null, null, null, null, null, '5', '0', '7422', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7429', '叙永县', null, null, null, null, null, '5', '0', '7422', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7430', '古蔺县', null, null, null, null, null, '5', '0', '7422', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7431', '德阳市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7432', '市辖区', null, null, null, null, null, '5', '0', '7431', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7433', '旌阳区', null, null, null, null, null, '5', '0', '7431', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7434', '中江县', null, null, null, null, null, '5', '0', '7431', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7435', '罗江县', null, null, null, null, null, '5', '0', '7431', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7436', '广汉市', null, null, null, null, null, '4', '0', '7431', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7437', '什邡市', null, null, null, null, null, '4', '0', '7431', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7438', '绵竹市', null, null, null, null, null, '4', '0', '7431', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7439', '绵阳市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7440', '市辖区', null, null, null, null, null, '5', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7441', '涪城区', null, null, null, null, null, '5', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7442', '游仙区', null, null, null, null, null, '5', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7443', '三台县', null, null, null, null, null, '5', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7444', '盐亭县', null, null, null, null, null, '5', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7445', '安　县', null, null, null, null, null, '5', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7446', '梓潼县', null, null, null, null, null, '5', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7447', '北川羌族自治县', null, null, null, null, null, '5', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7448', '平武县', null, null, null, null, null, '5', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7449', '江油市', null, null, null, null, null, '4', '0', '7439', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7450', '广元市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7451', '市辖区', null, null, null, null, null, '5', '0', '7450', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7452', '市中区', null, null, null, null, null, '5', '0', '7450', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7453', '元坝区', null, null, null, null, null, '5', '0', '7450', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7454', '朝天区', null, null, null, null, null, '5', '0', '7450', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7455', '旺苍县', null, null, null, null, null, '5', '0', '7450', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7456', '青川县', null, null, null, null, null, '5', '0', '7450', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7457', '剑阁县', null, null, null, null, null, '5', '0', '7450', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7458', '苍溪县', null, null, null, null, null, '5', '0', '7450', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7459', '遂宁市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7460', '市辖区', null, null, null, null, null, '5', '0', '7459', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7461', '船山区', null, null, null, null, null, '5', '0', '7459', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7462', '安居区', null, null, null, null, null, '5', '0', '7459', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7463', '蓬溪县', null, null, null, null, null, '5', '0', '7459', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7464', '射洪县', null, null, null, null, null, '5', '0', '7459', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7465', '大英县', null, null, null, null, null, '5', '0', '7459', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7466', '内江市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7467', '市辖区', null, null, null, null, null, '5', '0', '7466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7468', '市中区', null, null, null, null, null, '5', '0', '7466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7469', '东兴区', null, null, null, null, null, '5', '0', '7466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7470', '威远县', null, null, null, null, null, '5', '0', '7466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7471', '资中县', null, null, null, null, null, '5', '0', '7466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7472', '隆昌县', null, null, null, null, null, '5', '0', '7466', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7473', '乐山市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7474', '市辖区', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7475', '市中区', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7476', '沙湾区', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7477', '五通桥区', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7478', '金口河区', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7479', '犍为县', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7480', '井研县', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7481', '夹江县', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7482', '沐川县', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7483', '峨边彝族自治县', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7484', '马边彝族自治县', null, null, null, null, null, '5', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7485', '峨眉山市', null, null, null, null, null, '4', '0', '7473', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7486', '南充市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7487', '市辖区', null, null, null, null, null, '5', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7488', '顺庆区', null, null, null, null, null, '5', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7489', '高坪区', null, null, null, null, null, '5', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7490', '嘉陵区', null, null, null, null, null, '5', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7491', '南部县', null, null, null, null, null, '5', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7492', '营山县', null, null, null, null, null, '5', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7493', '蓬安县', null, null, null, null, null, '5', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7494', '仪陇县', null, null, null, null, null, '5', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7495', '西充县', null, null, null, null, null, '5', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7496', '阆中市', null, null, null, null, null, '4', '0', '7486', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7497', '眉山市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7498', '市辖区', null, null, null, null, null, '5', '0', '7497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7499', '东坡区', null, null, null, null, null, '5', '0', '7497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7500', '仁寿县', null, null, null, null, null, '5', '0', '7497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7501', '彭山县', null, null, null, null, null, '5', '0', '7497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7502', '洪雅县', null, null, null, null, null, '5', '0', '7497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7503', '丹棱县', null, null, null, null, null, '5', '0', '7497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7504', '青神县', null, null, null, null, null, '5', '0', '7497', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7505', '宜宾市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7506', '市辖区', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7507', '翠屏区', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7508', '宜宾县', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7509', '南溪县', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7510', '江安县', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7511', '长宁县', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7512', '高　县', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7513', '珙　县', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7514', '筠连县', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7515', '兴文县', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7516', '屏山县', null, null, null, null, null, '5', '0', '7505', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7517', '广安市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7518', '市辖区', null, null, null, null, null, '5', '0', '7517', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7519', '广安区', null, null, null, null, null, '5', '0', '7517', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7520', '岳池县', null, null, null, null, null, '5', '0', '7517', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7521', '武胜县', null, null, null, null, null, '5', '0', '7517', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7522', '邻水县', null, null, null, null, null, '5', '0', '7517', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7523', '华莹市', null, null, null, null, null, '4', '0', '7517', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7524', '达州市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7525', '市辖区', null, null, null, null, null, '5', '0', '7524', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7526', '通川区', null, null, null, null, null, '5', '0', '7524', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7527', '达　县', null, null, null, null, null, '5', '0', '7524', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7528', '宣汉县', null, null, null, null, null, '5', '0', '7524', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7529', '开江县', null, null, null, null, null, '5', '0', '7524', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7530', '大竹县', null, null, null, null, null, '5', '0', '7524', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7531', '渠　县', null, null, null, null, null, '5', '0', '7524', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7532', '万源市', null, null, null, null, null, '4', '0', '7524', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7533', '雅安市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7534', '市辖区', null, null, null, null, null, '5', '0', '7533', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7535', '雨城区', null, null, null, null, null, '5', '0', '7533', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7536', '名山县', null, null, null, null, null, '5', '0', '7533', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7537', '荥经县', null, null, null, null, null, '5', '0', '7533', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7538', '汉源县', null, null, null, null, null, '5', '0', '7533', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7539', '石棉县', null, null, null, null, null, '5', '0', '7533', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7540', '天全县', null, null, null, null, null, '5', '0', '7533', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7541', '芦山县', null, null, null, null, null, '5', '0', '7533', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7542', '宝兴县', null, null, null, null, null, '5', '0', '7533', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7543', '巴中市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7544', '市辖区', null, null, null, null, null, '5', '0', '7543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7545', '巴州区', null, null, null, null, null, '5', '0', '7543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7546', '通江县', null, null, null, null, null, '5', '0', '7543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7547', '南江县', null, null, null, null, null, '5', '0', '7543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7548', '平昌县', null, null, null, null, null, '5', '0', '7543', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7549', '资阳市', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7550', '市辖区', null, null, null, null, null, '5', '0', '7549', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7551', '雁江区', null, null, null, null, null, '5', '0', '7549', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7552', '安岳县', null, null, null, null, null, '5', '0', '7549', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7553', '乐至县', null, null, null, null, null, '5', '0', '7549', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7554', '简阳市', null, null, null, null, null, '4', '0', '7549', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7555', '阿坝藏族羌族自治州', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7556', '汶川县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7557', '理　县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7558', '茂　县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7559', '松潘县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7560', '九寨沟县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7561', '金川县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7562', '小金县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7563', '黑水县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7564', '马尔康县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7565', '壤塘县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7566', '阿坝县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7567', '若尔盖县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7568', '红原县', null, null, null, null, null, '5', '0', '7555', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7569', '甘孜藏族自治州', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7570', '康定县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7571', '泸定县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7572', '丹巴县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7573', '九龙县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7574', '雅江县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7575', '道孚县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7576', '炉霍县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7577', '甘孜县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7578', '新龙县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7579', '德格县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7580', '白玉县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7581', '石渠县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7582', '色达县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7583', '理塘县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7584', '巴塘县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7585', '乡城县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7586', '稻城县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7587', '得荣县', null, null, null, null, null, '5', '0', '7569', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7588', '凉山彝族自治州', null, null, null, null, null, '4', '0', '7385', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7589', '西昌市', null, null, null, null, null, '4', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7590', '木里藏族自治县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7591', '盐源县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7592', '德昌县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7593', '会理县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7594', '会东县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7595', '宁南县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7596', '普格县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7597', '布拖县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7598', '金阳县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7599', '昭觉县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7600', '喜德县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7601', '冕宁县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7602', '越西县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7603', '甘洛县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7604', '美姑县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7605', '雷波县', null, null, null, null, null, '5', '0', '7588', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7606', '贵州省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7607', '贵阳市', null, null, null, null, null, '4', '0', '7606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7608', '市辖区', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7609', '南明区', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7610', '云岩区', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7611', '花溪区', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7612', '乌当区', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7613', '白云区', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7614', '小河区', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7615', '开阳县', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7616', '息烽县', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7617', '修文县', null, null, null, null, null, '5', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7618', '清镇市', null, null, null, null, null, '4', '0', '7607', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7619', '六盘水市', null, null, null, null, null, '4', '0', '7606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7620', '钟山区', null, null, null, null, null, '5', '0', '7619', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7621', '六枝特区', null, null, null, null, null, '5', '0', '7619', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7622', '水城县', null, null, null, null, null, '5', '0', '7619', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7623', '盘　县', null, null, null, null, null, '5', '0', '7619', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7624', '遵义市', null, null, null, null, null, '4', '0', '7606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7625', '市辖区', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7626', '红花岗区', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7627', '汇川区', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7628', '遵义县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7629', '桐梓县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7630', '绥阳县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7631', '正安县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7632', '道真仡佬族苗族自治县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7633', '务川仡佬族苗族自治县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7634', '凤冈县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7635', '湄潭县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7636', '余庆县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7637', '习水县', null, null, null, null, null, '5', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7638', '赤水市', null, null, null, null, null, '4', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7639', '仁怀市', null, null, null, null, null, '4', '0', '7624', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7640', '安顺市', null, null, null, null, null, '4', '0', '7606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7641', '市辖区', null, null, null, null, null, '5', '0', '7640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7642', '西秀区', null, null, null, null, null, '5', '0', '7640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7643', '平坝县', null, null, null, null, null, '5', '0', '7640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7644', '普定县', null, null, null, null, null, '5', '0', '7640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7645', '镇宁布依族苗族自治县', null, null, null, null, null, '5', '0', '7640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7646', '关岭布依族苗族自治县', null, null, null, null, null, '5', '0', '7640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7647', '紫云苗族布依族自治县', null, null, null, null, null, '5', '0', '7640', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7648', '铜仁地区', null, null, null, null, null, '5', '0', '7606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7649', '铜仁市', null, null, null, null, null, '4', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7650', '江口县', null, null, null, null, null, '5', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7651', '玉屏侗族自治县', null, null, null, null, null, '5', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7652', '石阡县', null, null, null, null, null, '5', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7653', '思南县', null, null, null, null, null, '5', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7654', '印江土家族苗族自治县', null, null, null, null, null, '5', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7655', '德江县', null, null, null, null, null, '5', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7656', '沿河土家族自治县', null, null, null, null, null, '5', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7657', '松桃苗族自治县', null, null, null, null, null, '5', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7658', '万山特区', null, null, null, null, null, '5', '0', '7648', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7659', '黔西南布依族苗族自治州', null, null, null, null, null, '4', '0', '7606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7660', '兴义市', null, null, null, null, null, '4', '0', '7659', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7661', '兴仁县', null, null, null, null, null, '5', '0', '7659', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7662', '普安县', null, null, null, null, null, '5', '0', '7659', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7663', '晴隆县', null, null, null, null, null, '5', '0', '7659', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7664', '贞丰县', null, null, null, null, null, '5', '0', '7659', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7665', '望谟县', null, null, null, null, null, '5', '0', '7659', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7666', '册亨县', null, null, null, null, null, '5', '0', '7659', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7667', '安龙县', null, null, null, null, null, '5', '0', '7659', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7668', '毕节地区', null, null, null, null, null, '5', '0', '7606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7669', '毕节市', null, null, null, null, null, '4', '0', '7668', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7670', '大方县', null, null, null, null, null, '5', '0', '7668', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7671', '黔西县', null, null, null, null, null, '5', '0', '7668', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7672', '金沙县', null, null, null, null, null, '5', '0', '7668', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7673', '织金县', null, null, null, null, null, '5', '0', '7668', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7674', '纳雍县', null, null, null, null, null, '5', '0', '7668', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7675', '威宁彝族回族苗族自治县', null, null, null, null, null, '5', '0', '7668', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7676', '赫章县', null, null, null, null, null, '5', '0', '7668', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7677', '黔东南苗族侗族自治州', null, null, null, null, null, '4', '0', '7606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7678', '凯里市', null, null, null, null, null, '4', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7679', '黄平县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7680', '施秉县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7681', '三穗县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7682', '镇远县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7683', '岑巩县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7684', '天柱县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7685', '锦屏县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7686', '剑河县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7687', '台江县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7688', '黎平县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7689', '榕江县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7690', '从江县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7691', '雷山县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7692', '麻江县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7693', '丹寨县', null, null, null, null, null, '5', '0', '7677', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7694', '黔南布依族苗族自治州', null, null, null, null, null, '4', '0', '7606', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7695', '都匀市', null, null, null, null, null, '4', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7696', '福泉市', null, null, null, null, null, '4', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7697', '荔波县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7698', '贵定县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7699', '瓮安县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7700', '独山县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7701', '平塘县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7702', '罗甸县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7703', '长顺县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7704', '龙里县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7705', '惠水县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7706', '三都水族自治县', null, null, null, null, null, '5', '0', '7694', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7707', '云南省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7708', '昆明市', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7709', '市辖区', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7710', '五华区', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7711', '盘龙区', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7712', '官渡区', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7713', '西山区', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7714', '东川区', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7715', '呈贡县', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7716', '晋宁县', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7717', '富民县', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7718', '宜良县', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7719', '石林彝族自治县', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7720', '嵩明县', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7721', '禄劝彝族苗族自治县', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7722', '寻甸回族彝族自治县', null, null, null, null, null, '5', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7723', '安宁市', null, null, null, null, null, '4', '0', '7708', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7724', '曲靖市', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7725', '市辖区', null, null, null, null, null, '5', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7726', '麒麟区', null, null, null, null, null, '5', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7727', '马龙县', null, null, null, null, null, '5', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7728', '陆良县', null, null, null, null, null, '5', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7729', '师宗县', null, null, null, null, null, '5', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7730', '罗平县', null, null, null, null, null, '5', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7731', '富源县', null, null, null, null, null, '5', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7732', '会泽县', null, null, null, null, null, '5', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7733', '沾益县', null, null, null, null, null, '5', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7734', '宣威市', null, null, null, null, null, '4', '0', '7724', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7735', '玉溪市', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7736', '市辖区', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7737', '红塔区', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7738', '江川县', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7739', '澄江县', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7740', '通海县', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7741', '华宁县', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7742', '易门县', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7743', '峨山彝族自治县', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7744', '新平彝族傣族自治县', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7745', '元江哈尼族彝族傣族自治县', null, null, null, null, null, '5', '0', '7735', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7746', '保山市', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7747', '市辖区', null, null, null, null, null, '5', '0', '7746', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7748', '隆阳区', null, null, null, null, null, '5', '0', '7746', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7749', '施甸县', null, null, null, null, null, '5', '0', '7746', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7750', '腾冲县', null, null, null, null, null, '5', '0', '7746', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7751', '龙陵县', null, null, null, null, null, '5', '0', '7746', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7752', '昌宁县', null, null, null, null, null, '5', '0', '7746', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7753', '昭通市', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7754', '市辖区', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7755', '昭阳区', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7756', '鲁甸县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7757', '巧家县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7758', '盐津县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7759', '大关县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7760', '永善县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7761', '绥江县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7762', '镇雄县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7763', '彝良县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7764', '威信县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7765', '水富县', null, null, null, null, null, '5', '0', '7753', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7766', '丽江市', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7767', '市辖区', null, null, null, null, null, '5', '0', '7766', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7768', '古城区', null, null, null, null, null, '5', '0', '7766', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7769', '玉龙纳西族自治县', null, null, null, null, null, '5', '0', '7766', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7770', '永胜县', null, null, null, null, null, '5', '0', '7766', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7771', '华坪县', null, null, null, null, null, '5', '0', '7766', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7772', '宁蒗彝族自治县', null, null, null, null, null, '5', '0', '7766', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7773', '思茅市', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7774', '市辖区', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7775', '翠云区', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7776', '普洱哈尼族彝族自治县', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7777', '墨江哈尼族自治县', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7778', '景东彝族自治县', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7779', '景谷傣族彝族自治县', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7780', '镇沅彝族哈尼族拉祜族自治县', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7781', '江城哈尼族彝族自治县', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7782', '孟连傣族拉祜族佤族自治县', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7783', '澜沧拉祜族自治县', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7784', '西盟佤族自治县', null, null, null, null, null, '5', '0', '7773', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7785', '临沧市', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7786', '市辖区', null, null, null, null, null, '5', '0', '7785', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7787', '临翔区', null, null, null, null, null, '5', '0', '7785', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7788', '凤庆县', null, null, null, null, null, '5', '0', '7785', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7789', '云　县', null, null, null, null, null, '5', '0', '7785', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7790', '永德县', null, null, null, null, null, '5', '0', '7785', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7791', '镇康县', null, null, null, null, null, '5', '0', '7785', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7792', '双江拉祜族佤族布朗族傣族自治县', null, null, null, null, null, '5', '0', '7785', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7793', '耿马傣族佤族自治县', null, null, null, null, null, '5', '0', '7785', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7794', '沧源佤族自治县', null, null, null, null, null, '5', '0', '7785', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7795', '楚雄彝族自治州', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7796', '楚雄市', null, null, null, null, null, '4', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7797', '双柏县', null, null, null, null, null, '5', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7798', '牟定县', null, null, null, null, null, '5', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7799', '南华县', null, null, null, null, null, '5', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7800', '姚安县', null, null, null, null, null, '5', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7801', '大姚县', null, null, null, null, null, '5', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7802', '永仁县', null, null, null, null, null, '5', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7803', '元谋县', null, null, null, null, null, '5', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7804', '武定县', null, null, null, null, null, '5', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7805', '禄丰县', null, null, null, null, null, '5', '0', '7795', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7806', '红河哈尼族彝族自治州', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7807', '个旧市', null, null, null, null, null, '4', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7808', '开远市', null, null, null, null, null, '4', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7809', '蒙自县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7810', '屏边苗族自治县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7811', '建水县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7812', '石屏县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7813', '弥勒县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7814', '泸西县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7815', '元阳县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7816', '红河县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7817', '金平苗族瑶族傣族自治县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7818', '绿春县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7819', '河口瑶族自治县', null, null, null, null, null, '5', '0', '7806', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7820', '文山壮族苗族自治州', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7821', '文山县', null, null, null, null, null, '5', '0', '7820', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7822', '砚山县', null, null, null, null, null, '5', '0', '7820', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7823', '西畴县', null, null, null, null, null, '5', '0', '7820', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7824', '麻栗坡县', null, null, null, null, null, '5', '0', '7820', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7825', '马关县', null, null, null, null, null, '5', '0', '7820', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7826', '丘北县', null, null, null, null, null, '5', '0', '7820', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7827', '广南县', null, null, null, null, null, '5', '0', '7820', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7828', '富宁县', null, null, null, null, null, '5', '0', '7820', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7829', '西双版纳傣族自治州', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7830', '景洪市', null, null, null, null, null, '4', '0', '7829', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7831', '勐海县', null, null, null, null, null, '5', '0', '7829', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7832', '勐腊县', null, null, null, null, null, '5', '0', '7829', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7833', '大理白族自治州', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7834', '大理市', null, null, null, null, null, '4', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7835', '漾濞彝族自治县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7836', '祥云县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7837', '宾川县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7838', '弥渡县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7839', '南涧彝族自治县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7840', '巍山彝族回族自治县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7841', '永平县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7842', '云龙县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7843', '洱源县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7844', '剑川县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7845', '鹤庆县', null, null, null, null, null, '5', '0', '7833', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7846', '德宏傣族景颇族自治州', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7847', '瑞丽市', null, null, null, null, null, '4', '0', '7846', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7848', '潞西市', null, null, null, null, null, '4', '0', '7846', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7849', '梁河县', null, null, null, null, null, '5', '0', '7846', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7850', '盈江县', null, null, null, null, null, '5', '0', '7846', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7851', '陇川县', null, null, null, null, null, '5', '0', '7846', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7852', '怒江傈僳族自治州', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7853', '泸水县', null, null, null, null, null, '5', '0', '7852', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7854', '福贡县', null, null, null, null, null, '5', '0', '7852', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7855', '贡山独龙族怒族自治县', null, null, null, null, null, '5', '0', '7852', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7856', '兰坪白族普米族自治县', null, null, null, null, null, '5', '0', '7852', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7857', '迪庆藏族自治州', null, null, null, null, null, '4', '0', '7707', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7858', '香格里拉县', null, null, null, null, null, '5', '0', '7857', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7859', '德钦县', null, null, null, null, null, '5', '0', '7857', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7860', '维西傈僳族自治县', null, null, null, null, null, '5', '0', '7857', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7861', '西藏自治区', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7862', '拉萨市', null, null, null, null, null, '4', '0', '7861', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7863', '市辖区', null, null, null, null, null, '5', '0', '7862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7864', '城关区', null, null, null, null, null, '5', '0', '7862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7865', '林周县', null, null, null, null, null, '5', '0', '7862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7866', '当雄县', null, null, null, null, null, '5', '0', '7862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7867', '尼木县', null, null, null, null, null, '5', '0', '7862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7868', '曲水县', null, null, null, null, null, '5', '0', '7862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7869', '堆龙德庆县', null, null, null, null, null, '5', '0', '7862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7870', '达孜县', null, null, null, null, null, '5', '0', '7862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7871', '墨竹工卡县', null, null, null, null, null, '5', '0', '7862', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7872', '昌都地区', null, null, null, null, null, '5', '0', '7861', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7873', '昌都县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7874', '江达县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7875', '贡觉县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7876', '类乌齐县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7877', '丁青县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7878', '察雅县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7879', '八宿县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7880', '左贡县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7881', '芒康县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7882', '洛隆县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7883', '边坝县', null, null, null, null, null, '5', '0', '7872', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7884', '山南地区', null, null, null, null, null, '5', '0', '7861', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7885', '乃东县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7886', '扎囊县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7887', '贡嘎县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7888', '桑日县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7889', '琼结县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7890', '曲松县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7891', '措美县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7892', '洛扎县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7893', '加查县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7894', '隆子县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7895', '错那县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7896', '浪卡子县', null, null, null, null, null, '5', '0', '7884', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7897', '日喀则地区', null, null, null, null, null, '5', '0', '7861', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7898', '日喀则市', null, null, null, null, null, '4', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7899', '南木林县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7900', '江孜县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7901', '定日县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7902', '萨迦县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7903', '拉孜县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7904', '昂仁县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7905', '谢通门县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7906', '白朗县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7907', '仁布县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7908', '康马县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7909', '定结县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7910', '仲巴县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7911', '亚东县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7912', '吉隆县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7913', '聂拉木县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7914', '萨嘎县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7915', '岗巴县', null, null, null, null, null, '5', '0', '7897', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7916', '那曲地区', null, null, null, null, null, '5', '0', '7861', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7917', '那曲县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7918', '嘉黎县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7919', '比如县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7920', '聂荣县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7921', '安多县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7922', '申扎县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7923', '索　县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7924', '班戈县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7925', '巴青县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7926', '尼玛县', null, null, null, null, null, '5', '0', '7916', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7927', '阿里地区', null, null, null, null, null, '5', '0', '7861', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7928', '普兰县', null, null, null, null, null, '5', '0', '7927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7929', '札达县', null, null, null, null, null, '5', '0', '7927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7930', '噶尔县', null, null, null, null, null, '5', '0', '7927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7931', '日土县', null, null, null, null, null, '5', '0', '7927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7932', '革吉县', null, null, null, null, null, '5', '0', '7927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7933', '改则县', null, null, null, null, null, '5', '0', '7927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7934', '措勤县', null, null, null, null, null, '5', '0', '7927', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7935', '林芝地区', null, null, null, null, null, '5', '0', '7861', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7936', '林芝县', null, null, null, null, null, '5', '0', '7935', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7937', '工布江达县', null, null, null, null, null, '5', '0', '7935', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7938', '米林县', null, null, null, null, null, '5', '0', '7935', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7939', '墨脱县', null, null, null, null, null, '5', '0', '7935', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7940', '波密县', null, null, null, null, null, '5', '0', '7935', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7941', '察隅县', null, null, null, null, null, '5', '0', '7935', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7942', '朗　县', null, null, null, null, null, '5', '0', '7935', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7943', '陕西省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7944', '西安市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7945', '市辖区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7946', '新城区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7947', '碑林区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7948', '莲湖区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7949', '灞桥区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7950', '未央区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7951', '雁塔区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7952', '阎良区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7953', '临潼区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7954', '长安区', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7955', '蓝田县', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7956', '周至县', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7957', '户　县', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7958', '高陵县', null, null, null, null, null, '5', '0', '7944', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7959', '铜川市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7960', '市辖区', null, null, null, null, null, '5', '0', '7959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7961', '王益区', null, null, null, null, null, '5', '0', '7959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7962', '印台区', null, null, null, null, null, '5', '0', '7959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7963', '耀州区', null, null, null, null, null, '5', '0', '7959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7964', '宜君县', null, null, null, null, null, '5', '0', '7959', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7965', '宝鸡市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7966', '市辖区', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7967', '渭滨区', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7968', '金台区', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7969', '陈仓区', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7970', '凤翔县', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7971', '岐山县', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7972', '扶风县', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7973', '眉　县', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7974', '陇　县', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7975', '千阳县', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7976', '麟游县', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7977', '凤　县', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7978', '太白县', null, null, null, null, null, '5', '0', '7965', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7979', '咸阳市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7980', '市辖区', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7981', '秦都区', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7982', '杨凌区', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7983', '渭城区', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7984', '三原县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7985', '泾阳县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7986', '乾　县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7987', '礼泉县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7988', '永寿县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7989', '彬　县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7990', '长武县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7991', '旬邑县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7992', '淳化县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7993', '武功县', null, null, null, null, null, '5', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7994', '兴平市', null, null, null, null, null, '4', '0', '7979', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7995', '渭南市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7996', '市辖区', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7997', '临渭区', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7998', '华　县', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('7999', '潼关县', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8000', '大荔县', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8001', '合阳县', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8002', '澄城县', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8003', '蒲城县', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8004', '白水县', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8005', '富平县', null, null, null, null, null, '5', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8006', '韩城市', null, null, null, null, null, '4', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8007', '华阴市', null, null, null, null, null, '4', '0', '7995', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8008', '延安市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8009', '市辖区', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8010', '宝塔区', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8011', '延长县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8012', '延川县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8013', '子长县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8014', '安塞县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8015', '志丹县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8016', '吴旗县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8017', '甘泉县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8018', '富　县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8019', '洛川县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8020', '宜川县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8021', '黄龙县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8022', '黄陵县', null, null, null, null, null, '5', '0', '8008', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8023', '汉中市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8024', '市辖区', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8025', '汉台区', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8026', '南郑县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8027', '城固县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8028', '洋　县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8029', '西乡县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8030', '勉　县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8031', '宁强县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8032', '略阳县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8033', '镇巴县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8034', '留坝县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8035', '佛坪县', null, null, null, null, null, '5', '0', '8023', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8036', '榆林市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8037', '市辖区', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8038', '榆阳区', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8039', '神木县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8040', '府谷县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8041', '横山县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8042', '靖边县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8043', '定边县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8044', '绥德县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8045', '米脂县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8046', '佳　县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8047', '吴堡县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8048', '清涧县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8049', '子洲县', null, null, null, null, null, '5', '0', '8036', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8050', '安康市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8051', '市辖区', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8052', '汉滨区', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8053', '汉阴县', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8054', '石泉县', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8055', '宁陕县', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8056', '紫阳县', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8057', '岚皋县', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8058', '平利县', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8059', '镇坪县', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8060', '旬阳县', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8061', '白河县', null, null, null, null, null, '5', '0', '8050', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8062', '商洛市', null, null, null, null, null, '4', '0', '7943', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8063', '市辖区', null, null, null, null, null, '5', '0', '8062', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8064', '商州区', null, null, null, null, null, '5', '0', '8062', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8065', '洛南县', null, null, null, null, null, '5', '0', '8062', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8066', '丹凤县', null, null, null, null, null, '5', '0', '8062', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8067', '商南县', null, null, null, null, null, '5', '0', '8062', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8068', '山阳县', null, null, null, null, null, '5', '0', '8062', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8069', '镇安县', null, null, null, null, null, '5', '0', '8062', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8070', '柞水县', null, null, null, null, null, '5', '0', '8062', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8071', '甘肃省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8072', '兰州市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8073', '市辖区', null, null, null, null, null, '5', '0', '8072', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8074', '城关区', null, null, null, null, null, '5', '0', '8072', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8075', '七里河区', null, null, null, null, null, '5', '0', '8072', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8076', '西固区', null, null, null, null, null, '5', '0', '8072', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8077', '安宁区', null, null, null, null, null, '5', '0', '8072', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8078', '红古区', null, null, null, null, null, '5', '0', '8072', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8079', '永登县', null, null, null, null, null, '5', '0', '8072', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8080', '皋兰县', null, null, null, null, null, '5', '0', '8072', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8081', '榆中县', null, null, null, null, null, '5', '0', '8072', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8082', '嘉峪关市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8083', '市辖区', null, null, null, null, null, '5', '0', '8082', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8084', '金昌市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8085', '市辖区', null, null, null, null, null, '5', '0', '8084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8086', '金川区', null, null, null, null, null, '5', '0', '8084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8087', '永昌县', null, null, null, null, null, '5', '0', '8084', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8088', '白银市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8089', '市辖区', null, null, null, null, null, '5', '0', '8088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8090', '白银区', null, null, null, null, null, '5', '0', '8088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8091', '平川区', null, null, null, null, null, '5', '0', '8088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8092', '靖远县', null, null, null, null, null, '5', '0', '8088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8093', '会宁县', null, null, null, null, null, '5', '0', '8088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8094', '景泰县', null, null, null, null, null, '5', '0', '8088', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8095', '天水市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8096', '市辖区', null, null, null, null, null, '5', '0', '8095', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8097', '秦城区', null, null, null, null, null, '5', '0', '8095', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8098', '北道区', null, null, null, null, null, '5', '0', '8095', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8099', '清水县', null, null, null, null, null, '5', '0', '8095', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8100', '秦安县', null, null, null, null, null, '5', '0', '8095', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8101', '甘谷县', null, null, null, null, null, '5', '0', '8095', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8102', '武山县', null, null, null, null, null, '5', '0', '8095', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8103', '张家川回族自治县', null, null, null, null, null, '5', '0', '8095', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8104', '武威市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8105', '市辖区', null, null, null, null, null, '5', '0', '8104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8106', '凉州区', null, null, null, null, null, '5', '0', '8104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8107', '民勤县', null, null, null, null, null, '5', '0', '8104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8108', '古浪县', null, null, null, null, null, '5', '0', '8104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8109', '天祝藏族自治县', null, null, null, null, null, '5', '0', '8104', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8110', '张掖市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8111', '市辖区', null, null, null, null, null, '5', '0', '8110', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8112', '甘州区', null, null, null, null, null, '5', '0', '8110', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8113', '肃南裕固族自治县', null, null, null, null, null, '5', '0', '8110', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8114', '民乐县', null, null, null, null, null, '5', '0', '8110', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8115', '临泽县', null, null, null, null, null, '5', '0', '8110', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8116', '高台县', null, null, null, null, null, '5', '0', '8110', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8117', '山丹县', null, null, null, null, null, '5', '0', '8110', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8118', '平凉市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8119', '市辖区', null, null, null, null, null, '5', '0', '8118', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8120', '崆峒区', null, null, null, null, null, '5', '0', '8118', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8121', '泾川县', null, null, null, null, null, '5', '0', '8118', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8122', '灵台县', null, null, null, null, null, '5', '0', '8118', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8123', '崇信县', null, null, null, null, null, '5', '0', '8118', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8124', '华亭县', null, null, null, null, null, '5', '0', '8118', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8125', '庄浪县', null, null, null, null, null, '5', '0', '8118', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8126', '静宁县', null, null, null, null, null, '5', '0', '8118', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8127', '酒泉市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8128', '市辖区', null, null, null, null, null, '5', '0', '8127', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8129', '肃州区', null, null, null, null, null, '5', '0', '8127', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8130', '金塔县', null, null, null, null, null, '5', '0', '8127', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8131', '安西县', null, null, null, null, null, '5', '0', '8127', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8132', '肃北蒙古族自治县', null, null, null, null, null, '5', '0', '8127', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8133', '阿克塞哈萨克族自治县', null, null, null, null, null, '5', '0', '8127', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8134', '玉门市', null, null, null, null, null, '4', '0', '8127', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8135', '敦煌市', null, null, null, null, null, '4', '0', '8127', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8136', '庆阳市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8137', '市辖区', null, null, null, null, null, '5', '0', '8136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8138', '西峰区', null, null, null, null, null, '5', '0', '8136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8139', '庆城县', null, null, null, null, null, '5', '0', '8136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8140', '环　县', null, null, null, null, null, '5', '0', '8136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8141', '华池县', null, null, null, null, null, '5', '0', '8136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8142', '合水县', null, null, null, null, null, '5', '0', '8136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8143', '正宁县', null, null, null, null, null, '5', '0', '8136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8144', '宁　县', null, null, null, null, null, '5', '0', '8136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8145', '镇原县', null, null, null, null, null, '5', '0', '8136', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8146', '定西市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8147', '市辖区', null, null, null, null, null, '5', '0', '8146', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8148', '安定区', null, null, null, null, null, '5', '0', '8146', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8149', '通渭县', null, null, null, null, null, '5', '0', '8146', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8150', '陇西县', null, null, null, null, null, '5', '0', '8146', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8151', '渭源县', null, null, null, null, null, '5', '0', '8146', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8152', '临洮县', null, null, null, null, null, '5', '0', '8146', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8153', '漳　县', null, null, null, null, null, '5', '0', '8146', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8154', '岷　县', null, null, null, null, null, '5', '0', '8146', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8155', '陇南市', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8156', '市辖区', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8157', '武都区', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8158', '成　县', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8159', '文　县', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8160', '宕昌县', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8161', '康　县', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8162', '西和县', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8163', '礼　县', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8164', '徽　县', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8165', '两当县', null, null, null, null, null, '5', '0', '8155', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8166', '临夏回族自治州', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8167', '临夏市', null, null, null, null, null, '4', '0', '8166', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8168', '临夏县', null, null, null, null, null, '5', '0', '8166', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8169', '康乐县', null, null, null, null, null, '5', '0', '8166', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8170', '永靖县', null, null, null, null, null, '5', '0', '8166', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8171', '广河县', null, null, null, null, null, '5', '0', '8166', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8172', '和政县', null, null, null, null, null, '5', '0', '8166', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8173', '东乡族自治县', null, null, null, null, null, '5', '0', '8166', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8174', '积石山保安族东乡族撒拉族自治县', null, null, null, null, null, '5', '0', '8166', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8175', '甘南藏族自治州', null, null, null, null, null, '4', '0', '8071', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8176', '合作市', null, null, null, null, null, '4', '0', '8175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8177', '临潭县', null, null, null, null, null, '5', '0', '8175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8178', '卓尼县', null, null, null, null, null, '5', '0', '8175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8179', '舟曲县', null, null, null, null, null, '5', '0', '8175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8180', '迭部县', null, null, null, null, null, '5', '0', '8175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8181', '玛曲县', null, null, null, null, null, '5', '0', '8175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8182', '碌曲县', null, null, null, null, null, '5', '0', '8175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8183', '夏河县', null, null, null, null, null, '5', '0', '8175', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8184', '青海省', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8185', '西宁市', null, null, null, null, null, '4', '0', '8184', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8186', '市辖区', null, null, null, null, null, '5', '0', '8185', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8187', '城东区', null, null, null, null, null, '5', '0', '8185', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8188', '城中区', null, null, null, null, null, '5', '0', '8185', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8189', '城西区', null, null, null, null, null, '5', '0', '8185', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8190', '城北区', null, null, null, null, null, '5', '0', '8185', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8191', '大通回族土族自治县', null, null, null, null, null, '5', '0', '8185', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8192', '湟中县', null, null, null, null, null, '5', '0', '8185', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8193', '湟源县', null, null, null, null, null, '5', '0', '8185', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8194', '海东地区', null, null, null, null, null, '5', '0', '8184', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8195', '平安县', null, null, null, null, null, '5', '0', '8194', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8196', '民和回族土族自治县', null, null, null, null, null, '5', '0', '8194', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8197', '乐都县', null, null, null, null, null, '5', '0', '8194', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8198', '互助土族自治县', null, null, null, null, null, '5', '0', '8194', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8199', '化隆回族自治县', null, null, null, null, null, '5', '0', '8194', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8200', '循化撒拉族自治县', null, null, null, null, null, '5', '0', '8194', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8201', '海北藏族自治州', null, null, null, null, null, '4', '0', '8184', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8202', '门源回族自治县', null, null, null, null, null, '5', '0', '8201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8203', '祁连县', null, null, null, null, null, '5', '0', '8201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8204', '海晏县', null, null, null, null, null, '5', '0', '8201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8205', '刚察县', null, null, null, null, null, '5', '0', '8201', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8206', '黄南藏族自治州', null, null, null, null, null, '4', '0', '8184', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8207', '同仁县', null, null, null, null, null, '5', '0', '8206', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8208', '尖扎县', null, null, null, null, null, '5', '0', '8206', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8209', '泽库县', null, null, null, null, null, '5', '0', '8206', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8210', '河南蒙古族自治县', null, null, null, null, null, '5', '0', '8206', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8211', '海南藏族自治州', null, null, null, null, null, '4', '0', '8184', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8212', '共和县', null, null, null, null, null, '5', '0', '8211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8213', '同德县', null, null, null, null, null, '5', '0', '8211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8214', '贵德县', null, null, null, null, null, '5', '0', '8211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8215', '兴海县', null, null, null, null, null, '5', '0', '8211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8216', '贵南县', null, null, null, null, null, '5', '0', '8211', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8217', '果洛藏族自治州', null, null, null, null, null, '4', '0', '8184', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8218', '玛沁县', null, null, null, null, null, '5', '0', '8217', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8219', '班玛县', null, null, null, null, null, '5', '0', '8217', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8220', '甘德县', null, null, null, null, null, '5', '0', '8217', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8221', '达日县', null, null, null, null, null, '5', '0', '8217', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8222', '久治县', null, null, null, null, null, '5', '0', '8217', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8223', '玛多县', null, null, null, null, null, '5', '0', '8217', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8224', '玉树藏族自治州', null, null, null, null, null, '4', '0', '8184', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8225', '玉树县', null, null, null, null, null, '5', '0', '8224', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8226', '杂多县', null, null, null, null, null, '5', '0', '8224', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8227', '称多县', null, null, null, null, null, '5', '0', '8224', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8228', '治多县', null, null, null, null, null, '5', '0', '8224', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8229', '囊谦县', null, null, null, null, null, '5', '0', '8224', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8230', '曲麻莱县', null, null, null, null, null, '5', '0', '8224', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8231', '海西蒙古族藏族自治州', null, null, null, null, null, '4', '0', '8184', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8232', '格尔木市', null, null, null, null, null, '4', '0', '8231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8233', '德令哈市', null, null, null, null, null, '4', '0', '8231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8234', '乌兰县', null, null, null, null, null, '5', '0', '8231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8235', '都兰县', null, null, null, null, null, '5', '0', '8231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8236', '天峻县', null, null, null, null, null, '5', '0', '8231', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8237', '宁夏回族自治区', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8238', '银川市', null, null, null, null, null, '4', '0', '8237', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8239', '市辖区', null, null, null, null, null, '5', '0', '8238', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8240', '兴庆区', null, null, null, null, null, '5', '0', '8238', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8241', '西夏区', null, null, null, null, null, '5', '0', '8238', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8242', '金凤区', null, null, null, null, null, '5', '0', '8238', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8243', '永宁县', null, null, null, null, null, '5', '0', '8238', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8244', '贺兰县', null, null, null, null, null, '5', '0', '8238', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8245', '灵武市', null, null, null, null, null, '4', '0', '8238', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8246', '石嘴山市', null, null, null, null, null, '4', '0', '8237', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8247', '市辖区', null, null, null, null, null, '5', '0', '8246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8248', '大武口区', null, null, null, null, null, '5', '0', '8246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8249', '惠农区', null, null, null, null, null, '5', '0', '8246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8250', '平罗县', null, null, null, null, null, '5', '0', '8246', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8251', '吴忠市', null, null, null, null, null, '4', '0', '8237', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8252', '市辖区', null, null, null, null, null, '5', '0', '8251', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8253', '利通区', null, null, null, null, null, '5', '0', '8251', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8254', '盐池县', null, null, null, null, null, '5', '0', '8251', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8255', '同心县', null, null, null, null, null, '5', '0', '8251', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8256', '青铜峡市', null, null, null, null, null, '4', '0', '8251', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8257', '固原市', null, null, null, null, null, '4', '0', '8237', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8258', '市辖区', null, null, null, null, null, '5', '0', '8257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8259', '原州区', null, null, null, null, null, '5', '0', '8257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8260', '西吉县', null, null, null, null, null, '5', '0', '8257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8261', '隆德县', null, null, null, null, null, '5', '0', '8257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8262', '泾源县', null, null, null, null, null, '5', '0', '8257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8263', '彭阳县', null, null, null, null, null, '5', '0', '8257', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8264', '中卫市', null, null, null, null, null, '4', '0', '8237', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8265', '市辖区', null, null, null, null, null, '5', '0', '8264', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8266', '沙坡头区', null, null, null, null, null, '5', '0', '8264', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8267', '中宁县', null, null, null, null, null, '5', '0', '8264', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8268', '海原县', null, null, null, null, null, '5', '0', '8264', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8269', '新疆维吾尔自治区', null, null, null, null, null, '3', '0', '1', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8270', '乌鲁木齐市', null, null, null, null, null, '4', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8271', '市辖区', null, null, null, null, null, '5', '0', '8270', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8272', '天山区', null, null, null, null, null, '5', '0', '8270', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8273', '沙依巴克区', null, null, null, null, null, '5', '0', '8270', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8274', '新市区', null, null, null, null, null, '5', '0', '8270', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8275', '水磨沟区', null, null, null, null, null, '5', '0', '8270', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8276', '头屯河区', null, null, null, null, null, '5', '0', '8270', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8277', '达坂城区', null, null, null, null, null, '5', '0', '8270', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8278', '东山区', null, null, null, null, null, '5', '0', '8270', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8279', '乌鲁木齐县', null, null, null, null, null, '5', '0', '8270', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8280', '克拉玛依市', null, null, null, null, null, '4', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8281', '市辖区', null, null, null, null, null, '5', '0', '8280', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8282', '独山子区', null, null, null, null, null, '5', '0', '8280', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8283', '克拉玛依区', null, null, null, null, null, '5', '0', '8280', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8284', '白碱滩区', null, null, null, null, null, '5', '0', '8280', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8285', '乌尔禾区', null, null, null, null, null, '5', '0', '8280', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8286', '吐鲁番地区', null, null, null, null, null, '5', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8287', '吐鲁番市', null, null, null, null, null, '4', '0', '8286', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8288', '鄯善县', null, null, null, null, null, '5', '0', '8286', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8289', '托克逊县', null, null, null, null, null, '5', '0', '8286', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8290', '哈密地区', null, null, null, null, null, '5', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8291', '哈密市', null, null, null, null, null, '4', '0', '8290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8292', '巴里坤哈萨克自治县', null, null, null, null, null, '5', '0', '8290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8293', '伊吾县', null, null, null, null, null, '5', '0', '8290', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8294', '昌吉回族自治州', null, null, null, null, null, '4', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8295', '昌吉市', null, null, null, null, null, '4', '0', '8294', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8296', '阜康市', null, null, null, null, null, '4', '0', '8294', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8297', '米泉市', null, null, null, null, null, '4', '0', '8294', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8298', '呼图壁县', null, null, null, null, null, '5', '0', '8294', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8299', '玛纳斯县', null, null, null, null, null, '5', '0', '8294', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8300', '奇台县', null, null, null, null, null, '5', '0', '8294', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8301', '吉木萨尔县', null, null, null, null, null, '5', '0', '8294', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8302', '木垒哈萨克自治县', null, null, null, null, null, '5', '0', '8294', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8303', '博尔塔拉蒙古自治州', null, null, null, null, null, '4', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8304', '博乐市', null, null, null, null, null, '4', '0', '8303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8305', '精河县', null, null, null, null, null, '5', '0', '8303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8306', '温泉县', null, null, null, null, null, '5', '0', '8303', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8307', '巴音郭楞蒙古自治州', null, null, null, null, null, '4', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8308', '库尔勒市', null, null, null, null, null, '4', '0', '8307', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8309', '轮台县', null, null, null, null, null, '5', '0', '8307', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8310', '尉犁县', null, null, null, null, null, '5', '0', '8307', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8311', '若羌县', null, null, null, null, null, '5', '0', '8307', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8312', '且末县', null, null, null, null, null, '5', '0', '8307', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8313', '焉耆回族自治县', null, null, null, null, null, '5', '0', '8307', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8314', '和静县', null, null, null, null, null, '5', '0', '8307', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8315', '和硕县', null, null, null, null, null, '5', '0', '8307', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8316', '博湖县', null, null, null, null, null, '5', '0', '8307', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8317', '阿克苏地区', null, null, null, null, null, '5', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8318', '阿克苏市', null, null, null, null, null, '4', '0', '8317', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8319', '温宿县', null, null, null, null, null, '5', '0', '8317', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8320', '库车县', null, null, null, null, null, '5', '0', '8317', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8321', '沙雅县', null, null, null, null, null, '5', '0', '8317', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8322', '新和县', null, null, null, null, null, '5', '0', '8317', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8323', '拜城县', null, null, null, null, null, '5', '0', '8317', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8324', '乌什县', null, null, null, null, null, '5', '0', '8317', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8325', '阿瓦提县', null, null, null, null, null, '5', '0', '8317', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8326', '柯坪县', null, null, null, null, null, '5', '0', '8317', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8327', '克孜勒苏柯尔克孜自治州', null, null, null, null, null, '4', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8328', '阿图什市', null, null, null, null, null, '4', '0', '8327', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8329', '阿克陶县', null, null, null, null, null, '5', '0', '8327', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8330', '阿合奇县', null, null, null, null, null, '5', '0', '8327', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8331', '乌恰县', null, null, null, null, null, '5', '0', '8327', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8332', '喀什地区', null, null, null, null, null, '5', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8333', '喀什市', null, null, null, null, null, '4', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8334', '疏附县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8335', '疏勒县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8336', '英吉沙县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8337', '泽普县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8338', '莎车县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8339', '叶城县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8340', '麦盖提县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8341', '岳普湖县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8342', '伽师县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8343', '巴楚县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8344', '塔什库尔干塔吉克自治县', null, null, null, null, null, '5', '0', '8332', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8345', '和田地区', null, null, null, null, null, '5', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8346', '和田市', null, null, null, null, null, '4', '0', '8345', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8347', '和田县', null, null, null, null, null, '5', '0', '8345', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8348', '墨玉县', null, null, null, null, null, '5', '0', '8345', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8349', '皮山县', null, null, null, null, null, '5', '0', '8345', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8350', '洛浦县', null, null, null, null, null, '5', '0', '8345', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8351', '策勒县', null, null, null, null, null, '5', '0', '8345', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8352', '于田县', null, null, null, null, null, '5', '0', '8345', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8353', '民丰县', null, null, null, null, null, '5', '0', '8345', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8354', '伊犁哈萨克自治州', null, null, null, null, null, '4', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8355', '伊宁市', null, null, null, null, null, '4', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8356', '奎屯市', null, null, null, null, null, '4', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8357', '伊宁县', null, null, null, null, null, '5', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8358', '察布查尔锡伯自治县', null, null, null, null, null, '5', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8359', '霍城县', null, null, null, null, null, '5', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8360', '巩留县', null, null, null, null, null, '5', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8361', '新源县', null, null, null, null, null, '5', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8362', '昭苏县', null, null, null, null, null, '5', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8363', '特克斯县', null, null, null, null, null, '5', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8364', '尼勒克县', null, null, null, null, null, '5', '0', '8354', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8365', '塔城地区', null, null, null, null, null, '5', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8366', '塔城市', null, null, null, null, null, '4', '0', '8365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8367', '乌苏市', null, null, null, null, null, '4', '0', '8365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8368', '额敏县', null, null, null, null, null, '5', '0', '8365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8369', '沙湾县', null, null, null, null, null, '5', '0', '8365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8370', '托里县', null, null, null, null, null, '5', '0', '8365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8371', '裕民县', null, null, null, null, null, '5', '0', '8365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8372', '和布克赛尔蒙古自治县', null, null, null, null, null, '5', '0', '8365', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8373', '阿勒泰地区', null, null, null, null, null, '5', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8374', '阿勒泰市', null, null, null, null, null, '4', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8375', '布尔津县', null, null, null, null, null, '5', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8376', '富蕴县', null, null, null, null, null, '5', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8377', '福海县', null, null, null, null, null, '5', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8378', '哈巴河县', null, null, null, null, null, '5', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8379', '青河县', null, null, null, null, null, '5', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8380', '吉木乃县', null, null, null, null, null, '5', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8381', '省直辖行政单位', null, null, null, null, null, '4', '0', '8269', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8382', '石河子市', null, null, null, null, null, '4', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8383', '阿拉尔市', null, null, null, null, null, '4', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8384', '图木舒克市', null, null, null, null, null, '4', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8385', '五家渠市', null, null, null, null, null, '4', '0', '8373', null);
INSERT INTO `hcc_tb_area_range` VALUES ('8386', '东莞市辖', null, null, null, null, null, '5', '0', '7153', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9000', '石岐区', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9001', '东区', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9002', '西区', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9003', '南区', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9004', '五桂山区', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9005', '火炬开发区', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9006', '黄圃镇', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9007', '南头镇', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9008', '东凤镇', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9009', '阜沙镇', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9010', '小榄镇', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9011', '东升镇', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9012', '坦洲镇', null, null, null, null, null, '5', '0', '7154', null);
INSERT INTO `hcc_tb_area_range` VALUES ('9013', '沙溪镇', null, null, null, null, null, '5', '0', '7154', null);

-- ----------------------------
-- Table structure for `hcc_tb_invite_code`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_invite_code`;
CREATE TABLE `hcc_tb_invite_code` (
  `code_id` int(10) NOT NULL AUTO_INCREMENT,
  `state` smallint(2) DEFAULT NULL COMMENT '1有效\r\n   2激活  3已注册\r\n    4已无效\r\n            ',
  `invite_code` varchar(32) DEFAULT NULL,
  `sys_code` varchar(32) DEFAULT NULL COMMENT '由ESB关联',
  `create_date` datetime DEFAULT NULL,
  `use_date` datetime DEFAULT NULL,
  `valid_date` datetime DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `idx_code_id` (`code_id`) USING BTREE,
  KEY `idx_state` (`state`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=701 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_invite_code
-- ----------------------------
INSERT INTO `hcc_tb_invite_code` VALUES ('1', '2', 'kd248szx', 'c102', '2015-01-23 16:14:19', '2015-01-23 16:36:48', '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('2', '1', '8ex1ufqf', 'c102', '2015-01-23 16:14:19', null, '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('3', '1', '4pxiffab', 'c102', '2015-01-23 16:14:19', null, '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('4', '1', 'ginf0l0l', 'c102', '2015-01-23 16:14:19', null, '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('5', '1', 'hurod2ub', 'c102', '2015-01-23 16:14:19', null, '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('6', '1', 'r6ymsikg', 'c102', '2015-01-23 16:14:19', null, '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('7', '1', 'p0zm96tb', 'c102', '2015-01-23 16:14:19', null, '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('8', '1', 'vz5dn13t', 'c102', '2015-01-23 16:14:19', null, '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('9', '1', '2hikk0tp', 'c102', '2015-01-23 16:14:19', null, '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('10', '1', 'i7tbo7er', 'c102', '2015-01-23 16:14:19', null, '2016-12-30 16:14:19', '管理员', null);
INSERT INTO `hcc_tb_invite_code` VALUES ('11', '2', '82fpmp86', 'c102', '2015-01-23 16:14:19', '2015-01-23 16:17:01', '2016-12-30 16:14:19', '管理员', null);

-- ----------------------------
-- Table structure for `hcc_tb_other_user_rela`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_other_user_rela`;
CREATE TABLE `hcc_tb_other_user_rela` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `acc_user_id` int(10) DEFAULT NULL,
  `other_user_id` int(10) DEFAULT NULL,
  `state` smallint(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `mod_date` datetime DEFAULT NULL,
  `other_from` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_acc_userid` (`acc_user_id`) USING BTREE,
  KEY `idx_other_userid` (`other_user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=215649 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hcc_tb_other_user_rela
-- ----------------------------

-- ----------------------------
-- Table structure for `hcc_tb_param_area`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_param_area`;
CREATE TABLE `hcc_tb_param_area` (
  `param_area_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `area_name` varchar(30) DEFAULT NULL COMMENT '1、行为标签\r\n            2、朋友印象\r\n            ',
  PRIMARY KEY (`param_area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9014 DEFAULT CHARSET=utf8 COMMENT='参数地区表';

-- ----------------------------
-- Records of hcc_tb_param_area
-- ----------------------------
INSERT INTO `hcc_tb_param_area` VALUES ('4866', '0', '北京市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4867', '4866', '市辖区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4868', '4867', '东城区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4869', '4867', '西城区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4870', '4867', '崇文区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4871', '4867', '宣武区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4872', '4867', '朝阳区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4873', '4867', '丰台区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4874', '4867', '石景山区  ');
INSERT INTO `hcc_tb_param_area` VALUES ('4875', '4867', '海淀区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4876', '4867', '门头沟区  ');
INSERT INTO `hcc_tb_param_area` VALUES ('4877', '4867', '房山区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4878', '4867', '通州区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4879', '4867', '顺义区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4880', '4867', '昌平区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4881', '4867', '大兴区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4882', '4867', '怀柔区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4883', '4867', '平谷区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4884', '4866', '县        ');
INSERT INTO `hcc_tb_param_area` VALUES ('4885', '4884', '密云县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4886', '4884', '延庆县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4887', '0', '天津市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4888', '4887', '市辖区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4889', '4888', '和平区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4890', '4888', '河东区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4891', '4888', '河西区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4892', '4888', '南开区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4893', '4888', '河北区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4894', '4888', '红桥区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4895', '4888', '塘沽区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4896', '4888', '汉沽区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4897', '4888', '大港区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4898', '4888', '东丽区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4899', '4888', '西青区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4900', '4888', '津南区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4901', '4888', '北辰区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4902', '4888', '武清区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4903', '4888', '宝坻区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4904', '4887', '县        ');
INSERT INTO `hcc_tb_param_area` VALUES ('4905', '4904', '宁河县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4906', '4904', '静海县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4907', '4904', '蓟　县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4908', '0', '河北省    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4909', '4908', '石家庄市  ');
INSERT INTO `hcc_tb_param_area` VALUES ('4910', '4909', '市辖区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4911', '4909', '长安区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4912', '4909', '桥东区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4913', '4909', '桥西区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4914', '4909', '新华区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4915', '4909', '井陉矿区  ');
INSERT INTO `hcc_tb_param_area` VALUES ('4916', '4909', '裕华区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4917', '4909', '井陉县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4918', '4909', '正定县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4919', '4909', '栾城县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4920', '4909', '行唐县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4921', '4909', '灵寿县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4922', '4909', '高邑县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4923', '4909', '深泽县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4924', '4909', '赞皇县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4925', '4909', '无极县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4926', '4909', '平山县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4927', '4909', '元氏县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4928', '4909', '赵　县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4929', '4909', '辛集市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4930', '4909', '藁城市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4931', '4909', '晋州市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4932', '4909', '新乐市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4933', '4909', '鹿泉市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4934', '4908', '唐山市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4935', '4934', '市辖区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4936', '4934', '路南区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4937', '4934', '路北区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4938', '4934', '古冶区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4939', '4934', '开平区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4940', '4934', '丰南区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4941', '4934', '丰润区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4942', '4934', '滦　县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4943', '4934', '滦南县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4944', '4934', '乐亭县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4945', '4934', '迁西县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4946', '4934', '玉田县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4947', '4934', '唐海县    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4948', '4934', '遵化市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4949', '4934', '迁安市    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4950', '4908', '秦皇岛市  ');
INSERT INTO `hcc_tb_param_area` VALUES ('4951', '4950', '市辖区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4952', '4950', '海港区    ');
INSERT INTO `hcc_tb_param_area` VALUES ('4953', '4950', '山海关区  ');
INSERT INTO `hcc_tb_param_area` VALUES ('4954', '4950', '北戴河区  ');
INSERT INTO `hcc_tb_param_area` VALUES ('4955', '4950', '青龙满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('4956', '4950', '昌黎县');
INSERT INTO `hcc_tb_param_area` VALUES ('4957', '4950', '抚宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('4958', '4950', '卢龙县');
INSERT INTO `hcc_tb_param_area` VALUES ('4959', '4908', '邯郸市');
INSERT INTO `hcc_tb_param_area` VALUES ('4960', '4959', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('4961', '4959', '邯山区');
INSERT INTO `hcc_tb_param_area` VALUES ('4962', '4959', '丛台区');
INSERT INTO `hcc_tb_param_area` VALUES ('4963', '4959', '复兴区');
INSERT INTO `hcc_tb_param_area` VALUES ('4964', '4959', '峰峰矿区');
INSERT INTO `hcc_tb_param_area` VALUES ('4965', '4959', '邯郸县');
INSERT INTO `hcc_tb_param_area` VALUES ('4966', '4959', '临漳县');
INSERT INTO `hcc_tb_param_area` VALUES ('4967', '4959', '成安县');
INSERT INTO `hcc_tb_param_area` VALUES ('4968', '4959', '大名县');
INSERT INTO `hcc_tb_param_area` VALUES ('4969', '4959', '涉　县');
INSERT INTO `hcc_tb_param_area` VALUES ('4970', '4959', '磁　县');
INSERT INTO `hcc_tb_param_area` VALUES ('4971', '4959', '肥乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('4972', '4959', '永年县');
INSERT INTO `hcc_tb_param_area` VALUES ('4973', '4959', '邱　县');
INSERT INTO `hcc_tb_param_area` VALUES ('4974', '4959', '鸡泽县');
INSERT INTO `hcc_tb_param_area` VALUES ('4975', '4959', '广平县');
INSERT INTO `hcc_tb_param_area` VALUES ('4976', '4959', '馆陶县');
INSERT INTO `hcc_tb_param_area` VALUES ('4977', '4959', '魏　县');
INSERT INTO `hcc_tb_param_area` VALUES ('4978', '4959', '曲周县');
INSERT INTO `hcc_tb_param_area` VALUES ('4979', '4959', '武安市');
INSERT INTO `hcc_tb_param_area` VALUES ('4980', '4908', '邢台市');
INSERT INTO `hcc_tb_param_area` VALUES ('4981', '4980', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('4982', '4980', '桥东区');
INSERT INTO `hcc_tb_param_area` VALUES ('4983', '4980', '桥西区');
INSERT INTO `hcc_tb_param_area` VALUES ('4984', '4980', '邢台县');
INSERT INTO `hcc_tb_param_area` VALUES ('4985', '4980', '临城县');
INSERT INTO `hcc_tb_param_area` VALUES ('4986', '4980', '内丘县');
INSERT INTO `hcc_tb_param_area` VALUES ('4987', '4980', '柏乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('4988', '4980', '隆尧县');
INSERT INTO `hcc_tb_param_area` VALUES ('4989', '4980', '任　县');
INSERT INTO `hcc_tb_param_area` VALUES ('4990', '4980', '南和县');
INSERT INTO `hcc_tb_param_area` VALUES ('4991', '4980', '宁晋县');
INSERT INTO `hcc_tb_param_area` VALUES ('4992', '4980', '巨鹿县');
INSERT INTO `hcc_tb_param_area` VALUES ('4993', '4980', '新河县');
INSERT INTO `hcc_tb_param_area` VALUES ('4994', '4980', '广宗县');
INSERT INTO `hcc_tb_param_area` VALUES ('4995', '4980', '平乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('4996', '4980', '威　县');
INSERT INTO `hcc_tb_param_area` VALUES ('4997', '4980', '清河县');
INSERT INTO `hcc_tb_param_area` VALUES ('4998', '4980', '临西县');
INSERT INTO `hcc_tb_param_area` VALUES ('4999', '4980', '南宫市');
INSERT INTO `hcc_tb_param_area` VALUES ('5000', '4980', '沙河市');
INSERT INTO `hcc_tb_param_area` VALUES ('5001', '4908', '保定市');
INSERT INTO `hcc_tb_param_area` VALUES ('5002', '5001', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5003', '5001', '新市区');
INSERT INTO `hcc_tb_param_area` VALUES ('5004', '5001', '北市区');
INSERT INTO `hcc_tb_param_area` VALUES ('5005', '5001', '南市区');
INSERT INTO `hcc_tb_param_area` VALUES ('5006', '5001', '满城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5007', '5001', '清苑县');
INSERT INTO `hcc_tb_param_area` VALUES ('5008', '5001', '涞水县');
INSERT INTO `hcc_tb_param_area` VALUES ('5009', '5001', '阜平县');
INSERT INTO `hcc_tb_param_area` VALUES ('5010', '5001', '徐水县');
INSERT INTO `hcc_tb_param_area` VALUES ('5011', '5001', '定兴县');
INSERT INTO `hcc_tb_param_area` VALUES ('5012', '5001', '唐　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5013', '5001', '高阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5014', '5001', '容城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5015', '5001', '涞源县');
INSERT INTO `hcc_tb_param_area` VALUES ('5016', '5001', '望都县');
INSERT INTO `hcc_tb_param_area` VALUES ('5017', '5001', '安新县');
INSERT INTO `hcc_tb_param_area` VALUES ('5018', '5001', '易　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5019', '5001', '曲阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5020', '5001', '蠡　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5021', '5001', '顺平县');
INSERT INTO `hcc_tb_param_area` VALUES ('5022', '5001', '博野县');
INSERT INTO `hcc_tb_param_area` VALUES ('5023', '5001', '雄　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5024', '5001', '涿州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5025', '5001', '定州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5026', '5001', '安国市');
INSERT INTO `hcc_tb_param_area` VALUES ('5027', '5001', '高碑店市');
INSERT INTO `hcc_tb_param_area` VALUES ('5028', '4908', '张家口市');
INSERT INTO `hcc_tb_param_area` VALUES ('5029', '5028', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5030', '5028', '桥东区');
INSERT INTO `hcc_tb_param_area` VALUES ('5031', '5028', '桥西区');
INSERT INTO `hcc_tb_param_area` VALUES ('5032', '5028', '宣化区');
INSERT INTO `hcc_tb_param_area` VALUES ('5033', '5028', '下花园区');
INSERT INTO `hcc_tb_param_area` VALUES ('5034', '5028', '宣化县');
INSERT INTO `hcc_tb_param_area` VALUES ('5035', '5028', '张北县');
INSERT INTO `hcc_tb_param_area` VALUES ('5036', '5028', '康保县');
INSERT INTO `hcc_tb_param_area` VALUES ('5037', '5028', '沽源县');
INSERT INTO `hcc_tb_param_area` VALUES ('5038', '5028', '尚义县');
INSERT INTO `hcc_tb_param_area` VALUES ('5039', '5028', '蔚　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5040', '5028', '阳原县');
INSERT INTO `hcc_tb_param_area` VALUES ('5041', '5028', '怀安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5042', '5028', '万全县');
INSERT INTO `hcc_tb_param_area` VALUES ('5043', '5028', '怀来县');
INSERT INTO `hcc_tb_param_area` VALUES ('5044', '5028', '涿鹿县');
INSERT INTO `hcc_tb_param_area` VALUES ('5045', '5028', '赤城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5046', '5028', '崇礼县');
INSERT INTO `hcc_tb_param_area` VALUES ('5047', '4908', '承德市');
INSERT INTO `hcc_tb_param_area` VALUES ('5048', '5047', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5049', '5047', '双桥区');
INSERT INTO `hcc_tb_param_area` VALUES ('5050', '5047', '双滦区');
INSERT INTO `hcc_tb_param_area` VALUES ('5051', '5047', '鹰手营子矿区');
INSERT INTO `hcc_tb_param_area` VALUES ('5052', '5047', '承德县');
INSERT INTO `hcc_tb_param_area` VALUES ('5053', '5047', '兴隆县');
INSERT INTO `hcc_tb_param_area` VALUES ('5054', '5047', '平泉县');
INSERT INTO `hcc_tb_param_area` VALUES ('5055', '5047', '滦平县');
INSERT INTO `hcc_tb_param_area` VALUES ('5056', '5047', '隆化县');
INSERT INTO `hcc_tb_param_area` VALUES ('5057', '5047', '丰宁满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5058', '5047', '宽城满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5059', '5047', '围场满族蒙古族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5060', '4908', '沧州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5061', '5060', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5062', '5060', '新华区');
INSERT INTO `hcc_tb_param_area` VALUES ('5063', '5060', '运河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5064', '5060', '沧　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5065', '5060', '青　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5066', '5060', '东光县');
INSERT INTO `hcc_tb_param_area` VALUES ('5067', '5060', '海兴县');
INSERT INTO `hcc_tb_param_area` VALUES ('5068', '5060', '盐山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5069', '5060', '肃宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('5070', '5060', '南皮县');
INSERT INTO `hcc_tb_param_area` VALUES ('5071', '5060', '吴桥县');
INSERT INTO `hcc_tb_param_area` VALUES ('5072', '5060', '献　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5073', '5060', '孟村回族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5074', '5060', '泊头市');
INSERT INTO `hcc_tb_param_area` VALUES ('5075', '5060', '任丘市');
INSERT INTO `hcc_tb_param_area` VALUES ('5076', '5060', '黄骅市');
INSERT INTO `hcc_tb_param_area` VALUES ('5077', '5060', '河间市');
INSERT INTO `hcc_tb_param_area` VALUES ('5078', '4908', '廊坊市');
INSERT INTO `hcc_tb_param_area` VALUES ('5079', '5078', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5080', '5078', '安次区');
INSERT INTO `hcc_tb_param_area` VALUES ('5081', '5078', '广阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('5082', '5078', '固安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5083', '5078', '永清县');
INSERT INTO `hcc_tb_param_area` VALUES ('5084', '5078', '香河县');
INSERT INTO `hcc_tb_param_area` VALUES ('5085', '5078', '大城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5086', '5078', '文安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5087', '5078', '大厂回族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5088', '5078', '霸州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5089', '5078', '三河市');
INSERT INTO `hcc_tb_param_area` VALUES ('5090', '4908', '衡水市');
INSERT INTO `hcc_tb_param_area` VALUES ('5091', '5090', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5092', '5090', '桃城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5093', '5090', '枣强县');
INSERT INTO `hcc_tb_param_area` VALUES ('5094', '5090', '武邑县');
INSERT INTO `hcc_tb_param_area` VALUES ('5095', '5090', '武强县');
INSERT INTO `hcc_tb_param_area` VALUES ('5096', '5090', '饶阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5097', '5090', '安平县');
INSERT INTO `hcc_tb_param_area` VALUES ('5098', '5090', '故城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5099', '5090', '景　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5100', '5090', '阜城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5101', '5090', '冀州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5102', '5090', '深州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5103', '0', '山西省');
INSERT INTO `hcc_tb_param_area` VALUES ('5104', '5103', '太原市');
INSERT INTO `hcc_tb_param_area` VALUES ('5105', '5104', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5106', '5104', '小店区');
INSERT INTO `hcc_tb_param_area` VALUES ('5107', '5104', '迎泽区');
INSERT INTO `hcc_tb_param_area` VALUES ('5108', '5104', '杏花岭区');
INSERT INTO `hcc_tb_param_area` VALUES ('5109', '5104', '尖草坪区');
INSERT INTO `hcc_tb_param_area` VALUES ('5110', '5104', '万柏林区');
INSERT INTO `hcc_tb_param_area` VALUES ('5111', '5104', '晋源区');
INSERT INTO `hcc_tb_param_area` VALUES ('5112', '5104', '清徐县');
INSERT INTO `hcc_tb_param_area` VALUES ('5113', '5104', '阳曲县');
INSERT INTO `hcc_tb_param_area` VALUES ('5114', '5104', '娄烦县');
INSERT INTO `hcc_tb_param_area` VALUES ('5115', '5104', '古交市');
INSERT INTO `hcc_tb_param_area` VALUES ('5116', '5103', '大同市');
INSERT INTO `hcc_tb_param_area` VALUES ('5117', '5116', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5118', '5116', '城　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5119', '5116', '矿　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5120', '5116', '南郊区');
INSERT INTO `hcc_tb_param_area` VALUES ('5121', '5116', '新荣区');
INSERT INTO `hcc_tb_param_area` VALUES ('5122', '5116', '阳高县');
INSERT INTO `hcc_tb_param_area` VALUES ('5123', '5116', '天镇县');
INSERT INTO `hcc_tb_param_area` VALUES ('5124', '5116', '广灵县');
INSERT INTO `hcc_tb_param_area` VALUES ('5125', '5116', '灵丘县');
INSERT INTO `hcc_tb_param_area` VALUES ('5126', '5116', '浑源县');
INSERT INTO `hcc_tb_param_area` VALUES ('5127', '5116', '左云县');
INSERT INTO `hcc_tb_param_area` VALUES ('5128', '5116', '大同县');
INSERT INTO `hcc_tb_param_area` VALUES ('5129', '5103', '阳泉市');
INSERT INTO `hcc_tb_param_area` VALUES ('5130', '5129', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5131', '5129', '城　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5132', '5129', '矿　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5133', '5129', '郊　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5134', '5129', '平定县');
INSERT INTO `hcc_tb_param_area` VALUES ('5135', '5129', '盂　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5136', '5103', '长治市');
INSERT INTO `hcc_tb_param_area` VALUES ('5137', '5136', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5138', '5136', '城　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5139', '5136', '郊　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5140', '5136', '长治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5141', '5136', '襄垣县');
INSERT INTO `hcc_tb_param_area` VALUES ('5142', '5136', '屯留县');
INSERT INTO `hcc_tb_param_area` VALUES ('5143', '5136', '平顺县');
INSERT INTO `hcc_tb_param_area` VALUES ('5144', '5136', '黎城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5145', '5136', '壶关县');
INSERT INTO `hcc_tb_param_area` VALUES ('5146', '5136', '长子县');
INSERT INTO `hcc_tb_param_area` VALUES ('5147', '5136', '武乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('5148', '5136', '沁　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5149', '5136', '沁源县');
INSERT INTO `hcc_tb_param_area` VALUES ('5150', '5136', '潞城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5151', '5103', '晋城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5152', '5151', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5153', '5151', '城　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5154', '5151', '沁水县');
INSERT INTO `hcc_tb_param_area` VALUES ('5155', '5151', '阳城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5156', '5151', '陵川县');
INSERT INTO `hcc_tb_param_area` VALUES ('5157', '5151', '泽州县');
INSERT INTO `hcc_tb_param_area` VALUES ('5158', '5151', '高平市');
INSERT INTO `hcc_tb_param_area` VALUES ('5159', '5103', '朔州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5160', '5159', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5161', '5159', '朔城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5162', '5159', '平鲁区');
INSERT INTO `hcc_tb_param_area` VALUES ('5163', '5159', '山阴县');
INSERT INTO `hcc_tb_param_area` VALUES ('5164', '5159', '应　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5165', '5159', '右玉县');
INSERT INTO `hcc_tb_param_area` VALUES ('5166', '5159', '怀仁县');
INSERT INTO `hcc_tb_param_area` VALUES ('5167', '5103', '晋中市');
INSERT INTO `hcc_tb_param_area` VALUES ('5168', '5167', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5169', '5167', '榆次区');
INSERT INTO `hcc_tb_param_area` VALUES ('5170', '5167', '榆社县');
INSERT INTO `hcc_tb_param_area` VALUES ('5171', '5167', '左权县');
INSERT INTO `hcc_tb_param_area` VALUES ('5172', '5167', '和顺县');
INSERT INTO `hcc_tb_param_area` VALUES ('5173', '5167', '昔阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5174', '5167', '寿阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5175', '5167', '太谷县');
INSERT INTO `hcc_tb_param_area` VALUES ('5176', '5167', '祁　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5177', '5167', '平遥县');
INSERT INTO `hcc_tb_param_area` VALUES ('5178', '5167', '灵石县');
INSERT INTO `hcc_tb_param_area` VALUES ('5179', '5167', '介休市');
INSERT INTO `hcc_tb_param_area` VALUES ('5180', '5103', '运城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5181', '5180', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5182', '5180', '盐湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5183', '5180', '临猗县');
INSERT INTO `hcc_tb_param_area` VALUES ('5184', '5180', '万荣县');
INSERT INTO `hcc_tb_param_area` VALUES ('5185', '5180', '闻喜县');
INSERT INTO `hcc_tb_param_area` VALUES ('5186', '5180', '稷山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5187', '5180', '新绛县');
INSERT INTO `hcc_tb_param_area` VALUES ('5188', '5180', '绛　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5189', '5180', '垣曲县');
INSERT INTO `hcc_tb_param_area` VALUES ('5190', '5180', '夏　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5191', '5180', '平陆县');
INSERT INTO `hcc_tb_param_area` VALUES ('5192', '5180', '芮城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5193', '5180', '永济市');
INSERT INTO `hcc_tb_param_area` VALUES ('5194', '5180', '河津市');
INSERT INTO `hcc_tb_param_area` VALUES ('5195', '5103', '忻州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5196', '5195', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5197', '5195', '忻府区');
INSERT INTO `hcc_tb_param_area` VALUES ('5198', '5195', '定襄县');
INSERT INTO `hcc_tb_param_area` VALUES ('5199', '5195', '五台县');
INSERT INTO `hcc_tb_param_area` VALUES ('5200', '5195', '代　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5201', '5195', '繁峙县');
INSERT INTO `hcc_tb_param_area` VALUES ('5202', '5195', '宁武县');
INSERT INTO `hcc_tb_param_area` VALUES ('5203', '5195', '静乐县');
INSERT INTO `hcc_tb_param_area` VALUES ('5204', '5195', '神池县');
INSERT INTO `hcc_tb_param_area` VALUES ('5205', '5195', '五寨县');
INSERT INTO `hcc_tb_param_area` VALUES ('5206', '5195', '岢岚县');
INSERT INTO `hcc_tb_param_area` VALUES ('5207', '5195', '河曲县');
INSERT INTO `hcc_tb_param_area` VALUES ('5208', '5195', '保德县');
INSERT INTO `hcc_tb_param_area` VALUES ('5209', '5195', '偏关县');
INSERT INTO `hcc_tb_param_area` VALUES ('5210', '5195', '原平市');
INSERT INTO `hcc_tb_param_area` VALUES ('5211', '5103', '临汾市');
INSERT INTO `hcc_tb_param_area` VALUES ('5212', '5211', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5213', '5211', '尧都区');
INSERT INTO `hcc_tb_param_area` VALUES ('5214', '5211', '曲沃县');
INSERT INTO `hcc_tb_param_area` VALUES ('5215', '5211', '翼城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5216', '5211', '襄汾县');
INSERT INTO `hcc_tb_param_area` VALUES ('5217', '5211', '洪洞县');
INSERT INTO `hcc_tb_param_area` VALUES ('5218', '5211', '古　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5219', '5211', '安泽县');
INSERT INTO `hcc_tb_param_area` VALUES ('5220', '5211', '浮山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5221', '5211', '吉　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5222', '5211', '乡宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('5223', '5211', '大宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('5224', '5211', '隰　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5225', '5211', '永和县');
INSERT INTO `hcc_tb_param_area` VALUES ('5226', '5211', '蒲　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5227', '5211', '汾西县');
INSERT INTO `hcc_tb_param_area` VALUES ('5228', '5211', '侯马市');
INSERT INTO `hcc_tb_param_area` VALUES ('5229', '5211', '霍州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5230', '5103', '吕梁市');
INSERT INTO `hcc_tb_param_area` VALUES ('5231', '5230', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5232', '5230', '离石区');
INSERT INTO `hcc_tb_param_area` VALUES ('5233', '5230', '文水县');
INSERT INTO `hcc_tb_param_area` VALUES ('5234', '5230', '交城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5235', '5230', '兴　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5236', '5230', '临　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5237', '5230', '柳林县');
INSERT INTO `hcc_tb_param_area` VALUES ('5238', '5230', '石楼县');
INSERT INTO `hcc_tb_param_area` VALUES ('5239', '5230', '岚　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5240', '5230', '方山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5241', '5230', '中阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5242', '5230', '交口县');
INSERT INTO `hcc_tb_param_area` VALUES ('5243', '5230', '孝义市');
INSERT INTO `hcc_tb_param_area` VALUES ('5244', '5230', '汾阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('5245', '0', '内蒙古自治区');
INSERT INTO `hcc_tb_param_area` VALUES ('5246', '5245', '呼和浩特市');
INSERT INTO `hcc_tb_param_area` VALUES ('5247', '5246', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5248', '5246', '新城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5249', '5246', '回民区');
INSERT INTO `hcc_tb_param_area` VALUES ('5250', '5246', '玉泉区');
INSERT INTO `hcc_tb_param_area` VALUES ('5251', '5246', '赛罕区');
INSERT INTO `hcc_tb_param_area` VALUES ('5252', '5246', '土默特左旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5253', '5246', '托克托县');
INSERT INTO `hcc_tb_param_area` VALUES ('5254', '5246', '和林格尔县');
INSERT INTO `hcc_tb_param_area` VALUES ('5255', '5246', '清水河县');
INSERT INTO `hcc_tb_param_area` VALUES ('5256', '5246', '武川县');
INSERT INTO `hcc_tb_param_area` VALUES ('5257', '5245', '包头市');
INSERT INTO `hcc_tb_param_area` VALUES ('5258', '5257', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5259', '5257', '东河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5260', '5257', '昆都仑区');
INSERT INTO `hcc_tb_param_area` VALUES ('5261', '5257', '青山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5262', '5257', '石拐区');
INSERT INTO `hcc_tb_param_area` VALUES ('5263', '5257', '白云矿区');
INSERT INTO `hcc_tb_param_area` VALUES ('5264', '5257', '九原区');
INSERT INTO `hcc_tb_param_area` VALUES ('5265', '5257', '土默特右旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5266', '5257', '固阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5267', '5257', '达尔罕茂明安联合旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5268', '5245', '乌海市');
INSERT INTO `hcc_tb_param_area` VALUES ('5269', '5268', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5270', '5268', '海勃湾区');
INSERT INTO `hcc_tb_param_area` VALUES ('5271', '5268', '海南区');
INSERT INTO `hcc_tb_param_area` VALUES ('5272', '5268', '乌达区');
INSERT INTO `hcc_tb_param_area` VALUES ('5273', '5245', '赤峰市');
INSERT INTO `hcc_tb_param_area` VALUES ('5274', '5273', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5275', '5273', '红山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5276', '5273', '元宝山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5277', '5273', '松山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5278', '5273', '阿鲁科尔沁旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5279', '5273', '巴林左旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5280', '5273', '巴林右旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5281', '5273', '林西县');
INSERT INTO `hcc_tb_param_area` VALUES ('5282', '5273', '克什克腾旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5283', '5273', '翁牛特旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5284', '5273', '喀喇沁旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5285', '5273', '宁城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5286', '5273', '敖汉旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5287', '5245', '通辽市');
INSERT INTO `hcc_tb_param_area` VALUES ('5288', '5287', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5289', '5287', '科尔沁区');
INSERT INTO `hcc_tb_param_area` VALUES ('5290', '5287', '科尔沁左翼中旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5291', '5287', '科尔沁左翼后旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5292', '5287', '开鲁县');
INSERT INTO `hcc_tb_param_area` VALUES ('5293', '5287', '库伦旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5294', '5287', '奈曼旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5295', '5287', '扎鲁特旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5296', '5287', '霍林郭勒市');
INSERT INTO `hcc_tb_param_area` VALUES ('5297', '5245', '鄂尔多斯市');
INSERT INTO `hcc_tb_param_area` VALUES ('5298', '5297', '东胜区');
INSERT INTO `hcc_tb_param_area` VALUES ('5299', '5297', '达拉特旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5300', '5297', '准格尔旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5301', '5297', '鄂托克前旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5302', '5297', '鄂托克旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5303', '5297', '杭锦旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5304', '5297', '乌审旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5305', '5297', '伊金霍洛旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5306', '5245', '呼伦贝尔市');
INSERT INTO `hcc_tb_param_area` VALUES ('5307', '5306', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5308', '5306', '海拉尔区');
INSERT INTO `hcc_tb_param_area` VALUES ('5309', '5306', '阿荣旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5310', '5306', '莫力达瓦达斡尔族自治旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5311', '5306', '鄂伦春自治旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5312', '5306', '鄂温克族自治旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5313', '5306', '陈巴尔虎旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5314', '5306', '新巴尔虎左旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5315', '5306', '新巴尔虎右旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5316', '5306', '满洲里市');
INSERT INTO `hcc_tb_param_area` VALUES ('5317', '5306', '牙克石市');
INSERT INTO `hcc_tb_param_area` VALUES ('5318', '5306', '扎兰屯市');
INSERT INTO `hcc_tb_param_area` VALUES ('5319', '5306', '额尔古纳市');
INSERT INTO `hcc_tb_param_area` VALUES ('5320', '5306', '根河市');
INSERT INTO `hcc_tb_param_area` VALUES ('5321', '5245', '巴彦淖尔市');
INSERT INTO `hcc_tb_param_area` VALUES ('5322', '5321', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5323', '5321', '临河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5324', '5321', '五原县');
INSERT INTO `hcc_tb_param_area` VALUES ('5325', '5321', '磴口县');
INSERT INTO `hcc_tb_param_area` VALUES ('5326', '5321', '乌拉特前旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5327', '5321', '乌拉特中旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5328', '5321', '乌拉特后旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5329', '5321', '杭锦后旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5330', '5245', '乌兰察布市');
INSERT INTO `hcc_tb_param_area` VALUES ('5331', '5330', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5332', '5330', '集宁区');
INSERT INTO `hcc_tb_param_area` VALUES ('5333', '5330', '卓资县');
INSERT INTO `hcc_tb_param_area` VALUES ('5334', '5330', '化德县');
INSERT INTO `hcc_tb_param_area` VALUES ('5335', '5330', '商都县');
INSERT INTO `hcc_tb_param_area` VALUES ('5336', '5330', '兴和县');
INSERT INTO `hcc_tb_param_area` VALUES ('5337', '5330', '凉城县');
INSERT INTO `hcc_tb_param_area` VALUES ('5338', '5330', '察哈尔右翼前旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5339', '5330', '察哈尔右翼中旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5340', '5330', '察哈尔右翼后旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5341', '5330', '四子王旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5342', '5330', '丰镇市');
INSERT INTO `hcc_tb_param_area` VALUES ('5343', '5245', '兴安盟');
INSERT INTO `hcc_tb_param_area` VALUES ('5344', '5343', '乌兰浩特市');
INSERT INTO `hcc_tb_param_area` VALUES ('5345', '5343', '阿尔山市');
INSERT INTO `hcc_tb_param_area` VALUES ('5346', '5343', '科尔沁右翼前旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5347', '5343', '科尔沁右翼中旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5348', '5343', '扎赉特旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5349', '5343', '突泉县');
INSERT INTO `hcc_tb_param_area` VALUES ('5350', '5245', '锡林郭勒盟');
INSERT INTO `hcc_tb_param_area` VALUES ('5351', '5350', '二连浩特市');
INSERT INTO `hcc_tb_param_area` VALUES ('5352', '5350', '锡林浩特市');
INSERT INTO `hcc_tb_param_area` VALUES ('5353', '5350', '阿巴嘎旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5354', '5350', '苏尼特左旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5355', '5350', '苏尼特右旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5356', '5350', '东乌珠穆沁旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5357', '5350', '西乌珠穆沁旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5358', '5350', '太仆寺旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5359', '5350', '镶黄旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5360', '5350', '正镶白旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5361', '5350', '正蓝旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5362', '5350', '多伦县');
INSERT INTO `hcc_tb_param_area` VALUES ('5363', '5245', '阿拉善盟');
INSERT INTO `hcc_tb_param_area` VALUES ('5364', '5363', '阿拉善左旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5365', '5363', '阿拉善右旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5366', '5363', '额济纳旗');
INSERT INTO `hcc_tb_param_area` VALUES ('5367', '0', '辽宁省');
INSERT INTO `hcc_tb_param_area` VALUES ('5368', '5367', '沈阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('5369', '5368', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5370', '5368', '和平区');
INSERT INTO `hcc_tb_param_area` VALUES ('5371', '5368', '沈河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5372', '5368', '大东区');
INSERT INTO `hcc_tb_param_area` VALUES ('5373', '5368', '皇姑区');
INSERT INTO `hcc_tb_param_area` VALUES ('5374', '5368', '铁西区');
INSERT INTO `hcc_tb_param_area` VALUES ('5375', '5368', '苏家屯区');
INSERT INTO `hcc_tb_param_area` VALUES ('5376', '5368', '东陵区');
INSERT INTO `hcc_tb_param_area` VALUES ('5377', '5368', '新城子区');
INSERT INTO `hcc_tb_param_area` VALUES ('5378', '5368', '于洪区');
INSERT INTO `hcc_tb_param_area` VALUES ('5379', '5368', '辽中县');
INSERT INTO `hcc_tb_param_area` VALUES ('5380', '5368', '康平县');
INSERT INTO `hcc_tb_param_area` VALUES ('5381', '5368', '法库县');
INSERT INTO `hcc_tb_param_area` VALUES ('5382', '5368', '新民市');
INSERT INTO `hcc_tb_param_area` VALUES ('5383', '5367', '大连市');
INSERT INTO `hcc_tb_param_area` VALUES ('5384', '5383', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5385', '5383', '中山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5386', '5383', '西岗区');
INSERT INTO `hcc_tb_param_area` VALUES ('5387', '5383', '沙河口区');
INSERT INTO `hcc_tb_param_area` VALUES ('5388', '5383', '甘井子区');
INSERT INTO `hcc_tb_param_area` VALUES ('5389', '5383', '旅顺口区');
INSERT INTO `hcc_tb_param_area` VALUES ('5390', '5383', '金州区');
INSERT INTO `hcc_tb_param_area` VALUES ('5391', '5383', '长海县');
INSERT INTO `hcc_tb_param_area` VALUES ('5392', '5383', '瓦房店市');
INSERT INTO `hcc_tb_param_area` VALUES ('5393', '5383', '普兰店市');
INSERT INTO `hcc_tb_param_area` VALUES ('5394', '5383', '庄河市');
INSERT INTO `hcc_tb_param_area` VALUES ('5395', '5367', '鞍山市');
INSERT INTO `hcc_tb_param_area` VALUES ('5396', '5395', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5397', '5395', '铁东区');
INSERT INTO `hcc_tb_param_area` VALUES ('5398', '5395', '铁西区');
INSERT INTO `hcc_tb_param_area` VALUES ('5399', '5395', '立山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5400', '5395', '千山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5401', '5395', '台安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5402', '5395', '岫岩满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5403', '5395', '海城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5404', '5367', '抚顺市');
INSERT INTO `hcc_tb_param_area` VALUES ('5405', '5404', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5406', '5404', '新抚区');
INSERT INTO `hcc_tb_param_area` VALUES ('5407', '5404', '东洲区');
INSERT INTO `hcc_tb_param_area` VALUES ('5408', '5404', '望花区');
INSERT INTO `hcc_tb_param_area` VALUES ('5409', '5404', '顺城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5410', '5404', '抚顺县');
INSERT INTO `hcc_tb_param_area` VALUES ('5411', '5404', '新宾满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5412', '5404', '清原满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5413', '5367', '本溪市');
INSERT INTO `hcc_tb_param_area` VALUES ('5414', '5413', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5415', '5413', '平山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5416', '5413', '溪湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5417', '5413', '明山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5418', '5413', '南芬区');
INSERT INTO `hcc_tb_param_area` VALUES ('5419', '5413', '本溪满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5420', '5413', '桓仁满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5421', '5367', '丹东市');
INSERT INTO `hcc_tb_param_area` VALUES ('5422', '5421', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5423', '5421', '元宝区');
INSERT INTO `hcc_tb_param_area` VALUES ('5424', '5421', '振兴区');
INSERT INTO `hcc_tb_param_area` VALUES ('5425', '5421', '振安区');
INSERT INTO `hcc_tb_param_area` VALUES ('5426', '5421', '宽甸满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5427', '5421', '东港市');
INSERT INTO `hcc_tb_param_area` VALUES ('5428', '5421', '凤城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5429', '5367', '锦州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5430', '5429', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5431', '5429', '古塔区');
INSERT INTO `hcc_tb_param_area` VALUES ('5432', '5429', '凌河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5433', '5429', '太和区');
INSERT INTO `hcc_tb_param_area` VALUES ('5434', '5429', '黑山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5435', '5429', '义　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5436', '5429', '凌海市');
INSERT INTO `hcc_tb_param_area` VALUES ('5437', '5429', '北宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('5438', '5367', '营口市');
INSERT INTO `hcc_tb_param_area` VALUES ('5439', '5438', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5440', '5438', '站前区');
INSERT INTO `hcc_tb_param_area` VALUES ('5441', '5438', '西市区');
INSERT INTO `hcc_tb_param_area` VALUES ('5442', '5438', '鲅鱼圈区');
INSERT INTO `hcc_tb_param_area` VALUES ('5443', '5438', '老边区');
INSERT INTO `hcc_tb_param_area` VALUES ('5444', '5438', '盖州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5445', '5438', '大石桥市');
INSERT INTO `hcc_tb_param_area` VALUES ('5446', '5367', '阜新市');
INSERT INTO `hcc_tb_param_area` VALUES ('5447', '5446', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5448', '5446', '海州区');
INSERT INTO `hcc_tb_param_area` VALUES ('5449', '5446', '新邱区');
INSERT INTO `hcc_tb_param_area` VALUES ('5450', '5446', '太平区');
INSERT INTO `hcc_tb_param_area` VALUES ('5451', '5446', '清河门区');
INSERT INTO `hcc_tb_param_area` VALUES ('5452', '5446', '细河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5453', '5446', '阜新蒙古族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5454', '5446', '彰武县');
INSERT INTO `hcc_tb_param_area` VALUES ('5455', '5367', '辽阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('5456', '5455', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5457', '5455', '白塔区');
INSERT INTO `hcc_tb_param_area` VALUES ('5458', '5455', '文圣区');
INSERT INTO `hcc_tb_param_area` VALUES ('5459', '5455', '宏伟区');
INSERT INTO `hcc_tb_param_area` VALUES ('5460', '5455', '弓长岭区');
INSERT INTO `hcc_tb_param_area` VALUES ('5461', '5455', '太子河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5462', '5455', '辽阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5463', '5455', '灯塔市');
INSERT INTO `hcc_tb_param_area` VALUES ('5464', '5367', '盘锦市');
INSERT INTO `hcc_tb_param_area` VALUES ('5465', '5464', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5466', '5464', '双台子区');
INSERT INTO `hcc_tb_param_area` VALUES ('5467', '5464', '兴隆台区');
INSERT INTO `hcc_tb_param_area` VALUES ('5468', '5464', '大洼县');
INSERT INTO `hcc_tb_param_area` VALUES ('5469', '5464', '盘山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5470', '5367', '铁岭市');
INSERT INTO `hcc_tb_param_area` VALUES ('5471', '5470', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5472', '5470', '银州区');
INSERT INTO `hcc_tb_param_area` VALUES ('5473', '5470', '清河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5474', '5470', '铁岭县');
INSERT INTO `hcc_tb_param_area` VALUES ('5475', '5470', '西丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('5476', '5470', '昌图县');
INSERT INTO `hcc_tb_param_area` VALUES ('5477', '5470', '调兵山市');
INSERT INTO `hcc_tb_param_area` VALUES ('5478', '5470', '开原市');
INSERT INTO `hcc_tb_param_area` VALUES ('5479', '5367', '朝阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('5480', '5479', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5481', '5479', '双塔区');
INSERT INTO `hcc_tb_param_area` VALUES ('5482', '5479', '龙城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5483', '5479', '朝阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5484', '5479', '建平县');
INSERT INTO `hcc_tb_param_area` VALUES ('5485', '5479', '喀喇沁左翼蒙古族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5486', '5479', '北票市');
INSERT INTO `hcc_tb_param_area` VALUES ('5487', '5479', '凌源市');
INSERT INTO `hcc_tb_param_area` VALUES ('5488', '5367', '葫芦岛市');
INSERT INTO `hcc_tb_param_area` VALUES ('5489', '5488', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5490', '5488', '连山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5491', '5488', '龙港区');
INSERT INTO `hcc_tb_param_area` VALUES ('5492', '5488', '南票区');
INSERT INTO `hcc_tb_param_area` VALUES ('5493', '5488', '绥中县');
INSERT INTO `hcc_tb_param_area` VALUES ('5494', '5488', '建昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('5495', '5488', '兴城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5496', '0', '吉林省');
INSERT INTO `hcc_tb_param_area` VALUES ('5497', '5496', '长春市');
INSERT INTO `hcc_tb_param_area` VALUES ('5498', '5497', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5499', '5497', '南关区');
INSERT INTO `hcc_tb_param_area` VALUES ('5500', '5497', '宽城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5501', '5497', '朝阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('5502', '5497', '二道区');
INSERT INTO `hcc_tb_param_area` VALUES ('5503', '5497', '绿园区');
INSERT INTO `hcc_tb_param_area` VALUES ('5504', '5497', '双阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('5505', '5497', '农安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5506', '5497', '九台市');
INSERT INTO `hcc_tb_param_area` VALUES ('5507', '5497', '榆树市');
INSERT INTO `hcc_tb_param_area` VALUES ('5508', '5497', '德惠市');
INSERT INTO `hcc_tb_param_area` VALUES ('5509', '5496', '吉林市');
INSERT INTO `hcc_tb_param_area` VALUES ('5510', '5509', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5511', '5509', '昌邑区');
INSERT INTO `hcc_tb_param_area` VALUES ('5512', '5509', '龙潭区');
INSERT INTO `hcc_tb_param_area` VALUES ('5513', '5509', '船营区');
INSERT INTO `hcc_tb_param_area` VALUES ('5514', '5509', '丰满区');
INSERT INTO `hcc_tb_param_area` VALUES ('5515', '5509', '永吉县');
INSERT INTO `hcc_tb_param_area` VALUES ('5516', '5509', '蛟河市');
INSERT INTO `hcc_tb_param_area` VALUES ('5517', '5509', '桦甸市');
INSERT INTO `hcc_tb_param_area` VALUES ('5518', '5509', '舒兰市');
INSERT INTO `hcc_tb_param_area` VALUES ('5519', '5509', '磐石市');
INSERT INTO `hcc_tb_param_area` VALUES ('5520', '5496', '四平市');
INSERT INTO `hcc_tb_param_area` VALUES ('5521', '5520', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5522', '5520', '铁西区');
INSERT INTO `hcc_tb_param_area` VALUES ('5523', '5520', '铁东区');
INSERT INTO `hcc_tb_param_area` VALUES ('5524', '5520', '梨树县');
INSERT INTO `hcc_tb_param_area` VALUES ('5525', '5520', '伊通满族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5526', '5520', '公主岭市');
INSERT INTO `hcc_tb_param_area` VALUES ('5527', '5520', '双辽市');
INSERT INTO `hcc_tb_param_area` VALUES ('5528', '5496', '辽源市');
INSERT INTO `hcc_tb_param_area` VALUES ('5529', '5528', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5530', '5528', '龙山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5531', '5528', '西安区');
INSERT INTO `hcc_tb_param_area` VALUES ('5532', '5528', '东丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('5533', '5528', '东辽县');
INSERT INTO `hcc_tb_param_area` VALUES ('5534', '5496', '通化市');
INSERT INTO `hcc_tb_param_area` VALUES ('5535', '5534', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5536', '5534', '东昌区');
INSERT INTO `hcc_tb_param_area` VALUES ('5537', '5534', '二道江区');
INSERT INTO `hcc_tb_param_area` VALUES ('5538', '5534', '通化县');
INSERT INTO `hcc_tb_param_area` VALUES ('5539', '5534', '辉南县');
INSERT INTO `hcc_tb_param_area` VALUES ('5540', '5534', '柳河县');
INSERT INTO `hcc_tb_param_area` VALUES ('5541', '5534', '梅河口市');
INSERT INTO `hcc_tb_param_area` VALUES ('5542', '5534', '集安市');
INSERT INTO `hcc_tb_param_area` VALUES ('5543', '5496', '白山市');
INSERT INTO `hcc_tb_param_area` VALUES ('5544', '5543', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5545', '5543', '八道江区');
INSERT INTO `hcc_tb_param_area` VALUES ('5546', '5543', '抚松县');
INSERT INTO `hcc_tb_param_area` VALUES ('5547', '5543', '靖宇县');
INSERT INTO `hcc_tb_param_area` VALUES ('5548', '5543', '长白朝鲜族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5549', '5543', '江源县');
INSERT INTO `hcc_tb_param_area` VALUES ('5550', '5543', '临江市');
INSERT INTO `hcc_tb_param_area` VALUES ('5551', '5496', '松原市');
INSERT INTO `hcc_tb_param_area` VALUES ('5552', '5551', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5553', '5551', '宁江区');
INSERT INTO `hcc_tb_param_area` VALUES ('5554', '5551', '前郭尔罗斯蒙古族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5555', '5551', '长岭县');
INSERT INTO `hcc_tb_param_area` VALUES ('5556', '5551', '乾安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5557', '5551', '扶余县');
INSERT INTO `hcc_tb_param_area` VALUES ('5558', '5496', '白城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5559', '5558', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5560', '5558', '洮北区');
INSERT INTO `hcc_tb_param_area` VALUES ('5561', '5558', '镇赉县');
INSERT INTO `hcc_tb_param_area` VALUES ('5562', '5558', '通榆县');
INSERT INTO `hcc_tb_param_area` VALUES ('5563', '5558', '洮南市');
INSERT INTO `hcc_tb_param_area` VALUES ('5564', '5558', '大安市');
INSERT INTO `hcc_tb_param_area` VALUES ('5565', '5496', '延边朝鲜族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('5566', '5565', '延吉市');
INSERT INTO `hcc_tb_param_area` VALUES ('5567', '5565', '图们市');
INSERT INTO `hcc_tb_param_area` VALUES ('5568', '5565', '敦化市');
INSERT INTO `hcc_tb_param_area` VALUES ('5569', '5565', '珲春市');
INSERT INTO `hcc_tb_param_area` VALUES ('5570', '5565', '龙井市');
INSERT INTO `hcc_tb_param_area` VALUES ('5571', '5565', '和龙市');
INSERT INTO `hcc_tb_param_area` VALUES ('5572', '5565', '汪清县');
INSERT INTO `hcc_tb_param_area` VALUES ('5573', '5565', '安图县');
INSERT INTO `hcc_tb_param_area` VALUES ('5574', '0', '黑龙江省');
INSERT INTO `hcc_tb_param_area` VALUES ('5575', '5574', '哈尔滨市');
INSERT INTO `hcc_tb_param_area` VALUES ('5576', '5575', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5577', '5575', '道里区');
INSERT INTO `hcc_tb_param_area` VALUES ('5578', '5575', '南岗区');
INSERT INTO `hcc_tb_param_area` VALUES ('5579', '5575', '道外区');
INSERT INTO `hcc_tb_param_area` VALUES ('5580', '5575', '香坊区');
INSERT INTO `hcc_tb_param_area` VALUES ('5581', '5575', '动力区');
INSERT INTO `hcc_tb_param_area` VALUES ('5582', '5575', '平房区');
INSERT INTO `hcc_tb_param_area` VALUES ('5583', '5575', '松北区');
INSERT INTO `hcc_tb_param_area` VALUES ('5584', '5575', '呼兰区');
INSERT INTO `hcc_tb_param_area` VALUES ('5585', '5575', '依兰县');
INSERT INTO `hcc_tb_param_area` VALUES ('5586', '5575', '方正县');
INSERT INTO `hcc_tb_param_area` VALUES ('5587', '5575', '宾　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5588', '5575', '巴彦县');
INSERT INTO `hcc_tb_param_area` VALUES ('5589', '5575', '木兰县');
INSERT INTO `hcc_tb_param_area` VALUES ('5590', '5575', '通河县');
INSERT INTO `hcc_tb_param_area` VALUES ('5591', '5575', '延寿县');
INSERT INTO `hcc_tb_param_area` VALUES ('5592', '5575', '阿城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5593', '5575', '双城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5594', '5575', '尚志市');
INSERT INTO `hcc_tb_param_area` VALUES ('5595', '5575', '五常市');
INSERT INTO `hcc_tb_param_area` VALUES ('5596', '5574', '齐齐哈尔市');
INSERT INTO `hcc_tb_param_area` VALUES ('5597', '5596', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5598', '5596', '龙沙区');
INSERT INTO `hcc_tb_param_area` VALUES ('5599', '5596', '建华区');
INSERT INTO `hcc_tb_param_area` VALUES ('5600', '5596', '铁锋区');
INSERT INTO `hcc_tb_param_area` VALUES ('5601', '5596', '昂昂溪区');
INSERT INTO `hcc_tb_param_area` VALUES ('5602', '5596', '富拉尔基区');
INSERT INTO `hcc_tb_param_area` VALUES ('5603', '5596', '碾子山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5604', '5596', '梅里斯达斡尔族区');
INSERT INTO `hcc_tb_param_area` VALUES ('5605', '5596', '龙江县');
INSERT INTO `hcc_tb_param_area` VALUES ('5606', '5596', '依安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5607', '5596', '泰来县');
INSERT INTO `hcc_tb_param_area` VALUES ('5608', '5596', '甘南县');
INSERT INTO `hcc_tb_param_area` VALUES ('5609', '5596', '富裕县');
INSERT INTO `hcc_tb_param_area` VALUES ('5610', '5596', '克山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5611', '5596', '克东县');
INSERT INTO `hcc_tb_param_area` VALUES ('5612', '5596', '拜泉县');
INSERT INTO `hcc_tb_param_area` VALUES ('5613', '5596', '讷河市');
INSERT INTO `hcc_tb_param_area` VALUES ('5614', '5574', '鸡西市');
INSERT INTO `hcc_tb_param_area` VALUES ('5615', '5614', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5616', '5614', '鸡冠区');
INSERT INTO `hcc_tb_param_area` VALUES ('5617', '5614', '恒山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5618', '5614', '滴道区');
INSERT INTO `hcc_tb_param_area` VALUES ('5619', '5614', '梨树区');
INSERT INTO `hcc_tb_param_area` VALUES ('5620', '5614', '城子河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5621', '5614', '麻山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5622', '5614', '鸡东县');
INSERT INTO `hcc_tb_param_area` VALUES ('5623', '5614', '虎林市');
INSERT INTO `hcc_tb_param_area` VALUES ('5624', '5614', '密山市');
INSERT INTO `hcc_tb_param_area` VALUES ('5625', '5574', '鹤岗市');
INSERT INTO `hcc_tb_param_area` VALUES ('5626', '5625', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5627', '5625', '向阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('5628', '5625', '工农区');
INSERT INTO `hcc_tb_param_area` VALUES ('5629', '5625', '南山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5630', '5625', '兴安区');
INSERT INTO `hcc_tb_param_area` VALUES ('5631', '5625', '东山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5632', '5625', '兴山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5633', '5625', '萝北县');
INSERT INTO `hcc_tb_param_area` VALUES ('5634', '5625', '绥滨县');
INSERT INTO `hcc_tb_param_area` VALUES ('5635', '5574', '双鸭山市');
INSERT INTO `hcc_tb_param_area` VALUES ('5636', '5635', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5637', '5635', '尖山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5638', '5635', '岭东区');
INSERT INTO `hcc_tb_param_area` VALUES ('5639', '5635', '四方台区');
INSERT INTO `hcc_tb_param_area` VALUES ('5640', '5635', '宝山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5641', '5635', '集贤县');
INSERT INTO `hcc_tb_param_area` VALUES ('5642', '5635', '友谊县');
INSERT INTO `hcc_tb_param_area` VALUES ('5643', '5635', '宝清县');
INSERT INTO `hcc_tb_param_area` VALUES ('5644', '5635', '饶河县');
INSERT INTO `hcc_tb_param_area` VALUES ('5645', '5574', '大庆市');
INSERT INTO `hcc_tb_param_area` VALUES ('5646', '5645', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5647', '5645', '萨尔图区');
INSERT INTO `hcc_tb_param_area` VALUES ('5648', '5645', '龙凤区');
INSERT INTO `hcc_tb_param_area` VALUES ('5649', '5645', '让胡路区');
INSERT INTO `hcc_tb_param_area` VALUES ('5650', '5645', '红岗区');
INSERT INTO `hcc_tb_param_area` VALUES ('5651', '5645', '大同区');
INSERT INTO `hcc_tb_param_area` VALUES ('5652', '5645', '肇州县');
INSERT INTO `hcc_tb_param_area` VALUES ('5653', '5645', '肇源县');
INSERT INTO `hcc_tb_param_area` VALUES ('5654', '5645', '林甸县');
INSERT INTO `hcc_tb_param_area` VALUES ('5655', '5645', '杜尔伯特蒙古族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5656', '5574', '伊春市');
INSERT INTO `hcc_tb_param_area` VALUES ('5657', '5656', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5658', '5656', '伊春区');
INSERT INTO `hcc_tb_param_area` VALUES ('5659', '5656', '南岔区');
INSERT INTO `hcc_tb_param_area` VALUES ('5660', '5656', '友好区');
INSERT INTO `hcc_tb_param_area` VALUES ('5661', '5656', '西林区');
INSERT INTO `hcc_tb_param_area` VALUES ('5662', '5656', '翠峦区');
INSERT INTO `hcc_tb_param_area` VALUES ('5663', '5656', '新青区');
INSERT INTO `hcc_tb_param_area` VALUES ('5664', '5656', '美溪区');
INSERT INTO `hcc_tb_param_area` VALUES ('5665', '5656', '金山屯区');
INSERT INTO `hcc_tb_param_area` VALUES ('5666', '5656', '五营区');
INSERT INTO `hcc_tb_param_area` VALUES ('5667', '5656', '乌马河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5668', '5656', '汤旺河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5669', '5656', '带岭区');
INSERT INTO `hcc_tb_param_area` VALUES ('5670', '5656', '乌伊岭区');
INSERT INTO `hcc_tb_param_area` VALUES ('5671', '5656', '红星区');
INSERT INTO `hcc_tb_param_area` VALUES ('5672', '5656', '上甘岭区');
INSERT INTO `hcc_tb_param_area` VALUES ('5673', '5656', '嘉荫县');
INSERT INTO `hcc_tb_param_area` VALUES ('5674', '5656', '铁力市');
INSERT INTO `hcc_tb_param_area` VALUES ('5675', '5574', '佳木斯市');
INSERT INTO `hcc_tb_param_area` VALUES ('5676', '5675', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5677', '5675', '永红区');
INSERT INTO `hcc_tb_param_area` VALUES ('5678', '5675', '向阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('5679', '5675', '前进区');
INSERT INTO `hcc_tb_param_area` VALUES ('5680', '5675', '东风区');
INSERT INTO `hcc_tb_param_area` VALUES ('5681', '5675', '郊　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5682', '5675', '桦南县');
INSERT INTO `hcc_tb_param_area` VALUES ('5683', '5675', '桦川县');
INSERT INTO `hcc_tb_param_area` VALUES ('5684', '5675', '汤原县');
INSERT INTO `hcc_tb_param_area` VALUES ('5685', '5675', '抚远县');
INSERT INTO `hcc_tb_param_area` VALUES ('5686', '5675', '同江市');
INSERT INTO `hcc_tb_param_area` VALUES ('5687', '5675', '富锦市');
INSERT INTO `hcc_tb_param_area` VALUES ('5688', '5574', '七台河市');
INSERT INTO `hcc_tb_param_area` VALUES ('5689', '5688', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5690', '5688', '新兴区');
INSERT INTO `hcc_tb_param_area` VALUES ('5691', '5688', '桃山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5692', '5688', '茄子河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5693', '5688', '勃利县');
INSERT INTO `hcc_tb_param_area` VALUES ('5694', '5574', '牡丹江市');
INSERT INTO `hcc_tb_param_area` VALUES ('5695', '5694', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5696', '5694', '东安区');
INSERT INTO `hcc_tb_param_area` VALUES ('5697', '5694', '阳明区');
INSERT INTO `hcc_tb_param_area` VALUES ('5698', '5694', '爱民区');
INSERT INTO `hcc_tb_param_area` VALUES ('5699', '5694', '西安区');
INSERT INTO `hcc_tb_param_area` VALUES ('5700', '5694', '东宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('5701', '5694', '林口县');
INSERT INTO `hcc_tb_param_area` VALUES ('5702', '5694', '绥芬河市');
INSERT INTO `hcc_tb_param_area` VALUES ('5703', '5694', '海林市');
INSERT INTO `hcc_tb_param_area` VALUES ('5704', '5694', '宁安市');
INSERT INTO `hcc_tb_param_area` VALUES ('5705', '5694', '穆棱市');
INSERT INTO `hcc_tb_param_area` VALUES ('5706', '5574', '黑河市');
INSERT INTO `hcc_tb_param_area` VALUES ('5707', '5706', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5708', '5706', '爱辉区');
INSERT INTO `hcc_tb_param_area` VALUES ('5709', '5706', '嫩江县');
INSERT INTO `hcc_tb_param_area` VALUES ('5710', '5706', '逊克县');
INSERT INTO `hcc_tb_param_area` VALUES ('5711', '5706', '孙吴县');
INSERT INTO `hcc_tb_param_area` VALUES ('5712', '5706', '北安市');
INSERT INTO `hcc_tb_param_area` VALUES ('5713', '5706', '五大连池市');
INSERT INTO `hcc_tb_param_area` VALUES ('5714', '5574', '绥化市');
INSERT INTO `hcc_tb_param_area` VALUES ('5715', '5714', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5716', '5714', '北林区');
INSERT INTO `hcc_tb_param_area` VALUES ('5717', '5714', '望奎县');
INSERT INTO `hcc_tb_param_area` VALUES ('5718', '5714', '兰西县');
INSERT INTO `hcc_tb_param_area` VALUES ('5719', '5714', '青冈县');
INSERT INTO `hcc_tb_param_area` VALUES ('5720', '5714', '庆安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5721', '5714', '明水县');
INSERT INTO `hcc_tb_param_area` VALUES ('5722', '5714', '绥棱县');
INSERT INTO `hcc_tb_param_area` VALUES ('5723', '5714', '安达市');
INSERT INTO `hcc_tb_param_area` VALUES ('5724', '5714', '肇东市');
INSERT INTO `hcc_tb_param_area` VALUES ('5725', '5714', '海伦市');
INSERT INTO `hcc_tb_param_area` VALUES ('5726', '5574', '大兴安岭地区');
INSERT INTO `hcc_tb_param_area` VALUES ('5727', '5726', '呼玛县');
INSERT INTO `hcc_tb_param_area` VALUES ('5728', '5726', '塔河县');
INSERT INTO `hcc_tb_param_area` VALUES ('5729', '5726', '漠河县');
INSERT INTO `hcc_tb_param_area` VALUES ('5730', '0', '上海市');
INSERT INTO `hcc_tb_param_area` VALUES ('5731', '5730', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5732', '5731', '黄浦区');
INSERT INTO `hcc_tb_param_area` VALUES ('5733', '5731', '卢湾区');
INSERT INTO `hcc_tb_param_area` VALUES ('5734', '5731', '徐汇区');
INSERT INTO `hcc_tb_param_area` VALUES ('5735', '5731', '长宁区');
INSERT INTO `hcc_tb_param_area` VALUES ('5736', '5731', '静安区');
INSERT INTO `hcc_tb_param_area` VALUES ('5737', '5731', '普陀区');
INSERT INTO `hcc_tb_param_area` VALUES ('5738', '5731', '闸北区');
INSERT INTO `hcc_tb_param_area` VALUES ('5739', '5731', '虹口区');
INSERT INTO `hcc_tb_param_area` VALUES ('5740', '5731', '杨浦区');
INSERT INTO `hcc_tb_param_area` VALUES ('5741', '5731', '闵行区');
INSERT INTO `hcc_tb_param_area` VALUES ('5742', '5731', '宝山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5743', '5731', '嘉定区');
INSERT INTO `hcc_tb_param_area` VALUES ('5744', '5731', '浦东新区');
INSERT INTO `hcc_tb_param_area` VALUES ('5745', '5731', '金山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5746', '5731', '松江区');
INSERT INTO `hcc_tb_param_area` VALUES ('5747', '5731', '青浦区');
INSERT INTO `hcc_tb_param_area` VALUES ('5748', '5731', '南汇区');
INSERT INTO `hcc_tb_param_area` VALUES ('5749', '5731', '奉贤区');
INSERT INTO `hcc_tb_param_area` VALUES ('5750', '5730', '县');
INSERT INTO `hcc_tb_param_area` VALUES ('5751', '5750', '崇明县');
INSERT INTO `hcc_tb_param_area` VALUES ('5752', '0', '江苏省');
INSERT INTO `hcc_tb_param_area` VALUES ('5753', '5752', '南京市');
INSERT INTO `hcc_tb_param_area` VALUES ('5754', '5753', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5755', '5753', '玄武区');
INSERT INTO `hcc_tb_param_area` VALUES ('5756', '5753', '白下区');
INSERT INTO `hcc_tb_param_area` VALUES ('5757', '5753', '秦淮区');
INSERT INTO `hcc_tb_param_area` VALUES ('5758', '5753', '建邺区');
INSERT INTO `hcc_tb_param_area` VALUES ('5759', '5753', '鼓楼区');
INSERT INTO `hcc_tb_param_area` VALUES ('5760', '5753', '下关区');
INSERT INTO `hcc_tb_param_area` VALUES ('5761', '5753', '浦口区');
INSERT INTO `hcc_tb_param_area` VALUES ('5762', '5753', '栖霞区');
INSERT INTO `hcc_tb_param_area` VALUES ('5763', '5753', '雨花台区');
INSERT INTO `hcc_tb_param_area` VALUES ('5764', '5753', '江宁区');
INSERT INTO `hcc_tb_param_area` VALUES ('5765', '5753', '六合区');
INSERT INTO `hcc_tb_param_area` VALUES ('5766', '5753', '溧水县');
INSERT INTO `hcc_tb_param_area` VALUES ('5767', '5753', '高淳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5768', '5752', '无锡市');
INSERT INTO `hcc_tb_param_area` VALUES ('5769', '5768', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5770', '5768', '崇安区');
INSERT INTO `hcc_tb_param_area` VALUES ('5771', '5768', '南长区');
INSERT INTO `hcc_tb_param_area` VALUES ('5772', '5768', '北塘区');
INSERT INTO `hcc_tb_param_area` VALUES ('5773', '5768', '锡山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5774', '5768', '惠山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5775', '5768', '滨湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5776', '5768', '江阴市');
INSERT INTO `hcc_tb_param_area` VALUES ('5777', '5768', '宜兴市');
INSERT INTO `hcc_tb_param_area` VALUES ('5778', '5752', '徐州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5779', '5778', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5780', '5778', '鼓楼区');
INSERT INTO `hcc_tb_param_area` VALUES ('5781', '5778', '云龙区');
INSERT INTO `hcc_tb_param_area` VALUES ('5782', '5778', '九里区');
INSERT INTO `hcc_tb_param_area` VALUES ('5783', '5778', '贾汪区');
INSERT INTO `hcc_tb_param_area` VALUES ('5784', '5778', '泉山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5785', '5778', '丰　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5786', '5778', '沛　县');
INSERT INTO `hcc_tb_param_area` VALUES ('5787', '5778', '铜山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5788', '5778', '睢宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('5789', '5778', '新沂市');
INSERT INTO `hcc_tb_param_area` VALUES ('5790', '5778', '邳州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5791', '5752', '常州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5792', '5791', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5793', '5791', '天宁区');
INSERT INTO `hcc_tb_param_area` VALUES ('5794', '5791', '钟楼区');
INSERT INTO `hcc_tb_param_area` VALUES ('5795', '5791', '戚墅堰区');
INSERT INTO `hcc_tb_param_area` VALUES ('5796', '5791', '新北区');
INSERT INTO `hcc_tb_param_area` VALUES ('5797', '5791', '武进区');
INSERT INTO `hcc_tb_param_area` VALUES ('5798', '5791', '溧阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('5799', '5791', '金坛市');
INSERT INTO `hcc_tb_param_area` VALUES ('5800', '5752', '苏州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5801', '5800', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5802', '5800', '沧浪区');
INSERT INTO `hcc_tb_param_area` VALUES ('5803', '5800', '平江区');
INSERT INTO `hcc_tb_param_area` VALUES ('5804', '5800', '金阊区');
INSERT INTO `hcc_tb_param_area` VALUES ('5805', '5800', '虎丘区');
INSERT INTO `hcc_tb_param_area` VALUES ('5806', '5800', '吴中区');
INSERT INTO `hcc_tb_param_area` VALUES ('5807', '5800', '相城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5808', '5800', '常熟市');
INSERT INTO `hcc_tb_param_area` VALUES ('5809', '5800', '张家港市');
INSERT INTO `hcc_tb_param_area` VALUES ('5810', '5800', '昆山市');
INSERT INTO `hcc_tb_param_area` VALUES ('5811', '5800', '吴江市');
INSERT INTO `hcc_tb_param_area` VALUES ('5812', '5800', '太仓市');
INSERT INTO `hcc_tb_param_area` VALUES ('5813', '5752', '南通市');
INSERT INTO `hcc_tb_param_area` VALUES ('5814', '5813', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5815', '5813', '崇川区');
INSERT INTO `hcc_tb_param_area` VALUES ('5816', '5813', '港闸区');
INSERT INTO `hcc_tb_param_area` VALUES ('5817', '5813', '海安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5818', '5813', '如东县');
INSERT INTO `hcc_tb_param_area` VALUES ('5819', '5813', '启东市');
INSERT INTO `hcc_tb_param_area` VALUES ('5820', '5813', '如皋市');
INSERT INTO `hcc_tb_param_area` VALUES ('5821', '5813', '通州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5822', '5813', '海门市');
INSERT INTO `hcc_tb_param_area` VALUES ('5823', '5752', '连云港市');
INSERT INTO `hcc_tb_param_area` VALUES ('5824', '5823', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5825', '5823', '连云区');
INSERT INTO `hcc_tb_param_area` VALUES ('5826', '5823', '新浦区');
INSERT INTO `hcc_tb_param_area` VALUES ('5827', '5823', '海州区');
INSERT INTO `hcc_tb_param_area` VALUES ('5828', '5823', '赣榆县');
INSERT INTO `hcc_tb_param_area` VALUES ('5829', '5823', '东海县');
INSERT INTO `hcc_tb_param_area` VALUES ('5830', '5823', '灌云县');
INSERT INTO `hcc_tb_param_area` VALUES ('5831', '5823', '灌南县');
INSERT INTO `hcc_tb_param_area` VALUES ('5832', '5752', '淮安市');
INSERT INTO `hcc_tb_param_area` VALUES ('5833', '5832', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5834', '5832', '清河区');
INSERT INTO `hcc_tb_param_area` VALUES ('5835', '5832', '楚州区');
INSERT INTO `hcc_tb_param_area` VALUES ('5836', '5832', '淮阴区');
INSERT INTO `hcc_tb_param_area` VALUES ('5837', '5832', '清浦区');
INSERT INTO `hcc_tb_param_area` VALUES ('5838', '5832', '涟水县');
INSERT INTO `hcc_tb_param_area` VALUES ('5839', '5832', '洪泽县');
INSERT INTO `hcc_tb_param_area` VALUES ('5840', '5832', '盱眙县');
INSERT INTO `hcc_tb_param_area` VALUES ('5841', '5832', '金湖县');
INSERT INTO `hcc_tb_param_area` VALUES ('5842', '5752', '盐城市');
INSERT INTO `hcc_tb_param_area` VALUES ('5843', '5842', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5844', '5842', '亭湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5845', '5842', '盐都区');
INSERT INTO `hcc_tb_param_area` VALUES ('5846', '5842', '响水县');
INSERT INTO `hcc_tb_param_area` VALUES ('5847', '5842', '滨海县');
INSERT INTO `hcc_tb_param_area` VALUES ('5848', '5842', '阜宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('5849', '5842', '射阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5850', '5842', '建湖县');
INSERT INTO `hcc_tb_param_area` VALUES ('5851', '5842', '东台市');
INSERT INTO `hcc_tb_param_area` VALUES ('5852', '5842', '大丰市');
INSERT INTO `hcc_tb_param_area` VALUES ('5853', '5752', '扬州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5854', '5853', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5855', '5853', '广陵区');
INSERT INTO `hcc_tb_param_area` VALUES ('5856', '5853', '邗江区');
INSERT INTO `hcc_tb_param_area` VALUES ('5857', '5853', '郊　区');
INSERT INTO `hcc_tb_param_area` VALUES ('5858', '5853', '宝应县');
INSERT INTO `hcc_tb_param_area` VALUES ('5859', '5853', '仪征市');
INSERT INTO `hcc_tb_param_area` VALUES ('5860', '5853', '高邮市');
INSERT INTO `hcc_tb_param_area` VALUES ('5861', '5853', '江都市');
INSERT INTO `hcc_tb_param_area` VALUES ('5862', '5752', '镇江市');
INSERT INTO `hcc_tb_param_area` VALUES ('5863', '5862', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5864', '5862', '京口区');
INSERT INTO `hcc_tb_param_area` VALUES ('5865', '5862', '润州区');
INSERT INTO `hcc_tb_param_area` VALUES ('5866', '5862', '丹徒区');
INSERT INTO `hcc_tb_param_area` VALUES ('5867', '5862', '丹阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('5868', '5862', '扬中市');
INSERT INTO `hcc_tb_param_area` VALUES ('5869', '5862', '句容市');
INSERT INTO `hcc_tb_param_area` VALUES ('5870', '5752', '泰州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5871', '5870', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5872', '5870', '海陵区');
INSERT INTO `hcc_tb_param_area` VALUES ('5873', '5870', '高港区');
INSERT INTO `hcc_tb_param_area` VALUES ('5874', '5870', '兴化市');
INSERT INTO `hcc_tb_param_area` VALUES ('5875', '5870', '靖江市');
INSERT INTO `hcc_tb_param_area` VALUES ('5876', '5870', '泰兴市');
INSERT INTO `hcc_tb_param_area` VALUES ('5877', '5870', '姜堰市');
INSERT INTO `hcc_tb_param_area` VALUES ('5878', '5752', '宿迁市');
INSERT INTO `hcc_tb_param_area` VALUES ('5879', '5878', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5880', '5878', '宿城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5881', '5878', '宿豫区');
INSERT INTO `hcc_tb_param_area` VALUES ('5882', '5878', '沭阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5883', '5878', '泗阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5884', '5878', '泗洪县');
INSERT INTO `hcc_tb_param_area` VALUES ('5885', '0', '浙江省');
INSERT INTO `hcc_tb_param_area` VALUES ('5886', '5885', '杭州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5887', '5886', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5888', '5886', '上城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5889', '5886', '下城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5890', '5886', '江干区');
INSERT INTO `hcc_tb_param_area` VALUES ('5891', '5886', '拱墅区');
INSERT INTO `hcc_tb_param_area` VALUES ('5892', '5886', '西湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5893', '5886', '滨江区');
INSERT INTO `hcc_tb_param_area` VALUES ('5894', '5886', '萧山区');
INSERT INTO `hcc_tb_param_area` VALUES ('5895', '5886', '余杭区');
INSERT INTO `hcc_tb_param_area` VALUES ('5896', '5886', '桐庐县');
INSERT INTO `hcc_tb_param_area` VALUES ('5897', '5886', '淳安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5898', '5886', '建德市');
INSERT INTO `hcc_tb_param_area` VALUES ('5899', '5886', '富阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('5900', '5886', '临安市');
INSERT INTO `hcc_tb_param_area` VALUES ('5901', '5885', '宁波市');
INSERT INTO `hcc_tb_param_area` VALUES ('5902', '5901', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5903', '5901', '海曙区');
INSERT INTO `hcc_tb_param_area` VALUES ('5904', '5901', '江东区');
INSERT INTO `hcc_tb_param_area` VALUES ('5905', '5901', '江北区');
INSERT INTO `hcc_tb_param_area` VALUES ('5906', '5901', '北仑区');
INSERT INTO `hcc_tb_param_area` VALUES ('5907', '5901', '镇海区');
INSERT INTO `hcc_tb_param_area` VALUES ('5908', '5901', '鄞州区');
INSERT INTO `hcc_tb_param_area` VALUES ('5909', '5901', '象山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5910', '5901', '宁海县');
INSERT INTO `hcc_tb_param_area` VALUES ('5911', '5901', '余姚市');
INSERT INTO `hcc_tb_param_area` VALUES ('5912', '5901', '慈溪市');
INSERT INTO `hcc_tb_param_area` VALUES ('5913', '5901', '奉化市');
INSERT INTO `hcc_tb_param_area` VALUES ('5914', '5885', '温州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5915', '5914', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5916', '5914', '鹿城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5917', '5914', '龙湾区');
INSERT INTO `hcc_tb_param_area` VALUES ('5918', '5914', '瓯海区');
INSERT INTO `hcc_tb_param_area` VALUES ('5919', '5914', '洞头县');
INSERT INTO `hcc_tb_param_area` VALUES ('5920', '5914', '永嘉县');
INSERT INTO `hcc_tb_param_area` VALUES ('5921', '5914', '平阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5922', '5914', '苍南县');
INSERT INTO `hcc_tb_param_area` VALUES ('5923', '5914', '文成县');
INSERT INTO `hcc_tb_param_area` VALUES ('5924', '5914', '泰顺县');
INSERT INTO `hcc_tb_param_area` VALUES ('5925', '5914', '瑞安市');
INSERT INTO `hcc_tb_param_area` VALUES ('5926', '5914', '乐清市');
INSERT INTO `hcc_tb_param_area` VALUES ('5927', '5885', '嘉兴市');
INSERT INTO `hcc_tb_param_area` VALUES ('5928', '5927', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5929', '5927', '秀城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5930', '5927', '秀洲区');
INSERT INTO `hcc_tb_param_area` VALUES ('5931', '5927', '嘉善县');
INSERT INTO `hcc_tb_param_area` VALUES ('5932', '5927', '海盐县');
INSERT INTO `hcc_tb_param_area` VALUES ('5933', '5927', '海宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('5934', '5927', '平湖市');
INSERT INTO `hcc_tb_param_area` VALUES ('5935', '5927', '桐乡市');
INSERT INTO `hcc_tb_param_area` VALUES ('5936', '5885', '湖州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5937', '5936', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5938', '5936', '吴兴区');
INSERT INTO `hcc_tb_param_area` VALUES ('5939', '5936', '南浔区');
INSERT INTO `hcc_tb_param_area` VALUES ('5940', '5936', '德清县');
INSERT INTO `hcc_tb_param_area` VALUES ('5941', '5936', '长兴县');
INSERT INTO `hcc_tb_param_area` VALUES ('5942', '5936', '安吉县');
INSERT INTO `hcc_tb_param_area` VALUES ('5943', '5885', '绍兴市');
INSERT INTO `hcc_tb_param_area` VALUES ('5944', '5943', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5945', '5943', '越城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5946', '5943', '绍兴县');
INSERT INTO `hcc_tb_param_area` VALUES ('5947', '5943', '新昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('5948', '5943', '诸暨市');
INSERT INTO `hcc_tb_param_area` VALUES ('5949', '5943', '上虞市');
INSERT INTO `hcc_tb_param_area` VALUES ('5950', '5943', '嵊州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5951', '5885', '金华市');
INSERT INTO `hcc_tb_param_area` VALUES ('5952', '5951', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5953', '5951', '婺城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5954', '5951', '金东区');
INSERT INTO `hcc_tb_param_area` VALUES ('5955', '5951', '武义县');
INSERT INTO `hcc_tb_param_area` VALUES ('5956', '5951', '浦江县');
INSERT INTO `hcc_tb_param_area` VALUES ('5957', '5951', '磐安县');
INSERT INTO `hcc_tb_param_area` VALUES ('5958', '5951', '兰溪市');
INSERT INTO `hcc_tb_param_area` VALUES ('5959', '5951', '义乌市');
INSERT INTO `hcc_tb_param_area` VALUES ('5960', '5951', '东阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('5961', '5951', '永康市');
INSERT INTO `hcc_tb_param_area` VALUES ('5962', '5885', '衢州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5963', '5962', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5964', '5962', '柯城区');
INSERT INTO `hcc_tb_param_area` VALUES ('5965', '5962', '衢江区');
INSERT INTO `hcc_tb_param_area` VALUES ('5966', '5962', '常山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5967', '5962', '开化县');
INSERT INTO `hcc_tb_param_area` VALUES ('5968', '5962', '龙游县');
INSERT INTO `hcc_tb_param_area` VALUES ('5969', '5962', '江山市');
INSERT INTO `hcc_tb_param_area` VALUES ('5970', '5885', '舟山市');
INSERT INTO `hcc_tb_param_area` VALUES ('5971', '5970', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5972', '5970', '定海区');
INSERT INTO `hcc_tb_param_area` VALUES ('5973', '5970', '普陀区');
INSERT INTO `hcc_tb_param_area` VALUES ('5974', '5970', '岱山县');
INSERT INTO `hcc_tb_param_area` VALUES ('5975', '5970', '嵊泗县');
INSERT INTO `hcc_tb_param_area` VALUES ('5976', '5885', '台州市');
INSERT INTO `hcc_tb_param_area` VALUES ('5977', '5976', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5978', '5976', '椒江区');
INSERT INTO `hcc_tb_param_area` VALUES ('5979', '5976', '黄岩区');
INSERT INTO `hcc_tb_param_area` VALUES ('5980', '5976', '路桥区');
INSERT INTO `hcc_tb_param_area` VALUES ('5981', '5976', '玉环县');
INSERT INTO `hcc_tb_param_area` VALUES ('5982', '5976', '三门县');
INSERT INTO `hcc_tb_param_area` VALUES ('5983', '5976', '天台县');
INSERT INTO `hcc_tb_param_area` VALUES ('5984', '5976', '仙居县');
INSERT INTO `hcc_tb_param_area` VALUES ('5985', '5976', '温岭市');
INSERT INTO `hcc_tb_param_area` VALUES ('5986', '5976', '临海市');
INSERT INTO `hcc_tb_param_area` VALUES ('5987', '5885', '丽水市');
INSERT INTO `hcc_tb_param_area` VALUES ('5988', '5987', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('5989', '5987', '莲都区');
INSERT INTO `hcc_tb_param_area` VALUES ('5990', '5987', '青田县');
INSERT INTO `hcc_tb_param_area` VALUES ('5991', '5987', '缙云县');
INSERT INTO `hcc_tb_param_area` VALUES ('5992', '5987', '遂昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('5993', '5987', '松阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('5994', '5987', '云和县');
INSERT INTO `hcc_tb_param_area` VALUES ('5995', '5987', '庆元县');
INSERT INTO `hcc_tb_param_area` VALUES ('5996', '5987', '景宁畲族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('5997', '5987', '龙泉市');
INSERT INTO `hcc_tb_param_area` VALUES ('5998', '0', '安徽省');
INSERT INTO `hcc_tb_param_area` VALUES ('5999', '5998', '合肥市');
INSERT INTO `hcc_tb_param_area` VALUES ('6000', '5999', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6001', '5999', '瑶海区');
INSERT INTO `hcc_tb_param_area` VALUES ('6002', '5999', '庐阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6003', '5999', '蜀山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6004', '5999', '包河区');
INSERT INTO `hcc_tb_param_area` VALUES ('6005', '5999', '长丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6006', '5999', '肥东县');
INSERT INTO `hcc_tb_param_area` VALUES ('6007', '5999', '肥西县');
INSERT INTO `hcc_tb_param_area` VALUES ('6008', '5998', '芜湖市');
INSERT INTO `hcc_tb_param_area` VALUES ('6009', '6008', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6010', '6008', '镜湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6011', '6008', '马塘区');
INSERT INTO `hcc_tb_param_area` VALUES ('6012', '6008', '新芜区');
INSERT INTO `hcc_tb_param_area` VALUES ('6013', '6008', '鸠江区');
INSERT INTO `hcc_tb_param_area` VALUES ('6014', '6008', '芜湖县');
INSERT INTO `hcc_tb_param_area` VALUES ('6015', '6008', '繁昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6016', '6008', '南陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('6017', '5998', '蚌埠市');
INSERT INTO `hcc_tb_param_area` VALUES ('6018', '6017', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6019', '6017', '龙子湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6020', '6017', '蚌山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6021', '6017', '禹会区');
INSERT INTO `hcc_tb_param_area` VALUES ('6022', '6017', '淮上区');
INSERT INTO `hcc_tb_param_area` VALUES ('6023', '6017', '怀远县');
INSERT INTO `hcc_tb_param_area` VALUES ('6024', '6017', '五河县');
INSERT INTO `hcc_tb_param_area` VALUES ('6025', '6017', '固镇县');
INSERT INTO `hcc_tb_param_area` VALUES ('6026', '5998', '淮南市');
INSERT INTO `hcc_tb_param_area` VALUES ('6027', '6026', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6028', '6026', '大通区');
INSERT INTO `hcc_tb_param_area` VALUES ('6029', '6026', '田家庵区');
INSERT INTO `hcc_tb_param_area` VALUES ('6030', '6026', '谢家集区');
INSERT INTO `hcc_tb_param_area` VALUES ('6031', '6026', '八公山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6032', '6026', '潘集区');
INSERT INTO `hcc_tb_param_area` VALUES ('6033', '6026', '凤台县');
INSERT INTO `hcc_tb_param_area` VALUES ('6034', '5998', '马鞍山市');
INSERT INTO `hcc_tb_param_area` VALUES ('6035', '6034', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6036', '6034', '金家庄区');
INSERT INTO `hcc_tb_param_area` VALUES ('6037', '6034', '花山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6038', '6034', '雨山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6039', '6034', '当涂县');
INSERT INTO `hcc_tb_param_area` VALUES ('6040', '5998', '淮北市');
INSERT INTO `hcc_tb_param_area` VALUES ('6041', '6040', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6042', '6040', '杜集区');
INSERT INTO `hcc_tb_param_area` VALUES ('6043', '6040', '相山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6044', '6040', '烈山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6045', '6040', '濉溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6046', '5998', '铜陵市');
INSERT INTO `hcc_tb_param_area` VALUES ('6047', '6046', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6048', '6046', '铜官山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6049', '6046', '狮子山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6050', '6046', '郊　区');
INSERT INTO `hcc_tb_param_area` VALUES ('6051', '6046', '铜陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('6052', '5998', '安庆市');
INSERT INTO `hcc_tb_param_area` VALUES ('6053', '6052', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6054', '6052', '迎江区');
INSERT INTO `hcc_tb_param_area` VALUES ('6055', '6052', '大观区');
INSERT INTO `hcc_tb_param_area` VALUES ('6056', '6052', '郊　区');
INSERT INTO `hcc_tb_param_area` VALUES ('6057', '6052', '怀宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6058', '6052', '枞阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6059', '6052', '潜山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6060', '6052', '太湖县');
INSERT INTO `hcc_tb_param_area` VALUES ('6061', '6052', '宿松县');
INSERT INTO `hcc_tb_param_area` VALUES ('6062', '6052', '望江县');
INSERT INTO `hcc_tb_param_area` VALUES ('6063', '6052', '岳西县');
INSERT INTO `hcc_tb_param_area` VALUES ('6064', '6052', '桐城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6065', '5998', '黄山市');
INSERT INTO `hcc_tb_param_area` VALUES ('6066', '6065', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6067', '6065', '屯溪区');
INSERT INTO `hcc_tb_param_area` VALUES ('6068', '6065', '黄山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6069', '6065', '徽州区');
INSERT INTO `hcc_tb_param_area` VALUES ('6070', '6065', '歙　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6071', '6065', '休宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6072', '6065', '黟　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6073', '6065', '祁门县');
INSERT INTO `hcc_tb_param_area` VALUES ('6074', '5998', '滁州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6075', '6074', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6076', '6074', '琅琊区');
INSERT INTO `hcc_tb_param_area` VALUES ('6077', '6074', '南谯区');
INSERT INTO `hcc_tb_param_area` VALUES ('6078', '6074', '来安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6079', '6074', '全椒县');
INSERT INTO `hcc_tb_param_area` VALUES ('6080', '6074', '定远县');
INSERT INTO `hcc_tb_param_area` VALUES ('6081', '6074', '凤阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6082', '6074', '天长市');
INSERT INTO `hcc_tb_param_area` VALUES ('6083', '6074', '明光市');
INSERT INTO `hcc_tb_param_area` VALUES ('6084', '5998', '阜阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6085', '6084', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6086', '6084', '颍州区');
INSERT INTO `hcc_tb_param_area` VALUES ('6087', '6084', '颍东区');
INSERT INTO `hcc_tb_param_area` VALUES ('6088', '6084', '颍泉区');
INSERT INTO `hcc_tb_param_area` VALUES ('6089', '6084', '临泉县');
INSERT INTO `hcc_tb_param_area` VALUES ('6090', '6084', '太和县');
INSERT INTO `hcc_tb_param_area` VALUES ('6091', '6084', '阜南县');
INSERT INTO `hcc_tb_param_area` VALUES ('6092', '6084', '颍上县');
INSERT INTO `hcc_tb_param_area` VALUES ('6093', '6084', '界首市');
INSERT INTO `hcc_tb_param_area` VALUES ('6094', '5998', '宿州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6095', '6094', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6096', '6094', '墉桥区');
INSERT INTO `hcc_tb_param_area` VALUES ('6097', '6094', '砀山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6098', '6094', '萧　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6099', '6094', '灵璧县');
INSERT INTO `hcc_tb_param_area` VALUES ('6100', '6094', '泗　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6101', '5998', '巢湖市');
INSERT INTO `hcc_tb_param_area` VALUES ('6102', '6101', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6103', '6101', '居巢区');
INSERT INTO `hcc_tb_param_area` VALUES ('6104', '6101', '庐江县');
INSERT INTO `hcc_tb_param_area` VALUES ('6105', '6101', '无为县');
INSERT INTO `hcc_tb_param_area` VALUES ('6106', '6101', '含山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6107', '6101', '和　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6108', '5998', '六安市');
INSERT INTO `hcc_tb_param_area` VALUES ('6109', '6108', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6110', '6108', '金安区');
INSERT INTO `hcc_tb_param_area` VALUES ('6111', '6108', '裕安区');
INSERT INTO `hcc_tb_param_area` VALUES ('6112', '6108', '寿　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6113', '6108', '霍邱县');
INSERT INTO `hcc_tb_param_area` VALUES ('6114', '6108', '舒城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6115', '6108', '金寨县');
INSERT INTO `hcc_tb_param_area` VALUES ('6116', '6108', '霍山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6117', '5998', '亳州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6118', '6117', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6119', '6117', '谯城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6120', '6117', '涡阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6121', '6117', '蒙城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6122', '6117', '利辛县');
INSERT INTO `hcc_tb_param_area` VALUES ('6123', '5998', '池州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6124', '6123', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6125', '6123', '贵池区');
INSERT INTO `hcc_tb_param_area` VALUES ('6126', '6123', '东至县');
INSERT INTO `hcc_tb_param_area` VALUES ('6127', '6123', '石台县');
INSERT INTO `hcc_tb_param_area` VALUES ('6128', '6123', '青阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6129', '5998', '宣城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6130', '6129', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6131', '6129', '宣州区');
INSERT INTO `hcc_tb_param_area` VALUES ('6132', '6129', '郎溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6133', '6129', '广德县');
INSERT INTO `hcc_tb_param_area` VALUES ('6134', '6129', '泾　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6135', '6129', '绩溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6136', '6129', '旌德县');
INSERT INTO `hcc_tb_param_area` VALUES ('6137', '6129', '宁国市');
INSERT INTO `hcc_tb_param_area` VALUES ('6138', '0', '福建省');
INSERT INTO `hcc_tb_param_area` VALUES ('6139', '6138', '福州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6140', '6139', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6141', '6139', '鼓楼区');
INSERT INTO `hcc_tb_param_area` VALUES ('6142', '6139', '台江区');
INSERT INTO `hcc_tb_param_area` VALUES ('6143', '6139', '仓山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6144', '6139', '马尾区');
INSERT INTO `hcc_tb_param_area` VALUES ('6145', '6139', '晋安区');
INSERT INTO `hcc_tb_param_area` VALUES ('6146', '6139', '闽侯县');
INSERT INTO `hcc_tb_param_area` VALUES ('6147', '6139', '连江县');
INSERT INTO `hcc_tb_param_area` VALUES ('6148', '6139', '罗源县');
INSERT INTO `hcc_tb_param_area` VALUES ('6149', '6139', '闽清县');
INSERT INTO `hcc_tb_param_area` VALUES ('6150', '6139', '永泰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6151', '6139', '平潭县');
INSERT INTO `hcc_tb_param_area` VALUES ('6152', '6139', '福清市');
INSERT INTO `hcc_tb_param_area` VALUES ('6153', '6139', '长乐市');
INSERT INTO `hcc_tb_param_area` VALUES ('6154', '6138', '厦门市');
INSERT INTO `hcc_tb_param_area` VALUES ('6155', '6154', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6156', '6154', '思明区');
INSERT INTO `hcc_tb_param_area` VALUES ('6157', '6154', '海沧区');
INSERT INTO `hcc_tb_param_area` VALUES ('6158', '6154', '湖里区');
INSERT INTO `hcc_tb_param_area` VALUES ('6159', '6154', '集美区');
INSERT INTO `hcc_tb_param_area` VALUES ('6160', '6154', '同安区');
INSERT INTO `hcc_tb_param_area` VALUES ('6161', '6154', '翔安区');
INSERT INTO `hcc_tb_param_area` VALUES ('6162', '6138', '莆田市');
INSERT INTO `hcc_tb_param_area` VALUES ('6163', '6162', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6164', '6162', '城厢区');
INSERT INTO `hcc_tb_param_area` VALUES ('6165', '6162', '涵江区');
INSERT INTO `hcc_tb_param_area` VALUES ('6166', '6162', '荔城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6167', '6162', '秀屿区');
INSERT INTO `hcc_tb_param_area` VALUES ('6168', '6162', '仙游县');
INSERT INTO `hcc_tb_param_area` VALUES ('6169', '6138', '三明市');
INSERT INTO `hcc_tb_param_area` VALUES ('6170', '6169', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6171', '6169', '梅列区');
INSERT INTO `hcc_tb_param_area` VALUES ('6172', '6169', '三元区');
INSERT INTO `hcc_tb_param_area` VALUES ('6173', '6169', '明溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6174', '6169', '清流县');
INSERT INTO `hcc_tb_param_area` VALUES ('6175', '6169', '宁化县');
INSERT INTO `hcc_tb_param_area` VALUES ('6176', '6169', '大田县');
INSERT INTO `hcc_tb_param_area` VALUES ('6177', '6169', '尤溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6178', '6169', '沙　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6179', '6169', '将乐县');
INSERT INTO `hcc_tb_param_area` VALUES ('6180', '6169', '泰宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6181', '6169', '建宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6182', '6169', '永安市');
INSERT INTO `hcc_tb_param_area` VALUES ('6183', '6138', '泉州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6184', '6183', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6185', '6183', '鲤城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6186', '6183', '丰泽区');
INSERT INTO `hcc_tb_param_area` VALUES ('6187', '6183', '洛江区');
INSERT INTO `hcc_tb_param_area` VALUES ('6188', '6183', '泉港区');
INSERT INTO `hcc_tb_param_area` VALUES ('6189', '6183', '惠安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6190', '6183', '安溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6191', '6183', '永春县');
INSERT INTO `hcc_tb_param_area` VALUES ('6192', '6183', '德化县');
INSERT INTO `hcc_tb_param_area` VALUES ('6193', '6183', '金门县');
INSERT INTO `hcc_tb_param_area` VALUES ('6194', '6183', '石狮市');
INSERT INTO `hcc_tb_param_area` VALUES ('6195', '6183', '晋江市');
INSERT INTO `hcc_tb_param_area` VALUES ('6196', '6183', '南安市');
INSERT INTO `hcc_tb_param_area` VALUES ('6197', '6138', '漳州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6198', '6197', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6199', '6197', '芗城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6200', '6197', '龙文区');
INSERT INTO `hcc_tb_param_area` VALUES ('6201', '6197', '云霄县');
INSERT INTO `hcc_tb_param_area` VALUES ('6202', '6197', '漳浦县');
INSERT INTO `hcc_tb_param_area` VALUES ('6203', '6197', '诏安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6204', '6197', '长泰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6205', '6197', '东山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6206', '6197', '南靖县');
INSERT INTO `hcc_tb_param_area` VALUES ('6207', '6197', '平和县');
INSERT INTO `hcc_tb_param_area` VALUES ('6208', '6197', '华安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6209', '6197', '龙海市');
INSERT INTO `hcc_tb_param_area` VALUES ('6210', '6138', '南平市');
INSERT INTO `hcc_tb_param_area` VALUES ('6211', '6210', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6212', '6210', '延平区');
INSERT INTO `hcc_tb_param_area` VALUES ('6213', '6210', '顺昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6214', '6210', '浦城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6215', '6210', '光泽县');
INSERT INTO `hcc_tb_param_area` VALUES ('6216', '6210', '松溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6217', '6210', '政和县');
INSERT INTO `hcc_tb_param_area` VALUES ('6218', '6210', '邵武市');
INSERT INTO `hcc_tb_param_area` VALUES ('6219', '6210', '武夷山市');
INSERT INTO `hcc_tb_param_area` VALUES ('6220', '6210', '建瓯市');
INSERT INTO `hcc_tb_param_area` VALUES ('6221', '6210', '建阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6222', '6138', '龙岩市');
INSERT INTO `hcc_tb_param_area` VALUES ('6223', '6222', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6224', '6222', '新罗区');
INSERT INTO `hcc_tb_param_area` VALUES ('6225', '6222', '长汀县');
INSERT INTO `hcc_tb_param_area` VALUES ('6226', '6222', '永定县');
INSERT INTO `hcc_tb_param_area` VALUES ('6227', '6222', '上杭县');
INSERT INTO `hcc_tb_param_area` VALUES ('6228', '6222', '武平县');
INSERT INTO `hcc_tb_param_area` VALUES ('6229', '6222', '连城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6230', '6222', '漳平市');
INSERT INTO `hcc_tb_param_area` VALUES ('6231', '6138', '宁德市');
INSERT INTO `hcc_tb_param_area` VALUES ('6232', '6231', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6233', '6231', '蕉城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6234', '6231', '霞浦县');
INSERT INTO `hcc_tb_param_area` VALUES ('6235', '6231', '古田县');
INSERT INTO `hcc_tb_param_area` VALUES ('6236', '6231', '屏南县');
INSERT INTO `hcc_tb_param_area` VALUES ('6237', '6231', '寿宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6238', '6231', '周宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6239', '6231', '柘荣县');
INSERT INTO `hcc_tb_param_area` VALUES ('6240', '6231', '福安市');
INSERT INTO `hcc_tb_param_area` VALUES ('6241', '6231', '福鼎市');
INSERT INTO `hcc_tb_param_area` VALUES ('6242', '0', '江西省');
INSERT INTO `hcc_tb_param_area` VALUES ('6243', '6242', '南昌市');
INSERT INTO `hcc_tb_param_area` VALUES ('6244', '6243', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6245', '6243', '东湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6246', '6243', '西湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6247', '6243', '青云谱区');
INSERT INTO `hcc_tb_param_area` VALUES ('6248', '6243', '湾里区');
INSERT INTO `hcc_tb_param_area` VALUES ('6249', '6243', '青山湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6250', '6243', '南昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6251', '6243', '新建县');
INSERT INTO `hcc_tb_param_area` VALUES ('6252', '6243', '安义县');
INSERT INTO `hcc_tb_param_area` VALUES ('6253', '6243', '进贤县');
INSERT INTO `hcc_tb_param_area` VALUES ('6254', '6242', '景德镇市');
INSERT INTO `hcc_tb_param_area` VALUES ('6255', '6254', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6256', '6254', '昌江区');
INSERT INTO `hcc_tb_param_area` VALUES ('6257', '6254', '珠山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6258', '6254', '浮梁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6259', '6254', '乐平市');
INSERT INTO `hcc_tb_param_area` VALUES ('6260', '6242', '萍乡市');
INSERT INTO `hcc_tb_param_area` VALUES ('6261', '6260', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6262', '6260', '安源区');
INSERT INTO `hcc_tb_param_area` VALUES ('6263', '6260', '湘东区');
INSERT INTO `hcc_tb_param_area` VALUES ('6264', '6260', '莲花县');
INSERT INTO `hcc_tb_param_area` VALUES ('6265', '6260', '上栗县');
INSERT INTO `hcc_tb_param_area` VALUES ('6266', '6260', '芦溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6267', '6242', '九江市');
INSERT INTO `hcc_tb_param_area` VALUES ('6268', '6267', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6269', '6267', '庐山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6270', '6267', '浔阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6271', '6267', '九江县');
INSERT INTO `hcc_tb_param_area` VALUES ('6272', '6267', '武宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6273', '6267', '修水县');
INSERT INTO `hcc_tb_param_area` VALUES ('6274', '6267', '永修县');
INSERT INTO `hcc_tb_param_area` VALUES ('6275', '6267', '德安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6276', '6267', '星子县');
INSERT INTO `hcc_tb_param_area` VALUES ('6277', '6267', '都昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6278', '6267', '湖口县');
INSERT INTO `hcc_tb_param_area` VALUES ('6279', '6267', '彭泽县');
INSERT INTO `hcc_tb_param_area` VALUES ('6280', '6267', '瑞昌市');
INSERT INTO `hcc_tb_param_area` VALUES ('6281', '6242', '新余市');
INSERT INTO `hcc_tb_param_area` VALUES ('6282', '6281', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6283', '6281', '渝水区');
INSERT INTO `hcc_tb_param_area` VALUES ('6284', '6281', '分宜县');
INSERT INTO `hcc_tb_param_area` VALUES ('6285', '6242', '鹰潭市');
INSERT INTO `hcc_tb_param_area` VALUES ('6286', '6285', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6287', '6285', '月湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6288', '6285', '余江县');
INSERT INTO `hcc_tb_param_area` VALUES ('6289', '6285', '贵溪市');
INSERT INTO `hcc_tb_param_area` VALUES ('6290', '6242', '赣州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6291', '6290', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6292', '6290', '章贡区');
INSERT INTO `hcc_tb_param_area` VALUES ('6293', '6290', '赣　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6294', '6290', '信丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6295', '6290', '大余县');
INSERT INTO `hcc_tb_param_area` VALUES ('6296', '6290', '上犹县');
INSERT INTO `hcc_tb_param_area` VALUES ('6297', '6290', '崇义县');
INSERT INTO `hcc_tb_param_area` VALUES ('6298', '6290', '安远县');
INSERT INTO `hcc_tb_param_area` VALUES ('6299', '6290', '龙南县');
INSERT INTO `hcc_tb_param_area` VALUES ('6300', '6290', '定南县');
INSERT INTO `hcc_tb_param_area` VALUES ('6301', '6290', '全南县');
INSERT INTO `hcc_tb_param_area` VALUES ('6302', '6290', '宁都县');
INSERT INTO `hcc_tb_param_area` VALUES ('6303', '6290', '于都县');
INSERT INTO `hcc_tb_param_area` VALUES ('6304', '6290', '兴国县');
INSERT INTO `hcc_tb_param_area` VALUES ('6305', '6290', '会昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6306', '6290', '寻乌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6307', '6290', '石城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6308', '6290', '瑞金市');
INSERT INTO `hcc_tb_param_area` VALUES ('6309', '6290', '南康市');
INSERT INTO `hcc_tb_param_area` VALUES ('6310', '6242', '吉安市');
INSERT INTO `hcc_tb_param_area` VALUES ('6311', '6310', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6312', '6310', '吉州区');
INSERT INTO `hcc_tb_param_area` VALUES ('6313', '6310', '青原区');
INSERT INTO `hcc_tb_param_area` VALUES ('6314', '6310', '吉安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6315', '6310', '吉水县');
INSERT INTO `hcc_tb_param_area` VALUES ('6316', '6310', '峡江县');
INSERT INTO `hcc_tb_param_area` VALUES ('6317', '6310', '新干县');
INSERT INTO `hcc_tb_param_area` VALUES ('6318', '6310', '永丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6319', '6310', '泰和县');
INSERT INTO `hcc_tb_param_area` VALUES ('6320', '6310', '遂川县');
INSERT INTO `hcc_tb_param_area` VALUES ('6321', '6310', '万安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6322', '6310', '安福县');
INSERT INTO `hcc_tb_param_area` VALUES ('6323', '6310', '永新县');
INSERT INTO `hcc_tb_param_area` VALUES ('6324', '6310', '井冈山市');
INSERT INTO `hcc_tb_param_area` VALUES ('6325', '6242', '宜春市');
INSERT INTO `hcc_tb_param_area` VALUES ('6326', '6325', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6327', '6325', '袁州区');
INSERT INTO `hcc_tb_param_area` VALUES ('6328', '6325', '奉新县');
INSERT INTO `hcc_tb_param_area` VALUES ('6329', '6325', '万载县');
INSERT INTO `hcc_tb_param_area` VALUES ('6330', '6325', '上高县');
INSERT INTO `hcc_tb_param_area` VALUES ('6331', '6325', '宜丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6332', '6325', '靖安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6333', '6325', '铜鼓县');
INSERT INTO `hcc_tb_param_area` VALUES ('6334', '6325', '丰城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6335', '6325', '樟树市');
INSERT INTO `hcc_tb_param_area` VALUES ('6336', '6325', '高安市');
INSERT INTO `hcc_tb_param_area` VALUES ('6337', '6242', '抚州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6338', '6337', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6339', '6337', '临川区');
INSERT INTO `hcc_tb_param_area` VALUES ('6340', '6337', '南城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6341', '6337', '黎川县');
INSERT INTO `hcc_tb_param_area` VALUES ('6342', '6337', '南丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6343', '6337', '崇仁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6344', '6337', '乐安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6345', '6337', '宜黄县');
INSERT INTO `hcc_tb_param_area` VALUES ('6346', '6337', '金溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6347', '6337', '资溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6348', '6337', '东乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('6349', '6337', '广昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6350', '6242', '上饶市');
INSERT INTO `hcc_tb_param_area` VALUES ('6351', '6350', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6352', '6350', '信州区');
INSERT INTO `hcc_tb_param_area` VALUES ('6353', '6350', '上饶县');
INSERT INTO `hcc_tb_param_area` VALUES ('6354', '6350', '广丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6355', '6350', '玉山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6356', '6350', '铅山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6357', '6350', '横峰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6358', '6350', '弋阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6359', '6350', '余干县');
INSERT INTO `hcc_tb_param_area` VALUES ('6360', '6350', '鄱阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6361', '6350', '万年县');
INSERT INTO `hcc_tb_param_area` VALUES ('6362', '6350', '婺源县');
INSERT INTO `hcc_tb_param_area` VALUES ('6363', '6350', '德兴市');
INSERT INTO `hcc_tb_param_area` VALUES ('6364', '0', '山东省');
INSERT INTO `hcc_tb_param_area` VALUES ('6365', '6364', '济南市');
INSERT INTO `hcc_tb_param_area` VALUES ('6366', '6365', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6367', '6365', '历下区');
INSERT INTO `hcc_tb_param_area` VALUES ('6368', '6365', '市中区');
INSERT INTO `hcc_tb_param_area` VALUES ('6369', '6365', '槐荫区');
INSERT INTO `hcc_tb_param_area` VALUES ('6370', '6365', '天桥区');
INSERT INTO `hcc_tb_param_area` VALUES ('6371', '6365', '历城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6372', '6365', '长清区');
INSERT INTO `hcc_tb_param_area` VALUES ('6373', '6365', '平阴县');
INSERT INTO `hcc_tb_param_area` VALUES ('6374', '6365', '济阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6375', '6365', '商河县');
INSERT INTO `hcc_tb_param_area` VALUES ('6376', '6365', '章丘市');
INSERT INTO `hcc_tb_param_area` VALUES ('6377', '6364', '青岛市');
INSERT INTO `hcc_tb_param_area` VALUES ('6378', '6377', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6379', '6377', '市南区');
INSERT INTO `hcc_tb_param_area` VALUES ('6380', '6377', '市北区');
INSERT INTO `hcc_tb_param_area` VALUES ('6381', '6377', '四方区');
INSERT INTO `hcc_tb_param_area` VALUES ('6382', '6377', '黄岛区');
INSERT INTO `hcc_tb_param_area` VALUES ('6383', '6377', '崂山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6384', '6377', '李沧区');
INSERT INTO `hcc_tb_param_area` VALUES ('6385', '6377', '城阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6386', '6377', '胶州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6387', '6377', '即墨市');
INSERT INTO `hcc_tb_param_area` VALUES ('6388', '6377', '平度市');
INSERT INTO `hcc_tb_param_area` VALUES ('6389', '6377', '胶南市');
INSERT INTO `hcc_tb_param_area` VALUES ('6390', '6377', '莱西市');
INSERT INTO `hcc_tb_param_area` VALUES ('6391', '6364', '淄博市');
INSERT INTO `hcc_tb_param_area` VALUES ('6392', '6391', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6393', '6391', '淄川区');
INSERT INTO `hcc_tb_param_area` VALUES ('6394', '6391', '张店区');
INSERT INTO `hcc_tb_param_area` VALUES ('6395', '6391', '博山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6396', '6391', '临淄区');
INSERT INTO `hcc_tb_param_area` VALUES ('6397', '6391', '周村区');
INSERT INTO `hcc_tb_param_area` VALUES ('6398', '6391', '桓台县');
INSERT INTO `hcc_tb_param_area` VALUES ('6399', '6391', '高青县');
INSERT INTO `hcc_tb_param_area` VALUES ('6400', '6391', '沂源县');
INSERT INTO `hcc_tb_param_area` VALUES ('6401', '6364', '枣庄市');
INSERT INTO `hcc_tb_param_area` VALUES ('6402', '6401', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6403', '6401', '市中区');
INSERT INTO `hcc_tb_param_area` VALUES ('6404', '6401', '薛城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6405', '6401', '峄城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6406', '6401', '台儿庄区');
INSERT INTO `hcc_tb_param_area` VALUES ('6407', '6401', '山亭区');
INSERT INTO `hcc_tb_param_area` VALUES ('6408', '6401', '滕州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6409', '6364', '东营市');
INSERT INTO `hcc_tb_param_area` VALUES ('6410', '6409', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6411', '6409', '东营区');
INSERT INTO `hcc_tb_param_area` VALUES ('6412', '6409', '河口区');
INSERT INTO `hcc_tb_param_area` VALUES ('6413', '6409', '垦利县');
INSERT INTO `hcc_tb_param_area` VALUES ('6414', '6409', '利津县');
INSERT INTO `hcc_tb_param_area` VALUES ('6415', '6409', '广饶县');
INSERT INTO `hcc_tb_param_area` VALUES ('6416', '6364', '烟台市');
INSERT INTO `hcc_tb_param_area` VALUES ('6417', '6416', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6418', '6416', '芝罘区');
INSERT INTO `hcc_tb_param_area` VALUES ('6419', '6416', '福山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6420', '6416', '牟平区');
INSERT INTO `hcc_tb_param_area` VALUES ('6421', '6416', '莱山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6422', '6416', '长岛县');
INSERT INTO `hcc_tb_param_area` VALUES ('6423', '6416', '龙口市');
INSERT INTO `hcc_tb_param_area` VALUES ('6424', '6416', '莱阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6425', '6416', '莱州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6426', '6416', '蓬莱市');
INSERT INTO `hcc_tb_param_area` VALUES ('6427', '6416', '招远市');
INSERT INTO `hcc_tb_param_area` VALUES ('6428', '6416', '栖霞市');
INSERT INTO `hcc_tb_param_area` VALUES ('6429', '6416', '海阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6430', '6364', '潍坊市');
INSERT INTO `hcc_tb_param_area` VALUES ('6431', '6430', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6432', '6430', '潍城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6433', '6430', '寒亭区');
INSERT INTO `hcc_tb_param_area` VALUES ('6434', '6430', '坊子区');
INSERT INTO `hcc_tb_param_area` VALUES ('6435', '6430', '奎文区');
INSERT INTO `hcc_tb_param_area` VALUES ('6436', '6430', '临朐县');
INSERT INTO `hcc_tb_param_area` VALUES ('6437', '6430', '昌乐县');
INSERT INTO `hcc_tb_param_area` VALUES ('6438', '6430', '青州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6439', '6430', '诸城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6440', '6430', '寿光市');
INSERT INTO `hcc_tb_param_area` VALUES ('6441', '6430', '安丘市');
INSERT INTO `hcc_tb_param_area` VALUES ('6442', '6430', '高密市');
INSERT INTO `hcc_tb_param_area` VALUES ('6443', '6430', '昌邑市');
INSERT INTO `hcc_tb_param_area` VALUES ('6444', '6364', '济宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('6445', '6444', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6446', '6444', '市中区');
INSERT INTO `hcc_tb_param_area` VALUES ('6447', '6444', '任城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6448', '6444', '微山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6449', '6444', '鱼台县');
INSERT INTO `hcc_tb_param_area` VALUES ('6450', '6444', '金乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('6451', '6444', '嘉祥县');
INSERT INTO `hcc_tb_param_area` VALUES ('6452', '6444', '汶上县');
INSERT INTO `hcc_tb_param_area` VALUES ('6453', '6444', '泗水县');
INSERT INTO `hcc_tb_param_area` VALUES ('6454', '6444', '梁山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6455', '6444', '曲阜市');
INSERT INTO `hcc_tb_param_area` VALUES ('6456', '6444', '兖州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6457', '6444', '邹城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6458', '6364', '泰安市');
INSERT INTO `hcc_tb_param_area` VALUES ('6459', '6458', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6460', '6458', '泰山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6461', '6458', '岱岳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6462', '6458', '宁阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6463', '6458', '东平县');
INSERT INTO `hcc_tb_param_area` VALUES ('6464', '6458', '新泰市');
INSERT INTO `hcc_tb_param_area` VALUES ('6465', '6458', '肥城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6466', '6364', '威海市');
INSERT INTO `hcc_tb_param_area` VALUES ('6467', '6466', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6468', '6466', '环翠区');
INSERT INTO `hcc_tb_param_area` VALUES ('6469', '6466', '文登市');
INSERT INTO `hcc_tb_param_area` VALUES ('6470', '6466', '荣成市');
INSERT INTO `hcc_tb_param_area` VALUES ('6471', '6466', '乳山市');
INSERT INTO `hcc_tb_param_area` VALUES ('6472', '6364', '日照市');
INSERT INTO `hcc_tb_param_area` VALUES ('6473', '6472', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6474', '6472', '东港区');
INSERT INTO `hcc_tb_param_area` VALUES ('6475', '6472', '岚山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6476', '6472', '五莲县');
INSERT INTO `hcc_tb_param_area` VALUES ('6477', '6472', '莒　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6478', '6364', '莱芜市');
INSERT INTO `hcc_tb_param_area` VALUES ('6479', '6478', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6480', '6478', '莱城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6481', '6478', '钢城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6482', '6364', '临沂市');
INSERT INTO `hcc_tb_param_area` VALUES ('6483', '6482', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6484', '6482', '兰山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6485', '6482', '罗庄区');
INSERT INTO `hcc_tb_param_area` VALUES ('6486', '6482', '河东区');
INSERT INTO `hcc_tb_param_area` VALUES ('6487', '6482', '沂南县');
INSERT INTO `hcc_tb_param_area` VALUES ('6488', '6482', '郯城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6489', '6482', '沂水县');
INSERT INTO `hcc_tb_param_area` VALUES ('6490', '6482', '苍山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6491', '6482', '费　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6492', '6482', '平邑县');
INSERT INTO `hcc_tb_param_area` VALUES ('6493', '6482', '莒南县');
INSERT INTO `hcc_tb_param_area` VALUES ('6494', '6482', '蒙阴县');
INSERT INTO `hcc_tb_param_area` VALUES ('6495', '6482', '临沭县');
INSERT INTO `hcc_tb_param_area` VALUES ('6496', '6364', '德州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6497', '6496', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6498', '6496', '德城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6499', '6496', '陵　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6500', '6496', '宁津县');
INSERT INTO `hcc_tb_param_area` VALUES ('6501', '6496', '庆云县');
INSERT INTO `hcc_tb_param_area` VALUES ('6502', '6496', '临邑县');
INSERT INTO `hcc_tb_param_area` VALUES ('6503', '6496', '齐河县');
INSERT INTO `hcc_tb_param_area` VALUES ('6504', '6496', '平原县');
INSERT INTO `hcc_tb_param_area` VALUES ('6505', '6496', '夏津县');
INSERT INTO `hcc_tb_param_area` VALUES ('6506', '6496', '武城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6507', '6496', '乐陵市');
INSERT INTO `hcc_tb_param_area` VALUES ('6508', '6496', '禹城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6509', '6364', '聊城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6510', '6509', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6511', '6509', '东昌府区');
INSERT INTO `hcc_tb_param_area` VALUES ('6512', '6509', '阳谷县');
INSERT INTO `hcc_tb_param_area` VALUES ('6513', '6509', '莘　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6514', '6509', '茌平县');
INSERT INTO `hcc_tb_param_area` VALUES ('6515', '6509', '东阿县');
INSERT INTO `hcc_tb_param_area` VALUES ('6516', '6509', '冠　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6517', '6509', '高唐县');
INSERT INTO `hcc_tb_param_area` VALUES ('6518', '6509', '临清市');
INSERT INTO `hcc_tb_param_area` VALUES ('6519', '6364', '滨州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6520', '6519', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6521', '6519', '滨城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6522', '6519', '惠民县');
INSERT INTO `hcc_tb_param_area` VALUES ('6523', '6519', '阳信县');
INSERT INTO `hcc_tb_param_area` VALUES ('6524', '6519', '无棣县');
INSERT INTO `hcc_tb_param_area` VALUES ('6525', '6519', '沾化县');
INSERT INTO `hcc_tb_param_area` VALUES ('6526', '6519', '博兴县');
INSERT INTO `hcc_tb_param_area` VALUES ('6527', '6519', '邹平县');
INSERT INTO `hcc_tb_param_area` VALUES ('6528', '6364', '荷泽市');
INSERT INTO `hcc_tb_param_area` VALUES ('6529', '6528', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6530', '6528', '牡丹区');
INSERT INTO `hcc_tb_param_area` VALUES ('6531', '6528', '曹　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6532', '6528', '单　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6533', '6528', '成武县');
INSERT INTO `hcc_tb_param_area` VALUES ('6534', '6528', '巨野县');
INSERT INTO `hcc_tb_param_area` VALUES ('6535', '6528', '郓城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6536', '6528', '鄄城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6537', '6528', '定陶县');
INSERT INTO `hcc_tb_param_area` VALUES ('6538', '6528', '东明县');
INSERT INTO `hcc_tb_param_area` VALUES ('6539', '0', '河南省');
INSERT INTO `hcc_tb_param_area` VALUES ('6540', '6539', '郑州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6541', '6540', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6542', '6540', '中原区');
INSERT INTO `hcc_tb_param_area` VALUES ('6543', '6540', '二七区');
INSERT INTO `hcc_tb_param_area` VALUES ('6544', '6540', '管城回族区');
INSERT INTO `hcc_tb_param_area` VALUES ('6545', '6540', '金水区');
INSERT INTO `hcc_tb_param_area` VALUES ('6546', '6540', '上街区');
INSERT INTO `hcc_tb_param_area` VALUES ('6547', '6540', '邙山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6548', '6540', '中牟县');
INSERT INTO `hcc_tb_param_area` VALUES ('6549', '6540', '巩义市');
INSERT INTO `hcc_tb_param_area` VALUES ('6550', '6540', '荥阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6551', '6540', '新密市');
INSERT INTO `hcc_tb_param_area` VALUES ('6552', '6540', '新郑市');
INSERT INTO `hcc_tb_param_area` VALUES ('6553', '6540', '登封市');
INSERT INTO `hcc_tb_param_area` VALUES ('6554', '6539', '开封市');
INSERT INTO `hcc_tb_param_area` VALUES ('6555', '6554', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6556', '6554', '龙亭区');
INSERT INTO `hcc_tb_param_area` VALUES ('6557', '6554', '顺河回族区');
INSERT INTO `hcc_tb_param_area` VALUES ('6558', '6554', '鼓楼区');
INSERT INTO `hcc_tb_param_area` VALUES ('6559', '6554', '南关区');
INSERT INTO `hcc_tb_param_area` VALUES ('6560', '6554', '郊　区');
INSERT INTO `hcc_tb_param_area` VALUES ('6561', '6554', '杞　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6562', '6554', '通许县');
INSERT INTO `hcc_tb_param_area` VALUES ('6563', '6554', '尉氏县');
INSERT INTO `hcc_tb_param_area` VALUES ('6564', '6554', '开封县');
INSERT INTO `hcc_tb_param_area` VALUES ('6565', '6554', '兰考县');
INSERT INTO `hcc_tb_param_area` VALUES ('6566', '6539', '洛阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6567', '6566', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6568', '6566', '老城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6569', '6566', '西工区');
INSERT INTO `hcc_tb_param_area` VALUES ('6570', '6566', '廛河回族区');
INSERT INTO `hcc_tb_param_area` VALUES ('6571', '6566', '涧西区');
INSERT INTO `hcc_tb_param_area` VALUES ('6572', '6566', '吉利区');
INSERT INTO `hcc_tb_param_area` VALUES ('6573', '6566', '洛龙区');
INSERT INTO `hcc_tb_param_area` VALUES ('6574', '6566', '孟津县');
INSERT INTO `hcc_tb_param_area` VALUES ('6575', '6566', '新安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6576', '6566', '栾川县');
INSERT INTO `hcc_tb_param_area` VALUES ('6577', '6566', '嵩　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6578', '6566', '汝阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6579', '6566', '宜阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6580', '6566', '洛宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6581', '6566', '伊川县');
INSERT INTO `hcc_tb_param_area` VALUES ('6582', '6566', '偃师市');
INSERT INTO `hcc_tb_param_area` VALUES ('6583', '6539', '平顶山市');
INSERT INTO `hcc_tb_param_area` VALUES ('6584', '6583', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6585', '6583', '新华区');
INSERT INTO `hcc_tb_param_area` VALUES ('6586', '6583', '卫东区');
INSERT INTO `hcc_tb_param_area` VALUES ('6587', '6583', '石龙区');
INSERT INTO `hcc_tb_param_area` VALUES ('6588', '6583', '湛河区');
INSERT INTO `hcc_tb_param_area` VALUES ('6589', '6583', '宝丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6590', '6583', '叶　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6591', '6583', '鲁山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6592', '6583', '郏　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6593', '6583', '舞钢市');
INSERT INTO `hcc_tb_param_area` VALUES ('6594', '6583', '汝州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6595', '6539', '安阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6596', '6595', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6597', '6595', '文峰区');
INSERT INTO `hcc_tb_param_area` VALUES ('6598', '6595', '北关区');
INSERT INTO `hcc_tb_param_area` VALUES ('6599', '6595', '殷都区');
INSERT INTO `hcc_tb_param_area` VALUES ('6600', '6595', '龙安区');
INSERT INTO `hcc_tb_param_area` VALUES ('6601', '6595', '安阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6602', '6595', '汤阴县');
INSERT INTO `hcc_tb_param_area` VALUES ('6603', '6595', '滑　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6604', '6595', '内黄县');
INSERT INTO `hcc_tb_param_area` VALUES ('6605', '6595', '林州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6606', '6539', '鹤壁市');
INSERT INTO `hcc_tb_param_area` VALUES ('6607', '6606', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6608', '6606', '鹤山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6609', '6606', '山城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6610', '6606', '淇滨区');
INSERT INTO `hcc_tb_param_area` VALUES ('6611', '6606', '浚　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6612', '6606', '淇　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6613', '6539', '新乡市');
INSERT INTO `hcc_tb_param_area` VALUES ('6614', '6613', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6615', '6613', '红旗区');
INSERT INTO `hcc_tb_param_area` VALUES ('6616', '6613', '卫滨区');
INSERT INTO `hcc_tb_param_area` VALUES ('6617', '6613', '凤泉区');
INSERT INTO `hcc_tb_param_area` VALUES ('6618', '6613', '牧野区');
INSERT INTO `hcc_tb_param_area` VALUES ('6619', '6613', '新乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('6620', '6613', '获嘉县');
INSERT INTO `hcc_tb_param_area` VALUES ('6621', '6613', '原阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6622', '6613', '延津县');
INSERT INTO `hcc_tb_param_area` VALUES ('6623', '6613', '封丘县');
INSERT INTO `hcc_tb_param_area` VALUES ('6624', '6613', '长垣县');
INSERT INTO `hcc_tb_param_area` VALUES ('6625', '6613', '卫辉市');
INSERT INTO `hcc_tb_param_area` VALUES ('6626', '6613', '辉县市');
INSERT INTO `hcc_tb_param_area` VALUES ('6627', '6539', '焦作市');
INSERT INTO `hcc_tb_param_area` VALUES ('6628', '6627', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6629', '6627', '解放区');
INSERT INTO `hcc_tb_param_area` VALUES ('6630', '6627', '中站区');
INSERT INTO `hcc_tb_param_area` VALUES ('6631', '6627', '马村区');
INSERT INTO `hcc_tb_param_area` VALUES ('6632', '6627', '山阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6633', '6627', '修武县');
INSERT INTO `hcc_tb_param_area` VALUES ('6634', '6627', '博爱县');
INSERT INTO `hcc_tb_param_area` VALUES ('6635', '6627', '武陟县');
INSERT INTO `hcc_tb_param_area` VALUES ('6636', '6627', '温　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6637', '6627', '济源市');
INSERT INTO `hcc_tb_param_area` VALUES ('6638', '6627', '沁阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6639', '6627', '孟州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6640', '6539', '濮阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6641', '6640', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6642', '6640', '华龙区');
INSERT INTO `hcc_tb_param_area` VALUES ('6643', '6640', '清丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6644', '6640', '南乐县');
INSERT INTO `hcc_tb_param_area` VALUES ('6645', '6640', '范　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6646', '6640', '台前县');
INSERT INTO `hcc_tb_param_area` VALUES ('6647', '6640', '濮阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6648', '6539', '许昌市');
INSERT INTO `hcc_tb_param_area` VALUES ('6649', '6648', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6650', '6648', '魏都区');
INSERT INTO `hcc_tb_param_area` VALUES ('6651', '6648', '许昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6652', '6648', '鄢陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('6653', '6648', '襄城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6654', '6648', '禹州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6655', '6648', '长葛市');
INSERT INTO `hcc_tb_param_area` VALUES ('6656', '6539', '漯河市');
INSERT INTO `hcc_tb_param_area` VALUES ('6657', '6656', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6658', '6656', '源汇区');
INSERT INTO `hcc_tb_param_area` VALUES ('6659', '6656', '郾城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6660', '6656', '召陵区');
INSERT INTO `hcc_tb_param_area` VALUES ('6661', '6656', '舞阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6662', '6656', '临颍县');
INSERT INTO `hcc_tb_param_area` VALUES ('6663', '6539', '三门峡市');
INSERT INTO `hcc_tb_param_area` VALUES ('6664', '6663', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6665', '6663', '湖滨区');
INSERT INTO `hcc_tb_param_area` VALUES ('6666', '6663', '渑池县');
INSERT INTO `hcc_tb_param_area` VALUES ('6667', '6663', '陕　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6668', '6663', '卢氏县');
INSERT INTO `hcc_tb_param_area` VALUES ('6669', '6663', '义马市');
INSERT INTO `hcc_tb_param_area` VALUES ('6670', '6663', '灵宝市');
INSERT INTO `hcc_tb_param_area` VALUES ('6671', '6539', '南阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6672', '6671', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6673', '6671', '宛城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6674', '6671', '卧龙区');
INSERT INTO `hcc_tb_param_area` VALUES ('6675', '6671', '南召县');
INSERT INTO `hcc_tb_param_area` VALUES ('6676', '6671', '方城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6677', '6671', '西峡县');
INSERT INTO `hcc_tb_param_area` VALUES ('6678', '6671', '镇平县');
INSERT INTO `hcc_tb_param_area` VALUES ('6679', '6671', '内乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('6680', '6671', '淅川县');
INSERT INTO `hcc_tb_param_area` VALUES ('6681', '6671', '社旗县');
INSERT INTO `hcc_tb_param_area` VALUES ('6682', '6671', '唐河县');
INSERT INTO `hcc_tb_param_area` VALUES ('6683', '6671', '新野县');
INSERT INTO `hcc_tb_param_area` VALUES ('6684', '6671', '桐柏县');
INSERT INTO `hcc_tb_param_area` VALUES ('6685', '6671', '邓州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6686', '6539', '商丘市');
INSERT INTO `hcc_tb_param_area` VALUES ('6687', '6686', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6688', '6686', '梁园区');
INSERT INTO `hcc_tb_param_area` VALUES ('6689', '6686', '睢阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6690', '6686', '民权县');
INSERT INTO `hcc_tb_param_area` VALUES ('6691', '6686', '睢　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6692', '6686', '宁陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('6693', '6686', '柘城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6694', '6686', '虞城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6695', '6686', '夏邑县');
INSERT INTO `hcc_tb_param_area` VALUES ('6696', '6686', '永城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6697', '6539', '信阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6698', '6697', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6699', '6697', '师河区');
INSERT INTO `hcc_tb_param_area` VALUES ('6700', '6697', '平桥区');
INSERT INTO `hcc_tb_param_area` VALUES ('6701', '6697', '罗山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6702', '6697', '光山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6703', '6697', '新　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6704', '6697', '商城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6705', '6697', '固始县');
INSERT INTO `hcc_tb_param_area` VALUES ('6706', '6697', '潢川县');
INSERT INTO `hcc_tb_param_area` VALUES ('6707', '6697', '淮滨县');
INSERT INTO `hcc_tb_param_area` VALUES ('6708', '6697', '息　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6709', '6539', '周口市');
INSERT INTO `hcc_tb_param_area` VALUES ('6710', '6709', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6711', '6709', '川汇区');
INSERT INTO `hcc_tb_param_area` VALUES ('6712', '6709', '扶沟县');
INSERT INTO `hcc_tb_param_area` VALUES ('6713', '6709', '西华县');
INSERT INTO `hcc_tb_param_area` VALUES ('6714', '6709', '商水县');
INSERT INTO `hcc_tb_param_area` VALUES ('6715', '6709', '沈丘县');
INSERT INTO `hcc_tb_param_area` VALUES ('6716', '6709', '郸城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6717', '6709', '淮阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6718', '6709', '太康县');
INSERT INTO `hcc_tb_param_area` VALUES ('6719', '6709', '鹿邑县');
INSERT INTO `hcc_tb_param_area` VALUES ('6720', '6709', '项城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6721', '6539', '驻马店市');
INSERT INTO `hcc_tb_param_area` VALUES ('6722', '6721', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6723', '6721', '驿城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6724', '6721', '西平县');
INSERT INTO `hcc_tb_param_area` VALUES ('6725', '6721', '上蔡县');
INSERT INTO `hcc_tb_param_area` VALUES ('6726', '6721', '平舆县');
INSERT INTO `hcc_tb_param_area` VALUES ('6727', '6721', '正阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6728', '6721', '确山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6729', '6721', '泌阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6730', '6721', '汝南县');
INSERT INTO `hcc_tb_param_area` VALUES ('6731', '6721', '遂平县');
INSERT INTO `hcc_tb_param_area` VALUES ('6732', '6721', '新蔡县');
INSERT INTO `hcc_tb_param_area` VALUES ('6733', '0', '湖北省');
INSERT INTO `hcc_tb_param_area` VALUES ('6734', '6733', '武汉市');
INSERT INTO `hcc_tb_param_area` VALUES ('6735', '6734', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6736', '6734', '江岸区');
INSERT INTO `hcc_tb_param_area` VALUES ('6737', '6734', '江汉区');
INSERT INTO `hcc_tb_param_area` VALUES ('6738', '6734', '乔口区');
INSERT INTO `hcc_tb_param_area` VALUES ('6739', '6734', '汉阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6740', '6734', '武昌区');
INSERT INTO `hcc_tb_param_area` VALUES ('6741', '6734', '青山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6742', '6734', '洪山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6743', '6734', '东西湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6744', '6734', '汉南区');
INSERT INTO `hcc_tb_param_area` VALUES ('6745', '6734', '蔡甸区');
INSERT INTO `hcc_tb_param_area` VALUES ('6746', '6734', '江夏区');
INSERT INTO `hcc_tb_param_area` VALUES ('6747', '6734', '黄陂区');
INSERT INTO `hcc_tb_param_area` VALUES ('6748', '6734', '新洲区');
INSERT INTO `hcc_tb_param_area` VALUES ('6749', '6733', '黄石市');
INSERT INTO `hcc_tb_param_area` VALUES ('6750', '6749', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6751', '6749', '黄石港区');
INSERT INTO `hcc_tb_param_area` VALUES ('6752', '6749', '西塞山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6753', '6749', '下陆区');
INSERT INTO `hcc_tb_param_area` VALUES ('6754', '6749', '铁山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6755', '6749', '阳新县');
INSERT INTO `hcc_tb_param_area` VALUES ('6756', '6749', '大冶市');
INSERT INTO `hcc_tb_param_area` VALUES ('6757', '6733', '十堰市');
INSERT INTO `hcc_tb_param_area` VALUES ('6758', '6757', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6759', '6757', '茅箭区');
INSERT INTO `hcc_tb_param_area` VALUES ('6760', '6757', '张湾区');
INSERT INTO `hcc_tb_param_area` VALUES ('6761', '6757', '郧　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6762', '6757', '郧西县');
INSERT INTO `hcc_tb_param_area` VALUES ('6763', '6757', '竹山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6764', '6757', '竹溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6765', '6757', '房　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6766', '6757', '丹江口市');
INSERT INTO `hcc_tb_param_area` VALUES ('6767', '6733', '宜昌市');
INSERT INTO `hcc_tb_param_area` VALUES ('6768', '6767', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6769', '6767', '西陵区');
INSERT INTO `hcc_tb_param_area` VALUES ('6770', '6767', '伍家岗区');
INSERT INTO `hcc_tb_param_area` VALUES ('6771', '6767', '点军区');
INSERT INTO `hcc_tb_param_area` VALUES ('6772', '6767', '猇亭区');
INSERT INTO `hcc_tb_param_area` VALUES ('6773', '6767', '夷陵区');
INSERT INTO `hcc_tb_param_area` VALUES ('6774', '6767', '远安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6775', '6767', '兴山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6776', '6767', '秭归县');
INSERT INTO `hcc_tb_param_area` VALUES ('6777', '6767', '长阳土家族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('6778', '6767', '五峰土家族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('6779', '6767', '宜都市');
INSERT INTO `hcc_tb_param_area` VALUES ('6780', '6767', '当阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6781', '6767', '枝江市');
INSERT INTO `hcc_tb_param_area` VALUES ('6782', '6733', '襄樊市');
INSERT INTO `hcc_tb_param_area` VALUES ('6783', '6782', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6784', '6782', '襄城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6785', '6782', '樊城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6786', '6782', '襄阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6787', '6782', '南漳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6788', '6782', '谷城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6789', '6782', '保康县');
INSERT INTO `hcc_tb_param_area` VALUES ('6790', '6782', '老河口市');
INSERT INTO `hcc_tb_param_area` VALUES ('6791', '6782', '枣阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6792', '6782', '宜城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6793', '6733', '鄂州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6794', '6793', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6795', '6793', '梁子湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6796', '6793', '华容区');
INSERT INTO `hcc_tb_param_area` VALUES ('6797', '6793', '鄂城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6798', '6733', '荆门市');
INSERT INTO `hcc_tb_param_area` VALUES ('6799', '6798', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6800', '6798', '东宝区');
INSERT INTO `hcc_tb_param_area` VALUES ('6801', '6798', '掇刀区');
INSERT INTO `hcc_tb_param_area` VALUES ('6802', '6798', '京山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6803', '6798', '沙洋县');
INSERT INTO `hcc_tb_param_area` VALUES ('6804', '6798', '钟祥市');
INSERT INTO `hcc_tb_param_area` VALUES ('6805', '6733', '孝感市');
INSERT INTO `hcc_tb_param_area` VALUES ('6806', '6805', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6807', '6805', '孝南区');
INSERT INTO `hcc_tb_param_area` VALUES ('6808', '6805', '孝昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6809', '6805', '大悟县');
INSERT INTO `hcc_tb_param_area` VALUES ('6810', '6805', '云梦县');
INSERT INTO `hcc_tb_param_area` VALUES ('6811', '6805', '应城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6812', '6805', '安陆市');
INSERT INTO `hcc_tb_param_area` VALUES ('6813', '6805', '汉川市');
INSERT INTO `hcc_tb_param_area` VALUES ('6814', '6733', '荆州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6815', '6814', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6816', '6814', '沙市区');
INSERT INTO `hcc_tb_param_area` VALUES ('6817', '6814', '荆州区');
INSERT INTO `hcc_tb_param_area` VALUES ('6818', '6814', '公安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6819', '6814', '监利县');
INSERT INTO `hcc_tb_param_area` VALUES ('6820', '6814', '江陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('6821', '6814', '石首市');
INSERT INTO `hcc_tb_param_area` VALUES ('6822', '6814', '洪湖市');
INSERT INTO `hcc_tb_param_area` VALUES ('6823', '6814', '松滋市');
INSERT INTO `hcc_tb_param_area` VALUES ('6824', '6733', '黄冈市');
INSERT INTO `hcc_tb_param_area` VALUES ('6825', '6824', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6826', '6824', '黄州区');
INSERT INTO `hcc_tb_param_area` VALUES ('6827', '6824', '团风县');
INSERT INTO `hcc_tb_param_area` VALUES ('6828', '6824', '红安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6829', '6824', '罗田县');
INSERT INTO `hcc_tb_param_area` VALUES ('6830', '6824', '英山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6831', '6824', '浠水县');
INSERT INTO `hcc_tb_param_area` VALUES ('6832', '6824', '蕲春县');
INSERT INTO `hcc_tb_param_area` VALUES ('6833', '6824', '黄梅县');
INSERT INTO `hcc_tb_param_area` VALUES ('6834', '6824', '麻城市');
INSERT INTO `hcc_tb_param_area` VALUES ('6835', '6824', '武穴市');
INSERT INTO `hcc_tb_param_area` VALUES ('6836', '6733', '咸宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('6837', '6836', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6838', '6836', '咸安区');
INSERT INTO `hcc_tb_param_area` VALUES ('6839', '6836', '嘉鱼县');
INSERT INTO `hcc_tb_param_area` VALUES ('6840', '6836', '通城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6841', '6836', '崇阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6842', '6836', '通山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6843', '6836', '赤壁市');
INSERT INTO `hcc_tb_param_area` VALUES ('6844', '6733', '随州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6845', '6844', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6846', '6844', '曾都区');
INSERT INTO `hcc_tb_param_area` VALUES ('6847', '6844', '广水市');
INSERT INTO `hcc_tb_param_area` VALUES ('6848', '6733', '恩施土家族苗族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('6849', '6848', '恩施市');
INSERT INTO `hcc_tb_param_area` VALUES ('6850', '6848', '利川市');
INSERT INTO `hcc_tb_param_area` VALUES ('6851', '6848', '建始县');
INSERT INTO `hcc_tb_param_area` VALUES ('6852', '6848', '巴东县');
INSERT INTO `hcc_tb_param_area` VALUES ('6853', '6848', '宣恩县');
INSERT INTO `hcc_tb_param_area` VALUES ('6854', '6848', '咸丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6855', '6848', '来凤县');
INSERT INTO `hcc_tb_param_area` VALUES ('6856', '6848', '鹤峰县');
INSERT INTO `hcc_tb_param_area` VALUES ('6857', '6733', '省直辖行政单位');
INSERT INTO `hcc_tb_param_area` VALUES ('6858', '6857', '仙桃市');
INSERT INTO `hcc_tb_param_area` VALUES ('6859', '6857', '潜江市');
INSERT INTO `hcc_tb_param_area` VALUES ('6860', '6857', '天门市');
INSERT INTO `hcc_tb_param_area` VALUES ('6861', '6857', '神农架林区');
INSERT INTO `hcc_tb_param_area` VALUES ('6862', '0', '湖南省');
INSERT INTO `hcc_tb_param_area` VALUES ('6863', '6862', '长沙市');
INSERT INTO `hcc_tb_param_area` VALUES ('6864', '6863', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6865', '6863', '芙蓉区');
INSERT INTO `hcc_tb_param_area` VALUES ('6866', '6863', '天心区');
INSERT INTO `hcc_tb_param_area` VALUES ('6867', '6863', '岳麓区');
INSERT INTO `hcc_tb_param_area` VALUES ('6868', '6863', '开福区');
INSERT INTO `hcc_tb_param_area` VALUES ('6869', '6863', '雨花区');
INSERT INTO `hcc_tb_param_area` VALUES ('6870', '6863', '长沙县');
INSERT INTO `hcc_tb_param_area` VALUES ('6871', '6863', '望城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6872', '6863', '宁乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('6873', '6863', '浏阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6874', '6862', '株洲市');
INSERT INTO `hcc_tb_param_area` VALUES ('6875', '6874', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6876', '6874', '荷塘区');
INSERT INTO `hcc_tb_param_area` VALUES ('6877', '6874', '芦淞区');
INSERT INTO `hcc_tb_param_area` VALUES ('6878', '6874', '石峰区');
INSERT INTO `hcc_tb_param_area` VALUES ('6879', '6874', '天元区');
INSERT INTO `hcc_tb_param_area` VALUES ('6880', '6874', '株洲县');
INSERT INTO `hcc_tb_param_area` VALUES ('6881', '6874', '攸　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6882', '6874', '茶陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('6883', '6874', '炎陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('6884', '6874', '醴陵市');
INSERT INTO `hcc_tb_param_area` VALUES ('6885', '6862', '湘潭市');
INSERT INTO `hcc_tb_param_area` VALUES ('6886', '6885', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6887', '6885', '雨湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6888', '6885', '岳塘区');
INSERT INTO `hcc_tb_param_area` VALUES ('6889', '6885', '湘潭县');
INSERT INTO `hcc_tb_param_area` VALUES ('6890', '6885', '湘乡市');
INSERT INTO `hcc_tb_param_area` VALUES ('6891', '6885', '韶山市');
INSERT INTO `hcc_tb_param_area` VALUES ('6892', '6862', '衡阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6893', '6892', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6894', '6892', '珠晖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6895', '6892', '雁峰区');
INSERT INTO `hcc_tb_param_area` VALUES ('6896', '6892', '石鼓区');
INSERT INTO `hcc_tb_param_area` VALUES ('6897', '6892', '蒸湘区');
INSERT INTO `hcc_tb_param_area` VALUES ('6898', '6892', '南岳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6899', '6892', '衡阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6900', '6892', '衡南县');
INSERT INTO `hcc_tb_param_area` VALUES ('6901', '6892', '衡山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6902', '6892', '衡东县');
INSERT INTO `hcc_tb_param_area` VALUES ('6903', '6892', '祁东县');
INSERT INTO `hcc_tb_param_area` VALUES ('6904', '6892', '耒阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6905', '6892', '常宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('6906', '6862', '邵阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6907', '6906', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6908', '6906', '双清区');
INSERT INTO `hcc_tb_param_area` VALUES ('6909', '6906', '大祥区');
INSERT INTO `hcc_tb_param_area` VALUES ('6910', '6906', '北塔区');
INSERT INTO `hcc_tb_param_area` VALUES ('6911', '6906', '邵东县');
INSERT INTO `hcc_tb_param_area` VALUES ('6912', '6906', '新邵县');
INSERT INTO `hcc_tb_param_area` VALUES ('6913', '6906', '邵阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6914', '6906', '隆回县');
INSERT INTO `hcc_tb_param_area` VALUES ('6915', '6906', '洞口县');
INSERT INTO `hcc_tb_param_area` VALUES ('6916', '6906', '绥宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6917', '6906', '新宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6918', '6906', '城步苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('6919', '6906', '武冈市');
INSERT INTO `hcc_tb_param_area` VALUES ('6920', '6862', '岳阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6921', '6920', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6922', '6920', '岳阳楼区');
INSERT INTO `hcc_tb_param_area` VALUES ('6923', '6920', '云溪区');
INSERT INTO `hcc_tb_param_area` VALUES ('6924', '6920', '君山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6925', '6920', '岳阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6926', '6920', '华容县');
INSERT INTO `hcc_tb_param_area` VALUES ('6927', '6920', '湘阴县');
INSERT INTO `hcc_tb_param_area` VALUES ('6928', '6920', '平江县');
INSERT INTO `hcc_tb_param_area` VALUES ('6929', '6920', '汨罗市');
INSERT INTO `hcc_tb_param_area` VALUES ('6930', '6920', '临湘市');
INSERT INTO `hcc_tb_param_area` VALUES ('6931', '6862', '常德市');
INSERT INTO `hcc_tb_param_area` VALUES ('6932', '6931', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6933', '6931', '武陵区');
INSERT INTO `hcc_tb_param_area` VALUES ('6934', '6931', '鼎城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6935', '6931', '安乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('6936', '6931', '汉寿县');
INSERT INTO `hcc_tb_param_area` VALUES ('6937', '6931', '澧　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6938', '6931', '临澧县');
INSERT INTO `hcc_tb_param_area` VALUES ('6939', '6931', '桃源县');
INSERT INTO `hcc_tb_param_area` VALUES ('6940', '6931', '石门县');
INSERT INTO `hcc_tb_param_area` VALUES ('6941', '6931', '津市市');
INSERT INTO `hcc_tb_param_area` VALUES ('6942', '6862', '张家界市');
INSERT INTO `hcc_tb_param_area` VALUES ('6943', '6942', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6944', '6942', '永定区');
INSERT INTO `hcc_tb_param_area` VALUES ('6945', '6942', '武陵源区');
INSERT INTO `hcc_tb_param_area` VALUES ('6946', '6942', '慈利县');
INSERT INTO `hcc_tb_param_area` VALUES ('6947', '6942', '桑植县');
INSERT INTO `hcc_tb_param_area` VALUES ('6948', '6862', '益阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('6949', '6948', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6950', '6948', '资阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('6951', '6948', '赫山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6952', '6948', '南　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6953', '6948', '桃江县');
INSERT INTO `hcc_tb_param_area` VALUES ('6954', '6948', '安化县');
INSERT INTO `hcc_tb_param_area` VALUES ('6955', '6948', '沅江市');
INSERT INTO `hcc_tb_param_area` VALUES ('6956', '6862', '郴州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6957', '6956', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6958', '6956', '北湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6959', '6956', '苏仙区');
INSERT INTO `hcc_tb_param_area` VALUES ('6960', '6956', '桂阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6961', '6956', '宜章县');
INSERT INTO `hcc_tb_param_area` VALUES ('6962', '6956', '永兴县');
INSERT INTO `hcc_tb_param_area` VALUES ('6963', '6956', '嘉禾县');
INSERT INTO `hcc_tb_param_area` VALUES ('6964', '6956', '临武县');
INSERT INTO `hcc_tb_param_area` VALUES ('6965', '6956', '汝城县');
INSERT INTO `hcc_tb_param_area` VALUES ('6966', '6956', '桂东县');
INSERT INTO `hcc_tb_param_area` VALUES ('6967', '6956', '安仁县');
INSERT INTO `hcc_tb_param_area` VALUES ('6968', '6956', '资兴市');
INSERT INTO `hcc_tb_param_area` VALUES ('6969', '6862', '永州市');
INSERT INTO `hcc_tb_param_area` VALUES ('6970', '6969', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6971', '6969', '芝山区');
INSERT INTO `hcc_tb_param_area` VALUES ('6972', '6969', '冷水滩区');
INSERT INTO `hcc_tb_param_area` VALUES ('6973', '6969', '祁阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('6974', '6969', '东安县');
INSERT INTO `hcc_tb_param_area` VALUES ('6975', '6969', '双牌县');
INSERT INTO `hcc_tb_param_area` VALUES ('6976', '6969', '道　县');
INSERT INTO `hcc_tb_param_area` VALUES ('6977', '6969', '江永县');
INSERT INTO `hcc_tb_param_area` VALUES ('6978', '6969', '宁远县');
INSERT INTO `hcc_tb_param_area` VALUES ('6979', '6969', '蓝山县');
INSERT INTO `hcc_tb_param_area` VALUES ('6980', '6969', '新田县');
INSERT INTO `hcc_tb_param_area` VALUES ('6981', '6969', '江华瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('6982', '6862', '怀化市');
INSERT INTO `hcc_tb_param_area` VALUES ('6983', '6982', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6984', '6982', '鹤城区');
INSERT INTO `hcc_tb_param_area` VALUES ('6985', '6982', '中方县');
INSERT INTO `hcc_tb_param_area` VALUES ('6986', '6982', '沅陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('6987', '6982', '辰溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('6988', '6982', '溆浦县');
INSERT INTO `hcc_tb_param_area` VALUES ('6989', '6982', '会同县');
INSERT INTO `hcc_tb_param_area` VALUES ('6990', '6982', '麻阳苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('6991', '6982', '新晃侗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('6992', '6982', '芷江侗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('6993', '6982', '靖州苗族侗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('6994', '6982', '通道侗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('6995', '6982', '洪江市');
INSERT INTO `hcc_tb_param_area` VALUES ('6996', '6862', '娄底市');
INSERT INTO `hcc_tb_param_area` VALUES ('6997', '6996', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('6998', '6996', '娄星区');
INSERT INTO `hcc_tb_param_area` VALUES ('6999', '6996', '双峰县');
INSERT INTO `hcc_tb_param_area` VALUES ('7000', '6996', '新化县');
INSERT INTO `hcc_tb_param_area` VALUES ('7001', '6996', '冷水江市');
INSERT INTO `hcc_tb_param_area` VALUES ('7002', '6996', '涟源市');
INSERT INTO `hcc_tb_param_area` VALUES ('7003', '6862', '湘西土家族苗族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7004', '7003', '吉首市');
INSERT INTO `hcc_tb_param_area` VALUES ('7005', '7003', '泸溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('7006', '7003', '凤凰县');
INSERT INTO `hcc_tb_param_area` VALUES ('7007', '7003', '花垣县');
INSERT INTO `hcc_tb_param_area` VALUES ('7008', '7003', '保靖县');
INSERT INTO `hcc_tb_param_area` VALUES ('7009', '7003', '古丈县');
INSERT INTO `hcc_tb_param_area` VALUES ('7010', '7003', '永顺县');
INSERT INTO `hcc_tb_param_area` VALUES ('7011', '7003', '龙山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7012', '0', '广东省');
INSERT INTO `hcc_tb_param_area` VALUES ('7013', '7012', '广州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7014', '7013', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7015', '7013', '东山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7016', '7013', '荔湾区');
INSERT INTO `hcc_tb_param_area` VALUES ('7017', '7013', '越秀区');
INSERT INTO `hcc_tb_param_area` VALUES ('7018', '7013', '海珠区');
INSERT INTO `hcc_tb_param_area` VALUES ('7019', '7013', '天河区');
INSERT INTO `hcc_tb_param_area` VALUES ('7020', '7013', '芳村区');
INSERT INTO `hcc_tb_param_area` VALUES ('7021', '7013', '白云区');
INSERT INTO `hcc_tb_param_area` VALUES ('7022', '7013', '黄埔区');
INSERT INTO `hcc_tb_param_area` VALUES ('7023', '7013', '番禺区');
INSERT INTO `hcc_tb_param_area` VALUES ('7024', '7013', '花都区');
INSERT INTO `hcc_tb_param_area` VALUES ('7025', '7013', '增城市');
INSERT INTO `hcc_tb_param_area` VALUES ('7026', '7013', '从化市');
INSERT INTO `hcc_tb_param_area` VALUES ('7027', '7012', '韶关市');
INSERT INTO `hcc_tb_param_area` VALUES ('7028', '7027', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7029', '7027', '武江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7030', '7027', '浈江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7031', '7027', '曲江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7032', '7027', '始兴县');
INSERT INTO `hcc_tb_param_area` VALUES ('7033', '7027', '仁化县');
INSERT INTO `hcc_tb_param_area` VALUES ('7034', '7027', '翁源县');
INSERT INTO `hcc_tb_param_area` VALUES ('7035', '7027', '乳源瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7036', '7027', '新丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('7037', '7027', '乐昌市');
INSERT INTO `hcc_tb_param_area` VALUES ('7038', '7027', '南雄市');
INSERT INTO `hcc_tb_param_area` VALUES ('7039', '7012', '深圳市');
INSERT INTO `hcc_tb_param_area` VALUES ('7040', '7039', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7041', '7039', '罗湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7042', '7039', '福田区');
INSERT INTO `hcc_tb_param_area` VALUES ('7043', '7039', '南山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7044', '7039', '宝安区');
INSERT INTO `hcc_tb_param_area` VALUES ('7045', '7039', '龙岗区');
INSERT INTO `hcc_tb_param_area` VALUES ('7046', '7039', '盐田区');
INSERT INTO `hcc_tb_param_area` VALUES ('7047', '7012', '珠海市');
INSERT INTO `hcc_tb_param_area` VALUES ('7048', '7047', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7049', '7047', '香洲区');
INSERT INTO `hcc_tb_param_area` VALUES ('7050', '7047', '斗门区');
INSERT INTO `hcc_tb_param_area` VALUES ('7051', '7047', '金湾区');
INSERT INTO `hcc_tb_param_area` VALUES ('7052', '7012', '汕头市');
INSERT INTO `hcc_tb_param_area` VALUES ('7053', '7052', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7054', '7052', '龙湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7055', '7052', '金平区');
INSERT INTO `hcc_tb_param_area` VALUES ('7056', '7052', '濠江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7057', '7052', '潮阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('7058', '7052', '潮南区');
INSERT INTO `hcc_tb_param_area` VALUES ('7059', '7052', '澄海区');
INSERT INTO `hcc_tb_param_area` VALUES ('7060', '7052', '南澳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7061', '7012', '佛山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7062', '7061', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7063', '7061', '禅城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7064', '7061', '南海区');
INSERT INTO `hcc_tb_param_area` VALUES ('7065', '7061', '顺德区');
INSERT INTO `hcc_tb_param_area` VALUES ('7066', '7061', '三水区');
INSERT INTO `hcc_tb_param_area` VALUES ('7067', '7061', '高明区');
INSERT INTO `hcc_tb_param_area` VALUES ('7068', '7012', '江门市');
INSERT INTO `hcc_tb_param_area` VALUES ('7069', '7068', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7070', '7068', '蓬江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7071', '7068', '江海区');
INSERT INTO `hcc_tb_param_area` VALUES ('7072', '7068', '新会区');
INSERT INTO `hcc_tb_param_area` VALUES ('7073', '7068', '台山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7074', '7068', '开平市');
INSERT INTO `hcc_tb_param_area` VALUES ('7075', '7068', '鹤山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7076', '7068', '恩平市');
INSERT INTO `hcc_tb_param_area` VALUES ('7077', '7012', '湛江市');
INSERT INTO `hcc_tb_param_area` VALUES ('7078', '7077', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7079', '7077', '赤坎区');
INSERT INTO `hcc_tb_param_area` VALUES ('7080', '7077', '霞山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7081', '7077', '坡头区');
INSERT INTO `hcc_tb_param_area` VALUES ('7082', '7077', '麻章区');
INSERT INTO `hcc_tb_param_area` VALUES ('7083', '7077', '遂溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('7084', '7077', '徐闻县');
INSERT INTO `hcc_tb_param_area` VALUES ('7085', '7077', '廉江市');
INSERT INTO `hcc_tb_param_area` VALUES ('7086', '7077', '雷州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7087', '7077', '吴川市');
INSERT INTO `hcc_tb_param_area` VALUES ('7088', '7012', '茂名市');
INSERT INTO `hcc_tb_param_area` VALUES ('7089', '7088', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7090', '7088', '茂南区');
INSERT INTO `hcc_tb_param_area` VALUES ('7091', '7088', '茂港区');
INSERT INTO `hcc_tb_param_area` VALUES ('7092', '7088', '电白县');
INSERT INTO `hcc_tb_param_area` VALUES ('7093', '7088', '高州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7094', '7088', '化州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7095', '7088', '信宜市');
INSERT INTO `hcc_tb_param_area` VALUES ('7096', '7012', '肇庆市');
INSERT INTO `hcc_tb_param_area` VALUES ('7097', '7096', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7098', '7096', '端州区');
INSERT INTO `hcc_tb_param_area` VALUES ('7099', '7096', '鼎湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7100', '7096', '广宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7101', '7096', '怀集县');
INSERT INTO `hcc_tb_param_area` VALUES ('7102', '7096', '封开县');
INSERT INTO `hcc_tb_param_area` VALUES ('7103', '7096', '德庆县');
INSERT INTO `hcc_tb_param_area` VALUES ('7104', '7096', '高要市');
INSERT INTO `hcc_tb_param_area` VALUES ('7105', '7096', '四会市');
INSERT INTO `hcc_tb_param_area` VALUES ('7106', '7012', '惠州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7107', '7106', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7108', '7106', '惠城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7109', '7106', '惠阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('7110', '7106', '博罗县');
INSERT INTO `hcc_tb_param_area` VALUES ('7111', '7106', '惠东县');
INSERT INTO `hcc_tb_param_area` VALUES ('7112', '7106', '龙门县');
INSERT INTO `hcc_tb_param_area` VALUES ('7113', '7012', '梅州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7114', '7113', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7115', '7113', '梅江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7116', '7113', '梅　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7117', '7113', '大埔县');
INSERT INTO `hcc_tb_param_area` VALUES ('7118', '7113', '丰顺县');
INSERT INTO `hcc_tb_param_area` VALUES ('7119', '7113', '五华县');
INSERT INTO `hcc_tb_param_area` VALUES ('7120', '7113', '平远县');
INSERT INTO `hcc_tb_param_area` VALUES ('7121', '7113', '蕉岭县');
INSERT INTO `hcc_tb_param_area` VALUES ('7122', '7113', '兴宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('7123', '7012', '汕尾市');
INSERT INTO `hcc_tb_param_area` VALUES ('7124', '7123', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7125', '7123', '城　区');
INSERT INTO `hcc_tb_param_area` VALUES ('7126', '7123', '海丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('7127', '7123', '陆河县');
INSERT INTO `hcc_tb_param_area` VALUES ('7128', '7123', '陆丰市');
INSERT INTO `hcc_tb_param_area` VALUES ('7129', '7012', '河源市');
INSERT INTO `hcc_tb_param_area` VALUES ('7130', '7129', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7131', '7129', '源城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7132', '7129', '紫金县');
INSERT INTO `hcc_tb_param_area` VALUES ('7133', '7129', '龙川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7134', '7129', '连平县');
INSERT INTO `hcc_tb_param_area` VALUES ('7135', '7129', '和平县');
INSERT INTO `hcc_tb_param_area` VALUES ('7136', '7129', '东源县');
INSERT INTO `hcc_tb_param_area` VALUES ('7137', '7012', '阳江市');
INSERT INTO `hcc_tb_param_area` VALUES ('7138', '7137', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7139', '7137', '江城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7140', '7137', '阳西县');
INSERT INTO `hcc_tb_param_area` VALUES ('7141', '7137', '阳东县');
INSERT INTO `hcc_tb_param_area` VALUES ('7142', '7137', '阳春市');
INSERT INTO `hcc_tb_param_area` VALUES ('7143', '7012', '清远市');
INSERT INTO `hcc_tb_param_area` VALUES ('7144', '7143', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7145', '7143', '清城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7146', '7143', '佛冈县');
INSERT INTO `hcc_tb_param_area` VALUES ('7147', '7143', '阳山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7148', '7143', '连山壮族瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7149', '7143', '连南瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7150', '7143', '清新县');
INSERT INTO `hcc_tb_param_area` VALUES ('7151', '7143', '英德市');
INSERT INTO `hcc_tb_param_area` VALUES ('7152', '7143', '连州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7153', '7012', '东莞市');
INSERT INTO `hcc_tb_param_area` VALUES ('7154', '7012', '中山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7155', '7012', '潮州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7156', '7155', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7157', '7155', '湘桥区');
INSERT INTO `hcc_tb_param_area` VALUES ('7158', '7155', '潮安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7159', '7155', '饶平县');
INSERT INTO `hcc_tb_param_area` VALUES ('7160', '7012', '揭阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('7161', '7160', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7162', '7160', '榕城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7163', '7160', '揭东县');
INSERT INTO `hcc_tb_param_area` VALUES ('7164', '7160', '揭西县');
INSERT INTO `hcc_tb_param_area` VALUES ('7165', '7160', '惠来县');
INSERT INTO `hcc_tb_param_area` VALUES ('7166', '7160', '普宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('7167', '7012', '云浮市');
INSERT INTO `hcc_tb_param_area` VALUES ('7168', '7167', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7169', '7167', '云城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7170', '7167', '新兴县');
INSERT INTO `hcc_tb_param_area` VALUES ('7171', '7167', '郁南县');
INSERT INTO `hcc_tb_param_area` VALUES ('7172', '7167', '云安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7173', '7167', '罗定市');
INSERT INTO `hcc_tb_param_area` VALUES ('7174', '0', '广西壮族自治区');
INSERT INTO `hcc_tb_param_area` VALUES ('7175', '7174', '南宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('7176', '7175', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7177', '7175', '兴宁区');
INSERT INTO `hcc_tb_param_area` VALUES ('7178', '7175', '青秀区');
INSERT INTO `hcc_tb_param_area` VALUES ('7179', '7175', '江南区');
INSERT INTO `hcc_tb_param_area` VALUES ('7180', '7175', '西乡塘区');
INSERT INTO `hcc_tb_param_area` VALUES ('7181', '7175', '良庆区');
INSERT INTO `hcc_tb_param_area` VALUES ('7182', '7175', '邕宁区');
INSERT INTO `hcc_tb_param_area` VALUES ('7183', '7175', '武鸣县');
INSERT INTO `hcc_tb_param_area` VALUES ('7184', '7175', '隆安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7185', '7175', '马山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7186', '7175', '上林县');
INSERT INTO `hcc_tb_param_area` VALUES ('7187', '7175', '宾阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7188', '7175', '横　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7189', '7174', '柳州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7190', '7189', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7191', '7189', '城中区');
INSERT INTO `hcc_tb_param_area` VALUES ('7192', '7189', '鱼峰区');
INSERT INTO `hcc_tb_param_area` VALUES ('7193', '7189', '柳南区');
INSERT INTO `hcc_tb_param_area` VALUES ('7194', '7189', '柳北区');
INSERT INTO `hcc_tb_param_area` VALUES ('7195', '7189', '柳江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7196', '7189', '柳城县');
INSERT INTO `hcc_tb_param_area` VALUES ('7197', '7189', '鹿寨县');
INSERT INTO `hcc_tb_param_area` VALUES ('7198', '7189', '融安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7199', '7189', '融水苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7200', '7189', '三江侗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7201', '7174', '桂林市');
INSERT INTO `hcc_tb_param_area` VALUES ('7202', '7201', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7203', '7201', '秀峰区');
INSERT INTO `hcc_tb_param_area` VALUES ('7204', '7201', '叠彩区');
INSERT INTO `hcc_tb_param_area` VALUES ('7205', '7201', '象山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7206', '7201', '七星区');
INSERT INTO `hcc_tb_param_area` VALUES ('7207', '7201', '雁山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7208', '7201', '阳朔县');
INSERT INTO `hcc_tb_param_area` VALUES ('7209', '7201', '临桂县');
INSERT INTO `hcc_tb_param_area` VALUES ('7210', '7201', '灵川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7211', '7201', '全州县');
INSERT INTO `hcc_tb_param_area` VALUES ('7212', '7201', '兴安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7213', '7201', '永福县');
INSERT INTO `hcc_tb_param_area` VALUES ('7214', '7201', '灌阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7215', '7201', '龙胜各族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7216', '7201', '资源县');
INSERT INTO `hcc_tb_param_area` VALUES ('7217', '7201', '平乐县');
INSERT INTO `hcc_tb_param_area` VALUES ('7218', '7201', '荔蒲县');
INSERT INTO `hcc_tb_param_area` VALUES ('7219', '7201', '恭城瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7220', '7174', '梧州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7221', '7220', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7222', '7220', '万秀区');
INSERT INTO `hcc_tb_param_area` VALUES ('7223', '7220', '蝶山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7224', '7220', '长洲区');
INSERT INTO `hcc_tb_param_area` VALUES ('7225', '7220', '苍梧县');
INSERT INTO `hcc_tb_param_area` VALUES ('7226', '7220', '藤　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7227', '7220', '蒙山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7228', '7220', '岑溪市');
INSERT INTO `hcc_tb_param_area` VALUES ('7229', '7174', '北海市');
INSERT INTO `hcc_tb_param_area` VALUES ('7230', '7229', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7231', '7229', '海城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7232', '7229', '银海区');
INSERT INTO `hcc_tb_param_area` VALUES ('7233', '7229', '铁山港区');
INSERT INTO `hcc_tb_param_area` VALUES ('7234', '7229', '合浦县');
INSERT INTO `hcc_tb_param_area` VALUES ('7235', '7174', '防城港市');
INSERT INTO `hcc_tb_param_area` VALUES ('7236', '7235', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7237', '7235', '港口区');
INSERT INTO `hcc_tb_param_area` VALUES ('7238', '7235', '防城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7239', '7235', '上思县');
INSERT INTO `hcc_tb_param_area` VALUES ('7240', '7235', '东兴市');
INSERT INTO `hcc_tb_param_area` VALUES ('7241', '7174', '钦州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7242', '7241', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7243', '7241', '钦南区');
INSERT INTO `hcc_tb_param_area` VALUES ('7244', '7241', '钦北区');
INSERT INTO `hcc_tb_param_area` VALUES ('7245', '7241', '灵山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7246', '7241', '浦北县');
INSERT INTO `hcc_tb_param_area` VALUES ('7247', '7174', '贵港市');
INSERT INTO `hcc_tb_param_area` VALUES ('7248', '7247', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7249', '7247', '港北区');
INSERT INTO `hcc_tb_param_area` VALUES ('7250', '7247', '港南区');
INSERT INTO `hcc_tb_param_area` VALUES ('7251', '7247', '覃塘区');
INSERT INTO `hcc_tb_param_area` VALUES ('7252', '7247', '平南县');
INSERT INTO `hcc_tb_param_area` VALUES ('7253', '7247', '桂平市');
INSERT INTO `hcc_tb_param_area` VALUES ('7254', '7174', '玉林市');
INSERT INTO `hcc_tb_param_area` VALUES ('7255', '7254', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7256', '7254', '玉州区');
INSERT INTO `hcc_tb_param_area` VALUES ('7257', '7254', '容　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7258', '7254', '陆川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7259', '7254', '博白县');
INSERT INTO `hcc_tb_param_area` VALUES ('7260', '7254', '兴业县');
INSERT INTO `hcc_tb_param_area` VALUES ('7261', '7254', '北流市');
INSERT INTO `hcc_tb_param_area` VALUES ('7262', '7174', '百色市');
INSERT INTO `hcc_tb_param_area` VALUES ('7263', '7262', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7264', '7262', '右江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7265', '7262', '田阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7266', '7262', '田东县');
INSERT INTO `hcc_tb_param_area` VALUES ('7267', '7262', '平果县');
INSERT INTO `hcc_tb_param_area` VALUES ('7268', '7262', '德保县');
INSERT INTO `hcc_tb_param_area` VALUES ('7269', '7262', '靖西县');
INSERT INTO `hcc_tb_param_area` VALUES ('7270', '7262', '那坡县');
INSERT INTO `hcc_tb_param_area` VALUES ('7271', '7262', '凌云县');
INSERT INTO `hcc_tb_param_area` VALUES ('7272', '7262', '乐业县');
INSERT INTO `hcc_tb_param_area` VALUES ('7273', '7262', '田林县');
INSERT INTO `hcc_tb_param_area` VALUES ('7274', '7262', '西林县');
INSERT INTO `hcc_tb_param_area` VALUES ('7275', '7262', '隆林各族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7276', '7174', '贺州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7277', '7276', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7278', '7276', '八步区');
INSERT INTO `hcc_tb_param_area` VALUES ('7279', '7276', '昭平县');
INSERT INTO `hcc_tb_param_area` VALUES ('7280', '7276', '钟山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7281', '7276', '富川瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7282', '7174', '河池市');
INSERT INTO `hcc_tb_param_area` VALUES ('7283', '7282', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7284', '7282', '金城江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7285', '7282', '南丹县');
INSERT INTO `hcc_tb_param_area` VALUES ('7286', '7282', '天峨县');
INSERT INTO `hcc_tb_param_area` VALUES ('7287', '7282', '凤山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7288', '7282', '东兰县');
INSERT INTO `hcc_tb_param_area` VALUES ('7289', '7282', '罗城仫佬族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7290', '7282', '环江毛南族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7291', '7282', '巴马瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7292', '7282', '都安瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7293', '7282', '大化瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7294', '7282', '宜州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7295', '7174', '来宾市');
INSERT INTO `hcc_tb_param_area` VALUES ('7296', '7295', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7297', '7295', '兴宾区');
INSERT INTO `hcc_tb_param_area` VALUES ('7298', '7295', '忻城县');
INSERT INTO `hcc_tb_param_area` VALUES ('7299', '7295', '象州县');
INSERT INTO `hcc_tb_param_area` VALUES ('7300', '7295', '武宣县');
INSERT INTO `hcc_tb_param_area` VALUES ('7301', '7295', '金秀瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7302', '7295', '合山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7303', '7174', '崇左市');
INSERT INTO `hcc_tb_param_area` VALUES ('7304', '7303', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7305', '7303', '江洲区');
INSERT INTO `hcc_tb_param_area` VALUES ('7306', '7303', '扶绥县');
INSERT INTO `hcc_tb_param_area` VALUES ('7307', '7303', '宁明县');
INSERT INTO `hcc_tb_param_area` VALUES ('7308', '7303', '龙州县');
INSERT INTO `hcc_tb_param_area` VALUES ('7309', '7303', '大新县');
INSERT INTO `hcc_tb_param_area` VALUES ('7310', '7303', '天等县');
INSERT INTO `hcc_tb_param_area` VALUES ('7311', '7303', '凭祥市');
INSERT INTO `hcc_tb_param_area` VALUES ('7312', '0', '海南省');
INSERT INTO `hcc_tb_param_area` VALUES ('7313', '7312', '海口市');
INSERT INTO `hcc_tb_param_area` VALUES ('7314', '7313', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7315', '7313', '秀英区');
INSERT INTO `hcc_tb_param_area` VALUES ('7316', '7313', '龙华区');
INSERT INTO `hcc_tb_param_area` VALUES ('7317', '7313', '琼山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7318', '7313', '美兰区');
INSERT INTO `hcc_tb_param_area` VALUES ('7319', '7312', '三亚市');
INSERT INTO `hcc_tb_param_area` VALUES ('7320', '7319', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7321', '7312', '省直辖县级行政单位');
INSERT INTO `hcc_tb_param_area` VALUES ('7322', '7321', '五指山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7323', '7321', '琼海市');
INSERT INTO `hcc_tb_param_area` VALUES ('7324', '7321', '儋州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7325', '7321', '文昌市');
INSERT INTO `hcc_tb_param_area` VALUES ('7326', '7321', '万宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('7327', '7321', '东方市');
INSERT INTO `hcc_tb_param_area` VALUES ('7328', '7321', '定安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7329', '7321', '屯昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('7330', '7321', '澄迈县');
INSERT INTO `hcc_tb_param_area` VALUES ('7331', '7321', '临高县');
INSERT INTO `hcc_tb_param_area` VALUES ('7332', '7321', '白沙黎族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7333', '7321', '昌江黎族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7334', '7321', '乐东黎族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7335', '7321', '陵水黎族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7336', '7321', '保亭黎族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7337', '7321', '琼中黎族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7338', '7321', '西沙群岛');
INSERT INTO `hcc_tb_param_area` VALUES ('7339', '7321', '南沙群岛');
INSERT INTO `hcc_tb_param_area` VALUES ('7340', '7321', '中沙群岛的岛礁及其海域');
INSERT INTO `hcc_tb_param_area` VALUES ('7341', '0', '重庆市');
INSERT INTO `hcc_tb_param_area` VALUES ('7342', '7341', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7343', '7342', '万州区');
INSERT INTO `hcc_tb_param_area` VALUES ('7344', '7342', '涪陵区');
INSERT INTO `hcc_tb_param_area` VALUES ('7345', '7342', '渝中区');
INSERT INTO `hcc_tb_param_area` VALUES ('7346', '7342', '大渡口区');
INSERT INTO `hcc_tb_param_area` VALUES ('7347', '7342', '江北区');
INSERT INTO `hcc_tb_param_area` VALUES ('7348', '7342', '沙坪坝区');
INSERT INTO `hcc_tb_param_area` VALUES ('7349', '7342', '九龙坡区');
INSERT INTO `hcc_tb_param_area` VALUES ('7350', '7342', '南岸区');
INSERT INTO `hcc_tb_param_area` VALUES ('7351', '7342', '北碚区');
INSERT INTO `hcc_tb_param_area` VALUES ('7352', '7342', '万盛区');
INSERT INTO `hcc_tb_param_area` VALUES ('7353', '7342', '双桥区');
INSERT INTO `hcc_tb_param_area` VALUES ('7354', '7342', '渝北区');
INSERT INTO `hcc_tb_param_area` VALUES ('7355', '7342', '巴南区');
INSERT INTO `hcc_tb_param_area` VALUES ('7356', '7342', '黔江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7357', '7342', '长寿区');
INSERT INTO `hcc_tb_param_area` VALUES ('7358', '7341', '县');
INSERT INTO `hcc_tb_param_area` VALUES ('7359', '7358', '綦江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7360', '7358', '潼南县');
INSERT INTO `hcc_tb_param_area` VALUES ('7361', '7358', '铜梁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7362', '7358', '大足县');
INSERT INTO `hcc_tb_param_area` VALUES ('7363', '7358', '荣昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('7364', '7358', '璧山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7365', '7358', '梁平县');
INSERT INTO `hcc_tb_param_area` VALUES ('7366', '7358', '城口县');
INSERT INTO `hcc_tb_param_area` VALUES ('7367', '7358', '丰都县');
INSERT INTO `hcc_tb_param_area` VALUES ('7368', '7358', '垫江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7369', '7358', '武隆县');
INSERT INTO `hcc_tb_param_area` VALUES ('7370', '7358', '忠　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7371', '7358', '开　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7372', '7358', '云阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7373', '7358', '奉节县');
INSERT INTO `hcc_tb_param_area` VALUES ('7374', '7358', '巫山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7375', '7358', '巫溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('7376', '7358', '石柱土家族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7377', '7358', '秀山土家族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7378', '7358', '酉阳土家族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7379', '7358', '彭水苗族土家族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7380', '7341', '市');
INSERT INTO `hcc_tb_param_area` VALUES ('7381', '7380', '江津市');
INSERT INTO `hcc_tb_param_area` VALUES ('7382', '7380', '合川市');
INSERT INTO `hcc_tb_param_area` VALUES ('7383', '7380', '永川市');
INSERT INTO `hcc_tb_param_area` VALUES ('7384', '7380', '南川市');
INSERT INTO `hcc_tb_param_area` VALUES ('7385', '0', '四川省');
INSERT INTO `hcc_tb_param_area` VALUES ('7386', '7385', '成都市');
INSERT INTO `hcc_tb_param_area` VALUES ('7387', '7386', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7388', '7386', '锦江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7389', '7386', '青羊区');
INSERT INTO `hcc_tb_param_area` VALUES ('7390', '7386', '金牛区');
INSERT INTO `hcc_tb_param_area` VALUES ('7391', '7386', '武侯区');
INSERT INTO `hcc_tb_param_area` VALUES ('7392', '7386', '成华区');
INSERT INTO `hcc_tb_param_area` VALUES ('7393', '7386', '龙泉驿区');
INSERT INTO `hcc_tb_param_area` VALUES ('7394', '7386', '青白江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7395', '7386', '新都区');
INSERT INTO `hcc_tb_param_area` VALUES ('7396', '7386', '温江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7397', '7386', '金堂县');
INSERT INTO `hcc_tb_param_area` VALUES ('7398', '7386', '双流县');
INSERT INTO `hcc_tb_param_area` VALUES ('7399', '7386', '郫　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7400', '7386', '大邑县');
INSERT INTO `hcc_tb_param_area` VALUES ('7401', '7386', '蒲江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7402', '7386', '新津县');
INSERT INTO `hcc_tb_param_area` VALUES ('7403', '7386', '都江堰市');
INSERT INTO `hcc_tb_param_area` VALUES ('7404', '7386', '彭州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7405', '7386', '邛崃市');
INSERT INTO `hcc_tb_param_area` VALUES ('7406', '7386', '崇州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7407', '7385', '自贡市');
INSERT INTO `hcc_tb_param_area` VALUES ('7408', '7407', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7409', '7407', '自流井区');
INSERT INTO `hcc_tb_param_area` VALUES ('7410', '7407', '贡井区');
INSERT INTO `hcc_tb_param_area` VALUES ('7411', '7407', '大安区');
INSERT INTO `hcc_tb_param_area` VALUES ('7412', '7407', '沿滩区');
INSERT INTO `hcc_tb_param_area` VALUES ('7413', '7407', '荣　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7414', '7407', '富顺县');
INSERT INTO `hcc_tb_param_area` VALUES ('7415', '7385', '攀枝花市');
INSERT INTO `hcc_tb_param_area` VALUES ('7416', '7415', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7417', '7415', '东　区');
INSERT INTO `hcc_tb_param_area` VALUES ('7418', '7415', '西　区');
INSERT INTO `hcc_tb_param_area` VALUES ('7419', '7415', '仁和区');
INSERT INTO `hcc_tb_param_area` VALUES ('7420', '7415', '米易县');
INSERT INTO `hcc_tb_param_area` VALUES ('7421', '7415', '盐边县');
INSERT INTO `hcc_tb_param_area` VALUES ('7422', '7385', '泸州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7423', '7422', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7424', '7422', '江阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('7425', '7422', '纳溪区');
INSERT INTO `hcc_tb_param_area` VALUES ('7426', '7422', '龙马潭区');
INSERT INTO `hcc_tb_param_area` VALUES ('7427', '7422', '泸　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7428', '7422', '合江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7429', '7422', '叙永县');
INSERT INTO `hcc_tb_param_area` VALUES ('7430', '7422', '古蔺县');
INSERT INTO `hcc_tb_param_area` VALUES ('7431', '7385', '德阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('7432', '7431', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7433', '7431', '旌阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('7434', '7431', '中江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7435', '7431', '罗江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7436', '7431', '广汉市');
INSERT INTO `hcc_tb_param_area` VALUES ('7437', '7431', '什邡市');
INSERT INTO `hcc_tb_param_area` VALUES ('7438', '7431', '绵竹市');
INSERT INTO `hcc_tb_param_area` VALUES ('7439', '7385', '绵阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('7440', '7439', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7441', '7439', '涪城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7442', '7439', '游仙区');
INSERT INTO `hcc_tb_param_area` VALUES ('7443', '7439', '三台县');
INSERT INTO `hcc_tb_param_area` VALUES ('7444', '7439', '盐亭县');
INSERT INTO `hcc_tb_param_area` VALUES ('7445', '7439', '安　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7446', '7439', '梓潼县');
INSERT INTO `hcc_tb_param_area` VALUES ('7447', '7439', '北川羌族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7448', '7439', '平武县');
INSERT INTO `hcc_tb_param_area` VALUES ('7449', '7439', '江油市');
INSERT INTO `hcc_tb_param_area` VALUES ('7450', '7385', '广元市');
INSERT INTO `hcc_tb_param_area` VALUES ('7451', '7450', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7452', '7450', '市中区');
INSERT INTO `hcc_tb_param_area` VALUES ('7453', '7450', '元坝区');
INSERT INTO `hcc_tb_param_area` VALUES ('7454', '7450', '朝天区');
INSERT INTO `hcc_tb_param_area` VALUES ('7455', '7450', '旺苍县');
INSERT INTO `hcc_tb_param_area` VALUES ('7456', '7450', '青川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7457', '7450', '剑阁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7458', '7450', '苍溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('7459', '7385', '遂宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('7460', '7459', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7461', '7459', '船山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7462', '7459', '安居区');
INSERT INTO `hcc_tb_param_area` VALUES ('7463', '7459', '蓬溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('7464', '7459', '射洪县');
INSERT INTO `hcc_tb_param_area` VALUES ('7465', '7459', '大英县');
INSERT INTO `hcc_tb_param_area` VALUES ('7466', '7385', '内江市');
INSERT INTO `hcc_tb_param_area` VALUES ('7467', '7466', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7468', '7466', '市中区');
INSERT INTO `hcc_tb_param_area` VALUES ('7469', '7466', '东兴区');
INSERT INTO `hcc_tb_param_area` VALUES ('7470', '7466', '威远县');
INSERT INTO `hcc_tb_param_area` VALUES ('7471', '7466', '资中县');
INSERT INTO `hcc_tb_param_area` VALUES ('7472', '7466', '隆昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('7473', '7385', '乐山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7474', '7473', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7475', '7473', '市中区');
INSERT INTO `hcc_tb_param_area` VALUES ('7476', '7473', '沙湾区');
INSERT INTO `hcc_tb_param_area` VALUES ('7477', '7473', '五通桥区');
INSERT INTO `hcc_tb_param_area` VALUES ('7478', '7473', '金口河区');
INSERT INTO `hcc_tb_param_area` VALUES ('7479', '7473', '犍为县');
INSERT INTO `hcc_tb_param_area` VALUES ('7480', '7473', '井研县');
INSERT INTO `hcc_tb_param_area` VALUES ('7481', '7473', '夹江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7482', '7473', '沐川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7483', '7473', '峨边彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7484', '7473', '马边彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7485', '7473', '峨眉山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7486', '7385', '南充市');
INSERT INTO `hcc_tb_param_area` VALUES ('7487', '7486', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7488', '7486', '顺庆区');
INSERT INTO `hcc_tb_param_area` VALUES ('7489', '7486', '高坪区');
INSERT INTO `hcc_tb_param_area` VALUES ('7490', '7486', '嘉陵区');
INSERT INTO `hcc_tb_param_area` VALUES ('7491', '7486', '南部县');
INSERT INTO `hcc_tb_param_area` VALUES ('7492', '7486', '营山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7493', '7486', '蓬安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7494', '7486', '仪陇县');
INSERT INTO `hcc_tb_param_area` VALUES ('7495', '7486', '西充县');
INSERT INTO `hcc_tb_param_area` VALUES ('7496', '7486', '阆中市');
INSERT INTO `hcc_tb_param_area` VALUES ('7497', '7385', '眉山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7498', '7497', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7499', '7497', '东坡区');
INSERT INTO `hcc_tb_param_area` VALUES ('7500', '7497', '仁寿县');
INSERT INTO `hcc_tb_param_area` VALUES ('7501', '7497', '彭山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7502', '7497', '洪雅县');
INSERT INTO `hcc_tb_param_area` VALUES ('7503', '7497', '丹棱县');
INSERT INTO `hcc_tb_param_area` VALUES ('7504', '7497', '青神县');
INSERT INTO `hcc_tb_param_area` VALUES ('7505', '7385', '宜宾市');
INSERT INTO `hcc_tb_param_area` VALUES ('7506', '7505', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7507', '7505', '翠屏区');
INSERT INTO `hcc_tb_param_area` VALUES ('7508', '7505', '宜宾县');
INSERT INTO `hcc_tb_param_area` VALUES ('7509', '7505', '南溪县');
INSERT INTO `hcc_tb_param_area` VALUES ('7510', '7505', '江安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7511', '7505', '长宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7512', '7505', '高　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7513', '7505', '珙　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7514', '7505', '筠连县');
INSERT INTO `hcc_tb_param_area` VALUES ('7515', '7505', '兴文县');
INSERT INTO `hcc_tb_param_area` VALUES ('7516', '7505', '屏山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7517', '7385', '广安市');
INSERT INTO `hcc_tb_param_area` VALUES ('7518', '7517', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7519', '7517', '广安区');
INSERT INTO `hcc_tb_param_area` VALUES ('7520', '7517', '岳池县');
INSERT INTO `hcc_tb_param_area` VALUES ('7521', '7517', '武胜县');
INSERT INTO `hcc_tb_param_area` VALUES ('7522', '7517', '邻水县');
INSERT INTO `hcc_tb_param_area` VALUES ('7523', '7517', '华莹市');
INSERT INTO `hcc_tb_param_area` VALUES ('7524', '7385', '达州市');
INSERT INTO `hcc_tb_param_area` VALUES ('7525', '7524', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7526', '7524', '通川区');
INSERT INTO `hcc_tb_param_area` VALUES ('7527', '7524', '达　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7528', '7524', '宣汉县');
INSERT INTO `hcc_tb_param_area` VALUES ('7529', '7524', '开江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7530', '7524', '大竹县');
INSERT INTO `hcc_tb_param_area` VALUES ('7531', '7524', '渠　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7532', '7524', '万源市');
INSERT INTO `hcc_tb_param_area` VALUES ('7533', '7385', '雅安市');
INSERT INTO `hcc_tb_param_area` VALUES ('7534', '7533', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7535', '7533', '雨城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7536', '7533', '名山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7537', '7533', '荥经县');
INSERT INTO `hcc_tb_param_area` VALUES ('7538', '7533', '汉源县');
INSERT INTO `hcc_tb_param_area` VALUES ('7539', '7533', '石棉县');
INSERT INTO `hcc_tb_param_area` VALUES ('7540', '7533', '天全县');
INSERT INTO `hcc_tb_param_area` VALUES ('7541', '7533', '芦山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7542', '7533', '宝兴县');
INSERT INTO `hcc_tb_param_area` VALUES ('7543', '7385', '巴中市');
INSERT INTO `hcc_tb_param_area` VALUES ('7544', '7543', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7545', '7543', '巴州区');
INSERT INTO `hcc_tb_param_area` VALUES ('7546', '7543', '通江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7547', '7543', '南江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7548', '7543', '平昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('7549', '7385', '资阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('7550', '7549', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7551', '7549', '雁江区');
INSERT INTO `hcc_tb_param_area` VALUES ('7552', '7549', '安岳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7553', '7549', '乐至县');
INSERT INTO `hcc_tb_param_area` VALUES ('7554', '7549', '简阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('7555', '7385', '阿坝藏族羌族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7556', '7555', '汶川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7557', '7555', '理　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7558', '7555', '茂　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7559', '7555', '松潘县');
INSERT INTO `hcc_tb_param_area` VALUES ('7560', '7555', '九寨沟县');
INSERT INTO `hcc_tb_param_area` VALUES ('7561', '7555', '金川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7562', '7555', '小金县');
INSERT INTO `hcc_tb_param_area` VALUES ('7563', '7555', '黑水县');
INSERT INTO `hcc_tb_param_area` VALUES ('7564', '7555', '马尔康县');
INSERT INTO `hcc_tb_param_area` VALUES ('7565', '7555', '壤塘县');
INSERT INTO `hcc_tb_param_area` VALUES ('7566', '7555', '阿坝县');
INSERT INTO `hcc_tb_param_area` VALUES ('7567', '7555', '若尔盖县');
INSERT INTO `hcc_tb_param_area` VALUES ('7568', '7555', '红原县');
INSERT INTO `hcc_tb_param_area` VALUES ('7569', '7385', '甘孜藏族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7570', '7569', '康定县');
INSERT INTO `hcc_tb_param_area` VALUES ('7571', '7569', '泸定县');
INSERT INTO `hcc_tb_param_area` VALUES ('7572', '7569', '丹巴县');
INSERT INTO `hcc_tb_param_area` VALUES ('7573', '7569', '九龙县');
INSERT INTO `hcc_tb_param_area` VALUES ('7574', '7569', '雅江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7575', '7569', '道孚县');
INSERT INTO `hcc_tb_param_area` VALUES ('7576', '7569', '炉霍县');
INSERT INTO `hcc_tb_param_area` VALUES ('7577', '7569', '甘孜县');
INSERT INTO `hcc_tb_param_area` VALUES ('7578', '7569', '新龙县');
INSERT INTO `hcc_tb_param_area` VALUES ('7579', '7569', '德格县');
INSERT INTO `hcc_tb_param_area` VALUES ('7580', '7569', '白玉县');
INSERT INTO `hcc_tb_param_area` VALUES ('7581', '7569', '石渠县');
INSERT INTO `hcc_tb_param_area` VALUES ('7582', '7569', '色达县');
INSERT INTO `hcc_tb_param_area` VALUES ('7583', '7569', '理塘县');
INSERT INTO `hcc_tb_param_area` VALUES ('7584', '7569', '巴塘县');
INSERT INTO `hcc_tb_param_area` VALUES ('7585', '7569', '乡城县');
INSERT INTO `hcc_tb_param_area` VALUES ('7586', '7569', '稻城县');
INSERT INTO `hcc_tb_param_area` VALUES ('7587', '7569', '得荣县');
INSERT INTO `hcc_tb_param_area` VALUES ('7588', '7385', '凉山彝族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7589', '7588', '西昌市');
INSERT INTO `hcc_tb_param_area` VALUES ('7590', '7588', '木里藏族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7591', '7588', '盐源县');
INSERT INTO `hcc_tb_param_area` VALUES ('7592', '7588', '德昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('7593', '7588', '会理县');
INSERT INTO `hcc_tb_param_area` VALUES ('7594', '7588', '会东县');
INSERT INTO `hcc_tb_param_area` VALUES ('7595', '7588', '宁南县');
INSERT INTO `hcc_tb_param_area` VALUES ('7596', '7588', '普格县');
INSERT INTO `hcc_tb_param_area` VALUES ('7597', '7588', '布拖县');
INSERT INTO `hcc_tb_param_area` VALUES ('7598', '7588', '金阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7599', '7588', '昭觉县');
INSERT INTO `hcc_tb_param_area` VALUES ('7600', '7588', '喜德县');
INSERT INTO `hcc_tb_param_area` VALUES ('7601', '7588', '冕宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7602', '7588', '越西县');
INSERT INTO `hcc_tb_param_area` VALUES ('7603', '7588', '甘洛县');
INSERT INTO `hcc_tb_param_area` VALUES ('7604', '7588', '美姑县');
INSERT INTO `hcc_tb_param_area` VALUES ('7605', '7588', '雷波县');
INSERT INTO `hcc_tb_param_area` VALUES ('7606', '0', '贵州省');
INSERT INTO `hcc_tb_param_area` VALUES ('7607', '7606', '贵阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('7608', '7607', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7609', '7607', '南明区');
INSERT INTO `hcc_tb_param_area` VALUES ('7610', '7607', '云岩区');
INSERT INTO `hcc_tb_param_area` VALUES ('7611', '7607', '花溪区');
INSERT INTO `hcc_tb_param_area` VALUES ('7612', '7607', '乌当区');
INSERT INTO `hcc_tb_param_area` VALUES ('7613', '7607', '白云区');
INSERT INTO `hcc_tb_param_area` VALUES ('7614', '7607', '小河区');
INSERT INTO `hcc_tb_param_area` VALUES ('7615', '7607', '开阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7616', '7607', '息烽县');
INSERT INTO `hcc_tb_param_area` VALUES ('7617', '7607', '修文县');
INSERT INTO `hcc_tb_param_area` VALUES ('7618', '7607', '清镇市');
INSERT INTO `hcc_tb_param_area` VALUES ('7619', '7606', '六盘水市');
INSERT INTO `hcc_tb_param_area` VALUES ('7620', '7619', '钟山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7621', '7619', '六枝特区');
INSERT INTO `hcc_tb_param_area` VALUES ('7622', '7619', '水城县');
INSERT INTO `hcc_tb_param_area` VALUES ('7623', '7619', '盘　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7624', '7606', '遵义市');
INSERT INTO `hcc_tb_param_area` VALUES ('7625', '7624', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7626', '7624', '红花岗区');
INSERT INTO `hcc_tb_param_area` VALUES ('7627', '7624', '汇川区');
INSERT INTO `hcc_tb_param_area` VALUES ('7628', '7624', '遵义县');
INSERT INTO `hcc_tb_param_area` VALUES ('7629', '7624', '桐梓县');
INSERT INTO `hcc_tb_param_area` VALUES ('7630', '7624', '绥阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7631', '7624', '正安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7632', '7624', '道真仡佬族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7633', '7624', '务川仡佬族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7634', '7624', '凤冈县');
INSERT INTO `hcc_tb_param_area` VALUES ('7635', '7624', '湄潭县');
INSERT INTO `hcc_tb_param_area` VALUES ('7636', '7624', '余庆县');
INSERT INTO `hcc_tb_param_area` VALUES ('7637', '7624', '习水县');
INSERT INTO `hcc_tb_param_area` VALUES ('7638', '7624', '赤水市');
INSERT INTO `hcc_tb_param_area` VALUES ('7639', '7624', '仁怀市');
INSERT INTO `hcc_tb_param_area` VALUES ('7640', '7606', '安顺市');
INSERT INTO `hcc_tb_param_area` VALUES ('7641', '7640', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7642', '7640', '西秀区');
INSERT INTO `hcc_tb_param_area` VALUES ('7643', '7640', '平坝县');
INSERT INTO `hcc_tb_param_area` VALUES ('7644', '7640', '普定县');
INSERT INTO `hcc_tb_param_area` VALUES ('7645', '7640', '镇宁布依族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7646', '7640', '关岭布依族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7647', '7640', '紫云苗族布依族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7648', '7606', '铜仁地区');
INSERT INTO `hcc_tb_param_area` VALUES ('7649', '7648', '铜仁市');
INSERT INTO `hcc_tb_param_area` VALUES ('7650', '7648', '江口县');
INSERT INTO `hcc_tb_param_area` VALUES ('7651', '7648', '玉屏侗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7652', '7648', '石阡县');
INSERT INTO `hcc_tb_param_area` VALUES ('7653', '7648', '思南县');
INSERT INTO `hcc_tb_param_area` VALUES ('7654', '7648', '印江土家族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7655', '7648', '德江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7656', '7648', '沿河土家族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7657', '7648', '松桃苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7658', '7648', '万山特区');
INSERT INTO `hcc_tb_param_area` VALUES ('7659', '7606', '黔西南布依族苗族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7660', '7659', '兴义市');
INSERT INTO `hcc_tb_param_area` VALUES ('7661', '7659', '兴仁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7662', '7659', '普安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7663', '7659', '晴隆县');
INSERT INTO `hcc_tb_param_area` VALUES ('7664', '7659', '贞丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('7665', '7659', '望谟县');
INSERT INTO `hcc_tb_param_area` VALUES ('7666', '7659', '册亨县');
INSERT INTO `hcc_tb_param_area` VALUES ('7667', '7659', '安龙县');
INSERT INTO `hcc_tb_param_area` VALUES ('7668', '7606', '毕节地区');
INSERT INTO `hcc_tb_param_area` VALUES ('7669', '7668', '毕节市');
INSERT INTO `hcc_tb_param_area` VALUES ('7670', '7668', '大方县');
INSERT INTO `hcc_tb_param_area` VALUES ('7671', '7668', '黔西县');
INSERT INTO `hcc_tb_param_area` VALUES ('7672', '7668', '金沙县');
INSERT INTO `hcc_tb_param_area` VALUES ('7673', '7668', '织金县');
INSERT INTO `hcc_tb_param_area` VALUES ('7674', '7668', '纳雍县');
INSERT INTO `hcc_tb_param_area` VALUES ('7675', '7668', '威宁彝族回族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7676', '7668', '赫章县');
INSERT INTO `hcc_tb_param_area` VALUES ('7677', '7606', '黔东南苗族侗族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7678', '7677', '凯里市');
INSERT INTO `hcc_tb_param_area` VALUES ('7679', '7677', '黄平县');
INSERT INTO `hcc_tb_param_area` VALUES ('7680', '7677', '施秉县');
INSERT INTO `hcc_tb_param_area` VALUES ('7681', '7677', '三穗县');
INSERT INTO `hcc_tb_param_area` VALUES ('7682', '7677', '镇远县');
INSERT INTO `hcc_tb_param_area` VALUES ('7683', '7677', '岑巩县');
INSERT INTO `hcc_tb_param_area` VALUES ('7684', '7677', '天柱县');
INSERT INTO `hcc_tb_param_area` VALUES ('7685', '7677', '锦屏县');
INSERT INTO `hcc_tb_param_area` VALUES ('7686', '7677', '剑河县');
INSERT INTO `hcc_tb_param_area` VALUES ('7687', '7677', '台江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7688', '7677', '黎平县');
INSERT INTO `hcc_tb_param_area` VALUES ('7689', '7677', '榕江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7690', '7677', '从江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7691', '7677', '雷山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7692', '7677', '麻江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7693', '7677', '丹寨县');
INSERT INTO `hcc_tb_param_area` VALUES ('7694', '7606', '黔南布依族苗族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7695', '7694', '都匀市');
INSERT INTO `hcc_tb_param_area` VALUES ('7696', '7694', '福泉市');
INSERT INTO `hcc_tb_param_area` VALUES ('7697', '7694', '荔波县');
INSERT INTO `hcc_tb_param_area` VALUES ('7698', '7694', '贵定县');
INSERT INTO `hcc_tb_param_area` VALUES ('7699', '7694', '瓮安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7700', '7694', '独山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7701', '7694', '平塘县');
INSERT INTO `hcc_tb_param_area` VALUES ('7702', '7694', '罗甸县');
INSERT INTO `hcc_tb_param_area` VALUES ('7703', '7694', '长顺县');
INSERT INTO `hcc_tb_param_area` VALUES ('7704', '7694', '龙里县');
INSERT INTO `hcc_tb_param_area` VALUES ('7705', '7694', '惠水县');
INSERT INTO `hcc_tb_param_area` VALUES ('7706', '7694', '三都水族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7707', '0', '云南省');
INSERT INTO `hcc_tb_param_area` VALUES ('7708', '7707', '昆明市');
INSERT INTO `hcc_tb_param_area` VALUES ('7709', '7708', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7710', '7708', '五华区');
INSERT INTO `hcc_tb_param_area` VALUES ('7711', '7708', '盘龙区');
INSERT INTO `hcc_tb_param_area` VALUES ('7712', '7708', '官渡区');
INSERT INTO `hcc_tb_param_area` VALUES ('7713', '7708', '西山区');
INSERT INTO `hcc_tb_param_area` VALUES ('7714', '7708', '东川区');
INSERT INTO `hcc_tb_param_area` VALUES ('7715', '7708', '呈贡县');
INSERT INTO `hcc_tb_param_area` VALUES ('7716', '7708', '晋宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7717', '7708', '富民县');
INSERT INTO `hcc_tb_param_area` VALUES ('7718', '7708', '宜良县');
INSERT INTO `hcc_tb_param_area` VALUES ('7719', '7708', '石林彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7720', '7708', '嵩明县');
INSERT INTO `hcc_tb_param_area` VALUES ('7721', '7708', '禄劝彝族苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7722', '7708', '寻甸回族彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7723', '7708', '安宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('7724', '7707', '曲靖市');
INSERT INTO `hcc_tb_param_area` VALUES ('7725', '7724', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7726', '7724', '麒麟区');
INSERT INTO `hcc_tb_param_area` VALUES ('7727', '7724', '马龙县');
INSERT INTO `hcc_tb_param_area` VALUES ('7728', '7724', '陆良县');
INSERT INTO `hcc_tb_param_area` VALUES ('7729', '7724', '师宗县');
INSERT INTO `hcc_tb_param_area` VALUES ('7730', '7724', '罗平县');
INSERT INTO `hcc_tb_param_area` VALUES ('7731', '7724', '富源县');
INSERT INTO `hcc_tb_param_area` VALUES ('7732', '7724', '会泽县');
INSERT INTO `hcc_tb_param_area` VALUES ('7733', '7724', '沾益县');
INSERT INTO `hcc_tb_param_area` VALUES ('7734', '7724', '宣威市');
INSERT INTO `hcc_tb_param_area` VALUES ('7735', '7707', '玉溪市');
INSERT INTO `hcc_tb_param_area` VALUES ('7736', '7735', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7737', '7735', '红塔区');
INSERT INTO `hcc_tb_param_area` VALUES ('7738', '7735', '江川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7739', '7735', '澄江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7740', '7735', '通海县');
INSERT INTO `hcc_tb_param_area` VALUES ('7741', '7735', '华宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7742', '7735', '易门县');
INSERT INTO `hcc_tb_param_area` VALUES ('7743', '7735', '峨山彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7744', '7735', '新平彝族傣族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7745', '7735', '元江哈尼族彝族傣族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7746', '7707', '保山市');
INSERT INTO `hcc_tb_param_area` VALUES ('7747', '7746', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7748', '7746', '隆阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('7749', '7746', '施甸县');
INSERT INTO `hcc_tb_param_area` VALUES ('7750', '7746', '腾冲县');
INSERT INTO `hcc_tb_param_area` VALUES ('7751', '7746', '龙陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('7752', '7746', '昌宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7753', '7707', '昭通市');
INSERT INTO `hcc_tb_param_area` VALUES ('7754', '7753', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7755', '7753', '昭阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('7756', '7753', '鲁甸县');
INSERT INTO `hcc_tb_param_area` VALUES ('7757', '7753', '巧家县');
INSERT INTO `hcc_tb_param_area` VALUES ('7758', '7753', '盐津县');
INSERT INTO `hcc_tb_param_area` VALUES ('7759', '7753', '大关县');
INSERT INTO `hcc_tb_param_area` VALUES ('7760', '7753', '永善县');
INSERT INTO `hcc_tb_param_area` VALUES ('7761', '7753', '绥江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7762', '7753', '镇雄县');
INSERT INTO `hcc_tb_param_area` VALUES ('7763', '7753', '彝良县');
INSERT INTO `hcc_tb_param_area` VALUES ('7764', '7753', '威信县');
INSERT INTO `hcc_tb_param_area` VALUES ('7765', '7753', '水富县');
INSERT INTO `hcc_tb_param_area` VALUES ('7766', '7707', '丽江市');
INSERT INTO `hcc_tb_param_area` VALUES ('7767', '7766', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7768', '7766', '古城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7769', '7766', '玉龙纳西族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7770', '7766', '永胜县');
INSERT INTO `hcc_tb_param_area` VALUES ('7771', '7766', '华坪县');
INSERT INTO `hcc_tb_param_area` VALUES ('7772', '7766', '宁蒗彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7773', '7707', '思茅市');
INSERT INTO `hcc_tb_param_area` VALUES ('7774', '7773', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7775', '7773', '翠云区');
INSERT INTO `hcc_tb_param_area` VALUES ('7776', '7773', '普洱哈尼族彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7777', '7773', '墨江哈尼族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7778', '7773', '景东彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7779', '7773', '景谷傣族彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7780', '7773', '镇沅彝族哈尼族拉祜族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7781', '7773', '江城哈尼族彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7782', '7773', '孟连傣族拉祜族佤族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7783', '7773', '澜沧拉祜族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7784', '7773', '西盟佤族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7785', '7707', '临沧市');
INSERT INTO `hcc_tb_param_area` VALUES ('7786', '7785', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7787', '7785', '临翔区');
INSERT INTO `hcc_tb_param_area` VALUES ('7788', '7785', '凤庆县');
INSERT INTO `hcc_tb_param_area` VALUES ('7789', '7785', '云　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7790', '7785', '永德县');
INSERT INTO `hcc_tb_param_area` VALUES ('7791', '7785', '镇康县');
INSERT INTO `hcc_tb_param_area` VALUES ('7792', '7785', '双江拉祜族佤族布朗族傣族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7793', '7785', '耿马傣族佤族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7794', '7785', '沧源佤族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7795', '7707', '楚雄彝族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7796', '7795', '楚雄市');
INSERT INTO `hcc_tb_param_area` VALUES ('7797', '7795', '双柏县');
INSERT INTO `hcc_tb_param_area` VALUES ('7798', '7795', '牟定县');
INSERT INTO `hcc_tb_param_area` VALUES ('7799', '7795', '南华县');
INSERT INTO `hcc_tb_param_area` VALUES ('7800', '7795', '姚安县');
INSERT INTO `hcc_tb_param_area` VALUES ('7801', '7795', '大姚县');
INSERT INTO `hcc_tb_param_area` VALUES ('7802', '7795', '永仁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7803', '7795', '元谋县');
INSERT INTO `hcc_tb_param_area` VALUES ('7804', '7795', '武定县');
INSERT INTO `hcc_tb_param_area` VALUES ('7805', '7795', '禄丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('7806', '7707', '红河哈尼族彝族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7807', '7806', '个旧市');
INSERT INTO `hcc_tb_param_area` VALUES ('7808', '7806', '开远市');
INSERT INTO `hcc_tb_param_area` VALUES ('7809', '7806', '蒙自县');
INSERT INTO `hcc_tb_param_area` VALUES ('7810', '7806', '屏边苗族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7811', '7806', '建水县');
INSERT INTO `hcc_tb_param_area` VALUES ('7812', '7806', '石屏县');
INSERT INTO `hcc_tb_param_area` VALUES ('7813', '7806', '弥勒县');
INSERT INTO `hcc_tb_param_area` VALUES ('7814', '7806', '泸西县');
INSERT INTO `hcc_tb_param_area` VALUES ('7815', '7806', '元阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7816', '7806', '红河县');
INSERT INTO `hcc_tb_param_area` VALUES ('7817', '7806', '金平苗族瑶族傣族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7818', '7806', '绿春县');
INSERT INTO `hcc_tb_param_area` VALUES ('7819', '7806', '河口瑶族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7820', '7707', '文山壮族苗族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7821', '7820', '文山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7822', '7820', '砚山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7823', '7820', '西畴县');
INSERT INTO `hcc_tb_param_area` VALUES ('7824', '7820', '麻栗坡县');
INSERT INTO `hcc_tb_param_area` VALUES ('7825', '7820', '马关县');
INSERT INTO `hcc_tb_param_area` VALUES ('7826', '7820', '丘北县');
INSERT INTO `hcc_tb_param_area` VALUES ('7827', '7820', '广南县');
INSERT INTO `hcc_tb_param_area` VALUES ('7828', '7820', '富宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7829', '7707', '西双版纳傣族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7830', '7829', '景洪市');
INSERT INTO `hcc_tb_param_area` VALUES ('7831', '7829', '勐海县');
INSERT INTO `hcc_tb_param_area` VALUES ('7832', '7829', '勐腊县');
INSERT INTO `hcc_tb_param_area` VALUES ('7833', '7707', '大理白族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7834', '7833', '大理市');
INSERT INTO `hcc_tb_param_area` VALUES ('7835', '7833', '漾濞彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7836', '7833', '祥云县');
INSERT INTO `hcc_tb_param_area` VALUES ('7837', '7833', '宾川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7838', '7833', '弥渡县');
INSERT INTO `hcc_tb_param_area` VALUES ('7839', '7833', '南涧彝族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7840', '7833', '巍山彝族回族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7841', '7833', '永平县');
INSERT INTO `hcc_tb_param_area` VALUES ('7842', '7833', '云龙县');
INSERT INTO `hcc_tb_param_area` VALUES ('7843', '7833', '洱源县');
INSERT INTO `hcc_tb_param_area` VALUES ('7844', '7833', '剑川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7845', '7833', '鹤庆县');
INSERT INTO `hcc_tb_param_area` VALUES ('7846', '7707', '德宏傣族景颇族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7847', '7846', '瑞丽市');
INSERT INTO `hcc_tb_param_area` VALUES ('7848', '7846', '潞西市');
INSERT INTO `hcc_tb_param_area` VALUES ('7849', '7846', '梁河县');
INSERT INTO `hcc_tb_param_area` VALUES ('7850', '7846', '盈江县');
INSERT INTO `hcc_tb_param_area` VALUES ('7851', '7846', '陇川县');
INSERT INTO `hcc_tb_param_area` VALUES ('7852', '7707', '怒江傈僳族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7853', '7852', '泸水县');
INSERT INTO `hcc_tb_param_area` VALUES ('7854', '7852', '福贡县');
INSERT INTO `hcc_tb_param_area` VALUES ('7855', '7852', '贡山独龙族怒族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7856', '7852', '兰坪白族普米族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7857', '7707', '迪庆藏族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('7858', '7857', '香格里拉县');
INSERT INTO `hcc_tb_param_area` VALUES ('7859', '7857', '德钦县');
INSERT INTO `hcc_tb_param_area` VALUES ('7860', '7857', '维西傈僳族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('7861', '0', '西藏自治区');
INSERT INTO `hcc_tb_param_area` VALUES ('7862', '7861', '拉萨市');
INSERT INTO `hcc_tb_param_area` VALUES ('7863', '7862', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7864', '7862', '城关区');
INSERT INTO `hcc_tb_param_area` VALUES ('7865', '7862', '林周县');
INSERT INTO `hcc_tb_param_area` VALUES ('7866', '7862', '当雄县');
INSERT INTO `hcc_tb_param_area` VALUES ('7867', '7862', '尼木县');
INSERT INTO `hcc_tb_param_area` VALUES ('7868', '7862', '曲水县');
INSERT INTO `hcc_tb_param_area` VALUES ('7869', '7862', '堆龙德庆县');
INSERT INTO `hcc_tb_param_area` VALUES ('7870', '7862', '达孜县');
INSERT INTO `hcc_tb_param_area` VALUES ('7871', '7862', '墨竹工卡县');
INSERT INTO `hcc_tb_param_area` VALUES ('7872', '7861', '昌都地区');
INSERT INTO `hcc_tb_param_area` VALUES ('7873', '7872', '昌都县');
INSERT INTO `hcc_tb_param_area` VALUES ('7874', '7872', '江达县');
INSERT INTO `hcc_tb_param_area` VALUES ('7875', '7872', '贡觉县');
INSERT INTO `hcc_tb_param_area` VALUES ('7876', '7872', '类乌齐县');
INSERT INTO `hcc_tb_param_area` VALUES ('7877', '7872', '丁青县');
INSERT INTO `hcc_tb_param_area` VALUES ('7878', '7872', '察雅县');
INSERT INTO `hcc_tb_param_area` VALUES ('7879', '7872', '八宿县');
INSERT INTO `hcc_tb_param_area` VALUES ('7880', '7872', '左贡县');
INSERT INTO `hcc_tb_param_area` VALUES ('7881', '7872', '芒康县');
INSERT INTO `hcc_tb_param_area` VALUES ('7882', '7872', '洛隆县');
INSERT INTO `hcc_tb_param_area` VALUES ('7883', '7872', '边坝县');
INSERT INTO `hcc_tb_param_area` VALUES ('7884', '7861', '山南地区');
INSERT INTO `hcc_tb_param_area` VALUES ('7885', '7884', '乃东县');
INSERT INTO `hcc_tb_param_area` VALUES ('7886', '7884', '扎囊县');
INSERT INTO `hcc_tb_param_area` VALUES ('7887', '7884', '贡嘎县');
INSERT INTO `hcc_tb_param_area` VALUES ('7888', '7884', '桑日县');
INSERT INTO `hcc_tb_param_area` VALUES ('7889', '7884', '琼结县');
INSERT INTO `hcc_tb_param_area` VALUES ('7890', '7884', '曲松县');
INSERT INTO `hcc_tb_param_area` VALUES ('7891', '7884', '措美县');
INSERT INTO `hcc_tb_param_area` VALUES ('7892', '7884', '洛扎县');
INSERT INTO `hcc_tb_param_area` VALUES ('7893', '7884', '加查县');
INSERT INTO `hcc_tb_param_area` VALUES ('7894', '7884', '隆子县');
INSERT INTO `hcc_tb_param_area` VALUES ('7895', '7884', '错那县');
INSERT INTO `hcc_tb_param_area` VALUES ('7896', '7884', '浪卡子县');
INSERT INTO `hcc_tb_param_area` VALUES ('7897', '7861', '日喀则地区');
INSERT INTO `hcc_tb_param_area` VALUES ('7898', '7897', '日喀则市');
INSERT INTO `hcc_tb_param_area` VALUES ('7899', '7897', '南木林县');
INSERT INTO `hcc_tb_param_area` VALUES ('7900', '7897', '江孜县');
INSERT INTO `hcc_tb_param_area` VALUES ('7901', '7897', '定日县');
INSERT INTO `hcc_tb_param_area` VALUES ('7902', '7897', '萨迦县');
INSERT INTO `hcc_tb_param_area` VALUES ('7903', '7897', '拉孜县');
INSERT INTO `hcc_tb_param_area` VALUES ('7904', '7897', '昂仁县');
INSERT INTO `hcc_tb_param_area` VALUES ('7905', '7897', '谢通门县');
INSERT INTO `hcc_tb_param_area` VALUES ('7906', '7897', '白朗县');
INSERT INTO `hcc_tb_param_area` VALUES ('7907', '7897', '仁布县');
INSERT INTO `hcc_tb_param_area` VALUES ('7908', '7897', '康马县');
INSERT INTO `hcc_tb_param_area` VALUES ('7909', '7897', '定结县');
INSERT INTO `hcc_tb_param_area` VALUES ('7910', '7897', '仲巴县');
INSERT INTO `hcc_tb_param_area` VALUES ('7911', '7897', '亚东县');
INSERT INTO `hcc_tb_param_area` VALUES ('7912', '7897', '吉隆县');
INSERT INTO `hcc_tb_param_area` VALUES ('7913', '7897', '聂拉木县');
INSERT INTO `hcc_tb_param_area` VALUES ('7914', '7897', '萨嘎县');
INSERT INTO `hcc_tb_param_area` VALUES ('7915', '7897', '岗巴县');
INSERT INTO `hcc_tb_param_area` VALUES ('7916', '7861', '那曲地区');
INSERT INTO `hcc_tb_param_area` VALUES ('7917', '7916', '那曲县');
INSERT INTO `hcc_tb_param_area` VALUES ('7918', '7916', '嘉黎县');
INSERT INTO `hcc_tb_param_area` VALUES ('7919', '7916', '比如县');
INSERT INTO `hcc_tb_param_area` VALUES ('7920', '7916', '聂荣县');
INSERT INTO `hcc_tb_param_area` VALUES ('7921', '7916', '安多县');
INSERT INTO `hcc_tb_param_area` VALUES ('7922', '7916', '申扎县');
INSERT INTO `hcc_tb_param_area` VALUES ('7923', '7916', '索　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7924', '7916', '班戈县');
INSERT INTO `hcc_tb_param_area` VALUES ('7925', '7916', '巴青县');
INSERT INTO `hcc_tb_param_area` VALUES ('7926', '7916', '尼玛县');
INSERT INTO `hcc_tb_param_area` VALUES ('7927', '7861', '阿里地区');
INSERT INTO `hcc_tb_param_area` VALUES ('7928', '7927', '普兰县');
INSERT INTO `hcc_tb_param_area` VALUES ('7929', '7927', '札达县');
INSERT INTO `hcc_tb_param_area` VALUES ('7930', '7927', '噶尔县');
INSERT INTO `hcc_tb_param_area` VALUES ('7931', '7927', '日土县');
INSERT INTO `hcc_tb_param_area` VALUES ('7932', '7927', '革吉县');
INSERT INTO `hcc_tb_param_area` VALUES ('7933', '7927', '改则县');
INSERT INTO `hcc_tb_param_area` VALUES ('7934', '7927', '措勤县');
INSERT INTO `hcc_tb_param_area` VALUES ('7935', '7861', '林芝地区');
INSERT INTO `hcc_tb_param_area` VALUES ('7936', '7935', '林芝县');
INSERT INTO `hcc_tb_param_area` VALUES ('7937', '7935', '工布江达县');
INSERT INTO `hcc_tb_param_area` VALUES ('7938', '7935', '米林县');
INSERT INTO `hcc_tb_param_area` VALUES ('7939', '7935', '墨脱县');
INSERT INTO `hcc_tb_param_area` VALUES ('7940', '7935', '波密县');
INSERT INTO `hcc_tb_param_area` VALUES ('7941', '7935', '察隅县');
INSERT INTO `hcc_tb_param_area` VALUES ('7942', '7935', '朗　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7943', '0', '陕西省');
INSERT INTO `hcc_tb_param_area` VALUES ('7944', '7943', '西安市');
INSERT INTO `hcc_tb_param_area` VALUES ('7945', '7944', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7946', '7944', '新城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7947', '7944', '碑林区');
INSERT INTO `hcc_tb_param_area` VALUES ('7948', '7944', '莲湖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7949', '7944', '灞桥区');
INSERT INTO `hcc_tb_param_area` VALUES ('7950', '7944', '未央区');
INSERT INTO `hcc_tb_param_area` VALUES ('7951', '7944', '雁塔区');
INSERT INTO `hcc_tb_param_area` VALUES ('7952', '7944', '阎良区');
INSERT INTO `hcc_tb_param_area` VALUES ('7953', '7944', '临潼区');
INSERT INTO `hcc_tb_param_area` VALUES ('7954', '7944', '长安区');
INSERT INTO `hcc_tb_param_area` VALUES ('7955', '7944', '蓝田县');
INSERT INTO `hcc_tb_param_area` VALUES ('7956', '7944', '周至县');
INSERT INTO `hcc_tb_param_area` VALUES ('7957', '7944', '户　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7958', '7944', '高陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('7959', '7943', '铜川市');
INSERT INTO `hcc_tb_param_area` VALUES ('7960', '7959', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7961', '7959', '王益区');
INSERT INTO `hcc_tb_param_area` VALUES ('7962', '7959', '印台区');
INSERT INTO `hcc_tb_param_area` VALUES ('7963', '7959', '耀州区');
INSERT INTO `hcc_tb_param_area` VALUES ('7964', '7959', '宜君县');
INSERT INTO `hcc_tb_param_area` VALUES ('7965', '7943', '宝鸡市');
INSERT INTO `hcc_tb_param_area` VALUES ('7966', '7965', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7967', '7965', '渭滨区');
INSERT INTO `hcc_tb_param_area` VALUES ('7968', '7965', '金台区');
INSERT INTO `hcc_tb_param_area` VALUES ('7969', '7965', '陈仓区');
INSERT INTO `hcc_tb_param_area` VALUES ('7970', '7965', '凤翔县');
INSERT INTO `hcc_tb_param_area` VALUES ('7971', '7965', '岐山县');
INSERT INTO `hcc_tb_param_area` VALUES ('7972', '7965', '扶风县');
INSERT INTO `hcc_tb_param_area` VALUES ('7973', '7965', '眉　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7974', '7965', '陇　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7975', '7965', '千阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7976', '7965', '麟游县');
INSERT INTO `hcc_tb_param_area` VALUES ('7977', '7965', '凤　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7978', '7965', '太白县');
INSERT INTO `hcc_tb_param_area` VALUES ('7979', '7943', '咸阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('7980', '7979', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7981', '7979', '秦都区');
INSERT INTO `hcc_tb_param_area` VALUES ('7982', '7979', '杨凌区');
INSERT INTO `hcc_tb_param_area` VALUES ('7983', '7979', '渭城区');
INSERT INTO `hcc_tb_param_area` VALUES ('7984', '7979', '三原县');
INSERT INTO `hcc_tb_param_area` VALUES ('7985', '7979', '泾阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('7986', '7979', '乾　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7987', '7979', '礼泉县');
INSERT INTO `hcc_tb_param_area` VALUES ('7988', '7979', '永寿县');
INSERT INTO `hcc_tb_param_area` VALUES ('7989', '7979', '彬　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7990', '7979', '长武县');
INSERT INTO `hcc_tb_param_area` VALUES ('7991', '7979', '旬邑县');
INSERT INTO `hcc_tb_param_area` VALUES ('7992', '7979', '淳化县');
INSERT INTO `hcc_tb_param_area` VALUES ('7993', '7979', '武功县');
INSERT INTO `hcc_tb_param_area` VALUES ('7994', '7979', '兴平市');
INSERT INTO `hcc_tb_param_area` VALUES ('7995', '7943', '渭南市');
INSERT INTO `hcc_tb_param_area` VALUES ('7996', '7995', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('7997', '7995', '临渭区');
INSERT INTO `hcc_tb_param_area` VALUES ('7998', '7995', '华　县');
INSERT INTO `hcc_tb_param_area` VALUES ('7999', '7995', '潼关县');
INSERT INTO `hcc_tb_param_area` VALUES ('8000', '7995', '大荔县');
INSERT INTO `hcc_tb_param_area` VALUES ('8001', '7995', '合阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('8002', '7995', '澄城县');
INSERT INTO `hcc_tb_param_area` VALUES ('8003', '7995', '蒲城县');
INSERT INTO `hcc_tb_param_area` VALUES ('8004', '7995', '白水县');
INSERT INTO `hcc_tb_param_area` VALUES ('8005', '7995', '富平县');
INSERT INTO `hcc_tb_param_area` VALUES ('8006', '7995', '韩城市');
INSERT INTO `hcc_tb_param_area` VALUES ('8007', '7995', '华阴市');
INSERT INTO `hcc_tb_param_area` VALUES ('8008', '7943', '延安市');
INSERT INTO `hcc_tb_param_area` VALUES ('8009', '8008', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8010', '8008', '宝塔区');
INSERT INTO `hcc_tb_param_area` VALUES ('8011', '8008', '延长县');
INSERT INTO `hcc_tb_param_area` VALUES ('8012', '8008', '延川县');
INSERT INTO `hcc_tb_param_area` VALUES ('8013', '8008', '子长县');
INSERT INTO `hcc_tb_param_area` VALUES ('8014', '8008', '安塞县');
INSERT INTO `hcc_tb_param_area` VALUES ('8015', '8008', '志丹县');
INSERT INTO `hcc_tb_param_area` VALUES ('8016', '8008', '吴旗县');
INSERT INTO `hcc_tb_param_area` VALUES ('8017', '8008', '甘泉县');
INSERT INTO `hcc_tb_param_area` VALUES ('8018', '8008', '富　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8019', '8008', '洛川县');
INSERT INTO `hcc_tb_param_area` VALUES ('8020', '8008', '宜川县');
INSERT INTO `hcc_tb_param_area` VALUES ('8021', '8008', '黄龙县');
INSERT INTO `hcc_tb_param_area` VALUES ('8022', '8008', '黄陵县');
INSERT INTO `hcc_tb_param_area` VALUES ('8023', '7943', '汉中市');
INSERT INTO `hcc_tb_param_area` VALUES ('8024', '8023', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8025', '8023', '汉台区');
INSERT INTO `hcc_tb_param_area` VALUES ('8026', '8023', '南郑县');
INSERT INTO `hcc_tb_param_area` VALUES ('8027', '8023', '城固县');
INSERT INTO `hcc_tb_param_area` VALUES ('8028', '8023', '洋　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8029', '8023', '西乡县');
INSERT INTO `hcc_tb_param_area` VALUES ('8030', '8023', '勉　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8031', '8023', '宁强县');
INSERT INTO `hcc_tb_param_area` VALUES ('8032', '8023', '略阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('8033', '8023', '镇巴县');
INSERT INTO `hcc_tb_param_area` VALUES ('8034', '8023', '留坝县');
INSERT INTO `hcc_tb_param_area` VALUES ('8035', '8023', '佛坪县');
INSERT INTO `hcc_tb_param_area` VALUES ('8036', '7943', '榆林市');
INSERT INTO `hcc_tb_param_area` VALUES ('8037', '8036', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8038', '8036', '榆阳区');
INSERT INTO `hcc_tb_param_area` VALUES ('8039', '8036', '神木县');
INSERT INTO `hcc_tb_param_area` VALUES ('8040', '8036', '府谷县');
INSERT INTO `hcc_tb_param_area` VALUES ('8041', '8036', '横山县');
INSERT INTO `hcc_tb_param_area` VALUES ('8042', '8036', '靖边县');
INSERT INTO `hcc_tb_param_area` VALUES ('8043', '8036', '定边县');
INSERT INTO `hcc_tb_param_area` VALUES ('8044', '8036', '绥德县');
INSERT INTO `hcc_tb_param_area` VALUES ('8045', '8036', '米脂县');
INSERT INTO `hcc_tb_param_area` VALUES ('8046', '8036', '佳　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8047', '8036', '吴堡县');
INSERT INTO `hcc_tb_param_area` VALUES ('8048', '8036', '清涧县');
INSERT INTO `hcc_tb_param_area` VALUES ('8049', '8036', '子洲县');
INSERT INTO `hcc_tb_param_area` VALUES ('8050', '7943', '安康市');
INSERT INTO `hcc_tb_param_area` VALUES ('8051', '8050', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8052', '8050', '汉滨区');
INSERT INTO `hcc_tb_param_area` VALUES ('8053', '8050', '汉阴县');
INSERT INTO `hcc_tb_param_area` VALUES ('8054', '8050', '石泉县');
INSERT INTO `hcc_tb_param_area` VALUES ('8055', '8050', '宁陕县');
INSERT INTO `hcc_tb_param_area` VALUES ('8056', '8050', '紫阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('8057', '8050', '岚皋县');
INSERT INTO `hcc_tb_param_area` VALUES ('8058', '8050', '平利县');
INSERT INTO `hcc_tb_param_area` VALUES ('8059', '8050', '镇坪县');
INSERT INTO `hcc_tb_param_area` VALUES ('8060', '8050', '旬阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('8061', '8050', '白河县');
INSERT INTO `hcc_tb_param_area` VALUES ('8062', '7943', '商洛市');
INSERT INTO `hcc_tb_param_area` VALUES ('8063', '8062', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8064', '8062', '商州区');
INSERT INTO `hcc_tb_param_area` VALUES ('8065', '8062', '洛南县');
INSERT INTO `hcc_tb_param_area` VALUES ('8066', '8062', '丹凤县');
INSERT INTO `hcc_tb_param_area` VALUES ('8067', '8062', '商南县');
INSERT INTO `hcc_tb_param_area` VALUES ('8068', '8062', '山阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('8069', '8062', '镇安县');
INSERT INTO `hcc_tb_param_area` VALUES ('8070', '8062', '柞水县');
INSERT INTO `hcc_tb_param_area` VALUES ('8071', '0', '甘肃省');
INSERT INTO `hcc_tb_param_area` VALUES ('8072', '8071', '兰州市');
INSERT INTO `hcc_tb_param_area` VALUES ('8073', '8072', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8074', '8072', '城关区');
INSERT INTO `hcc_tb_param_area` VALUES ('8075', '8072', '七里河区');
INSERT INTO `hcc_tb_param_area` VALUES ('8076', '8072', '西固区');
INSERT INTO `hcc_tb_param_area` VALUES ('8077', '8072', '安宁区');
INSERT INTO `hcc_tb_param_area` VALUES ('8078', '8072', '红古区');
INSERT INTO `hcc_tb_param_area` VALUES ('8079', '8072', '永登县');
INSERT INTO `hcc_tb_param_area` VALUES ('8080', '8072', '皋兰县');
INSERT INTO `hcc_tb_param_area` VALUES ('8081', '8072', '榆中县');
INSERT INTO `hcc_tb_param_area` VALUES ('8082', '8071', '嘉峪关市');
INSERT INTO `hcc_tb_param_area` VALUES ('8083', '8082', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8084', '8071', '金昌市');
INSERT INTO `hcc_tb_param_area` VALUES ('8085', '8084', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8086', '8084', '金川区');
INSERT INTO `hcc_tb_param_area` VALUES ('8087', '8084', '永昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('8088', '8071', '白银市');
INSERT INTO `hcc_tb_param_area` VALUES ('8089', '8088', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8090', '8088', '白银区');
INSERT INTO `hcc_tb_param_area` VALUES ('8091', '8088', '平川区');
INSERT INTO `hcc_tb_param_area` VALUES ('8092', '8088', '靖远县');
INSERT INTO `hcc_tb_param_area` VALUES ('8093', '8088', '会宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8094', '8088', '景泰县');
INSERT INTO `hcc_tb_param_area` VALUES ('8095', '8071', '天水市');
INSERT INTO `hcc_tb_param_area` VALUES ('8096', '8095', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8097', '8095', '秦城区');
INSERT INTO `hcc_tb_param_area` VALUES ('8098', '8095', '北道区');
INSERT INTO `hcc_tb_param_area` VALUES ('8099', '8095', '清水县');
INSERT INTO `hcc_tb_param_area` VALUES ('8100', '8095', '秦安县');
INSERT INTO `hcc_tb_param_area` VALUES ('8101', '8095', '甘谷县');
INSERT INTO `hcc_tb_param_area` VALUES ('8102', '8095', '武山县');
INSERT INTO `hcc_tb_param_area` VALUES ('8103', '8095', '张家川回族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8104', '8071', '武威市');
INSERT INTO `hcc_tb_param_area` VALUES ('8105', '8104', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8106', '8104', '凉州区');
INSERT INTO `hcc_tb_param_area` VALUES ('8107', '8104', '民勤县');
INSERT INTO `hcc_tb_param_area` VALUES ('8108', '8104', '古浪县');
INSERT INTO `hcc_tb_param_area` VALUES ('8109', '8104', '天祝藏族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8110', '8071', '张掖市');
INSERT INTO `hcc_tb_param_area` VALUES ('8111', '8110', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8112', '8110', '甘州区');
INSERT INTO `hcc_tb_param_area` VALUES ('8113', '8110', '肃南裕固族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8114', '8110', '民乐县');
INSERT INTO `hcc_tb_param_area` VALUES ('8115', '8110', '临泽县');
INSERT INTO `hcc_tb_param_area` VALUES ('8116', '8110', '高台县');
INSERT INTO `hcc_tb_param_area` VALUES ('8117', '8110', '山丹县');
INSERT INTO `hcc_tb_param_area` VALUES ('8118', '8071', '平凉市');
INSERT INTO `hcc_tb_param_area` VALUES ('8119', '8118', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8120', '8118', '崆峒区');
INSERT INTO `hcc_tb_param_area` VALUES ('8121', '8118', '泾川县');
INSERT INTO `hcc_tb_param_area` VALUES ('8122', '8118', '灵台县');
INSERT INTO `hcc_tb_param_area` VALUES ('8123', '8118', '崇信县');
INSERT INTO `hcc_tb_param_area` VALUES ('8124', '8118', '华亭县');
INSERT INTO `hcc_tb_param_area` VALUES ('8125', '8118', '庄浪县');
INSERT INTO `hcc_tb_param_area` VALUES ('8126', '8118', '静宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8127', '8071', '酒泉市');
INSERT INTO `hcc_tb_param_area` VALUES ('8128', '8127', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8129', '8127', '肃州区');
INSERT INTO `hcc_tb_param_area` VALUES ('8130', '8127', '金塔县');
INSERT INTO `hcc_tb_param_area` VALUES ('8131', '8127', '安西县');
INSERT INTO `hcc_tb_param_area` VALUES ('8132', '8127', '肃北蒙古族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8133', '8127', '阿克塞哈萨克族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8134', '8127', '玉门市');
INSERT INTO `hcc_tb_param_area` VALUES ('8135', '8127', '敦煌市');
INSERT INTO `hcc_tb_param_area` VALUES ('8136', '8071', '庆阳市');
INSERT INTO `hcc_tb_param_area` VALUES ('8137', '8136', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8138', '8136', '西峰区');
INSERT INTO `hcc_tb_param_area` VALUES ('8139', '8136', '庆城县');
INSERT INTO `hcc_tb_param_area` VALUES ('8140', '8136', '环　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8141', '8136', '华池县');
INSERT INTO `hcc_tb_param_area` VALUES ('8142', '8136', '合水县');
INSERT INTO `hcc_tb_param_area` VALUES ('8143', '8136', '正宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8144', '8136', '宁　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8145', '8136', '镇原县');
INSERT INTO `hcc_tb_param_area` VALUES ('8146', '8071', '定西市');
INSERT INTO `hcc_tb_param_area` VALUES ('8147', '8146', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8148', '8146', '安定区');
INSERT INTO `hcc_tb_param_area` VALUES ('8149', '8146', '通渭县');
INSERT INTO `hcc_tb_param_area` VALUES ('8150', '8146', '陇西县');
INSERT INTO `hcc_tb_param_area` VALUES ('8151', '8146', '渭源县');
INSERT INTO `hcc_tb_param_area` VALUES ('8152', '8146', '临洮县');
INSERT INTO `hcc_tb_param_area` VALUES ('8153', '8146', '漳　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8154', '8146', '岷　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8155', '8071', '陇南市');
INSERT INTO `hcc_tb_param_area` VALUES ('8156', '8155', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8157', '8155', '武都区');
INSERT INTO `hcc_tb_param_area` VALUES ('8158', '8155', '成　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8159', '8155', '文　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8160', '8155', '宕昌县');
INSERT INTO `hcc_tb_param_area` VALUES ('8161', '8155', '康　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8162', '8155', '西和县');
INSERT INTO `hcc_tb_param_area` VALUES ('8163', '8155', '礼　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8164', '8155', '徽　县');
INSERT INTO `hcc_tb_param_area` VALUES ('8165', '8155', '两当县');
INSERT INTO `hcc_tb_param_area` VALUES ('8166', '8071', '临夏回族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8167', '8166', '临夏市');
INSERT INTO `hcc_tb_param_area` VALUES ('8168', '8166', '临夏县');
INSERT INTO `hcc_tb_param_area` VALUES ('8169', '8166', '康乐县');
INSERT INTO `hcc_tb_param_area` VALUES ('8170', '8166', '永靖县');
INSERT INTO `hcc_tb_param_area` VALUES ('8171', '8166', '广河县');
INSERT INTO `hcc_tb_param_area` VALUES ('8172', '8166', '和政县');
INSERT INTO `hcc_tb_param_area` VALUES ('8173', '8166', '东乡族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8174', '8166', '积石山保安族东乡族撒拉族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8175', '8071', '甘南藏族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8176', '8175', '合作市');
INSERT INTO `hcc_tb_param_area` VALUES ('8177', '8175', '临潭县');
INSERT INTO `hcc_tb_param_area` VALUES ('8178', '8175', '卓尼县');
INSERT INTO `hcc_tb_param_area` VALUES ('8179', '8175', '舟曲县');
INSERT INTO `hcc_tb_param_area` VALUES ('8180', '8175', '迭部县');
INSERT INTO `hcc_tb_param_area` VALUES ('8181', '8175', '玛曲县');
INSERT INTO `hcc_tb_param_area` VALUES ('8182', '8175', '碌曲县');
INSERT INTO `hcc_tb_param_area` VALUES ('8183', '8175', '夏河县');
INSERT INTO `hcc_tb_param_area` VALUES ('8184', '0', '青海省');
INSERT INTO `hcc_tb_param_area` VALUES ('8185', '8184', '西宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('8186', '8185', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8187', '8185', '城东区');
INSERT INTO `hcc_tb_param_area` VALUES ('8188', '8185', '城中区');
INSERT INTO `hcc_tb_param_area` VALUES ('8189', '8185', '城西区');
INSERT INTO `hcc_tb_param_area` VALUES ('8190', '8185', '城北区');
INSERT INTO `hcc_tb_param_area` VALUES ('8191', '8185', '大通回族土族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8192', '8185', '湟中县');
INSERT INTO `hcc_tb_param_area` VALUES ('8193', '8185', '湟源县');
INSERT INTO `hcc_tb_param_area` VALUES ('8194', '8184', '海东地区');
INSERT INTO `hcc_tb_param_area` VALUES ('8195', '8194', '平安县');
INSERT INTO `hcc_tb_param_area` VALUES ('8196', '8194', '民和回族土族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8197', '8194', '乐都县');
INSERT INTO `hcc_tb_param_area` VALUES ('8198', '8194', '互助土族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8199', '8194', '化隆回族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8200', '8194', '循化撒拉族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8201', '8184', '海北藏族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8202', '8201', '门源回族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8203', '8201', '祁连县');
INSERT INTO `hcc_tb_param_area` VALUES ('8204', '8201', '海晏县');
INSERT INTO `hcc_tb_param_area` VALUES ('8205', '8201', '刚察县');
INSERT INTO `hcc_tb_param_area` VALUES ('8206', '8184', '黄南藏族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8207', '8206', '同仁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8208', '8206', '尖扎县');
INSERT INTO `hcc_tb_param_area` VALUES ('8209', '8206', '泽库县');
INSERT INTO `hcc_tb_param_area` VALUES ('8210', '8206', '河南蒙古族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8211', '8184', '海南藏族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8212', '8211', '共和县');
INSERT INTO `hcc_tb_param_area` VALUES ('8213', '8211', '同德县');
INSERT INTO `hcc_tb_param_area` VALUES ('8214', '8211', '贵德县');
INSERT INTO `hcc_tb_param_area` VALUES ('8215', '8211', '兴海县');
INSERT INTO `hcc_tb_param_area` VALUES ('8216', '8211', '贵南县');
INSERT INTO `hcc_tb_param_area` VALUES ('8217', '8184', '果洛藏族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8218', '8217', '玛沁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8219', '8217', '班玛县');
INSERT INTO `hcc_tb_param_area` VALUES ('8220', '8217', '甘德县');
INSERT INTO `hcc_tb_param_area` VALUES ('8221', '8217', '达日县');
INSERT INTO `hcc_tb_param_area` VALUES ('8222', '8217', '久治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8223', '8217', '玛多县');
INSERT INTO `hcc_tb_param_area` VALUES ('8224', '8184', '玉树藏族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8225', '8224', '玉树县');
INSERT INTO `hcc_tb_param_area` VALUES ('8226', '8224', '杂多县');
INSERT INTO `hcc_tb_param_area` VALUES ('8227', '8224', '称多县');
INSERT INTO `hcc_tb_param_area` VALUES ('8228', '8224', '治多县');
INSERT INTO `hcc_tb_param_area` VALUES ('8229', '8224', '囊谦县');
INSERT INTO `hcc_tb_param_area` VALUES ('8230', '8224', '曲麻莱县');
INSERT INTO `hcc_tb_param_area` VALUES ('8231', '8184', '海西蒙古族藏族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8232', '8231', '格尔木市');
INSERT INTO `hcc_tb_param_area` VALUES ('8233', '8231', '德令哈市');
INSERT INTO `hcc_tb_param_area` VALUES ('8234', '8231', '乌兰县');
INSERT INTO `hcc_tb_param_area` VALUES ('8235', '8231', '都兰县');
INSERT INTO `hcc_tb_param_area` VALUES ('8236', '8231', '天峻县');
INSERT INTO `hcc_tb_param_area` VALUES ('8237', '0', '宁夏回族自治区');
INSERT INTO `hcc_tb_param_area` VALUES ('8238', '8237', '银川市');
INSERT INTO `hcc_tb_param_area` VALUES ('8239', '8238', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8240', '8238', '兴庆区');
INSERT INTO `hcc_tb_param_area` VALUES ('8241', '8238', '西夏区');
INSERT INTO `hcc_tb_param_area` VALUES ('8242', '8238', '金凤区');
INSERT INTO `hcc_tb_param_area` VALUES ('8243', '8238', '永宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8244', '8238', '贺兰县');
INSERT INTO `hcc_tb_param_area` VALUES ('8245', '8238', '灵武市');
INSERT INTO `hcc_tb_param_area` VALUES ('8246', '8237', '石嘴山市');
INSERT INTO `hcc_tb_param_area` VALUES ('8247', '8246', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8248', '8246', '大武口区');
INSERT INTO `hcc_tb_param_area` VALUES ('8249', '8246', '惠农区');
INSERT INTO `hcc_tb_param_area` VALUES ('8250', '8246', '平罗县');
INSERT INTO `hcc_tb_param_area` VALUES ('8251', '8237', '吴忠市');
INSERT INTO `hcc_tb_param_area` VALUES ('8252', '8251', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8253', '8251', '利通区');
INSERT INTO `hcc_tb_param_area` VALUES ('8254', '8251', '盐池县');
INSERT INTO `hcc_tb_param_area` VALUES ('8255', '8251', '同心县');
INSERT INTO `hcc_tb_param_area` VALUES ('8256', '8251', '青铜峡市');
INSERT INTO `hcc_tb_param_area` VALUES ('8257', '8237', '固原市');
INSERT INTO `hcc_tb_param_area` VALUES ('8258', '8257', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8259', '8257', '原州区');
INSERT INTO `hcc_tb_param_area` VALUES ('8260', '8257', '西吉县');
INSERT INTO `hcc_tb_param_area` VALUES ('8261', '8257', '隆德县');
INSERT INTO `hcc_tb_param_area` VALUES ('8262', '8257', '泾源县');
INSERT INTO `hcc_tb_param_area` VALUES ('8263', '8257', '彭阳县');
INSERT INTO `hcc_tb_param_area` VALUES ('8264', '8237', '中卫市');
INSERT INTO `hcc_tb_param_area` VALUES ('8265', '8264', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8266', '8264', '沙坡头区');
INSERT INTO `hcc_tb_param_area` VALUES ('8267', '8264', '中宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8268', '8264', '海原县');
INSERT INTO `hcc_tb_param_area` VALUES ('8269', '0', '新疆维吾尔自治区');
INSERT INTO `hcc_tb_param_area` VALUES ('8270', '8269', '乌鲁木齐市');
INSERT INTO `hcc_tb_param_area` VALUES ('8271', '8270', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8272', '8270', '天山区');
INSERT INTO `hcc_tb_param_area` VALUES ('8273', '8270', '沙依巴克区');
INSERT INTO `hcc_tb_param_area` VALUES ('8274', '8270', '新市区');
INSERT INTO `hcc_tb_param_area` VALUES ('8275', '8270', '水磨沟区');
INSERT INTO `hcc_tb_param_area` VALUES ('8276', '8270', '头屯河区');
INSERT INTO `hcc_tb_param_area` VALUES ('8277', '8270', '达坂城区');
INSERT INTO `hcc_tb_param_area` VALUES ('8278', '8270', '东山区');
INSERT INTO `hcc_tb_param_area` VALUES ('8279', '8270', '乌鲁木齐县');
INSERT INTO `hcc_tb_param_area` VALUES ('8280', '8269', '克拉玛依市');
INSERT INTO `hcc_tb_param_area` VALUES ('8281', '8280', '市辖区');
INSERT INTO `hcc_tb_param_area` VALUES ('8282', '8280', '独山子区');
INSERT INTO `hcc_tb_param_area` VALUES ('8283', '8280', '克拉玛依区');
INSERT INTO `hcc_tb_param_area` VALUES ('8284', '8280', '白碱滩区');
INSERT INTO `hcc_tb_param_area` VALUES ('8285', '8280', '乌尔禾区');
INSERT INTO `hcc_tb_param_area` VALUES ('8286', '8269', '吐鲁番地区');
INSERT INTO `hcc_tb_param_area` VALUES ('8287', '8286', '吐鲁番市');
INSERT INTO `hcc_tb_param_area` VALUES ('8288', '8286', '鄯善县');
INSERT INTO `hcc_tb_param_area` VALUES ('8289', '8286', '托克逊县');
INSERT INTO `hcc_tb_param_area` VALUES ('8290', '8269', '哈密地区');
INSERT INTO `hcc_tb_param_area` VALUES ('8291', '8290', '哈密市');
INSERT INTO `hcc_tb_param_area` VALUES ('8292', '8290', '巴里坤哈萨克自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8293', '8290', '伊吾县');
INSERT INTO `hcc_tb_param_area` VALUES ('8294', '8269', '昌吉回族自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8295', '8294', '昌吉市');
INSERT INTO `hcc_tb_param_area` VALUES ('8296', '8294', '阜康市');
INSERT INTO `hcc_tb_param_area` VALUES ('8297', '8294', '米泉市');
INSERT INTO `hcc_tb_param_area` VALUES ('8298', '8294', '呼图壁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8299', '8294', '玛纳斯县');
INSERT INTO `hcc_tb_param_area` VALUES ('8300', '8294', '奇台县');
INSERT INTO `hcc_tb_param_area` VALUES ('8301', '8294', '吉木萨尔县');
INSERT INTO `hcc_tb_param_area` VALUES ('8302', '8294', '木垒哈萨克自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8303', '8269', '博尔塔拉蒙古自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8304', '8303', '博乐市');
INSERT INTO `hcc_tb_param_area` VALUES ('8305', '8303', '精河县');
INSERT INTO `hcc_tb_param_area` VALUES ('8306', '8303', '温泉县');
INSERT INTO `hcc_tb_param_area` VALUES ('8307', '8269', '巴音郭楞蒙古自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8308', '8307', '库尔勒市');
INSERT INTO `hcc_tb_param_area` VALUES ('8309', '8307', '轮台县');
INSERT INTO `hcc_tb_param_area` VALUES ('8310', '8307', '尉犁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8311', '8307', '若羌县');
INSERT INTO `hcc_tb_param_area` VALUES ('8312', '8307', '且末县');
INSERT INTO `hcc_tb_param_area` VALUES ('8313', '8307', '焉耆回族自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8314', '8307', '和静县');
INSERT INTO `hcc_tb_param_area` VALUES ('8315', '8307', '和硕县');
INSERT INTO `hcc_tb_param_area` VALUES ('8316', '8307', '博湖县');
INSERT INTO `hcc_tb_param_area` VALUES ('8317', '8269', '阿克苏地区');
INSERT INTO `hcc_tb_param_area` VALUES ('8318', '8317', '阿克苏市');
INSERT INTO `hcc_tb_param_area` VALUES ('8319', '8317', '温宿县');
INSERT INTO `hcc_tb_param_area` VALUES ('8320', '8317', '库车县');
INSERT INTO `hcc_tb_param_area` VALUES ('8321', '8317', '沙雅县');
INSERT INTO `hcc_tb_param_area` VALUES ('8322', '8317', '新和县');
INSERT INTO `hcc_tb_param_area` VALUES ('8323', '8317', '拜城县');
INSERT INTO `hcc_tb_param_area` VALUES ('8324', '8317', '乌什县');
INSERT INTO `hcc_tb_param_area` VALUES ('8325', '8317', '阿瓦提县');
INSERT INTO `hcc_tb_param_area` VALUES ('8326', '8317', '柯坪县');
INSERT INTO `hcc_tb_param_area` VALUES ('8327', '8269', '克孜勒苏柯尔克孜自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8328', '8327', '阿图什市');
INSERT INTO `hcc_tb_param_area` VALUES ('8329', '8327', '阿克陶县');
INSERT INTO `hcc_tb_param_area` VALUES ('8330', '8327', '阿合奇县');
INSERT INTO `hcc_tb_param_area` VALUES ('8331', '8327', '乌恰县');
INSERT INTO `hcc_tb_param_area` VALUES ('8332', '8269', '喀什地区');
INSERT INTO `hcc_tb_param_area` VALUES ('8333', '8332', '喀什市');
INSERT INTO `hcc_tb_param_area` VALUES ('8334', '8332', '疏附县');
INSERT INTO `hcc_tb_param_area` VALUES ('8335', '8332', '疏勒县');
INSERT INTO `hcc_tb_param_area` VALUES ('8336', '8332', '英吉沙县');
INSERT INTO `hcc_tb_param_area` VALUES ('8337', '8332', '泽普县');
INSERT INTO `hcc_tb_param_area` VALUES ('8338', '8332', '莎车县');
INSERT INTO `hcc_tb_param_area` VALUES ('8339', '8332', '叶城县');
INSERT INTO `hcc_tb_param_area` VALUES ('8340', '8332', '麦盖提县');
INSERT INTO `hcc_tb_param_area` VALUES ('8341', '8332', '岳普湖县');
INSERT INTO `hcc_tb_param_area` VALUES ('8342', '8332', '伽师县');
INSERT INTO `hcc_tb_param_area` VALUES ('8343', '8332', '巴楚县');
INSERT INTO `hcc_tb_param_area` VALUES ('8344', '8332', '塔什库尔干塔吉克自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8345', '8269', '和田地区');
INSERT INTO `hcc_tb_param_area` VALUES ('8346', '8345', '和田市');
INSERT INTO `hcc_tb_param_area` VALUES ('8347', '8345', '和田县');
INSERT INTO `hcc_tb_param_area` VALUES ('8348', '8345', '墨玉县');
INSERT INTO `hcc_tb_param_area` VALUES ('8349', '8345', '皮山县');
INSERT INTO `hcc_tb_param_area` VALUES ('8350', '8345', '洛浦县');
INSERT INTO `hcc_tb_param_area` VALUES ('8351', '8345', '策勒县');
INSERT INTO `hcc_tb_param_area` VALUES ('8352', '8345', '于田县');
INSERT INTO `hcc_tb_param_area` VALUES ('8353', '8345', '民丰县');
INSERT INTO `hcc_tb_param_area` VALUES ('8354', '8269', '伊犁哈萨克自治州');
INSERT INTO `hcc_tb_param_area` VALUES ('8355', '8354', '伊宁市');
INSERT INTO `hcc_tb_param_area` VALUES ('8356', '8354', '奎屯市');
INSERT INTO `hcc_tb_param_area` VALUES ('8357', '8354', '伊宁县');
INSERT INTO `hcc_tb_param_area` VALUES ('8358', '8354', '察布查尔锡伯自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8359', '8354', '霍城县');
INSERT INTO `hcc_tb_param_area` VALUES ('8360', '8354', '巩留县');
INSERT INTO `hcc_tb_param_area` VALUES ('8361', '8354', '新源县');
INSERT INTO `hcc_tb_param_area` VALUES ('8362', '8354', '昭苏县');
INSERT INTO `hcc_tb_param_area` VALUES ('8363', '8354', '特克斯县');
INSERT INTO `hcc_tb_param_area` VALUES ('8364', '8354', '尼勒克县');
INSERT INTO `hcc_tb_param_area` VALUES ('8365', '8269', '塔城地区');
INSERT INTO `hcc_tb_param_area` VALUES ('8366', '8365', '塔城市');
INSERT INTO `hcc_tb_param_area` VALUES ('8367', '8365', '乌苏市');
INSERT INTO `hcc_tb_param_area` VALUES ('8368', '8365', '额敏县');
INSERT INTO `hcc_tb_param_area` VALUES ('8369', '8365', '沙湾县');
INSERT INTO `hcc_tb_param_area` VALUES ('8370', '8365', '托里县');
INSERT INTO `hcc_tb_param_area` VALUES ('8371', '8365', '裕民县');
INSERT INTO `hcc_tb_param_area` VALUES ('8372', '8365', '和布克赛尔蒙古自治县');
INSERT INTO `hcc_tb_param_area` VALUES ('8373', '8269', '阿勒泰地区');
INSERT INTO `hcc_tb_param_area` VALUES ('8374', '8373', '阿勒泰市');
INSERT INTO `hcc_tb_param_area` VALUES ('8375', '8373', '布尔津县');
INSERT INTO `hcc_tb_param_area` VALUES ('8376', '8373', '富蕴县');
INSERT INTO `hcc_tb_param_area` VALUES ('8377', '8373', '福海县');
INSERT INTO `hcc_tb_param_area` VALUES ('8378', '8373', '哈巴河县');
INSERT INTO `hcc_tb_param_area` VALUES ('8379', '8373', '青河县');
INSERT INTO `hcc_tb_param_area` VALUES ('8380', '8373', '吉木乃县');
INSERT INTO `hcc_tb_param_area` VALUES ('8381', '8269', '省直辖行政单位');
INSERT INTO `hcc_tb_param_area` VALUES ('8382', '8373', '石河子市');
INSERT INTO `hcc_tb_param_area` VALUES ('8383', '8373', '阿拉尔市');
INSERT INTO `hcc_tb_param_area` VALUES ('8384', '8373', '图木舒克市');
INSERT INTO `hcc_tb_param_area` VALUES ('8385', '8373', '五家渠市');
INSERT INTO `hcc_tb_param_area` VALUES ('8386', '7153', '东莞市辖');
INSERT INTO `hcc_tb_param_area` VALUES ('9000', '7154', '石岐区');
INSERT INTO `hcc_tb_param_area` VALUES ('9001', '7154', '东区');
INSERT INTO `hcc_tb_param_area` VALUES ('9002', '7154', '西区');
INSERT INTO `hcc_tb_param_area` VALUES ('9003', '7154', '南区');
INSERT INTO `hcc_tb_param_area` VALUES ('9004', '7154', '五桂山区');
INSERT INTO `hcc_tb_param_area` VALUES ('9005', '7154', '火炬开发区');
INSERT INTO `hcc_tb_param_area` VALUES ('9006', '7154', '黄圃镇');
INSERT INTO `hcc_tb_param_area` VALUES ('9007', '7154', '南头镇');
INSERT INTO `hcc_tb_param_area` VALUES ('9008', '7154', '东凤镇');
INSERT INTO `hcc_tb_param_area` VALUES ('9009', '7154', '阜沙镇');
INSERT INTO `hcc_tb_param_area` VALUES ('9010', '7154', '小榄镇');
INSERT INTO `hcc_tb_param_area` VALUES ('9011', '7154', '东升镇');
INSERT INTO `hcc_tb_param_area` VALUES ('9012', '7154', '坦洲镇');
INSERT INTO `hcc_tb_param_area` VALUES ('9013', '7154', '沙溪镇');

-- ----------------------------
-- Table structure for `hcc_tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_user`;
CREATE TABLE `hcc_tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(25) DEFAULT NULL,
  `user_mobile` varchar(15) DEFAULT NULL,
  `user_pwd` varchar(32) DEFAULT NULL,
  `user_state` smallint(2) DEFAULT NULL COMMENT '0待验证 1正常 2锁定 3已注销',
  `user_from` varchar(10) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `login_state` smallint(2) DEFAULT '0' COMMENT '0未登录 1已登录',
  `open_id` varchar(32) DEFAULT NULL,
  `email_valite` smallint(2) DEFAULT '0' COMMENT '0 未验证 1 已验证',
  `mobile_valite` smallint(2) DEFAULT '0' COMMENT '0未验证 1已验证',
  `accesstoken` varchar(32) DEFAULT NULL,
  `reg_ip` varchar(20) DEFAULT NULL,
  `longitude` varchar(64) DEFAULT NULL,
  `latitude` varchar(64) DEFAULT NULL,
  `deviceid` varchar(64) DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `last_log_date` datetime DEFAULT NULL,
  `areaid` int(11) DEFAULT '0' COMMENT '常驻地',
  `log_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `push_user_id` varchar(64) DEFAULT NULL,
  `push_channel_id` varchar(64) DEFAULT NULL,
  `device_type` smallint(2) DEFAULT '0' COMMENT '1IOS 2Android',
  `user_type` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `hoo_idx_user_id` (`user_id`),
  KEY `hoo_idx_user_mobile` (`user_mobile`) USING BTREE,
  KEY `hoo_idx_user_email` (`user_email`) USING BTREE,
  KEY `hoo_idx_user_reg_time` (`reg_date`) USING BTREE,
  KEY `hoo_idx_user_open_id` (`open_id`) USING BTREE,
  KEY `hoo_idx_user_from` (`user_from`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1000792 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_user
-- ----------------------------
INSERT INTO `hcc_tb_user` VALUES ('-1', null, null, null, '1', 'c102', null, '0', null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000762', 'hp_s01@uhuibao.com', null, 'c8af9d3b22444ee835269fbcbce60cf0', '1', 'c102', '2014-06-17 14:25:16', '0', '', '1', '1', '33EGMSQW9ULV3D24S5X2UY7VDRCFLI', '192.168.0.82', '114.038645', '22.538387', '869421018558963', '192.168.1.36', '2014-10-14 12:39:23', '5', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000763', 'hp_s02@uhuibao.com', null, 'c8af9d3b22444ee835269fbcbce60cf0', '1', 'c102', '2014-06-17 14:26:07', '0', '', '1', '1', 'UN5I675NRACT4MDXX3NHBX3VW2QX8A', '192.168.0.82', '114.038142', '22.538895', '352361069877025', '192.168.0.110', '2014-06-20 17:07:20', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000764', 'hp_s03@uhuibao.com', null, 'c8af9d3b22444ee835269fbcbce60cf0', '1', 'c102', '2014-06-17 14:26:52', '0', '', '1', '1', 'JZVXRBFB9UTMVZPNAUJI9G31MSTZV1', '192.168.0.82', '114.038177', '22.538964', '869528010146850', '10.130.31.208', '2014-06-26 14:02:11', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000779', '', null, '', null, 'c102', null, '0', '', '1', '1', '', '', '114.038299', '22.538546', '860955020256271', null, null, '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000780', '', null, '', '1', 'c102', null, '0', '', '1', '1', '', '', '114.053014', '22.449528', '355533056922322', '10.130.81.196', '2014-07-18 12:15:00', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000781', 'zoof@uhuibao.com', null, '25d55ad283aa400af464c76d713c07ad', '1', 'c102', '2014-06-20 16:44:24', '0', '', '1', '1', 'KJFGA6KLF6S5LNRNUUDSYR57ZTU5UZ', 'fe80::8832:9bff:fe99', '4.9E-324', '4.9E-324', '355533056922322', 'fe80::8832:9bff:fe99', '2014-06-20 17:50:53', '5', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000782', '', null, '', '1', 'c102', null, '0', '', '1', '1', '', '', '114.03805', '22.538872', '868232009478348', '192.167.1.53', '2014-06-20 20:47:35', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000783', '', null, '', null, 'c102', null, '0', '', '1', '1', '', '', '114.038201', '22.538852', '352361069858116', null, null, '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000784', '', null, '', null, 'c102', null, '0', '', '1', '1', '', '', '114.038375', '22.538523', '352361069877025', null, null, '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000785', '', null, '', '1', 'c102', null, '0', '', '1', '1', '', '', '114.038338', '22.538376', '357841034646402', '192.168.7.168', '2014-07-11 20:29:41', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000786', '', null, '', '1', 'c102', null, '0', '', '1', '1', '', '', '114.038313', '22.53858', '358198054074745', '192.168.0.167', '2014-10-08 17:13:39', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000787', '', null, '', '1', 'c102', null, '0', '', '1', '1', '', '', '114.038352', '22.538577', '869528010146850', '192.168.0.177', '2014-10-13 16:37:40', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000788', '', null, '', '1', 'c102', null, '0', '', '1', '1', '', '', '114.016208', '22.544164', '357246052580717', '192.168.1.60', '2014-10-16 11:52:13', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000789', '', null, '', '1', 'c102', null, '0', '', '1', '1', '', '', '114.184923', '22.299936', '865317025574841', '10.1.1.170', '2014-07-23 13:59:18', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000790', '', null, '', '1', 'c102', null, '0', '', '1', '1', '', '', '114.038075', '22.538715', '860727019634788', '10.130.88.19', '2014-07-31 14:52:19', '0', null, null, null, '0', '0');
INSERT INTO `hcc_tb_user` VALUES ('1000791', '', null, '', '1', 'c102', null, '0', '', '1', '1', '', '', '114.185047', '22.281105', '868329010443251', '10.130.109.22', '2014-07-31 16:33:16', '0', null, null, null, '0', '0');

-- ----------------------------
-- Table structure for `hcc_tb_user_action`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_user_action`;
CREATE TABLE `hcc_tb_user_action` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `acc_user_id` int(10) DEFAULT NULL,
  `action_type` smallint(2) DEFAULT NULL COMMENT '1签到\r\n            2下载\r\n            3转发\r\n            4邀请关注',
  `create_date` datetime DEFAULT NULL,
  `state` smallint(2) DEFAULT NULL COMMENT '1有效\r\n            0无效',
  `mod_date` datetime DEFAULT NULL,
  `action_count` int(5) DEFAULT NULL,
  `action_obj` varchar(20) DEFAULT NULL COMMENT '如果是下载App则记录是哪款app\r\n            如果是邀请好友则记录是哪个好友',
  `obj_from` varchar(5) DEFAULT NULL,
  `action_from` varchar(5) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_acc_user_id` (`acc_user_id`) USING BTREE,
  KEY `idx_action_type` (`action_type`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=214692 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hcc_tb_user_action
-- ----------------------------

-- ----------------------------
-- Table structure for `hcc_tb_user_auth`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_user_auth`;
CREATE TABLE `hcc_tb_user_auth` (
  `user_auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_auth_type` int(11) DEFAULT NULL COMMENT '0:oauth2',
  `app_id` int(11) DEFAULT NULL,
  `user_auth_func_id` int(11) DEFAULT NULL,
  `user_auth_flag` char(4) DEFAULT NULL COMMENT 'Y : 有权限\r\n            N：无权限',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_auth_id`),
  KEY `hoo_idx_user_auth_user_rid` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `hcc_tb_user_detail`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_user_detail`;
CREATE TABLE `hcc_tb_user_detail` (
  `user_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_nick_name` varchar(64) DEFAULT NULL,
  `user_real_name` varchar(20) DEFAULT NULL COMMENT '真名',
  `user_sex` varchar(1) DEFAULT NULL COMMENT 'M : 男  F：女',
  `user_cert_type` char(2) DEFAULT NULL,
  `user_cert_num` varchar(18) DEFAULT NULL,
  `user_birthday` date DEFAULT NULL COMMENT '生日',
  `user_sign` varchar(70) DEFAULT NULL,
  `user_province` int(11) DEFAULT NULL COMMENT '省1',
  `user_city` int(11) DEFAULT NULL COMMENT '市1',
  `user_area` int(11) DEFAULT NULL COMMENT '地区1',
  `user_address` varchar(100) DEFAULT NULL COMMENT '居住地1',
  `create_date` datetime NOT NULL COMMENT '默认当前日期',
  `user_telephone` varchar(15) DEFAULT NULL,
  `user_postcode` varchar(6) DEFAULT NULL,
  `user_img` varchar(100) DEFAULT NULL,
  `user_small_img` varchar(100) DEFAULT NULL,
  `user_big_img` varchar(100) DEFAULT NULL,
  `user_hand_pwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_detail_id`),
  KEY `idx_userid` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_user_detail
-- ----------------------------
INSERT INTO `hcc_tb_user_detail` VALUES ('1', '1000762', '年少轻狂', null, '0', null, null, null, null, null, null, null, null, '2014-06-17 14:25:16', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('2', '1000763', '註定夢一場', null, '0', null, null, null, null, null, null, null, null, '2014-06-17 14:26:07', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('3', '1000764', '流泪旳蜡烛', null, '1', null, null, null, null, null, null, null, null, '2014-06-17 14:26:52', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('4', '0', '游客I1WQ', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('5', '0', '游客TDVY', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('6', '1000781', 'Zoof', null, '1', null, null, null, null, null, null, null, null, '2014-06-20 16:44:24', null, null, 'http://img1.uhuibao.com/M00/03/C3/05qaYVOj9GCACnMSAABRZmTs86w596.jpg', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('7', '0', '游客9GVP', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('8', '0', '游客3MRY', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('9', '0', '游客IX4W', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('10', '0', '游客JQDT', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('11', '0', '游客3X95', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('12', '0', '游客CXH8', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('13', '0', '游客HYBT', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('14', '0', '游客5T6C', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);
INSERT INTO `hcc_tb_user_detail` VALUES ('15', '0', '游客FRX4', null, null, null, null, null, null, null, null, null, null, '0000-00-00 00:00:00', null, null, '', null, null, null);

-- ----------------------------
-- Table structure for `hcc_tb_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_user_post`;
CREATE TABLE `hcc_tb_user_post` (
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `post_real_name` varchar(20) DEFAULT NULL COMMENT '真名',
  `post_addr_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_mobile` varchar(15) DEFAULT NULL,
  `post_province` int(5) DEFAULT NULL COMMENT '省1',
  `post_city` int(5) DEFAULT NULL COMMENT '市1',
  `post_area` int(5) DEFAULT NULL COMMENT '地区1',
  `post_address` varchar(100) DEFAULT NULL COMMENT '居住地1',
  `isdefault` varchar(1) DEFAULT NULL,
  `post_code` varchar(6) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0  无效 1 有效',
  `create_date` datetime DEFAULT NULL,
  `post_count` int(11) DEFAULT '0',
  PRIMARY KEY (`post_addr_id`),
  KEY `hoo_idx_user_post_user_rid` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_user_post
-- ----------------------------
INSERT INTO `hcc_tb_user_post` VALUES ('1010971', 'xxx', '1', '13590487847', '7012', '7039', '7044', '广东省深圳市宝安区', '1', '', '0', null, '0');
INSERT INTO `hcc_tb_user_post` VALUES ('1002882', '蒙小青', '2', '18589026968', '7012', '7039', '7042', '广东省深圳市福田区创新中心大厦', '0', '', '0', null, '0');
INSERT INTO `hcc_tb_user_post` VALUES ('1020214', '吴先生', '3', '13632641234', '7012', '7039', '7042', '广东省深圳市福田区景田北布尾村110栋602', '1', '', '0', null, '0');
INSERT INTO `hcc_tb_user_post` VALUES ('1020314', '陈先生', '4', '13510498979', '7012', '7039', '7042', '广东省深圳市福田区沙嘴村一坊98栋805', '0', '', '0', null, '0');
INSERT INTO `hcc_tb_user_post` VALUES ('1001891', '黄茂洲', '5', '18718479183', '7012', '7039', '7043', '南头街道红花园75栋204', '0', '', '0', null, '0');
INSERT INTO `hcc_tb_user_post` VALUES ('1002882', '地址', '6', '18589026968', '7174', '7201', '7206', '广西壮族自治区桂林市七星区', '0', '', '0', null, '0');
INSERT INTO `hcc_tb_user_post` VALUES ('1002882', '地址', '7', '18589026968', '7174', '7201', '7206', '广西壮族自治区桂林市七星区', '1', '', '0', null, '0');
INSERT INTO `hcc_tb_user_post` VALUES ('1010972', '黄炳能', '8', '18676373650', '0', '7175', '0', '广西壮族自治区南宁市', '0', '', '0', null, '0');

-- ----------------------------
-- Table structure for `hcc_tb_user_sns`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_user_sns`;
CREATE TABLE `hcc_tb_user_sns` (
  `user_sns_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_id` int(11) DEFAULT NULL COMMENT '真名',
  `user_sns_type` int(4) DEFAULT NULL COMMENT '1、腾讯微博\r\n            2、新浪微博\r\n            3、人人网',
  `uid` varchar(132) DEFAULT NULL,
  `openkey` varchar(64) DEFAULT NULL COMMENT '只有腾讯有openkey',
  `acesstoken` varchar(150) DEFAULT NULL,
  `validdate` varchar(22) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_sns_id`),
  UNIQUE KEY `idx_user_sns_id` (`user_sns_id`) USING BTREE,
  KEY `hoo_idx_user_sns_user_rid` (`user_id`) USING BTREE,
  KEY `idx_user_sns_uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_user_sns
-- ----------------------------
INSERT INTO `hcc_tb_user_sns` VALUES ('419', '1001860', '3', '5272442330', '', null, '2015-12-15 13:59:29', null);
INSERT INTO `hcc_tb_user_sns` VALUES ('420', '1001862', '1', 'CAD5A16D85CF2BA46D7BA1C9FB0734F5', '', 'DAEDEE8DF1392C2C33D41F5DD73DA3B1', '2015-03-31 06:58:05 ', null);
INSERT INTO `hcc_tb_user_sns` VALUES ('421', '1001869', '2', 'oB_CSt9hBadnuzRZCC-9Uo-tOCuU', '', null, '2015-12-15 13:59:29', null);
INSERT INTO `hcc_tb_user_sns` VALUES ('422', '1001870', '2', 'oB_CSt5SVWlOUyKNCacWZPDUmowY', '', null, '2015-12-15 13:59:29', null);
INSERT INTO `hcc_tb_user_sns` VALUES ('423', '1001871', '3', '1712289120', '', null, '2015-12-15 13:59:29', null);
INSERT INTO `hcc_tb_user_sns` VALUES ('424', '1001872', '3', '1583875553', '', null, '2015-12-15 13:59:29', null);
INSERT INTO `hcc_tb_user_sns` VALUES ('425', '1001873', '1', '3727F141F742008837D3791C6B5BB4AC', '', null, '2015-04-05 07:54:01', null);
INSERT INTO `hcc_tb_user_sns` VALUES ('426', '1001874', '1', 'F3E1E524C94AD0D62CA2DCF0273074E8', '', null, '2015-04-05 12:49:37', null);
INSERT INTO `hcc_tb_user_sns` VALUES ('427', '1001875', '1', '2A93B90091D42D0E8737850E85C37F4E', '', null, '2015-04-05 14:32:15', null);

-- ----------------------------
-- Table structure for `hcc_tb_user_tag`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_user_tag`;
CREATE TABLE `hcc_tb_user_tag` (
  `tag_rec_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tag_type` int(11) DEFAULT NULL COMMENT '1、行为标签\r\n            2、朋友印象\r\n            ...\r\n            参数配置见参数配置表：TAG_TYPE\r\n            ',
  `tag_context` varchar(30) DEFAULT NULL,
  `user_from` varchar(8) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`tag_rec_id`),
  KEY `hoo_idx_user_tag_user_id` (`user_id`) USING BTREE,
  KEY `hoo_idx_user_tag_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcc_tb_user_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `hcc_tb_valid_info`
-- ----------------------------
DROP TABLE IF EXISTS `hcc_tb_valid_info`;
CREATE TABLE `hcc_tb_valid_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valid_code` varchar(32) DEFAULT '' COMMENT '需验证的内容 如：验证码',
  `valid_param` varchar(32) DEFAULT '' COMMENT '验证标识参数 如：手机号',
  `valid_type` varchar(32) DEFAULT '' COMMENT '验证类型:0注册短信验证',
  `record_count` int(11) DEFAULT NULL COMMENT '记录次数(包括修改和插入）',
  `sfrom` varchar(32) DEFAULT NULL COMMENT '来源渠道：以ESB为标准',
  `state` int(1) DEFAULT '1' COMMENT '1有效 0无效 2已使用',
  `create_date` datetime DEFAULT NULL,
  `mod_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11826 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hcc_tb_valid_info
-- ----------------------------
INSERT INTO `hcc_tb_valid_info` VALUES ('132', '5505', '18676373650', '3', '1', 'c113', '2', '2016-01-28 11:42:14', '2016-01-28 11:47:06');
INSERT INTO `hcc_tb_valid_info` VALUES ('133', '5312', '18676373650', '3', '1', 'c113', '2', '2016-01-28 11:46:19', '2016-01-28 11:51:08');
INSERT INTO `hcc_tb_valid_info` VALUES ('134', '1981', '18676373650', '3', '1', 'c113', '2', '2016-01-28 11:50:13', '2016-01-28 11:55:05');
INSERT INTO `hcc_tb_valid_info` VALUES ('135', '8372', '18680520523', '3', '1', 'c101', '2', '2016-03-09 16:49:15', '2016-03-09 16:48:57');
INSERT INTO `hcc_tb_valid_info` VALUES ('136', '2112', '18665496989', '3', '1', 'c101', '2', '2016-03-09 19:10:39', '2016-03-09 19:10:13');
INSERT INTO `hcc_tb_valid_info` VALUES ('137', '3617', '13501589031', '3', '1', 'c101', '2', '2016-03-09 20:57:28', '2016-03-09 20:56:56');
INSERT INTO `hcc_tb_valid_info` VALUES ('138', '8493', '13501589031', '3', '1', 'c101', '2', '2016-03-09 20:53:54', '2016-03-09 20:58:30');
INSERT INTO `hcc_tb_valid_info` VALUES ('139', '5621', '13501589031', '3', '1', 'c101', '2', '2016-03-09 20:55:54', '2016-03-09 21:00:22');
INSERT INTO `hcc_tb_valid_info` VALUES ('140', '3859', '18503005013', '0', '1', 'c101', '2', '2016-03-10 11:27:45', '2016-03-10 11:27:10');
INSERT INTO `hcc_tb_valid_info` VALUES ('141', '5193', '18503005013', '0', '1', 'c101', '2', '2016-03-10 11:23:45', '2016-03-10 11:28:09');
INSERT INTO `hcc_tb_valid_info` VALUES ('142', '2036', '18503005013', '0', '1', 'c101', '2', '2016-03-10 11:26:02', '2016-03-10 11:30:26');
INSERT INTO `hcc_tb_valid_info` VALUES ('143', '1633', '18503005013', '0', '1', 'c101', '2', '2016-03-10 11:34:31', '2016-03-10 11:33:52');
INSERT INTO `hcc_tb_valid_info` VALUES ('144', '4797', '18503005013', '0', '1', 'c101', '2', '2016-03-10 11:30:59', '2016-03-10 11:35:28');
INSERT INTO `hcc_tb_valid_info` VALUES ('145', '0752', '18503005013', '0', '1', 'c101', '2', '2016-03-10 11:37:27', '2016-03-10 11:36:51');
INSERT INTO `hcc_tb_valid_info` VALUES ('146', '2540', '13501589031', '3', '1', 'c101', '2', '2016-03-10 13:40:55', '2016-03-10 13:40:22');
INSERT INTO `hcc_tb_valid_info` VALUES ('147', '9690', '18676373650', '3', '1', 'c101', '2', '2016-03-10 15:17:33', '2016-03-10 15:22:03');
INSERT INTO `hcc_tb_valid_info` VALUES ('148', '0877', '18676373650', '3', '1', 'c101', '2', '2016-03-10 15:24:13', '2016-03-10 15:23:40');
INSERT INTO `hcc_tb_valid_info` VALUES ('149', '9146', '18319050490', '3', '1', 'c101', '2', '2016-03-10 15:28:18', '2016-03-10 15:27:57');
INSERT INTO `hcc_tb_valid_info` VALUES ('150', '4747', '18676373650', '3', '1', 'c101', '2', '2016-03-10 15:36:37', '2016-03-10 15:36:01');
INSERT INTO `hcc_tb_valid_info` VALUES ('151', '5213', '18676373650', '3', '1', 'c101', '2', '2016-03-10 15:48:39', '2016-03-10 15:48:05');

-- ----------------------------
-- Table structure for `tb_malll_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tb_malll_goods`;
CREATE TABLE `tb_malll_goods` (
  `GOODS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUPPLIER_ID` int(11) NOT NULL,
  `GOODS_BRADE` int(11) DEFAULT NULL,
  `GOODS_NAME` varchar(64) DEFAULT NULL,
  `GOODS_CODE` varchar(32) DEFAULT NULL,
  `TYPE_ID` int(11) DEFAULT '0',
  `GOODS_UNIT` varchar(10) DEFAULT NULL,
  `GOODS_DESC` varchar(256) DEFAULT NULL,
  `GOODS_QRCODE` varchar(64) DEFAULT NULL,
  `IS_PRESELL` int(11) DEFAULT NULL,
  `IS_TOP` int(11) DEFAULT NULL,
  `IS_HOT` int(11) DEFAULT '0' COMMENT '0 不热销\r\n            1 热销',
  `STATUS` int(11) DEFAULT '0' COMMENT '0，新建\r\n            1，上架\r\n            2，下架',
  `EDIT_USER` varchar(32) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `EDIT_DATE` datetime DEFAULT NULL,
  `BEGIN_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_malll_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mall_brand`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_brand`;
CREATE TABLE `tb_mall_brand` (
  `BRAND_ID` int(11) NOT NULL,
  `BRAND_NAME` varchar(128) DEFAULT NULL,
  `BRAND_IMG` varchar(256) DEFAULT NULL,
  `BRAND_INDEX` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`BRAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mall_goods_brand`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_goods_brand`;
CREATE TABLE `tb_mall_goods_brand` (
  `BRAND_ID` int(11) NOT NULL,
  `BRAND_NAME` varchar(128) DEFAULT NULL,
  `BRAND_IMG` varchar(256) DEFAULT NULL,
  `BRAND_INDEX` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`BRAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_goods_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mall_goods_custom`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_goods_custom`;
CREATE TABLE `tb_mall_goods_custom` (
  `CUSTOM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(11) DEFAULT NULL,
  `PRE_PROP_NAME` varchar(64) DEFAULT NULL,
  `BACK_PROP_NAME` varchar(64) DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT '0',
  `OUTE_ID` varchar(64) DEFAULT NULL,
  `IS_SALES` int(11) DEFAULT '0',
  `IS_NEED` int(11) DEFAULT '0',
  `PROP_TYPE` varchar(32) DEFAULT NULL COMMENT 'CHECKBOX：多选\r\n            SELECT：下拉列表\r\n            ',
  `STATUS` int(11) DEFAULT '0',
  `SORT_ID` int(11) DEFAULT '0',
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`CUSTOM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_goods_custom
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mall_goods_custom_value`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_goods_custom_value`;
CREATE TABLE `tb_mall_goods_custom_value` (
  `VALUE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOM_ID` int(11) DEFAULT NULL,
  `CUSTOM_VALUE` varchar(128) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_goods_custom_value
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mall_goods_discount`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_goods_discount`;
CREATE TABLE `tb_mall_goods_discount` (
  `DISCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(11) DEFAULT NULL,
  `DISCOUNT_OBJ` int(11) DEFAULT NULL COMMENT '1.商品优惠\r\n            2.渠道商品优惠\r\n            3.SKU商品优惠\r\n            4.渠道SKU商品优惠',
  `CHANNEL_ID` int(11) DEFAULT NULL,
  `SKU_ID` int(11) DEFAULT NULL,
  `STEP_TYPE` int(11) DEFAULT NULL COMMENT '1.按销售数量\r\n            2.按销售总额',
  `STATUS` int(11) DEFAULT '1',
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`DISCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_goods_discount
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mall_goods_img`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_goods_img`;
CREATE TABLE `tb_mall_goods_img` (
  `IMG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(11) DEFAULT '0',
  `IMG_URL` varchar(256) DEFAULT NULL,
  `IMG_TYPE` int(11) DEFAULT '1' COMMENT '1，大图\r\n            2，小图',
  `IS_MAIN` int(11) DEFAULT '0' COMMENT '0，否\r\n            1，是',
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`IMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_goods_img
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mall_goods_sku`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_goods_sku`;
CREATE TABLE `tb_mall_goods_sku` (
  `SKU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SKU_TYPE` int(11) DEFAULT NULL COMMENT '0  基准类型\r\n            1  各组合类型',
  `GOODS_ID` int(11) NOT NULL,
  `PROP_CODE` varchar(64) DEFAULT NULL,
  `PRE_PRICE` decimal(10,2) DEFAULT NULL,
  `SELL_PRICE` decimal(10,2) DEFAULT NULL,
  `COST_PRICE` decimal(10,2) DEFAULT NULL,
  `TAG_PRICE` decimal(10,2) DEFAULT NULL,
  `SKU_NAME` varchar(128) DEFAULT NULL,
  `GOODS_NUM` int(11) DEFAULT '0',
  `ALARM_NUM` int(11) DEFAULT '0',
  `SKU_IMG` varchar(128) DEFAULT NULL,
  `OUTE_CODE` varchar(64) DEFAULT NULL,
  `GOODS_CODE` varchar(64) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`SKU_ID`,`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_goods_sku
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mall_goods_store_inout`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_goods_store_inout`;
CREATE TABLE `tb_mall_goods_store_inout` (
  `INOUT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(11) DEFAULT NULL,
  `SKU_ID` int(11) DEFAULT NULL,
  `INOUT_TYPE` varchar(8) DEFAULT NULL COMMENT 'IN，入库\r\n            OUT，出库',
  `QUANTITY` int(11) DEFAULT NULL,
  `GOODS_STORE` int(11) DEFAULT NULL,
  `REMARK` varchar(256) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `EDIT_USER` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`INOUT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_goods_store_inout
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mall_goods_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mall_goods_supplier`;
CREATE TABLE `tb_mall_goods_supplier` (
  `SUPPLIER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUPPLIER_NAME` varchar(64) DEFAULT NULL,
  `SUPPLIER_CODE` varchar(64) DEFAULT NULL,
  `SIGN_DATE` datetime DEFAULT NULL,
  `EXPIRY_DATE` datetime DEFAULT NULL,
  `DEPOSIT` decimal(10,2) DEFAULT '0.00',
  `GOODS_LIMIT_NUM` int(11) DEFAULT '0',
  `CONTACT` varchar(32) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `CURRENCY` int(11) DEFAULT '1' COMMENT '1，人民币\r\n            2，港币',
  `REMARK` varchar(256) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '0' COMMENT '0，新建\r\n            1，使用中\r\n            2，禁用',
  `CREATE_DATE` datetime DEFAULT NULL,
  `EDIT_USER` varchar(32) DEFAULT NULL,
  `EDIT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`SUPPLIER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mall_goods_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_param_code`
-- ----------------------------
DROP TABLE IF EXISTS `tb_param_code`;
CREATE TABLE `tb_param_code` (
  `PARAM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARAM_TYPE` varchar(32) DEFAULT NULL,
  `PARAM_NAME` varchar(64) DEFAULT NULL,
  `PARAM_CODE` varchar(32) DEFAULT NULL,
  `PARAM_VALUE` varchar(256) DEFAULT NULL,
  `REMARK` varchar(256) DEFAULT NULL,
  `EDIT_USER` varchar(30) DEFAULT NULL,
  `EDIT_DATE` datetime DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`PARAM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_param_code
-- ----------------------------
INSERT INTO `tb_param_code` VALUES ('1', 'ORDER_STATE', '订单状态', 'NOPAY', '未支付', '', 'admin', '2015-09-16 15:44:08', '2015-09-16 15:44:08');
INSERT INTO `tb_param_code` VALUES ('2', 'ORDER_STATE', '订单状态', 'HADPAY', '已支付', '', 'admin', '2015-09-16 15:44:22', '2015-09-16 15:44:22');
INSERT INTO `tb_param_code` VALUES ('3', 'ORDER_STATE', '订单状态', 'DELETE', '已退票', '', 'admin', '2015-09-16 15:44:46', '2015-09-16 15:44:46');
INSERT INTO `tb_param_code` VALUES ('4', 'DATA_STATE', '数据状态', '1', '使用中', '', 'admin', '2015-10-27 11:56:26', '2015-10-27 11:56:26');
INSERT INTO `tb_param_code` VALUES ('5', 'DATA_STATE', '数据状态', '0', '新建', '', 'admin', '2015-10-27 11:55:53', '2015-10-27 11:55:53');
INSERT INTO `tb_param_code` VALUES ('6', 'DATA_STATE', '数据状态', '2', '禁用', '', 'admin', '2015-10-27 11:56:47', '2015-10-27 11:56:47');
INSERT INTO `tb_param_code` VALUES ('7', 'GOODS_TYPE', '商品类别', '1', '车票', '', 'admin', '2015-10-27 17:11:03', '2015-10-27 17:11:03');
INSERT INTO `tb_param_code` VALUES ('8', 'GOODS_TYPE', '商品类别', '2', '船票', '', 'admin', '2015-10-27 17:11:27', '2015-10-27 17:11:27');
INSERT INTO `tb_param_code` VALUES ('9', 'CHAINBACK_ORDER_STATE', '订单状态', '1', '已付款', '', 'yink', '2016-02-16 16:58:43', '2016-02-16 16:58:43');
INSERT INTO `tb_param_code` VALUES ('10', 'AREA_TYPE', '地区类别', '852', '香港', '', 'yink', '2016-02-16 16:59:13', '2016-02-16 16:59:13');
INSERT INTO `tb_param_code` VALUES ('11', 'AREA_TYPE', '地区类别', '81', '日本', '', 'yink', '2016-02-16 16:59:51', '2016-02-16 16:59:51');
INSERT INTO `tb_param_code` VALUES ('12', 'AREA_TYPE', '地区类别', '886', '台湾', '', 'yink', '2016-02-16 17:00:13', '2016-02-16 17:00:13');
INSERT INTO `tb_param_code` VALUES ('13', 'AREA_TYPE', '地区类别', '853', '澳门', '', 'yink', '2016-02-16 17:00:32', '2016-02-16 17:00:32');
INSERT INTO `tb_param_code` VALUES ('14', 'AREA_TYPE', '地区类别', 'shenzheng', '深圳', '', 'yink', '2016-02-16 17:00:52', '2016-02-16 17:00:52');
INSERT INTO `tb_param_code` VALUES ('15', 'AREA_TYPE', '地区类别', 'taiguo', '泰国', '', 'chenf', '2016-02-24 15:11:39', '2016-02-24 15:11:39');
INSERT INTO `tb_param_code` VALUES ('16', 'PROCESS_CODE', '审批流程标识', 'ADD_ACCOUNT_MONEY', 'de013813394f45739c9a4b7955a4138c', '', 'lirf', '2016-04-21 13:33:26', '2016-04-21 13:33:26');
INSERT INTO `tb_param_code` VALUES ('17', 'CURRENCY', '币种', '1', '人民币', '', 'lirf', '2016-04-22 16:44:03', '2016-04-22 16:44:03');
INSERT INTO `tb_param_code` VALUES ('18', 'CURRENCY', '币种', '2', '港币', '', 'lirf', '2016-04-22 16:44:29', '2016-04-22 16:44:29');
INSERT INTO `tb_param_code` VALUES ('19', 'REMIND_CONTINUOUS', '连续提醒天数', 'REMIND_CONTINUOUS', '2;3;4;5;6', '', 'lirf', '2016-04-22 16:44:55', '2016-04-22 16:44:55');
INSERT INTO `tb_param_code` VALUES ('20', 'money_change_type', '渠道余额变动类型', '3', 'simi卡充值扣款', '', 'lirf', '2016-05-13 16:51:18', '2016-05-13 16:51:18');
INSERT INTO `tb_param_code` VALUES ('21', 'money_change_type', '渠道余额变动类型', '2', '订购流量包扣款', '', 'lirf', '2016-05-13 16:52:00', '2016-05-13 16:52:00');
INSERT INTO `tb_param_code` VALUES ('22', 'money_change_type', '渠道余额变动类型', '1', '账户充值', '', 'lirf', '2016-05-13 16:52:25', '2016-05-13 16:52:25');

-- ----------------------------
-- Table structure for `tb_priv_function_old`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_function_old`;
CREATE TABLE `tb_priv_function_old` (
  `function_id` int(11) NOT NULL AUTO_INCREMENT,
  `function_code` varchar(64) DEFAULT NULL,
  `function_name` varchar(64) DEFAULT NULL,
  `function_parentid` int(11) DEFAULT NULL,
  `function_type` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `mod_date` date DEFAULT NULL,
  `last_mod_user` varchar(64) DEFAULT NULL,
  `function_index` int(10) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_function_old
-- ----------------------------
INSERT INTO `tb_priv_function_old` VALUES ('1', '101', '系统配置管理', '0', 'main', '2014-07-11 11:16:34', '2014-12-18', '105', '999', 'aa', '#', '1');
INSERT INTO `tb_priv_function_old` VALUES ('4', 'yhgl', '用户管理', '1', 'sub', '2014-07-11 11:16:34', '2014-07-11', '101', '1', null, 'priv/listUser.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('5', 'gngl', '功能管理', '1', 'sub', '2014-07-11 11:16:32', '2014-07-11', '101', '2', null, 'priv/listFunction.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('6', 'rolegl', '角色管理', '1', 'sub', '2014-07-11 11:16:30', '2014-07-11', '101', '3', null, 'priv/listRole.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('7', 'gnrogl', '功能角色管理', '1', 'sub', '2014-07-11 11:16:28', '2014-07-11', '101', '4', null, 'priv/roleFunc.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('10', 'SJZD', '数据字典', '0', 'main', '2015-05-29 10:16:39', '2015-05-29', '111', '1', '', '#', '1');
INSERT INTO `tb_priv_function_old` VALUES ('11', 'param', '数据字典', '10', 'sub', '2015-05-29 10:18:55', '2015-05-29', '111', '1', '', 'manage/paramIndex.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('14', 'supplier', '供应商管理', '0', 'main', '2015-10-27 11:45:52', '2015-10-27', '111', '3', '', '#', '1');
INSERT INTO `tb_priv_function_old` VALUES ('15', 'supplierList', '供应商列表', '14', 'sub', '2015-10-27 11:46:46', '2015-10-27', '111', '1', '', 'supplier/supplierList.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('16', 'goods', '商品管理', '0', 'main', '2015-10-27 17:29:47', '2015-10-27', '111', '4', '', '#', '1');
INSERT INTO `tb_priv_function_old` VALUES ('17', 'goodsList', '商品列表', '16', 'sub', '2015-10-27 17:30:25', '2015-10-27', '111', '1', '', 'goods/goodsList.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('18', 'channel', '渠道管理', '0', 'main', '2015-10-28 10:12:25', '2015-10-28', '111', '5', '', '#', '1');
INSERT INTO `tb_priv_function_old` VALUES ('19', 'channelList', '渠道列表', '18', 'sub', '2015-10-28 10:12:56', '2015-10-28', '111', '1', '', 'channel/channelList.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('20', 'CATEGORY', '商品类目属性管理', '0', 'main', '2015-10-29 17:59:33', '2015-10-29', '111', '1', '', '#', '1');
INSERT INTO `tb_priv_function_old` VALUES ('21', 'categoryList', '商品分类列表', '20', 'sub', '2015-10-29 18:00:22', '2015-11-05', '111', '1', '', 'attr/cateGoryTree.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('22', 'itemProps', '商品属性列表', '20', 'sub', '2015-10-30 10:17:50', '2015-10-30', '111', '2', '', 'attr/itemPropList.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('23', 'propValueList', '属性值列表', '20', 'sub', '2015-10-30 11:43:09', '2015-10-30', '111', '3', '', 'attr/propValueList.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('24', 'managestore', '库存管理', '16', 'sub', '2015-11-10 13:37:54', '2015-11-10', '111', '2', '', 'goods/toStoreListPage.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('25', 'channel_store', '渠道出库管理', '16', 'sub', '2015-11-17 17:55:40', '2015-11-17', '111', '3', '', 'goods/toChannelStoreDetailPage.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('26', 'saleFinanceReport', '商品销售财务报表', '16', 'sub', '2016-01-14 15:42:40', '2016-01-14', '111', '6', '', 'goods/saleFinanceReport.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('27', 'workflow', '流程定义', '0', 'main', '2016-02-15 15:20:47', '2016-02-15', '113', '20', '', '#', '1');
INSERT INTO `tb_priv_function_old` VALUES ('28', 'flowList', '流程定义', '27', 'sub', '2016-02-15 15:21:28', '2016-02-15', '113', '1', '', 'process/list.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('29', 'applyhanddle', '我的审批', '27', 'sub', '2016-02-15 15:21:54', '2016-02-15', '113', '2', '', 'process/listfloworder.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('32', 'saleFinanceReportTwo', '商品销售财务报表2', '16', 'sub', '2016-01-15 14:33:59', '2016-01-15', '111', '7', '', 'goods/saleFinanceReportTwo.action', '1');
INSERT INTO `tb_priv_function_old` VALUES ('37', 'channelmoneychange', '渠道账户流水记录', '18', 'sub', '2016-05-13 16:38:20', '2016-05-13', '116', '3', '', 'channel/channelMoneyChangeList.action', '1');

-- ----------------------------
-- Table structure for `tb_priv_para_config`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_para_config`;
CREATE TABLE `tb_priv_para_config` (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `para_name` varchar(100) DEFAULT NULL,
  `para_flag` varchar(10) DEFAULT NULL,
  `para_value` varchar(50) DEFAULT NULL,
  `default_value` varchar(50) DEFAULT NULL,
  `des` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_para_config
-- ----------------------------
INSERT INTO `tb_priv_para_config` VALUES ('1', 'test', '1', 'testvalue', '0', null);

-- ----------------------------
-- Table structure for `tb_priv_rolefunc_old`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_rolefunc_old`;
CREATE TABLE `tb_priv_rolefunc_old` (
  `role_func_id` int(11) NOT NULL AUTO_INCREMENT,
  `function_id` int(11) DEFAULT NULL,
  `function_priv` varchar(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `mod_date` date DEFAULT NULL,
  `last_mod_user` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `role_code` varchar(64) DEFAULT NULL COMMENT '权限类型:1父权限功能，2自己的权限功能',
  PRIMARY KEY (`role_func_id`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_rolefunc_old
-- ----------------------------
INSERT INTO `tb_priv_rolefunc_old` VALUES ('1', '1', '', '2014-07-11 11:39:14', '2014-07-11', '101', '', '2', '1');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('2', '4', '', '2014-07-11 11:39:09', '2014-07-11', '101', '', '2', '1');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('3', '5', '', '2014-07-11 11:39:07', '2014-07-11', '101', '', '2', '1');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('4', '6', '', '2014-07-11 11:39:05', '2014-07-11', '101', '', '2', '1');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('7', '7', '', '2014-07-11 11:39:03', '2014-07-11', '101', '', '2', '1');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('362', '1', null, '2015-03-31 00:00:00', '2015-03-31', '108', null, '1', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('367', '10', null, '2015-05-29 00:00:00', '2015-05-29', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('368', '11', null, '2015-05-29 00:00:00', '2015-05-29', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('377', '14', null, '2015-10-27 00:00:00', '2015-10-27', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('378', '15', null, '2015-10-27 00:00:00', '2015-10-27', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('379', '16', null, '2015-10-27 00:00:00', '2015-10-27', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('380', '17', null, '2015-10-27 00:00:00', '2015-10-27', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('381', '18', null, '2015-10-28 00:00:00', '2015-10-28', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('382', '19', null, '2015-10-28 00:00:00', '2015-10-28', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('383', '20', null, '2015-10-29 00:00:00', '2015-10-29', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('384', '21', null, '2015-10-29 00:00:00', '2015-10-29', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('387', '22', null, '2015-11-06 00:00:00', '2015-11-06', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('388', '23', null, '2015-11-06 00:00:00', '2015-11-06', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('389', '24', null, '2015-11-10 00:00:00', '2015-11-10', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('390', '25', null, '2015-11-17 00:00:00', '2015-11-17', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('391', '26', null, '2016-01-14 00:00:00', '2016-01-14', '111', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('395', '27', null, '2016-02-16 00:00:00', '2016-02-16', '113', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('396', '28', null, '2016-02-16 00:00:00', '2016-02-16', '113', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('397', '29', null, '2016-02-16 00:00:00', '2016-02-16', '113', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('398', '32', null, '2016-02-16 00:00:00', '2016-02-16', '113', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('431', '10', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('432', '11', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('436', '14', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('437', '15', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('438', '16', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('439', '17', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('440', '24', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('441', '25', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('442', '26', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('443', '32', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('444', '18', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('445', '19', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('446', '20', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('447', '21', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('448', '22', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('449', '23', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('450', '27', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('451', '28', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('452', '29', null, '2016-02-24 00:00:00', '2016-02-24', '116', null, '3', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('509', '27', null, '2016-05-06 17:11:39', '2016-05-06', '116', null, '4', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('511', '29', null, '2016-05-06 17:11:39', '2016-05-06', '116', null, '4', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('513', '37', null, '2016-05-13 00:00:00', '2016-05-13', '116', null, '2', '2');
INSERT INTO `tb_priv_rolefunc_old` VALUES ('515', '37', null, '2016-05-13 00:00:00', '2016-05-13', '116', null, '3', '2');

-- ----------------------------
-- Table structure for `tb_priv_role_old`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_role_old`;
CREATE TABLE `tb_priv_role_old` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(64) DEFAULT NULL,
  `role_name` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `mod_date` datetime DEFAULT NULL,
  `last_mod_user` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `father_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_role_old
-- ----------------------------
INSERT INTO `tb_priv_role_old` VALUES ('1', 'test', '测试人员', '2014-10-29 11:52:20', '2014-12-11 16:30:18', '105', 'asdfa', '0');
INSERT INTO `tb_priv_role_old` VALUES ('2', '101', '超级管理员', '2014-09-26 00:00:00', '2015-05-23 10:39:57', null, null, '0');
INSERT INTO `tb_priv_role_old` VALUES ('3', null, '运营人员', '2016-02-24 14:57:08', '2016-02-24 14:57:38', '116', '', '0');
INSERT INTO `tb_priv_role_old` VALUES ('4', null, '财务部', '2016-05-06 17:11:05', '2016-05-06 17:11:39', '116', '财务部角色', '4');

-- ----------------------------
-- Table structure for `tb_priv_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_sys_menu`;
CREATE TABLE `tb_priv_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `furl` varchar(50) DEFAULT NULL,
  `perCode` varchar(10) DEFAULT NULL,
  `mark` varchar(20) DEFAULT NULL,
  `fstatus` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `fparent_id` int(11) DEFAULT NULL,
  `fmodel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rsbtye057g69c8wm561dm17li` (`fparent_id`),
  KEY `FK_n4l666nwhnoagtd2q0hr4hmxa` (`fmodel_id`),
  CONSTRAINT `FK_n4l666nwhnoagtd2q0hr4hmxa` FOREIGN KEY (`fmodel_id`) REFERENCES `tb_priv_sys_model` (`id`),
  CONSTRAINT `FK_rsbtye057g69c8wm561dm17li` FOREIGN KEY (`fparent_id`) REFERENCES `tb_priv_sys_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_sys_menu
-- ----------------------------
INSERT INTO `tb_priv_sys_menu` VALUES ('1', '基本信息', 'images/leftico01.png', '0101', null, '1', '1', null, '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('2', 'App使用条款', 'dispatcher.shtm', '010101', '1', '1', '1', '1', '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('3', '基本资料', 'images/leftico01.png', '0201', null, '1', '2', null, '2');
INSERT INTO `tb_priv_sys_menu` VALUES ('4', '用户资料', 'dispatcher.shtm', '020101', '2', '1', '1', '3', '2');
INSERT INTO `tb_priv_sys_menu` VALUES ('5', '周边设施', 'dispatcher.shtm', '010103', '3', '1', '3', '1', '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('6', '周边设施类别', 'dispatcher.shtm', '010102', '4', '1', '2', '1', '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('8', '周边设施位置管理', 'dispatcher.shtm', '030201', '6', '1', '5', '18', '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('9', '基础数据管理', 'images/leftico01.png', '0301', null, '1', '5', null, '3');
INSERT INTO `tb_priv_sys_menu` VALUES ('10', '地区数据', 'dispatcher.shtm', '030101', '8', '1', '1', '9', '3');
INSERT INTO `tb_priv_sys_menu` VALUES ('11', '线路数据', 'dispatcher.shtm', '030102', '9', '1', '2', '9', '3');
INSERT INTO `tb_priv_sys_menu` VALUES ('12', '站点基本数据', 'dispatcher.shtm', '030103', '11', '1', '3', '9', '3');
INSERT INTO `tb_priv_sys_menu` VALUES ('13', '班次数据', 'dispatcher.shtm', '030104', '10', '1', '4', '9', '3');
INSERT INTO `tb_priv_sys_menu` VALUES ('14', '站点数据', 'dispatcher.shtm', '030105', '12', '1', '5', '9', '3');
INSERT INTO `tb_priv_sys_menu` VALUES ('15', '节假日数据', 'dispatcher.shtm', '030106', '13', '1', '6', '9', '3');
INSERT INTO `tb_priv_sys_menu` VALUES ('16', '座位图数据', 'dispatcher.shtm', '030107', '14', '1', '7', '9', '3');
INSERT INTO `tb_priv_sys_menu` VALUES ('17', 'App版本管理', 'dispatcher.shtm', '010105', '7', '1', '5', '1', '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('18', '位置设置', 'images/leftico01.png', '0302', null, '1', '5', null, '3');
INSERT INTO `tb_priv_sys_menu` VALUES ('19', '订单管理', 'images/leftico01.png', '0401', null, '1', '5', null, '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('20', '所有订单', 'dispatcher.shtm', '040101', '15', '1', '1', '19', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('21', '车票管理', 'images/leftico01.png', '0402', null, '1', '5', null, '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('22', '所有车票', 'dispatcher.shtm', '040201', '16', '1', '1', '21', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('23', '有效订单', 'dispatcher.shtm', '040102', '17', '1', '2', '19', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('24', '历史订单', 'dispatcher.shtm', '040103', '18', '1', '3', '19', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('25', '待付款车票', 'dispatcher.shtm', '040202', '19', '1', '2', '21', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('26', '待乘车票', 'dispatcher.shtm', '040203', '20', '1', '3', '21', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('27', '改签车票', 'dispatcher.shtm', '040204', '21', '1', '4', '21', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('28', '已乘车票', 'dispatcher.shtm', '040205', '22', '1', '5', '21', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('29', '过期车票', 'dispatcher.shtm', '040206', '23', '1', '6', '21', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('30', '常用线路管理', 'images/leftico01.png', '0102', null, '1', '1', null, '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('31', '常用线路', 'dispatcher.shtm', '010201', '24', '1', '6', '30', '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('32', '地区位置管理', 'dispatcher.shtm', '030202', '25', '2', '5', '18', '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('33', '站点位置管理', 'dispatcher.shtm', '030203', '26', '3', '5', '18', '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('34', '验票管理', 'images/leftico01.png', '0501', null, '1', '1', null, '5');
INSERT INTO `tb_priv_sys_menu` VALUES ('35', '所有验票记录', 'dispatcher.shtm', '050101', '27', '1', '1', '34', '5');
INSERT INTO `tb_priv_sys_menu` VALUES ('36', 'APP验票记录', 'dispatcher.shtm', '050102', '28', '1', '2', '34', '5');
INSERT INTO `tb_priv_sys_menu` VALUES ('37', 'WEB验票记录', 'dispatcher.shtm', '050103', '30', '1', '3', '34', '5');
INSERT INTO `tb_priv_sys_menu` VALUES ('38', '站点验票记录', 'dispatcher.shtm', '050104', '29', '1', '4', '34', '5');
INSERT INTO `tb_priv_sys_menu` VALUES ('39', '用户类型', 'dispatcher.shtm', '020102', '31', '1', '4', '3', '2');
INSERT INTO `tb_priv_sys_menu` VALUES ('40', '系统参数管理', 'images/leftico01.png', '0601', null, '1', '1', null, '6');
INSERT INTO `tb_priv_sys_menu` VALUES ('41', '参数配置', 'dispatcher.shtm', '060101', '32', '1', '1', '40', '6');
INSERT INTO `tb_priv_sys_menu` VALUES ('42', '地区/站点关联设置', 'dispatcher.shtm', '030204', '33', '1', '4', '18', '5');
INSERT INTO `tb_priv_sys_menu` VALUES ('43', '车票转让', 'images/leftico01.png', '0403', null, '1', '5', null, '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('44', '转让记录', 'dispatcher.shtm', '040301', '35', '1', '6', '43', '4');
INSERT INTO `tb_priv_sys_menu` VALUES ('45', 'Web售票基本资料', 'images/leftico01.png', '0103', null, '1', '1', null, '1');
INSERT INTO `tb_priv_sys_menu` VALUES ('46', '购票协议管理', 'dispatcher.shtm', '010301', '36', '1', '1', '45', '1');

-- ----------------------------
-- Table structure for `tb_priv_sys_model`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_sys_model`;
CREATE TABLE `tb_priv_sys_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `furl` varchar(50) DEFAULT NULL,
  `perCode` varchar(10) DEFAULT NULL,
  `fmodel_id` int(11) DEFAULT NULL,
  `fdescribe` varchar(200) DEFAULT NULL,
  `fstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_sys_model
-- ----------------------------
INSERT INTO `tb_priv_sys_model` VALUES ('1', '基本资料', 'images/icon01.png', '01', null, null, '1');
INSERT INTO `tb_priv_sys_model` VALUES ('2', '用户中心', 'images/icon01.png', '02', null, null, '1');
INSERT INTO `tb_priv_sys_model` VALUES ('3', '基础数据', 'images/icon01.png', '03', null, null, '1');
INSERT INTO `tb_priv_sys_model` VALUES ('4', '车票管理', 'images/icon01.png', '04', null, null, '1');
INSERT INTO `tb_priv_sys_model` VALUES ('5', '验票管理', 'images/icon01.png', '05', null, null, '1');
INSERT INTO `tb_priv_sys_model` VALUES ('6', '系统管控', 'images/icon01.png', '06', null, null, '1');

-- ----------------------------
-- Table structure for `tb_priv_sys_per`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_sys_per`;
CREATE TABLE `tb_priv_sys_per` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_sys_per
-- ----------------------------
INSERT INTO `tb_priv_sys_per` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `tb_priv_sys_per_act`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_sys_per_act`;
CREATE TABLE `tb_priv_sys_per_act` (
  `per_act_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_id` int(11) DEFAULT NULL,
  `per_menu_code` varchar(20) DEFAULT NULL,
  `per_act_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`per_act_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_sys_per_act
-- ----------------------------
INSERT INTO `tb_priv_sys_per_act` VALUES ('1', '1', '0601', '060101');
INSERT INTO `tb_priv_sys_per_act` VALUES ('2', '1', '010101', '010101');
INSERT INTO `tb_priv_sys_per_act` VALUES ('3', '1', '0201', '010101');
INSERT INTO `tb_priv_sys_per_act` VALUES ('4', '1', '060101', '06010101');

-- ----------------------------
-- Table structure for `tb_priv_sys_per_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_sys_per_menu`;
CREATE TABLE `tb_priv_sys_per_menu` (
  `per_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_id` int(11) DEFAULT NULL,
  `per_mod_code` varchar(10) DEFAULT NULL,
  `per_menu_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`per_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_sys_per_menu
-- ----------------------------
INSERT INTO `tb_priv_sys_per_menu` VALUES ('1', '1', '01', '0101');
INSERT INTO `tb_priv_sys_per_menu` VALUES ('2', '1', '01', '010101');
INSERT INTO `tb_priv_sys_per_menu` VALUES ('3', '1', '02', '0201');
INSERT INTO `tb_priv_sys_per_menu` VALUES ('4', '1', '06', '0601');
INSERT INTO `tb_priv_sys_per_menu` VALUES ('5', '1', '06', '060101');

-- ----------------------------
-- Table structure for `tb_priv_sys_per_mod`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_sys_per_mod`;
CREATE TABLE `tb_priv_sys_per_mod` (
  `per_mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_id` int(11) DEFAULT NULL,
  `per_mod_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`per_mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_sys_per_mod
-- ----------------------------
INSERT INTO `tb_priv_sys_per_mod` VALUES ('6', '1', '01');
INSERT INTO `tb_priv_sys_per_mod` VALUES ('7', '1', '01');
INSERT INTO `tb_priv_sys_per_mod` VALUES ('8', '1', '02');
INSERT INTO `tb_priv_sys_per_mod` VALUES ('9', '1', '06');
INSERT INTO `tb_priv_sys_per_mod` VALUES ('10', '1', '06');

-- ----------------------------
-- Table structure for `tb_priv_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_user`;
CREATE TABLE `tb_priv_user` (
  `user_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `user_type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_user
-- ----------------------------
INSERT INTO `tb_priv_user` VALUES ('1', '1', 'D4842D5376778C931DF35D6D4074442D', 'admin', '1', '管理员');

-- ----------------------------
-- Table structure for `tb_priv_userrole_old`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_userrole_old`;
CREATE TABLE `tb_priv_userrole_old` (
  `user_role_id` int(11) NOT NULL,
  `register_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `mod_date` date DEFAULT NULL,
  `last_mod_user` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `role_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_userrole_old
-- ----------------------------
INSERT INTO `tb_priv_userrole_old` VALUES ('4', '105', '2015-03-23 13:44:57', '2015-03-23', null, null, '2', '101');
INSERT INTO `tb_priv_userrole_old` VALUES ('7', '108', '2015-03-23 18:19:01', '2015-03-23', null, null, '2', null);
INSERT INTO `tb_priv_userrole_old` VALUES ('8', '109', '2015-03-27 09:09:19', '2015-04-14', 'wangtao', null, '2', null);
INSERT INTO `tb_priv_userrole_old` VALUES ('9', '110', '2015-04-30 15:20:59', '2015-04-30', null, null, '1', null);
INSERT INTO `tb_priv_userrole_old` VALUES ('10', '111', '2015-05-07 16:13:15', '2015-05-07', null, null, '2', null);
INSERT INTO `tb_priv_userrole_old` VALUES ('15', '115', '2016-01-27 10:05:44', '2016-01-27', null, null, '2', null);
INSERT INTO `tb_priv_userrole_old` VALUES ('16', '116', '2016-02-15 15:19:39', '2016-04-18', 'admin', null, '2', null);
INSERT INTO `tb_priv_userrole_old` VALUES ('17', '117', '2016-02-16 15:12:48', '2016-03-21', 'admin', null, '2', null);
INSERT INTO `tb_priv_userrole_old` VALUES ('21', '121', '2016-03-21 11:43:59', '2016-03-21', null, null, '3', null);
INSERT INTO `tb_priv_userrole_old` VALUES ('22', '122', '2016-04-18 14:23:44', '2016-04-18', null, null, '2', null);
INSERT INTO `tb_priv_userrole_old` VALUES ('23', '123', '2016-05-06 17:13:56', '2016-05-06', null, null, '4', null);

-- ----------------------------
-- Table structure for `tb_priv_user_old`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_user_old`;
CREATE TABLE `tb_priv_user_old` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) DEFAULT NULL,
  `login_pwd` varchar(64) DEFAULT NULL,
  `user_name` varchar(64) DEFAULT NULL,
  `telephone1` varchar(64) DEFAULT NULL,
  `telephone2` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `mod_date` datetime DEFAULT NULL,
  `last_mod_user` varchar(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `channel` varchar(20) DEFAULT '0',
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_user_old
-- ----------------------------
INSERT INTO `tb_priv_user_old` VALUES ('111', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', '', '', '', '2015-05-07 16:13:15', '2016-06-11 22:58:55', '2015-05-07 16:13:15', null, '', null);
INSERT INTO `tb_priv_user_old` VALUES ('115', 'cs', 'ac387b9a2d208da08666851231cd324c', 'cs', '', '', '', '2016-01-27 10:05:44', null, '2016-01-27 10:05:44', null, '', null);
INSERT INTO `tb_priv_user_old` VALUES ('116', 'chenf', 'e10adc3949ba59abbe56e057f20f883e', '陈芳', '', '', '', '2016-02-15 15:19:39', '2016-06-03 16:31:55', '2016-04-18 14:21:06', 'admin', '', null);
INSERT INTO `tb_priv_user_old` VALUES ('117', 'product', 'e930794b9f2a0e31b1577b7ff1942262', 'product', '', '', '', '2016-02-16 15:12:48', '2016-03-21 11:43:29', '2016-03-21 11:42:51', 'admin', '', null);
INSERT INTO `tb_priv_user_old` VALUES ('121', 'lgx', '49c2db6f98d50123fc5c59171e55d7b2', '刘根香', '', '', '', '2016-03-21 11:43:59', '2016-03-21 11:52:29', '2016-03-21 11:43:59', null, '', null);
INSERT INTO `tb_priv_user_old` VALUES ('122', 'lirf', '4cd57ab8a7226be82372489e532eefb9', '李融凡', '', '', '', '2016-04-18 14:23:44', '2016-06-07 14:08:10', '2016-04-18 14:23:44', null, '', null);
INSERT INTO `tb_priv_user_old` VALUES ('123', 'uhuibaocw', '63e0632fe2e52b740c3b8e3d04e4cdc9', '游惠宝财务部', '', '', '', '2016-05-06 17:13:56', '2016-06-03 17:15:27', '2016-05-06 17:13:56', null, '游惠宝财务部', null);

-- ----------------------------
-- Table structure for `tb_priv_user_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_priv_user_type`;
CREATE TABLE `tb_priv_user_type` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `type_ms` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_priv_user_type
-- ----------------------------
INSERT INTO `tb_priv_user_type` VALUES ('1', '1', '管理员', '管理员');
