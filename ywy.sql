-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 �?02 �?17 �?18:15
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=133 ;

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
(132, 11, 1, 0, 'category', 58, '操作url：/ywy/newwebadmin.php?s=/Category/edit.html', 1, 1487312377);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=16 ;

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
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=73 ;

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
(72, 'keywords', '关键字', 'varchar(10) NOT NULL', 'string', '', '', 0, '', 12, 0, 1, 1487312135, 1487312135, '', 3, '', 'regex', '', 3, 'function');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=59 ;

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
(53, 'hot_news', '热门动态', 52, 1, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 1, 1, 0, 0, '', NULL, 1487234598, 1487237594, 1, 0, ''),
(54, 'long_activity', '长期活动', 52, 2, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 1, 1, 0, 0, '', NULL, 1487234623, 1487237597, 1, 0, ''),
(55, 'backups', '备案中心', 48, 5, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 1, 1, 0, 0, '', NULL, 1487235581, 1487235591, 1, 0, ''),
(56, 'contacts', '联系我们', 48, 6, 10, '', '', '', '', '', '', '', '11', '11', '2', 0, 1, 1, 0, 0, '', NULL, 1487236428, 1487236435, 1, 0, ''),
(57, 'media', '媒体报告', 52, 3, 10, '', '', '', '', '', '', '', '10', '10', '2', 0, 1, 1, 0, 0, '', NULL, 1487237586, 1487237599, 1, 0, ''),
(58, 'advantage', '亿维云网优势', 0, 2, 10, '', '', '', '', '', '', '', '12', '12', '2', 0, 1, 1, 0, 0, '', NULL, 1487312318, 1487312377, 1, 0, '');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_cuser`
--

INSERT INTO `onethink_cuser` (`id`, `email`, `username`, `password`, `mobile`, `address`, `sex`, `qq`, `reg_time`, `reg_ip`, `update_time`, `status`, `last_login_time`, `last_login_ip`, `account`) VALUES
(1, 'guanghong2012@126.com', '李志', '1625a05770c3ee32d06130866fc25d7f', '13533481813', '广州天河区科韵路255号', '0', '', '1487153808', '0', '1487153808', '1', '', '', '0.00'),
(3, 'develop12@qbt8.com', '骚刚', '37e36e59794dd65d98006b57ef95af42', '13580128021', '科韵路255号', '1', '', '1487225024', '0', '1487225024', '1', '', '', '80.00');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `onethink_document`
--

INSERT INTO `onethink_document` (`id`, `uid`, `name`, `title`, `category_id`, `group_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(3, 1, '', '公司简介', 49, 0, '创建于2008年，公司先后在广州、重庆、西安、贵阳先后成立分公司。', 0, 0, 7, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1487231390, 1487231390, 1),
(2, 1, '', 'MySQL+ ServHA Mirror共享存储双机热备配置教程(Linux)', 40, 0, 'MySQL+ ServHA Mirror共享存储双机热备配置教程(Linux)PDF', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487229617, 1487229651, 1),
(4, 1, '', '广东省守合同重信用企业', 50, 0, '', 0, 0, 8, 2, 0, 0, 2, 1, 0, 0, 0, 0, 0, 2, 1487232209, 1487232209, 1),
(5, 1, '', '广东省中小企业发展促进会常务理事', 50, 0, '', 0, 0, 8, 2, 0, 0, 3, 1, 0, 0, 0, 0, 0, 1, 1487232291, 1487232291, 1),
(6, 1, '', 'pptv', 51, 0, '', 0, 0, 9, 2, 0, 0, 4, 1, 0, 0, 0, 0, 0, 1, 1487234030, 1487234030, 1),
(7, 1, '', '年前我们求敬业福，年后我们敬业求福', 53, 0, '年前我们求敬业福，年后我们敬业求福', 0, 0, 10, 2, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 1487234409, 1487234532, 1),
(8, 1, '', '百度长时间不收录上线网站，这是搞哪样？', 54, 0, '百度长时间不收录上线网站，这是搞哪样？', 0, 0, 10, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1487234854, 1487234894, 1),
(9, 1, '', '备案中心', 55, 0, '备案中心', 0, 0, 10, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1487235598, 1487235663, 1),
(10, 1, '', '联系我们', 56, 0, '', 0, 0, 11, 2, 0, 0, 7, 1, 0, 0, 0, 0, 0, 0, 1487237436, 1487237436, 1),
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
(21, 1, '', '备份说明', 45, 0, '备份说明', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487320091, 1487320105, 1),
(22, 1, '', '建站问题1', 46, 0, '建站问题1', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487320109, 1487320121, 1),
(23, 1, '', '负载均衡说明', 47, 0, '负载均衡说明', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487320125, 1487320141, 1),
(24, 1, '', '测试文章2', 40, 0, '测试文章2', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487325787, 1487325800, 1),
(25, 1, '', '测试文章3', 40, 0, '测试文章3', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487325803, 1487325814, 1),
(26, 1, '', '测试文章4', 40, 0, '测试文章4', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487325817, 1487325828, 1),
(27, 1, '', '测试文章5', 40, 0, '测试文章5', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1487325831, 1487325843, 1),
(28, 1, '', '测试文章6', 40, 0, '测试文章6', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1487325846, 1487325856, 1);

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
(10, '0755-83586660  0755-83583158', '0755-81780330', 'http://www.qbt8.com', 'info@qbt8.com', '深圳市福田区国际电子商务产业园科技楼805', '', '0755-81780330 转 8011 | 8028 | 8041 ', '400-066-9987', 8);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `onethink_document_news`
--

