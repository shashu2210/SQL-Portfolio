-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2023 at 08:25 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ohmsphp`
--

CREATE SCHEMA ohmsphp;
USE ohmsphp;

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(10) NOT NULL,
  `adminname` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `usertype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `adminname`, `loginid`, `password`, `status`, `usertype`) VALUES
(1, 'Vrushant', 'admin', 'Password@123', 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` int(10) NOT NULL,
  `appointmenttype` varchar(25) DEFAULT 'Admin',
  `patientid` int(10) NOT NULL,
  `roomid` int(10) DEFAULT 0,
  `departmentid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `doctorid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roomid`, `departmentid`, `appointmentdate`, `appointmenttime`, `doctorid`, `status`, `app_reason`) VALUES
(28, '', 11, 0, 1, '2023-12-05', '10:30:00', 11, 'Approved', 'Routine check-up'),
(29, '', 12, 0, 2, '2023-12-06', '14:00:00', 12, 'Approved', 'Experiencing chest pain'),
(30, '', 13, 0, 3, '2023-12-07', '11:45:00', 13, 'Approved', 'Post-surgery evaluation'),
(31, '', 14, 0, 4, '2023-12-08', '15:30:00', 14, 'Approved', 'Severe injury'),
(32, 'Admin', 15, 0, 5, '2023-12-09', '13:15:00', 15, 'Active', 'Annual health check-up'),
(33, '', 16, 0, 6, '2023-12-10', '09:00:00', 16, 'Approved', 'Abdominal pain'),
(34, '', 17, 0, 7, '2023-12-11', '16:45:00', 17, 'Approved', 'Accident trauma'),
(35, '', 18, 0, 8, '2023-12-12', '23:33:00', 18, 'Approved', 'Follow-up on medication'),
(36, 'Admin', 19, 0, 9, '2023-12-13', '10:15:00', 19, 'Active', 'Discussing test results'),
(37, 'Admin', 20, 0, 2, '2023-12-14', '17:00:00', 20, 'Active', 'Breathing difficulties');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billingid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `billingdate` date NOT NULL,
  `billingtime` time NOT NULL,
  `discount` float(10,2) NOT NULL,
  `taxamount` float(10,2) NOT NULL,
  `discountreason` text NOT NULL,
  `discharge_time` time NOT NULL,
  `discharge_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing_records`
--

