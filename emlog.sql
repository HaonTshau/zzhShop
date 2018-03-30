-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018-03-30 15:42:46
-- 服务器版本: 5.1.73
-- PHP 版本: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `emlog`
--

-- --------------------------------------------------------

--
-- 表的结构 `emlog_attachment`
--

CREATE TABLE IF NOT EXISTS `emlog_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blogid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) NOT NULL DEFAULT '0',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `addtime` bigint(20) NOT NULL DEFAULT '0',
  `width` int(10) NOT NULL DEFAULT '0',
  `height` int(10) NOT NULL DEFAULT '0',
  `mimetype` varchar(40) NOT NULL DEFAULT '',
  `thumfor` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `blogid` (`blogid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `emlog_attachment`
--

INSERT INTO `emlog_attachment` (`aid`, `blogid`, `filename`, `filesize`, `filepath`, `addtime`, `width`, `height`, `mimetype`, `thumfor`) VALUES
(1, 2, '1875205232.jpg', 11468, '../content/uploadfile/201803/44f01520423854.jpg', 1520423854, 800, 157, 'image/jpeg', 0),
(2, 2, '1875205232.jpg', 4770, '../content/uploadfile/201803/thum-44f01520423854.jpg', 1520423854, 420, 83, 'image/jpeg', 1);

-- --------------------------------------------------------

--
-- 表的结构 `emlog_blog`
--

