-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2023 at 08:14 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flat`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `auth_permission`
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
(25, 'Can add member', 7, 'add_member'),
(26, 'Can change member', 7, 'change_member'),
(27, 'Can delete member', 7, 'delete_member'),
(28, 'Can view member', 7, 'view_member'),
(29, 'Can add staff', 8, 'add_staff'),
(30, 'Can change staff', 8, 'change_staff'),
(31, 'Can delete staff', 8, 'delete_staff'),
(32, 'Can view staff', 8, 'view_staff'),
(33, 'Can add gym_detail', 9, 'add_gym_detail'),
(34, 'Can change gym_detail', 9, 'change_gym_detail'),
(35, 'Can delete gym_detail', 9, 'delete_gym_detail'),
(36, 'Can view gym_detail', 9, 'view_gym_detail'),
(37, 'Can add hall_detail', 10, 'add_hall_detail'),
(38, 'Can change hall_detail', 10, 'change_hall_detail'),
(39, 'Can delete hall_detail', 10, 'delete_hall_detail'),
(40, 'Can view hall_detail', 10, 'view_hall_detail'),
(41, 'Can add pool_detail', 11, 'add_pool_detail'),
(42, 'Can change pool_detail', 11, 'change_pool_detail'),
(43, 'Can delete pool_detail', 11, 'delete_pool_detail'),
(44, 'Can view pool_detail', 11, 'view_pool_detail'),
(45, 'Can add gym_booking', 12, 'add_gym_booking'),
(46, 'Can change gym_booking', 12, 'change_gym_booking'),
(47, 'Can delete gym_booking', 12, 'delete_gym_booking'),
(48, 'Can view gym_booking', 12, 'view_gym_booking'),
(49, 'Can add hall_booking', 13, 'add_hall_booking'),
(50, 'Can change hall_booking', 13, 'change_hall_booking'),
(51, 'Can delete hall_booking', 13, 'delete_hall_booking'),
(52, 'Can view hall_booking', 13, 'view_hall_booking'),
(53, 'Can add pool_booking', 14, 'add_pool_booking'),
(54, 'Can change pool_booking', 14, 'change_pool_booking'),
(55, 'Can delete pool_booking', 14, 'delete_pool_booking'),
(56, 'Can view pool_booking', 14, 'view_pool_booking'),
(57, 'Can add work_assign', 15, 'add_work_assign'),
(58, 'Can change work_assign', 15, 'change_work_assign'),
(59, 'Can delete work_assign', 15, 'delete_work_assign'),
(60, 'Can view work_assign', 15, 'view_work_assign'),
(61, 'Can add payments', 16, 'add_payments'),
(62, 'Can change payments', 16, 'change_payments'),
(63, 'Can delete payments', 16, 'delete_payments'),
(64, 'Can view payments', 16, 'view_payments');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'flatresidence', 'gym_booking'),
(9, 'flatresidence', 'gym_detail'),
(13, 'flatresidence', 'hall_booking'),
(10, 'flatresidence', 'hall_detail'),
(7, 'flatresidence', 'member'),
(16, 'flatresidence', 'payments'),
(14, 'flatresidence', 'pool_booking'),
(11, 'flatresidence', 'pool_detail'),
(8, 'flatresidence', 'staff'),
(15, 'flatresidence', 'work_assign'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-04 06:25:30.390565'),
(2, 'auth', '0001_initial', '2023-07-04 06:25:32.141791'),
(3, 'admin', '0001_initial', '2023-07-04 06:25:32.489452'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-04 06:25:32.497464'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-04 06:25:32.505466'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-04 06:25:32.577433'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-04 06:25:32.617417'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-04 06:25:32.665397'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-04 06:25:32.681390'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-04 06:25:32.713376'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-04 06:25:32.721375'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-04 06:25:32.729375'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-04 06:25:32.761356'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-04 06:25:32.793342'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-04 06:25:32.833326'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-04 06:25:32.841323'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-04 06:25:32.881305'),
(18, 'flatresidence', '0001_initial', '2023-07-04 06:25:32.953565'),
(19, 'sessions', '0001_initial', '2023-07-04 06:25:33.209450'),
(20, 'flatresidence', '0002_staff', '2023-07-04 07:08:15.844344'),
(21, 'flatresidence', '0003_gym_detail', '2023-07-04 07:31:23.578788'),
(22, 'flatresidence', '0004_hall_detail_pool_detail', '2023-07-04 08:40:37.310846'),
(23, 'flatresidence', '0005_gym_booking_hall_booking_pool_booking', '2023-07-04 11:36:44.038466'),
(24, 'flatresidence', '0006_work_assign', '2023-07-05 03:54:04.568234'),
(25, 'flatresidence', '0007_payments', '2023-07-05 05:15:31.335641');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('28yaeec9966gqqjye2q25tkf33xfmwd8', 'e30:1qGvUw:_T4eRG6l-ik2qz30NfAjgz4AtFBf6HSIX_lMejBIOo4', '2023-07-19 05:56:18.116589'),
('7x5i8wsoi3ckx9f9njkj9c57nhuzwsic', 'eyJzaWQiOjEsInNuYW1lIjoiQmFidSIsInNlbWFpbCI6ImJAZ21haWwuY29tIn0:1qGu0v:P7qj4mkqmGtvju7Seh32v7r5PeSa54NbQUZxAtdnHmM', '2023-07-19 04:21:13.159017'),
('bchjmvzuak30bhyti4vskqupxpo53171', 'e30:1qGZkl:q9A3xysy4V1HdD5F3HrXKMSWscLVWxpX8XIaUkM-Dm8', '2023-07-18 06:43:11.452339'),
('vhj63p24cer3l78bmiqv5x3fx4f45k67', 'eyJtaWQiOjEsIm1uYW1lIjoiamVpcm4iLCJtZW1haWwiOiJqQGdtYWlsLmNvbSJ9:1qGdVO:MeQOc9luRWL0Atu5lZ9kZhlH_B42b5xXCZejKtt66mk', '2023-07-18 10:43:34.755528'),
('w79goyy0uk7v8hu4tjqmxnmxx9724zyy', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1qGaNU:lc_4EsojxccOofWQxOaV5mO32wKvka3i9LBsp0DxvtE', '2023-07-18 07:23:12.032372'),
('yaeeiakko7lfqloelsmxn1gnoopwawvj', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1qGt4n:29ol8DaSre-2URwnS_bFUYX3eKc0TQfaftXzI5qfPlE', '2023-07-19 03:21:09.117254');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_gym_booking`
--

