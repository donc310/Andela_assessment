-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2017 at 11:12 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emeraldfeild_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dept_Id` int(4) NOT NULL,
  `Dept_Name` varchar(30) NOT NULL,
  `Faculty` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dept_Id`, `Dept_Name`, `Faculty`, `description`) VALUES
(1, 'English and Literal studies', 'Arts', ''),
(2, 'Biochemistry', 'Basic Medical Sciences', 'Biochemistry, sometimes called biological chemistry, is the study of chemical processes within and relating to living organisms. By controlling information flow through biochemical signaling and the flow of chemical energy through metabolism, biochemical processes give rise to the complexity of life'),
(4, ' Human Anatomy', 'Basic Medical Sciences', ''),
(5, 'Radiography', 'Allied Medical Sciences', ''),
(6, 'Botany', 'Biological Sciences', ''),
(7, 'Computer Science', 'Science', ''),
(8, 'zology', 'Biological Sciences', ''),
(10, 'Business Administration', 'Arts', ''),
(11, 'Public Administration', 'Social SCience', '');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Role_Id` int(4) NOT NULL,
  `Role_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Role_Id`, `Role_Name`) VALUES
(1, 'student'),
(2, 'Staff'),
(3, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_Id` int(6) NOT NULL,
  `Staff_Name` varchar(50) NOT NULL,
  `Role_Id` int(4) NOT NULL,
  `Dept_Id` int(4) NOT NULL,
  `DoJ` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_Id`, `Staff_Name`, `Role_Id`, `Dept_Id`, `DoJ`) VALUES
(1, 'Christy Akpan', 2, 4, '2015-11-29 10:33:15'),
(2, 'Okon Edet', 2, 1, '2015-11-29 10:39:12'),
(3, 'Mba Chioma', 2, 2, '2015-11-29 10:39:12'),
(4, 'chioma Chidi', 2, 5, '2015-11-29 11:23:57'),
(5, 'Oluchi Amara', 2, 4, '2015-11-29 11:26:28'),
(6, 'chidi Okonta', 2, 4, '2015-11-29 12:31:30'),
(7, 'Nomso Enukoha', 2, 4, '2015-11-29 12:31:39'),
(8, 'Uchenna Enukoha', 2, 1, '2017-10-26 21:46:33'),
(9, 'Christopher chris', 2, 2, '2017-10-27 18:43:20'),
(10, 'enukoha O.', 2, 1, '2017-10-27 18:52:09'),
(11, 'daniel daniel', 2, 1, '2017-10-27 18:54:24'),
(12, 'Micheal Ochala', 2, 1, '2017-10-27 18:57:07'),
(13, 'Blessing Ewona ', 2, 1, '2017-10-27 18:57:29'),
(14, 'John Eluwa', 2, 1, '2017-10-27 22:48:39'),
(15, 'Micheal Jackson Jnr.', 2, 1, '2017-10-27 23:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_Id` int(6) NOT NULL,
  `Student_Name` varchar(50) NOT NULL,
  `Role_Id` int(4) NOT NULL DEFAULT '1',
  `Dept_Id` int(4) NOT NULL DEFAULT '1',
  `DoJ` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sex` varchar(6) NOT NULL,
  `profile_pic` varchar(500) DEFAULT 'https://drive.google.com/open?id=0BziXUiunG_-VUm5Dcmh1RHdhWE0',
  `date_of_brith` date NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL DEFAULT 'plot 200 New AirPort RD PH',
  `lga` varchar(50) NOT NULL,
  `title` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_Id`, `Student_Name`, `Role_Id`, `Dept_Id`, `DoJ`, `sex`, `profile_pic`, `date_of_brith`, `nationality`, `state`, `Email`, `phone`, `address`, `lga`, `title`) VALUES
