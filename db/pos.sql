-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 04, 2019 at 12:27 AM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 7.2.16-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES
(6, 'c6', 'food product', 'f0560aa9206e3ce8bd62b8365834417d.jpg', 0, 'food-product', 'Products related to food'),
(7, 'c7', 'fast food', 'baad526e80057e1f91aacd2ce3241dfe.jpg', 6, 'fast-food', 'Products related to food'),
(8, 'c8', 'Burger', '77c01abbef90986903e95b76f07bfbc0.jpg', 6, 'burger', 'Products related to food'),
(9, 'a1', ' Double RL Ranch Burger', 'e5199ea93ac8b069a3f2d1a0f33c90bd.jpg', 6, 'double-rl-ranch-burger', 'Products related to food'),
(10, 'a3', 'Romesco Pasta', 'd2da301af8b1b13ba91dacd8d3456235.jpg', 6, 'romesco-pasta', 'Products related to food'),
(11, 'a6', 'Mutton Karahi', '8848a6e794d0e0ccfbce313d97003478.jpg', 6, 'mutton-karahi', 'Products related to foods'),
(12, 'a2', 'Chicken Karahi', 'cbe167ecde013ae03c5101c08da6040c.jpg', 6, 'chicken-karahi', 'Products related to food'),
(13, 'Spare parts', 'Spare parts', 'c5a3a31f2b4aed5975ecd5fa29a586db.jpeg', 0, 'spare-parts', 'Spare Parts');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Dubai', 'Dubai', '87327', 'UAE', '0123456789', 'customer@impulsiontechnologies.com', '7654', '7654', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Dubai', 'Dubai', '87327', 'UAE', '0123456789', 'supplier@impulsiontechnologies.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Izhar Ul Haq', 'Test Biller', '5555', 'Biller adddress', 'Dubai', '', '87327', 'UAE', '012345678', 'izhar@impulsiontechnologies.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL, NULL),
(4, 3, 'customer', 1, 'General', 'Shamim', 'Eatogram', '', 'Satwa opposite to Fakhree Center', 'Dubai', 'Dubai', '', 'United Arab Emirates', '0509148827', 'contact@eatogram.com', '1122334455', '6767', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default', ''),
(5, 4, 'supplier', NULL, NULL, 'Rimsa', 'Rimsa', '', 'Office sm1- 11 Old arab Bank Dubai', 'Dubai', 'Dubai', '87327', 'United Arab Emirates', '0509223344', 'rimsa@rimsa.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(1, '2019-03-19', 1, 1, 1, 1, '2.0000', '3000.0000', '3300.0000', '5000.0000', '5500.0000', '98.0000', 1, 0, NULL),
(2, '2019-03-20', 1, 2, 2, 1, '1.0000', '3000.0000', '3300.0000', '5000.0000', '5500.0000', '97.0000', 1, 0, NULL),
(3, '2019-03-20', 1, 3, 2, 1, '1.0000', '3000.0000', '3300.0000', '5000.0000', '5500.0000', '97.0000', 1, 0, NULL),
(4, '2019-03-23', 1, 4, 3, 1, '1.0000', '3000.0000', '3300.0000', '50.0000', '55.0000', '95.0000', 1, 0, NULL),
(5, '2019-03-23', 1, 5, 3, 1, '1.0000', '3000.0000', '3300.0000', '50.0000', '55.0000', '95.0000', 1, 0, NULL),
(6, '2019-03-23', 1, 6, 4, 1, '1.0000', '3000.0000', '3300.0000', '50.0000', '55.0000', '93.0000', 1, 0, NULL),
(7, '2019-03-23', 1, 7, 5, 1, '1.0000', '3000.0000', '3300.0000', '50.0000', '55.0000', '92.0000', 1, 0, NULL),
(8, '2019-03-23', 1, 8, 6, 1, '1.0000', '3000.0000', '3300.0000', '50.0000', '55.0000', '91.0000', 1, 0, NULL),
(9, '2019-04-01', 1, 9, 7, 1, '1.0000', '3000.0000', '3300.0000', '50.0000', '55.0000', '90.0000', 1, 0, NULL),
(10, '2019-04-23', 6, 10, 8, 6, '1.0000', '200.0000', '200.0000', '295.0000', '309.7500', '99.0000', 1, 0, NULL),
(11, '2019-04-24', 1, 11, 9, 1, '6.0000', '3000.0000', '3300.0000', '50.0000', '52.5000', '84.0000', 1, 0, NULL),
(12, '2019-04-24', 1, 12, 10, 1, '1.0000', '3000.0000', '3300.0000', '50.0000', '52.5000', '83.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0, NULL),
(2, 'EUR', 'EURO', '0.7340', 0, NULL),
(3, 'AED', 'AED', '3.6700', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_login_attempts`
--

INSERT INTO `sma_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(1, 0x3132372e302e302e31, 'admin', 1556879506),
(2, 0x3132372e302e302e31, 'admin', 1556879513),
(3, 0x3132372e302e302e31, 'owner', 1556879559),
(4, 0x3132372e302e302e31, 'owner', 1556879626),
(5, 0x3132372e302e302e31, 'owner', 1556879747);

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Impulsion Technologies  Point Of Sale ', '2014-08-15 06:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 2, 2, 2, 1, 10, 1, 11, 1, 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(1, '2019-03-19 10:54:19', 1, NULL, NULL, 'IPAY2019/03/0001', NULL, 'cash', '', '', '', '', '', '', '11000.0000', NULL, 1, NULL, 'received', '', '15000.0000', '4000.0000', NULL),
(2, '2019-03-20 21:43:19', 2, NULL, NULL, 'IPAY2019/03/0002', NULL, 'cash', '', '', '', '', '', '', '11000.0000', NULL, 1, NULL, 'received', '', '11000.0000', '0.0000', NULL),
(3, '2019-03-23 10:32:14', 3, NULL, NULL, 'IPAY2019/03/0003', NULL, 'cash', '', '', '', '', '', '', '110.0000', NULL, 1, NULL, 'received', '', '110.0000', '0.0000', NULL),
(4, '2019-03-23 10:36:33', 4, NULL, NULL, 'IPAY2019/03/0004', NULL, 'cash', '', '', '', '', '', '', '55.0000', NULL, 1, NULL, 'received', '', '55.0000', '0.0000', NULL),
(5, '2019-03-23 10:47:29', 5, NULL, NULL, 'IPAY2019/03/0005', NULL, 'cash', '', '', '', '', '', '', '55.0000', NULL, 2, NULL, 'received', '', '55.0000', '0.0000', NULL),
(6, '2019-03-23 13:03:09', 6, NULL, NULL, 'IPAY2019/03/0006', NULL, 'cash', '', '', '', '', '', '', '55.0000', NULL, 1, NULL, 'received', '', '55.0000', '0.0000', NULL),
(7, '2019-04-01 21:34:01', 7, NULL, NULL, 'IPAY2019/04/0007', NULL, 'cash', '', '', '', '', '', '', '55.0000', NULL, 1, NULL, 'received', '', '55.0000', '0.0000', NULL),
(8, '2019-04-23 13:37:09', 8, NULL, NULL, 'IPAY2019/04/0008', NULL, 'cash', '', '', '', '', '', '', '309.7500', NULL, 1, NULL, 'received', '', '1000.0000', '690.2500', NULL),
(9, '2019-04-24 18:37:41', 9, NULL, NULL, 'IPAY2019/04/0009', NULL, 'cash', '', '', '', '', '', '', '315.0000', NULL, 1, NULL, 'received', '', '500.0000', '185.0000', NULL),
(10, '2019-04-24 18:41:00', 10, NULL, NULL, 'IPAY2019/04/0010', NULL, 'Cheque', '12345', '', '', '', '', 'Visa', '20.0000', NULL, 1, NULL, 'received', '', '0.0000', '0.0000', NULL),
(11, '2019-04-24 18:55:00', NULL, NULL, 1, 'POP2019/04/0001', NULL, 'Cheque', '11223344565676', '', '', '', '', 'Visa', '6300.0000', NULL, 1, NULL, 'sent', '', '0.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `returns-index` tinyint(1) DEFAULT '0',
  `returns-add` tinyint(1) DEFAULT '0',
  `returns-edit` tinyint(1) DEFAULT '0',
  `returns-delete` tinyint(1) DEFAULT '0',
  `returns-email` tinyint(1) DEFAULT '0',
  `returns-pdf` tinyint(1) DEFAULT '0',
  `reports-tax` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2019-03-19 10:49:09', 1, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2019-03-23 10:47:05', 2, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.13',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 13, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', NULL, 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, NULL, 0, 'default', 1, 0, 0, 0, 42, '223355', 'purchase_code', 'envato_username', '3.4.13', 0, 0, 0, '', 1, NULL, 'null', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(1, '36711205', 'Burger11', 1, '30.0000', '50.0000', '10.0000', '43e22926c36233f72b7bcc9f4c8e4c12.jpg', 6, NULL, '', '', '', '', '', '', '83.0000', 2, 1, '<ul><li>Processor Speed (GHz) : 2.3GHz</li><li>Model Number : Dell Inspiron 5559</li><li>Processor Type : Core i5 (6th Generation)</li><li>USB : USB 3.0</li><li>Brand : Dell</li><li>Laptop Family : Laptop</li><li>Video Controller Manufacturer : Intel</li><li>Graphics Card Capacity : Shared - Built in</li><li>Memory Card Reader : Yes</li><li>Keyboard Languages : English</li><li>Touch screen : No</li><li>Usage : Business</li><li>Memory Technology : DDR3L</li><li>Screen Size : 14 - 14.9 Inch</li><li>Display Size (Inch) : ...</li></ul>', NULL, 'code128', '', '<p>Processor Speed (GHz) : 2.3GHz</p><ul>\r\n<li>Model Number : Dell Inspiron 5559</li><li>Processor Type : Core i5 (6th Generation)</li><li>USB : USB 3.0</li><li>Brand : Dell</li><li>Laptop Family : Laptop</li><li>Video Controller Manufacturer : Intel</li><li>Graphics Card Capacity : Shared - Built in</li><li>Memory Card Reader : Yes</li><li>Keyboard Languages : English</li><li>Touch screen : No</li><li>Usage : Business</li><li>Memory Technology : DDR3L</li><li>Screen Size : 14 - 14.9 Inch</li><li>Display Size (Inch) : ...</li></ul>', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'burger11', 1, '1.0000', NULL, 0, 0, '', 0),
(2, '73787473', 'ABD Dress', 1, '1500.0000', '2000.0000', '10.0000', '874ab679ab198e7ee9cccfa63323e267.jpg', 1, 4, '', '', '', '', '', '', '100.0000', 2, 1, '<p>asdfasdfdsafdsf</p>', NULL, 'code128', '', '<p>asdfdsafdsaf</p>', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'abd-dress', 1, '0.0000', NULL, 0, 0, '', 0),
(3, 'c3', ' Sportswear', 1, '2000.0000', '2600.0000', '12.0000', '1fd7662c74a50366252fc1e1e9a34564.jpg', 1, 4, '', '', '', '', '', '', '121.0000', 2, 1, '<p>sports dresses for ladies</p>', NULL, 'code128', '', '<p>sport dresses for ladies</p>', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'sportswear', NULL, '0.0000', NULL, 0, 0, '', 0),
(4, 'c5', 'Sandals', 1, '2500.0000', '3100.0000', '20.0000', 'a63f17cb4f8bf9b3dadf48a67e3b0d36.jpg', 1, 5, '', '', '', '', '', '', '150.0000', 2, 1, '<p>Sandals</p>', NULL, 'code128', '', '<p>Sandals</p>', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'sandals', NULL, '0.0000', NULL, 0, 0, '', 0),
(5, 'c4', 'Tops', 1, '50.0000', '75.0000', '10.0000', 'af69ce8fc75149399af93dc2504cdf5c.jpg', 1, 4, '', '', '', '', '', '', '76.0000', 2, 1, '<p>Tops</p>', NULL, 'code128', '', '<p>Tops</p>', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'tops', NULL, '0.0000', NULL, 0, 0, '', 0),
(6, '35299932', 'Car brake', 1, '200.0000', '300.0000', '0.0000', '61e6c682e106fc59c8a5ab2eb1d38c8f.jpg', 13, NULL, '', '', '', '', '', '', '129.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'car-brake', NULL, '0.0000', NULL, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(1, 1, '677e4c68f4135c561b385ac2a3b25016.jpg'),
(2, 2, '1c651a95e349055f1eb17404debc4dfa.jpg'),
(3, 3, '9c6d945d32fe103ddb0a4d0d6e928182.jpg'),
(4, 3, '4a4944428c31627efdaeaa7cc1f00482.jpg'),
(5, 4, '270e7f4c90b42d78ec98d87acb2df8d6.jpg'),
(6, 4, 'ed0efde8ca0e5dd69aac7850af0b2913.jpg'),
(7, 4, '4e3e7683f35fe2a07e641198f4aa27f7.jpg'),
(8, 4, '197d1d0b48849a9720f6c8f6fec74220.jpg'),
(9, 5, 'e1667e51fd3f611b43de51ee55d79324.jpg'),
(10, 5, '0d587287efd68294575f273aeb694a48.jpg'),
(11, 5, 'ad5d75d51181a9f1bc8cb626520598e4.jpg'),
(12, 1, 'bd085a4b586dceead429ba22d34b8e8d.jpg'),
(13, 6, '996f6bb342111573b9057162e530854e.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_promos`
--

CREATE TABLE `sma_promos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product2buy` int(11) NOT NULL,
  `product2get` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`) VALUES
(1, 'PO2019/04/0001', '2019-04-24 18:54:00', 5, 'Rimsa', 1, '', '6000.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 2, '300.0000', '300.0000', '0.0000', '6300.0000', '6300.0000', 'received', 'paid', 1, NULL, NULL, NULL, 30, '2019-05-24', NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, NULL, NULL, 1, '36711205', 'Dell Laptop', NULL, '3000.0000', '100.0000', 1, '30000.0000', 2, '10.0000%', NULL, NULL, NULL, '330000.0000', '83.0000', '2019-03-19', 'received', '3300.0000', '3300.0000', '100.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(2, NULL, NULL, 2, '73787473', 'ABD Dress', NULL, '1500.0000', '100.0000', 1, '15000.0000', 2, '10.0000%', NULL, NULL, NULL, '165000.0000', '100.0000', '2019-03-19', 'received', '1650.0000', '1650.0000', '100.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(3, NULL, NULL, 3, 'c3', ' Sportswear', NULL, '2000.0000', '121.0000', 1, '24200.0000', 2, '10.0000%', NULL, NULL, NULL, '266200.0000', '121.0000', '2019-03-19', 'received', '2200.0000', '2200.0000', '121.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(4, NULL, NULL, 4, 'c5', 'Sandals', NULL, '2500.0000', '150.0000', 1, '37500.0000', 2, '10.0000%', NULL, NULL, NULL, '412500.0000', '150.0000', '2019-03-19', 'received', '2750.0000', '2750.0000', '150.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(5, NULL, NULL, 5, 'c4', 'Tops', NULL, '50.0000', '76.0000', 1, '380.0000', 2, '10.0000%', NULL, NULL, NULL, '4180.0000', '76.0000', '2019-03-19', 'received', '55.0000', '55.0000', '76.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(6, NULL, NULL, 6, '35299932', 'Car brake', NULL, '200.0000', '100.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '20000.0000', '99.0000', '2019-04-23', 'received', '200.0000', '200.0000', '100.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(7, 1, NULL, 6, '35299932', 'Car brake', NULL, '200.0000', '30.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '6000.0000', '30.0000', '2019-04-24', 'received', '200.0000', '200.0000', '30.0000', NULL, NULL, 1, 'Pieace', '30.0000', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `s11` varchar(50) DEFAULT NULL,
  `s12` varchar(50) DEFAULT NULL,
  `s13` varchar(50) DEFAULT NULL,
  `s14` varchar(50) DEFAULT NULL,
  `s15` varchar(50) DEFAULT NULL,
  `s16` varchar(50) DEFAULT NULL,
  `s17` varchar(50) DEFAULT NULL,
  `s18` varchar(50) DEFAULT NULL,
  `s19` varchar(50) DEFAULT NULL,
  `s20` varchar(50) DEFAULT NULL,
  `s21` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_quotes`
--

INSERT INTO `sma_quotes` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `warehouse_id`, `biller_id`, `biller`, `note`, `internal_note`, `total`, `product_discount`, `order_discount`, `order_discount_id`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `supplier_id`, `supplier`, `hash`, `cgst`, `sgst`, `igst`, `s11`, `s12`, `s13`, `s14`, `s15`, `s16`, `s17`, `s18`, `s19`, `s20`, `s21`) VALUES
(1, '2019-04-24 18:39:00', 'QUOTE2019/04/0001', 1, 'Walk-in Customer', 1, 3, 'Test Biller', '', NULL, '50.0000', '0.0000', '0.0000', '', '0.0000', '2.5000', 2, '2.6250', '5.1250', '0.0000', '55.1250', 'completed', 1, NULL, NULL, NULL, 0, NULL, 'b7b7abdd536e8e123fdc2812b11c3c911a5f73a772781a2102fd596f26db62d2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2019-05-03 16:32:00', '12345', 1, 'Walk-in Customer', 1, 3, 'Test Biller', '&lt;p&gt;cdc&lt;&sol;p&gt;', NULL, '4000.0000', '0.0000', '12.0000', '12', '12.0000', '200.0000', 2, '209.4000', '409.4000', '123.0000', '4520.4000', 'sent', 1, 1, '2019-05-03 15:16:06', '759222e257f81d01d105372e94e905b3.png', 2, 'Supplier Company Name', 'd311985e55a44c2c78f43e25791b6ca2931cce1fb006b4d34b4a7ef14ad40758', NULL, NULL, NULL, '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '12');

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_quote_items`
--

INSERT INTO `sma_quote_items` (`id`, `quote_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, 1, 1, '36711205', 'Burger11', 'standard', NULL, '50.0000', '52.5000', '1.0000', 1, '2.5000', 2, '5%', '0', '0.0000', '52.5000', NULL, '50.0000', 1, 'Pieace', '1.0000', NULL, NULL, NULL, NULL),
(4, 2, 2, '73787473', 'ABD Dress', 'standard', 0, '2000.0000', '2100.0000', '1.0000', 1, '100.0000', 2, '5%', '0', '0.0000', '2100.0000', NULL, '2000.0000', 1, 'Pieace', '1.0000', NULL, NULL, NULL, NULL),
(5, 2, 2, '73787473', 'ABD Dress', 'standard', 0, '2000.0000', '2100.0000', '1.0000', 1, '100.0000', 2, '5%', '0', '0.0000', '2100.0000', NULL, '2000.0000', 1, 'Pieace', '1.0000', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`, `manual_payment`, `cgst`, `sgst`, `igst`, `payment_method`) VALUES
(1, '2019-03-19 10:54:19', 'SALE/POS2019/03/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '10000.0000', '0.0000', '', '0.0000', '0.0000', '1000.0000', 1, '0.0000', '1000.0000', '0.0000', '11000.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 1, '11000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '25796891c273c76064c3afada4358a3c33612a6f3d0bcba29d0d6995e12ce0be', NULL, NULL, NULL, NULL, NULL),
(2, '2019-03-20 21:43:19', 'SALE/POS2019/03/0002', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '10000.0000', '0.0000', '', '0.0000', '0.0000', '1000.0000', 1, '0.0000', '1000.0000', '0.0000', '11000.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 1, '11000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '8cab0cb365f5c4d5d489a430c821252d40aaf247f9119bc945629c3e4a5f8b8b', NULL, NULL, NULL, NULL, NULL),
(3, '2019-03-23 10:32:14', 'SALE/POS2019/03/0003', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '100.0000', '0.0000', '', '0.0000', '0.0000', '10.0000', 1, '0.0000', '10.0000', '0.0000', '110.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 1, '110.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '5f3e1b4dfbcb5220f699baa1cee29a3d0ce55a01c7bd0c765ea904613d40c3d7', NULL, NULL, NULL, NULL, NULL),
(4, '2019-03-23 10:36:33', 'SALE/POS2019/03/0004', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '50.0000', '0.0000', '', '0.0000', '0.0000', '5.0000', 1, '0.0000', '5.0000', '0.0000', '55.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '55.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 'c4ab5a27ab9a2e879ce9bde8df3f2ed5b937c874ee92b1ca2a647067197d574d', NULL, NULL, NULL, NULL, NULL),
(5, '2019-03-23 10:47:29', 'SALE/POS2019/03/0005', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '50.0000', '0.0000', '', '0.0000', '0.0000', '5.0000', 1, '0.0000', '5.0000', '0.0000', '55.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '55.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '74b1ac1e21936c4578ab9dd3476235a828423db47c6a0897a1254140f8bd85b0', NULL, NULL, NULL, NULL, NULL),
(6, '2019-03-23 13:03:09', 'SALE/POS2019/03/0006', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '\r&NewLine;', '50.0000', '0.0000', '', '0.0000', '0.0000', '5.0000', 1, '0.0000', '5.0000', '0.0000', '55.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '55.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '7c4a7df0e9dd3fd70836976347fc8eb3778395167f130c19c7b9cd6e9af5d3fb', NULL, NULL, NULL, NULL, NULL),
(7, '2019-04-01 21:34:01', 'SALE/POS2019/04/0007', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '50.0000', '0.0000', '', '0.0000', '0.0000', '5.0000', 1, '0.0000', '5.0000', '0.0000', '55.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '55.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 'c636d42bad0f04435db21cdf2177a476a03cc1a44da04fc677210609616e518b', NULL, NULL, NULL, NULL, NULL),
(8, '2019-04-23 13:37:09', 'SALE/POS2019/04/0008', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '295.0000', '5.0000', '', '5.0000', '0.0000', '14.7500', 1, '0.0000', '14.7500', '0.0000', '309.7500', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '309.7500', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '506161090789e227e5b9ae380b6da6a7e1528f1addfda6f7e95a779ec84863ec', NULL, NULL, NULL, NULL, NULL),
(9, '2019-04-24 18:37:41', 'SALE/POS2019/04/0009', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '300.0000', '0.0000', '', '0.0000', '0.0000', '15.0000', 1, '0.0000', '15.0000', '0.0000', '315.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 6, 1, '315.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '833e661c2e3acc1da070f966aea43cda64878b694aa30e95f8c3461f720dd772', NULL, NULL, NULL, NULL, NULL),
(10, '2019-04-24 18:41:00', 'SALE2019/04/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '50.0000', '0.0000', '', '0.0000', '0.0000', '2.5000', 2, '2.6250', '5.1250', '0.0000', '55.1250', 'completed', 'due', 0, NULL, 1, NULL, NULL, 1, 0, '20.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL, NULL, 0, 0, NULL, NULL, '2a6e7d1c3546ae0e5732e523983791d9874bff2ee38db57ef1ff59afff6172eb', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, 1, 1, '36711205', 'Dell Laptop', 'standard', NULL, '5000.0000', '5500.0000', '2.0000', 1, '1000.0000', 2, '10%', '0', '0.0000', '11000.0000', '', '5000.0000', NULL, 1, 'Pieace', '2.0000', '', NULL, NULL, NULL, NULL),
(2, 2, 1, '36711205', 'Dell Laptop', 'standard', NULL, '5000.0000', '5500.0000', '1.0000', 1, '500.0000', 2, '10%', '0', '0.0000', '5500.0000', '', '5000.0000', NULL, 1, 'Pieace', '1.0000', '', NULL, NULL, NULL, NULL),
(3, 2, 1, '36711205', 'Dell Laptop', 'standard', NULL, '5000.0000', '5500.0000', '1.0000', 1, '500.0000', 2, '10%', '0', '0.0000', '5500.0000', '', '5000.0000', NULL, 1, 'Pieace', '1.0000', '', NULL, NULL, NULL, NULL),
(4, 3, 1, '36711205', 'Burger11', 'standard', NULL, '50.0000', '55.0000', '1.0000', 1, '5.0000', 2, '10%', '0', '0.0000', '55.0000', '', '50.0000', NULL, 1, 'Pieace', '1.0000', '', NULL, NULL, NULL, NULL),
(5, 3, 1, '36711205', 'Burger11', 'standard', NULL, '50.0000', '55.0000', '1.0000', 1, '5.0000', 2, '10%', '0', '0.0000', '55.0000', '', '50.0000', NULL, 1, 'Pieace', '1.0000', '', NULL, NULL, NULL, NULL),
(6, 4, 1, '36711205', 'Burger11', 'standard', NULL, '50.0000', '55.0000', '1.0000', 1, '5.0000', 2, '10%', '0', '0.0000', '55.0000', '', '50.0000', NULL, 1, 'Pieace', '1.0000', '', NULL, NULL, NULL, NULL),
(7, 5, 1, '36711205', 'Burger11', 'standard', NULL, '50.0000', '55.0000', '1.0000', 1, '5.0000', 2, '10%', '0', '0.0000', '55.0000', '', '50.0000', NULL, 1, 'Pieace', '1.0000', '', NULL, NULL, NULL, NULL),
(8, 6, 1, '36711205', 'Burger11', 'standard', NULL, '50.0000', '55.0000', '1.0000', 1, '5.0000', 2, '10%', '0', '0.0000', '55.0000', '', '50.0000', NULL, 1, 'Pieace', '1.0000', '', NULL, NULL, NULL, NULL),
(9, 7, 1, '36711205', 'Burger11', 'standard', NULL, '50.0000', '55.0000', '1.0000', 1, '5.0000', 2, '10%', '0', '0.0000', '55.0000', '', '50.0000', NULL, 1, 'Pieace', '1.0000', '', NULL, NULL, NULL, NULL),
(10, 8, 6, '35299932', 'Car brake', 'standard', 0, '295.0000', '309.7500', '1.0000', 1, '14.7500', 2, '5%', '5', '5.0000', '309.7500', '', '300.0000', NULL, 1, 'Pieace', '1.0000', '', NULL, NULL, NULL, NULL),
(11, 9, 1, '36711205', 'Burger11', 'standard', NULL, '50.0000', '52.5000', '6.0000', 1, '15.0000', 2, '5%', '0', '0.0000', '315.0000', '', '50.0000', NULL, 1, 'Pieace', '6.0000', '', NULL, NULL, NULL, NULL),
(12, 10, 1, '36711205', 'Burger11', 'standard', NULL, '50.0000', '52.5000', '1.0000', 1, '2.5000', 2, '5%', '0', '0.0000', '52.5000', '', '50.0000', NULL, 1, 'Pieace', '1.0000', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_services`
--

CREATE TABLE `sma_services` (
  `id` int(100) NOT NULL,
  `type_of_services` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `service_charges` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  `cf1` varchar(50) DEFAULT NULL,
  `cf2` varchar(50) DEFAULT NULL,
  `cf3` varchar(50) DEFAULT NULL,
  `cf4` varchar(50) DEFAULT NULL,
  `cf5` varchar(50) DEFAULT NULL,
  `cf6` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sma_services`
--

INSERT INTO `sma_services` (`id`, `type_of_services`, `product`, `service_charges`, `details`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`) VALUES
(2, 'vfbhb', 'b', '12', 'b', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('01mia9hsjnpk0n54knfcjn4i9uar4tuo', '127.0.0.1', 1556634214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363633343231343b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('024udbtjhrlo04nmflc5j2rb2bapcv55', '127.0.0.1', 1556723966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732333936363b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('0466bb6af1ol37totn71p33dai32ttjq', '198.16.70.52', 1556115019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363131353031383b7265717565737465645f706167657c733a353a2261646d696e223b),
('072lou28ljoepb93u86afmodfcls9b1p', '127.0.0.1', 1556909481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393438313b),
('0jk41uq3r5bq8nl2sdlgjr8ss7d5ipp9', '127.0.0.1', 1556908882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930383838323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('0o7gkovpm4eniu075ki7qq5qjuj3sm7f', '94.204.21.197', 1556042826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363034323832363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303035363334223b6c6173745f69707c733a31323a223139382e31362e37342e3433223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363034323739333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b),
('11r63rklncc32lts3t1r6vlevk0edhal', '198.16.74.43', 1556006520, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363030363532303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393936343336223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363030353739373b),
('1959r4nlnhru2ofg70oh5tt74ja1sk7e', '127.0.0.1', 1556766548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363736363534383b7265717565737465645f706167657c733a31343a2261646d696e2f7365727669636573223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363931313635223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1fjfcck22kuk0ltffkped2ocst9hu2of', '198.16.76.27', 1556013276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363031333237363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393936343336223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363031323835383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b),
('1h21qvjh33jq5mq7q3vdbunma6l2ahqf', '127.0.0.1', 1556880911, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838303931313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('1jj78kuss716mpekhsb5i2tgg1642420', '127.0.0.1', 1556721691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732313639313b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('1k1ctrg2g18po3octgfo0fdp8c7qn84q', '127.0.0.1', 1556901837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930313833373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b72656d6f76655f71756c737c733a313a2231223b),
('1lm7i7nkpee9mgo6fnajtpl4ef7jrgcr', '127.0.0.1', 1556902247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930323234373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b72656d6f76655f71756c737c733a313a2231223b),
('1mlgsacgkfdfuqng1tuk3hu5esiunkfs', '127.0.0.1', 1556635686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363633353638363b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('1qe29vjclodgn66l5kfcpdt4it5erqbq', '127.0.0.1', 1556710129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731303132393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('1v8ua0rkk58o1t3tkmdifsu2bv3l7nq4', '127.0.0.1', 1556693061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639333036313b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('271tjane3rgj9k3b941ajtu2qi0vsi57', '127.0.0.1', 1556909515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393531353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('29cr4c32k52p30q4fo7srp96q33nhl7c', '127.0.0.1', 1556730725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733303732353b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('29p1gl4kdjlriga94e1rs87vvu7llieq', '198.16.70.52', 1556118519, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363131383531393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303432353136223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363131363636313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b72656d6f76655f706f736c737c693a313b757365725f637372667c733a32303a2250564b5a496e42626b39526c717058734e544576223b),
('2lp6ovnlpd5k2eqbtk2c328epj0af6lk', '127.0.0.1', 1556795298, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363739353035353b7265717565737465645f706167657c733a31333a2261646d696e2f62696c6c657273223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373737323638223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3ee594iauheb9u9qpnlca4uk3k6io4m1', '127.0.0.1', 1556783574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363738333537343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3f80bkd490vum013e6cd6hg8g3qp76n8', '127.0.0.1', 1556770624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737303632343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3gcq633afiiiamuvo0atvgoaj4fu2qrg', '127.0.0.1', 1556776681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737363638313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3gdvq1h67qhc7dh3cb9sqevuqmnp0slt', '127.0.0.1', 1556622428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632323432383b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('3p23nvv2eliu47ge5beetg6j35842v0u', '127.0.0.1', 1556698963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639383936333b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('3vuaku3ab10if3ni2phiqlccr9g97d3j', '127.0.0.1', 1556897854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363839373835343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('48qgst14rfdthiipnbmsnfral70rfh6e', '127.0.0.1', 1556629828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632393832383b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('4e084dqd23593p4p2cvi43q9klbvh1b5', '127.0.0.1', 1556565305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363536353330353b7265717565737465645f706167657c733a32303a2261646d696e2f70726f64756374732f696e646578223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536313135303232223b6c6173745f69707c733a31323a223139382e31362e37302e3532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4ggqrm04s4icekqlkts74pnvb56cbrvc', '127.0.0.1', 1556778138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737383133383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636383732223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4klg9g4uaah6pag02svcehqvneblgrpa', '127.0.0.1', 1556882804, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838323830343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('50sj9mg9gg3squvr8oq08ovc2c0qb6iq', '127.0.0.1', 1556898287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363839383238373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('53anl553avln03hsr3d3qilh41em7ttt', '127.0.0.1', 1556884087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838343038373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5bkgh3i1e0mgvv60mdccid3d3au0np1i', '127.0.0.1', 1556646737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363634363733373b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('5dkjk25ptm1np0tbt0ih6uvhe1n8bh3b', '94.204.21.197', 1556042994, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363034323939343b),
('5eaaum82mjitq1htepb5krkdh6b9ajkl', '127.0.0.1', 1556909184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393138343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('5kfi589l1bu8tbksqorjajl5pmr28nta', '127.0.0.1', 1556738430, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733383433303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('5pj97oam5ngjjt7hm1thmd0v40vnsuhl', '127.0.0.1', 1556639499, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363633393439393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('60lhgod25ruuq3pdb84n57abrikf5h7b', '198.16.70.52', 1556117054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363131373035343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303432353136223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363131363636313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b72656d6f76655f706f736c737c693a313b),
('65v59fc7pihiul9gd2iaejvk0p84t63r', '127.0.0.1', 1556785490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363738353438313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22767165613350476c70364473465a7948677a786b223b),
('6bulhjrr9oqree99hgpv8mc7hmu6cdqp', '127.0.0.1', 1556731059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733313035393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('6ffptsjepi6bg830o920amofak7anuvs', '127.0.0.1', 1556901983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930313938333b),
('6ggs9040js3nav80uc6m21pgui56lfen', '127.0.0.1', 1556710456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731303435363b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('6mlduebi56afd2im5cpk2qtk0noom7do', '127.0.0.1', 1556720449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732303434393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('6rnc0pmg9llv0jcj0ltmeqcejv679m24', '127.0.0.1', 1556885736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838353733363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6t6cnlv0u3k1nqr3k62np65ngpjpj0j0', '127.0.0.1', 1556653555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363635333337393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('6u7616kjfp1op8gj73ekc1npnpcqh12g', '127.0.0.1', 1556812127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363831323132373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('73bv2ps1nj87ujkfgkdh0fu4crp727df', '127.0.0.1', 1556806845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830363834353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('750u77rrchckvnfs00if9banepfnlsrv', '127.0.0.1', 1556738751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733383735313b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('7a4mrcr8605t597q8fr4vh8nffjefcsi', '127.0.0.1', 1556727976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732373937363b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('7c4r92qpojavpslk39e514hbcpnubh4s', '127.0.0.1', 1556739279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733393237393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('7o03q9gnhgille3b20qqfsshu8jlbb8u', '127.0.0.1', 1556772055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737323035353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7olddr3b9vjet0u5sqq3hqm8kl5d1lsq', '127.0.0.1', 1556733718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733333731383b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('7pavkbjosh3ec3gnokcjt5t0nc6o248q', '127.0.0.1', 1556777963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737373936333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7q3l5hiaq4tqjna8emhnvkutssea29el', '127.0.0.1', 1556766799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363736363739393b7265717565737465645f706167657c733a353a2261646d696e223b),
('7sr9f63boufhok81em73eb7dnbi77dh6', '127.0.0.1', 1556805704, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830353730343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('86ui9ple2q85kjqo01m2isngnut0citn', '127.0.0.1', 1556717125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731373132353b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('88anpsrtkoild6aaqs5l56rgffi531q9', '198.16.74.43', 1556011848, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363031313834383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393936343336223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363030373336333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b),
('8eppekkiac37p3v01i7l1jfs3r83eso2', '198.16.70.52', 1556116685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363131363638353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303432353136223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363131363636313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b72656d6f76655f706f736c737c693a313b),
('8eqpce41t7e1jp2h6uh29f810m7avt6j', '127.0.0.1', 1556779135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737393133353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8j1jn45ia5iarp65d66irkh2iu611538', '127.0.0.1', 1556767441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363736373434313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('962vbpukfthlfgi4serr4qr7a79s0jf5', '127.0.0.1', 1556695099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639353039393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('9fajth78upgpe99gca3ntv3ej6qb4m80', '127.0.0.1', 1556909481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393438313b),
('9jplijnakt82pni0eov1t3r8au7agsvg', '127.0.0.1', 1556779659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737393635393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9lm40oiiau4cllrf3p3r6bb7s0r5vv7v', '127.0.0.1', 1556769622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363736393632323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9tg4p0e51v349io5e8u8m8a6eg2n72rh', '127.0.0.1', 1556694791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639343739313b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('9tuqv1evak8d8pm3vnvm31j8gn9a0dpo', '198.16.76.27', 1556013333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363031333237363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393936343336223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363031333237363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b),
('ad987gl624ptcb44pfhvfbfhsc0mlr6n', '127.0.0.1', 1556649260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363634393236303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('adelpesnfqv2plgaktksun23vsejvd64', '127.0.0.1', 1556770093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737303039333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('anrqeoo9ejcq9alngqavqc2fhm4l8eb3', '198.16.70.52', 1556118637, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363131383531393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303432353136223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363131383633343b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b757365725f637372667c733a32303a2250564b5a496e42626b39526c717058734e544576223b),
('asmqspq145aeq3b3aomgmsiaes8c0sup', '127.0.0.1', 1556720874, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732303837343b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('b4tel8hnskdugov412mfi0th9ica614b', '127.0.0.1', 1556766754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363736363534383b7265717565737465645f706167657c733a31343a2261646d696e2f7365727669636573223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363931313635223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('bc62r58p7jot8kkd9igboh00cevrpval', '127.0.0.1', 1556768255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363736383235353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('bdoovctdb41q0a13chpspu8tteg5paca', '127.0.0.1', 1556720039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732303033393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('be869nal7jrhruatctui85b9n3h0rv3f', '127.0.0.1', 1556696155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639363135353b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('bgphfcrda9i71npaiomtp4kbct3hbgm8', '127.0.0.1', 1556778660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737383636303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('bj7h5m3gnpnvq6n32lakh2efg2rjkjcu', '198.16.70.52', 1556116365, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363131363336353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303432353136223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('bpkd1aqogq34pfgvnnl91f726uv5qsb3', '127.0.0.1', 1556718573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731383537333b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('bsk4usd8dlns3hugupnaoutebd0aatlg', '127.0.0.1', 1556711100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731313130303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('bvf5p6bg1oc86tnshv6ruj2agsgjt40o', '127.0.0.1', 1556886791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838363739313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c298cubi6j5j5kmpmro2nf34amamp3n7', '127.0.0.1', 1556901094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930313039343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('ceiv71nbaaqb7ha38l5oe6f0rgqfnc3b', '127.0.0.1', 1556901983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930313938333b),
('cgljb5kp9cnpt19kjjk3nl7om6js5a19', '127.0.0.1', 1556881219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838313231393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('clvhjepmso686pbnjjglgrkv20mdh0tf', '127.0.0.1', 1556690633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639303633333b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363038303231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ctf8cshfm11haq36m6sna7vdvqqm3iej', '127.0.0.1', 1556909321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393332313b6572726f727c733a3136383a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f706f732e636f6d2f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f7064662f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d996h5hj6jg4vk5dnigkrpd4o93eh79u', '127.0.0.1', 1556887444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838373434343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('dolmdhqpoae4anpujn3l0amigi0fvvcb', '127.0.0.1', 1556711780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731313738303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('e09q0pn5fg85gkqeha4e1lachr1qo9kb', '127.0.0.1', 1556648352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363634383335323b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('e1e2m0kaps68dedrreio09snhrthui0o', '127.0.0.1', 1556807893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830373839333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ea50pl0mjqof4asc3u37le0shfolijld', '127.0.0.1', 1556650219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363635303231393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('egq7r1jn16qf6mri5r9bimqv5erbuslp', '127.0.0.1', 1556712135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731323133353b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('eme2p96ao2pgimskr5dtqkn5h5rp1q2i', '::1', 1556878125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363837383132353b),
('emooklu454v5ra7kh9v13gm9v444qd37', '127.0.0.1', 1556767852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363736373835323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('eni2pb0ckbmr0uba0efvkvlt7ie2jahj', '127.0.0.1', 1556653379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363635333337393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('envk5oqh9bvgmrgghbil100heqipusba', '127.0.0.1', 1556888724, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838383732343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('esdf38stg0d52u22oc9eja169q7pi58p', '127.0.0.1', 1556887092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838373039323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f22hl20oqcn3cjgisq347a2036nogigs', '127.0.0.1', 1556785481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363738353438313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22767165613350476c70364473465a7948677a786b223b),
('fhnu324kluhhg26bhfgh5m67us4qgdnk', '127.0.0.1', 1556807185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830373138353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fi8p9tv0bu8nb8djd5j0o0amn3selgka', '127.0.0.1', 1556909482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393438323b),
('fo5mcg1mac67kq03u1ovaus2olruta6t', '127.0.0.1', 1556639906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363633393930363b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('fp45kolnlnvue56gs09ajh1bnds5abec', '127.0.0.1', 1556728369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732383336393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('fp5cs4b0kke0unbc2vf7avp7lm8ei621', '127.0.0.1', 1556883143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838333134333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ftvkgptl2umbbieca907btb7ahuhubjo', '127.0.0.1', 1556713669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731333636393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('furbj2v6st1vi4l2u60de16q52pl7kvm', '127.0.0.1', 1556745021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363734353032313b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('g37seeg03728i9at79kfg0v0dmebcakk', '127.0.0.1', 1556549238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363534393233383b),
('g5vimiibcde0ns0o180nk91hc51og5ko', '127.0.0.1', 1556806018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830363031383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('g7l25cdhcg3teqfa05ri4fjtntpfd1bn', '127.0.0.1', 1556630811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363633303831313b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('g7ugr8f47mpqgttm10jfaidjq3c4ldo1', '127.0.0.1', 1556702819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363730323831393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('gimgmf9c9dukld0qbhs19tonhsrdsj0h', '127.0.0.1', 1556615189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363631353138393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('gjb8k4rm93t9ojo7guuint2nvqmq5oug', '127.0.0.1', 1556734684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733343638343b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('hfbig9n04g9k6dmke9b7a1fgf7u02v1i', '127.0.0.1', 1556777055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737373035353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('hg2261pjeh220rkuv008ksje3dsud206', '127.0.0.1', 1556719692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731393639323b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('hm83g7f1ijt2525463kpisha8depmmuk', '127.0.0.1', 1556909321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393332313b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('hp1jb2odh5vup0dpb3392r6oae6snj31', '127.0.0.1', 1556901983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930313938333b6572726f727c733a3136383a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f706f732e636f6d2f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f7064662f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('i1bkcb3ol96pbpfkqun890f6a878nsnl', '127.0.0.1', 1556806358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830363335383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('i3p9a4m4dq19ce1cdnmao5c0v5jltq4d', '127.0.0.1', 1556882186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838323138363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('i9iali5cf61c9n8fadfkeakffa29dj9t', '127.0.0.1', 1556727071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732373037313b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('ib39a0egddq2ubv696na3untiv799pdf', '127.0.0.1', 1556886095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838363039353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('icpo7vugkokuk07762mst86mshuoatu7', '127.0.0.1', 1556886429, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838363432393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('iktmiaem4i8j53glnt48a41046l9alm7', '127.0.0.1', 1556881881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838313838313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('iunll2j6ote3gu9rff1jtrdm1v0pao99', '127.0.0.1', 1556564292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363536343239323b7265717565737465645f706167657c733a32303a2261646d696e2f70726f64756374732f696e646578223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536313135303232223b6c6173745f69707c733a31323a223139382e31362e37302e3532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('j70hguc8i7aj3tasuukp3446v7g17qdm', '127.0.0.1', 1556881574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838313537343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jg1l0r6anaept0mtkr0qjclctfkoitgq', '127.0.0.1', 1556901983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930313938333b),
('ji2tlda5h5qgu0j2ihj046bi9npmi7if', '127.0.0.1', 1556897478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363839373437383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('jlkke2b5b3ginbk9v4r18s7v46u48km1', '127.0.0.1', 1556648955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363634383935353b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('jnhspmpsj2c0u3sel21e1qm0v22blo7t', '127.0.0.1', 1556743793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363734333739333b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('jo90l7n8vlje6gsg3e1m911nka89foth', '127.0.0.1', 1556652183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363635323138333b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('ju0nb7n8qcpd1lsvklse9an0687jp781', '127.0.0.1', 1556899580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363839393538303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('k0rkogenle0euom18559sno8mv8s75r5', '127.0.0.1', 1556724682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732343638323b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('k6343263daapi3n1rk4jqj8tdctddf7n', '127.0.0.1', 1556888943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838383732343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('kduhgqi1egpqq075e9ilsp7ee205qqh9', '127.0.0.1', 1556732705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733323730353b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('khl84tvprc931kabtf75dm83gr2mkqdq', '127.0.0.1', 1556740517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363734303531373b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('khq382msaortg9ttic39amf31q7c3clr', '127.0.0.1', 1556718939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731383933393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('klpge1jnin6iud1io3sg4q2l7h97c91g', '127.0.0.1', 1556909481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393438313b7265717565737465645f706167657c733a353a2261646d696e223b),
('l11c5nji91cr90a2q5linqldgp9v5dcb', '198.16.74.43', 1556007155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363030373135353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393936343336223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363030353739373b),
('l3mgokb709lgdfomp6vbh7ek47u1gj60', '127.0.0.1', 1556727383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732373338333b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('l47quu57ts7f6426lpbdelb5g6gnk2fs', '127.0.0.1', 1556807497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830373439373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('lb0tc7th18m6h5m4ovof8ke7vthavih4', '127.0.0.1', 1556884813, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838343831333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('lc0qt1bdimcjcddao8d4pvb4asbmh2kg', '127.0.0.1', 1556738020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733383032303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('ldb4qdbua5bthdu8cbmbc94fa3a60gi9', '127.0.0.1', 1556805047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830353034373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('livlval1e1s3lhkdhv8l0dq2geg7jb8i', '127.0.0.1', 1556639050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363633393035303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('lop729olo61t00oj8e0rdb8mgtcfla4h', '127.0.0.1', 1556614786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363631343738363b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ls82cv28v67hu85chuava8aooom0j2q3', '127.0.0.1', 1556901983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930313938333b7265717565737465645f706167657c733a353a2261646d696e223b),
('lud340o612ov2lhuriaocsr41kcqttme', '127.0.0.1', 1556909321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393332313b7265717565737465645f706167657c733a353a2261646d696e223b),
('lvp3l7is64nhgf8jp40j5000gj4ei1u0', '127.0.0.1', 1556744242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363734343234323b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('m18vpeatk1r4pht706stcp1pr7m953pj', '94.204.21.197', 1555996437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353939363432343b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353534313430303235223b6c6173745f69707c733a31313a2239342e3230342e31332e36223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('m2v01vbu6sdo5f6khjtklodsdpes0eo5', '127.0.0.1', 1556897048, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363839373034383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('m4aqfnge0lf0em969ark6lh3ntn7r1vr', '127.0.0.1', 1556690934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639303933343b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363038303231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('m8mt7nl1cnauauu0smmbg44isaojgq2f', '127.0.0.1', 1556725178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732353137383b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('m9mc482bg0t02lctmagelj9ge8k0i9kd', '127.0.0.1', 1556630444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363633303434343b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('mem3i66dut0rhlgf3mftgh1390qcneij', '127.0.0.1', 1556770941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737303934313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('mg1v93ld5gmmsgnepu2lj26odiv0dlj3', '127.0.0.1', 1556888404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838383430343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('mhqvj7s5i4pc6q3s9bo6jaunvh1o5isa', '127.0.0.1', 1556901432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930313433323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('mi0j2tlk3fm816qe09qbb0nmvqkkfljl', '127.0.0.1', 1556909321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393332313b),
('mj5fmruuhkd1jhi38kqpq68gtaaav9nv', '127.0.0.1', 1556909481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393438313b6572726f727c733a3136383a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f706f732e636f6d2f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f7064662f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('mulfj9574q6k71o8eftouca9i7sc5n2m', '127.0.0.1', 1556805398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830353339383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('n0bej9vqt52tf3vbohd3hkrb6vqmsq24', '127.0.0.1', 1556804706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363830343730363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('n563q6dpnlfn29n1bpiehqj6mpt2rdi7', '127.0.0.1', 1556909321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393332313b),
('nb6gkvk12dnete6vudaee97aaa98na3v', '198.16.70.52', 1556117667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363131373636373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303432353136223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363131363636313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b72656d6f76655f706f736c737c693a313b),
('ndt937fjrq9a6h38u7hc76a9ki4gljeu', '127.0.0.1', 1556734227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733343232373b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('o099lanmae2tdss5n77rbio60bae5jqk', '127.0.0.1', 1556728670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732383637303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('obv16k6g5qvulo6grr72g5dt9mdtjdun', '127.0.0.1', 1556629459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632393435393b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('od6iebbsm9fhdk6qkpt08tuqs4gv8ul3', '127.0.0.1', 1556725580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732353538303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('ona10degucl1aasglcmlm9rpj4d2hc7p', '127.0.0.1', 1556883762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838333736323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('oqu5kav2v7hhlctgd2hem8ffus3vo8o2', '127.0.0.1', 1556776299, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737363239393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('os7mmeqetbd0gor4nv7hh5s6cd9v9l46', '127.0.0.1', 1556742704, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363734323730343b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('ost2ksasmo20svu9op2ca6p24m7rfq39', '127.0.0.1', 1556745343, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363734353334333b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('p7htigrjkofmtvafrchiuvfjht9g7t4b', '127.0.0.1', 1556882711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838323638323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383830303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('pbji19b32er8k75lo5cvp3j1qtjkrhcj', '198.16.76.27', 1556012858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363031323835383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393936343336223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363031323337313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b),
('pkeijhn82117ctb449fn4r68uegocea0', '127.0.0.1', 1556690319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639303331393b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363038303231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('q09lbjcciknb9lennf65qqnqn5i1n3h6', '127.0.0.1', 1556615577, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363631353537373b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('q9n1p85b6hdeddp6jekr1bfsh6v8btfv', '127.0.0.1', 1556726662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732363636323b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('qcrd4m5h91kjr5ifl609937vuu0u12gr', '127.0.0.1', 1556909515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930393531353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('qgff9a7mle7mg8j4v0rsa13q1o4qpg5d', '127.0.0.1', 1556565305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363536353330353b7265717565737465645f706167657c733a32303a2261646d696e2f70726f64756374732f696e646578223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536313135303232223b6c6173745f69707c733a31323a223139382e31362e37302e3532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('qh4rp6ci38u78jjphvjfvrke0aogiiid', '127.0.0.1', 1556778138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737383133383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636383732223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('qipoo86qft33c9hicpr66pfgt2roacnm', '127.0.0.1', 1556549258, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363534393233383b),
('qksoq3ppvqnlmndjgdpu3l9b6j8rl6k0', '127.0.0.1', 1556698616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639383631363b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('qqoqoa40n11rk7a7jgh9m5bvjcmcpaos', '127.0.0.1', 1556703595, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363730333539353b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('r0lgrderk7to3f601url6s8jo3o0c2f3', '127.0.0.1', 1556703133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363730333133333b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('rap5sbvfg43q83g8pjm8unjffo3rert0', '198.16.76.27', 1556012229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363031323232393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393936343336223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363031323134353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b),
('rebhbg38u8sr8t7b9v2iksv30tv2d7vi', '127.0.0.1', 1556883455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838333435353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('rfdq0ds4mrrr5q63j8vac53g2lmlcof3', '127.0.0.1', 1556726265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363732363236353b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('rg7o1jull9a0k4uqr26v4adljl2l0qhs', '127.0.0.1', 1556885138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838353133383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('rmm7pdhni6mlqtuf7e46fjcncm6836tr', '127.0.0.1', 1556769033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363736393033333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('rsfv9ch1s1qmm273nd8bj0f3ghkj7btc', '198.16.76.27', 1556012536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363031323533363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353535393936343336223b6c6173745f69707c733a31333a2239342e3230342e32312e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363031323337313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30332d31392031303a34393a3039223b),
('rukohcvullseap4ubmp11ffdfj7u613m', '127.0.0.1', 1556888093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838383039333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('sibjh2omfbahk11f9ia1at3eq8cled65', '127.0.0.1', 1556608420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363630383432303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('subivl0as8og35md6g31r1ou4q6uebn3', '127.0.0.1', 1556628968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632383936383b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('t27pjo2vogvtnvrvlamn9qq81lqaqg9e', '127.0.0.1', 1556652936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363635323933363b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353633343730223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22614a685a6c3346544f64764e394867495736376e223b),
('t291ejr6k70bv932c0d34r2cuhd9lmc2', '127.0.0.1', 1556900630, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363930303633303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383832373030223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363839373133323b),
('tci24hbjk888738ht89ak8b7jfrd8fih', '127.0.0.1', 1556733327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733333332373b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('tdv4bl0lmtek188t24tud1m648f6ml10', '127.0.0.1', 1556782591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363738323539313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('tkbvru0i039pbv8g6bmm8hai1k9v6eqn', '127.0.0.1', 1556812327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363831323132373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373935303631223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('tkipk45dl5tlm1qmksroicmsel9k07f6', '127.0.0.1', 1556745343, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363734353334333b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('tm898lubpefnslu8bqatc985nmotidn0', '127.0.0.1', 1556732398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733323339383b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('to7g8qio9a4ousmeb11qd7tobul32ia7', '127.0.0.1', 1556697772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363639373737323b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('u5muvrjbgju1hjo37givtf3ldocrqrbg', '127.0.0.1', 1556882502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838323530323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('u67b37crfp8201ts55evh64h64h0cjmb', '127.0.0.1', 1556768633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363736383633333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ugqfpfmud3cidqg1s9uhrr06dpue5he7', '127.0.0.1', 1556783118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363738333131383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('uod5rck6918oskdrgmugv3k20f375fsp', '127.0.0.1', 1556777522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363737373532323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636383732223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('up2vsbhioq33d1bfhbsjrjm6as9ldjv9', '127.0.0.1', 1556741417, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363734313431373b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('ut983uormdjq8cv0p5tmla6jn4fvkp0a', '127.0.0.1', 1556731438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363733313433383b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b757365725f637372667c733a32303a2254754b444d6c56716a497243635a556759526b41223b),
('uu0lr162konei5ijijtre1nqcbq0vcd4', '127.0.0.1', 1556884503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838343530333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('v8ms5fhdsmhjqhuctcrvjvji0k0jbgjp', '127.0.0.1', 1556783882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363738333838323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536373636323936223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('vebtk1tdcd99aef1mf39litt351us6h4', '127.0.0.1', 1556702216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363730323231363b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('vn2a61grgu187g83hi4euu761lpr83di', '127.0.0.1', 1556719370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363731393337303b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363839363833223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363639313234353b),
('vnuv8fcce1hin9j8kokcbgaa9usoot5v', '127.0.0.1', 1556887755, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363838373735353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a33313a2261646d696e40696d70756c73696f6e746563686e6f6c6f676965732e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536383034333231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('vrau2djib89p37riu20q2tpo0jvd5qrl', '127.0.0.1', 1556879831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363837393833313b7265717565737465645f706167657c733a353a2261646d696e223b6572726f727c733a33373a223c703e4c6f67696e204661696c65642c20506c656173652074727920616761696e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`) VALUES
(1, 'impulsionnewlogo3.png', 'impulsionnewlogo4.png', 'Impulsion Point Of Sale', 'english', 1, 0, 'AED', 1, 10, '3.4.13', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Muscat', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'info@impulsiontechnologies.com', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'info@impulsiontechnologies.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, 'izharulhak1', '82a49ab8-7542-4972-938e-a8430b80da84', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', 0, '-', 0, 1, 1, 'POP', 90, '', 0, 0, 'AN', 'dompdf');

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @5%', 'VAT5', '5.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'Pieace', 'pieace', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x3132372e302e302e31, 0x0000, 'owner', '3d23669c0a085b7a78664c821c704397066fc9d1', NULL, 'admin@impulsiontechnologies.com', NULL, NULL, NULL, NULL, 1351661704, 1556896451, 1, 'Owner', 'Owner', 'Impulsion Technologies', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, 0x39342e3230342e32312e313937, 0x322e35302e362e323138, 'eatogram@gmail.com', '3d23669c0a085b7a78664c821c704397066fc9d1', NULL, 'eatogram@gmail.com', NULL, NULL, NULL, NULL, 1553323502, 1555996305, 1, 'eatogram', 'sale', 'eatogram', '0509148827', NULL, 'male', 5, 1, 3, NULL, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x322e35302e362e323138, 'owner@tecdiary.com', '2019-03-19 06:28:49'),
(2, 1, NULL, 0x322e35302e362e323138, 'admin@impulsiontechnologies.com', '2019-03-19 06:52:48'),
(3, 1, NULL, 0x39342e35372e3137302e313638, 'admin@impulsiontechnologies.com', '2019-03-19 09:36:18'),
(4, 1, NULL, 0x3139382e31362e36362e313430, 'admin@impulsiontechnologies.com', '2019-03-20 17:42:42'),
(5, 1, NULL, 0x38362e39392e36362e3435, 'admin@impulsiontechnologies.com', '2019-03-20 19:00:36'),
(6, 1, NULL, 0x3137362e3230342e3137372e313631, 'admin@impulsiontechnologies.com', '2019-03-20 19:51:20'),
(7, 1, NULL, 0x3137362e3230342e3137372e313631, 'admin@impulsiontechnologies.com', '2019-03-20 19:51:35'),
(8, 1, NULL, 0x3137362e3230342e3137372e313631, 'admin@impulsiontechnologies.com', '2019-03-20 19:52:10'),
(9, 1, NULL, 0x3137362e3230342e3137372e313631, 'admin@impulsiontechnologies.com', '2019-03-21 07:52:39'),
(10, 1, NULL, 0x322e35302e362e323138, 'admin@impulsiontechnologies.com', '2019-03-21 13:01:35'),
(11, 1, NULL, 0x322e35302e362e323138, 'admin@impulsiontechnologies.com', '2019-03-23 06:27:52'),
(12, 1, NULL, 0x322e35302e362e323138, 'admin@impulsiontechnologies.com', '2019-03-23 06:43:09'),
(13, 1, NULL, 0x322e35302e362e323138, 'admin@impulsiontechnologies.com', '2019-03-23 06:46:28'),
(14, 2, NULL, 0x322e35302e362e323138, 'moon@moon.com', '2019-03-23 06:46:54'),
(15, 1, NULL, 0x322e35302e372e323434, 'admin@impulsiontechnologies.com', '2019-03-23 07:42:38'),
(16, 1, NULL, 0x322e35302e34342e313031, 'admin@impulsiontechnologies.com', '2019-03-24 06:13:30'),
(17, 1, NULL, 0x322e35302e34342e313031, 'admin@impulsiontechnologies.com', '2019-03-24 06:37:43'),
(18, 1, NULL, 0x39342e3230342e31332e36, 'admin@impulsiontechnologies.com', '2019-04-01 17:33:45'),
(19, 2, NULL, 0x39342e3230342e32312e313937, 'eatogram@gmail.com', '2019-04-23 05:11:45'),
(20, 1, NULL, 0x39342e3230342e32312e313937, 'admin@impulsiontechnologies.com', '2019-04-23 05:13:56'),
(21, 1, NULL, 0x3139382e31362e37342e3433, 'admin@impulsiontechnologies.com', '2019-04-23 07:47:14'),
(22, 1, NULL, 0x39342e3230342e32312e313937, 'admin@impulsiontechnologies.com', '2019-04-23 18:01:56'),
(23, 1, NULL, 0x3139382e31362e37302e3532, 'admin@impulsiontechnologies.com', '2019-04-24 14:10:22'),
(24, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-04-29 18:44:30'),
(25, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-04-30 07:07:01'),
(26, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-01 05:48:03'),
(27, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-01 06:12:46'),
(28, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-02 03:04:56'),
(29, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-02 03:14:33'),
(30, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-02 06:07:48'),
(31, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-02 11:04:21'),
(32, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-02 13:38:41'),
(33, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-03 10:40:45'),
(34, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-03 11:25:00'),
(35, 1, NULL, 0x3132372e302e302e31, 'admin@impulsiontechnologies.com', '2019-05-03 15:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'WHI', 'Warehouse 1', '<p>Address, City</p>', NULL, '012345678', 'whi@tecdiary.com', NULL),
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@tecdiary.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 1, 1, '83.0000', NULL, '3000.0000'),
(2, 1, 2, '0.0000', NULL, '3000.0000'),
(3, 2, 1, '100.0000', NULL, '1500.0000'),
(4, 2, 2, '0.0000', NULL, '1500.0000'),
(5, 3, 1, '121.0000', NULL, '2000.0000'),
(6, 3, 2, '0.0000', NULL, '2000.0000'),
(7, 4, 1, '150.0000', NULL, '2500.0000'),
(8, 4, 2, '0.0000', NULL, '2500.0000'),
(9, 5, 1, '76.0000', NULL, '50.0000'),
(10, 5, 2, '0.0000', NULL, '50.0000'),
(11, 6, 1, '129.0000', NULL, '200.0000'),
(12, 6, 2, '0.0000', NULL, '200.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_promos`
--
ALTER TABLE `sma_promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_services`
--
ALTER TABLE `sma_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_promos`
--
ALTER TABLE `sma_promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sma_services`
--
ALTER TABLE `sma_services`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
