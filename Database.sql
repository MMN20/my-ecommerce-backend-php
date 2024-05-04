-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 04, 2024 at 09:54 PM
-- Server version: 10.11.7-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u585873192_myecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `addresses_id` int(11) NOT NULL,
  `addresses_userid` int(11) NOT NULL,
  `addresses_name` varchar(100) NOT NULL,
  `addresses_lat` double NOT NULL,
  `addresses_long` double NOT NULL,
  `addresses_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`addresses_id`, `addresses_userid`, `addresses_name`, `addresses_lat`, `addresses_long`, `addresses_desc`) VALUES
(34, 71, 'Home', 33.397318, 44.412067, 'My home');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admins_id` int(11) NOT NULL,
  `admins_username` varchar(255) NOT NULL,
  `admins_email` varchar(255) NOT NULL,
  `admins_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admins_id`, `admins_username`, `admins_email`, `admins_password`) VALUES
(2, 'Mustafa', 'toofi.taaji@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brands_id` int(11) NOT NULL,
  `brands_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brands_id`, `brands_name`) VALUES
(1, 'Redmi'),
(2, 'Lenovo'),
(3, 'Canon'),
(4, 'GRECIILOOKS'),
(5, 'Aliwi');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_itemid` int(11) NOT NULL,
  `cart_userid` int(11) NOT NULL,
  `cart_amount` int(11) NOT NULL,
  `cart_orderid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_itemid`, `cart_userid`, `cart_amount`, `cart_orderid`) VALUES
(109, 4, 71, 2, 60),
(110, 59, 71, 1, 60),
(111, 59, 71, 2, 61),
(112, 59, 71, 1, 62);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(200) NOT NULL,
  `cat_desc` varchar(500) NOT NULL,
  `cat_imageUrl` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_desc`, `cat_imageUrl`) VALUES
(1, 'Computers', 'Explore the World of Computers!', 'computer2.svg'),
(2, 'Phones', 'Unleash the Power in Your Pocket!', 'mobile.svg'),
(3, 'Cameras', 'Capture life\'s moments in stunning detail!\nCapture life\'s moments in stunning detail!', 'camera.svg'),
(4, 'Clothes', 'Dress to Impress', 'clothes.svg'),
(5, 'Books', 'Dive into a World of Stories!', 'book.svg');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupons_id` int(11) NOT NULL,
  `coupons_name` varchar(100) NOT NULL,
  `coupons_amount` int(11) NOT NULL,
  `coupons_active` tinyint(4) NOT NULL DEFAULT 1,
  `coupons_adddate` timestamp NOT NULL DEFAULT current_timestamp(),
  `expire_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupons_id`, `coupons_name`, `coupons_amount`, `coupons_active`, `coupons_adddate`, `expire_date`) VALUES
(4, 'Flutter', 15, 1, '2024-04-29 20:37:27', '2025-04-29 20:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_username` varchar(200) NOT NULL,
  `delivery_email` varchar(200) NOT NULL,
  `delivery_password` varchar(100) NOT NULL,
  `delivery_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `delivery_username`, `delivery_email`, `delivery_password`, `delivery_active`) VALUES
(1, 'Mustafa', 'asd@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 1),
(2, 'aaaa', 'aaaa', '70c881d4a26984ddce795f6f71817c9cf4480e79', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_userid` int(11) NOT NULL,
  `favorite_itemid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_userid`, `favorite_itemid`) VALUES
(90, 71, 3),
(101, 71, 58),
(102, 71, 59),
(104, 71, 65);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(255) NOT NULL,
  `items_desc` varchar(400) NOT NULL,
  `items_price` float NOT NULL,
  `items_qty` int(11) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT 1,
  `discount` float NOT NULL,
  `items_subcat_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_desc`, `items_price`, `items_qty`, `isActive`, `discount`, `items_subcat_id`, `brand_id`) VALUES
