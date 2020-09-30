-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 30, 2020 at 04:51 PM
-- Server version: 8.0.15
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apartments`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartment_details`
--

CREATE TABLE `apartment_details` (
  `id` int(11) NOT NULL COMMENT 'id',
  `number_apartment` int(10) NOT NULL COMMENT 'number apartment',
  `address_apartment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'address apartment',
  `area` int(10) NOT NULL COMMENT 'area of apartment',
  `number_rooms` int(10) NOT NULL COMMENT 'number of rooms',
  `floor` int(10) NOT NULL COMMENT 'floor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='delails of apartment';

--
-- Dumping data for table `apartment_details`
--

INSERT INTO `apartment_details` (`id`, `number_apartment`, `address_apartment`, `area`, `number_rooms`, `floor`) VALUES
(1, 10, 'Москва, ул.Пригородная, 8', 100, 3, 2),
(2, 23, 'Москва, Звенигорское шоссе, 11', 40, 1, 12),
(3, 17, 'Москва, ул.Ефремова, 10к1', 80, 2, 11),
(4, 21, 'Москва, переулок Печатников, 19с1', 78, 2, 16),
(5, 56, 'Москва, ул.Ходынская, 2', 100, 2, 3),
(6, 40, 'Москва, переулок Красина, 16с1', 130, 4, 8),
(7, 3, 'Москва, ул.Садовническая, 57с2', 36, 1, 15),
(8, 64, 'Москва, Мукомольный проезд, 2', 70, 2, 13),
(9, 34, 'Москва, переулок Хилков, 1', 103, 3, 10),
(10, 27, 'Москва, ул.2-я Брестская, 6', 110, 3, 19),
(11, 37, 'Москва, Шлюзовская набережная, 2А', 110, 2, 32),
(12, 48, 'Москва, ул.Охотный ряд, 2', 120, 3, 22);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица городов';

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'Санкт-Петербург'),
(2, 'Москва'),
(3, 'Нижний Новгород'),
(4, 'Ярославль'),
(5, 'Иваново'),
(6, 'Владимир');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL COMMENT 'id field',
  `name_clients` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'name of clients',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'address of clients',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'phone number clients'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='about clients';

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name_clients`, `address`, `phone`) VALUES
(1, 'Семен Петрович', 'Москва, Подсосенский пер. 28с1', '8(495)784-44-12'),
(2, 'Евгения Ивановна', 'Москва, Малый Трехсвятительский пер. 2/1с1', '8(495)543-78-15'),
(3, 'Василий Алибабаевич', 'Москва, ул.Садовничества 19с1', '8(495)344-98-10'),
(4, 'Маргарита Семеновна', 'Москва, Чистый пер. 7с1', '8(495)233-45-87');

-- --------------------------------------------------------

--
-- Table structure for table `link_apartment_clients`
--

CREATE TABLE `link_apartment_clients` (
  `id` int(11) NOT NULL COMMENT 'id',
  `id_apartment` int(10) NOT NULL COMMENT 'id apartment',
  `id_client` int(10) NOT NULL COMMENT 'id client',
  `add_date` datetime NOT NULL COMMENT 'data of add record',
  `add_renewal` datetime NOT NULL COMMENT 'data of renewal record',
  `add_delete` datetime NOT NULL COMMENT 'data of delete record'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_apartment_clients`
--

INSERT INTO `link_apartment_clients` (`id`, `id_apartment`, `id_client`, `add_date`, `add_renewal`, `add_delete`) VALUES
(1, 1, 1, '2020-06-15 00:00:00', '2020-08-10 00:00:00', '2020-09-06 00:00:00'),
(2, 2, 1, '2020-05-18 00:00:00', '2020-06-22 00:00:00', '2020-07-20 00:00:00'),
(3, 3, 1, '2020-08-09 00:00:00', '2020-08-17 00:00:00', '2020-09-09 00:00:00'),
(4, 4, 2, '2020-08-09 00:00:00', '2020-09-01 00:00:00', '2020-09-13 00:00:00'),
(5, 9, 2, '2020-06-07 00:00:00', '2020-07-05 00:00:00', '2020-07-20 00:00:00'),
(6, 7, 2, '2020-06-07 00:00:00', '2020-08-02 00:00:00', '2020-08-24 00:00:00'),
(7, 5, 3, '2020-07-06 00:00:00', '2020-07-14 00:00:00', '2020-08-02 00:00:00'),
(8, 6, 3, '2020-08-16 00:00:00', '2020-08-23 00:00:00', '2020-09-01 00:00:00'),
(9, 10, 3, '2020-09-01 00:00:00', '2020-09-07 00:00:00', '2020-09-09 00:00:00'),
(10, 11, 4, '2020-08-25 00:00:00', '2020-08-26 00:00:00', '2020-09-14 00:00:00'),
(11, 8, 4, '2020-05-04 00:00:00', '2020-05-28 00:00:00', '2020-06-02 00:00:00'),
(12, 12, 4, '2020-05-30 00:00:00', '2020-06-15 00:00:00', '2020-06-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `photo_apartment`
--

CREATE TABLE `photo_apartment` (
  `id` int(11) NOT NULL COMMENT 'id',
  `id_apartment` int(10) NOT NULL COMMENT 'id apartment',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'link to photo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='photo of apartment';

--
-- Dumping data for table `photo_apartment`
--

INSERT INTO `photo_apartment` (`id`, `id_apartment`, `link`) VALUES
(1, 1, 'img/photoapartment/1.jpg'),
(2, 2, 'img/photoapartment/2.jpg'),
(3, 3, 'img/photoapartment/3.jpg'),
(4, 4, 'img/photoapartment/4.jpg'),
(5, 5, 'img/photoapartment/5.jpg'),
(6, 6, 'img/photoapartment/6.jpg'),
(7, 7, 'img/photoapartment/7.jpg'),
(8, 8, 'img/photoapartment/8.jpg'),
(9, 9, 'img/photoapartment/9.jpg'),
(10, 10, 'img/photoapartment/10.jpg'),
(11, 11, 'img/photoapartment/11.jpg'),
(12, 12, 'img/photoapartment/12.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) NOT NULL,
  `show_task` int(10) NOT NULL COMMENT 'отображение задачи',
  `name_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'имя пользователя',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text_task` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mark` int(13) NOT NULL COMMENT 'время в миллисекундах для определния пользователя',
  `edited` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `show_task`, `name_user`, `email`, `text_task`, `mark`, `edited`) VALUES
