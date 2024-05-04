-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране:  4 май 2024 в 18:54
-- Версия на сървъра: 10.4.32-MariaDB
-- Версия на PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данни: `dzi_14`
--

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add book', 7, 'add_book'),
(26, 'Can change book', 7, 'change_book'),
(27, 'Can delete book', 7, 'delete_book'),
(28, 'Can view book', 7, 'view_book'),
(29, 'Can add bus', 8, 'add_bus'),
(30, 'Can change bus', 8, 'change_bus'),
(31, 'Can delete bus', 8, 'delete_bus'),
(32, 'Can view bus', 8, 'view_bus'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$3nbJaxZtU3tAPTkIqWPY4Y$58+CRpW8G45gXi9IUi+fyPOPh7DZ/a69xOFfI77vOog=', '2024-05-04 14:38:38.954151', 0, 'client1', '', '', 'abc@bca.bg', 0, 1, '2024-05-04 00:23:25.683499'),
(2, 'pbkdf2_sha256$600000$fN5UY44DR3sDwClHnVM7eR$PBPdI3MYziBuu64rHmn2OWS15AUIN8EQ1uwofHOEdpk=', '2024-05-04 14:12:49.065269', 1, 'admin', '', '', '', 1, 1, '2024-05-04 00:25:27.330388'),
(4, 'pbkdf2_sha256$600000$3IPJIwsrrUJjs5X6YSoufz$178zyofTbyfTEffYx58SyPR07GXNgWEN/qLdYsFMCWA=', '2024-05-04 04:22:09.336787', 0, 'client2', '', '', 'a@abv.bg', 0, 1, '2024-05-04 04:22:09.006749');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-05-04 04:30:31.013240', '1', 'Банско-София', 1, '[{\"added\": {}}]', 8, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'book'),
(8, 'main', 'bus'),
(9, 'main', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-04 00:08:44.747401'),
(2, 'auth', '0001_initial', '2024-05-04 00:08:45.561651'),
(3, 'admin', '0001_initial', '2024-05-04 00:08:45.707735'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-05-04 00:08:45.717937'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-04 00:08:45.727942'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-05-04 00:08:45.814078'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-05-04 00:08:45.958588'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-05-04 00:08:45.977806'),
(9, 'auth', '0004_alter_user_username_opts', '2024-05-04 00:08:45.985810'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-05-04 00:08:46.150127'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-05-04 00:08:46.152334'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-05-04 00:08:46.161407'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-05-04 00:08:46.178078'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-05-04 00:08:46.194748'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-05-04 00:08:46.213029'),
(16, 'auth', '0011_update_proxy_permissions', '2024-05-04 00:08:46.222847'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-05-04 00:08:46.240919'),
(18, 'sessions', '0001_initial', '2024-05-04 00:08:46.279358'),
(19, 'main', '0001_initial', '2024-05-04 00:24:03.981831'),
(20, 'main', '0002_alter_book_bus_name_alter_book_busid_alter_book_date_and_more', '2024-05-04 04:16:12.053587');

-- --------------------------------------------------------

--
-- Структура на таблица `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('dn4ebl7el59sa6it9wue3ugtnrhrmt2p', '.eJxVjDEOwjAMRe-SGUU2jeyEkZ0zVK7j0AJKpaadEHdHlTrA-t97_-162dax35ot_ZTdxaE7_W6D6NPqDvJD6n32Otd1mQa_K_6gzd_mbK_r4f4djNLGvU6hlJKZA_OZUAABYgFLCoGiCgTsIltUKkrUDZlSIBNFZANmcJ8v1Bw3TQ:1s3GX8:ET95n5m5XM1Qftl7aOnOAGCm6JdDh24he8xDAhiLl3Q', '2024-05-18 14:38:38.960721'),
('xypim6xtsvb675rcy15dwpai5o3rcry3', 'e30:1s36jq:UMDELOJGrrayCYiw5T61kH8L0lu7Wj9kKjTgEbiSx4o', '2024-05-18 04:11:06.900894');

-- --------------------------------------------------------

--
-- Структура на таблица `main_book`
--

DROP TABLE IF EXISTS `main_book`;
CREATE TABLE `main_book` (
  `id` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(30) NOT NULL,
  `userid` decimal(2,0) NOT NULL,
  `busid` decimal(2,0) NOT NULL,
  `bus_name` varchar(30) NOT NULL,
  `source` varchar(30) NOT NULL,
  `dest` varchar(30) NOT NULL,
  `nos` decimal(2,0) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `status` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_book`
--

INSERT INTO `main_book` (`id`, `email`, `name`, `userid`, `busid`, `bus_name`, `source`, `dest`, `nos`, `price`, `date`, `time`, `status`) VALUES
(1, '', 'admin', 2, 1, 'Банско-София', 'Банско', 'София', 2, 30.00, '2024-05-04', '08:30:00.000000', 'B'),
(2, 'abc@bca.bg', 'client1', 1, 1, 'Банско-София', 'Банско', 'София', 0, 30.00, '2024-05-04', '08:30:00.000000', 'C'),
(3, 'abc@bca.bg', 'client1', 1, 1, 'Банско-София', 'Банско', 'София', 1, 30.00, '2024-05-04', '08:30:00.000000', 'B'),
(4, 'abc@bca.bg', 'client1', 1, 1, 'Банско-София', 'Банско', 'София', 1, 30.00, '2024-05-04', '08:30:00.000000', 'B'),
(5, 'abc@bca.bg', 'client1', 1, 1, 'Банско-София', 'Банско', 'София', 1, 30.00, '2024-05-04', '08:30:00.000000', 'B'),
(6, 'abc@bca.bg', 'client1', 1, 1, 'Банско-София', 'Банско', 'София', 1, 30.00, '2024-05-04', '08:30:00.000000', 'B'),
(7, 'abc@bca.bg', 'client1', 1, 1, 'Банско-София', 'Банско', 'София', 1, 30.00, '2024-05-04', '08:30:00.000000', 'B'),
(8, 'abc@bca.bg', 'client1', 1, 1, 'Банско-София', 'Банско', 'София', 1, 30.00, '2024-05-04', '08:30:00.000000', 'B');

-- --------------------------------------------------------

--
-- Структура на таблица `main_bus`
--

DROP TABLE IF EXISTS `main_bus`;
CREATE TABLE `main_bus` (
  `id` bigint(20) NOT NULL,
  `bus_name` varchar(30) NOT NULL,
  `source` varchar(30) NOT NULL,
  `dest` varchar(30) NOT NULL,
  `nos` decimal(2,0) NOT NULL,
  `rem` decimal(2,0) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_bus`
--

INSERT INTO `main_bus` (`id`, `bus_name`, `source`, `dest`, `nos`, `rem`, `price`, `date`, `time`) VALUES
(1, 'Банско-София', 'Банско', 'София', 42, 44, 30.00, '2024-05-04', '08:30:00.000000');

-- --------------------------------------------------------

--
-- Структура на таблица `main_user`
--

DROP TABLE IF EXISTS `main_user`;
CREATE TABLE `main_user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индекси за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индекси за таблица `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индекси за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индекси за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индекси за таблица `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индекси за таблица `main_book`
--
ALTER TABLE `main_book`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_bus`
--
ALTER TABLE `main_bus`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_user`
--
ALTER TABLE `main_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `main_book`
--
ALTER TABLE `main_book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `main_bus`
--
ALTER TABLE `main_bus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `main_user`
--
ALTER TABLE `main_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