(3, 'Lenovo IdeaPad Slim 3 15IAH8', 'askhjdfjlkhsdfjlkhhjklsdfajkhsdfahjklsdfjhk asdlkjfhsadflkj as;dlikifjwoieiflmsad asdlkjfh', 300, 2, 0, 10, 5, 2),
(4, 'Redmi 13C (Stardust Black, 4GB RAM, 128GB Storage)', 'Powered by 4G Mediatek Helio G85 | 90Hz Display | 50MP AI Triple Camera', 500, 13, 1, 0, 3, 1),
(5, 'Canon EOS 90D Digital SLR Camera with 18-135 is USM Lens [Black]', '', 1000, 11, 1, 15, 6, 3),
(6, 'GRECIILOOKS Men Casual Shirt', '', 12, 111, 1, 10, 8, 4),
(7, 'Echoes of Ambition: Dhairya\'s Untold Symphony of Dreams and Departure', '', 7, 7, 1, 0, 12, 5),
(57, 'nnnnn', 'bbbbb', 11, 22, 0, 0, 4, NULL),
(58, 'jjf', 'bdhdh', 55, 15, 0, 0, 2, NULL),
(59, 'Acer predator Helios New 16 gaming laptop - 16\" 165HZ IPS Display ', 'IMMERSIVE VISUAL EXPERIENCE. Plunge into a vast 16-inch display, illuminated with brilliant colors, framed in a 16:10 aspect ratio. The WQXGA boasts a rapid 240Hz refresh rate, and with DCI-P3 100% color gamut, you\'re assured lifelike hues.', 1330, 6, 1, 5, 5, NULL),
(64, 'aaa', 'aaa', 9, 4, 1, 0, 6, NULL),
(65, 'HP Laptop 14 ep0000ne 14\" FHD - Core i3 N305- 8GB RAM - 512GB SSD - Shared -DOS (Natural Silver)', '', 370, 5, 1, 0, 4, NULL),
(66, 'HP Victus Gaming Laptop16t-r000 16.1\" 144Hz - Core i7-13700H - 16GB RAM - 512GB SSD - RTX 4070 8GB - WIN 11 (Mica silver)', '', 1410, 5, 1, 0, 5, NULL),
(67, 'MSI Raider GE78 HX 14VIG-610A 17\" QHD 240Hz Laptop - Core i9-14900HX - 32GB RAM - 2TB SSD - RTX 4090 16GB - WIN 11', '', 4640, 6, 1, 5, 5, NULL),
(68, 'Lenovo Yoga 9 14IRP8 14\" 4K Touchscreen Laptop - Core i7-1360P - 16GB RAM - 1TB SSD - Shared - Win 11 (Storm Grey)', '', 1850, 10, 1, 0, 4, NULL),
(69, 'ASUS Vivobook Laptop X1502ZA-EJ1426 - i5-12500H - 8GB RAM - 512GB SSD - Shared - DOS (Icelight Silver)', '', 465, 10, 1, 0, 4, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsview`
-- (See below for the actual view)
--
CREATE TABLE `itemsview` (
`items_id` int(11)
,`items_name` varchar(255)
,`items_desc` varchar(400)
,`items_price` float
,`items_qty` int(11)
,`isActive` tinyint(4)
,`discount` float
,`items_subcat_id` int(11)
,`brand_id` int(11)
,`subcat_id` int(11)
,`subcat_name` varchar(255)
,`subcat_desc` varchar(500)
,`subcat_imageUrl` varchar(500)
,`cat_id` int(11)
,`id` int(11)
,`imageUrl` varchar(500)
,`item_id` int(11)
,`rating` decimal(36,4)
,`raters` bigint(21)
,`itemsId` int(11)
,`brands_id` int(11)
,`brands_name` varchar(255)
,`priceAfterDiscount` double
);

-- --------------------------------------------------------

--
-- Table structure for table `item_images`
--

CREATE TABLE `item_images` (
  `id` int(11) NOT NULL,
  `imageUrl` varchar(500) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_images`
--

INSERT INTO `item_images` (`id`, `imageUrl`, `item_id`) VALUES
(1, '1.jpg', 3),
(2, '2.jpg', 3),
(3, '3.jpg', 3),
(6, '4.jpg', 4),
(7, '5.jpg', 4),
(8, '6.jpg', 4),
(9, '7.jpg', 5),
(10, '8.jpg', 5),
(11, '9.jpg', 5),
(12, '10.jpg', 6),
(13, '11.jpg', 6),
(14, '12.jpg', 7),
(24, '01bf6f23-56e7-492a-b616-a8de8eea8d4e555556618594293850.jpg661bdc40d36b0', 57),
(25, '2f353bdc-af12-431a-9dd2-7f773a0c989f2107763014644936755.jpg661bdc40d692b', 57),
(26, '1d90dc12-af6e-4380-b728-760865636dbe2236755740097367452.jpg661bdc40d94c6', 57),
(27, 'a2bd2627-d048-47aa-abda-0481c287921f9129501239699583455.jpg661bdd5605402', 58),
(28, '2aa99045-e9ed-4e7f-a5d3-172b57888eaa5676883421863267745.jpg661bdd5608547', 58),
(29, 'a312f23e-ab5d-489e-942b-5ee2878be7803978219178426961441.jpg661bdd560b00d', 58),
(30, 'AcerPredatorHeliosNeo16PHN1616_165HzLaptop_alnabaa.com-08_66b327f8-6569-4a43-801e-bd19c2c178ec_500x.jpg662ce9e8ec09d', 59),
(31, '1000000116.jpg662ce9e8ec799', 59),
(32, '1000000114.jpg662ce9e8ec8fa', 59),
(33, '1000000115.jpg662ce9e8eca16', 59),
(35, '1000000144.jpg662cf7865029f', 64),
(36, '1000000123.png662d02d234515', 65),
(37, '1000000121.png662d02d2347e6', 65),
(38, '1000000122.png662d02d2349c0', 65),
(39, '1000000129.png662d05997b3c8', 66),
(40, '1000000128.png662d05997b672', 66),
(41, '1000000127.png662d05997b8c2', 66),
(42, '1000000135.jpg662d05ec51001', 67),
(43, '1000000133.jpg662d05ec511ae', 67),
(44, '1000000134.jpg662d05ec512be', 67),
(45, '1000000138.jpg662d301fbad7b', 68),
(46, '1000000140.jpg662d301fbb093', 68),
(47, '1000000139.jpg662d301fbb17e', 68),
(48, '1000000142.jpg662d30c9d4c47', 69),
(49, '1000000143.jpg662d30c9d4df7', 69),
(50, '1000000144.jpg662d30c9d4ef0', 69);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notifications_id` int(11) NOT NULL,
  `notifications_title` varchar(255) NOT NULL,
  `notifications_body` varchar(500) NOT NULL,
  `notifications_userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notifications_id`, `notifications_title`, `notifications_body`, `notifications_userid`) VALUES
(1, 'Order 32 Update', 'Your order has been accepted!', 71),
(5, 'Order 33 Update', 'Your order has been accepted!', 71),
(15, 'Order 40 Update', 'Your order has been accepted!', 71),
(28, 'Order 60 Update', 'Your order has been accepted!', 71);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_usersid` int(11) NOT NULL,
  `orders_deliveryid` int(11) DEFAULT NULL,
  `orders_statusid` int(11) NOT NULL DEFAULT 1,
  `orders_addressid` int(11) DEFAULT NULL,
  `orders_typeid` int(11) NOT NULL,
  `orders_deliveryprice` float NOT NULL,
  `orders_couponid` int(11) DEFAULT NULL,
  `orders_rating` int(11) DEFAULT NULL,
  `orders_ratingnote` varchar(500) DEFAULT NULL,
  `orders_paymentmethodid` int(11) NOT NULL,
  `orders_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `fullPrice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_usersid`, `orders_deliveryid`, `orders_statusid`, `orders_addressid`, `orders_typeid`, `orders_deliveryprice`, `orders_couponid`, `orders_rating`, `orders_ratingnote`, `orders_paymentmethodid`, `orders_datetime`, `fullPrice`) VALUES
(60, 71, 1, 4, 34, 1, 5, 4, NULL, NULL, 1, '2024-04-29 20:39:04', 2263.5),
(61, 71, NULL, 1, 34, 1, 5, NULL, NULL, NULL, 1, '2024-04-30 19:11:55', 2527),
(62, 71, NULL, 1, 34, 1, 5, NULL, NULL, NULL, 1, '2024-04-30 19:13:32', 1263.5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`orders_id` int(11)
,`orders_usersid` int(11)
,`orders_deliveryid` int(11)
,`orders_statusid` int(11)
,`orders_addressid` int(11)
,`orders_typeid` int(11)
,`orders_deliveryprice` float
,`orders_couponid` int(11)
,`orders_rating` int(11)
,`orders_ratingnote` varchar(500)
,`orders_paymentmethodid` int(11)
,`orders_datetime` timestamp
,`fullPrice` float
,`order_status_name` varchar(100)
,`addresses_name` varchar(100)
,`orders_type_name` varchar(100)
,`isUsedCoupon` int(1)
,`payment_methods_name` varchar(100)
,`priceAfterCoupon` double
);

-- --------------------------------------------------------

--
-- Table structure for table `orders_type`
--

CREATE TABLE `orders_type` (
  `orders_type_id` int(11) NOT NULL,
  `orders_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_type`
--

INSERT INTO `orders_type` (`orders_type_id`, `orders_type_name`) VALUES
(1, 'Delivery'),
(2, 'Receive');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL,
  `order_status_name` varchar(100) NOT NULL,
  `order_status_desc` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `order_status_name`, `order_status_desc`) VALUES
(1, 'Pending', 'The admin didn\'t accept it yet'),
(2, 'Accepted', 'The admin accepted the order '),
(3, 'Preparing', 'The order is being prepared'),
(4, 'On the way', 'The delivery took the order and it\'s on the way'),
(5, 'Delivered', 'The order has been delivered and the customer took it'),
(6, 'Rejected', 'The admin rejected the order for some reason');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `payment_methods_id` int(11) NOT NULL,
  `payment_methods_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`payment_methods_id`, `payment_methods_name`) VALUES
