-- MySQL dump 10.13  Distrib 5.6.22, for Linux (x86_64)
--
-- Host: localhost    Database: flow_portal_admin
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
-- Current Database: `flow_portal_admin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `flow_portal_admin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `flow_portal_admin`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_file`
--

LOCK TABLES `attachment_file` WRITE;
/*!40000 ALTER TABLE `attachment_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment_file` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_group`
--

LOCK TABLES `attachment_group` WRITE;
/*!40000 ALTER TABLE `attachment_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment_group` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `attachment_type`
--

LOCK TABLES `attachment_type` WRITE;
/*!40000 ALTER TABLE `attachment_type` DISABLE KEYS */;
INSERT INTO `attachment_type` VALUES ('lock_staff','lockStaffUploadFile','锁定成员上传的附件',1,10485760,10485760,'doc;pdf;rar;zip;xls','',255);
/*!40000 ALTER TABLE `attachment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_log`
--

DROP TABLE IF EXISTS `business_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_log` (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '业务日志ID',
  `LOG_TYPE` varchar(32) NOT NULL COMMENT '日志类型',
  `OPERATOR_ID` varchar(64) NOT NULL COMMENT '操作员ID',
  `OPERATOR_NAME` varchar(64) NOT NULL COMMENT '操作员名称',
  `CLIENT_IP` varchar(100) NOT NULL COMMENT '客户端IP',
  `BUSINESS_ID` varchar(64) NOT NULL COMMENT '被操作实体ID',
  `BUSINESS_NAME` varchar(64) NOT NULL COMMENT '被操作实体名称',
  `DESCRIPTION` varchar(600) NOT NULL COMMENT '操作说明',
  `OPERATION_RESULT` varchar(400) NOT NULL COMMENT '操作结果',
  `OPERATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `BUSINESS_TYPE` int(11) NOT NULL COMMENT '被操作实体类型',
  `OPERATION_DOMAIN` int(11) NOT NULL COMMENT '操作所属域（admin,sp）',
  PRIMARY KEY (`LOG_ID`),
  KEY `idx_business_log_type` (`LOG_TYPE`),
  KEY `idx_business_log_date` (`OPERATION_DATE`),
  KEY `idx_business_log_OPR_id` (`OPERATOR_ID`),
  CONSTRAINT `FK_BUSINESS_LOG` FOREIGN KEY (`LOG_TYPE`) REFERENCES `business_log_type` (`LOG_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_log`
--

LOCK TABLES `business_log` WRITE;
/*!40000 ALTER TABLE `business_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_log_category`
--

DROP TABLE IF EXISTS `business_log_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_log_category` (
  `CATEGORY_NAME` varchar(32) NOT NULL COMMENT '日志分类名称',
  `DESCRIPTION` varchar(32) DEFAULT NULL COMMENT '分类说明',
  `PARENT_NAME` varchar(32) DEFAULT NULL COMMENT '父分类名称（一级日志分类的父分类是root）',
  `CATEGORY_LEVEL` int(11) DEFAULT NULL COMMENT '级别（1级、2级、3级等，方便查询）',
  PRIMARY KEY (`CATEGORY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_log_category`
--

LOCK TABLES `business_log_category` WRITE;
/*!40000 ALTER TABLE `business_log_category` DISABLE KEYS */;
INSERT INTO `business_log_category` VALUES ('12','组织管理','root',1),('1201','个人管理','12',2),('120101','个人管理','1201',3),('1202','组织管理','12',2),('120201','组织管理','1202',3),('1203','成员管理','12',2),('120301','成员管理','1203',3),('1204','角色管理','12',2),('120401','角色管理','1204',3),('62','组织管理','root',1);
/*!40000 ALTER TABLE `business_log_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_log_type`
--

DROP TABLE IF EXISTS `business_log_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_log_type` (
  `LOG_TYPE` varchar(20) NOT NULL COMMENT '日志类型',
  `LOG_TYPE_NAME` varchar(50) NOT NULL COMMENT '日志类型名称',
  `CATEGORY_NAME` varchar(32) NOT NULL COMMENT '日志分类名称',
  `PATTERN` varchar(500) NOT NULL COMMENT '日志操作说明模式字符串（采用java字符串的format格式）',
  PRIMARY KEY (`LOG_TYPE`),
  KEY `FK_BUSINESS_LOG_TYPE` (`CATEGORY_NAME`),
  CONSTRAINT `FK_BUSINESS_LOG_TYPE` FOREIGN KEY (`CATEGORY_NAME`) REFERENCES `business_log_category` (`CATEGORY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_log_type`
--

LOCK TABLES `business_log_type` WRITE;
/*!40000 ALTER TABLE `business_log_type` DISABLE KEYS */;
INSERT INTO `business_log_type` VALUES ('12010101','修改资料','120101','修改资料：{login_name}'),('12010102','修改密码','120101','修改密码：{login_name}'),('12010103','登录','120101','{login_name}登录{login_result}'),('12010104','注销','120101','{login_name}{logout_result}'),('12010105','成员过期','120101','成员{login_name}的帐号已过期'),('12010106','忘记密码','120101','成员{login_name}通过忘记密码功能重置密码。（取回密码链接加密参数{sign}）'),('12010107','密码过期','120101','成员{login_name}的密码已过期,过期前状态:{prev_status}'),('12020101','增加组织','120201','增加组织：{department_name}'),('12020102','修改组织','120201','修改组织：{department_name}'),('12020103','删除组织','120201','删除组织：{department_name}'),('12020104','新增成员','120201','为组织：{department_name}新增成员：{login_name}'),('12020105','成员授权','120201','为组织：{department_name}的成员进行授权'),('12020106','组织授权','120201','为组织：{department_name}进行授权：{role_name}'),('12030101','修改成员','120301','修改成员：{login_name}'),('12030102','删除成员','120301','删除成员：{login_name}'),('12030103','批量删除成员','120301','批量删除成员：{login_names}'),('12030104','锁定成员','120301','锁定成员：{lock_result}，锁定前状态:{prev_status}'),('12030105','解锁成员','120301','解锁成员：{unlock_result}'),('12030106','重置密码','120301','重置成员密码：{login_name}'),('12040101','增加角色','120401','增加了角色：{role_name}'),('12040102','修改角色','120401','修改了角色：{role_name}'),('12040103','删除角色','120401','删除了角色：{role_name}'),('61010101','修改资料','120101','修改资料：{login_name}'),('61010102','修改密码','120101','修改密码：{login_name}'),('61010103','登录','120101','{login_name}登录{login_result}'),('61010104','注销','120101','{login_name}{logout_result}');
/*!40000 ALTER TABLE `business_log_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `CITY_ID` int(8) NOT NULL COMMENT '市ID',
  `CITY_NAME` varchar(30) NOT NULL COMMENT '城市名称',
  `PROVINCE_ID` int(8) NOT NULL COMMENT '省份ID',
  `AREA_CODE` varchar(10) DEFAULT NULL COMMENT '区号',
  PRIMARY KEY (`CITY_ID`),
  KEY `FK_PROVINCE` (`PROVINCE_ID`),
  CONSTRAINT `FK_PROVINCE` FOREIGN KEY (`PROVINCE_ID`) REFERENCES `province` (`PROVINCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='市';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_dict`
--

DROP TABLE IF EXISTS `code_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_dict` (
  `CODE_TYPE` varchar(60) NOT NULL COMMENT '编码类型',
  `KEY` varchar(60) NOT NULL COMMENT '编码key',
  `VALUE` varchar(100) NOT NULL COMMENT '编码值',
  `CODE_DESC` varchar(200) DEFAULT NULL COMMENT '描述',
  `VALID_FLAG` decimal(1,0) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效or可见，1=是；0=否',
  `ORDER_ID` int(10) unsigned DEFAULT NULL COMMENT '排序（从1开始的正整数，NULL表示不排序，各level互不影响）',
  PRIMARY KEY (`CODE_TYPE`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_dict`
--

LOCK TABLES `code_dict` WRITE;
/*!40000 ALTER TABLE `code_dict` DISABLE KEYS */;
INSERT INTO `code_dict` VALUES ('extend_property','smsVerify','是否开通短信验证码','是否开通短信验证码',1,1);
/*!40000 ALTER TABLE `code_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_attachment`
--

DROP TABLE IF EXISTS `email_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_attachment` (
  `EMAIL_ID` bigint(20) NOT NULL COMMENT '附件所属Email标识',
  `NAME` varchar(32) DEFAULT NULL COMMENT '附件名称',
  `DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '附件描述',
  `PATH` varchar(500) DEFAULT NULL COMMENT '附件路径',
  KEY `idx_email_attachment` (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_attachment`
--

LOCK TABLES `email_attachment` WRITE;
/*!40000 ALTER TABLE `email_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_send`
--

DROP TABLE IF EXISTS `email_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_send` (
  `EMAIL_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Email标识',
  `EMAIL_FROM` varchar(128) DEFAULT NULL COMMENT '发件人',
  `EMAIL_TO` varchar(2000) DEFAULT NULL COMMENT '收件人',
  `EMAIL_CC` varchar(2000) DEFAULT NULL COMMENT '抄送',
  `EMAIL_BCC` varchar(2000) DEFAULT NULL COMMENT '暗送',
  `SUBJECT` blob COMMENT '主题',
  `MESSAGE` blob COMMENT '内容',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `SEND_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发送时间',
  `STATUS` varchar(20) NOT NULL DEFAULT 'waiting' COMMENT '处理次数',
  `DEAL_TIMES` int(11) NOT NULL DEFAULT '0' COMMENT '发送状态：waiting-等待处理；success-成功；failure-失败',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '邮件类型：PLAIN-简单类型邮件；HTML-HTML类型邮件',
  `ERROR_MESSAGE` varchar(2000) DEFAULT NULL COMMENT '异常信息',
  PRIMARY KEY (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件发送';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_send`
--

LOCK TABLES `email_send` WRITE;
/*!40000 ALTER TABLE `email_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_send_history`
--

DROP TABLE IF EXISTS `email_send_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_send_history` (
  `EMAIL_ID` bigint(20) NOT NULL COMMENT 'Email标识',
  `EMAIL_FROM` varchar(128) DEFAULT NULL COMMENT '发件人',
  `EMAIL_TO` varchar(2000) DEFAULT NULL COMMENT '收件人',
  `EMAIL_CC` varchar(2000) DEFAULT NULL COMMENT '抄送',
  `EMAIL_BCC` varchar(2000) DEFAULT NULL COMMENT '暗送',
  `SUBJECT` blob COMMENT '主题',
  `MESSAGE` blob COMMENT '内容',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `SEND_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发送时间',
  `STATUS` varchar(20) NOT NULL DEFAULT 'waiting' COMMENT '处理次数',
  `DEAL_TIMES` int(11) DEFAULT NULL COMMENT '发送状态：waiting-等待处理；success-成功；failure-失败',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '邮件类型：PLAIN-简单类型邮件；HTML-HTML类型邮件',
  `ERROR_MESSAGE` varchar(2000) DEFAULT NULL COMMENT '异常信息',
  PRIMARY KEY (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件发送历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_send_history`
--

LOCK TABLES `email_send_history` WRITE;
/*!40000 ALTER TABLE `email_send_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_send_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `LINK_ID` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `LINK_NAME` varchar(100) NOT NULL COMMENT '链接名称',
  `DISP_TYPE` varchar(20) NOT NULL DEFAULT 'before' COMMENT '显示类型,登陆前(before),登陆后(after)',
  `LINK_TYPE` varchar(20) NOT NULL DEFAULT 'commonlink' COMMENT '链接类型,commonlink,iframe',
  `LINK_URL` varchar(200) NOT NULL COMMENT '链接URL',
  `TARGET` varchar(30) NOT NULL DEFAULT 'self' COMMENT '链接打开方式:self,popup',
  `SUB_SYSTEM` varchar(20) NOT NULL COMMENT '链接归属子系统',
  `DOMAIN` varchar(20) NOT NULL COMMENT '链接归属域',
  `NEED_RIGHT` varchar(100) DEFAULT NULL COMMENT '显示此链接需要的权限，支持三形式的权限表示：menu(menuKey, ...) role(roleKey, ...),resoper(resKey-operKey,...)分别表示权限菜单描述,权限角色描述及权限资源操作key描述.各权限间以“,”分割，表示或的关系。空表示无权限限制',
  PRIMARY KEY (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `MENU_ID` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `MENU_NAME` varchar(64) NOT NULL COMMENT '菜单名称',
  `MENU_KEY` varchar(100) NOT NULL COMMENT '菜单外码',
  `PARENT_ID` bigint(10) NOT NULL COMMENT '父菜单ID',
  `IMAGE_URL` varchar(128) DEFAULT NULL COMMENT '图标Url',
  `URL` varchar(128) DEFAULT NULL COMMENT '资源URL',
  `MENU_ORDER` varchar(6) DEFAULT NULL COMMENT '菜单顺序',
  `SUBSYSTEM` varchar(32) DEFAULT NULL COMMENT '子系统名称',
  `DOMAIN` varchar(32) DEFAULT NULL COMMENT '菜单所属域（admin、sp）',
  PRIMARY KEY (`MENU_ID`),
  UNIQUE KEY `idx_menu_key` (`MENU_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'系统管理','auth_sysmgt_admin_sysmgtall',0,'menu-icon fa fa-pencil-square-o',NULL,'900000','auth_sysmgt','admin'),(2,'修改帐号信息','auth_sysmgt_admin_sysmgtall_indiv_modifyinfo',1,'icon-user','/pages/auth/individual/modifyInfo.shtml','10000','auth_sysmgt','admin'),(3,'修改密码','auth_sysmgt_admin_sysmgtall_indiv_modifypwd',1,'icon-lock','/pages/auth/individual/modifyPwd.shtml','20000','auth_sysmgt','admin'),(4,'设置个性化参数','auth_sysmgt_admin_sysmgtall_indiv_setting',1,' icon-magnet','/pages/auth/individual/selfConfigSetting.shtml','30000','auth_sysmgt','admin'),(5,'组织管理','auth_sysmgt_admin_sysmgtall_dept_deptmsg',1,'icon-sitemap','/pages/auth/dept.shtml','40000','auth_sysmgt','admin'),(6,'成员管理','auth_sysmgt_admin_sysmgtall_dept_staffmgt',1,'icon-user-md','/pages/auth/staff.shtml','50000','auth_sysmgt','admin'),(7,'角色管理','auth_sysmgt_admin_sysmgtall_dept_rolemgt',1,'icon-group','/pages/auth/role.shtml','60000','auth_sysmgt','admin'),(8,'组织管理日志','auth_sysmgt_admin_sysmgtall_orgoperationlog',1,'icon-table','/pages/auth/log/queryAccountLog.jsp','70000','auth_sysmgt','admin'),(121,'客服自服务门户','customer_self_manager',0,'menu-icon fa fa-magnet',NULL,'1','fmp-portal','admin'),(122,'活动概述','flow_activity_overview',121,'icon-user','/pages/activityOverview.shtml','1','fmp-portal','admin'),(123,'流量发放记录','flow_order_info_list',121,'icon-user','/pages/flowOrderInfo_list.shtml','2','fmp-portal','admin'),(124,'流量充值','flow_recharge',121,'icon-user','/pages/flowRecharge.shtml','3','fmp-portal','admin'),(125,'物联卡充值','internetOfThingsCardRecharge_recharge',121,'icon-user','/pages/internetOfThingsCardRecharge.shtml','4','fmp-portal','admin'),(126,'流量批量充值','flow_batch_recharge',121,'icon-user','/pages/fileUploadRecord_list.shtml','5','fmp-portal','admin'),(127,'修改密码','flow_modifyPwd',121,'icon-user','/pages/modifyPwd.shtml','6','fmp-portal','admin'),(128,'微信充值页面链接','wechat_recharge_url',121,'icon-user','/pages/wechatRecharge.shtml','7','fmp-portal','admin'),(129,'客户账单管理','customer_bill_self_manager',0,'menu-icon fa fa-usd',NULL,'12','fmp-portal','admin'),(130,'账户管理','customer_bill_self_list',129,'icon-user','/pages/customerBill_list.shtml','1','fmp-portal','admin'),(131,'账单查询','customer_bill_query_self_view',129,'icon-user','/pages/customerBillQuery_view.shtml','2','fmp-portal','admin'),(132,'结算单管理','customer_Settlement_self_order_list',129,'icon-user','/pages/customerSettlementOrder_list.shtml','3','fmp-portal','admin'),(133,'客户账单报表','customer_account_settlement_list',129,'icon-user','/pages/customerAccountSettlement_list.shtml','4','fmp-portal','admin'),(134,'卡劵批量处理','customer_sms_self_manager',0,'menu-icon fa fa-th-list',NULL,'13','fmp-portal','admin'),(135,'短信模版','sms_tmpl_list',134,'icon-user','/pages/smsTmpl_list.shtml','1','fmp-portal','admin'),(136,'卡劵批量发送','customer_sms_self_list',134,'icon-user','/pages/fileUploadRecordCard_list.shtml','2','fmp-portal','admin'),(137,'短信记录查看','sms_record_list',134,'icon-user','/pages/smsRecord_list.shtml','3','fmp-portal','admin'),(138,'微信充值页面配置','wx_recharge_conf_manager',0,'menu-icon fa fa-comments',NULL,'14','fmp-portal','admin'),(139,'充值页面配置','recharge_conf',138,'icon-user','/pages/recharge/rechargeConf_list.shtml','1','fmp-portal','admin'),(140,'优惠活动','recharge_discount_act',138,'icon-user','/pages/recharge/rechargeDiscountAct_list.shtml','2','fmp-portal','admin'),(141,'订单管理','order_manager',0,'menu-icon fa fa-credit-card',NULL,'15','fmp-portal','admin'),(142,'订单列表','order_manager_lisst',141,'icon-user','/pages/orderInfo_list.shtml','1','fmp-portal','admin'),(143,'物联网卡管理','internet_of_things_card',0,'menu-icon fa fa-globe',NULL,'16','fmp-portal','admin'),(144,'物联网卡配置','internetOfThingsCard_list',143,'icon-user','/pages/internetOfThingsCard_list.shtml','1','fmp-portal','admin');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_160517194213`
--

DROP TABLE IF EXISTS `menu_160517194213`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_160517194213` (
  `MENU_ID` bigint(10) NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `MENU_NAME` varchar(64) NOT NULL COMMENT '菜单名称',
  `MENU_KEY` varchar(100) NOT NULL COMMENT '菜单外码',
  `PARENT_ID` bigint(10) NOT NULL COMMENT '父菜单ID',
  `IMAGE_URL` varchar(128) DEFAULT NULL COMMENT '图标Url',
  `URL` varchar(128) DEFAULT NULL COMMENT '资源URL',
  `MENU_ORDER` varchar(6) DEFAULT NULL COMMENT '菜单顺序',
  `SUBSYSTEM` varchar(32) DEFAULT NULL COMMENT '子系统名称',
  `DOMAIN` varchar(32) DEFAULT NULL COMMENT '菜单所属域（admin、sp）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_160517194213`
--

LOCK TABLES `menu_160517194213` WRITE;
/*!40000 ALTER TABLE `menu_160517194213` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_160517194213` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_160517203032`
--

DROP TABLE IF EXISTS `menu_160517203032`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_160517203032` (
  `MENU_ID` bigint(10) NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `MENU_NAME` varchar(64) NOT NULL COMMENT '菜单名称',
  `MENU_KEY` varchar(100) NOT NULL COMMENT '菜单外码',
  `PARENT_ID` bigint(10) NOT NULL COMMENT '父菜单ID',
  `IMAGE_URL` varchar(128) DEFAULT NULL COMMENT '图标Url',
  `URL` varchar(128) DEFAULT NULL COMMENT '资源URL',
  `MENU_ORDER` varchar(6) DEFAULT NULL COMMENT '菜单顺序',
  `SUBSYSTEM` varchar(32) DEFAULT NULL COMMENT '子系统名称',
  `DOMAIN` varchar(32) DEFAULT NULL COMMENT '菜单所属域（admin、sp）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_160517203032`
--

LOCK TABLES `menu_160517203032` WRITE;
/*!40000 ALTER TABLE `menu_160517203032` DISABLE KEYS */;
INSERT INTO `menu_160517203032` VALUES (1,'系统管理','auth_sysmgt_admin_sysmgtall',0,'menu-icon fa fa-pencil-square-o',NULL,'900000','auth_sysmgt','admin'),(2,'修改帐号信息','auth_sysmgt_admin_sysmgtall_indiv_modifyinfo',1,'icon-user','/pages/auth/individual/modifyInfo.shtml','10000','auth_sysmgt','admin'),(3,'修改密码','auth_sysmgt_admin_sysmgtall_indiv_modifypwd',1,'icon-lock','/pages/auth/individual/modifyPwd.shtml','20000','auth_sysmgt','admin'),(4,'设置个性化参数','auth_sysmgt_admin_sysmgtall_indiv_setting',1,' icon-magnet','/pages/auth/individual/selfConfigSetting.shtml','30000','auth_sysmgt','admin'),(5,'组织管理','auth_sysmgt_admin_sysmgtall_dept_deptmsg',1,'icon-sitemap','/pages/auth/dept.shtml','40000','auth_sysmgt','admin'),(6,'成员管理','auth_sysmgt_admin_sysmgtall_dept_staffmgt',1,'icon-user-md','/pages/auth/staff.shtml','50000','auth_sysmgt','admin'),(7,'角色管理','auth_sysmgt_admin_sysmgtall_dept_rolemgt',1,'icon-group','/pages/auth/role.shtml','60000','auth_sysmgt','admin'),(8,'组织管理日志','auth_sysmgt_admin_sysmgtall_orgoperationlog',1,'icon-table','/pages/auth/log/queryAccountLog.jsp','70000','auth_sysmgt','admin');
/*!40000 ALTER TABLE `menu_160517203032` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_170411173747`
--

DROP TABLE IF EXISTS `menu_170411173747`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_170411173747` (
  `MENU_ID` bigint(10) NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `MENU_NAME` varchar(64) NOT NULL COMMENT '菜单名称',
  `MENU_KEY` varchar(100) NOT NULL COMMENT '菜单外码',
  `PARENT_ID` bigint(10) NOT NULL COMMENT '父菜单ID',
  `IMAGE_URL` varchar(128) DEFAULT NULL COMMENT '图标Url',
  `URL` varchar(128) DEFAULT NULL COMMENT '资源URL',
  `MENU_ORDER` varchar(6) DEFAULT NULL COMMENT '菜单顺序',
  `SUBSYSTEM` varchar(32) DEFAULT NULL COMMENT '子系统名称',
  `DOMAIN` varchar(32) DEFAULT NULL COMMENT '菜单所属域（admin、sp）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_170411173747`
--

LOCK TABLES `menu_170411173747` WRITE;
/*!40000 ALTER TABLE `menu_170411173747` DISABLE KEYS */;
INSERT INTO `menu_170411173747` VALUES (1,'系统管理','auth_sysmgt_admin_sysmgtall',0,'menu-icon fa fa-pencil-square-o',NULL,'900000','auth_sysmgt','admin'),(2,'修改帐号信息','auth_sysmgt_admin_sysmgtall_indiv_modifyinfo',1,'icon-user','/pages/auth/individual/modifyInfo.shtml','10000','auth_sysmgt','admin'),(3,'修改密码','auth_sysmgt_admin_sysmgtall_indiv_modifypwd',1,'icon-lock','/pages/auth/individual/modifyPwd.shtml','20000','auth_sysmgt','admin'),(4,'设置个性化参数','auth_sysmgt_admin_sysmgtall_indiv_setting',1,' icon-magnet','/pages/auth/individual/selfConfigSetting.shtml','30000','auth_sysmgt','admin'),(5,'组织管理','auth_sysmgt_admin_sysmgtall_dept_deptmsg',1,'icon-sitemap','/pages/auth/dept.shtml','40000','auth_sysmgt','admin'),(6,'成员管理','auth_sysmgt_admin_sysmgtall_dept_staffmgt',1,'icon-user-md','/pages/auth/staff.shtml','50000','auth_sysmgt','admin'),(7,'角色管理','auth_sysmgt_admin_sysmgtall_dept_rolemgt',1,'icon-group','/pages/auth/role.shtml','60000','auth_sysmgt','admin'),(8,'组织管理日志','auth_sysmgt_admin_sysmgtall_orgoperationlog',1,'icon-table','/pages/auth/log/queryAccountLog.jsp','70000','auth_sysmgt','admin'),(9,'客服自服务门户','customer_self_manager',0,'menu-icon fa fa-magnet',NULL,'1','fmp-portal','admin'),(10,'活动概述','flow_activity_overview',9,'icon-user','/pages/activityOverview.shtml','1','fmp-portal','admin'),(11,'流量发放记录','flow_order_info_list',9,'icon-user','/pages/flowOrderInfo_list.shtml','2','fmp-portal','admin'),(12,'流量充值','flow_recharge',9,'icon-user','/pages/flowRecharge.shtml','3','fmp-portal','admin'),(13,'流量批量充值','flow_batch_recharge',9,'icon-user','/pages/fileUploadRecord_list.shtml','4','fmp-portal','admin'),(14,'修改密码','flow_modifyPwd',9,'icon-user','/pages/modifyPwd.shtml','6','fmp-portal','admin'),(15,'客户账单管理','customer_bill_self_manager',0,'menu-icon fa fa-usd',NULL,'12','fmp-portal','admin'),(16,'账户管理','customer_bill_self_list',15,'icon-user','/pages/customerBill_list.shtml','1','fmp-portal','admin'),(17,'账单查询','customer_bill_query_self_view',15,'icon-user','/pages/customerBillQuery_view.shtml','2','fmp-portal','admin'),(18,'结算单管理','customer_Settlement_self_order_list',15,'icon-user','/pages/customerSettlementOrder_list.shtml','3','fmp-portal','admin'),(19,'卡劵批量处理','customer_sms_self_manager',0,'menu-icon fa fa-th-list',NULL,'13','fmp-portal','admin'),(20,'短信模版','sms_tmpl_list',19,'icon-user','/pages/smsTmpl_list.shtml','1','fmp-portal','admin'),(21,'卡劵批量发送','customer_sms_self_list',19,'icon-user','/pages/fileUploadRecordCard_list.shtml','2','fmp-portal','admin'),(22,'短信记录查看','sms_record_list',19,'icon-user','/pages/smsRecord_list.shtml','3','fmp-portal','admin'),(23,'微信充值页面配置','wx_recharge_conf_manager',0,'menu-icon fa fa-comments',NULL,'14','fmp-portal','admin'),(24,'充值页面配置','recharge_conf',23,'icon-user','/pages/recharge/rechargeConf_list.shtml','1','fmp-portal','admin'),(25,'优惠活动','recharge_discount_act',23,'icon-user','/pages/recharge/rechargeDiscountAct_list.shtml','2','fmp-portal','admin'),(26,'订单管理','order_manager',0,'menu-icon fa fa-credit-card',NULL,'15','fmp-portal','admin'),(27,'订单列表','order_manager_lisst',26,'icon-user','/pages/orderInfo_list.shtml','1','fmp-portal','admin'),(28,'物联网卡管理','internet_of_things_card',0,'menu-icon fa fa-globe',NULL,'16','fmp-portal','admin'),(29,'物联网卡配置','internetOfThingsCard_list',28,'icon-user','/pages/internetOfThingsCard_list.shtml','1','fmp-portal','admin');
/*!40000 ALTER TABLE `menu_170411173747` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_170619184614`
--

DROP TABLE IF EXISTS `menu_170619184614`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_170619184614` (
  `MENU_ID` bigint(10) NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `MENU_NAME` varchar(64) NOT NULL COMMENT '菜单名称',
  `MENU_KEY` varchar(100) NOT NULL COMMENT '菜单外码',
  `PARENT_ID` bigint(10) NOT NULL COMMENT '父菜单ID',
  `IMAGE_URL` varchar(128) DEFAULT NULL COMMENT '图标Url',
  `URL` varchar(128) DEFAULT NULL COMMENT '资源URL',
  `MENU_ORDER` varchar(6) DEFAULT NULL COMMENT '菜单顺序',
  `SUBSYSTEM` varchar(32) DEFAULT NULL COMMENT '子系统名称',
  `DOMAIN` varchar(32) DEFAULT NULL COMMENT '菜单所属域（admin、sp）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_170619184614`
--

LOCK TABLES `menu_170619184614` WRITE;
/*!40000 ALTER TABLE `menu_170619184614` DISABLE KEYS */;
INSERT INTO `menu_170619184614` VALUES (1,'系统管理','auth_sysmgt_admin_sysmgtall',0,'menu-icon fa fa-pencil-square-o',NULL,'900000','auth_sysmgt','admin'),(2,'修改帐号信息','auth_sysmgt_admin_sysmgtall_indiv_modifyinfo',1,'icon-user','/pages/auth/individual/modifyInfo.shtml','10000','auth_sysmgt','admin'),(3,'修改密码','auth_sysmgt_admin_sysmgtall_indiv_modifypwd',1,'icon-lock','/pages/auth/individual/modifyPwd.shtml','20000','auth_sysmgt','admin'),(4,'设置个性化参数','auth_sysmgt_admin_sysmgtall_indiv_setting',1,' icon-magnet','/pages/auth/individual/selfConfigSetting.shtml','30000','auth_sysmgt','admin'),(5,'组织管理','auth_sysmgt_admin_sysmgtall_dept_deptmsg',1,'icon-sitemap','/pages/auth/dept.shtml','40000','auth_sysmgt','admin'),(6,'成员管理','auth_sysmgt_admin_sysmgtall_dept_staffmgt',1,'icon-user-md','/pages/auth/staff.shtml','50000','auth_sysmgt','admin'),(7,'角色管理','auth_sysmgt_admin_sysmgtall_dept_rolemgt',1,'icon-group','/pages/auth/role.shtml','60000','auth_sysmgt','admin'),(8,'组织管理日志','auth_sysmgt_admin_sysmgtall_orgoperationlog',1,'icon-table','/pages/auth/log/queryAccountLog.jsp','70000','auth_sysmgt','admin'),(98,'客服自服务门户','customer_self_manager',0,'menu-icon fa fa-magnet',NULL,'1','fmp-portal','admin'),(99,'活动概述','flow_activity_overview',98,'icon-user','/pages/activityOverview.shtml','1','fmp-portal','admin'),(100,'流量发放记录','flow_order_info_list',98,'icon-user','/pages/flowOrderInfo_list.shtml','2','fmp-portal','admin'),(101,'流量充值','flow_recharge',98,'icon-user','/pages/flowRecharge.shtml','3','fmp-portal','admin'),(102,'物联卡充值','internetOfThingsCardRecharge_recharge',98,'icon-user','/pages/internetOfThingsCardRecharge.shtml','4','fmp-portal','admin'),(103,'流量批量充值','flow_batch_recharge',98,'icon-user','/pages/fileUploadRecord_list.shtml','5','fmp-portal','admin'),(104,'修改密码','flow_modifyPwd',98,'icon-user','/pages/modifyPwd.shtml','6','fmp-portal','admin'),(105,'客户账单管理','customer_bill_self_manager',0,'menu-icon fa fa-usd',NULL,'12','fmp-portal','admin'),(106,'账户管理','customer_bill_self_list',105,'icon-user','/pages/customerBill_list.shtml','1','fmp-portal','admin'),(107,'账单查询','customer_bill_query_self_view',105,'icon-user','/pages/customerBillQuery_view.shtml','2','fmp-portal','admin'),(108,'结算单管理','customer_Settlement_self_order_list',105,'icon-user','/pages/customerSettlementOrder_list.shtml','3','fmp-portal','admin'),(109,'客户账单报表','customer_account_settlement_list',105,'icon-user','/pages/customerAccountSettlement_list.shtml','4','fmp-portal','admin'),(110,'卡劵批量处理','customer_sms_self_manager',0,'menu-icon fa fa-th-list',NULL,'13','fmp-portal','admin'),(111,'短信模版','sms_tmpl_list',110,'icon-user','/pages/smsTmpl_list.shtml','1','fmp-portal','admin'),(112,'卡劵批量发送','customer_sms_self_list',110,'icon-user','/pages/fileUploadRecordCard_list.shtml','2','fmp-portal','admin'),(113,'短信记录查看','sms_record_list',110,'icon-user','/pages/smsRecord_list.shtml','3','fmp-portal','admin'),(114,'微信充值页面配置','wx_recharge_conf_manager',0,'menu-icon fa fa-comments',NULL,'14','fmp-portal','admin'),(115,'充值页面配置','recharge_conf',114,'icon-user','/pages/recharge/rechargeConf_list.shtml','1','fmp-portal','admin'),(116,'优惠活动','recharge_discount_act',114,'icon-user','/pages/recharge/rechargeDiscountAct_list.shtml','2','fmp-portal','admin'),(117,'订单管理','order_manager',0,'menu-icon fa fa-credit-card',NULL,'15','fmp-portal','admin'),(118,'订单列表','order_manager_lisst',117,'icon-user','/pages/orderInfo_list.shtml','1','fmp-portal','admin'),(119,'物联网卡管理','internet_of_things_card',0,'menu-icon fa fa-globe',NULL,'16','fmp-portal','admin'),(120,'物联网卡配置','internetOfThingsCard_list',119,'icon-user','/pages/internetOfThingsCard_list.shtml','1','fmp-portal','admin');
/*!40000 ALTER TABLE `menu_170619184614` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pend_task_remind`
--

DROP TABLE IF EXISTS `pend_task_remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pend_task_remind` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `CATEGORY` varchar(64) NOT NULL COMMENT '待办分类',
  `NAME` varchar(64) NOT NULL COMMENT '待办名称',
  `TITLE` varchar(128) DEFAULT NULL COMMENT '待办标题',
  `LINKURL` varchar(2000) DEFAULT NULL COMMENT '待办链接URL',
  `BUSINESSID` varchar(25) DEFAULT NULL COMMENT '待办业务ID(用于细分待办,可为空)',
  `COUNT` varchar(12) NOT NULL COMMENT '待办数量',
  `REMARK` varchar(128) DEFAULT NULL COMMENT '备注字段',
  `CONTENT` varchar(2000) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NEWINDEX1` (`CATEGORY`,`NAME`,`BUSINESSID`,`REMARK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pend_task_remind`
--

LOCK TABLES `pend_task_remind` WRITE;
/*!40000 ALTER TABLE `pend_task_remind` DISABLE KEYS */;
/*!40000 ALTER TABLE `pend_task_remind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pend_task_remind_log`
--

DROP TABLE IF EXISTS `pend_task_remind_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pend_task_remind_log` (
  `STAFF_ID` bigint(20) DEFAULT NULL COMMENT '成员ID',
  `CATEGORY` varchar(64) DEFAULT NULL COMMENT '待办分类',
  `PEND_TASK_ITEM` varchar(64) DEFAULT NULL COMMENT '待办项',
  `COUNT` varchar(12) DEFAULT NULL COMMENT '待办数量',
  `SEND_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送日期',
  `SEND_METHOD` varchar(16) DEFAULT NULL COMMENT '发送类型(SMS-短信,EMAIL-电子邮件)',
  `ISMULTITASK` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否是多条代办,1是，0不是，默认0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pend_task_remind_log`
--

LOCK TABLES `pend_task_remind_log` WRITE;
/*!40000 ALTER TABLE `pend_task_remind_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pend_task_remind_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pend_task_setting`
--

DROP TABLE IF EXISTS `pend_task_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pend_task_setting` (
  `STAFFID` bigint(20) NOT NULL COMMENT '员工ID',
  `SENDEMAIL` varchar(1) NOT NULL COMMENT 'Email发送标志,1发送 0不发',
  `SENDSMS` varchar(1) NOT NULL COMMENT 'Sms发送标志,1发送 0不发',
  `EMAILSENDTIME` varchar(36) DEFAULT NULL COMMENT 'Email发送时间,格式：N个HH，并且每个HH后要带逗号, 如08,09',
  `SMSSENDTIME` varchar(36) DEFAULT NULL COMMENT 'Sms发送时间,格式：N个HH，如0809',
  `EMAILSENDTYPE` varchar(1) DEFAULT NULL COMMENT 'Email发送方式,1合并待办发送 0不合并待办发送 缺省为不合并，每条待办一封邮件',
  PRIMARY KEY (`STAFFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pend_task_setting`
--

LOCK TABLES `pend_task_setting` WRITE;
/*!40000 ALTER TABLE `pend_task_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `pend_task_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_setting`
--

DROP TABLE IF EXISTS `person_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_setting` (
  `STAFF_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `PROP_NAME` varchar(100) NOT NULL COMMENT '属性名',
  `PROP_VALUE` varchar(4000) DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`STAFF_ID`,`PROP_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_setting`
--

LOCK TABLES `person_setting` WRITE;
/*!40000 ALTER TABLE `person_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_shortcut`
--

DROP TABLE IF EXISTS `person_shortcut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_shortcut` (
  `SHORTCUT_ID` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '快捷方式ID',
  `STAFF_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `TITLE` varchar(64) NOT NULL COMMENT '标题',
  `MENU_ID` bigint(10) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`SHORTCUT_ID`),
  KEY `FK_PERSON_SHORTCUT` (`MENU_ID`),
  CONSTRAINT `FK_PERSON_SHORTCUT` FOREIGN KEY (`MENU_ID`) REFERENCES `menu` (`MENU_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户快捷方式设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_shortcut`
--

LOCK TABLES `person_shortcut` WRITE;
/*!40000 ALTER TABLE `person_shortcut` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_shortcut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_shortcut_160517194213`
--

DROP TABLE IF EXISTS `person_shortcut_160517194213`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_shortcut_160517194213` (
  `SHORTCUT_ID` tinyint(4) NOT NULL DEFAULT '0' COMMENT '快捷方式ID',
  `STAFF_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `TITLE` varchar(64) NOT NULL COMMENT '标题',
  `MENU_ID` bigint(10) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_shortcut_160517194213`
--

LOCK TABLES `person_shortcut_160517194213` WRITE;
/*!40000 ALTER TABLE `person_shortcut_160517194213` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_shortcut_160517194213` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_shortcut_160517203032`
--

DROP TABLE IF EXISTS `person_shortcut_160517203032`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_shortcut_160517203032` (
  `SHORTCUT_ID` tinyint(4) NOT NULL DEFAULT '0' COMMENT '快捷方式ID',
  `STAFF_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `TITLE` varchar(64) NOT NULL COMMENT '标题',
  `MENU_ID` bigint(10) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_shortcut_160517203032`
--

LOCK TABLES `person_shortcut_160517203032` WRITE;
/*!40000 ALTER TABLE `person_shortcut_160517203032` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_shortcut_160517203032` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_shortcut_170411173747`
--

DROP TABLE IF EXISTS `person_shortcut_170411173747`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_shortcut_170411173747` (
  `SHORTCUT_ID` tinyint(4) NOT NULL DEFAULT '0' COMMENT '快捷方式ID',
  `STAFF_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `TITLE` varchar(64) NOT NULL COMMENT '标题',
  `MENU_ID` bigint(10) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_shortcut_170411173747`
--

LOCK TABLES `person_shortcut_170411173747` WRITE;
/*!40000 ALTER TABLE `person_shortcut_170411173747` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_shortcut_170411173747` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_shortcut_170619184614`
--

DROP TABLE IF EXISTS `person_shortcut_170619184614`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_shortcut_170619184614` (
  `SHORTCUT_ID` tinyint(4) NOT NULL DEFAULT '0' COMMENT '快捷方式ID',
  `STAFF_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `TITLE` varchar(64) NOT NULL COMMENT '标题',
  `MENU_ID` bigint(10) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_shortcut_170619184614`
--

LOCK TABLES `person_shortcut_170619184614` WRITE;
/*!40000 ALTER TABLE `person_shortcut_170619184614` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_shortcut_170619184614` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_session`
--

DROP TABLE IF EXISTS `portal_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_session` (
  `SESSION_ID` varchar(100) NOT NULL COMMENT 'portal中的sessionId',
  `STAFF_ID` bigint(20) NOT NULL COMMENT '登录用户ID',
  `LOGIN_TIME` varchar(15) NOT NULL COMMENT '该session登录的精确时间，取自1970 年 1 月 1 日午夜以来的毫秒数',
  `LOGIN_TIME2` datetime DEFAULT NULL COMMENT '该session登录的近似时间，取应用的sysdate。该值作为备注',
  PRIMARY KEY (`SESSION_ID`),
  KEY `INDEX_STAFF_ID` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户会话';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_session`
--

LOCK TABLES `portal_session` WRITE;
/*!40000 ALTER TABLE `portal_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `PROVINCE_ID` int(8) NOT NULL COMMENT '省份ID',
  `PROV_NAME` varchar(30) NOT NULL COMMENT '省份名称',
  `SHORT_NAME` varchar(20) DEFAULT NULL COMMENT '简称',
  PRIMARY KEY (`PROVINCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省份';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_department`
--

DROP TABLE IF EXISTS `sec_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_department` (
  `DEPARTMENT_ID` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '组织ID',
  `DEPARTMENT_NAME` varchar(100) NOT NULL COMMENT '组织名称',
  `DEPARTMENT_DESC` varchar(100) DEFAULT NULL COMMENT '组织描述',
  `PARENT_ID` bigint(16) DEFAULT NULL COMMENT '父级组织',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '组织的邮件',
  `ADDRESS` varchar(200) DEFAULT NULL COMMENT '组织地址',
  `ADD_SUB` varchar(1) NOT NULL DEFAULT '1' COMMENT '是否可以创建下级组织',
  `CREATE_USER` varchar(20) NOT NULL COMMENT '组织创建者',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '组织创建时间',
  `LAST_UPDATE_DATE` timestamp NULL DEFAULT NULL COMMENT '组织最后修改时间',
  `DOMAIN` varchar(10) DEFAULT 'SYS_ADMIN' COMMENT '管理域：SP、SYS_ADMIN',
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `FK_sec_department` (`PARENT_ID`),
  CONSTRAINT `FK_sec_department` FOREIGN KEY (`PARENT_ID`) REFERENCES `sec_department` (`DEPARTMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='组织';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_department`
--

LOCK TABLES `sec_department` WRITE;
/*!40000 ALTER TABLE `sec_department` DISABLE KEYS */;
INSERT INTO `sec_department` VALUES (-999,'根组织','所有组织的根',NULL,'xx@xx.com','xx','0','system','2016-05-17 11:16:26','2016-05-17 11:16:26',''),(-998,'云之讯','所有云之讯的根组织',-999,'xx@xx.com','xx','1','system','2016-05-17 12:39:00','2016-05-17 12:39:00','SYS_ADMIN'),(1,'运营管理员','',-998,'','','1','admin','2016-05-17 12:39:21','2016-05-17 12:39:21','SYS_ADMIN'),(2,'客户组','',-998,'','','1','admin','2016-05-17 12:44:32','2016-05-17 12:44:32','SP');
/*!40000 ALTER TABLE `sec_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_department_extend_property`
--

DROP TABLE IF EXISTS `sec_department_extend_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_department_extend_property` (
  `DEPARTMENT_ID` bigint(16) NOT NULL,
  `PROPERTY` varchar(32) NOT NULL,
  `VALUE` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`,`PROPERTY`),
  CONSTRAINT `FK_sec_department_extend_property` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `sec_department` (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员扩展属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_department_extend_property`
--

LOCK TABLES `sec_department_extend_property` WRITE;
/*!40000 ALTER TABLE `sec_department_extend_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_department_extend_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_department_role`
--

DROP TABLE IF EXISTS `sec_department_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_department_role` (
  `DEPARTMENT_ID` bigint(16) NOT NULL COMMENT '组织ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`DEPARTMENT_ID`,`ROLE_ID`),
  KEY `FK_sec_department_role2` (`ROLE_ID`),
  CONSTRAINT `FK_sec_department_role` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `sec_department` (`DEPARTMENT_ID`),
  CONSTRAINT `FK_sec_department_role2` FOREIGN KEY (`ROLE_ID`) REFERENCES `sec_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_department_role`
--

LOCK TABLES `sec_department_role` WRITE;
/*!40000 ALTER TABLE `sec_department_role` DISABLE KEYS */;
INSERT INTO `sec_department_role` VALUES (-998,1),(1,1),(-998,3),(1,3),(-998,4),(1,4),(-998,5),(1,5),(-998,6),(1,6),(2,6),(2,10);
/*!40000 ALTER TABLE `sec_department_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_login_history`
--

DROP TABLE IF EXISTS `sec_login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_login_history` (
  `STAFF_ID` bigint(20) NOT NULL COMMENT '成员ID',
  `LOGIN_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `LOGIN_FLAG` varchar(10) NOT NULL COMMENT 'LOGOUT：注销；SUCCESS：登录成功；FAIL：登录失败；TIMEOUT：用户超时；UNLOCK：解锁；AUTOLOCK：密码尝试过多被锁',
  `DESCRIPTION` varchar(20) DEFAULT NULL COMMENT '备注，现在用来记录用户登录密码尝试过多被锁前的用户状态',
  PRIMARY KEY (`STAFF_ID`,`LOGIN_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_login_history`
--

LOCK TABLES `sec_login_history` WRITE;
/*!40000 ALTER TABLE `sec_login_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_metadata_log`
--

DROP TABLE IF EXISTS `sec_metadata_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_metadata_log` (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Logid',
  `HOST_NAME` varchar(250) DEFAULT NULL COMMENT '执行导入操作的主机名',
  `CLIENT_IP` varchar(32) DEFAULT NULL COMMENT '执行导入操作的主机IP',
  `FILE_NAME` varchar(500) DEFAULT NULL COMMENT '导入的文件名',
  `BACKUP_FILE_NAME` varchar(500) DEFAULT NULL COMMENT '导入的文件名备份的名字',
  `SUFFIX` varchar(20) DEFAULT NULL COMMENT '备份表的后缀',
  `OPERATION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT '操作人(操作系统的当前成员)',
  `RESULT` varchar(50) DEFAULT NULL COMMENT '导入结果',
  `OPERATION` varchar(50) DEFAULT NULL COMMENT '操作类型:delete| import',
  `METADATA_ID` varchar(500) DEFAULT NULL COMMENT '元数据ID',
  `SYSTEM_NAME` varchar(32) DEFAULT NULL COMMENT '系统名称',
  `PREFIX` varchar(5) DEFAULT NULL COMMENT '备份表的前缀',
  `domain` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='元数据导入日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_metadata_log`
--

LOCK TABLES `sec_metadata_log` WRITE;
/*!40000 ALTER TABLE `sec_metadata_log` DISABLE KEYS */;
INSERT INTO `sec_metadata_log` VALUES (1,'BJZW-FMP-MYSQLM-201135.51YZX.COM','10.10.201.135','../auth/metadata_auth_common_admin_all.xml','/root/metadata/tools/../auth/metadata_auth_common_admin_all_160517194215.xml','_160517194215','2016-05-17 11:42:16','root','SUCCESS','import','exclude_auth_admin, exclude_portal_admin, auth',NULL,'BAK_','admin'),(2,'BJZW-FMP-ADMIN-201122.51YZX.COM','10.10.201.122','../auth/metadata_auth_common_admin_all.xml','/opt/paas/tomcat-fmp-portal-48080/bak/metadata/tools/../auth/metadata_auth_common_admin_all_160517203036.xml','_160517203036','2016-05-17 12:30:37','root','SUCCESS','import','exclude_eump_admin, fmp-portal',NULL,'BAK_','admin'),(6,'ALIYUN-FLUX-MYSQLM-BJ-231-76.51YZX.COM','10.51.74.240','../auth/metadata_auth_common_admin_all.xml','/root/metadata/metadata/tools/../auth/metadata_auth_common_admin_all_170411173755.xml','_170411173755','2017-04-11 09:37:57','root','SUCCESS','import','exclude_eump_admin, fmp-portal',NULL,'BAK_','admin'),(7,'ALIYUN-FLUX-MYSQLM-BJ-231-76.51YZX.COM','10.51.74.240','../auth/metadata_auth_common_admin_all.xml','/root/metadata/fmp-portal-config/metadata/tools/../auth/metadata_auth_common_admin_all_170619184622.xml','_170619184622','2017-06-19 10:46:23','root','SUCCESS','import','exclude_eump_admin, fmp-portal',NULL,'BAK_','admin');
/*!40000 ALTER TABLE `sec_metadata_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation`
--

DROP TABLE IF EXISTS `sec_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation` (
  `OPERATION_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源操作主键',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源主键',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '操作关键字',
  `OPERATION_NAME` varchar(100) NOT NULL COMMENT '操作名称',
  `OPERATION_DESC` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `DEPEND_KEY` varchar(32) DEFAULT NULL COMMENT '依赖操作KEY',
  `DEPEND_BY_KEY` varchar(500) DEFAULT NULL COMMENT '被依赖操作KEY',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(5) DEFAULT NULL COMMENT '操作的顺序',
  PRIMARY KEY (`OPERATION_ID`),
  UNIQUE KEY `SEC_OPERATION_IDX` (`RESOURCE_ID`,`OPERATION_KEY`),
  CONSTRAINT `FK_sec_operation` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `sec_resources` (`RESOURCE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8 COMMENT='资源操作';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation`
--

LOCK TABLES `sec_operation` WRITE;
/*!40000 ALTER TABLE `sec_operation` DISABLE KEYS */;
INSERT INTO `sec_operation` VALUES (1,1,'EXCLUDE','例外','例外',NULL,NULL,'exclude_portal_admin','admin',100),(2,2,'EXCLUDE','前台鉴权例外','登录后就可访问',NULL,NULL,'exclude_portal_admin','admin',100),(3,3,'EXCLUDE','例外','例外',NULL,NULL,'exclude_auth_admin','admin',100),(4,5,'QUERY','修改','修改',NULL,NULL,'auth','admin',100),(5,6,'QUERY','修改','修改',NULL,NULL,'auth','admin',100),(6,7,'QUERY','查询','查询',NULL,NULL,'auth','admin',100),(7,8,'QUERY','组织查询','组织查询',NULL,NULL,'auth','admin',100),(8,8,'MODIFY','组织修改','组织修改',NULL,NULL,'auth','admin',100),(9,8,'DELETE','组织删除','组织删除',NULL,NULL,'auth','admin',100),(10,8,'ROLE2DEPT','组织添加角色','组织添加角色',NULL,NULL,'auth','admin',100),(11,8,'STAFF2DEPT','组织添加用户','组织添加用户',NULL,NULL,'auth','admin',100),(12,8,'AUTH2STAFF','组织成员授权','组织成员授权',NULL,NULL,'auth','admin',100),(13,9,'QUERY','查询','查询',NULL,NULL,'auth','admin',100),(14,9,'ADD','创建','创建用户',NULL,NULL,'auth','admin',100),(15,9,'UPDATE','修改','更新用户',NULL,NULL,'auth','admin',100),(16,9,'DELETE','删除','删除用户',NULL,NULL,'auth','admin',100),(17,9,'LOCKSTAFF','锁定','查询',NULL,NULL,'auth','admin',100),(18,9,'RESETPWD','重置密码','重置密码',NULL,NULL,'auth','admin',100),(19,9,'AUTHSTAFF','授权','用户授权',NULL,NULL,'auth','admin',100),(20,10,'QUERY','查询','查询',NULL,'ADD,MODIFY,DELETE','auth','admin',100),(21,10,'ADD','新增角色','新增角色','QUERY',NULL,'auth','admin',100),(22,10,'MODIFY','修改角色','修改角色','QUERY',NULL,'auth','admin',100),(23,10,'DELETE','删除角色','删除角色','QUERY',NULL,'auth','admin',100),(24,10,'AUTHROLE','角色关联权限','角色关联权限',NULL,NULL,'auth','admin',100),(272,103,'EXCLUDE','例外','例外',NULL,NULL,'exclude_eump_admin','admin',100),(273,104,'EXCLUDE','后台公用ACTION例外','后台公用ACTION登录后就可访问',NULL,NULL,'exclude_eump_admin','admin',100),(274,105,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(275,106,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(276,106,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(277,106,'reCallBack','重回调','重回调',NULL,NULL,'fmp-portal','admin',100),(278,107,'recharge_url','链接','链接',NULL,NULL,'fmp-portal','admin',100),(279,108,'recharge','充值','充值',NULL,NULL,'fmp-portal','admin',100),(280,109,'internetthingscardRecharge','物联卡流量充值','物联卡流量充值',NULL,NULL,'fmp-portal','admin',100),(281,110,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(282,110,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(283,110,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(284,110,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(285,110,'baserecharge','基础包批量充值','基础包批量充值',NULL,NULL,'fmp-portal','admin',100),(286,110,'allrecharge','三网通批量充值','三网通批量充值',NULL,NULL,'fmp-portal','admin',100),(287,110,'redbagrecharge','流量红包批量充值','流量红包批量充值',NULL,NULL,'fmp-portal','admin',100),(288,111,'modifyPwd','修改密码','修改密码',NULL,NULL,'fmp-portal','admin',100),(289,112,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(290,112,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(291,112,'accountDetail','账户明细','账户明细',NULL,NULL,'fmp-portal','admin',100),(292,113,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(293,113,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(294,114,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(295,114,'changeStatus','调整结算单状态','调整结算单状态',NULL,NULL,'fmp-portal','admin',100),(296,114,'downLoadSettlementOrder','导出','导出',NULL,NULL,'fmp-portal','admin',100),(297,115,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(298,115,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(299,116,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(300,116,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(301,116,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(302,116,'add','新增','新增',NULL,NULL,'fmp-portal','admin',100),(303,117,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(304,117,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(305,117,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(306,117,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(307,117,'add','批量发送','批量发送',NULL,NULL,'fmp-portal','admin',100),(308,118,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(309,118,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(310,119,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(311,119,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(312,119,'add','新增/修改','新增/修改',NULL,NULL,'fmp-portal','admin',100),(313,119,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(314,120,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(315,120,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(316,120,'add','新增/修改','新增/修改',NULL,NULL,'fmp-portal','admin',100),(317,120,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(318,121,'order_manager_query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(319,121,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(320,121,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(321,121,'exportById','导出指定订单','导出指定订单',NULL,NULL,'fmp-portal','admin',100),(322,122,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(323,122,'detail','详情','查看活动详情',NULL,NULL,'fmp-portal','admin',100);
/*!40000 ALTER TABLE `sec_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation_160517194215`
--

DROP TABLE IF EXISTS `sec_operation_160517194215`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation_160517194215` (
  `OPERATION_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源操作主键',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源主键',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '操作关键字',
  `OPERATION_NAME` varchar(100) NOT NULL COMMENT '操作名称',
  `OPERATION_DESC` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `DEPEND_KEY` varchar(32) DEFAULT NULL COMMENT '依赖操作KEY',
  `DEPEND_BY_KEY` varchar(500) DEFAULT NULL COMMENT '被依赖操作KEY',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(5) DEFAULT NULL COMMENT '操作的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation_160517194215`
--

LOCK TABLES `sec_operation_160517194215` WRITE;
/*!40000 ALTER TABLE `sec_operation_160517194215` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_operation_160517194215` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation_160517203036`
--

DROP TABLE IF EXISTS `sec_operation_160517203036`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation_160517203036` (
  `OPERATION_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源操作主键',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源主键',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '操作关键字',
  `OPERATION_NAME` varchar(100) NOT NULL COMMENT '操作名称',
  `OPERATION_DESC` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `DEPEND_KEY` varchar(32) DEFAULT NULL COMMENT '依赖操作KEY',
  `DEPEND_BY_KEY` varchar(500) DEFAULT NULL COMMENT '被依赖操作KEY',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(5) DEFAULT NULL COMMENT '操作的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation_160517203036`
--

LOCK TABLES `sec_operation_160517203036` WRITE;
/*!40000 ALTER TABLE `sec_operation_160517203036` DISABLE KEYS */;
INSERT INTO `sec_operation_160517203036` VALUES (1,1,'EXCLUDE','例外','例外',NULL,NULL,'exclude_portal_admin','admin',100),(2,2,'EXCLUDE','前台鉴权例外','登录后就可访问',NULL,NULL,'exclude_portal_admin','admin',100),(3,3,'EXCLUDE','例外','例外',NULL,NULL,'exclude_auth_admin','admin',100),(4,5,'QUERY','修改','修改',NULL,NULL,'auth','admin',100),(5,6,'QUERY','修改','修改',NULL,NULL,'auth','admin',100),(6,7,'QUERY','查询','查询',NULL,NULL,'auth','admin',100),(7,8,'QUERY','组织查询','组织查询',NULL,NULL,'auth','admin',100),(8,8,'MODIFY','组织修改','组织修改',NULL,NULL,'auth','admin',100),(9,8,'DELETE','组织删除','组织删除',NULL,NULL,'auth','admin',100),(10,8,'ROLE2DEPT','组织添加角色','组织添加角色',NULL,NULL,'auth','admin',100),(11,8,'STAFF2DEPT','组织添加用户','组织添加用户',NULL,NULL,'auth','admin',100),(12,8,'AUTH2STAFF','组织成员授权','组织成员授权',NULL,NULL,'auth','admin',100),(13,9,'QUERY','查询','查询',NULL,NULL,'auth','admin',100),(14,9,'ADD','创建','创建用户',NULL,NULL,'auth','admin',100),(15,9,'UPDATE','修改','更新用户',NULL,NULL,'auth','admin',100),(16,9,'DELETE','删除','删除用户',NULL,NULL,'auth','admin',100),(17,9,'LOCKSTAFF','锁定','查询',NULL,NULL,'auth','admin',100),(18,9,'RESETPWD','重置密码','重置密码',NULL,NULL,'auth','admin',100),(19,9,'AUTHSTAFF','授权','用户授权',NULL,NULL,'auth','admin',100),(20,10,'QUERY','查询','查询',NULL,'ADD,MODIFY,DELETE','auth','admin',100),(21,10,'ADD','新增角色','新增角色','QUERY',NULL,'auth','admin',100),(22,10,'MODIFY','修改角色','修改角色','QUERY',NULL,'auth','admin',100),(23,10,'DELETE','删除角色','删除角色','QUERY',NULL,'auth','admin',100),(24,10,'AUTHROLE','角色关联权限','角色关联权限',NULL,NULL,'auth','admin',100);
/*!40000 ALTER TABLE `sec_operation_160517203036` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation_170411173755`
--

DROP TABLE IF EXISTS `sec_operation_170411173755`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation_170411173755` (
  `OPERATION_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源操作主键',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源主键',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '操作关键字',
  `OPERATION_NAME` varchar(100) NOT NULL COMMENT '操作名称',
  `OPERATION_DESC` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `DEPEND_KEY` varchar(32) DEFAULT NULL COMMENT '依赖操作KEY',
  `DEPEND_BY_KEY` varchar(500) DEFAULT NULL COMMENT '被依赖操作KEY',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(5) DEFAULT NULL COMMENT '操作的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation_170411173755`
--

LOCK TABLES `sec_operation_170411173755` WRITE;
/*!40000 ALTER TABLE `sec_operation_170411173755` DISABLE KEYS */;
INSERT INTO `sec_operation_170411173755` VALUES (1,1,'EXCLUDE','例外','例外',NULL,NULL,'exclude_portal_admin','admin',100),(2,2,'EXCLUDE','前台鉴权例外','登录后就可访问',NULL,NULL,'exclude_portal_admin','admin',100),(3,3,'EXCLUDE','例外','例外',NULL,NULL,'exclude_auth_admin','admin',100),(4,5,'QUERY','修改','修改',NULL,NULL,'auth','admin',100),(5,6,'QUERY','修改','修改',NULL,NULL,'auth','admin',100),(6,7,'QUERY','查询','查询',NULL,NULL,'auth','admin',100),(7,8,'QUERY','组织查询','组织查询',NULL,NULL,'auth','admin',100),(8,8,'MODIFY','组织修改','组织修改',NULL,NULL,'auth','admin',100),(9,8,'DELETE','组织删除','组织删除',NULL,NULL,'auth','admin',100),(10,8,'ROLE2DEPT','组织添加角色','组织添加角色',NULL,NULL,'auth','admin',100),(11,8,'STAFF2DEPT','组织添加用户','组织添加用户',NULL,NULL,'auth','admin',100),(12,8,'AUTH2STAFF','组织成员授权','组织成员授权',NULL,NULL,'auth','admin',100),(13,9,'QUERY','查询','查询',NULL,NULL,'auth','admin',100),(14,9,'ADD','创建','创建用户',NULL,NULL,'auth','admin',100),(15,9,'UPDATE','修改','更新用户',NULL,NULL,'auth','admin',100),(16,9,'DELETE','删除','删除用户',NULL,NULL,'auth','admin',100),(17,9,'LOCKSTAFF','锁定','查询',NULL,NULL,'auth','admin',100),(18,9,'RESETPWD','重置密码','重置密码',NULL,NULL,'auth','admin',100),(19,9,'AUTHSTAFF','授权','用户授权',NULL,NULL,'auth','admin',100),(20,10,'QUERY','查询','查询',NULL,'ADD,MODIFY,DELETE','auth','admin',100),(21,10,'ADD','新增角色','新增角色','QUERY',NULL,'auth','admin',100),(22,10,'MODIFY','修改角色','修改角色','QUERY',NULL,'auth','admin',100),(23,10,'DELETE','删除角色','删除角色','QUERY',NULL,'auth','admin',100),(24,10,'AUTHROLE','角色关联权限','角色关联权限',NULL,NULL,'auth','admin',100),(25,11,'EXCLUDE','例外','例外',NULL,NULL,'exclude_eump_admin','admin',100),(26,12,'EXCLUDE','后台公用ACTION例外','后台公用ACTION登录后就可访问',NULL,NULL,'exclude_eump_admin','admin',100),(27,13,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(28,14,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(29,14,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(30,15,'recharge','充值','充值',NULL,NULL,'fmp-portal','admin',100),(31,16,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(32,16,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(33,16,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(34,16,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(35,16,'baserecharge','基础包批量充值','基础包批量充值',NULL,NULL,'fmp-portal','admin',100),(36,16,'allrecharge','三网通批量充值','三网通批量充值',NULL,NULL,'fmp-portal','admin',100),(37,16,'redbagrecharge','流量红包批量充值','流量红包批量充值',NULL,NULL,'fmp-portal','admin',100),(38,17,'modifyPwd','修改密码','修改密码',NULL,NULL,'fmp-portal','admin',100),(39,18,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(40,18,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(41,18,'accountDetail','账户明细','账户明细',NULL,NULL,'fmp-portal','admin',100),(42,19,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(43,19,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(44,20,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(45,20,'changeStatus','调整结算单状态','调整结算单状态',NULL,NULL,'fmp-portal','admin',100),(46,20,'downLoadSettlementOrder','导出','导出',NULL,NULL,'fmp-portal','admin',100),(47,21,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(48,21,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(49,21,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(50,21,'add','新增','新增',NULL,NULL,'fmp-portal','admin',100),(51,22,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(52,22,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(53,22,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(54,22,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(55,22,'add','批量发送','批量发送',NULL,NULL,'fmp-portal','admin',100),(56,23,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(57,23,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(58,24,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(59,24,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(60,24,'add','新增/修改','新增/修改',NULL,NULL,'fmp-portal','admin',100),(61,24,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(62,25,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(63,25,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(64,25,'add','新增/修改','新增/修改',NULL,NULL,'fmp-portal','admin',100),(65,25,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(66,26,'order_manager_query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(67,26,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(68,26,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(69,26,'exportById','导出指定订单','导出指定订单',NULL,NULL,'fmp-portal','admin',100),(70,27,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(71,27,'detail','详情','查看活动详情',NULL,NULL,'fmp-portal','admin',100);
/*!40000 ALTER TABLE `sec_operation_170411173755` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation_170619184622`
--

DROP TABLE IF EXISTS `sec_operation_170619184622`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation_170619184622` (
  `OPERATION_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源操作主键',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源主键',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '操作关键字',
  `OPERATION_NAME` varchar(100) NOT NULL COMMENT '操作名称',
  `OPERATION_DESC` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `DEPEND_KEY` varchar(32) DEFAULT NULL COMMENT '依赖操作KEY',
  `DEPEND_BY_KEY` varchar(500) DEFAULT NULL COMMENT '被依赖操作KEY',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(5) DEFAULT NULL COMMENT '操作的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation_170619184622`
--

LOCK TABLES `sec_operation_170619184622` WRITE;
/*!40000 ALTER TABLE `sec_operation_170619184622` DISABLE KEYS */;
INSERT INTO `sec_operation_170619184622` VALUES (1,1,'EXCLUDE','例外','例外',NULL,NULL,'exclude_portal_admin','admin',100),(2,2,'EXCLUDE','前台鉴权例外','登录后就可访问',NULL,NULL,'exclude_portal_admin','admin',100),(3,3,'EXCLUDE','例外','例外',NULL,NULL,'exclude_auth_admin','admin',100),(4,5,'QUERY','修改','修改',NULL,NULL,'auth','admin',100),(5,6,'QUERY','修改','修改',NULL,NULL,'auth','admin',100),(6,7,'QUERY','查询','查询',NULL,NULL,'auth','admin',100),(7,8,'QUERY','组织查询','组织查询',NULL,NULL,'auth','admin',100),(8,8,'MODIFY','组织修改','组织修改',NULL,NULL,'auth','admin',100),(9,8,'DELETE','组织删除','组织删除',NULL,NULL,'auth','admin',100),(10,8,'ROLE2DEPT','组织添加角色','组织添加角色',NULL,NULL,'auth','admin',100),(11,8,'STAFF2DEPT','组织添加用户','组织添加用户',NULL,NULL,'auth','admin',100),(12,8,'AUTH2STAFF','组织成员授权','组织成员授权',NULL,NULL,'auth','admin',100),(13,9,'QUERY','查询','查询',NULL,NULL,'auth','admin',100),(14,9,'ADD','创建','创建用户',NULL,NULL,'auth','admin',100),(15,9,'UPDATE','修改','更新用户',NULL,NULL,'auth','admin',100),(16,9,'DELETE','删除','删除用户',NULL,NULL,'auth','admin',100),(17,9,'LOCKSTAFF','锁定','查询',NULL,NULL,'auth','admin',100),(18,9,'RESETPWD','重置密码','重置密码',NULL,NULL,'auth','admin',100),(19,9,'AUTHSTAFF','授权','用户授权',NULL,NULL,'auth','admin',100),(20,10,'QUERY','查询','查询',NULL,'ADD,MODIFY,DELETE','auth','admin',100),(21,10,'ADD','新增角色','新增角色','QUERY',NULL,'auth','admin',100),(22,10,'MODIFY','修改角色','修改角色','QUERY',NULL,'auth','admin',100),(23,10,'DELETE','删除角色','删除角色','QUERY',NULL,'auth','admin',100),(24,10,'AUTHROLE','角色关联权限','角色关联权限',NULL,NULL,'auth','admin',100),(221,84,'EXCLUDE','例外','例外',NULL,NULL,'exclude_eump_admin','admin',100),(222,85,'EXCLUDE','后台公用ACTION例外','后台公用ACTION登录后就可访问',NULL,NULL,'exclude_eump_admin','admin',100),(223,86,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(224,87,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(225,87,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(226,87,'reCallBack','重回调','重回调',NULL,NULL,'fmp-portal','admin',100),(227,88,'recharge','充值','充值',NULL,NULL,'fmp-portal','admin',100),(228,89,'internetthingscardRecharge','物联卡流量充值','物联卡流量充值',NULL,NULL,'fmp-portal','admin',100),(229,90,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(230,90,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(231,90,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(232,90,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(233,90,'baserecharge','基础包批量充值','基础包批量充值',NULL,NULL,'fmp-portal','admin',100),(234,90,'allrecharge','三网通批量充值','三网通批量充值',NULL,NULL,'fmp-portal','admin',100),(235,90,'redbagrecharge','流量红包批量充值','流量红包批量充值',NULL,NULL,'fmp-portal','admin',100),(236,91,'modifyPwd','修改密码','修改密码',NULL,NULL,'fmp-portal','admin',100),(237,92,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(238,92,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(239,92,'accountDetail','账户明细','账户明细',NULL,NULL,'fmp-portal','admin',100),(240,93,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(241,93,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(242,94,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(243,94,'changeStatus','调整结算单状态','调整结算单状态',NULL,NULL,'fmp-portal','admin',100),(244,94,'downLoadSettlementOrder','导出','导出',NULL,NULL,'fmp-portal','admin',100),(245,95,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(246,95,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(247,96,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(248,96,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(249,96,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(250,96,'add','新增','新增',NULL,NULL,'fmp-portal','admin',100),(251,97,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(252,97,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(253,97,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(254,97,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(255,97,'add','批量发送','批量发送',NULL,NULL,'fmp-portal','admin',100),(256,98,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(257,98,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(258,99,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(259,99,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(260,99,'add','新增/修改','新增/修改',NULL,NULL,'fmp-portal','admin',100),(261,99,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(262,100,'query','列表','列表',NULL,NULL,'fmp-portal','admin',100),(263,100,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(264,100,'add','新增/修改','新增/修改',NULL,NULL,'fmp-portal','admin',100),(265,100,'delete','删除','删除',NULL,NULL,'fmp-portal','admin',100),(266,101,'order_manager_query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(267,101,'detail','详情','详情',NULL,NULL,'fmp-portal','admin',100),(268,101,'export','导出','导出',NULL,NULL,'fmp-portal','admin',100),(269,101,'exportById','导出指定订单','导出指定订单',NULL,NULL,'fmp-portal','admin',100),(270,102,'query','查看','查看',NULL,NULL,'fmp-portal','admin',100),(271,102,'detail','详情','查看活动详情',NULL,NULL,'fmp-portal','admin',100);
/*!40000 ALTER TABLE `sec_operation_170619184622` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation_address`
--

DROP TABLE IF EXISTS `sec_operation_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation_address` (
  `ADDRESS_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问地址ID',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作外码',
  `OPERATION_ADDRESS_NAME` varchar(100) DEFAULT NULL COMMENT '访问地址名称',
  `OPERATION_ADDRESS_URL` varchar(128) NOT NULL COMMENT '访问地址URL（不包含协议、IP、端口、contextpath）',
  `PARAMETER_NAME1` varchar(64) DEFAULT NULL COMMENT '参数名一',
  `PARAMETER_VALUE1` varchar(64) DEFAULT NULL COMMENT '参数值一',
  `PARAMETER_NAME2` varchar(64) DEFAULT NULL COMMENT '参数名二',
  `PARAMETER_VALUE2` varchar(64) DEFAULT NULL COMMENT '参数值二',
  `PARAMETER_NAME3` varchar(64) DEFAULT NULL COMMENT '参数名三',
  `PARAMETER_VALUE3` varchar(64) DEFAULT NULL COMMENT '参数值三',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  PRIMARY KEY (`ADDRESS_ID`),
  UNIQUE KEY `UK_OPERATION_ADDRESS_URL` (`OPERATION_ADDRESS_URL`,`PARAMETER_NAME1`,`PARAMETER_VALUE1`,`PARAMETER_NAME2`,`PARAMETER_VALUE2`,`PARAMETER_NAME3`,`PARAMETER_VALUE3`),
  KEY `FK_sec_operation_address` (`RESOURCE_ID`,`OPERATION_KEY`),
  KEY `idx_sec_operation_address` (`OPERATION_ADDRESS_URL`),
  CONSTRAINT `FK_sec_operation_address` FOREIGN KEY (`RESOURCE_ID`, `OPERATION_KEY`) REFERENCES `sec_operation` (`RESOURCE_ID`, `OPERATION_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=930 DEFAULT CHARSET=utf8 COMMENT='资源操作地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation_address`
--

LOCK TABLES `sec_operation_address` WRITE;
/*!40000 ALTER TABLE `sec_operation_address` DISABLE KEYS */;
INSERT INTO `sec_operation_address` VALUES (1,1,'EXCLUDE','校验码','/code/getCode.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(2,1,'EXCLUDE','登录action','/portal/login.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(3,1,'EXCLUDE','登录页面','/pages/login.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(4,1,'EXCLUDE','退出登录','/portal/logout.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(5,1,'EXCLUDE','协议阅读action','/portal/readContractAgreement.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(6,1,'EXCLUDE','协议阅读页面','/pages/agreement.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(7,1,'EXCLUDE','404错误页面','/pages/404.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(8,1,'EXCLUDE','500错误页面','/pages/500.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(9,1,'EXCLUDE','未授权提醒页面','/pages/noAuthority.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(10,1,'EXCLUDE','页面签权url','/auth/pageAuth.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(11,1,'EXCLUDE','页面签权url','/auth/ifmStyle.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(12,2,'EXCLUDE','首页菜单请求','/portal/menu.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(13,2,'EXCLUDE','首页','/pages/main.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(14,2,'EXCLUDE','取用户信息','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(15,2,'EXCLUDE','退出登录','/portal/logout.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(16,2,'EXCLUDE','个人管理页面','/pages/auth/individual/modifyInfo.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(17,2,'EXCLUDE','查询个人资料','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(18,2,'EXCLUDE','修改个人资料','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(19,2,'EXCLUDE','修改个人密码页面','/pages/auth/individual/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(20,2,'EXCLUDE','修改个人密码','/staff/changePwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(21,3,'EXCLUDE','启动','/root.jsp',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(22,3,'EXCLUDE','上传组件添加action','/attachment/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(23,3,'EXCLUDE','上传组件添加action','/attachment/addForMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(24,3,'EXCLUDE','上传组件下载action','/attachment/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(25,3,'EXCLUDE','上传组件打包下载action','/attachment/downloadMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(26,3,'EXCLUDE','上传组件列表action','/attachment/list.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(27,3,'EXCLUDE','上传组件回退action','/attachment/withdraw.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(28,5,'QUERY','个人管理页面','/pages/auth/individual/modifyInfo.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(29,5,'QUERY','查询个人资料','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(30,5,'QUERY','修改个人资料','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(31,5,'QUERY','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(32,6,'QUERY','修改个人密码页面','/pages/auth/individual/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(33,6,'QUERY','修改个人密码','/staff/changePwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(34,7,'QUERY','个性化参数修改页面','/pages/auth/individual/selfConfigSetting.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(35,7,'QUERY','个性化参数查询','/pendTaskSetting/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(36,7,'QUERY','个性化参数设置','/pendTaskSetting/update.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(37,8,'QUERY','组织管理页面','/pages/auth/dept.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(38,8,'QUERY','组织树查询','/department/listDepartmentTree.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(39,8,'QUERY','组织查询','/department/findDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(40,8,'QUERY','组织详情查询','/department/findDepartmentInfo.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(41,8,'QUERY','更新组织','/department/updateDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(42,8,'QUERY','删除组织','/department/delDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(43,8,'MODIFY','更新组织','/department/updateDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(44,8,'DELETE','删除组织','/department/delDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(45,8,'ROLE2DEPT','添加组织角色','/department/updateDepartmentRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(46,8,'ROLE2DEPT','查询组织角色列表','/department/listDepartmentRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(47,8,'STAFF2DEPT','查询组织用户列表','/staff/listStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(48,8,'STAFF2DEPT','添加组织用户','/staff/updateStaffDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(49,8,'AUTH2STAFF','查询角色关联下用户列表','/staff/listRoleByStaffIds.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(50,8,'AUTH2STAFF','组织里用户权限修改','/staff/updateStaffRolesDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(51,9,'QUERY','成员管理页面','/pages/auth/staff.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(52,9,'QUERY','查询请求','/staff/listStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(53,9,'ADD','查询用户是否存在','/staff/checkStaffLoginName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(54,9,'ADD','查询用户是否存在','/staff/checkStaffMobile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(55,9,'ADD','查询用户是否存在','/staff/checkStaffEmail.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(56,9,'ADD','创建请求','/staff/createStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(57,9,'ADD','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(58,9,'UPDATE','查询用户是否存在','/staff/checkStaffLoginName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(59,9,'UPDATE','获取用户详情','/staff/findStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(60,9,'UPDATE','更新','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(61,9,'UPDATE','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(62,9,'DELETE','删除请求','/staff/deleteStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(63,9,'LOCKSTAFF','锁定请求','/staff/lockStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(64,9,'RESETPWD','重置密码请求','/staff/resetPwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(65,9,'AUTHSTAFF','获取用户详情','/staff/findStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(66,9,'AUTHSTAFF','查询用户角色列表','/staff/listStaffRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(67,9,'AUTHSTAFF','更新用户角色','/staff/updateStaffRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(68,10,'QUERY','浏览角色页面','/pages/auth/role.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(69,10,'QUERY','查看','/role/listRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(70,10,'ADD','查询角色助记码是否存在','/role/checkRoleKey.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(71,10,'ADD','添加','/role/updateRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(72,10,'MODIFY','查询角色助记码是否存在','/role/checkRoleKey.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(73,10,'MODIFY','查询角色详情','/role/findRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(74,10,'MODIFY','修改','/role/updateRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(75,10,'DELETE','删除角色','/role/deleteRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(76,10,'AUTHROLE','浏览角色页面','/pages/auth/roleSetting.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(77,10,'AUTHROLE','权限列表','/role/listRoleResource.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(78,10,'AUTHROLE','关联角色权限','/role/updateRoleResource.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(783,103,'EXCLUDE','上传组件action','/attachment/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(784,103,'EXCLUDE','上传组件action','/attachment/list.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(785,103,'EXCLUDE','上传组件action','/attachment/withdraw.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(786,103,'EXCLUDE','上传组件列表action','/attachment/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(787,103,'EXCLUDE','上传组件回退action','/attachment/downloadMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(788,103,'EXCLUDE','上传组件类型浏览action','/attachment/view.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(789,104,'EXCLUDE','上传组件列表action','/codeDict/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(790,105,'query','概述','/pages/activityOverview.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(791,105,'query','当前账户查询','/activityOverview/getCurrentUserInfo.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(792,105,'query','初始化累计存款和累计消费','/customerTradeFlow/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(793,105,'query','流量下发信息查询','/activityOverview/getApps.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(794,105,'query','根据天数查询流量下发信息','/activityOverview/getReportListByDay.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(795,106,'query','列表','/pages/flowOrderInfo_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(796,106,'query','列表查询','/flowOrderInfo/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(797,106,'query','查询App名称下拉列表','/flowOrderInfo/getFlowAppByCustomerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(798,106,'query','详情','/pages/flowOrderInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(799,106,'query','详情查询','/flowOrderInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(800,106,'query','报表下载列表','/flowOrderInfo/listReports.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(801,106,'export','导出','/flowOrderInfo/downLoadOrder.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(802,106,'export','记录导出条数','/flowOrderInfo/getDownCount.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(803,106,'export','报表下载','/flowOrderInfo/downloadReport.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(804,106,'reCallBack','重回调','/flowOrderInfo/reCallBack.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(805,107,'recharge_url','微信充值页面链接','/pages/wechatRecharge.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(806,107,'recharge_url','判断是否激活','/wxConfInfo/checkIfExistsUrl.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(807,107,'recharge_url','激活微信链接','/wxConfInfo/applyUrl.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(808,108,'recharge','流量充值列表','/pages/flowRecharge.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(809,109,'internetthingscardRecharge','流量充值列表','/pages/internetOfThingsCardRecharge.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(810,110,'query','流量批量充值列表','/pages/fileUploadRecord_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(811,110,'query','列表查询','/fileUploadRecord/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(812,110,'query','验证客户是否有订单','/flowRecharge/getFlowOrderInfoByCustomerId.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(813,110,'detail','详情','/pages/fileUploadRecord_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(814,110,'detail','详情查询','/fileUploadRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(815,110,'delete','删除','/fileUploadRecord/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(816,110,'export','充值结果导出','/flowBatchRecord/exportTopUpResults.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(817,110,'baserecharge','批量充值第一步','/pages/batchRechargeStep1.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(818,110,'baserecharge','导出模板文件','/fileUploadRecord/exportTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(819,110,'baserecharge','追加模板文件','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(820,110,'baserecharge','批量充值第二步','/pages/batchRechargeStep2.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(821,110,'baserecharge','初始化充值号码信息','/flowBatchRecord/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(822,110,'baserecharge','初始化充值流量产品','/flowRecharge/getBatchFlowPackageInfo.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(823,110,'baserecharge','下载未识别的手机号码','/flowBatchRecord/exportUnrecognizedFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(824,110,'baserecharge','批量充值','/flowBatchRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(825,110,'allrecharge','批量充值第一步','/pages/batchRechargeStep1.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(826,110,'allrecharge','导出模板文件','/fileUploadRecord/exportTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(827,110,'allrecharge','追加模板文件','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(828,110,'allrecharge','批量充值第二步','/pages/batchRechargeStep2.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(829,110,'allrecharge','初始化充值号码信息','/flowBatchRecord/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(830,110,'allrecharge','初始化充值流量产品','/flowRecharge/getBatchFlowPackageInfo.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(831,110,'allrecharge','下载未识别的手机号码','/flowBatchRecord/exportUnrecognizedFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(832,110,'allrecharge','批量充值','/flowBatchRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(833,110,'redbagrecharge','批量充值第一步','/pages/batchRechargeStep1.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(834,110,'redbagrecharge','导出模板文件','/fileUploadRecord/exportTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(835,110,'redbagrecharge','追加模板文件','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(836,110,'redbagrecharge','批量充值第二步','/pages/batchRechargeStep2.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(837,110,'redbagrecharge','初始化充值号码信息','/flowBatchRecord/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(838,110,'redbagrecharge','初始化充值流量产品','/flowRecharge/getBatchFlowPackageInfo.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(839,110,'redbagrecharge','下载未识别的手机号码','/flowBatchRecord/exportUnrecognizedFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(840,110,'redbagrecharge','批量充值','/flowBatchRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(841,111,'modifyPwd','修改密码','/pages/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(842,111,'modifyPwd','修改密码','/customerInfo/mobifyPassWd.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(843,112,'query','客户账单列表','/pages/customerBill_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(844,112,'query','获取数据','/customerInfo/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(845,112,'detail','详情页面','/pages/customerInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(846,112,'detail','详情获取','/customerInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(847,112,'accountDetail','账户明细页面','/pages/customerAccountDetail_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(848,112,'accountDetail','查询请求','/customerInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(849,112,'accountDetail','交易流水查询','/customerTradeFlow/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(850,112,'accountDetail','初始化累计存款和累计消费','/customerTradeFlow/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(851,113,'query','账单查询列表','/pages/customerBillQuery_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(852,113,'query','账单查询','/customerBalanceDay/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(853,113,'query','查询下发数和下发金额','/customerBalanceDay/initCustomerCountAndPriceTotal.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(854,113,'export','导出','/customerBalanceDay/downLoadCustomerBill.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(855,114,'query','结算单查询列表','/pages/customerSettlementOrder_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(856,114,'query','结算单查询','/customerBalanceMonth/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(857,114,'changeStatus','调整结算单状态','/customerBalanceMonth/changeStatus.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(858,114,'downLoadSettlementOrder','导出','/customerBalanceMonth/downLoadSettlementOrder.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(859,115,'query','客户结算报表列表','/pages/customerAccountSettlement_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(860,115,'query','客户结算报表','/customerAccountSettlement/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(861,115,'export','报表下载','/customerAccountSettlement/downloadReport.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(862,116,'query','短信模板列表','/pages/smsTmpl_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(863,116,'query','列表查询','/smsTmpl/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(864,116,'query','查询所有合作伙伴','/smsTmpl/selectPartnerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(865,116,'query','修改状态','/smsTmpl/changeIsValid.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(866,116,'detail','详情','/pages/smsTmpl_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(867,116,'detail','详情查询','/smsTmpl/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(868,116,'delete','删除','/smsTmpl/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(869,116,'add','新增','/pages/smsTmpl_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(870,116,'add','添加或更新数据','/smsTmpl/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(871,117,'query','批量下发卡密列表','/pages/fileUploadRecordCard_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(872,117,'query','列表查询','/fileUploadRecord/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(873,117,'detail','详情','/pages/fileUploadRecordCard_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(874,117,'detail','详情查询','/fileUploadRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(875,117,'delete','删除','/fileUploadRecord/deleteSms.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(876,117,'export','导出','/smsRecord/downLoadSmsRecord.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(877,117,'add','新增','/pages/fileUploadRecordCard_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(878,117,'add','详情查询','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(879,117,'add','短信模板查询','/fileUploadRecord/getSmsTmpl.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(880,117,'add','详情查询','/fileUploadRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(881,117,'add','下载模板','/fileUploadRecord/exportSmsTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(882,118,'query','批量下发卡密列表','/pages/smsRecord_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(883,118,'query','列表查询','/smsRecord/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(884,118,'query','详情页面','/pages/smsRecord_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(885,118,'query','详情请求','/smsRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(886,118,'export','导出','/smsRecord/downLoadSmsRecord.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(887,119,'query','充值页面配置列表','/pages/recharge/rechargeConf_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(888,119,'query','查询请求','/rechargeConf/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(889,119,'query','获取对应客户信息','/orderInfo/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(890,119,'query','查询合作伙伴信息','/orderInfo/selectPartnerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(891,119,'detail','充值页面配置详情','/pages/recharge/rechargeConf_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(892,119,'detail','查询请求','/rechargeConf/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(893,119,'add','页面','/pages/recharge/rechargeConf_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(894,119,'add','新增请求','/rechargeConf/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(895,119,'add','获取详情请求','/rechargeConf/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(896,119,'add','获取未配置充值页面的客户信息','/rechargeConf/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(897,119,'add','获取客户订单详情信息','/rechargeConf/getListByCustomerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(898,119,'add','获取微信配置信息','/wxConfInfo/selectByWxName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(899,119,'delete','删除','/rechargeConf/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(900,120,'query','优惠活动列表','/pages/recharge/rechargeDiscountAct_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(901,120,'query','查询请求','/rechargeDiscountAct/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(902,120,'query','获取对应客户信息','/orderInfo/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(903,120,'detail','充值页面配置详情','/pages/recharge/rechargeDiscountAct_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(904,120,'detail','查询请求','/rechargeDiscountAct/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(905,120,'add','页面','/pages/recharge/rechargeDiscountAct_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(906,120,'add','新增请求','/rechargeDiscountAct/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(907,120,'add','获取详情请求','/rechargeDiscountAct/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(908,120,'add','获取未配置优惠活动的客户信息','/rechargeDiscountAct/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(909,120,'add','获取客户订单详情信息','/rechargeDiscountAct/getListByCustomerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(910,120,'add','获取客户订单产品详情信息','/rechargeDiscountAct/selectProductByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(911,120,'delete','删除','/rechargeDiscountAct/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(912,121,'order_manager_query','订单列表','/pages/orderInfo_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(913,121,'order_manager_query','获取数据','/orderInfo/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(914,121,'order_manager_query','详情页面','/pages/orderInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(915,121,'order_manager_query','详情获取','/orderInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(916,121,'order_manager_query','获取对应客户信息','/orderInfo/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(917,121,'order_manager_query','客户详情获取','/customerInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(918,121,'order_manager_query','查询客户','/orderInfo/selectByPartnerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(919,121,'detail','详情页面','/pages/orderInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(920,121,'detail','详情获取','/orderInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(921,121,'detail','订单详情初始化','/orderInfo/orderInfoViewInit.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(922,121,'detail','初始化客户订单历史记录','/orderDealRecord/getOrderDealRecord.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(923,121,'detail','下载','/orderDealRecord/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(924,121,'export','导出','/orderInfo/downLoadOrder.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(925,121,'exportById','导出指定订单','/orderInfo/downLoadOrderByOrderId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(926,122,'query','查看页面','/pages/internetOfThingsCard_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(927,122,'query','查看请求','/internetOfThingsCard/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(928,122,'detail','详情页面','/pages/internetOfThingsCard_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(929,122,'detail','详情获取','/internetOfThingsCard/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin');
/*!40000 ALTER TABLE `sec_operation_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation_url_160517194215`
--

DROP TABLE IF EXISTS `sec_operation_url_160517194215`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation_url_160517194215` (
  `ADDRESS_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '访问地址ID',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作外码',
  `OPERATION_ADDRESS_NAME` varchar(100) DEFAULT NULL COMMENT '访问地址名称',
  `OPERATION_ADDRESS_URL` varchar(128) NOT NULL COMMENT '访问地址URL（不包含协议、IP、端口、contextpath）',
  `PARAMETER_NAME1` varchar(64) DEFAULT NULL COMMENT '参数名一',
  `PARAMETER_VALUE1` varchar(64) DEFAULT NULL COMMENT '参数值一',
  `PARAMETER_NAME2` varchar(64) DEFAULT NULL COMMENT '参数名二',
  `PARAMETER_VALUE2` varchar(64) DEFAULT NULL COMMENT '参数值二',
  `PARAMETER_NAME3` varchar(64) DEFAULT NULL COMMENT '参数名三',
  `PARAMETER_VALUE3` varchar(64) DEFAULT NULL COMMENT '参数值三',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation_url_160517194215`
--

LOCK TABLES `sec_operation_url_160517194215` WRITE;
/*!40000 ALTER TABLE `sec_operation_url_160517194215` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_operation_url_160517194215` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation_url_160517203036`
--

DROP TABLE IF EXISTS `sec_operation_url_160517203036`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation_url_160517203036` (
  `ADDRESS_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '访问地址ID',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作外码',
  `OPERATION_ADDRESS_NAME` varchar(100) DEFAULT NULL COMMENT '访问地址名称',
  `OPERATION_ADDRESS_URL` varchar(128) NOT NULL COMMENT '访问地址URL（不包含协议、IP、端口、contextpath）',
  `PARAMETER_NAME1` varchar(64) DEFAULT NULL COMMENT '参数名一',
  `PARAMETER_VALUE1` varchar(64) DEFAULT NULL COMMENT '参数值一',
  `PARAMETER_NAME2` varchar(64) DEFAULT NULL COMMENT '参数名二',
  `PARAMETER_VALUE2` varchar(64) DEFAULT NULL COMMENT '参数值二',
  `PARAMETER_NAME3` varchar(64) DEFAULT NULL COMMENT '参数名三',
  `PARAMETER_VALUE3` varchar(64) DEFAULT NULL COMMENT '参数值三',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation_url_160517203036`
--

LOCK TABLES `sec_operation_url_160517203036` WRITE;
/*!40000 ALTER TABLE `sec_operation_url_160517203036` DISABLE KEYS */;
INSERT INTO `sec_operation_url_160517203036` VALUES (1,1,'EXCLUDE','校验码','/code/getCode.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(2,1,'EXCLUDE','登录action','/portal/login.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(3,1,'EXCLUDE','登录页面','/pages/login.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(4,1,'EXCLUDE','退出登录','/portal/logout.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(5,1,'EXCLUDE','协议阅读action','/portal/readContractAgreement.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(6,1,'EXCLUDE','协议阅读页面','/pages/agreement.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(7,1,'EXCLUDE','404错误页面','/pages/404.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(8,1,'EXCLUDE','500错误页面','/pages/500.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(9,1,'EXCLUDE','未授权提醒页面','/pages/noAuthority.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(10,1,'EXCLUDE','页面签权url','/auth/pageAuth.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(11,1,'EXCLUDE','页面签权url','/auth/ifmStyle.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(12,2,'EXCLUDE','首页菜单请求','/portal/menu.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(13,2,'EXCLUDE','首页','/pages/main.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(14,2,'EXCLUDE','取用户信息','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(15,2,'EXCLUDE','退出登录','/portal/logout.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(16,2,'EXCLUDE','个人管理页面','/pages/auth/individual/modifyInfo.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(17,2,'EXCLUDE','查询个人资料','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(18,2,'EXCLUDE','修改个人资料','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(19,2,'EXCLUDE','修改个人密码页面','/pages/auth/individual/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(20,2,'EXCLUDE','修改个人密码','/staff/changePwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(21,3,'EXCLUDE','启动','/root.jsp',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(22,3,'EXCLUDE','上传组件添加action','/attachment/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(23,3,'EXCLUDE','上传组件添加action','/attachment/addForMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(24,3,'EXCLUDE','上传组件下载action','/attachment/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(25,3,'EXCLUDE','上传组件打包下载action','/attachment/downloadMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(26,3,'EXCLUDE','上传组件列表action','/attachment/list.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(27,3,'EXCLUDE','上传组件回退action','/attachment/withdraw.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(28,5,'QUERY','个人管理页面','/pages/auth/individual/modifyInfo.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(29,5,'QUERY','查询个人资料','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(30,5,'QUERY','修改个人资料','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(31,5,'QUERY','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(32,6,'QUERY','修改个人密码页面','/pages/auth/individual/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(33,6,'QUERY','修改个人密码','/staff/changePwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(34,7,'QUERY','个性化参数修改页面','/pages/auth/individual/selfConfigSetting.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(35,7,'QUERY','个性化参数查询','/pendTaskSetting/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(36,7,'QUERY','个性化参数设置','/pendTaskSetting/update.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(37,8,'QUERY','组织管理页面','/pages/auth/dept.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(38,8,'QUERY','组织树查询','/department/listDepartmentTree.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(39,8,'QUERY','组织查询','/department/findDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(40,8,'QUERY','组织详情查询','/department/findDepartmentInfo.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(41,8,'QUERY','更新组织','/department/updateDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(42,8,'QUERY','删除组织','/department/delDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(43,8,'MODIFY','更新组织','/department/updateDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(44,8,'DELETE','删除组织','/department/delDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(45,8,'ROLE2DEPT','添加组织角色','/department/updateDepartmentRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(46,8,'ROLE2DEPT','查询组织角色列表','/department/listDepartmentRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(47,8,'STAFF2DEPT','查询组织用户列表','/staff/listStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(48,8,'STAFF2DEPT','添加组织用户','/staff/updateStaffDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(49,8,'AUTH2STAFF','查询角色关联下用户列表','/staff/listRoleByStaffIds.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(50,8,'AUTH2STAFF','组织里用户权限修改','/staff/updateStaffRolesDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(51,9,'QUERY','成员管理页面','/pages/auth/staff.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(52,9,'QUERY','查询请求','/staff/listStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(53,9,'ADD','查询用户是否存在','/staff/checkStaffLoginName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(54,9,'ADD','查询用户是否存在','/staff/checkStaffMobile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(55,9,'ADD','查询用户是否存在','/staff/checkStaffEmail.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(56,9,'ADD','创建请求','/staff/createStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(57,9,'ADD','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(58,9,'UPDATE','查询用户是否存在','/staff/checkStaffLoginName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(59,9,'UPDATE','获取用户详情','/staff/findStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(60,9,'UPDATE','更新','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(61,9,'UPDATE','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(62,9,'DELETE','删除请求','/staff/deleteStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(63,9,'LOCKSTAFF','锁定请求','/staff/lockStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(64,9,'RESETPWD','重置密码请求','/staff/resetPwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(65,9,'AUTHSTAFF','获取用户详情','/staff/findStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(66,9,'AUTHSTAFF','查询用户角色列表','/staff/listStaffRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(67,9,'AUTHSTAFF','更新用户角色','/staff/updateStaffRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(68,10,'QUERY','浏览角色页面','/pages/auth/role.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(69,10,'QUERY','查看','/role/listRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(70,10,'ADD','查询角色助记码是否存在','/role/checkRoleKey.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(71,10,'ADD','添加','/role/updateRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(72,10,'MODIFY','查询角色助记码是否存在','/role/checkRoleKey.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(73,10,'MODIFY','查询角色详情','/role/findRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(74,10,'MODIFY','修改','/role/updateRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(75,10,'DELETE','删除角色','/role/deleteRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(76,10,'AUTHROLE','浏览角色页面','/pages/auth/roleSetting.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(77,10,'AUTHROLE','权限列表','/role/listRoleResource.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(78,10,'AUTHROLE','关联角色权限','/role/updateRoleResource.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin');
/*!40000 ALTER TABLE `sec_operation_url_160517203036` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation_url_170411173755`
--

DROP TABLE IF EXISTS `sec_operation_url_170411173755`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation_url_170411173755` (
  `ADDRESS_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '访问地址ID',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作外码',
  `OPERATION_ADDRESS_NAME` varchar(100) DEFAULT NULL COMMENT '访问地址名称',
  `OPERATION_ADDRESS_URL` varchar(128) NOT NULL COMMENT '访问地址URL（不包含协议、IP、端口、contextpath）',
  `PARAMETER_NAME1` varchar(64) DEFAULT NULL COMMENT '参数名一',
  `PARAMETER_VALUE1` varchar(64) DEFAULT NULL COMMENT '参数值一',
  `PARAMETER_NAME2` varchar(64) DEFAULT NULL COMMENT '参数名二',
  `PARAMETER_VALUE2` varchar(64) DEFAULT NULL COMMENT '参数值二',
  `PARAMETER_NAME3` varchar(64) DEFAULT NULL COMMENT '参数名三',
  `PARAMETER_VALUE3` varchar(64) DEFAULT NULL COMMENT '参数值三',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation_url_170411173755`
--

LOCK TABLES `sec_operation_url_170411173755` WRITE;
/*!40000 ALTER TABLE `sec_operation_url_170411173755` DISABLE KEYS */;
INSERT INTO `sec_operation_url_170411173755` VALUES (1,1,'EXCLUDE','校验码','/code/getCode.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(2,1,'EXCLUDE','登录action','/portal/login.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(3,1,'EXCLUDE','登录页面','/pages/login.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(4,1,'EXCLUDE','退出登录','/portal/logout.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(5,1,'EXCLUDE','协议阅读action','/portal/readContractAgreement.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(6,1,'EXCLUDE','协议阅读页面','/pages/agreement.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(7,1,'EXCLUDE','404错误页面','/pages/404.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(8,1,'EXCLUDE','500错误页面','/pages/500.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(9,1,'EXCLUDE','未授权提醒页面','/pages/noAuthority.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(10,1,'EXCLUDE','页面签权url','/auth/pageAuth.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(11,1,'EXCLUDE','页面签权url','/auth/ifmStyle.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(12,2,'EXCLUDE','首页菜单请求','/portal/menu.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(13,2,'EXCLUDE','首页','/pages/main.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(14,2,'EXCLUDE','取用户信息','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(15,2,'EXCLUDE','退出登录','/portal/logout.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(16,2,'EXCLUDE','个人管理页面','/pages/auth/individual/modifyInfo.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(17,2,'EXCLUDE','查询个人资料','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(18,2,'EXCLUDE','修改个人资料','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(19,2,'EXCLUDE','修改个人密码页面','/pages/auth/individual/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(20,2,'EXCLUDE','修改个人密码','/staff/changePwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(21,3,'EXCLUDE','启动','/root.jsp',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(22,3,'EXCLUDE','上传组件添加action','/attachment/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(23,3,'EXCLUDE','上传组件添加action','/attachment/addForMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(24,3,'EXCLUDE','上传组件下载action','/attachment/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(25,3,'EXCLUDE','上传组件打包下载action','/attachment/downloadMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(26,3,'EXCLUDE','上传组件列表action','/attachment/list.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(27,3,'EXCLUDE','上传组件回退action','/attachment/withdraw.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(28,5,'QUERY','个人管理页面','/pages/auth/individual/modifyInfo.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(29,5,'QUERY','查询个人资料','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(30,5,'QUERY','修改个人资料','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(31,5,'QUERY','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(32,6,'QUERY','修改个人密码页面','/pages/auth/individual/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(33,6,'QUERY','修改个人密码','/staff/changePwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(34,7,'QUERY','个性化参数修改页面','/pages/auth/individual/selfConfigSetting.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(35,7,'QUERY','个性化参数查询','/pendTaskSetting/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(36,7,'QUERY','个性化参数设置','/pendTaskSetting/update.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(37,8,'QUERY','组织管理页面','/pages/auth/dept.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(38,8,'QUERY','组织树查询','/department/listDepartmentTree.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(39,8,'QUERY','组织查询','/department/findDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(40,8,'QUERY','组织详情查询','/department/findDepartmentInfo.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(41,8,'QUERY','更新组织','/department/updateDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(42,8,'QUERY','删除组织','/department/delDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(43,8,'MODIFY','更新组织','/department/updateDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(44,8,'DELETE','删除组织','/department/delDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(45,8,'ROLE2DEPT','添加组织角色','/department/updateDepartmentRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(46,8,'ROLE2DEPT','查询组织角色列表','/department/listDepartmentRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(47,8,'STAFF2DEPT','查询组织用户列表','/staff/listStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(48,8,'STAFF2DEPT','添加组织用户','/staff/updateStaffDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(49,8,'AUTH2STAFF','查询角色关联下用户列表','/staff/listRoleByStaffIds.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(50,8,'AUTH2STAFF','组织里用户权限修改','/staff/updateStaffRolesDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(51,9,'QUERY','成员管理页面','/pages/auth/staff.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(52,9,'QUERY','查询请求','/staff/listStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(53,9,'ADD','查询用户是否存在','/staff/checkStaffLoginName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(54,9,'ADD','查询用户是否存在','/staff/checkStaffMobile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(55,9,'ADD','查询用户是否存在','/staff/checkStaffEmail.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(56,9,'ADD','创建请求','/staff/createStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(57,9,'ADD','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(58,9,'UPDATE','查询用户是否存在','/staff/checkStaffLoginName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(59,9,'UPDATE','获取用户详情','/staff/findStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(60,9,'UPDATE','更新','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(61,9,'UPDATE','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(62,9,'DELETE','删除请求','/staff/deleteStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(63,9,'LOCKSTAFF','锁定请求','/staff/lockStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(64,9,'RESETPWD','重置密码请求','/staff/resetPwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(65,9,'AUTHSTAFF','获取用户详情','/staff/findStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(66,9,'AUTHSTAFF','查询用户角色列表','/staff/listStaffRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(67,9,'AUTHSTAFF','更新用户角色','/staff/updateStaffRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(68,10,'QUERY','浏览角色页面','/pages/auth/role.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(69,10,'QUERY','查看','/role/listRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(70,10,'ADD','查询角色助记码是否存在','/role/checkRoleKey.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(71,10,'ADD','添加','/role/updateRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(72,10,'MODIFY','查询角色助记码是否存在','/role/checkRoleKey.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(73,10,'MODIFY','查询角色详情','/role/findRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(74,10,'MODIFY','修改','/role/updateRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(75,10,'DELETE','删除角色','/role/deleteRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(76,10,'AUTHROLE','浏览角色页面','/pages/auth/roleSetting.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(77,10,'AUTHROLE','权限列表','/role/listRoleResource.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(78,10,'AUTHROLE','关联角色权限','/role/updateRoleResource.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(79,11,'EXCLUDE','上传组件action','/attachment/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(80,11,'EXCLUDE','上传组件action','/attachment/list.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(81,11,'EXCLUDE','上传组件action','/attachment/withdraw.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(82,11,'EXCLUDE','上传组件列表action','/attachment/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(83,11,'EXCLUDE','上传组件回退action','/attachment/downloadMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(84,11,'EXCLUDE','上传组件类型浏览action','/attachment/view.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(85,12,'EXCLUDE','上传组件列表action','/codeDict/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(86,13,'query','概述','/pages/activityOverview.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(87,13,'query','当前账户查询','/activityOverview/getCurrentUserInfo.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(88,13,'query','初始化累计存款和累计消费','/customerTradeFlow/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(89,13,'query','流量下发信息查询','/activityOverview/getApps.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(90,13,'query','根据天数查询流量下发信息','/activityOverview/getReportListByDay.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(91,14,'query','列表','/pages/flowOrderInfo_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(92,14,'query','列表查询','/flowOrderInfo/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(93,14,'query','查询App名称下拉列表','/flowOrderInfo/getFlowAppByCustomerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(94,14,'query','详情','/pages/flowOrderInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(95,14,'query','详情查询','/flowOrderInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(96,14,'export','导出','/flowOrderInfo/downLoadOrder.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(97,15,'recharge','流量充值列表','/pages/flowRecharge.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(98,16,'query','流量批量充值列表','/pages/fileUploadRecord_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(99,16,'query','列表查询','/fileUploadRecord/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(100,16,'query','验证客户是否有订单','/flowRecharge/getFlowOrderInfoByCustomerId.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(101,16,'detail','详情','/pages/fileUploadRecord_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(102,16,'detail','详情查询','/fileUploadRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(103,16,'delete','删除','/fileUploadRecord/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(104,16,'export','充值结果导出','/flowBatchRecord/exportTopUpResults.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(105,16,'baserecharge','批量充值第一步','/pages/batchRechargeStep1.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(106,16,'baserecharge','导出模板文件','/fileUploadRecord/exportTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(107,16,'baserecharge','追加模板文件','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(108,16,'baserecharge','批量充值第二步','/pages/batchRechargeStep2.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(109,16,'baserecharge','初始化充值号码信息','/flowBatchRecord/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(110,16,'baserecharge','初始化充值流量产品','/flowRecharge/getBatchFlowPackageInfo.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(111,16,'baserecharge','下载未识别的手机号码','/flowBatchRecord/exportUnrecognizedFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(112,16,'baserecharge','批量充值','/flowBatchRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(113,16,'allrecharge','批量充值第一步','/pages/batchRechargeStep1.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(114,16,'allrecharge','导出模板文件','/fileUploadRecord/exportTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(115,16,'allrecharge','追加模板文件','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(116,16,'allrecharge','批量充值第二步','/pages/batchRechargeStep2.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(117,16,'allrecharge','初始化充值号码信息','/flowBatchRecord/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(118,16,'allrecharge','初始化充值流量产品','/flowRecharge/getBatchFlowPackageInfo.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(119,16,'allrecharge','下载未识别的手机号码','/flowBatchRecord/exportUnrecognizedFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(120,16,'allrecharge','批量充值','/flowBatchRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(121,16,'redbagrecharge','批量充值第一步','/pages/batchRechargeStep1.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(122,16,'redbagrecharge','导出模板文件','/fileUploadRecord/exportTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(123,16,'redbagrecharge','追加模板文件','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(124,16,'redbagrecharge','批量充值第二步','/pages/batchRechargeStep2.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(125,16,'redbagrecharge','初始化充值号码信息','/flowBatchRecord/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(126,16,'redbagrecharge','初始化充值流量产品','/flowRecharge/getBatchFlowPackageInfo.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(127,16,'redbagrecharge','下载未识别的手机号码','/flowBatchRecord/exportUnrecognizedFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(128,16,'redbagrecharge','批量充值','/flowBatchRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(129,17,'modifyPwd','修改密码','/pages/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(130,17,'modifyPwd','修改密码','/customerInfo/mobifyPassWd.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(131,18,'query','客户账单列表','/pages/customerBill_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(132,18,'query','获取数据','/customerInfo/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(133,18,'detail','详情页面','/pages/customerInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(134,18,'detail','详情获取','/customerInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(135,18,'accountDetail','账户明细页面','/pages/customerAccountDetail_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(136,18,'accountDetail','查询请求','/customerInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(137,18,'accountDetail','交易流水查询','/customerTradeFlow/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(138,18,'accountDetail','初始化累计存款和累计消费','/customerTradeFlow/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(139,19,'query','账单查询列表','/pages/customerBillQuery_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(140,19,'query','账单查询','/customerBalanceDay/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(141,19,'query','查询下发数和下发金额','/customerBalanceDay/initCustomerCountAndPriceTotal.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(142,19,'export','导出','/customerBalanceDay/downLoadCustomerBill.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(143,20,'query','结算单查询列表','/pages/customerSettlementOrder_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(144,20,'query','结算单查询','/customerBalanceMonth/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(145,20,'changeStatus','调整结算单状态','/customerBalanceMonth/changeStatus.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(146,20,'downLoadSettlementOrder','导出','/customerBalanceMonth/downLoadSettlementOrder.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(147,21,'query','短信模板列表','/pages/smsTmpl_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(148,21,'query','列表查询','/smsTmpl/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(149,21,'query','查询所有合作伙伴','/smsTmpl/selectPartnerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(150,21,'query','修改状态','/smsTmpl/changeIsValid.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(151,21,'detail','详情','/pages/smsTmpl_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(152,21,'detail','详情查询','/smsTmpl/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(153,21,'delete','删除','/smsTmpl/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(154,21,'add','新增','/pages/smsTmpl_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(155,21,'add','添加或更新数据','/smsTmpl/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(156,22,'query','批量下发卡密列表','/pages/fileUploadRecordCard_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(157,22,'query','列表查询','/fileUploadRecord/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(158,22,'detail','详情','/pages/fileUploadRecordCard_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(159,22,'detail','详情查询','/fileUploadRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(160,22,'delete','删除','/fileUploadRecord/deleteSms.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(161,22,'export','导出','/smsRecord/downLoadSmsRecord.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(162,22,'add','新增','/pages/fileUploadRecordCard_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(163,22,'add','详情查询','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(164,22,'add','短信模板查询','/fileUploadRecord/getSmsTmpl.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(165,22,'add','详情查询','/fileUploadRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(166,22,'add','下载模板','/fileUploadRecord/exportSmsTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(167,23,'query','批量下发卡密列表','/pages/smsRecord_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(168,23,'query','列表查询','/smsRecord/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(169,23,'query','详情页面','/pages/smsRecord_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(170,23,'query','详情请求','/smsRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(171,23,'export','导出','/smsRecord/downLoadSmsRecord.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(172,24,'query','充值页面配置列表','/pages/recharge/rechargeConf_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(173,24,'query','查询请求','/rechargeConf/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(174,24,'query','获取对应客户信息','/orderInfo/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(175,24,'query','查询合作伙伴信息','/orderInfo/selectPartnerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(176,24,'detail','充值页面配置详情','/pages/recharge/rechargeConf_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(177,24,'detail','查询请求','/rechargeConf/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(178,24,'add','页面','/pages/recharge/rechargeConf_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(179,24,'add','新增请求','/rechargeConf/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(180,24,'add','获取详情请求','/rechargeConf/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(181,24,'add','获取未配置充值页面的客户信息','/rechargeConf/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(182,24,'add','获取客户订单详情信息','/rechargeConf/getListByCustomerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(183,24,'add','获取微信配置信息','/wxConfInfo/selectByWxName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(184,24,'delete','删除','/rechargeConf/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(185,25,'query','优惠活动列表','/pages/recharge/rechargeDiscountAct_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(186,25,'query','查询请求','/rechargeDiscountAct/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(187,25,'query','获取对应客户信息','/orderInfo/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(188,25,'detail','充值页面配置详情','/pages/recharge/rechargeDiscountAct_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(189,25,'detail','查询请求','/rechargeDiscountAct/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(190,25,'add','页面','/pages/recharge/rechargeDiscountAct_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(191,25,'add','新增请求','/rechargeDiscountAct/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(192,25,'add','获取详情请求','/rechargeDiscountAct/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(193,25,'add','获取未配置优惠活动的客户信息','/rechargeDiscountAct/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(194,25,'add','获取客户订单详情信息','/rechargeDiscountAct/getListByCustomerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(195,25,'add','获取客户订单产品详情信息','/rechargeDiscountAct/selectProductByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(196,25,'delete','删除','/rechargeDiscountAct/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(197,26,'order_manager_query','订单列表','/pages/orderInfo_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(198,26,'order_manager_query','获取数据','/orderInfo/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(199,26,'order_manager_query','详情页面','/pages/orderInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(200,26,'order_manager_query','详情获取','/orderInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(201,26,'order_manager_query','获取对应客户信息','/orderInfo/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(202,26,'order_manager_query','客户详情获取','/customerInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(203,26,'order_manager_query','查询客户','/orderInfo/selectByPartnerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(204,26,'detail','详情页面','/pages/orderInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(205,26,'detail','详情获取','/orderInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(206,26,'detail','订单详情初始化','/orderInfo/orderInfoViewInit.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(207,26,'detail','初始化客户订单历史记录','/orderDealRecord/getOrderDealRecord.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(208,26,'detail','下载','/orderDealRecord/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(209,26,'export','导出','/orderInfo/downLoadOrder.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(210,26,'exportById','导出指定订单','/orderInfo/downLoadOrderByOrderId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(211,27,'query','查看页面','/pages/internetOfThingsCard_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(212,27,'query','查看请求','/internetOfThingsCard/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(213,27,'detail','详情页面','/pages/internetOfThingsCard_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(214,27,'detail','详情获取','/internetOfThingsCard/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin');
/*!40000 ALTER TABLE `sec_operation_url_170411173755` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_operation_url_170619184622`
--

DROP TABLE IF EXISTS `sec_operation_url_170619184622`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_operation_url_170619184622` (
  `ADDRESS_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '访问地址ID',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作外码',
  `OPERATION_ADDRESS_NAME` varchar(100) DEFAULT NULL COMMENT '访问地址名称',
  `OPERATION_ADDRESS_URL` varchar(128) NOT NULL COMMENT '访问地址URL（不包含协议、IP、端口、contextpath）',
  `PARAMETER_NAME1` varchar(64) DEFAULT NULL COMMENT '参数名一',
  `PARAMETER_VALUE1` varchar(64) DEFAULT NULL COMMENT '参数值一',
  `PARAMETER_NAME2` varchar(64) DEFAULT NULL COMMENT '参数名二',
  `PARAMETER_VALUE2` varchar(64) DEFAULT NULL COMMENT '参数值二',
  `PARAMETER_NAME3` varchar(64) DEFAULT NULL COMMENT '参数名三',
  `PARAMETER_VALUE3` varchar(64) DEFAULT NULL COMMENT '参数值三',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_operation_url_170619184622`
--

LOCK TABLES `sec_operation_url_170619184622` WRITE;
/*!40000 ALTER TABLE `sec_operation_url_170619184622` DISABLE KEYS */;
INSERT INTO `sec_operation_url_170619184622` VALUES (1,1,'EXCLUDE','校验码','/code/getCode.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(2,1,'EXCLUDE','登录action','/portal/login.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(3,1,'EXCLUDE','登录页面','/pages/login.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(4,1,'EXCLUDE','退出登录','/portal/logout.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(5,1,'EXCLUDE','协议阅读action','/portal/readContractAgreement.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(6,1,'EXCLUDE','协议阅读页面','/pages/agreement.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(7,1,'EXCLUDE','404错误页面','/pages/404.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(8,1,'EXCLUDE','500错误页面','/pages/500.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(9,1,'EXCLUDE','未授权提醒页面','/pages/noAuthority.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(10,1,'EXCLUDE','页面签权url','/auth/pageAuth.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(11,1,'EXCLUDE','页面签权url','/auth/ifmStyle.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(12,2,'EXCLUDE','首页菜单请求','/portal/menu.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(13,2,'EXCLUDE','首页','/pages/main.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(14,2,'EXCLUDE','取用户信息','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(15,2,'EXCLUDE','退出登录','/portal/logout.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(16,2,'EXCLUDE','个人管理页面','/pages/auth/individual/modifyInfo.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(17,2,'EXCLUDE','查询个人资料','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(18,2,'EXCLUDE','修改个人资料','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(19,2,'EXCLUDE','修改个人密码页面','/pages/auth/individual/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(20,2,'EXCLUDE','修改个人密码','/staff/changePwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_portal_admin','admin'),(21,3,'EXCLUDE','启动','/root.jsp',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(22,3,'EXCLUDE','上传组件添加action','/attachment/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(23,3,'EXCLUDE','上传组件添加action','/attachment/addForMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(24,3,'EXCLUDE','上传组件下载action','/attachment/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(25,3,'EXCLUDE','上传组件打包下载action','/attachment/downloadMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(26,3,'EXCLUDE','上传组件列表action','/attachment/list.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(27,3,'EXCLUDE','上传组件回退action','/attachment/withdraw.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_auth_admin','admin'),(28,5,'QUERY','个人管理页面','/pages/auth/individual/modifyInfo.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(29,5,'QUERY','查询个人资料','/staff/findLoginStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(30,5,'QUERY','修改个人资料','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(31,5,'QUERY','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(32,6,'QUERY','修改个人密码页面','/pages/auth/individual/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(33,6,'QUERY','修改个人密码','/staff/changePwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(34,7,'QUERY','个性化参数修改页面','/pages/auth/individual/selfConfigSetting.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(35,7,'QUERY','个性化参数查询','/pendTaskSetting/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(36,7,'QUERY','个性化参数设置','/pendTaskSetting/update.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(37,8,'QUERY','组织管理页面','/pages/auth/dept.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(38,8,'QUERY','组织树查询','/department/listDepartmentTree.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(39,8,'QUERY','组织查询','/department/findDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(40,8,'QUERY','组织详情查询','/department/findDepartmentInfo.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(41,8,'QUERY','更新组织','/department/updateDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(42,8,'QUERY','删除组织','/department/delDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(43,8,'MODIFY','更新组织','/department/updateDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(44,8,'DELETE','删除组织','/department/delDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(45,8,'ROLE2DEPT','添加组织角色','/department/updateDepartmentRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(46,8,'ROLE2DEPT','查询组织角色列表','/department/listDepartmentRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(47,8,'STAFF2DEPT','查询组织用户列表','/staff/listStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(48,8,'STAFF2DEPT','添加组织用户','/staff/updateStaffDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(49,8,'AUTH2STAFF','查询角色关联下用户列表','/staff/listRoleByStaffIds.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(50,8,'AUTH2STAFF','组织里用户权限修改','/staff/updateStaffRolesDepartment.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(51,9,'QUERY','成员管理页面','/pages/auth/staff.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(52,9,'QUERY','查询请求','/staff/listStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(53,9,'ADD','查询用户是否存在','/staff/checkStaffLoginName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(54,9,'ADD','查询用户是否存在','/staff/checkStaffMobile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(55,9,'ADD','查询用户是否存在','/staff/checkStaffEmail.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(56,9,'ADD','创建请求','/staff/createStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(57,9,'ADD','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(58,9,'UPDATE','查询用户是否存在','/staff/checkStaffLoginName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(59,9,'UPDATE','获取用户详情','/staff/findStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(60,9,'UPDATE','更新','/staff/updateStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(61,9,'UPDATE','查询个人扩展属性','/staff/findStaffExtendProperties.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(62,9,'DELETE','删除请求','/staff/deleteStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(63,9,'LOCKSTAFF','锁定请求','/staff/lockStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(64,9,'RESETPWD','重置密码请求','/staff/resetPwd.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(65,9,'AUTHSTAFF','获取用户详情','/staff/findStaff.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(66,9,'AUTHSTAFF','查询用户角色列表','/staff/listStaffRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(67,9,'AUTHSTAFF','更新用户角色','/staff/updateStaffRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(68,10,'QUERY','浏览角色页面','/pages/auth/role.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(69,10,'QUERY','查看','/role/listRoles.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(70,10,'ADD','查询角色助记码是否存在','/role/checkRoleKey.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(71,10,'ADD','添加','/role/updateRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(72,10,'MODIFY','查询角色助记码是否存在','/role/checkRoleKey.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(73,10,'MODIFY','查询角色详情','/role/findRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(74,10,'MODIFY','修改','/role/updateRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(75,10,'DELETE','删除角色','/role/deleteRole.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(76,10,'AUTHROLE','浏览角色页面','/pages/auth/roleSetting.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(77,10,'AUTHROLE','权限列表','/role/listRoleResource.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(78,10,'AUTHROLE','关联角色权限','/role/updateRoleResource.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'auth','admin'),(639,84,'EXCLUDE','上传组件action','/attachment/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(640,84,'EXCLUDE','上传组件action','/attachment/list.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(641,84,'EXCLUDE','上传组件action','/attachment/withdraw.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(642,84,'EXCLUDE','上传组件列表action','/attachment/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(643,84,'EXCLUDE','上传组件回退action','/attachment/downloadMulti.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(644,84,'EXCLUDE','上传组件类型浏览action','/attachment/view.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(645,85,'EXCLUDE','上传组件列表action','/codeDict/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'exclude_eump_admin','admin'),(646,86,'query','概述','/pages/activityOverview.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(647,86,'query','当前账户查询','/activityOverview/getCurrentUserInfo.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(648,86,'query','初始化累计存款和累计消费','/customerTradeFlow/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(649,86,'query','流量下发信息查询','/activityOverview/getApps.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(650,86,'query','根据天数查询流量下发信息','/activityOverview/getReportListByDay.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(651,87,'query','列表','/pages/flowOrderInfo_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(652,87,'query','列表查询','/flowOrderInfo/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(653,87,'query','查询App名称下拉列表','/flowOrderInfo/getFlowAppByCustomerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(654,87,'query','详情','/pages/flowOrderInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(655,87,'query','详情查询','/flowOrderInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(656,87,'query','报表下载列表','/flowOrderInfo/listReports.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(657,87,'export','导出','/flowOrderInfo/downLoadOrder.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(658,87,'export','记录导出条数','/flowOrderInfo/getDownCount.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(659,87,'export','报表下载','/flowOrderInfo/downloadReport.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(660,87,'reCallBack','重回调','/flowOrderInfo/reCallBack.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(661,88,'recharge','流量充值列表','/pages/flowRecharge.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(662,89,'internetthingscardRecharge','流量充值列表','/pages/internetOfThingsCardRecharge.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(663,90,'query','流量批量充值列表','/pages/fileUploadRecord_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(664,90,'query','列表查询','/fileUploadRecord/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(665,90,'query','验证客户是否有订单','/flowRecharge/getFlowOrderInfoByCustomerId.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(666,90,'detail','详情','/pages/fileUploadRecord_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(667,90,'detail','详情查询','/fileUploadRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(668,90,'delete','删除','/fileUploadRecord/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(669,90,'export','充值结果导出','/flowBatchRecord/exportTopUpResults.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(670,90,'baserecharge','批量充值第一步','/pages/batchRechargeStep1.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(671,90,'baserecharge','导出模板文件','/fileUploadRecord/exportTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(672,90,'baserecharge','追加模板文件','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(673,90,'baserecharge','批量充值第二步','/pages/batchRechargeStep2.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(674,90,'baserecharge','初始化充值号码信息','/flowBatchRecord/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(675,90,'baserecharge','初始化充值流量产品','/flowRecharge/getBatchFlowPackageInfo.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(676,90,'baserecharge','下载未识别的手机号码','/flowBatchRecord/exportUnrecognizedFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(677,90,'baserecharge','批量充值','/flowBatchRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(678,90,'allrecharge','批量充值第一步','/pages/batchRechargeStep1.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(679,90,'allrecharge','导出模板文件','/fileUploadRecord/exportTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(680,90,'allrecharge','追加模板文件','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(681,90,'allrecharge','批量充值第二步','/pages/batchRechargeStep2.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(682,90,'allrecharge','初始化充值号码信息','/flowBatchRecord/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(683,90,'allrecharge','初始化充值流量产品','/flowRecharge/getBatchFlowPackageInfo.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(684,90,'allrecharge','下载未识别的手机号码','/flowBatchRecord/exportUnrecognizedFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(685,90,'allrecharge','批量充值','/flowBatchRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(686,90,'redbagrecharge','批量充值第一步','/pages/batchRechargeStep1.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(687,90,'redbagrecharge','导出模板文件','/fileUploadRecord/exportTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(688,90,'redbagrecharge','追加模板文件','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(689,90,'redbagrecharge','批量充值第二步','/pages/batchRechargeStep2.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(690,90,'redbagrecharge','初始化充值号码信息','/flowBatchRecord/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(691,90,'redbagrecharge','初始化充值流量产品','/flowRecharge/getBatchFlowPackageInfo.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(692,90,'redbagrecharge','下载未识别的手机号码','/flowBatchRecord/exportUnrecognizedFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(693,90,'redbagrecharge','批量充值','/flowBatchRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(694,91,'modifyPwd','修改密码','/pages/modifyPwd.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(695,91,'modifyPwd','修改密码','/customerInfo/mobifyPassWd.ws',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(696,92,'query','客户账单列表','/pages/customerBill_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(697,92,'query','获取数据','/customerInfo/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(698,92,'detail','详情页面','/pages/customerInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(699,92,'detail','详情获取','/customerInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(700,92,'accountDetail','账户明细页面','/pages/customerAccountDetail_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(701,92,'accountDetail','查询请求','/customerInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(702,92,'accountDetail','交易流水查询','/customerTradeFlow/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(703,92,'accountDetail','初始化累计存款和累计消费','/customerTradeFlow/init.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(704,93,'query','账单查询列表','/pages/customerBillQuery_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(705,93,'query','账单查询','/customerBalanceDay/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(706,93,'query','查询下发数和下发金额','/customerBalanceDay/initCustomerCountAndPriceTotal.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(707,93,'export','导出','/customerBalanceDay/downLoadCustomerBill.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(708,94,'query','结算单查询列表','/pages/customerSettlementOrder_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(709,94,'query','结算单查询','/customerBalanceMonth/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(710,94,'changeStatus','调整结算单状态','/customerBalanceMonth/changeStatus.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(711,94,'downLoadSettlementOrder','导出','/customerBalanceMonth/downLoadSettlementOrder.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(712,95,'query','客户结算报表列表','/pages/customerAccountSettlement_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(713,95,'query','客户结算报表','/customerAccountSettlement/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(714,95,'export','报表下载','/customerAccountSettlement/downloadReport.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(715,96,'query','短信模板列表','/pages/smsTmpl_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(716,96,'query','列表查询','/smsTmpl/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(717,96,'query','查询所有合作伙伴','/smsTmpl/selectPartnerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(718,96,'query','修改状态','/smsTmpl/changeIsValid.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(719,96,'detail','详情','/pages/smsTmpl_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(720,96,'detail','详情查询','/smsTmpl/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(721,96,'delete','删除','/smsTmpl/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(722,96,'add','新增','/pages/smsTmpl_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(723,96,'add','添加或更新数据','/smsTmpl/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(724,97,'query','批量下发卡密列表','/pages/fileUploadRecordCard_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(725,97,'query','列表查询','/fileUploadRecord/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(726,97,'detail','详情','/pages/fileUploadRecordCard_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(727,97,'detail','详情查询','/fileUploadRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(728,97,'delete','删除','/fileUploadRecord/deleteSms.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(729,97,'export','导出','/smsRecord/downLoadSmsRecord.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(730,97,'add','新增','/pages/fileUploadRecordCard_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(731,97,'add','详情查询','/fileUploadRecord/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(732,97,'add','短信模板查询','/fileUploadRecord/getSmsTmpl.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(733,97,'add','详情查询','/fileUploadRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(734,97,'add','下载模板','/fileUploadRecord/exportSmsTemplateFile.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(735,98,'query','批量下发卡密列表','/pages/smsRecord_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(736,98,'query','列表查询','/smsRecord/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(737,98,'query','详情页面','/pages/smsRecord_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(738,98,'query','详情请求','/smsRecord/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(739,98,'export','导出','/smsRecord/downLoadSmsRecord.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(740,99,'query','充值页面配置列表','/pages/recharge/rechargeConf_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(741,99,'query','查询请求','/rechargeConf/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(742,99,'query','获取对应客户信息','/orderInfo/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(743,99,'query','查询合作伙伴信息','/orderInfo/selectPartnerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(744,99,'detail','充值页面配置详情','/pages/recharge/rechargeConf_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(745,99,'detail','查询请求','/rechargeConf/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(746,99,'add','页面','/pages/recharge/rechargeConf_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(747,99,'add','新增请求','/rechargeConf/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(748,99,'add','获取详情请求','/rechargeConf/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(749,99,'add','获取未配置充值页面的客户信息','/rechargeConf/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(750,99,'add','获取客户订单详情信息','/rechargeConf/getListByCustomerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(751,99,'add','获取微信配置信息','/wxConfInfo/selectByWxName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(752,99,'delete','删除','/rechargeConf/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(753,100,'query','优惠活动列表','/pages/recharge/rechargeDiscountAct_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(754,100,'query','查询请求','/rechargeDiscountAct/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(755,100,'query','获取对应客户信息','/orderInfo/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(756,100,'detail','充值页面配置详情','/pages/recharge/rechargeDiscountAct_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(757,100,'detail','查询请求','/rechargeDiscountAct/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(758,100,'add','页面','/pages/recharge/rechargeDiscountAct_add.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(759,100,'add','新增请求','/rechargeDiscountAct/add.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(760,100,'add','获取详情请求','/rechargeDiscountAct/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(761,100,'add','获取未配置优惠活动的客户信息','/rechargeDiscountAct/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(762,100,'add','获取客户订单详情信息','/rechargeDiscountAct/getListByCustomerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(763,100,'add','获取客户订单产品详情信息','/rechargeDiscountAct/selectProductByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(764,100,'delete','删除','/rechargeDiscountAct/delete.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(765,101,'order_manager_query','订单列表','/pages/orderInfo_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(766,101,'order_manager_query','获取数据','/orderInfo/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(767,101,'order_manager_query','详情页面','/pages/orderInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(768,101,'order_manager_query','详情获取','/orderInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(769,101,'order_manager_query','获取对应客户信息','/orderInfo/selectCustomerInfoByName.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(770,101,'order_manager_query','客户详情获取','/customerInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(771,101,'order_manager_query','查询客户','/orderInfo/selectByPartnerId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(772,101,'detail','详情页面','/pages/orderInfo_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(773,101,'detail','详情获取','/orderInfo/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(774,101,'detail','订单详情初始化','/orderInfo/orderInfoViewInit.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(775,101,'detail','初始化客户订单历史记录','/orderDealRecord/getOrderDealRecord.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(776,101,'detail','下载','/orderDealRecord/download.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(777,101,'export','导出','/orderInfo/downLoadOrder.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(778,101,'exportById','导出指定订单','/orderInfo/downLoadOrderByOrderId.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(779,102,'query','查看页面','/pages/internetOfThingsCard_list.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(780,102,'query','查看请求','/internetOfThingsCard/query.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(781,102,'detail','详情页面','/pages/internetOfThingsCard_view.shtml',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin'),(782,102,'detail','详情获取','/internetOfThingsCard/get.ajax',NULL,NULL,NULL,NULL,NULL,NULL,'fmp-portal','admin');
/*!40000 ALTER TABLE `sec_operation_url_170619184622` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_password_history`
--

DROP TABLE IF EXISTS `sec_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_password_history` (
  `STAFF_ID` bigint(20) NOT NULL COMMENT '成员ID',
  `PASSWORD` varchar(128) NOT NULL COMMENT '密码',
  `UPDATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '变更时间',
  PRIMARY KEY (`STAFF_ID`,`UPDATE_DATE`),
  CONSTRAINT `FK_SEC_PASSWORD_HISTORY` FOREIGN KEY (`STAFF_ID`) REFERENCES `sec_staff` (`STAFF_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户密码变更日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_password_history`
--

LOCK TABLES `sec_password_history` WRITE;
/*!40000 ALTER TABLE `sec_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resource_cat_160517194215`
--

DROP TABLE IF EXISTS `sec_resource_cat_160517194215`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resource_cat_160517194215` (
  `CATEGORY_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源分类ID',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级资源分类ID',
  `CATEGORY_NAME` varchar(100) DEFAULT NULL COMMENT '资源分类名称',
  `CATEGORY_DESC` varchar(100) DEFAULT NULL COMMENT '资源分类描述',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `CATEGORY_KEY` varchar(100) DEFAULT NULL COMMENT '资源分类外码',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源分类的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resource_cat_160517194215`
--

LOCK TABLES `sec_resource_cat_160517194215` WRITE;
/*!40000 ALTER TABLE `sec_resource_cat_160517194215` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_resource_cat_160517194215` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resource_cat_160517203036`
--

DROP TABLE IF EXISTS `sec_resource_cat_160517203036`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resource_cat_160517203036` (
  `CATEGORY_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源分类ID',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级资源分类ID',
  `CATEGORY_NAME` varchar(100) DEFAULT NULL COMMENT '资源分类名称',
  `CATEGORY_DESC` varchar(100) DEFAULT NULL COMMENT '资源分类描述',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `CATEGORY_KEY` varchar(100) DEFAULT NULL COMMENT '资源分类外码',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源分类的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resource_cat_160517203036`
--

LOCK TABLES `sec_resource_cat_160517203036` WRITE;
/*!40000 ALTER TABLE `sec_resource_cat_160517203036` DISABLE KEYS */;
INSERT INTO `sec_resource_cat_160517203036` VALUES (1,NULL,'portal例外资源','portal例外资源','exclude_portal_admin','exclude_portal_admin','admin',100),(2,NULL,'admin端例外资源','admin端例外资源','exclude_auth_admin','exclude_auth_admin','admin',100),(3,NULL,'系统管理','系统管理','auth','auth_admin','admin',3000),(4,3,'个人管理','个人管理','auth','auth_admin_sys_individual','admin',100),(5,3,'组织管理','组织管理','auth','auth_admin_sys_dept','admin',100),(6,3,'成员管理','成员管理','auth','auth_admin_sys_staff','admin',100),(7,3,'角色管理','角色管理','auth','auth_admin_sys_role','admin',100);
/*!40000 ALTER TABLE `sec_resource_cat_160517203036` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resource_cat_170411173755`
--

DROP TABLE IF EXISTS `sec_resource_cat_170411173755`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resource_cat_170411173755` (
  `CATEGORY_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源分类ID',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级资源分类ID',
  `CATEGORY_NAME` varchar(100) DEFAULT NULL COMMENT '资源分类名称',
  `CATEGORY_DESC` varchar(100) DEFAULT NULL COMMENT '资源分类描述',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `CATEGORY_KEY` varchar(100) DEFAULT NULL COMMENT '资源分类外码',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源分类的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resource_cat_170411173755`
--

LOCK TABLES `sec_resource_cat_170411173755` WRITE;
/*!40000 ALTER TABLE `sec_resource_cat_170411173755` DISABLE KEYS */;
INSERT INTO `sec_resource_cat_170411173755` VALUES (1,NULL,'portal例外资源','portal例外资源','exclude_portal_admin','exclude_portal_admin','admin',100),(2,NULL,'admin端例外资源','admin端例外资源','exclude_auth_admin','exclude_auth_admin','admin',100),(3,NULL,'系统管理','系统管理','auth','auth_admin','admin',3000),(4,3,'个人管理','个人管理','auth','auth_admin_sys_individual','admin',100),(5,3,'组织管理','组织管理','auth','auth_admin_sys_dept','admin',100),(6,3,'成员管理','成员管理','auth','auth_admin_sys_staff','admin',100),(7,3,'角色管理','角色管理','auth','auth_admin_sys_role','admin',100),(8,NULL,'admin端例外资源','admin端例外资源','exclude_eump_admin','exclude_eump_admin','admin',100),(9,NULL,'流量业务运营管理平台','流量业务运营管理平台','fmp-portal','manager','admin',2000),(10,9,'客服自服务门户','客服自服务门户','fmp-portal','auth_customer_self','admin',100),(11,9,'客户账单管理','客户账单管理','fmp-portal','auth_customer_bill_manager','admin',100),(12,9,'卡券批量处理','卡券批量处理','fmp-portal','auth_customer_sms_self','admin',100),(13,9,'微信充值页面配置','微信充值页面配置','fmp-portal','auth_wx_recharge_conf_manager','admin',100),(14,9,'订单管理','订单管理','fmp-portal','auth_order_manager','admin',100),(15,9,'物联网卡管理','物联网卡管理','fmp-portal','auth_data_internet_of_things_card','admin',100);
/*!40000 ALTER TABLE `sec_resource_cat_170411173755` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resource_cat_170619184622`
--

DROP TABLE IF EXISTS `sec_resource_cat_170619184622`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resource_cat_170619184622` (
  `CATEGORY_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源分类ID',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级资源分类ID',
  `CATEGORY_NAME` varchar(100) DEFAULT NULL COMMENT '资源分类名称',
  `CATEGORY_DESC` varchar(100) DEFAULT NULL COMMENT '资源分类描述',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `CATEGORY_KEY` varchar(100) DEFAULT NULL COMMENT '资源分类外码',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源分类的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resource_cat_170619184622`
--

LOCK TABLES `sec_resource_cat_170619184622` WRITE;
/*!40000 ALTER TABLE `sec_resource_cat_170619184622` DISABLE KEYS */;
INSERT INTO `sec_resource_cat_170619184622` VALUES (1,NULL,'portal例外资源','portal例外资源','exclude_portal_admin','exclude_portal_admin','admin',100),(2,NULL,'admin端例外资源','admin端例外资源','exclude_auth_admin','exclude_auth_admin','admin',100),(3,NULL,'系统管理','系统管理','auth','auth_admin','admin',3000),(4,3,'个人管理','个人管理','auth','auth_admin_sys_individual','admin',100),(5,3,'组织管理','组织管理','auth','auth_admin_sys_dept','admin',100),(6,3,'成员管理','成员管理','auth','auth_admin_sys_staff','admin',100),(7,3,'角色管理','角色管理','auth','auth_admin_sys_role','admin',100),(8,NULL,'admin端例外资源','admin端例外资源','exclude_eump_admin','exclude_eump_admin','admin',100),(9,NULL,'流量业务运营管理平台','流量业务运营管理平台','fmp-portal','manager','admin',2000),(10,9,'客服自服务门户','客服自服务门户','fmp-portal','auth_customer_self','admin',100),(11,9,'客户账单管理','客户账单管理','fmp-portal','auth_customer_bill_manager','admin',100),(12,9,'卡券批量处理','卡券批量处理','fmp-portal','auth_customer_sms_self','admin',100),(13,9,'微信充值页面配置','微信充值页面配置','fmp-portal','auth_wx_recharge_conf_manager','admin',100),(14,9,'订单管理','订单管理','fmp-portal','auth_order_manager','admin',100),(15,9,'物联网卡管理','物联网卡管理','fmp-portal','auth_data_internet_of_things_card','admin',100),(40,NULL,'admin端例外资源','admin端例外资源','exclude_eump_admin','exclude_eump_admin','admin',100),(41,NULL,'流量业务运营管理平台','流量业务运营管理平台','fmp-portal','manager','admin',2000),(42,41,'客服自服务门户','客服自服务门户','fmp-portal','auth_customer_self','admin',100),(43,41,'客户账单管理','客户账单管理','fmp-portal','auth_customer_bill_manager','admin',100),(44,41,'卡券批量处理','卡券批量处理','fmp-portal','auth_customer_sms_self','admin',100),(45,41,'微信充值页面配置','微信充值页面配置','fmp-portal','auth_wx_recharge_conf_manager','admin',100),(46,41,'订单管理','订单管理','fmp-portal','auth_order_manager','admin',100),(47,41,'物联网卡管理','物联网卡管理','fmp-portal','auth_data_internet_of_things_card','admin',100);
/*!40000 ALTER TABLE `sec_resource_cat_170619184622` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resource_category`
--

DROP TABLE IF EXISTS `sec_resource_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resource_category` (
  `CATEGORY_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源分类ID',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级资源分类ID',
  `CATEGORY_NAME` varchar(100) DEFAULT NULL COMMENT '资源分类名称',
  `CATEGORY_DESC` varchar(100) DEFAULT NULL COMMENT '资源分类描述',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `CATEGORY_KEY` varchar(100) DEFAULT NULL COMMENT '资源分类外码',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源分类的顺序',
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `FK_sec_resource_category` (`PARENT_ID`),
  CONSTRAINT `FK_sec_resource_category` FOREIGN KEY (`PARENT_ID`) REFERENCES `sec_resource_category` (`CATEGORY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='资源分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resource_category`
--

LOCK TABLES `sec_resource_category` WRITE;
/*!40000 ALTER TABLE `sec_resource_category` DISABLE KEYS */;
INSERT INTO `sec_resource_category` VALUES (1,NULL,'portal例外资源','portal例外资源','exclude_portal_admin','exclude_portal_admin','admin',100),(2,NULL,'admin端例外资源','admin端例外资源','exclude_auth_admin','exclude_auth_admin','admin',100),(3,NULL,'系统管理','系统管理','auth','auth_admin','admin',3000),(4,3,'个人管理','个人管理','auth','auth_admin_sys_individual','admin',100),(5,3,'组织管理','组织管理','auth','auth_admin_sys_dept','admin',100),(6,3,'成员管理','成员管理','auth','auth_admin_sys_staff','admin',100),(7,3,'角色管理','角色管理','auth','auth_admin_sys_role','admin',100),(8,NULL,'admin端例外资源','admin端例外资源','exclude_eump_admin','exclude_eump_admin','admin',100),(9,NULL,'流量业务运营管理平台','流量业务运营管理平台','fmp-portal','manager','admin',2000),(10,9,'客服自服务门户','客服自服务门户','fmp-portal','auth_customer_self','admin',100),(11,9,'客户账单管理','客户账单管理','fmp-portal','auth_customer_bill_manager','admin',100),(12,9,'卡券批量处理','卡券批量处理','fmp-portal','auth_customer_sms_self','admin',100),(13,9,'微信充值页面配置','微信充值页面配置','fmp-portal','auth_wx_recharge_conf_manager','admin',100),(14,9,'订单管理','订单管理','fmp-portal','auth_order_manager','admin',100),(15,9,'物联网卡管理','物联网卡管理','fmp-portal','auth_data_internet_of_things_card','admin',100),(48,NULL,'admin端例外资源','admin端例外资源','exclude_eump_admin','exclude_eump_admin','admin',100),(49,NULL,'流量业务运营管理平台','流量业务运营管理平台','fmp-portal','manager','admin',2000),(50,49,'客服自服务门户','客服自服务门户','fmp-portal','auth_customer_self','admin',100),(51,49,'客户账单管理','客户账单管理','fmp-portal','auth_customer_bill_manager','admin',100),(52,49,'卡券批量处理','卡券批量处理','fmp-portal','auth_customer_sms_self','admin',100),(53,49,'微信充值页面配置','微信充值页面配置','fmp-portal','auth_wx_recharge_conf_manager','admin',100),(54,49,'订单管理','订单管理','fmp-portal','auth_order_manager','admin',100),(55,49,'物联网卡管理','物联网卡管理','fmp-portal','auth_data_internet_of_things_card','admin',100);
/*!40000 ALTER TABLE `sec_resource_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resources`
--

DROP TABLE IF EXISTS `sec_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resources` (
  `RESOURCE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `RESOURCE_KEY` varchar(100) NOT NULL COMMENT '资源外码',
  `RESOURCE_NAME` varchar(100) NOT NULL COMMENT '资源名称',
  `RESOURCE_DESC` varchar(100) DEFAULT NULL COMMENT '资源描述',
  `CATEGORY_ID` bigint(20) NOT NULL COMMENT '资源分类ID',
  `AUTH_TYPE` varchar(10) NOT NULL COMMENT '鉴权类型(AUTH：鉴权，UNAUTH：不鉴权，LOGIN_AUTH：登录鉴权)',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源的顺序',
  PRIMARY KEY (`RESOURCE_ID`),
  UNIQUE KEY `UNQ_RESOURCE_KEY` (`RESOURCE_KEY`),
  KEY `FK_sec_resources` (`CATEGORY_ID`),
  CONSTRAINT `FK_sec_resources` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `sec_resource_category` (`CATEGORY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='资源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resources`
--

LOCK TABLES `sec_resources` WRITE;
/*!40000 ALTER TABLE `sec_resources` DISABLE KEYS */;
INSERT INTO `sec_resources` VALUES (1,'exclude_portal_admin_session','session例外资源','session例外资源',1,'UNAUTH','exclude_portal_admin','admin',100),(2,'exclude_portal_admin_perm','鉴权例外资源','鉴权例外资源',1,'LOGIN_AUTH','exclude_portal_admin','admin',100),(3,'exclude_auth_admin_session','session例外资源','session例外资源',2,'UNAUTH','exclude_auth_admin','admin',100),(4,'exclude_auth_admin_perm','鉴权例外资源','鉴权例外资源',2,'LOGIN_AUTH','exclude_auth_admin','admin',100),(5,'auth_admin_sys_individual_modifyInfo','修改帐号信息','修改帐号信息',4,'AUTH','auth','admin',100),(6,'auth_admin_sys_individual_modifyPwd','修改个人密码','修改个人密码',4,'AUTH','auth','admin',100),(7,'auth_admin_sys_individual_selfconfig','个性化参数设置','个性化参数设置',4,'AUTH','auth','admin',100),(8,'auth_admin_sys_dept_deptManage','组织管理','组织管理',5,'AUTH','auth','admin',100),(9,'auth_admin_sys_staff_staffManage','成员管理','成员管理',6,'AUTH','auth','admin',100),(10,'auth_admin_sys_role_roleManage','角色管理','角色管理',7,'AUTH','auth','admin',100),(103,'exclude_eump_admin_session','session例外资源','session例外资源',48,'UNAUTH','exclude_eump_admin','admin',100),(104,'exclude_admin_perm','鉴权例外资源','鉴权例外资源',48,'LOGIN_AUTH','exclude_eump_admin','admin',100),(105,'auth_activity_overview','活动概述','活动概述',50,'AUTH','fmp-portal','admin',100),(106,'auth_flow_order_info_list','流量发放记录','微信流量发放记录',50,'AUTH','fmp-portal','admin',100),(107,'auth_wechat_recharge_url','微信充值页面链接','微信充值页面链接',50,'AUTH','fmp-portal','admin',100),(108,'auth_flow_recharge','流量充值','流量充值',50,'AUTH','fmp-portal','admin',100),(109,'auth_internetthingscard_recharge','物联卡流量充值','物联卡流量充值',50,'AUTH','fmp-portal','admin',100),(110,'auth_flow_batch_recharge','流量批量充值','流量批量充值',50,'AUTH','fmp-portal','admin',100),(111,'auth_flow_modifyPwd','修改密码','修改密码',50,'AUTH','fmp-portal','admin',100),(112,'auth_customer_bill','账单管理','账单管理',51,'AUTH','fmp-portal','admin',100),(113,'auth_customer_bill_query','账单查询','账单查询',51,'AUTH','fmp-portal','admin',100),(114,'auth_customer_settlement_order_manager','结算单管理','结算单管理',51,'AUTH','fmp-portal','admin',100),(115,'auth_customer_account_settlement_manager','客户结算报表','客户结算报表',51,'AUTH','fmp-portal','admin',100),(116,'auth_customer_sms_tmpl','短信模板','短信模板',52,'AUTH','fmp-portal','admin',100),(117,'auth_flow_batch_card_recharge','卡券批量发送','卡券批量发送',52,'AUTH','fmp-portal','admin',100),(118,'auth_sms_record','短信记录查看','短信记录查看',52,'AUTH','fmp-portal','admin',100),(119,'auth_recharge_conf','充值页面配置','充值页面配置',53,'AUTH','fmp-portal','admin',100),(120,'auth_recharge_discount_act','优惠活动','优惠活动',53,'AUTH','fmp-portal','admin',100),(121,'auth_order_manager_list','订单列表','订单列表',54,'AUTH','fmp-portal','admin',100),(122,'auth_internet_of_things_card','物联网卡配置','物联网卡配置',55,'AUTH','fmp-portal','admin',100);
/*!40000 ALTER TABLE `sec_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resources_160517194215`
--

DROP TABLE IF EXISTS `sec_resources_160517194215`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resources_160517194215` (
  `RESOURCE_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源ID',
  `RESOURCE_KEY` varchar(100) NOT NULL COMMENT '资源外码',
  `RESOURCE_NAME` varchar(100) NOT NULL COMMENT '资源名称',
  `RESOURCE_DESC` varchar(100) DEFAULT NULL COMMENT '资源描述',
  `CATEGORY_ID` bigint(20) NOT NULL COMMENT '资源分类ID',
  `AUTH_TYPE` varchar(10) NOT NULL COMMENT '鉴权类型(AUTH：鉴权，UNAUTH：不鉴权，LOGIN_AUTH：登录鉴权)',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resources_160517194215`
--

LOCK TABLES `sec_resources_160517194215` WRITE;
/*!40000 ALTER TABLE `sec_resources_160517194215` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_resources_160517194215` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resources_160517203036`
--

DROP TABLE IF EXISTS `sec_resources_160517203036`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resources_160517203036` (
  `RESOURCE_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源ID',
  `RESOURCE_KEY` varchar(100) NOT NULL COMMENT '资源外码',
  `RESOURCE_NAME` varchar(100) NOT NULL COMMENT '资源名称',
  `RESOURCE_DESC` varchar(100) DEFAULT NULL COMMENT '资源描述',
  `CATEGORY_ID` bigint(20) NOT NULL COMMENT '资源分类ID',
  `AUTH_TYPE` varchar(10) NOT NULL COMMENT '鉴权类型(AUTH：鉴权，UNAUTH：不鉴权，LOGIN_AUTH：登录鉴权)',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resources_160517203036`
--

LOCK TABLES `sec_resources_160517203036` WRITE;
/*!40000 ALTER TABLE `sec_resources_160517203036` DISABLE KEYS */;
INSERT INTO `sec_resources_160517203036` VALUES (1,'exclude_portal_admin_session','session例外资源','session例外资源',1,'UNAUTH','exclude_portal_admin','admin',100),(2,'exclude_portal_admin_perm','鉴权例外资源','鉴权例外资源',1,'LOGIN_AUTH','exclude_portal_admin','admin',100),(3,'exclude_auth_admin_session','session例外资源','session例外资源',2,'UNAUTH','exclude_auth_admin','admin',100),(4,'exclude_auth_admin_perm','鉴权例外资源','鉴权例外资源',2,'LOGIN_AUTH','exclude_auth_admin','admin',100),(5,'auth_admin_sys_individual_modifyInfo','修改帐号信息','修改帐号信息',4,'AUTH','auth','admin',100),(6,'auth_admin_sys_individual_modifyPwd','修改个人密码','修改个人密码',4,'AUTH','auth','admin',100),(7,'auth_admin_sys_individual_selfconfig','个性化参数设置','个性化参数设置',4,'AUTH','auth','admin',100),(8,'auth_admin_sys_dept_deptManage','组织管理','组织管理',5,'AUTH','auth','admin',100),(9,'auth_admin_sys_staff_staffManage','成员管理','成员管理',6,'AUTH','auth','admin',100),(10,'auth_admin_sys_role_roleManage','角色管理','角色管理',7,'AUTH','auth','admin',100);
/*!40000 ALTER TABLE `sec_resources_160517203036` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resources_170411173755`
--

DROP TABLE IF EXISTS `sec_resources_170411173755`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resources_170411173755` (
  `RESOURCE_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源ID',
  `RESOURCE_KEY` varchar(100) NOT NULL COMMENT '资源外码',
  `RESOURCE_NAME` varchar(100) NOT NULL COMMENT '资源名称',
  `RESOURCE_DESC` varchar(100) DEFAULT NULL COMMENT '资源描述',
  `CATEGORY_ID` bigint(20) NOT NULL COMMENT '资源分类ID',
  `AUTH_TYPE` varchar(10) NOT NULL COMMENT '鉴权类型(AUTH：鉴权，UNAUTH：不鉴权，LOGIN_AUTH：登录鉴权)',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resources_170411173755`
--

LOCK TABLES `sec_resources_170411173755` WRITE;
/*!40000 ALTER TABLE `sec_resources_170411173755` DISABLE KEYS */;
INSERT INTO `sec_resources_170411173755` VALUES (1,'exclude_portal_admin_session','session例外资源','session例外资源',1,'UNAUTH','exclude_portal_admin','admin',100),(2,'exclude_portal_admin_perm','鉴权例外资源','鉴权例外资源',1,'LOGIN_AUTH','exclude_portal_admin','admin',100),(3,'exclude_auth_admin_session','session例外资源','session例外资源',2,'UNAUTH','exclude_auth_admin','admin',100),(4,'exclude_auth_admin_perm','鉴权例外资源','鉴权例外资源',2,'LOGIN_AUTH','exclude_auth_admin','admin',100),(5,'auth_admin_sys_individual_modifyInfo','修改帐号信息','修改帐号信息',4,'AUTH','auth','admin',100),(6,'auth_admin_sys_individual_modifyPwd','修改个人密码','修改个人密码',4,'AUTH','auth','admin',100),(7,'auth_admin_sys_individual_selfconfig','个性化参数设置','个性化参数设置',4,'AUTH','auth','admin',100),(8,'auth_admin_sys_dept_deptManage','组织管理','组织管理',5,'AUTH','auth','admin',100),(9,'auth_admin_sys_staff_staffManage','成员管理','成员管理',6,'AUTH','auth','admin',100),(10,'auth_admin_sys_role_roleManage','角色管理','角色管理',7,'AUTH','auth','admin',100),(11,'exclude_eump_admin_session','session例外资源','session例外资源',8,'UNAUTH','exclude_eump_admin','admin',100),(12,'exclude_admin_perm','鉴权例外资源','鉴权例外资源',8,'LOGIN_AUTH','exclude_eump_admin','admin',100),(13,'auth_activity_overview','活动概述','活动概述',10,'AUTH','fmp-portal','admin',100),(14,'auth_flow_order_info_list','流量发放记录','流量发放记录',10,'AUTH','fmp-portal','admin',100),(15,'auth_flow_recharge','流量充值','流量充值',10,'AUTH','fmp-portal','admin',100),(16,'auth_flow_batch_recharge','流量批量充值','流量批量充值',10,'AUTH','fmp-portal','admin',100),(17,'auth_flow_modifyPwd','修改密码','修改密码',10,'AUTH','fmp-portal','admin',100),(18,'auth_customer_bill','账单管理','账单管理',11,'AUTH','fmp-portal','admin',100),(19,'auth_customer_bill_query','账单查询','账单查询',11,'AUTH','fmp-portal','admin',100),(20,'auth_customer_settlement_order_manager','结算单管理','结算单管理',11,'AUTH','fmp-portal','admin',100),(21,'auth_customer_sms_tmpl','短信模板','短信模板',12,'AUTH','fmp-portal','admin',100),(22,'auth_flow_batch_card_recharge','卡券批量发送','卡券批量发送',12,'AUTH','fmp-portal','admin',100),(23,'auth_sms_record','短信记录查看','短信记录查看',12,'AUTH','fmp-portal','admin',100),(24,'auth_recharge_conf','充值页面配置','充值页面配置',13,'AUTH','fmp-portal','admin',100),(25,'auth_recharge_discount_act','优惠活动','优惠活动',13,'AUTH','fmp-portal','admin',100),(26,'auth_order_manager_list','订单列表','订单列表',14,'AUTH','fmp-portal','admin',100),(27,'auth_internet_of_things_card','物联网卡配置','物联网卡配置',15,'AUTH','fmp-portal','admin',100);
/*!40000 ALTER TABLE `sec_resources_170411173755` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_resources_170619184622`
--

DROP TABLE IF EXISTS `sec_resources_170619184622`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_resources_170619184622` (
  `RESOURCE_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源ID',
  `RESOURCE_KEY` varchar(100) NOT NULL COMMENT '资源外码',
  `RESOURCE_NAME` varchar(100) NOT NULL COMMENT '资源名称',
  `RESOURCE_DESC` varchar(100) DEFAULT NULL COMMENT '资源描述',
  `CATEGORY_ID` bigint(20) NOT NULL COMMENT '资源分类ID',
  `AUTH_TYPE` varchar(10) NOT NULL COMMENT '鉴权类型(AUTH：鉴权，UNAUTH：不鉴权，LOGIN_AUTH：登录鉴权)',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源的顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_resources_170619184622`
--

LOCK TABLES `sec_resources_170619184622` WRITE;
/*!40000 ALTER TABLE `sec_resources_170619184622` DISABLE KEYS */;
INSERT INTO `sec_resources_170619184622` VALUES (1,'exclude_portal_admin_session','session例外资源','session例外资源',1,'UNAUTH','exclude_portal_admin','admin',100),(2,'exclude_portal_admin_perm','鉴权例外资源','鉴权例外资源',1,'LOGIN_AUTH','exclude_portal_admin','admin',100),(3,'exclude_auth_admin_session','session例外资源','session例外资源',2,'UNAUTH','exclude_auth_admin','admin',100),(4,'exclude_auth_admin_perm','鉴权例外资源','鉴权例外资源',2,'LOGIN_AUTH','exclude_auth_admin','admin',100),(5,'auth_admin_sys_individual_modifyInfo','修改帐号信息','修改帐号信息',4,'AUTH','auth','admin',100),(6,'auth_admin_sys_individual_modifyPwd','修改个人密码','修改个人密码',4,'AUTH','auth','admin',100),(7,'auth_admin_sys_individual_selfconfig','个性化参数设置','个性化参数设置',4,'AUTH','auth','admin',100),(8,'auth_admin_sys_dept_deptManage','组织管理','组织管理',5,'AUTH','auth','admin',100),(9,'auth_admin_sys_staff_staffManage','成员管理','成员管理',6,'AUTH','auth','admin',100),(10,'auth_admin_sys_role_roleManage','角色管理','角色管理',7,'AUTH','auth','admin',100),(84,'exclude_eump_admin_session','session例外资源','session例外资源',40,'UNAUTH','exclude_eump_admin','admin',100),(85,'exclude_admin_perm','鉴权例外资源','鉴权例外资源',40,'LOGIN_AUTH','exclude_eump_admin','admin',100),(86,'auth_activity_overview','活动概述','活动概述',42,'AUTH','fmp-portal','admin',100),(87,'auth_flow_order_info_list','流量发放记录','流量发放记录',42,'AUTH','fmp-portal','admin',100),(88,'auth_flow_recharge','流量充值','流量充值',42,'AUTH','fmp-portal','admin',100),(89,'auth_internetthingscard_recharge','物联卡流量充值','物联卡流量充值',42,'AUTH','fmp-portal','admin',100),(90,'auth_flow_batch_recharge','流量批量充值','流量批量充值',42,'AUTH','fmp-portal','admin',100),(91,'auth_flow_modifyPwd','修改密码','修改密码',42,'AUTH','fmp-portal','admin',100),(92,'auth_customer_bill','账单管理','账单管理',43,'AUTH','fmp-portal','admin',100),(93,'auth_customer_bill_query','账单查询','账单查询',43,'AUTH','fmp-portal','admin',100),(94,'auth_customer_settlement_order_manager','结算单管理','结算单管理',43,'AUTH','fmp-portal','admin',100),(95,'auth_customer_account_settlement_manager','客户结算报表','客户结算报表',43,'AUTH','fmp-portal','admin',100),(96,'auth_customer_sms_tmpl','短信模板','短信模板',44,'AUTH','fmp-portal','admin',100),(97,'auth_flow_batch_card_recharge','卡券批量发送','卡券批量发送',44,'AUTH','fmp-portal','admin',100),(98,'auth_sms_record','短信记录查看','短信记录查看',44,'AUTH','fmp-portal','admin',100),(99,'auth_recharge_conf','充值页面配置','充值页面配置',45,'AUTH','fmp-portal','admin',100),(100,'auth_recharge_discount_act','优惠活动','优惠活动',45,'AUTH','fmp-portal','admin',100),(101,'auth_order_manager_list','订单列表','订单列表',46,'AUTH','fmp-portal','admin',100),(102,'auth_internet_of_things_card','物联网卡配置','物联网卡配置',47,'AUTH','fmp-portal','admin',100);
/*!40000 ALTER TABLE `sec_resources_170619184622` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_role`
--

DROP TABLE IF EXISTS `sec_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) NOT NULL COMMENT '角色名称',
  `ROLE_DESC` varchar(400) DEFAULT NULL COMMENT '角色描述',
  `CREATE_USER` varchar(20) NOT NULL COMMENT '角色创建者',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '角色创建时间',
  `CAN_MODIFY` int(11) NOT NULL DEFAULT '1' COMMENT '是否允许修改 1：允许 0: 不充许 缺省=1',
  `LAST_UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '角色最后修改时间',
  `ROLE_KEY` varchar(64) DEFAULT NULL COMMENT '角色外码',
  `AUTO_ASSIGN` int(1) NOT NULL DEFAULT '0' COMMENT '自动分配(0:不自动分配；1：自动分配给所有注册成员)',
  `visible` int(1) NOT NULL DEFAULT '1' COMMENT '是否在界面上可见(0：不可见；1：可见)',
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `ROLE_KEY` (`ROLE_KEY`),
  KEY `IDX_ROLE_NAME` (`ROLE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_role`
--

LOCK TABLES `sec_role` WRITE;
/*!40000 ALTER TABLE `sec_role` DISABLE KEYS */;
INSERT INTO `sec_role` VALUES (1,'系统管理角色','能够维护成员和组织信息、分配角色','dbscript','2016-05-17 11:42:26',1,'2016-05-16 16:00:00','1001',0,1),(2,'已注册成员拥有的角色','所有已注册成员都属于该角色','roleImporter','2016-05-17 11:42:26',0,'2016-05-16 16:00:00','101',1,0),(3,'组织管理角色','组织成员拥有该角色后，自动成为组织管理员，能够维护组织成员和子组织','roleImporter','2016-05-17 11:42:26',1,'2016-05-16 16:00:00','1002',0,1),(4,'系统配置角色','能够进行角色管理','roleImporter','2016-05-17 11:42:26',1,'2016-05-16 16:00:00','1003',0,1),(5,'运营管理员','','admin','2016-05-17 12:37:05',1,'2016-05-17 12:37:05','T001',0,1),(6,'客户管理','','admin','2016-05-17 12:37:28',1,'2016-05-17 12:37:28','P1001',0,1),(7,'客户特殊账单','客户特殊账单','admin','2017-01-18 06:24:52',1,'2017-01-18 06:24:52','Z001',0,1),(8,'客户管理特殊','客户管理特殊','admin','2017-01-20 07:09:22',1,'2017-01-20 07:09:22','P1002',0,1),(10,'H5','H5页面充值','admin','2017-06-20 09:08:05',1,'2017-06-20 09:08:05','H5',0,1);
/*!40000 ALTER TABLE `sec_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_role_resource_160517194215`
--

DROP TABLE IF EXISTS `sec_role_resource_160517194215`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_role_resource_160517194215` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `RESOURCE_ID` bigint(32) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作关键字'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_role_resource_160517194215`
--

LOCK TABLES `sec_role_resource_160517194215` WRITE;
/*!40000 ALTER TABLE `sec_role_resource_160517194215` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_role_resource_160517194215` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_role_resource_160517203036`
--

DROP TABLE IF EXISTS `sec_role_resource_160517203036`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_role_resource_160517203036` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `RESOURCE_ID` bigint(32) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作关键字'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_role_resource_160517203036`
--

LOCK TABLES `sec_role_resource_160517203036` WRITE;
/*!40000 ALTER TABLE `sec_role_resource_160517203036` DISABLE KEYS */;
INSERT INTO `sec_role_resource_160517203036` VALUES (2,6,'QUERY'),(1,8,'AUTH2STAFF'),(3,8,'AUTH2STAFF'),(1,8,'DELETE'),(3,8,'DELETE'),(1,8,'MODIFY'),(3,8,'MODIFY'),(1,8,'QUERY'),(3,8,'QUERY'),(1,8,'ROLE2DEPT'),(3,8,'ROLE2DEPT'),(1,8,'STAFF2DEPT'),(3,8,'STAFF2DEPT'),(1,9,'ADD'),(3,9,'ADD'),(1,9,'AUTHSTAFF'),(3,9,'AUTHSTAFF'),(1,9,'DELETE'),(3,9,'DELETE'),(1,9,'LOCKSTAFF'),(3,9,'LOCKSTAFF'),(1,9,'QUERY'),(3,9,'QUERY'),(1,9,'RESETPWD'),(3,9,'RESETPWD'),(1,9,'UPDATE'),(3,9,'UPDATE'),(1,10,'ADD'),(4,10,'ADD'),(1,10,'AUTHROLE'),(4,10,'AUTHROLE'),(1,10,'DELETE'),(4,10,'DELETE'),(1,10,'MODIFY'),(4,10,'MODIFY'),(1,10,'QUERY'),(4,10,'QUERY');
/*!40000 ALTER TABLE `sec_role_resource_160517203036` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_role_resource_170411173755`
--

DROP TABLE IF EXISTS `sec_role_resource_170411173755`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_role_resource_170411173755` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `RESOURCE_ID` bigint(32) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作关键字'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_role_resource_170411173755`
--

LOCK TABLES `sec_role_resource_170411173755` WRITE;
/*!40000 ALTER TABLE `sec_role_resource_170411173755` DISABLE KEYS */;
INSERT INTO `sec_role_resource_170411173755` VALUES (2,6,'QUERY'),(1,8,'AUTH2STAFF'),(3,8,'AUTH2STAFF'),(1,8,'DELETE'),(3,8,'DELETE'),(1,8,'MODIFY'),(3,8,'MODIFY'),(1,8,'QUERY'),(3,8,'QUERY'),(1,8,'ROLE2DEPT'),(3,8,'ROLE2DEPT'),(1,8,'STAFF2DEPT'),(3,8,'STAFF2DEPT'),(1,9,'ADD'),(3,9,'ADD'),(1,9,'AUTHSTAFF'),(3,9,'AUTHSTAFF'),(1,9,'DELETE'),(3,9,'DELETE'),(1,9,'LOCKSTAFF'),(3,9,'LOCKSTAFF'),(1,9,'QUERY'),(3,9,'QUERY'),(1,9,'RESETPWD'),(3,9,'RESETPWD'),(1,9,'UPDATE'),(3,9,'UPDATE'),(1,10,'ADD'),(4,10,'ADD'),(1,10,'AUTHROLE'),(4,10,'AUTHROLE'),(1,10,'DELETE'),(4,10,'DELETE'),(1,10,'MODIFY'),(4,10,'MODIFY'),(1,10,'QUERY'),(4,10,'QUERY'),(5,13,'query'),(6,13,'query'),(5,14,'export'),(6,14,'export'),(5,14,'query'),(6,14,'query'),(5,15,'recharge'),(6,15,'recharge'),(5,16,'allrecharge'),(6,16,'allrecharge'),(5,16,'baserecharge'),(6,16,'baserecharge'),(5,16,'delete'),(6,16,'delete'),(5,16,'detail'),(6,16,'detail'),(5,16,'export'),(6,16,'export'),(5,16,'query'),(6,16,'query'),(5,16,'redbagrecharge'),(6,16,'redbagrecharge'),(5,17,'modifyPwd'),(6,17,'modifyPwd'),(5,18,'accountDetail'),(6,18,'accountDetail'),(5,18,'detail'),(6,18,'detail'),(5,18,'query'),(6,18,'query'),(5,19,'export'),(6,19,'export'),(5,19,'query'),(6,19,'query'),(5,20,'changeStatus'),(6,20,'changeStatus'),(5,20,'downLoadSettlementOrder'),(6,20,'downLoadSettlementOrder'),(5,20,'query'),(6,20,'query'),(5,21,'add'),(5,21,'delete'),(5,21,'detail'),(5,21,'query'),(5,22,'add'),(5,22,'delete'),(5,22,'detail'),(5,22,'export'),(5,22,'query'),(5,23,'export'),(5,23,'query'),(5,24,'add'),(5,24,'delete'),(5,24,'detail'),(5,24,'query'),(5,25,'add'),(5,25,'delete'),(5,25,'detail'),(5,25,'query'),(5,26,'detail'),(6,26,'detail'),(5,26,'export'),(6,26,'export'),(5,26,'exportById'),(6,26,'exportById'),(5,26,'order_manager_query'),(6,26,'order_manager_query'),(5,27,'detail'),(5,27,'query');
/*!40000 ALTER TABLE `sec_role_resource_170411173755` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_role_resource_170619184622`
--

DROP TABLE IF EXISTS `sec_role_resource_170619184622`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_role_resource_170619184622` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `RESOURCE_ID` bigint(32) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作关键字'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_role_resource_170619184622`
--

LOCK TABLES `sec_role_resource_170619184622` WRITE;
/*!40000 ALTER TABLE `sec_role_resource_170619184622` DISABLE KEYS */;
INSERT INTO `sec_role_resource_170619184622` VALUES (2,6,'QUERY'),(1,8,'AUTH2STAFF'),(3,8,'AUTH2STAFF'),(1,8,'DELETE'),(3,8,'DELETE'),(1,8,'MODIFY'),(3,8,'MODIFY'),(1,8,'QUERY'),(3,8,'QUERY'),(1,8,'ROLE2DEPT'),(3,8,'ROLE2DEPT'),(1,8,'STAFF2DEPT'),(3,8,'STAFF2DEPT'),(1,9,'ADD'),(3,9,'ADD'),(1,9,'AUTHSTAFF'),(3,9,'AUTHSTAFF'),(1,9,'DELETE'),(3,9,'DELETE'),(1,9,'LOCKSTAFF'),(3,9,'LOCKSTAFF'),(1,9,'QUERY'),(3,9,'QUERY'),(1,9,'RESETPWD'),(3,9,'RESETPWD'),(1,9,'UPDATE'),(3,9,'UPDATE'),(1,10,'ADD'),(4,10,'ADD'),(1,10,'AUTHROLE'),(4,10,'AUTHROLE'),(1,10,'DELETE'),(4,10,'DELETE'),(1,10,'MODIFY'),(4,10,'MODIFY'),(1,10,'QUERY'),(4,10,'QUERY'),(5,86,'query'),(6,86,'query'),(5,87,'export'),(6,87,'export'),(5,87,'query'),(6,87,'query'),(6,87,'reCallBack'),(5,88,'recharge'),(6,88,'recharge'),(5,90,'allrecharge'),(6,90,'allrecharge'),(5,90,'baserecharge'),(6,90,'baserecharge'),(5,90,'delete'),(6,90,'delete'),(5,90,'detail'),(6,90,'detail'),(5,90,'export'),(6,90,'export'),(5,90,'query'),(6,90,'query'),(5,90,'redbagrecharge'),(6,90,'redbagrecharge'),(5,91,'modifyPwd'),(5,92,'accountDetail'),(6,92,'accountDetail'),(5,92,'detail'),(6,92,'detail'),(5,92,'query'),(6,92,'query'),(5,93,'export'),(6,93,'export'),(5,93,'query'),(6,93,'query'),(5,94,'changeStatus'),(6,94,'changeStatus'),(5,94,'downLoadSettlementOrder'),(6,94,'downLoadSettlementOrder'),(5,94,'query'),(6,94,'query'),(5,96,'add'),(5,96,'delete'),(5,96,'detail'),(5,96,'query'),(5,97,'add'),(5,97,'delete'),(5,97,'detail'),(5,97,'export'),(5,97,'query'),(5,98,'export'),(5,98,'query'),(5,99,'add'),(5,99,'delete'),(5,99,'detail'),(5,99,'query'),(5,100,'add'),(5,100,'delete'),(5,100,'detail'),(5,100,'query'),(5,101,'detail'),(6,101,'detail'),(5,101,'export'),(6,101,'export'),(5,101,'exportById'),(6,101,'exportById'),(5,101,'order_manager_query'),(6,101,'order_manager_query'),(5,102,'detail'),(5,102,'query');
/*!40000 ALTER TABLE `sec_role_resource_170619184622` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_role_resource_operation`
--

DROP TABLE IF EXISTS `sec_role_resource_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_role_resource_operation` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `RESOURCE_ID` bigint(32) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作关键字',
  PRIMARY KEY (`ROLE_ID`,`RESOURCE_ID`,`OPERATION_KEY`),
  KEY `FK_sec_role_resource_operation` (`RESOURCE_ID`,`OPERATION_KEY`),
  CONSTRAINT `FK_sec_role_resource_operation` FOREIGN KEY (`RESOURCE_ID`, `OPERATION_KEY`) REFERENCES `sec_operation` (`RESOURCE_ID`, `OPERATION_KEY`) ON DELETE CASCADE,
  CONSTRAINT `FK_sec_role_resource_operation_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `sec_role` (`ROLE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与资源操作';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_role_resource_operation`
--

LOCK TABLES `sec_role_resource_operation` WRITE;
/*!40000 ALTER TABLE `sec_role_resource_operation` DISABLE KEYS */;
INSERT INTO `sec_role_resource_operation` VALUES (10,5,'QUERY'),(2,6,'QUERY'),(10,6,'QUERY'),(10,7,'QUERY'),(1,8,'AUTH2STAFF'),(3,8,'AUTH2STAFF'),(1,8,'DELETE'),(3,8,'DELETE'),(1,8,'MODIFY'),(3,8,'MODIFY'),(1,8,'QUERY'),(3,8,'QUERY'),(1,8,'ROLE2DEPT'),(3,8,'ROLE2DEPT'),(1,8,'STAFF2DEPT'),(3,8,'STAFF2DEPT'),(1,9,'ADD'),(3,9,'ADD'),(1,9,'AUTHSTAFF'),(3,9,'AUTHSTAFF'),(1,9,'DELETE'),(3,9,'DELETE'),(1,9,'LOCKSTAFF'),(3,9,'LOCKSTAFF'),(1,9,'QUERY'),(3,9,'QUERY'),(1,9,'RESETPWD'),(3,9,'RESETPWD'),(1,9,'UPDATE'),(3,9,'UPDATE'),(1,10,'ADD'),(4,10,'ADD'),(1,10,'AUTHROLE'),(4,10,'AUTHROLE'),(1,10,'DELETE'),(4,10,'DELETE'),(1,10,'MODIFY'),(4,10,'MODIFY'),(1,10,'QUERY'),(4,10,'QUERY'),(5,105,'query'),(6,105,'query'),(8,105,'query'),(10,105,'query'),(5,106,'export'),(6,106,'export'),(8,106,'export'),(10,106,'export'),(5,106,'query'),(6,106,'query'),(8,106,'query'),(10,106,'query'),(6,106,'reCallBack'),(7,107,'recharge_url'),(10,107,'recharge_url'),(5,108,'recharge'),(6,108,'recharge'),(5,110,'allrecharge'),(6,110,'allrecharge'),(5,110,'baserecharge'),(6,110,'baserecharge'),(5,110,'delete'),(6,110,'delete'),(5,110,'detail'),(6,110,'detail'),(5,110,'export'),(6,110,'export'),(5,110,'query'),(6,110,'query'),(5,110,'redbagrecharge'),(6,110,'redbagrecharge'),(5,111,'modifyPwd'),(8,111,'modifyPwd'),(10,111,'modifyPwd'),(5,112,'accountDetail'),(6,112,'accountDetail'),(7,112,'accountDetail'),(8,112,'accountDetail'),(10,112,'accountDetail'),(5,112,'detail'),(6,112,'detail'),(7,112,'detail'),(8,112,'detail'),(10,112,'detail'),(5,112,'query'),(6,112,'query'),(7,112,'query'),(8,112,'query'),(10,112,'query'),(5,113,'export'),(6,113,'export'),(7,113,'export'),(8,113,'export'),(10,113,'export'),(5,113,'query'),(6,113,'query'),(7,113,'query'),(8,113,'query'),(10,113,'query'),(5,114,'changeStatus'),(6,114,'changeStatus'),(8,114,'changeStatus'),(10,114,'changeStatus'),(5,114,'downLoadSettlementOrder'),(6,114,'downLoadSettlementOrder'),(7,114,'downLoadSettlementOrder'),(8,114,'downLoadSettlementOrder'),(10,114,'downLoadSettlementOrder'),(5,114,'query'),(6,114,'query'),(7,114,'query'),(8,114,'query'),(10,114,'query'),(7,115,'export'),(8,115,'export'),(10,115,'export'),(7,115,'query'),(8,115,'query'),(10,115,'query'),(5,116,'add'),(5,116,'delete'),(5,116,'detail'),(5,116,'query'),(5,117,'add'),(5,117,'delete'),(5,117,'detail'),(5,117,'export'),(5,117,'query'),(5,118,'export'),(5,118,'query'),(5,119,'add'),(5,119,'delete'),(5,119,'detail'),(5,119,'query'),(5,120,'add'),(5,120,'delete'),(5,120,'detail'),(5,120,'query'),(5,121,'detail'),(6,121,'detail'),(8,121,'detail'),(5,121,'export'),(6,121,'export'),(8,121,'export'),(5,121,'exportById'),(6,121,'exportById'),(8,121,'exportById'),(5,121,'order_manager_query'),(6,121,'order_manager_query'),(8,121,'order_manager_query'),(5,122,'detail'),(5,122,'query');
/*!40000 ALTER TABLE `sec_role_resource_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_staff`
--

DROP TABLE IF EXISTS `sec_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_staff` (
  `STAFF_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成员ID',
  `LOGIN_NAME` varchar(100) NOT NULL COMMENT '登录名',
  `DEPARTMENT_ID` bigint(16) DEFAULT NULL COMMENT '组织ID',
  `REAL_NAME` varchar(100) NOT NULL COMMENT '成员姓名',
  `PASSWORD` varchar(128) NOT NULL COMMENT '密码（经过加密）',
  `STATUS` varchar(20) NOT NULL DEFAULT 'INITIAL' COMMENT '成员状态',
  `SEX` varchar(10) DEFAULT NULL COMMENT '性别：MALE-男性；FEMALE-女性；',
  `TELEPHONE` varchar(30) DEFAULT NULL COMMENT '电话',
  `MOBILE` varchar(16) NOT NULL COMMENT '手机号码',
  `EMAIL` varchar(64) DEFAULT NULL COMMENT '邮件地址',
  `CREATE_USER` varchar(16) NOT NULL COMMENT '成员创建者',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '成员创建时间',
  `EXPIRE_DATE` timestamp NULL DEFAULT NULL COMMENT '成员帐号过期时间',
  `LAST_UPDATE_DATE` timestamp NULL DEFAULT NULL COMMENT '成员最后修改时间',
  `PASSWORD_EXPIRE_DATE` timestamp NULL DEFAULT NULL COMMENT '密码失效时间',
  `LOCK_DATE` timestamp NULL DEFAULT NULL COMMENT '用户锁定时间',
  `CITY_ID` int(11) DEFAULT NULL COMMENT '成员所在城市（参见CITY表）',
  PRIMARY KEY (`STAFF_ID`),
  UNIQUE KEY `U_LOGIN_NAME` (`LOGIN_NAME`),
  KEY `idx_login_name` (`LOGIN_NAME`),
  KEY `FK_sec_staff` (`DEPARTMENT_ID`),
  CONSTRAINT `FK_sec_staff` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `sec_department` (`DEPARTMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8 COMMENT='成员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_staff`
--

LOCK TABLES `sec_staff` WRITE;
/*!40000 ALTER TABLE `sec_staff` DISABLE KEYS */;
INSERT INTO `sec_staff` VALUES (-999,'admin',NULL,'超级管理员','fke/2ZJ2l7c9xcer78ri+g==','NORMAL','MALE','','13688888888','','system','2016-05-17 12:43:52','2017-05-17 11:16:26','2016-05-17 12:43:52','2017-05-16 16:00:00',NULL,NULL),(1,'portal-admin',1,'jet','9i3XKk/pBkPDGT/pnQ5WmA==','INITIAL','MALE','','13682410360','xiawei@ucpaas.com','admin','2016-05-17 12:40:23',NULL,'2016-05-17 12:40:23',NULL,NULL,NULL),(2,'laozhuang',2,'老庄','ozypvqBb87tRAMfnbdPIkw==','DELETED','MALE',NULL,'13424307484','13424307481@163.com','gykj','2016-05-23 11:53:38',NULL,'2016-05-19 09:40:02',NULL,NULL,NULL),(3,'liuliang',2,'流量向前冲','cZgFejHz93fMrADUKDyRcw==','DELETED','MALE',NULL,'13424307481','123@1234.com','gykj','2016-05-23 11:54:35',NULL,'2016-05-19 09:57:20',NULL,NULL,NULL),(4,'yzx',2,'yzx','3qEfEkDiYkAd68tkivcs/g==','DELETED','MALE',NULL,'13760224627','guanxiangyong@ucpaas.com','yzx','2016-07-05 05:12:04',NULL,'2016-05-22 08:28:30',NULL,NULL,NULL),(5,'yzx1',2,'yzx1','8esvtdu8NyGQxq7J+mwSvw==','DELETED','MALE',NULL,'13760224627','yzx1@a.com','gxiangyong','2016-07-05 05:05:17',NULL,'2016-05-22 08:31:59',NULL,NULL,NULL),(8,'yzx12',2,'yzx','PfUHKWQ9U+HAjhR+bpeskw==','NORMAL','MALE',NULL,'13760224627','yzx1@a.com','gxiangyong','2016-07-05 05:13:27',NULL,'2016-05-30 11:44:28',NULL,NULL,NULL),(9,'test001_001',2,'test001_001','yWDNHmjiroT9BU6zgwtTEw==','DELETED','MALE',NULL,'13510869251','450681176@qq.com','450681176@qq.com','2016-06-27 06:51:51',NULL,'2016-05-23 11:58:56',NULL,NULL,NULL),(10,'New0001',2,'New0001','G/+fLA4z2Ggj+dkEKK//MQ==','DELETED','MALE',NULL,'18689219985','New0001@1.com','New0001','2016-06-28 09:05:10',NULL,'2016-05-24 06:18:11',NULL,NULL,NULL),(11,'Test001',2,'测试用户001','xBV9dgPS401IWoW/sM4R5A==','DELETED','MALE',NULL,'11111111111','11@qq.com','450681176@qq.com','2016-06-28 08:37:11',NULL,'2016-05-25 11:11:54',NULL,NULL,NULL),(12,'chenxj_test',2,'chenxj_test','yvykJSF4dWQsO+y/GaB0Kw==','INITIAL','MALE','','18600186000','chenxj_test@163.com','admin','2016-06-15 09:59:45',NULL,'2016-06-15 09:59:45',NULL,NULL,NULL),(13,'huang',2,'huang','W4Pg4uCvXth3mh0cTW5xiw==','DELETED','MALE',NULL,'13048844419','huangzhu@ucpaas.com','fmp-admin','2016-06-28 09:29:32',NULL,'2016-06-15 10:26:12',NULL,NULL,NULL),(14,'huang123',2,'huang123','0H04HbHFOVh7ntHixoVA3w==','DELETED','MALE',NULL,'13048844419','huang123@qq.com','fmp-admin','2016-06-28 09:29:24',NULL,'2016-06-18 05:09:40',NULL,NULL,NULL),(15,'huang456',2,'huang456','2J2DzgmcIM0Thpdj6KUhpw==','DELETED','MALE',NULL,'13048844419','huang456@qq.com','fmp-admin','2016-06-28 09:28:52',NULL,'2016-06-18 06:04:20',NULL,NULL,NULL),(16,'zhongcheng',2,'zhongcheng','iFOdaO+HapR1BvDqJFFORw==','DELETED','MALE',NULL,'13510869251','zhongcheng@ucpaas.com','450681176@qq.com','2016-06-29 07:17:49',NULL,'2016-06-21 03:37:51',NULL,NULL,NULL),(17,'gongminglan',2,'龚明兰','0SAu0mKpgmlVFX4upMezrw==','DELETED','MALE',NULL,'18689219985','gongminglan@ucpaas.com','Nancyy','2016-06-28 08:20:43',NULL,'2016-06-21 03:55:01',NULL,NULL,NULL),(18,'yzxtest',2,'yzxtest','3eQqsU3p24gAvgHh9XFKyQ==','DELETED','MALE',NULL,'11111111111','yzxtest@d.com','gxiangyong','2016-06-23 06:58:10',NULL,'2016-06-23 06:56:02',NULL,NULL,NULL),(20,'yzx19',2,'yzx19','J+Y7ey6pRaNJAGiqLxasQA==','DELETED','MALE',NULL,'13410458590','yzx1@163.com','fmp-admin','2016-06-30 12:08:42',NULL,'2016-06-23 07:16:47',NULL,NULL,NULL),(21,'chan',2,'chan','XHpMot0sw0v8TYzlsqLmlg==','NORMAL','MALE',NULL,'13800138000','138@qq.com','chenjing','2017-04-24 06:20:43',NULL,'2017-04-24 06:20:43',NULL,NULL,NULL),(22,'11',2,'11','KojPfpQf8zW4Ga7mGzUccA==','DELETED','MALE',NULL,'18103693273','11@qq.com','nizhi','2016-06-28 09:28:33',NULL,'2016-06-27 08:21:51',NULL,NULL,NULL),(23,'sddx',2,'山东鼎信','td30SSDNybr+xdJcofS64w==','NORMAL','MALE',NULL,'18561062725','gongl@ejiaofei.com','lixiaoqing','2016-06-30 06:30:59',NULL,'2017-02-15 07:42:55',NULL,NULL,NULL),(24,'quanguo',2,'shualiuliang','hHubVqgAXm4zs8hSOSeb7Q==','DELETED','MALE',NULL,'15882368679','lixinquan@51n.cc','nizhi','2016-06-30 06:22:52',NULL,'2016-06-27 10:08:09',NULL,NULL,NULL),(25,'meibei',2,'美贝','fXUUOA+2aX52fjN3k2Tv/A==','NORMAL','MALE',NULL,'13764695616','dorothy.wang@mbqianbao.com','chenjing','2016-06-30 06:29:50',NULL,'2017-02-15 07:44:43',NULL,NULL,NULL),(26,'shualiuliang',2,'耍流量','AaMo4NrAxkNbR9z7ijTrYQ==','INITIAL','MALE',NULL,'15882368679','lixinquan@51n.cc','nizhi','2016-06-30 06:35:50',NULL,'2016-11-04 08:48:25',NULL,NULL,NULL),(27,'fengwo',2,'蜂窝科技','OrG4HHGBhiQ+0bSZ4FPjBA==','NORMAL','MALE',NULL,'13811666170','2847718946@qq.com','chenjing','2016-06-30 06:21:30',NULL,'2017-07-04 11:34:48',NULL,NULL,NULL),(28,'leliu',2,'乐流','Jh17UZlAtgxckCs+wiDi/Q==','NORMAL','MALE',NULL,'13923428000','13923428000@139.com','nizhi','2016-06-30 05:29:37',NULL,'2017-05-03 02:58:30',NULL,NULL,NULL),(29,'武汉琳博',2,'武汉琳博','no3k6BNK9TeOh0AYrtp2WA==','NORMAL','MALE',NULL,'17786123177','177@ucpaas.com','lixiaoqing','2016-06-30 06:18:26',NULL,'2017-05-02 09:02:55',NULL,NULL,NULL),(30,'51leliu',2,'51乐流','r4mTsMoDfCaiuzhcT+DKkA==','NORMAL','MALE',NULL,'18620300620','11@qq.com','chenjing','2016-08-29 16:06:19',NULL,'2016-08-29 16:06:19',NULL,NULL,NULL),(31,'guanyou',2,'冠游科技','WZsSJP6rTYCBRwLEeM0WZA==','NORMAL','MALE',NULL,'15814456234','xiaoli@wingames.cn','chenjing','2017-06-22 06:14:12',NULL,'2017-06-22 06:14:12',NULL,NULL,NULL),(32,'dinhan',2,'广州鼎汉信息','dEYsNwUNhAANSbse9qjsvA==','NORMAL','MALE',NULL,'13352763737','lqw@9dinghan.com','nizhi','2016-06-30 06:55:07',NULL,'2017-01-05 04:23:13',NULL,NULL,NULL),(33,'dafang',2,'大方商务','Xgeaje7XdqU8564Aj02pLA==','NORMAL','MALE',NULL,'13652550881','123@123','nizhi','2016-07-04 09:51:00',NULL,'2016-07-04 09:51:00',NULL,NULL,NULL),(34,'jutongda',2,'北京聚通达科技','nO8kdxnJfmPqkjETQ+AmKw==','NORMAL','MALE',NULL,'13810810155','123@123','nizhi','2016-07-05 03:33:58',NULL,'2016-11-02 14:36:42',NULL,NULL,NULL),(35,'dfang',2,'大方','TW+wZy4dWPgX/G+SAQGcDg==','NORMAL','MALE',NULL,'13810810155','123@123','nizhi','2016-07-06 04:52:59',NULL,'2016-07-06 04:52:59',NULL,NULL,NULL),(36,'wangheng',2,'万恒科技有限公司','nXIxwW4fYWSJ62zHUoKepg==','NORMAL','MALE',NULL,'18682022602','pengbenwen@wanhengtech.com','nizhi','2017-05-12 08:05:14',NULL,'2017-05-12 08:05:14',NULL,NULL,NULL),(37,'yzxwx',2,'云之讯h5充值','BEwUpN6vcaNVjloCHvJf6w==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-07-05 08:20:46',NULL,'2017-07-05 02:09:15',NULL,NULL,NULL),(38,'qianxing',2,'千行你我科技','VNhzl0SGygqNKk97pJr+Bw==','NORMAL','MALE',NULL,'13989109920','leixs@100bm.cn','chenjing','2016-08-03 03:42:26',NULL,'2017-06-06 03:06:34',NULL,NULL,NULL),(39,'wieyu',2,'威宇智通科技','aJtapsbK0gKKxrvX/Xxueg==','NORMAL','MALE',NULL,'18938831159','linglong@szwisdom.cn','nizhi','2016-07-08 03:58:58',NULL,'2017-07-13 04:05:38',NULL,NULL,NULL),(40,'讯众通信',2,'讯众通信','5kaVdLT+KnTfU9LwnTPiVg==','NORMAL','MALE',NULL,'18813116328','zhouyl@commchina.net','lixiaoqing','2016-07-08 08:46:44',NULL,'2017-03-01 06:20:28',NULL,NULL,NULL),(41,'fengzhushou',2,'蜂助手','fMu+VBv0NJMnJhM9Pgku+A==','NORMAL','MALE',NULL,'13826435469','zhouqin@phone580.com','chenjing','2016-07-20 07:27:35',NULL,'2017-05-02 09:46:07',NULL,NULL,NULL),(42,'guanyoufs',2,'冠游科技分省','8odeLmXCtf7c9BVSqNCAFg==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-06-22 06:14:54',NULL,'2017-06-22 06:14:54',NULL,NULL,NULL),(43,'xiecheng',2,'上海携程国际','gACgItWbnL5L0k0EKgUHOA==','NORMAL','MALE',NULL,'13162121216','cxgao@ctrip.com','chenjing','2016-07-25 06:48:27',NULL,'2017-02-15 07:37:56',NULL,NULL,NULL),(44,'gezhi',2,'格致益正','Pe9J/k7wPW57urycSpo8Bw==','NORMAL','MALE',NULL,'15801139855','maocaifen@czdev.com','chenjing','2016-07-26 04:06:10',NULL,'2017-05-02 09:24:10',NULL,NULL,NULL),(45,'xiaomi',2,'小米科技','gw593YgRxjlNGLmUP2mMzw==','NORMAL','MALE',NULL,'18410115733','xiaomi@phone580.com','lixiaoqing','2016-07-26 04:15:55',NULL,'2017-02-15 07:18:06',NULL,NULL,NULL),(46,'jiebao',2,'桔宝科技有限公司','aEI7EKmqjM4ivF6GADt2dA==','NORMAL','MALE',NULL,'18820954566','345139608@qq.com','nizhi','2016-08-24 04:19:29',NULL,'2016-08-24 04:19:29',NULL,NULL,NULL),(47,'qqmusic',2,'QQMusic','dDhEBwOH+67g56jSAevkQA==','NORMAL','MALE',NULL,'18576737791','olivianchen@tencent.com','chenjing','2016-07-27 09:23:50',NULL,'2016-07-27 09:23:50',NULL,NULL,NULL),(48,'杭州向上',2,'杭州向上','it23ii4VhCAaRskP0HV4bg==','NORMAL','MALE',NULL,'18779118737','lqb@365xs.cn','nizhi','2016-08-01 02:11:37',NULL,'2017-02-15 08:17:22',NULL,NULL,NULL),(49,'xicheng',2,'上海西城','MTg0LMS2BCoElxp813dF8w==','NORMAL','MALE',NULL,'18620300620','123@123','nizhi','2016-08-05 07:02:19',NULL,'2017-07-18 07:26:38',NULL,NULL,NULL),(50,'dahan',2,'上海大汉','4BlRwMnAVSPA4v9SASdqFg==','NORMAL','MALE',NULL,'18620300620','123@123','nizhi','2016-08-07 04:02:55',NULL,'2017-05-02 09:11:17',NULL,NULL,NULL),(51,'shangtong',2,'广东尚通','5JwkGhwyGBLAnOEzGNp6tw==','NORMAL','MALE',NULL,'13510554379','123@123','nizhi','2016-08-08 02:12:55',NULL,'2017-02-15 08:27:19',NULL,NULL,NULL),(52,'dingyi',2,'鼎益','htNMaMVspvE4hxNdRqoW5A==','NORMAL','MALE',NULL,'18902266599','123@123','nizhi','2016-09-27 09:39:56',NULL,'2016-09-27 09:39:56',NULL,NULL,NULL),(53,'yichongbaoqg',2,'易充宝','/cb1dAeNHhrNCDQfZRJs6w==','NORMAL','MALE',NULL,'12312312312','3568635095@qq.com','nizhi','2016-08-29 14:30:45',NULL,'2017-08-01 01:41:27',NULL,NULL,NULL),(54,'yichongbaofs',2,'易充宝分省','kAjg0K8MXoZgtNLLUM2SyA==','NORMAL','MALE',NULL,'18651770155','yanhao@yichongbao.net','nizhi','2016-08-29 14:32:50',NULL,'2017-02-15 06:48:33',NULL,NULL,NULL),(55,'迈异全网',2,'迈异全网','G9gbFtzb2VPC5KqikbwsFg==','NORMAL','MALE',NULL,'18620300620','18620300620@QQ.com','lixiaoqing','2017-03-24 06:57:01',NULL,'2017-05-02 09:37:19',NULL,NULL,NULL),(56,'haoling',2,'号令天下','22OgQtjSVCc+bgCJ/1wPLQ==','NORMAL','MALE',NULL,'18320920245','zhouxiang@400sky.com.cn','nizhi','2016-08-15 03:02:41',NULL,'2016-08-15 03:02:41',NULL,NULL,NULL),(57,'sllqw',2,'耍流量全网','m8QWVxjyI3NP44f0WG9ODw==','NORMAL','MALE',NULL,'15882368679','123@123','nizhi','2016-08-16 02:59:52',NULL,'2016-10-14 06:12:36',NULL,NULL,NULL),(58,'yiyun',2,'易云网络科技','3tv6IbPxdCM3GzPnokfMwQ==','INITIAL','MALE',NULL,'18616765831','tanfh@pro-group.cn','nizhi','2016-12-19 10:17:28',NULL,'2017-02-16 03:48:20',NULL,NULL,NULL),(59,'santi',2,'杭州三体','YFhgJfU3IJGZXdPHGOeqJA==','NORMAL','MALE',NULL,'13082830803','zhouting@trioly.com','nizhi','2016-08-22 04:05:52',NULL,'2017-07-17 02:44:55',NULL,NULL,NULL),(60,'shangtong1',2,'广东尚通','mdbxSPlOvPb3m/5tGZaYqg==','NORMAL','MALE',NULL,'13510554379','123@123','lixiaoqing','2016-08-23 01:51:12',NULL,'2016-08-23 01:54:44',NULL,NULL,NULL),(65,'shangtong2',2,'广东尚通1','WM2LT0m34szbHYm6q407OQ==','NORMAL','MALE',NULL,'13510554379','123@123','lixiaoqing','2016-08-23 02:00:59',NULL,'2017-02-15 08:26:49',NULL,NULL,NULL),(66,'xunzhong1',2,'讯众通信1','BRZvsr+/o6km0JdejyAcEw==','NORMAL','MALE',NULL,'18813116328','zhouyl@commchina.net','lixiaoqing','2016-08-23 02:53:14',NULL,'2017-02-15 07:14:23',NULL,NULL,NULL),(67,'mile',2,'北京米勒科技','MNosAlO/KNDoiXXPFXIrCw==','NORMAL','MALE',NULL,'13810323523','yanjie@mocf.org.cn','nizhi','2017-03-17 10:49:16',NULL,'2017-07-17 02:46:22',NULL,NULL,NULL),(68,'yulan',2,'钰蓝科技','MlKwo8TA5YvM0cqxHWwmpA==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-08-23 09:49:11',NULL,'2017-02-14 09:04:31',NULL,NULL,NULL),(69,'fenghuo',2,'烽火万家','W3VOdC21BtZARhzi82kWzQ==','NORMAL','MALE',NULL,'13810996625','yoult@ifeng.com','lixiaoqing','2016-09-29 02:37:13',NULL,'2017-04-10 02:52:32',NULL,NULL,NULL),(70,'wangchi',2,'网池科技','rDLGM0iD7+v6cdgwolD/ow==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-08-24 04:05:10',NULL,'2017-02-15 07:24:24',NULL,NULL,NULL),(71,'maiyi',2,'迈异','qryah6W2PKNQTUo0y6KuVw==','NORMAL','MALE',NULL,'18620300620','18620300620@qq.com','lixiaoqing','2017-03-24 06:55:56',NULL,'2017-05-02 09:37:00',NULL,NULL,NULL),(72,'xinzhiyuan',2,'信之源','QPa4tNehJqobpkeA1nEkvA==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-08-25 06:05:33',NULL,'2017-02-15 07:16:13',NULL,NULL,NULL),(73,'youmi',2,'山东优米','hX66pFOD7SffR1QWqlh+Xg==','NORMAL','MALE',NULL,'18668900888','liuweiping@umichina.cc','nizhi','2016-08-25 07:55:57',NULL,'2017-02-15 07:42:23',NULL,NULL,NULL),(74,'wangyin',2,'网音','SPrpyxSROXkrGtsrBEWy9w==','NORMAL','MALE',NULL,'17771881559','lijl@nv86.cn','lixiaoqing','2016-08-25 10:16:12',NULL,'2017-02-15 07:21:49',NULL,NULL,NULL),(75,'yuecuihang',2,'粤萃行','svh0CB1xyoQ5ob/7136p6A==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-12-04 08:21:28',NULL,'2017-02-14 09:00:12',NULL,NULL,NULL),(76,'liouchang',2,'流畅科技','8STk1sRWkApgy9hwpPWxUA==','NORMAL','MALE',NULL,'18675518168','123@123','nizhi','2016-08-29 04:14:17',NULL,'2017-06-06 02:04:16',NULL,NULL,NULL),(77,'renren',2,'人人','qV8ZuWFz6+hxeQw9ZJHAcg==','NORMAL','MALE',NULL,'13652862518','406572504@qq.com','lixiaoqing','2016-09-19 03:39:54',NULL,'2016-09-19 03:39:54',NULL,NULL,NULL),(78,'maiyifs',2,'迈异分省','CvcBDD8k/6G+mvsDz6oGEA==','NORMAL','MALE',NULL,'18620300620','18620300620@qq.com','nizhi','2017-03-24 06:56:34',NULL,'2017-05-02 09:36:37',NULL,NULL,NULL),(79,'hengha',2,'苏州哼哈','+jjG3sVCW+LXHQB2NSlTSA==','NORMAL','MALE',NULL,'13013678573','Kh.cheng@suishenwan.cn','lixiaoqing','2016-08-30 02:12:56',NULL,'2017-02-15 07:35:13',NULL,NULL,NULL),(80,'xuanniao',2,'玄鸟','KBZR+FFfteU3oFYfBQrRmA==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-02-07 12:48:09',NULL,'2017-02-15 07:15:01',NULL,NULL,NULL),(81,'chuanglan',2,'创蓝','gfmpsSTbdM8+zsMhDLkLXA==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-09-01 07:18:16',NULL,'2017-06-06 02:12:30',NULL,NULL,NULL),(82,'fengwofs',2,'蜂窝-分省','7YzgrZsfPtDfre3pox0t5A==','NORMAL','MALE',NULL,'13811666170','2847718946@qq.com','lixiaoqing','2016-09-02 01:48:05',NULL,'2017-07-04 11:34:32',NULL,NULL,NULL),(83,'runpu',2,'河北润谱','/37Mfxa8HlMgE16Q1si9nw==','INITIAL','MALE',NULL,'13833115133','921966725@qq.com','nizhi','2017-02-07 06:17:40',NULL,'2017-02-15 08:16:28',NULL,NULL,NULL),(84,'mixin',2,'南京米鑫','b9bz+bxJXsrr6wshofKT5Q==','NORMAL','MALE',NULL,'18118576673','2147883575@qq.com','nizhi','2017-05-02 06:28:56',NULL,'2017-05-02 06:28:56',NULL,NULL,NULL),(85,'lemian',2,'乐免','0n7OtZ6zTcqOJREp7BCJOQ==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-05 09:34:20',NULL,'2017-05-02 09:39:09',NULL,NULL,NULL),(86,'ruiyi',2,'苏州瑞翼','l7LHHddAxZar6MLCaUeP8g==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-09-06 03:27:44',NULL,'2017-02-15 07:31:11',NULL,NULL,NULL),(87,'lemianfs',2,'乐免-分省','qC+q3PUeoV/8GcKi1VmJeQ==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-06 06:45:07',NULL,'2017-05-02 09:38:50',NULL,NULL,NULL),(88,'yisai',2,'易赛','hsu+lEgcYRZ/gzVqHCx4TA==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-06 07:51:52',NULL,'2017-06-06 01:51:21',NULL,NULL,NULL),(89,'yihua',2,'盈华讯方','ljkYygUi+UtBrEPqANgLZg==','NORMAL','MALE',NULL,'13802882644','vsofozhanghl@126.com','chenjing','2016-09-06 08:20:02',NULL,'2017-07-17 02:46:39',NULL,NULL,NULL),(90,'leliufs',2,'乐流分省','JxXedRhO+KQl66LlBfOhGA==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-09-06 10:35:30',NULL,'2017-05-03 02:58:16',NULL,NULL,NULL),(91,'xuanniaofs',2,'玄鸟-分省','WXaAkFhjcCDn+5Z23cY21g==','NORMAL','MALE',NULL,'13800138000','11@qq.com','lixiaoqing','2017-02-07 12:45:11',NULL,'2017-02-07 12:45:11',NULL,NULL,NULL),(92,'yiren',2,'亿人在线','y/O7e6mFPbe8pnjWMQPH3Q==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-07 03:27:54',NULL,'2017-05-02 09:01:13',NULL,NULL,NULL),(93,'wangyu',2,'网宇','lav4ZXtIREZXSUi6nBtsaQ==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-07 04:13:19',NULL,'2017-06-06 01:54:39',NULL,NULL,NULL),(94,'chunzhen',2,'纯真','vJeQYdxTRQMlz6pHjj8Bbw==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-07 08:54:29',NULL,'2017-05-02 08:06:57',NULL,NULL,NULL),(95,'bkhtqg',2,'碧空','dzj8hLuBZVmqfzr2cUT9FQ==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-08 01:51:12',NULL,'2017-05-02 08:07:36',NULL,NULL,NULL),(96,'bkhtfs',2,'碧空','AcTT2+i/qDfcL7uafQVGzQ==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-08 02:01:43',NULL,'2016-09-08 02:11:24',NULL,NULL,NULL),(98,'huayi',2,'安徽华义','pIKMJTYSpb++PzL4AszkBA==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-08 03:17:21',NULL,'2017-02-15 08:40:16',NULL,NULL,NULL),(99,'xingkong',2,'星空','F4a2GKDpLYqK+17eaGynkA==','NORMAL','MALE',NULL,'18610148215','yubo@starnet.com.cn','lixiaoqing','2016-09-08 06:07:01',NULL,'2017-02-15 07:15:50',NULL,NULL,NULL),(100,'santifs',2,'杭州三体科技-分省','nzNn52ZW7UwlxBA983zmgA==','NORMAL','MALE',NULL,'13082830803','zhouting@trioly.com','nizhi','2016-09-08 06:54:34',NULL,'2017-07-17 02:44:46',NULL,NULL,NULL),(101,'lecheng',2,'乐橙云','nyqyjwh8vN6S27rEXEj6MA==','NORMAL','MALE',NULL,'13554526633','1464621433@qq.com','lixiaoqing','2016-12-22 07:47:44',NULL,'2017-05-02 09:39:48',NULL,NULL,NULL),(102,'xuanxiang',2,'玄翱网络','o6WJGcT1Nf+jLEEv/FQsXw==','NORMAL','MALE',NULL,'18336699499','3244801@qq.com','nizhi','2016-09-09 06:27:50',NULL,'2017-02-15 07:15:25',NULL,NULL,NULL),(103,'yibaite',2,'亿百特','G+vJuVxCbknt6ivipE8KWA==','NORMAL','MALE',NULL,'18600601870','yuwenyang@army41.com','chenjing','2016-09-11 03:04:22',NULL,'2017-05-02 09:01:45',NULL,NULL,NULL),(104,'ruiyifs',2,'苏州瑞翼-分省','z3L1xulPc7YS7b/e0jqupw==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-12 06:42:01',NULL,'2017-02-15 07:30:38',NULL,NULL,NULL),(105,'wangchiqg',2,'网池-全国','1g4GmxVxgtzr2LxYrnRbPw==','NORMAL','MALE',NULL,'12312312312','123@qq.vom','lixiaoqing','2016-09-13 03:09:56',NULL,'2017-06-14 01:58:15',NULL,NULL,NULL),(106,'quansu',2,'东莞全速','VSfhAUtuzN1uNuAW8QH7wQ==','NORMAL','MALE',NULL,'13929445332','595802003@qq.com','nizhi','2016-09-13 07:40:04',NULL,'2017-02-15 08:34:37',NULL,NULL,NULL),(107,'xiangshangqg',2,'向上-全国','nD4jncdiyat2k3rD0NYfYA==','NORMAL','MALE',NULL,'18779118737','lqb@365xs.cn','lixiaoqing','2016-09-15 08:04:31',NULL,'2017-02-15 08:17:47',NULL,NULL,NULL),(108,'judian',2,'聚点互动','AKHu70lAauZC1F28DtLmBg==','NORMAL','MALE',NULL,'18665887708','hongyang@idatafocus.cn','lixiaoqing','2016-09-15 09:33:38',NULL,'2017-06-06 02:07:28',NULL,NULL,NULL),(109,'meibeiqg',2,'美贝-全国','NYyX/qTXYrK202Aa8v6h2w==','NORMAL','MALE',NULL,'13764695616','dorothy.wang@mbqianbao.com','lixiaoqing','2016-09-18 02:07:57',NULL,'2017-02-15 07:44:21',NULL,NULL,NULL),(110,'mantianfei',2,'满天飞','L0d1ars322S+pU9kNr3Ypg==','INITIAL','MALE',NULL,'15989879611','360066455@qq.com','nizhi','2017-04-22 04:21:36',NULL,'2017-05-02 09:36:11',NULL,NULL,NULL),(111,'qianxingqg',2,'千行你我科技-全国','mRo7U6q+kJiKOVrHNv3ZFA==','NORMAL','MALE',NULL,'13989109920','leixs@100bm.cn','nizhi','2016-09-19 02:32:56',NULL,'2017-06-06 03:06:18',NULL,NULL,NULL),(112,'dahanfs',2,'大汉-分省','N2n1YQjNG+l+a+ylWjoKIg==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-09-19 03:21:39',NULL,'2016-09-19 03:21:39',NULL,NULL,NULL),(113,'dahanqw',2,'上海大汉-全网','xnMo1Nnr0kszdByVMrLC3w==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-09-19 03:41:18',NULL,'2017-05-02 09:11:02',NULL,NULL,NULL),(114,'judianfs',2,'聚点互动-分省','XogbQ9WpLlaNqn67s10F9g==','NORMAL','MALE',NULL,'18665887708','hongyang@idatafocus.cn','nizhi','2016-09-19 04:05:31',NULL,'2017-06-06 02:07:03',NULL,NULL,NULL),(115,'weike',2,'广州维客','5tunDvPJRQNckWFG9b4GlA==','NORMAL','MALE',NULL,'18928818548','liuxiufang@un106.com','nizhi','2016-09-22 03:50:10',NULL,'2017-06-06 02:10:41',NULL,NULL,NULL),(116,'chuanglanfs',2,'创蓝-分省','T61bskEr5uw5x7Dky5ahUQ==','NORMAL','MALE',NULL,'18600601870','11@qq.com','chenjing','2016-09-22 11:51:39',NULL,'2017-06-06 02:12:05',NULL,NULL,NULL),(117,'bkfs',2,'碧空-分省','wplz8vg88tntWXNCYiuBsw==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-23 03:27:19',NULL,'2017-04-10 02:53:27',NULL,NULL,NULL),(118,'quansufs',2,'东莞全速-分省','KauF/Z1nGx/rp6FfQS18NQ==','NORMAL','MALE',NULL,'18620300620','123@123','nizhi','2016-09-23 07:28:38',NULL,'2017-02-15 08:34:19',NULL,NULL,NULL),(119,'chenhe',2,'北京诚合时代','vaDV7jYpGbcYzzH/r4v8+g==','NORMAL','MALE',NULL,'13910410878','wangxin@chenghetimes.com','nizhi','2016-09-26 06:37:08',NULL,'2017-06-06 02:13:20',NULL,NULL,NULL),(120,'minxinqw',2,'米鑫分省','nDkNYc3om+wWcNpF94He2Q==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-05-02 06:29:46',NULL,'2017-05-02 06:29:46',NULL,NULL,NULL),(121,'zhongshenyuan',2,'中琛源科技','t3HETzOxLdW5Q39sU7Crtg==','NORMAL','MALE',NULL,'18826483070','chenhy@ibumobile.com','nizhi','2016-09-27 02:36:30',NULL,'2017-04-06 02:23:25',NULL,NULL,NULL),(122,'feihan',2,'南京飞翰','ZaajOXVZO8erhCinsY4jXw==','NORMAL','MALE',NULL,'15950585730','sup@ofpay.com','nizhi','2016-09-27 06:53:19',NULL,'2017-07-17 02:44:31',NULL,NULL,NULL),(123,'wangyuqg',2,'网宇-全国','jWM+2dK1sEripyKBaX2b9g==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-09-27 07:54:21',NULL,'2017-06-06 01:54:07',NULL,NULL,NULL),(124,'szdh',2,'深圳大汉','/96ouFVYr7hl7iwOmun88g==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-09-27 10:05:24',NULL,'2017-06-06 01:55:27',NULL,NULL,NULL),(125,'xiaoermei',2,'株洲小而美','dUp700hnOUVJb+wMYTD53Q==','INITIAL','MALE',NULL,'15197257175','1016839823@qq.com','nizhi','2017-02-17 10:55:27',NULL,'2017-02-17 10:55:27',NULL,NULL,NULL),(126,'yuecuihangqg',2,'粤萃行-全国','90LMKUJanhGpmneGcaqqZg==','NORMAL','MALE',NULL,'13800138000','11@qq.com','nizhi','2016-09-28 09:14:58',NULL,'2017-02-14 08:59:50',NULL,NULL,NULL),(127,'wangyinfs',2,'网音-分省','7AVfq2EO+qd+fNd+2clXBA==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-09-29 08:14:08',NULL,'2017-02-15 07:21:20',NULL,NULL,NULL),(128,'jindaoqg',2,'金道-全国','8CaRDstg/vqkRdZrhGZO2g==','NORMAL','MALE',NULL,'15237112625','Jenny.zhang@gwghk.com','lixiaoqing','2016-09-30 08:27:43',NULL,'2017-02-15 08:02:24',NULL,NULL,NULL),(129,'aihai',2,'爱海企业','sYUI7h+SrLt5kFDhvrod5A==','NORMAL','MALE',NULL,'13162619372','Joyce@xingren.com','nizhi','2016-10-08 06:38:57',NULL,'2017-05-02 10:00:02',NULL,NULL,NULL),(130,'weiqu',2,'微趣网络','Owt2rBMSP+V10RWRnRANlQ==','NORMAL','MALE',NULL,'13397418687','18687874@qq.com','nizhi','2016-10-08 07:14:51',NULL,'2017-02-15 07:19:42',NULL,NULL,NULL),(131,'dadangjia',2,'大当家','Kgh5Bxulj5Mq/DEKASnQ4Q==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-10-08 09:41:03',NULL,'2017-04-10 02:53:05',NULL,NULL,NULL),(132,'guoxin',2,'深圳国信','TRk3VGQ4F/+xMc7hxqDvgA==','NORMAL','MALE',NULL,'18680229346','zhongm@guoxinet.com','lixiaoqing','2016-10-12 06:18:30',NULL,'2017-07-10 02:32:20',NULL,NULL,NULL),(133,'haoyang',2,'昊阳科技','q9TtcWCx4HsU+dpr4Z4qwQ==','NORMAL','MALE',NULL,'18571661908','guojun@vstime.cn','nizhi','2016-10-14 07:36:07',NULL,'2017-07-20 08:39:15',NULL,NULL,NULL),(134,'haoyangfs',2,'昊阳科技-分省','mr9r+qvaTxRcYpgVQ0htLg==','NORMAL','MALE',NULL,'18571661908','guojun@vstime.cn','nizhi','2016-10-14 07:54:08',NULL,'2017-07-20 08:39:33',NULL,NULL,NULL),(135,'hengtong',2,'亚泰亨通','e9HoRSpD6NL5RJgJypf6YQ==','NORMAL','MALE',NULL,'18696443501','383314260@qq.com','nizhi','2016-10-19 06:15:48',NULL,'2017-05-02 09:02:32',NULL,NULL,NULL),(136,'xinyichen',2,'欣易辰','f0tN3iSRBbjGbsxellQdGg==','NORMAL','MALE',NULL,'13530866733','wangzhe@smsway.com.cn','nizhi','2016-10-24 06:53:49',NULL,'2017-02-15 07:17:41',NULL,NULL,NULL),(137,'wangxin',2,'网信','gvTLBgqbWJMsQ4KsS8Abjg==','NORMAL','MALE',NULL,'13606421858','3246238053@qq.com','nizhi','2016-10-25 09:19:07',NULL,'2017-05-02 09:04:10',NULL,NULL,NULL),(138,'tenchao',2,'浙江腾朝','38nNBWbcvX9LvsL+0DPgJw==','NORMAL','MALE',NULL,'13732273296','chenxupei@tenzhao.com','nizhi','2016-10-26 07:42:47',NULL,'2017-02-14 08:51:24',NULL,NULL,NULL),(139,'sanzudingqg',2,'三足鼎科技-全国','KV0i+YMdyCM4l8aCV6sY/g==','NORMAL','MALE',NULL,'15915459566','123@123','nizhi','2016-11-01 09:30:27',NULL,'2017-02-15 07:43:15',NULL,NULL,NULL),(140,'sanzudingfs',2,'三足鼎科技-分省','NxmMeyW0esauY4hM7/wr5w==','NORMAL','MALE',NULL,'15915459566','123@123','nizhi','2016-10-31 09:17:31',NULL,'2017-02-15 07:43:39',NULL,NULL,NULL),(141,'mantianfeifs',2,'满天飞-分省','UpoG3GYaGEjdbkQT/CY5+w==','INITIAL','MALE',NULL,'12312312312','123@123','nizhi','2017-04-22 04:20:22',NULL,'2017-05-02 09:35:53',NULL,NULL,NULL),(142,'tangtang',2,'堂堂','OTzEhifg/GI8l1ovQy8rZg==','NORMAL','MALE',NULL,'18600601870','123@123','chenjing','2016-11-05 06:54:45',NULL,'2017-02-15 07:25:06',NULL,NULL,NULL),(143,'sll',2,'耍流量活动账号','Z1g5zCMV7Bpiqpw5vtz2gw==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-11-10 03:26:45',NULL,'2017-02-15 08:42:14',NULL,NULL,NULL),(144,'fenghuofs',2,'烽火万家-分省','+CzMkSC1xH2PNbBcQh07jQ==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-11-10 04:23:53',NULL,'2017-04-06 02:22:18',NULL,NULL,NULL),(145,'yunchuang',2,'云创得力','ULfbIuY/tUmHUS8fup9MIw==','NORMAL','MALE',NULL,'18566658264','18566658264@qq.com','lixiaoqing','2016-11-10 07:25:35',NULL,'2017-05-02 08:57:48',NULL,NULL,NULL),(146,'liudurenhe',2,'六度人和','Qz/QYI0uWJq9Y+CYWaQbFQ==','NORMAL','MALE',NULL,'18682097900','lmf@workec.com','liqian','2016-11-11 08:53:58',NULL,'2016-11-11 09:13:00',NULL,NULL,NULL),(147,'liudu',2,'六度','SNG/+Sq9HbHzDAU1CK3xAQ==','NORMAL','MALE',NULL,'18682097900','lmf@workec.com','chenjing','2016-11-11 09:17:05',NULL,'2017-02-15 07:53:33',NULL,NULL,NULL),(148,'huaxin',2,'众诚华鑫科技','WVsqspoioI8uZIwuAkOGQQ==','NORMAL','MALE',NULL,'13871145821','865060802@qq.com','nizhi','2016-11-12 07:22:54',NULL,'2017-02-14 08:45:29',NULL,NULL,NULL),(149,'fengzhushoufs',2,'蜂助手分省','jFol1kwQnmwZRaQyJd2LHw==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2016-11-14 04:04:46',NULL,'2017-05-02 09:45:43',NULL,NULL,NULL),(150,'fenghuoqg',2,'烽火万家-全国','K5KW74X+xeqQLCpYI5hP4w==','NORMAL','MALE',NULL,'13810996625','yoult@ifeng.com','liqian','2016-12-03 02:59:16',NULL,'2017-04-06 02:21:52',NULL,NULL,NULL),(151,'chuzhongqg',2,'出众-全国','Rh6b4XFc3CfTE25l7LAH7Q==','NORMAL','MALE',NULL,'15016707977','wuyang@szchuzhong.com','lixiaoqing','2016-11-17 04:03:14',NULL,'2017-02-15 08:38:29',NULL,NULL,NULL),(152,'guanyouhd',2,'冠游活动账号','1qx9p5CWf6feb5JTO7q84g==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2017-06-22 06:15:54',NULL,'2017-06-22 06:15:54',NULL,NULL,NULL),(153,'szdhd',2,'三足鼎活动账号','x30TcOzy2O8LIiiUs1L1EQ==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-11-17 07:55:26',NULL,'2017-02-15 07:44:00',NULL,NULL,NULL),(154,'ronhui',2,'融汇众通','H+2xHKIf4KkUNBjOk+p8KQ==','NORMAL','MALE',NULL,'13611121906','2057467@qq.com','nizhi','2016-11-19 04:05:42',NULL,'2017-02-15 07:45:09',NULL,NULL,NULL),(155,'yzxptdy',2,'云之讯平台调用','d0KKX3j/za2IATF3DZNqfg==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2016-11-22 03:35:18',NULL,'2016-11-22 03:35:18',NULL,NULL,NULL),(156,'zhipu',2,'智朴','D3PIxJRwtYLteyFvnn1Pwg==','NORMAL','MALE',NULL,'18620300230','123@123.com','kangqiong','2016-11-23 07:06:40',NULL,'2017-05-02 08:57:25',NULL,NULL,NULL),(157,'meiduan',2,'美端','GFDFAGgInBZBroPvTbreRA==','NORMAL','MALE',NULL,'18565750496','chaochundan@liuliangbaozi.com','kangqiong','2016-11-24 12:59:39',NULL,'2017-02-15 07:51:10',NULL,NULL,NULL),(158,'caiqi',2,'广州彩旗','ZF6IgVd3lpJbuOp6Zm7pLg==','NORMAL','MALE',NULL,'15399949666','liuting@0101buy.cn','nizhi','2017-03-22 02:38:04',NULL,'2017-07-17 02:45:20',NULL,NULL,NULL),(159,'xinpeng',2,'鑫鹏-全国','4jTOGXZMn9yDYvE2C0bC1A==','NORMAL','MALE',NULL,'15373320029','xinpengjiachuang@163.com','liqian','2016-11-30 06:30:57',NULL,'2017-02-15 07:16:38',NULL,NULL,NULL),(160,'ycbhd',2,'易充宝活动','yq/sp42tC7qRapPvzP0dTA==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-03-22 09:25:43',NULL,'2017-06-30 06:07:57',NULL,NULL,NULL),(161,'酷铂锐全国',2,'酷铂锐全国','wjgSwHtzu+XzwwJ3h6cqfA==','NORMAL','MALE',NULL,'18694041319','caishicheng@eckbr.com','kangqiong','2016-12-02 03:40:02',NULL,'2017-02-15 07:58:21',NULL,NULL,NULL),(162,'yisaifs',2,'易赛-分省','1wbihY7sgvuPSO9E/JcaZQ==','NORMAL','MALE',NULL,'12312312312','123@123','lixiaoqing','2016-12-19 04:49:40',NULL,'2017-06-06 01:50:55',NULL,NULL,NULL),(163,'鼎源大钰-全国',2,'鼎源大钰-全国','O/xyKTQHzRO/clhPNNxrDQ==','NORMAL','MALE',NULL,'18574388719','3001577539@qq.com','kangqiong','2016-12-05 07:07:48',NULL,'2017-02-15 08:34:53',NULL,NULL,NULL),(164,'yifenxiang',2,'易分享科技','DhOLQici0/vc6aumtpvSHA==','NORMAL','MALE',NULL,'18575200988','business@yisharing.com','liuzhaolian','2016-12-06 09:00:36',NULL,'2017-05-02 08:59:14',NULL,NULL,NULL),(165,'yunshengqg',2,'广州云盛','fBoah+zPiswIlNzI/jxNsQ==','NORMAL','MALE',NULL,'18688896468','18988836664@189.cn','liuzhaolian','2016-12-12 03:05:31',NULL,'2017-02-15 08:20:34',NULL,NULL,NULL),(166,'zhipufs',2,'智朴-分省','QiFT4lz8TjU9UxiVbGrZ+Q==','NORMAL','MALE',NULL,'12345678910','123@123.om','liuzhaolian','2016-12-14 03:34:04',NULL,'2017-05-02 08:57:00',NULL,NULL,NULL),(167,'chenghefs',2,'北京诚合时代-分省','oVu8penXF8dPsLps0qjo9A==','NORMAL','MALE',NULL,'12345678910','123@123.om','liuzhaolian','2016-12-16 08:55:42',NULL,'2017-06-06 02:12:57',NULL,NULL,NULL),(168,'zhiyuqg',2,'智语科技','8adqFgWIE6r2xbaNLBgTdw==','NORMAL','MALE',NULL,'13922990394','13922990394@zhiyan.cn','liuzhaolian','2016-12-19 07:22:56',NULL,'2017-06-06 01:50:13',NULL,NULL,NULL),(169,'liumiqg',2,'流米全国','75LCN63dv27tUSdPzVI7OA==','NORMAL','MALE',NULL,'13428985114','yuhui@tenchang.com','liuzhaolian','2016-12-19 08:22:14',NULL,'2017-05-02 09:52:48',NULL,NULL,NULL),(170,'liumifs',2,'流米-分省','R+ppNEMwI26TxNLlQHMqyw==','NORMAL','MALE',NULL,'13428985114','yuhui@tenchang.com','liuzhaolian','2016-12-19 08:37:06',NULL,'2017-05-02 09:52:28',NULL,NULL,NULL),(171,'lianlianfs',2,'连连-分省','3YAC4kzsKmT/fUgGF6FLgQ==','NORMAL','MALE',NULL,'17006831789','renbl@win10030.com','nizhi','2016-12-20 02:14:20',NULL,'2017-06-06 02:06:01',NULL,NULL,NULL),(172,'yichongqg',2,'南京易充','PV5bwkxMXXK+47hfrB0xrw==','NORMAL','MALE',NULL,'13609062456','szm.s@e-joined.com','liuzhaolian','2016-12-20 08:05:13',NULL,'2017-02-15 07:48:49',NULL,NULL,NULL),(173,'喜银通信分省',2,'喜银通信分省','QIadT38drm/kq8d62NMGMw==','NORMAL','MALE',NULL,'13828825456','1847741532@qq.com','kangqiong','2016-12-22 12:18:35',NULL,'2017-02-15 07:18:31',NULL,NULL,NULL),(174,'haihangqg',2,'海航通讯','FHzVw75WT2wkp39UQizHWw==','NORMAL','MALE',NULL,'17000001056','rui.zhao@10044.cn','wuzimei','2017-02-14 03:50:13',NULL,'2017-05-02 09:41:33',NULL,NULL,NULL),(175,'shuoruanqg',2,'硕软','K8FxViA1NB5NZQzSXszaxg==','INITIAL','MALE',NULL,'15767668286','kejian.wu@sohan.hk','wuzimei','2017-04-15 07:21:18',NULL,'2017-06-15 11:22:52',NULL,NULL,NULL),(176,'dianboqg',2,'dianboqg','hAwtHcLCuYniEG9KFQcM/g==','NORMAL','MALE',NULL,'15889982998','zhangch@dianbonet.com','wuzimei','2016-12-28 06:37:35',NULL,'2016-12-28 06:37:35',NULL,NULL,NULL),(184,'dianbo-qg',2,'点博-全国','XgB3055+wKrA70d1CICxRQ==','NORMAL','MALE',NULL,'15889982998','zhangch@dianbonet.com','wuzimei','2016-12-28 07:01:54',NULL,'2017-06-12 06:33:36',NULL,NULL,NULL),(185,'lichenqg',2,'立辰科技全国','YajRhPx8JdQpS7qxLdftqg==','NORMAL','MALE',NULL,'13692718312','lichenxinxi@163.com','liuzhaolian','2016-12-29 02:03:56',NULL,'2017-02-15 07:55:55',NULL,NULL,NULL),(186,'lichenfs',2,'立辰科技-分省','khiuK1IWdFe5ahJbHnHeIA==','NORMAL','MALE',NULL,'13692718312','lichenxinxi@163.com','wuzimei','2016-12-29 03:54:37',NULL,'2017-02-15 07:55:41',NULL,NULL,NULL),(187,'yangxinqg',2,'仰信-全国','qAbdpCYcgH2E9OpHbdIiIQ==','NORMAL','MALE',NULL,'18908196767','xhyywqh@163.com','wuzimei','2016-12-29 07:29:51',NULL,'2017-02-15 06:55:53',NULL,NULL,NULL),(188,'mixinhd',2,'米鑫活动账号','7cJqF1RqVIYNlC5mFTI1cw==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-01-04 02:50:13',NULL,'2017-02-15 07:49:47',NULL,NULL,NULL),(189,'juxinglianchuang',2,'聚兴联创','aviiiX+R3wKqcN3kzTNbjQ==','NORMAL','MALE',NULL,'13510228961','Zj@creative-together.com','wuzimei','2017-01-04 03:17:01',NULL,'2017-02-15 07:59:35',NULL,NULL,NULL),(190,'派联',2,'派联','Ryy1YqNRfHiVwuQoUC1Xfg==','INITIAL','MALE',NULL,'13922202371','fengshubin@pifii.com','wuzimei','2017-02-17 10:22:15',NULL,'2017-06-06 02:03:36',NULL,NULL,NULL),(191,'jiujiaxintong',2,'久佳信通-全国','WGuXlIh9US6mjN6h6Sp+Bw==','NORMAL','MALE',NULL,'13910155810','zhaojiujiang@jj-mobile.com','nizhi','2017-01-05 08:11:11',NULL,'2017-05-02 09:53:51',NULL,NULL,NULL),(192,'yikuai',2,'宜快科技-分省','BCoJ58LFLOlseTRB16SN5A==','NORMAL','MALE',NULL,'13510992104','zhouwei@yikuailiuliang.com','nizhi','2017-01-05 10:59:57',NULL,'2017-06-06 01:53:25',NULL,NULL,NULL),(193,'亿人在线-全国',2,'亿人在线-全国','Qre6+/EiCEDb7+EgCiow9g==','NORMAL','MALE',NULL,'12312312312','123@123','kangqiong','2017-01-09 02:36:00',NULL,'2017-05-02 09:00:58',NULL,NULL,NULL),(194,'利茸',2,'利茸','eZcJ1R+spWEGZelUluaCxg==','NORMAL','MALE',NULL,'18895337410','461257984@qq.com','wuzimei','2017-01-09 07:32:47',NULL,'2017-05-02 09:38:02',NULL,NULL,NULL),(195,'千橡-全国',2,'千橡-全国','oOt+3NfRVvc3pAI1Ub5zUg==','NORMAL','MALE',NULL,'13588942283','2676571106@qq.com','wuzimei','2017-01-09 09:22:07',NULL,'2017-06-06 02:02:06',NULL,NULL,NULL),(196,'qianxiangfs',2,'千橡-分省','D9pPNdkFwG82oREk0PpNmw==','NORMAL','MALE',NULL,'13588942283','2676571106@qq.com','wuzimei','2017-01-09 09:35:59',NULL,'2017-06-06 02:01:39',NULL,NULL,NULL),(197,'hongyouziqg',2,'红柚子-全国','FbjoLt3SXCzXk5jPnrEnFA==','NORMAL','MALE',NULL,'15113807458','gongyi@redyouzi.com','wuzimei','2017-01-16 08:23:52',NULL,'2017-02-15 08:02:55',NULL,NULL,NULL),(198,'jiutongqg',2,'广云九通-全国','fmQ/vdLyGLCjDZIyUPA4AQ==','NORMAL','MALE',NULL,'13691467323','cuijb@liuliangqb.com','wuzimei','2017-01-17 02:35:17',NULL,'2017-06-06 02:11:38',NULL,NULL,NULL),(199,'zhongzhiqg',2,'中知智慧-全国','ERdPsrq0EKqgfiqvB4W7zg==','NORMAL','MALE',NULL,'13466746592','guanlele@cnipr.com','wuzimei','2017-01-17 08:05:34',NULL,'2017-02-14 08:45:58',NULL,NULL,NULL),(200,'yunmeiqg',2,'云媒-全国','zd8WWJCgTOxa0Kbi7Gc7YQ==','NORMAL','MALE',NULL,'15055151320','wrm@hfcckj.net','wuzimei','2017-01-18 06:14:35',NULL,'2017-02-14 08:51:51',NULL,NULL,NULL),(201,'lianlianqg',2,'连连-全国','XqHngTbb734ZqivXK2lhTw==','NORMAL','MALE',NULL,'17006831789','renbl@win10030.com','wuzimei','2017-01-19 08:03:59',NULL,'2017-06-06 02:05:27',NULL,NULL,NULL),(202,'junlongqg',2,'君隆-全国','uSfA12ZuazmqjsvNtRdYdA==','NORMAL','MALE',NULL,'13777866184','Tutingting@junlongtech.com','wuzimei','2017-01-20 04:04:28',NULL,'2017-06-12 06:32:57',NULL,NULL,NULL),(203,'唯诚-全国',2,'唯诚-全国','Qhwbkuv747lzr1u57yfp9g==','NORMAL','MALE',NULL,'15960067731','2880987277@qq.com','kangqiong','2017-01-22 03:51:01',NULL,'2017-02-15 07:19:20',NULL,NULL,NULL),(204,'youxinqg',2,'有信源通-全国','cKi7dkixHFDH4tM+R7XbsQ==','NORMAL','MALE',NULL,'15914108690','stephen.shen@uxin.xom','nizhi','2017-01-23 03:07:05',NULL,'2017-02-14 09:04:58',NULL,NULL,NULL),(205,'shuoruan',2,'硕软-全国','wjPrkoGc8d1708jh5IoJqQ==','NORMAL','MALE',NULL,'15767668286','kejian.wu@sohan.hk','kangqiong','2017-02-04 01:53:06',NULL,'2017-05-02 09:06:36',NULL,NULL,NULL),(206,'zhishangfs',2,'智尚-分省','YkIe3q0V7cb+2QqfUNZIww==','NORMAL','MALE',NULL,'15665790064','785513644@qq.com','kangqiong','2017-02-04 02:56:01',NULL,'2017-02-14 08:49:06',NULL,NULL,NULL),(207,'feihan-fs',2,'南京飞翰-分省','8dyxb/lawL1qye7XPs1FDA==','NORMAL','MALE',NULL,'15950585730','sup@ofpay.com','wuzimei','2017-02-07 06:14:53',NULL,'2017-07-17 02:44:20',NULL,NULL,NULL),(208,'huaxin-qg',2,'北京华信-全国','2MrDB7v2i1vFk/z5WP5f7A==','NORMAL','MALE',NULL,'13911020289','Liwx@huaxincloud.com','wuzimei','2017-02-08 02:38:01',NULL,'2017-05-02 09:47:04',NULL,NULL,NULL),(209,'河南趣闻-全国',2,'河南趣闻-全国','BbPsOsYXeW3Oq20b2oYTnQ==','NORMAL','MALE',NULL,'13071007891','421549604@qq.com','kangqiong','2017-02-05 08:07:58',NULL,'2017-05-02 09:54:30',NULL,NULL,NULL),(210,'hengtongfs',2,'亚泰亨通-分省','5H970FaJKYxhPz/52KhDcg==','NORMAL','MALE',NULL,'18696443501','383314260@qq.com','kangqiong','2017-02-06 03:50:40',NULL,'2017-05-02 09:02:16',NULL,NULL,NULL),(211,'yifenxiangfs',2,'易分享科技-分省','jryDAf5ZjdvAgjCJ5O1Exg==','NORMAL','MALE',NULL,'18575200988','business@yisharing.com','kangqiong','2017-02-06 04:17:22',NULL,'2017-05-02 08:58:57',NULL,NULL,NULL),(212,'jiuyangqg',2,'广州九洋-全国','7dnpfA7b5/BczS4h8OcdSg==','NORMAL','MALE',NULL,'15622736028','wuhuipeng@91network.com','wuzimei','2017-06-27 03:35:56',NULL,'2017-06-27 03:35:56',NULL,NULL,NULL),(213,'jinfengyunqg',2,'海南劲峰云-全国','Uwss1mBAFTb4LV09sKIReA==','NORMAL','MALE',NULL,'18612862598','Wangweili@1jinb.com','wuzimei','2017-02-07 09:47:18',NULL,'2017-06-06 02:10:10',NULL,NULL,NULL),(214,'xinhaoqg',2,'新号吧-全国','URDZKnTfYV0zA83LlAFlEw==','NORMAL','MALE',NULL,'13620222002','2531528666@qq.com','nizhi','2017-08-02 08:54:36',NULL,'2017-08-02 08:54:36',NULL,NULL,NULL),(215,'zhonngyicaiqg',2,'北京众易财-全国','Qhhd3b3TOXti+R1ZjweSZA==','NORMAL','MALE',NULL,'18612799088','kingkey0908@qq.com','wuzimei','2017-02-15 04:37:25',NULL,'2017-05-02 09:59:09',NULL,NULL,NULL),(216,'huilin',2,'深圳汇林','ck3KDfpBnp+C0nunBbFA3A==','NORMAL','MALE',NULL,'15899755725','50258841@qq.com','wuzimei','2017-02-10 04:11:44',NULL,'2017-02-15 07:36:57',NULL,NULL,NULL),(217,'yikuai-qg',2,'宜快科技-全国','Tqug/09CNH1uqoZA+zeyhA==','NORMAL','MALE',NULL,'13510992104','zhouwei@yikuailiuliang.com','nizhi','2017-02-13 02:50:17',NULL,'2017-06-06 01:52:56',NULL,NULL,NULL),(218,'changyueqg',2,'上海长悦','ZKbCxkUcjxA0TCI0tbjRjg==','NORMAL','MALE',NULL,'13436969357','lvhongdou@jieshenkj.com','nizhi','2017-02-13 07:35:19',NULL,'2017-02-21 10:19:15',NULL,NULL,NULL),(219,'aiweiqg',2,'艾为飞鸿','pMESauOt4f3HKwhk6OA0hQ==','NORMAL','MALE',NULL,'17601637088','7028496@QQ.com','nizhi','2017-02-14 02:53:51',NULL,'2017-02-14 02:53:51',NULL,NULL,NULL),(220,'dinshanqg',2,'前海鼎山','EuLqoMzr0ofzzqWj0IhCdQ==','NORMAL','MALE',NULL,'13600186602','zhaoch@dinstech.com','nizhi','2017-02-14 03:45:36',NULL,'2017-06-06 02:01:02',NULL,NULL,NULL),(221,'fengzhushouhd',2,'蜂助手-活动账号','5cx4xsQxp+ynuLVJjoJ9Tw==','NORMAL','MALE',NULL,'13826435469','zhouqin@phone580.com','kangqiong','2017-02-14 07:32:26',NULL,'2017-05-02 09:45:23',NULL,NULL,NULL),(222,'广州金鸥',2,'广州金鸥','S/x7LQTEpNAYlyOht3lf5w==','NORMAL','MALE',NULL,'13802449945','1953915647@qq.com','kangqiong','2017-02-14 08:34:40',NULL,'2017-02-14 08:34:40',NULL,NULL,NULL),(223,'zhongyi',2,'深圳中移','u+0rGMyhiqa15t0tKsGo5Q==','NORMAL','MALE',NULL,'13725508691','358823126@qq.com','wuzimei','2017-02-15 04:30:49',NULL,'2017-02-15 04:30:49',NULL,NULL,NULL),(224,'wanliuqg',2,'杭州弯流','INELQLNmKWRtLwlRVeDaZQ==','NORMAL','MALE',NULL,'18006783900','jimmy@iwanliu.cn','kangqiong','2017-07-11 06:09:40',NULL,'2017-07-11 06:09:40',NULL,NULL,NULL),(225,'haihangfs',2,'海航通讯-分省','rpmKattJhH5dRFnM8ya6kQ==','NORMAL','MALE',NULL,'17000001056','rui.zhao@10044.cn','nizhi','2017-03-24 07:36:30',NULL,'2017-05-02 09:41:03',NULL,NULL,NULL),(226,'quwenfs',2,'河南趣闻-分省','Ftrx6WgWf12Ycan/uGt6Zw==','NORMAL','MALE',NULL,'13071007891','421549604@qq.com','kangqiong','2017-02-18 08:54:04',NULL,'2017-05-02 09:54:11',NULL,NULL,NULL),(227,'qianxinghd',2,'千行你我科技-活动账号','sJ0HpItsoBC3EcnU/VrC+Q==','NORMAL','MALE',NULL,'13989109920','leixs@100bm.cn','kangqiong','2017-02-20 03:15:32',NULL,'2017-06-06 03:06:06',NULL,NULL,NULL),(228,'shuoruanhd',2,'硕软-活动账号','M0cvxK5Fq6HJcWnVPnoFDg==','NORMAL','MALE',NULL,'15767668286','kejian.wu@sohan.hk','wuzimei','2017-02-20 06:02:08',NULL,'2017-05-02 09:06:16',NULL,NULL,NULL),(229,'yikuaihd',2,'宜快科技-活动账号','sJ7323qJuKx18tLmF/6Ctw==','NORMAL','MALE',NULL,'13510992104','zhouwei@yikuailiuliang.com','nizhi','2017-02-20 08:19:29',NULL,'2017-06-06 01:52:24',NULL,NULL,NULL),(230,'qiweishuqg',2,'上海七位数-全国','nOpTGlcU4kbPy9ZjL7vyVA==','NORMAL','MALE',NULL,'13816677010','Niyaoqing@dodoca.com','nizhi','2017-02-20 08:49:21',NULL,'2017-06-06 01:57:05',NULL,NULL,NULL),(231,'yzxkf',2,'云之讯开发平台','emYxef4OPbCQa4NtgxgOPw==','NORMAL','MALE',NULL,'12312312312','123@11.com','nizhi','2017-02-20 10:10:42',NULL,'2017-02-22 04:34:11',NULL,NULL,NULL),(232,'fengxiangqg',2,'风向科技-全国','ztJBps0rFVHe6CHiQE2LBw==','NORMAL','MALE',NULL,'13602509711','3300602562@qq.com','nizhi','2017-02-21 08:14:53',NULL,'2017-02-21 08:14:53',NULL,NULL,NULL),(233,'fengxiangfs',2,'风向科技-分省','yV5KybNBFB2yjxLA7qx7Iw==','NORMAL','MALE',NULL,'13602509711','3300602562@qq.com','nizhi','2017-02-22 04:08:45',NULL,'2017-02-22 04:08:45',NULL,NULL,NULL),(234,'yunsheng',2,'广州云盛-全国','hYuSC2qnVY7gEoyhi3k69Q==','NORMAL','MALE',NULL,'18688896468','18988836664@189.cn','kangqiong','2017-02-24 10:47:46',NULL,'2017-02-27 09:06:28',NULL,NULL,NULL),(235,'yunshengfs',2,'广州云盛-分省','4pe4OtDqLJh0GUkOPvqEpw==','NORMAL','MALE',NULL,'18688896468','18988836664@189.cn','wuzimei','2017-02-27 10:07:01',NULL,'2017-02-27 10:10:44',NULL,NULL,NULL),(236,'tenxunyunqg',2,'腾讯云','s4Nf2OAKT38Fq3TCZz7pDQ==','NORMAL','MALE',NULL,'18680391105','louishliu@tencent.com','nizhi','2017-02-28 10:36:55',NULL,'2017-02-28 10:36:55',NULL,NULL,NULL),(237,'youxinfs',2,'有信源通-分省','w7J0fSKeCpA2ewp9a9xGsQ==','NORMAL','MALE',NULL,'15914108690','stephen.shen@uxin.xom','nizhi','2017-03-01 02:02:08',NULL,'2017-03-01 02:02:08',NULL,NULL,NULL),(238,'kainuoer',2,'重庆凯诺尔','vBeHfTxFNsPusLL6p+TV4w==','NORMAL','MALE',NULL,'18983201473','xiaojianjiao@llt800.com','wuzimei','2017-03-02 01:40:12',NULL,'2017-03-02 01:40:12',NULL,NULL,NULL),(239,'tengxunyun',2,'腾讯云客户','ECPXbU6T7VplfSGhpwxauw==','NORMAL','MALE',NULL,'18689206966','11@qq.com','fmp-admin','2017-03-02 09:02:50',NULL,'2017-03-02 09:02:50',NULL,NULL,NULL),(240,'zhongyeqg',2,'郑州中业','FmBSC/Wo1cFfN+aNFIah1w==','NORMAL','MALE',NULL,'13838121562','Yangmaoqing@zoneyet','kangqiong','2017-03-06 07:35:00',NULL,'2017-03-06 07:35:00',NULL,NULL,NULL),(241,'junboqg',2,'广州骏伯','Rpv+wKOEH2IH9fk3h9Fgpw==','NORMAL','MALE',NULL,'18922292919','fangsm@gzjunbo.net','wuzimei','2017-03-07 03:17:30',NULL,'2017-06-06 02:11:12',NULL,NULL,NULL),(242,'zhejiangyifa',2,'浙江义发','fGTvGMXHyiSWZXlxGXa6/Q==','NORMAL','MALE',NULL,'18667899176','5490148@qq.com','zliting','2017-03-09 04:25:15',NULL,'2017-03-09 04:25:15',NULL,NULL,NULL),(243,'hualeihui',2,'花蕾荟','9OJqCAJ9x4zboaEDQcS4pA==','NORMAL','MALE',NULL,'13622808813','myuan@hualeihui.com','zliting','2017-03-09 10:03:08',NULL,'2017-03-09 10:03:08',NULL,NULL,NULL),(244,'haoqi',2,'皓祺网络','lVIqPrUCrEa3Y24JOvE9ig==','NORMAL','MALE',NULL,'18175148386','402583163@qq.com','nizhi','2017-03-10 08:30:30',NULL,'2017-03-10 08:30:30',NULL,NULL,NULL),(245,'yuanmaiqg',2,'杭州元迈','H7B3TlzT2rWHQkIOtKENhQ==','NORMAL','MALE',NULL,'18257980151','123456@qq.com','caihuilian','2017-03-14 05:14:36',NULL,'2017-07-09 05:47:32',NULL,NULL,NULL),(246,'yuecheng',2,'yuecheng','vYP3t6+HX6kS0FtiJydq3Q==','NORMAL','MALE',NULL,'17773121280','jiangrui@365haoyou.com','luoweipeng','2017-03-14 05:18:23',NULL,'2017-05-02 03:49:08',NULL,NULL,NULL),(247,'kuangchao',2,'杭州狂潮','Jtk1ikKhLZRXgxugPjXHww==','NORMAL','MALE',NULL,'18620300620','13325812760@189.cn','caihuilian','2017-03-14 09:15:23',NULL,'2017-05-02 09:56:05',NULL,NULL,NULL),(248,'株洲小而美2',2,'株洲小而美','p9TlqpyJSUbDogJsq56PrA==','DELETED','MALE',NULL,'15197257175','1016839823@qq.com','luoweipeng','2017-03-15 09:08:47',NULL,'2017-03-15 09:08:08',NULL,NULL,NULL),(249,'福州悦尚',2,'福州悦尚','SFL9q6VGsSfdJVE4b4ldJA==','NORMAL','MALE',NULL,'18905917161','13636923622@139.com','zliting','2017-03-15 09:16:28',NULL,'2017-03-15 09:16:28',NULL,NULL,NULL),(250,'西安道正',2,'西安道正','kZm72ZY+LjNV+eidaU/rgw==','NORMAL','MALE',NULL,'18574598999','4165157549@qq.com','luoweipeng','2017-03-16 07:56:19',NULL,'2017-04-18 09:42:39',NULL,NULL,NULL),(251,'junlongfs',2,'君隆-分省','/dQng/0lV2TXYhbv7DUvww==','NORMAL','MALE',NULL,'13777866184','Tutingting@junlongtech.com','nizhi','2017-03-16 08:17:21',NULL,'2017-06-12 06:31:53',NULL,NULL,NULL),(252,'zhongxingshitong',2,'中兴视通','m8Q/cR/Ir4il2WfdnoHopg==','NORMAL','MALE',NULL,'15999637921','zhengyimin@seecom.com.cn','zliting','2017-03-17 02:25:14',NULL,'2017-05-02 08:56:30',NULL,NULL,NULL),(253,'hhtx',2,'海航_test','IFjO4aARRgsVZvm/4QwX8w==','DELETED','MALE',NULL,'18620300620','11@qq.com','chenjing','2017-03-17 02:59:57',NULL,'2017-03-17 02:45:00',NULL,NULL,NULL),(254,'hhtxtest',2,'海航_test','6BtSZW72x7wHP7DDKEO3vg==','DELETED','MALE',NULL,'17000001056','rui.zhao@10044.cn','chenjing','2017-04-01 04:03:49',NULL,'2017-03-17 03:02:32',NULL,NULL,NULL),(255,'kainuoerfs',2,'重庆凯诺尔-分省','omGc6SEQNPKjGjINUsl1zQ==','NORMAL','MALE',NULL,'18983201473','xiaojianjiao@llt800.com','nizhi','2017-03-17 07:38:55',NULL,'2017-03-17 07:38:55',NULL,NULL,NULL),(256,'huagao',2,'广东华高','7QvffQ0nNHgrGsFGfuy5LA==','NORMAL','MALE',NULL,'18761580930','Lihao@huagaotx.com','wuzimei','2017-03-17 11:27:08',NULL,'2017-03-17 11:27:08',NULL,NULL,NULL),(257,'zhongshenyuanfs',2,'中琛源科技-分省','WnKfqQzVR+OWwQ9QPSB7Qw==','NORMAL','MALE',NULL,'18826483070','chenhy@ibumobile.com','nizhi','2017-03-20 01:46:23',NULL,'2017-04-06 02:23:44',NULL,NULL,NULL),(258,'zhuhaimaihong',2,'珠海迈鸿','MFwAGabFvXxg94GljPSY3A==','NORMAL','MALE',NULL,'13612219959','929560441@qq.com','caihuilian','2017-03-20 02:32:29',NULL,'2017-04-18 09:43:28',NULL,NULL,NULL),(259,'华高通信',2,'华高通信','yiY9JsCg2ZVwoxVbRB3UFw==','NORMAL','MALE',NULL,'18761580930','Lihao@huagaotx.com','caihuilian','2017-03-20 03:11:44',NULL,'2017-03-20 03:11:44',NULL,NULL,NULL),(260,'weiwangtonlian',2,'微网通联','tUn2FYDm44MzcjK7WQEtOg==','NORMAL','MALE',NULL,'17600155233','Liuye@51welink.com','caihuilian','2017-03-20 08:48:15',NULL,'2017-04-10 02:52:48',NULL,NULL,NULL),(261,'zhongdawangshi',2,'中大网视','JH+FEdEuvW8xm1I8buYg7Q==','NORMAL','MALE',NULL,'15901266627','liujia@winksi.com','caihuilian','2017-03-20 09:28:56',NULL,'2017-06-23 07:38:56',NULL,NULL,NULL),(262,'上海龙举',2,'上海龙举','DE2B2FNtF+xbRZWpNTOAGQ==','NORMAL','MALE',NULL,'13101993067','3144827869@qq.com','luoweipeng','2017-03-21 06:21:07',NULL,'2017-06-06 01:57:43',NULL,NULL,NULL),(263,'新平台客户',2,'新平台客户','1G+FsQI0W+stLosXou1Xlw==','NORMAL','MALE',NULL,'13512345678','450681176@qq.com','测试','2017-03-21 08:05:28',NULL,'2017-03-21 09:01:07',NULL,NULL,NULL),(264,'qianhaidinshanfs',2,'前海鼎山-分省','LNlBcmUPOm5NIsxyoPHlfA==','NORMAL','MALE',NULL,'13600186602','zhaoch@dinstech.com','caihuilian','2017-03-22 02:40:36',NULL,'2017-06-06 02:00:32',NULL,NULL,NULL),(265,'杭州沃伦',2,'杭州沃伦','YdHXpWVjrgZjHuuLzsBGqw==','NORMAL','MALE',NULL,'15257157671','wanglr@hzwolun.com','luoweipeng','2017-03-22 08:41:04',NULL,'2017-03-22 08:41:04',NULL,NULL,NULL),(266,'youxinhd',2,'有信源通-活动账号','ofrApcPSsUxDNFQ6bCZyGw==','NORMAL','MALE',NULL,'15914108690','stephen.shen@uxin.xom','kangqiong','2017-03-23 03:31:58',NULL,'2017-03-23 03:31:58',NULL,NULL,NULL),(267,'youbige',2,'优比格','NOrM0pZ9gO8JGczGufsBDw==','NORMAL','MALE',NULL,'18551803757','liuj@uumon.com','caihuilian','2017-03-23 03:34:41',NULL,'2017-03-23 03:34:41',NULL,NULL,NULL),(268,'kunyang',2,'昆阳','2/E2D4mGIDntvWWXFjeLpQ==','NORMAL','MALE',NULL,'18111280210','hq@cdkytx.com','caihuilian','2017-04-25 06:38:32',NULL,'2017-04-25 06:38:32',NULL,NULL,NULL),(269,'qiweishufs',2,'上海七位数-分省','NwdzWr/eNHbYV/04A1X/4g==','NORMAL','MALE',NULL,'13816677010','Niyaoqing@dodoca.com','zliting','2017-03-23 06:43:13',NULL,'2017-06-06 01:56:36',NULL,NULL,NULL),(270,'shijitianyou',2,'世纪天佑','GVuBxB7l1bKJX41ZJtMlnQ==','NORMAL','MALE',NULL,'18998307941','2855383333@qq.com','caihuilian','2017-03-23 06:46:01',NULL,'2017-04-18 09:42:05',NULL,NULL,NULL),(271,'xiaoermeiqg',2,'株洲小而美-全国','664f3wYfzMfbtlbcdtwP5Q==','NORMAL','MALE',NULL,'15197257175','1016839823@qq.com','kangqiong','2017-03-23 07:02:22',NULL,'2017-03-23 07:02:22',NULL,NULL,NULL),(272,'dyb1122',2,'小熙虚拟商盟','Wnb3puznUhKq2puUqMOjjg==','NORMAL','MALE',NULL,'18975450813','272509837@qq.com','wuzimei','2017-03-28 05:19:25',NULL,'2017-04-18 09:41:34',NULL,NULL,NULL),(273,'hangzhouleyao',2,'杭州乐尧','p7uhEA+FyT+Duy+kYVNIyA==','NORMAL','MALE',NULL,'15168380320','tonghb@ekhui.com','zliting','2017-03-24 03:07:27',NULL,'2017-04-18 09:40:20',NULL,NULL,NULL),(274,'yunliu',2,'云流','arC+VnIIMj9z5Oan0rWQ+w==','NORMAL','MALE',NULL,'13800138000','10086@qq.com','lwp','2017-03-24 06:24:58',NULL,'2017-03-24 06:24:58',NULL,NULL,NULL),(275,'yunliutest',2,'云流测试','uXEy3jMOUVj2pHeUjujRyw==','DELETED','MALE',NULL,'13652462003','13652@163.com','yunliu','2017-03-24 08:23:18',NULL,'2017-03-24 08:11:36',NULL,NULL,NULL),(277,'yunliutest1',2,'云流测试','fUtNiKZZKsFxy5l+vCEpuw==','NORMAL','MALE',NULL,'13652462003','yunliutest@163.com','yunliu','2017-03-24 08:24:01',NULL,'2017-03-24 08:24:01',NULL,NULL,NULL),(278,'shanghaizhuoyi',2,'上海卓移','slYm+zVnDPXpsvVVliwt0A==','NORMAL','MALE',NULL,'13917748687','xubin@sungoin.com','caihuilian','2017-04-01 03:26:43',NULL,'2017-04-18 09:40:53',NULL,NULL,NULL),(279,'上海卓移-分省',2,'上海卓移-分省','Hlbnf4Mkqx1J9zPCyF10Zw==','NORMAL','MALE',NULL,'13917748687','xubin@sungoin.com','caihuilian','2017-04-01 03:56:13',NULL,'2017-04-18 09:39:42',NULL,NULL,NULL),(281,'hhtxqg',2,'海航_全国','mkkjNc16cDZO7vgpFI8XAA==','NORMAL','MALE',NULL,'18620300620','1380013800@qq.com','chenjing','2017-04-01 04:06:10',NULL,'2017-04-14 08:45:47',NULL,NULL,NULL),(282,'youbigeqg',2,'优比格-全国','mRv+iIV3L8HlZLWzmIfmgA==','NORMAL','MALE',NULL,'18551803757','liuj@uumon.com','caihuilian','2017-04-01 04:23:58',NULL,'2017-04-01 04:23:58',NULL,NULL,NULL),(283,'danyuan',2,'广州单元信息科技','/Gs+OvLXIUnO40wVmYy5pg==','NORMAL','MALE',NULL,'13560116825','jiaru.wang@mchuan.com','wuzimei','2017-04-01 11:30:55',NULL,'2017-05-02 09:43:44',NULL,NULL,NULL),(284,'shanghainadu',2,'上海纳都','i4BXvYIgWbXVBhuDaLjo0w==','NORMAL','MALE',NULL,'13823666565','2880162500@qq.com','caihuilian','2017-04-05 03:50:14',NULL,'2017-07-17 02:43:59',NULL,NULL,NULL),(285,'xingyunliushui',2,'行云流水','IdiOtj3ZsV0SpUcDBNupOw==','DELETED','MALE',NULL,'18620986229','sales@lljypt.com','luoweipeng','2017-04-07 02:09:58',NULL,'2017-04-07 02:05:32',NULL,NULL,NULL),(286,'zhuhaixingyunliushui',2,'珠海行云流水','vwCNLkC71rXP1l4eOtpUog==','DELETED','MALE',NULL,'18620986229','sales@lljypt.com','luoweipeng','2017-04-11 07:53:39',NULL,'2017-04-07 02:28:37',NULL,NULL,NULL),(287,'shanghaixuntin',2,'上海讯廷','n20EZG8siX/mxZneQPH1kQ==','NORMAL','MALE',NULL,'13816582911','ady_wwang@163.com','caihuilian','2017-04-07 02:35:03',NULL,'2017-04-07 02:35:03',NULL,NULL,NULL),(288,'dingshanhd',2,'前海鼎山-活动账号','rRC1qtYTe+IOXJoCn47HWw==','NORMAL','MALE',NULL,'13600186602','zhaoch@dinstech.com','zliting','2017-04-07 15:36:52',NULL,'2017-06-06 01:59:01',NULL,NULL,NULL),(289,'yirenzaixianqghd',2,'移动-全国-网信活动','hrm7obgCf2dlz82FDga2DQ==','DELETED','MALE',NULL,'12312312312','123@123','nizhi','2017-04-10 03:33:12',NULL,'2017-04-10 03:30:35',NULL,NULL,NULL),(291,'yrqghd',2,'亿人在线-全国活动','ZtgnM1MkcDJx7Ei8CNSW0A==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2017-04-10 03:36:07',NULL,'2017-05-02 09:00:40',NULL,NULL,NULL),(292,'zhongpinheyi',2,'众品合一','GK8kmv4Oa40RJLe+IzmMQA==','NORMAL','MALE',NULL,'13810163257','tangjun@zhphy.com','luoweipeng','2017-04-10 06:35:51',NULL,'2017-04-10 06:35:51',NULL,NULL,NULL),(293,'wangxinhuodong',2,'网信活动','DwHpjTCChaDNDOCvQIAYEQ==','NORMAL','MALE',NULL,'13606421858','3246238053@qq.com','zliting','2017-04-21 09:31:44',NULL,'2017-05-02 09:03:46',NULL,NULL,NULL),(294,'haihanghd',2,'海航_全国活动','GPL3p+Ez6vScLswQzWQuGA==','NORMAL','MALE',NULL,'13800138000','13923428000@139.com','chenjing','2017-04-11 06:16:25',NULL,'2017-04-14 08:44:47',NULL,NULL,NULL),(295,'zhongtian',2,'北京中天','x1OW+FbqLarlHfvvbifSMA==','NORMAL','MALE',NULL,'13910659431','lizhihua@zhongtianhexin.com','wuzimei','2017-04-11 08:33:47',NULL,'2017-04-25 03:58:06',NULL,NULL,NULL),(296,'test',2,'test','mdnv/fMr/VFWLuEh/Qa60A==','DELETED','MALE',NULL,'13297979797','111@qq.com','fmp-admin','2017-04-11 10:06:24',NULL,'2017-04-11 10:06:12',NULL,NULL,NULL),(297,'jinankunshi',2,'济南坤石','T+7seeGlGR0104jryFYh4A==','NORMAL','MALE',NULL,'18653186868','13953124111@139.com','luoweipeng','2017-07-20 07:11:36',NULL,'2017-08-07 01:39:15',NULL,NULL,NULL),(298,'wanwuhulian',2,'万物互联','32kxFlUF4JjxrmOGQj0Kxg==','NORMAL','MALE',NULL,'18915594243','345343260@qq.com','luoweipeng','2017-04-17 02:10:59',NULL,'2017-04-17 02:10:59',NULL,NULL,NULL),(299,'yueshenghuo',2,'悦生活','FJVT0eXK4uUdL43b3IBTkg==','NORMAL','MALE',NULL,'15580866830','lifan@yuqianshu.com','zliting','2017-07-21 03:26:09',NULL,'2017-07-21 03:26:09',NULL,NULL,NULL),(300,'shanghaishibao',2,'上海诗宝','vfkhFwOMAO8Fv8kQQvssJg==','NORMAL','MALE',NULL,'18005249232','Xiezirui12@163.com','caihuilian','2017-04-17 08:47:45',NULL,'2017-05-02 09:09:13',NULL,NULL,NULL),(301,'sichuantianyingtong',2,'四川天赢通','AhRJRHdNkwJM9LTK0GFIWg==','NORMAL','MALE',NULL,'18602897167','504418669@qq.com','zliting','2017-06-09 09:45:06',NULL,'2017-07-12 09:57:11',NULL,NULL,NULL),(302,'讯飞',2,'讯飞','pVyNSrptPRNmrwqrjAEzDA==','NORMAL','MALE',NULL,'13959136951','13959136951@139.com','zliting','2017-04-21 07:54:47',NULL,'2017-04-21 07:54:47',NULL,NULL,NULL),(303,'liushuiqg',2,'行云流水-全国（新）','MiRdXngylEJIp5Bu2ytplA==','NORMAL','MALE',NULL,'18620986229','sales@lljypt.com','wuzimei','2017-04-25 04:15:18',NULL,'2017-07-17 02:46:07',NULL,NULL,NULL),(304,'liushuifs',2,'行云流水-分省（新）','WFiChmOI7kZHzdAiizCfHQ==','NORMAL','MALE',NULL,'18620986229','sales@lljypt.com','wuzimei','2017-04-25 04:23:42',NULL,'2017-07-17 02:45:51',NULL,NULL,NULL),(305,'tianyingtongfs',2,'四川天赢通-分省','MvrxhpqiH0l2ztTtkF9WDw==','NORMAL','MALE',NULL,'18602897167','504418669@qq.com','zliting','2017-06-09 09:43:02',NULL,'2017-08-08 03:16:40',NULL,NULL,NULL),(306,'zhongxinyinhang',2,'中信银行','1iYEOQSsk5uU9qRBglnrfw==','NORMAL','MALE',NULL,'13140000000','13140@000000','caihuilian','2017-04-28 11:07:16',NULL,'2017-06-01 08:35:02',NULL,NULL,NULL),(307,'yifutong',2,'易付通','51PO6jN3BtUaKbh5VTtTpQ==','NORMAL','MALE',NULL,'18874701908','2355418522@qq.com','yanlei','2017-05-02 03:21:54',NULL,'2017-05-02 03:21:54',NULL,NULL,NULL),(308,'yuechengfensheng',2,'跃程-分省','3teH5b1iLWT4Z8JTZcGFjw==','NORMAL','MALE',NULL,'13322981444','jiangrui@365haoyou.com','zliting','2017-05-03 02:16:35',NULL,'2017-05-03 02:16:35',NULL,NULL,NULL),(309,'yuechengquanguo',2,'跃程-全国','8yrNUTysEE8YqT8rJyDRTA==','NORMAL','MALE',NULL,'13322981444','jiangrui@365haoyou.com','zliting','2017-05-03 03:00:39',NULL,'2017-05-03 03:09:18',NULL,NULL,NULL),(310,'miaoxin',2,'秒信','j92rFZYoOP7gv4wMRO0jXw==','NORMAL','MALE',NULL,'18600070689','Yake.zheng@miaoxin-inc.com','zliting','2017-05-04 07:18:14',NULL,'2017-05-04 07:18:14',NULL,NULL,NULL),(311,'yongle',2,'武汉永乐','xug6nZapF6Og3iSpBb1T/Q==','NORMAL','MALE',NULL,'15907174718','zhouyaqian@yolly.cc','wuzimei','2017-05-04 09:38:58',NULL,'2017-07-05 02:03:43',NULL,NULL,NULL),(312,'xiangheng',2,'河北祥恒','WUhimStByxaOdKNZUrpTew==','NORMAL','MALE',NULL,'17732122792','2484259038@qq.com','wuzimei','2017-05-04 09:51:05',NULL,'2017-05-04 09:51:05',NULL,NULL,NULL),(313,'广州九洋-分省',2,'广州九洋-分省','ikoRsxbJN83fIgEAbZ7x8w==','NORMAL','MALE',NULL,'15622736028','wuhuipeng@91network.com','yanlei','2017-05-08 08:13:53',NULL,'2017-05-08 08:13:53',NULL,NULL,NULL),(314,'yzxwupiao',2,'云之讯无票调用','ffkNmTYFSjnQx/iod1WB4Q==','NORMAL','MALE',NULL,'12346789000','2881574866@qq.com','wuzimei','2017-05-09 07:21:49',NULL,'2017-05-09 08:39:48',NULL,NULL,NULL),(315,'yulanqg',2,'钰蓝科技-全国','d9ZwSeCZKcAWPiDKvOzRFA==','NORMAL','MALE',NULL,'13800138000','11@qq.com','yanlei','2017-05-10 07:26:26',NULL,'2017-05-10 07:26:26',NULL,NULL,NULL),(316,'jiudianjiu',2,'杭州久点久电子商务有限公司','xHPYs8dTbiBKHq8i9WvAMg==','NORMAL','MALE',NULL,'18706380910','zhenghangfeng@9dian9.cn','luoweipeng','2017-05-10 07:39:18',NULL,'2017-05-10 07:39:18',NULL,NULL,NULL),(317,'yunzhishu',2,'云之数','O/F771ikK6DW/0fdR31tEw==','NORMAL','MALE',NULL,'15651800517','Lijiamu@yescloudtree.com','caihuilian','2017-05-11 02:11:18',NULL,'2017-06-01 09:59:47',NULL,NULL,NULL),(318,'yingfangqg',2,'盈方-全国','TU8FzO6RkiBEGRiv2ejQLQ==','NORMAL','MALE',NULL,'12345678900','12345678900@qq.com','wuzimei','2017-05-13 05:45:11',NULL,'2017-06-14 01:57:08',NULL,NULL,NULL),(319,'yingfangfs',2,'盈方-分省','/Tlbwzh5OjKuIZO50Iao0A==','NORMAL','MALE',NULL,'12345678900','12345678900@qq.com','wuzimei','2017-05-13 05:49:12',NULL,'2017-06-14 01:56:54',NULL,NULL,NULL),(320,'wanliufs',2,'杭州弯流-分省','PU8deUoauaDx5NdUHB0CsA==','NORMAL','MALE',NULL,'18006783900','jimmy@iwanliu.cn','wuzimei','2017-07-05 11:46:31',NULL,'2017-07-05 11:46:31',NULL,NULL,NULL),(321,'xitong',2,'希同','RnkCX1Ra6PPoVIMIlmY7rw==','NORMAL','MALE',NULL,'13814426257','70252785@qq.com','zliting','2017-05-18 07:25:53',NULL,'2017-05-18 07:25:53',NULL,NULL,NULL),(322,'chengherun',2,'承和润','gG5vhavbDoYoQe93lKYosA==','NORMAL','MALE',NULL,'13428754645','13428754645@139.com','zliting','2017-05-18 08:43:18',NULL,'2017-05-18 08:51:29',NULL,NULL,NULL),(323,'zhongyuan',2,'中原','45yuIDVToHB+MAuRPsYkBg==','NORMAL','MALE',NULL,'13714585575','fuzx2@centaline.com.cn','wuzimei','2017-05-23 03:03:11',NULL,'2017-05-23 03:05:26',NULL,NULL,NULL),(324,'hengwu',2,'恒物','nAeV7tF4SejSew+Dn2pK9w==','NORMAL','MALE',NULL,'13510241434','13510241434@139.com','caihuilian','2017-05-26 08:20:40',NULL,'2017-05-26 08:20:40',NULL,NULL,NULL),(325,'jscs',2,'技术测试','N+iniym+zER+xjnSBbmRlQ==','NORMAL','MALE',NULL,'13800138000','10086@qq.com','chenjing','2017-05-26 10:21:39',NULL,'2017-07-25 03:18:47',NULL,NULL,NULL),(326,'sifu',2,'sifu','EEc694FtWEr4m7i82NVvig==','NORMAL','MALE',NULL,'13800138000','11@qq.com','yanlei','2017-05-27 07:48:30',NULL,'2017-05-27 07:48:30',NULL,NULL,NULL),(327,'test-yl',2,'云流测试','jl5z/+mdNAusB9Y85XTvOA==','DELETED','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-05-31 01:58:13',NULL,'2017-05-31 01:48:15',NULL,NULL,NULL),(328,'yuliu-test',2,'云流-测试账号','LxJv8q1Qir7p2swswmSHoA==','DELETED','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-05-31 02:30:15',NULL,'2017-05-31 02:16:09',NULL,NULL,NULL),(329,'yunliu-buchong',2,'云流-补充账号','Kxqzw67DxZFO8FoPykZPEQ==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-05-31 02:19:14',NULL,'2017-05-31 02:19:14',NULL,NULL,NULL),(330,'yunliu-test',2,'云流-测试账号','3GefCMmHpBgIQ5zAEytQRg==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-05-31 02:35:34',NULL,'2017-05-31 02:35:34',NULL,NULL,NULL),(331,'yunliu-jstest',2,'云流-技术测试账号','f2Qf/pwatclmsnYs8a8Ztw==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-05-31 04:22:26',NULL,'2017-05-31 04:22:26',NULL,NULL,NULL),(332,'qianxingsn',2,'千行你我科技有限公司-省内','l+02j/Wrj/zdqwJClE705g==','NORMAL','MALE',NULL,'13989109920','leixs@100bm.cn','kangqiong','2017-06-01 04:23:14',NULL,'2017-06-01 04:23:14',NULL,NULL,NULL),(333,'zhongzhengtongxun',2,'中正通讯','aNxvVTv0FnNIxP2EUdzdxQ==','NORMAL','MALE',NULL,'18616365242','52445078@qq.com','zliting','2017-06-01 06:37:25',NULL,'2017-06-20 03:18:31',NULL,NULL,NULL),(334,'xianzhishuju',2,'先知数据','ZgNpYsvTuEC4HCfCJonykA==','NORMAL','MALE',NULL,'15210862575','Zhongshan@blueplus.cc','zliting','2017-06-01 06:44:19',NULL,'2017-06-01 06:44:19',NULL,NULL,NULL),(335,'jilinydhd',2,'吉林移动活动','4grVB/M5dEs2lfN4Pqdnpw==','NORMAL','MALE',NULL,'12346678900','123@qq.vom','kangqiong','2017-06-01 09:28:30',NULL,'2017-06-01 09:28:30',NULL,NULL,NULL),(336,'huaxin-fs',2,'北京华信-分省','1r7jDJG6c26wlAcEcsadVQ==','NORMAL','MALE',NULL,'13911020289','Liwx@huaxincloud.com','caihuilian','2017-06-05 01:59:13',NULL,'2017-06-05 02:01:04',NULL,NULL,NULL),(337,'shuoruanfenshengmy',2,'硕软-分省漫游','K4IG0DT7ncBdZiuv//U8lA==','NORMAL','MALE',NULL,'15767668286','kejian.wu@sohan.hk','zliting','2017-06-12 08:53:35',NULL,'2017-06-15 11:23:09',NULL,NULL,NULL),(338,'shanghaiyuanju',2,'上海缘聚','aI/K/hpX5grPsnrkThgI8g==','NORMAL','MALE',NULL,'15123413654','2881623135@qq.com','caihuilian','2017-06-05 07:25:24',NULL,'2017-06-06 04:19:41',NULL,NULL,NULL),(339,'wuhanchoumou',2,'武汉筹谋','GJq2+r0RV1A8J2dZs2OMlg==','NORMAL','MALE',NULL,'13476291601','liuss@cmthink.cn','caihuilian','2017-06-06 07:50:21',NULL,'2017-06-20 03:18:08',NULL,NULL,NULL),(340,'choumoufs',2,'武汉筹谋-分省','cs7gTxxliXom5f0E+qTdEA==','NORMAL','MALE',NULL,'13554095584','liuss@cmthink.cn','wuzimei','2017-06-06 08:31:14',NULL,'2017-06-20 03:17:41',NULL,NULL,NULL),(341,'youchuang',2,'智盈优创','gVM2IdJKKcpTFnVdKitxHA==','NORMAL','MALE',NULL,'18129876835','635249394@qq.com','wuzimei','2017-06-06 11:24:30',NULL,'2017-06-20 03:16:06',NULL,NULL,NULL),(342,'xingfan',2,'杭州木互星泛','btCurdDPlWLx0XKH5OjHxw==','NORMAL','MALE',NULL,'18758275798','596260725@qq.com','wuzimei','2017-06-06 12:19:54',NULL,'2017-06-20 03:15:44',NULL,NULL,NULL),(343,'luojiweiye',2,'落基伟业','PmUdosrXFjJbLBDMH9Z6Ng==','NORMAL','MALE',NULL,'17862866058','jya@wo10010.com','zliting','2017-06-07 06:59:18',NULL,'2017-06-20 03:17:13',NULL,NULL,NULL),(344,'hutian',2,'湖天','f+bKZg+vidh2OoiG0ZyzmA==','NORMAL','MALE',NULL,'15116109645','757606828@qq.com','zliting','2017-06-07 07:39:25',NULL,'2017-06-20 03:14:04',NULL,NULL,NULL),(345,'sanji',2,'三际','VioshtzWynNwrSC4NmsFZA==','NORMAL','MALE',NULL,'13589029851','3582251662@qq.com','zliting','2017-06-07 07:58:16',NULL,'2017-06-20 03:13:04',NULL,NULL,NULL),(346,'shuolang',2,'硕朗','JaZP43yipyX/z53numh4Sg==','NORMAL','MALE',NULL,'18137193787','2725797189@qq.com','zliting','2017-06-07 08:43:12',NULL,'2017-06-20 03:12:45',NULL,NULL,NULL),(347,'younakang',2,'南京尤纳康','ltT+Zr9kzVe11w8RNlrqXw==','NORMAL','MALE',NULL,'13675178612','1679215137@qq.com','wuzimei','2017-06-08 04:00:01',NULL,'2017-06-08 07:45:11',NULL,NULL,NULL),(348,'tengxunyunfs',2,'腾讯云-分省','+a2wJ8VrwkRaIV9A8frG3Q==','NORMAL','MALE',NULL,'18680391105','louishliu@tencent.com','wuzimei','2017-06-09 03:07:08',NULL,'2017-06-09 03:07:08',NULL,NULL,NULL),(349,'feidu',2,'飞度','pM+Mfm2N7PvlAr+eM1H7eQ==','NORMAL','MALE',NULL,'18049099016','83458613@qq.com','zliting','2017-06-12 03:35:24',NULL,'2017-06-12 03:35:24',NULL,NULL,NULL),(350,'xinghai',2,'星海华天','iB57B1AISKUS7Fi57MdPxA==','NORMAL','MALE',NULL,'15972065397','2752299815@qq.com','kangqiong','2017-06-13 03:19:34',NULL,'2017-07-05 02:04:22',NULL,NULL,NULL),(351,'xinghaihuatianfs',2,'星海华天-分省','2sEgL9SzsmThzFGonyBWkQ==','NORMAL','MALE',NULL,'15972065397','2752299815@qq.com','zliting','2017-06-14 10:29:43',NULL,'2017-07-05 02:04:10',NULL,NULL,NULL),(352,'youxinshuma',2,'友欣数码','3+IRo+CY1jOxLcl3P1dt3g==','NORMAL','MALE',NULL,'18754420601','651683491@qq.com','caihuilian','2017-06-15 04:20:12',NULL,'2017-06-15 04:20:12',NULL,NULL,NULL),(353,'maiersiqg',2,'麦尔斯动-全国','PBQedQNhVs66k33GwNh8HA==','NORMAL','MALE',NULL,'13654948888','3001334971@qq.com','nizhi','2017-06-15 06:15:42',NULL,'2017-06-15 06:15:42',NULL,NULL,NULL),(354,'maiersibd',2,'麦尔斯动-本地','8rxMZkdADgKVUDPF6fojcw==','NORMAL','MALE',NULL,'13654948888','3001334971@qq.com','nizhi','2017-06-15 06:26:16',NULL,'2017-06-15 06:26:16',NULL,NULL,NULL),(355,'yuanfen',2,'缘分科技','tBLzOYC7/sGQft9fQf0ksA==','NORMAL','MALE',NULL,'13413435710','1126801209@qq.com','wuzimei','2017-06-15 11:25:16',NULL,'2017-06-15 11:25:16',NULL,NULL,NULL),(356,'baqisuo',2,'巴奇索','OHDtYv9iDIRaXM24gRUBYw==','NORMAL','MALE',NULL,'15201386756','912068586@qq.com','caihuilian','2017-06-16 02:15:00',NULL,'2017-06-16 02:15:00',NULL,NULL,NULL),(357,'longming',2,'隆明','Ib05In78mH59LReqNcRICg==','NORMAL','MALE',NULL,'17512556699','8939069@qq.com','zliting','2017-06-16 03:01:27',NULL,'2017-06-16 03:01:27',NULL,NULL,NULL),(358,'mingzhen',2,'俊鹏明臻','cN8tsAOpZt0o1dd8uXvzow==','NORMAL','MALE',NULL,'13902299111','412683004@qq.com','wuzimei','2017-06-16 11:53:05',NULL,'2017-06-16 11:53:05',NULL,NULL,NULL),(359,'yrzxqg',2,'亿人全国N','u9RHJ+vZ6AgrmBI2WHtszA==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2017-06-20 08:10:27',NULL,'2017-06-20 08:10:27',NULL,NULL,NULL),(360,'yrzxfs',2,'亿人分省N','qExo/XpiT/rgCY6W6LXLcw==','NORMAL','MALE',NULL,'12312312312','123@123','nizhi','2017-06-20 08:12:42',NULL,'2017-06-20 08:12:42',NULL,NULL,NULL),(361,'swgy',2,'商务公用','VfREzALfmWOit7QCyknP9w==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-06-20 09:05:41',NULL,'2017-06-20 09:05:41',NULL,NULL,NULL),(362,'zhongyefs',2,'中业-分省','bzqjgmBuFcGmAZHU8byDmQ==','NORMAL','MALE',NULL,'13838121562','Yangmaoqing@zoneyet','zliting','2017-06-21 06:51:19',NULL,'2017-06-21 06:51:19',NULL,NULL,NULL),(363,'jiangxishanshui',2,'江西山水','i7FIQIS3WwESLFbjidqHqw==','NORMAL','MALE',NULL,'17779530922','646531207@qq.com','caihuilian','2017-06-21 08:08:48',NULL,'2017-06-21 08:08:48',NULL,NULL,NULL),(364,'hefeisandian',2,'合肥三点','6y+XrDkPB73UnhurkCeM6Q==','NORMAL','MALE',NULL,'18298005273','2282872012@qq.com','caihuilian','2017-06-22 02:07:07',NULL,'2017-06-23 08:33:16',NULL,NULL,NULL),(365,'zhongyuangdichan',2,'中原地产','bNQvbJdqZqZgvWdw3sw6aA==','NORMAL','MALE',NULL,'15986654352','119985071@qq.com','caihuilian','2017-06-22 03:36:26',NULL,'2017-06-22 03:36:26',NULL,NULL,NULL),(366,'yuanmaifs',2,'杭州元迈-分省','ZVCdo4fryGR9B0us1VFj9A==','NORMAL','MALE',NULL,'18257980151','123456@qq.com','caihuilian','2017-06-22 08:42:04',NULL,'2017-07-09 05:47:44',NULL,NULL,NULL),(367,'yunlianhui',2,'云联惠','PsDrE4zQdRLYlTLlFdKXuA==','NORMAL','MALE',NULL,'13502268006','1738016641@qq.com','zliting','2017-06-22 08:52:15',NULL,'2017-06-22 08:52:15',NULL,NULL,NULL),(368,'jiangxiyingchuan',2,'江西颍川','9slJRytHhhi7j1WBzv20NQ==','NORMAL','MALE',NULL,'18970027021','963001860@qq.com','caihuilian','2017-06-22 09:09:24',NULL,'2017-06-22 09:09:24',NULL,NULL,NULL),(369,'shanghaixuntinqg',2,'上海讯廷-全国','0c170tMQXHU8dUh+Oi0piA==','NORMAL','MALE',NULL,'13816582911','ady_wwang@163.com','nizhi','2017-06-23 08:48:05',NULL,'2017-06-23 08:48:05',NULL,NULL,NULL),(370,'jutongdafs',2,'北京聚通达科技-分省','6jEQmAqWJ56GsTqE+1AFxQ==','NORMAL','MALE',NULL,'13810810155','123@123','nizhi','2017-06-27 10:18:46',NULL,'2017-06-28 09:25:45',NULL,NULL,NULL),(371,'shanghaiyuanjufs',2,'上海缘聚-分省','KieqBqgz3siAZOu2BusB5g==','NORMAL','MALE',NULL,'15123413654','2881623135@qq.com','caihuilian','2017-06-29 04:38:46',NULL,'2017-06-29 04:38:46',NULL,NULL,NULL),(372,'wuliantianxia',2,'物联天下','KqkNi7xoc46/5ohddjGNcQ==','NORMAL','MALE',NULL,'18610550739','yangzi@montnets.com','caihuilian','2017-06-30 06:14:47',NULL,'2017-06-30 06:14:47',NULL,NULL,NULL),(373,'wuliantianxiafs',2,'物联天下-分省','J69g++NFL7RyOPq4Wy8SlA==','NORMAL','MALE',NULL,'18610550739','yangzi@montnets.com','caihuilian','2017-06-30 06:23:19',NULL,'2017-06-30 06:23:19',NULL,NULL,NULL),(374,'soulang',2,'南昌搜浪','50iu3wZsZUAixQSAGQbrJA==','NORMAL','MALE',NULL,'15679161907','1422834166@qq.com','wuzimei','2017-07-03 07:07:00',NULL,'2017-07-03 07:07:00',NULL,NULL,NULL),(375,'baqi',2,'广州巴奇索','XMT2mW25MeJqquja1CGOWA==','NORMAL','MALE',NULL,'18657828778','479794164@qq.com','wuzimei','2017-07-18 01:18:05',NULL,'2017-07-18 01:18:05',NULL,NULL,NULL),(376,'jinmudan',2,'惠州金牡丹','d4KCggv8dmw0fx7zWbctzA==','NORMAL','MALE',NULL,'18666039009','2394469818@qq.com','wuzimei','2017-07-04 03:19:06',NULL,'2017-07-04 03:19:06',NULL,NULL,NULL),(377,'yikayi',2,'一卡易科技','DPvEwfvuvMWg6oHxoQcWmg==','NORMAL','MALE',NULL,'15989324087','1746672185@qq.com','nizhi','2017-07-04 03:51:41',NULL,'2017-07-04 03:51:41',NULL,NULL,NULL),(378,'zhangcongqg',2,'浙江掌聪','KDOsplBWaogwXew50TQPGg==','NORMAL','MALE',NULL,'13666623787','176059577@qq.com','wuzimei','2017-07-19 02:45:24',NULL,'2017-07-19 02:45:24',NULL,NULL,NULL),(379,'zhangcongfs',2,'浙江掌聪-分省','uoC5aex+IKlNgRATG+UhBw==','NORMAL','MALE',NULL,'13666623787','176059577@qq.com','wuzimei','2017-07-19 02:43:10',NULL,'2017-07-19 02:43:10',NULL,NULL,NULL),(380,'dadangjiacs',2,'大当家测试','DL7TKLFPZjCH8vBVsG06Cw==','NORMAL','MALE',NULL,'13800138000','11@qq.com','chenjing','2017-07-04 06:45:51',NULL,'2017-07-04 06:45:51',NULL,NULL,NULL),(381,'feitianqg',2,'飞天-全国','yiAV3zhxHgmAzgat1yqaZA==','NORMAL','MALE',NULL,'18501236042','wangbowei@ftjw.cn','wuzimei','2017-07-04 09:11:13',NULL,'2017-07-04 09:11:13',NULL,NULL,NULL),(382,'feitianfs',2,'飞天-分省','amIilp576Qel6BsH93JQvA==','NORMAL','MALE',NULL,'18501236042','wangbowei@ftjw.cn','wuzimei','2017-07-04 09:14:38',NULL,'2017-07-04 09:14:38',NULL,NULL,NULL),(383,'yunjin',2,'云金','5GVaWOfYWMPW2+zlPjx6zg==','NORMAL','MALE',NULL,'13248884444','2422075524@qq.com','nizhi','2017-07-04 09:22:52',NULL,'2017-07-04 09:22:52',NULL,NULL,NULL),(384,'yaxiangzhongtian',2,'yaxiangzhongtian','ekFOyP39H0b/Xd5LbkHdgA==','NORMAL','MALE',NULL,'15629115665','751419871@qq.com','zliting','2017-07-04 10:54:54',NULL,'2017-07-04 10:54:54',NULL,NULL,NULL),(385,'chenxiang',2,'深圳晨祥','/7I1B3+dAPbWV/OuFd+UyA==','NORMAL','MALE',NULL,'13242962217','wangds@cxinfox.com','wuzimei','2017-07-05 08:06:12',NULL,'2017-07-05 08:06:12',NULL,NULL,NULL),(386,'weiyunbailian',2,'微云佰联','cm4cHyowJls32EwaJfHkBg==','NORMAL','MALE',NULL,'13910968502','517502585@qq.com','kangqiong','2017-07-05 10:35:36',NULL,'2017-07-05 10:35:36',NULL,NULL,NULL),(387,'weiguantianx',2,'微观天下','0chd6p0Q3dw3FQcqr9VNXQ==','NORMAL','MALE',NULL,'13366633653','zyb@xunkasoft.com','nizhi','2017-07-05 11:47:45',NULL,'2017-07-05 11:47:45',NULL,NULL,NULL),(388,'youpengfs',2,'陈鑫','quvTylT7ubsHKGf5bVPwrg==','NORMAL','MALE',NULL,'17674133337','845156564@qq.com','zliting','2017-07-06 04:03:13',NULL,'2017-07-06 04:03:55',NULL,NULL,NULL),(389,'feineng',2,'飞能','aOL9JGYuAoHZiNJiETfV5A==','NORMAL','MALE',NULL,'13777834722','dorothy.wu@mopo.com','zliting','2017-07-06 06:32:13',NULL,'2017-07-06 06:32:13',NULL,NULL,NULL),(390,'sifubendibao',2,'思赋本地包','Rb7bqqeeCXZc4Cde5Invrw==','NORMAL','MALE',NULL,'13800138000','11@qq.com','yanlei','2017-07-06 06:52:31',NULL,'2017-07-06 06:52:31',NULL,NULL,NULL),(391,'xingyichu',2,'星依橱','36ACK28+9GXHYFqZ8omWyQ==','NORMAL','MALE',NULL,'18665858415','2853900827@qq.com','caihuilian','2017-07-06 07:23:42',NULL,'2017-07-06 07:23:42',NULL,NULL,NULL),(392,'feinengfs',2,'飞能-分省','1OBFzeDZJCvXtQqCcqcLpg==','NORMAL','MALE',NULL,'13777834722','dorothy.wu@mopo.com','zliting','2017-07-06 07:23:54',NULL,'2017-07-06 07:23:54',NULL,NULL,NULL),(393,'dasheng',2,'大生','uhlT690lKZaQIuAfeBpfvg==','NORMAL','MALE',NULL,'13579526188','517502585@qq.com','caihuilian','2017-07-06 07:35:33',NULL,'2017-07-06 07:35:33',NULL,NULL,NULL),(394,'tongrenyiyao',2,'同仁医药','ADzn+MICYSYMFC/A6yJdmw==','NORMAL','MALE',NULL,'18959356675','3001997467@qq.com','zliting','2017-07-06 07:35:44',NULL,'2017-07-06 07:35:44',NULL,NULL,NULL),(395,'suzhouyouniu',2,'苏州优牛','MwZA4GYjqg6opVwJpe13qQ==','NORMAL','MALE',NULL,'15195681254','767122417@qq.com','caihuilian','2017-07-06 10:16:24',NULL,'2017-07-06 10:16:24',NULL,NULL,NULL),(396,'zhishangqg',2,'智尚-全国','QDaeFvGdjMOPeQ5s4EVJ/g==','NORMAL','MALE',NULL,'15665790064','785513644@qq.com','zliting','2017-07-07 02:18:09',NULL,'2017-07-07 02:18:09',NULL,NULL,NULL),(397,'xichengfs',2,'西城-分省','/6xqnCLivvPhRkEBn7oPUg==','NORMAL','MALE',NULL,'18620300620','123@123','zliting','2017-07-07 06:36:49',NULL,'2017-07-18 07:27:06',NULL,NULL,NULL),(398,'sanjifs',2,'三际-分省','F/K64J5FLq4MX/LkomQKJg==','NORMAL','MALE',NULL,'13589029851','3582251662@qq.com','zliting','2017-07-07 10:11:49',NULL,'2017-07-07 10:11:49',NULL,NULL,NULL),(399,'maisituo',2,'迈斯拓','VdYpHZY0dzJeXqDv2ZPZtg==','NORMAL','MALE',NULL,'13917788681','601231617@qq.com','nizhi','2017-07-09 09:30:49',NULL,'2017-07-09 09:30:49',NULL,NULL,NULL),(400,'fenghuohd',2,'烽火活动账户','zM7+Rn8QUg8uzweMsN4+fA==','NORMAL','MALE',NULL,'13810996625','yoult@ifeng.com','wuzimei','2017-07-17 03:22:51',NULL,'2017-07-17 03:22:51',NULL,NULL,NULL),(401,'maiyihd',2,'迈异-活动账号','SWl3i87+Gd3/lf1VCtN6lw==','NORMAL','MALE',NULL,'18620300620','18620300620@QQ.com','zliting','2017-07-10 08:34:33',NULL,'2017-07-10 08:34:33',NULL,NULL,NULL),(402,'shengjie',2,'胜杰','XmLEXiZPPtxPudaYAIYnhA==','NORMAL','MALE',NULL,'18974994766','807356148@qq.com','caihuilian','2017-07-10 08:44:07',NULL,'2017-07-13 04:07:44',NULL,NULL,NULL),(403,'hanyi',2,'菡奕通信','N/N6sTB/yamy50duo9bGaA==','NORMAL','MALE',NULL,'18902303479','hacket@qq.com','wuzimei','2017-07-11 01:57:37',NULL,'2017-07-11 01:57:37',NULL,NULL,NULL),(404,'yixiao',2,'义晓网络','IE0R8evc+9wXEcJ8I6pyKA==','NORMAL','MALE',NULL,'18616697809','tongyw@yiroaming.com','nizhi','2017-07-11 04:25:09',NULL,'2017-07-11 04:25:09',NULL,NULL,NULL),(405,'jianuo',2,'四川佳诺','XLoTjKP+VZknoNvg0B1hUg==','NORMAL','MALE',NULL,'13330851855','gongjuan@scjnxx.com','wuzimei','2017-07-11 06:39:02',NULL,'2017-07-11 06:39:02',NULL,NULL,NULL),(406,'aipipi',2,'上海哎媲媲','FobiH+HqeaEGBjsRnQl5fA==','NORMAL','MALE',NULL,'15281002664','15281002664@qq.com','wuzimei','2017-07-11 08:49:46',NULL,'2017-07-11 08:49:46',NULL,NULL,NULL),(407,'nangjingzhuotingfs',2,'南京卓霆-分省','m0ppyPgbZ20e+TUI43SSBQ==','NORMAL','MALE',NULL,'13805185504','13805185504@139.com','caihuilian','2017-07-11 10:42:47',NULL,'2017-07-11 10:42:47',NULL,NULL,NULL),(408,'aipipifs',2,'上海哎媲媲-分省','mzpa3fSSyUYfYA4IRJGMbw==','NORMAL','MALE',NULL,'15281002664','15281002664@qq.com','wuzimei','2017-07-12 03:45:20',NULL,'2017-07-12 03:45:20',NULL,NULL,NULL),(409,'meiqi',2,'美奇网络科技','Ka1IsL4RyTmsqcvr2BYPPw==','NORMAL','MALE',NULL,'18838458888','653124@qq.com','wuzimei','2017-07-12 04:09:45',NULL,'2017-07-12 04:09:45',NULL,NULL,NULL),(410,'feilong',2,'武汉飞龙鼎讯','xYWjrV8V0vcI+dN11OlJsg==','NORMAL','MALE',NULL,'13995591669','165299567@qq.com','wuzimei','2017-07-12 07:02:49',NULL,'2017-07-12 07:02:49',NULL,NULL,NULL),(411,'yisuqg',2,'易速通信','ZKEd5fnpDxbK9Ly4FF7+Pg==','NORMAL','MALE',NULL,'13128517871','604351958@qq.com','wuzimei','2017-07-12 09:05:45',NULL,'2017-07-12 09:05:45',NULL,NULL,NULL),(412,'yisufs',2,'易速通信-分省','Zp8eMU0br3jdz71unoc0lQ==','NORMAL','MALE',NULL,'13128517871','604351958@qq.com','wuzimei','2017-07-12 09:12:04',NULL,'2017-07-12 09:12:04',NULL,NULL,NULL),(413,'zhangutongxin',2,'战鼓通信','hcfvmUOsy1rjlXXNyE52Wg==','NORMAL','MALE',NULL,'15607063065','3568635095@qq.com','nizhi','2017-07-13 09:54:56',NULL,'2017-07-13 09:54:56',NULL,NULL,NULL),(414,'yixiaofs',2,'义晓网络-分省','zTLw9sdKIA4RwatFV4mKSg==','NORMAL','MALE',NULL,'18616697809','tongyw@yiroaming.com','wuzimei','2017-07-14 02:20:41',NULL,'2017-07-14 02:20:41',NULL,NULL,NULL),(415,'wuhanyunfeidian',2,'武汉云沸点','Ws9fn7FpIDvalw32ok6PhQ==','NORMAL','MALE',NULL,'13958428859','771606885@qq.com','caihuilian','2017-07-14 06:23:34',NULL,'2017-07-14 06:23:34',NULL,NULL,NULL),(416,'xinhaofs',2,'新号吧-分省','RXFxbkLNVypNotJVSARFuA==','NORMAL','MALE',NULL,'13620222002','2531528666@qq.com','caihuilian','2017-08-02 08:55:35',NULL,'2017-08-02 08:55:35',NULL,NULL,NULL),(417,'xiaohe',2,'小和','fGUCezc9Offok2mawrsQ1g==','NORMAL','MALE',NULL,'13371285560','2682009952@qq.com','caihuilian','2017-07-15 04:23:18',NULL,'2017-07-15 04:23:18',NULL,NULL,NULL),(418,'hongzhaoshiye',2,'宏兆实业','a7dVyAfcVzHtxVghPW0oYw==','NORMAL','MALE',NULL,'13418460347','luosuzhen@hongzhao.com','caihuilian','2017-07-17 03:46:48',NULL,'2017-07-17 03:46:48',NULL,NULL,NULL),(419,'zhaoyong',2,'山东兆永','dp1hkoFl6qphpURUyowqEw==','NORMAL','MALE',NULL,'13864035333','13864035333@139.com','wuzimei','2017-07-18 03:59:59',NULL,'2017-07-18 03:59:59',NULL,NULL,NULL),(420,'lusenhuitong',2,'成都鹭森汇通','7mVyl7q7bHv7zlklICoiWQ==','NORMAL','MALE',NULL,'13890289448','1083121487@qq.com','wuzimei','2017-07-18 07:44:15',NULL,'2017-07-18 07:44:15',NULL,NULL,NULL),(421,'ranxing',2,'冉星','qR0S2TARykotuMd0KwGfZw==','NORMAL','MALE',NULL,'18758927832','renyajun@wjx.cn','caihuilian','2017-07-18 07:47:16',NULL,'2017-07-18 07:47:16',NULL,NULL,NULL),(422,'wenhoushuma',2,'汶厚数码','EhMmDqRqjkJZINpxuoA5GA==','NORMAL','MALE',NULL,'17620118186','284408088@qq.com','caihuilian','2017-07-18 11:12:30',NULL,'2017-07-18 11:12:30',NULL,NULL,NULL),(423,'lutong',2,'济南鲁通','xLRQ3Cp4S70oZB5paYpa0w==','NORMAL','MALE',NULL,'15762363651','172836555@qq.com','wuzimei','2017-07-19 07:09:05',NULL,'2017-07-19 07:47:02',NULL,NULL,NULL),(424,'kuantong',2,'湖北宽通科技','zQAJ5WQiVsDNbMuyqgFQ4A==','NORMAL','MALE',NULL,'18672345015','limin@vstime.cn','wuzimei','2017-07-19 07:17:55',NULL,'2017-07-19 07:17:55',NULL,NULL,NULL),(425,'kuantongfs',2,'湖北宽通科技-分省','rAGBCo6FB4BkYFjzZf3xPw==','NORMAL','MALE',NULL,'18672345015','limin@vstime.cn','wuzimei','2017-07-19 09:57:19',NULL,'2017-07-19 09:57:19',NULL,NULL,NULL),(426,'benxiong',2,'笨熊','ldBXZTnQ4vIrZJXYTR6zmQ==','NORMAL','MALE',NULL,'18607380966','328078586@qq.com','zliting','2017-07-24 11:24:56',NULL,'2017-07-25 01:52:30',NULL,NULL,NULL),(427,'renzhiqg',2,'仁智-全国','Cz6iJDN4m+CWKnYitIRoLA==','NORMAL','MALE',NULL,'18938655389','1130951515@qq.com','zliting','2017-07-20 11:28:53',NULL,'2017-07-24 02:40:57',NULL,NULL,NULL),(428,'renzhifs',2,'仁智-分省','eqrSf0N7BqAL5QIWwB3fMA==','NORMAL','MALE',NULL,'18938655389','1130951515@qq.com','zliting','2017-07-20 03:54:37',NULL,'2017-07-20 03:54:37',NULL,NULL,NULL),(429,'lutongfs',2,'鲁通-分省','0dZf9OK7BRZ58P7ffDi8zQ==','NORMAL','MALE',NULL,'15762363651','172836555@qq.com','zliting','2017-07-21 02:37:19',NULL,'2017-07-21 02:37:19',NULL,NULL,NULL),(430,'lusenhuitongqg',2,'成都鹭森汇通-全国','wfKuMVg7tPpwajadMCKAwQ==','NORMAL','MALE',NULL,'13890289448','1083121487@qq.com','caihuilian','2017-07-21 07:09:04',NULL,'2017-07-21 07:09:04',NULL,NULL,NULL),(431,'zhangufs',2,'战鼓-分省','9MS36bTh17bUKZ+9qOxMGQ==','NORMAL','MALE',NULL,'15607063065','3568635095@qq.com','zliting','2017-07-24 02:56:17',NULL,'2017-07-24 02:56:17',NULL,NULL,NULL),(432,'测试测试',2,'测试测试','PhuMdqehLv35TvJiq/ue7A==','DELETED','MALE',NULL,'13546278913','4508873@qq.com,6358778159@qq.com,4578618@qq.com','fmp-admin','2017-07-25 03:19:30',NULL,'2017-07-25 03:19:28',NULL,NULL,NULL),(433,'benxiongfs',2,'笨熊-分省','2yha16g1OCC9TbQss8DA3Q==','NORMAL','MALE',NULL,'18607380966','328078586@qq.com','caihuilian','2017-07-25 04:19:46',NULL,'2017-07-25 04:19:46',NULL,NULL,NULL),(434,'chuzhongfs',2,'出众-分省','V+oTNR0mznO67FRCYRtohA==','NORMAL','MALE',NULL,'15016707977','wuyang@szchuzhong.com','zliting','2017-07-25 08:11:41',NULL,'2017-07-25 08:11:41',NULL,NULL,NULL),(435,'xiaomaoyouqg',2,'小猫鼬-全国','Q9zLVLM3ifadtsOI6Z0svg==','NORMAL','MALE',NULL,'13871435583','3345899229@qq.com','zliting','2017-07-25 09:25:38',NULL,'2017-07-25 09:25:38',NULL,NULL,NULL),(436,'xiaomaoyoufs',2,'小猫鼬-分省','L3LeMsKpUnQboA5p+Y0tSg==','NORMAL','MALE',NULL,'13871435583','3345899229@qq.com','zliting','2017-07-25 09:31:46',NULL,'2017-07-25 09:31:46',NULL,NULL,NULL),(437,'jirong',2,'吉融','HZBCF0YQmCXsrveYr7MGSg==','NORMAL','MALE',NULL,'13305165095','shjr_zjb@163.com','zliting','2017-07-26 06:14:02',NULL,'2017-07-26 06:14:02',NULL,NULL,NULL),(438,'shenchuanhudong',2,'深传互动','d+A3BDNzk5Wm7ByPDW8q5Q==','NORMAL','MALE',NULL,'13242090703','1532581669@qq.com','zliting','2017-07-26 06:45:00',NULL,'2017-07-26 06:45:00',NULL,NULL,NULL),(439,'yunliuhd',2,'云流活动','MVMIVm5Epmd08lZUB4445g==','NORMAL','MALE',NULL,'12312312312','123123123@qq.com','zliting','2017-07-26 10:29:46',NULL,'2017-07-26 10:29:46',NULL,NULL,NULL),(440,'puchuang',2,'普创','7t+lYeVKUfUHRq/KmFhInw==','NORMAL','MALE',NULL,'13760414348','liuyy@ie-link.com','caihuilian','2017-07-27 04:50:11',NULL,'2017-07-27 04:59:41',NULL,NULL,NULL),(441,'guojiang',2,'果酱时代','unyqVxWN77zH3b5pniiIFw==','NORMAL','MALE',NULL,'15817346814','ada@guojiang.tv','caijiali','2017-07-28 07:45:32',NULL,'2017-08-04 04:05:16',NULL,NULL,NULL),(442,'tiantiandui',2,'天天兑','JSjJxzUi1rmpLpKqQYWDfg==','NORMAL','MALE',NULL,'13620985637','1277301679@qq.com','caijiali','2017-08-02 06:21:59',NULL,'2017-08-02 06:39:26',NULL,NULL,NULL),(443,'tonghexi',2,'同和曦','JNu52pe+LtsT2o+pjmLFfA==','NORMAL','MALE',NULL,'13725505692','13424251561@139.com','caijiali','2017-08-02 06:39:18',NULL,'2017-08-02 06:39:18',NULL,NULL,NULL),(444,'liutian',2,'流田','jCAIndO4NXtMjNoHkdpIzw==','NORMAL','MALE',NULL,'13527790475','chenxianlong@qq.com','caijiali','2017-08-02 09:29:04',NULL,'2017-08-02 09:29:04',NULL,NULL,NULL),(445,'jinankunshi-hd',2,'济南坤石-活动','+jaAmNiTlf6HR4txictuxg==','NORMAL','MALE',NULL,'18653186868','13953124111@139.com','caihuilian','2017-08-02 07:58:08',NULL,'2017-08-07 01:38:55',NULL,NULL,NULL),(446,'yunxu',2,'云旭','taMc2ODa6g53FQB5foPohA==','NORMAL','MALE',NULL,'15811888036','692741439@qq.com','caijiali','2017-08-02 09:37:55',NULL,'2017-08-02 09:37:55',NULL,NULL,NULL),(447,'chuangzhiwuxian',2,'创智无限','tw0cJGOwRgGn3GabTv3sbA==','NORMAL','MALE',NULL,'15811102364','709195945@qq.com','caijiali','2017-08-03 04:01:04',NULL,'2017-08-03 04:01:04',NULL,NULL,NULL),(448,'sanchuang',2,'三创','UXzv4pBCzZN5lsWr4zHUvg==','NORMAL','MALE',NULL,'13733395088','537777466@qq.com','zliting','2017-08-03 04:23:21',NULL,'2017-08-03 04:23:21',NULL,NULL,NULL),(449,'sanchuangfs',2,'三创-分省','b2fq42FhkVJ0gIrfDf0g7w==','NORMAL','MALE',NULL,'13733395088','537777466@qq.com','zliting','2017-08-03 09:04:17',NULL,'2017-08-03 09:04:17',NULL,NULL,NULL),(450,'jingliu',2,'竟流','rahy/CFLf2+MmuUzCWkI0A==','DELETED','MALE',NULL,'13564208304','adminsc@shjingliu.net','caijiali','2017-08-04 03:14:03',NULL,'2017-08-04 03:07:46',NULL,NULL,NULL),(451,'jingliuqg',2,'竞流','MUynCXZpuhTeV/ppk3kENg==','NORMAL','MALE',NULL,'13564208304','adminsc@shjingliu.net','caijiali','2017-08-04 03:20:42',NULL,'2017-08-04 03:20:42',NULL,NULL,NULL),(452,'juyang',2,'聚阳网络','HUbUi4Yx+cxsfHEZGmaYIg==','NORMAL','MALE',NULL,'18175148717','524681429@qq.com','caijiali','2017-08-08 03:42:56',NULL,'2017-08-08 03:42:56',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sec_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_staff_department_role`
--

DROP TABLE IF EXISTS `sec_staff_department_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_staff_department_role` (
  `STAFF_ID` bigint(20) NOT NULL COMMENT '成员ID',
  `DEPARTMENT_ID` bigint(16) NOT NULL COMMENT '组织ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员组织角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_staff_department_role`
--

LOCK TABLES `sec_staff_department_role` WRITE;
/*!40000 ALTER TABLE `sec_staff_department_role` DISABLE KEYS */;
INSERT INTO `sec_staff_department_role` VALUES (-999,-998,1),(1,1,5),(8,2,6),(12,2,6),(21,2,6),(23,2,6),(25,2,6),(26,2,6),(27,2,6),(28,2,6),(29,2,6),(30,2,6),(31,2,6),(32,2,6),(33,2,6),(34,2,6),(35,2,6),(37,2,6),(38,2,6),(39,2,6),(40,2,6),(41,2,6),(42,2,6),(43,2,6),(44,2,6),(45,2,6),(46,2,6),(47,2,6),(48,2,6),(240,2,6),(241,2,6),(242,2,6),(243,2,6),(244,2,6),(245,2,6),(246,2,6),(247,2,6),(36,2,8),(249,2,6),(158,2,7),(250,2,6),(251,2,6),(252,2,6),(255,2,6),(256,2,6),(257,2,6),(258,2,6),(259,2,6),(260,2,6),(261,2,6),(262,2,6),(263,2,6),(264,2,6),(265,2,6),(266,2,6),(267,2,6),(268,2,6),(269,2,6),(270,2,6),(271,2,6),(272,2,6),(273,2,6),(274,2,6),(277,2,6),(278,2,6),(279,2,6),(281,2,6),(282,2,6),(283,2,6),(284,2,6),(287,2,6),(288,2,6),(291,2,6),(292,2,6),(293,2,6),(294,2,6),(295,2,6),(297,2,6),(298,2,6),(299,2,6),(300,2,6),(302,2,6),(303,2,6),(304,2,6),(306,2,6),(307,2,6),(308,2,6),(309,2,6),(310,2,6),(312,2,6),(313,2,6),(314,2,6),(315,2,6),(316,2,6),(317,2,6),(318,2,6),(319,2,6),(320,2,6),(321,2,6),(322,2,6),(323,2,6),(324,2,6),(325,2,6),(326,2,6),(329,2,6),(330,2,6),(331,2,6),(332,2,6),(333,2,6),(334,2,6),(335,2,6),(336,2,6),(337,2,6),(338,2,6),(339,2,6),(340,2,6),(341,2,6),(342,2,6),(343,2,6),(344,2,6),(345,2,6),(346,2,6),(347,2,6),(348,2,6),(349,2,6),(350,2,6),(311,2,8),(351,2,6),(352,2,6),(353,2,6),(354,2,6),(355,2,6),(356,2,6),(357,2,6),(358,2,6),(359,2,6),(360,2,6),(361,2,10),(362,2,6),(301,2,8),(305,2,8),(364,2,6),(365,2,6),(363,2,10),(366,2,6),(367,2,10),(368,2,10),(369,2,6),(370,2,6),(371,2,6),(372,2,6),(373,2,6),(374,2,6),(375,2,6),(378,2,6),(379,2,6),(380,2,6),(381,2,6),(382,2,6),(383,2,6),(384,2,6),(377,2,10),(376,2,10),(385,2,6),(386,2,10),(387,2,6),(388,2,6),(389,2,6),(390,2,6),(392,2,6),(395,2,6),(396,2,6),(391,2,10),(394,2,10),(393,2,10),(397,2,6),(398,2,6),(399,2,6),(400,2,6),(401,2,6),(402,2,6),(403,2,6),(404,2,6),(405,2,6),(406,2,6),(407,2,6),(408,2,6),(409,2,6),(410,2,6),(411,2,6),(412,2,6),(413,2,6),(414,2,6),(415,2,6),(416,2,6),(417,2,6),(418,2,6),(419,2,6),(420,2,6),(421,2,6),(422,2,6),(423,2,6),(424,2,6),(425,2,6),(426,2,6),(427,2,6),(428,2,6),(429,2,6),(430,2,6),(431,2,6),(433,2,6),(434,2,6),(435,2,6),(436,2,6),(437,2,6),(438,2,6),(439,2,6),(440,2,6),(441,2,6),(442,2,6),(443,2,6),(444,2,6),(445,2,6),(446,2,6),(447,2,6),(448,2,6),(449,2,6),(451,2,6),(452,2,6);
/*!40000 ALTER TABLE `sec_staff_department_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_staff_extend_property`
--

DROP TABLE IF EXISTS `sec_staff_extend_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_staff_extend_property` (
  `STAFF_ID` bigint(20) NOT NULL,
  `PROPERTY` varchar(32) NOT NULL,
  `VALUE` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`STAFF_ID`,`PROPERTY`),
  CONSTRAINT `FK_SEC_STAFF_EXTEND_PROPERTY` FOREIGN KEY (`STAFF_ID`) REFERENCES `sec_staff` (`STAFF_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员扩展属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_staff_extend_property`
--

LOCK TABLES `sec_staff_extend_property` WRITE;
/*!40000 ALTER TABLE `sec_staff_extend_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_staff_extend_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_staff_role`
--

DROP TABLE IF EXISTS `sec_staff_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_staff_role` (
  `STAFF_ID` bigint(20) NOT NULL COMMENT '成员ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`STAFF_ID`,`ROLE_ID`),
  KEY `FK_sec_staff_role2` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员角色关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_staff_role`
--

LOCK TABLES `sec_staff_role` WRITE;
/*!40000 ALTER TABLE `sec_staff_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_staff_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_attach_file_id`
--

DROP TABLE IF EXISTS `seq_attach_file_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_attach_file_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_attach_file_id`
--

LOCK TABLES `seq_attach_file_id` WRITE;
/*!40000 ALTER TABLE `seq_attach_file_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `seq_attach_file_id` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `seq_attach_type_id`
--

LOCK TABLES `seq_attach_type_id` WRITE;
/*!40000 ALTER TABLE `seq_attach_type_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `seq_attach_type_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_email_id`
--

DROP TABLE IF EXISTS `seq_email_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_email_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_email_id`
--

LOCK TABLES `seq_email_id` WRITE;
/*!40000 ALTER TABLE `seq_email_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `seq_email_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_sec_department_id`
--

DROP TABLE IF EXISTS `seq_sec_department_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_sec_department_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_sec_department_id`
--

LOCK TABLES `seq_sec_department_id` WRITE;
/*!40000 ALTER TABLE `seq_sec_department_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `seq_sec_department_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_sec_metadata_log_id`
--

DROP TABLE IF EXISTS `seq_sec_metadata_log_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_sec_metadata_log_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_sec_metadata_log_id`
--

LOCK TABLES `seq_sec_metadata_log_id` WRITE;
/*!40000 ALTER TABLE `seq_sec_metadata_log_id` DISABLE KEYS */;
INSERT INTO `seq_sec_metadata_log_id` VALUES (7,'SEQ_SEC_METADATA_LOG_ID');
/*!40000 ALTER TABLE `seq_sec_metadata_log_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_sec_operation_id`
--

DROP TABLE IF EXISTS `seq_sec_operation_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_sec_operation_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_sec_operation_id`
--

LOCK TABLES `seq_sec_operation_id` WRITE;
/*!40000 ALTER TABLE `seq_sec_operation_id` DISABLE KEYS */;
INSERT INTO `seq_sec_operation_id` VALUES (323,'SEQ_SEC_OPERATION_ID');
/*!40000 ALTER TABLE `seq_sec_operation_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_sec_resource_category_id`
--

DROP TABLE IF EXISTS `seq_sec_resource_category_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_sec_resource_category_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_sec_resource_category_id`
--

LOCK TABLES `seq_sec_resource_category_id` WRITE;
/*!40000 ALTER TABLE `seq_sec_resource_category_id` DISABLE KEYS */;
INSERT INTO `seq_sec_resource_category_id` VALUES (55,'SEQ_SEC_RESOURCE_CATEGORY_ID');
/*!40000 ALTER TABLE `seq_sec_resource_category_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_sec_resources_id`
--

DROP TABLE IF EXISTS `seq_sec_resources_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_sec_resources_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_sec_resources_id`
--

LOCK TABLES `seq_sec_resources_id` WRITE;
/*!40000 ALTER TABLE `seq_sec_resources_id` DISABLE KEYS */;
INSERT INTO `seq_sec_resources_id` VALUES (122,'SEQ_SEC_RESOURCES_ID');
/*!40000 ALTER TABLE `seq_sec_resources_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_sec_role_id`
--

DROP TABLE IF EXISTS `seq_sec_role_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_sec_role_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_sec_role_id`
--

LOCK TABLES `seq_sec_role_id` WRITE;
/*!40000 ALTER TABLE `seq_sec_role_id` DISABLE KEYS */;
INSERT INTO `seq_sec_role_id` VALUES (4,'SEQ_SEC_ROLE_ID');
/*!40000 ALTER TABLE `seq_sec_role_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_sec_staff_id`
--

DROP TABLE IF EXISTS `seq_sec_staff_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_sec_staff_id` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_sec_staff_id`
--

LOCK TABLES `seq_sec_staff_id` WRITE;
/*!40000 ALTER TABLE `seq_sec_staff_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `seq_sec_staff_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_receive`
--

DROP TABLE IF EXISTS `sms_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_receive` (
  `SMS_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '短信ID',
  `CLIENT_ID` varchar(128) DEFAULT NULL COMMENT '客户端ID',
  `DESTINATION` varchar(20) NOT NULL COMMENT '短信地址（手机号码）',
  `MESSAGE_ID` varchar(32) DEFAULT NULL COMMENT '源终端号码',
  `MSISDN` varchar(32) NOT NULL COMMENT '消息编号',
  `SERVICE_ID` varchar(10) DEFAULT NULL COMMENT '业务ID',
  `CONTENT` varchar(4000) DEFAULT NULL COMMENT '短信内容',
  `STATUS` varchar(20) NOT NULL COMMENT '短信状态 waiting-等待处理,sending-正在处理,retry-需要重试,success-处理成功,failure-处理失败',
  `DEAL_TIMES` int(11) NOT NULL COMMENT '处理次数',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `LAST_DEAL_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次处理的时间',
  `ISCRYPT` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否加密',
  `ERROR_MESSAGE` varchar(2000) DEFAULT NULL COMMENT '异常信息',
  PRIMARY KEY (`SMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信接收';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_receive`
--

LOCK TABLES `sms_receive` WRITE;
/*!40000 ALTER TABLE `sms_receive` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_receive_history`
--

DROP TABLE IF EXISTS `sms_receive_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_receive_history` (
  `SMS_ID` bigint(20) NOT NULL COMMENT '短信ID',
  `CLIENT_ID` varchar(128) DEFAULT NULL COMMENT '客户端ID',
  `DESTINATION` varchar(20) NOT NULL COMMENT '短信地址（手机号码）',
  `MESSAGE_ID` varchar(32) DEFAULT NULL COMMENT '源终端号码',
  `MSISDN` varchar(32) NOT NULL COMMENT '消息编号',
  `SERVICE_ID` varchar(10) DEFAULT NULL COMMENT '业务ID',
  `CONTENT` varchar(4000) DEFAULT NULL COMMENT '短信内容',
  `STATUS` varchar(20) NOT NULL COMMENT '短信状态 waiting-等待处理,sending-正在处理,retry-需要重试,success-处理成功,failure-处理失败',
  `DEAL_TIMES` int(11) NOT NULL COMMENT '处理次数',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `LAST_DEAL_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次处理的时间',
  `ISCRYPT` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否加密',
  `ERROR_MESSAGE` varchar(2000) DEFAULT NULL COMMENT '异常信息',
  PRIMARY KEY (`SMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信接收历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_receive_history`
--

LOCK TABLES `sms_receive_history` WRITE;
/*!40000 ALTER TABLE `sms_receive_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_receive_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_segment`
--

DROP TABLE IF EXISTS `sms_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_segment` (
  `SMS_ID` varchar(32) DEFAULT NULL COMMENT '短信ID',
  `SEQUENCE_NUM` int(11) DEFAULT NULL COMMENT '扩展序号',
  `CONTENT` varchar(500) DEFAULT NULL COMMENT '短信片断内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信片段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_segment`
--

LOCK TABLES `sms_segment` WRITE;
/*!40000 ALTER TABLE `sms_segment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_segment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_send`
--

DROP TABLE IF EXISTS `sms_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_send` (
  `SMS_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'SMS标识',
  `CLIENT_ID` varchar(128) NOT NULL COMMENT '客户端标识',
  `DESTINATION` varchar(20) NOT NULL COMMENT '目的地址',
  `CONTENT` varchar(4000) DEFAULT NULL COMMENT '短信内容',
  `MESSAGE_ID` varchar(32) DEFAULT NULL COMMENT '短信编号',
  `LAST_SEND_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后发送时间',
  `DEAL_TIMES` int(11) DEFAULT NULL COMMENT '处理次数',
  `STATUS` varchar(20) NOT NULL DEFAULT 'waiting' COMMENT '发送状态：waiting-等待发送 sending-正在发送 retry-需要重试 success-发送成功 failure-发送失败',
  `CREATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `EXPECTED_SEND_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预期发送时间',
  `ISCRYPT` varchar(1) DEFAULT '0' COMMENT '是否加密',
  `ERROR_CODE` varchar(20) DEFAULT NULL COMMENT '异常代码',
  `ERROR_MESSAGE` varchar(2000) DEFAULT NULL COMMENT '异常信息',
  `SOURCE` varchar(20) DEFAULT NULL COMMENT '源地址',
  PRIMARY KEY (`SMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信发送';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_send`
--

LOCK TABLES `sms_send` WRITE;
/*!40000 ALTER TABLE `sms_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_send_history`
--

DROP TABLE IF EXISTS `sms_send_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_send_history` (
  `SMS_ID` bigint(20) NOT NULL COMMENT 'SMS标识',
  `CLIENT_ID` varchar(128) NOT NULL COMMENT '客户端标识',
  `DESTINATION` varchar(20) NOT NULL COMMENT '目的地址',
  `CONTENT` varchar(4000) DEFAULT NULL COMMENT '短信内容',
  `MESSAGE_ID` varchar(32) DEFAULT NULL COMMENT '短信编号',
  `LAST_SEND_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后发送时间',
  `DEAL_TIMES` int(11) DEFAULT NULL COMMENT '处理次数',
  `STATUS` varchar(20) NOT NULL DEFAULT 'waiting' COMMENT '发送状态：waiting-等待发送 sending-正在发送 retry-需要重试 success-发送成功 failure-发送失败',
  `CREATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `EXPECTED_SEND_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预期发送时间',
  `ISCRYPT` varchar(1) DEFAULT '0' COMMENT '是否加密',
  `ERROR_CODE` varchar(20) DEFAULT NULL COMMENT '异常代码',
  `ERROR_MESSAGE` varchar(2000) DEFAULT NULL COMMENT '异常信息',
  `SOURCE` varchar(20) DEFAULT NULL COMMENT '源地址',
  PRIMARY KEY (`SMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信发送历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_send_history`
--

LOCK TABLES `sms_send_history` WRITE;
/*!40000 ALTER TABLE `sms_send_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_send_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_session_info`
--

DROP TABLE IF EXISTS `sms_session_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_session_info` (
  `MSISDN` varchar(32) NOT NULL COMMENT '终端号码(手机号)',
  `TOKEN` varchar(4) NOT NULL COMMENT '4位会话识别码',
  `FEATURE_TYPE` varchar(140) NOT NULL COMMENT '4位会话识别码',
  `KEY` varchar(100) NOT NULL COMMENT '键',
  `VALUE` varchar(100) DEFAULT NULL COMMENT '值',
  `LAST_UPDATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近更新时间',
  PRIMARY KEY (`MSISDN`,`TOKEN`,`FEATURE_TYPE`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信会话信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_session_info`
--

LOCK TABLES `sms_session_info` WRITE;
/*!40000 ALTER TABLE `sms_session_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_session_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_system`
--

DROP TABLE IF EXISTS `sub_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_system` (
  `SUB_SYSTEM_ID` varchar(20) NOT NULL COMMENT '子系统ID',
  `SUB_SYSTEM_NAME` varchar(50) NOT NULL COMMENT '子系统名称',
  `SUB_SYSTEM_DESC` varchar(200) DEFAULT NULL COMMENT '子系统描述',
  `HOP_DOMAIN` varchar(200) DEFAULT NULL COMMENT 'PORTAL跳转业务系统使用的域名',
  `INTERFACE_DOMAIN` varchar(200) DEFAULT NULL,
  `DEPLOY_MODE` varchar(20) NOT NULL DEFAULT 'Remote',
  `DOMAIN` varchar(20) NOT NULL COMMENT '子系统所属的域',
  PRIMARY KEY (`SUB_SYSTEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子系统表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_system`
--

LOCK TABLES `sub_system` WRITE;
/*!40000 ALTER TABLE `sub_system` DISABLE KEYS */;
INSERT INTO `sub_system` VALUES ('fmp-portal','fmp-portal','fmp-portal','/fmp-portal','/fmp-portal','Remote','admin');
/*!40000 ALTER TABLE `sub_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'flow_portal_admin'
--

--
-- Dumping routines for database 'flow_portal_admin'
--
/*!50003 DROP FUNCTION IF EXISTS `SEQ_ATTACH_FILE_ID.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SEQ_ATTACH_FILE_ID.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO `SEQ_ATTACH_FILE_ID` (stub) VALUES ('SEQ_ATTACH_FILE_ID');
	return LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 DROP FUNCTION IF EXISTS `Seq_email_Id.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Seq_email_Id.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO `SEQ_EMAIL_ID` (stub) VALUES ('SEQ_EMAIL_ID');
	RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SEQ_SEC_DEPARTMENT_ID.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SEQ_SEC_DEPARTMENT_ID.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO SEQ_SEC_DEPARTMENT_ID (stub) VALUES ('SEQ_SEC_DEPARTMENT_ID');
	return LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SEQ_SEC_METADATA_LOG_ID.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SEQ_SEC_METADATA_LOG_ID.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO SEQ_SEC_METADATA_LOG_ID (stub) VALUES ('SEQ_SEC_METADATA_LOG_ID');
	RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SEQ_SEC_OPERATION_ID.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SEQ_SEC_OPERATION_ID.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO SEQ_SEC_OPERATION_ID (stub) VALUES ('SEQ_SEC_OPERATION_ID');
	RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SEQ_SEC_RESOURCES_ID.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SEQ_SEC_RESOURCES_ID.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO SEQ_SEC_RESOURCES_ID (stub) VALUES ('SEQ_SEC_RESOURCES_ID');
	RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SEQ_SEC_RESOURCE_CATEGORY_ID.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SEQ_SEC_RESOURCE_CATEGORY_ID.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO SEQ_SEC_RESOURCE_CATEGORY_ID (stub) VALUES ('SEQ_SEC_RESOURCE_CATEGORY_ID');
	RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SEQ_SEC_ROLE_ID.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SEQ_SEC_ROLE_ID.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO SEQ_SEC_ROLE_ID (stub) VALUES ('SEQ_SEC_ROLE_ID');
	return LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SEQ_SEC_STAFF_ID.Nextval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SEQ_SEC_STAFF_ID.Nextval`() RETURNS bigint(20)
    READS SQL DATA
BEGIN
	REPLACE INTO SEQ_SEC_STAFF_ID (stub) VALUES ('SEQ_SEC_STAFF_ID');
	return LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sec_department_list_root` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sec_department_list_root`(IN current  CHAR(20),IN lev INT)
BEGIN
	DECLARE le INT;
	CREATE  TEMPORARY TABLE IF NOT EXISTS stack (item CHAR(20),leve INT);
	DELETE FROM stack;
	INSERT INTO stack VALUES(current,1);
	SET le = 1;
	WHILE EXISTS(SELECT * FROM stack WHERE leve = le) DO
		SELECT item INTO current FROM stack WHERE leve = le;
		INSERT stack SELECT parent_id,(SELECT le+1) FROM sec_department WHERE department_id = current;
		SET le = le + 1;
	END WHILE;
	IF lev > 0 THEN
		SELECT sec_department.*, stack.leve FROM sec_department,stack WHERE department_id = item AND stack.leve >= lev ORDER BY department_id ASC;
	ELSE 
		SELECT sec_department.* FROM sec_department,stack WHERE department_id = item AND stack.leve >= lev ORDER BY department_id ASC;
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sec_department_list_sub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sec_department_list_sub`(IN current  CHAR(20),IN lev INT)
BEGIN
	DECLARE le INT;
	CREATE  TEMPORARY TABLE IF NOT EXISTS stack (item CHAR(20),leve INT);
	CREATE  TEMPORARY TABLE IF NOT EXISTS stack2 (item CHAR(20),leve INT);
	DELETE FROM stack;
	DELETE FROM stack2;
	IF current IS NULL THEN
		INSERT  stack SELECT department_id,1 FROM sec_department WHERE parent_id IS NULL OR parent_id =  '';
	ELSE 
		INSERT INTO stack VALUES(current,1);
	END IF;
	SET le = 1;
	WHILE EXISTS (SELECT *  FROM stack WHERE leve = le) DO
		DELETE FROM stack2;
		INSERT stack2 SELECT * FROM stack WHERE leve = le;
		INSERT stack SELECT department_id,(SELECT le+1) FROM sec_department WHERE parent_id IN(SELECT item FROM stack2 );
		SET le = le +1;
	END WHILE;
	IF lev > 0 THEN
		SELECT sec_department.*, stack.leve FROM sec_department,stack WHERE department_id = item AND stack.leve >= lev ORDER BY department_id ASC ;
	ELSE
		SELECT sec_department.* FROM sec_department,stack WHERE department_id = item AND stack.leve >= lev ORDER BY department_id ASC ;
	END IF;
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

-- Dump completed on 2017-08-08 20:11:52
