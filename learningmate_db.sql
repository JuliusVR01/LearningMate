-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 03:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learningmate_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `gender` enum('Male','Female','Rather not to say') NOT NULL,
  `reset_code` int(10) NOT NULL,
  `profile_picture` varchar(255) NOT NULL,
  `join_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `firstname`, `lastname`, `email`, `password`, `birthday`, `gender`, `reset_code`, `profile_picture`, `join_date`) VALUES
(1, 'Charme', 'Fernandez', '2301108959@student.buksu.edu.ph', '$2y$10$ANU1BgX5wf548HMu2QUHEucM37QL4PuccAjXi8pPWsox28baYvvRS', '2005-07-10', 'Female', 141083, '', '2025-04-08 16:00:00'),
(2, 'Stephanie', 'Faller', '2301103366@student.buksu.edu.ph', '$2y$10$FExwHvhthy8qBIrLeViU8OSfoZJrrZHt.QboRCDoZ2YcE8QJVRyMS', '2005-07-10', 'Female', 464804, '', '2025-05-04 07:08:09'),
(3, 'Julius Van Ryn', 'Acenas', '2301102070@student.buksu.edu.ph', '$2y$10$7QhP5Y3z7zZJnyzn08cD7edzZRCKLPhkmgxgjgdbSrFqs/.fABC8G', '2025-05-04', 'Male', 631091, '', '2025-05-04 07:11:54'),
(4, 'Admin', 'Pilot', 'admin.example@gmail.com', '$2y$10$26tkRfAnXoXQXMqNXKOO4.lgw1DEPDxKlD.Y9FjBNzftSofKbdvfS', '2003-05-17', 'Male', 0, 'profile_1747656984.png', '2025-05-19 12:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `bookmark_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `module_id`, `bookmark_date`, `admin_id`) VALUES
(24, 75, 34, '2025-05-05 23:49:53', NULL),
(47, NULL, 34, '2025-05-06 10:14:25', 1),
(48, NULL, 36, '2025-05-06 10:14:29', 1),
(59, 73, 34, '2025-05-06 10:25:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `cover_image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `uploader_type` enum('user','admin') NOT NULL DEFAULT 'user',
  `rating` float(2,1) DEFAULT NULL,
  `status` enum('pending','rejected','approved') NOT NULL DEFAULT 'pending',
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `total_raters` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `cover_image`, `title`, `subject`, `category`, `description`, `file_path`, `upload_date`, `uploader_type`, `rating`, `status`, `user_id`, `admin_id`, `total_raters`) VALUES
(29, '../uploads/cover_modules/1746449888_360_F_308697506_9dsBYHXm9FwuW0qcEqimAEXUvzTwfzwe.jpg', 'Empowering the Future: The Role of Technology in Modern Education', 'Technology in Education', 'college', 'This modules focuses on the integration and impact of technology in teaching and learning environments. It covers topics such as digital learning tools, online education platforms, the role of artificial intelligence in personalized learning, and how technology is reshaping classrooms to enhance student engagement and academic performance.', '../uploads/modules/1746449888_Empowering the Future.pdf', '2025-05-05 12:58:08', 'user', NULL, 'approved', 74, NULL, 0),
(30, '../uploads/cover_modules/1746450691_t3.jpg', ' Internet of Things (IoT)', 'Connecting the World: Exploring the Power of the Internet of Things', 'technology', 'This subject explores how everyday objects are becoming \"smart\" through the use of sensors, internet connectivity, and data exchange. It covers applications of IoT in homes, cities, healthcare, agriculture, and industries, highlighting how this technology improves efficiency, automation, and decision-making in the real world.\r\n\r\n', '../uploads/modules/1746450691_IoT & Applications Digital Notes.pdf', '2025-05-05 13:11:31', 'user', NULL, 'rejected', 74, NULL, 0),
(31, '../uploads/cover_modules/1746450831_t2.jpg', 'Beyond Reality: The Rise of Futuristic Virtual Technologies', ' Futuristic Virtual Technology', 'technology', 'This subject delves into cutting-edge virtual technologies such as virtual reality (VR), augmented reality (AR), and mixed reality (MR). It examines how these immersive experiences are revolutionizing sectors like gaming, education, healthcare, and remote work, while also imagining future possibilities in fully digital environments and the metaverse.', '../uploads/modules/1746450831_virt.pdf', '2025-05-05 13:13:51', 'user', 4.0, 'approved', 74, NULL, 2),
(32, '../uploads/cover_modules/1746451186_n.jpg', 'Nature in Crisis: Understanding Climate Change and Its Effects', 'Climate Change and Its Impact on Nature', 'college', 'This subject focuses on how climate change is affecting ecosystems, wildlife, and weather patterns. It explores causes such as greenhouse gas emissions and deforestation, and discusses global efforts to reduce carbon footprints and promote environmental sustainability.\r\n\r\n', '../uploads/modules/1746451186_ClimateChamngeanditsImpactonBiodiversity.pdf', '2025-05-05 13:19:46', 'user', NULL, 'approved', 73, NULL, 0),
(33, '../uploads/cover_modules/1746451282_n1.jpg', 'The Web of Life: Protecting Earth’s Biodiversity', 'Biodiversity and Ecosystem Conservation', 'nature', 'This subject examines the variety of life on Earth and the importance of maintaining healthy ecosystems. It highlights endangered species, conservation efforts, and the role of humans in preserving the balance of nature.', '../uploads/modules/1746451282_ClimateChamngeanditsImpactonBiodiversity.pdf', '2025-05-05 13:21:22', 'user', NULL, 'approved', 73, NULL, 0),
(34, '../uploads/cover_modules/1746451648_m1.jpg', 'Foundations of Numbers: Exploring Ancient Mathematical Systems', 'Ancient Mathematics', 'college', 'This subject delves into the origins of mathematics in ancient civilizations such as Mesopotamia, Egypt, and Greece. It examines how early societies developed numerical systems, geometry, and algebra to solve practical problems in trade, astronomy, and architecture.', '../uploads/modules/1746451648_m1.pdf', '2025-05-05 13:27:28', 'user', NULL, 'approved', 77, NULL, 0),
(35, '../uploads/cover_modules/1746452025_m2.jpg', 'Algebra and Algorithms: Mathematical Innovations in the Islamic World', 'Mathematics in the Islamic Golden Age', 'math', 'This subject explores the significant contributions of Islamic scholars during the Golden Age (8th to 14th centuries), highlighting advancements in algebra, trigonometry, and numerical systems that laid the groundwork for modern mathematics.', '../uploads/modules/1746452025_HistoryMath-Burton.85.pdf', '2025-05-05 13:33:45', 'user', NULL, 'pending', 77, NULL, 0),
(36, '../uploads/cover_modules/1746452374_h.jpg', 'Cradles of Civilization: A Journey Through Ancient Societie', 'Ancient Civilizations', 'history', 'This subject explores the rise and fall of ancient civilizations such as Mesopotamia, Egypt, the Indus Valley, and China, focusing on their cultural, political, and technological achievements.', '../uploads/modules/1746452374_AncientCivilization_10001599.pdf', '2025-05-05 13:39:34', 'user', NULL, 'approved', 77, NULL, 0),
(37, '../uploads/cover_modules/1746488439_ELS_Q2_Module-1_Evolving-Concept-of-Life-Based-on-Emerging-Pieces-of-Evidence_v2.png', 'Evolving Concept of Life Based on Emerging Pieces of Evidence', 'Earth and Life Science', 'science', 'This topic explores how scientific understanding of life has changed and expanded over time as new evidence has emerged from various fields such as biology, chemistry, and astronomy. It examines the shift from early, simplistic definitions of life to more complex and inclusive concepts shaped by discoveries like DNA structure, cell theory, evolutionary biology, and extremophiles. The topic also considers how ongoing research, including the search for extraterrestrial life and advancements in synthetic biology, continues to reshape our definition and understanding of what it means to be alive.\r\n\r\n', '../uploads/modules/1746488439_ELS_Q2_Module-1_Evolving-Concept-of-Life-Based-on-Emerging-Pieces-of-Evidence_v2.pdf', '2025-05-05 23:40:39', 'user', NULL, 'pending', 76, NULL, 0),
(38, '../uploads/cover_modules/1746488521_INTRO-TO-QUANTI.png', 'Introduction to Quantitative Methods', 'Quantitative', 'math', 'Quantitative research is a systematic investigation that focuses on quantifying data and phenomena. It involves the collection and analysis of numerical data to identify patterns, test hypotheses, and make predictions. This type of research is commonly used in the fields of social sciences, education, health, and business, among others. By using statistical tools and structured methodologies such as surveys, experiments, and observational studies, quantitative research aims to provide objective and reliable results that can be generalized to larger populations. Its strength lies in its ability to measure variables precisely and establish relationships between them through mathematical and statistical means.', '../uploads/modules/1746488521_INTRO-TO-QUANTI.pdf', '2025-05-05 23:42:01', 'user', NULL, 'pending', 76, NULL, 0),
(39, '../uploads/cover_modules/1746488849_MUSIC9-Q1.png', 'Music', 'Mapeh', 'music', 'Music is a universal form of human expression that combines sound, rhythm, and harmony to convey emotions, tell stories, and connect people across cultures and time. It is both an art and a science, involving creativity, structure, and often deep cultural significance. Music can be instrumental or vocal, simple or complex, and spans a wide range of genres such as classical, jazz, pop, rock, and traditional or folk music. It plays a vital role in society—used in celebrations, rituals, education, entertainment, and even therapy—making it an essential part of human life and culture.\r\n\r\n', '../uploads/modules/1746488849_MUSIC9-Q1.pdf', '2025-05-05 23:47:30', 'user', NULL, 'approved', 75, NULL, 0),
(40, '../uploads/cover_modules/1746488985_WEEK 4 Physical-Science_11_Q1_MODULE_11_How-Energy-is-Produced-and-Managed-08082020.png', 'How Enregy is Produced and Managed', 'Physical Science', 'science', 'Energy is produced from sources like fossil fuels, sunlight, wind, water, and nuclear reactions. These sources are converted into electricity or other usable forms through processes such as combustion or the use of turbines and generators. Once produced, energy is distributed through power lines and managed using systems that ensure efficiency, reduce waste, and promote sustainable use. Energy management includes conservation, the use of renewable sources, and smart technologies to balance supply and demand.', '../uploads/modules/1746488985_WEEK 4 Physical-Science_11_Q1_MODULE_11_How-Energy-is-Produced-and-Managed-08082020.pdf', '2025-05-05 23:49:45', 'user', NULL, 'rejected', 75, NULL, 0),
(41, '../uploads/cover_modules/1746528545_PE01-PATHFIT1.png', 'Path to Fitness: Building a Healthier Lifestyle', 'Physical Education / Health and Wellness', 'pe', 'The \"Path to Fitness\" refers to a personal journey or structured plan aimed at achieving physical health and well-being. It involves setting realistic fitness goals and following a balanced routine that includes regular exercise, proper nutrition, rest, and lifestyle habits. A good path to fitness considers individual needs, such as body type, age, fitness level, and health conditions, and may include a mix of cardio, strength training, flexibility exercises, and mindfulness practices. Consistency, motivation, and gradual progress are key to long-term success.\r\n\r\n', '../uploads/modules/1746528545_PE01-PATHFIT1.pdf', '2025-05-06 10:49:07', 'user', NULL, 'pending', 73, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `module_rating`
--

CREATE TABLE `module_rating` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `rating_score` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module_rating`
--

INSERT INTO `module_rating` (`id`, `module_id`, `rating_score`, `user_id`, `admin_id`, `created_at`) VALUES
(7, 31, 5, NULL, 1, '2025-05-05 22:24:49'),
(8, 31, 3, 75, NULL, '2025-05-06 09:23:06');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `recipient_type` enum('admin','user') DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` datetime DEFAULT current_timestamp(),
  `module_id` int(11) DEFAULT NULL,
  `icon_class` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `recipient_id`, `recipient_type`, `message`, `status`, `created_at`, `module_id`, `icon_class`) VALUES