(1, 'Credit card'),
(2, 'On delivery');

-- --------------------------------------------------------

--
-- Table structure for table `Promotions`
--

CREATE TABLE `Promotions` (
  `promotions_id` int(11) NOT NULL,
  `promotions_title` varchar(255) NOT NULL,
  `promotions_body` varchar(255) NOT NULL,
  `promotions_imageUrl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Promotions`
--

INSERT INTO `Promotions` (`promotions_id`, `promotions_title`, `promotions_body`, `promotions_imageUrl`) VALUES
(3, 'Promotion', '', 'd3baf20e-5696-4bca-bd98-7a6bc981f7dd2938586029178052536.jpg66228738dd09e.png');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL,
  `reviews_rating` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `review_comment` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviews_id`, `reviews_rating`, `user_id`, `item_id`, `review_comment`) VALUES
(1, 4, 71, 3, 'asdfffff'),
(2, 4, 72, 3, 'asddd'),
(3, 5, 72, 3, 'Perfect!'),
(4, 3, 72, 3, 'adddddfffffgggghhhh444'),
(72, 3, 71, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `specifications`
--

CREATE TABLE `specifications` (
  `specifications_id` int(11) NOT NULL,
  `specifications_name` varchar(255) NOT NULL,
  `specifications_value` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specifications`
--

INSERT INTO `specifications` (`specifications_id`, `specifications_name`, `specifications_value`, `item_id`) VALUES
(4, 'camera', 'very good camera', 4),
(5, 'case', 'hard case impossible to break', 4),
(6, 'look', 'you will look good in this camera', 5),
(7, 'appearance', 'fat people will look fit', 6),
(8, 'interesting?', 'The most boring book everrr!', 7),
(52, '', 'aaaaa', 57),
(53, '', 'ssss', 57),
(54, '', 'dddd', 57),
(55, '', 'Nokia gook', 58),
(56, '', 'Nokia great ', 58),
(57, '', 'Tabooga', 58),
(62, '', 'spec 1 valueeeee', 3),
(63, '', 'spec 22 valueeeee', 3),
(64, '', 'spec 3 valueeeee', 3),
(65, '', 'spec 4 from update ', 3),
(66, '', 'Intel Core i9-13900HX, 24C (8P + 16E) / 32T, P-core up to 5.4GHz, E-core up to 3.9GHz, 32MB Processor', 59),
(67, '', 'NVIDIA GeForce RTX 4060 8GB Graphics', 59),
(68, '', '16 GB, DDR5 SDRAM', 59),
(69, '', '1TB PCIe NVMe', 59),
(70, '', '40.6 cm (16\") ComfyView (2560 × 1600) NVIDIA G-SYNC 16:10 165 Hz', 59);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `subcat_id` int(11) NOT NULL,
  `subcat_name` varchar(255) NOT NULL,
  `subcat_desc` varchar(500) NOT NULL,
  `subcat_imageUrl` varchar(500) NOT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`subcat_id`, `subcat_name`, `subcat_desc`, `subcat_imageUrl`, `cat_id`) VALUES
