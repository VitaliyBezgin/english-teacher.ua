-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Фев 08 2021 г., 20:53
-- Версия сервера: 8.0.22-0ubuntu0.20.04.3
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `english_teacher`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `category_title`, `category_type`, `created_at`, `updated_at`) VALUES
(1, 'Staff Psychologist', 'for words', '2021-02-07 11:07:53', '2021-02-07 11:07:53'),
(2, 'Audiologist', 'for theory', '2021-02-07 11:07:53', '2021-02-07 11:07:53'),
(3, 'Judge', 'for theory', '2021-02-07 11:07:54', '2021-02-07 11:07:54'),
(4, 'Well and Core Drill Operator', 'for theory', '2021-02-07 11:07:54', '2021-02-07 11:07:54'),
(5, 'Geography Teacher', 'for words', '2021-02-07 11:07:54', '2021-02-07 11:07:54'),
(6, 'Pharmacist', 'for theory', '2021-02-07 11:07:54', '2021-02-07 11:07:54'),
(7, 'Biologist', 'for words', '2021-02-07 11:07:54', '2021-02-07 11:07:54'),
(8, 'Pediatricians', 'for words', '2021-02-07 11:07:54', '2021-02-07 11:07:54'),
(9, 'Highway Patrol Pilot', 'for words', '2021-02-07 11:07:54', '2021-02-07 11:07:54'),
(10, 'Supervisor of Police', 'for theory', '2021-02-07 11:07:54', '2021-02-07 11:07:54');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `theory_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `fileables_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileables_id` bigint UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `friends`
--

CREATE TABLE `friends` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `friend_id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `imageables_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageables_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `imageables_type`, `imageables_id`, `image`, `created_at`, `updated_at`) VALUES
(5, 'App\\User', 25, 'MIKE.jpg', '2021-02-07 10:53:07', '2021-02-07 10:53:07'),
(6, 'App\\Models\\Words', 3, 'Снимок экрана от 2021-02-04 10-33-26.png', '2021-02-07 12:47:20', '2021-02-07 12:47:20'),
(7, 'App\\Models\\Words', 4, 'compass.png', '2021-02-07 12:55:17', '2021-02-07 12:55:17');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2021_02_07_104411_create_image_table', 3),
(28, '2014_10_12_000000_create_users_table', 4),
(29, '2014_10_12_100000_create_password_resets_table', 4),
(30, '2019_08_19_000000_create_failed_jobs_table', 4),
(31, '2021_02_04_123448_create_user_levels_table', 4),
(32, '2021_02_04_124407_create_categories_table', 4),
(33, '2021_02_04_124952_create_theories_table', 4),
(34, '2021_02_04_130252_create_friends_table', 4),
(35, '2021_02_04_130816_create_practices_table', 4),
(36, '2021_02_04_130958_create_comments_table', 4),
(37, '2021_02_04_131151_create_words_table', 4),
(38, '2021_02_04_131935_create_files_table', 4),
(39, '2021_02_06_184433_create_jobs_table', 4),
(40, '2021_02_07_104411_create_images_table', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `practices`
--

CREATE TABLE `practices` (
  `id` bigint UNSIGNED NOT NULL,
  `theory_id` bigint UNSIGNED NOT NULL,
  `questions` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `theories`
--

CREATE TABLE `theories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `theory_title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theory_video` json DEFAULT NULL,
  `theory_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `theories`
--

INSERT INTO `theories` (`id`, `category_id`, `theory_title`, `header`, `theory_video`, `theory_body`, `created_at`, `updated_at`) VALUES
(1, 1, 'theory - >Alfonso', 'Prof.', '\"http://cronin.biz/\"', 'Latitude was, or Longitude I\'ve got to go near the door, and tried to beat them off, and she very soon finished it off. * * * * * * * * * * * * * * * \'What a curious croquet-ground in her life; it.', '2021-02-07 11:07:55', '2021-02-07 11:07:55'),
(2, 2, 'theory - >Carroll', 'Dr.', '\"http://harris.com/quod-pariatur-error-occaecati-iusto.html\"', 'I should like it very hard indeed to make SOME change in my time, but never ONE with such a nice soft thing to eat or drink something or other; but the cook had disappeared. \'Never mind!\' said the.', '2021-02-07 11:07:55', '2021-02-07 11:07:55'),
(3, 3, 'theory - >Jayson', 'Dr.', '\"http://mayer.net/\"', 'It was all finished, the Owl, as a drawing of a muchness?\' \'Really, now you ask me,\' said Alice, \'it\'s very easy to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'I\'m glad they.', '2021-02-07 11:07:56', '2021-02-07 11:07:56'),
(4, 4, 'theory - >Finn', 'Dr.', '\"http://www.bruen.com/dolor-animi-nesciunt-eos-quae-voluptas-vel\"', 'Alice replied very gravely. \'What else have you executed.\' The miserable Hatter dropped his teacup instead of onions.\' Seven flung down his cheeks, he went on again:-- \'I didn\'t know that you\'re.', '2021-02-07 11:07:56', '2021-02-07 11:07:56'),
(5, 5, 'theory - >Bethel', 'Dr.', '\"https://pfeffer.com/consequatur-beatae-aut-enim-hic.html\"', 'Bill had left off when they hit her; and the March Hare. Alice was beginning to get in?\' \'There might be some sense in your pocket?\' he went on talking: \'Dear, dear! How queer everything is queer.', '2021-02-07 11:07:56', '2021-02-07 11:07:56'),
(6, 6, 'theory - >Everett', 'Dr.', '\"https://fisher.info/quasi-et-hic-labore-odio-molestiae.html\"', 'ME\' beautifully printed on it except a little wider. \'Come, it\'s pleased so far,\' said the Dormouse, after thinking a minute or two, it was neither more nor less than a real nose; also its eyes.', '2021-02-07 11:07:56', '2021-02-07 11:07:56'),
(7, 7, 'theory - >Caroline', 'Mrs.', '\"http://www.hartmann.biz/molestiae-aut-voluptatem-quisquam-velit\"', 'When the sands are all pardoned.\' \'Come, THAT\'S a good deal: this fireplace is narrow, to be patted on the breeze that followed them, the melancholy words:-- \'Soo--oop of the tea--\' \'The twinkling.', '2021-02-07 11:07:56', '2021-02-07 11:07:56'),
(8, 8, 'theory - >Jackeline', 'Prof.', '\"http://cummerata.com/quidem-esse-doloremque-ut-eum\"', 'I suppose Dinah\'ll be sending me on messages next!\' And she squeezed herself up and beg for its dinner, and all of them attempted to explain the mistake it had fallen into the way the people near.', '2021-02-07 11:07:56', '2021-02-07 11:07:56'),
(9, 9, 'theory - >Breanne', 'Mr.', '\"http://www.satterfield.com/dignissimos-ratione-saepe-et-quod-aut-assumenda-dolore-amet.html\"', 'Duchess, as she could, and waited till she was up to Alice, flinging the baby violently up and said, without even waiting to put everything upon Bill! I wouldn\'t say anything about it, so she helped.', '2021-02-07 11:07:56', '2021-02-07 11:07:56'),
(10, 10, 'theory - >Earline', 'Prof.', '\"http://www.schultz.com/\"', 'Mouse with an M--\' \'Why with an air of great relief. \'Call the next witness!\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, \'to speak to this last remark that had fluttered.', '2021-02-07 11:07:56', '2021-02-07 11:07:56');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `fname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `fname`, `sname`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(25, 'Виталий', 'Безгин', 'bezgin96@ukr.net', '0931205426', NULL, '$2y$10$p1JKb6PYLvDe2PvE/GinYu8plEZbUB4M9bNNh2l0FQjsZth.gw2cC', NULL, '2021-02-07 10:53:07', '2021-02-07 10:53:07'),
(26, 'Katrine', 'Trantow', 'buster.tromp@example.com', '1-892-556-3697', '2021-02-07 11:07:50', '$2y$10$tGWMG21eyhIC8izMw/pRbeUzoGp9A4EA0hMDw1zkmfHMiSJVotJ/.', 'GI7gLMpdkG', '2021-02-07 11:07:50', '2021-02-07 11:07:50'),
(27, 'Keara', 'Dicki', 'yklein@example.net', '(350) 239-8279', '2021-02-07 11:07:50', '$2y$10$IDs/sbnqQQeGWy8cNN5NXO9.7Ld0Tm2BKgPoituW6n44LRisLHsPC', 'EPPw7yTmdM', '2021-02-07 11:07:50', '2021-02-07 11:07:50'),
(28, 'Kevin', 'Roberts', 'leonardo90@example.org', '1-893-236-7014', '2021-02-07 11:07:50', '$2y$10$aKH3DWX4qCaJg2BXcCJTtu6ROuIGW.I1n8tOaKI90uT2tUmp5xyau', 'ASzin7jKoc', '2021-02-07 11:07:50', '2021-02-07 11:07:50'),
(29, 'Lorenza', 'Hagenes', 'pacocha.evans@example.org', '(568) 906-4279', '2021-02-07 11:07:50', '$2y$10$Wg/zKTzMPxV04YYtuLDoZ.DFcCU2i7ayKJGB7.gZ9KHn0GPiGRXZi', 'Lg7Ikur455', '2021-02-07 11:07:50', '2021-02-07 11:07:50'),
(30, 'Noemi', 'Hermiston', 'schulist.rosalia@example.net', '+13519997404', '2021-02-07 11:07:50', '$2y$10$sRWf.PSq5QaEM9fSY1Urre3VAm93hmXPCGjvqL0vpzgszdQ0T1HaK', 'uNZUWKbeC7', '2021-02-07 11:07:50', '2021-02-07 11:07:50'),
(31, 'Clementine', 'Miller', 'braun.monserrate@example.com', '1-806-984-3484', '2021-02-07 11:07:51', '$2y$10$DxF9E8j0lR3vP4kNF4yJp.qTXvdAXt1Qg.X7SmpI4FPOB6Ho6Ep4a', 'bK4SSVgmQR', '2021-02-07 11:07:51', '2021-02-07 11:07:51'),
(32, 'Felicity', 'Heller', 'jared52@example.com', '1-813-755-1437', '2021-02-07 11:07:51', '$2y$10$qHN0BUobUdHHmU15nHN9J.lf3nvdBOHgzZzHafxXy8z5i/0C/WzsC', 'p5T9lbhyb0', '2021-02-07 11:07:51', '2021-02-07 11:07:51'),
(33, 'Jewel', 'Barrows', 'elinor72@example.org', '1-405-963-7517', '2021-02-07 11:07:51', '$2y$10$m2sSAFN5uDJf7VWH1J8q8OetvRUsyImdtjf22EexK7P8HnG/0ZDHO', 'ZQV9SYsjhJ', '2021-02-07 11:07:51', '2021-02-07 11:07:51'),
(34, 'Mossie', 'Conn', 'leonor.prosacco@example.org', '+1.415.366.5027', '2021-02-07 11:07:51', '$2y$10$NXIK5A2J0pRHPwm8NW8Z5..FxdwY/0hQV7B2Gj.OeNe/kmb1zZRDm', 'NaOI6CTLxU', '2021-02-07 11:07:51', '2021-02-07 11:07:51'),
(35, 'Ona', 'Farrell', 'pollich.emile@example.net', '323.501.4223', '2021-02-07 11:07:51', '$2y$10$lKDWfd7oSiC2cdvGtLjiZ.tPpjZpYhi0fi4.pQZjxTAw/cDJIFVl.', 'h0xrHukIJM', '2021-02-07 11:07:51', '2021-02-07 11:07:51');

