-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-11-25 04:11:35
-- 伺服器版本： 10.4.24-MariaDB
-- PHP 版本： 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `app`
--

-- --------------------------------------------------------

--
-- 資料表結構 `black`
--

CREATE TABLE `black` (
  `user_num` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `black`
--

INSERT INTO `black` (`user_num`) VALUES
(6);

-- --------------------------------------------------------

--
-- 資料表結構 `carousel`
--

CREATE TABLE `carousel` (
  `carousel_num` int(3) NOT NULL,
  `carousel-pic` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `carousel`
--

INSERT INTO `carousel` (`carousel_num`, `carousel-pic`) VALUES
(1, 'carousel_1_pic'),
(2, 'carousel_2_pic'),
(3, 'carousel_3_pic'),
(4, 'carousel_4_pic');

-- --------------------------------------------------------

--
-- 資料表結構 `collect`
--

CREATE TABLE `collect` (
  `user_num` varchar(20) NOT NULL,
  `s_num` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `collect`
--

INSERT INTO `collect` (`user_num`, `s_num`) VALUES
('1', '1'),
('1', '2'),
('3', '1'),
('3', '2'),
('3', '6'),
('4', '2'),
('4', '3'),
('4', '5'),
('5', '2'),
('5', '4'),
('5', '6');

-- --------------------------------------------------------

--
-- 資料表結構 `friend`
--

CREATE TABLE `friend` (
  `user_num` int(5) NOT NULL,
  `friend_num` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `friend`
--

INSERT INTO `friend` (`user_num`, `friend_num`) VALUES
(1, 2),
(3, 4),
(5, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `goods`
--

CREATE TABLE `goods` (
  `s_num` int(5) NOT NULL,
  `g_num` int(5) NOT NULL,
  `g_name` varchar(20) NOT NULL,
  `g_pic` text NOT NULL,
  `g_description` varchar(50) NOT NULL,
  `g_classification` varchar(10) NOT NULL,
  `g_price` int(5) NOT NULL,
  `g_maketime` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `goods`
--

INSERT INTO `goods` (`s_num`, `g_num`, `g_name`, `g_pic`, `g_description`, `g_classification`, `g_price`, `g_maketime`) VALUES
(1, 1000, '滷排骨便當', 'goods_1000_pic', '獨特滷汁', '豬肉|便當', 95, 5),
(1, 1002, '滷雞腿便當', 'goods_1002_pic', '獨特滷汁', '雞肉|便當', 90, 5),
(1, 1004, '招牌便當', 'goods_1004_pic', '當天現宰豬肉搭配獨特醬汁', '豬肉|便當', 80, 3),
(1, 1006, '炸豬排便當', 'goods_1006_pic', '炸的金黃酥脆', '豬肉|便當', 80, 10),
(1, 1008, '雞排便當', 'goods_1008_pic', '炸的金黃酥脆', '雞肉|便當', 90, 10),
(1, 1010, '魚排便當', 'goods_1010_pic', '炸的金黃酥脆', '魚肉|便當', 80, 10),
(1, 1012, '炸排骨便當', 'goods_1012_pic', '炸的金黃酥脆', '豬肉|便當', 80, 10),
(1, 1014, '炸雞腿便當', 'goods_1014_pic', '炸的金黃酥脆', '雞肉|便當', 90, 10),
(1, 1016, '紅糟肉便當', 'goods_1016_pic', '炸的紅紅酥脆的', '豬肉|便當', 80, 10),
(1, 1018, '爌肉便當', 'goods_1018_pic', '肥瘦均勻的爌肉', '豬肉|便當', 80, 10),
(2, 2003, '草莓(8顆)', 'goods_2003_pic', '草莓鮮紅多汁、質地柔軟', '水果', 100, 10),
(2, 2006, '鳳梨(一個)', 'goods_2006_pic', '鳳梨多汁酸甜', '水果', 25, 10),
(2, 2009, '南瓜(一顆)', 'goods_2009_pic', '含維他命A、糖、澱粉質、胡蘿蔔素', '蔬菜', 30, 10),
(2, 2012, '高麗菜(一顆)', 'goods_2012_pic', '含維生素C和植物纖維', '蔬菜', 50, 10),
(2, 2015, '生薑(一份)', 'goods_2015_pic', '去寒止渴', '蔬菜', 25, 10),
(2, 2018, '文旦(一顆)', 'goods_2018_pic', '含維生素、有機酸、礦物質', '蔬菜', 25, 10),
(2, 2021, '哈密瓜(一顆)', 'goods_2021_pic', '味道甜美', '水果', 30, 10),
(2, 2024, '檸檬(一份)', 'goods_2024_pic', '豐富維生素C', '水果', 25, 10),
(2, 2027, '酪梨(一顆)', 'goods_2027_pic', '通常搭配其他食材或調味料生食', '水果', 45, 10),
(2, 2030, '木瓜(一顆)', 'goods_2030_pic', '可以排毒豐胸', '水果', 20, 10),
(2, 2033, '火龍果(白)(一顆)', 'goods_2033_pic', '爽脆、甜度比較低', '水果', 30, 10),
(2, 2036, '火龍果(紅)(一顆)', 'goods_2036_pic', '果肉較軟、甜度比較高', '水果', 30, 10),
(3, 3001, '巧克力吐司', 'goods_3001_pic', '薄薄的吐司抹上一層甜甜的巧克力醬', '吐司', 20, 10),
(3, 3002, '花生厚片', 'goods_3002_pic', '厚片抹上一層甜甜的花生醬', '厚片', 25, 10),
(3, 3003, '蘑菇鐵板麵', 'goods_3003_pic', '媲美牛排館的滋味', '麵類', 50, 15),
(3, 3004, '火腿蛋吐司', 'goods_3004_pic', '吐司裡夾著美味的火腿及蛋', '豬肉|吐司', 40, 15),
(3, 3005, '招牌蛋吐司', 'goods_3005_pic', '吐司裡夾著美味的招牌肉及蛋', '吐司', 40, 15),
(3, 3006, '豬排蛋漢堡', 'goods_3006_pic', '厚厚的豬排被漢堡緊緊包住，一口咬下絕頂美味', '豬肉|漢堡', 50, 20),
(3, 3007, '奶茶', 'goods_3007_pic', '茶與奶精混合的美味飲料', '茶|飲料', 25, 10),
(3, 3008, '鮮奶茶', 'goods_3008_pic', '紅茶與牛奶黃金比例混合而成', '茶|飲料', 35, 10),
(3, 3009, '紅茶', 'goods_3009_pic', '日月潭茶葉沖泡而成', '茶|飲料', 30, 10),
(3, 3010, '巧克力可可', 'goods_3010_pic', '味道相似阿華田', '飲料', 30, 10),
(4, 4005, '高麗菜水餃(10顆)', 'goods_4005_pic', '高麗菜與豬肉得黃金比例結合', '豬肉|餃類', 55, 15),
(4, 4010, '韭菜水餃(10顆)', 'goods_4010_pic', '韭菜特殊的香氣讓人牽掛', '豬肉|餃類', 55, 15),
(4, 4015, '鮮蝦水餃(10顆)', 'goods_4015_pic', '用一整隻蝦子製作成的完美餃子', '豬肉|餃類', 60, 15),
(4, 4020, '玉米水餃(10顆)', 'goods_4020_pic', '手工玉米水餃使用黃金小麥獨家製作', '豬肉|餃類', 60, 15),
(4, 4025, '咖哩水餃(10顆)', 'goods_4025_pic', '加入了炒過的洋蔥和紅蘿蔔把洋蔥的鮮甜味帶出來', '豬肉|餃類', 60, 15),
(4, 4030, '玉米濃湯', 'goods_4030_pic', '用新鮮玉米精心熬煮而成', '湯品', 30, 10),
(4, 4035, '酸辣湯', 'goods_4035_pic', '起源於中國 四川省的食品，也是開胃食品之一', '湯品', 30, 10),
(4, 4040, '皮蛋豆腐', 'goods_4040_pic', '用內脂豆腐、榨菜、皮蛋、香油、香菜等原料製作而成', '小菜', 25, 10),
(4, 4045, '豬頭皮', 'goods_4045_pic', '純天然優質水解造粒膠原蛋白', '小菜', 25, 10),
(4, 4050, '滷蛋', 'goods_4050_pic', '由滷水煮成的雞蛋', '小菜', 15, 10),
(5, 5011, '斜口鉗', 'goods_5011_pic', '用於切割電線、塑膠物、金屬物等的工具', '工具|五金', 250, 2),
(5, 5020, '尖嘴鉗', 'goods_5020_pic', '是可以用來剪斷及固定的鉗', '工具|五金', 250, 2),
(5, 5029, '電動起子', 'goods_5029_pic', '利用馬達轉動來進行鎖螺絲、挖孔等動作', '工具|五金', 1500, 2),
(5, 5038, '電動鑽尾', 'goods_5038_pic', '電動起子的耗材', '工具|五金', 100, 2),
(5, 5047, '鐵鎚', 'goods_5047_pic', '主要用來進行敲打、撬開、移動 物體', '工具|五金', 150, 2),
(5, 5056, '美工刀', 'goods_5056_pic', '由刀殼、刀片、導軌、固定器等部件所組成', '工具|五金', 80, 2),
(5, 5065, 'WD40', 'goods_5065_pic', '提供除濕、潤滑等功效，甚至有效去除任何表面上的油脂污垢等', '工具|五金', 500, 2),
(5, 5074, '十字起子', 'goods_5074_pic', '由一個塑膠手把外加一個棘輪機構', '工具|五金', 170, 2),
(5, 5083, '一字起子', 'goods_5083_pic', '是由一個塑膠手把外加一個可以鎖螺絲的鐵棒', '工具|五金', 170, 2),
(5, 5092, '捲尺', 'goods_5092_pic', '是一種軟性的測量工具', '工具|五金', 140, 2),
(6, 6003, '紐奧良雞腿堡', 'goods_6003_pic', '新鮮去骨雞腿肉搭上紐奧良風味醬汁', '雞肉|漢堡', 70, 20),
(6, 6005, '起司厚牛堡', 'goods_6005_pic', '吃得到厚實的和牛肉排，疊上超濃郁的起司片、蔬菜和特調醬料', '牛肉|漢堡', 75, 20),
(6, 6007, '咔啦雞腿堡', 'goods_6007_pic', '獨門醬料醃製，搭配上獨家技術裹粉的100%原塊咔啦雞腿肉', '雞肉|漢堡', 65, 20),
(6, 6009, '麥香雞堡', 'goods_6009_pic', '芝麻麵包、生菜和香雞排，造就了這經典美味', '雞肉|漢堡', 50, 20),
(6, 6011, '雙層起司豬排堡', 'goods_6011_pic', '酥脆的微牽絲起司排香醇濃郁，與雙層100%純牛肉交織出多層次風味', '豬肉|漢堡', 70, 20),
(6, 6013, '里肌豬排堡', 'goods_6013_pic', '台灣牧場豬100%原塊分切里肌肉', '豬肉|漢堡', 60, 20),
(6, 6015, '花生醬厚牛堡', 'goods_6015_pic', '非常厚的漢堡肉搭配培根以及香濃黏稠又溫熱的花生醬', '牛肉|漢堡', 75, 20),
(6, 6017, '墨西哥辣牛堡', 'goods_6017_pic', '墨西哥辣牛肉夾在現烤麵包中，獨特鹹辣風味，搭配清爽的蔬菜', '牛肉|漢堡', 75, 20),
(6, 6019, '黃金鱈魚堡', 'goods_6019_pic', '軟嫩新鮮的鱈魚，搭配高麗菜絲，淋上與海鮮最對味的特調塔塔醬', '魚肉|漢堡', 70, 20),
(6, 6021, '蔥爆豬柳堡 ', 'goods_6021_pic', '醃漬過的豬柳以奶油拌炒，起鍋前再撒上黑胡椒嗆出迷人鍋氣', '豬肉|漢堡', 50, 20),
(7, 7001, '原味雞蛋糕', 'goods_7001_pic', '蓬鬆好入口', '雞蛋糕', 50, 5),
(7, 7002, '呼呼冷泡茶', 'goods_7002_pic', '回甘就像現泡', '飲料', 40, 5),
(7, 7003, '虎哥青草茶', 'goods_7003_pic', '清涼退火', '飲料', 40, 5),
(7, 7004, '雞歪奶茶', 'goods_7004_pic', '使用安家奶粉', '飲料', 40, 5),
(7, 7005, '狐狸紅茶', 'goods_7005_pic', '高山紅茶', '飲料', 30, 5);

-- --------------------------------------------------------

--
-- 資料表結構 `order`
--

CREATE TABLE `order` (
  `o_num` int(10) NOT NULL,
  `user_num` int(5) NOT NULL,
  `s_num` int(5) NOT NULL,
  `o_datetime` datetime NOT NULL,
  `o_finishtime` datetime DEFAULT NULL,
  `o_state` varchar(5) NOT NULL,
  `o_maketime` int(11) DEFAULT NULL,
  `o_discount` int(11) NOT NULL,
  `qr_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `order`
--

INSERT INTO `order` (`o_num`, `user_num`, `s_num`, `o_datetime`, `o_finishtime`, `o_state`, `o_maketime`, `o_discount`, `qr_code`) VALUES
(2345, 3, 3, '2022-08-04 11:00:00', NULL, '已完成', NULL, 0, ''),
(3456, 1, 4, '2022-08-05 19:30:00', NULL, '已完成', NULL, 0, ''),
(5678, 1, 2, '2022-08-03 18:00:00', NULL, '已取消', NULL, 0, ''),
(6981, 5, 6, '2022-08-07 14:30:00', NULL, '已接單', NULL, 0, ''),
(7857, 1, 2, '2022-09-27 22:24:29', '2022-09-27 22:27:36', '可取餐', 3, 0, ''),
(7858, 1, 2, '2022-09-27 22:24:46', '2022-09-27 22:27:48', '未接單', 3, 0, ''),
(7859, 1, 2, '2022-09-27 22:26:13', '2022-09-27 22:29:15', '已拒絕', 3, 0, ''),
(7860, 1, 2, '2022-09-28 21:08:54', '2022-09-28 21:12:00', '未接單', 3, 0, ''),
(7861, 1, 1, '2022-09-28 23:02:27', '2022-09-28 23:05:30', '已完成', 3, 0, ''),
(7862, 1, 1, '2022-09-28 23:15:31', '2022-09-28 23:15:32', '已完成', 0, 0, ''),
(7863, 1, 1, '2022-09-28 23:27:07', '2022-09-28 23:30:12', '已拒絕', 3, 0, ''),
(7864, 1, 1, '2022-11-19 16:24:29', '2022-11-19 16:47:42', '已拒絕', 23, 0, ''),
(7865, 1, 1, '2022-11-20 14:17:59', '2022-11-20 14:39:06', '已完成', 11, 0, ''),
(7866, 1, 1, '2022-11-21 22:46:44', '2022-11-21 22:57:48', '已拒絕', 11, 0, ''),
(7867, 1, 3, '2022-11-21 22:45:38', '2022-11-21 22:57:57', '未接單', 11, 0, ''),
(7868, 1, 1, '2022-11-22 16:55:34', '2022-11-22 17:28:38', '已完成', 18, 0, ''),
(7869, 1, 1, '2022-11-22 19:11:43', '2022-11-22 19:32:47', '已完成', 11, 3, ''),
(7870, 1, 1, '2022-11-22 19:20:12', '2022-11-22 19:55:15', '已完成', 20, 2, ''),
(7874, 2, 1, '2022-11-25 10:07:50', '2022-11-25 10:24:55', '已完成', 7, 0, '');

-- --------------------------------------------------------

--
-- 資料表結構 `orderdetail`
--

CREATE TABLE `orderdetail` (
  `o_num` int(10) NOT NULL,
  `g_num` int(5) NOT NULL,
  `g_price` int(5) NOT NULL,
  `g_quantity` int(5) NOT NULL,
  `g_commentdate` date NOT NULL,
  `g_comment` varchar(100) NOT NULL,
  `g_rating` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `orderdetail`
--

INSERT INTO `orderdetail` (`o_num`, `g_num`, `g_price`, `g_quantity`, `g_commentdate`, `g_comment`, `g_rating`) VALUES
(2345, 3003, 50, 4, '2022-08-04', '鮮奶茶混合的比例恰到好處\r\n', 5),
(2345, 3008, 35, 5, '2022-08-04', '鮮奶茶混合的比例恰到好處\r\n', 5),
(5678, 2021, 30, 2, '2022-08-03', '哈密瓜甜到心坎裡\r\n\r\n', 5),
(5678, 2030, 20, 10, '2022-08-03', '木瓜甜而不膩\r\n\r\n', 5),
(7789, 5011, 250, 1, '2022-08-06', '斜口鉗好剪 不會鈍\r\n', 4),
(7789, 5029, 1500, 1, '2022-08-06', '電動起子輕也不會占空間\r\n', 4),
(7793, 5011, 250, 1, '2022-09-26', '', 3),
(7793, 5047, 150, 1, '2022-09-26', '', 3),
(7793, 5056, 80, 1, '2022-09-26', '', 4),
(7857, 2003, 100, 1, '0000-00-00', '', NULL),
(7858, 2009, 30, 1, '0000-00-00', '', NULL),
(7859, 2006, 25, 1, '0000-00-00', '', NULL),
(7860, 2009, 30, 1, '0000-00-00', '', NULL),
(7860, 2018, 25, 1, '0000-00-00', '', NULL),
(7861, 1002, 90, 1, '0000-00-00', '', NULL),
(7861, 1008, 90, 1, '0000-00-00', '', NULL),
(7861, 1010, 80, 1, '0000-00-00', '', NULL),
(7861, 1012, 80, 1, '0000-00-00', '', NULL),
(7861, 1014, 90, 1, '0000-00-00', '', NULL),
(7861, 1016, 80, 1, '0000-00-00', '', NULL),
(7861, 1018, 80, 1, '0000-00-00', '', NULL),
(7862, 1000, 100, 1, '0000-00-00', '', NULL),
(7862, 1002, 90, 1, '0000-00-00', '', NULL),
(7862, 1004, 80, 1, '0000-00-00', '', NULL),
(7862, 1006, 80, 1, '0000-00-00', '', NULL),
(7862, 1010, 80, 1, '0000-00-00', '', NULL),
(7863, 1000, 100, 1, '0000-00-00', '', NULL),
(7863, 1002, 90, 1, '0000-00-00', '', NULL),
(7863, 1008, 90, 1, '0000-00-00', '', NULL),
(7864, 1004, 80, 1, '0000-00-00', '', NULL),
(7864, 1008, 90, 1, '0000-00-00', '', NULL),
(7864, 1014, 90, 1, '0000-00-00', '', NULL),
(7865, 1000, 100, 2, '2022-11-20', '', 3),
(7865, 1002, 90, 2, '2022-11-20', '', 3),
(7866, 1000, 100, 1, '0000-00-00', '', NULL),
(7866, 1002, 90, 1, '0000-00-00', '', NULL),
(7867, 1000, 100, 1, '0000-00-00', '', NULL),
(7867, 1002, 90, 1, '0000-00-00', '', NULL),
(7868, 1000, 95, 1, '0000-00-00', '', NULL),
(7868, 1004, 80, 1, '0000-00-00', '', NULL),
(7868, 1006, 80, 1, '0000-00-00', '', NULL),
(7869, 1000, 95, 2, '2022-11-22', '', 3),
(7869, 1002, 90, 2, '2022-11-22', '', 1),
(7870, 1006, 80, 2, '2022-11-22', '', 4),
(7870, 1008, 90, 2, '2022-11-22', '', 1),
(7874, 1000, 95, 1, '2022-11-25', '', 3);

-- --------------------------------------------------------

--
-- 資料表結構 `recommend`
--

CREATE TABLE `recommend` (
  `user_num` int(5) NOT NULL,
  `s_num` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `recommend`
--

INSERT INTO `recommend` (`user_num`, `s_num`) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 5),
(5, 4),
(5, 6);

-- --------------------------------------------------------

--
-- 資料表結構 `shop`
--

CREATE TABLE `shop` (
  `s_num` int(5) NOT NULL,
  `s_name` varchar(20) NOT NULL,
  `s_account` varchar(20) NOT NULL,
  `s_password` varchar(20) NOT NULL,
  `s_phone` varchar(10) NOT NULL,
  `s_pic` text NOT NULL,
  `s_longitude` double NOT NULL,
  `s_latitude` double NOT NULL,
  `s_slogan` varchar(20) NOT NULL,
  `s_address` varchar(50) NOT NULL,
  `s_businesshours` varchar(15) NOT NULL,
  `s_landmark` text NOT NULL,
  `s_classification` varchar(5) NOT NULL,
  `s_estimatedtime` int(5) NOT NULL,
  `s_logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `shop`
--

INSERT INTO `shop` (`s_num`, `s_name`, `s_account`, `s_password`, `s_phone`, `s_pic`, `s_longitude`, `s_latitude`, `s_slogan`, `s_address`, `s_businesshours`, `s_landmark`, `s_classification`, `s_estimatedtime`, `s_logo`) VALUES
(1, '方便當叔叔', 'fa123', 'fa456', '072281399', 'shop_1_pic', 179405.18613167526, 2514187.637882477, '方便、快速又便宜', '高雄市楠梓區後勁南路287號', '10:30~21:00', '', '中式', 15, 'shop_1_logo'),
(2, '王牌蔬果', 've123', 've456', '072254685', 'shop_2_pic', 179548.9896, 2513584.2981, '水果大又肥美', '高雄市楠梓區加昌路220號', '09:00-21:00', '', '蔬果', 15, 'shop_2_logo'),
(3, '好日子早午餐', 'bk123', 'bk456', '072269911', 'shop_3_pic', 179205.68073377584, 2509961.6845739726, '早餐是每個好日子的開始', '高雄市左營區華夏路900號', '06:00-13:00', '', '中西式', 15, 'shop_3_logo'),
(4, '銀魚之家', 'du123', 'du456', '072204930', 'shop_4_pic', 179282.0314, 2517306.7518, '包得住美味，包不住回味', '高雄市橋頭區成功南路37號', '11:00-20:00', '', '中式', 20, 'shop_4_logo'),
(5, '倫家五金行', 'me123', 'me456', '072246666', 'shop_5_pic', 178392.1589, 2521634.2382, '您的居家疑難雜症，交給倫家', '高雄市岡山區大仁北路377號', '09:00-22:00', '', '五金', 10, 'shop_5_logo'),
(6, '大俠愛吃漢堡包', 'hm123', 'hm456', '072295678', 'shop_6_pic', 179930.8482, 2505887.904, '把美味都包起來', '高雄市三民區愛國路141號', '14:00-22:00', '', '西式', 25, 'shop_6_logo'),
(7, '機歪虎狸g蛋糕', 'gy123', 'gy456', '070695671', 'shop_7_pic', 173444.2212, 2514288.5879, '雞蛋糕已做好免等待', '高雄市梓官區漁港二路13號', '14:00-18:00', '', '中式', 5, 'shop_7_logo');

-- --------------------------------------------------------

--
-- 資料表結構 `shopcomment`
--

CREATE TABLE `shopcomment` (
  `user_num` int(5) NOT NULL,
  `s_num` int(5) NOT NULL,
  `o_num` int(5) NOT NULL,
  `s_commentdate` date NOT NULL,
  `s_comment` varchar(100) NOT NULL,
  `s_rating` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `shopcomment`
--

INSERT INTO `shopcomment` (`user_num`, `s_num`, `o_num`, `s_commentdate`, `s_comment`, `s_rating`) VALUES
(2, 1, 1234, '2022-11-25', '', 4),
(3, 3, 2345, '2022-08-04', '服務人員態度親切，東西也好吃\r\n', 5),
(5, 4, 3456, '2022-08-05', '餃子皮薄多汁多餡\r\n\r\n', 5),
(1, 2, 5678, '2022-08-03', '水果顏色漂亮，大又肥美\r\n\r\n', 5),
(5, 6, 6981, '2022-08-07', '餐車位置顯眼，漢堡不輸速食店\r\n', 5),
(1, 1, 7861, '2022-11-22', '', 5),
(1, 1, 7862, '2022-11-22', '', 5),
(1, 1, 7863, '2022-11-22', '', 5),
(1, 1, 7864, '2022-11-22', '', 5),
(1, 1, 7865, '2022-11-22', '', 5),
(1, 1, 7866, '2022-11-22', '', 5),
(1, 1, 7867, '2022-11-22', '', 5),
(1, 1, 7868, '2022-11-22', '', 5),
(1, 1, 7869, '2022-11-22', '', 5),
(1, 1, 7870, '2022-11-22', '', 5),
(2, 1, 7874, '2022-11-25', '', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `user_num` int(5) NOT NULL,
  `account` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `name` varchar(5) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `avatar` text NOT NULL,
  `gender` int(1) NOT NULL,
  `point` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`user_num`, `account`, `password`, `phone`, `name`, `birthday`, `email`, `address`, `avatar`, `gender`, `point`) VALUES
(1, 'chen123', 'gge456', '0930555642', '黃大竣', '2000-10-10', 'sb201010@gmail.com', '高雄市楠梓區海專路87號', 'user_1_avatar', 1, 2),
(2, '123', '123', '0963998452', '詹中昌', '2000-09-09', 'aa200909@gmail.com', '高雄市岡山區小仁南路66號', 'user_2_avatar', 1, 6),
(3, 'lin456', 'yrr769', '0928743682', '吳小諺', '2000-11-30', 'hd201130@gmail.com', '高雄市左營區重愛路888號', 'user_3_avatar', 1, 0),
(4, 'liu678', 'kyt921', '0982541666', '范白昀', '2000-12-12', 'wh201212@gmail.com', '高雄市橋頭區橋新六路1號3樓', 'user_4_avatar', 1, 10),
(5, 'a123', 'b456', '0932410953', '陳找珣', '2000-12-31', 'by201231@gmail.com', '高雄市三民區民族一路321號', 'user_5_avatar', 1, 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`carousel_num`);

--
-- 資料表索引 `collect`
--
ALTER TABLE `collect`
  ADD PRIMARY KEY (`user_num`,`s_num`);

--
-- 資料表索引 `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`user_num`);

--
-- 資料表索引 `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`g_num`);

--
-- 資料表索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`o_num`);

--
-- 資料表索引 `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`o_num`,`g_num`);

--
-- 資料表索引 `recommend`
--
ALTER TABLE `recommend`
  ADD PRIMARY KEY (`user_num`,`s_num`);

--
-- 資料表索引 `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`s_num`);

--
-- 資料表索引 `shopcomment`
--
ALTER TABLE `shopcomment`
  ADD PRIMARY KEY (`o_num`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_num`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `carousel`
--
ALTER TABLE `carousel`
  MODIFY `carousel_num` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `friend`
--
ALTER TABLE `friend`
  MODIFY `user_num` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=900;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `goods`
--
ALTER TABLE `goods`
  MODIFY `g_num` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7009;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order`
--
ALTER TABLE `order`
  MODIFY `o_num` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7875;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `o_num` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7875;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `shop`
--
ALTER TABLE `shop`
  MODIFY `s_num` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `user_num` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6792;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
