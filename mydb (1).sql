-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th8 22, 2019 lúc 02:29 AM
-- Phiên bản máy phục vụ: 10.3.16-MariaDB
-- Phiên bản PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mydb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `chatter` int(11) DEFAULT NULL,
  `chatted` int(11) DEFAULT NULL,
  `content` varchar(425) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `commentLikes`
--

CREATE TABLE `commentLikes` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `comments_id` int(11) NOT NULL,
  `comments_users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `posts_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `emotions`
--

CREATE TABLE `emotions` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `posts_id` int(10) UNSIGNED NOT NULL,
  `emotionStatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `emotionStatus`
--

CREATE TABLE `emotionStatus` (
  `id` int(11) NOT NULL,
  `sad` int(11) DEFAULT 1,
  `happy` int(11) DEFAULT 2,
  `angry` int(11) DEFAULT 3,
  `inlove` int(11) DEFAULT 4,
  `haha` int(11) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `follower` varchar(45) DEFAULT NULL,
  `followered` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `foridden`
--

CREATE TABLE `foridden` (
  `id` int(11) NOT NULL,
  `blocker` varchar(45) DEFAULT NULL,
  `blocked person` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `time` varchar(45) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `friendsOf` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gps`
--

CREATE TABLE `gps` (
  `id` int(11) NOT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longtitude` varchar(45) DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pageLikes`
--

CREATE TABLE `pageLikes` (
  `id` int(11) NOT NULL,
  `time` time DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `pages_id` int(11) NOT NULL,
  `pages_users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pageposts`
--

CREATE TABLE `pageposts` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pages_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `introduction` varchar(45) DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pageSetup`
--

CREATE TABLE `pageSetup` (
  `id` int(11) NOT NULL,
  `statusPage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `postConfigs`
--

CREATE TABLE `postConfigs` (
  `id` int(11) NOT NULL,
  `posts_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `checkIn` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `name`, `content`, `checkIn`, `created_at`, `updated_at`, `users_id`) VALUES
(34, 'zzzz', 'zzzz', 'Ha Noi', '2019-08-19 19:20:52', '2019-08-19 19:20:52', 4),
(35, 'cau chuyen fix bug', 'fix bug is very hard', 'Ha Noi', '2019-08-19 19:23:15', '2019-08-19 19:23:15', 4),
(36, 'cau chuyen thu 35', 'Met qua cac ban a.Code toan fix loi', 'Ha Noi', '2019-08-19 19:34:41', '2019-08-19 19:34:41', 4),
(37, 'test hotfix', 'checking into system', 'Ha Noi', '2019-08-19 19:36:03', '2019-08-19 19:36:03', 4),
(38, 'haha', 'hahah123', 'Ha Noi', '2019-08-19 19:41:20', '2019-08-19 19:41:20', 4),
(39, 'id5', 'jhkjahsd', 'Ha Noi', '2019-08-19 19:48:36', '2019-08-19 19:48:36', 4),
(40, 'id6', 'id6', NULL, '2019-08-19 19:49:55', '2019-08-19 19:49:55', 6),
(41, 'id6', 'id6', NULL, '2019-08-19 19:49:58', '2019-08-19 19:49:58', 6),
(42, 'as', 'as', 'Ha Noi', '2019-08-19 19:50:11', '2019-08-19 19:50:11', 4),
(43, 'My name is Mina', 'I am continues my posts~~', 'Ha Noi', '2019-08-19 20:06:14', '2019-08-19 20:06:14', 4),
(44, 'ducanh', 'write by bootstrap', 'Ha Noi', '2019-08-19 20:24:44', '2019-08-19 20:24:44', 4),
(45, 'asd', 'asdasd', 'Ha Noi', '2019-08-19 20:25:45', '2019-08-19 20:25:45', 4),
(46, 'cau chuyen dem khuya', 'cau chuyen dem khuya 123', 'Ha Noi', '2019-08-19 20:27:13', '2019-08-19 20:27:13', 4),
(47, 'post hihi', 'cau chuyen rat hay', 'Ha Noi', '2019-08-19 20:29:26', '2019-08-19 20:29:26', 4),
(48, 'tetete', 'tetete', 'Ha Noi', '2019-08-19 20:29:40', '2019-08-19 20:29:40', 4),
(49, 'code late', 'Today i write code lately and very tired!!!!!', 'Ha Noi', '2019-08-19 20:45:11', '2019-08-19 20:45:11', 4),
(50, 'My diagry', 'Today I have a test case.I Am very happy', 'Ha Noi', '2019-08-21 18:03:23', '2019-08-21 18:03:23', 4),
(51, '', '', 'Ha Noi', '2019-08-21 19:04:27', '2019-08-21 19:04:27', 4),
(52, '', '', 'Ha Noi', '2019-08-21 19:04:51', '2019-08-21 19:04:51', 4),
(53, '', '', 'Ha Noi', '2019-08-21 19:05:46', '2019-08-21 19:05:46', 4),
(54, '', '', 'Ha Noi', '2019-08-21 19:08:57', '2019-08-21 19:08:57', 4),
(55, '', '', 'Ha Noi', '2019-08-21 19:12:52', '2019-08-21 19:12:52', 4),
(56, '', '', 'Ha Noi', '2019-08-21 19:13:17', '2019-08-21 19:13:17', 4),
(57, '', '', 'Ha Noi', '2019-08-21 19:14:36', '2019-08-21 19:14:36', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sharePost`
--

CREATE TABLE `sharePost` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `presentAddress` varchar(255) DEFAULT NULL,
  `permanentAddress` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `username`, `phoneNumber`, `presentAddress`, `permanentAddress`, `password`) VALUES
(1, 'jalkjd', 'kljlksjdlkajl', 'kjlakjdlkj', 'lkjalkdjlk', 'jlajdlkjakl', 'lkjalksjdlkj', 'lkjalkjsd'),
(3, 'ducanh', 'nahkj', 'jkhjk', 'hjk', 'hkj', 'hjk', 'hkjh'),
(4, 'ducanh', 'ducanhdhtb@gmail.com', 'ducanh123', 'lkjasdklj', 'lkjaksdjl', 'lkjlj', 'ducanh123'),
(5, 'asdasda', 'sdasd', 'asd', 'asd', 'asd', 'asdas', 'asd'),
(6, '', '', '', '', '', '', ''),
(7, '', '', '', '', '', '', ''),
(8, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `visible`
--

CREATE TABLE `visible` (
  `id` int(11) NOT NULL,
  `everyone` int(11) DEFAULT 1,
  `onlyme` int(11) DEFAULT 2,
  `friend` int(11) DEFAULT 3,
  `friendConfig` varchar(45) DEFAULT NULL,
  `postConfigs_id` int(11) NOT NULL,
  `postConfigs_posts_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `commentLikes`
--
ALTER TABLE `commentLikes`
  ADD PRIMARY KEY (`id`,`comments_id`,`comments_users_id`),
  ADD KEY `fk_commentLikes_users1_idx` (`users_id`),
  ADD KEY `fk_commentLikes_comments1_idx` (`comments_id`,`comments_users_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`,`users_id`,`posts_id`),
  ADD KEY `fk_comments_users1_idx` (`users_id`),
  ADD KEY `fk_comments_posts1_idx` (`posts_id`);

--
-- Chỉ mục cho bảng `emotions`
--
ALTER TABLE `emotions`
  ADD PRIMARY KEY (`id`,`users_id`,`posts_id`),
  ADD KEY `fk_emotions_users1_idx` (`users_id`),
  ADD KEY `fk_emotions_posts1_idx` (`posts_id`);

--
-- Chỉ mục cho bảng `emotionStatus`
--
ALTER TABLE `emotionStatus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `foridden`
--
ALTER TABLE `foridden`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`,`users_id`),
  ADD KEY `fk_friends_users1_idx` (`users_id`);

--
-- Chỉ mục cho bảng `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gps_users1_idx` (`users_id`);

--
-- Chỉ mục cho bảng `pageLikes`
--
ALTER TABLE `pageLikes`
  ADD PRIMARY KEY (`id`,`users_id`,`pages_id`,`pages_users_id`),
  ADD KEY `fk_pageLikes_users1_idx` (`users_id`),
  ADD KEY `fk_pageLikes_pages1_idx` (`pages_id`,`pages_users_id`);

--
-- Chỉ mục cho bảng `pageposts`
--
ALTER TABLE `pageposts`
  ADD PRIMARY KEY (`id`,`pages_id`),
  ADD KEY `fk_pageposts_pages1_idx` (`pages_id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`,`users_id`),
  ADD KEY `fk_pages_users1_idx` (`users_id`);

--
-- Chỉ mục cho bảng `pageSetup`
--
ALTER TABLE `pageSetup`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `postConfigs`
--
ALTER TABLE `postConfigs`
  ADD PRIMARY KEY (`id`,`posts_id`),
  ADD KEY `fk_postConfigs_posts1_idx` (`posts_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_posts_users_idx` (`users_id`);

--
-- Chỉ mục cho bảng `sharePost`
--
ALTER TABLE `sharePost`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `visible`
--
ALTER TABLE `visible`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_visible_postConfigs1_idx` (`postConfigs_id`,`postConfigs_posts_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `commentLikes`
--
ALTER TABLE `commentLikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `emotions`
--
ALTER TABLE `emotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `emotionStatus`
--
ALTER TABLE `emotionStatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `foridden`
--
ALTER TABLE `foridden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `gps`
--
ALTER TABLE `gps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pageLikes`
--
ALTER TABLE `pageLikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pageposts`
--
ALTER TABLE `pageposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pageSetup`
--
ALTER TABLE `pageSetup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `postConfigs`
--
ALTER TABLE `postConfigs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `sharePost`
--
ALTER TABLE `sharePost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `visible`
--
ALTER TABLE `visible`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `commentLikes`
--
ALTER TABLE `commentLikes`
  ADD CONSTRAINT `fk_commentLikes_comments1` FOREIGN KEY (`comments_id`,`comments_users_id`) REFERENCES `comments` (`id`, `users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commentLikes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `emotions`
--
ALTER TABLE `emotions`
  ADD CONSTRAINT `fk_emotions_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emotions_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `fk_friends_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `gps`
--
ALTER TABLE `gps`
  ADD CONSTRAINT `fk_gps_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `pageLikes`
--
ALTER TABLE `pageLikes`
  ADD CONSTRAINT `fk_pageLikes_pages1` FOREIGN KEY (`pages_id`,`pages_users_id`) REFERENCES `pages` (`id`, `users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pageLikes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `pageposts`
--
ALTER TABLE `pageposts`
  ADD CONSTRAINT `fk_pageposts_pages1` FOREIGN KEY (`pages_id`) REFERENCES `pages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_pages_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `postConfigs`
--
ALTER TABLE `postConfigs`
  ADD CONSTRAINT `fk_postConfigs_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `visible`
--
ALTER TABLE `visible`
  ADD CONSTRAINT `fk_visible_postConfigs1` FOREIGN KEY (`postConfigs_id`,`postConfigs_posts_id`) REFERENCES `postConfigs` (`id`, `posts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