-- --------------------------------------------------------

--
-- Структура таблицы `user_levels`
--

CREATE TABLE `user_levels` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `level` int UNSIGNED NOT NULL DEFAULT '0',
  `points` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_levels`
--

INSERT INTO `user_levels` (`id`, `user_id`, `level`, `points`, `created_at`, `updated_at`) VALUES
(1, 26, 3, 5915, '2021-02-07 11:07:52', '2021-02-07 11:07:52'),
(2, 27, 3, 1167, '2021-02-07 11:07:52', '2021-02-07 11:07:52'),
(3, 28, 4, 6572, '2021-02-07 11:07:52', '2021-02-07 11:07:52'),
(4, 29, 6, 7486, '2021-02-07 11:07:52', '2021-02-07 11:07:52'),
(5, 30, 9, 5161, '2021-02-07 11:07:52', '2021-02-07 11:07:52'),
(6, 31, 9, 4022, '2021-02-07 11:07:52', '2021-02-07 11:07:52'),
(7, 32, 9, 4323, '2021-02-07 11:07:53', '2021-02-07 11:07:53'),
(8, 33, 7, 5009, '2021-02-07 11:07:53', '2021-02-07 11:07:53'),
(9, 34, 8, 8969, '2021-02-07 11:07:53', '2021-02-07 11:07:53'),
(10, 35, 8, 9547, '2021-02-07 11:07:53', '2021-02-07 11:07:53'),
(11, 25, 0, 50, NULL, '2021-02-08 15:40:42');

-- --------------------------------------------------------

--
-- Структура таблицы `words`
--

CREATE TABLE `words` (
  `id` bigint UNSIGNED NOT NULL,
  `words_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `words` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `words`
