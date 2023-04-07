-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost:3306
-- 產生時間： 2023-04-07 08:25:59
-- 伺服器版本： 5.7.24
-- PHP 版本： 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `eeit58group3`
--
CREATE DATABASE IF NOT EXISTS `eeit58group3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `eeit58group3`;

-- --------------------------------------------------------

--
-- 資料表結構 `activity`
--

CREATE TABLE `activity` (
  `id` smallint(5) NOT NULL,
  `host` smallint(6) NOT NULL,
  `activityTitle` varchar(50) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `location` varchar(100) NOT NULL,
  `activityTime` date NOT NULL,
  `fee` varchar(100) NOT NULL,
  `min` smallint(6) NOT NULL,
  `max` smallint(6) NOT NULL,
  `reservation` char(1) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `level` varchar(8) NOT NULL,
  `participataion` varchar(10000) NOT NULL,
  `expired` char(1) NOT NULL,
  `postTime` datetime NOT NULL,
  `pic` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `activity_add`
--

CREATE TABLE `activity_add` (
  `id` smallint(6) NOT NULL,
  `memberId` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ban_list`
--

CREATE TABLE `ban_list` (
  `memberId` smallint(6) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `gym`
--

CREATE TABLE `gym` (
  `gymName` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `LatLng` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `id` smallint(5) NOT NULL,
  `account` varchar(100) NOT NULL,
  `password` varchar(10000) NOT NULL,
  `Icon` varchar(100) DEFAULT NULL,
  `memberName` varchar(100) NOT NULL,
  `phoneNumber` char(10) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zone`
--

CREATE TABLE `zone` (
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_from_activity_to_member_id` (`host`);

--
-- 資料表索引 `activity_add`
--
ALTER TABLE `activity_add`
  ADD KEY `fk_from_add_to_member_id` (`memberId`),
  ADD KEY `fk_from_add_to_activity_id` (`id`);

--
-- 資料表索引 `ban_list`
--
ALTER TABLE `ban_list`
  ADD KEY `fk_from_ban_to_member_id` (`memberId`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_account` (`account`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `activity`
--
ALTER TABLE `activity`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `fk_from_activity_to_member_id` FOREIGN KEY (`host`) REFERENCES `member` (`id`);

--
-- 資料表的限制式 `activity_add`
--
ALTER TABLE `activity_add`
  ADD CONSTRAINT `fk_from_add_to_activity_id` FOREIGN KEY (`id`) REFERENCES `activity` (`id`),
  ADD CONSTRAINT `fk_from_add_to_member_id` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`);

--
-- 資料表的限制式 `ban_list`
--
ALTER TABLE `ban_list`
  ADD CONSTRAINT `fk_from_ban_to_member_id` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