CREATE TABLE IF NOT EXISTS `flatresidence_gym_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `m_id` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flatresidence_gym_booking`
--

INSERT INTO `flatresidence_gym_booking` (`id`, `name`, `time`, `m_id`, `status`) VALUES
(1, 'Start Gym', '2023-07-04T05:12', '1', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_gym_detail`
--

CREATE TABLE IF NOT EXISTS `flatresidence_gym_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flatresidence_gym_detail`
--

INSERT INTO `flatresidence_gym_detail` (`id`, `name`, `time`) VALUES
(1, 'Start Gym', '4 Am- 10 Pm');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_hall_booking`
--

CREATE TABLE IF NOT EXISTS `flatresidence_hall_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `m_id` varchar(100) NOT NULL,
  `seat` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flatresidence_hall_booking`
--

INSERT INTO `flatresidence_hall_booking` (`id`, `name`, `time`, `m_id`, `seat`, `status`) VALUES
(1, 'Central Hall', '2023-07-04T05:18', '1', '100', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_hall_detail`
--

CREATE TABLE IF NOT EXISTS `flatresidence_hall_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `seat` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flatresidence_hall_detail`
--

INSERT INTO `flatresidence_hall_detail` (`id`, `name`, `time`, `seat`, `details`) VALUES
(1, 'Central Hall', '8Am- 10 Pm', '200', 'Central Hall ');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_member`
--

CREATE TABLE IF NOT EXISTS `flatresidence_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `flat_no` varchar(100) NOT NULL,
  `typee` varchar(100) NOT NULL,
  `no_member` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flatresidence_member`
--

INSERT INTO `flatresidence_member` (`id`, `name`, `email`, `phone`, `flat_no`, `typee`, `no_member`, `password`) VALUES
(1, 'jeirn james', 'j@gmail.com', '9865986589', '12D', 'Resident', '3', '123');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_payments`
--

CREATE TABLE IF NOT EXISTS `flatresidence_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `m_id` varchar(100) NOT NULL,
  `typee` varchar(100) NOT NULL,
  `cardtype` varchar(100) NOT NULL,
  `cardname` varchar(100) NOT NULL,
  `cardnumber` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flatresidence_payments`
--

INSERT INTO `flatresidence_payments` (`id`, `m_id`, `typee`, `cardtype`, `cardname`, `cardnumber`, `cvv`, `message`, `date`) VALUES
(1, '1', 'Rent', 'Debit', 'jerin', '786871623876', '123', 'Rent for June', '2023-07-05'),
(2, '1', 'Electricity', 'Debit', 'jerin', '234235345645', '345', '', '2023-07-05');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_pool_booking`
--

CREATE TABLE IF NOT EXISTS `flatresidence_pool_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `m_id` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flatresidence_pool_booking`
--

INSERT INTO `flatresidence_pool_booking` (`id`, `name`, `time`, `m_id`, `status`) VALUES
(1, 'Top pool', '2023-07-04T05:23', '1', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_pool_detail`
--

CREATE TABLE IF NOT EXISTS `flatresidence_pool_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flatresidence_pool_detail`
--

INSERT INTO `flatresidence_pool_detail` (`id`, `name`, `time`, `details`) VALUES
(1, 'Top pool', '8 Am- 10 Pm', 'Terace pool');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_staff`
--

CREATE TABLE IF NOT EXISTS `flatresidence_staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flatresidence_staff`
--

INSERT INTO `flatresidence_staff` (`id`, `name`, `email`, `phone`, `place`, `password`) VALUES
(1, 'Babu', 'b@gmail.com', '9865986589', 'thrissur', '123');

-- --------------------------------------------------------

--
-- Table structure for table `flatresidence_work_assign`
--

CREATE TABLE IF NOT EXISTS `flatresidence_work_assign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `s_id` varchar(100) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `work` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flatresidence_work_assign`
--

INSERT INTO `flatresidence_work_assign` (`id`, `s_id`, `s_name`, `work`, `date`, `status`) VALUES
(1, '1', 'Babu', 'Plimbing in  FLat Nimber 12D .Urgent Work', '2023-07-06', 'accepted');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