(1, 'John Okafor jnr ', 1, 4, '2015-11-29 11:33:15', 'Male', 'https://drive.google.com/open?id=0BziXUiunG_-VUm5Dcmh1RHdhWE0', '1999-10-29', 'Nigerian', 'Cross River', 'johnjnr@gmail.com', '090986563425', 'Plot 254 Eta agbor layout Calabar ', '', ''),
(2, 'john okafor', 1, 1, '2015-11-29 11:39:12', 'Male', 'https://drive.google.com/open?id=0BziXUiunG_-VUm5Dcmh1RHdhWE0', '1999-10-29', 'Nigerian', 'Lagos', 'johnokafor@gmail.com', '09060070023', 'plot234 eta agbor layout ', '', ''),
(3, 'Kaosi Muo', 1, 4, '2015-11-29 11:39:12', 'Female', 'https://drive.google.com/open?id=0BziXUiunG_-VU21xbzhmcUVSdTg', '1999-10-29', 'Nigerian', 'Imo', 'dummy7@gigzweb.com', '08185976623', 'plot 200 New Air Port RD PH', '', ''),
(4, 'Chioma Eqwu', 1, 4, '2015-11-29 12:23:57', 'Female', 'https://drive.google.com/open?id=0BziXUiunG_-VcVJlbEc3bDFGWGs', '1999-10-29', 'Nigerian', 'Cross River', 'dummy8@gigzweb.com', '08185979923', 'plot 200 New Air Port RD PH', '', ''),
(5, 'Oluchi', 1, 5, '2015-11-29 12:26:28', 'Female', 'https://drive.google.com/open?id=0BziXUiunG_-VcVJlbEc3bDFGWGs', '1999-10-29', 'Nigerian', 'Cross River', 'dummy9@gigzweb.com', '08185975523', 'plot 200 New Air Port RD PH', '', ''),
(6, 'chidi', 1, 5, '2015-11-29 13:31:30', 'Male', 'https://drive.google.com/open?id=0BziXUiunG_-VclRkazNYSGVCQTA', '1999-10-29', 'Nigerian', 'Cross River', 'dummy10@gigzweb.com', '08185974423', 'plot 200 New Air Port RD PH', '', ''),
(7, 'Nomso', 1, 5, '2015-11-29 13:31:39', 'Male', 'https://drive.google.com/open?id=0BziXUiunG_-VUm5Dcmh1RHdhWE0', '1999-10-29', 'Nigerian', 'Cross River', 'dummy11@gigzweb.com', '081859720123', 'plot 200 New Air Port RD PH', '', ''),
(8, ' Amarachi Solomon', 1, 1, '2017-10-26 22:46:33', 'Female', 'https://drive.google.com/open?id=0BziXUiunG_-VcVJlbEc3bDFGWGs', '1999-10-29', 'Nigerian', 'Lagos', 'dummy1@gigzweb.com', '08185978822', 'plot 200 New Air Port RD PH', '', ''),
(9, 'chibuzor chris', 1, 6, '2017-10-27 19:43:20', 'Male', 'https://drive.google.com/open?id=0BziXUiunG_-VUm5Dcmh1RHdhWE0', '1999-10-29', 'Nigerian', 'Imo', 'dummy12@gigzweb.com', '08185910123', 'plot 200 New Air Port RD PH', '', ''),
(10, 'chibuzor christian enukoha', 1, 1, '2017-10-27 19:52:09', 'Male', 'https://drive.google.com/open?id=0BziXUiunG_-VclRkazNYSGVCQTA', '1999-10-29', 'Nigerian', 'Lagos', 'dummy2@gigzweb.com', '08185978824', 'plot 200 New Air Port RD PH', '', ''),
(11, 'Daniel Dan', 1, 2, '2017-10-27 19:54:24', 'Male', 'https://drive.google.com/open?id=0BziXUiunG_-VclRkazNYSGVCQTA', '1999-10-29', 'Nigerian', 'Lagos', 'dummy3@gigzweb.com', '08185978832', 'plot 200 New Air Port RD PH', '', ''),
(12, 'Glory Affiong', 1, 2, '2017-10-27 19:57:07', 'Male', 'https://drive.google.com/open?id=0BziXUiunG_-VUm5Dcmh1RHdhWE0', '1999-10-29', 'Nigerian', 'Imo', 'dummy4@gigzweb.com', '08185978833', 'plot 200 New Air Port RD PH', '', ''),
(13, 'Quen Anock Uka ', 1, 2, '2017-10-27 19:57:29', 'Female', 'https://drive.google.com/open?id=0BziXUiunG_-VU21xbzhmcUVSdTg', '1999-10-29', 'Nigerian', 'Imo', 'dummy5@gigzweb.com', '08185978723', 'plot 200 New Air Port RD PH', '', ''),
(14, 'obinna okafor ', 1, 1, '2017-11-02 19:46:23', 'male', 'https://drive.google.com/open?id=0BziXUiunG_-VUm5Dcmh1RHdhWE0', '1994-12-12', 'Nigeria', 'abuja', 'obj@gigzblog.com', '0901112233', 'plot 92 barracks road ', 'Lafia', 'master');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dept_Id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Role_Id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_Id`),
  ADD KEY `Role_Id` (`Role_Id`),
  ADD KEY `Dept_Id` (`Dept_Id`),
  ADD KEY `Staff_Id` (`Staff_Id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_Id`),
  ADD UNIQUE KEY `Student_Id` (`Student_Id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `Dept_Id` (`Dept_Id`),
  ADD KEY `Role_Id` (`Role_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Dept_Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Role_Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `Staff_Id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Student_Id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Role_Id`) REFERENCES `role` (`Role_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`Dept_Id`) REFERENCES `department` (`Dept_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Role_Id`) REFERENCES `role` (`Role_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`Dept_Id`) REFERENCES `department` (`Dept_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
