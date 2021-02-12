-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Фев 12 2021 г., 16:35
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
(1, 'English tenses grammar', 'theory', '2021-02-12 07:28:15', '2021-02-12 07:28:15'),
(2, 'Animals', 'words', '2021-02-12 07:40:39', '2021-02-12 07:40:39'),
(3, 'City', 'words', '2021-02-12 11:39:10', '2021-02-12 11:39:10'),
(4, 'test word', 'words', '2021-02-12 11:51:35', '2021-02-12 11:51:35');

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
(1, 'App\\Models\\User', 1, 'MIKE.jpg', '2021-02-12 07:27:12', '2021-02-12 07:27:12');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_02_04_123448_create_user_levels_table', 1),
(5, '2021_02_04_124407_create_categories_table', 1),
(6, '2021_02_04_124952_create_theories_table', 1),
(7, '2021_02_04_130252_create_friends_table', 1),
(8, '2021_02_04_130816_create_practices_table', 1),
(9, '2021_02_04_130958_create_comments_table', 1),
(10, '2021_02_04_131151_create_words_table', 1),
(11, '2021_02_04_131935_create_files_table', 1),
(12, '2021_02_06_184433_create_jobs_table', 1),
(13, '2021_02_07_104411_create_images_table', 1),
(14, '2021_02_12_090555_create_statistics_table', 1);

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
(1, 1, '{\"1\": {\"answer\": \"1\", \"options\": {\"1\": \"I have not seen him today\", \"2\": \"I has not saw him today\", \"3\": \"I did not see him today\"}, \"questionText\": \"I saw Tom yesterday, but ....\"}, \"2\": {\"answer\": \"3\", \"options\": {\"1\": \"aaaaaaaaaa\", \"2\": \"bbbbbbbb\", \"3\": \"ccccccccccc\"}, \"questionText\": \"I saw Tom yesterday, but 2 ....\"}, \"3\": {\"answer\": \"2\", \"options\": {\"1\": \"dddddddddd\", \"2\": \"eeeeeeee\", \"3\": \"fffffffff\"}, \"questionText\": \"I saw Tom yesterday, but 3 ....\"}}', '2021-02-12 07:39:59', '2021-02-12 07:39:59');

-- --------------------------------------------------------

--
-- Структура таблицы `statistics`
--

