-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?06 �?02 �?13:19
-- 服务器版本: 5.5.53
-- PHP 版本: 5.6.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `video`
--

-- --------------------------------------------------------

--
-- 表的结构 `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `truename` varchar(20) NOT NULL COMMENT '真实姓名',
  `gid` int(10) NOT NULL COMMENT '角色id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `truename`, `gid`, `status`, `add_time`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '张三丰', 1, 0, 1536545632),
(3, 'test', '098f6bcd4621d373cade4e832627b4f6', '李四', 2, 1, 1527161992),
(4, 'ljl', '7e079e6e92d2f69d09cb28cddc435d25', '林建龙', 1, 0, 1527162083);

-- --------------------------------------------------------

--
-- 表的结构 `admin_groups`
--

CREATE TABLE IF NOT EXISTS `admin_groups` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `title` varchar(20) NOT NULL COMMENT '角色名称',
  `rights` text NOT NULL COMMENT '角色权限,json',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `admin_groups`
--

INSERT INTO `admin_groups` (`gid`, `title`, `rights`) VALUES
(1, '系统管理员', '[1,4,7,5,6,2,8,9,10,11,12,3,23,22,24,25,26,27,28,29,30,31,32,33,34,35]'),
(2, '开发人员', '');

-- --------------------------------------------------------

--
-- 表的结构 `admin_menus`
--

CREATE TABLE IF NOT EXISTS `admin_menus` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级菜单',
  `ord` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(20) NOT NULL COMMENT '菜单名称',
  `controller` varchar(25) NOT NULL COMMENT '控制器名称',
  `method` varchar(30) NOT NULL,
  `ishidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0正常显示，1隐藏',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `admin_menus`
--

