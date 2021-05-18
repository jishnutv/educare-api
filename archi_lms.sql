-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 17, 2021 at 11:40 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `archi_lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_courses`
--

DROP TABLE IF EXISTS `all_courses`;
CREATE TABLE IF NOT EXISTS `all_courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `scheme` bigint(20) UNSIGNED DEFAULT NULL,
  `certification` bigint(20) UNSIGNED DEFAULT NULL,
  `curiculam` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `title` varchar(80) CHARACTER SET latin1 NOT NULL,
  `desc_mal` longtext CHARACTER SET utf8mb4,
  `desc_eng` text CHARACTER SET latin1,
  `course_info` text CHARACTER SET latin1,
  `course_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `istopten` tinyint(1) DEFAULT NULL,
  `ispopular` tinyint(1) DEFAULT NULL,
  `videolink` text CHARACTER SET latin1,
  `img_name` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `img_contrast` int(11) DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `offline_fee` int(11) DEFAULT NULL,
  `online_fee` int(11) DEFAULT NULL,
  `tax` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `n_duration` int(11) DEFAULT NULL,
  `n_type` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `f_duration` int(11) DEFAULT NULL,
  `type` enum('C','P') CHARACTER SET latin1 DEFAULT NULL,
  `f_type` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `par_ind` (`user_id`),
  KEY `category_fk` (`cat_id`),
  KEY `scheme on course` (`scheme`),
  KEY `certification on course` (`certification`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_courses`
--

INSERT INTO `all_courses` (`id`, `user_id`, `cat_id`, `scheme`, `certification`, `curiculam`, `title`, `desc_mal`, `desc_eng`, `course_info`, `course_type`, `istopten`, `ispopular`, `videolink`, `img_name`, `img_contrast`, `tags`, `offline_fee`, `online_fee`, `tax`, `n_duration`, `n_type`, `f_duration`, `type`, `f_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, 1, '', 'Abacus Training', '5 വയസ്സുമുതല്‍ കുട്ടികള്‍ക്ക് അബാക്കസ്സ് പഠനം നല്‍കുന്നതിലൂടെ പഠനത്തില്‍ മികച്ച വിജയം നേടുവാന്‍ സാധിക്കുന്നു. കുട്ടികളിലെ ഏകാഗ്രത, ശ്രദ്ധ, ഓര്‍മ്മശക്തി എന്നിവ വര്‍ദ്ധിപ്പിക്കാനും, ഗണിതശാസ്ത്രത്തെ രസകരമായി വിദ്യാര്‍ത്ഥികളില്‍ എത്തിക്കുവാനും തന്‍മൂലം പഠനം ലളിതവും വിനോദകരവും ആക്കാന്‍ കുട്ടികളെ അബാക്കസ്സ് പഠനത്തിലൂടെ സഹായിക്കുന്നു', 'We use the Abacus tool and concept at our Archikites Abacus Academy, to help children learn the technique.\r\nThe importance of brain development is vital to optimise the growth of the human brain and its function. Through studies in developmental neurobiology, it is proven that experiences in early life affects different stages of development and aiding a child’s learning, helps provide the brain with a promising beginning.', 'Brain Development, Confidence Building, Improved calculation skills, Mastering Arithmetic, Having fun with maths, memory techniques Exercise', 'online', 1, 1, 'https://youtu.be/R6DfLXP1yjQ', '1_1619687808.jpg', 3, 'abacus,anadham,anadham2021', 2500, 2500, 'NO', 6, 'month', 25, 'C', 'day', 'ACT', '2021-04-29 03:46:48', '2021-04-30 05:29:56'),
(2, 1, 1, 2, 2, '', 'test data', 'df', 'j', NULL, 'offline', 0, 0, NULL, '', 3, NULL, 3000, 5000, 'NO', 2, 'year', 2, 'P', 'year', 'ACT', '2021-05-06 02:56:27', '2021-05-06 02:59:26');