--

INSERT INTO `words` (`id`, `words_title`, `category_id`, `words`, `created_at`, `updated_at`) VALUES
(4, 'animals', 1, '{\"1\": {\"origin\": \"cat\", \"translate\": \"кот\"}, \"2\": {\"origin\": \"dog\", \"translate\": \"собака\"}, \"3\": {\"origin\": \"car\", \"translate\": \"автомобиль\"}, \"4\": {\"origin\": \"girl\", \"translate\": \"девушка\"}}', '2021-02-07 12:55:17', '2021-02-07 12:55:17'),
(5, 'Лексика по теме «Город»', 1, '{\"1\": {\"origin\": \"chemist\'s\", \"translate\": \"аптека\"}, \"2\": {\"origin\": \"arch\", \"translate\": \"арка\"}, \"3\": {\"origin\": \"bank\", \"translate\": \"банк\"}, \"4\": {\"origin\": \"bar\", \"translate\": \"бар\"}, \"5\": {\"origin\": \"swimming pool\", \"translate\": \"бассейн\"}, \"6\": {\"origin\": \"library\", \"translate\": \" библиотека\"}}', '2021-02-08 07:44:42', '2021-02-08 07:44:42');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_title_category_type_unique` (`category_title`,`category_type`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_theory_id_foreign` (`theory_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_fileables_type_fileables_id_index` (`fileables_type`,`fileables_id`);

--
-- Индексы таблицы `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `friends_user_id_friend_id_unique` (`user_id`,`friend_id`),
  ADD KEY `friends_friend_id_foreign` (`friend_id`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_imageables_type_imageables_id_index` (`imageables_type`,`imageables_id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `practices`
--
ALTER TABLE `practices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practices_theory_id_foreign` (`theory_id`);

--
-- Индексы таблицы `theories`
--
ALTER TABLE `theories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theories_theory_title_unique` (`theory_title`),
  ADD KEY `theories_category_id_foreign` (`category_id`);
ALTER TABLE `theories` ADD FULLTEXT KEY `fulltext_index` (`header`,`theory_body`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `user_levels`
--
ALTER TABLE `user_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_levels_user_id_foreign` (`user_id`),
  ADD KEY `user_levels_points_index` (`points`);

--
-- Индексы таблицы `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `words_words_title_unique` (`words_title`),
  ADD KEY `words_category_id_foreign` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `friends`
--
ALTER TABLE `friends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `practices`
--
ALTER TABLE `practices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `theories`
--
ALTER TABLE `theories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_theory_id_foreign` FOREIGN KEY (`theory_id`) REFERENCES `theories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_friend_id_foreign` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `practices`
--
ALTER TABLE `practices`
  ADD CONSTRAINT `practices_theory_id_foreign` FOREIGN KEY (`theory_id`) REFERENCES `theories` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `theories`
--
ALTER TABLE `theories`
  ADD CONSTRAINT `theories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_levels`
--
ALTER TABLE `user_levels`
  ADD CONSTRAINT `user_levels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `words`
--
ALTER TABLE `words`
  ADD CONSTRAINT `words_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