INSERT INTO `onethink_document_news` (`id`, `keywords`, `content`) VALUES
(7, '年前我们求敬业福，年后我们敬业求福', '<span style="color:#333333;background-color:#FFFFFF;font-size:16px;font-family:&quot;">这么远，那么快，春节</span><span style="color:#333333;background-color:#FFFFFF;font-size:16px;font-family:&quot;">7</span><span style="color:#333333;background-color:#FFFFFF;font-size:16px;font-family:&quot;">天长假眨眼就过去了，我们又开始奋斗。</span>'),
(8, '百度长时间不收录上线网站，这是搞哪样？', '百度长时间不收录上线网站，这是搞哪样？'),
(9, '备案中心', '这里是备案中心内容展示区');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_partner`
--

CREATE TABLE IF NOT EXISTS `onethink_document_partner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(100) NOT NULL DEFAULT '#' COMMENT '链接地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `onethink_document_partner`
--

INSERT INTO `onethink_document_partner` (`id`, `url`) VALUES
(6, '#');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

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
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1);

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
(1, 'admin', 0, '0000-00-00', '', 20, 3, 0, 1487144121, 0, 1487310179, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=130 ;

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
(129, '查看用户资金记录', 124, 5, 'Cuser/accountLog', 1, '', '用户管理', 0, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=13 ;

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
(12, 'advantage', '亿维云优势', 1, '', 1, '{"1":["3","19","12","5"]}', '1:基础', '19,12,3,5', 'cover_id:图标（100px*100px）', '', '', '', 'id:ID\r\ntitle:标题\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1487312061, 1487312264, 1, 'MyISAM');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

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
(14, '/Uploads/Picture/2017-02-17/58a6968c32674.png', '', '5bab895281dc79398092af9ab2086f43', '71cf8b54bd016180311db4f3bc3650a034763e72', 1, 1487312524);

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
(1, 'admin', '30c3344bcff4de86bf764a4d718f9222', 'develop11@qbt8.com', '', 1487144121, 0, 1487310179, 0, 1487144121, 1);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_user_account_log`
--

INSERT INTO `onethink_user_account_log` (`id`, `money`, `create_time`, `desc`, `uid`, `admin_id`) VALUES
(1, '100.00', 1487224497, '测试', 3, 1),
(2, '-10.00', 1487224886, '测试减少', 3, 1),
(3, '-10.00', 1487225024, '减少10', 3, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