-- --------------------------------------------------------

--
-- Table structure for table `attandances`
--

DROP TABLE IF EXISTS `attandances`;
CREATE TABLE IF NOT EXISTS `attandances` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `batch_id` bigint(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `intime` time NOT NULL,
  `outtime` time NOT NULL,
  `duration` time DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attandances`
--

INSERT INTO `attandances` (`id`, `user_id`, `student_id`, `batch_id`, `type`, `date`, `intime`, `outtime`, `duration`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'Morning', '2021-04-29', '10:00:00', '11:00:00', '01:00:00', '2021-04-29 04:03:37', '2021-04-29 04:03:37'),
(2, 15, 1, 2, 'Evening', '2021-05-03', '20:53:00', '21:55:00', '01:02:00', '2021-05-03 06:51:11', '2021-05-03 06:51:11'),
(3, 15, 2, 2, 'Evening', '2021-05-03', '20:53:00', '21:55:00', '01:02:00', '2021-05-03 06:51:11', '2021-05-03 06:51:11'),
(4, 15, 1, 2, 'Morning', '2021-05-03', '09:00:00', '10:10:00', '01:10:00', '2021-05-03 06:52:35', '2021-05-03 06:52:35'),
(5, 15, 2, 2, 'Morning', '2021-05-03', '09:00:00', '10:10:00', '01:10:00', '2021-05-03 06:52:36', '2021-05-03 06:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
CREATE TABLE IF NOT EXISTS `batches` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Abacus May First 2021', 'Anadham 2021 online Batch', '2021-04-29 02:35:39', '2021-04-29 02:35:39'),
(2, 1, 'Abacus April First 2021', 'summer vacation course', '2021-04-29 03:13:45', '2021-04-29 03:13:45'),
(3, 1, 'test', 'dg', '2021-05-06 06:35:12', '2021-05-06 06:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(40) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `icon`, `title`, `color`, `created_at`, `updated_at`) VALUES
(1, 1, '1_1619683851.png', 'Graphic Design', 'success-gr', '2021-04-29 02:40:51', '2021-04-29 02:40:51'),
(2, 1, '1_1619683917.png', 'Accounting', 'danger-gr', '2021-04-29 02:41:57', '2021-04-29 02:41:57'),
(3, 1, '1_1619684103.png', 'Web Development', 'primary-gr', '2021-04-29 02:45:03', '2021-04-29 02:45:03'),
(4, 1, '1_1619684124.png', 'Digital Marketing', 'secondary-gr', '2021-04-29 02:45:24', '2021-04-29 02:45:24'),
(5, 1, '1_1619686873.png', 'Abacus Training', 'success-gr', '2021-04-29 03:31:13', '2021-04-29 03:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `centreprofiles`
--

DROP TABLE IF EXISTS `centreprofiles`;
CREATE TABLE IF NOT EXISTS `centreprofiles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `centre_name` varchar(100) NOT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `addressline1` varchar(100) DEFAULT NULL,
  `addressline2` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `phone1` varchar(20) DEFAULT NULL,
  `phone2` varchar(20) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `office` varchar(200) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `services` varchar(200) DEFAULT NULL,
  `reg_no_prefix` varchar(10) NOT NULL DEFAULT 'AK',
  `addmission_fee` int(11) DEFAULT '100',
  `about` longtext,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `whatsapp` varchar(200) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `insta` varchar(200) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `centreprofiles`
--

INSERT INTO `centreprofiles` (`id`, `user_id`, `centre_name`, `caption`, `addressline1`, `addressline2`, `district`, `state`, `country`, `pincode`, `website`, `phone1`, `phone2`, `logo`, `office`, `latitude`, `longitude`, `services`, `reg_no_prefix`, `addmission_fee`, `about`, `status`, `created_at`, `updated_at`, `whatsapp`, `facebook`, `insta`, `linkedin`) VALUES
(1, 1, 'ARCHI KITES', 'COMPUTER EDUCATION', 'Grace Plaza Complex,  MM Road', 'Opp. Cheruthazham Service Bank, Pilathara', 'Kannur', 'Kerala', 'India', 670504, 'www.archikites.com', '+91 828 101 6662', '04972802790', NULL, 'Archi Kites, Pilathara, Kerala, India', '12.081542', '75.263687', NULL, 'AK', 100, NULL, 1, '2021-03-23 05:01:12', '2021-05-09 04:59:36', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
CREATE TABLE IF NOT EXISTS `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `register_num` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `uploaded` date DEFAULT NULL,
  `certificate` varchar(255) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `user_id`, `student_id`, `register_num`, `title`, `description`, `uploaded`, `certificate`, `type`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'AK04212', 'sample certificate', 'certificate description', '2021-05-15', '1_1621084192.pdf', NULL, '2021-05-15 07:39:52', '2021-05-15 07:39:52');

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
CREATE TABLE IF NOT EXISTS `certifications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certifications`
--

INSERT INTO `certifications` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Archikites Certification', NULL, '2021-04-29 02:36:02', '2021-04-29 02:36:02'),
(2, 1, 'STED Council Certification', NULL, '2021-04-29 02:36:16', '2021-04-29 02:36:16'),
(3, 1, 'JAIN Certification', NULL, '2021-04-29 02:36:24', '2021-04-29 02:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `link` varchar(255) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `classstudents`
--

DROP TABLE IF EXISTS `classstudents`;
CREATE TABLE IF NOT EXISTS `classstudents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class on student` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coursetags`
--

DROP TABLE IF EXISTS `coursetags`;
CREATE TABLE IF NOT EXISTS `coursetags` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

DROP TABLE IF EXISTS `enquiries`;
CREATE TABLE IF NOT EXISTS `enquiries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qualification` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsap` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_relation` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_specify` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_occupation` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `course_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `how_here_about` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `some_more` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `user_id`, `fullname`, `qualification`, `dob`, `gender`, `place`, `house`, `pincode`, `state`, `district`, `phone`, `whatsap`, `email`, `photo`, `g_name`, `g_relation`, `g_specify`, `g_occupation`, `g_phone`, `g_email`, `courseid`, `course_title`, `course_method`, `duration_type`, `how_here_about`, `some_more`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'hkjk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '46436346', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NEW', '2021-05-06 00:13:36', '2021-05-06 00:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `user_id`, `title`, `description`, `date`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(3, 1, 'exam', 'gfj', '2021-05-17', '01:11:00', '02:11:00', '2021-05-17 00:11:59', '2021-05-17 05:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `examstudents`
--

DROP TABLE IF EXISTS `examstudents`;
CREATE TABLE IF NOT EXISTS `examstudents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam on students` (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `examstudents`
--

INSERT INTO `examstudents` (`id`, `user_id`, `student_id`, `exam_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 3, '2021-05-17 00:12:05', '2021-05-17 00:12:05'),
(3, 1, 2, 3, '2021-05-17 00:12:05', '2021-05-17 00:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `faculiteis`
--

DROP TABLE IF EXISTS `faculiteis`;
CREATE TABLE IF NOT EXISTS `faculiteis` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `faculty_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `profession` varchar(150) DEFAULT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `profile` text,
  `resume` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faculty_id` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculiteis`
--

INSERT INTO `faculiteis` (`id`, `user_id`, `faculty_id`, `name`, `phone`, `whatsapp`, `profession`, `sex`, `address`, `profile`, `resume`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 'Bindhu P K', '9562917368', '8281016662', 'Teacher', 'female', 'Gokulam\r\nvengara, madayi\r\nkannur, kerala', NULL, NULL, '2021-04-29 04:00:15', '2021-04-29 04:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `facultybatches`
--

DROP TABLE IF EXISTS `facultybatches`;
CREATE TABLE IF NOT EXISTS `facultybatches` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty on batch` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facultybatches`
--

INSERT INTO `facultybatches` (`id`, `user_id`, `faculty_id`, `batch_id`, `created_at`, `updated_at`) VALUES
(13, 1, 1, 1, '2021-04-29 05:56:11', '2021-04-29 05:56:11'),
(15, 1, 1, 2, '2021-05-03 06:32:12', '2021-05-03 06:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `facultycourses`
--

DROP TABLE IF EXISTS `facultycourses`;
CREATE TABLE IF NOT EXISTS `facultycourses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course of faculty` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facultycourses`
--

INSERT INTO `facultycourses` (`id`, `user_id`, `faculty_id`, `course_id`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, '2021-05-05 01:31:24', '2021-05-05 01:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `facultystudents`
--

DROP TABLE IF EXISTS `facultystudents`;
CREATE TABLE IF NOT EXISTS `facultystudents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty on students` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facultystudents`
--

INSERT INTO `facultystudents` (`id`, `user_id`, `faculty_id`, `student_id`, `created_at`, `updated_at`) VALUES
(5, 1, 1, 1, '2021-04-30 05:07:54', '2021-04-30 05:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
CREATE TABLE IF NOT EXISTS `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `videolink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `videosource` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `module on lesson` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `user_id`, `course_id`, `module_id`, `order_id`, `title`, `description`, `status`, `content`, `type`, `duration`, `url`, `image1`, `image2`, `file`, `videolink`, `videosource`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 'lesson1', 'lesson 1 description goes here', 'active', 'lesson content here', 'Video', '02:08:00', NULL, '', NULL, '', 'YLI_qMxiLzg', 'youtube', '2021-05-11 05:18:18', '2021-05-11 05:18:18'),
(2, 1, 1, 1, 1, 'lesson 2', 'lesson 2 description', 'active', 'lesson 2 content', 'Video', '01:00:00', NULL, '', NULL, '', NULL, 'vimeo', '2021-05-11 05:19:07', '2021-05-11 05:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2021_02_22_000108_create_schemes_table', 1),
(3, '2021_02_23_060707_create_certifications_table', 2),
(4, '2021_02_26_094403_create_enquiries_table', 3),
(5, '2021_04_12_120315_create_lessons_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `user_id`, `course_id`, `order_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'sample modile 1', 'sample1 module description goes here....', 'active', '2021-05-11 05:17:29', '2021-05-11 05:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `titile` int(11) DEFAULT NULL,
  `description` int(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `package_course`
--

DROP TABLE IF EXISTS `package_course`;
CREATE TABLE IF NOT EXISTS `package_course` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `package_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schemes`
--

DROP TABLE IF EXISTS `schemes`;
CREATE TABLE IF NOT EXISTS `schemes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `scheme_title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schemes`
--

INSERT INTO `schemes` (`id`, `user_id`, `scheme_title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Anadham 2021 - online', 'Summer Vacation Course for school students (online only)', '2021-04-29 02:32:40', '2021-05-05 23:59:51'),
(2, 1, 'Anadham 2021 - offline', 'Summer vacation course for school students offline', '2021-04-29 02:34:44', '2021-04-29 02:34:44');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studentnotes`
--

DROP TABLE IF EXISTS `studentnotes`;
CREATE TABLE IF NOT EXISTS `studentnotes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `note` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `date` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentnotes`
--

INSERT INTO `studentnotes` (`id`, `user_id`, `student_id`, `note`, `type`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'sg', 'dropout', '06-05-2021', '2021-05-06 01:16:31', '2021-05-06 01:16:31'),
(2, 1, 1, 'dsaf', 'enroledagain', '06-05-2021', '2021-05-06 01:16:37', '2021-05-06 01:16:37');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `qualification` varchar(150) DEFAULT NULL,
  `reg_number` varchar(40) DEFAULT NULL,
  `custom_reg_num` varchar(50) DEFAULT NULL,
  `dob` varchar(40) DEFAULT NULL,
  `photo` text,
  `house_name` varchar(80) DEFAULT NULL,
  `place` varchar(80) DEFAULT NULL,
  `district` varchar(40) DEFAULT NULL,
  `pincode` varchar(30) DEFAULT NULL,
  `state` varchar(80) DEFAULT NULL,
  `phone` bigint(20) NOT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `g_name` varchar(80) DEFAULT NULL,
  `g_occup` varchar(80) DEFAULT NULL,
  `g_relation` varchar(60) DEFAULT NULL,
  `g_specify` varchar(40) DEFAULT NULL,
  `g_phon` bigint(20) DEFAULT NULL,
  `g_email` varchar(40) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `financial_year` varchar(30) DEFAULT NULL,
  `added` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  `last_update` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `dropout` varchar(20) DEFAULT NULL,
  `dropoutdate` varchar(40) DEFAULT NULL,
  `logkey` varchar(60) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reg_number` (`reg_number`),
  UNIQUE KEY `logkey` (`logkey`),
  KEY `batches for students` (`batch`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `batch`, `name`, `qualification`, `reg_number`, `custom_reg_num`, `dob`, `photo`, `house_name`, `place`, `district`, `pincode`, `state`, `phone`, `whatsapp`, `email`, `g_name`, `g_occup`, `g_relation`, `g_specify`, `g_phon`, `g_email`, `day`, `month`, `year`, `financial_year`, `added`, `updated`, `last_update`, `status`, `dropout`, `dropoutdate`, `logkey`, `password`, `refreshToken`, `passwordResetToken`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Atheena K', '3rd Standard studying', 'AK04212', NULL, '2011-01-26', NULL, 'Karanthad', 'AUP School Kunnaru', 'Kannur', NULL, 'Kerala', 9605014624, '9605014624', NULL, 'Chandralekha', 'Housewife', NULL, NULL, 9605014624, NULL, 4, 4, 2021, NULL, NULL, NULL, '29-04-21', 1, NULL, NULL, NULL, '$2y$10$GD7y74iCmHfKKOvck5mumuLIryBVX5GV2104HqyzvdMZKC3LnGXvW', NULL, NULL, '2021-04-29 03:17:45', '2021-05-06 01:16:37'),
(2, 1, 2, 'Ujjwal Krishna M P', NULL, 'AK04213', NULL, '2012-06-18', '', 'Mothanga House', 'vengara', 'Kannur', NULL, 'Kerala', 9847093634, '9847093634', NULL, 'Soumya', 'Housewife', 'Mother', 'S/o Mithunraj', 9847093634, NULL, 5, 4, 2021, NULL, NULL, NULL, '05-04-2021', 1, NULL, NULL, NULL, '$2y$10$vfL7hrZncAqy8IuSba1fieTCVU4JICYWj73m7wcphJ068LIQ0kGb.', NULL, NULL, '2021-04-29 04:10:07', '2021-04-29 04:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `student_bills`
--

DROP TABLE IF EXISTS `student_bills`;
CREATE TABLE IF NOT EXISTS `student_bills` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `student_course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `financial_year` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_bill_fk` (`course_id`),
  KEY `student_bill_fk` (`student_id`),
  KEY `student course id on student bills` (`student_course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_bills`
--

INSERT INTO `student_bills` (`id`, `user_id`, `student_id`, `course_id`, `student_course_id`, `total`, `day`, `month`, `year`, `financial_year`, `created_at`, `updated_at`) VALUES
(9, 1, 2, 1, 6, 2500, 6, 5, 2021, '2020-2021', '2021-05-06 01:35:48', '2021-05-06 01:35:48'),
(10, 1, 1, 1, 3, 2500, 17, 5, 2021, '2020-2021', '2021-05-17 03:29:17', '2021-05-17 03:29:17'),
(11, 1, 1, 1, 3, 2500, 17, 5, 2021, '2020-2021', '2021-05-17 03:30:23', '2021-05-17 03:30:23'),
(12, 1, 1, 1, 3, 2500, 17, 5, 2021, '2020-2021', '2021-05-17 04:31:23', '2021-05-17 04:31:23'),
(13, 1, 1, 1, 3, 2500, 17, 5, 2021, '2020-2021', '2021-05-17 04:32:35', '2021-05-17 04:32:35'),
(14, 1, 1, 1, 3, 2500, 17, 5, 2021, '2020-2021', '2021-05-17 04:39:06', '2021-05-17 04:39:06'),
(15, 1, 2, 1, 6, 2500, 17, 5, 2021, '2020-2021', '2021-05-17 05:14:55', '2021-05-17 05:14:55'),
(16, 1, 2, 1, 6, 2500, 17, 5, 2021, '2020-2021', '2021-05-17 05:16:09', '2021-05-17 05:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
CREATE TABLE IF NOT EXISTS `student_courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `certification` bigint(20) UNSIGNED DEFAULT NULL,
  `scheme` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `fee` int(11) NOT NULL,
  `track` varchar(30) DEFAULT NULL,
  `course_type` varchar(30) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_student_course` (`student_id`),
  KEY `course_student_course_fk` (`course_id`),
  KEY `certification on student course` (`certification`),
  KEY `scheme on student course` (`scheme`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`id`, `user_id`, `course_id`, `student_id`, `certification`, `scheme`, `title`, `fee`, `track`, `course_type`, `type`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-06 00:36:39', '2021-05-06 00:36:39'),
(6, 1, 1, 2, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-06 01:35:42', '2021-05-06 01:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `student_payments`
--

DROP TABLE IF EXISTS `student_payments`;
CREATE TABLE IF NOT EXISTS `student_payments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(5) NOT NULL,
  `discount_rs` int(11) NOT NULL,
  `discount_per` int(11) NOT NULL,
  `dis_per_in_amount` int(11) NOT NULL,
  `payment_amount` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `financial_year` varchar(30) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_student_payments_fk` (`course_id`),
  KEY `student_id_student_payment` (`student_id`),
  KEY `bill_id_student_payments` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_payments`
--

INSERT INTO `student_payments` (`id`, `user_id`, `course_id`, `student_id`, `bill_id`, `type`, `discount_rs`, `discount_per`, `dis_per_in_amount`, `payment_amount`, `day`, `month`, `year`, `financial_year`, `filename`, `created_at`, `updated_at`) VALUES
(15, 1, 1, 2, 15, 'DP', 0, 0, 0, 1000, 17, 5, 2021, '2020-2021', '1_1621248296_Payment_Ujjwal Krishna M P_AK04213.pdf', '2021-05-17 05:14:55', '2021-05-17 10:44:56'),
(16, 1, 1, 2, 16, 'FP', 0, 0, 0, 100, 17, 5, 2021, '2020-2021', '1_1621248370_Payment_AK04213.pdf', '2021-05-17 05:16:09', '2021-05-17 10:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tagname` varchar(60) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `user_id`, `tagname`, `created_at`, `updated_at`) VALUES
(1, 1, 'Design', '2021-05-03 06:59:30', '2021-05-03 06:59:30'),
(2, 1, 'Web', '2021-05-03 06:59:38', '2021-05-03 06:59:38'),
(3, 1, 'Photoshop', '2021-05-03 06:59:50', '2021-05-03 06:59:50'),
(4, 1, 'Angular', '2021-05-03 07:00:02', '2021-05-03 07:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `role`, `phone`, `whatsapp`, `facebook`, `linkedin`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pranav', 'Software Developer', '9633895528', '9633895528', NULL, NULL, '1_1620215249.jpg', '2021-05-05 06:17:29', '2021-05-05 06:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refreshToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordResetToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `refreshToken`, `passwordResetToken`, `created_at`, `updated_at`) VALUES
(1, 'archikites', 'archikites@gmail.com', NULL, '$2y$10$kXpByEjNjrVB4yTS4G28Nu7agfpEQfNLGZPB2NwF0S04G8m.A39IO', 'admin', NULL, NULL, NULL, '2021-02-19 20:45:13', '2021-02-19 20:45:13'),
(2, 'Pranav', 'vvpranav04@gmail.com', NULL, '$2y$10$NtthR1wOm4J/lY9tJyNX3.gfqVhDEA3OohGHKo0r.WaH.v9JFb7Ay', 'admin', NULL, NULL, NULL, '2021-02-19 22:42:54', '2021-02-19 22:42:54'),
(15, 'Bindhu P K', 'venusbindh@gmail.com', NULL, '$2y$10$NtthR1wOm4J/lY9tJyNX3.gfqVhDEA3OohGHKo0r.WaH.v9JFb7Ay', 'user', NULL, NULL, NULL, '2021-04-29 04:00:15', '2021-04-29 04:00:15');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_courses`
--
ALTER TABLE `all_courses`
  ADD CONSTRAINT `category_fk` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `certification on course` FOREIGN KEY (`certification`) REFERENCES `certifications` (`id`),
  ADD CONSTRAINT `scheme on course` FOREIGN KEY (`scheme`) REFERENCES `schemes` (`id`),
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `classstudents`
--
ALTER TABLE `classstudents`
  ADD CONSTRAINT `class on student` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `coursetags`
--
ALTER TABLE `coursetags`
  ADD CONSTRAINT `tag_fk` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `examstudents`
--
ALTER TABLE `examstudents`
  ADD CONSTRAINT `exam on students` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`);

--
-- Constraints for table `facultybatches`
--
ALTER TABLE `facultybatches`
  ADD CONSTRAINT `faculty on batch` FOREIGN KEY (`faculty_id`) REFERENCES `faculiteis` (`id`);

--
-- Constraints for table `facultycourses`
--
ALTER TABLE `facultycourses`
  ADD CONSTRAINT `course of faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculiteis` (`id`);

--
-- Constraints for table `facultystudents`
--
ALTER TABLE `facultystudents`
  ADD CONSTRAINT `faculty on students` FOREIGN KEY (`faculty_id`) REFERENCES `faculiteis` (`id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `course_lesson_fk` FOREIGN KEY (`course_id`) REFERENCES `all_courses` (`id`),
  ADD CONSTRAINT `module on lesson` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `batches for students` FOREIGN KEY (`batch`) REFERENCES `batches` (`id`);

--
-- Constraints for table `student_bills`
--
ALTER TABLE `student_bills`
  ADD CONSTRAINT `course_bill_fk` FOREIGN KEY (`course_id`) REFERENCES `all_courses` (`id`),
  ADD CONSTRAINT `student course id on student bills` FOREIGN KEY (`student_course_id`) REFERENCES `student_courses` (`id`),
  ADD CONSTRAINT `student_bill_fk` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `certification on student course` FOREIGN KEY (`certification`) REFERENCES `certifications` (`id`),
  ADD CONSTRAINT `course_student_course_fk` FOREIGN KEY (`course_id`) REFERENCES `all_courses` (`id`),
  ADD CONSTRAINT `scheme on student course` FOREIGN KEY (`scheme`) REFERENCES `schemes` (`id`),
  ADD CONSTRAINT `student_student_course` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_payments`
--
ALTER TABLE `student_payments`
  ADD CONSTRAINT `bill_id_student_payments` FOREIGN KEY (`bill_id`) REFERENCES `student_bills` (`id`),
  ADD CONSTRAINT `course_student_payments_fk` FOREIGN KEY (`course_id`) REFERENCES `all_courses` (`id`),
  ADD CONSTRAINT `student_id_student_payment` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