CREATE TABLE `billing_records` (
  `billingservice_id` int(10) NOT NULL,
  `billingid` int(10) NOT NULL,
  `bill_type_id` int(10) NOT NULL COMMENT 'id of service charge or treatment charge',
  `bill_type` varchar(250) NOT NULL,
  `bill_amount` float(10,2) NOT NULL,
  `bill_date` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing_records`
--

INSERT INTO `billing_records` (`billingservice_id`, `billingid`, `bill_type_id`, `bill_type`, `bill_amount`, `bill_date`, `status`) VALUES
(61, 28, 11, 'Consultancy Charge', 150.00, '2023-12-03', 'Active'),
(62, 28, 20, 'Treatment', 179.00, '2023-12-03', 'Active'),
(63, 28, 20, 'Treatment', 179.00, '2023-12-03', 'Active'),
(64, 28, 26, 'Treatment', 97560.00, '2023-12-03', 'Active'),
(65, 30, 13, 'Consultancy Charge', 180.00, '2023-12-03', 'Active'),
(66, 30, 23, 'Treatment', 530.00, '2023-12-03', 'Active'),
(67, 30, 20, 'Treatment', 179.00, '2023-12-03', 'Active'),
(68, 29, 12, 'Consultancy Charge', 200.00, '2023-12-03', 'Active'),
(69, 29, 23, 'Treatment', 530.00, '2023-12-03', 'Active'),
(70, 35, 18, 'Consultancy Charge', 170.00, '2023-12-03', 'Active'),
(71, 35, 20, 'Treatment', 179.00, '2023-12-03', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentid` int(10) NOT NULL,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`) VALUES
(1, 'Medicine', 'Medicine', 'Active'),
(2, 'Cardiology', 'Provides medical care to patients who have problems with their heart or circulation.', 'Active'),
(3, 'Gynecology', 'Investigates and treats problems relating to the female urinary tract and reproductive organs, such as Endometriosis, infertility and incontinence', 'Active'),
(4, 'Haematology', 'These hospital services work with the laboratory. In addition doctors treat blood diseases and malignancies related to the blood', 'Active'),
(5, 'Maternity', 'Maternity wards provide antenatal care, delivery of babies and care during childbirth, and postnatal support', 'Active'),
(6, 'Nephrology', 'Monitors and assesses patients with various kidney (renal) problems and conditions', 'Active'),
(7, 'Oncology', 'A branch of medicine that deals with cancer and tumors. A medical professional who practices oncology is an oncologist. The Oncology department provides treatments, including radiotherapy and chemotherapy, for cancerous tumors and blood disorders', 'Active'),
(8, 'Orthopaedics', 'Treats conditions related to the musculoskeletal system, including joints, ligaments, bones, muscles, tendons and nerves', 'Active'),
(9, 'Radiology', 'Deals with the study and application of imaging technology like XRay', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorid` int(10) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` float(11,1) NOT NULL,
  `consultancy_charge` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `mobileno`, `departmentid`, `loginid`, `password`, `status`, `education`, `experience`, `consultancy_charge`) VALUES
(11, 'Dr John Smith', '1234567890', 1, 'johnsmith', 'password123', 'Active', 'MD', 10.0, 150.00),
(12, 'Dr Emily Johnson', '9876543210', 2, 'emilyjohnson', 'pass456', 'Active', 'MS', 8.0, 200.00),
(13, 'Dr Michael Davis', '2345678901', 3, 'michaeldavis', 'pass789', 'Active', 'MD', 12.0, 180.00),
(14, 'Dr Jennifer Lee', '8765432109', 4, 'jenniferlee', 'pass123', 'Active', 'MS', 6.0, 120.00),
(15, 'Dr Robert Miller', '3456789012', 5, 'robertmiller', 'pass234', 'Active', 'MBBS', 15.0, 160.00),
(16, 'Dr Sarah White', '6543210987', 6, 'sarahwhite', 'pass567', 'Active', 'MS', 9.0, 220.00),
(17, 'Dr Christopher Brown', '4321098765', 7, 'christopherbrown', 'pass890', 'Active', 'MD', 11.0, 190.00),
(18, 'Dr Amanda Taylor', '2109876543', 8, 'amandataylor', 'passabc', 'Active', 'MD', 14.0, 170.00),
(19, 'Dr Kevin Wilson', '7890123456', 9, 'kevinwilson', 'passdef', 'Active', 'MD', 7.0, 130.00),
(20, 'Dr Rachel Moore', '5432109876', 2, 'rachelmoore', 'passtuv', 'Active', 'MS', 13.0, 240.00);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_timings`
--

CREATE TABLE `doctor_timings` (
  `doctor_timings_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_timings`
--

INSERT INTO `doctor_timings` (`doctor_timings_id`, `doctorid`, `start_time`, `end_time`, `status`) VALUES
(36, 11, '10:30:00', '17:00:00', 'Active'),
(37, 12, '09:30:00', '13:00:00', 'Active'),
(38, 13, '13:30:00', '17:00:00', 'Active'),
(39, 14, '14:00:00', '18:00:00', 'Active'),
(40, 15, '17:00:00', '21:00:00', 'Active'),
(41, 16, '13:00:00', '19:00:00', 'Active'),
(42, 17, '07:00:00', '11:00:00', 'Active'),
(43, 18, '13:30:00', '16:30:00', 'Active'),
(44, 19, '11:30:00', '14:30:00', 'Active'),
(45, 20, '12:30:00', '16:30:00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineid` int(10) NOT NULL,
  `medicinename` varchar(25) NOT NULL,
  `medicinecost` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `medicinecost`, `description`, `status`) VALUES
(1, 'Paracetamol', 3.00, 'For fever per day 1 pc', 'Active'),
(2, 'Clotrimazole', 14.00, 'Clotrimazole is an antifungal, prescribed for local fungal infections', 'Active'),
(3, 'Miconazole', 26.00, 'Prescribed for various skin infections such as jockitch and also for vaginal yeast infections', 'Active'),
(4, 'Nystatin', 6.00, 'Antifungal drug, prescribed for fungal infections of the skin mouth vagina and intestinal tract', 'Active'),
(5, 'Lotensin', 3.00, 'prevent your body from forming angiotensin', 'Active'),
(6, 'Cozaan', 5.00, 'ARBs block the effects of angiotensin on your heart.', 'Active'),
(7, 'Lovenox', 59.00, 'may prescribe an anticoagulant to prevent heart attack, stroke, or other serious health problems', 'Active'),
(8, 'Abemaciclib', 278.00, 'drug for the treatment of advanced or metastatic breast cancers.', 'Active'),
(9, 'Cyclophosphamide', 231.00, ' to treat lymphoma, multiple myeloma, leukemia, ovarian cancer, breast cancer, small cell lung cancer', 'Active'),
(10, 'Captopril', 92.00, 'used alone or in combination with other medications to treat high blood pressure and heart failure.', 'Active'),
(11, 'Enalapril', 18.00, 'to treat high blood pressure, diabetic kidney disease, and heart failure', 'Active'),
(12, 'Ramipril', 31.00, 'to treat high blood pressure, diabetic kidney disease', 'Active'),
(13, 'Hydroxyurea', 55.00, 'used in sickle-cell disease, essential thrombocythemia, chronic myelogenous leukemia and cervical cancer', 'Active'),
(14, 'Phenprocoumon', 258.00, 'Used for prevention of thrombosis', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `prescriptionid` int(10) NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `cvv_no` varchar(5) NOT NULL,
  `expdate` date NOT NULL,
  `card_holder` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` varchar(20) NOT NULL DEFAULT '000000',
  `loginid` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `pincode`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`) VALUES
(11, 'John Doe', '2023-12-03', '06:47:08', '123 Main St', '9809875676', 'Anytown', '12345', 'john_doe', 'password123', 'O+', 'MALE', '1990-12-05', 'Active'),
(12, 'Jane Smith', '2023-02-02', '14:45:00', '456 Oak St', '5555678', 'Othercity', '67890', 'jane_smith', 'pass456', 'A-', 'Female', '1985-11-12', 'Active'),
(13, 'Bob Johnson', '2023-03-10', '09:15:00', '789 Pine St', '5559876', 'Somewhere', '54321', 'bob_johnson', 'secure789', 'B+', 'Male', '1972-08-30', 'Active'),
(14, 'Alice Davis', '2023-04-05', '12:00:00', '101 Cedar St', '5554321', 'Anytown', '12345', 'alice_davis', 'safe123', 'AB-', 'Female', '1988-04-18', 'Active'),
(15, 'Sam Wilson', '2023-05-20', '15:30:00', '202 Birch St', '5558765', 'Othercity', '67890', 'sam_wilson', 'key567', 'A+', 'Male', '1995-09-25', 'Active'),
(16, 'Eva Brown', '2023-06-08', '11:45:00', '303 Elm St', '5552345', 'Somewhere', '54321', 'eva_brown', 'safe789', 'O-', 'Female', '1978-12-03', 'Active'),
(17, 'Mike Taylor', '2023-07-15', '08:00:00', '404 Maple St', '5556543', 'Anytown', '12345', 'mike_taylor', 'key123', 'B-', 'Male', '1980-02-15', 'Active'),
(18, 'Grace Miller', '2023-08-22', '13:20:00', '505 Pine St', '5558765', 'Othercity', '67890', 'grace_miller', 'secure456', 'AB+', 'Female', '1992-07-08', 'Active'),
(19, 'Tom Clark', '2023-09-30', '10:10:00', '606 Cedar St', '5559876', 'Anytown', '12345', 'tom_clark', 'pass789', 'O+', 'Male', '1983-03-28', 'Active'),
(20, 'Linda Hall', '2023-10-12', '14:15:00', '707 Oak St', '5553456', 'Othercity', '67890', 'linda_hall', 'key789', 'A-', 'Female', '1975-06-14', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `paiddate` date NOT NULL,
  `paidtime` time NOT NULL,
  `paidamount` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentid`, `patientid`, `appointmentid`, `paiddate`, `paidtime`, `paidamount`, `status`) VALUES
(7, 13, 30, '2023-12-03', '08:20:49', 933.45, 'Active'),
(8, 18, 35, '2023-12-03', '08:23:17', 366.45, 'Active'),
(9, 12, 29, '2023-12-03', '08:23:59', 766.50, 'Active'),
(10, 11, 28, '2023-12-03', '08:24:17', 102971.40, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `delivery_type` varchar(10) NOT NULL DEFAULT 'delivery' COMMENT 'Delivered through appointment or online order',
  `delivery_id` int(10) NOT NULL DEFAULT 0 COMMENT 'appointmentid or orderid',
  `prescriptiondate` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `appointmentid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescriptionid`, `doctorid`, `patientid`, `delivery_type`, `delivery_id`, `prescriptiondate`, `status`, `appointmentid`) VALUES
(6, 11, 11, 'delivery', 0, '2023-12-04', 'Active', 28),
(7, 11, 11, 'delivery', 0, '2023-12-13', 'Active', 28),
(8, 13, 13, 'delivery', 0, '2023-12-04', 'Active', 30),
(9, 12, 12, 'delivery', 0, '2023-12-04', 'Active', 29),
(10, 18, 18, 'delivery', 0, '2023-12-04', 'Active', 35);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_records`
--

CREATE TABLE `prescription_records` (
  `prescription_record_id` int(10) NOT NULL,
  `prescription_id` int(10) NOT NULL,
  `medicine_name` varchar(25) NOT NULL,
  `cost` float(10,2) NOT NULL,
  `unit` int(10) NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_records`
--

INSERT INTO `prescription_records` (`prescription_record_id`, `prescription_id`, `medicine_name`, `cost`, `unit`, `dosage`, `status`) VALUES
(6, 6, '3', 26.00, 1, '1-1-1', 'Active'),
(7, 6, '1', 3.00, 1, '0-0-1', 'Active'),
(8, 7, '5', 3.00, 3, '0-1-1', 'Active'),
(9, 8, '4', 6.00, 1, '0-1-1', 'Active'),
(10, 8, '3', 26.00, 1, '1-0-1', 'Active'),
(11, 9, '4', 6.00, 1, '0-1-1', 'Active'),
(12, 9, '3', 26.00, 1, '0-1-1', 'Active'),
(13, 10, '4', 6.00, 1, '1-0-1', 'Active'),
(14, 10, '1', 3.00, 1, '1-1-0', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomid` int(10) NOT NULL,
  `roomtype` varchar(25) NOT NULL,
  `roomno` int(10) NOT NULL,
  `noofbeds` int(10) NOT NULL,
  `room_tariff` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomid`, `roomtype`, `roomno`, `noofbeds`, `room_tariff`, `status`) VALUES
(15, 'GENERAL WARD', 1, 20, 500.00, 'Active'),
(16, 'SPECIAL WARD', 2, 10, 100.00, 'Active'),
(17, 'GENERAL WARD', 2, 10, 500.00, 'Active'),
(18, 'GENERAL WARD', 121, 13, 150.00, 'Active'),
(19, 'GENERAL WARD', 850, 11, 500.00, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentid` int(10) NOT NULL,
  `treatmenttype` varchar(25) NOT NULL,
  `treatment_cost` decimal(10,2) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `treatment_cost`, `note`, `status`) VALUES
(20, 'Blood Test', '179.00', 'test checks for levels of 10 different components of every major cell in your blood', 'Active'),
(21, 'Electrocardiogram', '70.00', 'Records the electrical activity of the heart', 'Active'),
(22, 'Echocardiogram', '1750.00', 'Provides an ultrasound picture that shows the structure of the heart chambers and surrounding areas, and it can show how well the heart is working.', 'Active'),
(23, 'Nuclear cardiology', '530.00', 'Nuclear imaging techniques use radioactive materials to study cardiovascular disorders and diseases in a noninvasive way.', 'Active'),
(24, 'Colposcopy', '318.00', 'procedure to visually examine the cervix as well as the vagina and vulva using a colposcope.', 'Active'),
(25, 'Colporrhaphy', '5518.00', 'surgical procedure in humans that repairs a defect in the wall of the vagina.', 'Active'),
(26, 'Spine Surgery', '97560.00', 'This entails opening the operative site with a long incision so the surgeon can view and access the spinal anatomy', 'Active'),
(27, 'Trauma surgery', '25448.00', 'surgical specialty that utilizes both operative and non-operative management to treat traumatic injuries, typically in an acute setting', 'Active'),
(28, 'Diagnostic Tests', '989.00', 'may include MRI, CT, Bone Scan, Ultra sound, blood tests', 'Active'),
(29, 'Chest XRay', '258.00', ' projection radiograph of the chest used to diagnose conditions affecting the chest, its contents, and nearby structures', 'Active'),
(30, 'Ultrasound of the Abdomen', '560.00', 'noninvasive procedure used to assess the organs and structures within the abdomen', 'Active'),
(31, 'Exercise Stress Test', '198.00', 'This test is good for evaluating chest pain to see if your heart is the cause.', 'Active'),
(32, 'Ultrasound of the Pelvis', '520.00', 'noninvasive diagnostic exam that produces images that are used to assess organs and structures within the female pelvis', 'Active'),
(33, 'Chemotherapy and Radiatio', '4850.00', 'Most common types of cancer treatment. They work by destroying these fast-growing cells.', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_records`
--

CREATE TABLE `treatment_records` (
  `treatment_records_id` int(10) NOT NULL,
  `treatmentid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `treatment_description` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `treatment_date` date NOT NULL,
  `treatment_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment_records`
--

INSERT INTO `treatment_records` (`treatment_records_id`, `treatmentid`, `appointmentid`, `patientid`, `doctorid`, `treatment_description`, `uploads`, `treatment_date`, `treatment_time`, `status`) VALUES
(37, 20, 28, 11, 11, 'Blood Test for viral fever', '1911564826', '2023-12-03', '12:22:00', 'Active'),
(38, 20, 28, 11, 11, 'Blood Test', '191156434', '2023-12-05', '11:00:00', 'Active'),
(52, 26, 28, 11, 11, 'spine surgery', '1292876765', '2023-12-03', '14:02:00', 'Active'),
(53, 23, 30, 13, 13, 'nucelear cardiology', '392578993', '2023-12-03', '23:34:00', 'Active'),
(54, 20, 30, 13, 13, 'blood test', '797619254', '2023-12-03', '11:33:00', 'Active'),
(55, 23, 29, 12, 12, 'cardiology', '999764995', '2023-12-03', '23:03:00', 'Active'),
(56, 20, 35, 18, 18, 'blood test', '1512785646', '2023-12-03', '23:02:00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createddateandtime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `loginname`, `password`, `patientname`, `mobileno`, `email`, `createddateandtime`) VALUES
(1, 'admin', 'admin', 'admin', '', '', '2017-12-14 11:21:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `adminname` (`adminname`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billingid`);

--
-- Indexes for table `billing_records`
--
ALTER TABLE `billing_records`
  ADD PRIMARY KEY (`billingservice_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`);

--
-- Indexes for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  ADD PRIMARY KEY (`doctor_timings_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicineid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescriptionid`);

--
-- Indexes for table `prescription_records`
--
ALTER TABLE `prescription_records`
  ADD PRIMARY KEY (`prescription_record_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomid`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentid`);

--
-- Indexes for table `treatment_records`
--
ALTER TABLE `treatment_records`
  ADD PRIMARY KEY (`treatment_records_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billingid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `billing_records`
--
ALTER TABLE `billing_records`
  MODIFY `billingservice_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  MODIFY `doctor_timings_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `treatment_records`
--
ALTER TABLE `treatment_records`
  MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- QUERY SCENARIO A
--
SELECT p.patientname, a.appointmentdate,
CASE
    WHEN a.appointmentdate > '2023-12-03' THEN 'Upcoming'
    ELSE 'Completed'
END AS appointment_status
FROM patient p
JOIN appointment a ON p.patientid = a.patientid;

--
-- QUERY SCENARIO B
--
SELECT d.doctorname, dep.departmentname, d.consultancy_charge
FROM doctor d
JOIN department dep ON d.departmentid = dep.departmentid
WHERE d.consultancy_charge > (SELECT AVG(consultancy_charge) FROM doctor);

--
-- QUERY SCENARIO C
--
SELECT departmentid, AVG(consultancy_charge) AS average_charge 
FROM doctor 
GROUP BY departmentid 
HAVING AVG(consultancy_charge) > 150;

--
-- QUERY SCENARIO D
--
SELECT dep.departmentname AS department_name, 
COUNT(d.doctorid) AS doctor_count, 
SUM(d.consultancy_charge) AS total_revenue 
FROM department dep 
JOIN doctor d ON dep.departmentid = d.departmentid 
GROUP BY dep.departmentname;

--
-- QUERY SCENARIO E
--
SELECT 
    d.doctorname,
    AVG(DATEDIFF(a.appointmentdate, p.admissiondate)) AS avg_wait_time_days
FROM 
    doctor d
JOIN 
    appointment a ON d.doctorid = a.doctorid
JOIN 
    patient p ON a.patientid = p.patientid
WHERE 
    a.status = 'Approved'
GROUP BY 
    d.doctorid
LIMIT 0, 1000;

--
-- QUERY SCENARIO F
--
SELECT d.doctorid, d.doctorname, 
(SELECT COUNT(*) FROM appointment a WHERE a.doctorid = d.doctorid) AS appointments_count 
FROM doctor d 
ORDER BY appointments_count DESC;

--
-- QUERY SCENARIO G
--
SELECT medicinename, SUM(medicinecost) AS total_cost
FROM medicine
GROUP BY medicinename
ORDER BY total_cost DESC, medicinename ASC;

--
-- QUERY SCENARIO H
--
SELECT 
  SUM(CASE WHEN status = 'Active' THEN 1 ELSE 0 END) AS active_patients,
  SUM(CASE WHEN status = 'Inactive' THEN 1 ELSE 0 END) AS inactive_patients
FROM patient;

--
-- QUERY SCENARIO I
--
SELECT 
    d.doctorname,
    d.experience,
    AVG(t.treatment_cost) AS avg_treatment_cost
FROM 
    doctor d
JOIN 
    appointment a ON d.doctorid = a.doctorid
JOIN 
    treatment_records tr ON a.appointmentid = tr.appointmentid
JOIN 
    treatment t ON tr.treatmentid = t.treatmentid
GROUP BY 
    d.doctorid
ORDER BY 
    d.experience DESC
LIMIT 0, 1000;

--
-- QUERY SCENARIO J
--
SELECT dep.departmentname, SUM(d.consultancy_charge) AS total_earnings
FROM department dep
JOIN doctor d ON dep.departmentid = d.departmentid
JOIN appointment a ON d.doctorid = a.doctorid
WHERE d.experience > 5
GROUP BY dep.departmentname
HAVING COUNT(DISTINCT a.patientid) > 1;

--
-- QUERY SCENARIO K
--
WITH RECURSIVE SequentialAppointments AS (
  SELECT patientid, appointmentid, appointmentdate
  FROM appointment
  WHERE NOT EXISTS (
    SELECT 1
    FROM appointment a2
    WHERE a2.patientid = appointment.patientid
    AND a2.appointmentdate = DATE_SUB(appointment.appointmentdate, INTERVAL 7 DAY)
  )
  UNION ALL
  SELECT a.patientid, a.appointmentid, a.appointmentdate
  FROM appointment a
  JOIN SequentialAppointments sa ON a.patientid = sa.patientid
  WHERE a.appointmentdate = DATE_ADD(sa.appointmentdate, INTERVAL 7 DAY)
)
SELECT patientid, appointmentid, appointmentdate
FROM SequentialAppointments
ORDER BY patientid, appointmentdate;

--
-- QUERY SCENARIO L
--
SELECT 
    DISTINCT p.patientname
FROM 
    patient p
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM appointment a
        WHERE 
            a.patientid = p.patientid AND
            a.appointmentdate > (SELECT MAX(a2.appointmentdate) FROM appointment a2 WHERE a2.patientid = p.patientid) + INTERVAL 6 MONTH
    );