INSERT INTO `admin_menus` (`mid`, `pid`, `ord`, `title`, `controller`, `method`, `ishidden`, `status`) VALUES
(1, 0, 0, '管理员管理', '', '', 0, 0),
(2, 0, 0, '权限管理', '', '', 0, 0),
(3, 0, 0, '系统设置', '', '', 0, 0),
(4, 1, 0, '管理员列表', 'Admin', 'index', 0, 0),
(5, 1, 0, '管理员添加', 'Admin', 'add', 1, 0),
(6, 1, 0, '管理员保存', 'Admin', 'save', 1, 0),
(23, 3, 0, '保存设置', 'Site', 'save', 1, 0),
(7, 4, 0, '角色测试', 'Admin', 'tests', 0, 0),
(8, 2, 0, '菜单管理', 'Menu', 'index', 0, 0),
(9, 2, 0, '菜单添加', 'Menu', 'add', 1, 0),
(10, 2, 0, '菜单保存', 'Menu', 'save', 1, 0),
(11, 2, 0, '角色管理', 'Roles', 'index', 0, 0),
(12, 2, 0, '角色保存', 'Roles', 'save', 1, 0),
(22, 3, 0, '网站设置', 'Site', 'index', 0, 0),
(24, 0, 0, '标签管理', '', '', 0, 0),
(25, 24, 0, '频道标签', 'Labels', 'channel', 0, 0),
(26, 24, 0, '资费标签', 'Labels', 'charge', 0, 0),
(27, 24, 0, '地区标签', 'Labels', 'area', 0, 0),
(28, 0, 0, '影片管理', '', '', 0, 0),
(29, 28, 0, '影片列表', 'Video', 'index', 0, 0),
(30, 28, 0, '添加影片', 'Video', 'add', 1, 0),
(31, 28, 0, '保存影片', 'Video', 'save', 1, 0),
(32, 28, 0, '图片上传', 'Video', 'update_img', 1, 0),
(33, 0, 0, '幻灯片管理', '', '', 0, 0),
(34, 33, 0, '首页首屏', 'Slide', 'index', 0, 0),
(35, 33, 0, '幻灯片保存', 'Slide', 'save', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sites`
--

CREATE TABLE IF NOT EXISTS `sites` (
  `names` varchar(20) NOT NULL,
  `values` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sites`
--

INSERT INTO `sites` (`names`, `values`) VALUES
('site', '"PHP\\u4e2d\\u6587\\u7f51"');

-- --------------------------------------------------------

--
-- 表的结构 `slide`
--

CREATE TABLE IF NOT EXISTS `slide` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '类型：0首页屏',
  `ord` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(30) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `img` varchar(255) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `slide`
--

INSERT INTO `slide` (`id`, `type`, `ord`, `title`, `url`, `img`) VALUES
(3, 0, 0, '热血街舞团：决赛最强舞团诞生', 'http://1ea504a408d144f3a46f47326b7620f7', '/uploads/20180602\\a72824452b140492ea68566c503a4905.jpg'),
(4, 0, 0, '奔跑吧：邓超带伤上阵秀球技', 'http://6e974331791f4b918517d0a0b7a94cb5', '/uploads/20180602\\c5bee9e24f2e7e551821e53db5e409d8.jpg'),
(5, 0, 0, '向往的生活：佟丽娅变田螺姑娘', 'http://eaawsdfgsag', '/uploads/20180602\\2c7178d146f2fd9dc66f2a7cf78f687c.jpg'),
(6, 0, 0, '机器人：林更新机器被打起火', 'http://sagsafg', '/uploads/20180602\\18a2b65a7d805f5c5b084d0a19dbe182.jpg'),
(7, 0, 0, '同学两亿岁:外星美少女狂撩校草', 'http://dfhggh', '/uploads/20180602\\5ae2077e311c8fe2041792eecc559792.jpg'),
(8, 0, 0, '熊出没·变形记：欢乐大冒险', 'http://dfhdfgh', '/uploads/20180602\\480443b9bff7218306b64e18a5e19618.jpg'),
(9, 0, 0, '泡沫之夏：欧辰夏沫大婚', 'http://asfhgfah', '/uploads/20180602\\f9a2608ed8763d59459bed6d3861a191.jpg'),
(10, 0, 0, '妈妈福利双播：安迪军训初体验', 'http://wwsdfgsg', '/uploads/20180602\\61b8f4444e8ded8c14476c30e74b39b5.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) NOT NULL COMMENT '频道',
  `charge_id` int(10) NOT NULL COMMENT '资费',
  `area_id` int(10) NOT NULL COMMENT '地区',
  `title` varchar(50) NOT NULL COMMENT '影片名称',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `img` varchar(255) NOT NULL COMMENT '封面图url',
  `url` varchar(255) NOT NULL COMMENT '影片url',
  `pv` int(10) NOT NULL DEFAULT '0' COMMENT '点击量',
  `score` int(3) NOT NULL DEFAULT '0' COMMENT '影片评分',
  `is_vip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否vipc才能看：0否，1是',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1下线',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `video`
--

INSERT INTO `video` (`id`, `channel_id`, `charge_id`, `area_id`, `title`, `keywords`, `desc`, `img`, `url`, `pv`, `score`, `is_vip`, `status`, `add_time`) VALUES
(1, 2, 11, 14, '测试影片', '哈哈啊', '2333啊啊啊', '/uploads/20180530\\94515ece089d0398ead3cb650f921fca.jpg', 'http://www.php.cn/code/26696.html', 0, 0, 0, 1, 1527680511),
(2, 2, 11, 15, '测试二', '哈啊啊', '23', '/uploads/20180530\\31d72da7a94d3809249e29778ee5263d.jpg', 'http://www.php.cn/code/26696.MP4', 0, 0, 0, 1, 1527680768);

-- --------------------------------------------------------

--
-- 表的结构 `video_label`
--

CREATE TABLE IF NOT EXISTS `video_label` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ord` int(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(50) NOT NULL COMMENT '标签标题',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `flag` varchar(50) NOT NULL COMMENT '标签分类标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `video_label`
--

INSERT INTO `video_label` (`id`, `ord`, `title`, `status`, `flag`) VALUES
(1, 0, '电视剧', 0, 'channel'),
(2, 0, '电影', 0, 'channel'),
(3, 0, '综艺', 0, 'channel'),
(4, 0, '动漫', 0, 'channel'),
(5, 0, '纪录片', 0, 'channel'),
(6, 0, '游戏', 0, 'channel'),
(7, 0, '资讯', 0, 'channel'),
(8, 0, '娱乐', 0, 'channel'),
(9, 0, '财经', 0, 'channel'),
(10, 0, '网络电影', 0, 'channel'),
(11, 0, '免费', 0, 'charge'),
(12, 0, '付费', 0, 'charge'),
(13, 0, '华语', 0, 'area'),
(14, 0, '香港', 0, 'area'),
(15, 0, '美国', 0, 'area'),
(16, 0, '欧洲', 0, 'area'),
(17, 0, '韩国', 0, 'area'),
(18, 0, '日本', 0, 'area'),
(19, 0, '泰国', 0, 'area'),
(20, 0, '其他', 0, 'area');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