(2, 'High end', 'desccc', 'none', 2),
(3, 'Basic', 'aiman desc', 'none', 2),
(4, 'PC', '', 'none', 1),
(5, 'Laptop', '', 'none', 1),
(6, 'Video', '', 'none', 3),
(7, 'Photo', '', 'none', 3),
(8, 'Summer', '', 'none', 4),
(9, 'Winter', '', 'none', 4),
(10, 'Science', '', 'none', 5),
(11, 'History', '', 'none', 5),
(12, 'Religion', '', 'none', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_username` varchar(255) NOT NULL,
  `users_email` varchar(255) NOT NULL,
  `users_password` varchar(255) NOT NULL,
  `users_active` tinyint(4) NOT NULL DEFAULT 1,
  `users_approved` tinyint(4) NOT NULL DEFAULT 0,
  `users_approvecode` mediumint(6) NOT NULL,
  `users_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_username`, `users_email`, `users_password`, `users_active`, `users_approved`, `users_approvecode`, `users_token`) VALUES
(71, 'mustafa', 'toofi.taaji@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 1, 1, 15811, 'fqywSXdaSSusrq6I17EdIC:APA91bGK07RZu1-XDmGINl_JpcCKpibHGOmaWF02GQKviQyWi1-bnbw-6wO2a59kD_lsBkh430Tzwq81iZd2WRjEAWe_g2qCNz8jjq95_rPBxQ36HadUctJA9y1I_QH08xDtcyt4F0rc'),
(72, 'ffggg', 'toofi.taaji@gmail.co', '7c222fb2927d828af22f592134e8932480637c0d', 1, 0, 46488, '');

-- --------------------------------------------------------

--
-- Structure for view `itemsview`
--
DROP TABLE IF EXISTS `itemsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u585873192_mmn2000`@`127.0.0.1` SQL SECURITY DEFINER VIEW `itemsview`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_desc` AS `items_desc`, `items`.`items_price` AS `items_price`, `items`.`items_qty` AS `items_qty`, `items`.`isActive` AS `isActive`, `items`.`discount` AS `discount`, `items`.`items_subcat_id` AS `items_subcat_id`, `items`.`brand_id` AS `brand_id`, `subcategories`.`subcat_id` AS `subcat_id`, `subcategories`.`subcat_name` AS `subcat_name`, `subcategories`.`subcat_desc` AS `subcat_desc`, `subcategories`.`subcat_imageUrl` AS `subcat_imageUrl`, `subcategories`.`cat_id` AS `cat_id`, `item_images`.`id` AS `id`, `item_images`.`imageUrl` AS `imageUrl`, `item_images`.`item_id` AS `item_id`, `rating`.`rating` AS `rating`, `rating`.`raters` AS `raters`, `rating`.`itemsId` AS `itemsId`, `brands`.`brands_id` AS `brands_id`, `brands`.`brands_name` AS `brands_name`, `items`.`items_price`- `items`.`items_price` * (`items`.`discount` / 100) AS `priceAfterDiscount` FROM ((((`items` join `subcategories` on(`items`.`items_subcat_id` = `subcategories`.`subcat_id`)) left join (select `item_images`.`id` AS `id`,`item_images`.`imageUrl` AS `imageUrl`,`item_images`.`item_id` AS `item_id` from `item_images` group by `item_images`.`item_id`) `item_images` on(`items`.`items_id` = `item_images`.`item_id`)) left join (select sum(`reviews`.`reviews_rating`) / count(`reviews`.`reviews_rating`) AS `rating`,count(`reviews`.`reviews_rating`) AS `raters`,`reviews`.`item_id` AS `itemsId` from `reviews` group by `reviews`.`item_id`) `rating` on(`rating`.`itemsId` = `items`.`items_id`)) left join `brands` on(`brands`.`brands_id` = `items`.`brand_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u585873192_mmn2000`@`127.0.0.1` SQL SECURITY DEFINER VIEW `ordersview`  AS   (select `orders`.`orders_id` AS `orders_id`,`orders`.`orders_usersid` AS `orders_usersid`,`orders`.`orders_deliveryid` AS `orders_deliveryid`,`orders`.`orders_statusid` AS `orders_statusid`,`orders`.`orders_addressid` AS `orders_addressid`,`orders`.`orders_typeid` AS `orders_typeid`,`orders`.`orders_deliveryprice` AS `orders_deliveryprice`,`orders`.`orders_couponid` AS `orders_couponid`,`orders`.`orders_rating` AS `orders_rating`,`orders`.`orders_ratingnote` AS `orders_ratingnote`,`orders`.`orders_paymentmethodid` AS `orders_paymentmethodid`,`orders`.`orders_datetime` AS `orders_datetime`,`orders`.`fullPrice` AS `fullPrice`,`order_status`.`order_status_name` AS `order_status_name`,`addresses`.`addresses_name` AS `addresses_name`,`orders_type`.`orders_type_name` AS `orders_type_name`,if(`coupons`.`coupons_id` is null,0,1) AS `isUsedCoupon`,`payment_methods`.`payment_methods_name` AS `payment_methods_name`,`orders`.`fullPrice` - `orders`.`fullPrice` * (`coupons`.`coupons_amount` / 100) AS `priceAfterCoupon` from (((((`orders` join `order_status` on(`order_status`.`order_status_id` = `orders`.`orders_statusid`)) left join `addresses` on(`addresses`.`addresses_id` = `orders`.`orders_addressid`)) join `orders_type` on(`orders_type`.`orders_type_id` = `orders`.`orders_typeid`)) left join (select `coupons`.`coupons_id` AS `coupons_id`,`coupons`.`coupons_amount` AS `coupons_amount` from `coupons`) `coupons` on(`coupons`.`coupons_id` = `orders`.`orders_couponid`)) join `payment_methods` on(`payment_methods`.`payment_methods_id` = `orders`.`orders_paymentmethodid`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`addresses_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admins_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brands_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_itemid` (`cart_itemid`),
  ADD KEY `cart_userid` (`cart_userid`),
  ADD KEY `cart_ibfk_3` (`cart_orderid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupons_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_itemid` (`favorite_itemid`),
  ADD KEY `favorite_userid` (`favorite_userid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_ibfk_2` (`brand_id`),
  ADD KEY `items_ibfk_3` (`items_subcat_id`);

--
-- Indexes for table `item_images`
--
ALTER TABLE `item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notifications_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`),
  ADD KEY `orders_deliveryid` (`orders_deliveryid`),
  ADD KEY `orders_statusid` (`orders_statusid`),
  ADD KEY `orders_addressid` (`orders_addressid`),
  ADD KEY `orders_typeid` (`orders_typeid`),
  ADD KEY `orders_couponid` (`orders_couponid`),
  ADD KEY `orders_paymentmethodid` (`orders_paymentmethodid`),
  ADD KEY `orders_usersid` (`orders_usersid`);

--
-- Indexes for table `orders_type`
--
ALTER TABLE `orders_type`
  ADD PRIMARY KEY (`orders_type_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`order_status_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`payment_methods_id`);

--
-- Indexes for table `Promotions`
--
ALTER TABLE `Promotions`
  ADD PRIMARY KEY (`promotions_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviews_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `specifications`
--
ALTER TABLE `specifications`
  ADD PRIMARY KEY (`specifications_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`subcat_id`),
  ADD KEY `subcategories_ibfk_1` (`cat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `addresses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admins_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brands_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupons_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `item_images`
--
ALTER TABLE `item_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notifications_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `orders_type`
--
ALTER TABLE `orders_type`
  MODIFY `orders_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `payment_methods_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Promotions`
--
ALTER TABLE `Promotions`
  MODIFY `promotions_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `specifications`
--
ALTER TABLE `specifications`
  MODIFY `specifications_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `subcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_itemid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_userid`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`cart_orderid`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_itemid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_userid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brands_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_3` FOREIGN KEY (`items_subcat_id`) REFERENCES `subcategories` (`subcat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_images`
--
ALTER TABLE `item_images`
  ADD CONSTRAINT `item_images_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orders_deliveryid`) REFERENCES `delivery` (`delivery_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`orders_statusid`) REFERENCES `order_status` (`order_status_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`orders_addressid`) REFERENCES `addresses` (`addresses_id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`orders_typeid`) REFERENCES `orders_type` (`orders_type_id`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`orders_couponid`) REFERENCES `coupons` (`coupons_id`),
  ADD CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`orders_paymentmethodid`) REFERENCES `payment_methods` (`payment_methods_id`),
  ADD CONSTRAINT `orders_ibfk_7` FOREIGN KEY (`orders_usersid`) REFERENCES `users` (`users_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `specifications`
--
ALTER TABLE `specifications`
  ADD CONSTRAINT `specifications_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