(14, 2147483647, 'admin', 'New module uploaded: \"Empowering the Future: The Role of Technology in Modern Education\" needs review', 'unread', '2025-05-05 20:58:08', 29, 'fas fa-cloud-upload-alt'),
(15, 230156570, 'admin', 'New module uploaded: \"Empowering the Future: The Role of Technology in Modern Education\" needs review', 'unread', '2025-05-05 20:58:08', 29, 'fas fa-cloud-upload-alt'),
(16, 230156569, 'admin', 'New module uploaded: \"Empowering the Future: The Role of Technology in Modern Education\" needs review', 'read', '2025-05-05 20:58:08', 29, 'fas fa-cloud-upload-alt'),
(17, 2147483647, 'admin', 'New module uploaded: \" Internet of Things (IoT)\" needs review', 'unread', '2025-05-05 21:11:31', 30, 'fas fa-cloud-upload-alt'),
(18, 230156570, 'admin', 'New module uploaded: \" Internet of Things (IoT)\" needs review', 'unread', '2025-05-05 21:11:31', 30, 'fas fa-cloud-upload-alt'),
(19, 230156569, 'admin', 'New module uploaded: \" Internet of Things (IoT)\" needs review', 'read', '2025-05-05 21:11:31', 30, 'fas fa-cloud-upload-alt'),
(20, 2147483647, 'admin', 'New module uploaded: \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" needs review', 'unread', '2025-05-05 21:13:51', 31, 'fas fa-cloud-upload-alt'),
(21, 230156570, 'admin', 'New module uploaded: \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" needs review', 'unread', '2025-05-05 21:13:51', 31, 'fas fa-cloud-upload-alt'),
(22, 230156569, 'admin', 'New module uploaded: \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" needs review', 'read', '2025-05-05 21:13:51', 31, 'fas fa-cloud-upload-alt'),
(23, 2147483647, 'admin', 'New module uploaded: \"Nature in Crisis: Understanding Climate Change and Its Effects\" needs review', 'unread', '2025-05-05 21:19:46', 32, 'fas fa-cloud-upload-alt'),
(24, 230156570, 'admin', 'New module uploaded: \"Nature in Crisis: Understanding Climate Change and Its Effects\" needs review', 'unread', '2025-05-05 21:19:46', 32, 'fas fa-cloud-upload-alt'),
(25, 230156569, 'admin', 'New module uploaded: \"Nature in Crisis: Understanding Climate Change and Its Effects\" needs review', 'read', '2025-05-05 21:19:46', 32, 'fas fa-cloud-upload-alt'),
(26, 2147483647, 'admin', 'New module uploaded: \"The Web of Life: Protecting Earth’s Biodiversity\" needs review', 'unread', '2025-05-05 21:21:22', 33, 'fas fa-cloud-upload-alt'),
(27, 230156570, 'admin', 'New module uploaded: \"The Web of Life: Protecting Earth’s Biodiversity\" needs review', 'unread', '2025-05-05 21:21:22', 33, 'fas fa-cloud-upload-alt'),
(28, 230156569, 'admin', 'New module uploaded: \"The Web of Life: Protecting Earth’s Biodiversity\" needs review', 'read', '2025-05-05 21:21:22', 33, 'fas fa-cloud-upload-alt'),
(29, 2147483647, 'admin', 'New module uploaded: \"Foundations of Numbers: Exploring Ancient Mathematical Systems\" needs review', 'unread', '2025-05-05 21:27:28', 34, 'fas fa-cloud-upload-alt'),
(30, 230156570, 'admin', 'New module uploaded: \"Foundations of Numbers: Exploring Ancient Mathematical Systems\" needs review', 'unread', '2025-05-05 21:27:28', 34, 'fas fa-cloud-upload-alt'),
(31, 230156569, 'admin', 'New module uploaded: \"Foundations of Numbers: Exploring Ancient Mathematical Systems\" needs review', 'read', '2025-05-05 21:27:28', 34, 'fas fa-cloud-upload-alt'),
(32, 2147483647, 'admin', 'New module uploaded: \"Algebra and Algorithms: Mathematical Innovations in the Islamic World\" needs review', 'unread', '2025-05-05 21:33:45', 35, 'fas fa-cloud-upload-alt'),
(33, 230156570, 'admin', 'New module uploaded: \"Algebra and Algorithms: Mathematical Innovations in the Islamic World\" needs review', 'unread', '2025-05-05 21:33:45', 35, 'fas fa-cloud-upload-alt'),
(34, 230156569, 'admin', 'New module uploaded: \"Algebra and Algorithms: Mathematical Innovations in the Islamic World\" needs review', 'read', '2025-05-05 21:33:45', 35, 'fas fa-cloud-upload-alt'),
(35, 2147483647, 'admin', 'New module uploaded: \"Cradles of Civilization: A Journey Through Ancient Societie\" needs review', 'unread', '2025-05-05 21:39:34', 36, 'fas fa-cloud-upload-alt'),
(36, 230156570, 'admin', 'New module uploaded: \"Cradles of Civilization: A Journey Through Ancient Societie\" needs review', 'unread', '2025-05-05 21:39:34', 36, 'fas fa-cloud-upload-alt'),
(37, 230156569, 'admin', 'New module uploaded: \"Cradles of Civilization: A Journey Through Ancient Societie\" needs review', 'read', '2025-05-05 21:39:34', 36, 'fas fa-cloud-upload-alt'),
(38, 77, 'user', 'Your module \"Cradles of Civilization: A Journey Through Ancient Societie\" has been approved by the admin.', 'unread', '2025-05-05 22:06:05', 36, 'fas fa-check-circle'),
(39, 77, 'user', 'Your module \"Foundations of Numbers: Exploring Ancient Mathematical Systems\" has been approved by the admin.', 'unread', '2025-05-05 22:06:11', 34, 'fas fa-check-circle'),
(40, 74, 'user', 'Your module \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" has been approved by the admin.', 'unread', '2025-05-05 22:06:50', 31, 'fas fa-check-circle'),
(41, 73, 'user', 'Your module \"Nature in Crisis: Understanding Climate Change and Its Effects\" has been approved by the admin.', 'read', '2025-05-05 22:06:56', 32, 'fas fa-check-circle'),
(42, 73, 'user', 'Your module \"The Web of Life: Protecting Earth’s Biodiversity\" has been approved by the admin.', 'read', '2025-05-05 22:07:02', 33, 'fas fa-check-circle'),
(43, 74, 'user', 'Your module \"Empowering the Future: The Role of Technology in Modern Education\" has been approved by the admin.', 'unread', '2025-05-05 22:07:07', 29, 'fas fa-check-circle'),
(44, 2147483647, 'admin', 'New module uploaded: \"Evolving Concept of Life Based on Emerging Pieces of Evidence\" needs review', 'unread', '2025-05-06 07:40:39', 37, 'fas fa-cloud-upload-alt'),
(45, 230156570, 'admin', 'New module uploaded: \"Evolving Concept of Life Based on Emerging Pieces of Evidence\" needs review', 'unread', '2025-05-06 07:40:39', 37, 'fas fa-cloud-upload-alt'),
(46, 230156569, 'admin', 'New module uploaded: \"Evolving Concept of Life Based on Emerging Pieces of Evidence\" needs review', 'read', '2025-05-06 07:40:39', 37, 'fas fa-cloud-upload-alt'),
(47, 2147483647, 'admin', 'New module uploaded: \"Introduction to Quantitative Methods\" needs review', 'unread', '2025-05-06 07:42:01', 38, 'fas fa-cloud-upload-alt'),
(48, 230156570, 'admin', 'New module uploaded: \"Introduction to Quantitative Methods\" needs review', 'unread', '2025-05-06 07:42:01', 38, 'fas fa-cloud-upload-alt'),
(49, 230156569, 'admin', 'New module uploaded: \"Introduction to Quantitative Methods\" needs review', 'read', '2025-05-06 07:42:01', 38, 'fas fa-cloud-upload-alt'),
(50, 2147483647, 'admin', 'New module uploaded: \"Music\" needs review', 'unread', '2025-05-06 07:47:30', 39, 'fas fa-cloud-upload-alt'),
(51, 230156570, 'admin', 'New module uploaded: \"Music\" needs review', 'unread', '2025-05-06 07:47:30', 39, 'fas fa-cloud-upload-alt'),
(52, 230156569, 'admin', 'New module uploaded: \"Music\" needs review', 'read', '2025-05-06 07:47:30', 39, 'fas fa-cloud-upload-alt'),
(53, 2147483647, 'admin', 'New module uploaded: \"How Enregy is Produced and Managed\" needs review', 'unread', '2025-05-06 07:49:45', 40, 'fas fa-cloud-upload-alt'),
(54, 230156570, 'admin', 'New module uploaded: \"How Enregy is Produced and Managed\" needs review', 'unread', '2025-05-06 07:49:45', 40, 'fas fa-cloud-upload-alt'),
(55, 230156569, 'admin', 'New module uploaded: \"How Enregy is Produced and Managed\" needs review', 'read', '2025-05-06 07:49:45', 40, 'fas fa-cloud-upload-alt'),
(56, 73, 'user', 'Your module \"Nature in Crisis: Understanding Climate Change and Its Effects\" has been rejected by the admin.', 'read', '2025-05-06 11:36:18', 32, 'fas fa-times-circle'),
(57, 2147483647, 'admin', 'New user registered: Bingbing Ferna', 'unread', '2025-05-06 18:42:44', NULL, 'fas fa-user-plus'),
(58, 230156570, 'admin', 'New user registered: Bingbing Ferna', 'unread', '2025-05-06 18:42:44', NULL, 'fas fa-user-plus'),
(59, 230156569, 'admin', 'New user registered: Bingbing Ferna', 'read', '2025-05-06 18:42:44', NULL, 'fas fa-user-plus'),
(60, 2147483647, 'admin', 'New module uploaded: \"Path to Fitness: Building a Healthier Lifestyle\" needs review', 'unread', '2025-05-06 18:49:07', 41, 'fas fa-cloud-upload-alt'),
(61, 230156570, 'admin', 'New module uploaded: \"Path to Fitness: Building a Healthier Lifestyle\" needs review', 'unread', '2025-05-06 18:49:07', 41, 'fas fa-cloud-upload-alt'),
(62, 230156569, 'admin', 'New module uploaded: \"Path to Fitness: Building a Healthier Lifestyle\" needs review', 'read', '2025-05-06 18:49:07', 41, 'fas fa-cloud-upload-alt'),
(66, 2147483647, 'admin', 'User #73 requested to become a \"student\".', 'unread', '2025-05-07 12:10:20', NULL, 'fas fa-user-tag'),
(67, 230156570, 'admin', 'User #73 requested to become a \"student\".', 'unread', '2025-05-07 12:10:20', NULL, 'fas fa-user-tag'),
(68, 230156569, 'admin', 'User #73 requested to become a \"student\".', 'read', '2025-05-07 12:10:20', NULL, 'fas fa-user-tag'),
(69, 2147483647, 'admin', 'Juano Dela Cruz requested to become a \"student\".', 'unread', '2025-05-07 12:20:28', NULL, 'fas fa-user-tag'),
(70, 230156570, 'admin', 'Juano Dela Cruz requested to become a \"student\".', 'unread', '2025-05-07 12:20:28', NULL, 'fas fa-user-tag'),
(71, 230156569, 'admin', 'Juano Dela Cruz requested to become a \"student\".', 'read', '2025-05-07 12:20:28', NULL, 'fas fa-user-tag'),
(72, 2147483647, 'admin', 'Juano Dela Cruz requested to become a \"teacher\".', 'unread', '2025-05-07 12:29:15', NULL, 'fas fa-user-tag'),
(73, 230156570, 'admin', 'Juano Dela Cruz requested to become a \"teacher\".', 'unread', '2025-05-07 12:29:15', NULL, 'fas fa-user-tag'),
(74, 230156569, 'admin', 'Juano Dela Cruz requested to become a \"teacher\".', 'read', '2025-05-07 12:29:15', NULL, 'fas fa-user-tag'),
(75, 73, 'user', 'Your role has been updated to \"student\" by an admin.', 'read', '2025-05-07 12:37:22', NULL, 'fas fa-user-shield'),
(76, 73, 'user', 'Your role has been updated to \"student\" by an admin.', 'read', '2025-05-07 14:13:36', NULL, 'fas fa-user-shield'),
(77, 78, 'user', 'Your role has been updated to \"teacher\" by an admin.', 'unread', '2025-05-07 14:32:02', NULL, 'fas fa-user-shield'),
(78, 2147483647, 'admin', 'Juan Dela Cruz requested to become a \"student\".', 'unread', '2025-05-07 14:44:59', NULL, 'fas fa-user-tag'),
(79, 230156570, 'admin', 'Juan Dela Cruz requested to become a \"student\".', 'unread', '2025-05-07 14:44:59', NULL, 'fas fa-user-tag'),
(80, 230156569, 'admin', 'Juan Dela Cruz requested to become a \"student\".', 'read', '2025-05-07 14:44:59', NULL, 'fas fa-user-tag'),
(81, 73, 'user', 'Your role has been updated to \"student\" by an admin.', 'read', '2025-05-07 14:45:18', NULL, 'fas fa-user-shield'),
(82, 73, 'user', 'Your role has been updated to \"teacher\" by an admin.', 'read', '2025-05-07 14:54:08', NULL, 'fas fa-user-shield'),
(83, 73, 'user', 'Your role has been updated to \"student\" by an admin.', 'read', '2025-05-07 14:55:03', NULL, 'fas fa-user-shield'),
(90, 2147483647, 'admin', 'New user registered: Charme Fernandez', 'unread', '2025-05-09 16:34:01', NULL, 'fas fa-user-plus'),
(91, 230156570, 'admin', 'New user registered: Charme Fernandez', 'unread', '2025-05-09 16:34:01', NULL, 'fas fa-user-plus'),
(92, 230156569, 'admin', 'New user registered: Charme Fernandez', 'unread', '2025-05-09 16:34:01', NULL, 'fas fa-user-plus'),
(93, 75, 'user', 'Your module \"How Enregy is Produced and Managed\" has been approved by the admin.', 'unread', '2025-05-17 20:06:08', 40, 'fas fa-check-circle'),
(94, 75, 'user', 'Your module \"How Enregy is Produced and Managed\" has been rejected by the admin.', 'unread', '2025-05-17 20:07:30', 40, 'fas fa-times-circle'),
(95, 73, 'user', 'Your module \"Nature in Crisis: Understanding Climate Change and Its Effects\" has been approved by the admin.', 'read', '2025-05-17 20:11:51', 32, 'fas fa-check-circle'),
(96, 75, 'user', 'Your module \"How Enregy is Produced and Managed\" has been approved by the admin.', 'unread', '2025-05-17 20:13:40', 40, 'fas fa-check-circle'),
(97, 75, 'user', 'Your module \"How Enregy is Produced and Managed\" has been rejected by the admin.', 'unread', '2025-05-17 20:15:15', 40, 'fas fa-times-circle'),
(98, 74, 'user', 'Your module \" Internet of Things (IoT)\" has been rejected by the admin.', 'unread', '2025-05-17 20:17:16', 30, 'fas fa-times-circle'),
(99, 73, 'user', 'Your module \"The Web of Life: Protecting Earth’s Biodiversity\" has been approved by the admin.', 'read', '2025-05-17 20:20:14', 33, 'fas fa-check-circle'),
(100, 77, 'user', 'Your module \"Foundations of Numbers: Exploring Ancient Mathematical Systems\" has been approved by the admin.', 'unread', '2025-05-17 20:20:40', 34, 'fas fa-check-circle'),
(101, 73, 'user', 'Your module \"The Web of Life: Protecting Earth’s Biodiversity\" has been rejected by the admin.', 'read', '2025-05-17 20:20:43', 33, 'fas fa-times-circle'),
(102, 74, 'user', 'Your module \" Internet of Things (IoT)\" has been approved by the admin.', 'unread', '2025-05-17 20:32:11', 30, 'fas fa-check-circle'),
(103, 73, 'user', 'Your module \"Nature in Crisis: Understanding Climate Change and Its Effects\" has been approved by the admin.', 'read', '2025-05-17 20:32:16', 32, 'fas fa-check-circle'),
(104, 73, 'user', 'Your module \"The Web of Life: Protecting Earth’s Biodiversity\" has been approved by the admin.', 'read', '2025-05-17 20:32:19', 33, 'fas fa-check-circle'),
(105, 77, 'user', 'Your module \"Cradles of Civilization: A Journey Through Ancient Societie\" has been approved by the admin.', 'unread', '2025-05-17 20:32:22', 36, 'fas fa-check-circle'),
(106, 75, 'user', 'Your module \"Music\" has been approved by the admin.', 'unread', '2025-05-17 20:32:26', 39, 'fas fa-check-circle'),
(107, 73, 'user', 'Your module \"Nature in Crisis: Understanding Climate Change and Its Effects\" has been rejected by the admin.', 'read', '2025-05-17 20:35:29', 32, 'fas fa-times-circle'),
(108, 74, 'user', 'Your module \" Internet of Things (IoT)\" has been rejected by the admin.', 'unread', '2025-05-17 20:36:02', 30, 'fas fa-times-circle'),
(109, 74, 'user', 'Your module \" Internet of Things (IoT)\" has been approved by the admin.', 'unread', '2025-05-17 20:43:27', 30, 'fas fa-check-circle'),
(110, 73, 'user', 'Your module \"Nature in Crisis: Understanding Climate Change and Its Effects\" has been approved by the admin.', 'read', '2025-05-17 20:53:29', 32, 'fas fa-check-circle'),
(111, 73, 'user', 'Your module \"The Web of Life: Protecting Earth’s Biodiversity\" has been rejected by the admin.', 'read', '2025-05-17 20:53:54', 33, 'fas fa-times-circle'),
(112, 74, 'user', 'Your module \" Internet of Things (IoT)\" has been approved by the admin.', 'unread', '2025-05-17 20:55:37', 30, 'fas fa-check-circle'),
(113, 74, 'user', 'Your module \" Internet of Things (IoT)\" has been rejected by the admin.', 'unread', '2025-05-17 20:55:41', 30, 'fas fa-times-circle'),
(114, 74, 'user', 'Your module \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" has been approved by the admin.', 'unread', '2025-05-17 20:55:46', 31, 'fas fa-check-circle'),
(115, 74, 'user', 'Your module \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" has been rejected by the admin.', 'unread', '2025-05-17 20:55:49', 31, 'fas fa-times-circle'),
(116, 74, 'user', 'Your module \" Internet of Things (IoT)\" has been approved by the admin.', 'unread', '2025-05-17 21:35:37', 30, 'fas fa-check-circle'),
(117, 74, 'user', 'Your module \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" has been approved by the admin.', 'unread', '2025-05-17 21:37:06', 31, 'fas fa-check-circle'),
(118, 74, 'user', 'Your module \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" has been approved by the admin.', 'unread', '2025-05-17 21:37:19', 31, 'fas fa-check-circle'),
(119, 74, 'user', 'Your module \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" has been rejected by the admin.', 'unread', '2025-05-17 21:37:21', 31, 'fas fa-times-circle'),
(120, 74, 'user', 'Your module \" Internet of Things (IoT)\" has been approved by the admin.', 'unread', '2025-05-17 21:37:26', 30, 'fas fa-check-circle'),
(121, 74, 'user', 'Your module \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" has been approved by the admin.', 'unread', '2025-05-17 21:37:29', 31, 'fas fa-check-circle'),
(122, 73, 'user', 'Your module \"The Web of Life: Protecting Earth’s Biodiversity\" has been approved by the admin.', 'read', '2025-05-17 21:37:30', 33, 'fas fa-check-circle'),
(123, 74, 'user', 'Your module \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" has been rejected by the admin.', 'unread', '2025-05-17 21:38:16', 31, 'fas fa-times-circle'),
(124, 83, 'user', 'Your role has been updated to \"student\" by an admin.', 'unread', '2025-05-17 21:43:00', NULL, 'fas fa-user-shield'),
(125, 74, 'user', 'Your module \"Beyond Reality: The Rise of Futuristic Virtual Technologies\" has been approved by the admin.', 'unread', '2025-05-17 21:43:39', 31, 'fas fa-check-circle'),
(126, 74, 'user', 'Your module \" Internet of Things (IoT)\" has been rejected by the admin.', 'unread', '2025-05-17 21:43:41', 30, 'fas fa-times-circle'),
(127, 3, 'admin', 'New user registered: lala mo', 'unread', '2025-05-19 10:48:44', NULL, 'fas fa-user-plus'),
(128, 2, 'admin', 'New user registered: lala mo', 'read', '2025-05-19 10:48:44', NULL, 'fas fa-user-plus'),
(129, 1, 'admin', 'New user registered: lala mo', 'read', '2025-05-19 10:48:44', NULL, 'fas fa-user-plus'),
(130, 3, 'admin', 'New user registered: vvdfdsds vfvf', 'unread', '2025-05-19 12:11:52', NULL, 'fas fa-user-plus'),
(131, 2, 'admin', 'New user registered: vvdfdsds vfvf', 'read', '2025-05-19 12:11:52', NULL, 'fas fa-user-plus'),
(132, 1, 'admin', 'New user registered: vvdfdsds vfvf', 'read', '2025-05-19 12:11:52', NULL, 'fas fa-user-plus'),
(133, 3, 'admin', 'New user registered: Steph Faller', 'unread', '2025-05-19 14:17:01', NULL, 'fas fa-user-plus'),
(134, 2, 'admin', 'New user registered: Steph Faller', 'read', '2025-05-19 14:17:01', NULL, 'fas fa-user-plus'),
(135, 1, 'admin', 'New user registered: Steph Faller', 'unread', '2025-05-19 14:17:01', NULL, 'fas fa-user-plus'),
(136, 3, 'admin', 'New user registered: User Pilot', 'unread', '2025-05-19 19:56:26', NULL, 'fas fa-user-plus'),
(137, 2, 'admin', 'New user registered: User Pilot', 'unread', '2025-05-19 19:56:26', NULL, 'fas fa-user-plus'),
(138, 1, 'admin', 'New user registered: User Pilot', 'unread', '2025-05-19 19:56:26', NULL, 'fas fa-user-plus');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `reset_code` int(10) NOT NULL,
  `join_date` timestamp NULL DEFAULT current_timestamp(),
  `profile_picture` varchar(255) NOT NULL,
  `role` enum('user','student','teacher') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `password`, `birthday`, `gender`, `reset_code`, `join_date`, `profile_picture`, `role`) VALUES
