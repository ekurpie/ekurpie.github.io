-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 204.11.58.166:3306
-- Generation Time: Nov 04, 2020 at 05:08 PM
-- Server version: 5.6.39
-- PHP Version: 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amruspfw_`
--

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `prefix` varchar(8) DEFAULT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `prefix`, `first_name`, `last_name`, `user_id`, `phone_number`) VALUES
(1, 'Dr', 'Judith', 'Gebauer', 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `from_student_id` int(11) NOT NULL,
  `to_student_id` int(11) NOT NULL,
  `status_id` tinyint(4) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `note` varchar(500) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rm_user`
--

CREATE TABLE `rm_user` (
  `user_id` bigint(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `banner_id` varchar(9) NOT NULL,
  `password` char(32) NOT NULL COMMENT 'store MD5 generated 128-bit hash value',
  `role_id` tinyint(4) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rm_user`
--

INSERT INTO `rm_user` (`user_id`, `created_date`, `banner_id`, `password`, `role_id`) VALUES
(2, '2020-10-29 18:05:44', '850123456', '5f4dcc3b5aa765d61d8327deb882cf99', 1),
(3, '2020-10-29 18:07:00', '850321456', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(4, '2020-10-29 18:07:00', '850654321', '5f4dcc3b5aa765d61d8327deb882cf99', 2),
(5, '2020-10-29 18:08:21', '850435678', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(6, '2020-10-29 15:33:03', '850098765', 'password', 3),
(7, '2020-10-29 17:56:12', '850451234', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(8, '2020-10-29 18:15:22', '850654654', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(9, '2020-10-29 23:15:15', '850333333', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(10, '2020-10-30 10:50:55', '850111111', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(11, '2020-10-30 21:42:31', '850999999', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(12, '2020-10-31 22:13:01', '', '696d29e0940a4957748fe3fc9efd22a3', 3),
(13, '2020-11-01 22:08:03', '850666666', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(15, '2020-11-01 23:10:19', '850234567', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(16, '2020-11-01 23:20:12', '850850850', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(19, '2020-11-01 23:26:52', '850123123', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(20, '2020-11-01 23:27:03', '850423186', '248583b26dc28a8b50447b22727a7457', 3),
(21, '2020-11-02 00:50:13', '850123654', '5f4dcc3b5aa765d61d8327deb882cf99', 3),
(22, '2020-11-02 16:46:18', '850000000', '5e8ff9bf55ba3508199d22e984129be6', 3),
(23, '2020-11-02 17:01:43', '850888888', '5f4dcc3b5aa765d61d8327deb882cf99', 3);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` tinyint(4) NOT NULL,
  `description` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `description`) VALUES
(1, 'Admin'),
(2, 'Staff'),
(3, 'Student'),
(4, 'Student/Staff');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` tinyint(4) NOT NULL,
  `description` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `middle_initial` varchar(1) DEFAULT NULL,
  `last_name` varchar(64) NOT NULL,
  `gender` varchar(16) NOT NULL,
  `is_early_riser` tinyint(1) DEFAULT NULL,
  `is_night_owl` tinyint(1) DEFAULT NULL,
  `is_smoker` tinyint(1) DEFAULT NULL,
  `notes` text,
  `image_path` varchar(96) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `has_assignment` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(96) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `user_id`, `first_name`, `middle_initial`, `last_name`, `gender`, `is_early_riser`, `is_night_owl`, `is_smoker`, `notes`, `image_path`, `is_active`, `has_assignment`, `email`, `phone_number`) VALUES
(1, 2, 'Grayson', ' ', 'LeCompte', 'Male', 0, 1, 0, 'Fun roomie wanted, clean, loves animals, willing to cook for me, down for a good time or a chill evening in.', NULL, 1, 0, 'gal1366@uncw.edu', '1234567892'),
(2, 3, 'Evan', NULL, 'Kurpiewski', 'Male', 0, 0, 0, '', NULL, 1, 0, 'eak3772@uncw.edu', ''),
(3, 5, 'Frank', 'A', 'Gerberstein', 'Female', 0, 0, 0, '', NULL, 1, 0, 'franklen15@gmail.com', ''),
(8, 6, 'tootsie', 't', 'pop', 'male', 1, 1, 1, '', NULL, 1, 0, 'tootsieroll@gmail.com', ''),
(9, 7, 'Test for hash password', 't', 'l', 'm', 1, 1, 1, '', NULL, 1, 0, 'test@gmail.com', ''),
(10, 8, 'Evan2', 't', 'testest', 'Female', 0, 0, 0, '', NULL, 1, 0, 'testest@gmail.com', ''),
(11, 9, 'Testing4', 'a', 'testtestestest', 'Male', 0, 0, 0, '', NULL, 1, 0, 'testing10@gmail.com', ''),
(12, 10, 'Felicia', 'a', 'silverstein', 'Female', 1, 0, 0, '', NULL, 1, 0, 'felicia@gmail.com', ''),
(13, 11, 'sara', 'l', 'lebro', 'Female', 1, 0, 0, 'testest', NULL, 1, 0, 'lebro@gmail.com', '123456789'),
(15, 13, 'testing', 'a', 'test', 'Male', 1, 0, 1, 'testestest2', NULL, 1, 0, 'fixed@gmail.com', '141525645'),
(16, 15, 'test', 't', 'testtest', 'Male', 0, 1, 0, 'lefty', NULL, 1, 0, '850123456', '123456789'),
(17, 16, 'test', 'a', 'left', 'Male', 0, 0, 0, 'test', NULL, 1, 0, '850123456', '123456789'),
(20, 19, 'test', 't', 'test', 'Male', 0, 1, 1, 'test', NULL, 1, 0, 'kurpiewski18@gmail.com', '123456789'),
(21, 20, 'Kinsley', 'A', 'Sigmund', 'Female', 1, 0, 0, 'Hope you like dog hair :) ', NULL, 1, 0, 'ks3355@uncw.edu', '7042383238'),
(22, 21, 'julie', 's', 'ramses', 'Female', 0, 1, 0, 'testing23', NULL, 1, 0, 'julie@gmail.com', '123456789'),
(23, 22, 'Sample', ' ', 'Student', 'Male', 1, 1, 0, 'anything goes', NULL, 1, 0, 'samplestudent@uncw.edu', '910-333-4444'),
(24, 23, 'robert', 'a', 'baratheon', 'Male', 1, 1, 0, 'this is from game of thrones', NULL, 1, 0, 'robert@gmail.com', '123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `from_student_id` (`from_student_id`),
  ADD KEY `to_student_id` (`to_student_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `rm_user`
--
ALTER TABLE `rm_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_type_id` (`role_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rm_user`
--
ALTER TABLE `rm_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `rm_user` (`user_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`from_student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`to_student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `rm_user`
--
ALTER TABLE `rm_user`
  ADD CONSTRAINT `rm_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `rm_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
