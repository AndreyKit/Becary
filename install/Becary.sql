-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 08 2020 г., 18:10
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Becary`
--
CREATE DATABASE IF NOT EXISTS `Becary` DEFAULT CHARACTER SET utf16 COLLATE utf16_bin;
USE `Becary`;

-- --------------------------------------------------------

--
-- Структура таблицы `eat`
--

CREATE TABLE `eat` (
  `id` int NOT NULL COMMENT '№',
  `nameeat` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Название блюда',
  `composition` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'Состав',
  `volume` int DEFAULT NULL COMMENT 'Объём порции',
  `unit` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Ед.изм.',
  `imgeat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Изображение блюда'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Дамп данных таблицы `eat`
--

INSERT INTO `eat` (`id`, `nameeat`, `composition`, `volume`, `unit`, `imgeat`) VALUES
(1, 'Торт Киевский', 'Мука, Мука2, Мука3, Мука4,', 100, 'г', 'xdb2GjdWBtI.jpg'),
(2, 'Торт Минский', 'Мука1, Мука2, Мука3, Мука4', 86, 'г', '29.jpg'),
(7, 'Торт в торте', 'Микс', 153, 'г', 'tort.jpg'),
(8, 'Торт без торта', 'Мука1', 500, 'г', 'tort-s-zhele.jpg'),
(9, 'Торт', 'без состава', 3000, 'г', 'zakazat-prazhskij-tort.jpg'),
(10, 'Торт с глазурью', 'Мука1, Мука2, Мука3, Мука4, Мука5', 1, 'г', 'tort-pancho.jpg'),
(11, 'Случайный торт', 'Случайный', 0, 'г', '5288c8e09362239411529.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

CREATE TABLE `group` (
  `id` int NOT NULL COMMENT '№',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя',
  `cod` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `group`
--

INSERT INTO `group` (`id`, `name`, `cod`) VALUES
(1, 'Администратор', 'admin'),
(2, 'Посетитель', 'user'),
(3, 'Менеджер торгового объекта', 'manager');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL COMMENT '№',
  `users_id` int NOT NULL COMMENT 'ФИ заказчика',
  `eat_id` int NOT NULL COMMENT 'Заказанное\r\nблюдо',
  `count` int DEFAULT NULL COMMENT 'Количество блюд',
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата заказа',
  `status` varchar(60) NOT NULL COMMENT 'Статус заказа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `users_id`, `eat_id`, `count`, `date`, `status`) VALUES
(10, 30, 1, 5, '2020-09-03 22:27:00', 'Ожидание'),
(11, 49, 9, 10, '2020-09-06 20:32:00', 'Ожидание'),
(12, 50, 1, 15, '2020-09-02 12:43:00', 'Ожидание'),
(14, 30, 2, 3, '2020-09-03 10:03:00', 'Ожидание'),
(15, 30, 1, 3, '2020-09-03 22:31:00', 'Ожидание'),
(16, 30, 1, 10, '2020-09-03 22:32:00', 'Ожидание'),
(17, 51, 11, 3, '2020-09-04 08:10:00', 'Ожидание'),
(18, 51, 10, 2, '2020-09-06 09:14:00', 'Ожидание'),
(19, 30, 11, 2, '2020-09-02 12:43:00', 'Отменён'),
(20, 30, 1, 2, '2020-09-06 00:00:00', 'Отменён'),
(21, 30, 1, 2, '2020-09-06 10:42:54', 'Отменён'),
(23, 51, 10, 4, '2020-09-06 18:54:00', '2'),
(24, 51, 2, 2, '2020-09-06 19:19:11', 'Отменён');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL COMMENT '№',
  `login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Пользователь',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Пароль',
  `FIO` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ФИО',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Почта',
  `group_id` int NOT NULL COMMENT 'Группа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `FIO`, `email`, `group_id`) VALUES
(30, 'Босс', '12f34', 'Андрей Китаев', 'andreykit2004@mail.ru', 1),
(49, 'Админ', '1f42', 'Илья Курликов', 'ilyakfas@mail.ru', 3),
(50, 'Админ', '23f21', 'Олег Шевцов', 'shevtsov@mail.ru', 3),
(51, 'User', '17f53', 'Николай.', 'Nikolya@gmail.com', 2),
(54, 'User', '2f28', 'Диментий', 'Dimern @mail.ru', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `eat`
--
ALTER TABLE `eat`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`,`eat_id`),
  ADD KEY `fk_orders_eat_idx` (`eat_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `group_id` (`group_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `eat`
--
ALTER TABLE `eat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `group`
--
ALTER TABLE `group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=55;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_eat` FOREIGN KEY (`eat_id`) REFERENCES `eat` (`id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

