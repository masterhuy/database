-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 12, 2020 lúc 09:18 AM
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
-- Cơ sở dữ liệu: `db_shopthoitrang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categorys`
--

CREATE TABLE `categorys` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `alias`, `keyword`, `parent_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Ví', 'vi', 'Ví nam nữ', 0, 'Ví da nam nữ đẹp', '2017-05-08 18:25:34', '2017-05-08 18:25:34'),
(2, 'Áo sơ mi', 'áo - so - mi', 'Áo sơ mi nam nữ', 0, 'Áo sơ mi nam nữ đẹp rẻ', '2017-05-08 18:26:19', '2017-05-08 18:26:19'),
(3, 'Áo thun', 'áo - thun', 'Áo thun nam nữ đẹp', 0, 'Áo thun nam nữ đẹp nhất', '2017-05-08 18:26:45', '2017-05-08 18:26:45'),
(4, 'Giày', 'giay', 'Giàynam nữ đẹp', 0, 'Giày nam nữ đẹp , giầy da ,giầy cao gót', '2017-05-08 18:27:15', '2017-05-08 19:52:11'),
(5, 'Thắt lưng', 'that - lung', 'Thắt lưng nam', 0, 'Thắt lưng da cá sấu đẹp', '2017-05-08 18:27:47', '2017-05-08 18:27:47'),
(6, 'Ví nam', 'vi - nam', 'Ví da nam', 1, 'Ví da nam đẹp bền', '2017-05-08 18:28:21', '2017-05-08 18:28:21'),
(7, 'Áo sơ mi nữ', 'áo - so - mi - nu', 'Áo sơ mi nữ', 2, 'Áo sơ mi nữ đẹp nhất', '2017-05-08 18:28:53', '2017-05-08 18:28:53'),
(8, 'Áo sơ mi nam', 'áo - so - mi - nam', 'Áo sơ mi nam đẹp', 2, 'Áo sơ mi nam đẹp nhất', '2017-05-08 18:29:17', '2017-05-08 18:29:17'),
(9, 'Áo thun nam', 'áo - thun - nam', 'Áo thun nam đẹp rẻ', 3, 'Áo thun nam đẹp rẻ nhất', '2017-05-08 18:29:40', '2017-05-08 18:29:40'),
(10, 'Áo thun nữ', 'áo - thun - nu', 'Áo thun nữ rẻ đẹp', 3, 'Áo thun nữ rẻ đẹp nhất', '2017-05-08 18:30:11', '2017-05-08 18:30:11'),
(11, 'Giày nam', 'giay - nam', 'Giày nam đẹp nhất', 4, 'Giày nam đẹp , rẻ  nhất', '2017-05-08 18:30:48', '2017-05-08 19:52:53'),
(12, 'Giày nữ', 'giay - nu', 'Giày nữ đẹp', 4, 'Giày nữ đẹp rẻ , giầy cao gót , giầy búp bê', '2017-05-08 18:31:30', '2017-05-08 19:52:36'),
(13, 'Thắt lưng nam', 'that - lung - nam', 'Thắt lưng nam đẹp', 5, 'Thắt lưng nam đẹp rẻ , thắt lưng da cá sấu', '2017-05-08 18:32:07', '2017-05-08 18:32:07'),
(14, 'Ví nữ', 'vi - nu', 'Ví nữ đẹp', 1, 'Ví nữ đẹp', '2017-05-09 20:11:24', '2017-05-09 20:11:24'),
(16, 'Đồng hồ', 'đong - ho', 'Đồng hồ nam nữ đẹp', 0, 'Đồng hồ nam nữ đẹp', '2017-05-19 00:01:16', '2017-05-19 00:01:16'),
(17, 'Đồng hồ nam', 'đong - ho - nam', 'Đồng hồ nam nữ đẹp', 16, 'Đồng hồ nam nữ đẹp', '2017-05-19 00:01:35', '2017-05-19 00:01:35'),
(18, 'Bánh', 'bánh', 'Bánh ngon', 0, 'Bánh ngon', '2017-06-05 18:46:31', '2017-06-05 18:46:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(52, '2014_10_12_000000_create_users_table', 1),
(53, '2014_10_12_100000_create_password_resets_table', 1),
(54, '2017_05_03_082503_create_categorys_table', 1),
(55, '2017_05_03_082912_create_user_details_table', 1),
(56, '2017_05_03_083535_create_products_table', 1),
(57, '2017_05_03_084230_create_product_details_table', 1),
(58, '2017_05_03_085615_create_product_images_table', 1),
(59, '2017_05_03_085955_create_payments_table', 1),
(60, '2017_05_03_090148_create_orders_table', 1),
(61, '2017_05_03_091127_create_order_details_table', 1),
(62, '2017_05_03_091653_create_cart_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `alias`, `cost`, `image`, `user_id`, `cat_id`, `created_at`, `updated_at`) VALUES
(1, 'Ví da nam', 'vi - da - nam', '145000.00', 'credit-squeeze-taxation-purse-tax-46242.jpeg', 14, 6, '2017-05-08 18:35:16', '2017-05-11 22:37:02'),
(2, 'Sơ mi nam SMN365', 'so - mi - nam - smn365', '150000.00', 'pexels-photo-297933.jpeg', 1, 8, '2017-05-08 18:50:14', '2017-05-19 04:35:40'),
(3, 'Áo thun nam A124', 'áo - thun - nam - a124', '80000.00', 'pexels-photo-200379.jpeg', 1, 9, '2017-05-08 19:51:23', '2017-05-19 04:35:28'),
(4, 'Giày nam AT90', 'giay - nam - at90', '125000.00', 'city-woman-feet-legs.jpg', 1, 11, '2017-05-08 19:55:08', '2017-05-19 04:34:45'),
(5, 'Giày da nam D25', 'giay - da - nam - d25', '350000.00', 'pexels-photo-26908.jpg', 1, 11, '2017-05-08 19:56:59', '2017-05-19 04:34:35'),
(6, 'Giày nam N123', 'giay - nam - n123', '212000.00', 'pexels-photo.jpg', 1, 11, '2017-05-08 19:58:37', '2017-05-19 04:34:22'),
(7, 'Giày thể thao T369', 'giay - the - thao - t369', '95000.00', 'pexels-photo-191159.jpeg', 1, 11, '2017-05-08 20:00:27', '2017-05-19 04:34:10'),
(8, 'Giày thể thao T231', 'giay - the - thao - t231', '120000.00', 'sports-shoes-running-shoes-sneakers-marathon-shoes-66259.jpeg', 1, 11, '2017-05-08 20:01:59', '2017-05-19 04:33:20'),
(9, 'Giày cao gót CG135', 'giay - cao - got - cg135', '155000.00', 'women-s-shoes-red-pin-fashion-66856.jpeg', 1, 12, '2017-05-08 20:03:33', '2017-05-19 04:33:03'),
(10, 'Giày nữ AS365', 'giay - nu - as365', '127000.00', 'pexels-photo-266840.jpeg', 1, 12, '2017-05-08 20:05:30', '2017-05-19 04:32:47'),
(16, 'Đồng hồ nam', 'đong - ho - nam', '120000.00', 'pexels-photo-125779.jpeg', 1, 17, '2017-05-19 00:03:06', '2017-05-19 00:03:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `promotion_price` decimal(8,2) NOT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`id`, `unit_price`, `promotion_price`, `intro`, `content`, `keywords`, `description`, `view`, `product_id`, `created_at`, `updated_at`) VALUES
(1, '195000.00', '120000.00', '<p>V&iacute; da nam đẹp nhất đ&agrave; nẵng ai ơi</p>', '<p>V&iacute; da nam đẹp nhất đ&agrave; nẵng</p>', 'Ví da nam đẹp nhất đà nẵng', 'Ví da nam đẹp nhất đà nẵng', 5, 1, '2017-05-08 18:35:16', '2017-07-03 23:38:14'),
(2, '250000.00', '0.00', '<p>Sơ mi nam</p>', '<p>Sơ mi nam</p>', 'Sơ mi nam', 'Sơ mi nam', 0, 2, '2017-05-08 18:50:14', '2017-05-08 18:50:14'),
(3, '160000.00', '145000.00', '<p>&Aacute;o thun nam A124</p>', '<p>&Aacute;o thun nam A124</p>', 'Áo thun nam A124', 'Áo thun nam A124', 2, 3, '2017-05-08 19:51:23', '2017-06-04 18:07:15'),
(4, '250000.00', '220000.00', '<p>Gi&agrave;y nam AT90</p>', '<p>Gi&agrave;y nam AT90</p>', 'Giày nam AT90', 'Giày nam AT90', 10, 4, '2017-05-08 19:55:08', '2017-06-23 21:56:04'),
(5, '520000.00', '500000.00', '<p>Gi&agrave;y da nam D25</p>', '<p>Gi&agrave;y da nam D25</p>', 'Giày da nam D25', 'Giày da nam D25', 30, 5, '2017-05-08 19:56:59', '2017-06-22 19:17:23'),
(6, '295000.00', '0.00', '<p>Gi&agrave;y nam N123</p>', '<p>Gi&agrave;y nam N123</p>', 'Giày nam N123', 'Giày nam N123', 3, 6, '2017-05-08 19:58:37', '2017-06-04 09:41:37'),
(7, '155000.00', '135000.00', '<p>Gi&agrave;y thể thao T369</p>', '<p>Gi&agrave;y thể thao T369</p>', 'Giày thể thao T369', 'Giày thể thao T369', 7, 7, '2017-05-08 20:00:27', '2017-06-04 09:00:38'),
(8, '220000.00', '200000.00', '<p>Gi&agrave;y thể thao T231</p>', '<p>Gi&agrave;y thể thao T231</p>', 'Giày thể thao T231', 'Giày thể thao T231', 11, 8, '2017-05-08 20:01:59', '2018-04-09 07:47:28'),
(9, '256000.00', '0.00', '<p>Gi&agrave;y cao g&oacute;t CG135</p>', '<p>Gi&agrave;y cao g&oacute;t CG135</p>', 'Giày cao gót CG135', 'Giày cao gót CG135', 17, 9, '2017-05-08 20:03:33', '2017-06-23 22:01:50'),
(10, '236000.00', '220000.00', '<p>Gi&agrave;y nữ AS365</p>', '<p>Gi&agrave;y nữ AS365</p>', 'Giày nữ AS365', 'Giày nữ AS365', 48, 10, '2017-05-08 20:05:30', '2018-09-11 19:19:20'),
(15, '250000.00', '235000.00', '<p>Đồng hồ nam nữ đẹp</p>', '<p>Đồng hồ nam nữ đẹp</p>', 'Đồng hồ nam nữ đẹp', 'Đồng hồ nam nữ đẹp', 37, 16, '2017-05-19 00:03:06', '2018-04-09 07:32:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(5, 'bow-tie-businessman-fashion-man.jpg', 2, '2017-05-08 18:50:14', '2017-05-08 18:50:14'),
(3, 'pexels-photo-316598.jpeg', 1, '2017-05-08 18:41:32', '2017-05-08 18:41:32'),
(4, 'wallet-cash-credit-card-pocket.jpg', 1, '2017-05-08 18:41:32', '2017-05-08 18:41:32'),
(6, 'light-red-white-home.jpg', 2, '2017-05-08 18:50:14', '2017-05-08 18:50:14'),
(7, 'pexels-photo-305270.jpeg', 3, '2017-05-08 19:51:23', '2017-05-08 19:51:23'),
(8, 'title-photo-logo-shirt-157580.jpeg', 3, '2017-05-08 19:51:23', '2017-05-08 19:51:23'),
(9, 'healthy-light-woman-legs.jpg', 4, '2017-05-08 19:55:08', '2017-05-08 19:55:08'),
(10, 'pexels-photo(1).jpg', 4, '2017-05-08 19:55:08', '2017-05-08 19:55:08'),
(11, 'pexels-photo.jpg', 4, '2017-05-08 19:55:08', '2017-05-08 19:55:08'),
(12, 'pexels-photo-29602.jpg', 4, '2017-05-08 19:55:08', '2017-05-08 19:55:08'),
(13, 'pexels-photo-63196.jpeg', 5, '2017-05-08 19:56:59', '2017-05-08 19:56:59'),
(14, 'pexels-photo-93018.jpeg', 5, '2017-05-08 19:56:59', '2017-05-08 19:56:59'),
(15, 'pexels-photo-113721.jpeg', 5, '2017-05-08 19:56:59', '2017-05-08 19:56:59'),
(16, 'pexels-photo-186037.jpeg', 5, '2017-05-08 19:56:59', '2017-05-08 19:56:59'),
(17, 'pexels-photo-66366.jpeg', 6, '2017-05-08 19:58:37', '2017-05-08 19:58:37'),
(18, 'pexels-photo-128904.jpeg', 6, '2017-05-08 19:58:37', '2017-05-08 19:58:37'),
(19, 'pexels-photo-167810.jpeg', 6, '2017-05-08 19:58:37', '2017-05-08 19:58:37'),
(20, 'pexels-photo-202168.jpeg', 6, '2017-05-08 19:58:37', '2017-05-08 19:58:37'),
(21, 'pexels-photo-128904.jpeg', 7, '2017-05-08 20:00:27', '2017-05-08 20:00:27'),
(22, 'pexels-photo-267294.jpeg', 7, '2017-05-08 20:00:27', '2017-05-08 20:00:27'),
(23, 'running-shoe-luminous-bright-yellow-52992.jpeg', 7, '2017-05-08 20:00:27', '2017-05-08 20:00:27'),
(24, 'running-shoe-shoe-brooks-highly-functional-54334.jpeg', 7, '2017-05-08 20:00:27', '2017-05-08 20:00:27'),
(25, 'healthy-light-woman-legs.jpg', 8, '2017-05-08 20:01:59', '2017-05-08 20:01:59'),
(26, 'pexels-photo(1).jpg', 8, '2017-05-08 20:01:59', '2017-05-08 20:01:59'),
(27, 'pexels-photo-99639.jpeg', 8, '2017-05-08 20:01:59', '2017-05-08 20:01:59'),
(28, 'pexels-photo-267294.jpeg', 8, '2017-05-08 20:01:59', '2017-05-08 20:01:59'),
(29, 'pexels-photo-134064.jpeg', 9, '2017-05-08 20:03:33', '2017-05-08 20:03:33'),
(30, 'pexels-photo-137603.jpeg', 9, '2017-05-08 20:03:33', '2017-05-08 20:03:33'),
(31, 'pexels-photo-336372.jpeg', 9, '2017-05-08 20:03:33', '2017-05-08 20:03:33'),
(32, 'shoes-red-stock-add-54621.jpeg', 9, '2017-05-08 20:03:33', '2017-05-08 20:03:33'),
(33, 'pexels-photo-25015.jpg', 10, '2017-05-08 20:05:30', '2017-05-08 20:05:30'),
(34, 'pexels-photo-129866.jpeg', 10, '2017-05-08 20:05:30', '2017-05-08 20:05:30'),
(35, 'pexels-photo-273930.jpeg', 10, '2017-05-08 20:05:30', '2017-05-08 20:05:30'),
(36, 'pexels-photo-313707.jpeg', 10, '2017-05-08 20:05:30', '2017-05-08 20:05:30'),
(49, 'rolex-watch-time-luxury-364822.jpeg', 16, '2017-05-19 00:03:06', '2017-05-19 00:03:06'),
(46, 'pexels-photo-190819.jpeg', 16, '2017-05-19 00:03:06', '2017-05-19 00:03:06'),
(47, 'pexels-photo-277390.jpeg', 16, '2017-05-19 00:03:06', '2017-05-19 00:03:06'),
(48, 'pexels-photo-277459.jpeg', 16, '2017-05-19 00:03:06', '2017-05-19 00:03:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `level`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@hotmail.com', '$2y$10$kLRKysLc.NnbNUnU96VLP.UPwK9qq85RcI4XsmSKe2q3NZfWwkN3a', 1, 1, '78lWbf5PBVUVfOOgkDpWK2NiEkDYhp1CtMy6sPMRPMwThkbFnfhOPgJtBCkB', '2017-05-10 07:03:02', '2017-07-03 23:31:06'),
(39, 'hoaitrinh', 'trinh@gmail.com', '$2y$10$7Xlo.vjiTrKQlgm2vDwS4u8hg17PlX85WPULLBTSJzVCuvsq2R8GK', 2, 1, 'bGgpC1pmMDi4s3MgpRxqH3CkRRwvmod7eh8CfiEPtxzIhqSY27VZDxwHnArx', '2017-06-03 01:44:36', '2017-06-12 22:04:09'),
(40, 'mod1', 'mod1@gmail.com', '$2y$10$ge6LCdU6S1gaffJ.mrTFsOC1SI0aexiewPudsWO6nqghtToo4iOrm', 2, 1, 'fV7qXGKY8p6pQQ1aJ4ZXaDK43zF3Xp5nO8nEF2Mn', '2017-06-05 04:59:47', '2017-07-03 23:29:09'),
(41, 'mod2', 'mod2@gmail.com', '$2y$10$nv.yuatXvODKLvohVxsSHOIPAoLV1OUSm5NkZIBn/I5FowzsRdM8C', 2, 1, 'fV7qXGKY8p6pQQ1aJ4ZXaDK43zF3Xp5nO8nEF2Mn', '2017-06-05 05:06:11', '2017-07-03 23:34:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_details`
--

CREATE TABLE `user_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_details`
--

INSERT INTO `user_details` (`id`, `name`, `birthday`, `tel`, `email`, `address`, `city`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Văn Duy', '19/09/1992', '01.648.638.658', 'duyit192@hotmail.com', 'K30/8 Lương Ngọc Quyến - Thuận Phước - Hải Châu', 'TP Đà Nẵng', 1, NULL, '2017-07-03 23:31:06'),
(35, 'Hoài Trinh', '10/12/1993', '0973884760', 'trinh@gmail.com', 'Hồ Thái', 'Hồ Chí Minh', 39, '2017-06-03 01:45:13', '2017-06-12 22:04:09'),
(36, '', '', '', '', '', '', 40, '2017-06-05 05:03:39', '2017-06-05 05:16:34');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorys_name_unique` (`name`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