(1, 1, 'Семен', 'semen@mail.ru', 'купи молоко на завтра немного', 1601023159, 0),
(2, 0, 'Семен', 'semn@mail.ru', 'купить немного муки и пшеницы', 1601023159, 0),
(3, 1, 'Семен', 'semen@mail.ru', 'завтра собрать отчеты со всех компаний и подразделений', 1601023159, 0),
(4, 0, 'Семен', 'semen@mail.ru', 'встретится в субботу с представителями магазина', 1601023159, 0),
(5, 1, 'Семен', 'semen@mail.ru', 'зайти в гости к Бабкину и Маме', 1601023159, 1),
(6, 1, 'Семен', 'semen@mail.ru', 'Построить немного луджей на предпириятии', 1601023159, 0),
(7, 0, 'Семен', 'semen@mail.ru', 'Заменить лампочку в подъезде у соседнего дома.', 1601023159, 0),
(8, 0, 'Семен', 'semen@mail.ru', 'сходить на рыбалку на выходных', 1601023159, 0),
(9, 0, 'Семен', 'semen@mail.ru', 'покататся верхом на лошади', 1601023159, 0),
(10, 0, 'Семен', 'semen@rambler.ru', 'зайти в мастерскую и возьми ключи', 1601023159, 0),
(11, 0, 'Константин', 'kostya@mail.ru', 'зайти к другу на выходных', 1601023159, 0),
(12, 0, 'Семен', 'anon@rambler.ru', 'сделать домашнее задание', 1601023159, 0),
(13, 0, 'Юля', 'yulia@gmail.com', 'узнать сколько стоит сходить в парекмахерскую', 1601023159, 0),
(14, 0, 'Роман', 'romann@mail.ru', 'зайти в мастерскую по ремонту часов', 1601369117, 0),
(15, 0, 'Светлана', 'svenick@mail.ru', 'купить молока на завтра', 1601369117, 0),
(16, 0, 'Мирослав', 'mirosyla@rambler.ru', 'купить новый ноутбук для работы', 1601369117, 0),
(17, 0, 'Мариана', 'marinnaa@yahoo.com', 'посмотреть новости по погоде', 1601381807, 0),
(18, 0, 'Станислав', 'stasik77@mail.ru', 'позвонить знакомому в Ярославль', 1601381807, 0),
(19, 0, 'Мариана', 'marinnayyya@yahoo.com', 'зайти в магазин за подарками', 1601381807, 0),
(20, 1, 'Ереван', 'erevan88@mail.ru', 'написать скрипт для работы с почтой', 1601381807, 1),
(21, 0, 'test', 'test@test.com', 'это старый тест и не нужно на него смотреть :)', 1601381807, 1),
(22, 0, 'Василий', 'vasia17@gmail.com', 'сделать домашнюю работу', 1601381807, 0),
(23, 0, 'Константин', 'kostyea@mail.ru', 'завезти домой еду', 1601381807, 0),
(24, 0, 'Павел', 'pasha@mail.ru', 'зайти на работу вечером', 1601381807, 0),
(25, 1, 'Мариана', 'marinnaa@yahoo.com', 'купить больше печенья в магазине', 1601381807, 1),
(26, 0, 'Светлана', 'svetlatayen@mail.ru', 'купить немного новых и старых игрушек детям', 0, 1),
(27, 1, 'Мирослава', 'miroslava@mail.ru', 'купить детям немного и много подарков', 1601460558, 1),
(28, 1, 'Емельянов', 'emelya@mail.ru', 'заработать немного вечером денег', 1601460558, 1);

-- --------------------------------------------------------

--
-- Table structure for table `useradmin`
--

CREATE TABLE `useradmin` (
  `id` int(11) NOT NULL,
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `useradmin`
--

INSERT INTO `useradmin` (`id`, `login`, `password`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица пользователей';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `city_id`) VALUES
(1, 'Иван', 1),
(2, 'Юля', 2),
(3, 'Константин', 3),
(4, 'Евгения', 4),
(5, 'Маргарита', 5),
(6, 'Леонид', 6),
(7, 'Маргарита', 6),
(8, 'Игорь', 6),
(9, 'Савелий', 1),
(10, 'Василий', 1),
(11, 'Роман', 2),
(12, 'Леопольд', 2),
(13, 'Маргарита', 1),
(14, 'Константин', 3),
(15, 'Лена', 4),
(16, 'Василиса', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartment_details`
--
ALTER TABLE `apartment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link_apartment_clients`
--
ALTER TABLE `link_apartment_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo_apartment`
--
ALTER TABLE `photo_apartment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useradmin`
--
ALTER TABLE `useradmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartment_details`
--
ALTER TABLE `apartment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id field', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `link_apartment_clients`
--
ALTER TABLE `link_apartment_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `photo_apartment`
--
ALTER TABLE `photo_apartment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `useradmin`
--
ALTER TABLE `useradmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
