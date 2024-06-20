-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3333
-- Время создания: Июн 19 2024 г., 09:57
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `equipment`
--

-- --------------------------------------------------------

--
-- Структура таблицы `classroom`
--

CREATE TABLE `classroom` (
  `Id` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Code` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `classroom`
--

INSERT INTO `classroom` (`Id`, `Name`, `Code`) VALUES
(1, 'Каптёрка', 'А306'),
(4, 'Кабинет', 'А102'),
(5, 'Склад', 'А001'),
(6, 'Аудитория', 'А112');

-- --------------------------------------------------------

--
-- Структура таблицы `equipment`
--

CREATE TABLE `equipment` (
  `Id` int NOT NULL,
  `Id_user` int DEFAULT NULL,
  `Id_classroom` int DEFAULT NULL,
  `Id_status` int DEFAULT NULL,
  `Name` varchar(150) NOT NULL,
  `Photo` blob,
  `Code` varchar(20) NOT NULL,
  `Price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `equipment`
--

INSERT INTO `equipment` (`Id`, `Id_user`, `Id_classroom`, `Id_status`, `Name`, `Photo`, `Code`, `Price`) VALUES
(14, 1, 1, 2, 'ПК', 0x53797374656d2e427974655b5d, '12345', 123),
(15, 4, 4, 1, 'Ноутбук', 0x53797374656d2e427974655b5d, '67890', 456),
(16, 5, 6, 2, 'Телевизор', 0x53797374656d2e427974655b5d, '1234567', 123),
(17, 6, 5, 1, 'Пылесос', 0x53797374656d2e427974655b5d, '12345678', 4567);

-- --------------------------------------------------------

--
-- Структура таблицы `Login`
--

CREATE TABLE `Login` (
  `Id` int NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Login`
--

INSERT INTO `Login` (`Id`, `Name`, `Password`) VALUES
(1, 'Admin', 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `Id` int NOT NULL,
  `roles` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`Id`, `roles`) VALUES
(1, 'Администратор'),
(2, 'Пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `Id` int NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`Id`, `Name`) VALUES
(1, 'Ремонт'),
(2, 'В рабочем состоянии');

-- --------------------------------------------------------

--
-- Структура таблицы `Story`
--

CREATE TABLE `Story` (
  `Id` int NOT NULL,
  `Id_pc` int NOT NULL,
  `Code_old` int NOT NULL,
  `Code_New` int NOT NULL,
  `Data` datetime NOT NULL,
  `User_Old` int NOT NULL,
  `User_New` int NOT NULL,
  `Comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Story`
--

INSERT INTO `Story` (`Id`, `Id_pc`, `Code_old`, `Code_New`, `Data`, `User_Old`, `User_New`, `Comment`) VALUES
(1, 4, 1, 2, '2024-05-30 12:08:55', 1, 1, ''),
(2, 7, 2, 1, '2024-05-30 12:09:23', 1, 1, 'АВЫЫВАЫВ'),
(3, 4, 1, 2, '2024-05-30 12:09:52', 1, 1, ''),
(4, 11, 1, 4, '2024-06-18 20:24:20', 1, 3, 'ыфвапролдждгнеа'),
(5, 12, 1, 1, '2024-06-18 20:31:38', 3, 1, 'Пуки каки');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `Id` int NOT NULL,
  `Login` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Role` varchar(13) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Patronymic` varchar(50) NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`Id`, `Login`, `Password`, `Role`, `Email`, `Surname`, `Name`, `Patronymic`, `Phone`) VALUES
(1, 'a', 'a', 'Пользователь', 'femka.ya2000@gmail.com', 'Ярыгин', 'Ефим', 'Сергеевич', '+79519434356'),
(4, 'qwert', '123', 'Пользователь', 'qwert@mail.ru', 'Львов', 'Лев', 'Левович', '+79231456781'),
(5, 'bb', 'bb', 'Пользователь', 'bb@mail.ru', 'Иванов', 'Иван', 'Иванович', '+79223291195'),
(6, 'aa', 'aa', 'Пользователь', 'aa@mail.ru', 'Ефимов', 'Ефим', 'Ефимович', '+75678492375');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);

--
-- Индексы таблицы `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_status` (`Id_status`),
  ADD KEY `Id_user` (`Id_user`),
  ADD KEY `Id_classroom` (`Id_classroom`);

--
-- Индексы таблицы `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);

--
-- Индексы таблицы `Story`
--
ALTER TABLE `Story`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `classroom`
--
ALTER TABLE `classroom`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `equipment`
--
ALTER TABLE `equipment`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `Login`
--
ALTER TABLE `Login`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT для таблицы `Story`
--
ALTER TABLE `Story`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`Id_status`) REFERENCES `status` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`Id_user`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipment_ibfk_3` FOREIGN KEY (`Id_classroom`) REFERENCES `classroom` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
