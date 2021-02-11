-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Фев 11 2021 г., 21:17
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
(1, 'Criminal Investigator', 'for words', '2021-02-10 13:15:49', '2021-02-10 13:15:49'),
(2, 'Prepress Technician', 'for words', '2021-02-10 13:15:49', '2021-02-10 13:15:49'),
(3, 'Motorcycle Mechanic', 'for words', '2021-02-10 13:15:50', '2021-02-10 13:15:50'),
(4, 'Engine Assembler', 'for theory', '2021-02-10 13:15:50', '2021-02-10 13:15:50'),
(5, 'Psychologist', 'for words', '2021-02-10 13:15:50', '2021-02-10 13:15:50'),
(6, 'Social Work Teacher', 'for theory', '2021-02-10 13:15:51', '2021-02-10 13:15:51'),
(7, 'Agricultural Product Grader Sorter', 'for words', '2021-02-10 13:15:51', '2021-02-10 13:15:51'),
(8, 'Stringed Instrument Repairer and Tuner', 'for words', '2021-02-10 13:15:52', '2021-02-10 13:15:52'),
(9, 'Electro-Mechanical Technician', 'for words', '2021-02-10 13:15:52', '2021-02-10 13:15:52'),
(10, 'Vice President Of Marketing', 'for theory', '2021-02-10 13:15:52', '2021-02-10 13:15:52');

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
(1, 'App\\Models\\User', 11, 'MIKE.jpg', '2021-02-10 13:23:30', '2021-02-10 13:23:30');

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
(41, '2014_10_12_000000_create_users_table', 4),
(42, '2014_10_12_100000_create_password_resets_table', 4),
(43, '2019_08_19_000000_create_failed_jobs_table', 4),
(44, '2021_02_04_123448_create_user_levels_table', 4),
(45, '2021_02_04_124407_create_categories_table', 4),
(46, '2021_02_04_124952_create_theories_table', 4),
(47, '2021_02_04_130252_create_friends_table', 4),
(49, '2021_02_04_130958_create_comments_table', 4),
(50, '2021_02_04_131151_create_words_table', 4),
(51, '2021_02_04_131935_create_files_table', 4),
(52, '2021_02_06_184433_create_jobs_table', 4),
(53, '2021_02_07_104411_create_images_table', 4),
(55, '2021_02_04_130816_create_practices_table', 5);

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

--
-- Дамп данных таблицы `practices`
--

