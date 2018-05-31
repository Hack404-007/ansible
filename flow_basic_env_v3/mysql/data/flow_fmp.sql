-- MySQL dump 10.13  Distrib 5.6.22, for Linux (x86_64)
--
-- Host: localhost    Database: flow_fmp
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_channel_group`
--

DROP TABLE IF EXISTS `access_channel_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_channel_group` (
  `channel_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通道组ID',
  `quota_id` bigint(20) DEFAULT NULL COMMENT '指标ID',
  `dispatch_channel` varchar(64) NOT NULL COMMENT '流量下发通道组标识',
  `group_name` varchar(128) DEFAULT NULL COMMENT '通道组名称',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_def` int(11) NOT NULL COMMENT '是否默认通道组 0:否 1:是',
  `is_quote` int(2) DEFAULT '0' COMMENT '是否可引用:0 否;1 是',
  PRIMARY KEY (`channel_group_id`),
  UNIQUE KEY `U_1` (`dispatch_channel`),
  KEY `FK_Reference_60` (`quota_id`),
  CONSTRAINT `FK_Reference_60` FOREIGN KEY (`quota_id`) REFERENCES `channel_quality_quota` (`quota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `access_channel_info`
--

DROP TABLE IF EXISTS `access_channel_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_channel_info` (
  `channel_seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通道自增序列',
  `supplier_code` varchar(32) NOT NULL COMMENT '供应商编码',
  `channel_id` varchar(32) NOT NULL COMMENT '通道ID',
  `channel_name` varchar(128) NOT NULL COMMENT '通道名称',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 0:无效 1:有效',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `ip` varchar(32) DEFAULT NULL COMMENT '创建者IP',
  `discount` decimal(10,2) NOT NULL COMMENT '折扣',
  `is_allow_sale` int(11) NOT NULL COMMENT '是否允许转售 0:否 1:是',
  `is_sms_notice` int(11) NOT NULL COMMENT '是否有短信通知 0:否 1:是',
  `channel_type` int(11) NOT NULL COMMENT '通道类别 1:运营商 2:第三方',
  `succ_num` bigint(20) DEFAULT NULL COMMENT '累计成功数',
  `fail_num` bigint(20) DEFAULT NULL COMMENT '累计失败数',
  `succ_ratio` decimal(10,2) DEFAULT NULL COMMENT '成功率,一段时间内',
  `timly_rate` decimal(10,2) DEFAULT NULL COMMENT '及时率,一段时间内',
  `total_succ_ratio` decimal(10,2) DEFAULT NULL COMMENT '总成功率',
  `maintain_zone` varchar(512) DEFAULT NULL COMMENT '通道维护区域，若有多个用英文逗号,隔开',
  `channel_limit` int(2) DEFAULT NULL COMMENT '通道限制:0 赠送;1 微信;2 阿里;3 低价',
  `channel_number` int(11) DEFAULT NULL COMMENT '叠加次数',
  `channel_abandon` int(2) DEFAULT NULL COMMENT '是否废弃:0 否;1 是',
  `channel_range` int(2) DEFAULT NULL COMMENT '流量范围:0 国内;1 省内',
  `channel_activity` int(2) DEFAULT NULL COMMENT '是否活动:0 否;1 是',
  `channel_sms` varchar(1024) DEFAULT NULL COMMENT '短信',
  `inure` varchar(512) DEFAULT NULL COMMENT '生效时间',
  `time_limit` varchar(512) DEFAULT NULL COMMENT '流量期限',
  `support_package` varchar(128) DEFAULT NULL COMMENT '支持套餐',
  `support_city` varchar(1024) DEFAULT NULL COMMENT '通道支持地市，若有多个用英文逗号,隔开(例如:广州,深圳)',
  `is_platform_sms` int(11) DEFAULT '0' COMMENT '平台是否发送短信:0 否;1 是',
  `platform_sms_content` varchar(1024) DEFAULT NULL COMMENT '平台发送短信内容',
  `timeout_defin` varchar(64) DEFAULT NULL COMMENT '超时定义',
  PRIMARY KEY (`channel_seq_id`),
  UNIQUE KEY `U_1` (`channel_id`),
  KEY `FK_Reference_54` (`supplier_code`),
  CONSTRAINT `FK_Reference_54` FOREIGN KEY (`supplier_code`) REFERENCES `channel_supplier` (`supplier_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1581 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `access_channel_info_his`
--

DROP TABLE IF EXISTS `access_channel_info_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_channel_info_his` (
  `channel_seq_id` bigint(20) NOT NULL COMMENT '通道自增序列',
  `supplier_code` varchar(32) NOT NULL COMMENT '供应商编码',
  `channel_id` varchar(32) NOT NULL COMMENT '通道ID',
  `channel_name` varchar(128) NOT NULL COMMENT '通道名称',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 0:无效 1:有效',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `ip` varchar(32) DEFAULT NULL COMMENT '创建者IP',
  `discount` decimal(10,2) NOT NULL COMMENT '折扣',
  `is_allow_sale` int(11) NOT NULL COMMENT '是否允许转售 0:否 1:是',
  `is_sms_notice` int(11) NOT NULL COMMENT '是否有短信通知 0:否 1:是',
  `channel_type` int(11) NOT NULL COMMENT '通道类别 1:运营商 2:第三方',
  `succ_num` bigint(20) DEFAULT NULL COMMENT '累计成功数',
  `fail_num` bigint(20) DEFAULT NULL COMMENT '累计失败数',
  `succ_ratio` decimal(10,2) DEFAULT NULL COMMENT '成功率,一段时间内',
  `timly_rate` decimal(10,2) DEFAULT NULL COMMENT '及时率,一段时间内',
  `total_succ_ratio` decimal(10,2) DEFAULT NULL COMMENT '总成功率',
  `maintain_zone` varchar(512) DEFAULT NULL COMMENT '通道维护区域，若有多个用英文逗号,隔开',
  `channel_limit` int(2) DEFAULT NULL COMMENT '通道限制:0 赠送;1 微信;2 阿里;3 低价',
  `channel_number` int(11) DEFAULT NULL COMMENT '叠加次数',
  `channel_abandon` int(2) DEFAULT NULL COMMENT '是否废弃:0 否;1 是',
  `channel_range` int(2) DEFAULT NULL COMMENT '流量范围:0 国内;1 省内',
  `channel_activity` int(2) DEFAULT NULL COMMENT '是否活动:0 否;1 是',
  `channel_sms` varchar(1024) DEFAULT NULL COMMENT '短信',
  `inure` varchar(512) DEFAULT NULL COMMENT '生效时间',
  `time_limit` varchar(512) DEFAULT NULL COMMENT '流量期限',
  `support_package` varchar(128) DEFAULT NULL COMMENT '支持套餐',
  `support_city` varchar(1024) DEFAULT NULL COMMENT '通道支持地市，若有多个用英文逗号,隔开(例如:广州,深圳)',
  `productInfos` varchar(1024) DEFAULT NULL COMMENT '产品信息json串',
  KEY `U_1` (`channel_seq_id`,`create_time`),
  KEY `U_2` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adv_category`
--

DROP TABLE IF EXISTS `adv_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adv_category` (
  `category_id` varchar(64) NOT NULL COMMENT '类别ID',
  `category_name` varchar(128) NOT NULL COMMENT '类别名称',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adv_info`
--

DROP TABLE IF EXISTS `adv_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adv_info` (
  `adv_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告位ID',
  `category_id` varchar(64) DEFAULT NULL COMMENT '类别ID',
  `adv_name` varchar(256) NOT NULL COMMENT '广告位名称',
  `url` varchar(256) NOT NULL COMMENT '链接地址',
  `pic_group_id` varchar(64) NOT NULL COMMENT '图片组ID',
  `pic_url` varchar(256) NOT NULL COMMENT '图片URL',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL COMMENT '状态, 1:有效 2:无效 ',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `priority` int(11) NOT NULL COMMENT '优先级,降序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`adv_id`),
  KEY `FK_Reference_55` (`category_id`),
  CONSTRAINT `FK_Reference_55` FOREIGN KEY (`category_id`) REFERENCES `adv_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alipay_conf`
--

DROP TABLE IF EXISTS `alipay_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alipay_conf` (
  `conf_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `conf_name` varchar(32) NOT NULL COMMENT '名称',
  `app_id` varchar(64) NOT NULL COMMENT '支付宝APPID',
  `mch_id` varchar(64) NOT NULL COMMENT '支付宝商户号',
  `pri_key` varchar(1024) NOT NULL COMMENT '商户私钥',
  `pub_key` varchar(1024) NOT NULL COMMENT '商户公钥',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `show_url` varchar(128) DEFAULT NULL COMMENT '展示url',
  `notify_url` varchar(128) DEFAULT NULL COMMENT '通知url',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `alipay_type` int(11) NOT NULL COMMENT '类别 1:自有 2:客户',
  PRIMARY KEY (`conf_id`),
  UNIQUE KEY `U_1` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_code`
--

DROP TABLE IF EXISTS `area_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_code` (
  `area_code` varchar(10) NOT NULL COMMENT '编码',
  `area_name` varchar(32) DEFAULT NULL COMMENT '名称',
  `display_order` int(11) DEFAULT NULL COMMENT '显示顺序,降序',
  PRIMARY KEY (`area_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_code_channel_config_city`
--

DROP TABLE IF EXISTS `area_code_channel_config_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_code_channel_config_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(40) DEFAULT NULL COMMENT '省份名称',
  `city_name` varchar(40) DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='地市通道城市配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_code_city`
--

DROP TABLE IF EXISTS `area_code_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_code_city` (
  `id` int(11) NOT NULL,
  `provinceId` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ireaCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='市';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachment_file`
--

DROP TABLE IF EXISTS `attachment_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment_file` (
  `ATTACH_FILE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件流水号',
  `ATTACH_GROUP_ID` bigint(20) NOT NULL COMMENT '附件组ID',
  `FILE_NAME` varchar(256) NOT NULL COMMENT '文件名称',
  `FILE_SAVE_NAME` varchar(256) NOT NULL COMMENT '文件存储名',
  `FILE_SIZE` int(11) NOT NULL COMMENT '文件大小（字节为单位）',
  `FILE_TYPE` varchar(100) NOT NULL COMMENT '文件类型（doc,pdf等）',
  `ATTACH_FILE_STATUS` varchar(21) NOT NULL COMMENT '附件状态（temp：暂存；formal：正式）',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '附件创建时间',
  PRIMARY KEY (`ATTACH_FILE_ID`),
  KEY `idx_attach_group_id` (`ATTACH_GROUP_ID`),
  CONSTRAINT `FK_attachment_file` FOREIGN KEY (`ATTACH_GROUP_ID`) REFERENCES `attachment_group` (`ATTACH_GROUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=687 DEFAULT CHARSET=utf8 COMMENT='附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachment_group`
--

DROP TABLE IF EXISTS `attachment_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment_group` (
  `ATTACH_GROUP_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '附件组ID',
  `ATTACH_TYPE_ID` varchar(12) DEFAULT NULL COMMENT '附件类型Id（为空表示无类型）',
  `ATTACH_GROUP_STATUS` varchar(12) NOT NULL COMMENT '附件状态（temp：暂存；formal：正式）',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '附件组创建时间',
  PRIMARY KEY (`ATTACH_GROUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=687 DEFAULT CHARSET=utf8 COMMENT='附件组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachment_type`
--

DROP TABLE IF EXISTS `attachment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment_type` (
  `ATTACH_TYPE_ID` varchar(12) NOT NULL COMMENT '附件类型Id',
  `ATTACH_TYPE_NAME` varchar(32) NOT NULL COMMENT '附件类型名称',
  `ATTACH_TYPE_DESC` varchar(200) NOT NULL COMMENT '附件类型描述',
  `ATTACH_COUNT_LIMIT` int(11) NOT NULL COMMENT '附件数量限制',
  `ATTACH_SIZE_LIMIT` int(11) NOT NULL COMMENT '附件大小总限制（字节为单位）',
  `SINGLE_SIZE_LIMIT` int(11) NOT NULL COMMENT '单个附件大小限制（字节为单位）',
  `FILE_SUFFIX_LIMIT` varchar(64) DEFAULT NULL COMMENT '文件后缀名限制（空表示不限制，如果支持多种后缀，通过；号分隔，如doc;pdf;rar等）',
  `SYNC_TYPE` varchar(10) DEFAULT NULL COMMENT '同步标志（同步：sync,为空表示不同步）',
  `MAX_FILE_NAME_LENGTH` int(11) NOT NULL DEFAULT '255' COMMENT '最大文件名长度,不能大于256',
  PRIMARY KEY (`ATTACH_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `mobilenum` varchar(11) NOT NULL,
  PRIMARY KEY (`mobilenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机号黑名单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_exchangeurl_info`
--

DROP TABLE IF EXISTS `c_exchangeurl_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_exchangeurl_info` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `font_title` varchar(128) NOT NULL COMMENT '兑换页面标题',
  `font_bottom` varchar(128) NOT NULL COMMENT '兑换页脚文字',
  `button_color` varchar(256) NOT NULL COMMENT '按钮颜色',
  `body_color` varchar(256) NOT NULL COMMENT '页面背景色',
  `backgroud_img_group_id` varchar(64) NOT NULL COMMENT '兑换页面背景图组ID',
  `backgroud_img` varchar(256) NOT NULL COMMENT '兑换页面背景图',
  `footer_url` varchar(512) NOT NULL COMMENT '兑换页脚文字点击链接',
  `uuid` varchar(64) NOT NULL COMMENT '兑换页对应的企业UUID',
  `redirect_url` varchar(512) NOT NULL COMMENT '兑换成功跳转URL',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) NOT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `U_1` (`customer_id`),
  CONSTRAINT `FK_Reference_34` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callback_order_info`
--

DROP TABLE IF EXISTS `callback_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callback_order_info` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码:31 上个月最后一天订单下个月发单到上游',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态:0 运营商处理中;1 待回调;2 已回调;3 无需回调',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(1024) DEFAULT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口;2 点博接口',
  `flag` varchar(5) DEFAULT NULL COMMENT '订单成功还是失败,true是成功,false是失败',
  `cp_status` varchar(5) DEFAULT NULL COMMENT '发给下游的状态,4是成功，5时失败',
  PRIMARY KEY (`order_id`),
  KEY `index_flow_app_id` (`flow_app_id`) USING BTREE COMMENT 'appid索引',
  KEY `index_apply_date` (`apply_date`) USING BTREE COMMENT '申请时间索引'
) ENGINE=InnoDB AUTO_INCREMENT=146978510398045 DEFAULT CHARSET=utf8 COMMENT='CP待回调订单信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callback_response_error`
--

DROP TABLE IF EXISTS `callback_response_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callback_response_error` (
  `gwSeqNo` varchar(64) DEFAULT NULL COMMENT '网关序列号',
  `adapterName` varchar(128) DEFAULT NULL COMMENT '适配器名',
  `status` varchar(32) DEFAULT NULL COMMENT '状态：0成功 1失败',
  `code` varchar(32) DEFAULT NULL COMMENT '上游返回的订单状态码',
  `message` varchar(512) DEFAULT NULL COMMENT '订单状态描述',
  `create_date` datetime DEFAULT NULL COMMENT '插入时间',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号码',
  KEY `Index_2` (`create_date`) USING BTREE,
  KEY `Index_1` (`gwSeqNo`,`adapterName`,`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上游回调状态错误记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_conf`
--

DROP TABLE IF EXISTS `campaign_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_conf` (
  `campaign_conf_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动配置自增序列',
  `campaign_id` bigint(20) DEFAULT NULL COMMENT '营销活动序列',
  `logo_img_id` varchar(64) NOT NULL COMMENT 'Logo图ID',
  `logo_img_url` varchar(128) NOT NULL COMMENT 'Logo图URL',
  `bg_img_id` varchar(64) NOT NULL COMMENT '背景图ID',
  `bg_img_url` varchar(128) NOT NULL COMMENT '背景图URL',
  `prize_img_id` varchar(64) DEFAULT NULL COMMENT '抽奖图ID',
  `prize_img_url` varchar(128) DEFAULT NULL COMMENT '抽奖图URL',
  `prize_img_id1` varchar(64) DEFAULT NULL COMMENT '抽奖图ID1',
  `prize_img_url1` varchar(128) DEFAULT NULL COMMENT '抽奖图URL1',
  `prize_img_id2` varchar(64) DEFAULT NULL COMMENT '抽奖图ID2',
  `prize_img_url2` varchar(128) DEFAULT NULL COMMENT '抽奖图URL2',
  `prize_img_id3` varchar(64) DEFAULT NULL COMMENT '抽奖图ID3',
  `prize_img_url3` varchar(128) DEFAULT NULL COMMENT '抽奖图URL3',
  `prize_img_id4` varchar(64) DEFAULT NULL COMMENT '抽奖图ID4',
  `prize_img_url4` varchar(128) DEFAULT NULL COMMENT '抽奖图URL4',
  `prize_btn_id1` varchar(64) DEFAULT NULL COMMENT '抽奖按钮ID1',
  `prize_btn_url1` varchar(128) DEFAULT NULL COMMENT '抽奖按钮URL1',
  `prize_btn_id2` varchar(64) DEFAULT NULL COMMENT '抽奖按钮ID1',
  `prize_btn_url2` varchar(128) DEFAULT NULL COMMENT '抽奖按钮URL1',
  `rule_desc` varchar(1024) DEFAULT NULL COMMENT '活动规则',
  `send_title` varchar(512) NOT NULL COMMENT '转发标题,模板',
  `send_content` varchar(512) DEFAULT NULL COMMENT '转发内容',
  `send_ico_id` varchar(32) DEFAULT NULL COMMENT '转发图标ID',
  `send_ico_url` varchar(512) DEFAULT NULL COMMENT '转发图标url',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `foot_txt` varchar(512) DEFAULT NULL COMMENT '页脚说明',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `tmpl_path` varchar(128) NOT NULL COMMENT '页面模板目录名',
  PRIMARY KEY (`campaign_conf_id`),
  UNIQUE KEY `U_1` (`campaign_id`),
  CONSTRAINT `FK_Reference_56` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_info` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_draw_detail`
--

DROP TABLE IF EXISTS `campaign_draw_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_draw_detail` (
  `draw_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '抽奖ID',
  `campaign_id` bigint(20) DEFAULT NULL COMMENT '营销活动序列',
  `mobile_no` varchar(18) NOT NULL COMMENT '手机号码',
  `open_id` varchar(64) NOT NULL COMMENT '微信OpenID',
  `ip` varchar(64) NOT NULL COMMENT '抽奖IP',
  `input_time` datetime NOT NULL COMMENT '抽奖时间',
  `referrer` varchar(4000) DEFAULT NULL COMMENT '来源',
  `draw_date` varchar(8) DEFAULT NULL COMMENT '抽奖日期',
  PRIMARY KEY (`draw_id`),
  KEY `Index_1` (`campaign_id`,`open_id`,`draw_date`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_info` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_gift_info`
--

DROP TABLE IF EXISTS `campaign_gift_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_gift_info` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '营销礼品ID号',
  `campaign_id` bigint(20) DEFAULT NULL COMMENT '营销活动ID号',
  `gift_type` int(11) NOT NULL COMMENT '奖品类型 1:流量包 2:流量券 3:实物',
  `gift_id` varchar(64) NOT NULL COMMENT '奖品ID',
  `gift_name` varchar(256) NOT NULL COMMENT '奖品名称',
  `num` int(11) NOT NULL COMMENT '奖品数量',
  `ratio` double NOT NULL COMMENT '奖品概率',
  `remark` varchar(512) NOT NULL COMMENT '奖品说明',
  `marked_words` varchar(1024) DEFAULT NULL COMMENT '中奖提示语',
  `price` decimal(10,2) DEFAULT NULL COMMENT '奖品价格',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `U_1` (`campaign_id`,`gift_type`,`gift_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_info` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_info`
--

DROP TABLE IF EXISTS `campaign_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_info` (
  `campaign_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '营销活动序列',
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `act_id` varchar(32) NOT NULL COMMENT '活动ID',
  `act_name` varchar(256) NOT NULL COMMENT '活动名称',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `act_type` int(11) NOT NULL COMMENT '类别 1:抽奖 2:营销',
  `status` int(11) NOT NULL COMMENT '状态 0:保存 1:有效 2:暂停 3:结束',
  `app_id` varchar(64) NOT NULL COMMENT '应用D',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `ratio` double NOT NULL COMMENT '奖品概率',
  `remark` varchar(512) NOT NULL COMMENT '备注',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `total_price` decimal(10,2) NOT NULL COMMENT '总价格',
  `is_force` int(11) NOT NULL COMMENT '是否强制关注,0:否 1:是',
  `focus_url` varchar(128) DEFAULT NULL COMMENT '关注页面地址',
  `focus_ico_id` varchar(32) DEFAULT NULL COMMENT '关注图标ID',
  `focus_ico_url` varchar(512) DEFAULT NULL COMMENT '关注图标url',
  PRIMARY KEY (`campaign_id`),
  UNIQUE KEY `U_1` (`act_id`),
  KEY `FK_Reference_49` (`flow_app_id`),
  CONSTRAINT `FK_Reference_49` FOREIGN KEY (`flow_app_id`) REFERENCES `flow_app_info` (`flow_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_reward_info`
--

DROP TABLE IF EXISTS `campaign_reward_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_reward_info` (
  `reward_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '中奖ID号',
  `campaign_id` bigint(20) DEFAULT NULL COMMENT '营销活动ID号',
  `seq_id` bigint(20) DEFAULT NULL COMMENT '营销礼品ID号',
  `mobile_no` varchar(18) NOT NULL COMMENT '手机号码',
  `open_id` varchar(64) NOT NULL COMMENT '微信OpenID',
  `union_id` varchar(256) DEFAULT NULL COMMENT '微信UnionID',
  `nick_name` varchar(256) DEFAULT NULL COMMENT '微信昵称',
  `head_img` varchar(256) DEFAULT NULL COMMENT '微信头像',
  `gift_type` int(11) NOT NULL COMMENT '奖品类型 1:流量包 2:流量券 3:实物',
  `gift_id` varchar(64) NOT NULL COMMENT '奖品ID',
  `gift_name` varchar(256) NOT NULL COMMENT '奖品名称',
  `input_time` datetime DEFAULT NULL COMMENT '获奖时间',
  `ip` varchar(64) DEFAULT NULL COMMENT '获奖IP',
  `flow_voucher_id` varchar(64) DEFAULT NULL COMMENT '本地流水号',
  `status` int(11) NOT NULL COMMENT '下发状态 0:未下发 1:下发成功 2:下发中 3:下发失败',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注说明',
  `my_greeting_id` bigint(20) DEFAULT NULL COMMENT '我的贺卡序列',
  PRIMARY KEY (`reward_id`),
  KEY `FK_Reference_17` (`seq_id`),
  KEY `Index_1` (`campaign_id`,`open_id`,`seq_id`,`input_time`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_info` (`campaign_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`seq_id`) REFERENCES `campaign_gift_info` (`seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_rule`
--

DROP TABLE IF EXISTS `campaign_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_rule` (
  `rule_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `campaign_id` bigint(20) NOT NULL COMMENT '营销活动序列',
  `prefix_condition_clazz` varchar(256) NOT NULL COMMENT '前置条件实现类，包名，备用',
  `post_condition_clazz` varchar(256) NOT NULL COMMENT '后置条件实现类，包名，备用',
  `lottery_num` int(11) NOT NULL COMMENT '一天抽奖次数',
  `win_cycle` int(11) NOT NULL COMMENT '中奖周期,单位天',
  `win_num` int(11) NOT NULL COMMENT '中奖次数',
  `gift_oneday_ratio` int(11) NOT NULL COMMENT '奖品每天比率,0-100',
  `fetch_invalid_time` int(11) NOT NULL COMMENT '领取失效时间,单位小时',
  `transmit_num` int(11) NOT NULL COMMENT '一天转发次数,超过这个数抽奖数加1',
  PRIMARY KEY (`rule_id`),
  KEY `Index_1` (`campaign_id`),
  CONSTRAINT `FK_Reference_37` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_info` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_template`
--

DROP TABLE IF EXISTS `campaign_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_template` (
  `template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) DEFAULT NULL COMMENT '营销活动序列',
  `template_name` varchar(128) NOT NULL,
  `template_path` varchar(256) NOT NULL,
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`template_id`),
  KEY `FK_Reference_39` (`campaign_id`),
  CONSTRAINT `FK_Reference_39` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_info` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_exchange_info`
--

DROP TABLE IF EXISTS `card_exchange_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_exchange_info` (
  `exchange_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '兑换记录ID',
  `my_greeting_id` bigint(20) NOT NULL COMMENT '我的贺卡序列',
  `open_id` varchar(256) NOT NULL COMMENT '微信OpenID',
  `union_id` varchar(256) NOT NULL COMMENT '微信UnionID',
  `nick_name` varchar(256) NOT NULL COMMENT '微信昵称',
  `head_img` varchar(256) NOT NULL COMMENT '微信头像',
  `product_id` bigint(32) NOT NULL COMMENT '产品ID',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `flow_amount` float NOT NULL COMMENT '流量大小,单位M',
  `exchange_time` datetime NOT NULL COMMENT '兑换时间',
  `exchange_ip` varchar(64) NOT NULL COMMENT '兑换IP',
  `exchange_status` int(11) NOT NULL COMMENT '兑换状态 0:兑换中 1:成功 2:失败',
  `user_mobile` varchar(32) NOT NULL COMMENT '兑换手机号码',
  PRIMARY KEY (`exchange_id`),
  KEY `FK_Reference_46` (`my_greeting_id`),
  CONSTRAINT `FK_Reference_46` FOREIGN KEY (`my_greeting_id`) REFERENCES `my_greeting_card` (`my_greeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_seq`
--

DROP TABLE IF EXISTS `card_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_seq` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `card_type` int(11) NOT NULL COMMENT '卡类型',
  `val` bigint(20) NOT NULL COMMENT '当前卡起始序列号',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_account_analyse`
--

DROP TABLE IF EXISTS `channel_account_analyse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_account_analyse` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(32) DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(128) DEFAULT NULL COMMENT '供应商名称',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道自增序列',
  `channel_name` varchar(128) DEFAULT NULL COMMENT '通道名称',
  `analyse_date` datetime DEFAULT NULL,
  `sent_count` int(11) DEFAULT NULL,
  `sent_origin_price` decimal(10,2) DEFAULT NULL,
  `sent_customer_price` decimal(10,2) DEFAULT NULL,
  `sent_channel_price` decimal(10,2) DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `fail_origin_price` decimal(10,2) DEFAULT NULL,
  `fail_customer_price` decimal(10,2) DEFAULT NULL,
  `fail_channel_price` decimal(10,2) DEFAULT NULL,
  `succ_count` int(11) DEFAULT NULL,
  `succ_origin_price` decimal(10,2) DEFAULT NULL,
  `succ_customer_price` decimal(10,2) DEFAULT NULL,
  `succ_channel_price` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dsc_idx` (`analyse_date`,`supplier_code`,`channel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37376 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_account_analyse_20161114`
--

DROP TABLE IF EXISTS `channel_account_analyse_20161114`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_account_analyse_20161114` (
  `id` bigint(11) NOT NULL DEFAULT '0',
  `supplier_code` varchar(32) DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(128) DEFAULT NULL COMMENT '供应商名称',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道自增序列',
  `channel_name` varchar(128) DEFAULT NULL COMMENT '通道名称',
  `analyse_date` datetime DEFAULT NULL,
  `sent_count` int(11) DEFAULT NULL,
  `sent_origin_price` decimal(10,2) DEFAULT NULL,
  `sent_customer_price` decimal(10,2) DEFAULT NULL,
  `sent_channel_price` decimal(10,2) DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `fail_origin_price` decimal(10,2) DEFAULT NULL,
  `fail_customer_price` decimal(10,2) DEFAULT NULL,
  `fail_channel_price` decimal(10,2) DEFAULT NULL,
  `succ_count` int(11) DEFAULT NULL,
  `succ_origin_price` decimal(10,2) DEFAULT NULL,
  `succ_customer_price` decimal(10,2) DEFAULT NULL,
  `succ_channel_price` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_account_analyse_bak_20161008`
--

DROP TABLE IF EXISTS `channel_account_analyse_bak_20161008`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_account_analyse_bak_20161008` (
  `id` bigint(11) NOT NULL DEFAULT '0',
  `supplier_code` varchar(32) DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(128) DEFAULT NULL COMMENT '供应商名称',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道自增序列',
  `channel_name` varchar(128) DEFAULT NULL COMMENT '通道名称',
  `analyse_date` datetime DEFAULT NULL,
  `sent_count` int(11) DEFAULT NULL,
  `sent_origin_price` decimal(10,2) DEFAULT NULL,
  `sent_customer_price` decimal(10,2) DEFAULT NULL,
  `sent_channel_price` decimal(10,2) DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `fail_origin_price` decimal(10,2) DEFAULT NULL,
  `fail_customer_price` decimal(10,2) DEFAULT NULL,
  `fail_channel_price` decimal(10,2) DEFAULT NULL,
  `succ_count` int(11) DEFAULT NULL,
  `succ_origin_price` decimal(10,2) DEFAULT NULL,
  `succ_customer_price` decimal(10,2) DEFAULT NULL,
  `succ_channel_price` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_adapter`
--

DROP TABLE IF EXISTS `channel_adapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_adapter` (
  `adapter_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '适配器ID',
  `adapter_name` varchar(256) NOT NULL COMMENT '适配器名称',
  `clazz_name` varchar(256) NOT NULL COMMENT '适配器类名',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `resend_error_code` varchar(2000) DEFAULT NULL COMMENT '可重发错误代码,多个用逗号隔开',
  `notavailable_error_code` varchar(2000) DEFAULT NULL COMMENT '不可用错误代码,多个用逗号隔开',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `user_error_code` varchar(2000) DEFAULT NULL COMMENT '用户错误代码,多个用逗号隔开',
  PRIMARY KEY (`adapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_company`
--

DROP TABLE IF EXISTS `channel_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_company` (
  `company_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公司id 自增长',
  `company_code` varchar(32) DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名字',
  `company_type` int(1) DEFAULT NULL COMMENT '供应商类型 0运营商直连 1第三方供应商',
  `company_phone` varchar(255) DEFAULT NULL COMMENT '公司联系方式',
  `company_city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `company_addr` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `contract` int(1) DEFAULT NULL COMMENT '合同 0 无 1有',
  `contract_file` varchar(255) DEFAULT NULL COMMENT '合同附件',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `bank_account` varchar(255) DEFAULT NULL COMMENT '银行账号',
  `bank_addr` varchar(255) DEFAULT NULL COMMENT '开户行',
  `bank_rate` decimal(10,2) DEFAULT NULL COMMENT '银行税率',
  `contacts_name` varchar(255) DEFAULT NULL COMMENT '联系人',
  `contacts_phone` varchar(255) DEFAULT NULL COMMENT '联系号码',
  `contacts_position` varchar(255) DEFAULT NULL COMMENT '联系人职位',
  `contacts_email` varchar(255) DEFAULT NULL COMMENT '联系人email',
  `contacts_qq` varchar(255) DEFAULT NULL COMMENT '联系人qq',
  `consume_amount` decimal(10,2) DEFAULT NULL COMMENT '累积消耗',
  `recharge_amount` decimal(10,2) DEFAULT NULL COMMENT '预留字段 -- 累积充值',
  `static_balance` decimal(10,2) DEFAULT NULL,
  `query_balance` decimal(10,2) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL COMMENT '预留字段--销售经理',
  `manager_phone` varchar(255) DEFAULT NULL COMMENT '销售经理手机',
  `status` varchar(32) DEFAULT NULL COMMENT '0 表示删除 1表示存在',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updator` varchar(255) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `contract_no` varchar(255) DEFAULT NULL COMMENT '合同编号',
  `operat_manager` varchar(64) DEFAULT NULL COMMENT '运营负责人',
  `operat_phone` varchar(64) DEFAULT NULL COMMENT '运营电话',
  `department` varchar(32) DEFAULT NULL COMMENT '所属部门',
  `is_send` int(1) DEFAULT '0' COMMENT '发送对账邮件：0 不发送；1发送',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_company_recharge_info`
--

DROP TABLE IF EXISTS `channel_company_recharge_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_company_recharge_info` (
  `company_recharge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商充值记录ID',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司id',
  `type` varchar(16) DEFAULT NULL COMMENT '交易类型：0 充值',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `login_name` varchar(32) DEFAULT NULL COMMENT '操作者',
  `operator_name` varchar(64) DEFAULT NULL COMMENT '操作者名称',
  `operate_ip` varchar(64) DEFAULT NULL COMMENT '操作者ip',
  `charge_time` datetime DEFAULT NULL COMMENT '充值时间',
  `input_time` datetime DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`company_recharge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1082 DEFAULT CHARSET=utf8 COMMENT='供应商充值记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_error_log`
--

DROP TABLE IF EXISTS `channel_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_error_log` (
  `channel_flow_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通道流水ID',
  `channel_id` varchar(32) NOT NULL COMMENT '通道ID',
  `channel_name` varchar(128) NOT NULL COMMENT '通道名称',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `error_msg` varchar(2048) NOT NULL COMMENT '错误信息',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`channel_flow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150219426672947 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_error_log_20160627`
--

DROP TABLE IF EXISTS `channel_error_log_20160627`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_error_log_20160627` (
  `channel_flow_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通道流水ID',
  `channel_id` varchar(32) NOT NULL COMMENT '通道ID',
  `channel_name` varchar(128) NOT NULL COMMENT '通道名称',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `error_msg` varchar(2048) NOT NULL COMMENT '错误信息',
  `input_time` datetime NOT NULL COMMENT '录入时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_error_log_record`
--

DROP TABLE IF EXISTS `channel_error_log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_error_log_record` (
  `channel_flow_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通道流水ID',
  `channel_id` varchar(32) NOT NULL COMMENT '通道ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `channel_name` varchar(128) NOT NULL COMMENT '通道名称',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `error_msg` varchar(2048) NOT NULL COMMENT '错误信息',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`channel_flow_id`),
  KEY `Index_1` (`channel_id`,`order_id`) USING BTREE,
  KEY `Index_2` (`input_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2756763 DEFAULT CHARSET=utf8 COMMENT='通道错误日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_flow_info`
--

DROP TABLE IF EXISTS `channel_flow_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_flow_info` (
  `channell_flow_info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通道流水信息ID',
  `channel_id` varchar(32) NOT NULL COMMENT '通道ID',
  `channel_name` varchar(128) NOT NULL COMMENT '通道名称',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `rec_id` varchar(64) NOT NULL COMMENT '下发记录ID',
  `dispatch_seq` int(11) NOT NULL COMMENT '下发序列',
  `gw_seq_no` varchar(255) DEFAULT NULL COMMENT '网关订单号',
  `gw_status` varchar(255) DEFAULT NULL COMMENT '网关状态',
  `calllback_msg` varchar(1024) DEFAULT NULL COMMENT '回调信息',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `mobile_no` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（参照运营商规格）',
  `input_time` datetime DEFAULT NULL COMMENT '录入时间',
  `check_time` datetime DEFAULT NULL COMMENT '回调时间',
  PRIMARY KEY (`channell_flow_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_group_to_group`
--

DROP TABLE IF EXISTS `channel_group_to_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_group_to_group` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `channel_group_id` bigint(20) DEFAULT NULL COMMENT '通道组ID',
  `quote_group_id` bigint(20) DEFAULT NULL COMMENT '引用的通道组ID',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_info_quarz`
--

DROP TABLE IF EXISTS `channel_info_quarz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_info_quarz` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `channel_product_seq_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `channel_seq_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL COMMENT '合作伙伴与客户间结算价格',
  `quarz_time` varchar(40) DEFAULT NULL COMMENT '定时时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0.表示未执行  1.表示已执行  (暂未使用、备用字段)',
  PRIMARY KEY (`id`),
  KEY `U_2` (`channel_product_seq_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='通道侧定时修改结算价格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_maintain_info`
--

DROP TABLE IF EXISTS `channel_maintain_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_maintain_info` (
  `maintain_seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '维护自增序列',
  `maintain_name` varchar(128) NOT NULL COMMENT '维护信息名称',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `notice` varchar(1024) NOT NULL COMMENT '维护公告',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注,预留',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 0:无效 1:有效',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `ip` varchar(32) DEFAULT NULL COMMENT '创建者IP',
  `channel_type` int(11) DEFAULT NULL COMMENT '通道类别 1:流量 2:话费',
  PRIMARY KEY (`maintain_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_product_info`
--

DROP TABLE IF EXISTS `channel_product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_product_info` (
  `channel_product_seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通道产品自增序列',
  `channel_seq_id` bigint(20) DEFAULT NULL COMMENT '通道自增序列',
  `channel_product_id` varchar(64) NOT NULL COMMENT '通道产品ID',
  `channel_product_name` varchar(128) NOT NULL COMMENT '通道产品名称',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `price` decimal(10,2) NOT NULL COMMENT '结算价格',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_valid` int(11) DEFAULT '1' COMMENT '是否有效 0:无效 1:有效',
  PRIMARY KEY (`channel_product_seq_id`),
  KEY `FK_Reference_52` (`channel_seq_id`),
  CONSTRAINT `FK_Reference_52` FOREIGN KEY (`channel_seq_id`) REFERENCES `access_channel_info` (`channel_seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13761 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_quality_quota`
--

DROP TABLE IF EXISTS `channel_quality_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_quality_quota` (
  `quota_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '指标ID',
  `quota_name` varchar(64) NOT NULL COMMENT '指标名称',
  `succ_ratio_weight` decimal(10,2) NOT NULL COMMENT '成功率比重',
  `timly_rate_weight` decimal(10,2) NOT NULL COMMENT '及时率比重',
  `price_ratio_weight` decimal(10,2) NOT NULL COMMENT '价格率比重',
  `manual_ratio_weight` decimal(10,2) NOT NULL COMMENT '人工权重率比重',
  `succ_base_line` decimal(10,2) DEFAULT NULL COMMENT '成功率基线',
  `timly_base_line` decimal(10,2) DEFAULT NULL COMMENT '及时率基线',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_supplier`
--

DROP TABLE IF EXISTS `channel_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_supplier` (
  `supplier_code` varchar(32) NOT NULL COMMENT '供应商编码',
  `supplier_name` varchar(128) DEFAULT NULL COMMENT '供应商名称',
  `link_name` varchar(64) NOT NULL COMMENT '供应商姓名',
  `adapter_name` varchar(128) DEFAULT NULL COMMENT '流量下发适配器',
  `mobile` varchar(32) NOT NULL COMMENT '供应商电话',
  `email` varchar(64) NOT NULL COMMENT '供应商邮箱',
  `address` varchar(1024) NOT NULL COMMENT '供应商地址',
  `coop_group_id` varchar(32) DEFAULT NULL COMMENT '合作协议附件组ID',
  `balance` decimal(10,2) NOT NULL COMMENT '可用余额',
  `consume_amount` decimal(10,2) NOT NULL COMMENT '累计消费',
  `recharge_amount` decimal(10,2) NOT NULL COMMENT '累计充值',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_valid` int(11) DEFAULT NULL COMMENT '是否有效 2:无效 1:有效',
  `adapter_id` bigint(20) NOT NULL COMMENT '适配器ID',
  `account` varchar(64) DEFAULT NULL COMMENT '接入帐号',
  `passwd` varchar(1024) DEFAULT NULL COMMENT '接入密码',
  `app_key` varchar(1024) DEFAULT NULL COMMENT '接入密钥',
  `make_order_url` varchar(512) DEFAULT NULL COMMENT '下单URL',
  `query_url` varchar(512) DEFAULT NULL COMMENT '查询URL',
  `ext_url` varchar(512) DEFAULT NULL COMMENT '扩展URL,备用',
  `supplier_sign` varchar(32) DEFAULT NULL COMMENT '供应商标识',
  `call_back_url` varchar(512) DEFAULT NULL COMMENT '回调URL',
  `version` varchar(64) DEFAULT NULL COMMENT '版本',
  `activity_no` varchar(128) DEFAULT NULL COMMENT '活动ID',
  `eccode` varchar(128) DEFAULT NULL COMMENT '集团代码',
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`supplier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_supplier_bak_20170310`
--

DROP TABLE IF EXISTS `channel_supplier_bak_20170310`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_supplier_bak_20170310` (
  `supplier_code` varchar(32) NOT NULL COMMENT '供应商编码',
  `supplier_name` varchar(128) DEFAULT NULL COMMENT '供应商名称',
  `link_name` varchar(64) NOT NULL COMMENT '供应商姓名',
  `adapter_name` varchar(128) DEFAULT NULL COMMENT '流量下发适配器',
  `mobile` varchar(32) NOT NULL COMMENT '供应商电话',
  `email` varchar(64) NOT NULL COMMENT '供应商邮箱',
  `address` varchar(1024) NOT NULL COMMENT '供应商地址',
  `coop_group_id` varchar(32) DEFAULT NULL COMMENT '合作协议附件组ID',
  `balance` decimal(10,2) NOT NULL COMMENT '可用余额',
  `consume_amount` decimal(10,2) NOT NULL COMMENT '累计消费',
  `recharge_amount` decimal(10,2) NOT NULL COMMENT '累计充值',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_valid` int(11) DEFAULT NULL COMMENT '是否有效 2:无效 1:有效',
  `adapter_id` bigint(20) NOT NULL COMMENT '适配器ID',
  `account` varchar(64) DEFAULT NULL COMMENT '接入帐号',
  `passwd` varchar(1024) DEFAULT NULL COMMENT '接入密码',
  `app_key` varchar(1024) DEFAULT NULL COMMENT '接入密钥',
  `make_order_url` varchar(512) DEFAULT NULL COMMENT '下单URL',
  `query_url` varchar(512) DEFAULT NULL COMMENT '查询URL',
  `ext_url` varchar(512) DEFAULT NULL COMMENT '扩展URL,备用',
  `supplier_sign` varchar(32) DEFAULT NULL COMMENT '供应商标识',
  `call_back_url` varchar(512) DEFAULT NULL COMMENT '回调URL',
  `version` varchar(64) DEFAULT NULL COMMENT '版本',
  `activity_no` varchar(128) DEFAULT NULL COMMENT '活动ID',
  `eccode` varchar(128) DEFAULT NULL COMMENT '集团代码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_supplier_recharge_info`
--

DROP TABLE IF EXISTS `channel_supplier_recharge_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_supplier_recharge_info` (
  `supplier_recharge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商充值记录ID',
  `supplier_code` varchar(32) NOT NULL COMMENT '供应商编码',
  `type` varchar(16) DEFAULT NULL COMMENT '交易类型：0 充值',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `login_name` varchar(32) DEFAULT NULL COMMENT '操作者',
  `operator_name` varchar(64) DEFAULT NULL COMMENT '操作者名称',
  `operate_ip` varchar(64) DEFAULT NULL COMMENT '操作者ip',
  `input_time` datetime DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`supplier_recharge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='供应商充值记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_to_group`
--

DROP TABLE IF EXISTS `channel_to_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_to_group` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `channel_group_id` bigint(20) DEFAULT NULL COMMENT '通道组ID',
  `channel_seq_id` bigint(20) DEFAULT NULL COMMENT '通道自增序列',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `belong_group` bigint(20) DEFAULT '0' COMMENT '属于通道组ID:0 表示不属于通道组',
  PRIMARY KEY (`seq_id`),
  KEY `FK_Reference_51` (`channel_group_id`),
  KEY `FK_Reference_53` (`channel_seq_id`),
  CONSTRAINT `FK_Reference_51` FOREIGN KEY (`channel_group_id`) REFERENCES `access_channel_group` (`channel_group_id`),
  CONSTRAINT `FK_Reference_53` FOREIGN KEY (`channel_seq_id`) REFERENCES `access_channel_info` (`channel_seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=514813 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `check_token_info`
--

DROP TABLE IF EXISTS `check_token_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_token_info` (
  `acc_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `access_key` varchar(512) NOT NULL COMMENT '登录生成的accesskey',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `token_ip` varchar(64) NOT NULL COMMENT 'IP地址',
  `is_login` varchar(10) DEFAULT NULL COMMENT '是否第一次登录',
  PRIMARY KEY (`acc_id`),
  KEY `FK_Reference_27` (`customer_id`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cp_call_back_error`
--

DROP TABLE IF EXISTS `cp_call_back_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cp_call_back_error` (
  `taskId` bigint(20) NOT NULL COMMENT '平台唯一订单号  对应flow_order_info 的orderid',
  `mobile` varchar(255) NOT NULL COMMENT '用户手机号码',
  `status` int(2) DEFAULT NULL COMMENT '返回cp状态  4.状态成功, 5.状态失败',
  `report_time` datetime DEFAULT NULL COMMENT '接收回调时间',
  `report_code` varchar(255) DEFAULT NULL COMMENT '网关状态',
  `out_trade_no` varchar(255) DEFAULT NULL COMMENT 'cp订单号',
  `flag` varchar(255) DEFAULT NULL COMMENT 'true 对应4 false 对应5',
  `creatDate` datetime DEFAULT NULL COMMENT '数据插入时间',
  PRIMARY KEY (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_account_settlement`
--

DROP TABLE IF EXISTS `customer_account_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_account_settlement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户账单结算记录',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `type` int(11) DEFAULT NULL COMMENT '类型：1 账单结算',
  `morning_balance` decimal(10,2) DEFAULT '0.00' COMMENT '凌晨余额',
  `next_morning_balance` decimal(10,2) DEFAULT '0.00' COMMENT '次日凌晨余额',
  `add_money` decimal(10,2) DEFAULT '0.00' COMMENT '加款金额',
  `withdrawal_money` decimal(10,2) DEFAULT '0.00' COMMENT '提现金额',
  `chargeback_money` decimal(10,2) DEFAULT NULL COMMENT '扣款金额',
  `refund_money` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `consume_money` decimal(10,2) DEFAULT NULL COMMENT '当天消耗金额',
  `settlement_time` datetime DEFAULT NULL COMMENT '结算时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='客户结算记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_balance_day`
--

DROP TABLE IF EXISTS `customer_balance_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_balance_day` (
  `balance_day_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '结算ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴ID',
  `balance_day` varchar(8) NOT NULL COMMENT '结算日期,格式yyyyMMdd',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `customer_amount` decimal(10,2) NOT NULL COMMENT '客户结算金额',
  `partner_amount` decimal(10,2) DEFAULT NULL COMMENT '合作伙伴结算金额',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL COMMENT '状态,0:待结 1:已结 2:结算失败',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `send_num` int(11) NOT NULL COMMENT '下发总数',
  PRIMARY KEY (`balance_day_id`),
  UNIQUE KEY `U_1` (`customer_id`,`balance_day`,`product_id`,`zone`,`status`),
  CONSTRAINT `FK_Reference_41` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152072 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_balance_day_bak20170410`
--

DROP TABLE IF EXISTS `customer_balance_day_bak20170410`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_balance_day_bak20170410` (
  `balance_day_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴ID',
  `balance_day` varchar(8) NOT NULL COMMENT '结算日期,格式yyyyMMdd',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `customer_amount` decimal(10,2) NOT NULL COMMENT '客户结算金额',
  `partner_amount` decimal(10,2) DEFAULT NULL COMMENT '合作伙伴结算金额',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL COMMENT '状态,0:待结 1:已结 2:结算失败',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `send_num` int(11) NOT NULL COMMENT '下发总数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_balance_day_ext_bak_20160816`
--

DROP TABLE IF EXISTS `customer_balance_day_ext_bak_20160816`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_balance_day_ext_bak_20160816` (
  `balance_day_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴ID',
  `balance_day` varchar(8) NOT NULL COMMENT '结算日期,格式yyyyMMdd',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `customer_amount` decimal(10,2) NOT NULL COMMENT '客户结算金额',
  `partner_amount` decimal(10,2) DEFAULT NULL COMMENT '合作伙伴结算金额',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL COMMENT '状态,0:待结 1:已结 2:结算失败',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `send_num` int(11) NOT NULL COMMENT '下发总数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_balance_daybak0921`
--

DROP TABLE IF EXISTS `customer_balance_daybak0921`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_balance_daybak0921` (
  `balance_day_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴ID',
  `balance_day` varchar(8) NOT NULL COMMENT '结算日期,格式yyyyMMdd',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `customer_amount` decimal(10,2) NOT NULL COMMENT '客户结算金额',
  `partner_amount` decimal(10,2) DEFAULT NULL COMMENT '合作伙伴结算金额',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL COMMENT '状态,0:待结 1:已结 2:结算失败',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `send_num` int(11) NOT NULL COMMENT '下发总数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_balance_month`
--

DROP TABLE IF EXISTS `customer_balance_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_balance_month` (
  `balance_month_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '结算ID',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `month` varchar(20) NOT NULL COMMENT '结算周期,yyyyMM',
  `pay_money` decimal(10,2) NOT NULL COMMENT '帐单支付金额',
  `balance_status` int(11) NOT NULL COMMENT '结算状态 0:待确认 1:已确认',
  `balance_money` decimal(10,2) NOT NULL COMMENT '结算金额',
  `adjust_money` decimal(10,2) NOT NULL COMMENT '调整金额',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `start_date` varchar(8) NOT NULL COMMENT '帐单开始时间,格式yyyyMMdd',
  `end_date` varchar(8) NOT NULL COMMENT '帐单结束时间,格式yyyyMMdd',
  PRIMARY KEY (`balance_month_id`),
  KEY `U_1` (`customer_id`,`month`),
  CONSTRAINT `FK_Reference_40` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1660 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_balance_month_bak_20160816`
--

DROP TABLE IF EXISTS `customer_balance_month_bak_20160816`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_balance_month_bak_20160816` (
  `balance_month_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算ID',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `month` varchar(20) NOT NULL COMMENT '结算周期,yyyyMM',
  `pay_money` decimal(10,2) NOT NULL COMMENT '帐单支付金额',
  `balance_status` int(11) NOT NULL COMMENT '结算状态 0:待确认 1:已确认',
  `balance_money` decimal(10,2) NOT NULL COMMENT '结算金额',
  `adjust_money` decimal(10,2) NOT NULL COMMENT '调整金额',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `start_date` varchar(8) NOT NULL COMMENT '帐单开始时间,格式yyyyMMdd',
  `end_date` varchar(8) NOT NULL COMMENT '帐单结束时间,格式yyyyMMdd'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_info` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `identity_id` varchar(32) NOT NULL COMMENT '客户身份ID',
  `partner_type` int(11) NOT NULL COMMENT '合作伙伴类型;1:流量营销 2:渠道直充',
  `customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `shorter_name` varchar(64) NOT NULL COMMENT '客户简称',
  `linkman_name` varchar(64) NOT NULL COMMENT '联系人姓名',
  `linkman_mobile` varchar(32) NOT NULL COMMENT '联系人电话',
  `linkman_email` varchar(128) NOT NULL COMMENT '联系人邮箱',
  `address` varchar(1024) NOT NULL COMMENT '联系人地址',
  `status` int(11) NOT NULL COMMENT '状态,0:待提交 1:商用２:暂停',
  `account` varchar(64) NOT NULL COMMENT '登录帐号',
  `passwd` varchar(256) NOT NULL COMMENT '登录密码,md5加密字符串',
  `svr_passwd` varchar(256) NOT NULL COMMENT '服务密码,有APP终端客户自行修改；初始密码为“888888',
  `pay_passwd` varchar(256) NOT NULL COMMENT '支付密码,渠道营销客户无此字段内容',
  `logo_group_id` varchar(64) NOT NULL COMMENT 'Logo图片组ID',
  `logo_url` varchar(512) NOT NULL COMMENT 'Logo图片URL',
  `two_code` varchar(64) NOT NULL COMMENT '二维码组ID',
  `two_code_url` varchar(1024) NOT NULL COMMENT '二维码图片URL',
  `wechat_no` varchar(64) NOT NULL COMMENT '微信号',
  `settle_price` decimal(10,2) NOT NULL COMMENT '终端结算价格,默认为产品定价，可以由直充渠道合作伙伴统一进行设置；',
  `balance` decimal(10,2) NOT NULL COMMENT '帐号余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '授信额度',
  `current_amount` decimal(10,2) DEFAULT NULL COMMENT '当前费用',
  `is_first_login` int(11) NOT NULL COMMENT '是否第一次登录,1:不是0:是',
  `is_deleted` int(11) NOT NULL COMMENT '删除标识,1:已删除0:未删除',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `customer_level` int(11) DEFAULT NULL COMMENT '客户等级',
  `balance_lack_configure` int(2) DEFAULT '1' COMMENT '客户余额不足是否收单： 0 不收单；1 收单',
  `order_risk_setting` decimal(10,2) DEFAULT NULL COMMENT '单笔订单风控设置（例如0.45表示0.45%）',
  `customer_linkman` varchar(255) DEFAULT NULL COMMENT '客户联系人',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `company_mobile` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `linkman_qq` varchar(255) DEFAULT NULL COMMENT '联系人QQ',
  `adviser_type` int(11) DEFAULT NULL COMMENT '客户类型',
  `is_send` int(1) DEFAULT '0' COMMENT '发送对账邮件：0 不发送；1发送',
  `back_cost` float(8,5) DEFAULT NULL COMMENT '返利折扣',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `U_3` (`account`),
  UNIQUE KEY `U_1` (`identity_id`),
  KEY `FK_Reference_5` (`partner_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`partner_id`) REFERENCES `partner_info` (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_info_bak20170302`
--

DROP TABLE IF EXISTS `customer_info_bak20170302`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_info_bak20170302` (
  `customer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `identity_id` varchar(32) NOT NULL COMMENT '客户身份ID',
  `partner_type` int(11) NOT NULL COMMENT '合作伙伴类型;1:流量营销 2:渠道直充',
  `customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `shorter_name` varchar(64) NOT NULL COMMENT '客户简称',
  `linkman_name` varchar(64) NOT NULL COMMENT '联系人姓名',
  `linkman_mobile` varchar(32) NOT NULL COMMENT '联系人电话',
  `linkman_email` varchar(128) NOT NULL COMMENT '联系人邮箱',
  `address` varchar(1024) NOT NULL COMMENT '联系人地址',
  `status` int(11) NOT NULL COMMENT '状态,0:待提交 1:商用２:暂停',
  `account` varchar(64) NOT NULL COMMENT '登录帐号',
  `passwd` varchar(256) NOT NULL COMMENT '登录密码,md5加密字符串',
  `svr_passwd` varchar(256) NOT NULL COMMENT '服务密码,有APP终端客户自行修改；初始密码为“888888',
  `pay_passwd` varchar(256) NOT NULL COMMENT '支付密码,渠道营销客户无此字段内容',
  `logo_group_id` varchar(64) NOT NULL COMMENT 'Logo图片组ID',
  `logo_url` varchar(512) NOT NULL COMMENT 'Logo图片URL',
  `two_code` varchar(64) NOT NULL COMMENT '二维码组ID',
  `two_code_url` varchar(1024) NOT NULL COMMENT '二维码图片URL',
  `wechat_no` varchar(64) NOT NULL COMMENT '微信号',
  `settle_price` decimal(10,2) NOT NULL COMMENT '终端结算价格,默认为产品定价，可以由直充渠道合作伙伴统一进行设置；',
  `balance` decimal(10,2) NOT NULL COMMENT '帐号余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '授信额度',
  `current_amount` decimal(10,2) DEFAULT NULL COMMENT '当前费用',
  `is_first_login` int(11) NOT NULL COMMENT '是否第一次登录,1:不是0:是',
  `is_deleted` int(11) NOT NULL COMMENT '删除标识,1:已删除0:未删除',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `customer_level` int(11) DEFAULT NULL COMMENT '客户等级',
  `balance_lack_configure` int(2) DEFAULT '1' COMMENT '客户余额不足是否收单： 0 不收单；1 收单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_info_bak20170410`
--

DROP TABLE IF EXISTS `customer_info_bak20170410`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_info_bak20170410` (
  `balance_day_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴ID',
  `balance_day` varchar(8) NOT NULL COMMENT '结算日期,格式yyyyMMdd',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `customer_amount` decimal(10,2) NOT NULL COMMENT '客户结算金额',
  `partner_amount` decimal(10,2) DEFAULT NULL COMMENT '合作伙伴结算金额',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL COMMENT '状态,0:待结 1:已结 2:结算失败',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `send_num` int(11) NOT NULL COMMENT '下发总数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_info_bak_20160630`
--

DROP TABLE IF EXISTS `customer_info_bak_20160630`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_info_bak_20160630` (
  `customer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `identity_id` varchar(32) NOT NULL COMMENT '客户身份ID',
  `partner_type` int(11) NOT NULL COMMENT '合作伙伴类型;1:流量营销 2:渠道直充',
  `customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `shorter_name` varchar(64) NOT NULL COMMENT '客户简称',
  `linkman_name` varchar(64) NOT NULL COMMENT '联系人姓名',
  `linkman_mobile` varchar(32) NOT NULL COMMENT '联系人电话',
  `linkman_email` varchar(128) NOT NULL COMMENT '联系人邮箱',
  `address` varchar(1024) NOT NULL COMMENT '联系人地址',
  `status` int(11) NOT NULL COMMENT '状态,0:待提交 1:商用２:暂停',
  `account` varchar(64) NOT NULL COMMENT '登录帐号',
  `passwd` varchar(256) NOT NULL COMMENT '登录密码,md5加密字符串',
  `svr_passwd` varchar(256) NOT NULL COMMENT '服务密码,有APP终端客户自行修改；初始密码为“888888',
  `pay_passwd` varchar(256) NOT NULL COMMENT '支付密码,渠道营销客户无此字段内容',
  `logo_group_id` varchar(64) NOT NULL COMMENT 'Logo图片组ID',
  `logo_url` varchar(512) NOT NULL COMMENT 'Logo图片URL',
  `two_code` varchar(64) NOT NULL COMMENT '二维码组ID',
  `two_code_url` varchar(1024) NOT NULL COMMENT '二维码图片URL',
  `wechat_no` varchar(64) NOT NULL COMMENT '微信号',
  `settle_price` decimal(10,2) NOT NULL COMMENT '终端结算价格,默认为产品定价，可以由直充渠道合作伙伴统一进行设置；',
  `balance` decimal(10,2) NOT NULL COMMENT '帐号余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '授信额度',
  `current_amount` decimal(10,2) DEFAULT NULL COMMENT '当前费用',
  `is_first_login` int(11) NOT NULL COMMENT '是否第一次登录,1:不是0:是',
  `is_deleted` int(11) NOT NULL COMMENT '删除标识,1:已删除0:未删除',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `customer_level` int(11) DEFAULT NULL COMMENT '客户等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_info_ext`
--

DROP TABLE IF EXISTS `customer_info_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_info_ext` (
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `adviser_name` varchar(64) NOT NULL COMMENT '合作顾问',
  `adviser_mobile` varchar(32) NOT NULL COMMENT '顾问电话',
  `custom_service_name` varchar(64) NOT NULL COMMENT '客服名称',
  `custom_service_mobile` varchar(32) NOT NULL COMMENT '联系电话',
  `other_linkman` varchar(64) DEFAULT NULL COMMENT '其它联系人',
  `other_mobile` varchar(32) DEFAULT NULL COMMENT '其它电话',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `wechat_url` varchar(255) DEFAULT NULL COMMENT 'h5页面访问地址',
  `department` varchar(32) DEFAULT NULL COMMENT '所属部门',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_info_test`
--

DROP TABLE IF EXISTS `customer_info_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_info_test` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `identity_id` varchar(32) NOT NULL COMMENT '客户身份ID',
  `partner_type` int(11) NOT NULL COMMENT '合作伙伴类型;1:流量营销 2:渠道直充',
  `customer_name` varchar(128) NOT NULL COMMENT '客户名称',
  `shorter_name` varchar(64) NOT NULL COMMENT '客户简称',
  `linkman_name` varchar(64) NOT NULL COMMENT '联系人姓名',
  `linkman_mobile` varchar(32) NOT NULL COMMENT '联系人电话',
  `linkman_email` varchar(128) NOT NULL COMMENT '联系人邮箱',
  `address` varchar(1024) NOT NULL COMMENT '联系人地址',
  `status` int(11) NOT NULL COMMENT '状态,0:待提交 1:商用２:暂停',
  `account` varchar(64) NOT NULL COMMENT '登录帐号',
  `passwd` varchar(256) NOT NULL COMMENT '登录密码,md5加密字符串',
  `svr_passwd` varchar(256) NOT NULL COMMENT '服务密码,有APP终端客户自行修改；初始密码为“888888',
  `pay_passwd` varchar(256) NOT NULL COMMENT '支付密码,渠道营销客户无此字段内容',
  `logo_group_id` varchar(64) NOT NULL COMMENT 'Logo图片组ID',
  `logo_url` varchar(512) NOT NULL COMMENT 'Logo图片URL',
  `two_code` varchar(64) NOT NULL COMMENT '二维码组ID',
  `two_code_url` varchar(1024) NOT NULL COMMENT '二维码图片URL',
  `wechat_no` varchar(64) NOT NULL COMMENT '微信号',
  `settle_price` decimal(10,2) NOT NULL COMMENT '终端结算价格,默认为产品定价，可以由直充渠道合作伙伴统一进行设置；',
  `balance` decimal(10,2) NOT NULL COMMENT '帐号余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '授信额度',
  `current_amount` decimal(10,2) DEFAULT NULL COMMENT '当前费用',
  `is_first_login` int(11) NOT NULL COMMENT '是否第一次登录,1:不是0:是',
  `is_deleted` int(11) NOT NULL COMMENT '删除标识,1:已删除0:未删除',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `customer_level` int(11) DEFAULT NULL COMMENT '客户等级',
  `balance_lack_configure` int(2) DEFAULT '1' COMMENT '客户余额不足是否收单： 0 不收单；1 收单',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `U_3` (`account`),
  UNIQUE KEY `U_1` (`identity_id`),
  KEY `FK_Reference_5` (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_recharge_info`
--

DROP TABLE IF EXISTS `customer_recharge_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_recharge_info` (
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `recharge_amount` decimal(18,2) NOT NULL COMMENT '帐号余额',
  `input_time` datetime DEFAULT NULL COMMENT '录入时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `U_1` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_recharge_log`
--

DROP TABLE IF EXISTS `customer_recharge_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_recharge_log` (
  `recharge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增字段',
  `user_id` bigint(20) NOT NULL COMMENT '用户',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `pay_status` varchar(20) NOT NULL COMMENT '状态',
  `pay_type` varchar(5) NOT NULL COMMENT '充值方式',
  `money` double NOT NULL COMMENT '充值金额',
  `pay_ip` varchar(64) NOT NULL COMMENT 'IP地址',
  `out_trade_no` varchar(128) DEFAULT NULL COMMENT '外部订单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `merchants_no` varchar(128) DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`recharge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_statistics_day`
--

DROP TABLE IF EXISTS `customer_statistics_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_statistics_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '每天统计客户账单ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `partner_name` varchar(256) DEFAULT NULL COMMENT '合作伙伴名称',
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT 'app自增长ID',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用ID',
  `app_name` varchar(128) DEFAULT NULL COMMENT '应用名称',
  `submit_num` int(11) DEFAULT '0' COMMENT '提交个数',
  `submit_original_price` decimal(10,2) DEFAULT NULL,
  `submit_discount_price` decimal(10,2) DEFAULT NULL COMMENT '折后价',
  `submit_channel_price` decimal(10,2) DEFAULT NULL COMMENT '提交成功通道价格',
  `recharge_fail_num` int(11) DEFAULT '0' COMMENT '充值失败个数',
  `recharge_fail_original_price` decimal(10,2) DEFAULT NULL COMMENT '充值失败原价',
  `recharge_fail_discount_price` decimal(10,2) DEFAULT NULL COMMENT '充值失败折后价',
  `recharge_fail_channel_price` decimal(10,2) DEFAULT NULL COMMENT '充值失败通道价格',
  `recharge_success_num` int(11) DEFAULT '0' COMMENT '充值成功个数',
  `recharge_success_original_price` decimal(10,2) DEFAULT NULL COMMENT '充值成功原价',
  `recharge_success_discount_price` decimal(10,2) DEFAULT NULL COMMENT '充值成功折后价',
  `recharge_success_channel_price` decimal(10,2) DEFAULT NULL COMMENT '充值成功通道价格',
  `profit` decimal(10,2) DEFAULT NULL COMMENT '毛利',
  `statistics_date` date DEFAULT NULL COMMENT '统计日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24673 DEFAULT CHARSET=utf8 COMMENT='每天统计客户账单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_statistics_day_20161114`
--

DROP TABLE IF EXISTS `customer_statistics_day_20161114`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_statistics_day_20161114` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '每天统计客户账单ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `partner_name` varchar(256) DEFAULT NULL COMMENT '合作伙伴名称',
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT 'app自增长ID',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用ID',
  `app_name` varchar(128) DEFAULT NULL COMMENT '应用名称',
  `submit_num` int(11) DEFAULT '0' COMMENT '提交个数',
  `submit_original_price` decimal(10,2) DEFAULT NULL,
  `submit_discount_price` decimal(10,2) DEFAULT NULL COMMENT '折后价',
  `submit_channel_price` decimal(10,2) DEFAULT NULL COMMENT '提交成功通道价格',
  `recharge_fail_num` int(11) DEFAULT '0' COMMENT '充值失败个数',
  `recharge_fail_original_price` decimal(10,2) DEFAULT NULL COMMENT '充值失败原价',
  `recharge_fail_discount_price` decimal(10,2) DEFAULT NULL COMMENT '充值失败折后价',
  `recharge_fail_channel_price` decimal(10,2) DEFAULT NULL COMMENT '充值失败通道价格',
  `recharge_success_num` int(11) DEFAULT '0' COMMENT '充值成功个数',
  `recharge_success_original_price` decimal(10,2) DEFAULT NULL COMMENT '充值成功原价',
  `recharge_success_discount_price` decimal(10,2) DEFAULT NULL COMMENT '充值成功折后价',
  `recharge_success_channel_price` decimal(10,2) DEFAULT NULL COMMENT '充值成功通道价格',
  `profit` decimal(10,2) DEFAULT NULL COMMENT '毛利',
  `statistics_date` date DEFAULT NULL COMMENT '统计日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_statistics_day_bak_20161008`
--

DROP TABLE IF EXISTS `customer_statistics_day_bak_20161008`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_statistics_day_bak_20161008` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '每天统计客户账单ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `partner_name` varchar(256) DEFAULT NULL COMMENT '合作伙伴名称',
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT 'app自增长ID',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用ID',
  `app_name` varchar(128) DEFAULT NULL COMMENT '应用名称',
  `submit_num` int(11) DEFAULT '0' COMMENT '提交个数',
  `submit_original_price` decimal(10,2) DEFAULT NULL,
  `submit_discount_price` decimal(10,2) DEFAULT NULL COMMENT '折后价',
  `submit_channel_price` decimal(10,2) DEFAULT NULL COMMENT '提交成功通道价格',
  `recharge_fail_num` int(11) DEFAULT '0' COMMENT '充值失败个数',
  `recharge_fail_original_price` decimal(10,2) DEFAULT NULL COMMENT '充值失败原价',
  `recharge_fail_discount_price` decimal(10,2) DEFAULT NULL COMMENT '充值失败折后价',
  `recharge_fail_channel_price` decimal(10,2) DEFAULT NULL COMMENT '充值失败通道价格',
  `recharge_success_num` int(11) DEFAULT '0' COMMENT '充值成功个数',
  `recharge_success_original_price` decimal(10,2) DEFAULT NULL COMMENT '充值成功原价',
  `recharge_success_discount_price` decimal(10,2) DEFAULT NULL COMMENT '充值成功折后价',
  `recharge_success_channel_price` decimal(10,2) DEFAULT NULL COMMENT '充值成功通道价格',
  `profit` decimal(10,2) DEFAULT NULL COMMENT '毛利',
  `statistics_date` date DEFAULT NULL COMMENT '统计日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_trade_flow`
--

DROP TABLE IF EXISTS `customer_trade_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_trade_flow` (
  `trade_flow_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '交易流水ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `trade_time` datetime NOT NULL COMMENT '交易日期',
  `trade_type` int(11) NOT NULL COMMENT '交易类型 1-结算 2-充值 3-授信 4-流量加激活计费 5-流量加作废计费',
  `balance` decimal(10,2) NOT NULL COMMENT '当前余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '信用额度',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易额度',
  `login_name` varchar(32) NOT NULL COMMENT '操作者',
  `operator_name` varchar(64) NOT NULL COMMENT '操作名称',
  `input_time` datetime NOT NULL COMMENT '操作时间',
  `remark` varchar(512) NOT NULL COMMENT '备注',
  `ip` varchar(64) DEFAULT NULL COMMENT '操作员ip',
  PRIMARY KEY (`trade_flow_id`),
  KEY `Index_1` (`customer_id`),
  CONSTRAINT `FK_Reference_45` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27722 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_trade_flow_bak20170410`
--

DROP TABLE IF EXISTS `customer_trade_flow_bak20170410`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_trade_flow_bak20170410` (
  `trade_flow_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易流水ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `trade_time` datetime NOT NULL COMMENT '交易日期',
  `trade_type` int(11) NOT NULL COMMENT '交易类型 1-结算 2-充值 3-授信 4-流量加激活计费 5-流量加作废计费',
  `balance` decimal(10,2) NOT NULL COMMENT '当前余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '信用额度',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易额度',
  `login_name` varchar(32) NOT NULL COMMENT '操作者',
  `operator_name` varchar(64) NOT NULL COMMENT '操作名称',
  `input_time` datetime NOT NULL COMMENT '操作时间',
  `remark` varchar(512) NOT NULL COMMENT '备注',
  `ip` varchar(64) DEFAULT NULL COMMENT '操作员ip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_trade_flowbak0302`
--

DROP TABLE IF EXISTS `customer_trade_flowbak0302`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_trade_flowbak0302` (
  `trade_flow_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易流水ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `trade_time` datetime NOT NULL COMMENT '交易日期',
  `trade_type` int(11) NOT NULL COMMENT '交易类型 1-结算 2-充值 3-授信 4-流量加激活计费 5-流量加作废计费',
  `balance` decimal(10,2) NOT NULL COMMENT '当前余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '信用额度',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易额度',
  `login_name` varchar(32) NOT NULL COMMENT '操作者',
  `operator_name` varchar(64) NOT NULL COMMENT '操作名称',
  `input_time` datetime NOT NULL COMMENT '操作时间',
  `remark` varchar(512) NOT NULL COMMENT '备注',
  `ip` varchar(64) DEFAULT NULL COMMENT '操作员ip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_trade_flowbak0921`
--

DROP TABLE IF EXISTS `customer_trade_flowbak0921`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_trade_flowbak0921` (
  `trade_flow_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易流水ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `trade_time` datetime NOT NULL COMMENT '交易日期',
  `trade_type` int(11) NOT NULL COMMENT '交易类型 1-结算 2-充值 3-授信 4-流量加激活计费 5-流量加作废计费',
  `balance` decimal(10,2) NOT NULL COMMENT '当前余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '信用额度',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易额度',
  `login_name` varchar(32) NOT NULL COMMENT '操作者',
  `operator_name` varchar(64) NOT NULL COMMENT '操作名称',
  `input_time` datetime NOT NULL COMMENT '操作时间',
  `remark` varchar(512) NOT NULL COMMENT '备注',
  `ip` varchar(64) DEFAULT NULL COMMENT '操作员ip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_upload_record`
--

DROP TABLE IF EXISTS `file_upload_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_upload_record` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件序列',
  `event_name` varchar(128) NOT NULL COMMENT '事件名称',
  `file_name` varchar(128) NOT NULL COMMENT '文件名',
  `file_group_id` varchar(32) NOT NULL COMMENT '文件组ID',
  `file_save_path` varchar(128) NOT NULL COMMENT '文件保存名称',
  `source_type` varchar(32) NOT NULL COMMENT '操作来源, 1:批量充流量 2:批量发卡密',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `row_num` int(11) NOT NULL COMMENT '记录数',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 0:无效 1:有效',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_status` int(11) DEFAULT NULL COMMENT '发送状态 0:未下发 1:下发成功 2:下发中 3:下发失败',
  `sms_content` varchar(1024) DEFAULT NULL COMMENT '短信内容模板',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_app_info`
--

DROP TABLE IF EXISTS `flow_app_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_app_info` (
  `flow_app_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '接入ID号',
  `sms_channel_id` bigint(20) DEFAULT NULL COMMENT '短信通道ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID号',
  `flow_channel_id` bigint(20) DEFAULT NULL COMMENT '流量通道ID',
  `app_id` varchar(64) NOT NULL COMMENT '应用ID',
  `app_key` varchar(128) NOT NULL COMMENT '应用Key',
  `start_date` datetime NOT NULL COMMENT '开始日期',
  `end_date` datetime NOT NULL COMMENT '结束日期',
  `status` varchar(32) NOT NULL COMMENT '1-有效 2-暂停 3-无效',
  `app_name` varchar(128) NOT NULL COMMENT 'APP名称',
  `callback_url` varchar(255) NOT NULL COMMENT '回调URL',
  `exchange_cb_url` varchar(255) NOT NULL COMMENT '兑换回调URL',
  `ip_address` varchar(512) NOT NULL COMMENT 'CPIP地址',
  `need_sms` int(11) NOT NULL COMMENT '是否需要支持短信 0不需要，1需要',
  `sms_content` varchar(512) NOT NULL COMMENT '短信内容',
  `allow_packages` varchar(512) NOT NULL COMMENT '允许接入的流量包',
  `dispatch_channel` varchar(512) NOT NULL COMMENT '流量下发通道',
  `is_resend` int(11) NOT NULL COMMENT '是否重发 0:否 1:是',
  `fail_need_sms` int(11) DEFAULT NULL COMMENT '失败是否发短信 0不需要，1需要',
  `fail_sms_content` varchar(1024) DEFAULT NULL COMMENT '失败短信模板',
  `fail_sms_channel_id` bigint(20) DEFAULT NULL COMMENT '失败短信通道ID',
  `callback_method` varchar(16) DEFAULT 'POST' COMMENT '回调方式：GET；POST',
  `resend_times` int(11) DEFAULT '0' COMMENT '重发次数',
  PRIMARY KEY (`flow_app_id`),
  UNIQUE KEY `U_2` (`app_id`),
  UNIQUE KEY `U_1` (`customer_id`,`order_id`,`app_id`),
  KEY `FK_Reference_10` (`order_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`order_id`) REFERENCES `order_info` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_app_info_0401`
--

DROP TABLE IF EXISTS `flow_app_info_0401`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_app_info_0401` (
  `flow_app_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '接入ID号',
  `sms_channel_id` bigint(20) DEFAULT NULL COMMENT '短信通道ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID号',
  `flow_channel_id` bigint(20) DEFAULT NULL COMMENT '流量通道ID',
  `app_id` varchar(64) NOT NULL COMMENT '应用ID',
  `app_key` varchar(128) NOT NULL COMMENT '应用Key',
  `start_date` datetime NOT NULL COMMENT '开始日期',
  `end_date` datetime NOT NULL COMMENT '结束日期',
  `status` varchar(32) NOT NULL COMMENT '1-有效 2-暂停 3-无效',
  `app_name` varchar(128) NOT NULL COMMENT 'APP名称',
  `callback_url` varchar(255) NOT NULL COMMENT '回调URL',
  `exchange_cb_url` varchar(255) NOT NULL COMMENT '兑换回调URL',
  `ip_address` varchar(512) NOT NULL COMMENT 'CPIP地址',
  `need_sms` int(11) NOT NULL COMMENT '是否需要支持短信 0不需要，1需要',
  `sms_content` varchar(512) NOT NULL COMMENT '短信内容',
  `allow_packages` varchar(512) NOT NULL COMMENT '允许接入的流量包',
  `dispatch_channel` varchar(512) NOT NULL COMMENT '流量下发通道',
  `is_resend` int(11) NOT NULL COMMENT '是否重发 0:否 1:是',
  `fail_need_sms` int(11) DEFAULT NULL COMMENT '失败是否发短信 0不需要，1需要',
  `fail_sms_content` varchar(1024) DEFAULT NULL COMMENT '失败短信模板',
  `fail_sms_channel_id` bigint(20) DEFAULT NULL COMMENT '失败短信通道ID',
  `callback_method` varchar(16) DEFAULT 'POST' COMMENT '回调方式：GET；POST',
  PRIMARY KEY (`flow_app_id`),
  UNIQUE KEY `U_2` (`app_id`),
  UNIQUE KEY `U_1` (`customer_id`,`order_id`,`app_id`),
  KEY `FK_Reference_10` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_batch_record`
--

DROP TABLE IF EXISTS `flow_batch_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_batch_record` (
  `flow_batch_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流量批量ID',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细ID号',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `mobile` varchar(32) NOT NULL COMMENT '兑换手机号',
  `flow_voucher_id` varchar(64) DEFAULT NULL COMMENT '本地流水号',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `status` int(11) NOT NULL COMMENT '下发状态 0:未下发 1:下发成功 2:下发中 3:下发失败',
  `settlement_price` decimal(10,2) NOT NULL COMMENT '客户销售价格',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注说明',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 0:无效 1:有效',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件序列',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `task_id` bigint(20) DEFAULT NULL COMMENT '流量下发记录ID',
  PRIMARY KEY (`flow_batch_id`),
  KEY `Index_1` (`create_time`,`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23224 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_batch_record_bak_20161121`
--

DROP TABLE IF EXISTS `flow_batch_record_bak_20161121`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_batch_record_bak_20161121` (
  `flow_batch_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '流量批量ID',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细ID号',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `mobile` varchar(32) NOT NULL COMMENT '兑换手机号',
  `flow_voucher_id` varchar(64) DEFAULT NULL COMMENT '本地流水号',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `status` int(11) NOT NULL COMMENT '下发状态 0:未下发 1:下发成功 2:下发中 3:下发失败',
  `settlement_price` decimal(10,2) NOT NULL COMMENT '客户销售价格',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注说明',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 0:无效 1:有效',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件序列',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `task_id` bigint(20) DEFAULT NULL COMMENT '流量下发记录ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_batch_record_rec`
--

DROP TABLE IF EXISTS `flow_batch_record_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_batch_record_rec` (
  `flow_batch_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流量批量ID',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细ID号',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `mobile` varchar(32) NOT NULL COMMENT '兑换手机号',
  `flow_voucher_id` varchar(64) DEFAULT NULL COMMENT '本地流水号',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `status` int(11) NOT NULL COMMENT '下发状态 0:未下发 1:下发成功 2:下发中 3:下发失败',
  `settlement_price` decimal(10,2) NOT NULL COMMENT '客户销售价格',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注说明',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 0:无效 1:有效',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件序列',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `task_id` bigint(20) DEFAULT NULL COMMENT '流量下发记录ID',
  PRIMARY KEY (`flow_batch_id`),
  KEY `Index_1` (`create_time`,`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23224 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_batch_record_rec_20161121`
--

DROP TABLE IF EXISTS `flow_batch_record_rec_20161121`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_batch_record_rec_20161121` (
  `flow_batch_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '流量批量ID',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细ID号',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `mobile` varchar(32) NOT NULL COMMENT '兑换手机号',
  `flow_voucher_id` varchar(64) DEFAULT NULL COMMENT '本地流水号',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `status` int(11) NOT NULL COMMENT '下发状态 0:未下发 1:下发成功 2:下发中 3:下发失败',
  `settlement_price` decimal(10,2) NOT NULL COMMENT '客户销售价格',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注说明',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 0:无效 1:有效',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件序列',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `task_id` bigint(20) DEFAULT NULL COMMENT '流量下发记录ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_card_batch_info`
--

DROP TABLE IF EXISTS `flow_card_batch_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_card_batch_info` (
  `batch_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '批次ID号',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `border_id` varchar(32) NOT NULL COMMENT '流水号',
  `ext_order` varchar(64) NOT NULL COMMENT 'CP流水号',
  `card_type` varchar(16) NOT NULL COMMENT '卡类型',
  `card_count` int(11) NOT NULL COMMENT '券数量',
  `create_time` datetime NOT NULL COMMENT '制卡时间',
  `create_user` varchar(32) NOT NULL COMMENT '制卡人',
  `publish_user` varchar(32) NOT NULL COMMENT '发卡人',
  `publish_time` datetime DEFAULT NULL COMMENT '发卡时间',
  `ip` varchar(64) NOT NULL COMMENT '请求ip',
  `valid_time` datetime NOT NULL COMMENT '券失效时间',
  `note` varchar(512) NOT NULL COMMENT '备用',
  `custom_id` bigint(20) NOT NULL COMMENT '客户ID',
  `card_state` int(11) NOT NULL COMMENT '卡状态,1-初始化 2-激活\n            ',
  PRIMARY KEY (`batch_id`),
  KEY `FK_Reference_33` (`order_detail_id`),
  CONSTRAINT `FK_Reference_33` FOREIGN KEY (`order_detail_id`) REFERENCES `order_detail` (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_card_info`
--

DROP TABLE IF EXISTS `flow_card_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_card_info` (
  `card_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流量加卡ID号',
  `batch_id` bigint(20) NOT NULL COMMENT '批次ID号',
  `card_no` varchar(64) NOT NULL COMMENT '卡号',
  `card_pass` varchar(128) NOT NULL COMMENT '卡密',
  `card_type` varchar(16) NOT NULL COMMENT '卡类型',
  `card_flow` float NOT NULL COMMENT '卡流量大小',
  `card_supplier` varchar(10) NOT NULL COMMENT '卡支持运营商',
  `card_state` int(11) NOT NULL COMMENT '卡状态,1-初始化 2-激活3-已兑换4-过期5-锁定6-作废\n            ',
  `card_exp` datetime NOT NULL COMMENT '卡过期时间',
  `custom_id` bigint(20) NOT NULL COMMENT '客户ID',
  `create_time` datetime NOT NULL COMMENT '制卡时间',
  `create_user` varchar(32) NOT NULL COMMENT '制卡人',
  `publish_time` datetime DEFAULT NULL COMMENT '发卡时间',
  `publish_user` varchar(32) NOT NULL COMMENT '发卡人',
  `cause` varchar(512) NOT NULL COMMENT '作废原因',
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `U_1` (`card_no`),
  UNIQUE KEY `Index_1` (`card_pass`),
  KEY `FK_Reference_32` (`batch_id`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`batch_id`) REFERENCES `flow_card_batch_info` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_card_risk`
--

DROP TABLE IF EXISTS `flow_card_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_card_risk` (
  `risk_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '兑换ID号',
  `receive_date` varchar(8) NOT NULL COMMENT '兑换日期格式yyyyMMdd',
  `mobile_no` varchar(20) NOT NULL COMMENT '兑换手机号码',
  `risk_count` int(11) NOT NULL COMMENT '兑换累计次数',
  PRIMARY KEY (`risk_id`),
  UNIQUE KEY `U_1` (`receive_date`,`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_cp_trandeno`
--

DROP TABLE IF EXISTS `flow_cp_trandeno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_cp_trandeno` (
  `flow_app_id` bigint(20) NOT NULL COMMENT '接入app自增id',
  `trandeno` varchar(64) NOT NULL COMMENT 'cp订单号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '流量分发记录ID',
  UNIQUE KEY `unique-appid-tradeno` (`flow_app_id`,`trandeno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cp订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_cp_trandeno_his_bak`
--

DROP TABLE IF EXISTS `flow_cp_trandeno_his_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_cp_trandeno_his_bak` (
  `flow_app_id` bigint(20) NOT NULL COMMENT '接入app自增id',
  `trandeno` varchar(64) NOT NULL COMMENT 'cp订单号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '流量分发记录ID',
  UNIQUE KEY `unique-appid-tradeno` (`flow_app_id`,`trandeno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cp订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_dispatch_rec`
--

DROP TABLE IF EXISTS `flow_dispatch_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_dispatch_rec` (
  `rec_id` bigint(20) NOT NULL,
  `exchange_rec_id` bigint(20) DEFAULT NULL,
  `reward_id` bigint(20) DEFAULT NULL,
  `flow_app_id` bigint(20) DEFAULT NULL,
  `mobile_no` varchar(18) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `FK_Reference_19` (`exchange_rec_id`),
  KEY `FK_Reference_20` (`reward_id`),
  KEY `FK_Reference_21` (`flow_app_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`exchange_rec_id`) REFERENCES `flow_product_exchange_rec` (`exchange_rec_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`reward_id`) REFERENCES `campaign_reward_info` (`reward_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`flow_app_id`) REFERENCES `flow_app_info` (`flow_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_exchange_log`
--

DROP TABLE IF EXISTS `flow_exchange_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_exchange_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `flow_voucher_id` varchar(64) NOT NULL COMMENT '本地流水号',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细ID号',
  `source_id` varchar(64) NOT NULL COMMENT '流量加卡ID号',
  `source_type` varchar(10) NOT NULL COMMENT '兑换类型 00-流量+ 01-卡劵 02-直充  ',
  `exchange_order_id` varchar(64) NOT NULL COMMENT '网关流水号ID',
  `mobile` varchar(32) NOT NULL COMMENT '兑换手机号',
  `product_id` bigint(32) NOT NULL COMMENT '产品ＩＤ',
  `item_count` int(11) NOT NULL COMMENT '产品数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `flag` varchar(16) NOT NULL COMMENT '状态成功　0:网关收到成功　00:成功　1:拒绝收单 其它编码表失败',
  `org_active_id` bigint(20) NOT NULL COMMENT '原始活动ＩＤ',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(64) NOT NULL COMMENT '归属地',
  PRIMARY KEY (`log_id`),
  KEY `Index_2` (`flow_voucher_id`),
  KEY `Index_1` (`exchange_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26796 DEFAULT CHARSET=utf8 COMMENT='威宇流量兑换日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_extend`
--

DROP TABLE IF EXISTS `flow_order_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_extend` (
  `flow_order_id` bigint(20) NOT NULL,
  `flow_range` int(11) DEFAULT '0' COMMENT '流量类型：0 全国流量 ；1省内流量，默认0',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`flow_order_id`),
  KEY `index_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量分发记录扩展属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info`
--

DROP TABLE IF EXISTS `flow_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(1024) DEFAULT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口',
  PRIMARY KEY (`order_id`),
  KEY `FK_Reference_36` (`package_id`),
  KEY `Index_3` (`flow_app_id`,`used_mobile`),
  KEY `Index_4` (`apply_date`),
  KEY `Index_2` (`enterprise_id`,`apply_date`,`used_mobile`) USING BTREE,
  KEY `Index_5` (`gw_seq_no`) USING BTREE,
  KEY `index_check_time_channel` (`check_time`,`channel_id`) USING BTREE,
  KEY `index_check_time_customer` (`check_time`,`enterprise_id`) USING BTREE,
  CONSTRAINT `FK_Reference_35` FOREIGN KEY (`flow_app_id`) REFERENCES `flow_app_info` (`flow_app_id`),
  CONSTRAINT `FK_Reference_36` FOREIGN KEY (`package_id`) REFERENCES `flow_package_info` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146978510398816 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_20160627`
--

DROP TABLE IF EXISTS `flow_order_info_20160627`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_20160627` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_bak`
--

DROP TABLE IF EXISTS `flow_order_info_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_bak` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口',
  PRIMARY KEY (`order_id`),
  KEY `FK_Reference_36` (`package_id`),
  KEY `Index_2` (`enterprise_id`,`used_mobile`,`apply_date`),
  KEY `Index_3` (`flow_app_id`,`used_mobile`),
  KEY `Index_4` (`apply_date`),
  KEY `flow_app_id` (`flow_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_bak_20160816`
--

DROP TABLE IF EXISTS `flow_order_info_bak_20160816`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_bak_20160816` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_exception`
--

DROP TABLE IF EXISTS `flow_order_info_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_exception` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态:0 运营商处理中;1 待回调;2 已回调;3 无需回调',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_ext`
--

DROP TABLE IF EXISTS `flow_order_info_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_ext` (
  `order_id` bigint(20) NOT NULL COMMENT '分发订单号',
  `b_order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `flow_app_id` bigint(20) NOT NULL COMMENT '接入ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_code` varchar(128) NOT NULL COMMENT '产品代码',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `status` varchar(32) NOT NULL COMMENT '订单状态,1-待发 2-已发 6-成功 4-失败 5-风控',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID号',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `used_mobile` varchar(15) NOT NULL COMMENT '使用手机号码',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(255) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  PRIMARY KEY (`order_id`),
  KEY `check_time_index` (`check_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_ext_20160627`
--

DROP TABLE IF EXISTS `flow_order_info_ext_20160627`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_ext_20160627` (
  `order_id` bigint(20) NOT NULL COMMENT '分发订单号',
  `b_order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `flow_app_id` bigint(20) NOT NULL COMMENT '接入ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_code` varchar(128) NOT NULL COMMENT '产品代码',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `status` varchar(32) NOT NULL COMMENT '订单状态,1-待发 2-已发 6-成功 4-失败 5-风控',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID号',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `used_mobile` varchar(15) NOT NULL COMMENT '使用手机号码',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(255) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_ext_20161014`
--

DROP TABLE IF EXISTS `flow_order_info_ext_20161014`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_ext_20161014` (
  `order_id` bigint(20) NOT NULL COMMENT '分发订单号',
  `b_order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `flow_app_id` bigint(20) NOT NULL COMMENT '接入ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_code` varchar(128) NOT NULL COMMENT '产品代码',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `status` varchar(32) NOT NULL COMMENT '订单状态,1-待发 2-已发 6-成功 4-失败 5-风控',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID号',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `used_mobile` varchar(15) NOT NULL COMMENT '使用手机号码',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(255) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_ext_20170410`
--

DROP TABLE IF EXISTS `flow_order_info_ext_20170410`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_ext_20170410` (
  `order_id` bigint(20) NOT NULL COMMENT '分发订单号',
  `b_order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `flow_app_id` bigint(20) NOT NULL COMMENT '接入ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_code` varchar(128) NOT NULL COMMENT '产品代码',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `status` varchar(32) NOT NULL COMMENT '订单状态,1-待发 2-已发 6-成功 4-失败 5-风控',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID号',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `used_mobile` varchar(15) NOT NULL COMMENT '使用手机号码',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(255) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  PRIMARY KEY (`order_id`),
  KEY `check_time_index` (`check_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_ext_bak_20160816`
--

DROP TABLE IF EXISTS `flow_order_info_ext_bak_20160816`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_ext_bak_20160816` (
  `order_id` bigint(20) NOT NULL COMMENT '分发订单号',
  `b_order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `flow_app_id` bigint(20) NOT NULL COMMENT '接入ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_code` varchar(128) NOT NULL COMMENT '产品代码',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `status` varchar(32) NOT NULL COMMENT '订单状态,1-待发 2-已发 6-成功 4-失败 5-风控',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID号',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `used_mobile` varchar(15) NOT NULL COMMENT '使用手机号码',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(255) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `customer_balance_price` decimal(10,2) NOT NULL COMMENT '客户结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_his`
--

DROP TABLE IF EXISTS `flow_order_info_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_his` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码:31 上个月最后一天订单下个月发单到上游',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态:0 运营商处理中;1 待回调;2 已回调;3 无需回调',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(1024) DEFAULT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146978505933515 DEFAULT CHARSET=utf8 COMMENT='流量网关流量分发历史订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_his_bak_20170411`
--

DROP TABLE IF EXISTS `flow_order_info_his_bak_20170411`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_his_bak_20170411` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码:31 上个月最后一天订单下个月发单到上游',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态:0 运营商处理中;1 待回调;2 已回调;3 无需回调',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(1024) DEFAULT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口',
  PRIMARY KEY (`order_id`),
  KEY `FK_Reference_36` (`package_id`),
  KEY `Index_2` (`enterprise_id`,`used_mobile`,`apply_date`),
  KEY `Index_3` (`flow_app_id`,`used_mobile`),
  KEY `Index_4` (`apply_date`),
  KEY `flow_app_id` (`flow_app_id`) USING BTREE,
  KEY `index_check_time_channel` (`check_time`,`channel_id`) USING BTREE,
  KEY `index_check_time_customer` (`check_time`,`enterprise_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146978495381982 DEFAULT CHARSET=utf8 COMMENT='流量网关流量分发历史订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_info_mod_bak_20160714`
--

DROP TABLE IF EXISTS `flow_order_info_mod_bak_20160714`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_info_mod_bak_20160714` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL,
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_order_refund_record`
--

DROP TABLE IF EXISTS `flow_order_refund_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_order_refund_record` (
  `refund_record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '退款记录ID',
  `order_id` bigint(20) NOT NULL COMMENT '分发订单号',
  `refund_time` datetime NOT NULL COMMENT '退款时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注说明',
  `input_by` varchar(64) NOT NULL COMMENT '操作者',
  `refund_type` varchar(8) DEFAULT NULL COMMENT '退款选项：1、退款 2、上游已退款 3、 上游无需退款',
  PRIMARY KEY (`refund_record_id`),
  UNIQUE KEY `U_1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8041 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_package_info`
--

DROP TABLE IF EXISTS `flow_package_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_package_info` (
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `package_name` varchar(256) NOT NULL COMMENT '流量包名称',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `opr_package_id` varchar(128) DEFAULT NULL COMMENT '用于BOSS接口下发',
  `adaptor` varchar(64) DEFAULT NULL COMMENT '通过流量包ID用于查找实施的适配器',
  `active_period` int(11) NOT NULL COMMENT '单位为天,0为无限期',
  `flow_amount` float NOT NULL COMMENT '流量大小,单位M',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `combo_package_str` varchar(512) DEFAULT NULL COMMENT '多个以逗号隔开',
  `is_combo` varchar(512) DEFAULT NULL COMMENT '0-基础包  1－组合包',
  `sale_price` decimal(10,2) NOT NULL COMMENT '标准销售价格',
  `cost_price` decimal(10,2) NOT NULL COMMENT '标准成本价格',
  `remark` varchar(1024) NOT NULL COMMENT '备注说明',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 0:有效 1:无效',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `package_type` int(11) NOT NULL COMMENT '流量包种类 1:叠加包 2:前向包 3:红包',
  `package_desc` varchar(128) DEFAULT NULL COMMENT '流量包种类描述',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_plus_product`
--

DROP TABLE IF EXISTS `flow_plus_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_plus_product` (
  `product_plus_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流量加产品ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `card_type` varchar(10) NOT NULL COMMENT '卡类别;A、B、C三种类别',
  `channel_type` varchar(10) NOT NULL COMMENT '流量载体;1:实体卡 2:电子券',
  PRIMARY KEY (`product_plus_id`),
  KEY `FK_Reference_28` (`product_id`),
  CONSTRAINT `FK_Reference_28` FOREIGN KEY (`product_id`) REFERENCES `flow_product_info` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_product_exchange_rec`
--

DROP TABLE IF EXISTS `flow_product_exchange_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_product_exchange_rec` (
  `exchange_rec_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '兑换ID号',
  `card_id` bigint(20) NOT NULL COMMENT '流量加卡ID号',
  `order_id` varchar(32) NOT NULL COMMENT '流水号',
  `ext_order` varchar(64) NOT NULL COMMENT 'CP流水号',
  `mobile_no` varchar(18) NOT NULL COMMENT '兑换手机号码',
  `log_time` datetime NOT NULL COMMENT '兑换时间',
  `user_id` varchar(64) NOT NULL COMMENT '兑换用户ID',
  `card_no` varchar(20) NOT NULL COMMENT '兑换卡号',
  `card_pass` varchar(30) NOT NULL COMMENT '兑换卡密',
  `card_flow` float NOT NULL COMMENT '卡流量大小',
  `card_supplier` varchar(10) NOT NULL COMMENT '卡支持运营商',
  `receive_ip` varchar(32) NOT NULL COMMENT '兑换IP',
  `is_notify` int(11) DEFAULT NULL COMMENT '是否通知 0-未通知 1-已通知',
  PRIMARY KEY (`exchange_rec_id`),
  KEY `FK_Reference_18` (`card_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`card_id`) REFERENCES `flow_card_info` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_product_info`
--

DROP TABLE IF EXISTS `flow_product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_product_info` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品ID号',
  `package_id` varchar(64) DEFAULT NULL COMMENT '流量包ID',
  `product_code` varchar(128) NOT NULL COMMENT '产品代码',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `product_type` int(11) NOT NULL COMMENT '产品类别;1:基础流量包 2:组合流量包 3:流量加',
  `product_price` decimal(10,2) NOT NULL COMMENT '产品定价',
  `product_belong_to` varchar(128) NOT NULL COMMENT '产品归属,为空表所有，否则合伴伙伴ID',
  `product_desc` varchar(1024) NOT NULL COMMENT '产品描述',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `U_1` (`product_code`),
  UNIQUE KEY `U_2` (`product_name`),
  KEY `U_3` (`package_id`,`zone`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`package_id`) REFERENCES `flow_package_info` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=850 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_product_info_20160629`
--

DROP TABLE IF EXISTS `flow_product_info_20160629`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_product_info_20160629` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品ID号',
  `package_id` varchar(64) DEFAULT NULL COMMENT '流量包ID',
  `product_code` varchar(128) NOT NULL COMMENT '产品代码',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `product_type` int(11) NOT NULL COMMENT '产品类别;1:基础流量包 2:组合流量包 3:流量加',
  `product_price` decimal(10,2) NOT NULL COMMENT '产品定价',
  `product_belong_to` varchar(128) NOT NULL COMMENT '产品归属,为空表所有，否则合伴伙伴ID',
  `product_desc` varchar(1024) NOT NULL COMMENT '产品描述',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `U_1` (`product_code`),
  UNIQUE KEY `U_2` (`product_name`),
  KEY `U_3` (`package_id`,`zone`),
  CONSTRAINT `flow_product_info_20160629_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `flow_package_info` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=635 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_product_rule`
--

DROP TABLE IF EXISTS `flow_product_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_product_rule` (
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `sub_package_id` varchar(64) NOT NULL COMMENT '子流量包ID',
  `exchange_ratio` int(11) NOT NULL COMMENT '兑换比例',
  `remark` varchar(512) NOT NULL COMMENT '备注',
  `reserve` varchar(512) NOT NULL COMMENT '备用字段',
  KEY `U_1` (`package_id`,`sub_package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_resend_order_info`
--

DROP TABLE IF EXISTS `flow_resend_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_resend_order_info` (
  `flow_app_id` bigint(20) DEFAULT NULL COMMENT '接入ID号',
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分发订单号',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID号',
  `enterprise_id` bigint(20) NOT NULL COMMENT '企业ID号',
  `order_type` varchar(10) NOT NULL COMMENT '1--直接生成流量  2--使用类型订单',
  `user` varchar(32) NOT NULL DEFAULT '' COMMENT '订单用户',
  `used_mobile` varchar(15) DEFAULT NULL COMMENT '使用手机号码',
  `extorder_id` varchar(128) DEFAULT NULL COMMENT 'CP订单号',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `active_date` datetime DEFAULT NULL COMMENT '激活日期',
  `limited_date` datetime NOT NULL COMMENT '过期日期',
  `status` varchar(32) NOT NULL COMMENT '1-待发 2-已发 6-成功 4-失败 5-风控',
  `note` varchar(256) DEFAULT NULL COMMENT '订单备注',
  `mobile_operator` varchar(32) NOT NULL COMMENT '归属运营商',
  `mobile_home` varchar(32) NOT NULL COMMENT '归属地市',
  `gw_seq_no` varchar(255) NOT NULL COMMENT '网关序号',
  `gw_status` varchar(1024) NOT NULL COMMENT '网关状态',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `gw_error_code` varchar(255) NOT NULL COMMENT '网关错误代码',
  `flow_amount` float NOT NULL COMMENT '流量大小',
  `adapter_name` varchar(128) NOT NULL COMMENT '流量下发适配器',
  `deal_flag` bigint(20) DEFAULT NULL COMMENT '回调状态，1、待回调，2、已回调',
  `opr_code` varchar(255) NOT NULL,
  `usage_limit` varchar(255) NOT NULL COMMENT '下游响应',
  `valid_months` varchar(255) NOT NULL,
  `eff_rule` varchar(512) NOT NULL COMMENT '推送下游内容',
  `batch_count` int(11) NOT NULL COMMENT '分批次下发',
  `area_code` varchar(10) NOT NULL COMMENT '归属地编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价格',
  `partner_balance_price` decimal(10,2) NOT NULL COMMENT '合作伙伴结算价格',
  `operator_balance_price` decimal(10,2) NOT NULL COMMENT '运营商结算价格',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细ID号',
  `channel_id` varchar(32) DEFAULT NULL COMMENT '通道ID',
  `check_time` datetime DEFAULT NULL COMMENT '结算日期',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID号',
  `order_source` int(2) DEFAULT '0' COMMENT '订单来源：0 冠游接口；1 云之讯接口',
  `rec_id` varchar(100) DEFAULT NULL COMMENT '下发单号',
  `old_order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_Reference_36` (`package_id`) USING BTREE,
  KEY `Index_2` (`enterprise_id`,`used_mobile`,`apply_date`) USING BTREE,
  KEY `Index_3` (`flow_app_id`,`used_mobile`) USING BTREE,
  KEY `Index_4` (`apply_date`) USING BTREE,
  KEY `U_1` (`flow_app_id`,`extorder_id`) USING BTREE,
  KEY `old_order_id` (`old_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201708082000108738 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_warn_conf`
--

DROP TABLE IF EXISTS `flow_warn_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_warn_conf` (
  `warn_conf_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '告警配置ID',
  `warn_type` int(11) NOT NULL COMMENT '告警类别 1:待发 2:已发 3:失败',
  `fail_num` int(11) NOT NULL COMMENT '失败条数',
  `fail_interval_min` int(11) NOT NULL COMMENT '多久间隔时间内',
  `is_valid` int(11) NOT NULL COMMENT '是否有效 1:有效 2:无效',
  `notify_llist` varchar(2000) DEFAULT NULL COMMENT '通知名单,多个用逗号隔开',
  `notify_template` varchar(2000) DEFAULT NULL COMMENT '通知内容模板',
  `notify_interval_min` int(11) NOT NULL COMMENT '通知间隔时间',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_month_last_two_day_notify` int(11) NOT NULL COMMENT '是否每月最后两天不通知1 :通知 2:不通知',
  `notify_time_quantum` varchar(128) DEFAULT NULL COMMENT '通知时间段,比如:9-18为9点至18点',
  PRIMARY KEY (`warn_conf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_warn_msg`
--

DROP TABLE IF EXISTS `flow_warn_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_warn_msg` (
  `warn_msg_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '告警信息ID',
  `warn_type` int(11) NOT NULL COMMENT '告警类别 1:待发 2:已发 3:失败',
  `notify_user` varchar(256) NOT NULL COMMENT '通知用户',
  `notify_msg` varchar(2000) NOT NULL COMMENT '通知信息',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`warn_msg_id`),
  KEY `U_1` (`warn_type`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2901 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_wx_order_info`
--

DROP TABLE IF EXISTS `flow_wx_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_wx_order_info` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单号ID',
  `mobile` varchar(32) DEFAULT NULL COMMENT '充值手机号码',
  `openid` varchar(64) DEFAULT NULL COMMENT '用户对应的openid',
  `product_id` varchar(32) DEFAULT NULL COMMENT '产品ID',
  `package_id` varchar(64) DEFAULT NULL COMMENT '流量包ID',
  `flow_amout` float DEFAULT NULL COMMENT '流量包大小',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `state` varchar(2) DEFAULT NULL COMMENT '订单状态：0 未付款；1：已付款；2：用户取消；3：失败;4：已提交订单到流量平台；5：充值失败；6：充值成功',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `transaction_id` varchar(32) DEFAULT NULL COMMENT '微信订单号',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `flow_order_id` varchar(32) DEFAULT NULL COMMENT '流量平台订单ID',
  `rechage_time` datetime DEFAULT NULL,
  `account` varchar(100) DEFAULT NULL COMMENT '客户账户',
  `flow_range` varchar(255) DEFAULT NULL COMMENT '0 全国 1省内',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001051 DEFAULT CHARSET=utf8 COMMENT='流量充值微信订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flow_wx_refund_record`
--

DROP TABLE IF EXISTS `flow_wx_refund_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_wx_refund_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '微信退款记录ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `state` varchar(2) DEFAULT NULL COMMENT '退款状态：0 退款成功；1退款失败',
  `refund_id` varchar(32) DEFAULT NULL COMMENT '微信退款单号',
  `refund_fee` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='微信H5流量充值退款记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `greeting_card_act`
--

DROP TABLE IF EXISTS `greeting_card_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greeting_card_act` (
  `greeting_card_act_seq` bigint(20) NOT NULL COMMENT '贺卡活动序列',
  `card_act_id` varchar(64) NOT NULL COMMENT '贺卡活动ID',
  `card_act_name` varchar(128) NOT NULL COMMENT '贺卡活动名称',
  `card_type` varchar(60) NOT NULL COMMENT '类别',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `bg_img1_id` varchar(64) DEFAULT NULL COMMENT '背景图ID1',
  `bg_img1_url` varchar(128) DEFAULT NULL COMMENT '背景图URL1',
  `bg_img1_id2` varchar(64) DEFAULT NULL COMMENT '背景图ID2',
  `bg_img1_url2` varchar(128) DEFAULT NULL COMMENT '背景图URL2',
  `tmpl_path` varchar(128) NOT NULL COMMENT '页面模板目录名',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) NOT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_auth` int(11) NOT NULL COMMENT '是否转授权 0:否 1:是',
  `open_url` varchar(128) DEFAULT NULL COMMENT '转授权Open地址',
  `api_url` varchar(128) DEFAULT NULL COMMENT '转授权API地址',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注说明',
  `focus_url` varchar(128) DEFAULT NULL COMMENT '关注页面地址',
  `foot_txt` varchar(512) DEFAULT NULL COMMENT '底部文本',
  `sublicense_url` varchar(128) DEFAULT NULL COMMENT '微信转授权的回调跳转 url',
  `wx_config_customer_id` bigint(20) DEFAULT NULL COMMENT '微信支付配置客户id',
  `is_force` int(11) NOT NULL COMMENT '是否强制关注,0:否 1:是',
  PRIMARY KEY (`greeting_card_act_seq`),
  UNIQUE KEY `U_1` (`card_act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `greeting_card_info`
--

DROP TABLE IF EXISTS `greeting_card_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greeting_card_info` (
  `greeting_card_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '贺卡ID',
  `campaign_id` bigint(20) NOT NULL COMMENT '营销活动序列',
  `greeting_card_act_seq` bigint(20) DEFAULT NULL COMMENT '贺卡活动序列',
  `card_name` varchar(128) NOT NULL COMMENT '贺卡名称',
  `card_type` varchar(60) NOT NULL COMMENT '类别',
  `price` decimal(10,2) NOT NULL COMMENT '销售价格',
  `flow_amount` float NOT NULL COMMENT '流量大小,单位M',
  `pic_id` varchar(32) NOT NULL COMMENT '背景图ID',
  `pic_url` varchar(512) NOT NULL COMMENT '背景图url',
  `pic_id2` varchar(32) NOT NULL COMMENT '背景图ID',
  `pic_url2` varchar(512) NOT NULL COMMENT '背景图url',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_pay` int(11) NOT NULL COMMENT '是否收费',
  `is_force` int(11) DEFAULT NULL COMMENT '是否强制关注 0:否 1:是',
  `title` varchar(512) NOT NULL COMMENT '转发标题,模板',
  `send_content` varchar(512) DEFAULT NULL COMMENT '转发内容',
  `send_ico_id` varchar(32) DEFAULT NULL COMMENT '转发图标ID',
  `send_ico_url` varchar(512) DEFAULT NULL COMMENT '转发图标url',
  PRIMARY KEY (`greeting_card_id`),
  UNIQUE KEY `U_1` (`campaign_id`),
  KEY `FK_Reference_50` (`greeting_card_act_seq`),
  CONSTRAINT `FK_Reference_47` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_info` (`campaign_id`),
  CONSTRAINT `FK_Reference_50` FOREIGN KEY (`greeting_card_act_seq`) REFERENCES `greeting_card_act` (`greeting_card_act_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `greeting_info`
--

DROP TABLE IF EXISTS `greeting_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greeting_info` (
  `greeting_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '祝福语ID',
  `greeting_type` varchar(60) NOT NULL COMMENT '类别',
  `content` varchar(1024) NOT NULL COMMENT '内容',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`greeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gw_callback_record`
--

DROP TABLE IF EXISTS `gw_callback_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gw_callback_record` (
  `gw_callback_record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '网关回调记录ID',
  `order_id` bigint(20) NOT NULL COMMENT '分发订单号',
  `deal_flag` bigint(20) NOT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL COMMENT '回调返回码',
  `usage_limit` varchar(2000) DEFAULT NULL COMMENT '回调返回内容',
  `eff_rule` varchar(2000) NOT NULL COMMENT '回调请求内容',
  `num` int(11) NOT NULL COMMENT '回调次数',
  `next_cb_time` datetime DEFAULT NULL COMMENT '下次回调时间',
  `first_cb_time` datetime DEFAULT NULL COMMENT '第一次回调时间',
  `last_cb_time` datetime DEFAULT NULL COMMENT '最近回调时间',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`gw_callback_record_id`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29909995 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gw_callback_record_20160627`
--

DROP TABLE IF EXISTS `gw_callback_record_20160627`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gw_callback_record_20160627` (
  `gw_callback_record_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '网关回调记录ID',
  `order_id` bigint(20) NOT NULL COMMENT '分发订单号',
  `deal_flag` bigint(20) NOT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL COMMENT '回调返回码',
  `usage_limit` varchar(2000) DEFAULT NULL COMMENT '回调返回内容',
  `eff_rule` varchar(2000) NOT NULL COMMENT '回调请求内容',
  `num` int(11) NOT NULL COMMENT '回调次数',
  `next_cb_time` datetime DEFAULT NULL COMMENT '下次回调时间',
  `first_cb_time` datetime DEFAULT NULL COMMENT '第一次回调时间',
  `last_cb_time` datetime DEFAULT NULL COMMENT '最近回调时间',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gw_callback_record_his_bak`
--

DROP TABLE IF EXISTS `gw_callback_record_his_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gw_callback_record_his_bak` (
  `gw_callback_record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '网关回调记录ID',
  `order_id` bigint(20) NOT NULL COMMENT '分发订单号',
  `deal_flag` bigint(20) NOT NULL COMMENT '回调状态',
  `opr_code` varchar(255) NOT NULL COMMENT '回调返回码',
  `usage_limit` varchar(2000) DEFAULT NULL COMMENT '回调返回内容',
  `eff_rule` varchar(2000) NOT NULL COMMENT '回调请求内容',
  `num` int(11) NOT NULL COMMENT '回调次数',
  `next_cb_time` datetime DEFAULT NULL COMMENT '下次回调时间',
  `first_cb_time` datetime DEFAULT NULL COMMENT '第一次回调时间',
  `last_cb_time` datetime DEFAULT NULL COMMENT '最近回调时间',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`gw_callback_record_id`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15166553 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internet_of_things_card`
--

DROP TABLE IF EXISTS `internet_of_things_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internet_of_things_card` (
  `card_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物联网卡ID',
  `card_no` varchar(128) NOT NULL COMMENT '物联网卡串号',
  `mobile` varchar(32) NOT NULL COMMENT '手机号',
  `auth_mobile` varchar(32) DEFAULT NULL COMMENT '认证手机号',
  `status` int(11) NOT NULL COMMENT '状态',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `tariff_package` varchar(128) DEFAULT NULL COMMENT '资费套餐',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jh_card_exchange_record`
--

DROP TABLE IF EXISTS `jh_card_exchange_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_card_exchange_record` (
  `card_exchange_record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '卡密兑换记录ID',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `card_no` varchar(64) NOT NULL COMMENT '卡密',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `exchange_time` datetime DEFAULT NULL COMMENT '兑换时间',
  `card_status` int(11) NOT NULL COMMENT '状态 0:初始 1:有效 2:无效 3:已兑换',
  `req_ip` varchar(64) DEFAULT NULL COMMENT '请求IP',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`card_exchange_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='20160421:建行特殊需求，收集手机号码和卡密，人工匹对卡密下发流量';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_record_info`
--

DROP TABLE IF EXISTS `log_record_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_record_info` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `operate_id` bigint(20) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL COMMENT '操作人登录名',
  `operate_name` varchar(255) DEFAULT NULL COMMENT '操作人',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `parameters` varchar(1024) DEFAULT NULL COMMENT '参数',
  `signature_name` varchar(255) DEFAULT NULL COMMENT '方法签名',
  `declaring_type_name` varchar(255) DEFAULT NULL COMMENT '类名',
  `operate` varchar(255) DEFAULT NULL COMMENT '操作',
  `operate_type` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `ip` varchar(64) DEFAULT NULL,
  `ex1` varchar(255) DEFAULT NULL,
  `ex2` varchar(255) DEFAULT NULL,
  `ex3` varchar(255) DEFAULT NULL,
  `ex4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34751 DEFAULT CHARSET=utf8 COMMENT='日志记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_ver`
--

DROP TABLE IF EXISTS `message_ver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_ver` (
  `msgvar_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_phone` varchar(20) NOT NULL COMMENT '手机号码',
  `verify_code` varchar(6) NOT NULL COMMENT '6位验证码',
  `expire_date` datetime NOT NULL COMMENT '时间(默认时间为10分钟)',
  `is_bit` int(11) NOT NULL COMMENT '标示是否验证成功 0:初始化 1:成功 2:失败',
  `msg_type` int(11) NOT NULL COMMENT '类型(暂时区分 1、登录、2、找回密码)',
  PRIMARY KEY (`msgvar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `method_statistic`
--

DROP TABLE IF EXISTS `method_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `method_statistic` (
  `dictionary_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `signature_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `declaring_type_name` varchar(255) DEFAULT NULL COMMENT '类名',
  `operate_type` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `method_describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `ex1` varchar(255) DEFAULT NULL,
  `ex2` varchar(255) DEFAULT NULL,
  `ex3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dictionary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='日志操作字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_flow_dispatch_rec`
--

DROP TABLE IF EXISTS `mobile_flow_dispatch_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_flow_dispatch_rec` (
  `rec_id` varchar(64) NOT NULL COMMENT '下发记录ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '分发订单号',
  `mobile_no` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（参照运营商规格）',
  `foss_package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（foss平台）',
  `flow_amount` float DEFAULT NULL COMMENT '流量大小',
  `send_count` int(11) DEFAULT '0' COMMENT '下发次数',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `last_send_date` datetime NOT NULL COMMENT '最后提交发送的时间',
  `next_send_date` datetime DEFAULT NULL COMMENT '下次发送时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `send_status` varchar(255) DEFAULT NULL COMMENT '发送状态：0-待发 1-已发 2-成功 3-重发 4-失败',
  `gw_seq_no` varchar(255) DEFAULT NULL COMMENT '网关订单号',
  `gw_status` varchar(255) DEFAULT NULL COMMENT '网关状态',
  `gw_error_code` varchar(255) DEFAULT NULL COMMENT '网关错误代码',
  `gw_error_msg` varchar(1024) DEFAULT NULL COMMENT '网关错误信息',
  `adapter_name` varchar(255) DEFAULT NULL COMMENT '适配器',
  `mobile_home` varchar(32) DEFAULT NULL COMMENT '归属地市',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用ID',
  `trans_id` varchar(128) DEFAULT NULL COMMENT 'trans_id',
  `last_callback_msg` varchar(2048) DEFAULT NULL COMMENT '最后回调信息',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  PRIMARY KEY (`rec_id`),
  KEY `Index_1` (`order_id`,`app_id`,`foss_package_id`),
  KEY `Index_3` (`mobile_no`,`create_date`,`send_status`),
  KEY `Index_2` (`gw_seq_no`,`mobile_no`) USING BTREE,
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`order_id`) REFERENCES `flow_order_info` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_flow_dispatch_rec_20160627`
--

DROP TABLE IF EXISTS `mobile_flow_dispatch_rec_20160627`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_flow_dispatch_rec_20160627` (
  `rec_id` varchar(64) NOT NULL COMMENT '下发记录ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '分发订单号',
  `mobile_no` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（参照运营商规格）',
  `foss_package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（foss平台）',
  `flow_amount` float DEFAULT NULL COMMENT '流量大小',
  `send_count` int(11) DEFAULT '0' COMMENT '下发次数',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `last_send_date` datetime NOT NULL COMMENT '最后提交发送的时间',
  `next_send_date` datetime DEFAULT NULL COMMENT '下次发送时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `send_status` varchar(255) DEFAULT NULL COMMENT '发送状态：0-待发 1-已发 2-成功 3-重发 4-失败',
  `gw_seq_no` varchar(255) DEFAULT NULL COMMENT '网关订单号',
  `gw_status` varchar(255) DEFAULT NULL COMMENT '网关状态',
  `gw_error_code` varchar(255) DEFAULT NULL COMMENT '网关错误代码',
  `gw_error_msg` varchar(1024) DEFAULT NULL COMMENT '网关错误信息',
  `adapter_name` varchar(255) DEFAULT NULL COMMENT '适配器',
  `mobile_home` varchar(32) DEFAULT NULL COMMENT '归属地市',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用ID',
  `trans_id` varchar(128) DEFAULT NULL COMMENT 'trans_id',
  `last_callback_msg` varchar(2048) DEFAULT NULL COMMENT '最后回调信息',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_flow_dispatch_rec_his`
--

DROP TABLE IF EXISTS `mobile_flow_dispatch_rec_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_flow_dispatch_rec_his` (
  `rec_id` varchar(64) NOT NULL COMMENT '下发记录ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '分发订单号',
  `mobile_no` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（参照运营商规格）',
  `foss_package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（foss平台）',
  `flow_amount` float DEFAULT NULL COMMENT '流量大小',
  `send_count` int(11) DEFAULT '0' COMMENT '下发次数',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `last_send_date` datetime NOT NULL COMMENT '最后提交发送的时间',
  `next_send_date` datetime DEFAULT NULL COMMENT '下次发送时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `send_status` varchar(255) DEFAULT NULL COMMENT '发送状态：0-待发 1-已发 2-成功 3-重发 4-失败',
  `gw_seq_no` varchar(255) DEFAULT NULL COMMENT '网关订单号',
  `gw_status` varchar(255) DEFAULT NULL COMMENT '网关状态',
  `gw_error_code` varchar(255) DEFAULT NULL COMMENT '网关错误代码',
  `gw_error_msg` varchar(1024) DEFAULT NULL COMMENT '网关错误信息',
  `adapter_name` varchar(255) DEFAULT NULL COMMENT '适配器',
  `mobile_home` varchar(32) DEFAULT NULL COMMENT '归属地市',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用ID',
  `trans_id` varchar(128) DEFAULT NULL COMMENT 'trans_id',
  `last_callback_msg` varchar(2048) DEFAULT NULL COMMENT '最后回调信息',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机流量下发历史记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_flow_dispatch_rec_his_bak_20170411`
--

DROP TABLE IF EXISTS `mobile_flow_dispatch_rec_his_bak_20170411`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_flow_dispatch_rec_his_bak_20170411` (
  `rec_id` varchar(64) NOT NULL COMMENT '下发记录ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '分发订单号',
  `mobile_no` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（参照运营商规格）',
  `foss_package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（foss平台）',
  `flow_amount` float DEFAULT NULL COMMENT '流量大小',
  `send_count` int(11) DEFAULT '0' COMMENT '下发次数',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `last_send_date` datetime NOT NULL COMMENT '最后提交发送的时间',
  `next_send_date` datetime DEFAULT NULL COMMENT '下次发送时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `send_status` varchar(255) DEFAULT NULL COMMENT '发送状态：0-待发 1-已发 2-成功 3-重发 4-失败',
  `gw_seq_no` varchar(255) DEFAULT NULL COMMENT '网关订单号',
  `gw_status` varchar(255) DEFAULT NULL COMMENT '网关状态',
  `gw_error_code` varchar(255) DEFAULT NULL COMMENT '网关错误代码',
  `gw_error_msg` varchar(1024) DEFAULT NULL COMMENT '网关错误信息',
  `adapter_name` varchar(255) DEFAULT NULL COMMENT '适配器',
  `mobile_home` varchar(32) DEFAULT NULL COMMENT '归属地市',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用ID',
  `trans_id` varchar(128) DEFAULT NULL COMMENT 'trans_id',
  `last_callback_msg` varchar(2048) DEFAULT NULL COMMENT '最后回调信息',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  PRIMARY KEY (`rec_id`),
  KEY `Index_1` (`order_id`,`app_id`,`foss_package_id`),
  KEY `Index_2` (`mobile_no`,`gw_seq_no`),
  KEY `Index_3` (`mobile_no`,`create_date`,`send_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机流量下发历史记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_flow_disptach_monitor`
--

DROP TABLE IF EXISTS `mobile_flow_disptach_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_flow_disptach_monitor` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `mobile_no` varchar(255) NOT NULL COMMENT '手机号码',
  `operatorCN` varchar(255) NOT NULL COMMENT '运营商',
  `area` varchar(255) DEFAULT NULL COMMENT '地区',
  `total_amount` float NOT NULL DEFAULT '0' COMMENT '总流量',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总次数',
  `create_date` datetime NOT NULL COMMENT '记录日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2536118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_flow_disptach_monitor_20160627`
--

DROP TABLE IF EXISTS `mobile_flow_disptach_monitor_20160627`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_flow_disptach_monitor_20160627` (
  `seq_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '序号',
  `mobile_no` varchar(255) NOT NULL COMMENT '手机号码',
  `operatorCN` varchar(255) NOT NULL COMMENT '运营商',
  `area` varchar(255) DEFAULT NULL COMMENT '地区',
  `total_amount` float NOT NULL DEFAULT '0' COMMENT '总流量',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总次数',
  `create_date` datetime NOT NULL COMMENT '记录日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_home_info`
--

DROP TABLE IF EXISTS `mobile_home_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_home_info` (
  `mobile_no` varchar(255) NOT NULL COMMENT '手机号码前7位',
  `operator_name` varchar(255) NOT NULL COMMENT '运营商名称',
  `province` varchar(255) NOT NULL COMMENT '省份',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `operator_code` varchar(255) DEFAULT NULL COMMENT '运营商编码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `area_code` varchar(10) DEFAULT NULL COMMENT '区域编码',
  PRIMARY KEY (`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_home_info_new`
--

DROP TABLE IF EXISTS `mobile_home_info_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_home_info_new` (
  `mobile_no` varchar(255) NOT NULL COMMENT '手机号码前7位',
  `operator_name` varchar(255) NOT NULL COMMENT '运营商名称',
  `province` varchar(255) NOT NULL COMMENT '省份',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `operator_code` varchar(255) DEFAULT NULL COMMENT '运营商编码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `area_code` varchar(10) DEFAULT NULL COMMENT '区域编码',
  PRIMARY KEY (`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_resend_flow_dispatch_rec`
--

DROP TABLE IF EXISTS `mobile_resend_flow_dispatch_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_resend_flow_dispatch_rec` (
  `rec_id` varchar(64) NOT NULL COMMENT '下发记录ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '分发订单号',
  `mobile_no` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（参照运营商规格）',
  `foss_package_id` varchar(255) DEFAULT NULL COMMENT '流量产品包（foss平台）',
  `flow_amount` float DEFAULT NULL COMMENT '流量大小',
  `send_count` int(11) DEFAULT '0' COMMENT '下发次数',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `last_send_date` datetime NOT NULL COMMENT '最后提交发送的时间',
  `next_send_date` datetime DEFAULT NULL COMMENT '下次发送时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `send_status` varchar(255) DEFAULT NULL COMMENT '发送状态：0-待发 1-已发 2-成功 3-重发 4-失败',
  `gw_seq_no` varchar(255) DEFAULT NULL COMMENT '网关订单号',
  `gw_status` varchar(255) DEFAULT NULL COMMENT '网关状态',
  `gw_error_code` varchar(255) DEFAULT NULL COMMENT '网关错误代码',
  `gw_error_msg` varchar(1024) DEFAULT NULL COMMENT '网关错误信息',
  `adapter_name` varchar(255) DEFAULT NULL COMMENT '适配器',
  `mobile_home` varchar(32) DEFAULT NULL COMMENT '归属地市',
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用ID',
  `trans_id` varchar(128) DEFAULT NULL COMMENT 'trans_id',
  `last_callback_msg` varchar(2048) DEFAULT NULL COMMENT '最后回调信息',
  `operator_balance_price` decimal(10,2) DEFAULT NULL COMMENT '运营商结算价格',
  PRIMARY KEY (`rec_id`),
  KEY `Index_1` (`order_id`,`app_id`,`foss_package_id`) USING BTREE,
  KEY `Index_2` (`mobile_no`,`gw_seq_no`) USING BTREE,
  KEY `Index_3` (`mobile_no`,`create_date`,`send_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `my_flow_coin`
--

DROP TABLE IF EXISTS `my_flow_coin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_flow_coin` (
  `my_flow_coin_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '我的流量币序列',
  `app_id` varchar(128) NOT NULL COMMENT '微信appid',
  `openid` varchar(64) NOT NULL COMMENT '微信openId',
  `coin_amount` int(11) NOT NULL COMMENT '总数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`my_flow_coin_id`),
  UNIQUE KEY `U_1` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `my_flow_coin_record`
--

DROP TABLE IF EXISTS `my_flow_coin_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_flow_coin_record` (
  `coin_record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流量币记录ID',
  `app_id` varchar(128) NOT NULL COMMENT '微信appid',
  `openid` varchar(64) NOT NULL COMMENT '微信openId',
  `exchange_type` int(11) NOT NULL COMMENT '兑换类型 1:领取 2:兑换',
  `exchange_num` int(11) NOT NULL COMMENT '数量 领取为正，兑换为-',
  `remark` varchar(256) DEFAULT NULL COMMENT '说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`coin_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `my_greeting_card`
--

DROP TABLE IF EXISTS `my_greeting_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_greeting_card` (
  `my_greeting_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '我的贺卡序列',
  `greeting_card_id` bigint(20) DEFAULT NULL COMMENT '贺卡ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `open_id` varchar(256) NOT NULL COMMENT '微信OpenID',
  `union_id` varchar(256) NOT NULL COMMENT '微信UnionID',
  `nick_name` varchar(256) NOT NULL COMMENT '微信昵称',
  `head_img` varchar(256) NOT NULL COMMENT '微信头像',
  `product_id` bigint(32) NOT NULL COMMENT '产品ID',
  `num` int(11) NOT NULL COMMENT '流量包个数',
  `exchanged_num` int(11) NOT NULL COMMENT '流量包已兑换个数',
  `uu_id` varchar(64) NOT NULL COMMENT '贺卡唯一标识,随机数,标识url',
  `greeting_content` varchar(512) NOT NULL COMMENT '祝福语内容',
  `bg_color` varchar(64) NOT NULL COMMENT '背景色,16进制字符串',
  `making_ip` varchar(64) NOT NULL COMMENT '制作者ip',
  `making_time` datetime NOT NULL COMMENT '制作时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `pay_status` int(11) NOT NULL COMMENT '支付状态 0:未支付 1:支付成功 2:支付完成 3:支付失败',
  `out_trade_no` varchar(64) NOT NULL COMMENT '商户订单号',
  `is_sign` int(11) DEFAULT NULL COMMENT '是否署名 0:否 1:是',
  PRIMARY KEY (`my_greeting_id`),
  KEY `FK_Reference_48` (`greeting_card_id`),
  KEY `Index_1` (`customer_id`,`greeting_card_id`),
  CONSTRAINT `FK_Reference_48` FOREIGN KEY (`greeting_card_id`) REFERENCES `greeting_card_info` (`greeting_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `my_share`
--

DROP TABLE IF EXISTS `my_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_share` (
  `my_share_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '我的分享ID',
  `app_id` varchar(128) NOT NULL COMMENT '微信appid',
  `openid` varchar(64) NOT NULL COMMENT '微信openId',
  `uuid` varchar(64) NOT NULL COMMENT '唯一标识',
  `act_uuid` varchar(128) NOT NULL COMMENT '活动UUID',
  `total_coin` int(11) NOT NULL COMMENT '可领取总币数',
  `person_num` int(11) NOT NULL COMMENT '可领取人数',
  `person_fetch_num` int(11) NOT NULL COMMENT '已领人数',
  `fetch_num` int(11) NOT NULL COMMENT '已领币数',
  `type` int(11) NOT NULL COMMENT '类型 1:随机 2:平均',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `invalid_time` datetime DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`my_share_id`),
  UNIQUE KEY `U_1` (`uuid`),
  UNIQUE KEY `U_2` (`openid`,`app_id`,`act_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `openid_map`
--

DROP TABLE IF EXISTS `openid_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openid_map` (
  `open_seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `app_id` varchar(32) NOT NULL COMMENT '微信appid',
  `open_id` varchar(64) NOT NULL COMMENT '微信OpenID',
  `m_app_id` varchar(32) NOT NULL COMMENT '对应微信appid',
  `m_open_id` varchar(64) NOT NULL COMMENT '对应微信OpenID',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`open_seq_id`),
  UNIQUE KEY `U_1` (`app_id`,`open_id`,`m_app_id`,`m_open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_deal_record`
--

DROP TABLE IF EXISTS `order_deal_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_deal_record` (
  `deal_record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '处理记录序列',
  `type` int(11) NOT NULL COMMENT '处理类型 1:合作伙伴产品协议 2:客户订单',
  `start_record` mediumtext COMMENT '记录前数据,json字符串',
  `end_record` mediumtext NOT NULL COMMENT '记录后数据,json字符串',
  `creator` varchar(32) NOT NULL COMMENT '操作者',
  `input_time` datetime NOT NULL COMMENT '操作时间',
  `remark` varchar(512) NOT NULL COMMENT '说明',
  `source_id` varchar(32) NOT NULL COMMENT '来源ID',
  PRIMARY KEY (`deal_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11282 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `order_detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单明细ID号',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `package_id` varchar(64) DEFAULT NULL COMMENT '流量包ID',
  `order_type` int(11) NOT NULL COMMENT '订单类别;1:流量包 2:流量加',
  `price` decimal(10,2) NOT NULL COMMENT '合作伙伴与客户间结算价格',
  `settlement_price` decimal(10,2) NOT NULL COMMENT '客户销售价格',
  `amount` int(11) NOT NULL COMMENT '数量',
  `used_amount` int(11) NOT NULL COMMENT '已制作的数量',
  `price_total` decimal(10,2) NOT NULL COMMENT '合计',
  PRIMARY KEY (`order_detail_id`),
  UNIQUE KEY `U_2` (`order_id`,`product_id`),
  KEY `FK_Reference_9` (`product_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`order_id`) REFERENCES `order_info` (`order_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`product_id`) REFERENCES `flow_product_info` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_detail_quarz`
--

DROP TABLE IF EXISTS `order_detail_quarz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail_quarz` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `price` decimal(10,2) NOT NULL COMMENT '合作伙伴与客户间结算价格',
  `settlement_price` decimal(10,2) NOT NULL COMMENT '客户销售价格',
  `quarz_time` varchar(40) DEFAULT NULL COMMENT '定时时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0.表示未执行  1.表示已执行 （暂未使用、备用字段）',
  PRIMARY KEY (`id`),
  KEY `U_2` (`order_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='订单定时更改结算价格和销售价格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_info` (
  `order_id` bigint(20) NOT NULL COMMENT '订单ID号',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴ID',
  `status` int(11) NOT NULL COMMENT '状态;1:待生效 2:生效 3:暂停 4:删除',
  `order_type` int(11) NOT NULL COMMENT '订单类别;1:流量包 2:流量加',
  `price_total` float NOT NULL COMMENT '合计',
  `delivery_time` datetime DEFAULT NULL COMMENT '期望交货时间',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `billing_type` int(11) NOT NULL COMMENT '计费方式 1:按激活计费 2:按下发计费',
  PRIMARY KEY (`order_id`),
  KEY `FK_Reference_3` (`customer_id`),
  KEY `FK_Reference_4` (`partner_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`partner_id`) REFERENCES `partner_info` (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_send_manage`
--

DROP TABLE IF EXISTS `order_send_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_send_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manage_name` varchar(255) DEFAULT NULL COMMENT '配置管理名称',
  `operator` varchar(255) DEFAULT NULL COMMENT '运营商',
  `zone_code` varchar(255) DEFAULT NULL,
  `zone_name` varchar(255) DEFAULT NULL COMMENT '区域',
  `rang` varchar(255) DEFAULT NULL COMMENT '流量类型 0全部 1 漫游 2非漫游',
  `package_id` varchar(255) DEFAULT NULL COMMENT '流量规格包',
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='流量订单换成配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_balance_month`
--

DROP TABLE IF EXISTS `partner_balance_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_balance_month` (
  `balance_month_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '结算ID',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴ID',
  `month` varchar(20) NOT NULL COMMENT '结算月份,格式yyyyMM',
  `pay_money` decimal(10,2) NOT NULL COMMENT '帐单支付金额',
  `balance_status` int(11) NOT NULL COMMENT '结算状态 0:待确认 1:已确认',
  `balance_money` decimal(10,2) NOT NULL COMMENT '结算金额',
  `adjust_money` decimal(10,2) NOT NULL COMMENT '调整金额',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `start_date` varchar(8) NOT NULL COMMENT '帐单开始时间,格式yyyyMMdd',
  `end_date` varchar(8) NOT NULL COMMENT '帐单结束时间,格式yyyyMMdd',
  PRIMARY KEY (`balance_month_id`),
  KEY `U_1` (`partner_id`,`month`),
  CONSTRAINT `FK_Reference_43` FOREIGN KEY (`partner_id`) REFERENCES `partner_info` (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_balance_month_bak_20160816`
--

DROP TABLE IF EXISTS `partner_balance_month_bak_20160816`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_balance_month_bak_20160816` (
  `balance_month_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算ID',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴ID',
  `month` varchar(20) NOT NULL COMMENT '结算月份,格式yyyyMM',
  `pay_money` decimal(10,2) NOT NULL COMMENT '帐单支付金额',
  `balance_status` int(11) NOT NULL COMMENT '结算状态 0:待确认 1:已确认',
  `balance_money` decimal(10,2) NOT NULL COMMENT '结算金额',
  `adjust_money` decimal(10,2) NOT NULL COMMENT '调整金额',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `start_date` varchar(8) NOT NULL COMMENT '帐单开始时间,格式yyyyMMdd',
  `end_date` varchar(8) NOT NULL COMMENT '帐单结束时间,格式yyyyMMdd'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_info`
--

DROP TABLE IF EXISTS `partner_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_info` (
  `partner_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '合作伙伴ID',
  `identity_id` varchar(32) NOT NULL COMMENT '合作伙伴身份标识,随机生成唯一',
  `partner_name` varchar(256) NOT NULL COMMENT '合作伙伴名称',
  `shorter_name` varchar(256) NOT NULL COMMENT '合作伙伴简称',
  `partner_no` varchar(64) NOT NULL COMMENT '合作伙伴编号',
  `login_name` varchar(64) NOT NULL COMMENT '合作伙伴帐号',
  `real_name` varchar(64) NOT NULL COMMENT '合作伙伴姓名',
  `mobile` varchar(32) NOT NULL COMMENT '合作伙伴电话',
  `email` varchar(64) NOT NULL COMMENT '合作伙伴邮箱',
  `address` varchar(1024) NOT NULL COMMENT '合作伙伴地址',
  `partner_type` int(11) NOT NULL COMMENT '合作伙伴类型;1:流量营销 2:渠道直充',
  `status` varchar(64) NOT NULL COMMENT '合作伙伴状态;0:待提交 1:商用 2:暂停',
  `balance` decimal(10,2) NOT NULL COMMENT '当前余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '信用额度',
  `settlement_discount` int(11) NOT NULL COMMENT '结算折扣',
  `current_amount` decimal(10,2) DEFAULT NULL COMMENT '当前费用',
  `coop_group_id` varchar(32) NOT NULL COMMENT '合作协议附件组ID',
  `is_deleted` int(11) NOT NULL COMMENT '删除标识,1:已删除0:未删除',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `order_billing_type` int(11) NOT NULL COMMENT '订单计费方式 0:不按下发计费 1:按下发计费',
  `partner_level` int(11) DEFAULT NULL COMMENT '合作伙伴等级',
  `settlement_pattern` int(11) DEFAULT NULL COMMENT '结算模式 1-按固定折扣 2-按固定毛利率',
  `settlement_discount_ratio` decimal(10,2) DEFAULT NULL COMMENT '结算折扣比例,结算模式为按固定毛利率的有效。',
  PRIMARY KEY (`partner_id`),
  UNIQUE KEY `U_1` (`identity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_info_ext`
--

DROP TABLE IF EXISTS `partner_info_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_info_ext` (
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `adviser_name` varchar(64) NOT NULL COMMENT '合作顾问',
  `adviser_mobile` varchar(32) NOT NULL COMMENT '顾问电话',
  `custom_service_name` varchar(64) NOT NULL COMMENT '客服名称',
  `custom_service_mobile` varchar(32) NOT NULL COMMENT '联系电话',
  `other_linkman` varchar(64) DEFAULT NULL COMMENT '其它联系人',
  `other_mobile` varchar(32) DEFAULT NULL COMMENT '其它电话',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_product`
--

DROP TABLE IF EXISTS `partner_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_product` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `settlement_amount` decimal(10,2) NOT NULL COMMENT '结算金额,单位是分',
  `remark` varchar(1024) NOT NULL COMMENT '备注说明',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `ip` varchar(32) DEFAULT NULL COMMENT '创建者IP',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `U_1` (`partner_id`,`product_id`),
  KEY `FK_Reference_31` (`product_id`),
  CONSTRAINT `FK_Reference_30` FOREIGN KEY (`partner_id`) REFERENCES `partner_info` (`partner_id`),
  CONSTRAINT `FK_Reference_31` FOREIGN KEY (`product_id`) REFERENCES `flow_product_info` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26429 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_recharge_record`
--

DROP TABLE IF EXISTS `partner_recharge_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_recharge_record` (
  `recharge_record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '充值记录ID',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `partner_identity_id` varchar(32) NOT NULL COMMENT '合作伙伴身份标识',
  `amount` float NOT NULL COMMENT '充值金额,单位是分',
  `operator` varchar(64) NOT NULL COMMENT '充值者',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `ip` varchar(64) NOT NULL COMMENT '录入者ip',
  `remark` varchar(1024) NOT NULL COMMENT '备注说明',
  PRIMARY KEY (`recharge_record_id`),
  KEY `FK_Reference_29` (`partner_id`),
  CONSTRAINT `FK_Reference_29` FOREIGN KEY (`partner_id`) REFERENCES `partner_info` (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_to_wx_conf`
--

DROP TABLE IF EXISTS `partner_to_wx_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_to_wx_conf` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `partner_id` bigint(20) NOT NULL COMMENT '合作伙伴ID',
  `app_id` varchar(128) NOT NULL COMMENT '微信appid',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `U_1` (`partner_id`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_trade_flow`
--

DROP TABLE IF EXISTS `partner_trade_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_trade_flow` (
  `trade_flow_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '交易流水ID',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴ID',
  `trade_time` datetime NOT NULL COMMENT '交易日期',
  `trade_type` int(11) NOT NULL COMMENT '交易类型 1-结算 2-充值 3-授信',
  `balance` decimal(10,2) NOT NULL COMMENT '当前余额',
  `credit_amount` decimal(10,2) NOT NULL COMMENT '信用额度',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易额度',
  `login_name` varchar(32) NOT NULL COMMENT '操作者',
  `operator_name` varchar(64) NOT NULL COMMENT '操作名称',
  `input_time` datetime NOT NULL COMMENT '操作时间',
  `remark` varchar(512) NOT NULL COMMENT '备注',
  `ip` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`trade_flow_id`),
  KEY `Index_1` (`partner_id`),
  CONSTRAINT `FK_Reference_44` FOREIGN KEY (`partner_id`) REFERENCES `partner_info` (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13894 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passwd_modify_record`
--

DROP TABLE IF EXISTS `passwd_modify_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwd_modify_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `status` int(11) NOT NULL COMMENT '状态 1:成功 2:失败',
  `num` int(11) NOT NULL COMMENT '次数',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `ip` varchar(64) NOT NULL COMMENT 'ip地址',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `province_channel_pool`
--

DROP TABLE IF EXISTS `province_channel_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province_channel_pool` (
  `pool_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流量池ID',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `operator_code` varchar(32) NOT NULL COMMENT '对应运营商产品ID,YD:移动　LT:联通　DX:电信',
  `zone` varchar(64) NOT NULL COMMENT '适用区域',
  `input_by` varchar(32) DEFAULT NULL COMMENT '录入者',
  `input_time` datetime DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`pool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recharge_conf`
--

DROP TABLE IF EXISTS `recharge_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recharge_conf` (
  `recharge_conf_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '充值配置ID',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `recharge_conf_name` varchar(128) NOT NULL COMMENT '充值活动名称',
  `tmpl_type` int(11) NOT NULL COMMENT '页面模板类型 1:简洁 2:送流量币',
  `tmpl_path` varchar(128) NOT NULL COMMENT '页面模板路径',
  `adv_pic_id` varchar(64) DEFAULT NULL COMMENT '广告图片ID',
  `adv_pic_url` varchar(128) DEFAULT NULL COMMENT '广告图片URL',
  `adv_link` varchar(512) DEFAULT NULL COMMENT '广告链接',
  `flow_coin_num` int(11) DEFAULT NULL COMMENT '流量币赠送数量',
  `fetch_num` int(11) DEFAULT NULL COMMENT '领取人数限制',
  `flow_coin_view_url` varchar(128) DEFAULT NULL COMMENT '流量币查看链接',
  `giving_rule` int(11) DEFAULT NULL COMMENT '赠送规则 1:随机 2:平均',
  `uuid` varchar(128) NOT NULL COMMENT 'UUID',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`recharge_conf_id`),
  KEY `U_1` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recharge_discount1_act_product`
--

DROP TABLE IF EXISTS `recharge_discount1_act_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recharge_discount1_act_product` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `discount_act_id` bigint(20) DEFAULT NULL COMMENT '优惠活动序列',
  `order_detail_id` bigint(20) NOT NULL COMMENT '原订单明细ID号',
  `product_id` bigint(20) NOT NULL COMMENT '原产品ID号',
  `product_name` varchar(200) NOT NULL COMMENT '原产品名称',
  `fill_order_detail_id` bigint(20) NOT NULL COMMENT '升档订单明细ID号',
  `fill_product_id` bigint(20) NOT NULL COMMENT '升档产品ID号',
  `fill_product_name` varchar(200) NOT NULL COMMENT '升档产品名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`seq_id`),
  KEY `FK_Reference_62` (`discount_act_id`),
  CONSTRAINT `FK_Reference_62` FOREIGN KEY (`discount_act_id`) REFERENCES `recharge_discount_act` (`discount_act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recharge_discount2_act_product`
--

DROP TABLE IF EXISTS `recharge_discount2_act_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recharge_discount2_act_product` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `discount_act_id` bigint(20) DEFAULT NULL COMMENT '优惠活动序列',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `coin_num` int(11) DEFAULT NULL COMMENT '抵扣币数量',
  `coin_price` decimal(10,2) DEFAULT NULL COMMENT '抵扣币价值',
  PRIMARY KEY (`seq_id`),
  KEY `FK_Reference_63` (`discount_act_id`),
  CONSTRAINT `FK_Reference_63` FOREIGN KEY (`discount_act_id`) REFERENCES `recharge_discount_act` (`discount_act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recharge_discount_act`
--

DROP TABLE IF EXISTS `recharge_discount_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recharge_discount_act` (
  `discount_act_id` bigint(20) NOT NULL COMMENT '优惠活动序列',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `discount_type` int(11) NOT NULL COMMENT '优惠类型 1:充升档 2:币抵扣',
  `act_name` varchar(128) NOT NULL COMMENT '活动名称',
  `page_type` int(11) NOT NULL COMMENT '适用终端 1:h5 2:app',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`discount_act_id`),
  UNIQUE KEY `U_1` (`customer_id`,`discount_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recharge_product`
--

DROP TABLE IF EXISTS `recharge_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recharge_product` (
  `recharge_product_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '充值产品序列',
  `recharge_conf_id` bigint(20) DEFAULT NULL COMMENT '充值配置ID',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细ID号',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID号',
  `product_name` varchar(200) NOT NULL COMMENT '产品名称',
  `package_id` varchar(64) NOT NULL COMMENT '流量包ID',
  `product_price` decimal(10,2) NOT NULL COMMENT '产品定价',
  `price` decimal(10,2) NOT NULL COMMENT '合作伙伴与客户间结算价格',
  `settlement_price` decimal(10,2) NOT NULL COMMENT '客户销售价格',
  `is_recommend` int(11) NOT NULL COMMENT '是否推荐 0:否 1:是',
  PRIMARY KEY (`recharge_product_id`),
  KEY `FK_Reference_61` (`recharge_conf_id`),
  CONSTRAINT `FK_Reference_61` FOREIGN KEY (`recharge_conf_id`) REFERENCES `recharge_conf` (`recharge_conf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_attach_type_id`
--

DROP TABLE IF EXISTS `seq_attach_type_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_attach_type_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `share_record`
--

DROP TABLE IF EXISTS `share_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share_record` (
  `share_record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分享记录ID',
  `uuid` varchar(64) NOT NULL COMMENT '唯一标识',
  `act_uuid` varchar(128) NOT NULL COMMENT '活动UUID',
  `app_id` varchar(128) NOT NULL COMMENT '微信appid',
  `openid` varchar(64) NOT NULL COMMENT '微信openId',
  `nick_name` varchar(256) NOT NULL COMMENT '微信昵称',
  `head_img` varchar(256) NOT NULL COMMENT '微信头像',
  `fetch_num` int(11) NOT NULL COMMENT '领取数量',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`share_record_id`),
  KEY `Index_1` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sign_in_conf`
--

DROP TABLE IF EXISTS `sign_in_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_in_conf` (
  `sign_seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '签到自增序列',
  `campaign_id` bigint(20) DEFAULT NULL COMMENT '营销活动序列',
  `banner_img_id` varchar(64) DEFAULT NULL COMMENT 'banner图ID',
  `banner_img_url` varchar(128) DEFAULT NULL COMMENT 'banner图URL',
  `adv_url` varchar(512) DEFAULT NULL COMMENT '广告链接',
  `bg_img_id` varchar(64) DEFAULT NULL COMMENT '签到背景图ID',
  `bg_img_url` varchar(128) DEFAULT NULL COMMENT '签到背景图URL',
  `sign_img_id1` varchar(64) DEFAULT NULL COMMENT '签到图标ID1',
  `sign_img_url1` varchar(128) DEFAULT NULL COMMENT '签到图标URL1',
  `sign_img_id2` varchar(64) DEFAULT NULL COMMENT '签到图标ID2',
  `sign_img_url2` varchar(128) DEFAULT NULL COMMENT '签到图标URL2',
  `subject_color_val` varchar(32) DEFAULT NULL COMMENT '主题颜色值',
  `bg_color_val` varchar(32) DEFAULT NULL COMMENT '背景颜色值',
  `rule_desc` varchar(1024) DEFAULT NULL COMMENT '活动规则',
  `send_title` varchar(512) NOT NULL COMMENT '转发标题,模板',
  `send_content` varchar(512) DEFAULT NULL COMMENT '转发内容',
  `send_ico_id` varchar(32) DEFAULT NULL COMMENT '转发图标ID',
  `send_ico_url` varchar(512) DEFAULT NULL COMMENT '转发图标url',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `foot_txt` varchar(512) DEFAULT NULL COMMENT '页脚说明',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `tmpl_path` varchar(128) NOT NULL COMMENT '页面模板目录名',
  PRIMARY KEY (`sign_seq_id`),
  KEY `FK_Reference_57` (`campaign_id`),
  CONSTRAINT `FK_Reference_57` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_info` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sign_points_record`
--

DROP TABLE IF EXISTS `sign_points_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_points_record` (
  `points_seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '签到积分记录自增序列',
  `sign_seq_id` bigint(20) NOT NULL COMMENT '签到自增序列',
  `open_id` varchar(256) NOT NULL COMMENT '微信OpenID',
  `type` int(11) NOT NULL COMMENT '签到类别,1:签到 2:兑换',
  `serial_no` varchar(32) DEFAULT NULL COMMENT '翻牌序号',
  `points` int(11) NOT NULL COMMENT '签到或兑换的分数',
  `ip` varchar(64) NOT NULL COMMENT '签到IP',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `reward_id` bigint(20) DEFAULT NULL COMMENT '中奖ID号,关联营销活动信息表',
  PRIMARY KEY (`points_seq_id`),
  KEY `FK_Reference_59` (`sign_seq_id`),
  CONSTRAINT `FK_Reference_59` FOREIGN KEY (`sign_seq_id`) REFERENCES `sign_in_conf` (`sign_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sign_points_rule`
--

DROP TABLE IF EXISTS `sign_points_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_points_rule` (
  `points_seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '积分规则自增序列',
  `sign_seq_id` bigint(20) DEFAULT NULL COMMENT '签到自增序列',
  `points` int(11) NOT NULL COMMENT '积分值',
  `ratio` double NOT NULL COMMENT '概率',
  `remark` varchar(512) NOT NULL COMMENT '备注',
  PRIMARY KEY (`points_seq_id`),
  KEY `FK_Reference_58` (`sign_seq_id`),
  CONSTRAINT `FK_Reference_58` FOREIGN KEY (`sign_seq_id`) REFERENCES `sign_in_conf` (`sign_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sign_stat_info`
--

DROP TABLE IF EXISTS `sign_stat_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_stat_info` (
  `sign_stat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '签到统计ID',
  `sign_seq_id` bigint(20) NOT NULL COMMENT '签到自增序列',
  `open_id` varchar(200) NOT NULL COMMENT '微信OpenID',
  `total_sign_in` int(11) DEFAULT NULL COMMENT '累计签到次数',
  `total_points` int(11) DEFAULT NULL COMMENT '总积分',
  `now_points` int(11) DEFAULT NULL COMMENT '现有积分',
  `exchange_points` int(11) DEFAULT NULL COMMENT '兑换积分',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`sign_stat_id`),
  UNIQUE KEY `U_1` (`open_id`,`sign_seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_channel_info`
--

DROP TABLE IF EXISTS `sms_channel_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_channel_info` (
  `sms_channel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '短信通道ID',
  `adapter_name` varchar(255) NOT NULL COMMENT '适配器名称',
  `gw_url` varchar(255) NOT NULL COMMENT '网关URL',
  `gw_user` varchar(255) NOT NULL COMMENT '用户名',
  `gw_pwd` varchar(255) NOT NULL COMMENT '密码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`sms_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_record`
--

DROP TABLE IF EXISTS `sms_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_record` (
  `sms_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '短信ID',
  `source_mobile` varchar(32) NOT NULL COMMENT '发送号码',
  `dest_mobile` varchar(32) NOT NULL COMMENT '接收号码',
  `content` varchar(1024) NOT NULL COMMENT '短信内容',
  `send_status` int(11) NOT NULL COMMENT '发送状态0:未发送 1:发送成功 2:发送中3:发送失败',
  `error_message` varchar(1024) DEFAULT NULL COMMENT '失败原因',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `expected_send_time` datetime DEFAULT NULL COMMENT '期望发送时间',
  `source_id` varchar(64) DEFAULT NULL COMMENT '来源ID',
  `deal_time` int(11) NOT NULL COMMENT '处理次数',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_tmpl`
--

DROP TABLE IF EXISTS `sms_tmpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_tmpl` (
  `sms_tmpl_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '短信模板ID',
  `tmpl_name` varchar(128) NOT NULL COMMENT '短信模板名称',
  `tmpl_content` varchar(1024) NOT NULL COMMENT '短信模板内容',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_valid` int(11) NOT NULL COMMENT '是否有效　0:否 1:是',
  PRIMARY KEY (`sms_tmpl_id`),
  KEY `Index_1` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_verify_code`
--

DROP TABLE IF EXISTS `sms_verify_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_verify_code` (
  `sms_verify_code_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '短信验证码ID',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `verify_code` varchar(10) DEFAULT NULL COMMENT '验证码',
  `input_time` datetime DEFAULT NULL COMMENT '录入时间',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `type` int(11) DEFAULT NULL COMMENT '类别 1:农泰',
  `is_valid` int(11) DEFAULT NULL COMMENT '是否有效 0:初始化 1:有效 2:无效',
  `req_ip` varchar(64) DEFAULT NULL COMMENT '请求ip',
  PRIMARY KEY (`sms_verify_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_customer_manage_day`
--

DROP TABLE IF EXISTS `stat_customer_manage_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_customer_manage_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id 自增',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴id',
  `partner_name` varchar(255) DEFAULT NULL COMMENT '合作伙伴名称',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `customer_status` tinyint(255) DEFAULT NULL COMMENT '客户状态 ''状态,0:待提交 1:商用２:暂停''',
  `before_balance` decimal(10,2) DEFAULT NULL COMMENT '当前结余 前一天的余额',
  `expend` decimal(10,2) DEFAULT NULL COMMENT '当天消耗',
  `recharge` decimal(10,2) DEFAULT NULL COMMENT '当期消耗',
  `expend_precent` varchar(255) DEFAULT NULL COMMENT '消耗占比 消耗占比=消耗/（当期结余+充值）；',
  `current_balance` decimal(10,2) DEFAULT NULL COMMENT '当前余额 当期结余+充值-消耗',
  `profit` decimal(10,2) DEFAULT NULL COMMENT '平台利润',
  `profit_precent` varchar(255) DEFAULT NULL COMMENT '毛利率=利润/消耗  ',
  `success_order` bigint(20) DEFAULT NULL COMMENT '成功订单数',
  `fail_order` bigint(20) DEFAULT NULL COMMENT '失败订单数',
  `success_precent` varchar(255) DEFAULT NULL COMMENT '订单成功率',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '记录生成时间',
  `statistics_time` date DEFAULT NULL COMMENT '统计数据时间 天',
  `statistics_month` varchar(32) DEFAULT NULL COMMENT '统计时间 月',
  PRIMARY KEY (`id`),
  KEY `index_statis_partner` (`statistics_time`,`partner_id`) USING BTREE COMMENT '统计时间索引',
  KEY `index_statis_customer` (`statistics_time`,`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47559 DEFAULT CHARSET=utf8 COMMENT='客户经营数据统计表（一个客户一天一条数据）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_customer_manage_operator_day`
--

DROP TABLE IF EXISTS `stat_customer_manage_operator_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_customer_manage_operator_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id 自增',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴id',
  `partner_name` varchar(255) DEFAULT NULL COMMENT '合作伙伴名称',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `operator_code` varchar(32) DEFAULT NULL COMMENT '运营商',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '通道id',
  `channel_name` varchar(64) DEFAULT NULL COMMENT '通道名称',
  `supplier_code` varchar(32) DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `zone` varchar(32) DEFAULT NULL COMMENT '区域',
  `channel_discount` decimal(10,2) DEFAULT NULL COMMENT '通道折扣',
  `flow_package_size` bigint(20) DEFAULT NULL COMMENT '成功订单数',
  `expend` decimal(10,0) DEFAULT NULL COMMENT '消耗',
  `expend_precent` varchar(255) DEFAULT NULL COMMENT '消耗占比',
  `profit` decimal(10,2) DEFAULT NULL COMMENT '利润',
  `profit_precent` varchar(255) DEFAULT NULL COMMENT '毛利率',
  `success_order` bigint(20) DEFAULT NULL COMMENT '成功订单数',
  `fail_order` bigint(20) DEFAULT NULL COMMENT '失败订单数',
  `success_precent` varchar(255) DEFAULT NULL COMMENT '成功率',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '记录生成时间',
  `statistics_time` date DEFAULT NULL COMMENT '统计数据时间',
  `statistics_month` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_statis_partner` (`statistics_time`,`partner_id`) USING BTREE COMMENT '统计时间索引',
  KEY `index_statis_customer` (`statistics_time`,`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7710 DEFAULT CHARSET=utf8 COMMENT='客户经营数据统计表（一个客户一天一条数据）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_customer_manage_package_day`
--

DROP TABLE IF EXISTS `stat_customer_manage_package_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_customer_manage_package_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id 自增',
  `partner_id` bigint(20) DEFAULT NULL COMMENT '合作伙伴id',
  `partner_name` varchar(255) DEFAULT NULL COMMENT '合作伙伴名称',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `operator_code` varchar(32) DEFAULT NULL COMMENT '运营商',
  `package_id` varchar(32) DEFAULT NULL COMMENT '流量规格包',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '通道id',
  `channel_name` varchar(64) DEFAULT NULL COMMENT '通道名称',
  `zone` varchar(32) DEFAULT NULL COMMENT '区域',
  `price` decimal(10,2) DEFAULT NULL COMMENT '结算价',
  `channel_price` bigint(20) DEFAULT NULL COMMENT '通道价',
  `expend` decimal(10,0) DEFAULT NULL COMMENT '消耗',
  `expend_precent` varchar(255) DEFAULT NULL COMMENT '消耗占比',
  `profit` decimal(10,2) DEFAULT NULL COMMENT '利润',
  `profit_precent` varchar(255) DEFAULT NULL COMMENT '毛利率',
  `success_order` bigint(20) DEFAULT NULL COMMENT '成功订单数',
  `fail_order` bigint(20) DEFAULT NULL COMMENT '失败订单数',
  `success_precent` varchar(255) DEFAULT NULL COMMENT '成功率',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '记录生成时间',
  `statistics_time` date DEFAULT NULL COMMENT '统计数据时间',
  `statistics_month` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_statis_partner` (`statistics_time`,`partner_id`) USING BTREE COMMENT '统计时间索引',
  KEY `index_statis_customer` (`statistics_time`,`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17849 DEFAULT CHARSET=utf8 COMMENT='客户经营数据统计表（一个客户一天一条数据）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_flow_manage_day`
--

DROP TABLE IF EXISTS `stat_flow_manage_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_flow_manage_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流量经营报表ID',
  `customer_recharge_amount` decimal(30,2) DEFAULT '0.00' COMMENT '客户充值金额',
  `supplier_recharge_amount` decimal(30,2) DEFAULT '0.00' COMMENT '供应商充值',
  `recharge_amount_differ` decimal(30,2) DEFAULT NULL,
  `customer_consume_amount` decimal(30,2) DEFAULT '0.00' COMMENT '客户消耗',
  `supplier_consume_amount` decimal(30,2) DEFAULT '0.00' COMMENT '供应商消耗',
  `consume_amount_differ` decimal(30,2) DEFAULT '0.00' COMMENT '消耗净差值',
  `customer_balance_amount` decimal(30,2) DEFAULT '0.00' COMMENT '客户余额',
  `supplier_balance_amount` decimal(30,2) DEFAULT NULL,
  `balance_amount_differ` decimal(30,2) DEFAULT NULL,
  `profit` decimal(30,2) DEFAULT '0.00' COMMENT '利润',
  `statistics_date` date DEFAULT NULL COMMENT '统计日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='流量经营概况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_flow_target_month`
--

DROP TABLE IF EXISTS `stat_flow_target_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_flow_target_month` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水目标ID',
  `flow_target` decimal(10,2) DEFAULT NULL COMMENT '全年流水目标值',
  `profit_target` decimal(10,2) DEFAULT NULL COMMENT '全年利润目标值',
  `target_month` varchar(255) DEFAULT NULL COMMENT '目标月',
  `status` varchar(2) DEFAULT NULL COMMENT '是否有效 1有效 0无效  保存所有流水',
  `operator_name` varchar(64) DEFAULT NULL COMMENT '操作者姓名',
  `operate_ip` varchar(64) DEFAULT NULL COMMENT '操作者ip',
  `input_time` datetime DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='流水目标记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_flow_target_records`
--

DROP TABLE IF EXISTS `stat_flow_target_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_flow_target_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水目标ID',
  `flow_target_year` decimal(10,2) DEFAULT NULL COMMENT '全年流水目标值',
  `profit_target_year` decimal(10,2) DEFAULT NULL COMMENT '全年利润目标值',
  `operator_name` varchar(64) DEFAULT NULL COMMENT '操作者姓名',
  `operate_ip` varchar(64) DEFAULT NULL COMMENT '操作者ip',
  `input_time` datetime DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='流水目标记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_flow_target_records_bak`
--

DROP TABLE IF EXISTS `stat_flow_target_records_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_flow_target_records_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水目标ID',
  `flow_target_year` decimal(10,2) DEFAULT NULL COMMENT '全年流水目标值',
  `profit_target_year` decimal(10,2) DEFAULT NULL COMMENT '全年利润目标值',
  `operator_name` varchar(64) DEFAULT NULL COMMENT '操作者姓名',
  `operate_ip` varchar(64) DEFAULT NULL COMMENT '操作者ip',
  `input_time` datetime DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='流水目标记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_order_analysis_day`
--

DROP TABLE IF EXISTS `stat_order_analysis_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_order_analysis_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_time` varchar(40) DEFAULT NULL COMMENT '统计日期  格式 yyyy-MM-dd',
  `area_name` varchar(40) DEFAULT NULL,
  `customer_name` varchar(40) DEFAULT NULL COMMENT '客户名称',
  `operator_code` varchar(40) DEFAULT NULL COMMENT '供应商',
  `channel_name` varchar(40) DEFAULT NULL COMMENT '通道名称',
  `partner_name` varchar(40) DEFAULT NULL COMMENT '合作伙伴名称',
  `country_price` decimal(10,0) DEFAULT NULL COMMENT '全国通道金额',
  `province_price` decimal(10,0) DEFAULT NULL COMMENT '分省通道金额',
  `city_price` decimal(10,0) DEFAULT NULL COMMENT '地市通道金额',
  `country_count` int(10) DEFAULT NULL COMMENT '全国订单数',
  `province_count` int(10) DEFAULT NULL COMMENT '分省订单数',
  `city_count` int(10) DEFAULT NULL COMMENT '地市订单数',
  `total_price` decimal(10,0) DEFAULT NULL COMMENT '订单总金额',
  PRIMARY KEY (`id`),
  KEY `channelName` (`channel_name`) USING BTREE,
  KEY `operatorCode` (`operator_code`) USING BTREE,
  KEY `customerName` (`customer_name`) USING BTREE,
  KEY `partnerName` (`partner_name`) USING BTREE,
  KEY `area_name` (`area_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=182341 DEFAULT CHARSET=utf8 COMMENT='订单分析报表--按天统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_suppiler_account_day`
--

DROP TABLE IF EXISTS `stat_suppiler_account_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_suppiler_account_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商账户统计',
  `supplier_code` varchar(32) DEFAULT NULL COMMENT '供应商编码',
  `recharge_amount` decimal(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `consume_amount` decimal(10,2) DEFAULT '0.00' COMMENT '消耗金额',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `current_balance` decimal(10,2) DEFAULT NULL COMMENT '当期结余',
  `success_num` bigint(20) DEFAULT '0' COMMENT '订单成功数',
  `fail_num` bigint(20) DEFAULT '0' COMMENT '订单失败数',
  `customer_consume` decimal(10,2) DEFAULT NULL COMMENT '客户代理价',
  `profit` decimal(10,2) DEFAULT '0.00' COMMENT '利润',
  `statistics_date` date DEFAULT NULL COMMENT '统计日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30466 DEFAULT CHARSET=utf8 COMMENT='供应商账户统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_suppiler_consume_day`
--

DROP TABLE IF EXISTS `stat_suppiler_consume_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_suppiler_consume_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商消耗统计ID',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '通道自增ID',
  `mobile_operator` varchar(32) DEFAULT NULL COMMENT '归属运营商',
  `channel_consume` decimal(10,2) DEFAULT '0.00' COMMENT '通道消耗',
  `customer_consume` decimal(10,2) DEFAULT '0.00' COMMENT '客户消耗',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `success_num` bigint(20) DEFAULT '0' COMMENT '成功订单数',
  `fail_num` bigint(20) DEFAULT '0' COMMENT '失败订单数',
  `statistics_date` date DEFAULT NULL COMMENT '统计日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3833 DEFAULT CHARSET=utf8 COMMENT='供应商消耗统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_suppiler_trade_day`
--

DROP TABLE IF EXISTS `stat_suppiler_trade_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_suppiler_trade_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商交易统计ID',
  `company_id` bigint(20) NOT NULL COMMENT '供应商公司ID',
  `begin_balance` decimal(30,2) DEFAULT '0.00' COMMENT '期初余额',
  `recharge_amount` decimal(30,2) DEFAULT '0.00' COMMENT '当日充值金额',
  `consume_amount` decimal(30,2) DEFAULT '0.00' COMMENT '当日消耗金额',
  `balance` decimal(30,2) DEFAULT '0.00' COMMENT '当日余额',
  `consumption_time` decimal(10,2) DEFAULT '0.00' COMMENT '消耗时间预估',
  `statistics_date` date DEFAULT NULL COMMENT '统计日期',
  `create_time` datetime DEFAULT NULL COMMENT '入库时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23329 DEFAULT CHARSET=utf8 COMMENT='供应商交易统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_suppiler_trade_day_bak20170322`
--

DROP TABLE IF EXISTS `stat_suppiler_trade_day_bak20170322`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_suppiler_trade_day_bak20170322` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商交易统计ID',
  `company_id` bigint(20) NOT NULL COMMENT '供应商公司ID',
  `begin_balance` decimal(30,2) DEFAULT '0.00' COMMENT '期初余额',
  `recharge_amount` decimal(30,2) DEFAULT '0.00' COMMENT '当日充值金额',
  `consume_amount` decimal(30,2) DEFAULT '0.00' COMMENT '当日消耗金额',
  `balance` decimal(30,2) DEFAULT '0.00' COMMENT '当日余额',
  `consumption_time` decimal(10,2) DEFAULT '0.00' COMMENT '消耗时间预估',
  `statistics_date` date DEFAULT NULL COMMENT '统计日期',
  `create_time` datetime DEFAULT NULL COMMENT '入库时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stat_supplier_flowpack_day`
--

DROP TABLE IF EXISTS `stat_supplier_flowpack_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_supplier_flowpack_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `check_time` datetime DEFAULT NULL,
  `supplier_name` varchar(32) DEFAULT NULL,
  `channel_name` varchar(32) DEFAULT NULL,
  `mobile_operator` varchar(32) DEFAULT NULL,
  `area_name` varchar(32) DEFAULT NULL,
  `flow_name` varchar(32) DEFAULT NULL,
  `flow_amount` varchar(32) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  `cost_price` bigint(20) DEFAULT NULL,
  `operator_balance_price` bigint(20) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_union_all` (`check_time`,`supplier_name`,`channel_name`,`mobile_operator`) USING BTREE,
  KEY `idx_union_part` (`check_time`,`channel_name`,`mobile_operator`)
) ENGINE=InnoDB AUTO_INCREMENT=195680 DEFAULT CHARSET=utf8 COMMENT='供应商流量包统计--天';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taobao_order_info`
--

DROP TABLE IF EXISTS `taobao_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taobao_order_info` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `order_no` varchar(128) NOT NULL COMMENT '订单号',
  `product_name` varchar(64) NOT NULL COMMENT '产品名称',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `package_id` varchar(64) DEFAULT NULL COMMENT '流量包ID',
  `nick_name` varchar(128) NOT NULL COMMENT '淘宝帐号昵称',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
  `num` int(11) NOT NULL COMMENT '数量',
  `mobile` varchar(32) NOT NULL COMMENT '充值号码',
  `phone` varchar(32) DEFAULT NULL COMMENT '收货人手机',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `flow_voucher_id` varchar(64) DEFAULT NULL COMMENT '本地流水号',
  `status` int(11) NOT NULL COMMENT '下发状态 0:未下发 1:下发成功 2:下发中 3:下发失败',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `Index_1` (`flow_voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trader_info`
--

DROP TABLE IF EXISTS `trader_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trader_info` (
  `trader_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `order_id` varchar(256) NOT NULL COMMENT '订单ID',
  `trader_status` varchar(20) NOT NULL COMMENT '状态 1、生成订单 2、充值中 0、成功 其余失败',
  `flow_amount` int(11) NOT NULL COMMENT '充值数量',
  `sale_price` double NOT NULL COMMENT '销售价格',
  `real_price` double NOT NULL COMMENT '实际价格',
  `product_name` varchar(512) NOT NULL COMMENT '产品名称',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID',
  `trader_ip` varchar(64) NOT NULL COMMENT 'IP地址',
  `sing_nature` varchar(512) NOT NULL COMMENT '订单签名',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细ID号',
  `trade_type` int(11) DEFAULT NULL COMMENT '交易类别 1:app 2:支付宝',
  PRIMARY KEY (`trader_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26796 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transmit_record`
--

DROP TABLE IF EXISTS `transmit_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transmit_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `act_id` varchar(32) NOT NULL COMMENT '活动ID',
  `open_id` varchar(64) NOT NULL COMMENT '微信OpenID',
  `union_id` varchar(256) DEFAULT NULL COMMENT '微信UnionID',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `ip` varchar(64) DEFAULT NULL COMMENT '转发者IP',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`record_id`),
  KEY `Index_1` (`act_id`,`open_id`,`input_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `version_update`
--

DROP TABLE IF EXISTS `version_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version_update` (
  `var_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `varsion_no` varchar(50) NOT NULL COMMENT '版本号',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `varsion_url` varchar(512) NOT NULL COMMENT '下载地址',
  `is_force` varchar(10) DEFAULT NULL COMMENT '为null表示不强制更新，有值则是强制更新',
  PRIMARY KEY (`var_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `version_upgrade_info`
--

DROP TABLE IF EXISTS `version_upgrade_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version_upgrade_info` (
  `version_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '版本ID',
  `app_name` varchar(64) NOT NULL COMMENT 'App名称',
  `app_type` int(11) NOT NULL COMMENT 'App类别',
  `version_no` varchar(50) NOT NULL COMMENT '版本号',
  `version_url_id` varchar(64) NOT NULL COMMENT '下载地址ID',
  `version_url` varchar(512) NOT NULL COMMENT '下载地址',
  `is_force` int(11) NOT NULL COMMENT '是否强制更新,0 :不是 1:是',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wx_access_conf`
--

DROP TABLE IF EXISTS `wx_access_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_access_conf` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `wx_name` varchar(128) NOT NULL COMMENT '微信名称',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `access_token` varchar(1024) NOT NULL COMMENT '获取到的凭证',
  `expires_time` datetime DEFAULT NULL COMMENT '凭证有效时间',
  `app_id` varchar(128) NOT NULL COMMENT '微信appid',
  `app_secret` varchar(128) NOT NULL COMMENT '微信appsecret',
  `token` varchar(128) NOT NULL COMMENT '微信token',
  `jsapi_ticket` varchar(128) DEFAULT NULL COMMENT '微信jsapiTicket',
  `jsap_expires_time` datetime DEFAULT NULL COMMENT 'JS凭证有效时间',
  `ip` varchar(64) NOT NULL COMMENT '录入者ip',
  `aes_key` varchar(128) NOT NULL COMMENT '微信aeskey',
  `wx_merchant_no` varchar(256) DEFAULT NULL COMMENT '微信支付商户号',
  `wx_pay_callback_url` varchar(512) DEFAULT NULL COMMENT '支付回调URL',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `api_key` varchar(128) DEFAULT NULL COMMENT '微信支付签名key',
  `auth_oauth2_url` varchar(128) DEFAULT NULL COMMENT '转授权跳转url',
  `auth_access_token_url` varchar(128) DEFAULT NULL COMMENT '转授权页面tokenURL',
  `auth_api_token_url` varchar(128) DEFAULT NULL COMMENT '转授权API token URL',
  `auth_sign_js_url` varchar(128) DEFAULT NULL COMMENT '转授权SIGN JS url',
  `cert_file_path` varchar(128) DEFAULT NULL COMMENT '签权文件路径',
  `cert_file_id` varchar(128) DEFAULT NULL COMMENT '签权文件ID',
  `wx_type` int(11) NOT NULL COMMENT '类别 1:自有 2:客户',
  `auth_domain` varchar(128) DEFAULT NULL COMMENT '授权域名',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `Index_1` (`customer_id`),
  CONSTRAINT `FK_Reference_42` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wx_conf_info`
--

DROP TABLE IF EXISTS `wx_conf_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_conf_info` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `wx_name` varchar(128) NOT NULL COMMENT '微信名称',
  `access_token` varchar(1024) NOT NULL COMMENT '获取到的凭证',
  `expires_time` datetime DEFAULT NULL COMMENT '凭证有效时间',
  `app_id` varchar(128) NOT NULL COMMENT '微信appid',
  `app_secret` varchar(128) NOT NULL COMMENT '微信appsecret',
  `token` varchar(128) NOT NULL COMMENT '微信token',
  `jsapi_ticket` varchar(128) DEFAULT NULL COMMENT '微信jsapiTicket',
  `jsap_expires_time` datetime DEFAULT NULL COMMENT 'JS凭证有效时间',
  `ip` varchar(64) NOT NULL COMMENT '录入者ip',
  `aes_key` varchar(128) NOT NULL COMMENT '微信aeskey',
  `wx_merchant_no` varchar(256) DEFAULT NULL COMMENT '微信支付商户号',
  `wx_pay_callback_url` varchar(512) DEFAULT NULL COMMENT '支付回调URL',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `api_key` varchar(128) DEFAULT NULL COMMENT '微信支付签名key',
  `auth_oauth2_url` varchar(128) DEFAULT NULL COMMENT '转授权跳转url',
  `auth_access_token_url` varchar(128) DEFAULT NULL COMMENT '转授权页面tokenURL',
  `auth_api_token_url` varchar(128) DEFAULT NULL COMMENT '转授权API token URL',
  `auth_sign_js_url` varchar(128) DEFAULT NULL COMMENT '转授权SIGN JS url',
  `cert_file_path` varchar(128) DEFAULT NULL COMMENT '签权文件路径',
  `cert_file_id` varchar(128) DEFAULT NULL COMMENT '签权文件ID',
  `wx_type` int(11) NOT NULL COMMENT '类别 1:自有 2:客户',
  `auth_domain` varchar(128) DEFAULT NULL COMMENT '授权域名',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `U_1` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wx_open_conf`
--

DROP TABLE IF EXISTS `wx_open_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_open_conf` (
  `wx_open_conf_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '第三方平台配置ID',
  `wx_open_name` varchar(32) NOT NULL COMMENT '第三方平台名称',
  `component_appid` varchar(32) NOT NULL COMMENT '第三方平台appid',
  `component_appsecret` varchar(256) NOT NULL COMMENT '第三方平台appsecret',
  `aes_token` varchar(256) NOT NULL COMMENT '消息校验Token',
  `encoding_aes_key` varchar(256) NOT NULL COMMENT '消息加解密Key',
  `component_verify_ticket` varchar(256) DEFAULT NULL COMMENT '验证ticket',
  `verify_ticket_push_time` datetime DEFAULT NULL COMMENT '验证ticket推送时间',
  `component_access_token` varchar(256) DEFAULT NULL COMMENT '接入token',
  `token_expire_time` datetime DEFAULT NULL COMMENT '接入token过期时间',
  `pre_auth_code` varchar(256) DEFAULT NULL COMMENT '预授权码',
  `code_expire_time` datetime DEFAULT NULL COMMENT '预授权码过期时间',
  `creator` varchar(64) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updator` varchar(64) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`wx_open_conf_id`),
  UNIQUE KEY `U_1` (`component_appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wx_pay_order_info`
--

DROP TABLE IF EXISTS `wx_pay_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_pay_order_info` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单序号',
  `fmp_order_id` varchar(50) DEFAULT NULL COMMENT '订单Id',
  `create_date` datetime DEFAULT NULL COMMENT '订单创建时间',
  `total_fee` varchar(100) DEFAULT NULL COMMENT '价格(单位：分)',
  `spbill_create_ip` varchar(512) DEFAULT NULL COMMENT '请求IP',
  `trade_type` varchar(30) NOT NULL COMMENT '订单交易类型 取值如下：JSAPI，NATIVE，APP，WAP',
  `app_id` varchar(50) NOT NULL COMMENT 'APPID',
  `open_id` varchar(100) DEFAULT NULL COMMENT 'openID',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `merchants_no` varchar(30) NOT NULL COMMENT '商户号',
  `ordr_status` int(11) NOT NULL COMMENT '订单状态 1:生成 2:生成prepay提交 3:prepay回传客户端 4:客户端完成支付 0:成功完成',
  `ordr_type` int(11) NOT NULL COMMENT '订单类型(暂时默认1(渠到直充app)，) 2:支付宝',
  `customer_id` bigint(20) NOT NULL COMMENT '客户ID',
  `need_refund` int(11) DEFAULT NULL COMMENT '是否需要退款 0:不需要 1:需要',
  `is_refund` int(11) DEFAULT NULL COMMENT '退款标识 0:未退款 1:已退款',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `send_status` int(11) DEFAULT NULL COMMENT '发送状态 0:未下发 1:下发成功 2:下发中 3:下发失败',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `ext_order_id` varchar(64) DEFAULT NULL COMMENT '外部订单号',
  `refund_order_id` varchar(64) DEFAULT NULL COMMENT '退款订单号',
  `refund_ext_order_id` varchar(64) DEFAULT NULL COMMENT '退款外部订单号',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wx_pay_record`
--

DROP TABLE IF EXISTS `wx_pay_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_pay_record` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `out_trade_no` varchar(64) NOT NULL COMMENT '支付流水号',
  `transaction_id` varchar(64) NOT NULL COMMENT '微信订单号',
  `device_info` varchar(32) DEFAULT NULL COMMENT '设备号',
  `open_id` varchar(256) NOT NULL COMMENT '微信OpenID',
  `nick_name` varchar(256) NOT NULL COMMENT '微信OpenID',
  `price` decimal(10,2) NOT NULL COMMENT '单价',
  `num` int(11) NOT NULL COMMENT '数量',
  `total_fee` decimal(10,2) NOT NULL COMMENT '总金额',
  `remark` varchar(512) NOT NULL COMMENT '备注',
  `pay_time` datetime NOT NULL COMMENT '支付时间',
  `pay_check_time` datetime DEFAULT NULL COMMENT '对账时间',
  `pay_ip` varchar(64) NOT NULL COMMENT '支付IP',
  `trade_type` varchar(64) NOT NULL COMMENT '交易类型,取值如下：JSAPI，NATIVE，APP，WAP',
  `pay_status` int(11) NOT NULL COMMENT '支付状态 0:提交待支付 1:支付成功 2:支付完成 3:支付失败',
  `pay_type` int(11) NOT NULL COMMENT '支付类型 0:贺卡',
  `pay_act_id` varchar(64) DEFAULT NULL COMMENT '支付关联活动ID',
  PRIMARY KEY (`seq_id`),
  UNIQUE KEY `U_2` (`out_trade_no`),
  KEY `U_1` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wx_user_info`
--

DROP TABLE IF EXISTS `wx_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_user_info` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '微信用户ID',
  `subscribe` int(11) DEFAULT NULL COMMENT '是否关注',
  `app_id` varchar(128) NOT NULL COMMENT '微信appid',
  `openid` varchar(64) NOT NULL COMMENT '微信openId',
  `nickname` varchar(128) DEFAULT NULL COMMENT '昵称',
  `sex` int(11) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(256) DEFAULT NULL COMMENT '城市',
  `country` varchar(256) DEFAULT NULL COMMENT '国家',
  `province` varchar(256) DEFAULT NULL COMMENT '省份',
  `headimgurl` varchar(512) DEFAULT NULL COMMENT '头像',
  `subscribe_time` bigint(20) DEFAULT NULL COMMENT '订阅时间',
  `unionid` varchar(64) DEFAULT NULL COMMENT '微信unionid',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `groupid` int(11) DEFAULT NULL COMMENT '用户所在的分组ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `U_1` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'flow_fmp'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `event_daily_channel_account_analyse` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `event_daily_channel_account_analyse` ON SCHEDULE EVERY 1 DAY STARTS '2016-08-13 01:00:00' ON COMPLETION PRESERVE DISABLE ON SLAVE DO call flow_fmp.daily_channel_account_analyse() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `event_daily_customer_manage` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `event_daily_customer_manage` ON SCHEDULE EVERY 1 DAY STARTS '2017-02-23 00:00:00' ON COMPLETION PRESERVE ENABLE DO call flow_fmp.pro_customer_manage_day() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `event_daily_customer_manage_operator` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `event_daily_customer_manage_operator` ON SCHEDULE EVERY 1 DAY STARTS '2017-02-23 01:00:00' ON COMPLETION PRESERVE ENABLE DO call flow_fmp.pro_customer_manage_operator_day() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `event_daily_customer_manage_package` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `event_daily_customer_manage_package` ON SCHEDULE EVERY 1 DAY STARTS '2017-02-23 02:00:00' ON COMPLETION PRESERVE ENABLE DO call flow_fmp.pro_customer_manage_package_day() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `event_daily_supplier_trade` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `event_daily_supplier_trade` ON SCHEDULE EVERY 1 DAY STARTS '2017-03-08 03:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT '每天统计供应商交易事件' DO CALL pro_stat_supplier_trade_day() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `event_order_analysis` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `event_order_analysis` ON SCHEDULE EVERY 1 DAY STARTS '2017-04-12 03:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT '订单分析报表' DO call flow_fmp.pro_order_analysis_day() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `event_stat_flow_manage_day` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `event_stat_flow_manage_day` ON SCHEDULE EVERY 1 DAY STARTS '2017-02-21 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO call pro_stat_flow_manage_day() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `event_stat_supplier_account` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `event_stat_supplier_account` ON SCHEDULE EVERY 1 DAY STARTS '2017-02-21 01:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT '供应商账户统计事件' DO call flow_fmp.pro_stat_supplier_account_day() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `event_stat_supplier_consume` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`172.16.%`*/ /*!50106 EVENT `event_stat_supplier_consume` ON SCHEDULE EVERY 1 DAY STARTS '2017-02-21 01:00:00' ON COMPLETION PRESERVE ENABLE COMMENT '供应商统计' DO call flow_fmp.pro_stat_supplier_consume_day() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `e_bak_flow_order_info` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `e_bak_flow_order_info` ON SCHEDULE EVERY 1 DAY STARTS '2017-04-28 05:00:00' ON COMPLETION NOT PRESERVE DISABLE ON SLAVE DO CALL pro_bak_flow_order_info(46) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `e_customer_statistics_day` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `e_customer_statistics_day` ON SCHEDULE EVERY 1 DAY STARTS '2016-08-13 01:00:00' ON COMPLETION NOT PRESERVE DISABLE ON SLAVE DO CALL pro_customer_statistics_day */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `e_supplier_flow_pack` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `e_supplier_flow_pack` ON SCHEDULE EVERY 1 DAY STARTS '2017-02-25 01:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT '供应商流量包统计计划任务' DO CALL pro_supplier_flow_pack(DATE_SUB(CURDATE(),INTERVAL 1 day)) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'flow_fmp'
--
/*!50003 DROP FUNCTION IF EXISTS `SEQ_ATTACH_TYPE_ID.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SEQ_ATTACH_TYPE_ID.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO SEQ_ATTACH_TYPE_ID (stub) VALUES ('SEQ_ATTACH_TYPE_ID');
	return LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cumstomer_manage_package_tmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`flow-stat`@`14.118.130.10` PROCEDURE `cumstomer_manage_package_tmp`()
BEGIN
	

  declare v_partner_id bigint(20) ;
  declare v_partner_name varchar(255); 
  declare v_customer_id bigint(20); 
  declare v_customer_name varchar(255);
  declare v_operator_code varchar(255);
  declare v_price varchar(255);
  declare v_channel_price varchar(255);
  DECLARE v_zone VARCHAR(32);
  declare v_package_id varchar(255); 
  declare v_expend decimal(10,2) ;
	declare v_channel_id bigint(20); 
	declare v_channel_name VARCHAR(255);
  declare v_expend_precent varchar(255);
  declare v_profit decimal(10,2) ;
  declare v_profit_precent varchar(255);
  declare v_success_order bigint(20) ;
  declare v_fail_order bigint(20) ;
  declare v_success_precent varchar(255); 
  declare v_remark varchar(255); 
  declare v_create_time datetime DEFAULT NOW() ;
  declare v_statistics_time varchar(255) ; 
	DECLARE v_start_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d %H:%i:%s'); 
	DECLARE v_end_time datetime  DEFAULT DATE_FORMAT(date_sub(curdate(),interval 0 day),'%Y-%m-%d %H:%i:%s'); 

	
	DECLARE v_expend_channel decimal(10,2);

	DECLARE v_total_order bigint(20); 

  
  DECLARE Done INT DEFAULT 0;  
 
	
	

  
  declare cursor_customers cursor for select t.enterprise_id,t.mobile_operator,t.package_id,t.channel_id from flow_order_info t WHERE t.check_time >= v_start_time AND t.check_time < v_end_time GROUP BY t.enterprise_id,t.mobile_operator,package_id,channel_id;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  
  

  select DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d') INTO v_statistics_time; 
	
  
	OPEN cursor_customers; 
	REPEAT 
  FETCH cursor_customers INTO v_customer_id,v_operator_code,v_package_id,v_channel_id;

	IF NOT Done THEN
	
	
  IF EXISTS (SELECT cu.customer_id FROM customer_info cu WHERE cu.customer_id =v_customer_id) THEN
	SELECT c.customer_name ,c.partner_id,p.partner_name INTO v_customer_name,v_partner_id,v_partner_name FROM  customer_info c 
  LEFT JOIN partner_info p ON c.partner_id = p.partner_id  WHERE c.customer_id =v_customer_id;
  END IF;

  
	SELECT c.channel_name,a.area_name into v_channel_name,v_zone from access_channel_info c LEFT JOIN area_code a ON c.zone = a.area_code WHERE c.channel_seq_id = v_channel_id;
	
	SELECT IFNULL(SUM(p.price),0) into v_channel_price FROM channel_product_info p WHERE p.channel_seq_id = v_channel_id AND p.channel_product_id = v_package_id ;
	
  SELECT IFNULL(SUM(o.price),0) into v_price FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id =v_customer_id AND o.channel_id =v_channel_id AND o.package_id =v_package_id AND o.mobile_operator=v_operator_code limit 1;
		
	SELECT IFNULL(SUM(o1.price),0),count(1),IFNULL(SUM(o1.price - o1.operator_balance_price),0) INTO v_expend,v_success_order,v_profit FROM flow_order_info o1 WHERE o1.check_time >= v_start_time AND o1.check_time < v_end_time AND o1.enterprise_id = v_customer_id AND o1.`status`='6' AND o1.channel_id =v_channel_id AND o1.package_id =v_package_id AND o1.mobile_operator=v_operator_code;
	
	SELECT count(1) INTO v_fail_order  FROM flow_order_info o2 WHERE o2.check_time >= v_start_time AND o2.check_time < v_end_time AND o2.enterprise_id = v_customer_id AND o2.`status`='4' AND o2.channel_id =v_channel_id AND o2.package_id =v_package_id AND o2.mobile_operator=v_operator_code;
	
 SELECT count(1) INTO v_total_order  FROM flow_order_info o3 WHERE o3.check_time >= v_start_time AND o3.check_time < v_end_time AND o3.enterprise_id = v_customer_id AND o3.channel_id =v_channel_id AND o3.package_id =v_package_id AND o3.mobile_operator=v_operator_code;

 SELECT ROUND(v_success_order / v_total_order *100,2) INTO v_success_precent;

 SET v_success_precent = CONCAT(v_success_precent,'%');
	
 SELECT SUM(o1.price) INTO v_expend_channel FROM flow_order_info o1 WHERE o1.check_time >= v_start_time AND o1.check_time < v_end_time AND o1.enterprise_id = v_customer_id AND o1.`status`='6'  AND o1.package_id =v_package_id AND o1.mobile_operator=v_operator_code; 
 SELECT ROUND(v_expend / v_expend_channel *100,2) INTO v_expend_precent;

 SET v_expend_precent = CONCAT(v_expend_precent,'%');
 
 SELECT CONCAT(ROUND(v_profit / v_expend *100,2),'%') INTO v_profit_precent;
	



DELETE FROM `flow_fmp`.`stat_customer_manage_package_day` WHERE customer_id = v_customer_id AND statistics_time = v_statistics_time AND operator_code =v_operator_code AND channel_id = v_channel_id AND package_id = v_package_id;

	INSERT INTO `flow_fmp`.`stat_customer_manage_package_day` (

	`partner_id`,
	`partner_name`,
	`customer_id`,
	`customer_name`,
	`operator_code`,
	`package_id`,
	`channel_id`,
	`channel_name`,
	`zone`,
	`price`,
	`channel_price`,
	`expend`,
	`expend_precent`,
	`profit`,
	`profit_precent`,
	`success_order`,
	`fail_order`,
	`success_precent`,
	`remark`,
	`create_time`,
	`statistics_time`,
`statistics_month`
)
VALUES
	(
		
		v_partner_id,
		v_partner_name,
		v_customer_id,
		v_customer_name,
		v_operator_code,
		v_package_id,
		v_channel_id,
		v_channel_name,
		v_zone,
		v_price,
		v_channel_price,
		v_expend,
		v_expend_precent,
		v_profit,
		v_profit_precent,
		v_success_order,
		v_fail_order,
		v_success_precent,
		v_remark,
		v_start_time,
		v_statistics_time,
		DATE_FORMAT(v_statistics_time,'%Y-%m')
	);



	END IF;
	
	UNTIL Done END REPEAT;
	CLOSE cursor_customers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_manage_opeator_tmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`flow-stat`@`14.118.130.10` PROCEDURE `customer_manage_opeator_tmp`()
BEGIN
	

  declare v_partner_id bigint(20) ;
  declare v_partner_name varchar(255); 
  declare v_customer_id bigint(20); 
  declare v_customer_name varchar(255);
  declare v_operator_code varchar(255);
  declare v_supplier_code varchar(255);
  declare v_supplier_name varchar(255);
  DECLARE v_zone VARCHAR(32);
  declare v_channel_discount DECIMAL(10,2); 
  DECLARE v_flow_package_size BIGINT(20);
  declare v_expend decimal(10,2) ;
  DECLARE v_channel_id BIGINT(10);
   DECLARE v_channel_name varchar(255);
  declare v_expend_precent varchar(255);
  declare v_profit decimal(10,2) ;
  declare v_profit_precent varchar(255);
  declare v_success_order bigint(20) ;
  declare v_fail_order bigint(20) ;
  declare v_success_precent varchar(255); 
  declare v_remark varchar(255); 
  declare v_create_time datetime DEFAULT NOW() ;
  declare v_statistics_time varchar(255) ; 
	DECLARE v_start_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d %H:%i:%s'); 
	DECLARE v_end_time datetime  DEFAULT DATE_FORMAT(date_sub(curdate(),interval 0 day),'%Y-%m-%d %H:%i:%s'); 

	
	DECLARE v_expend_channel decimal(10,2);

	DECLARE v_total_order bigint(20); 
  
  DECLARE Done INT DEFAULT 0;  
 
  
  declare cursor_customers cursor for select t.enterprise_id,t.mobile_operator,t.channel_id from flow_order_info t WHERE t.check_time >= v_start_time AND t.check_time < v_end_time GROUP BY t.enterprise_id,t.mobile_operator,t.channel_id;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  
  

  select DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d') INTO v_statistics_time; 
	
  
	OPEN cursor_customers; 
	REPEAT 
  FETCH cursor_customers INTO v_customer_id,v_operator_code,v_channel_id;

	IF NOT Done THEN
	
	
  IF EXISTS (SELECT cu.customer_id FROM customer_info cu WHERE cu.customer_id =v_customer_id) THEN
	SELECT c.customer_name ,c.partner_id,p.partner_name INTO v_customer_name,v_partner_id,v_partner_name FROM  customer_info c 
  LEFT JOIN partner_info p ON c.partner_id = p.partner_id  WHERE c.customer_id =v_customer_id;
  END IF;

  
	SELECT c.channel_name,c.discount,a.area_name,c.supplier_code,s.supplier_name into v_channel_name,v_channel_discount,v_zone,v_supplier_code,v_supplier_name from access_channel_info c LEFT JOIN area_code a ON c.zone = a.area_code LEFT JOIN channel_supplier s ON s.supplier_code = c.supplier_code WHERE c.channel_seq_id = v_channel_id;
	
	
select count(DISTINCT(t.package_id)) INTO v_flow_package_size from flow_order_info t WHERE t.check_time >= v_start_time AND t.check_time < v_end_time and t.enterprise_id = v_customer_id AND t.mobile_operator = v_operator_code AND t.channel_id = v_channel_id ;
	
		
	SELECT IFNULL(SUM(o1.price),0),count(1),IFNULL(SUM(o1.price - o1.operator_balance_price),0) INTO v_expend,v_success_order,v_profit FROM flow_order_info o1 WHERE o1.check_time >= v_start_time AND o1.check_time < v_end_time AND o1.enterprise_id = v_customer_id AND o1.`status`='6' AND o1.channel_id =v_channel_id AND o1.mobile_operator=v_operator_code;
	
	SELECT count(1) INTO v_fail_order  FROM flow_order_info o2 WHERE o2.check_time >= v_start_time AND o2.check_time < v_end_time AND o2.enterprise_id = v_customer_id AND o2.`status`='4' AND o2.channel_id =v_channel_id  AND o2.mobile_operator=v_operator_code;
	
 SELECT count(1) INTO v_total_order  FROM flow_order_info o3 WHERE o3.check_time >= v_start_time AND o3.check_time < v_end_time AND o3.enterprise_id = v_customer_id AND o3.channel_id =v_channel_id  AND o3.mobile_operator=v_operator_code;

 SELECT ROUND(v_success_order / v_total_order *100,2) INTO v_success_precent;

 SET v_success_precent = CONCAT(v_success_precent,'%');
	
 SELECT IFNULL(SUM(o1.price),0) INTO v_expend_channel FROM flow_order_info o1 WHERE o1.check_time >= v_start_time AND o1.check_time < v_end_time AND o1.enterprise_id = v_customer_id AND o1.`status`='6'   AND o1.mobile_operator=v_operator_code; 
 SELECT ROUND(v_expend / v_expend_channel *100,2) INTO v_expend_precent;

 SET v_expend_precent = CONCAT(v_expend_precent,'%');
 
 IF v_expend =0 THEN
	SET v_profit_precent='0.00%';
 ELSE
SELECT CONCAT(ROUND(v_profit / v_expend *100,2),'%') INTO v_profit_precent;
 end IF;
 
	



DELETE FROM `flow_fmp`.`stat_customer_manage_operator_day` WHERE customer_id = v_customer_id AND statistics_time = v_statistics_time AND operator_code =v_operator_code AND channel_id = v_channel_id ;

	INSERT INTO `flow_fmp`.`stat_customer_manage_operator_day` (
	
	`partner_id`,
	`partner_name`,
	`customer_id`,
	`customer_name`,
	`operator_code`,
	`channel_id`,
	`channel_name`,
	`supplier_code`,
	`supplier_name`,
	`zone`,
	`channel_discount`,
	`flow_package_size`,
	`expend`,
	`expend_precent`,
	`profit`,
	`profit_precent`,
	`success_order`,
	`fail_order`,
	`success_precent`,
	`remark`,
	`create_time`,
	`statistics_time`,
`statistics_month`
)
VALUES
	(
		
		v_partner_id,
		v_partner_name,
		v_customer_id,
		v_customer_name,
		v_operator_code,
		v_channel_id,
		v_channel_name,
		v_supplier_code,
		v_supplier_name,
		v_zone,
		v_channel_discount,
		v_flow_package_size,
		v_expend,
		v_expend_precent,
		v_profit,
		v_profit_precent,
		v_success_order,
		v_fail_order,
		v_success_precent,
		v_remark,
		v_create_time,
		v_statistics_time,
		DATE_FORMAT(v_statistics_time,'%Y-%m')
	);




	END IF;
	
	UNTIL Done END REPEAT;
	CLOSE cursor_customers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_manage_tmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`flow-stat`@`14.118.130.10` PROCEDURE `customer_manage_tmp`()
BEGIN
	
  declare v_partner_id bigint(20) ;
  declare v_partner_name varchar(255); 
  declare v_customer_id bigint(20); 
  declare v_customer_name varchar(255);
  declare v_customer_status tinyint(255);
  declare v_before_balance bigint(255); 
  declare v_expend decimal(10,2) ;
  declare v_recharge decimal(10,2) ;
  declare v_expend_precent varchar(255);
  declare v_current_balance decimal(10,2);
  declare v_profit decimal(10,2) ;
  declare v_profit_precent varchar(255);
  declare v_success_order bigint(20) ;
  declare v_fail_order bigint(20) ;
  declare v_success_precent varchar(255); 
  declare v_remark varchar(255); 
  declare v_create_time datetime DEFAULT NOW() ;
  declare v_statistics_time varchar(32) ; 
	DECLARE v_start_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 7 day),'%Y-%m-%d %H:%i:%s'); 
	DECLARE v_start_before_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 8 day),'%Y-%m-%d %H:%i:%s'); 
  
	DECLARE v_end_time datetime  DEFAULT DATE_FORMAT(date_sub(curdate(),interval 6 day),'%Y-%m-%d %H:%i:%s'); 

	DECLARE v_end_before_time datetime  DEFAULT DATE_FORMAT(date_sub(curdate(),interval 7 day),'%Y-%m-%d %H:%i:%s'); 
	DECLARE v_expend_before decimal(10,2) ;
	DECLARE v_total_order bigint(20); 
	DECLARE v_customer_balance DECIMAL(10.2);
  
  DECLARE Done INT DEFAULT 0;  
 


  
  declare cursor_customers cursor for SELECT customer_id FROM `customer_info` WHERE is_deleted = 0;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  
  

	
	 
	 

  select DATE_FORMAT(date_sub(curdate(),interval 7 day),'%Y-%m-%d') INTO v_statistics_time; 
	
  
	OPEN cursor_customers; 
	REPEAT 
  FETCH cursor_customers INTO v_customer_id;

	IF NOT Done THEN

	
  IF EXISTS (SELECT cu.customer_id FROM customer_info cu WHERE cu.customer_id =v_customer_id) THEN
	SELECT c.customer_name ,c.`status` ,c.partner_id,p.partner_name,c.balance INTO v_customer_name,v_customer_status,v_partner_id,v_partner_name,v_customer_balance  FROM  customer_info c 
  LEFT JOIN partner_info p ON c.partner_id = p.partner_id  WHERE c.customer_id =v_customer_id;
END IF;
		
	SELECT IFNULL(SUM(o.price),0),count(1),IFNULL(SUM(o.price - o.operator_balance_price),0) INTO v_expend,v_success_order,v_profit FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id = v_customer_id AND o.`status`='6';
	
	SELECT count(1) INTO v_fail_order  FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id = v_customer_id AND o.`status`='4';
	SELECT count(1) INTO v_total_order  FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id = v_customer_id;

	SELECT ROUND(v_success_order / v_total_order *100,2) INTO v_success_precent;
  SET v_success_precent = CONCAT(v_success_precent,'%');
	

	SELECT IFNULL(SUM(o.price),0) INTO v_expend_before FROM flow_order_info o WHERE o.check_time >= v_start_before_time AND o.check_time < v_end_before_time AND o.enterprise_id = v_customer_id AND o.`status`='6';
	SELECT v_customer_balance - v_expend_before  INTO v_before_balance;

  SELECT IFNULL(SUM(tr.trade_amount),0) INTO v_recharge FROM  customer_trade_flow tr WHERE tr.trade_type = 2 AND tr.input_time >=v_start_time AND tr.input_time < v_end_time AND tr.customer_id =v_customer_id;
 
  SELECT CONCAT(ROUND(v_expend / (v_before_balance + v_recharge) *100,2),'%') INTO v_expend_precent;
  SELECT CONCAT(ROUND(v_profit / v_expend *100,2),'%') INTO v_profit_precent;
	

	SELECT v_before_balance + v_recharge -v_expend INTO v_current_balance;


DELETE FROM `flow_fmp`.`stat_customer_manage_day`  WHERE customer_id = v_customer_id AND statistics_time = v_statistics_time;

	INSERT INTO `flow_fmp`.`stat_customer_manage_day` (
	
	`partner_id`,
	`partner_name`,
	`customer_id`,
	`customer_name`,
	`customer_status`,
	`before_balance`,
	`expend`,
	`recharge`,
	`expend_precent`,
	`current_balance`,
	`profit`,
	`profit_precent`,
	`success_order`,
	`fail_order`,
	`success_precent`,
	`remark`,
	`create_time`,
	`statistics_time`,
	`statistics_month`
)
VALUES
	(
		v_partner_id,
		v_partner_name,
		v_customer_id,
		v_customer_name,
		v_customer_status,
		v_before_balance,
		v_expend,
		v_recharge,
		v_expend_precent,
		v_current_balance,
		v_profit,
		v_profit_precent,
		v_success_order,
		v_fail_order,
		v_success_precent,
		v_remark,
		v_create_time,
		v_statistics_time,
		DATE_FORMAT(v_statistics_time,'%Y-%m')
	);

	END IF;
	
	UNTIL Done END REPEAT;
	CLOSE cursor_customers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `daily_channel_account_analyse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `daily_channel_account_analyse`()
BEGIN
INSERT INTO flow_fmp.channel_account_analyse(supplier_code,
    supplier_name,
    channel_id,
    channel_name,
    analyse_date,
    sent_count,
    sent_origin_price,
    sent_customer_price,
    sent_channel_price,
    fail_count,
    fail_origin_price,
    fail_customer_price,
    fail_channel_price,
    succ_count,
    succ_origin_price,
    succ_customer_price,
    succ_channel_price,
    profit) SELECT 
    cs.supplier_code,
    cs.supplier_name,
    aci.channel_seq_id as channel_id,
    aci.channel_name,
    IFNULL(DATE(foi.check_time),DATE(foi.apply_date)) analyse_date,
    SUM(CASE
        WHEN foi.status = 2 THEN 1
        ELSE 0
    END) AS sent_count,
    SUM(CASE
        WHEN foi.status = 2 THEN fpi.sale_price
        ELSE 0
    END) AS sent_origin_price,
    SUM(CASE
        WHEN foi.status = 2 THEN foi.price
        ELSE 0
    END) AS sent_customer_price,
    SUM(CASE
        WHEN foi.status = 2 THEN foi.operator_balance_price
        ELSE 0
    END) AS sent_channel_price,
    SUM(CASE
        WHEN foi.status = 4 THEN 1
        ELSE 0
    END) AS fail_count,
    SUM(CASE
        WHEN foi.status = 4 THEN fpi.sale_price
        ELSE 0
    END) AS fail_origin_price,
    SUM(CASE
        WHEN foi.status = 4 THEN foi.price
        ELSE 0
    END) AS fail_customer_price,
    SUM(CASE
        WHEN foi.status = 4 THEN foi.operator_balance_price
        ELSE 0
    END) AS fail_channel_price,
    SUM(CASE
        WHEN foi.status = 6 THEN 1
        ELSE 0
    END) AS succ_count,
    SUM(CASE
        WHEN foi.status = 6 THEN fpi.sale_price
        ELSE 0
    END) AS succ_origin_price,
    SUM(CASE
        WHEN foi.status = 6 THEN foi.price
        ELSE 0
    END) AS succ_customer_price,
    SUM(CASE
        WHEN foi.status = 6 THEN foi.operator_balance_price
        ELSE 0
    END) AS succ_channel_price,
    SUM(CASE
        WHEN foi.status = 6 THEN foi.price - foi.operator_balance_price
        ELSE 0
    END) AS profit
FROM
    flow_fmp.flow_order_info foi
        LEFT JOIN
    flow_fmp.access_channel_info aci ON foi.channel_id = aci.channel_seq_id
        LEFT JOIN
    flow_fmp.channel_supplier cs ON aci.supplier_code = cs.supplier_code
LEFT JOIN
flow_fmp.flow_package_info fpi ON foi.package_id = fpi.package_id
WHERE
    DATE(foi.check_time) = DATE_SUB(CURDATE(), INTERVAL 1 DAY) 
OR (`status`='2' AND apply_date BETWEEN concat(date_sub(curdate(),interval 1 day)," 00:00:00") AND concat(date_sub(curdate(),interval 1 day)," 23:59:59"))
GROUP BY foi.channel_id , aci.supplier_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_bak_flow_order_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_bak_flow_order_info`(IN `days` int)
BEGIN
DECLARE t_error INTEGER DEFAULT 0;
DECLARE orderId VARCHAR(255);
DECLARE done INT DEFAULT FALSE;
DECLARE cur_orderId CURSOR FOR 
SELECT order_id 
FROM flow_order_info 
WHERE apply_date <= CONCAT(date_sub(curdate(),interval days day),' 23:59:59');    

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;
START TRANSACTION;
OPEN cur_orderId;
read_loop: LOOP
FETCH cur_orderId INTO orderId;
IF done THEN
LEAVE read_loop;
END IF;
insert into flow_order_info_his SELECT * FROM flow_order_info where order_id = orderId;
insert into mobile_flow_dispatch_rec_his SELECT * FROM mobile_flow_dispatch_rec where order_id = orderId;
delete from mobile_flow_dispatch_rec WHERE order_id = orderId;
delete from flow_order_info where order_id = orderId;
END LOOP;
CLOSE cur_orderId;
IF t_error = 1 THEN  
ROLLBACK;
ELSE  
COMMIT;  
END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_customer_manage_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_customer_manage_day`()
BEGIN

  declare v_partner_id bigint(20) ;
  declare v_partner_name varchar(255); 
  declare v_customer_id bigint(20); 
  declare v_customer_name varchar(255);
  declare v_customer_status tinyint(255);
  declare v_before_balance bigint(255); 
  declare v_expend decimal(10,2) ;
  declare v_recharge decimal(10,2) ;
  declare v_expend_precent varchar(255);
  declare v_current_balance decimal(10,2);
  declare v_profit decimal(10,2) ;
  declare v_profit_precent varchar(255);
  declare v_success_order bigint(20) ;
  declare v_fail_order bigint(20) ;
  declare v_success_precent varchar(255); 
  declare v_remark varchar(255); 
  declare v_create_time datetime DEFAULT NOW() ;
  declare v_statistics_time varchar(32) ; 
DECLARE v_start_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d %H:%i:%s'); 
DECLARE v_start_before_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 2 day),'%Y-%m-%d %H:%i:%s'); 
  
DECLARE v_end_time datetime  DEFAULT DATE_FORMAT(curdate(),'%Y-%m-%d %H:%i:%s'); 

DECLARE v_end_before_time datetime  DEFAULT DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d %H:%i:%s'); 
DECLARE v_expend_before decimal(10,2) ;
DECLARE v_total_order bigint(20); 
DECLARE v_customer_balance DECIMAL(10.2);
  
  DECLARE Done INT DEFAULT 0;  
 


  
  declare cursor_customers cursor for SELECT customer_id FROM `customer_info` WHERE is_deleted = 0;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  
  


 
 

  select DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d') INTO v_statistics_time; 

  
OPEN cursor_customers; 
REPEAT 
  FETCH cursor_customers INTO v_customer_id;

IF NOT Done THEN


  IF EXISTS (SELECT cu.customer_id FROM customer_info cu WHERE cu.customer_id =v_customer_id) THEN
SELECT c.customer_name ,c.`status` ,c.partner_id,p.partner_name,c.balance INTO v_customer_name,v_customer_status,v_partner_id,v_partner_name,v_customer_balance  FROM  customer_info c 
  LEFT JOIN partner_info p ON c.partner_id = p.partner_id  WHERE c.customer_id =v_customer_id;
END IF;

SELECT IFNULL(SUM(o.price),0),count(1),IFNULL(SUM(o.price - o.operator_balance_price),0) INTO v_expend,v_success_order,v_profit FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id = v_customer_id AND o.`status`='6';

SELECT count(1) INTO v_fail_order  FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id = v_customer_id AND o.`status`='4';
SELECT count(1) INTO v_total_order  FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id = v_customer_id;

SELECT ROUND(v_success_order / v_total_order *100,2) INTO v_success_precent;
  SET v_success_precent = CONCAT(v_success_precent,'%');


SELECT IFNULL(SUM(o.price),0) INTO v_expend_before FROM flow_order_info o WHERE o.check_time >= v_start_before_time AND o.check_time < v_end_before_time AND o.enterprise_id = v_customer_id AND o.`status`='6';
SELECT v_customer_balance - v_expend_before  INTO v_before_balance;

  SELECT IFNULL(SUM(tr.trade_amount),0) INTO v_recharge FROM  customer_trade_flow tr WHERE tr.trade_type = 2 AND tr.input_time >=v_start_time AND tr.input_time < v_end_time AND tr.customer_id =v_customer_id;
 
  SELECT CONCAT(ROUND(v_expend / (v_before_balance + v_recharge) *100,2),'%') INTO v_expend_precent;
  SELECT CONCAT(ROUND(v_profit / v_expend *100,2),'%') INTO v_profit_precent;


SELECT v_before_balance -v_expend INTO v_current_balance;


DELETE FROM `flow_fmp`.`stat_customer_manage_day`  WHERE customer_id = v_customer_id AND statistics_time = v_statistics_time;

INSERT INTO `flow_fmp`.`stat_customer_manage_day` (

`partner_id`,
`partner_name`,
`customer_id`,
`customer_name`,
`customer_status`,
`before_balance`,
`expend`,
`recharge`,
`expend_precent`,
`current_balance`,
`profit`,
`profit_precent`,
`success_order`,
`fail_order`,
`success_precent`,
`remark`,
`create_time`,
`statistics_time`,
`statistics_month`
)
VALUES
(
v_partner_id,
v_partner_name,
v_customer_id,
v_customer_name,
v_customer_status,
v_before_balance,
v_expend,
v_recharge,
v_expend_precent,
v_current_balance,
v_profit,
v_profit_precent,
v_success_order,
v_fail_order,
v_success_precent,
v_remark,
v_create_time,
v_statistics_time,
DATE_FORMAT(v_statistics_time,'%Y-%m')
);

END IF;

UNTIL Done END REPEAT;
CLOSE cursor_customers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_customer_manage_day_tmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`flow-stat`@`14.118.130.10` PROCEDURE `pro_customer_manage_day_tmp`()
BEGIN
	
  declare v_partner_id bigint(20) ;
  declare v_partner_name varchar(255); 
  declare v_customer_id bigint(20); 
  declare v_customer_name varchar(255);
  declare v_customer_status tinyint(255);
  declare v_before_balance bigint(255); 
  declare v_expend decimal(10,2) ;
  declare v_recharge decimal(10,2) ;
  declare v_expend_precent varchar(255);
  declare v_current_balance decimal(10,2);
  declare v_profit decimal(10,2) ;
  declare v_profit_precent varchar(255);
  declare v_success_order bigint(20) ;
  declare v_fail_order bigint(20) ;
  declare v_success_precent varchar(255); 
  declare v_remark varchar(255); 
  declare v_create_time datetime DEFAULT NOW() ;
  declare v_statistics_time varchar(32) ; 
	DECLARE v_start_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d %H:%i:%s'); 
	DECLARE v_start_before_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 2 day),'%Y-%m-%d %H:%i:%s'); 
  
	DECLARE v_end_time datetime  DEFAULT DATE_FORMAT(curdate(),'%Y-%m-%d %H:%i:%s'); 

	DECLARE v_end_before_time datetime  DEFAULT DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d %H:%i:%s'); 
	DECLARE v_expend_before decimal(10,2) ;
	DECLARE v_total_order bigint(20); 
	DECLARE v_customer_balance DECIMAL(10.2);
  
  DECLARE Done INT DEFAULT 0;  
 


  
  declare cursor_customers cursor for SELECT customer_id FROM `customer_info` WHERE is_deleted = 0;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  
  

	
	 
	 

  select DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d') INTO v_statistics_time; 
	
  
	OPEN cursor_customers; 
	REPEAT 
  FETCH cursor_customers INTO v_customer_id;

	IF NOT Done THEN

	
  IF EXISTS (SELECT cu.customer_id FROM customer_info cu WHERE cu.customer_id =v_customer_id) THEN
	SELECT c.customer_name ,c.`status` ,c.partner_id,p.partner_name,c.balance INTO v_customer_name,v_customer_status,v_partner_id,v_partner_name,v_customer_balance  FROM  customer_info c 
  LEFT JOIN partner_info p ON c.partner_id = p.partner_id  WHERE c.customer_id =v_customer_id;
END IF;
		
	SELECT IFNULL(SUM(o.price),0),count(1),IFNULL(SUM(o.price - o.operator_balance_price),0) INTO v_expend,v_success_order,v_profit FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id = v_customer_id AND o.`status`='6';
	
	SELECT count(1) INTO v_fail_order  FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id = v_customer_id AND o.`status`='4';
	SELECT count(1) INTO v_total_order  FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id = v_customer_id;

	SELECT ROUND(v_success_order / v_total_order *100,2) INTO v_success_precent;
  SET v_success_precent = CONCAT(v_success_precent,'%');
	

	SELECT IFNULL(SUM(o.price),0) INTO v_expend_before FROM flow_order_info o WHERE o.check_time >= v_start_before_time AND o.check_time < v_end_before_time AND o.enterprise_id = v_customer_id AND o.`status`='6';
	SELECT v_customer_balance - v_expend_before  INTO v_before_balance;

  SELECT IFNULL(SUM(tr.trade_amount),0) INTO v_recharge FROM  customer_trade_flow tr WHERE tr.trade_type = 2 AND tr.input_time >=v_start_time AND tr.input_time < v_end_time AND tr.customer_id =v_customer_id;
 
  SELECT CONCAT(ROUND(v_expend / (v_before_balance + v_recharge) *100,2),'%') INTO v_expend_precent;
  SELECT CONCAT(ROUND(v_profit / v_expend *100,2),'%') INTO v_profit_precent;
	

	SELECT v_before_balance -v_expend INTO v_current_balance;


DELETE FROM `flow_fmp`.`stat_customer_manage_day`  WHERE customer_id = v_customer_id AND statistics_time = v_statistics_time;

	INSERT INTO `flow_fmp`.`stat_customer_manage_day` (
	
	`partner_id`,
	`partner_name`,
	`customer_id`,
	`customer_name`,
	`customer_status`,
	`before_balance`,
	`expend`,
	`recharge`,
	`expend_precent`,
	`current_balance`,
	`profit`,
	`profit_precent`,
	`success_order`,
	`fail_order`,
	`success_precent`,
	`remark`,
	`create_time`,
	`statistics_time`,
	`statistics_month`
)
VALUES
	(
		v_partner_id,
		v_partner_name,
		v_customer_id,
		v_customer_name,
		v_customer_status,
		v_before_balance,
		v_expend,
		v_recharge,
		v_expend_precent,
		v_current_balance,
		v_profit,
		v_profit_precent,
		v_success_order,
		v_fail_order,
		v_success_precent,
		v_remark,
		v_create_time,
		v_statistics_time,
		DATE_FORMAT(v_statistics_time,'%Y-%m')
	);

	END IF;
	
	UNTIL Done END REPEAT;
	CLOSE cursor_customers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_customer_manage_operator_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_customer_manage_operator_day`()
    COMMENT '客户运营商消耗'
BEGIN
	

  declare v_partner_id bigint(20) ;
  declare v_partner_name varchar(255); 
  declare v_customer_id bigint(20); 
  declare v_customer_name varchar(255);
  declare v_operator_code varchar(255);
  declare v_supplier_code varchar(255);
  declare v_supplier_name varchar(255);
  DECLARE v_zone VARCHAR(32);
  declare v_channel_discount DECIMAL(10,2); 
  DECLARE v_flow_package_size BIGINT(20);
  declare v_expend decimal(10,2) ;
  DECLARE v_channel_id BIGINT(10);
   DECLARE v_channel_name varchar(255);
  declare v_expend_precent varchar(255);
  declare v_profit decimal(10,2) ;
  declare v_profit_precent varchar(255);
  declare v_success_order bigint(20) ;
  declare v_fail_order bigint(20) ;
  declare v_success_precent varchar(255); 
  declare v_remark varchar(255); 
  declare v_create_time datetime DEFAULT NOW() ;
  declare v_statistics_time varchar(255) ; 
	DECLARE v_start_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d %H:%i:%s'); 
	DECLARE v_end_time datetime  DEFAULT DATE_FORMAT(curdate(),'%Y-%m-%d %H:%i:%s'); 

	
	DECLARE v_expend_channel decimal(10,2);

	DECLARE v_total_order bigint(20); 
  
  DECLARE Done INT DEFAULT 0;  
 
  
  declare cursor_customers cursor for select t.enterprise_id,t.mobile_operator,t.channel_id from flow_order_info t WHERE t.check_time >= v_start_time AND t.check_time < v_end_time GROUP BY t.enterprise_id,t.mobile_operator,t.channel_id;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  
  

  select DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d') INTO v_statistics_time; 
	
  
	OPEN cursor_customers; 
	REPEAT 
  FETCH cursor_customers INTO v_customer_id,v_operator_code,v_channel_id;

	IF NOT Done THEN
	
	
  IF EXISTS (SELECT cu.customer_id FROM customer_info cu WHERE cu.customer_id =v_customer_id) THEN
	SELECT c.customer_name ,c.partner_id,p.partner_name INTO v_customer_name,v_partner_id,v_partner_name FROM  customer_info c 
  LEFT JOIN partner_info p ON c.partner_id = p.partner_id  WHERE c.customer_id =v_customer_id;
  END IF;

  
	SELECT c.channel_name,c.discount,a.area_name,c.supplier_code,s.supplier_name into v_channel_name,v_channel_discount,v_zone,v_supplier_code,v_supplier_name from access_channel_info c LEFT JOIN area_code a ON c.zone = a.area_code LEFT JOIN channel_supplier s ON s.supplier_code = c.supplier_code WHERE c.channel_seq_id = v_channel_id;
	
	
select count(DISTINCT(t.package_id)) INTO v_flow_package_size from flow_order_info t WHERE t.check_time >= v_start_time AND t.check_time < v_end_time and t.enterprise_id = v_customer_id AND t.mobile_operator = v_operator_code AND t.channel_id = v_channel_id ;
	
		
	SELECT IFNULL(SUM(o1.price),0),count(1),IFNULL(SUM(o1.price - o1.operator_balance_price),0) INTO v_expend,v_success_order,v_profit FROM flow_order_info o1 WHERE o1.check_time >= v_start_time AND o1.check_time < v_end_time AND o1.enterprise_id = v_customer_id AND o1.`status`='6' AND o1.channel_id =v_channel_id AND o1.mobile_operator=v_operator_code;
	
	SELECT count(1) INTO v_fail_order  FROM flow_order_info o2 WHERE o2.check_time >= v_start_time AND o2.check_time < v_end_time AND o2.enterprise_id = v_customer_id AND o2.`status`='4' AND o2.channel_id =v_channel_id  AND o2.mobile_operator=v_operator_code;
	
 SELECT count(1) INTO v_total_order  FROM flow_order_info o3 WHERE o3.check_time >= v_start_time AND o3.check_time < v_end_time AND o3.enterprise_id = v_customer_id AND o3.channel_id =v_channel_id  AND o3.mobile_operator=v_operator_code;

 SELECT ROUND(v_success_order / v_total_order *100,2) INTO v_success_precent;

 SET v_success_precent = CONCAT(v_success_precent,'%');
	
 SELECT IFNULL(SUM(o1.price),0) INTO v_expend_channel FROM flow_order_info o1 WHERE o1.check_time >= v_start_time AND o1.check_time < v_end_time AND o1.enterprise_id = v_customer_id AND o1.`status`='6'   AND o1.mobile_operator=v_operator_code; 
 SELECT ROUND(v_expend / v_expend_channel *100,2) INTO v_expend_precent;

 SET v_expend_precent = CONCAT(v_expend_precent,'%');
 
 IF v_expend =0 THEN
	SET v_profit_precent='0.00%';
 ELSE
SELECT CONCAT(ROUND(v_profit / v_expend *100,2),'%') INTO v_profit_precent;
 end IF;
 
	



DELETE FROM `flow_fmp`.`stat_customer_manage_operator_day` WHERE customer_id = v_customer_id AND statistics_time = v_statistics_time AND operator_code =v_operator_code AND channel_id = v_channel_id ;

	INSERT INTO `flow_fmp`.`stat_customer_manage_operator_day` (
	
	`partner_id`,
	`partner_name`,
	`customer_id`,
	`customer_name`,
	`operator_code`,
	`channel_id`,
	`channel_name`,
	`supplier_code`,
	`supplier_name`,
	`zone`,
	`channel_discount`,
	`flow_package_size`,
	`expend`,
	`expend_precent`,
	`profit`,
	`profit_precent`,
	`success_order`,
	`fail_order`,
	`success_precent`,
	`remark`,
	`create_time`,
	`statistics_time`,
`statistics_month`
)
VALUES
	(
		
		v_partner_id,
		v_partner_name,
		v_customer_id,
		v_customer_name,
		v_operator_code,
		v_channel_id,
		v_channel_name,
		v_supplier_code,
		v_supplier_name,
		v_zone,
		v_channel_discount,
		v_flow_package_size,
		v_expend,
		v_expend_precent,
		v_profit,
		v_profit_precent,
		v_success_order,
		v_fail_order,
		v_success_precent,
		v_remark,
		v_create_time,
		v_statistics_time,
		DATE_FORMAT(v_statistics_time,'%Y-%m')
	);




	END IF;
	
	UNTIL Done END REPEAT;
	CLOSE cursor_customers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_customer_manage_package_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_customer_manage_package_day`()
    COMMENT '客户流量包日统计'
BEGIN
	

  declare v_partner_id bigint(20) ;
  declare v_partner_name varchar(255); 
  declare v_customer_id bigint(20); 
  declare v_customer_name varchar(255);
  declare v_operator_code varchar(255);
  declare v_price varchar(255);
  declare v_channel_price varchar(255);
  DECLARE v_zone VARCHAR(32);
  declare v_package_id varchar(255); 
  declare v_expend decimal(10,2) ;
	declare v_channel_id bigint(20); 
	declare v_channel_name VARCHAR(255);
  declare v_expend_precent varchar(255);
  declare v_profit decimal(10,2) ;
  declare v_profit_precent varchar(255);
  declare v_success_order bigint(20) ;
  declare v_fail_order bigint(20) ;
  declare v_success_precent varchar(255); 
  declare v_remark varchar(255); 
  declare v_create_time datetime DEFAULT NOW() ;
  declare v_statistics_time varchar(255) ; 
	DECLARE v_start_time datetime DEFAULT  DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d %H:%i:%s'); 
	DECLARE v_end_time datetime  DEFAULT DATE_FORMAT(curdate(),'%Y-%m-%d %H:%i:%s'); 

	
	DECLARE v_expend_channel decimal(10,2);

	DECLARE v_total_order bigint(20); 

  
  DECLARE Done INT DEFAULT 0;  
 
	
	

  
  declare cursor_customers cursor for select t.enterprise_id,t.mobile_operator,t.package_id,t.channel_id from flow_order_info t WHERE t.check_time >= v_start_time AND t.check_time < v_end_time GROUP BY t.enterprise_id,t.mobile_operator,package_id,channel_id;


	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  
  

  select DATE_FORMAT(date_sub(curdate(),interval 1 day),'%Y-%m-%d') INTO v_statistics_time; 
	
  
	OPEN cursor_customers; 
	REPEAT 
  FETCH cursor_customers INTO v_customer_id,v_operator_code,v_package_id,v_channel_id;

	IF NOT Done THEN
	
	
  IF EXISTS (SELECT cu.customer_id FROM customer_info cu WHERE cu.customer_id =v_customer_id) THEN
	SELECT c.customer_name ,c.partner_id,p.partner_name INTO v_customer_name,v_partner_id,v_partner_name FROM  customer_info c 
  LEFT JOIN partner_info p ON c.partner_id = p.partner_id  WHERE c.customer_id =v_customer_id;
  END IF;

  
	SELECT c.channel_name,a.area_name into v_channel_name,v_zone from access_channel_info c LEFT JOIN area_code a ON c.zone = a.area_code WHERE c.channel_seq_id = v_channel_id;
	
	SELECT IFNULL(SUM(p.price),0) into v_channel_price FROM channel_product_info p WHERE p.channel_seq_id = v_channel_id AND p.channel_product_id = v_package_id ;
	
  SELECT IFNULL(SUM(o.price),0) into v_price FROM flow_order_info o WHERE o.check_time >= v_start_time AND o.check_time < v_end_time AND o.enterprise_id =v_customer_id AND o.channel_id =v_channel_id AND o.package_id =v_package_id AND o.mobile_operator=v_operator_code limit 1;
		
	SELECT IFNULL(SUM(o1.price),0),count(1),IFNULL(SUM(o1.price - o1.operator_balance_price),0) INTO v_expend,v_success_order,v_profit FROM flow_order_info o1 WHERE o1.check_time >= v_start_time AND o1.check_time < v_end_time AND o1.enterprise_id = v_customer_id AND o1.`status`='6' AND o1.channel_id =v_channel_id AND o1.package_id =v_package_id AND o1.mobile_operator=v_operator_code;
	
	SELECT count(1) INTO v_fail_order  FROM flow_order_info o2 WHERE o2.check_time >= v_start_time AND o2.check_time < v_end_time AND o2.enterprise_id = v_customer_id AND o2.`status`='4' AND o2.channel_id =v_channel_id AND o2.package_id =v_package_id AND o2.mobile_operator=v_operator_code;
	
 SELECT count(1) INTO v_total_order  FROM flow_order_info o3 WHERE o3.check_time >= v_start_time AND o3.check_time < v_end_time AND o3.enterprise_id = v_customer_id AND o3.channel_id =v_channel_id AND o3.package_id =v_package_id AND o3.mobile_operator=v_operator_code;

 SELECT ROUND(v_success_order / v_total_order *100,2) INTO v_success_precent;

 SET v_success_precent = CONCAT(v_success_precent,'%');
	
 SELECT SUM(o1.price) INTO v_expend_channel FROM flow_order_info o1 WHERE o1.check_time >= v_start_time AND o1.check_time < v_end_time AND o1.enterprise_id = v_customer_id AND o1.`status`='6'  AND o1.package_id =v_package_id AND o1.mobile_operator=v_operator_code; 
 SELECT ROUND(v_expend / v_expend_channel *100,2) INTO v_expend_precent;

 SET v_expend_precent = CONCAT(v_expend_precent,'%');
 
 SELECT CONCAT(ROUND(v_profit / v_expend *100,2),'%') INTO v_profit_precent;
	



DELETE FROM `flow_fmp`.`stat_customer_manage_package_day` WHERE customer_id = v_customer_id AND statistics_time = v_statistics_time AND operator_code =v_operator_code AND channel_id = v_channel_id AND package_id = v_package_id;

	INSERT INTO `flow_fmp`.`stat_customer_manage_package_day` (

	`partner_id`,
	`partner_name`,
	`customer_id`,
	`customer_name`,
	`operator_code`,
	`package_id`,
	`channel_id`,
	`channel_name`,
	`zone`,
	`price`,
	`channel_price`,
	`expend`,
	`expend_precent`,
	`profit`,
	`profit_precent`,
	`success_order`,
	`fail_order`,
	`success_precent`,
	`remark`,
	`create_time`,
	`statistics_time`,
`statistics_month`
)
VALUES
	(
		
		v_partner_id,
		v_partner_name,
		v_customer_id,
		v_customer_name,
		v_operator_code,
		v_package_id,
		v_channel_id,
		v_channel_name,
		v_zone,
		v_price,
		v_channel_price,
		v_expend,
		v_expend_precent,
		v_profit,
		v_profit_precent,
		v_success_order,
		v_fail_order,
		v_success_precent,
		v_remark,
		v_start_time,
		v_statistics_time,
		DATE_FORMAT(v_statistics_time,'%Y-%m')
	);



	END IF;
	
	UNTIL Done END REPEAT;
	CLOSE cursor_customers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_customer_statistics_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_customer_statistics_day`()
begin
SET @sql_tmp=concat('insert into 
customer_statistics_day(customer_id,customer_name,partner_name,flow_app_id,app_id,
app_name,submit_num,submit_original_price,submit_discount_price,submit_channel_price,
recharge_fail_num,recharge_fail_original_price,recharge_fail_discount_price,recharge_fail_channel_price,
recharge_success_num,recharge_success_original_price,recharge_success_discount_price,recharge_success_channel_price,
profit,statistics_date)',
'SELECT 
c.customer_id AS customer_id,
c.customer_name AS customer_name,
pa.partner_name AS partner_name,
f.flow_app_id AS flow_app_id,
f.app_id AS app_id,
f.app_name AS app_name,
SUM(statstics.submitNum) AS submit_num,
SUM(statstics.submitOriginalPrice) AS submit_original_price,
SUM(statstics.submitDiscountPrice) AS submit_discount_price,
SUM(statstics.submitChannelPrice) AS submit_channel_price,
SUM(statstics.rechargeFailNum) AS recharge_fail_num,
SUM(statstics.rechargeFailOriginalPrice) AS recharge_fail_original_price,
SUM(statstics.rechargeFailDiscountPrice) AS recharge_fail_discount_price,
SUM(statstics.rechargeFailChannelPrice) AS recharge_fail_channel_price,
SUM(statstics.rechargeSuccessNum) AS recharge_success_num,
SUM(statstics.rechargeSuccessOriginalPrice) AS recharge_success_original_price,
SUM(statstics.rechargeSuccessDiscountPrice) AS recharge_success_discount_price,
SUM(statstics.rechargeSuccessChannelPrice) AS recharge_success_channel_price,
SUM((rechargeSuccessDiscountPrice - rechargeSuccessChannelPrice)) AS profit,',
'DATE_FORMAT(date_sub(curdate(),interval 1 day),"%Y-%m-%d") AS statistics_date',
' FROM (SELECT 
o.enterprise_id,
o.flow_app_id,
(case o.`status` when "2" then COUNT(o.`status`) else 0 end) AS submitNum,
(case o.`status` when "2" then SUM(p.cost_price) else 0.00 end) AS submitOriginalPrice,
(case o.`status` when "2" then SUM(o.`price`) else 0.00 end) AS submitDiscountPrice,
(case o.`status` when "2" then SUM(o.`operator_balance_price`) else 0.00 end) AS submitChannelPrice,
(case o.`status` when "4" then COUNT(o.`status`) else 0 end) AS rechargeFailNum,
(case o.`status` when "4" then SUM(p.cost_price) else 0.00 end) AS rechargeFailOriginalPrice,
(case o.`status` when "4" then SUM(o.`price`) else 0.00 end) AS rechargeFailDiscountPrice,
(case o.`status` when "4" then SUM(o.`operator_balance_price`) else 0.00 end) AS rechargeFailChannelPrice,
(case o.`status` when "6" then COUNT(o.`status`) else 0 end) AS rechargeSuccessNum,
(case o.`status` when "6" then SUM(p.cost_price) else 0.00 end) AS rechargeSuccessOriginalPrice,
(case o.`status` when "6" then SUM(o.`price`) else 0.00 end) AS rechargeSuccessDiscountPrice,
(case o.`status` when "6" then SUM(o.`operator_balance_price`) else 0.00 end) AS rechargeSuccessChannelPrice
FROM flow_order_info o
INNER JOIN flow_package_info p ON o.package_id = p.package_id
WHERE (check_time BETWEEN ','concat(date_sub(curdate(),interval 1 day)," 00:00:00") AND concat(date_sub(curdate(),interval 1 day)," 23:59:59")
AND o.`status` IN ("4","6")) 
OR (apply_date BETWEEN concat(date_sub(curdate(),interval 1 day)," 00:00:00") AND concat(date_sub(curdate(),interval 1 day)," 23:59:59")
AND o.`status` = "2")
GROUP BY o.enterprise_id,o.`status`) statstics
INNER JOIN flow_app_info f ON f.flow_app_id = statstics.flow_app_id
INNER JOIN customer_info c ON statstics.enterprise_id = c.customer_id
INNER JOIN partner_info pa ON c.partner_id = pa.partner_id  
GROUP BY statstics.enterprise_id');
PREPARE STMT FROM @sql_tmp; 
EXECUTE STMT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_customer_statistics_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_customer_statistics_history`(IN `startDate` varchar(64))
BEGIN

DECLARE v_day date;
SET v_day = DATE_FORMAT(startDate,'%Y-%m-%d');
while v_day < curdate() do
SET @sql_tmp=concat('insert into 
customer_statistics_day(customer_id,customer_name,partner_name,flow_app_id,app_id,
app_name,submit_num,submit_original_price,submit_discount_price,submit_channel_price,
recharge_fail_num,recharge_fail_original_price,recharge_fail_discount_price,recharge_fail_channel_price,
recharge_success_num,recharge_success_original_price,recharge_success_discount_price,recharge_success_channel_price,
profit,statistics_date)',
' SELECT 
c.customer_id AS customer_id,
c.customer_name AS customer_name,
pa.partner_name AS partner_name, 
f.flow_app_id AS flow_app_id,
f.app_id AS app_id,
f.app_name AS app_name,
SUM(statstics.submitNum) AS submit_num,
SUM(statstics.submitOriginalPrice) AS submit_original_price,
SUM(statstics.submitDiscountPrice) AS submit_discount_price,
SUM(statstics.submitChannelPrice) AS submit_channel_price,
SUM(statstics.rechargeFailNum) AS recharge_fail_num,
SUM(statstics.rechargeFailOriginalPrice) AS recharge_fail_original_price,
SUM(statstics.rechargeFailDiscountPrice) AS recharge_fail_discount_price,
SUM(statstics.rechargeFailChannelPrice) AS recharge_fail_channel_price,
SUM(statstics.rechargeSuccessNum) AS recharge_success_num,
SUM(statstics.rechargeSuccessOriginalPrice) AS recharge_success_original_price,
SUM(statstics.rechargeSuccessDiscountPrice) AS recharge_success_discount_price,
SUM(statstics.rechargeSuccessChannelPrice) AS recharge_success_channel_price,
SUM((rechargeSuccessDiscountPrice - rechargeSuccessChannelPrice)) AS profit,DATE_FORMAT("'
,v_day,'","%Y-%m-%d") AS statistics_date',
' FROM (SELECT 
o.enterprise_id,
o.flow_app_id,
(case o.`status` when "2" then COUNT(o.`status`) else 0 end) AS submitNum,
(case o.`status` when "2" then SUM(p.cost_price) else 0.00 end) AS submitOriginalPrice,
(case o.`status` when "2" then SUM(o.`price`) else 0.00 end) AS submitDiscountPrice,
(case o.`status` when "2" then SUM(o.`operator_balance_price`) else 0.00 end) AS submitChannelPrice,
(case o.`status` when "4" then COUNT(o.`status`) else 0 end) AS rechargeFailNum,
(case o.`status` when "4" then SUM(p.cost_price) else 0.00 end) AS rechargeFailOriginalPrice,
(case o.`status` when "4" then SUM(o.`price`) else 0.00 end) AS rechargeFailDiscountPrice,
(case o.`status` when "4" then SUM(o.`operator_balance_price`) else 0.00 end) AS rechargeFailChannelPrice,
(case o.`status` when "6" then COUNT(o.`status`) else 0 end) AS rechargeSuccessNum,
(case o.`status` when "6" then SUM(p.cost_price) else 0.00 end) AS rechargeSuccessOriginalPrice,
(case o.`status` when "6" then SUM(o.`price`) else 0.00 end) AS rechargeSuccessDiscountPrice,
(case o.`status` when "6" then SUM(o.`operator_balance_price`) else 0.00 end) AS rechargeSuccessChannelPrice
FROM flow_order_info o
INNER JOIN flow_package_info p ON o.package_id = p.package_id
WHERE check_time BETWEEN "',v_day,' 00:00:00" AND "',v_day,' 23:59:59"
AND (o.`status` = "4" OR o.`status` = "2" OR o.`status` = "6")
GROUP BY o.enterprise_id,o.`status`) statstics
INNER JOIN flow_app_info f ON f.flow_app_id = statstics.flow_app_id
INNER JOIN customer_info c ON statstics.enterprise_id = c.customer_id
INNER JOIN partner_info pa ON c.partner_id = pa.partner_id 
GROUP BY statstics.enterprise_id');

PREPARE STMT FROM @sql_tmp; 
EXECUTE STMT;
set v_day = adddate(v_day, INTERVAL 1 DAY);

end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_order_analysis_by_param` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_order_analysis_by_param`(IN `startDay`  int,IN `endDay` int)
    COMMENT '订单分析报表根据传入参数统计'
begin
   

DECLARE tempday varchar(20);

DECLARE  day45 varchar(20);

declare  table_name varchar(60);
set tempday=DATE_FORMAT(startDay,'%Y-%m-%d');
set day45= DATE_SUB(DATE_FORMAT(now(),'%Y%m%d'),INTERVAL 45 DAY);
set table_name='flow_order_info';
   
WHILE date_format(tempday,'%Y%m%d') <=endDay
 do
delete from stat_order_analysis_day where check_time = tempday;


if DATE_FORMAT(tempday,'%Y%m%d') <=date_format(day45,'%Y%m%d') then
set  table_name='flow_order_info_his';
      ELSE
        set  table_name='flow_order_info';
end if;

SET @sql_tmp=
concat('insert into 
stat_order_analysis_day(check_time,area_name,customer_name,operator_code,channel_name,
partner_name,country_price,province_price,city_price,country_count,province_count,
city_count,total_price)',
"select '",tempday,"' 
check_time,area_name,u.customer_name,o.operator_code,o.channel_name,p.partner_name,
sum(case when  ifnull(o.support_city,'') ='' and  o.zone='00' then price else 0 end )  country_price,
sum(case when  ifnull(o.support_city,'') ='' and o.zone!='00' then price else 0 end ) province_price,
sum(case when  ifnull(o.support_city,'')!='' then price else 0 end )city_price,
sum(case when  ifnull(o.support_city,'') ='' and  o.zone='00' then 1 else 0 end )  country_count,
sum(case when  ifnull(o.support_city,'') ='' and o.zone!='00' then 1 else 0 end ) province_count,
sum(case when  ifnull(o.support_city,'')!='' then 1 else 0 end )city_count,
sum(price) total_price
from ",table_name,"  i left join area_code c on i.area_code=c.area_code 
left join access_channel_info o on o.channel_seq_id=i.channel_id 
left join flow_app_info a on a.flow_app_id=i.flow_app_id
left join customer_info u on a.customer_id=u.customer_id
left join partner_info p on u.partner_id=p.partner_id
where i.status=6 and DATE_FORMAT(i.check_time,'%Y-%m-%d')='",tempday,"'
group by i.area_code,o.operator_code,o.channel_name,p.partner_name,u.customer_name
");

set tempday=DATE_ADD(DATE(tempday),INTERVAL 1 DAY);
       
PREPARE STMT FROM @sql_tmp; 
EXECUTE STMT;

end while;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_order_analysis_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_order_analysis_day`()
    COMMENT '订单分析报表按天统计'
begin

DELETE from stat_order_analysis_day where check_time = DATE_FORMAT(SUBDATE(now(),INTERVAL 1 day),'%Y-%m-%d');

SET @sql_tmp=
concat('insert into 
stat_order_analysis_day(check_time,area_name,customer_name,operator_code,channel_name,
partner_name,country_price,province_price,city_price,country_count,province_count,
city_count,total_price)',
"select  DATE_FORMAT(SUBDATE(now(),INTERVAL 1 day),'%Y-%m-%d') check_time,area_name,u.customer_name,o.operator_code,o.channel_name,p.partner_name,
sum(case when  ifnull(o.support_city,'') ='' and  o.zone='00' then price else 0 end )  country_price,
sum(case when  ifnull(o.support_city,'') ='' and o.zone!='00' then price else 0 end ) province_price,
sum(case when  ifnull(o.support_city,'')!='' then price else 0 end )city_price,
sum(case when  ifnull(o.support_city,'') ='' and  o.zone='00' then 1 else 0 end )  country_count,
sum(case when  ifnull(o.support_city,'') ='' and o.zone!='00' then 1 else 0 end ) province_count,
sum(case when  ifnull(o.support_city,'')!='' then 1 else 0 end )city_count,
sum(price) total_price
  from flow_order_info  i left join area_code c on i.area_code=c.area_code 
left join access_channel_info o on o.channel_seq_id=i.channel_id 
left join flow_app_info a on a.flow_app_id=i.flow_app_id
left join customer_info u on a.customer_id=u.customer_id
left join partner_info p on u.partner_id=p.partner_id
  where i.status=6 and DATE_FORMAT(i.check_time,'%Y-%m-%d')=DATE_FORMAT(SUBDATE(now(),INTERVAL 1 day),'%Y-%m-%d')
group by i.area_code,o.operator_code,o.channel_name,p.partner_name,u.customer_name
");
PREPARE STMT FROM @sql_tmp; 
EXECUTE STMT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_stat_flow_manage_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_stat_flow_manage_day`()
BEGIN
declare v_customer_recharge_amount decimal(30,2);
declare v_supplier_recharge_amount decimal(30,2);
declare v_recharge_amount_differ decimal(30,2);
declare v_customer_consume_amount decimal(30,2);
declare v_supplier_consume_amount decimal(30,2);
declare v_consume_amount_differ decimal(30,2);
declare v_customer_balance_amount decimal(30,2);
declare v_supplier_balance_amount decimal(30,2);
declare v_supplier_balance_amount_tmp decimal(30,2);
declare v_supplier_balance_amount_current decimal(30,2);
declare v_balance_amount_differ decimal(30,2);
declare v_profit decimal(30,2);
DECLARE v_statistics_date date;
SET v_statistics_date = date_sub(curdate(),interval 1 day);

  
SELECT IFNULL(SUM(trade_amount),0) INTO v_customer_recharge_amount FROM customer_trade_flow WHERE trade_type=2 AND DATE(input_time) = v_statistics_date;

SELECT IFNULL(SUM(money),0) INTO v_supplier_recharge_amount FROM channel_company_recharge_info WHERE type in (0,1) AND DATE(charge_time) = v_statistics_date;
SET v_recharge_amount_differ = v_customer_recharge_amount-v_supplier_recharge_amount;


SELECT IFNULL(SUM(o.price),0),IFNULL(SUM(o.operator_balance_price),0) INTO v_customer_consume_amount,v_supplier_consume_amount FROM flow_order_info o WHERE o.check_time BETWEEN concat(v_statistics_date," 00:00:00") AND concat(v_statistics_date," 23:59:59") AND o.status='6';
SET v_consume_amount_differ = v_customer_consume_amount-v_supplier_consume_amount;
SET v_customer_balance_amount = (SELECT customer_balance_amount FROM stat_flow_manage_day WHERE statistics_date = date_sub(v_statistics_date,interval 1 day)) - v_customer_consume_amount + v_customer_recharge_amount;

  


SET v_supplier_balance_amount = (SELECT supplier_balance_amount FROM stat_flow_manage_day WHERE statistics_date = date_sub(v_statistics_date,interval 1 day)) -  v_supplier_consume_amount + v_supplier_recharge_amount;
SET v_balance_amount_differ = v_customer_balance_amount-v_supplier_balance_amount;
SET v_profit = v_customer_consume_amount-v_supplier_consume_amount;

INSERT INTO stat_flow_manage_day(
customer_recharge_amount,supplier_recharge_amount,recharge_amount_differ,customer_consume_amount,supplier_consume_amount,
consume_amount_differ,customer_balance_amount,supplier_balance_amount,balance_amount_differ,profit,statistics_date)
VALUES(v_customer_recharge_amount,v_supplier_recharge_amount,v_recharge_amount_differ,v_customer_consume_amount,v_supplier_consume_amount,v_consume_amount_differ,
v_customer_balance_amount,v_supplier_balance_amount,v_balance_amount_differ,v_profit,v_statistics_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_stat_flow_manage_day_bak_20170309` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`flow-stat`@`14.118.130.10` PROCEDURE `pro_stat_flow_manage_day_bak_20170309`()
BEGIN
declare v_customer_recharge_amount decimal(10,2);
  declare v_supplier_recharge_amount decimal(10,2);
declare v_recharge_amount_differ decimal(10,2);
declare v_customer_consume_amount decimal(10,2);
  declare v_supplier_consume_amount decimal(10,2);
  declare v_consume_amount_differ decimal(10,2);
declare v_customer_balance_amount decimal(10,2);
declare v_supplier_balance_amount decimal(10,2);
declare v_supplier_balance_amount_tmp decimal(10,2);
declare v_supplier_balance_amount_current decimal(10,2);
declare v_balance_amount_differ decimal(10,2);
declare v_profit decimal(10,2);
DECLARE v_statistics_date date;
SET v_statistics_date = date_sub(curdate(),interval 1 day);

  
SELECT IFNULL(SUM(trade_amount),0) INTO v_customer_recharge_amount FROM customer_trade_flow WHERE trade_type=2 AND DATE(input_time) = v_statistics_date;
  SELECT IFNULL(SUM(money),0) INTO v_supplier_recharge_amount FROM channel_supplier_recharge_info WHERE type=0 AND DATE(input_time) = v_statistics_date;
SET v_recharge_amount_differ = v_customer_recharge_amount-v_supplier_recharge_amount;

SELECT IFNULL(SUM(o.price),0),IFNULL(SUM(o.operator_balance_price),0) INTO v_customer_consume_amount,v_supplier_consume_amount FROM flow_order_info o WHERE o.check_time BETWEEN concat(v_statistics_date," 00:00:00") AND concat(v_statistics_date," 23:59:59") AND o.status='6';
SET v_consume_amount_differ = v_customer_consume_amount-v_supplier_consume_amount;
-- 剔除测试账号
SET v_customer_balance_amount = (SELECT IFNULL(SUM(balance),0) FROM customer_info WHERE customer_id NOT IN (9,10,11,16,12)) - v_customer_consume_amount;
SELECT SUM(recharge_amount)-SUM(consume_amount) INTO v_supplier_balance_amount_current FROM channel_supplier;
  SELECT SUM(o.operator_balance_price) INTO v_supplier_balance_amount_tmp FROM flow_order_info o WHERE o.check_time BETWEEN concat(curdate()," 00:00:00") AND NOW() AND o.status='6';
SET v_supplier_balance_amount = v_supplier_balance_amount_current+v_supplier_balance_amount_tmp;
SET v_balance_amount_differ = v_customer_balance_amount-v_supplier_balance_amount;
SET v_profit = v_customer_consume_amount-v_supplier_consume_amount;

INSERT INTO stat_flow_manage_day(
customer_recharge_amount,supplier_recharge_amount,recharge_amount_differ,customer_consume_amount,supplier_consume_amount,
consume_amount_differ,customer_balance_amount,supplier_balance_amount,balance_amount_differ,profit,statistics_date)
VALUES(v_customer_recharge_amount,v_supplier_recharge_amount,v_recharge_amount_differ,v_customer_consume_amount,v_supplier_consume_amount,v_consume_amount_differ,
v_customer_balance_amount,v_supplier_balance_amount,v_balance_amount_differ,v_profit,v_statistics_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_stat_flow_manage_day_tmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`flow-stat`@`14.118.130.10` PROCEDURE `pro_stat_flow_manage_day_tmp`()
BEGIN
	declare v_customer_recharge_amount decimal(30,2);
	declare v_supplier_recharge_amount decimal(30,2);
	declare v_recharge_amount_differ decimal(30,2);
	declare v_customer_consume_amount decimal(30,2);
	declare v_supplier_consume_amount decimal(30,2);
	declare v_consume_amount_differ decimal(30,2);
	declare v_customer_balance_amount decimal(30,2);
	declare v_supplier_balance_amount decimal(30,2);
	declare v_supplier_balance_amount_tmp decimal(30,2);
	declare v_supplier_balance_amount_current decimal(30,2);
	declare v_balance_amount_differ decimal(30,2);
	declare v_profit decimal(30,2);
	DECLARE v_statistics_date date;
	SET v_statistics_date = date_sub(curdate(),interval 1 day);

  -- 充值统计（去掉测试账号）
	SELECT IFNULL(SUM(trade_amount),0) INTO v_customer_recharge_amount FROM customer_trade_flow WHERE trade_type=2 AND customer_id NOT IN (9,10,11,12,16) AND DATE(input_time) = v_statistics_date;
	-- SET v_supplier_recharge_amount = 2800000;
	SELECT IFNULL(SUM(money),0) INTO v_supplier_recharge_amount FROM channel_supplier_recharge_info WHERE type=0 AND DATE(input_time) = v_statistics_date;
	SET v_recharge_amount_differ = v_customer_recharge_amount-v_supplier_recharge_amount;

	-- 消耗统计
	SELECT IFNULL(SUM(o.price),0),IFNULL(SUM(o.operator_balance_price),0) INTO v_customer_consume_amount,v_supplier_consume_amount FROM flow_order_info o WHERE o.check_time BETWEEN concat(v_statistics_date," 00:00:00") AND concat(v_statistics_date," 23:59:59") AND o.status='6';
	SET v_consume_amount_differ = v_customer_consume_amount-v_supplier_consume_amount;
	SET v_customer_balance_amount = (SELECT customer_balance_amount FROM stat_flow_manage_day WHERE statistics_date = date_sub(v_statistics_date,interval 1 day)) - v_customer_consume_amount + v_customer_recharge_amount;
	-- SELECT SUM(recharge_amount)-SUM(consume_amount) INTO v_supplier_balance_amount_current FROM channel_supplier;
  -- SELECT SUM(o.operator_balance_price) INTO v_supplier_balance_amount_tmp FROM flow_order_info o WHERE o.check_time BETWEEN concat(curdate()," 00:00:00") AND NOW() AND o.status='6';
	
	-- 余额统计
	SET v_supplier_balance_amount = (SELECT supplier_balance_amount FROM stat_flow_manage_day WHERE statistics_date = date_sub(v_statistics_date,interval 1 day)) -  v_supplier_consume_amount + v_supplier_recharge_amount;
	SET v_balance_amount_differ = v_customer_balance_amount-v_supplier_balance_amount;
	SET v_profit = v_customer_consume_amount-v_supplier_consume_amount;

	INSERT INTO stat_flow_manage_day(
		customer_recharge_amount,supplier_recharge_amount,recharge_amount_differ,customer_consume_amount,supplier_consume_amount,
		consume_amount_differ,customer_balance_amount,supplier_balance_amount,balance_amount_differ,profit,statistics_date)
	VALUES(v_customer_recharge_amount,v_supplier_recharge_amount,v_recharge_amount_differ,v_customer_consume_amount,v_supplier_consume_amount,v_consume_amount_differ,
		v_customer_balance_amount,v_supplier_balance_amount,v_balance_amount_differ,v_profit,v_statistics_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_stat_supplier_account_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_stat_supplier_account_day`()
BEGIN
declare v_supplierCode varchar(50);
declare v_toatalRechargeAmount decimal(10,2) DEFAULT 0;
declare v_totalConsumeAmount decimal(10,2) DEFAULT 0;
declare v_rechargeAmount decimal(10,2) DEFAULT 0;
declare v_consumeAmount decimal(10,2) DEFAULT 0;
declare v_customerConsume decimal(10,2) DEFAULT 0;
declare v_profit decimal(10,2) DEFAULT 0;
declare v_successNum int DEFAULT 0;
declare v_failNum int DEFAULT 0;
declare v_statisticsDate varchar(50);
declare v_currentBalance decimal(10,2) DEFAULT 0;
declare v_balance decimal(10,2) DEFAULT 0;
declare v_currentConsumeAmount decimal(10,2) DEFAULT 0;
DECLARE done INT DEFAULT FALSE;

  
declare supplier_tmp cursor for select 
supplier_code,
consume_amount,
recharge_amount
FROM channel_supplier;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN supplier_tmp; 
FETCH NEXT FROM supplier_tmp INTO v_supplierCode, v_totalConsumeAmount ,v_toatalRechargeAmount;
REPEAT
IF NOT done THEN
SET v_statisticsDate = date_sub(curdate(),interval 1 day);

SELECT IFNULL(SUM(money),0) INTO v_rechargeAmount FROM channel_supplier_recharge_info WHERE supplier_code=v_supplierCode AND DATE(input_time) = DATE(v_statisticsDate);

SELECT IFNULL(SUM(o.operator_balance_price),0),IFNULL(SUM(price),0),COUNT(order_id) INTO v_consumeAmount,v_customerConsume,v_successNum FROM flow_order_info o
INNER JOIN access_channel_info ac ON ac.channel_seq_id = o.channel_id WHERE o.check_time BETWEEN concat(v_statisticsDate," 00:00:00") AND concat(v_statisticsDate," 23:59:59") AND (o.channel_id IS NOT NULL OR o.channel_id != '')
AND o.`status` = 6 AND ac.supplier_code = v_supplierCode;

SET v_profit = v_customerConsume - v_consumeAmount;

SELECT COUNT(o.order_id) INTO v_failNum FROM flow_order_info o INNER JOIN access_channel_info ac ON ac.channel_seq_id = o.channel_id WHERE o.check_time BETWEEN concat(v_statisticsDate," 00:00:00") AND concat(v_statisticsDate," 23:59:59") AND `status`='4' AND ac.supplier_code = v_supplierCode;


SELECT IFNULL(SUM(o.operator_balance_price),0) INTO v_currentConsumeAmount FROM flow_order_info o
INNER JOIN access_channel_info ac ON ac.channel_seq_id = o.channel_id WHERE o.check_time BETWEEN concat(curdate()," 00:00:00") AND NOW() AND (o.channel_id IS NOT NULL OR o.channel_id != '')
AND o.`status` = 6 AND ac.supplier_code = v_supplierCode;
SET v_currentBalance = v_toatalRechargeAmount - v_totalConsumeAmount + v_currentConsumeAmount;
SET v_balance = v_currentBalance + v_rechargeAmount - v_consumeAmount;

INSERT INTO stat_suppiler_account_day(
supplier_code,recharge_amount,consume_amount,balance,current_balance,success_num,fail_num,customer_consume,profit,statistics_date)
VALUES(v_supplierCode,v_rechargeAmount,v_consumeAmount,v_balance,v_currentBalance,v_successNum,v_failNum,v_customerConsume,v_profit,v_statisticsDate);

END IF;
FETCH NEXT FROM supplier_tmp INTO v_supplierCode, v_totalConsumeAmount ,v_toatalRechargeAmount;
UNTIL Done END REPEAT;
CLOSE supplier_tmp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_stat_supplier_consume_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_stat_supplier_consume_day`()
BEGIN
  
  INSERT INTO stat_suppiler_consume_day(
channel_id,mobile_operator,channel_consume,customer_consume,
customer_id,success_num,fail_num,statistics_date)
SELECT 
o.channel_id AS channel_id,
o.mobile_operator AS mobile_operator,
SUM(o.operator_balance_price) As channel_consume,
SUM(price) AS customer_consume,
o.enterprise_id as customer_id,
COUNT(order_id) AS success_num,
(SELECT COUNT(0) FROM flow_order_info WHERE check_time BETWEEN concat(date_sub(curdate(),interval 1 day)," 00:00:00") AND concat(date_sub(curdate(),interval 1 day)," 23:59:59") AND `status`='4' AND channel_id = o.channel_id) AS fail_num,
DATE(o.check_time) aS statistics_date
FROM flow_order_info o
WHERE o.check_time BETWEEN concat(date_sub(curdate(),interval 1 day)," 00:00:00") AND concat(date_sub(curdate(),interval 1 day)," 23:59:59")
AND (o.channel_id IS NOT NULL OR o.channel_id != '')
AND o.`status` = 6
GROUP BY o.channel_id,o.enterprise_id,o.mobile_operator;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_stat_supplier_trade_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_stat_supplier_trade_day`()
BEGIN
declare v_companyId varchar(50);
declare v_beginBalance decimal(30,2);
declare v_rechargeAmount decimal(30,2);
declare v_consumeAmount decimal(30,2);
declare v_balance decimal(30,2);
declare v_consumption_time decimal(10,2);
declare v_statistics_date date;
declare done INT DEFAULT FALSE;


declare supplier_company_tmp cursor for select 
company_id AS companyId
FROM channel_company;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN supplier_company_tmp; 
FETCH NEXT FROM supplier_company_tmp INTO v_companyId;
REPEAT
IF NOT done THEN
SET v_statistics_date = date_sub(curdate(),interval 1 day);

SELECT IFNULL(SUM(balance),0) INTO v_beginBalance FROM stat_suppiler_trade_day WHERE statistics_date = date_sub(v_statistics_date,interval 1 day) AND company_id=v_companyId;

SELECT IFNULL(SUM(a.money),0) INTO v_rechargeAmount FROM channel_company_recharge_info a WHERE a.type in (0,1) AND DATE(a.charge_time) = v_statistics_date AND a.company_id=v_companyId;

SELECT IFNULL(SUM(o.operator_balance_price),0) INTO v_consumeAmount FROM flow_order_info o
LEFT JOIN access_channel_info a ON a.channel_seq_id = o.channel_id
LEFT JOIN channel_supplier c ON c.supplier_code = a.supplier_code
WHERE o.check_time BETWEEN concat(v_statistics_date," 00:00:00") AND concat(v_statistics_date," 23:59:59")
AND o. STATUS = '6'
AND c.company_id = v_companyId;


SET v_balance = v_beginBalance + v_rechargeAmount - v_consumeAmount;

IF v_consumeAmount = 0 THEN 
SET v_consumption_time=0;
ELSE 
SET v_consumption_time = v_balance/v_consumeAmount;
END IF;


DELETE FROM stat_suppiler_trade_day WHERE statistics_date = v_statistics_date AND company_id = v_companyId;

INSERT INTO stat_suppiler_trade_day(
company_id,begin_balance,recharge_amount,consume_amount,balance,consumption_time,statistics_date,create_time)
VALUES(v_companyId,v_beginBalance,v_rechargeAmount,v_consumeAmount,v_balance,v_consumption_time,v_statistics_date,NOW());

END IF;
FETCH NEXT FROM supplier_company_tmp INTO v_companyId;
UNTIL Done END REPEAT;
CLOSE supplier_company_tmp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_stat_supplier_trade_day_tmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`flow-stat`@`14.118.130.10` PROCEDURE `pro_stat_supplier_trade_day_tmp`()
BEGIN
		declare v_companyId varchar(50);-- 供应商公司ID
		declare v_beginBalance decimal(30,2);-- 期初余额
		declare v_rechargeAmount decimal(30,2);-- 充值金额
		declare v_consumeAmount decimal(30,2);-- 消耗
		declare v_balance decimal(30,2);-- 余额
		declare v_consumption_time decimal(10,2);-- 余额
		declare v_statistics_date date;
		declare done INT DEFAULT FALSE;

		-- 查询所有供应商
		declare supplier_company_tmp cursor for select 
			company_id AS companyId
		FROM channel_company;

		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
			OPEN supplier_company_tmp; 
		FETCH NEXT FROM supplier_company_tmp INTO v_companyId;
		REPEAT
				IF NOT done THEN
				SET v_statistics_date = date_sub(curdate(),interval 1 day);
				-- 供应商期初余额
				SELECT IFNULL(SUM(balance),0) INTO v_beginBalance FROM stat_suppiler_trade_day WHERE statistics_date = date_sub(v_statistics_date,interval 1 day) AND company_id=v_companyId;
				-- 供应商充值
				SELECT IFNULL(SUM(a.money),0) INTO v_rechargeAmount FROM channel_company_recharge_info a WHERE a.type=0 AND DATE(a.charge_time) = v_statistics_date AND a.company_id=v_companyId;
				-- 供应商消耗
				SELECT IFNULL(SUM(o.operator_balance_price),0) INTO v_consumeAmount FROM flow_order_info o
				LEFT JOIN access_channel_info a ON a.channel_seq_id = o.channel_id
				LEFT JOIN channel_supplier c ON c.supplier_code = a.supplier_code
				WHERE o.check_time BETWEEN concat(v_statistics_date," 00:00:00") AND concat(v_statistics_date," 23:59:59")
				AND o. STATUS = '6'
				AND c.company_id = v_companyId;

				-- 余额
				SET v_balance = v_beginBalance + v_rechargeAmount - v_consumeAmount;
				-- 消耗时间预估（天）
				IF v_consumeAmount = 0 THEN 
					SET v_consumption_time=0;
				ELSE 
					SET v_consumption_time = v_balance/v_consumeAmount;
				END IF;
				
				-- 插入数据之前先删除数据
				DELETE FROM stat_suppiler_trade_day WHERE statistics_date = v_statistics_date AND company_id = v_companyId;
				-- 	插入数据
				INSERT INTO stat_suppiler_trade_day(
					company_id,begin_balance,recharge_amount,consume_amount,balance,consumption_time,statistics_date,create_time)
				VALUES(v_companyId,v_beginBalance,v_rechargeAmount,v_consumeAmount,v_balance,v_consumption_time,v_statistics_date,NOW());

			END IF;
			FETCH NEXT FROM supplier_company_tmp INTO v_companyId;
			UNTIL Done END REPEAT;
		CLOSE supplier_company_tmp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_supplier_flow_pack` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_supplier_flow_pack`(IN `startDate` varchar(64))
BEGIN

DECLARE v_day date;
DECLARE v_day_s VARCHAR(32);
DECLARE v_day_e VARCHAR(32);
SET v_day = DATE_FORMAT(startDate,'%Y-%m-%d');

while v_day < curdate() do
set v_day_s = CONCAT(v_day," 00:00:00");
  set v_day_e = CONCAT(v_day," 23:59:59");

SET @sql_tmp=concat('insert into stat_supplier_flowpack_day(check_time,supplier_name,channel_name,mobile_operator,
area_name,flow_name,flow_amount,count,cost_price,operator_balance_price,money)
select DATE_FORMAT(check_time,\'%Y-%m-%d\') as check_time,supplier_name,channel_name,mobile_operator,area_name,
CONCAT(area_name,mobile_operator,flow_amount,\'流量包\') as flow_name,flow_amount,count(0)as count,

cost_price,operator_balance_price,SUM(operator_balance_price)as money from 
(
SELECT
check_time,
(
SELECT
supplier_name
FROM
channel_supplier
WHERE
supplier_code = (
SELECT
supplier_code
FROM
access_channel_info
WHERE
channel_seq_id = info.channel_id
)
) AS supplier_name,
(
SELECT
channel_name
FROM
access_channel_info
WHERE
channel_seq_id = info.channel_id
) AS channel_name,
mobile_operator,
(
SELECT
province
FROM
mobile_home_info
WHERE
area_code = info.area_code
LIMIT 1
) AS area_name,
flow_amount,
(
SELECT
cost_price
FROM
flow_package_info
WHERE
package_id = info.package_id
) AS cost_price,
operator_balance_price
FROM
flow_order_info info 
where check_time>=\'',v_day_s,'\' and  check_time <= \'',v_day_e,'\' and status=\'6\'
) as result GROUP BY DATE_FORMAT(check_time,\'%Y-%m-%d\'),supplier_name,channel_name,mobile_operator,area_name,flow_amount;
');

PREPARE STMT FROM @sql_tmp; 
EXECUTE STMT;
set v_day = adddate(v_day, INTERVAL 1 DAY);
end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_tmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_tmp`()
BEGIN
declare v_customerId varchar(50);
declare v_customerAmount decimal(10,2);
  DECLARE done INT DEFAULT FALSE;

  
declare v_tmp cursor for SELECT
customer_id AS customerId,
SUM(customer_amount) AS customerAmount
FROM customer_balance_day
WHERE balance_day = '20170215'
AND customer_id IN (26,35,36,37,45,46,48,53,54,57,69,71,75,79,80,95,99,112,119,122,135,139,140,152,154,155,176,184,188,192,200)
GROUP BY customer_id;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


OPEN v_tmp; 
FETCH NEXT FROM v_tmp INTO v_customerId, v_customerAmount;
REPEAT
IF NOT done THEN

UPDATE customer_info SET balance = balance - v_customerAmount,current_amount=current_amount-v_customerAmount WHERE customer_id=v_customerId;
insert into customer_trade_flow (customer_id, trade_time, 
trade_type, balance, credit_amount, trade_amount, login_name, operator_name, input_time, remark, ip)
values (v_customerId, NOW(), 1, 0, 0, (0-v_customerAmount), 
'admin', '结算', NOW(), "20170215 客户账户流水重新结算",""

      );
END IF;
FETCH NEXT FROM v_tmp INTO v_customerId, v_customerAmount;
UNTIL Done END REPEAT;
CLOSE v_tmp;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-08 20:11:54
