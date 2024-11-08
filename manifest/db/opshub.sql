-- MySQL dump 10.13  Distrib 5.7.31, for macos10.14 (x86_64)
--
-- Host: localhost    Database: opshub
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '部门名称',
  `rank` int(11) NOT NULL COMMENT '排序',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级部门 id',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'深圳总公司',0,0,'2023-09-22 13:43:26'),(2,'研发部',1,1,'2023-09-22 13:52:25'),(3,'开发部',1,2,'2023-09-22 13:52:36'),(4,'运维部',2,2,'2023-09-22 13:52:41'),(5,'运营部',2,1,'2023-09-22 13:52:57');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `name` varchar(64) NOT NULL COMMENT '路由名称',
  `type` tinyint(4) NOT NULL COMMENT '类型:1-目录,2-菜单,3-功能',
  `f_route` varchar(64) DEFAULT NULL COMMENT '前端路由路径',
  `b_routes` json DEFAULT NULL COMMENT '后端路由路径',
  `redirect` varchar(64) DEFAULT NULL COMMENT '重定向路径',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `rank` int(11) DEFAULT NULL COMMENT '排序',
  `show_link` bit(1) NOT NULL COMMENT '是否在菜单中展示',
  `show_parent` bit(1) NOT NULL COMMENT '是否展示父级菜单',
  `keep_alive` bit(1) NOT NULL COMMENT '页面缓存',
  `parent_id` int(11) NOT NULL COMMENT '父级权限 id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'系统管理','system-manage',1,'/system','[]','/system/user','ep:setting',1,_binary '',_binary '\0',_binary '\0',0),(2,'权限管理','permission-manage',2,'/system/permission','[]','','fa-solid:allergies',3,_binary '',_binary '',_binary '',1),(3,'用户管理','user-manage',2,'/system/user','[]','','fa:address-card',1,_binary '',_binary '',_binary '',1),(4,'新增用户','user-add',3,'/test4','[\"post:/user\"]','/test4','',2,_binary '',_binary '\0',_binary '\0',3),(5,'角色管理','role-manage',2,'/system/role','[]','','ep:avatar',2,_binary '',_binary '',_binary '',1),(6,'更新用户','user-upt',3,'/test6','[\"put:/user/:id\"]','/test6','',3,_binary '',_binary '\0',_binary '\0',3),(8,'更新用户密码','user-upt-password',3,'','[\"patch:/user/:id/password\"]','','',5,_binary '\0',_binary '\0',_binary '\0',3),(9,'启用、禁用用户','user-upt-enable',3,'','[\"patch:/user/:id/enabled\"]','','',6,_binary '\0',_binary '\0',_binary '\0',3),(10,'删除用户','user-del',3,'','[\"delete:/user/:id\"]','','',4,_binary '\0',_binary '\0',_binary '\0',3),(11,'查询用户','user-read',3,'','[\"get:/user/page-list\", \"get:/dept/list\"]','','',1,_binary '\0',_binary '\0',_binary '\0',3),(14,'查询权限','permission-read',3,'','[\"get:/permission/list\"]','','',1,_binary '\0',_binary '\0',_binary '\0',2),(15,'新增权限','permission-add',3,'','[\"post:/permission\"]','','',2,_binary '\0',_binary '\0',_binary '\0',2),(16,'更新权限','permission-upt',3,'','[\"put:/permission/:id\"]','','',3,_binary '\0',_binary '\0',_binary '\0',2),(17,'删除权限','permission-del',3,'','[\"delete:/permission/:id\"]','','',4,_binary '\0',_binary '\0',_binary '\0',2),(18,'更新权限是否展示在菜单','permission-upt-show-link',3,'','[\"patch:/permission/:id/show-link\"]','','',5,_binary '\0',_binary '\0',_binary '\0',2),(20,'查询角色','role-read',3,'','[\"get:/role/page-list\", \"get:/permission/list\"]','','',1,_binary '\0',_binary '\0',_binary '\0',5),(21,'新增角色','role-add',3,'','[\"post:/role\"]','','',2,_binary '\0',_binary '\0',_binary '\0',5),(22,'更新角色','role-upt',3,'','[\"put:/role:id\"]','','',3,_binary '\0',_binary '\0',_binary '\0',5),(23,'删除角色','role-del',3,'','[\"delete:/role/:id\"]','','',4,_binary '\0',_binary '\0',_binary '\0',5),(24,'保存角色权限信息','role-upt-permission',3,'','[\"patch:/role/:id/permission\"]','','',5,_binary '\0',_binary '\0',_binary '\0',5),(25,'系统必需','system-required',3,'','[\"get:/permission/route-list\"]','','',0,_binary '\0',_binary '\0',_binary '\0',0),(27,'部门管理','dept-manage',2,'/system/dept','[]','','fa:group',4,_binary '',_binary '',_binary '',1),(28,'查询部门','dept-read',3,'','[\"get:/dept/list\"]','','',1,_binary '\0',_binary '\0',_binary '\0',27),(29,'新增部门','dept-add',3,'','[\"post:/dept\"]','','',2,_binary '\0',_binary '\0',_binary '\0',27),(30,'更新部门','dept-upt',3,'','[\"put:/dept/:id\"]','','',3,_binary '\0',_binary '\0',_binary '\0',27),(31,'删除部门','dept-del',3,'','[\"delete:/dept/:id\"]','','',4,_binary '\0',_binary '\0',_binary '\0',27);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '角色名称',
  `code` varchar(30) NOT NULL COMMENT '角色代码',
  `permission` json DEFAULT NULL COMMENT '关联权限',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'管理员','admin','[25, 1, 3, 11, 4, 6, 10, 8, 9, 5, 20, 21, 22, 23, 24, 2, 14, 15, 16, 17, 18]','2023-09-22 11:06:46'),(2,'测试','test','[25, 11, 5, 20, 21, 22, 23, 24, 16]','2023-09-22 11:06:46');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `phone` varchar(128) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(128) DEFAULT NULL COMMENT '真实姓名',
  `enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用状态',
  `role_ids` json DEFAULT NULL COMMENT '角色 id',
  `dept_id` int(11) NOT NULL COMMENT '所属部门 id',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$2DA0Nx7gDCydnogn5skL2uQEbMY4SHnT.yHYoLCS1QjhiQac20/TS','13888888888','123@qq.com','管理员',_binary '','[1]',1,'2024-11-08 21:49:05'),(2,'test','$2a$10$aEX83iCGh/JrxiTImN0PE.0bK/dLE1lFFeZ4ssHdK4/rrXCqMgRHe','13388888888','test@qq.com','测试用户',_binary '','[2]',4,'2024-11-08 21:49:28');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-08 21:56:12
