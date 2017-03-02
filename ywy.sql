-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 �?03 �?02 �?18:29
-- 服务器版本: 5.5.40
-- PHP 版本: 5.6.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ywy`
--

-- --------------------------------------------------------

--
-- 表的结构 `onethink_action`
--

CREATE TABLE IF NOT EXISTS `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `onethink_action`
--

INSERT INTO `onethink_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_action_log`
--

CREATE TABLE IF NOT EXISTS `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=464 ;

--
-- 转存表中的数据 `onethink_action_log`
--

INSERT INTO `onethink_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 7, 1, 0, 'model', 4, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487144667),
(2, 8, 1, 0, 'attribute', 33, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487144763),
(3, 8, 1, 0, 'attribute', 34, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487144812),
(4, 8, 1, 0, 'attribute', 35, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487144864),
(5, 8, 1, 0, 'attribute', 36, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487144939),
(6, 8, 1, 0, 'attribute', 37, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487145000),
(7, 8, 1, 0, 'attribute', 33, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487145008),
(8, 10, 1, 0, 'Menu', 16, '操作url：/ywy/newwebadmin.php?s=/Menu/edit.html', 1, 1487145075),
(9, 8, 1, 0, 'attribute', 38, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487145431),
(10, 8, 1, 0, 'attribute', 39, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487145477),
(11, 8, 1, 0, 'attribute', 40, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487146466),
(12, 8, 1, 0, 'attribute', 41, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487146505),
(13, 8, 1, 0, 'attribute', 42, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487146538),
(14, 8, 1, 0, 'attribute', 43, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487146680),
(15, 8, 1, 0, 'attribute', 34, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487147949),
(16, 8, 1, 0, 'attribute', 36, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487147990),
(17, 8, 1, 0, 'attribute', 44, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487148142),
(18, 8, 1, 0, 'attribute', 45, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487148165),
(19, 10, 1, 0, 'Menu', 124, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487148630),
(20, 10, 1, 0, 'Menu', 125, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487148726),
(21, 10, 1, 0, 'Menu', 126, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487149030),
(22, 1, 1, 0, 'member', 1, 'admin在2017-02-16 09:08登录了后台', 1, 1487207322),
(23, 10, 1, 0, 'Menu', 127, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487209540),
(24, 8, 1, 0, 'attribute', 46, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487211732),
(25, 7, 1, 0, 'model', 5, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487212493),
(26, 8, 1, 0, 'attribute', 47, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487212562),
(27, 8, 1, 0, 'attribute', 48, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487212611),
(28, 8, 1, 0, 'attribute', 49, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487212665),
(29, 8, 1, 0, 'attribute', 50, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487212737),
(30, 8, 1, 0, 'attribute', 51, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487212809),
(31, 10, 1, 0, 'Menu', 128, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487224620),
(32, 8, 1, 0, 'attribute', 47, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487224973),
(33, 10, 1, 0, 'Menu', 128, '操作url：/ywy/newwebadmin.php?s=/Menu/edit.html', 1, 1487226034),
(34, 10, 1, 0, 'Menu', 129, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487226082),
(35, 11, 1, 0, 'category', 39, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487228617),
(36, 11, 1, 0, 'category', 39, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487228631),
(37, 7, 1, 0, 'model', 6, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487228903),
(38, 8, 1, 0, 'attribute', 52, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487228954),
(39, 8, 1, 0, 'attribute', 53, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487229013),
(40, 7, 1, 0, 'model', 6, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487229321),
(41, 8, 1, 0, 'attribute', 54, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487229350),
(42, 7, 1, 0, 'model', 6, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487229490),
(43, 11, 1, 0, 'category', 39, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487229507),
(44, 11, 1, 0, 'category', 40, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487229539),
(45, 7, 1, 0, 'model', 6, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487229584),
(46, 7, 1, 0, 'model', 6, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487229605),
(47, 11, 1, 0, 'category', 41, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487229694),
(48, 11, 1, 0, 'category', 42, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487229774),
(49, 11, 1, 0, 'category', 43, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487229827),
(50, 11, 1, 0, 'category', 44, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487229868),
(51, 11, 1, 0, 'category', 45, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487229908),
(52, 11, 1, 0, 'category', 46, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487229964),
(53, 11, 1, 0, 'category', 47, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487230270),
(54, 7, 1, 0, 'model', 7, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487230682),
(55, 8, 1, 0, 'attribute', 55, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487230723),
(56, 8, 1, 0, 'attribute', 56, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487230779),
(57, 8, 1, 0, 'attribute', 57, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487230853),
(58, 8, 1, 0, 'attribute', 58, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487230875),
(59, 8, 1, 0, 'attribute', 58, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/58.html', 1, 1487230915),
(60, 7, 1, 0, 'model', 7, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487231033),
(61, 7, 1, 0, 'model', 7, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487231060),
(62, 7, 1, 0, 'model', 7, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487231077),
(63, 11, 1, 0, 'category', 2, '操作url：/ywy/newwebadmin.php?s=/Category/remove/id/2.html', 1, 1487231126),
(64, 11, 1, 0, 'category', 1, '操作url：/ywy/newwebadmin.php?s=/Category/remove/id/1.html', 1, 1487231131),
(65, 11, 1, 0, 'category', 48, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487231182),
(66, 11, 1, 0, 'category', 48, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487231192),
(67, 11, 1, 0, 'category', 49, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487231227),
(68, 8, 1, 0, 'attribute', 56, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487231268),
(69, 7, 1, 0, 'model', 8, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487231444),
(70, 8, 1, 0, 'attribute', 59, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487231867),
(71, 7, 1, 0, 'model', 8, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487231978),
(72, 7, 1, 0, 'model', 8, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487232006),
(73, 7, 1, 0, 'model', 8, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487232017),
(74, 11, 1, 0, 'category', 50, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487232083),
(75, 7, 1, 0, 'model', 8, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487232173),
(76, 7, 1, 0, 'model', 8, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487232187),
(77, 7, 1, 0, 'model', 9, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487233795),
(78, 8, 1, 0, 'attribute', 60, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487233842),
(79, 7, 1, 0, 'model', 9, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487233921),
(80, 7, 1, 0, 'model', 9, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487233961),
(81, 11, 1, 0, 'category', 51, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487233984),
(82, 11, 1, 0, 'category', 49, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487233992),
(83, 11, 1, 0, 'category', 50, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487233994),
(84, 11, 1, 0, 'category', 51, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487233997),
(85, 7, 1, 0, 'model', 10, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487234106),
(86, 8, 1, 0, 'attribute', 61, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487234130),
(87, 8, 1, 0, 'attribute', 62, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487234159),
(88, 7, 1, 0, 'model', 10, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487234330),
(89, 7, 1, 0, 'model', 10, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487234356),
(90, 11, 1, 0, 'category', 52, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487234391),
(91, 11, 1, 0, 'category', 52, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487234398),
(92, 11, 1, 0, 'category', 52, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487234571),
(93, 11, 1, 0, 'category', 53, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487234598),
(94, 11, 1, 0, 'category', 54, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487234623),
(95, 11, 1, 0, 'category', 55, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487235581),
(96, 11, 1, 0, 'category', 55, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487235591),
(97, 7, 1, 0, 'model', 11, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487235831),
(98, 8, 1, 0, 'attribute', 63, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487235860),
(99, 8, 1, 0, 'attribute', 64, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487235879),
(100, 8, 1, 0, 'attribute', 65, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487235902),
(101, 8, 1, 0, 'attribute', 66, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487235937),
(102, 8, 1, 0, 'attribute', 67, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487235964),
(103, 8, 1, 0, 'attribute', 68, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487236097),
(104, 8, 1, 0, 'attribute', 69, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487236186),
(105, 7, 1, 0, 'model', 11, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487236347),
(106, 7, 1, 0, 'model', 11, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487236394),
(107, 11, 1, 0, 'category', 56, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487236428),
(108, 11, 1, 0, 'category', 56, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487236435),
(109, 8, 1, 0, 'attribute', 70, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487237266),
(110, 8, 1, 0, 'attribute', 71, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487237327),
(111, 7, 1, 0, 'model', 11, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487237355),
(112, 7, 1, 0, 'model', 11, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487237383),
(113, 11, 1, 0, 'category', 57, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487237586),
(114, 11, 1, 0, 'category', 53, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237594),
(115, 11, 1, 0, 'category', 54, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237597),
(116, 11, 1, 0, 'category', 57, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237599),
(117, 11, 1, 0, 'category', 40, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237606),
(118, 11, 1, 0, 'category', 43, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237610),
(119, 11, 1, 0, 'category', 41, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237614),
(120, 11, 1, 0, 'category', 42, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237617),
(121, 11, 1, 0, 'category', 44, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237623),
(122, 11, 1, 0, 'category', 45, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237628),
(123, 11, 1, 0, 'category', 46, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237629),
(124, 11, 1, 0, 'category', 47, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487237633),
(125, 1, 1, 0, 'member', 1, 'admin在2017-02-17 13:42登录了后台', 1, 1487310179),
(126, 7, 1, 0, 'model', 12, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487312061),
(127, 8, 1, 0, 'attribute', 72, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487312135),
(128, 7, 1, 0, 'model', 12, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487312243),
(129, 7, 1, 0, 'model', 12, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487312264),
(130, 11, 1, 0, 'category', 58, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487312318),
(131, 11, 1, 0, 'category', 58, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487312325),
(132, 11, 1, 0, 'category', 58, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487312377),
(133, 1, 1, 0, 'member', 1, 'admin在2017-02-18 09:17登录了后台', 1, 1487380646),
(134, 11, 1, 0, 'category', 53, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487382905),
(135, 11, 1, 0, 'category', 54, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487382908),
(136, 11, 1, 0, 'category', 59, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1487382979),
(137, 11, 1, 0, 'category', 59, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487382987),
(138, 11, 1, 0, 'category', 57, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487382998),
(139, 11, 1, 0, 'category', 59, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487383000),
(140, 7, 1, 0, 'model', 13, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487395939),
(141, 8, 1, 0, 'attribute', 73, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487395998),
(142, 8, 1, 0, 'attribute', 74, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487396030),
(143, 8, 1, 0, 'attribute', 75, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487396063),
(144, 8, 1, 0, 'attribute', 76, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487396125),
(145, 8, 1, 0, 'attribute', 77, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487396157),
(146, 7, 1, 0, 'model', 13, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487396220),
(147, 10, 1, 0, 'Menu', 130, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487396624),
(148, 10, 1, 0, 'Menu', 131, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487396678),
(149, 8, 1, 0, 'attribute', 76, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487397744),
(150, 10, 1, 0, 'Menu', 132, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487400539),
(151, 10, 1, 0, 'Menu', 133, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487402451),
(152, 7, 1, 0, 'model', 14, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487402802),
(153, 7, 1, 0, 'model', 13, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487402826),
(154, 8, 1, 0, 'attribute', 78, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487402870),
(155, 8, 1, 0, 'attribute', 79, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487402907),
(156, 8, 1, 0, 'attribute', 80, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487402943),
(157, 8, 1, 0, 'attribute', 81, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487402971),
(158, 10, 1, 0, 'Menu', 134, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487404172),
(159, 10, 1, 0, 'Menu', 135, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487404214),
(160, 10, 1, 0, 'Menu', 136, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487404976),
(161, 8, 1, 0, 'attribute', 82, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487407438),
(162, 8, 1, 0, 'attribute', 83, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487407467),
(163, 8, 1, 0, 'attribute', 83, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487407730),
(164, 8, 1, 0, 'attribute', 82, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487407749),
(165, 1, 1, 0, 'member', 1, 'admin在2017-02-20 09:18登录了后台', 1, 1487553483),
(166, 8, 1, 0, 'attribute', 84, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487553512),
(167, 1, 1, 0, 'cuser', 1, 'admin在2017-02-20 09:19登录了后台', 1, 1487553544),
(168, 1, 3, 0, 'cuser', 3, '在2017-02-20 09:34登录了后台', 1, 1487554445),
(169, 1, 1, 0, 'cuser', 1, 'admin在2017-02-20 10:50登录了后台', 1, 1487559029),
(170, 1, 3, 0, 'cuser', 3, '在2017-02-20 14:14登录了后台', 1, 1487571279),
(171, 8, 1, 0, 'attribute', 85, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487574178),
(172, 1, 1, 0, 'member', 1, 'admin在2017-02-22 09:11登录了后台', 1, 1487725861),
(173, 1, 1, 0, 'cuser', 1, 'admin在2017-02-22 09:28登录了后台', 1, 1487726936),
(174, 7, 1, 0, 'model', 15, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487745283),
(175, 8, 1, 0, 'attribute', 86, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745309),
(176, 8, 1, 0, 'attribute', 87, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745402),
(177, 8, 1, 0, 'attribute', 88, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745454),
(178, 8, 1, 0, 'attribute', 89, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745482),
(179, 8, 1, 0, 'attribute', 90, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745511),
(180, 8, 1, 0, 'attribute', 91, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745546),
(181, 8, 1, 0, 'attribute', 92, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745640),
(182, 8, 1, 0, 'attribute', 93, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745707),
(183, 8, 1, 0, 'attribute', 94, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745776),
(184, 8, 1, 0, 'attribute', 95, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745896),
(185, 8, 1, 0, 'attribute', 96, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487745978),
(186, 8, 1, 0, 'attribute', 97, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487746040),
(187, 8, 1, 0, 'attribute', 92, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487748641),
(188, 8, 1, 0, 'attribute', 98, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487750349),
(189, 8, 1, 0, 'attribute', 99, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487750419),
(190, 1, 1, 0, 'cuser', 1, 'admin在2017-02-23 15:35登录了后台', 1, 1487835346),
(191, 1, 1, 0, 'member', 1, 'admin在2017-02-23 17:39登录了后台', 1, 1487842778),
(192, 8, 1, 0, 'attribute', 100, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487842821),
(193, 1, 1, 0, 'member', 1, 'admin在2017-02-23 20:49登录了后台', 1, 1487854172),
(194, 7, 1, 0, 'model', 16, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487854845),
(195, 8, 1, 0, 'attribute', 101, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487854930),
(196, 8, 1, 0, 'attribute', 102, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487855087),
(197, 8, 1, 0, 'attribute', 103, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487855124),
(198, 8, 1, 0, 'attribute', 104, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487855204),
(199, 7, 1, 0, 'model', 17, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487855264),
(200, 8, 1, 0, 'attribute', 105, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487855311),
(201, 8, 1, 0, 'attribute', 106, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487855341),
(202, 8, 1, 0, 'attribute', 107, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487857342),
(203, 8, 1, 0, 'attribute', 108, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487857411),
(204, 8, 1, 0, 'attribute', 109, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487857453),
(205, 8, 1, 0, 'attribute', 108, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487857470),
(206, 8, 1, 0, 'attribute', 110, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487857601),
(207, 8, 1, 0, 'attribute', 111, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487857617),
(208, 8, 1, 0, 'attribute', 112, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487857645),
(209, 8, 1, 0, 'attribute', 113, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487857702),
(210, 8, 1, 0, 'attribute', 114, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487857847),
(211, 8, 1, 0, 'attribute', 115, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487858042),
(212, 8, 1, 0, 'attribute', 116, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487858097),
(213, 8, 1, 0, 'attribute', 117, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487858346),
(214, 8, 1, 0, 'attribute', 118, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487858842),
(215, 8, 1, 0, 'attribute', 119, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487858879),
(216, 8, 1, 0, 'attribute', 120, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487858950),
(217, 8, 1, 0, 'attribute', 121, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487859034),
(218, 8, 1, 0, 'attribute', 122, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487859665),
(219, 8, 1, 0, 'attribute', 122, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487859674),
(220, 8, 1, 0, 'attribute', 123, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487859702),
(221, 8, 1, 0, 'attribute', 124, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487859727),
(222, 8, 1, 0, 'attribute', 125, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487859763),
(223, 8, 1, 0, 'attribute', 126, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487859814),
(224, 8, 1, 0, 'attribute', 127, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487859838),
(225, 7, 1, 0, 'model', 18, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487860533),
(226, 8, 1, 0, 'attribute', 128, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860565),
(227, 8, 1, 0, 'attribute', 129, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860630),
(228, 8, 1, 0, 'attribute', 130, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860695),
(229, 8, 1, 0, 'attribute', 131, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860725),
(230, 8, 1, 0, 'attribute', 132, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860772),
(231, 8, 1, 0, 'attribute', 133, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860822),
(232, 8, 1, 0, 'attribute', 134, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860852),
(233, 8, 1, 0, 'attribute', 135, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860879),
(234, 8, 1, 0, 'attribute', 136, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860911),
(235, 8, 1, 0, 'attribute', 137, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860937),
(236, 8, 1, 0, 'attribute', 138, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860963),
(237, 8, 1, 0, 'attribute', 139, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487860988),
(238, 8, 1, 0, 'attribute', 118, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/118.html', 1, 1487860996),
(239, 8, 1, 0, 'attribute', 119, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/119.html', 1, 1487861006),
(240, 8, 1, 0, 'attribute', 120, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/120.html', 1, 1487861012),
(241, 8, 1, 0, 'attribute', 121, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/121.html', 1, 1487861017),
(242, 8, 1, 0, 'attribute', 122, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/122.html', 1, 1487861023),
(243, 8, 1, 0, 'attribute', 123, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/123.html', 1, 1487861029),
(244, 8, 1, 0, 'attribute', 124, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/124.html', 1, 1487861033),
(245, 8, 1, 0, 'attribute', 125, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/125.html', 1, 1487861038),
(246, 8, 1, 0, 'attribute', 126, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/126.html', 1, 1487861043),
(247, 8, 1, 0, 'attribute', 127, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/127.html', 1, 1487861047),
(248, 10, 1, 0, 'Menu', 137, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487861308),
(249, 10, 1, 0, 'Menu', 138, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487861374),
(250, 10, 1, 0, 'Menu', 137, '操作url：/ywy/newwebadmin.php?s=/Menu/edit.html', 1, 1487861953),
(251, 10, 1, 0, 'Menu', 138, '操作url：/ywy/newwebadmin.php?s=/Menu/edit.html', 1, 1487861962),
(252, 10, 1, 0, 'Menu', 139, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487863020),
(253, 1, 1, 0, 'member', 1, 'admin在2017-02-24 10:37登录了后台', 1, 1487903824),
(254, 7, 1, 0, 'model', 16, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487904752),
(255, 7, 1, 0, 'model', 17, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1487904897),
(256, 10, 1, 0, 'Menu', 140, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487906346),
(257, 8, 1, 0, 'attribute', 140, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487907549),
(258, 10, 1, 0, 'Menu', 141, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487907661),
(259, 10, 1, 0, 'Menu', 142, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487908076),
(260, 8, 1, 0, 'attribute', 141, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487915086),
(261, 8, 1, 0, 'attribute', 117, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487915472),
(262, 10, 1, 0, 'Menu', 143, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1487917344),
(263, 8, 1, 0, 'attribute', 117, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487919707),
(264, 8, 1, 0, 'attribute', 142, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1487929761),
(265, 1, 1, 0, 'member', 1, 'admin在2017-02-25 14:26登录了后台', 1, 1488004009),
(266, 8, 1, 0, 'attribute', 129, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488005457),
(267, 8, 1, 0, 'attribute', 128, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488005784),
(268, 8, 1, 0, 'attribute', 143, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488005848),
(269, 10, 1, 0, 'Menu', 144, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488006384),
(270, 10, 1, 0, 'Menu', 145, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488008466),
(271, 10, 1, 0, 'Menu', 146, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488011426),
(272, 8, 1, 0, 'attribute', 144, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488013782),
(273, 8, 1, 0, 'attribute', 145, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488015415),
(274, 1, 1, 0, 'member', 1, 'admin在2017-02-27 09:22登录了后台', 1, 1488158542),
(275, 1, 1, 0, 'cuser', 1, 'admin在2017-02-27 11:27登录了后台', 1, 1488166042),
(276, 1, 1, 0, 'cuser', 1, 'admin在2017-02-27 11:27登录了后台', 1, 1488166061),
(277, 1, 1, 0, 'cuser', 1, 'admin在2017-02-27 11:32登录了后台', 1, 1488166329),
(278, 8, 1, 0, 'attribute', 146, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488174071),
(279, 7, 1, 0, 'model', 19, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488178780),
(280, 8, 1, 0, 'attribute', 147, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488178804),
(281, 8, 1, 0, 'attribute', 148, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488178876),
(282, 8, 1, 0, 'attribute', 149, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488178923),
(283, 8, 1, 0, 'attribute', 150, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488178965),
(284, 8, 1, 0, 'attribute', 151, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179019),
(285, 8, 1, 0, 'attribute', 152, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179093),
(286, 8, 1, 0, 'attribute', 153, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179150),
(287, 8, 1, 0, 'attribute', 154, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179188),
(288, 8, 1, 0, 'attribute', 155, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179269),
(289, 8, 1, 0, 'attribute', 156, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179315),
(290, 8, 1, 0, 'attribute', 157, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179418),
(291, 8, 1, 0, 'attribute', 158, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179467),
(292, 8, 1, 0, 'attribute', 159, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179492),
(293, 8, 1, 0, 'attribute', 160, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179561),
(294, 8, 1, 0, 'attribute', 161, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179625),
(295, 8, 1, 0, 'attribute', 162, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179664),
(296, 8, 1, 0, 'attribute', 163, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179687),
(297, 7, 1, 0, 'model', 20, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488179762),
(298, 8, 1, 0, 'attribute', 164, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179889),
(299, 8, 1, 0, 'attribute', 165, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179946),
(300, 8, 1, 0, 'attribute', 166, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488179975),
(301, 8, 1, 0, 'attribute', 167, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488180020),
(302, 8, 1, 0, 'attribute', 168, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488180062),
(303, 8, 1, 0, 'attribute', 169, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488180080),
(304, 8, 1, 0, 'attribute', 170, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488180129),
(305, 8, 1, 0, 'attribute', 170, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488180153),
(306, 7, 1, 0, 'model', 19, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488183878),
(307, 8, 1, 0, 'attribute', 170, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/170.html', 1, 1488184052),
(308, 8, 1, 0, 'attribute', 163, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/163.html', 1, 1488184057),
(309, 8, 1, 0, 'attribute', 162, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/162.html', 1, 1488184071),
(310, 8, 1, 0, 'attribute', 161, '操作url：/ywy/newwebadmin.php?s=/Attribute/remove/id/161.html', 1, 1488184075),
(311, 8, 1, 0, 'attribute', 156, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184097),
(312, 7, 1, 0, 'model', 21, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488184157),
(313, 8, 1, 0, 'attribute', 171, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184192),
(314, 8, 1, 0, 'attribute', 172, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184234),
(315, 8, 1, 0, 'attribute', 173, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184277),
(316, 8, 1, 0, 'attribute', 174, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184316),
(317, 8, 1, 0, 'attribute', 175, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184430),
(318, 8, 1, 0, 'attribute', 176, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184468),
(319, 8, 1, 0, 'attribute', 177, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184490),
(320, 8, 1, 0, 'attribute', 178, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184511),
(321, 8, 1, 0, 'attribute', 179, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488184538),
(322, 8, 1, 0, 'attribute', 180, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488189266),
(323, 7, 1, 0, 'model', 19, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488189285),
(324, 8, 1, 0, 'attribute', 181, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488189531),
(325, 1, 5, 0, 'cuser', 5, '在2017-02-27 21:23登录了后台', 1, 1488201813),
(326, 1, 1, 0, 'cuser', 1, 'admin在2017-02-27 21:24登录了后台', 1, 1488201881),
(327, 1, 1, 0, 'member', 1, 'admin在2017-02-27 22:22登录了后台', 1, 1488205338),
(328, 8, 1, 0, 'attribute', 182, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488205451),
(329, 8, 1, 0, 'attribute', 183, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488205521),
(330, 1, 1, 0, 'member', 1, 'admin在2017-02-28 09:23登录了后台', 1, 1488245039),
(331, 1, 1, 0, 'cuser', 1, 'admin在2017-02-28 09:24登录了后台', 1, 1488245064),
(332, 7, 1, 0, 'model', 22, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488245619),
(333, 8, 1, 0, 'attribute', 184, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488245713),
(334, 8, 1, 0, 'attribute', 185, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488245769),
(335, 8, 1, 0, 'attribute', 186, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488245810),
(336, 8, 1, 0, 'attribute', 187, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488245847),
(337, 8, 1, 0, 'attribute', 188, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488245872),
(338, 8, 1, 0, 'attribute', 189, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488245918),
(339, 8, 1, 0, 'attribute', 190, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488246002),
(340, 7, 1, 0, 'model', 23, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488246331),
(341, 8, 1, 0, 'attribute', 191, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488246397),
(342, 8, 1, 0, 'attribute', 192, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488246426),
(343, 8, 1, 0, 'attribute', 193, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488246460),
(344, 8, 1, 0, 'attribute', 194, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488246513),
(345, 8, 1, 0, 'attribute', 195, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488246631),
(346, 8, 1, 0, 'attribute', 196, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488246679),
(347, 8, 1, 0, 'attribute', 197, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488246769),
(348, 8, 1, 0, 'attribute', 198, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488246872),
(349, 8, 1, 0, 'attribute', 199, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488247220),
(350, 8, 1, 0, 'attribute', 200, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488247237),
(351, 1, 1, 0, 'cuser', 1, 'admin在2017-02-28 14:36登录了后台', 1, 1488263810),
(352, 1, 6, 0, 'cuser', 6, '在2017-02-28 14:56登录了后台', 1, 1488264966),
(353, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488267065),
(354, 8, 1, 0, 'attribute', 201, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488267142),
(355, 8, 1, 0, 'attribute', 202, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488267268),
(356, 8, 1, 0, 'attribute', 203, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488267310),
(357, 11, 1, 0, 'category', 60, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1488267422),
(358, 11, 1, 0, 'category', 60, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1488267429),
(359, 11, 1, 0, 'category', 61, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1488267480),
(360, 8, 1, 0, 'attribute', 202, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488267511),
(361, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488267656),
(362, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488267692),
(363, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488267723),
(364, 11, 1, 0, 'category', 62, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1488267764),
(365, 11, 1, 0, 'category', 61, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1488267771),
(366, 11, 1, 0, 'category', 62, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1488267773),
(367, 8, 1, 0, 'attribute', 204, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488267971),
(368, 8, 1, 0, 'attribute', 205, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488268048),
(369, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488268088),
(370, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488268101),
(371, 11, 1, 0, 'category', 63, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1488268285),
(372, 11, 1, 0, 'category', 63, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1488268290),
(373, 11, 1, 0, 'category', 64, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1488268331),
(374, 11, 1, 0, 'category', 64, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1488268337),
(375, 11, 1, 0, 'category', 65, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1488268365),
(376, 11, 1, 0, 'category', 65, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1488268371),
(377, 11, 1, 0, 'category', 66, '操作url：/ywy/newwebadmin.php?s=/Category/add.html', 1, 1488268397),
(378, 11, 1, 0, 'category', 66, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1488268405),
(379, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488268728),
(380, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488268748),
(381, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488268836),
(382, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488268849),
(383, 8, 1, 0, 'attribute', 206, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488276000),
(384, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488276021),
(385, 7, 1, 0, 'model', 24, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488276072),
(386, 1, 1, 0, 'member', 1, 'admin在2017-02-28 21:21登录了后台', 1, 1488288067),
(387, 7, 1, 0, 'model', 25, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488289069),
(388, 8, 1, 0, 'attribute', 207, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488289148),
(389, 8, 1, 0, 'attribute', 208, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488289215),
(390, 7, 1, 0, 'model', 26, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488289336),
(391, 8, 1, 0, 'attribute', 209, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488289398),
(392, 8, 1, 0, 'attribute', 210, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488289685),
(393, 8, 1, 0, 'attribute', 211, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488289754),
(394, 8, 1, 0, 'attribute', 212, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488289792),
(395, 8, 1, 0, 'attribute', 213, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488289875),
(396, 8, 1, 0, 'attribute', 214, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488289911),
(397, 7, 1, 0, 'model', 26, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488290018),
(398, 7, 1, 0, 'model', 25, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488290051),
(399, 10, 1, 0, 'Menu', 137, '操作url：/ywy/newwebadmin.php?s=/Menu/edit.html', 1, 1488290132),
(400, 8, 1, 0, 'attribute', 215, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488290495),
(401, 10, 1, 0, 'Menu', 147, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488290827),
(402, 10, 1, 0, 'Menu', 148, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488290870),
(403, 10, 1, 0, 'Menu', 149, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488291119),
(404, 10, 1, 0, 'Menu', 150, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488291588),
(405, 8, 1, 0, 'attribute', 216, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488292196),
(406, 10, 1, 0, 'Menu', 151, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488293270),
(407, 10, 1, 0, 'Menu', 152, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488293300),
(408, 10, 1, 0, 'Menu', 153, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488295011),
(409, 1, 1, 0, 'member', 1, 'admin在2017-03-01 09:25登录了后台', 1, 1488331551),
(410, 1, 1, 0, 'cuser', 1, 'admin在2017-03-01 13:51登录了后台', 1, 1488347510),
(411, 7, 1, 0, 'model', 27, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488348328),
(412, 8, 1, 0, 'attribute', 217, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488348370),
(413, 8, 1, 0, 'attribute', 218, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488348394),
(414, 8, 1, 0, 'attribute', 219, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488348422),
(415, 8, 1, 0, 'attribute', 220, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488348459),
(416, 8, 1, 0, 'attribute', 221, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488348503),
(417, 8, 1, 0, 'attribute', 222, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488348588),
(418, 7, 1, 0, 'model', 27, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488348685),
(419, 8, 1, 0, 'attribute', 223, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488350141),
(420, 7, 1, 0, 'model', 28, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488355731),
(421, 8, 1, 0, 'attribute', 224, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488355778),
(422, 8, 1, 0, 'attribute', 225, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488355799),
(423, 8, 1, 0, 'attribute', 226, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488355869),
(424, 8, 1, 0, 'attribute', 227, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488355930),
(425, 8, 1, 0, 'attribute', 228, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488355984),
(426, 8, 1, 0, 'attribute', 229, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488356050),
(427, 7, 1, 0, 'model', 28, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488356120),
(428, 8, 1, 0, 'attribute', 226, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488356238),
(429, 8, 1, 0, 'attribute', 229, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488356247),
(430, 8, 1, 0, 'attribute', 230, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488358316),
(431, 7, 1, 0, 'model', 29, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488359757),
(432, 8, 1, 0, 'attribute', 231, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488359775),
(433, 8, 1, 0, 'attribute', 232, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488359806),
(434, 8, 1, 0, 'attribute', 233, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488359901),
(435, 8, 1, 0, 'attribute', 234, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488359928),
(436, 8, 1, 0, 'attribute', 235, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488359950),
(437, 8, 1, 0, 'attribute', 236, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488359969),
(438, 8, 1, 0, 'attribute', 237, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488360181),
(439, 7, 1, 0, 'model', 29, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488360292),
(440, 7, 1, 0, 'model', 30, '操作url：/ywy/newwebadmin.php?s=/Model/update.html', 1, 1488361348),
(441, 8, 1, 0, 'attribute', 238, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488361397),
(442, 8, 1, 0, 'attribute', 239, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488361488),
(443, 8, 1, 0, 'attribute', 240, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488361538),
(444, 8, 1, 0, 'attribute', 241, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488361582),
(445, 8, 1, 0, 'attribute', 242, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488361615),
(446, 8, 1, 0, 'attribute', 243, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488361634),
(447, 8, 1, 0, 'attribute', 244, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488361914),
(448, 8, 1, 0, 'attribute', 245, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488361994),
(449, 8, 1, 0, 'attribute', 246, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488362109),
(450, 8, 1, 0, 'attribute', 247, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488362377),
(451, 8, 1, 0, 'attribute', 248, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488362419),
(452, 8, 1, 0, 'attribute', 249, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488362628),
(453, 8, 1, 0, 'attribute', 250, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488362925),
(454, 1, 1, 0, 'member', 1, 'admin在2017-03-02 09:40登录了后台', 1, 1488418802),
(455, 8, 1, 0, 'attribute', 251, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488420328),
(456, 10, 1, 0, 'Menu', 154, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488420730),
(457, 10, 1, 0, 'Menu', 154, '操作url：/ywy/newwebadmin.php?s=/Menu/edit.html', 1, 1488420747),
(458, 10, 1, 0, 'Menu', 155, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488420782),
(459, 10, 1, 0, 'Menu', 155, '操作url：/ywy/newwebadmin.php?s=/Menu/edit.html', 1, 1488420826),
(460, 10, 1, 0, 'Menu', 156, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488422120),
(461, 10, 1, 0, 'Menu', 157, '操作url：/ywy/newwebadmin.php?s=/Menu/add.html', 1, 1488425265),
(462, 8, 1, 0, 'attribute', 241, '操作url：/ywy/newwebadmin.php?s=/Attribute/update.html', 1, 1488433482),
(463, 1, 1, 0, 'cuser', 1, 'admin在2017-03-02 17:50登录了后台', 1, 1488448251);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_addons`
--

CREATE TABLE IF NOT EXISTS `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `onethink_addons`
--

INSERT INTO `onethink_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0),
(17, 'UploadImages', '多图上传', '多图上传', 1, 'null', 'lhb', '0.1', 1488422872, 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_attachment`
--

CREATE TABLE IF NOT EXISTS `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_attribute`
--

CREATE TABLE IF NOT EXISTS `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=252 ;

--
-- 转存表中的数据 `onethink_attribute`
--

INSERT INTO `onethink_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(33, 'email', '邮箱地址', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 4, 1, 1, 1487145008, 1487144763, '', 3, '', 'regex', '', 3, 'function'),
(34, 'username', '用户姓名', 'varchar(10) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1487147949, 1487144812, '', 3, '', 'regex', '', 3, 'function'),
(35, 'password', '密码', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1487144864, 1487144864, '', 3, '', 'regex', '', 3, 'function'),
(36, 'mobile', '手机号码', 'varchar(11) NOT NULL', 'string', '', '', 1, '', 4, 1, 1, 1487147990, 1487144939, '', 3, '', 'regex', '', 3, 'function'),
(37, 'address', '地址', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1487145000, 1487145000, '', 3, '', 'regex', '', 3, 'function'),
(38, 'sex', '性别', 'char(1) NOT NULL', 'radio', '0', '', 1, '0:保密\r\n1:男\r\n2:女', 4, 0, 1, 1487145431, 1487145431, '', 3, '', 'regex', '', 3, 'function'),
(39, 'qq', 'QQ号码', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1487145477, 1487145477, '', 3, '', 'regex', '', 3, 'function'),
(40, 'reg_time', '注册时间', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1487146466, 1487146466, '', 3, '', 'regex', '', 3, 'function'),
(41, 'reg_ip', '注册IP', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1487146505, 1487146505, '', 3, '', 'regex', '', 3, 'function'),
(42, 'update_time', '更新时间', 'varchar(100) NOT NULL', 'string', '', '', 0, '', 4, 0, 1, 1487146538, 1487146538, '', 3, '', 'regex', '', 3, 'function'),
(43, 'status', '状态', 'char(1) NOT NULL', 'radio', '1', '', 1, '1:正常\r\n0:无效', 4, 0, 1, 1487146680, 1487146680, '', 3, '', 'regex', '', 3, 'function'),
(44, 'last_login_time', '最后登陆时间', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1487148142, 1487148142, '', 3, '', 'regex', '', 3, 'function'),
(45, 'last_login_ip', '最后登陆IP', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1487148165, 1487148165, '', 3, '', 'regex', '', 3, 'function'),
(46, 'account', '账户余额', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 4, 0, 1, 1487211732, 1487211732, '', 3, '', 'regex', '', 3, 'function'),
(47, 'money', '变动金额', 'decimal(10,2) NOT NULL', 'num', '0.00', '', 1, '', 5, 0, 1, 1487224973, 1487212562, '', 3, '', 'regex', '', 3, 'function'),
(48, 'create_time', '变动时间', 'int(10) NOT NULL', 'datetime', '0', '', 1, '', 5, 0, 1, 1487212611, 1487212611, '', 3, '', 'regex', '', 3, 'function'),
(49, 'desc', '变动说明', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1487212665, 1487212665, '', 3, '', 'regex', '', 3, 'function'),
(50, 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 5, 0, 1, 1487212737, 1487212737, '', 3, '', 'regex', '', 3, 'function'),
(51, 'admin_id', '管理员id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '0则为系统的订单等操作', 1, '', 5, 0, 1, 1487212809, 1487212809, '', 3, '', 'regex', '', 3, 'function'),
(52, 'keywords', '关键字', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 6, 0, 1, 1487228954, 1487228954, '', 3, '', 'regex', '', 3, 'function'),
(53, 'author', '作者', 'varchar(10) NOT NULL', 'string', '亿维云', '', 1, '', 6, 0, 1, 1487229013, 1487229013, '', 3, '', 'regex', '', 3, 'function'),
(54, 'content', '文章内容', 'text NOT NULL', 'editor', '', '', 1, '', 6, 0, 1, 1487229350, 1487229350, '', 3, '', 'regex', '', 3, 'function'),
(55, 'video', '视频地址', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 7, 0, 1, 1487230723, 1487230723, '', 3, '', 'regex', '', 3, 'function'),
(56, 'content', '文章内容', 'text NOT NULL', 'editor', '', '', 1, '', 7, 0, 1, 1487231268, 1487230779, '', 3, '', 'regex', '', 3, 'function'),
(57, 'keywords', '关键字', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 7, 0, 1, 1487230853, 1487230853, '', 3, '', 'regex', '', 3, 'function'),
(59, 'keywords', '关键字', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 8, 0, 1, 1487231867, 1487231867, '', 3, '', 'regex', '', 3, 'function'),
(60, 'url', '链接地址', 'varchar(100) NOT NULL', 'string', '#', '', 1, '', 9, 0, 1, 1487233842, 1487233842, '', 3, '', 'regex', '', 3, 'function'),
(61, 'keywords', '关键字', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 10, 0, 1, 1487234131, 1487234131, '', 3, '', 'regex', '', 3, 'function'),
(62, 'content', '文章内容', 'text NOT NULL', 'editor', '', '', 1, '', 10, 0, 1, 1487234159, 1487234159, '', 3, '', 'regex', '', 3, 'function'),
(63, 'tel', '联系电话', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 11, 0, 1, 1487235860, 1487235860, '', 3, '', 'regex', '', 3, 'function'),
(64, 'fax', '传真', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 11, 0, 1, 1487235879, 1487235879, '', 3, '', 'regex', '', 3, 'function'),
(65, 'website', '网站地址', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 11, 0, 1, 1487235902, 1487235902, '', 3, '', 'regex', '', 3, 'function'),
(66, 'email', '邮箱地址', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 11, 0, 1, 1487235937, 1487235937, '', 3, '', 'regex', '', 3, 'function'),
(67, 'address', '地址', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 11, 0, 1, 1487235964, 1487235964, '', 3, '', 'regex', '', 3, 'function'),
(68, 'consults', '在线咨询QQ', 'text NOT NULL', 'textarea', '', '填写QQ推广链接地址，多个QQ请用英文的逗号隔开', 1, '', 11, 0, 1, 1487236097, 1487236097, '', 3, '', 'regex', '', 3, 'function'),
(69, 'rent', '租用托管联系', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 11, 0, 1, 1487236186, 1487236186, '', 3, '', 'regex', '', 3, 'function'),
(70, 'hot_line', '400电话', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 11, 0, 1, 1487237266, 1487237266, '', 3, '', 'regex', '', 3, 'function'),
(71, 'wechact', '二维码', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 11, 0, 1, 1487237327, 1487237327, '', 3, '', 'regex', '', 3, 'function'),
(72, 'keywords', '关键字', 'varchar(10) NOT NULL', 'string', '', '', 0, '', 12, 0, 1, 1487312135, 1487312135, '', 3, '', 'regex', '', 3, 'function'),
(73, 'title', '标题', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 13, 0, 1, 1487395998, 1487395998, '', 3, '', 'regex', '', 3, 'function'),
(74, 'keywords', '关键字', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 13, 0, 1, 1487396030, 1487396030, '', 3, '', 'regex', '', 3, 'function'),
(75, 'description', '描述', 'text NOT NULL', 'textarea', '', '', 1, '', 13, 0, 1, 1487396063, 1487396063, '', 3, '', 'regex', '', 3, 'function'),
(76, 'images', '类别图片', 'int(10) UNSIGNED NOT NULL', 'picture', '0', '', 1, '', 13, 0, 1, 1487397744, 1487396125, '', 3, '', 'regex', '', 3, 'function'),
(77, 'content', '文章内容', 'text NOT NULL', 'editor', '', '', 1, '', 13, 0, 1, 1487396157, 1487396157, '', 3, '', 'regex', '', 3, 'function'),
(78, 'case_id', '分类id', 'int(2) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 14, 0, 1, 1487402870, 1487402870, '', 3, '', 'regex', '', 3, 'function'),
(79, 'images', '案例图片', 'int(10) UNSIGNED NOT NULL', 'picture', '0', '', 1, '', 14, 0, 1, 1487402907, 1487402907, '', 3, '', 'regex', '', 3, 'function'),
(80, 'title', '案例名称', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 14, 0, 1, 1487402943, 1487402943, '', 3, '', 'regex', '', 3, 'function'),
(81, 'url', '案例地址', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 14, 0, 1, 1487402971, 1487402971, '', 3, '', 'regex', '', 3, 'function'),
(82, 'level', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 13, 0, 1, 1487407749, 1487407438, '', 3, '', 'regex', '', 3, 'function'),
(83, 'level', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 14, 0, 1, 1487407730, 1487407467, '', 3, '', 'regex', '', 3, 'function'),
(84, 'login', '登录次数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 4, 0, 1, 1487553512, 1487553512, '', 3, '', 'regex', '', 3, 'function'),
(85, 'type', '变动类型', 'char(1) NOT NULL', 'radio', '1', '', 1, '1:充值\r\n2:消费\r\n3:提现', 5, 0, 1, 1487574178, 1487574178, '', 3, '', 'regex', '', 3, 'function'),
(86, 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 15, 0, 1, 1487745309, 1487745309, '', 3, '', 'regex', '', 3, 'function'),
(87, 'product_id', '产品id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 15, 0, 1, 1487745402, 1487745402, '', 3, '', 'regex', '', 3, 'function'),
(88, 'name', '产品名称', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 15, 0, 1, 1487745454, 1487745454, '', 3, '', 'regex', '', 3, 'function'),
(89, 'keywords', '关键字', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 15, 0, 1, 1487745483, 1487745483, '', 3, '', 'regex', '', 3, 'function'),
(90, 'number', '数量', 'int(10) UNSIGNED NOT NULL', 'num', '1', '', 1, '', 15, 0, 1, 1487745511, 1487745511, '', 3, '', 'regex', '', 3, 'function'),
(91, 'price', '单价', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 15, 0, 1, 1487745546, 1487745546, '', 3, '', 'regex', '', 3, 'function'),
(92, 'month', '购买月份', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 15, 0, 1, 1487748641, 1487745640, '', 3, '', 'regex', '', 3, 'function'),
(93, 'base_total', '基本总价', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '', '', 1, '', 15, 0, 1, 1487745707, 1487745707, '', 3, '', 'regex', '', 3, 'function'),
(94, 'added_price', '增值价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 15, 0, 1, 1487745776, 1487745776, '', 3, '', 'regex', '', 3, 'function'),
(95, 'project', '方案描述', 'text NOT NULL', 'textarea', '', 'json格式的数据', 1, '', 15, 0, 1, 1487745896, 1487745896, '', 3, '', 'regex', '', 3, 'function'),
(96, 'parameters', '具体参数', 'text NOT NULL', 'textarea', '', 'json格式数据', 1, '', 15, 0, 1, 1487745978, 1487745978, '', 3, '', 'regex', '', 3, 'function'),
(97, 'add_time', '添加时间', 'int(10) NOT NULL', 'datetime', '0', '', 1, '', 15, 0, 1, 1487746040, 1487746040, '', 3, '', 'regex', '', 3, 'function'),
(98, 'type', '产品类型', 'char(2) NOT NULL', 'radio', '1', '', 1, '1:域名\r\n2:虚拟主机\r\n3:企业邮箱\r\n4:云服务器\r\n5:云建站', 15, 0, 1, 1487750349, 1487750349, '', 3, '', 'regex', '', 3, 'function'),
(99, 'domain_info', '域名注册信息', 'text NOT NULL', 'textarea', '', '域名注册填写的信息', 1, '', 15, 0, 1, 1487750419, 1487750419, '', 3, '', 'regex', '', 3, 'function'),
(100, 'subtotal', '全部总价', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 15, 0, 1, 1487842821, 1487842821, '', 3, '', 'regex', '', 3, 'function'),
(101, 'name', '分类名称', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 16, 0, 1, 1487854930, 1487854930, '', 3, '', 'regex', '', 3, 'function'),
(102, 'is_present', '是否赠送一个月备案时间', 'char(1) NOT NULL', 'radio', '0', '', 1, '0:不赠送\r\n1:赠送', 16, 0, 1, 1487855087, 1487855087, '', 3, '', 'regex', '', 3, 'function'),
(103, 'images', '分类图片', 'int(10) UNSIGNED NOT NULL', 'picture', '0', '', 1, '', 16, 0, 1, 1487855124, 1487855124, '', 3, '', 'regex', '', 3, 'function'),
(104, 'level', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 16, 0, 1, 1487855204, 1487855204, '', 3, '', 'regex', '', 3, 'function'),
(105, 'type_id', '分类id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 17, 0, 1, 1487855311, 1487855311, '', 3, '', 'regex', '', 3, 'function'),
(106, 'name', '产品名称', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1487855341, 1487855341, '', 3, '', 'regex', '', 3, 'function'),
(107, 'space', '网页空间', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1487857342, 1487857342, '', 3, '', 'regex', '', 3, 'function'),
(108, 'flow', '网站流量', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1487857470, 1487857411, '', 3, '', 'regex', '', 3, 'function'),
(109, 'online', '同时在线', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1487857453, 1487857453, '', 3, '', 'regex', '', 3, 'function'),
(110, 'title', '标题', 'varchar(25) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1487857601, 1487857601, '', 3, '', 'regex', '', 3, 'function'),
(111, 'keywords', '关键字', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1487857617, 1487857617, '', 3, '', 'regex', '', 3, 'function'),
(112, 'description', '描述', 'text NOT NULL', 'textarea', '', '', 1, '', 17, 0, 1, 1487857645, 1487857645, '', 3, '', 'regex', '', 3, 'function'),
(113, 'product_id', '新一代产品id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '填写新一代产品的id', 1, '', 17, 0, 1, 1487857702, 1487857702, '', 3, '', 'regex', '', 3, 'function'),
(114, 'feature', '卖点', 'text NOT NULL', 'editor', '', '', 1, '', 17, 0, 1, 1487857847, 1487857847, '', 3, '', 'regex', '', 3, 'function'),
(115, 'mail_num', '邮局个数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 17, 0, 1, 1487858042, 1487858042, '', 3, '', 'regex', '', 3, 'function'),
(116, 'content', '详细信息', 'text NOT NULL', 'editor', '', '', 1, '', 17, 0, 1, 1487858097, 1487858097, '', 3, '', 'regex', '', 3, 'function'),
(117, 'os_type', '主机类型', 'char(10) NOT NULL', 'checkbox', '1', '', 1, '1:PHP5主机\r\n2:ASP主机', 17, 0, 1, 1487919708, 1487858346, '', 3, '', 'regex', '', 3, 'function'),
(128, 'product_id', '新一代产品id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 18, 0, 1, 1488005784, 1487860565, '', 3, '', 'regex', '', 3, 'function'),
(129, 'type_id', '线路类型', 'char(10) NOT NULL', 'radio', '1', '', 1, '1:国内线路\r\n2:香港加速\r\n3:香港优质\r\n4:独立ip', 18, 0, 1, 1488005457, 1487860630, '', 3, '', 'regex', '', 3, 'function'),
(130, 'one_price', '1年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860695, 1487860695, '', 3, '', 'regex', '', 3, 'function'),
(131, 'two_price', '2年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860725, 1487860725, '', 3, '', 'regex', '', 3, 'function'),
(132, 'three_price', '3年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860772, 1487860772, '', 3, '', 'regex', '', 3, 'function'),
(133, 'four_price', '4年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860822, 1487860822, '', 3, '', 'regex', '', 3, 'function'),
(134, 'five_price', '5年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860852, 1487860852, '', 3, '', 'regex', '', 3, 'function'),
(135, 'six_price', '6年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860880, 1487860880, '', 3, '', 'regex', '', 3, 'function'),
(136, 'seven_price', '7年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860911, 1487860911, '', 3, '', 'regex', '', 3, 'function'),
(137, 'eight_price', '8年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860937, 1487860937, '', 3, '', 'regex', '', 3, 'function'),
(138, 'nine_price', '9年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860963, 1487860963, '', 3, '', 'regex', '', 3, 'function'),
(139, 'ten_price', '10年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 18, 0, 1, 1487860988, 1487860988, '', 3, '', 'regex', '', 3, 'function'),
(140, 'level', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 17, 0, 1, 1487907549, 1487907549, '', 3, '', 'regex', '', 3, 'function'),
(141, 'images', '产品图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 17, 0, 1, 1487915086, 1487915086, '', 3, '', 'regex', '', 3, 'function'),
(142, 'single_ip', '是否独立IP', 'char(10) NOT NULL', 'radio', '0', '', 1, '0:否\r\n1:是', 17, 0, 1, 1487929761, 1487929761, '', 3, '', 'regex', '', 3, 'function'),
(143, 'pid', '商城商品id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 18, 0, 1, 1488005848, 1488005848, '', 3, '', 'regex', '', 3, 'function'),
(144, 'os_type', '主机类型', 'char(10) NOT NULL', 'radio', '1', '', 1, '1:PHP5主机\r\n2:ASP主机', 18, 0, 1, 1488013782, 1488013782, '', 3, '', 'regex', '', 3, 'function'),
(145, 'system', '操作系统', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 17, 0, 1, 1488015415, 1488015415, '', 3, '', 'regex', '', 3, 'function'),
(146, 'price_id', '价格id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '虚拟主机购买的时候有这个参数', 1, '', 15, 0, 1, 1488174071, 1488174071, '', 3, '', 'regex', '', 3, 'function'),
(147, 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 19, 0, 1, 1488178804, 1488178804, '', 3, '', 'regex', '', 3, 'function'),
(148, 'username', '用户姓名', 'varchar(10) NOT NULL', 'string', '', '', 1, '', 19, 0, 1, 1488178876, 1488178876, '', 3, '', 'regex', '', 3, 'function'),
(149, 'mobile', '手机号码', 'varchar(11) NOT NULL', 'string', '', '', 1, '', 19, 0, 1, 1488178923, 1488178923, '', 3, '', 'regex', '', 3, 'function'),
(150, 'product_name', '产品名称', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 19, 0, 1, 1488178965, 1488178965, '', 3, '', 'regex', '', 3, 'function'),
(151, 'product_id', '新一代产品id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 19, 0, 1, 1488179019, 1488179019, '', 3, '', 'regex', '', 3, 'function'),
(152, 'month', '购买月份', 'int(4) UNSIGNED NOT NULL', 'num', '12', '', 1, '', 19, 0, 1, 1488179093, 1488179093, '', 3, '', 'regex', '', 3, 'function'),
(153, 'base_total', '基本总价', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 19, 0, 1, 1488179151, 1488179151, '', 3, '', 'regex', '', 3, 'function'),
(154, 'added_price', '增值总价', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 19, 0, 1, 1488179188, 1488179188, '', 3, '', 'regex', '', 3, 'function'),
(155, 'type', '产品类型', 'char(10) NOT NULL', 'radio', '', '', 1, '1:域名\r\n2:虚拟主机\r\n3:企业邮箱\r\n4:云服务器\r\n5:云建站', 19, 0, 1, 1488179269, 1488179269, '', 3, '', 'regex', '', 3, 'function'),
(156, 'subtotal', '产品总价', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 19, 0, 1, 1488184097, 1488179315, '', 3, '', 'regex', '', 3, 'function'),
(157, 'payment', '支付方式', 'char(2) NOT NULL', 'radio', '3', '', 1, '1:微信支付\r\n2:支付宝支付\r\n3:余额支付', 19, 0, 1, 1488179418, 1488179418, '', 3, '', 'regex', '', 3, 'function'),
(158, 'project', '方案描述', 'text NOT NULL', 'textarea', '', '', 1, '', 19, 0, 1, 1488179467, 1488179467, '', 3, '', 'regex', '', 3, 'function'),
(159, 'parameters', '具体参数', 'text NOT NULL', 'textarea', '', '', 1, '', 19, 0, 1, 1488179492, 1488179492, '', 3, '', 'regex', '', 3, 'function'),
(160, 'price_id', '虚拟机价格id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 19, 0, 1, 1488179561, 1488179561, '', 3, '', 'regex', '', 3, 'function'),
(171, 'ordersn', '订单号', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 21, 0, 1, 1488184192, 1488184192, '', 3, '', 'regex', '', 3, 'function'),
(172, 'payment', '支付方式', 'char(2) NOT NULL', 'radio', '3', '', 1, '1:微信支付\r\n2:支付宝支付\r\n3:余额支付', 21, 0, 1, 1488184234, 1488184234, '', 3, '', 'regex', '', 3, 'function'),
(173, 'status', '支付状态', 'char(2) NOT NULL', 'radio', '0', '', 1, '0:未支付\r\n1:已支付', 21, 0, 1, 1488184277, 1488184277, '', 3, '', 'regex', '', 3, 'function'),
(164, 'ordersn', '订单号', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 20, 0, 1, 1488179889, 1488179889, '', 3, '', 'regex', '', 3, 'function'),
(165, 'serialsn', '流水号', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 20, 0, 1, 1488179946, 1488179946, '', 3, '', 'regex', '', 3, 'function'),
(166, 'money', '支付金额', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '', '', 1, '', 20, 0, 1, 1488179976, 1488179976, '', 3, '', 'regex', '', 3, 'function'),
(167, 'status', '支付状态', 'char(1) NOT NULL', 'radio', '0', '', 1, '0:未支付\r\n1:已支付', 20, 0, 1, 1488180020, 1488180020, '', 3, '', 'regex', '', 3, 'function'),
(168, 'payment', '支付方式', 'char(2) NOT NULL', 'radio', '3', '', 1, '1:微信支付\r\n2:支付宝支付\r\n3:余额支付', 20, 0, 1, 1488180062, 1488180062, '', 3, '', 'regex', '', 3, 'function'),
(169, 'create_time', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 20, 0, 1, 1488180080, 1488180080, '', 3, '', 'regex', '', 3, 'function'),
(174, 'total', '订单总价', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 21, 0, 1, 1488184316, 1488184316, '', 3, '', 'regex', '', 3, 'function'),
(175, 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 21, 0, 1, 1488184430, 1488184430, '', 3, '', 'regex', '', 3, 'function'),
(176, 'username', '用户姓名', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 21, 0, 1, 1488184468, 1488184468, '', 3, '', 'regex', '', 3, 'function'),
(177, 'mobile', '手机号码', 'varchar(11) NOT NULL', 'string', '', '', 1, '', 21, 0, 1, 1488184490, 1488184490, '', 3, '', 'regex', '', 3, 'function'),
(178, 'create_time', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 21, 0, 1, 1488184511, 1488184511, '', 3, '', 'regex', '', 3, 'function'),
(179, 'paytime', '支付时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 21, 0, 1, 1488184538, 1488184538, '', 3, '', 'regex', '', 3, 'function'),
(180, 'domain_info', '域名注册信息', 'text NOT NULL', 'editor', '', '', 1, '', 19, 0, 1, 1488189266, 1488189266, '', 3, '', 'regex', '', 3, 'function'),
(181, 'order_id', '订单id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 19, 0, 1, 1488189531, 1488189531, '', 3, '', 'regex', '', 3, 'function'),
(182, 'buy_config', '用户购买配置信息', 'text NOT NULL', 'textarea', '', '', 1, '', 15, 0, 1, 1488205451, 1488205451, '', 3, '', 'regex', '', 3, 'function'),
(183, 'buy_config', '用户购买配置信息', 'text NOT NULL', 'textarea', '', '', 1, '', 19, 0, 1, 1488205521, 1488205521, '', 3, '', 'regex', '', 3, 'function'),
(184, 'orderSn', '编号', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 22, 0, 1, 1488245713, 1488245713, '', 3, '', 'regex', '', 3, 'function'),
(185, 'order_id', '新一代订单id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 22, 0, 1, 1488245769, 1488245769, '', 3, '', 'regex', '', 3, 'function'),
(186, 'expiry_time', '域名过期时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 22, 0, 1, 1488245810, 1488245810, '', 3, '', 'regex', '', 3, 'function'),
(187, 'domain', '域名', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 22, 0, 1, 1488245847, 1488245847, '', 3, '', 'regex', '', 3, 'function'),
(188, 'create_time', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 22, 0, 1, 1488245872, 1488245872, '', 3, '', 'regex', '', 3, 'function'),
(189, 'tld', '域名后缀', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 22, 0, 1, 1488245919, 1488245919, '', 3, '', 'regex', '', 3, 'function'),
(190, 'year', '注册年限', 'int(4) UNSIGNED NOT NULL', 'num', '', '', 1, '', 22, 0, 1, 1488246002, 1488246002, '', 3, '', 'regex', '', 3, 'function'),
(191, 'domain', '绑定的域名', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 23, 0, 1, 1488246397, 1488246397, '', 3, '', 'regex', '', 3, 'function'),
(192, 'name', '产品名称', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 23, 0, 1, 1488246426, 1488246426, '', 3, '', 'regex', '', 3, 'function'),
(193, 'product_id', '新一代产品id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 23, 0, 1, 1488246460, 1488246460, '', 3, '', 'regex', '', 3, 'function'),
(194, 'timeperiod', '购买周期(月)', 'int(4) UNSIGNED NOT NULL', 'num', '', '', 1, '', 23, 0, 1, 1488246513, 1488246513, '', 3, '', 'regex', '', 3, 'function'),
(195, 'os_type', '系统类型', 'char(2) NOT NULL', 'radio', '', '', 1, '1:PHP5主机\r\n2:ASP主机', 23, 0, 1, 1488246631, 1488246631, '', 3, '', 'regex', '', 3, 'function'),
(196, 'create_time', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 23, 0, 1, 1488246679, 1488246679, '', 3, '', 'regex', '', 3, 'function'),
(197, 'expire_time', '到期时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 23, 0, 1, 1488246769, 1488246769, '', 3, '', 'regex', '', 3, 'function'),
(198, 'orderSn', '编号', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 23, 0, 1, 1488246872, 1488246872, '', 3, '', 'regex', '', 3, 'function'),
(199, 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 22, 0, 1, 1488247220, 1488247220, '', 3, '', 'regex', '', 3, 'function'),
(200, 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 23, 0, 1, 1488247237, 1488247237, '', 3, '', 'regex', '', 3, 'function'),
(201, 'tld', '域名后缀', 'varchar(10) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1488267142, 1488267142, '', 3, '', 'regex', '', 3, 'function'),
(202, 'type_id', '促销类型', 'char(10) NOT NULL', 'radio', '0', '', 1, '0:无\r\n1:促销\r\n2:热门', 24, 0, 1, 1488267511, 1488267268, '', 3, '', 'regex', '', 3, 'function'),
(203, 'is_checked', '是否选中', 'char(2) NOT NULL', 'radio', '0', '', 1, '0:否\r\n1:是', 24, 0, 1, 1488267310, 1488267310, '', 3, '', 'regex', '', 3, 'function'),
(204, 'lang', '域名语言', 'char(10) NOT NULL', 'radio', 'ENG', '', 1, 'ENG:英文\r\nCHI:中文', 24, 0, 1, 1488267971, 1488267971, '', 3, '', 'regex', '', 3, 'function'),
(205, 'encoding', '域名编码', 'char(10) NOT NULL', 'radio', 'ASCII', '', 1, 'ASCII:英文\r\nUTF-8:中文', 24, 0, 1, 1488268048, 1488268048, '', 3, '', 'regex', '', 3, 'function'),
(206, 'is_commonuse', '是否常用域名', 'char(2) NOT NULL', 'radio', '0', '', 1, '0:否\r\n1:是', 24, 0, 1, 1488276000, 1488276000, '', 3, '', 'regex', '', 3, 'function'),
(207, 'is_pc', '是否pc版', 'char(2) NOT NULL', 'radio', '1', '', 1, '1:PC\r\n2:手机', 25, 0, 1, 1488289148, 1488289148, '', 3, '', 'regex', '', 3, 'function'),
(208, 'name', '模板名称', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 25, 0, 1, 1488289215, 1488289215, '', 3, '', 'regex', '', 3, 'function'),
(209, 'cate_id', '模板类型id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 26, 0, 1, 1488289398, 1488289398, '', 3, '', 'regex', '', 3, 'function'),
(210, 'color', '模板色调', 'char(10) NOT NULL', 'radio', '#fe0000', '', 1, '1:#fe0000\r\n2:#ff6300\r\n3:#fae242\r\n4:#80d031\r\n5:#26e0d2\r\n6:#198ede\r\n7:#fe68ff\r\n8:#979797\r\n9:#000000\r\n10:#990099', 26, 0, 1, 1488289685, 1488289685, '', 3, '', 'regex', '', 3, 'function'),
(211, 'name', '模板名称', 'varchar(25) NOT NULL', 'string', '', '', 1, '', 26, 0, 1, 1488289754, 1488289754, '', 3, '', 'regex', '', 3, 'function'),
(212, 'price', '模板价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '0.00', '', 1, '', 26, 0, 1, 1488289792, 1488289792, '', 3, '', 'regex', '', 3, 'function'),
(213, 'template_id', '模板id', 'varchar(255) NOT NULL', 'string', '1000', '', 1, '', 26, 0, 1, 1488289875, 1488289875, '', 3, '', 'regex', '', 3, 'function'),
(214, 'images', '模板图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 26, 0, 1, 1488289911, 1488289911, '', 3, '', 'regex', '', 3, 'function'),
(215, 'level', '排序', 'int(3) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 25, 0, 1, 1488290495, 1488290495, '', 3, '', 'regex', '', 3, 'function'),
(216, 'level', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 26, 0, 1, 1488292196, 1488292196, '', 3, '', 'regex', '', 3, 'function'),
(217, 'tid', '模板记录id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 27, 0, 1, 1488348370, 1488348370, '', 3, '', 'regex', '', 3, 'function'),
(218, 'template_id', '模板id', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 27, 0, 1, 1488348394, 1488348394, '', 3, '', 'regex', '', 3, 'function'),
(219, 'name', '模板名称', 'varchar(25) NOT NULL', 'string', '', '', 1, '', 27, 0, 1, 1488348422, 1488348422, '', 3, '', 'regex', '', 3, 'function'),
(220, 'create_time', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 27, 0, 1, 1488348459, 1488348459, '', 3, '', 'regex', '', 3, 'function'),
(221, 'expiry_time', '到期时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 27, 0, 1, 1488348503, 1488348503, '', 3, '', 'regex', '', 3, 'function'),
(222, 'status', '产品状态', 'char(2) NOT NULL', 'radio', '0', '', 1, '0:未开通\r\n1:已开通\r\n2:已过期', 27, 0, 1, 1488348588, 1488348588, '', 3, '', 'regex', '', 3, 'function'),
(223, 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 27, 0, 1, 1488350141, 1488350141, '', 3, '', 'regex', '', 3, 'function'),
(224, 'product_id', '新一代产品id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 28, 0, 1, 1488355778, 1488355778, '', 3, '', 'regex', '', 3, 'function'),
(225, 'name', '产品名称', 'varchar(10) NOT NULL', 'string', '', '', 1, '', 28, 0, 1, 1488355799, 1488355799, '', 3, '', 'regex', '', 3, 'function'),
(226, 'price', '基本价格/年', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '', '', 1, '', 28, 0, 1, 1488356238, 1488355869, '', 3, '', 'regex', '', 3, 'function'),
(227, 'usernum', '邮箱用户数', 'int(2) UNSIGNED NOT NULL', 'num', '5', '', 1, '', 28, 0, 1, 1488355930, 1488355930, '', 3, '', 'regex', '', 3, 'function'),
(228, 'space', '每个用户邮箱容量', 'varchar(10) NOT NULL', 'string', '', '', 1, '', 28, 0, 1, 1488355984, 1488355984, '', 3, '', 'regex', '', 3, 'function'),
(229, 'extra_price', '额外邮箱单价', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '', '', 1, '', 28, 0, 1, 1488356247, 1488356050, '', 3, '', 'regex', '', 3, 'function'),
(230, 'product_status', '产品状态', 'char(2) NOT NULL', 'radio', '0', '', 1, '0:未开通\r\n1:已开通\r\n2:开通失败', 19, 0, 1, 1488358316, 1488358316, '', 3, '', 'regex', '', 3, 'function'),
(231, 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 29, 0, 1, 1488359775, 1488359775, '', 3, '', 'regex', '', 3, 'function'),
(232, 'domain', '绑定域名', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 29, 0, 1, 1488359806, 1488359806, '', 3, '', 'regex', '', 3, 'function'),
(233, 'name', '产品名称', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 29, 0, 1, 1488359901, 1488359901, '', 3, '', 'regex', '', 3, 'function'),
(234, 'usernum', '用户数', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 29, 0, 1, 1488359928, 1488359928, '', 3, '', 'regex', '', 3, 'function'),
(235, 'space', '空间大小', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 29, 0, 1, 1488359950, 1488359950, '', 3, '', 'regex', '', 3, 'function'),
(236, 'create_time', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 29, 0, 1, 1488359969, 1488359969, '', 3, '', 'regex', '', 3, 'function'),
(237, 'expiry_time', '过期时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 29, 0, 1, 1488360181, 1488360181, '', 3, '', 'regex', '', 3, 'function'),
(238, 'name', '服务器名称', 'varchar(25) NOT NULL', 'string', '', '', 1, '', 30, 0, 1, 1488361397, 1488361397, '', 3, '', 'regex', '', 3, 'function'),
(239, 'cpu', '处理器', 'varchar(30) NOT NULL', 'string', '', '', 1, '', 30, 0, 1, 1488361488, 1488361488, '', 3, '', 'regex', '', 3, 'function'),
(240, 'memory', '内存', 'varchar(10) NOT NULL', 'string', '', '', 1, '', 30, 0, 1, 1488361538, 1488361538, '', 3, '', 'regex', '', 3, 'function'),
(241, 'disk', '硬盘', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 30, 0, 1, 1488433482, 1488361582, '', 3, '', 'regex', '', 3, 'function'),
(242, 'bandwidth', '带宽', 'varchar(25) NOT NULL', 'string', '', '', 1, '', 30, 0, 1, 1488361615, 1488361615, '', 3, '', 'regex', '', 3, 'function'),
(243, 'ip', 'IP', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 30, 0, 1, 1488361634, 1488361634, '', 3, '', 'regex', '', 3, 'function'),
(244, 'computer_room', '机房', 'text NOT NULL', 'textarea', '', '', 1, '', 30, 0, 1, 1488361914, 1488361914, '', 3, '', 'regex', '', 3, 'function'),
(245, 'first_month_price', '首月价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '', '', 1, '', 30, 0, 1, 1488361994, 1488361994, '', 3, '', 'regex', '', 3, 'function'),
(246, 'quarter_price', '季度价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '', '', 1, '', 30, 0, 1, 1488362109, 1488362109, '', 3, '', 'regex', '', 3, 'function'),
(247, 'half_year_price', '半年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '', '', 1, '', 30, 0, 1, 1488362377, 1488362377, '', 3, '', 'regex', '', 3, 'function'),
(248, 'year_price', '一年价格', 'decimal(10,2) UNSIGNED NOT NULL', 'num', '', '', 1, '', 30, 0, 1, 1488362419, 1488362419, '', 3, '', 'regex', '', 3, 'function'),
(249, 'description', '描述', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 30, 0, 1, 1488362628, 1488362628, '', 3, '', 'regex', '', 3, 'function'),
(250, 'is_hot', '营销类型', 'char(10) NOT NULL', 'radio', '0', '', 1, '0:无\r\n1:热销\r\n2:推荐', 30, 0, 1, 1488362925, 1488362925, '', 3, '', 'regex', '', 3, 'function'),
(251, 'level', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 30, 0, 1, 1488420328, 1488420328, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_extend`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `onethink_auth_extend`
--

INSERT INTO `onethink_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_group`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `onethink_auth_group`
--

INSERT INTO `onethink_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_rule`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=217 ;

--
-- 转存表中的数据 `onethink_auth_rule`
--

INSERT INTO `onethink_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/index', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/examine', '审核列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_cart`
--

CREATE TABLE IF NOT EXISTS `onethink_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `keywords` varchar(50) NOT NULL COMMENT '关键字',
  `number` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '数量',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单价',
  `month` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买月份',
  `base_total` decimal(10,2) unsigned NOT NULL COMMENT '基本总价',
  `added_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '增值价格',
  `project` text NOT NULL COMMENT '方案描述',
  `parameters` text NOT NULL COMMENT '具体参数',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` char(2) NOT NULL DEFAULT '1' COMMENT '产品类型',
  `domain_info` text NOT NULL COMMENT '域名注册信息',
  `subtotal` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '全部总价',
  `price_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格id',
  `buy_config` text NOT NULL COMMENT '用户购买配置信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `onethink_cart`
--

INSERT INTO `onethink_cart` (`id`, `uid`, `product_id`, `name`, `keywords`, `number`, `price`, `month`, `base_total`, `added_price`, `project`, `parameters`, `add_time`, `type`, `domain_info`, `subtotal`, `price_id`, `buy_config`) VALUES
(19, 1, 0, '域名', 'baga168.com', 1, '1.00', 12, '1.00', '0.00', '{"name":"_ENG"}', '', 1488449732, '1', '{"r_organization":"\\u5343\\u4f70\\u7279\\u79d1\\u6280","r_organization1":"Qian Bai Te Ke Ji ","r_name":"\\u6768\\u5149","r_name1":"Yang Guang ","r_country":"CN","r_province":"\\u5e7f\\u4e1c\\u7701","r_province1":"Guang Dong Sheng ","r_city":"\\u5e7f\\u5dde","r_city1":"Guang Zhou ","r_postcode":"510000","r_email":"develop11@qbt8.com","r_street":"\\u68e0\\u4e0b\\u8857\\u9053\\u79d1\\u97f5\\u8def255\\u53f7","r_street1":"Tang Xia Jie Dao Ke Yun Lu 255Hao ","r_phone":"+86.13533481813","r_fax":"+86.020-82071951","radio-1-set":"1","radio-2-set":"1","radio-3-set":"1"}', '1.00', 0, '{"domain":"baga168.com","tld":".com","year":1,"lang":"ENG","encoding":"ASCII"}'),
(20, 1, 0, '域名', 'baga168.cn', 1, '1.00', 12, '1.00', '0.00', '{"name":"_ENG"}', '', 1488449732, '1', '{"r_organization":"\\u5343\\u4f70\\u7279\\u79d1\\u6280","r_organization1":"Qian Bai Te Ke Ji ","r_name":"\\u6768\\u5149","r_name1":"Yang Guang ","r_country":"CN","r_province":"\\u5e7f\\u4e1c\\u7701","r_province1":"Guang Dong Sheng ","r_city":"\\u5e7f\\u5dde","r_city1":"Guang Zhou ","r_postcode":"510000","r_email":"develop11@qbt8.com","r_street":"\\u68e0\\u4e0b\\u8857\\u9053\\u79d1\\u97f5\\u8def255\\u53f7","r_street1":"Tang Xia Jie Dao Ke Yun Lu 255Hao ","r_phone":"+86.13533481813","r_fax":"+86.020-82071951","radio-1-set":"1","radio-2-set":"1","radio-3-set":"1"}', '1.00', 0, '{"domain":"baga168.cn","tld":".cn","year":1,"lang":"ENG","encoding":"ASCII"}');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_cases`
--

CREATE TABLE IF NOT EXISTS `onethink_cases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(40) NOT NULL COMMENT '标题',
  `keywords` varchar(100) NOT NULL COMMENT '关键字',
  `description` text NOT NULL COMMENT '描述',
  `images` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类别图片',
  `content` text NOT NULL COMMENT '文章内容',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `onethink_cases`
--

INSERT INTO `onethink_cases` (`id`, `title`, `keywords`, `description`, `images`, `content`, `level`) VALUES
(1, '网站及部署', '网站及部署', 'O2O行业客户提供灵活弹性、安全可靠、功能完备的各类云服务产品，针对行业的常用应用场景定制多种专属产品和工具，不仅能帮助客户从容应对业务高峰、安全问题，更能深入业务本身提供高效便捷的解决方案。', 19, 'O2O行业客户提供灵活弹性、安全可靠、功能完备的各类云服务产品，针对行业的常用应用场景定制多种专属产品和工具，不仅能帮助客户从容应对业务高峰、安全问题，更能深入业务本身提供高效便捷的解决方案。', 5),
(2, '视频云', '视频云', '视频云提供行业先进的视频存储技术。。', 20, '视频云提供行业先进的视频存储技术。。', 4),
(3, '数据营销云', '数据营销云', '数据营销云是一种通过云数据来分析以达到利益最大化的解决方案。', 21, '数据营销云是一种通过云数据来分析以达到利益最大化的解决方案。', 3),
(4, '大数据分析', '大数据分析', '大数据分析', 22, '大数据分析', 2),
(5, '在线教育', '在线教育', '在线教育', 23, '在线教育', 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_cases_demo`
--

CREATE TABLE IF NOT EXISTS `onethink_cases_demo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `case_id` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `images` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '案例图片',
  `title` varchar(40) NOT NULL COMMENT '案例名称',
  `url` varchar(255) NOT NULL COMMENT '案例地址',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_cases_demo`
--

INSERT INTO `onethink_cases_demo` (`id`, `case_id`, `images`, `title`, `url`, `level`) VALUES
(2, 2, 4, 'PPTV', '', 0),
(3, 1, 15, '新浪微博', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_category`
--

CREATE TABLE IF NOT EXISTS `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=67 ;

--
-- 转存表中的数据 `onethink_category`
--

INSERT INTO `onethink_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(48, 'About', '关于我们', 0, 1, 10, '', '', '', '', '', '', '', '7', '7', '2', 0, 0, 1, 0, 0, '', NULL, 1487231182, 1487231192, 1, 0, ''),
(49, 'company', '公司简介', 48, 1, 10, '', '', '', '', '', '', '', '7', '7', '2', 0, 1, 1, 0, 0, '', NULL, 1487231227, 1487233992, 1, 0, ''),
(39, 'help', '帮助中心', 0, 0, 10, '', '', '', '', '', '', '', '6', '6', '2', 0, 0, 1, 0, 0, '', NULL, 1487228617, 1487229507, 1, 0, ''),
(40, 'mysql', 'Mysql数据库', 39, 1, 10, '', '', '', '', '', '', '', '6', '6', '2', 0, 1, 1, 0, 0, '', NULL, 1487229539, 1487237606, 1, 0, ''),
(41, 'question', '常见问题', 39, 3, 10, '', '', '', '', '', '', '', '6', '6', '2', 0, 1, 1, 0, 0, '', NULL, 1487229694, 1487237614, 1, 0, ''),
(42, 'control', '常见操作指南', 39, 4, 10, '', '', '', '', '', '', '', '6', '6', '2', 0, 1, 1, 0, 0, '', NULL, 1487229774, 1487237617, 1, 0, ''),
(43, 'server_config', '服务器配置', 39, 2, 10, '', '', '', '', '', '', '', '6', '6', '2', 0, 1, 1, 0, 0, '', NULL, 1487229827, 1487237610, 1, 0, ''),
(44, 'data_migration', '数据迁移', 39, 5, 10, '', '', '', '', '', '', '', '6', '6', '2', 0, 1, 1, 0, 0, '', NULL, 1487229868, 1487237623, 1, 0, ''),
(45, 'backup', '备份/恢复/镜像', 39, 6, 10, '', '', '', '', '', '', '', '6', '6', '2', 0, 1, 1, 0, 0, '', NULL, 1487229908, 1487237628, 1, 0, ''),
(46, 'build_web', '建站问题', 39, 7, 10, '', '', '', '', '', '', '', '6', '6', '2', 0, 1, 1, 0, 0, '', NULL, 1487229964, 1487237629, 1, 0, ''),
(47, 'Cluster', '集群/负载均衡', 39, 8, 10, '', '', '', '', '', '', '', '6', '6', '2', 0, 1, 1, 0, 0, '', NULL, 1487230270, 1487237633, 1, 0, ''),
(50, 'honors', '获得的荣誉', 48, 2, 10, '', '', '', '', '', '', '', '8', '8', '2', 0, 1, 1, 0, 0, '', NULL, 1487232083, 1487233994, 1, 0, ''),
(51, 'partners', '合作伙伴', 48, 3, 10, '', '', '', '', '', '', '', '9', '9', '2', 0, 1, 1, 0, 0, '', NULL, 1487233984, 1487233997, 1, 0, ''),
(52, 'news', '企业动态', 48, 4, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 0, 1, 0, 0, '', NULL, 1487234391, 1487234571, 1, 0, ''),
(53, 'hot_news', '热门动态', 52, 2, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 1, 1, 0, 0, '', NULL, 1487234598, 1487382905, 1, 0, ''),
(54, 'long_activity', '长期活动', 52, 1, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 1, 1, 0, 0, '', NULL, 1487234623, 1487382908, 1, 0, ''),
(55, 'backups', '备案中心', 48, 5, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 1, 1, 0, 0, '', NULL, 1487235581, 1487235591, 1, 0, ''),
(56, 'contacts', '联系我们', 48, 6, 10, '', '', '', '', '', '', '', '11', '11', '2', 0, 1, 1, 0, 0, '', NULL, 1487236428, 1487236435, 1, 0, ''),
(57, 'media', '媒体报告', 52, 4, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 1, 1, 0, 0, '', NULL, 1487237586, 1487382998, 1, 0, ''),
(58, 'advantage', '亿维云网优势', 0, 2, 10, '', '', '', '', '', '', '', '12', '12', '2', 0, 1, 1, 0, 0, '', NULL, 1487312318, 1487312377, 1, 0, ''),
(59, 'product_news', '产品动态', 52, 3, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 1, 1, 0, 0, '', NULL, 1487382979, 1487383000, 1, 0, ''),
(60, 'domain', '域名产品', 0, 3, 10, '', '', '', '', '', '', '', '24', '24', '2', 0, 0, 1, 0, 0, '', NULL, 1488267422, 1488267429, 1, 0, ''),
(61, 'hotDomain', '热销域名', 60, 1, 10, '', '', '', '', '', '', '', '24', '24', '2', 0, 1, 1, 0, 0, '', NULL, 1488267480, 1488267771, 1, 0, ''),
(62, 'newDomain', '新顶级域名', 60, 2, 10, '', '', '', '', '', '', '', '24', '24', '2', 0, 1, 1, 0, 0, '', NULL, 1488267764, 1488267773, 1, 0, ''),
(63, 'chineseDomain', '中文域名', 60, 3, 10, '', '', '', '', '', '', '', '24', '24', '2', 0, 1, 1, 0, 0, '', NULL, 1488268285, 1488268290, 1, 0, ''),
(64, 'guoDomain', '国别域名', 60, 4, 10, '', '', '', '', '', '', '', '24', '24', '2', 0, 1, 1, 0, 0, '', NULL, 1488268331, 1488268337, 1, 0, ''),
(65, 'cnDomain', 'CN域名', 60, 5, 10, '', '', '', '', '', '', '', '24', '24', '2', 0, 1, 1, 0, 0, '', NULL, 1488268365, 1488268371, 1, 0, ''),
(66, 'selfDomain', '自定义域名', 60, 6, 10, '', '', '', '', '', '', '', '24', '24', '2', 0, 1, 1, 0, 0, '', NULL, 1488268397, 1488268405, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_channel`
--

CREATE TABLE IF NOT EXISTS `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_channel`
--

INSERT INTO `onethink_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '首页', 'Index/index', 1, 1379475111, 1379923177, 1, 0),
(2, 0, '博客', 'Article/index?category=blog', 2, 1379475131, 1379483713, 1, 0),
(3, 0, '官网', 'http://www.onethink.cn', 3, 1379475154, 1387163458, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_cloud_category`
--

CREATE TABLE IF NOT EXISTS `onethink_cloud_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `is_present` char(1) NOT NULL DEFAULT '0' COMMENT '是否赠送一个月备案时间',
  `images` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图片',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='虚拟主机分类表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `onethink_cloud_category`
--

INSERT INTO `onethink_cloud_category` (`id`, `name`, `is_present`, `images`, `level`) VALUES
(1, '基础型', '1', 24, 1),
(2, '超G型空间', '1', 25, 2),
(3, 'JSP/.NET型', '1', 26, 3),
(4, '香港主机', '0', 27, 4),
(5, '美国主机', '0', 28, 5),
(7, '新一代云加速', '0', 29, 6);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_cloud_product`
--

CREATE TABLE IF NOT EXISTS `onethink_cloud_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `name` varchar(40) NOT NULL COMMENT '产品名称',
  `space` varchar(20) NOT NULL COMMENT '网页空间',
  `flow` varchar(20) NOT NULL COMMENT '网站流量',
  `online` varchar(20) NOT NULL COMMENT '同时在线',
  `title` varchar(25) NOT NULL COMMENT '标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `description` text NOT NULL COMMENT '描述',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新一代产品id',
  `feature` text NOT NULL COMMENT '卖点',
  `mail_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邮局个数',
  `content` text NOT NULL COMMENT '详细信息',
  `os_type` char(10) NOT NULL DEFAULT '1' COMMENT '主机类型',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `images` int(10) unsigned NOT NULL COMMENT '产品图片',
  `single_ip` char(10) NOT NULL DEFAULT '0' COMMENT '是否独立IP',
  `system` varchar(50) NOT NULL COMMENT '操作系统',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='虚拟机产品表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `onethink_cloud_product`
--

INSERT INTO `onethink_cloud_product` (`id`, `type_id`, `name`, `space`, `flow`, `online`, `title`, `keywords`, `description`, `product_id`, `feature`, `mail_num`, `content`, `os_type`, `level`, `images`, `single_ip`, `system`) VALUES
(1, 1, '飓风2(S)', '200M', '20G', '150', '飓风2(S)', '飓风2(S)', '飓风2(S)', 488, '<ul style="color:#333333;font-family:" font-size:12px;background-color:#ffffff;"="">\r\n<li>\r\n	&gt; Windows或者Linux平台\r\n</li>\r\n<li>\r\n	&gt; 200M网页 附送邮局\r\n</li>\r\n<li>\r\n	&gt; 支持ASP(Windows)/PHP(Linux)\r\n</li>\r\n<li>\r\n	&gt; Access(Windows)/30M MySQL数据库(Linux)\r\n</li>\r\n<li>\r\n	&gt; 适合个人用户、小型企业\r\n</li>\r\n<li>\r\n	&gt; 快速低成本地创建网上家园\r\n</li>\r\n	</ul>', 5, '<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Windows系统支持功能/组件详情:\r\n	</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n	<li style="color:#555555;">\r\n		Access数据库\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Asp脚本语言\r\n	</li>\r\n	<li style="color:#555555;">\r\n		FSO组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Jmail组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspUpload组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspJpeg组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		动易组件\r\n	</li>\r\n		</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Linux系统支持功能/组件详情:\r\n			</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n			<li style="color:#555555;">\r\n				MySQL数据库空间: 30M\r\n			</li>\r\n			<li style="color:#555555;">\r\n				MySQL数据库个数: 1个\r\n			</li>\r\n			<li style="color:#555555;">\r\n				phpMyAdmin管理面板\r\n			</li>\r\n			<li style="color:#555555;">\r\n				PHP脚本语言\r\n			</li>\r\n			<li style="color:#555555;">\r\n				Zend加密程序\r\n			</li>\r\n			<li style="color:#555555;">\r\n				支持Sqlite数据库\r\n			</li>\r\n				</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	其它及注意事项:\r\n					</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n					<li style="color:#555555;">\r\n						月流量限制: 20000M/月\r\n					</li>\r\n					<li style="color:#555555;">\r\n						并发连接数: 150个\r\n					</li>\r\n					<li style="color:#555555;">\r\n						免费三级域名\r\n					</li>\r\n					<li style="color:#555555;">\r\n						主机控制面板\r\n					</li>\r\n					<li style="color:#555555;">\r\n						购买实时开通\r\n					</li>\r\n					<li style="color:#555555;">\r\n						数据定期备份\r\n					</li>\r\n					<li style="color:#555555;">\r\n						千兆防火墙\r\n					</li>\r\n					<li style="color:#555555;">\r\n						不间断电源: 双路市电+UPS+后备发电机\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						技术支持: 7×24小时在线提问系统及客服热线:020-66849155 66849156 66849157\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						<p>\r\n							<strong class="tip-error">注意事项</strong> \r\n						</p>\r\n						<p class="alert alert-error" style="background-color:#F2DEDE;color:#B94A48;">\r\n							我司各款虚拟主机均禁止六 合&nbsp;<em></em>彩、法&nbsp;<em></em>轮 功、利用网络欺诈等不法经营活动、游戏私&nbsp;<em></em>服、私&nbsp;<em></em>服相关、外挂、违法色情、版权侵犯、低俗(含打擦边球的网站)、木马、WAP、病毒、色&nbsp;<em></em>情、诈&nbsp;<em></em>骗、彩&nbsp;<em></em>票、视频聊天、成&nbsp;<em></em>人用品、电影网站、美女图片、同&nbsp;<em></em>志网站、人体艺&nbsp;<em></em>术、弓驽刀剑、游戏币交&nbsp;<em></em>易、药&nbsp;<em></em>品销售、专<em></em>科医院、赌&nbsp;<em></em>博用品、仿品站、减肥丰胸类、警用品、TXT小说、刷钻、刷信誉、钓&nbsp;<em></em>鱼机票网站、电视<em></em>棒、可&nbsp;<em></em>可网络验证系统(KSREG)&nbsp;<em></em>、侦探公司、黑客安全类、易受攻击影响网络稳定的等类型的网站。我司有严格的监控措施，一经发现，立即永久关闭，并不退款！\r\n						</p>\r\n					</li>\r\n						</ul>', '1,2', 1, 30, '0', 'Windows和Linux平台任选'),
(3, 1, '飓风4(S)', '400M', '40G', '180', '飓风4(S)', '飓风4(S)', '飓风4(S)', 492, '<ul style="color:#333333;font-family:" font-size:12px;background-color:#ffffff;"="">\r\n<li>\r\n	&gt; Windows或者Linux平台\r\n</li>\r\n<li>\r\n	&gt; 400M网页、附送邮局\r\n</li>\r\n<li>\r\n	&gt; 支持ASP(Windows)/PHP(Linux)\r\n</li>\r\n<li>\r\n	&gt; Access 40M MSSQL数据库(Windows)/40M MySQL数据库(Linux)\r\n</li>\r\n<li>\r\n	&gt; 中小型企业动态商务建站首选\r\n</li>\r\n	</ul>', 5, '<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Windows系统支持功能/组件详情:\r\n	</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n	<li style="color:#555555;">\r\n		Access数据库\r\n	</li>\r\n	<li style="color:#555555;">\r\n		MSSQL数据库空间: 40M\r\n	</li>\r\n	<li style="color:#555555;">\r\n		MSSQL数据库个数: 1个\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Asp脚本语言\r\n	</li>\r\n	<li style="color:#555555;">\r\n		FSO组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Jmail组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspUpload组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspJpeg组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		动易组件\r\n	</li>\r\n		</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Linux系统支持功能/组件详情:\r\n			</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n			<li style="color:#555555;">\r\n				MySQL数据库空间: 40M\r\n			</li>\r\n			<li style="color:#555555;">\r\n				MySQL数据库个数: 1个\r\n			</li>\r\n			<li style="color:#555555;">\r\n				phpMyAdmin管理面板\r\n			</li>\r\n			<li style="color:#555555;">\r\n				PHP脚本语言\r\n			</li>\r\n			<li style="color:#555555;">\r\n				Zend加密程序\r\n			</li>\r\n			<li style="color:#555555;">\r\n				支持Sqlite数据库\r\n			</li>\r\n				</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	其它及注意事项:\r\n					</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n					<li style="color:#555555;">\r\n						月流量限制: 40000M/月\r\n					</li>\r\n					<li style="color:#555555;">\r\n						并发连接数: 180个\r\n					</li>\r\n					<li style="color:#555555;">\r\n						免费三级域名\r\n					</li>\r\n					<li style="color:#555555;">\r\n						主机控制面板\r\n					</li>\r\n					<li style="color:#555555;">\r\n						购买实时开通\r\n					</li>\r\n					<li style="color:#555555;">\r\n						数据定期备份\r\n					</li>\r\n					<li style="color:#555555;">\r\n						千兆防火墙\r\n					</li>\r\n					<li style="color:#555555;">\r\n						不间断电源: 双路市电+UPS+后备发电机\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						技术支持: 7×24小时在线提问系统及客服热线:020-66849155 66849156 66849157\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						<p>\r\n							<strong class="tip-error">注意事项</strong> \r\n						</p>\r\n						<p class="alert alert-error" style="background-color:#F2DEDE;color:#B94A48;">\r\n							我司各款虚拟主机均禁止六 合&nbsp;<em></em>彩、法&nbsp;<em></em>轮 功、利用网络欺诈等不法经营活动、游戏私&nbsp;<em></em>服、私&nbsp;<em></em>服相关、外挂、违法色情、版权侵犯、低俗(含打擦边球的网站)、木马、WAP、病毒、色&nbsp;<em></em>情、诈&nbsp;<em></em>骗、彩&nbsp;<em></em>票、视频聊天、成&nbsp;<em></em>人用品、电影网站、美女图片、同&nbsp;<em></em>志网站、人体艺&nbsp;<em></em>术、弓驽刀剑、游戏币交&nbsp;<em></em>易、药&nbsp;<em></em>品销售、专<em></em>科医院、赌&nbsp;<em></em>博用品、仿品站、减肥丰胸类、警用品、TXT小说、刷钻、刷信誉、钓&nbsp;<em></em>鱼机票网站、电视<em></em>棒、可&nbsp;<em></em>可网络验证系统(KSREG)&nbsp;<em></em>、侦探公司、黑客安全类、易受攻击影响网络稳定的等类型的网站。我司有严格的监控措施，一经发现，立即永久关闭，并不退款！\r\n						</p>\r\n					</li>\r\n						</ul>', '1,2', 2, 31, '0', 'Windows和Linux平台任选'),
(4, 2, '特价飓风G(S)', '1000M', '60G', '200', '特价飓风G(S)', '特价飓风G(S)', '特价飓风G(S)', 484, '<ul style="color:#333333;font-family:" font-size:12px;background-color:#ffffff;"="">\r\n<li>\r\n	&gt; Windows或者Linux平台\r\n</li>\r\n<li>\r\n	&gt; 1000M网页 附送邮局\r\n</li>\r\n<li>\r\n	&gt; 支持ASP、ASP.NET2.0/3.5/4.0(Windows)/PHP(Linux)\r\n</li>\r\n<li>\r\n	&gt; 支持ASP.NET MVC 3 / MVC 4(Windows)\r\n</li>\r\n<li>\r\n	&gt; Access、80M MSSQL数据库(Windows)/80M MySQL数据库(Linux)\r\n</li>\r\n<li>\r\n	&gt; 适合建设中小型电子商务网站\r\n</li>\r\n	</ul>', 6, '<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Windows系统支持功能/组件详情:\r\n	</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n	<li style="color:#555555;">\r\n		Access数据库\r\n	</li>\r\n	<li style="color:#555555;">\r\n		MSSQL数据库空间: 80M\r\n	</li>\r\n	<li style="color:#555555;">\r\n		MSSQL数据库个数: 1个\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Asp脚本语言\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Asp.Net脚本语言\r\n	</li>\r\n	<li style="color:#555555;">\r\n		FSO组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Jmail组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspUpload组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspJpeg组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		动易组件\r\n	</li>\r\n		</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Linux系统支持功能/组件详情:\r\n			</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n			<li style="color:#555555;">\r\n				MySQL数据库空间: 80M\r\n			</li>\r\n			<li style="color:#555555;">\r\n				MySQL数据库个数: 1个\r\n			</li>\r\n			<li style="color:#555555;">\r\n				phpMyAdmin管理面板\r\n			</li>\r\n			<li style="color:#555555;">\r\n				PHP脚本语言\r\n			</li>\r\n			<li style="color:#555555;">\r\n				Zend加密程序\r\n			</li>\r\n			<li style="color:#555555;">\r\n				支持Sqlite数据库\r\n			</li>\r\n				</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	其它及注意事项:\r\n					</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n					<li style="color:#555555;">\r\n						月流量限制: 60000M/月\r\n					</li>\r\n					<li style="color:#555555;">\r\n						并发连接数: 200个\r\n					</li>\r\n					<li style="color:#555555;">\r\n						免费三级域名\r\n					</li>\r\n					<li style="color:#555555;">\r\n						主机控制面板\r\n					</li>\r\n					<li style="color:#555555;">\r\n						购买实时开通\r\n					</li>\r\n					<li style="color:#555555;">\r\n						数据定期备份\r\n					</li>\r\n					<li style="color:#555555;">\r\n						千兆防火墙\r\n					</li>\r\n					<li style="color:#555555;">\r\n						不间断电源: 双路市电+UPS+后备发电机\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						技术支持: 7×24小时在线提问系统及客服热线:020-66849155 66849156 66849157\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						<p>\r\n							<strong class="tip-error">注意事项</strong> \r\n						</p>\r\n						<p class="alert alert-error" style="background-color:#F2DEDE;color:#B94A48;">\r\n							我司各款虚拟主机均禁止六 合&nbsp;<em></em>彩、法&nbsp;<em></em>轮 功、利用网络欺诈等不法经营活动、游戏私&nbsp;<em></em>服、私&nbsp;<em></em>服相关、外挂、违法色情、版权侵犯、低俗(含打擦边球的网站)、木马、WAP、病毒、色&nbsp;<em></em>情、诈&nbsp;<em></em>骗、彩&nbsp;<em></em>票、视频聊天、成&nbsp;<em></em>人用品、电影网站、美女图片、同&nbsp;<em></em>志网站、人体艺&nbsp;<em></em>术、弓驽刀剑、游戏币交&nbsp;<em></em>易、药&nbsp;<em></em>品销售、专<em></em>科医院、赌&nbsp;<em></em>博用品、仿品站、减肥丰胸类、警用品、TXT小说、刷钻、刷信誉、钓&nbsp;<em></em>鱼机票网站、电视<em></em>棒、可&nbsp;<em></em>可网络验证系统(KSREG)&nbsp;<em></em>、侦探公司、黑客安全类、易受攻击影响网络稳定的等类型的网站。我司有严格的监控措施，一经发现，立即永久关闭，并不退款！\r\n						</p>\r\n					</li>\r\n						</ul>', '1,2', 3, 27, '0', 'Windows和Linux平台任选'),
(5, 3, 'Asp.net主机(S)', '300M', '30G', '120', 'Asp.net主机(S)', 'Asp.net主机(S)', 'Asp.net主机(S)', 479, '<ul style="color:#333333;font-family:" font-size:12px;background-color:#ffffff;"="">\r\n<li>\r\n	&gt; Windows平台\r\n</li>\r\n<li>\r\n	&gt; 300MB网页 附送邮局\r\n</li>\r\n<li>\r\n	&gt; 支持ASP、ASP.NET2.0/3.5/4.0\r\n</li>\r\n<li>\r\n	&gt; 支持ASP.NET MVC 3 / MVC 4\r\n</li>\r\n<li>\r\n	&gt; Access、20M MSSQL数据库\r\n</li>\r\n	</ul>', 5, '<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Windows系统支持功能/组件详情:\r\n	</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n	<li style="color:#555555;">\r\n		Access数据库\r\n	</li>\r\n	<li style="color:#555555;">\r\n		MSSQL数据库空间: 20M\r\n	</li>\r\n	<li style="color:#555555;">\r\n		MSSQL数据库个数: 1个\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Asp脚本语言\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Asp.Net脚本语言\r\n	</li>\r\n	<li style="color:#555555;">\r\n		FSO组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Jmail组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspUpload组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspJpeg组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		动易组件\r\n	</li>\r\n		</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	其它及注意事项:\r\n			</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n			<li style="color:#555555;">\r\n				月流量限制: 30000M/月\r\n			</li>\r\n			<li style="color:#555555;">\r\n				并发连接数: 120个\r\n			</li>\r\n			<li style="color:#555555;">\r\n				免费三级域名\r\n			</li>\r\n			<li style="color:#555555;">\r\n				主机控制面板\r\n			</li>\r\n			<li style="color:#555555;">\r\n				购买实时开通\r\n			</li>\r\n			<li style="color:#555555;">\r\n				数据定期备份\r\n			</li>\r\n			<li style="color:#555555;">\r\n				千兆防火墙\r\n			</li>\r\n			<li style="color:#555555;">\r\n				不间断电源: 双路市电+UPS+后备发电机\r\n			</li>\r\n			<li class="spec" style="color:#555555;">\r\n				技术支持: 7×24小时在线提问系统及客服热线:020-66849155 66849156 66849157\r\n			</li>\r\n			<li class="spec" style="color:#555555;">\r\n				<p>\r\n					<strong class="tip-error">注意事项</strong> \r\n				</p>\r\n				<p class="alert alert-error" style="background-color:#F2DEDE;color:#B94A48;">\r\n					我司各款虚拟主机均禁止六 合&nbsp;<em></em>彩、法&nbsp;<em></em>轮 功、利用网络欺诈等不法经营活动、游戏私&nbsp;<em></em>服、私&nbsp;<em></em>服相关、外挂、违法色情、版权侵犯、低俗(含打擦边球的网站)、木马、WAP、病毒、色&nbsp;<em></em>情、诈&nbsp;<em></em>骗、彩&nbsp;<em></em>票、视频聊天、成&nbsp;<em></em>人用品、电影网站、美女图片、同&nbsp;<em></em>志网站、人体艺&nbsp;<em></em>术、弓驽刀剑、游戏币交&nbsp;<em></em>易、药&nbsp;<em></em>品销售、专&nbsp;<em></em>科医院、赌&nbsp;<em></em>博用品、仿品站、减肥丰胸类、警用品、TXT小说、刷钻、刷信誉、钓&nbsp;<em></em>鱼机票网站、电视&nbsp;<em></em>棒、可&nbsp;<em></em>可网络验证系统(KSREG)&nbsp;<em></em>、侦探公司、黑客安全类、易受攻击影响网络稳定的等类型的网站。我司有严格的监控措施，一经发现，立即永久关闭，并不退款！\r\n				</p>\r\n			</li>\r\n				</ul>', '2', 5, 27, '0', 'Windows平台'),
(6, 4, '明珠HK200(S)', '200M', '12G', '80', '明珠HK200(S)', '明珠HK200(S)', '明珠HK200(S)', 3149, '<ul style="color:#333333;font-family:" font-size:12px;background-color:#ffffff;"="">\r\n<li>\r\n	&gt; Windows或者Linux平台\r\n</li>\r\n<li>\r\n	&gt; 200MB网页 附送邮局\r\n</li>\r\n<li>\r\n	&gt; 支持ASP(Windows)/PHP(Linux)\r\n</li>\r\n<li>\r\n	&gt; Access(Windows)/20M MySQL数据库(Linux)\r\n</li>\r\n<li>\r\n	&gt; 香港优质线路： 适合面向亚洲客户网站\r\n</li>\r\n<li>\r\n	&gt; 香港加速线路： 香港线路，图片、视频等静态文件通过国内加速，访问更快速\r\n</li>\r\n	</ul>', 5, '<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Windows系统支持功能/组件详情:\r\n	</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n	<li style="color:#555555;">\r\n		Access数据库\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Asp脚本语言\r\n	</li>\r\n	<li style="color:#555555;">\r\n		FSO组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Jmail组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspUpload组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspJpeg组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		动易组件\r\n	</li>\r\n		</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Linux系统支持功能/组件详情:\r\n			</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n			<li style="color:#555555;">\r\n				MySQL数据库空间: 20M\r\n			</li>\r\n			<li style="color:#555555;">\r\n				MySQL数据库个数: 1个\r\n			</li>\r\n			<li style="color:#555555;">\r\n				phpMyAdmin管理面板\r\n			</li>\r\n			<li style="color:#555555;">\r\n				PHP脚本语言\r\n			</li>\r\n			<li style="color:#555555;">\r\n				Zend加密程序\r\n			</li>\r\n			<li style="color:#555555;">\r\n				支持Sqlite数据库\r\n			</li>\r\n				</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	其它及注意事项:\r\n					</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n					<li style="color:#555555;">\r\n						月流量限制: 12000M/月\r\n					</li>\r\n					<li style="color:#555555;">\r\n						并发连接数: 80个\r\n					</li>\r\n					<li style="color:#555555;">\r\n						主机控制面板\r\n					</li>\r\n					<li style="color:#555555;">\r\n						购买实时开通\r\n					</li>\r\n					<li style="color:#555555;">\r\n						数据定期备份\r\n					</li>\r\n					<li style="color:#555555;">\r\n						千兆防火墙\r\n					</li>\r\n					<li style="color:#555555;">\r\n						不间断电源: 双路市电+UPS+后备发电机\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						技术支持: 7×24小时在线提问系统及客服热线:020-66849155 66849156 66849157\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						<p>\r\n							<strong class="tip-error">注意事项</strong> \r\n						</p>\r\n						<p class="alert alert-error" style="background-color:#F2DEDE;color:#B94A48;">\r\n							我司各款虚拟主机均禁止六 合&nbsp;<em></em>彩、法&nbsp;<em></em>轮 功、利用网络欺诈等不法经营活动、游戏私&nbsp;<em></em>服、私&nbsp;<em></em>服相关、外挂、违法色情、版权侵犯、低俗(含打擦边球的网站)、木马、WAP、病毒、色&nbsp;<em></em>情、诈&nbsp;<em></em>骗、彩&nbsp;<em></em>票、视频聊天、成&nbsp;<em></em>人用品、电影网站、美女图片、同&nbsp;<em></em>志网站、人体艺&nbsp;<em></em>术、弓驽刀剑、游戏币交&nbsp;<em></em>易、药&nbsp;<em></em>品销售、专&nbsp;<em></em>科医院、赌&nbsp;<em></em>博用品、仿品站、减肥丰胸类、警用品、TXT小说、刷钻、刷信誉、钓&nbsp;<em></em>鱼机票网站、电视&nbsp;<em></em>棒、可&nbsp;<em></em>可网络验证系统(KSREG)&nbsp;<em></em>、侦探公司、黑客安全类、易受攻击影响网络稳定的等类型的网站。我司有严格的监控措施，一经发现，立即永久关闭，并不退款！\r\n						</p>\r\n					</li>\r\n						</ul>', '1,2', 5, 28, '1', 'Windows和Linux平台任选'),
(7, 4, '明珠HK400(S)', '400M', '18G', '100', '明珠HK400(S)', '明珠HK400(S)', '明珠HK400(S)', 3151, '<ul style="color:#333333;font-family:" font-size:12px;background-color:#ffffff;"="">\r\n<li>\r\n	&gt; Windows或者Linux平台\r\n</li>\r\n<li>\r\n	&gt; 400MB网页 附送邮局\r\n</li>\r\n<li>\r\n	&gt; 支持ASP(Windows)/PHP(Linux)\r\n</li>\r\n<li>\r\n	&gt; Access(Windows)/20M MySQL数据库(Linux)\r\n</li>\r\n<li>\r\n	&gt; 香港优质线路： 适合面向亚洲客户网站\r\n</li>\r\n<li>\r\n	&gt; 香港加速线路： 香港线路，图片、视频等静态文件通过国内加速，访问更快速\r\n</li>\r\n	</ul>', 5, '<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Windows系统支持功能/组件详情:\r\n	</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n	<li style="color:#555555;">\r\n		Access数据库\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Asp脚本语言\r\n	</li>\r\n	<li style="color:#555555;">\r\n		FSO组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		Jmail组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspUpload组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		AspJpeg组件\r\n	</li>\r\n	<li style="color:#555555;">\r\n		动易组件\r\n	</li>\r\n		</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Linux系统支持功能/组件详情:\r\n			</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n			<li style="color:#555555;">\r\n				MySQL数据库空间: 20M\r\n			</li>\r\n			<li style="color:#555555;">\r\n				MySQL数据库个数: 1个\r\n			</li>\r\n			<li style="color:#555555;">\r\n				phpMyAdmin管理面板\r\n			</li>\r\n			<li style="color:#555555;">\r\n				PHP脚本语言\r\n			</li>\r\n			<li style="color:#555555;">\r\n				Zend加密程序\r\n			</li>\r\n			<li style="color:#555555;">\r\n				支持Sqlite数据库\r\n			</li>\r\n				</ul>\r\n<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	其它及注意事项:\r\n					</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n					<li style="color:#555555;">\r\n						月流量限制: 香港优质18000M/月，香港实惠16000M/月\r\n					</li>\r\n					<li style="color:#555555;">\r\n						并发连接数: 香港优质100个，香港实惠80个\r\n					</li>\r\n					<li style="color:#555555;">\r\n						主机控制面板\r\n					</li>\r\n					<li style="color:#555555;">\r\n						购买实时开通\r\n					</li>\r\n					<li style="color:#555555;">\r\n						数据定期备份\r\n					</li>\r\n					<li style="color:#555555;">\r\n						千兆防火墙\r\n					</li>\r\n					<li style="color:#555555;">\r\n						不间断电源: 双路市电+UPS+后备发电机\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						技术支持: 7×24小时在线提问系统及客服热线:020-66849155 66849156 66849157\r\n					</li>\r\n					<li class="spec" style="color:#555555;">\r\n						<p>\r\n							<strong class="tip-error">注意事项</strong> \r\n						</p>\r\n						<p class="alert alert-error" style="background-color:#F2DEDE;color:#B94A48;">\r\n							我司各款虚拟主机均禁止六 合&nbsp;<em></em>彩、法&nbsp;<em></em>轮 功、利用网络欺诈等不法经营活动、游戏私&nbsp;<em></em>服、私&nbsp;<em></em>服相关、外挂、违法色情、版权侵犯、低俗(含打擦边球的网站)、木马、WAP、病毒、色&nbsp;<em></em>情、诈&nbsp;<em></em>骗、彩&nbsp;<em></em>票、视频聊天、成&nbsp;<em></em>人用品、电影网站、美女图片、同&nbsp;<em></em>志网站、人体艺&nbsp;<em></em>术、弓驽刀剑、游戏币交&nbsp;<em></em>易、药&nbsp;<em></em>品销售、专&nbsp;<em></em>科医院、赌&nbsp;<em></em>博用品、仿品站、减肥丰胸类、警用品、TXT小说、刷钻、刷信誉、钓&nbsp;<em></em>鱼机票网站、电视&nbsp;<em></em>棒、可&nbsp;<em></em>可网络验证系统(KSREG)&nbsp;<em></em>、侦探公司、黑客安全类、易受攻击影响网络稳定的等类型的网站。我司有严格的监控措施，一经发现，立即永久关闭，并不退款！\r\n						</p>\r\n					</li>\r\n						</ul>', '1', 7, 32, '0', 'Windows和Linux平台任选'),
(8, 5, '山姆主机1型', '100M', '20G', '80', '山姆主机1型', '山姆主机1型', '山姆主机1型', 230, '<ul style="color:#333333;font-family:" font-size:12px;background-color:#ffffff;"="">\r\n<li>\r\n	&gt; Windows或者Linux平台\r\n</li>\r\n<li>\r\n	&gt; 100MB网页 附送邮局\r\n</li>\r\n<li>\r\n	&gt; 支持ASP(Windows)/PHP(Linux)\r\n</li>\r\n<li>\r\n	&gt; Access、20M MSSQL数据库(Windows)/20M MySQL数据库(Linux)\r\n</li>\r\n<li>\r\n	&gt; 美国电讯主干数据中心\r\n</li>\r\n<li>\r\n	&gt; 全球访问高速稳定\r\n</li>\r\n<li>\r\n	&gt; 中小型外贸企业建站首选\r\n</li>\r\n	</ul>', 5, '<p class="sub-info-title" style="font-size:28px;color:#333333;font-family:" background-color:#ffffff;"="">\r\n	Windows系统支持功能/组件详情:\r\n<div class="div3" style="margin:30px 0px 0px;padding:0px;font-family:微软雅黑;font-size:14px;border:0px;">\r\n	<h3 style="font-size:16px;font-weight:normal;color:#333333;">\r\n		Windows系统支持功能/组件详情：\r\n	</h3>\r\n	<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#e5e5e5" class="ta1 ke-zeroborder" style="margin:0px;padding:0px;font-size:14px;">\r\n		<tbody>\r\n			<tr>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					Access数据库\r\n				</td>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					Asp脚本语言\r\n				</td>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					FSO组件\r\n				</td>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					Jmail组件\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					AspUpload组件\r\n				</td>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					AspJpeg组件\r\n				</td>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					动易组件\r\n				</td>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div class="div3" style="margin:30px 0px 0px;padding:0px;font-family:微软雅黑;font-size:14px;border:0px;">\r\n	<h3 style="font-size:16px;font-weight:normal;color:#333333;">\r\n		Linux系统支持功能/组件详情：\r\n	</h3>\r\n	<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#e5e5e5" class="ta1 ke-zeroborder" style="margin:0px;padding:0px;font-size:14px;">\r\n		<tbody>\r\n			<tr>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					MySQL数据库空间：<span style="color:#3087D8;">30M</span>\r\n				</td>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					MySQL数据库个数：<span style="color:#3087D8;">1个</span>\r\n				</td>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					phpMyAdmin管理面板\r\n				</td>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					PHP脚本语言\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					Zend加密程序\r\n				</td>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					支持Sqlite数据库\r\n				</td>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n				</td>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div class="div3" style="margin:30px 0px 0px;padding:0px;font-family:微软雅黑;font-size:14px;border:0px;">\r\n	<h3 style="font-size:16px;font-weight:normal;color:#333333;">\r\n		其它及注意事项：\r\n	</h3>\r\n	<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#e5e5e5" class="ta1 ke-zeroborder" style="margin:0px;padding:0px;font-size:14px;">\r\n		<tbody>\r\n			<tr>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					月流量限制：<span style="color:#3087D8;">20000M/月</span>\r\n				</td>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					并发连接数：<span style="color:#3087D8;">150个</span>\r\n				</td>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					免费三级域名\r\n				</td>\r\n				<td width="25%" bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					主机控制面板\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					购买实时开通\r\n				</td>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					数据定期备份\r\n				</td>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					千兆防火墙\r\n				</td>\r\n				<td bgcolor="#f2f2f2" style="font-family:微软雅黑;font-size:14px;color:#555555;">\r\n					不间断电源：<br />\r\n<span style="color:#3087D8;">双路市电+UPS+后备发电机</span>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div class="div4" style="margin:40px 0px 0px;padding:0px;font-family:微软雅黑;font-size:14px;border:0px;">\r\n	<h3 style="font-size:16px;font-weight:normal;text-align:center;background:#E0F0FF;color:#3087D8;">\r\n		<span style="font-weight:bold;">技术支持：</span>&nbsp;7×24小时在线提问系统及客服热线：020-66849155 66849156 66849157\r\n	</h3>\r\n</div>\r\n	</p>\r\n<ul class="list-info clearfix" style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">\r\n	<li style="color:#555555;">\r\n	</li>\r\n	<li style="color:#555555;">\r\n	</li>\r\n	<li style="color:#555555;">\r\n	</li>\r\n	<li style="color:#555555;">\r\n	</li>\r\n	<li style="color:#555555;">\r\n	</li>\r\n	<li style="color:#555555;">\r\n	</li>\r\n	<li style="color:#555555;">\r\n	</li>\r\n	<li class="spec" style="color:#555555;">\r\n	</li>\r\n	<li class="spec" style="color:#555555;">\r\n		<p>\r\n			<strong class="tip-error"></strong>\r\n		</p>\r\n		<p class="alert alert-error" style="background-color:#F2DEDE;color:#B94A48;">\r\n			<em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em><em></em>\r\n		</p>\r\n	</li>\r\n		</ul>', '1', 8, 28, '0', 'Windows和Linux平台任选');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_config`
--

CREATE TABLE IF NOT EXISTS `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `onethink_config`
--

INSERT INTO `onethink_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '亿维云网', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '欢迎来到亿维云网，开始您的互联网之旅！', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '亿维云,域名注册,虚拟主机,企业邮箱', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, 'Copyright© 深圳市千佰特科技有限公司 粤ICP备12011307号-1 QBTECH.All Rights Reserved', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_cp_price`
--

CREATE TABLE IF NOT EXISTS `onethink_cp_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(10) unsigned NOT NULL COMMENT '新一代产品id',
  `type_id` char(10) NOT NULL DEFAULT '1' COMMENT '线路类型',
  `one_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '1年价格',
  `two_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '2年价格',
  `three_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '3年价格',
  `four_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '4年价格',
  `five_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '5年价格',
  `six_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '6年价格',
  `seven_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '7年价格',
  `eight_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '8年价格',
  `nine_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '9年价格',
  `ten_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '10年价格',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商城商品id',
  `os_type` char(10) NOT NULL DEFAULT '1' COMMENT '主机类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `onethink_cp_price`
--

INSERT INTO `onethink_cp_price` (`id`, `product_id`, `type_id`, `one_price`, `two_price`, `three_price`, `four_price`, `five_price`, `six_price`, `seven_price`, `eight_price`, `nine_price`, `ten_price`, `pid`, `os_type`) VALUES
(1, 492, '1', '280.00', '560.00', '840.00', '1120.00', '1400.00', '1680.00', '1960.00', '2240.00', '2520.00', '2800.00', 3, '1'),
(2, 488, '1', '240.00', '480.00', '720.00', '960.00', '1200.00', '1440.00', '1680.00', '1920.00', '2160.00', '2400.00', 1, '1,2'),
(3, 484, '1', '380.00', '760.00', '1140.00', '1520.00', '1900.00', '2280.00', '2660.00', '3040.00', '3420.00', '3800.00', 4, '1'),
(4, 479, '1', '240.00', '480.00', '720.00', '960.00', '1200.00', '1440.00', '1680.00', '1920.00', '2160.00', '2400.00', 5, '1'),
(5, 3149, '2', '280.00', '560.00', '840.00', '1120.00', '1400.00', '1680.00', '1960.00', '2240.00', '2520.00', '2800.00', 6, '1'),
(6, 463, '3', '340.00', '680.00', '1020.00', '1360.00', '1700.00', '2040.00', '2380.00', '2720.00', '3060.00', '3400.00', 6, '1'),
(7, 464, '4', '440.00', '880.00', '1320.00', '1760.00', '2200.00', '2640.00', '3080.00', '3520.00', '3960.00', '4400.00', 6, '1'),
(8, 3151, '2', '380.00', '760.00', '1140.00', '1520.00', '1900.00', '2280.00', '2660.00', '3040.00', '3420.00', '3800.00', 7, '1,2'),
(9, 230, '5', '280.00', '560.00', '840.00', '1120.00', '1400.00', '1680.00', '1960.00', '2240.00', '2520.00', '2800.00', 8, '1,2');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_cuser`
--

CREATE TABLE IF NOT EXISTS `onethink_cuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(40) NOT NULL COMMENT '邮箱地址',
  `username` varchar(10) NOT NULL COMMENT '用户姓名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `address` varchar(40) NOT NULL COMMENT '地址',
  `sex` char(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `qq` varchar(40) NOT NULL COMMENT 'QQ号码',
  `reg_time` varchar(100) NOT NULL COMMENT '注册时间',
  `reg_ip` varchar(255) NOT NULL COMMENT '注册IP',
  `update_time` varchar(100) NOT NULL COMMENT '更新时间',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `last_login_time` varchar(100) NOT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(100) NOT NULL COMMENT '最后登陆IP',
  `account` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `onethink_cuser`
--

INSERT INTO `onethink_cuser` (`id`, `email`, `username`, `password`, `mobile`, `address`, `sex`, `qq`, `reg_time`, `reg_ip`, `update_time`, `status`, `last_login_time`, `last_login_ip`, `account`, `login`) VALUES
(1, 'guanghong2012@126.com', '李志', '1625a05770c3ee32d06130866fc25d7f', '13533481813', '广州天河区科韵路255号', '1', '7778858', '1488359582', '0', '1488359413', '1', '1488448251', '0', '9797.00', 1),
(3, 'develop12@qbt8.com', '骚刚', '37e36e59794dd65d98006b57ef95af42', '13580128021', '科韵路255号', '1', '', '1487572646', '0', '1487572646', '1', '1487571279', '0', '90.00', 2),
(4, 'develop13@qbt8.com', '八嘎', '1625a05770c3ee32d06130866fc25d7f', '', '', '0', '', '1487558784', '0', '1487558784', '1', '', '', '0.00', 0),
(5, 'develop21@qbt8.com', '曙光', '1625a05770c3ee32d06130866fc25d7f', '13570456594', '白云区', '0', '', '1487558993', '0', '1487558993', '1', '1488201813', '0', '0.00', 1),
(6, 'laohuang@126.com', '隔壁老黄', '1625a05770c3ee32d06130866fc25d7f', '13580127425', '广东省汕尾市陆丰市', '0', '', '1488264921', '0', '1488264921', '1', '1488264966', '0', '0.00', 1),
(8, 'juntang@126.com', '林俊堂', '1625a05770c3ee32d06130866fc25d7f', '18576815110', '广东省东莞市樟木头', '0', '', '1488265595', '0', '1488265595', '1', '', '', '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document`
--

CREATE TABLE IF NOT EXISTS `onethink_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `onethink_document`
--

INSERT INTO `onethink_document` (`id`, `uid`, `name`, `title`, `category_id`, `group_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(3, 1, '', '公司简介', 49, 0, '创建于2008年，公司先后在广州、重庆、西安、贵阳先后成立分公司。', 0, 0, 7, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1487231390, 1487231390, 1),
(2, 1, '', 'MySQL+ ServHA Mirror共享存储双机热备配置教程(Linux)', 40, 0, 'MySQL+ ServHA Mirror共享存储双机热备配置教程(Linux)PDF', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 9, 0, 0, 0, 1487229617, 1487229651, 1),
(4, 1, '', '广东省守合同重信用企业', 50, 0, '', 0, 0, 8, 2, 0, 0, 2, 1, 0, 0, 0, 0, 0, 2, 1487232209, 1487232209, 1),
(5, 1, '', '广东省中小企业发展促进会常务理事', 50, 0, '', 0, 0, 8, 2, 0, 0, 3, 1, 0, 0, 0, 0, 0, 1, 1487232291, 1487232291, 1),
(6, 1, '', 'pptv', 51, 0, '', 0, 0, 9, 2, 0, 0, 4, 1, 0, 0, 0, 0, 0, 1, 1487234030, 1487234030, 1),
(7, 1, '', '年前我们求敬业福，年后我们敬业求福', 53, 0, '年前我们求敬业福，年后我们敬业求福', 0, 0, 10, 2, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 1487234409, 1487234532, 1),
(8, 1, '', '百度长时间不收录上线网站，这是搞哪样？', 54, 0, '百度长时间不收录上线网站，这是搞哪样？', 0, 0, 10, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1487234854, 1487234894, 1),
(9, 1, '', '备案中心', 55, 0, '备案中心', 0, 0, 10, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1487235598, 1487235663, 1),
(10, 1, '', '联系我们', 56, 0, '', 0, 0, 11, 2, 0, 0, 7, 1, 0, 0, 0, 0, 0, 0, 1487389157, 1487389157, 1),
(11, 1, '', '自动开通', 58, 0, '我们产品实现在线付款后实时开通，无需等待人工审核。', 0, 0, 12, 2, 0, 0, 9, 1, 0, 0, 0, 0, 0, 6, 1487312410, 1487312410, 1),
(12, 1, '', '弹性升级', 58, 0, '根据用户使用需求可随时进行主机升级。', 0, 0, 12, 2, 0, 0, 10, 1, 0, 0, 0, 0, 0, 5, 1487312434, 1487312434, 1),
(13, 1, '', '免费使用', 58, 0, '0元免费试用，先试用再购买，确保购买都是满意的产品。', 0, 0, 12, 2, 0, 0, 11, 1, 0, 0, 0, 0, 0, 4, 1487312457, 1487312457, 1),
(14, 1, '', '技术响应与技术支持', 58, 0, '提供7*24技术支持，电话、工单支持，10分钟快速响应。', 0, 0, 12, 2, 0, 0, 12, 1, 0, 0, 0, 0, 0, 3, 1487312480, 1487312480, 1),
(15, 1, '', '故障修复', 58, 0, '任何故障问题，都将能在5小时之内处理完毕，让您没有后顾之忧。', 0, 0, 12, 2, 0, 0, 13, 1, 0, 0, 0, 0, 0, 2, 1487312505, 1487312505, 1),
(16, 1, '', '安全数据中心网络平台', 58, 0, '为整个数据中心业务提供计算环境安全区域边界安全、通信网络安全。', 0, 0, 12, 2, 0, 0, 14, 1, 0, 0, 0, 0, 0, 1, 1487312526, 1487312526, 1),
(17, 1, '', '查看web的并发请求数及其TCP连接状态', 43, 0, '查看web的并发请求数及其TCP连接状态', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487319875, 1487319908, 1),
(18, 1, '', '我的ftp无法登陆', 41, 0, '我的ftp无法登陆', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487319913, 1487319962, 1),
(19, 1, '', '虚拟主机诊断简介', 42, 0, '虚拟主机诊断简介', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487319967, 1487320014, 1),
(20, 1, '', '如何对MYSQL数据库进行管理', 44, 0, '如何对MYSQL数据库进行管理', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487320050, 1487320062, 1),
(21, 1, '', '备份说明', 45, 0, '备份说明', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1487320091, 1487320105, 1),
(22, 1, '', '建站问题1', 46, 0, '建站问题1', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1487320109, 1487320121, 1),
(23, 1, '', '负载均衡说明', 47, 0, '负载均衡说明', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1487320125, 1487320141, 1),
(24, 1, '', '测试文章2', 40, 0, '测试文章2', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1487325787, 1487325800, 1),
(25, 1, '', '测试文章3', 40, 0, '测试文章3', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1487325803, 1487325814, 1),
(26, 1, '', '测试文章4', 40, 0, '测试文章4', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1487325817, 1487325828, 1),
(27, 1, '', '测试文章5', 40, 0, '测试文章5', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1487325831, 1487325843, 1),
(28, 1, '', '测试文章6', 40, 0, '测试文章6', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 8, 0, 0, 0, 1487325846, 1487325856, 1),
(29, 1, '', '亿维云网新一代虚拟机发售', 59, 0, '亿维云网新一代虚拟机发售', 0, 0, 10, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1487383010, 1487383040, 1),
(30, 1, '', '新浪微博', 51, 0, '', 0, 0, 9, 2, 0, 0, 15, 1, 0, 0, 0, 0, 0, 2, 1487386355, 1487386355, 1),
(31, 1, '', '小咖秀', 51, 0, '', 0, 0, 9, 2, 0, 0, 16, 1, 0, 0, 0, 0, 0, 3, 1487386379, 1487386379, 1),
(32, 1, '', '美柚', 51, 0, '', 0, 0, 9, 2, 0, 0, 17, 1, 0, 0, 0, 0, 0, 4, 1487386399, 1487386399, 1),
(33, 1, '', '驴妈妈旅游', 51, 0, '', 0, 0, 9, 2, 0, 0, 18, 1, 0, 0, 0, 0, 0, 5, 1487386424, 1487386424, 1),
(34, 1, '', '.top域名', 61, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488268772, 1488268772, 1),
(35, 1, '', '.com域名', 61, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488276095, 1488276095, 1),
(36, 1, '', '.cn域名', 61, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488276108, 1488276108, 1),
(37, 1, '', '.shop域名', 61, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488273369, 1488273369, 1),
(38, 1, '', '.club', 61, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488268954, 1488268954, 1),
(39, 1, '', '.shop域名', 62, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488268986, 1488268986, 1),
(40, 1, '', '.中国', 63, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488269008, 1488269008, 1),
(41, 1, '', '.love域名', 66, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488269040, 1488269040, 1),
(42, 1, '', '.site', 61, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488269074, 1488269074, 1),
(43, 1, '', '.net', 61, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488276120, 1488276120, 1),
(44, 1, '', '.cc', 62, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488269120, 1488269120, 1),
(45, 1, '', '.wang', 62, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488269155, 1488269155, 1),
(46, 1, '', '.xin', 62, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488269176, 1488269176, 1),
(47, 1, '', '.china', 64, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488269208, 1488269208, 1),
(48, 1, '', '.com.cn', 65, 0, '', 0, 0, 24, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1488269227, 1488269227, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_aboutus`
--

CREATE TABLE IF NOT EXISTS `onethink_document_aboutus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `video` varchar(255) NOT NULL COMMENT '视频地址',
  `content` text NOT NULL COMMENT '文章内容',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_document_aboutus`
--

INSERT INTO `onethink_document_aboutus` (`id`, `video`, `content`, `keywords`) VALUES
(3, '', '<h2 class="h_tith" style="font-family:微软雅黑;font-size:32px;font-weight:normal;color:#191B1D;text-align:center;background-color:#F2F2F2;">\r\n	我们的成就\r\n</h2>\r\n<br />\r\n<p style="font-family:微软雅黑;font-size:14px;color:#555555;text-align:center;background-color:#F2F2F2;">\r\n	创建于2008年，公司先后在广州、重庆、西安、贵阳先后成立分公司。为客户持续创造价值。\r\n</p>\r\n<p style="font-family:微软雅黑;font-size:14px;color:#555555;text-align:center;background-color:#F2F2F2;">\r\n	致力为企业提供全面的网络宣传与技术应用整体策划方案，真正实现企业互联网信息智能化，提高企业在网络科技时代的市场竞争力。\r\n</p>\r\n<p style="font-family:微软雅黑;font-size:14px;color:#555555;text-align:center;background-color:#F2F2F2;">\r\n	公司将坚持客户导向、应用为本的策略，继续专注于在信息技术领域开拓发展成为企业、政府、家庭信息化的推动者和服务者。\r\n</p>\r\n<p style="font-family:微软雅黑;font-size:14px;color:#555555;text-align:center;background-color:#F2F2F2;">\r\n	正道将秉承"和谐、参与、激情"的文化，与客户和合作伙伴齐心协力一起成长，共同发展。\r\n</p>', '千佰特科技');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_advantage`
--

CREATE TABLE IF NOT EXISTS `onethink_document_advantage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keywords` varchar(10) NOT NULL COMMENT '关键字',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `onethink_document_advantage`
--

INSERT INTO `onethink_document_advantage` (`id`, `keywords`) VALUES
(11, ''),
(12, ''),
(13, ''),
(14, ''),
(15, ''),
(16, '');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_article`
--

CREATE TABLE IF NOT EXISTS `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_contact`
--

CREATE TABLE IF NOT EXISTS `onethink_document_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tel` varchar(255) NOT NULL COMMENT '联系电话',
  `fax` varchar(255) NOT NULL COMMENT '传真',
  `website` varchar(255) NOT NULL COMMENT '网站地址',
  `email` varchar(50) NOT NULL COMMENT '邮箱地址',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `consults` text NOT NULL COMMENT '在线咨询QQ',
  `rent` varchar(50) NOT NULL COMMENT '租用托管联系',
  `hot_line` varchar(20) NOT NULL COMMENT '400电话',
  `wechact` int(10) unsigned NOT NULL COMMENT '二维码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `onethink_document_contact`
--

INSERT INTO `onethink_document_contact` (`id`, `tel`, `fax`, `website`, `email`, `address`, `consults`, `rent`, `hot_line`, `wechact`) VALUES
(10, '0755-83586660  0755-83583158', '0755-81780330', 'http://www.qbt8.com', 'info@qbt8.com', '深圳市福田区国际电子商务产业园科技楼805', '2066594824,2028565641,3293034405', '0755-81780330 转 8011 | 8028 | 8041 ', '400-066-9987', 8);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_domain`
--

CREATE TABLE IF NOT EXISTS `onethink_document_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tld` varchar(10) NOT NULL COMMENT '域名后缀',
  `type_id` char(10) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `is_checked` char(2) NOT NULL DEFAULT '0' COMMENT '是否选中',
  `lang` char(10) NOT NULL DEFAULT 'ENG' COMMENT '域名语言',
  `encoding` char(10) NOT NULL DEFAULT 'ASCII' COMMENT '域名编码',
  `is_commonuse` char(2) NOT NULL DEFAULT '0' COMMENT '是否常用域名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `onethink_document_domain`
--

INSERT INTO `onethink_document_domain` (`id`, `tld`, `type_id`, `is_checked`, `lang`, `encoding`, `is_commonuse`) VALUES
(34, '.top', '1', '1', 'ENG', 'ASCII', '0'),
(35, '.com', '2', '1', 'ENG', 'ASCII', '1'),
(36, '.cn', '2', '1', 'ENG', 'ASCII', '1'),
(37, '.shop', '2', '0', 'CHI', 'UTF-8', '0'),
(38, '.club', '1', '0', 'ENG', 'ASCII', '0'),
(39, '.shop', '2', '1', 'ENG', 'ASCII', '0'),
(40, '.中国', '2', '1', 'CHI', 'UTF-8', '0'),
(41, '.love', '0', '1', 'ENG', 'ASCII', '0'),
(42, '.site', '0', '0', 'ENG', 'ASCII', '0'),
(43, '.net', '0', '0', 'ENG', 'ASCII', '1'),
(44, '.cc', '0', '0', 'ENG', 'ASCII', '0'),
(45, '.wang', '2', '1', 'ENG', 'ASCII', '0'),
(46, '.xin', '1', '0', 'ENG', 'ASCII', '0'),
(47, '.china', '0', '1', 'ENG', 'ASCII', '0'),
(48, '.com.cn', '0', '1', 'ENG', 'ASCII', '0');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_download`
--

CREATE TABLE IF NOT EXISTS `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_help`
--

CREATE TABLE IF NOT EXISTS `onethink_document_help` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `author` varchar(10) NOT NULL DEFAULT '亿维云' COMMENT '作者',
  `content` text NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `onethink_document_help`
--

INSERT INTO `onethink_document_help` (`id`, `keywords`, `author`, `content`) VALUES
(2, 'MySQL+ ServHA Mirror共享存储双机热备配置教程(Linux)PDF', '亿维云', '<h3 style="font-family:微软雅黑;font-size:18px;font-weight:normal;text-align:center;background-color:#FFFFFF;">\r\n	MySQL+ ServHA Mirror共享存储双机热备配置教程(Linux)PDF\r\n</h3>\r\n<p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		本文以 MySQL 为例，介绍通过 MicroColor ServHA Cluster for Linux 配置 MySQL 共享磁盘阵列\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		双机容错集群。\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		主要步骤：\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		一、 配置防火墙\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		二、 安装并配置 ServHA Cluster\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		三、 安装并配置 MySQL。\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		四、 将 MySQL 服务交由集群管理。\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		注意事项：\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		一、 MySQL 配置双机集群方案要求两机都安装 MySQL， 数据库文件放在共享盘内。\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		二、 在配置安装 MySQL 前， 请先配置 ServHA Cluster 将共享盘交由集群管理,以免双机\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		同时访问共享盘,造成数据异常（下面会详细介绍操作步骤）。\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		三、 两机的 MySQL 安装配置必须完全相同。\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		四、 如果遇到权限问题导致 MySQL 无法启动，请自行根据日志配置用户权限，本文档\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		不再赘述。\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">\r\n		五、 远程无法连接 MySQL 时，请用户自行设置 MySQL 白名单，本文档不在赘述。\r\n	</p>\r\n</p>'),
(17, '查看web的并发请求数及其TCP连接状态', '亿维云', '<span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">1</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">、查看内存占用最大的进程的命令</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">:<br />\r\nps aux| grep -v "USER" | sort -n -r -k 4 | awk ''NR==1{ print $0}''<br />\r\n<br />\r\n2</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">、查看所有建立连接的详细记录</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nnetstat -nat|grep ESTABLISHED|wc -l<br />\r\nnetstat -an | grep ESTABLISHED | wc -l<br />\r\n<br />\r\n3</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">、查看系统</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">tcp</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">连接中各个状态的连接数</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">/</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">查看</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">web</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">的并发请求数及其</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">TCP</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">连接状态</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nnetstat -an | awk ''/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}''<br />\r\n<br />\r\n4</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">、输出每个</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">ip</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">的连接数，以及总的各个状态的连接数。</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nnetstat -n | awk ''/^tcp/ {n=split($(NF-1),array,":");if(n&lt;=2)++S[array[(1)]];else++S[array[(4)]];++s[$NF];++N} END {for(a in S){printf("%-20s %sn", a, S[a]);++I}printf("%-20s %sn","TOTAL_IP",I);for(a in s) printf("%-20s %sn",a, s[a]);printf("%-20s %sn","TOTAL_LINK",N);}''<br />\r\n<br />\r\n5</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">、</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">TCP</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">连接状态详解</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">&nbsp;<br />\r\nLISTEN</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">侦听来自远方的</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">TCP</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">端口的连接请求</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nSYN-SENT</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">&nbsp;&nbsp; &nbsp; &nbsp;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">再发送连接请求后等待匹配的连接请求</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nSYN-RECEIVED</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：再收到和发送一个连接请求后等待对方对连接请求的确认</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nESTABLISHED</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：代表一个打开的连接</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nFIN-WAIT-1</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">&nbsp;&nbsp; &nbsp;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">等待远程</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">TCP</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">连接中断请求，或先前的连接中断请求的确认</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nFIN-WAIT-2</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">从远程</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">TCP</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">等待连接中断请求</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nCLOSE-WAIT</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：等待从本地用户发来的连接中断请求</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nCLOSING</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">&nbsp;&nbsp; &nbsp; &nbsp;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">等待远程</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">TCP</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">对连接中断的确认</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nLAST-ACK</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">&nbsp;&nbsp; &nbsp;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">等待原来的发向远程</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">TCP</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">的连接中断请求的确认</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nTIME-WAIT</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">&nbsp;&nbsp;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">等待足够的时间以确保远程</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">TCP</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">接收到连接中断请求的确认</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"><br />\r\nCLOSED</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">：</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">&nbsp;&nbsp; &nbsp; &nbsp;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:宋体;">没有任何连接状态</span>'),
(18, '我的ftp无法登陆', '亿维云', '<span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">出现无法登陆的时候请提供PING图、TRACERT图和本地IP给我司，检查本地是否能TELNET通该服务器的21端口，不通的话请关闭本地防火墙尝试。需注意的是FTP密码不能超过16位。</span>'),
(19, '虚拟主机诊断简介', '亿维云', '<span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:微软雅黑, sans-serif;">主机控制面板新增“虚拟主机诊断”功能，具体位置在“主机控制面板</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">-&gt;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:微软雅黑, sans-serif;">网站基础环境配置</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">-&gt;</span><span style="color:#333333;font-size:12px;background-color:#FFFFFF;font-family:微软雅黑, sans-serif;">虚拟主机诊断“中找到，如下图：</span><span style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;"></span>\r\n<p class="MsoNormal" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	<img alt="" src="http://cms.gzidc.com/Uploads/201612/5853a6c82dc7d.png" style="height:auto;" /><span style="font-family:微软雅黑, sans-serif;"></span>\r\n</p>\r\n<p class="MsoNormal" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	<span style="font-family:微软雅黑, sans-serif;">虚拟主机状态：指的是你当前虚拟空间的使用状态情况。</span>\r\n</p>\r\n<p class="MsoNormal" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	80<span style="font-family:微软雅黑, sans-serif;">端口是否正常：指的是虚拟主机的网页服务端口是否正常。</span>\r\n</p>\r\n<p class="MsoNormal" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	IP<span style="font-family:微软雅黑, sans-serif;">通信：指的是虚拟主机</span>IP<span style="font-family:微软雅黑, sans-serif;">地址是否正常连同。</span>\r\n</p>\r\n<p class="MsoNormal" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	<span style="font-family:微软雅黑, sans-serif;">域名解析和绑定：指的是当前虚拟主机中绑定的域名解析的</span>IP<span style="font-family:微软雅黑, sans-serif;">地址是否正确。</span>\r\n</p>\r\n<p class="MsoNormal" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	<span style="font-family:微软雅黑, sans-serif;">诊断</span>FTP<span style="font-family:微软雅黑, sans-serif;">能否登录：指的是检查虚拟主机的</span>FTP<span style="font-family:微软雅黑, sans-serif;">服务是否正确启动。</span>\r\n</p>\r\n<p class="MsoNormal" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	<span style="font-family:微软雅黑, sans-serif;">如出现非正常状态，可通过服务支持联系我司提交进行处理。</span>\r\n</p>'),
(20, '如何对MYSQL数据库进行管理', '亿维云', '<p class="p0" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	主机控制面板里带有MYSQL的PhpMyAdmin控制面板，包括上传，备份，操作数据库表等都在那里可以操作。\r\n</p>\r\n<p class="p0" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	<br />\r\n导入操作：打开了PhpMyAdmin控制面板，点左边的库名，再点右上角的"SQL"链接，下面会有一个浏览文件。只需要把你的SQL脚本选中然后上传就可。\r\n</p>\r\n<p class="p0" style="color:#333333;font-family:&quot;font-size:12px;background-color:#FFFFFF;">\r\n	<br />\r\n导出操作：点击右上角的"导出"链接，然后选择要导出的表，再提勾另存为文件，点确定导出成SQL脚本文件。\r\n</p>'),
(21, '备份说明', '亿维云', '备份说明'),
(22, '建站问题1', '亿维云', '建站问题1建站问题1建站问题1'),
(23, '负载均衡说明', '亿维云', '负载均衡说明'),
(24, '测试文章2', '亿维云', '测试文章2'),
(25, '测试文章3', '亿维云', '测试文章3'),
(26, '测试文章4', '亿维云', '测试文章4'),
(27, '测试文章5', '亿维云', '测试文章5'),
(28, '测试文章6', '亿维云', '测试文章6');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_honor`
--

CREATE TABLE IF NOT EXISTS `onethink_document_honor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `onethink_document_honor`
--

INSERT INTO `onethink_document_honor` (`id`, `keywords`) VALUES
(4, '广东省守合同重信用企业'),
(5, '广东省中小企业发展促进会常务理事');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_news`
--

CREATE TABLE IF NOT EXISTS `onethink_document_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `content` text NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `onethink_document_news`
--

INSERT INTO `onethink_document_news` (`id`, `keywords`, `content`) VALUES
(7, '年前我们求敬业福，年后我们敬业求福', '<span style="color:#333333;background-color:#FFFFFF;font-size:16px;font-family:&quot;">这么远，那么快，春节</span><span style="color:#333333;background-color:#FFFFFF;font-size:16px;font-family:&quot;">7</span><span style="color:#333333;background-color:#FFFFFF;font-size:16px;font-family:&quot;">天长假眨眼就过去了，我们又开始奋斗。</span>'),
(8, '百度长时间不收录上线网站，这是搞哪样？', '百度长时间不收录上线网站，这是搞哪样？'),
(9, '备案中心', '这里是备案中心内容展示区'),
(29, '亿维云网新一代虚拟机发售', '亿维云网新一代虚拟机发售');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_partner`
--

CREATE TABLE IF NOT EXISTS `onethink_document_partner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(100) NOT NULL DEFAULT '#' COMMENT '链接地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `onethink_document_partner`
--

INSERT INTO `onethink_document_partner` (`id`, `url`) VALUES
(6, '#'),
(30, '#'),
(31, '#'),
(32, '#'),
(33, '#');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_file`
--

CREATE TABLE IF NOT EXISTS `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_hooks`
--

CREATE TABLE IF NOT EXISTS `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `onethink_hooks`
--

INSERT INTO `onethink_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1),
(17, 'UploadImages', '多图上传', 1, 1488422861, 'UploadImages', 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_mail`
--

CREATE TABLE IF NOT EXISTS `onethink_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(10) unsigned NOT NULL COMMENT '新一代产品id',
  `name` varchar(10) NOT NULL COMMENT '产品名称',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '基本价格/年',
  `usernum` int(2) unsigned NOT NULL DEFAULT '5' COMMENT '邮箱用户数',
  `space` varchar(10) NOT NULL COMMENT '每个用户邮箱容量',
  `extra_price` decimal(10,2) unsigned NOT NULL COMMENT '额外邮箱单价',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `onethink_mail`
--

INSERT INTO `onethink_mail` (`id`, `product_id`, `name`, `price`, `usernum`, `space`, `extra_price`) VALUES
(1, 3111, '全球邮', '480.00', 5, '10G', '96.00');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_member`
--

CREATE TABLE IF NOT EXISTS `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `onethink_member`
--

INSERT INTO `onethink_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', 0, '0000-00-00', '', 70, 16, 0, 1487144121, 0, 1488418802, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_menu`
--

CREATE TABLE IF NOT EXISTS `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=158 ;

--
-- 转存表中的数据 `onethink_menu`
--

INSERT INTO `onethink_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 1),
(2, '内容', 0, 2, 'Article/index', 0, '', '', 0, 1),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0, 1),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0, 1),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0, 1),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0, 1),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0, 1),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0, 1),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0, 1),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0, 1),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0, 1),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0, 1),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0, 1),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0, 1),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0, 1),
(16, '后台用户', 0, 3, 'User/index', 0, '', '', 0, 1),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0, 1),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0, 1),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0, 1),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0, 1),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0, 1),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0, 1),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0, 1),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0, 1),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0, 1),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0, 1),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0, 1),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, 1),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, 1),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0, 1),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, 1),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, 1),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0, 1),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0, 1),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0, 1),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0, 1),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0, 1),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0, 1),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0, 1),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0, 1),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0, 1),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0, 1),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, 1),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, 1),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, 1),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, 1),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0, 1),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0, 1),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0, 1),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0, 1),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, 1),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, 1),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0, 1),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, 1),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0, 1),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0, 1),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0, 1),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0, 1),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0, 1),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0, 1),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0, 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0, 1),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0, 1),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0, 1),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0, 1),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0, 1),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0, 1),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0, 1),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, 1),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0, 1),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0, 1),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0, 1),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0, 1),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0, 1),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0, 1),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0, 1),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0, 1),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0, 1),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0, 1),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0, 1),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0, 1),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0, 1),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0, 1),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0, 1),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0, 1),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0, 1),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0, 1),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0, 1),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0, 1),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0, 1),
(93, '其他', 0, 5, 'other', 1, '', '', 0, 1),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0, 1),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0, 1),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0, 1),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0, 1),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0, 1),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0, 1),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0, 1),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0, 1),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0, 1),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0, 1),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0, 1),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0, 1),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0, 1),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0, 1),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0, 1),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0, 1),
(122, '数据列表', 58, 0, 'think/lists', 1, '', '', 0, 1),
(123, '审核列表', 3, 0, 'Article/examine', 1, '', '', 0, 1),
(124, '前台用户', 0, 4, 'Cuser/index', 0, '前台用户', '', 0, 1),
(125, '用户列表', 124, 1, 'Cuser/index', 0, '', '用户管理', 0, 1),
(126, '用户添加', 124, 2, 'Cuser/add', 1, '前台用户添加', '用户管理', 0, 1),
(127, '用户编辑', 124, 3, 'Cuser/edit', 1, '', '用户管理', 0, 1),
(128, '调节用户资金', 124, 4, 'Cuser/changeAccount', 1, '', '用户管理', 0, 1),
(129, '查看用户资金记录', 124, 5, 'Cuser/accountLog', 1, '', '用户管理', 0, 1),
(130, '客户案例', 0, 6, 'Cases/index', 0, '', '', 0, 1),
(131, '案例类别', 130, 1, 'Cases/index', 0, '', '案例', 0, 1),
(132, '编辑案例分类', 130, 2, 'Cases/editCate', 1, '', '案例', 0, 1),
(133, '新增案例分类', 130, 3, 'Cases/addCate', 1, '', '案例', 0, 1),
(134, '新增案例', 130, 5, 'Cases/addDemo', 1, '', '案例', 0, 1),
(135, '客户案例列表', 130, 6, 'Cases/demoList', 1, '', '案例', 0, 1),
(136, '编辑客户案例', 130, 7, 'Cases/editDemo', 1, '', '案例', 0, 1),
(137, '虚拟主机', 0, 8, 'Cloud/cloudList', 0, '', '', 0, 1),
(138, '虚拟主机分类', 137, 1, 'Cloud/index', 0, '', '虚拟主机分类', 0, 1),
(139, '新增虚拟机分类', 137, 2, 'Cloud/addCate', 1, '', '虚拟主机分类', 0, 1),
(140, '编辑虚拟机分类', 137, 3, 'Cloud/editCate', 1, '', '虚拟主机分类', 0, 1),
(141, '虚拟机列表', 137, 4, 'Cloud/cloudList', 0, '', '虚拟机', 0, 1),
(142, '添加虚拟机', 137, 5, 'Cloud/addCloud', 1, '', '虚拟机', 0, 1),
(143, '编辑虚拟机', 137, 6, 'Cloud/editCloud', 1, '', '虚拟机', 0, 1),
(144, '价格列表', 137, 7, 'Cloud/priceList', 0, '', '虚拟机', 0, 1),
(145, '添加虚拟机价格', 137, 8, 'Cloud/addPrice', 1, '', '虚拟机', 0, 1),
(146, '编辑虚拟机价格', 137, 9, 'Cloud/editPrice', 1, '', '虚拟机', 0, 1),
(147, '云建站模板', 0, 9, 'Station/categoryList', 0, '', '', 0, 1),
(148, '模板分类', 147, 1, 'Station/categoryList', 0, '', '模板分类', 0, 1),
(149, '新增模板分类', 147, 2, 'Station/addCate', 1, '', '模板分类', 0, 1),
(150, '编辑模板分类', 147, 3, 'Station/editCate', 1, '', '模板分类', 0, 1),
(151, '模板列表', 147, 4, 'Station/templateList', 0, '', '模板', 0, 1),
(152, '新增模板', 147, 5, 'Station/addTemplate', 1, '', '模板', 0, 1),
(153, '编辑模板', 147, 7, 'Station/editTemplate', 1, '', '模板', 0, 1),
(154, '云服务端', 0, 9, 'Host/packageHostList', 0, '', '', 0, 1),
(155, '套餐云主机列表', 154, 1, 'Host/packageHostList', 0, '', '套餐云主机', 0, 1),
(156, '新增套餐云主机', 154, 2, 'Host/addPackageHost', 1, '', '套餐云主机', 0, 1),
(157, '编辑套餐云主机', 154, 3, 'Host/editPackageHost', 1, '', '套餐云主机', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_model`
--

CREATE TABLE IF NOT EXISTS `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `onethink_model`
--

INSERT INTO `onethink_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `attribute_alias`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","2","5"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891243, 1387260622, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM'),
(4, 'cuser', '前台用户', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1487144667, 1487144667, 1, 'MyISAM'),
(5, 'user_account_log', '用户资金明细', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1487212493, 1487212493, 1, 'MyISAM'),
(6, 'help', '帮助中心', 1, '', 1, '{"1":["3","52","5","53","16","20","54"]}', '1:基础', '22,21,3,52,5,53,16,20,54', '', '', '', '', 'id:ID\r\ntitle:标题\r\nauthor:作者\r\nkeywords:关键字\r\nview:浏览量\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1487228903, 1487229605, 1, 'MyISAM'),
(7, 'aboutus', '关于我们', 1, '', 1, '{"1":["3","57","5","55","12","56"]}', '1:基础', '12,3,57,56,5,55', 'cover_id:banner图（1920px*485px）', '', '', '', 'id:ID\r\ntitle:标题\r\nid:操作:[EDIT]|编辑', 10, '', '', 1487230682, 1487231077, 1, 'MyISAM'),
(8, 'honor', '荣誉', 1, '', 1, '{"1":["3","12","19","59"]}', '1:基础', '19,3,12,59', 'cover_id:荣誉图片（183px*120px）', '', '', '', 'id:ID\r\ntitle:标题\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1487231444, 1487232187, 1, 'MyISAM'),
(9, 'partner', '合作伙伴', 1, '', 1, '{"1":["3","60","19","12"]}', '1:基础', '19,12,3,60', 'cover_id:图片（283px*128px）', '', '', '', 'id:ID\r\ntitle:标题\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1487233795, 1487233961, 1, 'MyISAM'),
(10, 'news', '企业动态', 1, '', 1, '{"1":["3","61","5","16","20","19","12","62"]}', '1:基础', '16,22,21,12,20,19,3,62,5,61', 'cover_id:封面（210px*130px）', '', '', '', 'id:ID\r\ntitle:标题\r\nkeywords:关键字\r\nview:浏览量\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1487234106, 1487234356, 1, 'MyISAM'),
(11, 'contact', '联系我们', 1, '', 1, '{"1":["3","12","63","64","65","67","66","68","69","70","71"]}', '1:基础', '71,70,3,12,63,64,65,67,66,68,69', 'cover_id:图片（400px*250px）', '', '', '', 'id:ID\r\ntitle:标题\r\nid:操作:[EDIT]|编辑', 10, '', '', 1487235831, 1487237383, 1, 'MyISAM'),
(12, 'advantage', '亿维云优势', 1, '', 1, '{"1":["3","19","12","5"]}', '1:基础', '19,12,3,5', 'cover_id:图标（100px*100px）', '', '', '', 'id:ID\r\ntitle:标题\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1487312061, 1487312264, 1, 'MyISAM'),
(13, 'cases', '客户案例分类', 0, '', 1, '{"1":["73","74","75","76","77"]}', '1:基础', '', '', '', '', '', 'id:ID\r\ntitle:标题\r\nkeywords:关键字', 10, '', '', 1487395939, 1487402826, 1, 'MyISAM'),
(14, 'cases_demo', '客户案例', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1487402802, 1487402802, 1, 'MyISAM'),
(15, 'cart', '购物车', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1487745283, 1487745283, 1, 'MyISAM'),
(16, 'cloud_category', '虚拟主机分类', 0, '', 1, '{"1":["104","103","102","101"]}', '1:基础', '', '', '', '', '', 'id:ID\r\nname:名称', 10, '', '', 1487854845, 1487904752, 1, 'MyISAM'),
(17, 'cloud_product', '虚拟机产品', 0, '', 1, '{"1":["114","113","115","116","117","112","111","107","106","108","109","110","105"]}', '1:基础', '', '', '', '', '', 'id:ID\r\nname:名称', 10, '', '', 1487855264, 1487904897, 1, 'MyISAM'),
(18, 'cp_price', '虚拟机价格', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1487860533, 1487860533, 1, 'MyISAM'),
(19, 'order_goods', '订单产品', 0, '', 1, '{"1":["180","159","158","157","160","156","155","150","149","148","151","152","154","153","147"]}', '1:基础', '', '', '', '', '', 'id:ID', 10, '', '', 1488178780, 1488189285, 1, 'MyISAM'),
(20, 'paylog', '支付日志', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1488179762, 1488179762, 1, 'MyISAM'),
(21, 'order', '订单', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1488184157, 1488184157, 1, 'MyISAM'),
(22, 'user_domain', '用户域名产品', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1488245619, 1488245619, 1, 'MyISAM'),
(23, 'user_vitrual', '用户虚拟机产品', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1488246331, 1488246331, 1, 'MyISAM'),
(24, 'domain', '域名产品', 1, '', 1, '{"1":["3","201","19","204","205","206","203","202"]}', '1:基础', '3,206,201,19,204,205,203,202', '', '', '', '', 'id:ID\r\ntld:域名后缀\r\ntype_id:促销类型\r\nis_checked:是否选中\r\nis_commonuse:是否常用域名\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1488267065, 1488276072, 1, 'MyISAM'),
(25, 'station_category', '云网站模板类型', 0, '', 1, '{"1":["208","207"]}', '1:基础', '', '', '', '', '', 'id:ID\r\nis_pc:是否PC版\r\nname:模板名称', 10, '', '', 1488289069, 1488290051, 1, 'MyISAM'),
(26, 'station_template', '网站模板', 0, '', 1, '{"1":["213","214","212","211","210","209"]}', '1:基础', '', '', '', '', '', 'id:ID\r\nname:模板名称\r\nprice:模板价格', 10, '', '', 1488289336, 1488290018, 1, 'MyISAM'),
(27, 'user_template', '用户模板', 0, '', 1, '{"1":["221","222","220","219","218","217"]}', '1:基础', '', '', '', '', '', 'id:ID\r\nname:模板名称\r\ntemplate_id:模板id\r\ncreate_time:创建时间\r\nexpiry_time:到期时间\r\nstatus:产品状态', 10, '', '', 1488348328, 1488348685, 1, 'MyISAM'),
(28, 'mail', '全球邮', 0, '', 1, '{"1":["228","229","227","226","225","224"]}', '1:基础', '', '', '', '', '', 'id:ID\r\nname:名称\r\nprice:基本价格\r\nproduct_id:新一代产品id', 10, '', '', 1488355731, 1488356120, 1, 'MyISAM'),
(29, 'user_mail', '用户企业邮', 0, '', 1, '{"1":["236","237","235","234","232","233","231"]}', '1:基础', '', '', '', '', '', 'id:ID\r\nname:产品名称\r\ndomain:绑定域名\r\nspace:空间大小\r\nusernum:用户数\r\ncreate_time:创建时间\r\nexpiry_time:过期时间', 10, '', '', 1488359757, 1488360292, 1, 'MyISAM'),
(30, 'package_host', '套餐云主机', 0, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1488361348, 1488361348, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_order`
--

CREATE TABLE IF NOT EXISTS `onethink_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ordersn` varchar(40) NOT NULL COMMENT '订单号',
  `payment` char(2) NOT NULL DEFAULT '3' COMMENT '支付方式',
  `status` char(2) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `total` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `username` varchar(20) NOT NULL COMMENT '用户姓名',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `paytime` int(10) NOT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `onethink_order`
--

INSERT INTO `onethink_order` (`id`, `ordersn`, `payment`, `status`, `total`, `uid`, `username`, `mobile`, `create_time`, `paytime`) VALUES
(1, '1488251460', '3', '0', '241.00', 1, '李志', '13533481813', 1488251460, 0),
(2, '1488252747', '3', '1', '241.00', 1, '李志', '13533481813', 1488252747, 1488252747),
(3, '1488253227', '3', '1', '1.00', 1, '李志', '13533481813', 1488253227, 1488253227),
(7, '1488359582', '3', '1', '576.00', 1, '李志', '13533481813', 1488359582, 1488359582),
(6, '1488350103', '3', '1', '128.00', 1, '李志', '13533481813', 1488350103, 1488350103);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_order_goods`
--

CREATE TABLE IF NOT EXISTS `onethink_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `username` varchar(10) NOT NULL COMMENT '用户姓名',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `product_name` varchar(50) NOT NULL COMMENT '产品名称',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新一代产品id',
  `month` int(4) unsigned NOT NULL DEFAULT '12' COMMENT '购买月份',
  `base_total` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '基本总价',
  `added_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '增值总价',
  `type` char(10) NOT NULL COMMENT '产品类型',
  `subtotal` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '产品总价',
  `payment` char(2) NOT NULL DEFAULT '3' COMMENT '支付方式',
  `project` text NOT NULL COMMENT '方案描述',
  `parameters` text NOT NULL COMMENT '具体参数',
  `price_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟机价格id',
  `domain_info` text NOT NULL COMMENT '域名注册信息',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `buy_config` text NOT NULL COMMENT '用户购买配置信息',
  `product_status` char(2) NOT NULL DEFAULT '0' COMMENT '产品状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单产品' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `onethink_order_goods`
--

INSERT INTO `onethink_order_goods` (`id`, `uid`, `username`, `mobile`, `product_name`, `product_id`, `month`, `base_total`, `added_price`, `type`, `subtotal`, `payment`, `project`, `parameters`, `price_id`, `domain_info`, `order_id`, `buy_config`, `product_status`) VALUES
(1, 1, '李志', '13533481813', '.com域名', 0, 12, '1.00', '0.00', '1', '1.00', '3', '{"name":".com_ENG"}', '', 0, '{"r_organization":"\\u5343\\u4f70\\u7279\\u79d1\\u6280","r_organization1":"Qian Bai Te Ke Ji ","r_name":"\\u6768\\u5149","r_name1":"Yang Guang ","r_country":"CN","r_province":"\\u5e7f\\u4e1c\\u7701","r_province1":"Guang Dong Sheng ","r_city":"\\u5e7f\\u5dde","r_city1":"Guang Zhou ","r_postcode":"510000","r_email":"develop11@qbt8.com","r_street":"\\u68e0\\u4e0b\\u79d1\\u97f5\\u8def255\\u53f7","r_street1":"Tang Xia Ke Yun Lu 255Hao ","r_phone":"+86.13533481813","r_fax":"+86.020-82071951","radio-1-set":"1","radio-2-set":"1","radio-3-set":"1"}', 1, '{"domain":"baga168.com","tld":".com","year":1,"lang":"ENG","encoding":"ASCII"}', '0'),
(2, 1, '李志', '13533481813', '飓风2s型（国内）', 488, 12, '240.00', '0.00', '2', '240.00', '3', '{"name":"\\u98d3\\u98ce2s\\u578b\\uff08\\u56fd\\u5185\\uff09","os":"CENTOS6\\u6216windows"}', '{"id":"488","productclass_id":"2","name":"\\u98d3\\u98ce2s\\u578b\\uff08\\u56fd\\u5185\\uff09","description":"> Windows\\u6216\\u8005Linux\\u5e73\\u53f0<br>\\r\\n> 200M\\u7f51\\u9875 75M(3\\u4e2a)\\u90ae\\u5c40<br>\\r\\n> \\u652f\\u6301ASP(Windows)\\/PHP(Linux)<br>\\r\\n> Access(Windows)\\/30M MySQL\\u6570\\u636e\\u5e93(Linux)<br>\\r\\n> \\u9002\\u5408\\u4e2a\\u4eba\\u7528\\u6237\\u3001\\u5c0f\\u578b\\u4f01\\u4e1a<br>\\r\\n> \\u5feb\\u901f\\u4f4e\\u6210\\u672c\\u5730\\u521b\\u5efa\\u7f51\\u4e0a\\u5bb6\\u56ed","period_type":"3","default_timeperiod":"12","deposit":"0.0000","setup":"0.0000","price":"480.0000","bonus_timeperiod":"24","bonus_deposit":"0.0000","bonus_setup":"0.0000","bonus_price":"3840.0000","os":0,"_limit_Bandwidth":"250","_limit_Traffic":"20000","_limit_MaxConnections":"150","_limit_Quota":"200","_limit_PHP":1,"_limit_ASP":1,"_limit_MySQLQuota":"30","_limit_MSSQLQuota":"1","module":"Product","method":"infoProduct","echo_info":""}', 2, '', 1, '{"product_id":488,"domain":"baga123.com","timeperiod":12,"os_type":1}', '0'),
(3, 1, '李志', '13533481813', '.com域名', 0, 12, '1.00', '0.00', '1', '1.00', '3', '{"name":".com_ENG"}', '', 0, '{"r_organization":"\\u5343\\u4f70\\u7279\\u79d1\\u6280","r_organization1":"Qian Bai Te Ke Ji ","r_name":"\\u6768\\u5149","r_name1":"Yang Guang ","r_country":"CN","r_province":"\\u5e7f\\u4e1c\\u7701","r_province1":"Guang Dong Sheng ","r_city":"\\u5e7f\\u5dde","r_city1":"Guang Zhou ","r_postcode":"510000","r_email":"develop11@qbt8.com","r_street":"\\u68e0\\u4e0b\\u79d1\\u97f5\\u8def255\\u53f7","r_street1":"Tang Xia Ke Yun Lu 255Hao ","r_phone":"+86.13533481813","r_fax":"+86.020-82071951","radio-1-set":"1","radio-2-set":"1","radio-3-set":"1"}', 2, '{"domain":"baga168.com","tld":".com","year":1,"lang":"ENG","encoding":"ASCII"}', '0'),
(4, 1, '李志', '13533481813', '飓风2s型（国内）', 488, 12, '240.00', '0.00', '2', '240.00', '3', '{"name":"\\u98d3\\u98ce2s\\u578b\\uff08\\u56fd\\u5185\\uff09","os":"CENTOS6\\u6216windows"}', '{"id":"488","productclass_id":"2","name":"\\u98d3\\u98ce2s\\u578b\\uff08\\u56fd\\u5185\\uff09","description":"> Windows\\u6216\\u8005Linux\\u5e73\\u53f0<br>\\r\\n> 200M\\u7f51\\u9875 75M(3\\u4e2a)\\u90ae\\u5c40<br>\\r\\n> \\u652f\\u6301ASP(Windows)\\/PHP(Linux)<br>\\r\\n> Access(Windows)\\/30M MySQL\\u6570\\u636e\\u5e93(Linux)<br>\\r\\n> \\u9002\\u5408\\u4e2a\\u4eba\\u7528\\u6237\\u3001\\u5c0f\\u578b\\u4f01\\u4e1a<br>\\r\\n> \\u5feb\\u901f\\u4f4e\\u6210\\u672c\\u5730\\u521b\\u5efa\\u7f51\\u4e0a\\u5bb6\\u56ed","period_type":"3","default_timeperiod":"12","deposit":"0.0000","setup":"0.0000","price":"480.0000","bonus_timeperiod":"24","bonus_deposit":"0.0000","bonus_setup":"0.0000","bonus_price":"3840.0000","os":0,"_limit_Bandwidth":"250","_limit_Traffic":"20000","_limit_MaxConnections":"150","_limit_Quota":"200","_limit_PHP":1,"_limit_ASP":1,"_limit_MySQLQuota":"30","_limit_MSSQLQuota":"1","module":"Product","method":"infoProduct","echo_info":""}', 2, '', 2, '{"product_id":488,"domain":"baga123.com","timeperiod":12,"os_type":1}', '0'),
(5, 1, '李志', '13533481813', '.com域名', 0, 12, '1.00', '0.00', '1', '1.00', '3', '{"name":".com_ENG"}', '', 0, '{"r_organization":"\\u5343\\u4f70\\u7279\\u79d1\\u6280","r_organization1":"Qian Bai Te Ke Ji ","r_name":"\\u6768\\u5149","r_name1":"Yang Guang ","r_country":"CN","r_province":"\\u5e7f\\u4e1c\\u7701","r_province1":"Guang Dong Sheng ","r_city":"\\u5e7f\\u5dde","r_city1":"Guang Zhou ","r_postcode":"510000","r_email":"develop11@qbt8.com","r_street":"\\u68e0\\u4e0b\\u79d1\\u97f5\\u8def255\\u53f7","r_street1":"Tang Xia Ke Yun Lu 255Hao ","r_phone":"+86.13533481813","r_fax":"+86.020-82071951","radio-1-set":"1","radio-2-set":"1","radio-3-set":"1"}', 3, '{"domain":"baga168.com","tld":".com","year":1,"lang":"ENG","encoding":"ASCII"}', '0'),
(8, 1, '李志', '13533481813', '红色经典', 0, 12, '128.00', '0.00', '5', '128.00', '3', '{"name":"PC\\u4f01\\u4e1a\\u7ecf\\u5178\\u7248-\\u7ea2\\u8272\\u7ecf\\u5178"}', '', 0, '', 6, '{"id":"1","cate_id":"1","color":"#fe0000","name":"\\u7ea2\\u8272\\u7ecf\\u5178","price":"128.00","template_id":"1000","images":"33","level":"1"}', '0'),
(9, 1, '李志', '13533481813', '全球邮', 3111, 12, '480.00', '96.00', '3', '576.00', '3', '{"name":"\\u5168\\u7403\\u90ae"}', '', 0, '', 7, '{"domain":"baga123.com","number":"1","timeperiod":12,"quota":0,"id":"1","name":"\\u5168\\u7403\\u90ae","price":"480.00","usernum":null,"space":"10G","extra_price":"96.00"}', '0');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_package_host`
--

CREATE TABLE IF NOT EXISTS `onethink_package_host` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(25) NOT NULL COMMENT '服务器名称',
  `cpu` varchar(30) NOT NULL COMMENT '处理器',
  `memory` varchar(10) NOT NULL COMMENT '内存',
  `disk` varchar(50) NOT NULL COMMENT '硬盘',
  `bandwidth` varchar(25) NOT NULL COMMENT '带宽',
  `ip` varchar(20) NOT NULL COMMENT 'IP',
  `computer_room` text NOT NULL COMMENT '机房',
  `first_month_price` decimal(10,2) unsigned NOT NULL COMMENT '首月价格',
  `quarter_price` decimal(10,2) unsigned NOT NULL COMMENT '季度价格',
  `half_year_price` decimal(10,2) unsigned NOT NULL COMMENT '半年价格',
  `year_price` decimal(10,2) unsigned NOT NULL COMMENT '一年价格',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `is_hot` char(10) NOT NULL DEFAULT '0' COMMENT '营销类型',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `onethink_package_host`
--

INSERT INTO `onethink_package_host` (`id`, `name`, `cpu`, `memory`, `disk`, `bandwidth`, `ip`, `computer_room`, `first_month_price`, `quarter_price`, `half_year_price`, `year_price`, `description`, `is_hot`, `level`) VALUES
(1, '创业型云服务器', ' IntelXeon E5-2620/5645*4(四核心)', '2GB', '200G SAS硬盘+200G SATA(智能备份)', '3M独享', ' 独享IP一个', '[{"path":"/Uploads/Picture/2017-03-02/58b78b5fa45c3.jpg","id":"36","name":"四川双线机房"},{"path":"/Uploads/Picture/2017-02-25/58b14ea40e42f.jpg","id":"32","name":"国内电信机房（推荐）"}]', '253.00', '920.00', '1680.00', '2980.00', '适用于企业官方网站/个人站长', '1', 0),
(2, '发展型云服务器', ' IntelXeon E5-2620/5645*4(四核心)', '3GB', '300G SAS硬盘+300G SATA(智能备份)', ' 5M独享', ' 独享IP一个', '[{"path":"/Uploads/Picture/2017-02-24/58afa738801c5.jpg","id":"27","name":"北极BGP机房"},{"path":"/Uploads/Picture/2017-02-24/58afa74ec1f82.jpg","id":"28","name":"美国机房（免备案）"}]', '287.00', '998.00', '1999.00', '3380.00', '适用于地方/行业门户网站', '0', 2),
(3, '舒适型云服务器', ' IntelXeon E5-2620/5645*4(四核心)', '4GB', '500G SAS硬盘+500G SATA(智能备份)', ' 5M独享', ' 独享IP一个', '[{"path":"/Uploads/Picture/2017-02-24/58afcc0f125a0.jpg","id":"30","name":"香港机房（免备案）"}]', '321.00', '1130.00', '2180.00', '3780.00', '适用于网上商城、团购网站等', '2', 3);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_paylog`
--

CREATE TABLE IF NOT EXISTS `onethink_paylog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ordersn` varchar(100) NOT NULL COMMENT '订单号',
  `serialsn` varchar(100) NOT NULL COMMENT '流水号',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '支付金额',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `payment` char(2) NOT NULL DEFAULT '3' COMMENT '支付方式',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `onethink_paylog`
--

INSERT INTO `onethink_paylog` (`id`, `ordersn`, `serialsn`, `money`, `status`, `payment`, `create_time`) VALUES
(1, '1488251460', '2017000001', '241.00', '0', '3', 1488251460),
(2, '1488252747', '2017000002', '241.00', '1', '3', 1488252747),
(3, '1488253227', '2017000003', '1.00', '1', '3', 1488253227),
(4, '1488348086', '2017000004', '128.00', '1', '3', 1488348086),
(5, '1488349993', '2017000005', '128.00', '1', '3', 1488349993),
(6, '1488350103', '2017000006', '128.00', '1', '3', 1488350103),
(7, '1488359582', '2017000007', '576.00', '1', '3', 1488359582);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_picture`
--

CREATE TABLE IF NOT EXISTS `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `onethink_picture`
--

INSERT INTO `onethink_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2017-02-16/58a5599a509b3.jpg', '', 'c082ae975cd4663f91b195a52a23fe24', 'f656917e6f46b78a76b9dfb0c5f8e265f345a286', 1, 1487231386),
(2, '/Uploads/Picture/2017-02-16/58a55c88f1a32.jpg', '', 'f8bdc4824d888c45d17b72dca87564c8', 'fda5e49f2d4af2be1c3e0636db88d4ab1fccc1a5', 1, 1487232136),
(3, '/Uploads/Picture/2017-02-16/58a55d1982fc6.jpg', '', '78289be95ae533e46c7c00be5f01b5b1', 'c49dd2eb4f8e69a69b6b4b4073067cc8b5648693', 1, 1487232281),
(4, '/Uploads/Picture/2017-02-16/58a563ebced3a.jpg', '', '205f4b5c6ca2e43c51f7fc9c5b731a4a', '12c4a29057f6b4cf89a92b166052e3708b8923b5', 1, 1487234027),
(5, '/Uploads/Picture/2017-02-16/58a565e16036b.jpg', '', 'e5a46d56d8446e28b85601e29867fa98', 'd6237df181a07f5912260b0f92f5e491e895090a', 1, 1487234529),
(6, '/Uploads/Picture/2017-02-16/58a56d6ea5c06.jpg', '', '26d48bfb9f33948b1911d16ebfd73603', 'fa06ea193208fd3cdd028de0f9e46e19712df55f', 1, 1487236462),
(7, '/Uploads/Picture/2017-02-16/58a56d89cbaff.png', '', '6d3370da9677412d14a0a4fb13d69c56', '8783474ec7bebeb5a137c047c8290f8684ed9efe', 1, 1487236489),
(8, '/Uploads/Picture/2017-02-16/58a57139ee3dd.jpg', '', '3db34fbe072ae14ffb70d9aa4e8127d8', '2245670ce71f7e9b48ce7bce146112bb3cad9513', 1, 1487237433),
(9, '/Uploads/Picture/2017-02-17/58a696182062a.png', '', '1990d396e77e465180c2b8d23348372c', '49286177b6605945aa6520fa81c135f989a5f589', 1, 1487312408),
(10, '/Uploads/Picture/2017-02-17/58a6962b426b9.png', '', '4825740e0a42e53a0478f9dd56a4e116', '66d7ffc8d877bb2e71b188ecd178b4471f22a0a7', 1, 1487312427),
(11, '/Uploads/Picture/2017-02-17/58a6964802d56.png', '', 'd1073aed3a7f207be5c63de3d6721839', 'ae3cce4902c627554c13d016370159099d9f309e', 1, 1487312455),
(12, '/Uploads/Picture/2017-02-17/58a6965edf69d.png', '', '1112baff8eb10edd4e1e48bd3cf140c6', 'db91aa5fc63a651426826d76a67b57b66fda6e18', 1, 1487312478),
(13, '/Uploads/Picture/2017-02-17/58a69677571eb.png', '', '99941909f7e1f43fe3a6e613191fa7da', '003a757359a75ffd48a3fa93a61cac87768a3bb3', 1, 1487312503),
(14, '/Uploads/Picture/2017-02-17/58a6968c32674.png', '', '5bab895281dc79398092af9ab2086f43', '71cf8b54bd016180311db4f3bc3650a034763e72', 1, 1487312524),
(15, '/Uploads/Picture/2017-02-18/58a7b6f13fee2.jpg', '', 'c1824e38f40f5239f7489d90e107a145', 'cd87c2cdad89317955aa1b9260c944ddefdd5fa6', 1, 1487386353),
(16, '/Uploads/Picture/2017-02-18/58a7b70998632.jpg', '', '5275e41a990bbf02ab59b03983e79e84', '136c8d7b3d24fed132810e24563f914dc9e046f4', 1, 1487386377),
(17, '/Uploads/Picture/2017-02-18/58a7b71d961f7.jpg', '', 'b3190ce9510e346b6eb28d2137454f5c', 'd36d51723cbea192b67b2000bff82321848d7d53', 1, 1487386397),
(18, '/Uploads/Picture/2017-02-18/58a7b73614ab6.jpg', '', '6d2a36a649e6524793b387b03ea26d81', '7cb51b66415109901e444bb6863957cdc7e474bb', 1, 1487386422),
(19, '/Uploads/Picture/2017-02-18/58a7f3f824b32.jpg', '', 'af236e5890d842e43524c0930616bc24', 'ce3aaebcf46748a83e99669859844cd3eab9b139', 1, 1487401976),
(20, '/Uploads/Picture/2017-02-18/58a7f61ed219d.jpg', '', '48062d4a83741a129fa8078caac22862', 'e134db6bfaec083d59b3ac66f83c59df6a4e680d', 1, 1487402526),
(21, '/Uploads/Picture/2017-02-18/58a80585bcded.jpg', '', '2ab93fae981c68af07d5571ab9bde663', '2817f174eb8f81dd3c8a50e838e3d658a7628cfa', 1, 1487406469),
(22, '/Uploads/Picture/2017-02-18/58a805aeb1ad6.jpg', '', 'ac3388f8b733a275fef0f827c947637d', 'ede7be6988f8d9ae045ba1ef52b7c8939f4c95e2', 1, 1487406510),
(23, '/Uploads/Picture/2017-02-18/58a805d79b815.jpg', '', 'ea337acb8c1baea83e7c7f577ef15dc9', '4e672fae11c546183e551833963209134b6b9ed5', 1, 1487406551),
(24, '/Uploads/Picture/2017-02-24/58afa450a47ea.png', '', '57c2ded7c2d41a93d9d9ddac9692e06d', '76dc79e9cc634a80b522aa86e0be119e16a35b07', 1, 1487905872),
(25, '/Uploads/Picture/2017-02-24/58afa6f2c883b.png', '', '0adfdfc96b8ecbff34672f2e57f9f813', '64ea17fe409ab32b525ab014fc0b51aed1fc308d', 1, 1487906546),
(26, '/Uploads/Picture/2017-02-24/58afa71137bc9.png', '', '318eff418ac9faea9d2dd9da9b511613', '487b88964a34d6ff4cd2d2e83dcd04d94e906d24', 1, 1487906577),
(27, '/Uploads/Picture/2017-02-24/58afa738801c5.jpg', '', '60779cb54299b52ede4898f091df7e72', 'cc803843cb2cac5b1b6acb1a4e43a9644aed0dc0', 1, 1487906616),
(28, '/Uploads/Picture/2017-02-24/58afa74ec1f82.jpg', '', 'aafe4939d64b2e20f66390c1e32ab71f', '73c203ab0066a221edc1c5c2f4fed4397424980e', 1, 1487906638),
(29, '/Uploads/Picture/2017-02-24/58afa7650b967.jpg', '', '7e695e5263cc9e69e7492abdd55650c3', '0ebf111f8e0010c89160123c6c86026dfef68dc5', 1, 1487906660),
(30, '/Uploads/Picture/2017-02-24/58afcc0f125a0.jpg', '', '1ba6d9ceabdca363b04f21b5dfd578a5', '4ba3a39c3714050172a3d178dadc647040445afd', 1, 1487916047),
(31, '/Uploads/Picture/2017-02-24/58afde7e904d6.jpg', '', 'd6ff2317bf4395cc254df60f1dc71921', '4df77fb1609fbaae3e56b441d65cdf4af0853c84', 1, 1487920766),
(32, '/Uploads/Picture/2017-02-25/58b14ea40e42f.jpg', '', '0cd777299d620d89845330a11873b522', 'd804cfacbf548c08a49e6534ec4ec6508698689f', 1, 1488015011),
(33, '/Uploads/Picture/2017-02-28/58b58e7950ee0.jpg', '', '0c96a531b63014360ca9e047c7e1a7d1', 'bf3e5ce6a16cf456133bb74d1e2217ae2d800f09', 1, 1488293497),
(34, '/Uploads/Picture/2017-03-01/58b6243d40ff3.jpg', '', '18e3376964f64e6c3c9fe5a834a26702', 'dbe74f21c0f6caa4528d3bdbe49c015f00284b27', 1, 1488331837),
(35, '/Uploads/Picture/2017-03-01/58b638eb3f08b.jpg', '', 'eed4fa7f8a44bae759c2842f5632c444', '4d189de71a2277db8e1be965e8d32b1a1fd88f8b', 1, 1488337131),
(36, '/Uploads/Picture/2017-03-02/58b78b5fa45c3.jpg', '', 'd5c3823deb31565c76d0ae0d10705203', 'e6a971913988aca7a7dae80a1f1ece7a1f77d0ec', 1, 1488423775),
(37, '/Uploads/Picture/2017-03-02/58b78c6f19d5e.jpg', '', '95a87ac90a27c8b7df2aa1d50a4b4a85', '1b968a639b8a77385f4054428cda5bcb7eb81e94', 1, 1488424047),
(38, '/Uploads/Picture/2017-03-02/58b78df845e96.jpg', '', 'dc485aa62ae8f65f46185147e9c727c9', '27b05a9615425cb3e6a365706322235075fd7bc0', 1, 1488424440);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_station_category`
--

CREATE TABLE IF NOT EXISTS `onethink_station_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `is_pc` char(2) NOT NULL DEFAULT '1' COMMENT '是否pc版',
  `name` varchar(20) NOT NULL COMMENT '模板名称',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `onethink_station_category`
--

INSERT INTO `onethink_station_category` (`id`, `is_pc`, `name`, `level`) VALUES
(1, '1', 'PC企业经典版', 1),
(3, '2', '手机经典', 1),
(4, '1', 'PC蓝色海洋', 2);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_station_template`
--

CREATE TABLE IF NOT EXISTS `onethink_station_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cate_id` int(10) unsigned NOT NULL COMMENT '模板类型id',
  `color` char(10) NOT NULL DEFAULT '#fe0000' COMMENT '模板色调',
  `name` varchar(25) NOT NULL COMMENT '模板名称',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '模板价格',
  `template_id` varchar(255) NOT NULL DEFAULT '1000' COMMENT '模板id',
  `images` int(10) unsigned NOT NULL COMMENT '模板图片',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_station_template`
--

INSERT INTO `onethink_station_template` (`id`, `cate_id`, `color`, `name`, `price`, `template_id`, `images`, `level`) VALUES
(1, 1, '#fe0000', '红色经典', '128.00', '1000', 33, 1),
(2, 1, '#ff6300', '蓝色经典', '250.00', '1001', 34, 1),
(3, 3, '#fae242', '金色永恒', '188.00', '1002', 35, 2);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `onethink_ucenter_member`
--

INSERT INTO `onethink_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '30c3344bcff4de86bf764a4d718f9222', 'develop11@qbt8.com', '', 1487144121, 0, 1488418802, 0, 1487144121, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_url`
--

CREATE TABLE IF NOT EXISTS `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_userdata`
--

CREATE TABLE IF NOT EXISTS `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_user_account_log`
--

CREATE TABLE IF NOT EXISTS `onethink_user_account_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动金额',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '变动时间',
  `desc` varchar(50) NOT NULL COMMENT '变动说明',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `type` char(1) NOT NULL DEFAULT '1' COMMENT '变动类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `onethink_user_account_log`
--

INSERT INTO `onethink_user_account_log` (`id`, `money`, `create_time`, `desc`, `uid`, `admin_id`, `type`) VALUES
(1, '100.00', 1487224497, '测试', 3, 1, '1'),
(2, '-10.00', 1487224886, '测试减少', 3, 1, '2'),
(3, '-10.00', 1487225024, '减少10', 3, 1, '2'),
(4, '10.00', 1487572646, '后台调节10', 3, 1, '1'),
(5, '1000.00', 1488176266, '测试使用', 1, 1, '1'),
(6, '-1.00', 1488252694, '测试支付订单扣减', 1, 0, '1'),
(7, '-241.00', 1488252747, '支付订单1488252747扣减', 1, 0, '1'),
(8, '-1.00', 1488253227, '支付订单1488253227扣减', 1, 0, '1'),
(9, '-128.00', 1488348086, '支付订单1488348086扣减', 1, 0, '1'),
(10, '-128.00', 1488349993, '支付订单1488349993扣减', 1, 0, '1'),
(11, '-128.00', 1488350103, '支付订单1488350103扣减', 1, 0, '1'),
(12, '10000.00', 1488359413, '测试使用', 1, 1, '1'),
(13, '-576.00', 1488359582, '支付订单1488359582扣减', 1, 0, '1');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_user_domain`
--

CREATE TABLE IF NOT EXISTS `onethink_user_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderSn` varchar(40) NOT NULL COMMENT '编号',
  `order_id` int(10) unsigned NOT NULL COMMENT '新一代订单id',
  `expiry_time` int(10) NOT NULL COMMENT '域名过期时间',
  `domain` varchar(40) NOT NULL COMMENT '域名',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `tld` varchar(20) NOT NULL COMMENT '域名后缀',
  `year` int(4) unsigned NOT NULL COMMENT '注册年限',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_user_mail`
--

CREATE TABLE IF NOT EXISTS `onethink_user_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `domain` varchar(20) NOT NULL COMMENT '绑定域名',
  `name` varchar(20) NOT NULL COMMENT '产品名称',
  `usernum` int(10) unsigned NOT NULL COMMENT '用户数',
  `space` varchar(20) NOT NULL COMMENT '空间大小',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `expiry_time` int(10) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_user_template`
--

CREATE TABLE IF NOT EXISTS `onethink_user_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tid` int(10) unsigned NOT NULL COMMENT '模板记录id',
  `template_id` varchar(100) NOT NULL COMMENT '模板id',
  `name` varchar(25) NOT NULL COMMENT '模板名称',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `expiry_time` int(10) NOT NULL COMMENT '到期时间',
  `status` char(2) NOT NULL DEFAULT '0' COMMENT '产品状态',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `onethink_user_template`
--

INSERT INTO `onethink_user_template` (`id`, `tid`, `template_id`, `name`, `create_time`, `expiry_time`, `status`, `uid`) VALUES
(1, 1, '1000', '红色经典', 1488350103, 1519886103, '1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_user_vitrual`
--

CREATE TABLE IF NOT EXISTS `onethink_user_vitrual` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `domain` varchar(40) NOT NULL COMMENT '绑定的域名',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `product_id` int(10) unsigned NOT NULL COMMENT '新一代产品id',
  `timeperiod` int(4) unsigned NOT NULL COMMENT '购买周期(月)',
  `os_type` char(2) NOT NULL COMMENT '系统类型',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `expire_time` int(10) NOT NULL COMMENT '到期时间',
  `orderSn` varchar(40) NOT NULL COMMENT '编号',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