CREATE TABLE `statistics` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `statistiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statistiable_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `statistics`
--

INSERT INTO `statistics` (`id`, `user_id`, `statistiable_type`, `statistiable_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Models\\Words', 1, '2021-02-12 11:34:30', '2021-02-12 11:34:30'),
(3, 1, 'App\\Models\\Words', 2, '2021-02-12 11:47:13', '2021-02-12 11:47:13'),
(9, 1, 'App\\Models\\Words', 3, '2021-02-12 12:09:52', '2021-02-12 12:09:52');

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
(1, 1, 'Present Simple', 'Present tense', NULL, 'Простое время в английском языке — лучший способ рассказать собеседнику о своих привычках и предпочтениях, о том, что мы умеем делать или делаем каждый день. Это одно из самых часто встречающихся времен в повседневной речи, поэтому важно понять и изучить его с самого начала.\r\n\r\nСегодня поговорим о том, что такое Present Simple Tense, распространенные случаи употребления, узнаем основные правила образования Present Simple, какие существуют маркеры времени и рассмотрим примеры предложений.\r\n\r\nЧто такое Present Simple?\r\nЭто простое настоящее время, обозначающее действие в самом широком смысле этого слова. Одна из самых распространенных и простых форм в английском языке для описания действий.\r\n\r\nДействия могут быть связаны с привычками, хобби, ежедневным событием вроде подъема по утрам или чем-то, что случается регулярно.\r\n\r\nКак образуется Present Simple?\r\nНет ничего проще, чем поставить глагол в форму Present Simple. Для этого нужно убрать у глагола в инфинитиве частицу «to» и поставить глагол после подлежащего. Это и есть основное правило Present Simple.\r\n\r\nУтверждение:\r\nI / We / You / They + V\r\n\r\nShe / He / It + V + s (es)\r\n\r\nI go to work every day — Я хожу на работу каждый день.\r\n\r\nПремиум навсегда всего за 5090 рублей + подарки!\r\nThey usually play tennis every weekend — Они обычно играют в теннис каждые выходные.\r\n\r\nShe brings me coffee every morning — Она приносит мне кофе каждое утро.\r\n\r\nIt snows in winter — Зимой идет снег.\r\n\r\nВАЖНО: В Present Simple форма глагола практически всегда совпадает с изначальной. Исключение составляет третье лицо единственного числа (he / she / it) — к нему прибавляется окончание -s:\r\n\r\nI ride — She rides\r\nУзнать больше\r\n\r\nI dream — He dreams\r\n\r\nЕсли глагол оканчивается на -s, -ss, -sh, -ch, -x, -o, то к нему прибавляется окончание -es\r\n\r\nI wish — She wishes\r\n\r\nI teach — She teaches\r\n\r\nЕсли глагол оканчивается на -y, а ему предшествует согласная, то к нему прибавляется окончание -es, но -y заменяется на -i\r\n\r\nI try — She tries\r\n\r\nI fly — He flies\r\n\r\nЕсли глагол оканчивается на -y, а ему предшествует гласная, то к нему также прибавляется окончание -s, но -y не меняется.\r\n\r\nI play — She plays\r\n\r\nI stay — He stays\r\n\r\nОтрицание:\r\nЧтобы составить отрицательное предложение — нужно поставить вспомогательный глагол между подлежащим и глаголом.\r\n\r\nI / We / You / They + do not (don’t) + V\r\n\r\nShe / He / It + does not (doesn’t) + V\r\n\r\nI don’t go to school every day — Я не хожу в школу каждый день\r\nУзнать больше\r\n\r\nThey don’t drink beer — Они не пьют пиво\r\n\r\nShe doesn’t like the weather in London — Ей не нравится погода в Лондоне\r\n\r\nHe doesn\'t drive the car — Он не водит машину\r\n\r\nОтрицание также можно выразить при помощи отрицательных местоимений и наречий.\r\n\r\nNobody speaks Arabic — Никто не говорит по-арабски\r\n\r\nI do nothing — Я ничего не делаю\r\n\r\nВопрос:\r\nПри составлении вопросительных предложений вспомогательный глагол ставится перед подлежащим и последующим глаголом. Обычно — в начало предложения.\r\n\r\nDo + I / we / you / they + V ?\r\n\r\nDoes + she / he / it + V ?\r\n\r\nDo you like pizza? — Тебе нравится пицца?\r\n\r\nDo they play football? — Они играют в футбол?\r\n\r\nDoes she learn Russian? — Она изучает русский язык?\r\n\r\nDoes he live in Spain? — Он живет в Испании?\r\n\r\nИногда в вопросительном предложении употребляются question words (вопросительные слова) и фразы, которые помогают задать более точный и корректный вопрос собеседнику.\r\n\r\nК таким словам относятся: how long (как долго), why (почему), where (где) и другие. Как и в других временах, они ставятся в самом начале предложения перед вопросительной конструкцией Present Simple.\r\n\r\nQW + do (does) + I / We / You / They / She / He / It + V ?\r\n\r\nWhere does he live in Prague? — Где он живет в Праге?\r\n\r\nWhy do you drink green tea? — Почему ты пьешь зеленый чай?\r\n\r\nКогда в предложении с Present Simple появляется вспомогательный глагол — у основного глагола пропадает окончание -s. Считайте, что это такой своеобразный «магнит», который «перетягивает» к себе это окончание. Это касается отрицательной и вопросительной форм Present Simple.\r\n\r\nВАЖНО: иногда вспомогательный глагол do / does можно встретить и в утвердительных предложениях, чтобы добавить экспрессии и яркости высказыванию.\r\n\r\nI do want to try this — Я действительно хочу это попробовать\r\n\r\nMary does know how to cook — Мэри действительно умеет готовить\r\n\r\nГлагол to be в Present Simple\r\nГлагол to be (быть) всегда является особенным и его употребление во времени Present Simple зависит от подлежащего. Он имеет 3 разных формы:\r\n\r\nam (для 1-го лица единственного числа: I)\r\nis (для 3-го лица единственного числа: she / he / it)\r\nare (для 1-го, 2-го и 3-го лица множественного числа: we / you / they)\r\nI am ready — Я готов\r\n\r\nShe is ready — Она готова\r\n\r\nWe are ready — Мы готовы\r\n\r\nКогда используется Present Simple?\r\nPresent Simple используется в описании действий, которые происходят постоянно, на регулярной\r\n\r\nоснове, но не привязаны к моменту речи.\r\n\r\nУпотребление Present Simple уместно в тех случаях, когда мы хотим рассказать о нашей ежедневной рутине, достоверно известных фактах, действиях в широком смысле слова или расписании поездов.\r\nУзнать больше\r\n\r\nРегулярные, повторяющиеся действия:\r\nI often go to the bar — Я часто хожу в бар\r\n\r\nThey play music every Sunday — Они играют музыку каждое воскресенье\r\n\r\nДействие в широком смысле слова (без привязки к моменту речи):\r\nI live in Dublin — Я живу в Дублине.\r\n\r\nShe speaks Chinese — Она говорит по-китайски.\r\n\r\nФакты, о которых знают все:\r\nThe Earth rotates around its axis — Земля вращается вокруг своей оси.\r\n\r\nMoscow is the largest city in Russia — Москва самый большой город в России\r\n\r\nБудущие действия, которые произойдут согласно расписанию:\r\nThe airplane takes off at 4.30 am — Самолет взлетит в 4.30 утра.\r\n\r\nThe train leaves at 9 pm tomorrow — Поезд отходит завтра в 9 вечера.\r\n\r\nРецепты и инструкции (используется вместо повелительного наклонения):\r\nYou push the red button to turn on the radio — Нажмите на красную кнопку, чтобы включить радио\r\n\r\nFirst you turn left and then you go down the street — Сперва поверните налево, затем идите до конца улицы\r\n\r\nПри перечислении каких-то действий и их определенной последовательности также используется время Present Simple\r\n\r\nYou take the bus into the city center and then you take a taxi to the restaurant — Вы едете на автобусе до центра города, а затем берете такси до ресторана.\r\n\r\nИногда время Present Simple используется в отношении прошедшего времени. Например, в заголовках газет (указывают на факт произошедшего действия) или в рассказе о событии (когда мы говорим о ком-то и его действиях).\r\n\r\nThe bus with American tourists crashes in India — В Индии разбился автобус с американскими туристами\r\n\r\nI met John last week. He comes to me and says: “Hello, old friend” — На прошлой неделе я встретил Джона. Он подошел ко мне и сказал: «Привет, старый друг»\r\n\r\nМаркеры времени Present Simple\r\nДля того, чтобы лучше сориентироваться где и когда употребляются глаголы Present Simple — обратите внимание на особые маркеры в тексте.\r\nТакими «маячками» для Present Simple являются наречия ( often, always, usually, etc. ) и указатели времени ( every day, in the morning, on Fridays, etc. ).\r\n\r\nShe always drinks coffee in the morning — Она всегда пьет кофе по утрам\r\n\r\nI usually wake up at 6 am — Обычно я просыпаюсь в 6 утра\r\n\r\nThey often talk about sport — Они часто говорят о спорте\r\n\r\nI check my smartphone every 15 minutes — Я проверяю свой телефон каждые 15 минут\r\n\r\nHe takes a shower twice a day — Он принимает душ два раза в день\r\n\r\nOn Mondays we go to the central park — По понедельникам мы ходим в центральный парк\r\n\r\nHe comes here sometimes — Иногда он приходит сюда\r\n\r\nПримеры предложений с Present Simple:\r\nУтвердительные предложения:\r\nI read a book every evening — Я читаю книгу каждый вечер\r\n\r\nHe likes to be polite — Ему нравится быть вежливым\r\n\r\nIt takes two hours to fly from Berlin — Полет из Берлина займет два часа\r\n\r\nCats like milk — Кошки любят молоко\r\n\r\nОтрицательные предложения:\r\nI don’t buy food in the supermarket — Я не покупаю еду в супермаркете\r\n\r\nHe doesn’t play piano very well — Он не очень хорошо играет на пианино\r\n\r\nThey don’t read books — Они не читают книги\r\n\r\nDuck don’t eat fish — Утки не едят рыбу\r\n\r\nВопросительные предложения:\r\nDo you live in Paris? — Ты живешь в Париже?\r\n\r\nDoes she play in a band? — Она играет в группе?\r\n\r\nDo you eat fish? — Ты ешь рыбу?\r\n\r\nDo they like coffee? — Им нравится кофе?', '2021-02-12 07:36:59', '2021-02-12 07:36:59');

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
(1, 'Виталий', 'Безгин', 'bezgin96@ukr.net', '0931205426', NULL, '$2y$10$.NLDWEl4kDbQ1rguut4EEO0WECQvEOfn9l5ps40C6zvJd5qSCbia2', NULL, '2021-02-12 07:27:12', '2021-02-12 07:27:12');

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
(1, 1, 0, 125, NULL, '2021-02-12 12:09:52');

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
(1, 'animals words list', 2, '{\"1\": {\"origin\": \"cat\", \"translate\": \"Кот, Кошка\"}, \"2\": {\"origin\": \"dog\", \"translate\": \"собака\"}, \"3\": {\"origin\": \"bear\", \"translate\": \"Медведь\"}, \"4\": {\"origin\": \"elephant\", \"translate\": \"Слон\"}, \"5\": {\"origin\": \"tiger\", \"translate\": \"Тигр\"}, \"6\": {\"origin\": \"giraffe\", \"translate\": \"Жираф\"}}', '2021-02-12 07:44:15', '2021-02-12 07:44:15'),
(2, 'City words', 3, '{\"1\": {\"origin\": \"chemist\'s\", \"translate\": \"аптека\"}, \"2\": {\"origin\": \"bank\", \"translate\": \"банк\"}, \"3\": {\"origin\": \"swimming pool\", \"translate\": \"бассейн\"}, \"4\": {\"origin\": \"library\", \"translate\": \"библиотека\"}, \"5\": {\"origin\": \"grocery\", \"translate\": \"гастроном\"}}', '2021-02-12 11:41:11', '2021-02-12 11:41:11'),
(3, 'test', 4, '{\"1\": {\"origin\": \"cat\", \"translate\": \"кот\"}, \"2\": {\"origin\": \"dog\", \"translate\": \"собака\"}}', '2021-02-12 11:52:03', '2021-02-12 11:52:03');

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
-- Индексы таблицы `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `statistics_statistiable_type_statistiable_id_index` (`statistiable_type`,`statistiable_id`),
  ADD KEY `statistics_user_id_index` (`user_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `practices`
--
ALTER TABLE `practices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `theories`
--
ALTER TABLE `theories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