INSERT INTO `practices` (`id`, `theory_id`, `questions`, `created_at`, `updated_at`) VALUES
(3, 1, '{\"1\": {\"answer\": \"1\", \"options\": {\"1\": \"I have not seen him today\", \"2\": \"I has not saw him today\", \"3\": \"I did not see him today\"}, \"questionText\": \"I saw Tom yesterday, but ....\"}, \"2\": {\"answer\": \"2\", \"options\": {\"1\": \"aaaaaaaaa\", \"2\": \"bbbbbbbbbb\", \"3\": \"ccccccccccccc\"}, \"questionText\": \"I saw Tom yesterday, but ....\"}}', '2021-02-11 13:45:33', '2021-02-11 13:45:33'),
(4, 2, '{\"1\": {\"answer\": \"1\", \"options\": {\"1\": \"I have not seen him today\", \"2\": \"I has not saw him today\", \"3\": \"I did not see him today\"}, \"questionText\": \"I saw Tom yesterday, but ....\"}}', '2021-02-11 13:53:56', '2021-02-11 13:53:56');

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
(1, 1, 'theory - >Judge', 'Prof.', '\"http://dicki.com/quasi-aut-vitae-quidem-dicta-ducimus\"', 'William and offer him the crown. William\'s conduct at first she thought it had made. \'He took me for asking! No, it\'ll never do to ask: perhaps I shall think nothing of the month is it?\' Alice.', '2021-02-10 13:15:52', '2021-02-10 13:15:52'),
(2, 2, 'theory - >Mia', 'Mr.', '\"http://www.toy.net/aliquam-eius-unde-alias-ea-atque-assumenda-doloribus-soluta.html\"', 'Alice was silent. The Dormouse again took a great deal of thought, and looked anxiously over his shoulder with some curiosity. \'What a curious dream, dear, certainly: but now run in to your places!\'.', '2021-02-10 13:15:52', '2021-02-10 13:15:52'),
(3, 3, 'theory - >Demetris', 'Prof.', '\"http://www.prosacco.org/rem-et-fugit-eum-ab-similique-explicabo-aut.html\"', 'YOU?\' Which brought them back again to the Queen. First came ten soldiers carrying clubs; these were all writing very busily on slates. \'What are tarts made of?\' Alice asked in a dreamy sort of.', '2021-02-10 13:15:53', '2021-02-10 13:15:53'),
(4, 4, 'theory - >Vincenzo', 'Dr.', '\"http://schroeder.com/nobis-tenetur-natus-voluptatibus-aut\"', 'I\'ll kick you down stairs!\' \'That is not said right,\' said the Cat went on, \'and most things twinkled after that--only the March Hare will be the right word) \'--but I shall never get to the game.', '2021-02-10 13:15:53', '2021-02-10 13:15:53'),
(5, 5, 'theory - >Carey', 'Dr.', '\"http://www.tremblay.com/voluptatibus-tenetur-explicabo-expedita-voluptatibus-doloremque.html\"', 'Alice did not like the largest telescope that ever was! Good-bye, feet!\' (for when she had not attended to this last remark, \'it\'s a vegetable. It doesn\'t look like it?\' he said, turning to the.', '2021-02-10 13:15:53', '2021-02-10 13:15:53'),
(6, 6, 'theory - >Alberta', 'Dr.', '\"http://roberts.com/aut-molestias-commodi-fuga-nihil\"', 'Yet you finished the goose, with the words did not get dry again: they had settled down again in a soothing tone: \'don\'t be angry about it. And yet you incessantly stand on your head-- Do you think.', '2021-02-10 13:15:53', '2021-02-10 13:15:53'),
(7, 7, 'theory - >Shanie', 'Mr.', '\"http://www.abbott.com/et-voluptatem-nihil-quo-praesentium\"', 'The great question is, what?\' The great question certainly was, what? Alice looked up, but it had a wink of sleep these three little sisters,\' the Dormouse shook itself, and was coming to, but it.', '2021-02-10 13:15:54', '2021-02-10 13:15:54'),
(8, 8, 'theory - >Guillermo', 'Prof.', '\"http://www.ferry.com/commodi-tempora-necessitatibus-laborum\"', 'Queen\'s ears--\' the Rabbit asked. \'No, I didn\'t,\' said Alice: \'allow me to him: She gave me a pair of white kid gloves in one hand, and Alice rather unwillingly took the least notice of her ever.', '2021-02-10 13:15:54', '2021-02-10 13:15:54'),
(9, 9, 'theory - >Catharine', 'Dr.', '\"http://bartell.info/maiores-aut-vitae-fuga-quo-animi-in-et-occaecati\"', 'His voice has a timid voice at her rather inquisitively, and seemed to be full of tears, but said nothing. \'This here young lady,\' said the Pigeon. \'I can hardly breathe.\' \'I can\'t help it,\' said.', '2021-02-10 13:15:54', '2021-02-10 13:15:54'),
(10, 10, 'theory - >Albin', 'Mrs.', '\"http://bashirian.com/omnis-rerum-amet-odio-quod-soluta.html\"', 'Caterpillar\'s making such VERY short remarks, and she heard a little more conversation with her head through the glass, and she could do, lying down on the glass table and the jury wrote it down.', '2021-02-10 13:15:54', '2021-02-10 13:15:54');

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
(1, 'Dorian', 'Adams', 'trevor75@example.net', '+1-925-826-4948', '2021-02-10 13:15:41', '$2y$10$trrzMU0R3tqki8gLBJk1QeovaqARpp052GpbNu92SlPxJ5z43YON2', 'aCDTaU0Zek', '2021-02-10 13:15:41', '2021-02-10 13:15:41'),
(2, 'Stephany', 'Daugherty', 'osborne.beier@example.org', '+1 (269) 219-1607', '2021-02-10 13:15:42', '$2y$10$MzS26hm4ImZDi5rCLcEnceWxZot6ijwUbPfJFocoTQ414XwateHZS', 'hhDJ72Oy1z', '2021-02-10 13:15:42', '2021-02-10 13:15:42'),
(3, 'Alanis', 'Medhurst', 'yluettgen@example.net', '1-668-661-8121', '2021-02-10 13:15:42', '$2y$10$fHXA55RqBHiFoXv1aa2jZ.QtJ.kgdIgfgR9lQGSZ6DZRYRw2UUnhS', 'm0u3KLcWRQ', '2021-02-10 13:15:42', '2021-02-10 13:15:42'),
(4, 'Kaitlin', 'Baumbach', 'cecelia79@example.com', '1-798-383-9623', '2021-02-10 13:15:42', '$2y$10$qOUrA2WtPogklEz28fpcDuNYQ5PBhhDwYReVyET5ScE943psM4AKm', '8fAUyDAlwu', '2021-02-10 13:15:42', '2021-02-10 13:15:42'),
(5, 'Cara', 'Grant', 'moshe38@example.net', '554.789.5584', '2021-02-10 13:15:43', '$2y$10$kmp2xSkppogdFyhji9csnO1e5EFS50UWU2JocrmbcP7H36Xowbqna', 'IOMAGwGTiZ', '2021-02-10 13:15:43', '2021-02-10 13:15:43'),
(6, 'Estrella', 'Denesik', 'janet96@example.org', '1-289-810-0110', '2021-02-10 13:15:43', '$2y$10$hnLMmCtmjlScbjLhi/7pi.Gd5Q/t1XJjrYJXvXQzn6bKd9ND0AHEa', 'eMqe577Wie', '2021-02-10 13:15:43', '2021-02-10 13:15:43'),
(7, 'Deangelo', 'Kerluke', 'astamm@example.org', '207.413.1403', '2021-02-10 13:15:43', '$2y$10$xTKtQJYU/mZKSZd15kZNJu77btqXh0FDjm8rd66cu.cAoWTCJnt2W', 'XxFGI8AxwL', '2021-02-10 13:15:43', '2021-02-10 13:15:43'),
(8, 'Percy', 'Lind', 'chadrick18@example.com', '(487) 884-4778', '2021-02-10 13:15:43', '$2y$10$ntTfGP4lMhanPvzcqPgb9.nE9.NNrbncwBGIiM1/qM67WlRALxPNe', '5kryqStTsZ', '2021-02-10 13:15:44', '2021-02-10 13:15:44'),
(9, 'Boris', 'Altenwerth', 'lcartwright@example.org', '960.422.8404', '2021-02-10 13:15:44', '$2y$10$MM00hzrk2/O4AGqJ5GwGD.Ok/4gZp.Wcwv.6KsCu/4WONddJCxloK', 'yc59m9oTa1', '2021-02-10 13:15:44', '2021-02-10 13:15:44'),
(10, 'Fermin', 'Boyle', 'erwin81@example.com', '1-720-475-8085', '2021-02-10 13:15:45', '$2y$10$kje5YAD53F/DocDrEfF0rOXq8kIl8l23KZ/2sa616In80Yvvf7Dxm', '5zbkvdAFuU', '2021-02-10 13:15:45', '2021-02-10 13:15:45'),
(11, 'Виталий', 'Безгин', 'bezgin96@ukr.net', '0931205426', NULL, '$2y$10$4OP5OtBBFIgh0jV3gfjide7OpyjBibTdFh7sFC91KvZhfVLvllFxu', NULL, '2021-02-10 13:23:30', '2021-02-10 13:23:30');

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
(11, 11, 0, 75, NULL, '2021-02-11 17:04:38');

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
(1, 'animals', 1, '{\"1\": {\"origin\": \"cat\", \"translate\": \"кот\"}, \"2\": {\"origin\": \"dog\", \"translate\": \"собака\"}, \"3\": {\"origin\": \"car\", \"translate\": \"автомобиль\"}, \"4\": {\"origin\": \"girl\", \"translate\": \"девушка\"}}', '2021-02-11 15:03:29', '2021-02-11 15:03:29');

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
  ADD UNIQUE KEY `practices_theory_id_unique` (`theory_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `practices`
--
ALTER TABLE `practices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `theories`
--
ALTER TABLE `theories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
