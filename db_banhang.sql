-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 12, 2020 lúc 09:17 AM
-- Phiên bản máy phục vụ: 10.1.31-MariaDB
-- Phiên bản PHP: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `status` int(255) DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `status`, `note`, `created_at`, `updated_at`) VALUES
(5, 5, '2017-03-23', 20000, 'tiền mặt', 3, NULL, '2017-07-14 10:59:12', '2017-07-14 10:59:12'),
(8, 8, '2017-05-29', 90000, 'ATM', 2, NULL, '2017-07-14 11:00:19', '2017-07-14 11:00:19'),
(9, 9, '2017-05-29', 220000, 'ATM', NULL, NULL, '2017-05-29 05:55:22', '2017-05-29 05:55:22'),
(10, 10, '2017-05-29', 160000, 'COD', 2, NULL, '2017-07-14 11:00:27', '2017-07-14 11:00:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `status` int(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 2, 5000, 1, '2017-07-13 08:30:04', '0000-00-00 00:00:00'),
(2, 5, 12, 1, 10000, 1, '2017-07-13 08:30:08', '0000-00-00 00:00:00'),
(6, 10, 4, 1, 160000, 1, '2017-07-13 08:30:16', '2017-05-29 05:56:36'),
(7, 11, 57, 1, 150000, 1, '2017-07-13 08:30:19', '2017-05-29 05:57:45'),
(8, 11, 8, 1, 150000, 1, '2017-07-13 08:30:21', '2017-05-29 05:57:45'),
(9, 11, 5, 1, 160000, 1, '2017-07-13 08:30:24', '2017-05-29 05:57:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(5, 'Huong Huong', 'Nữ', 'huongnguyenak96@gmail.com', 'le thi rieng', '55555555', '55555555555555', '2016-11-14 08:25:57', '2016-11-14 08:25:57'),
(8, 'aaa', 'Nam', 'aaa@gmail.com', 'aaa', '1234', NULL, '2017-05-29 05:35:56', '2017-05-29 05:35:56'),
(9, 'bbb', 'Nữ', 'bbb@gmail.com', 'bbb', '321', NULL, '2017-05-29 05:55:22', '2017-05-29 05:55:22'),
(10, 'ccc', 'Nam', 'cvxcvxc@gmail.com', 'ccc', '098', NULL, '2017-05-29 05:56:36', '2017-05-29 05:56:36'),
(11, 'dd', 'Nam', 'ddd@gmail.com', 'dvc', '86785', NULL, '2017-05-29 05:57:45', '2017-05-29 05:57:45'),
(12, 'Vũ Kiếng', 'Nữ', 'save.9019@gmail.com', 'Đường 10, Ngã tư Vũ Hạ, An Vũ, Quỳnh Phụ, Thái Bình', '0972543902', 'Nhận hàng ngoài giờ hành chính', '2017-06-08 08:34:29', '2017-06-08 08:34:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lbsm_items`
--

CREATE TABLE `lbsm_items` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_translated` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_string` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT '0',
  `parent_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lbsm_items`
--

INSERT INTO `lbsm_items` (`id`, `title`, `title_translated`, `icon`, `url`, `id_string`, `order_number`, `parent_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
('22226dff638f425397dc0b4b2724d525', 'List', 1, 'fa-list-alt', '/product', '15', 15, 'e6693f10162c4124a3a216c2be5622d2', '1', NULL, '2017-05-28 03:13:56', '2017-05-28 03:13:56'),
('3ce785c976e9463eb23bbe141ec054e2', 'Add', 1, 'fa-plus-circle', '/product/create', '16', 16, 'e6693f10162c4124a3a216c2be5622d2', '1', NULL, '2017-05-28 05:15:00', '2017-05-28 05:15:00'),
('504638efc965463980fe2d5c9662d4f8', 'Items', 1, 'fa-sitemap', '/lbsm/item', '10', 10, NULL, '1', NULL, '2017-05-25 14:44:16', '2017-05-25 14:44:16'),
('5788149d04fe47cc9f9871554a3c656d', 'Role', 1, 'fa-slack', '/role', '11', 11, NULL, '1', NULL, '2017-05-25 14:46:19', '2017-05-25 14:46:19'),
('5b6061d7dd37401dba96055cf86b7389', 'Add', 1, 'fa-plus-square', 'user/create', '8', 8, '6b0e6cdf09b940acb59ec496aeaaa885', '1', '1', '2017-05-24 14:47:09', '2017-05-26 08:59:04'),
('6b0e6cdf09b940acb59ec496aeaaa885', 'Users', 1, 'fa-user', '/', '2', 2, NULL, '1', '1', '2017-05-24 04:56:22', '2017-05-26 14:28:46'),
('7dbf034371154e7294f1b0f4377b3f45', 'List', 1, 'fa-list-alt', '/type_product', '13', 13, 'd78b5287f8794ea3bdba925feff1abad', '1', NULL, '2017-05-26 14:28:20', '2017-05-26 14:28:20'),
('86b34cbb8b7a4eed834191acd2c58b61', 'Customers', 1, 'fa-user-md', '/customer', '7', 7, NULL, '1', '1', '2017-05-24 14:42:41', '2017-05-29 03:50:04'),
('90cac6f99b35482782449d00d7e7a8ec', 'Add', 1, 'fa-plus-square', '/type_product/create', '14', 14, 'd78b5287f8794ea3bdba925feff1abad', '1', NULL, '2017-05-27 06:13:24', '2017-05-27 06:13:24'),
('9137c1dab21d4ce4b4351338489994cf', 'Role', 1, 'fa-adjust', '/user_role', '9', 9, '6b0e6cdf09b940acb59ec496aeaaa885', '1', '1', '2017-05-24 14:49:32', '2017-05-26 08:59:49'),
('925142eff143439eb635b5458875ca27', 'Permission Group', 1, 'fa-object-ungroup', '/permission/group', '12', 12, NULL, '1', NULL, '2017-05-25 14:48:10', '2017-05-25 14:48:10'),
('994a6b48627d4a9596297c33d75344a5', 'Dashboard', 1, 'fa-dashboard', '/admin', '1', 1, NULL, '1', '1', '2017-05-24 03:41:52', '2017-05-24 14:54:28'),
('d78b5287f8794ea3bdba925feff1abad', 'Type Products', 1, 'fa-cube', '/', '3', 3, NULL, '1', NULL, '2017-05-24 14:39:01', '2017-05-24 14:39:01'),
('e6693f10162c4124a3a216c2be5622d2', 'Product', 1, 'fa-cubes', '/', '4', 4, NULL, '1', NULL, '2017-05-24 14:40:05', '2017-05-24 14:40:05'),
('f2790beff511410eb7d542ce7e2260cf', 'List', 1, 'fa-list-alt', '/user', '13', 13, '6b0e6cdf09b940acb59ec496aeaaa885', '1', NULL, '2017-05-26 08:58:08', '2017-05-26 08:58:08'),
('f339c1feee9d419097f6485af0b7c84c', 'Bills', 1, 'fa-sticky-note-o', '/bill', '6', 6, NULL, '1', '1', '2017-05-24 14:41:56', '2017-05-29 03:57:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lbsm_item_permissions`
--

CREATE TABLE `lbsm_item_permissions` (
  `item_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lbsm_item_roles`
--

CREATE TABLE `lbsm_item_roles` (
  `item_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(2, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(3, 1, 'en', 'deeppermission', 'alert.permission.created', 'Permission is created', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(4, 1, 'en', 'deeppermission', 'alert.permission.updated', 'Permission is updated', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(5, 1, 'en', 'deeppermission', 'alert.permission.deleted', 'Permission is deleted', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(6, 1, 'en', 'deeppermission', 'alert.group.created', 'Permission\'s group is created', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(7, 1, 'en', 'deeppermission', 'alert.group.updated', 'Permission\'s group is updated', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(8, 1, 'en', 'deeppermission', 'alert.group.deleted', 'Permission\'s group is deleted', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(9, 1, 'en', 'deeppermission', 'alert.role.created', 'Role is created', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(10, 1, 'en', 'deeppermission', 'alert.role.updated', 'Role is updated', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(11, 1, 'en', 'deeppermission', 'alert.role.deleted', 'Role is deleted', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(12, 1, 'en', 'deeppermission', 'alert.role_permission.updated', 'Role\'s permissions are updated', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(13, 1, 'en', 'deeppermission', 'alert.setting.initial', 'Initial data is inserted', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(14, 1, 'en', 'deeppermission', 'alert.user_permission.updated', 'User\'s permissions are updated', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(15, 1, 'en', 'deeppermission', 'alert.user_role.updated', 'User\'s roles are updated', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(16, 1, 'en', 'deeppermission', 'header.title', 'Role & permission management', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(17, 1, 'en', 'deeppermission', 'sidebox.user_role', 'User\'s role', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(18, 1, 'en', 'deeppermission', 'sidebox.role', 'Role', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(19, 1, 'en', 'deeppermission', 'sidebox.group', 'Permission group', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(20, 1, 'en', 'deeppermission', 'sidebox.permission', 'Permission', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(21, 1, 'en', 'deeppermission', 'sidebox.setting', 'Setting', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(22, 1, 'en', 'deeppermission', 'permission.add', 'Add new Permission', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(23, 1, 'en', 'deeppermission', 'permission.edit', 'Edit Permission', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(24, 1, 'en', 'deeppermission', 'permission.name', 'Name', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(25, 1, 'en', 'deeppermission', 'permission.code', 'Code', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(26, 1, 'en', 'deeppermission', 'permission.group_permission', 'Permission Group', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(27, 1, 'en', 'deeppermission', 'permission.title', 'Permission management', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(28, 1, 'en', 'deeppermission', 'permission.name_hint', 'Permission\'s name', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(29, 1, 'en', 'deeppermission', 'permission.code_hint', 'Permission\'s code', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(30, 1, 'en', 'deeppermission', 'permission.code_note', 'For developer only', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(31, 1, 'en', 'deeppermission', 'general.action', 'Action', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(32, 1, 'en', 'deeppermission', 'general.are_you_sure', 'Are you sure?', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(33, 1, 'en', 'deeppermission', 'general.quickadd', 'Quick Add', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(34, 1, 'en', 'deeppermission', 'group.add', 'Add new Permission Group', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(35, 1, 'en', 'deeppermission', 'group.edit', 'Edit Permission Group', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(36, 1, 'en', 'deeppermission', 'group.name', 'Name', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(37, 1, 'en', 'deeppermission', 'group.code', 'Code', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(38, 1, 'en', 'deeppermission', 'group.title', 'Permission Group management', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(39, 1, 'en', 'deeppermission', 'group.permission', 'Permission', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(40, 1, 'en', 'deeppermission', 'group.name_hint', 'Permission Group\'s name', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(41, 1, 'en', 'deeppermission', 'group.code_hint', 'Permission Group\'s code', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(42, 1, 'en', 'deeppermission', 'group.code_note', 'For developer only', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(43, 1, 'en', 'deeppermission', 'role.add', 'Add new Role', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(44, 1, 'en', 'deeppermission', 'role.edit', 'Edit Role', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(45, 1, 'en', 'deeppermission', 'role.name', 'Name', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(46, 1, 'en', 'deeppermission', 'role.code', 'Code', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(47, 1, 'en', 'deeppermission', 'role.title', 'Role management', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(48, 1, 'en', 'deeppermission', 'role.permission_of', '\'s Roles', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(49, 1, 'en', 'deeppermission', 'role.name_hint', 'Role\'s name', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(50, 1, 'en', 'deeppermission', 'role.code_hint', 'Role\'s code', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(51, 1, 'en', 'deeppermission', 'role.code_note', 'For developer only', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(52, 1, 'en', 'deeppermission', 'setting.title', 'Setting', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(53, 1, 'en', 'deeppermission', 'setting.initial_text', 'Initial: Insert all initial Permission and Permission Group', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(54, 1, 'en', 'deeppermission', 'setting.initial', 'Initial', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(55, 1, 'en', 'deeppermission', 'setting.export', 'Export', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(56, 1, 'en', 'deeppermission', 'setting.import', 'Import', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(57, 1, 'en', 'deeppermission', 'user.username', 'Username', '2017-06-09 06:57:31', '2017-06-09 06:57:31'),
(58, 1, 'en', 'deeppermission', 'user.email', 'Email', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(59, 1, 'en', 'deeppermission', 'user.permission_of', '\'s Permission', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(60, 1, 'en', 'deeppermission', 'user.role', 'User\'s Role', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(61, 0, 'en', 'home', 'ngôn ngữ', 'Language', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(62, 0, 'en', 'home', 'đăng kí', 'Register', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(63, 0, 'en', 'home', 'xin chào', 'Hello', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(64, 0, 'en', 'home', 'đăng nhập', 'Login', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(65, 0, 'en', 'home', 'đăng xuất', 'Logout', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(66, 0, 'en', 'home', 'trang chủ', 'Home', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(67, 0, 'en', 'home', 'loại sản phẩm', 'Product Type', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(68, 0, 'en', 'home', 'giới thiệu', 'About', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(69, 0, 'en', 'home', 'liên hệ', 'Contact', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(70, 0, 'en', 'home', 'bạn tìm gì', 'What are you looking for', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(71, 0, 'en', 'home', 'giỏ hàng', 'Cart', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(72, 0, 'en', 'home', 'trống', 'Empty', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(73, 0, 'en', 'home', 'sản phẩm mới', 'New Products', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(74, 0, 'en', 'home', 'tìm thấy', 'Find', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(75, 0, 'en', 'home', 'sản phẩm', 'products', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(76, 0, 'en', 'home', 'chi tiết', 'Detail', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(77, 0, 'en', 'home', 'sản phẩm đặc biệt', 'Special Product', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(78, 0, 'en', 'home', 'tổng tiền', 'Total', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(79, 0, 'en', 'home', 'đặt hàng', 'Order', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(80, 0, 'en', 'home', 'họ tên', 'Full name', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(81, 0, 'en', 'home', 'địa chỉ', 'Address', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(82, 0, 'en', 'home', 'số điện thoại', 'Phone', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(83, 0, 'en', 'home', 'mật khẩu', 'Password', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(84, 0, 'en', 'home', 'nhập lại mật khẩu', 'Re-password', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(85, 0, 'en', 'home', 'bạn có thể liên hệ với chúng tôi theo mẫu sau', 'You can contact us by following form', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(86, 0, 'en', 'home', 'mẫu liên hệ', 'Contact Form', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(87, 0, 'en', 'home', 'bắt buộc', 'Require', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(88, 0, 'en', 'home', 'tiêu đề', 'Title', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(89, 0, 'en', 'home', 'lời nhắn của bạn', 'Your messages', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(90, 0, 'en', 'home', 'gửi tin nhắn', 'Send', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(91, 0, 'en', 'home', 'thông tin liên hệ', 'Contact Information', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(92, 0, 'en', 'home', 'sản phẩm tương tự', 'Same Products', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(93, 0, 'en', 'home', 'thông tin chi tiết sản phẩm', 'Product Information', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(94, 0, 'en', 'home', 'số lượng', 'Quantity', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(95, 0, 'en', 'home', 'đồng', 'VND', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(96, 0, 'en', 'home', 'mô tả', 'Description', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(97, 0, 'en', 'home', 'sản phẩm khác', 'Other Products', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(98, 0, 'en', 'home', 'tìm kiếm', 'Search', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(99, 0, 'en', 'home', 'niềm đam mê của chúng tôi với những gì chúng tôi chuyển đến dịch vụ của chúng tôi', 'Our Passion for What We Do Transfers Into Our Services', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(100, 0, 'en', 'home', 'chúng tôi sẽ tích cực phát triển hơn nữa để đem đến những sản phẩm tốt nhất cho khách hàng', 'We will actively develop further to bring the best products to our customers', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(101, 0, 'en', 'home', 'hài lòng', 'Clients Satisfied', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(102, 0, 'en', 'home', 'tuyệt vời', 'Amazing Works', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(103, 0, 'en', 'home', 'ủng hộ', 'Support Hours', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(104, 0, 'en', 'home', 'dự án mới', 'New Projects', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(105, 0, 'en', 'home', 'intagram', 'Instagram', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(106, 0, 'en', 'home', 'thông tin', 'Information', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(107, 0, 'en', 'home', 'liên hệ với chúng tôi', 'Contact Us', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(108, 0, 'en', 'home', 'đăng ký nhận tin', 'Newsletter Subscribe', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(109, 0, 'en', 'home', 'thiết kế website', 'Web Design', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(110, 0, 'en', 'home', 'sự phát triển website', 'Web Development', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(111, 0, 'en', 'home', 'tiếp thị', 'Marketing', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(112, 0, 'en', 'home', 'nguồn', 'Sources', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(113, 0, 'en', 'home', 'minh họa', 'Illustrations', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(114, 0, 'en', 'home', 'lời khuyên', 'Tips', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(115, 0, 'en', 'home', 'đăng ký', 'Subscribe', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(116, 0, 'en', 'home', 'chính sách bảo mật', 'Privacy policy', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(117, 0, 'en', 'home', 'thông tin đăng nhập', 'Login Information', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(118, 0, 'en', 'home', 'chưa có tài khoản', 'No account', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(119, 0, 'en', 'home', 'đăng ký tại đây', 'Register here', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(120, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(121, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(122, 1, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(123, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(124, 1, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(125, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(126, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(127, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(128, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(129, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(130, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(131, 1, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(132, 1, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(133, 1, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(134, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(135, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(136, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(137, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(138, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(139, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(140, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(141, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(142, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(143, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(144, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(145, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(146, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(147, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(148, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(149, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(150, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(151, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(152, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(153, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(154, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(155, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(156, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(157, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(158, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(159, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(160, 1, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(161, 1, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(162, 1, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(163, 1, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(164, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(165, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(166, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(167, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(168, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(169, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(170, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(171, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(172, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(173, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(174, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(175, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(176, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(177, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(178, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(179, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(180, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(181, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(182, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(183, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(184, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(185, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(186, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(187, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(188, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(189, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(190, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(191, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2017-06-09 06:57:32', '2017-06-09 06:57:32'),
(192, 0, 'vi', 'home', 'xin chào', 'Xin chào', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(193, 0, 'vi', 'home', 'đăng xuất', 'Đăng xuất', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(194, 0, 'vi', 'home', 'ngôn ngữ', 'Ngôn ngữ', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(195, 0, 'vi', 'home', 'đăng kí', 'Đăng kí', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(196, 0, 'vi', 'home', 'đăng nhập', 'Đăng nhập', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(197, 0, 'vi', 'home', 'trang chủ', 'Trang chủ', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(198, 0, 'vi', 'home', 'loại sản phẩm', 'Loại sản phẩm', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(199, 0, 'vi', 'home', 'giới thiệu', 'Giới thiệu', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(200, 0, 'vi', 'home', 'liên hệ', 'Liên hệ', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(201, 0, 'vi', 'home', 'bạn tìm gì', 'Bạn tìm gì', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(202, 0, 'vi', 'home', 'giỏ hàng', 'Giỏ hàng', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(203, 0, 'vi', 'home', 'trống', 'Trống', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(204, 0, 'vi', 'home', 'sản phẩm mới', 'Sản phẩm mới', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(205, 0, 'vi', 'home', 'tìm thấy', 'Tìm thấy', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(206, 0, 'vi', 'home', 'sản phẩm', 'sản phẩm', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(207, 0, 'vi', 'home', 'chi tiết', 'Chi tiết', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(208, 0, 'vi', 'home', 'sản phẩm đặc biệt', 'Sản phẩm đặc biệt', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(209, 0, 'vi', 'home', 'tổng tiền', 'Tổng tiền', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(210, 0, 'vi', 'home', 'đặt hàng', 'Đặt hàng', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(211, 0, 'vi', 'home', 'họ tên', 'Họ tên', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(212, 0, 'vi', 'home', 'địa chỉ', 'Địa chỉ', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(213, 0, 'vi', 'home', 'số điện thoại', 'Số điện thoại', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(214, 0, 'vi', 'home', 'mật khẩu', 'Mật khẩu', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(215, 0, 'vi', 'home', 'nhập lại mật khẩu', 'Nhập lại mật khẩu', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(216, 0, 'vi', 'home', 'bạn có thể liên hệ với chúng tôi theo mẫu sau', 'Bạn có thể liên hệ với chúng tôi theo mẫu sau', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(217, 0, 'vi', 'home', 'mẫu liên hệ', 'Mẫu liên hệ', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(218, 0, 'vi', 'home', 'bắt buộc', 'bắt buộc', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(219, 0, 'vi', 'home', 'tiêu đề', 'Tiêu đề', '2017-06-09 06:57:32', '2017-06-09 07:01:43'),
(220, 0, 'vi', 'home', 'lời nhắn của bạn', 'Lời nhắn của bạn', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(221, 0, 'vi', 'home', 'gửi tin nhắn', 'Gửi tin nhắn', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(222, 0, 'vi', 'home', 'thông tin liên hệ', 'Thông tin liên hệ', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(223, 0, 'vi', 'home', 'sản phẩm tương tự', 'Sản phẩm tương tự', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(224, 0, 'vi', 'home', 'thông tin chi tiết sản phẩm', 'Thông tin chi tiết sản phẩm', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(225, 0, 'vi', 'home', 'số lượng', 'Số lượng', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(226, 0, 'vi', 'home', 'đồng', 'đồng', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(227, 0, 'vi', 'home', 'mô tả', 'Mô tả', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(228, 0, 'vi', 'home', 'sản phẩm khác', 'sản phẩm khác', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(229, 0, 'vi', 'home', 'tìm kiếm', 'Tìm kiếm', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(230, 0, 'vi', 'home', 'niềm đam mê của chúng tôi với những gì chúng tôi chuyển đến dịch vụ của chúng tôi', 'Niềm đam mê của chúng tôi với những gì chúng tôi chuyển đến Dịch vụ của chúng tôi', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(231, 0, 'vi', 'home', 'chúng tôi sẽ tích cực phát triển hơn nữa để đem đến những sản phẩm tốt nhất cho khách hàng', 'Chúng tôi sẽ tích cực phát triển hơn nữa để đem đến những sản phẩm tốt nhất cho khách hàng', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(232, 0, 'vi', 'home', 'hài lòng', 'Hài lòng', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(233, 0, 'vi', 'home', 'tuyệt vời', 'Tuyệt vời', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(234, 0, 'vi', 'home', 'ủng hộ', 'Ủng hộ', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(235, 0, 'vi', 'home', 'dự án mới', 'Dự án mới', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(236, 0, 'vi', 'home', 'intagram', 'Instagram', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(237, 0, 'vi', 'home', 'thông tin', 'Thông tin', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(238, 0, 'vi', 'home', 'liên hệ với chúng tôi', 'Liên hệ với chúng tôi', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(239, 0, 'vi', 'home', 'đăng ký nhận tin', 'Đăng ký nhận tin', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(240, 0, 'vi', 'home', 'thiết kế website', 'Thiết kế website', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(241, 0, 'vi', 'home', 'sự phát triển website', 'Sự phát triển website', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(242, 0, 'vi', 'home', 'tiếp thị', 'Tiếp thị', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(243, 0, 'vi', 'home', 'nguồn', 'Nguồn', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(244, 0, 'vi', 'home', 'minh họa', 'Minh họa', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(245, 0, 'vi', 'home', 'lời khuyên', 'Lời khuyên', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(246, 0, 'vi', 'home', 'đăng ký', 'Đăng ký', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(247, 0, 'vi', 'home', 'chính sách bảo mật', 'Chính sách bảo mật', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(248, 0, 'vi', 'home', 'thông tin đăng nhập', 'Thông tin đăng nhập', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(249, 0, 'vi', 'home', 'chưa có tài khoản', 'Chưa có tài khoản', '2017-06-09 06:57:33', '2017-06-09 07:01:43'),
(250, 0, 'vi', 'home', 'đăng ký tại đây', 'Đăng ký tại đây', '2017-06-09 06:57:33', '2017-06-09 07:01:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media`
--

CREATE TABLE `media` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_extension` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `scale_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '2014_10_12_100000_create_password_resets_table', 1),
(12, '2016_08_18_043213_create_roles_table', 1),
(13, '2016_08_18_043222_create_permissions_table', 1),
(14, '2016_08_18_043234_create_permission_groups_table', 1),
(15, '2016_08_18_043247_create_user_roles_table', 1),
(16, '2016_08_18_043305_create_user_permissions_table', 1),
(17, '2016_08_18_043332_create_role_permissions_table', 1),
(18, '2017_01_20_043926_create_l_b_s_m_items_table', 1),
(19, '2017_01_20_145215_create_l_b_s_m_item_roles_table', 1),
(20, '2017_01_20_145229_create_l_b_s_m_item_permissions_table', 1),
(21, '2016_11_09_002409_create_media_table', 2),
(22, '2014_04_02_193005_create_translations_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('quanghuy95014@gmail.com', '$2y$10$U.cav5rXPtpx.arZf.WBDebTsHQqGzef2w4gPISBv3R8zSO0gSU3C', '2017-06-13 11:24:43'),
('nodanhtoi123@gmail.com', '$2y$10$oEiwtuoaP8gZMOMKqfffJObSQvREpogBGCaUvlyVjbPhsE/gd61YK', '2017-06-13 11:24:53'),
('nqh95014@gmail.com', '$2y$10$tZO19H0eU4IAyCY270MmCOUDXwjnR4JPY2JdiviFMP7mgqAsV0BKm', '2017-11-07 04:14:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_group_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trans_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `trans_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `trans_name`, `alias`, `id_type`, `description`, `trans_description`, `unit_price`, `promotion_price`, `image`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'Bánh Crepe Sầu riêng', 'Crepe Durian', 'banh-crepe-sau-rieng', 5, NULL, NULL, 170000, 120000, '1430967449-pancake-sau-rieng-6.jpg', 'hộp', '2016-10-26 03:00:16', '2017-11-07 02:21:10'),
(2, 'Bánh Crepe Chocolate', 'Crepe Chocolate ', 'banh-crepe-chocolate', 6, '', NULL, 180000, 160000, 'crepe-chocolate.jpg', 'hộp', '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'Bánh Crepe Sầu riêng - Chuối', 'Crepe Durian - Banana', 'banh-crepe-sau-rieng-chuoi', 5, '', NULL, 150000, 120000, 'crepe-chuoi.jpg', 'hộp', '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'Bánh Crepe Đào', 'Crepe Peaches', 'banh-crepe-dao', 5, '', NULL, 160000, 160000, 'crepe-dao.jpg', 'hộp', '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'Bánh Crepe Dâu', 'Crepe \nStrawberry', 'banh-crepe-dau', 5, '', NULL, 160000, 160000, 'crepedau.jpg', 'hộp', '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'Bánh Crepe Pháp', 'Crepe France', 'banh-crepe-phap', 5, '', NULL, 200000, 180000, 'crepe-phap.jpg', 'hộp', '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'Bánh Crepe Táo', 'Crepe Apple', 'banh-crepe-tao', 5, '', NULL, 160000, 160000, 'crepe-tao.jpg', 'hộp', '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(8, 'Bánh Crepe Trà xanh', 'Crepe Green Tea', 'banh-crepe-tra-xanh', 5, '', NULL, 160000, 150000, 'crepe-traxanh.jpg', 'hộp', '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, 'Bánh Crepe Sầu riêng và Dứa', 'Crepe Durian - Pineapple', 'banh-crepe-sau-rieng-va-dua', 5, '', NULL, 160000, 150000, 'saurieng-dua.jpg', 'hộp', '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(11, 'Bánh Gato Trái cây Việt Quất', 'Vietnamese Fruit Gato Cake', 'banh-gato-trai-cay-viet-quat', 3, '', NULL, 250000, 250000, '544bc48782741.png', 'cái', '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(12, 'Bánh sinh nhật rau câu trái cây', 'Birthday cake fruit vegetable', 'banh-sinh-nhat-rau-cau-trai-cay', 3, '', NULL, 200000, 180000, '210215-banh-sinh-nhat-rau-cau-body- (6).jpg', 'cái', '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, 'Bánh kem Chocolate Dâu', 'Strawberry Chocolate Cake', 'banh-kem-chocolate-dau', 3, '', NULL, 300000, 280000, 'banh kem sinh nhat.jpg', 'cái', '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, 'Bánh kem Dâu III', 'Strawberry Cream III', 'banh-kem-dau-III', 3, '', NULL, 300000, 280000, 'Banh-kem (6).jpg', 'cái', '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, 'Bánh kem Dâu I', 'Strawberry Cream I', 'banh-kem-dau-I', 3, '', NULL, 350000, 320000, 'banhkem-dau.jpg', 'cái', '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, 'Bánh trái cây II', 'Fruit cake II', 'banh-kem-dau-II', 3, '', NULL, 150000, 120000, 'banhtraicay.jpg', 'hộp', '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, 'Bánh táo', 'Apple Cake', 'banh-tao', 3, '', NULL, 250000, 240000, 'Fruit-Cake_7979.jpg', 'cai', '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(18, 'Bánh ngọt nhân cream táo', 'Apple pie cream cake', 'banh-ngot-nhan-cream-tao', 2, '', NULL, 180000, 180000, '20131108144733.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, 'Bánh Chocolate Trái cây', '\nChocolate cake Fruit', 'banh-chocolate-trai-cay', 2, '', NULL, 150000, 150000, 'Fruit-Cake_7976.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, 'Bánh Chocolate Trái cây II', '\nChocolate cake Fruit II', 'banh-chocolate-trai-cay-II', 2, '', NULL, 150000, 150000, 'Fruit-Cake_7981.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(21, 'Bánh đào', 'Peach Cake', 'banh-dao', 2, '', NULL, 160000, 150000, 'Peach-Cake_3294.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, 'Bánh bông lan trứng muối I', 'Cream cake with salted egg I', 'banh-bong-lan-trung-muoi-I', 1, '', NULL, 160000, 150000, 'banhbonglantrung.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'Bánh bông lan trứng muối II', 'Cream cake with salted egg II', 'banh-bong-lan-trung-muoi-II', 1, '', NULL, 180000, 180000, 'banhbonglantrungmuoi.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'Bánh Pháp', 'France cake', 'banh-phap', 1, '', NULL, 180000, 180000, 'banh-man-thu-vi-nhat-1.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'Bánh mì Úc', 'Ustralia bread', 'banh-my-uc', 1, '', NULL, 80000, 70000, 'dung-khoai-tay-lam-banh-gato-man-cuc-ngon.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, 'Bánh mặn thập cẩm', 'Salt cake mixed', 'banh-man-thap-cam', 1, '', NULL, 50000, 50000, 'Fruit-Cake.png', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(27, 'Bánh Muffins trứng', 'Egg Muffins Cake', 'banh-muffins-trung', 1, '', NULL, 100000, 80000, 'maxresdefault.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(28, 'Bánh Scone Peach Cake', 'Scone Peach Cake', 'banh-scone-peach', 1, '', NULL, 120000, 120000, 'Peach-Cake_3300.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(29, 'Bánh mì Loaf I', 'Loaf bread I', 'banh-my-loaf-I', 1, '', NULL, 100000, 100000, 'sli12.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(30, 'Bánh kem Chocolate Dâu I', 'Strawberry Chocolate Cake I', 'banh-kem-chocolate-dau-I', 4, '', NULL, 380000, 350000, 'sli12.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(31, 'Bánh kem Trái cây I', 'Fruit Cake I', 'banh-kem-trai-cay-I', 4, '', NULL, 380000, 350000, 'Fruit-Cake.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(32, 'Bánh kem Trái cây II', 'Fruit Cake II', 'banh-kem-trai-cay-II', 4, '', NULL, 380000, 350000, 'Fruit-Cake_7971.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, 'Bánh kem Doraemon', 'Doraemon Cream Cake', 'banh-kem-doreamon', 4, '', NULL, 280000, 250000, 'p1392962167_banh74.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(34, 'Bánh kem Caramen Pudding', 'Caramel Pudding', 'banh-kem-caramen pudding', 4, '', NULL, 280000, 280000, 'Caramen-pudding636099031482099583.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(35, 'Bánh kem Chocolate Fruit', 'Chocolate Fruit Cake', 'banh-kem-chocolate-fruit', 4, '', NULL, 320000, 300000, 'chocolate-fruit636098975917921990.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(36, 'Bánh kem Coffee Chocolate GH6', 'GH6 Chocolate Chocolate Cream Cake', 'Banh-kem-Coffee-Chocolate-GH6', 4, '', NULL, 320000, 300000, 'COFFE-CHOCOLATE636098977566220885.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(37, 'Bánh kem Mango Mouse', 'Mango Mouse Cream Cake', 'banh-mango-mouse', 4, '', NULL, 320000, 300000, 'mango-mousse-cake.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(38, 'Bánh kem Matcha Mouse', 'Matcha Mouse Cream Cake', 'banh-kem-matcha-mouse', 4, '', NULL, 350000, 330000, 'MATCHA-MOUSSE.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(39, 'Bánh kem Flower Fruit', 'Flower Fruit Cream Cake', 'banh-kem-flower-fruit', 4, '', NULL, 350000, 330000, 'flower-fruits636102461981788938.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(40, 'Bánh kem Strawberry Delight', 'Strawberry Delight Cream Cake', 'banh-kem-strawberry-delight', 4, '', NULL, 350000, 330000, 'strawberry-delight636102445035635173.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(41, 'Bánh kem Raspberry Delight', 'Raspberry Delight Cream Cake', 'banh-kem-raspberry-delight', 4, '', NULL, 350000, 330000, 'raspberry.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(42, 'Beefy Pizza', 'Beefy Pizza', 'beefy-pizza', 6, 'Thịt bò xay, ngô, sốt BBQ, phô mai mozzarella', 'Grilled beef, corn, BBQ sauce, mozzarella cheese', 150000, 130000, '40819_food_pizza.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(43, 'Hawaii Pizza', 'Hawaii Pizza', 'hawaii-pizza', 6, 'Sốt cà chua, ham , dứa, pho mai mozzarella', 'Tomato sauce, ham, pineapple, mozzarella cheese', 120000, 120000, 'hawaiian paradise_large-900x900.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(44, 'Smoke Chicken Pizza', 'Smoke Chicken Pizza', 'smoke-chicken-pizza', 6, 'Gà hun khói,nấm, sốt cà chua, pho mai mozzarella.', 'Smoked chicken, mushrooms, tomato sauce, mozzarella cheese', 120000, 120000, 'chicken black pepper_large-900x900.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(45, 'Sausage Pizza', 'Sausage Pizza', 'sausage-pizza', 6, 'Xúc xích klobasa, Nấm, Ngô, sốtcà chua, pho mai Mozzarella.', 'Klobasa sausages, mushrooms, corn, sour cream, mozzarella cheese.', 120000, 120000, 'pizza-miami.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(46, 'Ocean Pizza', 'Ocean Pizza', 'ocean-pizza', 6, 'Tôm , mực, xào cay,ớt xanh, hành tây, cà chua, phomai mozzarella.', 'Shrimp, squid, sauteed, green pepper, onion, tomato, cheese', 120000, 120000, 'seafood curry_large-900x900.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(47, 'All Meaty Pizza', 'All Meaty Pizza', 'all-meaty-pizza', 6, 'Ham, bacon, chorizo, pho mai mozzarella.', 'Ham, bacon, chorizo, mozzarella cheese', 140000, 140000, 'all1).jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(48, 'Tuna Pizza', '	\nTuna Pizza', 'tuna-pizza', 6, 'Cá Ngừ, sốt Mayonnaise,sốt càchua, hành tây, pho mai Mozzarella', 'Tuna, Mayonnaise, Cauliflower, Onion, Cheese', 140000, 140000, '54eaf93713081_-_07-germany-tuna.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(49, 'Bánh su kem nhân dừa', 'Coconut cream cake', 'banh-su-kem-nhan-dua', 7, '', NULL, 120000, 100000, 'maxresdefault.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(50, 'Bánh su kem sữa tươi', 'Cream cake with fresh milk', 'banh-su-kem-sua-tuoi', 7, '', NULL, 120000, 100000, 'sukem.jpg', 'cái', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(51, 'Bánh su kem sữa tươi chiên giòn', 'Cream cake with fresh milk fried crispy', 'banh-su-kem-sua-tuoi-chien-gion', 7, '', NULL, 150000, 150000, '1434429117-banh-su-kem-chien-20.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(52, 'Bánh su kem dâu sữa tươi', 'Cream cake with strawberry milk', 'banh-su-kem-dau-sua-tuoi', 7, '', NULL, 150000, 150000, 'sukemdau.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(53, 'Bánh su kem bơ sữa tươi', 'Cream butter \nmilk Cake', 'banh-su-kem-bo-sua-tuoi', 7, '', NULL, 150000, 150000, 'He-Thong-Banh-Su-Singapore-Chewy-Junior.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(54, 'Bánh su kem nhân trái cây sữa tươi', 'Cream cake with fruit fresh milk', 'banh-su-kem-nhan-trai-cay-sua-tuoi', 7, '', NULL, 150000, 150000, 'foody-banh-su-que-635930347896369908.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(55, 'Bánh su kem cà phê', 'Cream cake with coffee', 'banh-su-kem-ca-phe', 7, '', NULL, 150000, 150000, 'banh-su-kem-ca-phe-1.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(56, 'Bánh su kem phô mai', 'Cream cheese cake', 'banh-su-kem-pho-mai', 7, '', NULL, 150000, 150000, '50020041-combo-20-banh-su-que-pho-mai-9.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(57, 'Bánh su kem sữa tươi chocolate', 'Cream cake fresh milk chocolate', 'banh-su-kem-sua-tuoi-chocolate', 7, '', NULL, 150000, 150000, 'combo-20-banh-su-que-kem-sua-tuoi-phu-socola.jpg', 'hộp', '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(58, 'Bánh Macaron Pháp', 'France Macarcon cake', 'banh-macaron-phap', 2, 'Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.', '\nEnjoy macaron, one can find from traditional flavors like raspberry, chocolate, to new flavors like mushrooms and green tea. Macaron with crunchy crust of bread crumbs, fatty sweetness of the kernel, lovely appearance and colorful colors, this is a dish you should not miss when exploring the French cuisine.', 200000, 180000, 'Macaron9.jpg', '', '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(59, 'Bánh Tiramisu - Italia', 'Italia Tiramisu cake', 'banh-tiramisu-italia', 2, 'Chỉ cần cắn một miếng, bạn sẽ cảm nhận được tất cả các hương vị đó hòa quyện cùng một chính vì thế người ta còn ví món bánh này là Thiên đường trong miệng của bạn', 'Just bite a piece, you will feel all the flavors that mix the same so people also say this cake is Paradise in your mouth.', 200000, 200000, '234.jpg', '', '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(60, 'Bánh Táo - Mỹ', 'America apple cake', 'banh-tao-my', 2, 'Bánh táo Mỹ với phần vỏ bánh mỏng, giòn mềm, ẩn chứa phần nhân táo thơm ngọt, điểm chút vị chua dịu của trái cây quả sẽ là một lựa chọn hoàn hảo cho những tín đồ bánh ngọt trên toàn thế giới.', '\nAmerican Apple Cake with crispy crust, crispy sweetness, sweet apple flavor, slightly sour taste of fruit will be a perfect choice for pastry fans around the world.', 200000, 200000, '1234.jpg', '', '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(61, 'Bánh Cupcake - Anh Quốc', 'UK cupcake', 'banh-cupcake-anh-quoc', 6, 'Những chiếc cupcake có cấu tạo gồm phần vỏ bánh xốp mịn và phần kem trang trí bên trên rất bắt mắt với nhiều hình dạng và màu sắc khác nhau. Cupcake còn được cho là chiếc bánh mang lại niềm vui và tiếng cười như chính hình dáng đáng yêu của chúng.', 'The cupcakes are made up of soft spongy cakes and creamy top of the eye with many different shapes and colors. Cupcakes are also said to bring joy and laughter as their lovely shape.', 150000, 120000, 'cupcake.jpg', 'cái', NULL, NULL),
(62, 'Bánh Sachertorte', 'Sachertorte Cake', 'banh-sacherorte', 6, 'Sachertorte là một loại bánh xốp được tạo ra bởi loại&nbsp;chocholate&nbsp;tuyệt hảo nhất của nước Áo. Sachertorte có vị ngọt nhẹ, gồm nhiều lớp bánh được làm từ ruột bánh mì và bánh sữa chocholate, xen lẫn giữa các lớp bánh là mứt mơ. Món bánh chocholate này nổi tiếng tới mức thành phố Vienna của Áo đã ấn định&nbsp;tổ chức một ngày Sachertorte quốc gia, vào 5/12 hằng năm', 'Sachertorte is a sponge cake created by', 250000, 220000, '111.jpg', 'cái', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `code`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
('4b90cb1a53e849ac84911acdc1a5c5e7', 'Admin', '2', '1', NULL, '2017-05-24 05:00:41', '2017-05-24 05:00:41'),
('a278f4c034e44236b91d9e1762f8ab93', 'Super Admin', '1', '1', NULL, '2017-05-24 05:00:35', '2017-05-24 05:00:35'),
('d539f8dac4fd43a2bccd5247b71bf7a6', 'Member', '3', '1', NULL, '2017-05-24 05:00:56', '2017-05-24 05:00:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trans_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `alias`, `trans_name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Bánh mặn', 'banh-man', 'Saltine crackers', 'Nếu từng bị mê hoặc bởi các loại tarlet ngọt thì chắn chắn bạn không thể bỏ qua những loại tarlet mặn. Ngoài hình dáng bắt mắt, lớp vở bánh giòn giòn cùng với nhân mặn như thịt gà, nấm, thị heo ,… của bánh sẽ chinh phục bất cứ ai dùng thử.', 'banh-man-thu-vi-nhat-1.jpg', NULL, NULL),
(2, 'Bánh ngọt', 'banh-ngot', 'Cake', 'Bánh ngọt là một loại thức ăn thường dưới hình thức món bánh dạng bánh mì từ bột nhào, được nướng lên dùng để tráng miệng. Bánh ngọt có nhiều loại, có thể phân loại dựa theo nguyên liệu và kỹ thuật chế biến như bánh ngọt làm từ lúa mì, bơ, bánh ngọt dạng bọt biển. Bánh ngọt có thể phục vụ những mục đính đặc biệt như bánh cưới, bánh sinh nhật, bánh Giáng sinh, bánh Halloween..', '20131108144733.jpg', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Bánh trái cây', 'banh-trai-cay', 'Fruit cake', 'Bánh trái cây, hay còn gọi là bánh hoa quả, là một món ăn chơi, không riêng gì của Huế nhưng khi \"lạc\" vào mảnh đất Cố đô, món bánh này dường như cũng mang chút tinh tế, cầu kỳ và đặc biệt. Lấy cảm hứng từ những loại trái cây trong vườn, qua bàn tay khéo léo của người phụ nữ Huế, món bánh trái cây ra đời - ngọt thơm, dịu nhẹ làm đẹp lòng biết bao người thưởng thức.', 'banhtraicay.jpg', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'Bánh kem', 'banh-kem', 'Cream cake', 'Với người Việt Nam thì bánh ngọt nói chung đều hay được quy về bánh bông lan – một loại tráng miệng bông xốp, ăn không hoặc được phủ kem lên thành bánh kem. Tuy nhiên, cốt bánh kem thực ra có rất nhiều loại với hương vị, kết cấu và phương thức làm khác nhau chứ không chỉ đơn giản là “bánh bông lan” chung chung đâu nhé!', 'banhkem.jpg', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Bánh crepe', 'banh-crepe', 'Crepe cake', 'Crepe là một món bánh nổi tiếng của Pháp, nhưng từ khi du nhập vào Việt Nam món bánh đẹp mắt, ngon miệng này đã làm cho biết bao bạn trẻ phải “xiêu lòng”', 'crepe.jpg', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'Bánh Pizza', 'banh-pizza', 'Pizza', 'Pizza đã không chỉ còn là một món ăn được ưa chuộng khắp thế giới mà còn được những nhà cầm quyền EU chứng nhận là một phần di sản văn hóa ẩm thực châu Âu. Và để được chứng nhận là một nhà sản xuất pizza không hề đơn giản. Người ta phải qua đủ mọi các bước xét duyệt của chính phủ Ý và liên minh châu Âu nữa… tất cả là để đảm bảo danh tiếng cho món ăn này.', 'pizza.jpg', '2016-10-25 17:19:00', NULL),
(7, 'Bánh su kem', 'banh-kem-su', 'Choux cream cake', 'Bánh su kem là món bánh ngọt ở dạng kem được làm từ các nguyên liệu như bột mì, trứng, sữa, bơ.... đánh đều tạo thành một hỗn hợp và sau đó bằng thao tác ép và phun qua một cái túi để định hình thành những bánh nhỏ và cuối cùng được nướng chín. Bánh su kem có thể thêm thành phần Sô cô la để tăng vị hấp dẫn. Bánh có xuất xứ từ nước Pháp.', 'sukemdau.jpg', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8_unicode_ci,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` text COLLATE utf8_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Quang Huy', 'nqh95014@gmail.com', '$2y$10$5449Gi7v6SXDTe.7rvDlye4VFWzHKUvnQ.DYyGxp.QrA2stedNKSG', '0975766675', 'Khương Thượng, Đống Đa, HN', NULL, NULL, 'ez4J8NzrzetyB1zH9UtjuQLxgrzoyFZY9tDCTCVS4BRUf1GLOXyia4AadGJZ', '2017-05-19 14:19:22', '2017-05-19 14:19:22'),
(6, 'member1', 'member1@gmail.com', '$2y$10$5jCjamEOn9jwQ9dcx0zeleQY83aRav.EWGfNpMXW1B/hxl0FYM.fK', NULL, NULL, NULL, NULL, NULL, '2017-05-26 08:49:01', '2017-05-26 08:49:01'),
(10, 'Master Huyy', 'nodanhtoi@yahoo.com', NULL, 'null', 'null', 'facebook', '869753089839521', 'W73RQc8JywxAAtq87puA93JrRxmUjG5xbeysEP0OcKLnEdGIWynZFrQp4OPJ', '2017-06-08 11:20:08', '2017-06-08 11:20:08'),
(14, 'Lạc Trôi', 'lionel_messi_113@yahoo.com', NULL, 'null', 'null', 'facebook', '1936139909931704', 'QLCEl8wi2anJKt37parR92x7nyV4sAO3bbrDjXpvHhDHJz5liI3yQRzENGOg', '2017-06-10 07:26:33', '2017-06-10 07:26:33'),
(15, 'Mr Huy', 'nodanhtoi123@gmail.com', NULL, 'null', 'null', 'google', '118220734232301289664', 'tkTaxRHE3IKeGlAtF5pD3amNpK4Q2VHJf22PsSzUxQ8I30WF1Rl2RkNn0Amo', '2017-06-12 07:21:32', '2017-06-12 07:21:32'),
(23, 'Huy Nguyễn Quang', 'quanghuy95014@gmail.com', NULL, 'null', 'null', 'google', '114381697360471543967', NULL, '2017-07-30 08:02:09', '2017-07-30 08:02:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_permissions`
--

CREATE TABLE `user_permissions` (
  `user_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
('1', 'a278f4c034e44236b91d9e1762f8ab93', NULL, NULL),
('3', 'd539f8dac4fd43a2bccd5247b71bf7a6', NULL, NULL),
('4', 'd539f8dac4fd43a2bccd5247b71bf7a6', NULL, NULL),
('6', 'd539f8dac4fd43a2bccd5247b71bf7a6', NULL, NULL),
('10', 'd539f8dac4fd43a2bccd5247b71bf7a6', NULL, NULL),
('14', 'd539f8dac4fd43a2bccd5247b71bf7a6', NULL, NULL),
('15', 'd539f8dac4fd43a2bccd5247b71bf7a6', NULL, NULL),
('16', 'd539f8dac4fd43a2bccd5247b71bf7a6', NULL, NULL),
('17', 'd539f8dac4fd43a2bccd5247b71bf7a6', NULL, NULL),
('23', 'd539f8dac4fd43a2bccd5247b71bf7a6', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lbsm_items`
--
ALTER TABLE `lbsm_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