(73, 'Juan', 'Dela Cruz', 'juan.delacruz1@example.com', '$2y$10$Ggjaa3YghtmG5HTn6RoFOeAL3A3o8vZiL6BhcEsjvH8fJ2HQhtKZm', '1995-01-15', 'Male', 0, '2025-05-05 07:29:28', 'profile_1746518332.jpg', 'student'),
(74, 'Maria', 'Santos', 'maria.santos1@example.com', '$2y$10$GJJovM/RXl9ONph/6nNbW.16AJT/Hn4zgYbWlsOpMWJTsGsnlZRxG', '1994-03-22', 'Female', 0, '2025-05-05 07:29:28', 'profile_1746449574.jpg', 'user'),
(75, 'Jose', 'Reyes', 'jose.reyes1@example.com', '$2y$10$lUk1InccBUKE/KqgYSJ4eeyVyBD32Nl/C8BN3iJBYjZwuDjBAB0kW', '1993-07-10', 'Male', 0, '2025-05-05 07:29:28', 'profile_1746449443.jpg', 'teacher'),
(76, 'Ana', 'Torres', 'ana.torres1@example.com', '$2y$10$z2iUkID8W7E5wU2eBxEOZe163U/60RuJtXVmFjWNPYGXCBfMhm0c6', '1996-02-28', 'Female', 0, '2025-05-05 07:29:28', 'profile_1746449531.jpg', 'user'),
(77, 'Mark', 'Lopez', 'mark.lopez1@example.com', '$2y$10$LLJtJ5y1UofKZszN4PDIouI9//DcsE/EMrzcakXKUR2sG4IV/wq/G', '1998-06-12', 'Male', 0, '2025-05-05 07:29:28', 'profile_1746449491.jpg', 'user'),
(84, 'lala', 'mo', 'l@gmail.com', '$2y$10$dT6aNorICV8lS4e9ABkjpOV3SKPltRLTG1kwzEKzyJWZkRHHNmzwu', '2005-07-10', 'Female', 0, '2025-05-19 02:48:44', '', 'user'),
(85, 'Charme', 'Fernandez', 'chachacharme05@gmail.com', '$2y$10$n1JX1Y7kanh0.Y5smJ3omeFYxPbjV0pUXqDiHNVhp5IV4gffvIv/G', '2000-01-01', 'Male', 428366, '2025-05-18 21:15:16', 'https://lh3.googleusercontent.com/a/ACg8ocJtJyxias98pbluGSqJhgdy1JdtRxQodOvM8r9-nP0NtxrpUCLb=s96-c', 'student'),
(86, 'vvdfdsds', 'vfvf', 'k@gmail.com', '$2y$10$PGJy.Uje5LvfYmj.Yjp6hetLln6UHA81Ozhm5A3VM0ZPvNE9PIgX6', '2005-10-10', 'Female', 0, '2025-05-19 04:11:52', '', 'user'),
(87, 'Steph', 'Faller', 'fallerstephjoy@gmail.com', '$2y$10$rUI0G2oXw2kE2YXLs26JyudPEExgdzjyY9RUt4aVHIl9Rfh7SRbEO', '2004-02-10', 'Female', 297142, '2025-05-19 06:17:01', '', 'user'),
(88, 'User', 'Pilot', 'user.example@gmail.com', '$2y$10$r1OqutlUWtGT9tlMpzGSXu8dBekyaQccNWNu6r.rCx6yvhJA4Kx7C', '2003-01-10', 'Male', 0, '2025-05-19 11:56:26', 'profile_1747656789.png', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_module_id` (`module_id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_admin_id` (`admin_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_modules_user` (`user_id`),
  ADD KEY `fk_modules_admin` (`admin_id`);

--
-- Indexes for table `module_rating`
--
ALTER TABLE `module_rating`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_rating` (`module_id`,`user_id`,`admin_id`),
  ADD KEY `fk_rating_user` (`user_id`),
  ADD KEY `fk_rating_admin` (`admin_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notif_module` (`module_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `module_rating`
--
ALTER TABLE `module_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_module_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `fk_modules_admin` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_modules_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `module_rating`
--
ALTER TABLE `module_rating`
  ADD CONSTRAINT `fk_rating_admin` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`),
  ADD CONSTRAINT `fk_rating_module` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `fk_rating_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notif_module` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
