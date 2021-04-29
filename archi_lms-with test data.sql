-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 29, 2021 at 09:53 AM
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
  `desc_mal` longtext CHARACTER SET latin1,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_courses`
--

INSERT INTO `all_courses` (`id`, `user_id`, `cat_id`, `scheme`, `certification`, `curiculam`, `title`, `desc_mal`, `desc_eng`, `course_info`, `course_type`, `istopten`, `ispopular`, `videolink`, `img_name`, `img_contrast`, `tags`, `offline_fee`, `online_fee`, `tax`, `n_duration`, `n_type`, `f_duration`, `type`, `f_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, 1, '', 'Abacus Training', NULL, 'We use the Abacus tool and concept at our Archikites Abacus Academy, to help children learn the technique.\r\nThe importance of brain development is vital to optimise the growth of the human brain and its function. Through studies in developmental neurobiology, it is proven that experiences in early life affects different stages of development and aiding a child’s learning, helps provide the brain with a promising beginning.', 'Brain Development, Confidence Building, Improved calculation skills, Mastering Arithmetic, Having fun with maths, memory techniques Exercise', 'online', 1, 1, 'https://youtu.be/R6DfLXP1yjQ', '1_1619687808.jpg', 3, NULL, 2500, 2500, 'NO', 6, 'month', 25, 'C', 'day', 'ACT', '2021-04-29 03:46:48', '2021-04-29 03:53:35');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attandances`
--

INSERT INTO `attandances` (`id`, `user_id`, `student_id`, `batch_id`, `type`, `date`, `intime`, `outtime`, `duration`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'Morning', '2021-04-29', '10:00:00', '11:00:00', '01:00:00', '2021-04-29 04:03:37', '2021-04-29 04:03:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Abacus May First 2021', 'Anadham 2021 online Batch', '2021-04-29 02:35:39', '2021-04-29 02:35:39'),
(2, 1, 'Abacus April First 2021', 'summer vacation course', '2021-04-29 03:13:45', '2021-04-29 03:13:45');

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

INSERT INTO `centreprofiles` (`id`, `user_id`, `centre_name`, `caption`, `addressline1`, `addressline2`, `district`, `state`, `country`, `pincode`, `website`, `phone1`, `phone2`, `logo`, `office`, `services`, `reg_no_prefix`, `addmission_fee`, `about`, `status`, `created_at`, `updated_at`, `whatsapp`, `facebook`, `insta`, `linkedin`) VALUES
(1, 1, 'ARCHI KITES', 'COMPUTER EDUCATION', 'Mythri Building, Opp Bustand', 'NH Pilathara', 'Kannur', 'Kerala', 'India', 670504, 'www.archikites.com', '+91 828 101 6662', '04972802790', NULL, 'Archi Kites, Pilathara, Kerala, India', NULL, 'AK', 100, NULL, 1, '2021-03-23 05:01:12', '2021-04-29 03:52:59', NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
CREATE TABLE IF NOT EXISTS `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 'Anadham 2021 - online', 'Summer Vacation Course for school students (online only)', '2021-04-29 02:32:40', '2021-04-29 02:32:40'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 1, 2, 'Atheena K', '3rd Standard studying', 'AK04212', NULL, '2011-01-26', '', 'Karanthad', 'AUP School Kunnaru', 'Kannur', NULL, 'Kerala', 9605014624, '9605014624', NULL, 'Chandralekha', 'Housewife', 'Mother', NULL, 9605014624, NULL, 4, 4, 2021, NULL, NULL, NULL, '04-04-2021', 1, NULL, NULL, NULL, '$2y$10$GD7y74iCmHfKKOvck5mumuLIryBVX5GV2104HqyzvdMZKC3LnGXvW', NULL, NULL, '2021-04-29 03:17:45', '2021-04-29 03:17:45'),
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
  `total` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `financial_year` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_bill_fk` (`course_id`),
  KEY `student_bill_fk` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_bills`
--

INSERT INTO `student_bills` (`id`, `user_id`, `student_id`, `course_id`, `total`, `day`, `month`, `year`, `financial_year`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2600, 29, 4, 2021, '2020-2021', '2021-04-29 03:48:38', '2021-04-29 03:48:38'),
(2, 1, 2, 1, 2500, 29, 4, 2021, '2020-2021', '2021-04-29 04:12:11', '2021-04-29 04:12:11'),
(3, 1, 2, 1, 2500, 29, 4, 2021, '2020-2021', '2021-04-29 04:12:33', '2021-04-29 04:12:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`id`, `user_id`, `course_id`, `student_id`, `certification`, `scheme`, `title`, `fee`, `track`, `course_type`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 'Abacus Training', 2600, NULL, 'online', 'C', '1', '2021-04-29 03:47:17', '2021-04-29 03:47:17'),
(2, 1, 1, 2, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-04-29 04:10:14', '2021-04-29 04:10:14');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_student_payments_fk` (`course_id`),
  KEY `student_id_student_payment` (`student_id`),
  KEY `bill_id_student_payments` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_payments`
--

INSERT INTO `student_payments` (`id`, `user_id`, `course_id`, `student_id`, `bill_id`, `type`, `discount_rs`, `discount_per`, `dis_per_in_amount`, `payment_amount`, `day`, `month`, `year`, `financial_year`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 'DP', 150, 0, 0, 1000, 29, 4, 2021, '2020-2021', '2021-04-29 03:48:38', '2021-04-29 03:48:38'),
(2, 1, 1, 2, 2, 'DP', 50, 0, 0, 1250, 29, 4, 2021, '2020-2021', '2021-04-29 04:12:11', '2021-04-29 04:12:11'),
(3, 1, 1, 2, 3, 'FP', 50, 0, 0, 1250, 29, 4, 2021, '2020-2021', '2021-04-29 04:12:33', '2021-04-29 04:12:33');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(8, 'pranav', 'pranav@gmail.com', NULL, '$2y$10$a52BGa93OIhDhVolIPJqauQBJGkUETLxPThouOpY6We3YRdvo59tS', 'user', NULL, NULL, NULL, '2021-04-09 04:38:04', '2021-04-09 04:38:04'),
(15, 'Bindhu P K', 'venusbindh@gmail.com', NULL, '$2y$10$WqCQetyDAnujRppLT02.6e/b2459xaRRD5HLnhRX.1mAxJ0m1wQR2', 'user', NULL, NULL, NULL, '2021-04-29 04:00:15', '2021-04-29 04:00:15');

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
-- Constraints for table `coursetags`
--
ALTER TABLE `coursetags`
  ADD CONSTRAINT `tag_fk` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `facultybatches`
--
ALTER TABLE `facultybatches`
  ADD CONSTRAINT `faculty on batch` FOREIGN KEY (`faculty_id`) REFERENCES `faculiteis` (`id`);

--
-- Constraints for table `facultystudents`
--
ALTER TABLE `facultystudents`
  ADD CONSTRAINT `faculty on students` FOREIGN KEY (`faculty_id`) REFERENCES `faculiteis` (`id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `course_lesson_fk` FOREIGN KEY (`course_id`) REFERENCES `all_courses` (`id`);

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