CREATE TABLE IF NOT EXISTS `emlog_blog` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `date` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `excerpt` longtext NOT NULL,
  `alias` varchar(200) NOT NULL DEFAULT '',
  `author` int(10) NOT NULL DEFAULT '1',
  `sortid` int(10) NOT NULL DEFAULT '-1',
  `type` varchar(20) NOT NULL DEFAULT 'blog',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `comnum` int(10) unsigned NOT NULL DEFAULT '0',
  `attnum` int(10) unsigned NOT NULL DEFAULT '0',
  `top` enum('n','y') NOT NULL DEFAULT 'n',
  `sortop` enum('n','y') NOT NULL DEFAULT 'n',
  `hide` enum('n','y') NOT NULL DEFAULT 'n',
  `checked` enum('n','y') NOT NULL DEFAULT 'y',
  `allow_remark` enum('n','y') NOT NULL DEFAULT 'y',
  `password` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(255) NOT NULL DEFAULT '',
  `tags` text,
  `color` varchar(20) NOT NULL COMMENT '货品颜色',
  `count` int(11) unsigned NOT NULL COMMENT '货品数量',
  `size` varchar(20) NOT NULL COMMENT '货品尺寸',
  PRIMARY KEY (`gid`),
  KEY `author` (`author`),
  KEY `views` (`views`),
  KEY `comnum` (`comnum`),
  KEY `sortid` (`sortid`),
  KEY `top` (`top`,`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `emlog_blog`
--

INSERT INTO `emlog_blog` (`gid`, `title`, `date`, `content`, `excerpt`, `alias`, `author`, `sortid`, `type`, `views`, `comnum`, `attnum`, `top`, `sortop`, `hide`, `checked`, `allow_remark`, `password`, `template`, `tags`, `color`, `count`, `size`) VALUES
(1, '欢迎使用emlog', 1520421902, '恭喜您成功安装了emlog，这是系统自动生成的演示文章。编辑或者删除它，然后开始您的创作吧！', '', '', 1, -1, 'blog', 69, 0, 0, 'n', 'n', 'n', 'y', 'y', '', '', NULL, 'red|yellow|black', 5, '42|43'),
(2, '方超', 1520423682, '这是一个测试谁的<br />\r\n<a target="_blank" href="http://10.0.0.221/emlog_3/content/uploadfile/201803/44f01520423854.jpg" id="ematt:1"><img src="http://10.0.0.221/emlog_3/content/uploadfile/201803/44f01520423854.jpg" title="点击查看原图" alt="1875205232.jpg" border="0" width="800" height="157" /></a><br />', '', '', 1, 1, 'blog', 141, 1, 1, 'n', 'n', 'n', 'y', 'y', '', '', NULL, 'blue', 88, '175cm');

-- --------------------------------------------------------

--
-- 表的结构 `emlog_comment`
--

CREATE TABLE IF NOT EXISTS `emlog_comment` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `date` bigint(20) NOT NULL,
  `poster` varchar(20) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `mail` varchar(60) NOT NULL DEFAULT '',
  `url` varchar(75) NOT NULL DEFAULT '',
  `ip` varchar(128) NOT NULL DEFAULT '',
  `hide` enum('n','y') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`cid`),
  KEY `gid` (`gid`),
  KEY `date` (`date`),
  KEY `hide` (`hide`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `emlog_comment`
--

INSERT INTO `emlog_comment` (`cid`, `gid`, `pid`, `date`, `poster`, `comment`, `mail`, `url`, `ip`, `hide`) VALUES
(1, 2, 0, 1520423978, 'fangchao', '多少钱', '', 'http://10.0.0.221/emlog_3/', '10.0.0.238', 'n'),
(2, 1, 0, 1521971929, 'e', '开心', 'e@11.com', 'http://fadf.com', '10.0.0.238', 'y'),
(3, 2, 0, 1521972028, 'e', '45爱', 'e@11.com', 'http://fadf.com', '10.0.0.238', 'y');

-- --------------------------------------------------------

--
-- 表的结构 `emlog_link`
--

CREATE TABLE IF NOT EXISTS `emlog_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(30) NOT NULL DEFAULT '',
  `siteurl` varchar(75) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `hide` enum('n','y') NOT NULL DEFAULT 'n',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `emlog_link`
--

INSERT INTO `emlog_link` (`id`, `sitename`, `siteurl`, `description`, `hide`, `taxis`) VALUES
(1, 'emlog.net', 'http://www.emlog.net', 'emlog官方主页', 'n', 0);

-- --------------------------------------------------------

--
-- 表的结构 `emlog_navi`
--

CREATE TABLE IF NOT EXISTS `emlog_navi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naviname` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(75) NOT NULL DEFAULT '',
  `newtab` enum('n','y') NOT NULL DEFAULT 'n',
  `hide` enum('n','y') NOT NULL DEFAULT 'n',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `isdefault` enum('n','y') NOT NULL DEFAULT 'n',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `emlog_navi`
--

INSERT INTO `emlog_navi` (`id`, `naviname`, `url`, `newtab`, `hide`, `taxis`, `pid`, `isdefault`, `type`, `type_id`) VALUES
(1, '首页', '', 'n', 'n', 1, 0, 'y', 1, 0),
(3, '登录', 'admin', 'n', 'n', 3, 0, 'y', 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `emlog_options`
--

CREATE TABLE IF NOT EXISTS `emlog_options` (
  `option_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `option_value` longtext NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `emlog_options`
--

INSERT INTO `emlog_options` (`option_id`, `option_name`, `option_value`) VALUES
(1, 'blogname', '点滴记忆'),
(2, 'bloginfo', '使用emlog搭建的站点'),
(3, 'site_title', ''),
(4, 'site_description', ''),
(5, 'site_key', 'emlog'),
(6, 'log_title_style', '0'),
(7, 'blogurl', 'http://10.0.0.221/emlog_3/'),
(8, 'icp', ''),
(9, 'footer_info', ''),
(10, 'admin_perpage_num', '15'),
(11, 'rss_output_num', '10'),
(12, 'rss_output_fulltext', 'y'),
(13, 'index_lognum', '10'),
(14, 'index_comnum', '10'),
(15, 'index_twnum', '10'),
(16, 'index_newtwnum', '5'),
(17, 'index_newlognum', '5'),
(18, 'index_randlognum', '5'),
(19, 'index_hotlognum', '5'),
(20, 'comment_subnum', '20'),
(21, 'nonce_templet', 'default'),
(22, 'admin_style', 'default'),
(23, 'tpl_sidenum', '1'),
(24, 'comment_code', 'n'),
(25, 'comment_needchinese', 'y'),
(26, 'comment_interval', '60'),
(27, 'isgravatar', 'y'),
(28, 'isthumbnail', 'y'),
(29, 'att_maxsize', '20480'),
(30, 'att_type', 'rar,zip,gif,jpg,jpeg,png,txt,pdf,docx,doc,xls,xlsx'),
(31, 'att_imgmaxw', '420'),
(32, 'att_imgmaxh', '460'),
(33, 'comment_paging', 'y'),
(34, 'comment_pnum', '10'),
(35, 'comment_order', 'newer'),
(36, 'login_code', 'n'),
(37, 'reply_code', 'n'),
(38, 'iscomment', 'y'),
(39, 'ischkcomment', 'y'),
(40, 'ischkreply', 'n'),
(41, 'isurlrewrite', '0'),
(42, 'isalias', 'n'),
(43, 'isalias_html', 'n'),
(44, 'isexcerpt', 'n'),
(45, 'excerpt_subnum', '300'),
(46, 'istreply', 'n'),
(47, 'timezone', 'Asia/Shanghai'),
(48, 'active_plugins', ''),
(49, 'widget_title', 'a:11:{s:7:"blogger";s:12:"个人资料";s:8:"calendar";s:6:"日历";s:3:"tag";s:6:"标签";s:4:"sort";s:6:"分类";s:7:"archive";s:6:"存档";s:7:"newcomm";s:12:"最新评论";s:6:"newlog";s:12:"最新文章";s:6:"hotlog";s:12:"热门文章";s:4:"link";s:6:"链接";s:6:"search";s:6:"搜索";s:11:"custom_text";s:15:"自定义组件";}'),
(50, 'custom_widget', 'a:0:{}'),
(51, 'widgets1', 'a:3:{i:0;s:7:"archive";i:1;s:4:"link";i:2;s:6:"search";}'),
(52, 'widgets2', ''),
(53, 'widgets3', ''),
(54, 'widgets4', ''),
(55, 'detect_url', 'n');

-- --------------------------------------------------------

--
-- 表的结构 `emlog_sort`
--

CREATE TABLE IF NOT EXISTS `emlog_sort` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sortname` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(200) NOT NULL DEFAULT '',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `emlog_sort`
--

INSERT INTO `emlog_sort` (`sid`, `sortname`, `alias`, `taxis`, `pid`, `description`, `template`) VALUES
(1, '裤子', 'kuzi', 1, 0, '裤子', '');

-- --------------------------------------------------------

--
-- 表的结构 `emlog_storage`
--

CREATE TABLE IF NOT EXISTS `emlog_storage` (
  `sid` int(8) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` varchar(8) NOT NULL,
  `value` text NOT NULL,
  `createdate` int(11) NOT NULL,
  `lastupdate` int(11) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `plugin` (`plugin`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `emlog_tag`
--

CREATE TABLE IF NOT EXISTS `emlog_tag` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` varchar(60) NOT NULL DEFAULT '',
  `gid` text NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `tagname` (`tagname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `emlog_user`
--

CREATE TABLE IF NOT EXISTS `emlog_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `role` varchar(60) NOT NULL DEFAULT '',
  `ischeck` enum('n','y') NOT NULL DEFAULT 'n',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `emlog_user`
--

INSERT INTO `emlog_user` (`uid`, `username`, `password`, `nickname`, `role`, `ischeck`, `photo`, `email`, `description`) VALUES
(1, 'fangchao', '$P$Bg1gHHM7sJqZYkOarSQsQMts5zAmYo0', '', 'admin', 'n', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
