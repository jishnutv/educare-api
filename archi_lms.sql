-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 30, 2021 at 11:42 AM
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
-- Database: `lms_test`
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_courses`
--

INSERT INTO `all_courses` (`id`, `user_id`, `cat_id`, `scheme`, `certification`, `curiculam`, `title`, `desc_mal`, `desc_eng`, `course_info`, `course_type`, `istopten`, `ispopular`, `videolink`, `img_name`, `img_contrast`, `tags`, `offline_fee`, `online_fee`, `tax`, `n_duration`, `n_type`, `f_duration`, `type`, `f_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, 1, '', 'Abacus Training', '5 വയസ്സുമുതല്‍ കുട്ടികള്‍ക്ക് അബാക്കസ്സ് പഠനം നല്‍കുന്നതിലൂടെ പഠനത്തില്‍ മികച്ച വിജയം നേടുവാന്‍ സാധിക്കുന്നു. കുട്ടികളിലെ ഏകാഗ്രത, ശ്രദ്ധ, ഓര്‍മ്മശക്തി എന്നിവ വര്‍ദ്ധിപ്പിക്കാനും, ഗണിതശാസ്ത്രത്തെ രസകരമായി വിദ്യാര്‍ത്ഥികളില്‍ എത്തിക്കുവാനും തന്‍മൂലം പഠനം ലളിതവും വിനോദകരവും ആക്കാന്‍ കുട്ടികളെ അബാക്കസ്സ് പഠനത്തിലൂടെ സഹായിക്കുന്നു', 'We use the Abacus tool and concept at our Archikites Abacus Academy, to help children learn the technique.\r\nThe importance of brain development is vital to optimise the growth of the human brain and its function. Through studies in developmental neurobiology, it is proven that experiences in early life affects different stages of development and aiding a child’s learning, helps provide the brain with a promising beginning.', 'Brain Development, Confidence Building, Improved calculation skills, Mastering Arithmetic, Having fun with maths, memory techniques Exercise', 'online', 1, 1, 'https://youtu.be/R6DfLXP1yjQ', '1_1621760003.jpg', 3, 'abacus,anadham,anadham2021', 2500, 2500, 'NO', 6, 'month', 25, 'C', 'day', 'ACT', '2021-04-29 03:46:48', '2021-05-23 08:53:23'),
(3, 1, 2, 3, 1, '', 'DIPLOMA IN FINANCIAL ACCOUNTING', NULL, 'Higher course on accounting.  For advanced understanding of accounting practice.  This makes a student an expert in accounting since the course is job oriented.\r\nTally, Peachtree, QuickBooks', 'apply the accounting concepts, summarise the meaning and evolution of financial management, prepare financial statement, prepare the profit and loss accounts, create balance sheet, prepare cash flow statement, indian accounting standards, prepare bank reconciliation statement', 'both', 0, 1, NULL, '', 3, NULL, 14000, 14000, 'NO', 7, 'month', 3, 'P', 'month', 'ACT', '2021-05-18 12:57:03', '2021-05-19 17:25:33'),
(4, 1, 1, 3, 1, '', 'Diploma in Graphic Designing', 'ഫൈൻ ആർട്സ്, ഡിസൈനിങ് എന്നിവയുടെ പ്രാഥമിക പാഠങ്ങൾ പഠിച്ചു കൊണ്ട് മികച്ച ഒരു ഗ്രാഫിക് ഡിസൈനർ ആവാൻ നിങ്ങളെ സഹായിക്കുന്നതാണ് ആർച്ചി കൈറ്റ്സ് ഗ്രാഫിക് ഡിസൈനിങ് കോഴ്സ്. സർഗാത്മകമായ നിങ്ങളുടെ മനസ്സിലെ ആശയങ്ങളെ ഡിസൈനുകൾ ആക്കി മാറ്റാൻ ആവശ്യമായ എല്ലാ സോഫ്റ്റ്വെയർ ടൂളുകളും ഇതിൽ പരിശീലിപ്പിക്കുന്നു .', 'Archikites graphic designing exceptional because it also focuses on principles of fine arts and designing. So for a graphic designer learned from our institute computer and software is a tool to materials their designing ideas in mind.\r\n\r\nAdobe Suite Study\r\nAdobe photoshop\r\nCorel draw\r\nDreamweaver \r\nAdobe illustrator\r\nAdobe InDesign', 'Graphic Designer, Desktop Publisher, Graphic Artist, Layout Designer, Freelance Work', 'both', 1, 1, 'HPRExILrnU', '1_1621762538.jpg', 7, NULL, 16000, 15000, 'NO', 6, 'month', 3, 'P', 'month', 'ACT', '2021-05-19 17:55:19', '2021-05-23 09:37:49'),
(5, 1, 2, 3, 2, '', 'MANUAL ACCOUNTING AND TALLY', 'മാനുവൽ അക്കൗണ്ടിംഗ് ബാലപാഠങ്ങൾ പഠിപ്പിച്ചു കൊണ്ട് അക്കൗണ്ടിൽ നിങ്ങളെ ഒരു വിദഗ്ധൻ ആക്കാൻ ലക്ഷ്യമാക്കിക്കൊണ്ട് ആരംഭിച്ചതാണ് അക്കൗണ്ടിംഗ് ആൻഡ് ടാലി കോഴ്സ്.  ലൈവ് അക്കൗണ്ടിംഗ് ഉള്ള പ്രാക്ടിക്കൽ ട്രെയിനിങ് ആണ് ഇതിൻ്റെ  പ്രത്യേകത.', 'Archikites Education Hub focuses on an accountants ability to handle all accounting problems by skilling them in manual accounting also.  Practice on live accounts is a specialty of this course.', 'Have an understanding of basic Accounting concepts and principals, Be able to generate Accounting and Inventory Masters, Vouchers and Basic report in Tally, Have an understanding of the concept of features of payroll Accounting etc.', 'both', 1, 0, '5Le4A4mlcoQ', '1_1621757878.jpg', 5, 'Accounting,Tally', 10500, 10000, 'NO', 120, 'hour', 20, 'C', 'day', 'ACT', '2021-05-23 07:50:57', '2021-05-23 09:02:31'),
(6, 1, 7, 3, 2, '', 'Office Automation', 'ഓഫീസ് ഓട്ടോമേഷൻ:\r\nനിങ്ങളെ ഒരു നല്ല ഓഫീസ് അസിസ്റ്റൻറ് ആയി വളർത്തി എടുക്കാൻ സഹായിക്കുന്ന കോഴ്സ് ആണിത്. ഒരു തവണ രജിസ്റ്റർ ചെയ്യുന്നതോടുകൂടി എല്ലാകാലത്തേക്കും പഠിച്ച കാര്യങ്ങൾ  അപ്ഡേറ്റ് ചെയ്യാനുള്ള അവസരം ലഭിക്കുന്നു. സംശയ നിവാരണത്തിനും ഇന്ന് ജോലിസംബന്ധമായ പ്രതിസന്ധികൾ എങ്ങനെ നേരിടാം എന്നതിനെക്കുറിച്ചും സഹായം ലഭിക്കുന്നു.', 'Office Automation:\r\nThis course modules an office assistant. Assignments are done as a part of the course.  Unlimited updating of the knowledge for the student who register once.  Sessions for doubt clearing are the uniqueness of this course.', 'Computer Fundamentals,  Operating system like windows/linux, Microsoft Word, Microsoft Excel, MS powerpoint, Internet Banking services, Interview Tips, Projects etc', 'both', 1, 0, NULL, '1_1621927450.jpg', 7, NULL, 4500, 4000, 'NO', 80, 'hour', 10, 'P', 'day', 'ACT', '2021-05-25 07:24:10', '2021-05-25 07:24:10'),
(7, 1, 7, 3, 1, '', 'Eata Entry Operator', 'ഡാറ്റാ എൻട്രിയിൽ ഒരു നല്ല ജോലി ലഭിക്കാൻ ഈ കോഴ്സിൽ ചേരുക. ഡാറ്റാ എൻട്രിയുടെ എല്ലാവശങ്ങളും കമ്പ്യൂട്ടർ ഓപ്പറേഷനും ഇതിൽ ഉൾക്കൊള്ളിച്ചിരിക്കുന്നു .വീട്ടിലിരുന്ന് തന്നെ ജോലി ചെയ്യാൻ ആവശ്യമായ പരിശീലനം ലഭിക്കുന്നു.', 'Join this course to make Data Entry as your career.  All aspects of data entry and computer operations are covered in this course.  You can become a freelance data entry operator at home or office.', 'Job Role: Data entry work, Front office assistant,', 'both', 0, 0, NULL, '1_1621929885.jpg', 3, NULL, 4000, 3500, 'NO', 60, 'hour', 10, 'P', 'day', 'ACT', '2021-05-25 08:04:45', '2021-05-25 08:04:45'),
(8, 1, 7, 3, 2, '', 'DCA - Diploma in Computer Applications', 'കമ്പ്യൂട്ടർ മേഖലയിൽ ഉന്നത വിദ്യാഭ്യാസത്തിനുള്ള അടിസ്ഥാനയോഗ്യതയാണിത് . കമ്പ്യൂട്ടർ സാങ്കേതിക വിദ്യയുടെ എല്ലാ അടിസ്ഥാന പാഠങ്ങളും മനസ്സിലാക്കാൻ ഈ കോഴ്സ് ഉത്തമമാണ് മറ്റു സ്ഥാപനങ്ങളിൽ നിന്ന് വ്യത്യസ്തമായി  ഭാവിയെ മുന്നിൽ കണ്ടുകൊണ്ട് രൂപകൽപ്പന ചെയ്തതാണ് ആർച്ചി കൈറ്റ്സ് കമ്പ്യൂട്ടർ ഡിപ്ലോമ കോഴ്സ്.', 'DCA:  This is a basic qualification course for any higher computer application course.  All fundamentals of computer technology are discussed and made thorough in this course.  Archikites DCA is special and unique of all other institutes.', 'Computer fundamentals, word processing, spreadsheet management skill, programming language in C, Java Programming, Seminar etc.', 'both', 1, 0, NULL, '1_1621931705.jpg', 3, NULL, 12000, 11500, 'NO', 400, 'hour', 4, 'P', 'month', 'ACT', '2021-05-25 08:35:05', '2021-05-25 08:35:05'),
(9, 1, 8, 3, 2, '', 'DIPLOMA IN AUTOCAD AND 3ds MAX', 'Autocad\r\nസിവിൽ, മെക്കാനിക്കൽ, ഇലക്ട്രിക്കൽ, ഡ്രാഫ്റ്റ്മാൻ ജോലി അന്വേഷിക്കുന്ന ഏതൊരു വിദ്യാർഥിക്കും ചേരാവുന്ന ഏറ്റവും പ്രയോജനപ്രദമായ കോഴ്സ് ആണ് ഓട്ടോകാഡ്. ആർച്ചി കൈറ്റ്സ് ലെ  വിദഗ്ധരായ പരിശീലകർ നിങ്ങൾ ഈ ജോലിയിൽ തിളങ്ങാൻ സഹായിക്കുന്നു.\r\n\r\n3DMAX\r\nആർച്ചി കൈറ്റ്സ് ലെ മറ്റൊരു  തൊഴിലധിഷ്ഠിത കോഴ്സ് . ഇൻറീരിയർ, എക്സ്റ്റീരിയർ ഡിസൈനിംഗ്, ത്രീഡി മോഡലിംഗ്. ഇമേജിങ് എന്നിവ വിശദമായി പരിശീലിപ്പിക്കുകയും  അത് സംബന്ധമായ ജോലിക്ക് വിദ്യാർത്ഥികളെ പ്രാപ്തരാക്കുകയും ചെയ്യുന്നു.\r\n\r\n3D and AutoCAD\r\nമെക്കാനിക്കൽ ഡ്രോയിങ്ൻ്റെയും,  ത്രീഡി മോഡലിംഗ്. ഡിസൈൻ, ഇവയുടെയും ബാലപാഠങ്ങൾ അറിയാവുന്നവർക്ക് ചേരാവുന്ന കോഴ്സാണ് ഇത്.  ത്രീഡി മോഡലിംഗ്. ഡിസൈൻ ,ഓട്ടോകാഡ് എന്നീ സോഫ്റ്റ്വെയറുകളുടെ ആഴത്തിലുള്ള പഠനം ആണ് ഇതുവഴി ലക്ഷ്യമാക്കുന്നത്.', 'Autocad:  A students who wants to become a civil or mechanical or electrical draughtsman can join this course.  Our faculties are expert enough to make your skills sharp and specific for the job.\r\n\r\n3DMAX: Another job oriented course from Archikites. This course gives more awareness on 3D designing and applied aspects of any type of modeling and designing including interior and exterior designing.\r\n\r\n3D and AutoCAD:  If you know the basics of mechanical drawing and 3D designing this is an advanced course for you for applying higher post in any company as 3D and AutoCAD designer', 'Interior Designer, Interior Architect, 3D Visualizer', 'both', 0, 0, 'https://www.youtube.com/watch?v=-HPRExILrnU', '1_1622289244.jpg', 3, NULL, 16000, 15500, 'NO', 4, 'month', 2, 'P', 'month', 'ACT', '2021-05-29 11:31:57', '2021-05-29 12:10:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attandances`
--

INSERT INTO `attandances` (`id`, `user_id`, `student_id`, `batch_id`, `type`, `date`, `intime`, `outtime`, `duration`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'Morning', '2021-04-29', '10:00:00', '11:00:00', '01:00:00', '2021-04-29 04:03:37', '2021-04-29 04:03:37'),
(2, 15, 1, 2, 'Evening', '2021-05-03', '20:53:00', '21:55:00', '01:02:00', '2021-05-03 06:51:11', '2021-05-03 06:51:11'),
(3, 15, 2, 2, 'Evening', '2021-05-03', '20:53:00', '21:55:00', '01:02:00', '2021-05-03 06:51:11', '2021-05-03 06:51:11'),
(4, 15, 1, 2, 'Morning', '2021-05-03', '09:00:00', '10:10:00', '01:10:00', '2021-05-03 06:52:35', '2021-05-03 06:52:35'),
(5, 15, 2, 2, 'Morning', '2021-05-03', '09:00:00', '10:10:00', '01:10:00', '2021-05-03 06:52:36', '2021-05-03 06:52:36'),
(6, 1, 2, 2, 'Morning', '2021-05-11', '23:21:00', '21:01:00', '02:20:00', '2021-05-18 15:49:43', '2021-05-18 15:49:43'),
(7, 1, 1, 2, 'Fullday', '2021-05-23', '20:12:00', '21:00:00', '00:48:00', '2021-05-23 09:42:20', '2021-05-23 09:42:20'),
(8, 1, 2, 2, 'Fullday', '2021-05-23', '20:12:00', '21:00:00', '00:48:00', '2021-05-23 09:42:20', '2021-05-23 09:42:20');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Abacus May First 2021', 'Anadham 2021 online Batch', '2021-04-29 02:35:39', '2021-04-29 02:35:39'),
(2, 1, 'Abacus April First 2021', 'summer vacation course', '2021-04-29 03:13:45', '2021-04-29 03:13:45'),
(4, 1, 'regular batch 21-22', 'archikites education hub 2021-2022 regular batch', '2021-05-18 12:00:48', '2021-05-18 12:00:48');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `icon`, `title`, `color`, `created_at`, `updated_at`) VALUES
(1, 1, '1_1619683851.png', 'Graphic Design', 'success-gr', '2021-04-29 02:40:51', '2021-04-29 02:40:51'),
(2, 1, '1_1619683917.png', 'Accounting', 'danger-gr', '2021-04-29 02:41:57', '2021-04-29 02:41:57'),
(3, 1, '1_1619684103.png', 'Web Development', 'primary-gr', '2021-04-29 02:45:03', '2021-04-29 02:45:03'),
(4, 1, '1_1619684124.png', 'Digital Marketing', 'secondary-gr', '2021-04-29 02:45:24', '2021-04-29 02:45:24'),
(5, 1, '1_1619686873.png', 'Abacus Training', 'success-gr', '2021-04-29 03:31:13', '2021-04-29 03:31:13'),
(6, 1, '1_1621925125.png', 'Language Training', 'green-gr', '2021-05-25 06:45:25', '2021-05-25 06:47:18'),
(7, 1, '1_1621926392.png', 'Computerbasics Programme', 'danger-gr', '2021-05-25 07:06:32', '2021-05-25 07:08:04'),
(8, 1, '1_1622286762.png', 'Engineering Courses', 'purple-gr', '2021-05-29 11:12:42', '2021-05-29 11:12:42');

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
(1, 1, 'Archikites', 'Education Hub', 'Grace Plaza Complex,  MM Road', 'Opp. Service Bank, Pilathara', 'Kannur', 'Kerala', 'India', 670504, 'www.archikites.com', '+91 828 101 6662', '04972802790', NULL, 'Archi Kites, Graze plaza complex, MM Road Pilathara, Kerala, India', '12.081542', '75.263687', NULL, 'AK', 100, 'Education is not only an activity of learning but a process which leads to a prosperous living.   Archi Kites aims at making you skillful and efficient in your occupation and to lead a successful career life.  We support our students by providing expert knowledge and on-the-job training by our skilled faculties and the state-of- art software development and software training facilities.  You can be an asset of any organization where you work, through the systematic and effective training Archi Kites.   Students of Archi Kites who are now working in and abroad India substantiate our promise given.  Hearty welcome to the new learning experience at Archi  kites.', 1, '2021-03-23 05:01:12', '2021-05-29 11:55:49', NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certifications`
--

INSERT INTO `certifications` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Archikites Certification', NULL, '2021-04-29 02:36:02', '2021-04-29 02:36:02'),
(2, 1, 'STED Council Certification', NULL, '2021-04-29 02:36:16', '2021-04-29 02:36:16'),
(3, 1, 'JAIN Certification', NULL, '2021-04-29 02:36:24', '2021-04-29 02:36:24'),
(4, 1, 'AKTIWA CERTIFICATION', NULL, '2021-05-18 12:01:47', '2021-05-18 12:01:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `user_id`, `title`, `description`, `link`, `platform`, `type`, `starttime`, `endtime`, `date`, `created_at`, `updated_at`) VALUES
(2, 1, 'abacus 1st level training', 'Archikites Abacus Training saturday 10:30AM\r\nMay 1, 2021, 10:30am – December 31, 2021, 5:00pm · \r\nGoogle Meet joining info', 'https://meet.google.com/wyf-dbnw-aqo', 'googlemeet', 'online', '10:30:00', '05:00:00', '2021-05-22', '2021-05-18 14:01:47', '2021-05-18 14:01:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classstudents`
--

INSERT INTO `classstudents` (`id`, `user_id`, `class_id`, `student_id`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 1, '2021-05-18 14:02:09', '2021-05-18 14:02:09'),
(4, 1, 2, 2, '2021-05-18 14:02:09', '2021-05-18 14:02:09'),
(5, 1, 2, 3, '2021-05-18 14:02:09', '2021-05-18 14:02:09'),
(6, 1, 2, 2, '2021-05-18 14:02:36', '2021-05-18 14:02:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `user_id`, `fullname`, `qualification`, `dob`, `gender`, `place`, `house`, `pincode`, `state`, `district`, `phone`, `whatsap`, `email`, `photo`, `g_name`, `g_relation`, `g_specify`, `g_occupation`, `g_phone`, `g_email`, `courseid`, `course_title`, `course_method`, `duration_type`, `how_here_about`, `some_more`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'shanil kp', 'SSLC', '2021-05-18', NULL, NULL, NULL, NULL, NULL, NULL, '09946041479', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NEW', '2021-05-18 11:09:19', '2021-05-18 11:09:19'),
(9, 1, 'shanil kp', 'sslc', '1986-06-01T15:22:22.207+05:30', 'male', 'cheruthazham ', NULL, NULL, NULL, NULL, '9946041479', NULL, 'shanilkp@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'DIPLOMA IN FINANCIAL ACCOUNTING', NULL, NULL, NULL, 'send details of accounting ', NULL, NULL, NULL),
(10, 1, 'shanil', NULL, '1988-06-01', NULL, NULL, NULL, NULL, NULL, NULL, '9946041479', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NEW', '2021-05-21 12:33:10', '2021-05-21 12:33:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `user_id`, `title`, `description`, `date`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(3, 1, 'Test exam', 'abacus 1st level exam', '2021-05-30', '10:00:00', '11:00:00', '2021-05-17 00:11:59', '2021-05-25 08:12:52'),
(4, 1, 'spoken english', 'spoken english Conduct Viva test', '2021-06-05', '10:00:00', '12:00:00', '2021-05-25 08:15:03', '2021-05-25 08:15:03');

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
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faculty_id` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculiteis`
--

INSERT INTO `faculiteis` (`id`, `user_id`, `faculty_id`, `name`, `phone`, `whatsapp`, `profession`, `sex`, `address`, `profile`, `resume`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 'Bindhu P K', '9562917368', '8281016662', 'Teacher', 'female', 'Gokulam\r\nvengara, madayi\r\nkannur, kerala', NULL, NULL, 'active', '2021-04-29 04:00:15', '2021-04-29 04:00:15'),
(2, 1, 16, 'shanil kp', '+919946041479', '9946041479', 'Employed', 'male', 'ushas\r\ncheruthazham\r\nmandoor\r\nkannur\r\nkerala', NULL, NULL, 'active', '2021-05-18 15:40:36', '2021-05-18 15:40:36'),
(3, 1, 17, 'SWETHA P K', '9946041479', NULL, 'Employed', 'male', 'ushas\r\ncheruthazham\r\nmandoor\r\nkannur\r\nkerala', NULL, NULL, 'active', '2021-05-18 15:46:03', '2021-05-18 15:46:03'),
(4, 1, 18, 'rajanpilla', '+919946041479', NULL, 'RetiredTeacher', 'male', 'ushas\r\ncheruthazham\r\nmandoor\r\nkannur\r\nkerala', NULL, NULL, 'active', '2021-05-18 15:46:50', '2021-05-18 15:46:50'),
(5, 1, 19, 'rajesh', '45544555', NULL, 'Teacher', 'male', 'kunjimangalam', 'new', NULL, 'active', '2021-05-18 15:48:42', '2021-05-18 15:48:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facultybatches`
--

INSERT INTO `facultybatches` (`id`, `user_id`, `faculty_id`, `batch_id`, `created_at`, `updated_at`) VALUES
(17, 1, 1, 2, '2021-05-19 11:22:19', '2021-05-19 11:22:19');

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
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `videolink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `videosource` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `module on lesson` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `user_id`, `course_id`, `module_id`, `order_id`, `title`, `description`, `content`, `type`, `duration`, `url`, `image1`, `image2`, `file`, `videolink`, `videosource`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, NULL, 'Basis of Abacus', 'general details of abacus course', 'Abacus exercises the brain to its unbelievable potential, using activities that require memory, concentration, analysis, visualization and control. These activities encourage the brain to remember arithmetic skills. As well as complete mental calculations faster than traditional Math with higher levels of accuracy.', 'Theory', '00:15:00', NULL, '', NULL, '', NULL, 'youtube', 'active', '2021-05-18 13:28:09', '2021-05-18 13:28:09'),
(4, 1, 1, 1, NULL, 'Abacus Finger Theory', 'Finger theory is the first step in learning abacus.', 'Finger theory is the first step in learning abacus. Finger theory gives a great introduction to the mindset of abacus, use of the abacus tool is introduced alongside finger theory, and they complement each others learning.', 'Video', '00:10:00', NULL, '', NULL, '', NULL, 'youtube', 'active', '2021-05-18 13:48:00', '2021-05-18 13:48:00'),
(5, 1, 1, NULL, NULL, 'MENTAL THEORY', 'allowing students to carry out massive calculations quickly and correctly with no tool, other than their mind.', 'The Final, Hardest, but most impressive stage of the Abacus Technique is when our students learn to use Mental Theory. We teach them to visualize an Abacus in their mind. This is where the real strengths and usefulness of Abacus comes in, allowing students to carry out massive calculations quickly and correctly with no tool, other than their mind.', 'Theory', '00:30:00', NULL, '', NULL, '', NULL, 'youtube', 'active', '2021-05-18 16:48:04', '2021-05-18 16:48:04');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_statuses`
--

DROP TABLE IF EXISTS `lesson_statuses`;
CREATE TABLE IF NOT EXISTS `lesson_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `user_id`, `course_id`, `order_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Abacus level 0', 'abacus course', 'active', '2021-05-11 05:17:29', '2021-05-18 13:01:39'),
(2, 1, 1, NULL, 'Abacus level 1', 'abacus course', 'active', '2021-05-18 13:01:12', '2021-05-18 13:01:12'),
(3, 1, 1, NULL, 'Abacus level 2', 'abacus course', 'active', '2021-05-18 13:01:26', '2021-05-18 13:01:26'),
(4, 1, 1, NULL, 'Abacus level 3', 'abacus course', 'active', '2021-05-18 13:01:56', '2021-05-18 13:01:56');

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
-- Table structure for table `package_courses`
--

DROP TABLE IF EXISTS `package_courses`;
CREATE TABLE IF NOT EXISTS `package_courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schemes`
--

INSERT INTO `schemes` (`id`, `user_id`, `scheme_title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Anadham 2021 - online', 'Summer Vacation Course for school students (online only)', '2021-04-29 02:32:40', '2021-05-05 23:59:51'),
(2, 1, 'Anadham 2021 - offline', 'Summer vacation course for school students offline', '2021-04-29 02:34:44', '2021-04-29 02:34:44'),
(3, 1, 'Regular Course', 'Archikites conducts regular computer courses', '2021-05-18 11:27:05', '2021-05-18 11:27:05'),
(4, 1, 'Fast track Courses', NULL, '2021-05-18 11:27:24', '2021-05-18 11:27:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentnotes`
--

INSERT INTO `studentnotes` (`id`, `user_id`, `student_id`, `note`, `type`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'sg', 'dropout', '06-05-2021', '2021-05-06 01:16:31', '2021-05-06 01:16:31'),
(2, 1, 1, 'dsaf', 'enroledagain', '06-05-2021', '2021-05-06 01:16:37', '2021-05-06 01:16:37'),
(3, 1, 3, 'leave for 1 month', 'dropout', '18-05-2021', '2021-05-18 16:15:43', '2021-05-18 16:15:43'),
(4, 1, 3, 'rejoin', 'enroledagain', '18-05-2021', '2021-05-18 16:15:56', '2021-05-18 16:15:56');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `batch`, `name`, `qualification`, `reg_number`, `custom_reg_num`, `dob`, `photo`, `house_name`, `place`, `district`, `pincode`, `state`, `phone`, `whatsapp`, `email`, `g_name`, `g_occup`, `g_relation`, `g_specify`, `g_phon`, `g_email`, `day`, `month`, `year`, `financial_year`, `added`, `updated`, `last_update`, `status`, `dropout`, `dropoutdate`, `logkey`, `password`, `refreshToken`, `passwordResetToken`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Atheena K', '3rd Standard studying', 'AK04212', NULL, '2011-01-26', NULL, 'Karanthad', 'AUP School Kunnaru', 'Kannur', NULL, 'Kerala', 9605014624, '9605014624', NULL, 'Chandralekha', 'Housewife', NULL, NULL, 9605014624, NULL, 4, 4, 2021, NULL, NULL, NULL, '29-04-21', 1, NULL, NULL, NULL, '$2y$10$GD7y74iCmHfKKOvck5mumuLIryBVX5GV2104HqyzvdMZKC3LnGXvW', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjIyMDkxNDQ2fQ.kH_1mI-4MFBZCkFHjXOB87sayogdFK1vaBIysVwQz1E', NULL, '2021-04-29 03:17:45', '2021-05-06 01:16:37'),
(2, 1, 2, 'Ujjwal Krishna M P', NULL, 'AK04213', NULL, '2012-06-18', '', 'Mothanga House', 'vengara', 'Kannur', NULL, 'Kerala', 9847093634, '9847093634', NULL, 'Soumya', 'Housewife', 'Mother', 'S/o Mithunraj', 9847093634, NULL, 5, 4, 2021, NULL, NULL, NULL, '05-04-2021', 1, NULL, NULL, NULL, '$2y$10$vfL7hrZncAqy8IuSba1fieTCVU4JICYWj73m7wcphJ068LIQ0kGb.', NULL, NULL, '2021-04-29 04:10:07', '2021-04-29 04:10:07'),
(3, 1, 2, 'UJJWAL', NULL, 'AK05214', NULL, '2012-06-18', '', 'MOTHANGA HOUSE', 'VENGARA', 'KANNUR', NULL, 'Kerala', 9847093634, '9847093634', NULL, 'SOUMYA M', 'HOUSE WIFE', 'Mother', 'W/O MITHUNRAJ', 9847093634, NULL, 5, 4, 2021, NULL, NULL, NULL, '05-04-2021', 1, NULL, NULL, NULL, '$2y$10$/c4UZSgZzy2oaqbU0eXSVeiFImJUn1YpNoRkmyUxAWhrCkucc0ixS', NULL, NULL, '2021-05-18 11:06:39', '2021-05-18 16:15:56'),
(4, 1, 2, 'SRIYA S KUMAR', '1st Standard', 'AK05215', NULL, '2013-09-18', '', 'mekkara house', 'Kunjimangalam', 'KANNUR', NULL, 'kerala', 8943988342, '8943988342', 'anuskumar711@gmail.com', 'sasikumar mv', 'gulf', 'Father', NULL, 8943988342, NULL, 7, 4, 2021, NULL, NULL, NULL, '07-04-2021', 1, NULL, NULL, NULL, '$2y$10$0KPtA34FV5u7o01/GuAu/OmEB9tFWAeBmfHmu5MUsRirkaDTIqj9e', NULL, NULL, '2021-05-25 12:03:45', '2021-05-25 12:03:45'),
(5, 1, 2, 'PARVATHI SREEJITH', 'primary class', 'AK05216', NULL, '2015-01-25', '', 'LAKSHMI', 'VILAYANCODE', 'KANNUR', NULL, 'KERALA', 8943883300, '8943883300', 'aswathijss@gmail.com', 'ASWATHI SREEJITH', 'AUDIOLOGIST', 'Mother', NULL, 8943883300, 'aswathijss@gmail.com', 8, 4, 2021, NULL, NULL, NULL, '08-04-2021', 1, NULL, NULL, NULL, '$2y$10$.dghmqGiaQo63ubhuWJV3Oi0mKJUbnGNA/1zCh/1cqWGMmFyRW8s.', NULL, NULL, '2021-05-25 12:21:35', '2021-05-25 12:21:35'),
(6, 1, 2, 'KARTHIKA P', 'VIII', 'AK05217', NULL, '2008-08-23', '', 'NANDHANAM', 'KAITHAPRAM', 'KANNUR', NULL, 'KERALA', 9747172720, '9747172720', NULL, 'RAJEEVAN P', 'GOLDSMITH', 'Father', NULL, 9747172720, NULL, 10, 4, 2021, NULL, NULL, NULL, '10-04-2021', 1, NULL, NULL, NULL, '$2y$10$EnAd0u7p5mRAci7NBAWVg.rnWSiBdZrIkwtGGYiytP75aG5hAmqs2', NULL, NULL, '2021-05-25 12:25:21', '2021-05-25 12:25:21'),
(7, 1, 2, 'RITHIWIK P RAJEEV', 'IV', 'AK05218', NULL, '2012-12-02', '', 'NANDHANAM', 'KAITHAPRAM', 'KANNUR', NULL, 'KERALA', 9747172720, '9747172720', NULL, 'RAJEEVAN', 'GOLDSMITH', 'Father', NULL, 9747172720, NULL, 10, 4, 2021, NULL, NULL, NULL, '10-04-2021', 1, NULL, NULL, NULL, '$2y$10$GxrijBrRoyX29bjChVcXbevs6PO4Heq0vGA3x1fvX2i2E.JjY3i8i', NULL, NULL, '2021-05-25 12:28:28', '2021-05-25 12:28:28'),
(8, 1, 2, 'DRUPATH S KUMAR', 'primary class', 'AK05219', NULL, '2015-07-31', '', 'PUTHIYA VEEDU', 'cheruvancheri, mathamangalam', 'kannur', NULL, 'KERALA', 8547708438, '8547708438', 'santhosh1124@yahoo.com', 'SABTHOSH KUMAR P V', 'ACCOUNTANT', 'Father', NULL, 8547708438, 'santhosh1124@yahoo.com', 10, 4, 2021, NULL, NULL, NULL, '10-04-2021', 1, NULL, NULL, NULL, '$2y$10$3xV0YrIiYODWo8DWEmA2rO1y0iTy2tOfQ9CnCTZJbzGQI6rAeo3Ta', NULL, NULL, '2021-05-25 12:32:04', '2021-05-25 12:32:04'),
(9, 1, 4, 'DIJITH K', NULL, 'AK052110', NULL, '1982-11-04', NULL, 'DEEPAM PUTHURKKUNNU', 'PARIYARAM MC', 'KANNUR', NULL, 'KERALA', 7907215272, '7907215272', 'dijithkannur@gmail.com', 'KUNJIRAMAN', 'NIL', NULL, NULL, 7907215272, NULL, 23, 4, 2021, NULL, NULL, NULL, '29-05-21', 1, NULL, NULL, NULL, '$2y$10$uMjxrf1P5wgo4KyGhFPeqOJ6cgmH4XEil3G9dlw2JCj/9g.2VFTRO', NULL, NULL, '2021-05-29 12:06:23', '2021-05-29 12:10:25'),
(10, 1, 1, 'JEWEL MARIA JOBIN', 'II nd STANDARD', 'AK052111', NULL, '2014-05-16', '', 'KARIMARUTHAM CHALIL', 'kottayad, karuvanchal', NULL, NULL, 'KERALA', 9946090333, '9496661772', NULL, 'Jobin Jose', 'Business', 'Father', NULL, 9496661772, NULL, 27, 4, 2021, NULL, NULL, NULL, '27-04-2021', 1, NULL, NULL, NULL, '$2y$10$l5br/nMiQ5.FzeLX5aAByu1ccMbG3tjNz3oyTi2uNtyvmmqMKdari', NULL, NULL, '2021-05-29 12:35:50', '2021-05-29 12:35:50'),
(11, 1, 1, 'ADHYA U', '3rd Standard', 'AK052112', NULL, '2012-04-24', '', 'Alinkeel House', 'vengara', 'kannur', NULL, 'Kerala', 9656841398, '9656841398', NULL, 'Suchithra', 'Housewife', 'Mother', NULL, 9656841398, NULL, 27, 4, 2021, NULL, NULL, NULL, '27-04-2021', 1, NULL, NULL, NULL, '$2y$10$MK/l6LuOauY7WRE/Ybt7tOzUH2E.iZPjjwRzVHrCmIKLw0wZVFvYu', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImlhdCI6MTYyMjI5MzE0MH0.W9---uo9Q-oeUmKv-pk5Aq8UF6d2lgFvPq4mhgf76Js', NULL, '2021-05-29 12:41:00', '2021-05-29 12:41:00'),
(12, 1, 1, 'SPARSHA A', '1st Standard', 'AK052113', NULL, '2013-12-01', '', 'STAFF QUATERS, RUDSET', 'THALIPARAMBA', 'KERALA', NULL, 'KERALA', 9400926241, '9747439611', NULL, 'ABHILASH N', 'TRAINER RUDSET', 'Father', NULL, 9400926241, NULL, 28, 4, 2021, NULL, NULL, NULL, '28-04-2021', 1, NULL, NULL, NULL, '$2y$10$nm8WeAxAfjHpM1aLbCthRuZ.4ib2N0j0phtqJdu3HF0tRGhAKDDS.', NULL, NULL, '2021-05-29 12:45:38', '2021-05-29 12:45:38'),
(13, 1, 1, 'MUHAMMED NIHAL', '1st Standard', 'AK052114', NULL, '2014-07-10', '', 'PALAKKOTTU', 'NADAPPURAM, VADAKARA', 'KOZHIKODE', NULL, 'KERALA', 9847683440, '9847683440', NULL, 'MUHAMMED SHAFI', 'ABROAD', 'Father', NULL, 9847683440, NULL, 28, 4, 2021, NULL, NULL, NULL, '28-04-2021', 1, NULL, NULL, NULL, '$2y$10$OnHI3vVmKThV0RjEB3AmtOFULgPTProZnuF5wV5L9TfSQASOfJR.2', NULL, NULL, '2021-05-29 12:50:37', '2021-05-29 12:50:37'),
(14, 1, 1, 'EZHIL SIVAM R', '2nd Standard', 'AK052115', NULL, '2014-01-14', '', 'BHAVANAS', 'MANIMALA CROSS ROAD', 'COCHIN', NULL, 'KERALA', 8606393180, '8606393180', NULL, 'RAMSHANKAR', 'HOME MAKER', 'Father', NULL, 8606393180, NULL, 28, 4, 2021, NULL, NULL, NULL, '28-04-2021', 1, NULL, NULL, NULL, '$2y$10$v6c8IV2lr23tlFC30FH3Cua5SaHXucLgCOYPzE10Tm4ihSD8XOlQ.', NULL, NULL, '2021-05-29 12:55:47', '2021-05-29 12:55:47'),
(15, 1, 1, 'GAUTHAM RAMESH', NULL, 'AK052116', NULL, '2011-04-27', '', 'MAHIMA', 'NEAR OLACHERIKAVU', 'KANNUR', NULL, 'KERALA', 8547074609, '8547074609', NULL, 'SAMITHA MOHAN', 'CIVIL ENGINEER', 'Mother', NULL, 8547074609, NULL, 29, 4, 2021, NULL, NULL, NULL, '29-04-2021', 1, NULL, NULL, NULL, '$2y$10$lidPBCUeYMnj8tIdzsSP7OZGfxlc4WeIX41jTmIoPQmg226dMM3y6', NULL, NULL, '2021-05-29 13:24:56', '2021-05-29 13:24:56'),
(16, 1, 1, 'VARDHA NISHANTH', '2nd Standard', 'AK052117', NULL, '2014-02-03', '', 'MAHIMA', 'OLANCHERI ,KANNUR', 'KANNUR', NULL, 'KERALA', 8547074609, '8547074609', NULL, 'DHANYA KRISHNANKUTTY', 'TEACHER', 'Mother', NULL, 8547074609, NULL, 29, 4, 2021, NULL, NULL, NULL, '29-04-2021', 1, NULL, NULL, NULL, '$2y$10$hKB52cmjfKCQzqZXeHrhOOWYRLZU8eoV/.f.mWpr42VWKFTMw4bUi', NULL, NULL, '2021-05-29 13:27:43', '2021-05-29 13:27:43'),
(17, 1, 1, 'SNIGDHA M P', '1st Standard', 'AK052118', NULL, '2014-03-02', '', 'PUNARTHAM', 'KULAPPURAM,VILAYANCODE', 'KANNUR', NULL, 'KERALA', 8928073703, '9497127437', NULL, 'SUSIL CHANDRAN T V', 'BUSINESS', 'Father', NULL, 8928073703, 'susil-kulappuram@yahoo.co.in', 29, 4, 2021, NULL, NULL, NULL, '29-04-2021', 1, NULL, NULL, NULL, '$2y$10$LP716GKO1tVv1oTU7wA3gOf4t2FQFlxXl5N7UadukZ5dzyaEs8lIG', NULL, NULL, '2021-05-29 13:32:38', '2021-05-29 13:32:38'),
(18, 1, 1, 'SREEHARI PV', '1st Standard, UPS CHALLAD', 'AK052119', NULL, '2011-10-04', '', 'KESAVAN MARAR', 'CHALAD TEMPLE, KANNUR', 'KANNUR', NULL, 'KERALA', 8111902038, '8111902038', NULL, 'PRADEEPAN', 'TEACHER', 'Father', NULL, 8111902038, NULL, 29, 4, 2021, NULL, NULL, NULL, '29-04-2021', 1, NULL, NULL, NULL, '$2y$10$eI2hVBHP7RYnqA1p6TXL6e/GtjYxApH.A721NFGhEES3mIxfGv9wC', NULL, NULL, '2021-05-29 13:35:44', '2021-05-29 13:35:44'),
(19, 1, 1, 'THANAV', '1st Standard', 'AK052120', NULL, '2015-06-10', '', 'DIPINA', 'KARAYAD', 'KANNUR', NULL, 'KERALA', 9497420426, '9497420426', NULL, 'SHIMJITH', 'TEACHER', 'Father', NULL, 9497420426, NULL, 29, 4, 2021, NULL, NULL, NULL, '29-04-2021', 1, NULL, NULL, NULL, '$2y$10$DEbyr0Nd1HCyVpL22LEeLu5WBL5o.7G7jRZziBc6XM9umXzXdrAh2', NULL, NULL, '2021-05-29 13:38:15', '2021-05-29 13:38:15'),
(20, 1, 1, 'ISHANI', NULL, 'AK052121', NULL, '2014-05-23', '', 'KUNDAN HOUSE', 'MELATHIYADAM, Sreestha', 'KANNUR', NULL, 'KERALA', 8086345719, '8086345719', 'nisha4433@gmail.com', 'nisha', 'teacher', 'Mother', NULL, 8086345719, NULL, 29, 4, 2021, NULL, NULL, NULL, '29-04-2021', 1, NULL, NULL, NULL, '$2y$10$RvlFjXpFws6YB7ftvDB1dO2HA8YRPeLcZ4pfuOGTkrCDROPJmhCF6', NULL, NULL, '2021-05-29 13:49:34', '2021-05-29 13:49:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

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
(16, 1, 2, 1, 6, 2500, 17, 5, 2021, '2020-2021', '2021-05-17 05:16:09', '2021-05-17 05:16:09'),
(17, 1, 1, 1, 3, 2500, 19, 5, 2021, '2020-2021', '2021-05-19 10:55:52', '2021-05-19 10:55:52'),
(18, 1, 1, 1, 3, 2500, 19, 5, 2021, '2020-2021', '2021-05-19 11:31:09', '2021-05-19 11:31:09'),
(19, 1, 1, 1, 3, 2500, 19, 5, 2021, '2020-2021', '2021-05-19 11:31:30', '2021-05-19 11:31:30'),
(20, 1, 4, 1, 8, 2500, 25, 5, 2021, '2020-2021', '2021-05-25 12:04:35', '2021-05-25 12:04:35'),
(21, 1, 5, 1, 9, 2500, 25, 5, 2021, '2020-2021', '2021-05-25 12:22:02', '2021-05-25 12:22:02'),
(22, 1, 8, 1, 12, 2500, 25, 5, 2021, '2020-2021', '2021-05-25 12:32:30', '2021-05-25 12:32:30'),
(23, 1, 10, 1, 14, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 12:36:40', '2021-05-29 12:36:40'),
(24, 1, 11, 1, 15, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 12:41:24', '2021-05-29 12:41:24'),
(25, 1, 12, 1, 16, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 12:45:53', '2021-05-29 12:45:53'),
(26, 1, 13, 1, 17, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 12:50:50', '2021-05-29 12:50:50'),
(27, 1, 14, 1, 18, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 12:56:01', '2021-05-29 12:56:01'),
(28, 1, 15, 1, 19, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 13:25:08', '2021-05-29 13:25:08'),
(29, 1, 16, 1, 20, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 13:27:56', '2021-05-29 13:27:56'),
(30, 1, 18, 1, 22, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 13:36:00', '2021-05-29 13:36:00'),
(31, 1, 19, 1, 23, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 13:38:25', '2021-05-29 13:38:25'),
(32, 1, 20, 1, 24, 2500, 29, 5, 2021, '2020-2021', '2021-05-29 13:49:45', '2021-05-29 13:49:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`id`, `user_id`, `course_id`, `student_id`, `certification`, `scheme`, `title`, `fee`, `track`, `course_type`, `type`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-06 00:36:39', '2021-05-06 00:36:39'),
(6, 1, 1, 2, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-06 01:35:42', '2021-05-06 01:35:42'),
(7, 1, 1, 3, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-18 11:07:02', '2021-05-18 11:07:02'),
(8, 1, 1, 4, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-25 12:04:06', '2021-05-25 12:04:06'),
(9, 1, 1, 5, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-25 12:21:43', '2021-05-25 12:21:43'),
(10, 1, 1, 6, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-25 12:25:38', '2021-05-25 12:25:38'),
(11, 1, 1, 7, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-25 12:28:32', '2021-05-25 12:28:32'),
(12, 1, 1, 8, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-25 12:32:12', '2021-05-25 12:32:12'),
(13, 1, 9, 9, 2, 3, 'DIPLOMA IN AUTOCAD AND 3ds MAX', 15500, NULL, 'online', 'P', '1', '2021-05-29 12:06:28', '2021-05-29 12:06:28'),
(14, 1, 1, 10, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 12:36:24', '2021-05-29 12:36:24'),
(15, 1, 1, 11, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 12:41:03', '2021-05-29 12:41:03'),
(16, 1, 1, 12, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 12:45:41', '2021-05-29 12:45:41'),
(17, 1, 1, 13, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 12:50:40', '2021-05-29 12:50:40'),
(18, 1, 1, 14, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 12:55:49', '2021-05-29 12:55:49'),
(19, 1, 1, 15, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 13:24:59', '2021-05-29 13:24:59'),
(20, 1, 1, 16, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 13:27:46', '2021-05-29 13:27:46'),
(21, 1, 1, 17, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 13:32:42', '2021-05-29 13:32:42'),
(22, 1, 1, 18, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 13:35:52', '2021-05-29 13:35:52'),
(23, 1, 1, 19, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 13:38:17', '2021-05-29 13:38:17'),
(24, 1, 1, 20, 1, 1, 'Abacus Training', 2500, NULL, 'online', 'C', '1', '2021-05-29 13:49:37', '2021-05-29 13:49:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_payments`
--

INSERT INTO `student_payments` (`id`, `user_id`, `course_id`, `student_id`, `bill_id`, `type`, `discount_rs`, `discount_per`, `dis_per_in_amount`, `payment_amount`, `day`, `month`, `year`, `financial_year`, `filename`, `created_at`, `updated_at`) VALUES
(15, 1, 1, 2, 15, 'DP', 0, 0, 0, 1000, 17, 5, 2021, '2020-2021', '1_1621248296_Payment_Ujjwal Krishna M P_AK04213.pdf', '2021-05-17 05:14:55', '2021-05-17 10:44:56'),
(16, 1, 1, 2, 16, 'FP', 0, 0, 0, 100, 17, 5, 2021, '2020-2021', '1_1621248370_Payment_AK04213.pdf', '2021-05-17 05:16:09', '2021-05-17 10:46:10'),
(17, 1, 1, 1, 17, 'DP', 0, 0, 0, 100, 19, 5, 2021, '2020-2021', NULL, '2021-05-19 10:55:52', '2021-05-19 10:55:52'),
(18, 1, 1, 1, 18, 'FP', 0, 0, 0, 150, 19, 5, 2021, '2020-2021', NULL, '2021-05-19 11:31:09', '2021-05-19 11:31:09'),
(19, 1, 1, 1, 19, 'FP', 0, 0, 0, 50, 19, 5, 2021, '2020-2021', NULL, '2021-05-19 11:31:30', '2021-05-19 11:31:30'),
(20, 1, 1, 4, 20, 'DP', 0, 0, 0, 2500, 25, 5, 2021, '2020-2021', '1_1621944991_Payment_AK05215.pdf', '2021-05-25 12:04:35', '2021-05-25 17:46:31'),
(21, 1, 1, 5, 21, 'DP', 0, 0, 0, 2500, 25, 5, 2021, '2020-2021', '1_1621945324_Payment_AK05216.pdf', '2021-05-25 12:22:02', '2021-05-25 17:52:04'),
(22, 1, 1, 8, 22, 'DP', 0, 0, 0, 1000, 25, 5, 2021, '2020-2021', '1_1621945952_Payment_AK05219.pdf', '2021-05-25 12:32:30', '2021-05-25 18:02:32'),
(23, 1, 1, 10, 23, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622291865_Payment_AK052111.pdf', '2021-05-29 12:36:40', '2021-05-29 18:07:45'),
(24, 1, 1, 11, 24, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622292087_Payment_AK052112.pdf', '2021-05-29 12:41:24', '2021-05-29 18:11:27'),
(25, 1, 1, 12, 25, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622292359_Payment_AK052113.pdf', '2021-05-29 12:45:53', '2021-05-29 18:15:59'),
(26, 1, 1, 13, 26, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622292652_Payment_AK052114.pdf', '2021-05-29 12:50:50', '2021-05-29 18:20:52'),
(27, 1, 1, 14, 27, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622292965_Payment_AK052115.pdf', '2021-05-29 12:56:01', '2021-05-29 18:26:05'),
(28, 1, 1, 15, 28, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622294710_Payment_AK052116.pdf', '2021-05-29 13:25:08', '2021-05-29 18:55:10'),
(29, 1, 1, 16, 29, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622294878_Payment_AK052117.pdf', '2021-05-29 13:27:56', '2021-05-29 18:57:58'),
(30, 1, 1, 18, 30, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622295362_Payment_AK052119.pdf', '2021-05-29 13:36:00', '2021-05-29 19:06:02'),
(31, 1, 1, 19, 31, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622295508_Payment_AK052120.pdf', '2021-05-29 13:38:25', '2021-05-29 19:08:28'),
(32, 1, 1, 20, 32, 'DP', 0, 0, 0, 2500, 29, 5, 2021, '2020-2021', '1_1622296187_Payment_AK052121.pdf', '2021-05-29 13:49:45', '2021-05-29 19:19:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `user_id`, `tagname`, `created_at`, `updated_at`) VALUES
(1, 1, 'Design', '2021-05-03 06:59:30', '2021-05-03 06:59:30'),
(3, 1, 'Photoshop', '2021-05-03 06:59:50', '2021-05-03 06:59:50'),
(4, 1, 'Angular', '2021-05-03 07:00:02', '2021-05-03 07:00:02'),
(5, 1, 'CAD', '2021-05-18 11:58:47', '2021-05-18 11:58:47'),
(6, 1, 'office automation', '2021-05-18 11:59:19', '2021-05-18 11:59:19'),
(7, 1, 'Abacus', '2021-05-19 11:48:33', '2021-05-19 11:48:33'),
(9, 1, 'Accounting', '2021-05-23 08:59:45', '2021-05-23 08:59:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `role`, `phone`, `whatsapp`, `facebook`, `linkedin`, `photo`, `created_at`, `updated_at`) VALUES
(2, 1, 'SHANIL K P', 'CMD', '9946041479', '9946041479', 'https://www.facebook.com/shanil.kp.7', NULL, '1_1621443484.jpg', '2021-05-19 16:58:04', '2021-05-19 16:58:04'),
(3, 1, 'Bindhu Suresh', 'HOD', '8281016662', '8281016662', 'https://www.facebook.com/venusbindh', NULL, '1_1621922954.jpg', '2021-05-25 06:09:14', '2021-05-25 06:09:14'),
(4, 1, 'Pranav V V', 'Software Head', '9633895528', '9633895528', NULL, NULL, '1_1621923185.jpg', '2021-05-25 06:13:05', '2021-05-25 06:13:05'),
(5, 1, 'Rajesh KLC', 'Master Trainer', '9061670777', '9061670777', 'https://www.facebook.com/kvrajeshklm', NULL, '1_1622021361.jpg', '2021-05-26 09:26:13', '2021-05-26 09:29:21'),
(6, 1, 'Suhail C P', 'BDO', '9961534231', '9961534231', 'https://www.facebook.com/shuhail.chattiol', NULL, '1_1622021816.jpg', '2021-05-26 09:36:56', '2021-05-26 09:36:56');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `refreshToken`, `passwordResetToken`, `created_at`, `updated_at`) VALUES
(1, 'archikites', 'archikites@gmail.com', NULL, '$2y$10$kXpByEjNjrVB4yTS4G28Nu7agfpEQfNLGZPB2NwF0S04G8m.A39IO', 'admin', 'UdBvDWrQuaCGlsdHedNtyjW1FyTjhOimcTsmPebX394lZj24h4PCGHcBOyWG', NULL, NULL, '2021-02-19 20:45:13', '2021-02-19 20:45:13'),
(2, 'Pranav', 'vvpranav04@gmail.com', NULL, '$2y$10$NtthR1wOm4J/lY9tJyNX3.gfqVhDEA3OohGHKo0r.WaH.v9JFb7Ay', 'admin', NULL, NULL, NULL, '2021-02-19 22:42:54', '2021-02-19 22:42:54'),
(15, 'Bindhu P K', 'venusbindh@gmail.com', NULL, '$2y$10$NtthR1wOm4J/lY9tJyNX3.gfqVhDEA3OohGHKo0r.WaH.v9JFb7Ay', 'user', NULL, NULL, NULL, '2021-04-29 04:00:15', '2021-04-29 04:00:15'),
(16, 'shanil kp', 'shanilkp@gmail.com', NULL, '$2y$10$GCTcGguyAlsbnkPscJswGubUlYBoFQBeMqEWq6E/zOxvCLrRwfLW6', 'user', NULL, NULL, NULL, '2021-05-18 15:40:36', '2021-05-18 15:40:36'),
(17, 'SWETHA P K', 'swe@gmail.com', NULL, '$2y$10$mpT7mU3LH5v5.niZBW.2femCbTcZHC94Wbx3PTqzcUJTvsVp8e1hS', 'user', NULL, NULL, NULL, '2021-05-18 15:46:03', '2021-05-18 15:46:03'),
(18, 'rajanpilla', 'shanilkp1@gmail.com', NULL, '$2y$10$YxZgeiYIAMPhYFUIWgJfF.OZAQcWSdiW1uJklHBzxryLUzIU7qfFe', 'user', NULL, NULL, NULL, '2021-05-18 15:46:49', '2021-05-18 15:46:49'),
(19, 'rajesh', 'rajesh@gmail.com', NULL, '$2y$10$59sLkvB/grxw7n8BNLmIleeMHkcRYv5iI/p5/.vBsSXPfqroJiRFW', 'user', NULL, NULL, NULL, '2021-05-18 15:48:42', '2021-05-18 15:48:42');

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
