-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 22/07/2024 às 20:38
-- Versão do servidor: 8.4.0
-- Versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `project-init`
--
CREATE DATABASE IF NOT EXISTS `project-init` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `project-init`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_actionscheduler_actions`
--

CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint UNSIGNED NOT NULL,
  `hook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `priority` tinyint UNSIGNED NOT NULL DEFAULT '10',
  `args` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_actionscheduler_actions`
--

INSERT INTO `wp_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `priority`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(9, 'easy_wp_smtp_summary_report_email', 'complete', '2024-05-29 22:57:25', '2024-05-29 22:57:25', 10, '[null]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1717023445;s:18:\"\0*\0first_timestamp\";i:1716213600;s:13:\"\0*\0recurrence\";i:604800;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1717023445;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:604800;}', 2, 1, '2024-07-02 12:49:11', '2024-07-02 12:49:11', 0, NULL),
(10, 'easy_wp_smtp_summary_report_email', 'complete', '2024-07-09 12:49:11', '2024-07-09 12:49:11', 10, '[null]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1720529351;s:18:\"\0*\0first_timestamp\";i:1716213600;s:13:\"\0*\0recurrence\";i:604800;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1720529351;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:604800;}', 2, 1, '2024-07-19 19:27:52', '2024-07-19 19:27:52', 0, NULL),
(11, 'action_scheduler/migration_hook', 'complete', '2024-07-02 13:06:33', '2024-07-02 13:06:33', 10, '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1719925593;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1719925593;}', 1, 1, '2024-07-02 13:06:34', '2024-07-02 13:06:34', 0, NULL),
(12, 'easy_wp_smtp_summary_report_email', 'pending', '2024-07-26 19:27:52', '2024-07-26 19:27:52', 10, '[null]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1722022072;s:18:\"\0*\0first_timestamp\";i:1716213600;s:13:\"\0*\0recurrence\";i:604800;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1722022072;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:604800;}', 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_actionscheduler_claims`
--

CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint UNSIGNED NOT NULL,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_actionscheduler_groups`
--

CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_actionscheduler_groups`
--

INSERT INTO `wp_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration'),
(2, 'easy_wp_smtp');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_actionscheduler_logs`
--

CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint UNSIGNED NOT NULL,
  `action_id` bigint UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_actionscheduler_logs`
--

INSERT INTO `wp_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(7, 9, 'action created', '2024-05-22 22:57:25', '2024-05-22 22:57:25'),
(8, 9, 'action started via WP Cron', '2024-07-02 12:49:11', '2024-07-02 12:49:11'),
(9, 9, 'action complete via WP Cron', '2024-07-02 12:49:11', '2024-07-02 12:49:11'),
(10, 10, 'action created', '2024-07-02 12:49:11', '2024-07-02 12:49:11'),
(11, 11, 'action created', '2024-07-02 13:05:33', '2024-07-02 13:05:33'),
(12, 11, 'action started via WP Cron', '2024-07-02 13:06:34', '2024-07-02 13:06:34'),
(13, 11, 'action complete via WP Cron', '2024-07-02 13:06:34', '2024-07-02 13:06:34'),
(14, 10, 'action started via WP Cron', '2024-07-19 19:27:52', '2024-07-19 19:27:52'),
(15, 10, 'action complete via WP Cron', '2024-07-19 19:27:52', '2024-07-19 19:27:52'),
(16, 12, 'action created', '2024-07-19 19:27:52', '2024-07-19 19:27:52');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2024-05-13 20:04:14', '2024-05-13 20:04:14', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_easywpsmtp_debug_events`
--

CREATE TABLE `wp_easywpsmtp_debug_events` (
  `id` int UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `initiator` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `event_type` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_easywpsmtp_debug_events`
--

INSERT INTO `wp_easywpsmtp_debug_events` (`id`, `content`, `initiator`, `event_type`, `created_at`) VALUES
(1, 'Mailer: Default (none)\r\nPHPMailer was able to connect to SMTP server but failed while trying to send an email.', '{\"file\":\"\\/var\\/www\\/html\\/wp-content\\/plugins\\/easy-wp-smtp\\/src\\/Reports\\/Emails\\/Summary.php\",\"line\":112}', 0, '2024-05-22 22:57:25'),
(2, 'Mailer: Default (none)\r\nPHPMailer was able to connect to SMTP server but failed while trying to send an email.', '{\"file\":\"\\/var\\/www\\/html\\/wp-content\\/plugins\\/easy-wp-smtp\\/src\\/Reports\\/Emails\\/Summary.php\",\"line\":112}', 0, '2024-07-02 12:49:11'),
(3, 'Mailer: Default (none)\r\nPHPMailer was able to connect to SMTP server but failed while trying to send an email.', '{\"file\":\"\\/var\\/www\\/html\\/wp-content\\/plugins\\/easy-wp-smtp\\/src\\/Reports\\/Emails\\/Summary.php\",\"line\":112}', 0, '2024-07-19 19:27:52');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_easywpsmtp_tasks_meta`
--

CREATE TABLE `wp_easywpsmtp_tasks_meta` (
  `id` bigint NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_gdpr_cc_options`
--

CREATE TABLE `wp_gdpr_cc_options` (
  `id` int NOT NULL,
  `option_key` varchar(255) NOT NULL DEFAULT '1',
  `option_value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `site_id` int DEFAULT NULL,
  `extras` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `wp_gdpr_cc_options`
--

INSERT INTO `wp_gdpr_cc_options` (`id`, `option_key`, `option_value`, `site_id`, `extras`) VALUES
(1, 'moove_gdpr_nonce', '1f29db9a67', 1, NULL),
(2, '_wp_http_referer', '/wp-admin/admin.php?page=moove-gdpr&tab=third-party-cookies', 1, NULL),
(3, 'moove_gdpr_brand_colour', '#edff00', 1, NULL),
(4, 'moove_gdpr_company_logo', 'http://localhost/wp-content/uploads/2024/05/icon-dz.png', 1, NULL),
(5, 'moove_gdpr_button_style', 'squared', 1, NULL),
(6, 'moove_gdpr_plugin_font_type', '3', 1, NULL),
(7, 'moove_gdpr_plugin_font_family', '\'Nunito\', sans-serif', 1, NULL),
(8, 'moove_gdpr_cdn_url', '', 1, NULL),
(9, 'moove_gdpr_company_logo_id', '6', 1, NULL),
(10, 'moove_gdpr_infobar_visibility', 'visible', 1, NULL),
(11, 'moove_gdpr_accept_button_enable', '1', 1, NULL),
(12, 'moove_gdpr_reject_button_enable', '0', 1, NULL),
(13, 'moove_gdpr_settings_button_enable', '0', 1, NULL),
(14, 'moove_gdpr_close_button_enable', '0', 1, NULL),
(15, 'gdpr_close_button_bhv', '1', 1, NULL),
(16, 'moove_gdpr_colour_scheme', '2', 1, NULL),
(17, 'gdpr_accesibility', '0', 1, NULL),
(18, 'moove_gdpr_info_bar_content', '<p>Estamos utilizando cookies para proporcionar a você a melhor experiência em nosso site. Saiba mais sobre quais cookies estamos utilizando ou desative-os nas [setting]configurações[/setting].</p>\n', 1, NULL),
(19, 'gdpr_bs_buttons_order', '[\"accept\",\"reject\",\"settings\",\"close\"]', 1, NULL),
(20, 'moove_gdpr_infobar_accept_button_label', 'Aceitar', 1, NULL),
(21, 'moove_gdpr_infobar_reject_button_label', 'Reject', 1, NULL),
(22, 'moove_gdpr_infobar_settings_button_label', 'Settings', 1, NULL),
(23, 'moove_gdpr_infobar_position', 'bottom_left', 1, NULL),
(24, 'gdpr_initialization_delay', '2000', 1, NULL),
(25, 'moove_gdpr_modal_powered_by_disable', '0', 1, NULL),
(26, 'moove_gdpr_plugin_layout', 'v2', 1, NULL),
(27, 'gdpr_gs_buttons_order', '[\"enable\",\"reject\",\"save\",\"close\"]', 1, NULL),
(28, 'moove_gdpr_modal_allow_button_label', 'Enable All', 1, NULL),
(29, 'moove_gdpr_modal_reject_button_label', 'Reject All', 1, NULL),
(30, 'moove_gdpr_modal_save_button_label', 'Salvar alterações', 1, NULL),
(31, 'moove_gdpr_cb_close_button_enable', '1', 1, NULL),
(32, 'moove_gdpr_modal_enabled_checkbox_label', 'Ativo', 1, NULL),
(33, 'moove_gdpr_modal_disabled_checkbox_label', 'Desativo', 1, NULL),
(34, 'moove_gdpr_modal_powered_by_label', 'Powered by', 1, NULL),
(35, 'moove_gdpr_save_settings_button_enable', '1', 1, NULL),
(36, 'moove_gdpr_enable_all_button_enable', '0', 1, NULL),
(37, 'moove_gdpr_reject_all_button_enable', '0', 1, NULL),
(38, 'moove_gdpr_privacy_overview_tab_title', 'Visão Geral da Privacidade', 1, NULL),
(39, 'moove_gdpr_privacy_overview_tab_content', 'Este site utiliza cookies para oferecer a melhor experiência de usuário possível. As informações dos cookies são armazenadas no seu navegador e desempenham funções como reconhecê-lo quando você retorna ao nosso site e ajudar nossa equipe a entender quais seções do site você acha mais interessantes e úteis.', 1, NULL),
(40, 'moove_gdpr_strictly_necessary_cookies_functionality', '2', 1, NULL),
(41, 'moove_gdpr_strictly_necessary_cookies_tab_title', 'Cookies Estritamente Necessários', 1, NULL),
(42, 'moove_gdpr_strict_necessary_cookies_tab_content', 'Os cookies estritamente necessários devem estar ativados o tempo todo para que possamos salvar suas preferências de configuração de cookies.', 1, NULL),
(43, 'moove_gdpr_strictly_necessary_cookies_warning', 'Se você desativar este cookie, não poderemos salvar suas preferências. Isso significa que toda vez que você visitar este site, será necessário ativar ou desativar os cookies novamente.', 1, NULL),
(44, 'moove_gdpr_modal_strictly_secondary_notice', '<p>Please enable Strictly Necessary Cookies first so that we can save your preferences!</p>\n', 1, NULL),
(45, 'moove_gdpr_third_party_cookies_enable_first_visit', '1', 1, NULL),
(46, 'moove_gdpr_third_party_cookies_enable', '1', 1, NULL),
(47, 'moove_gdpr_performance_cookies_tab_title', 'Cookies de Terceiros', 1, NULL),
(48, 'moove_gdpr_performance_cookies_tab_content', 'Este site utiliza o Google Analytics para coletar informações anônimas, como o número de visitantes do site e as páginas mais populares.\r\n<div class=\"flex-1 overflow-hidden\">\r\n<div class=\"react-scroll-to-bottom--css-elnuc-79elbk h-full\">\r\n<div class=\"react-scroll-to-bottom--css-elnuc-1n7m0yu\">\r\n<div class=\"flex flex-col text-sm pb-9\">\r\n<div class=\"w-full text-token-text-primary\" dir=\"auto\" data-testid=\"conversation-turn-19\" data-scroll-anchor=\"true\">\r\n<div class=\"py-2 px-3 text-base md:px-4 m-auto md:px-5 lg:px-1 xl:px-5\">\r\n<div class=\"mx-auto flex flex-1 gap-3 text-base juice:gap-4 juice:md:gap-6 md:max-w-3xl lg:max-w-[40rem] xl:max-w-[48rem]\">\r\n<div class=\"relative flex w-full min-w-0 flex-col agent-turn\">\r\n<div class=\"flex-col gap-1 md:gap-3\">\r\n<div class=\"flex flex-grow flex-col max-w-full\">\r\n<div class=\"min-h-[20px] text-message flex flex-col items-start whitespace-pre-wrap break-words [.text-message+&amp;]:mt-5 overflow-x-auto gap-3\" dir=\"auto\" data-message-author-role=\"assistant\" data-message-id=\"99bc3642-d1f2-490e-aff2-7a6b0e40385b\">\r\n<div class=\"markdown prose w-full break-words dark:prose-invert light\">\r\n\r\nManter este cookie ativado nos ajuda a melhorar nosso site.\r\n\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"pr-2 lg:pr-0\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"w-full md:pt-0 dark:border-white/20 md:border-transparent md:dark:border-transparent md:w-[calc(100%-.5rem)] juice:w-full\">\r\n<div class=\"px-3 text-base md:px-4 m-auto md:px-5 lg:px-1 xl:px-5\">\r\n<div class=\"mx-auto flex flex-1 gap-3 text-base juice:gap-4 juice:md:gap-6 md:max-w-3xl lg:max-w-[40rem] xl:max-w-[48rem]\"><form class=\"w-full\">\r\n<div class=\"relative flex h-full max-w-full flex-1 flex-col\">\r\n<div class=\"absolute bottom-full left-0 right-0\"></div>\r\n<div class=\"flex w-full items-center\">\r\n<div class=\"overflow-hidden [&amp;:has(textarea:focus)]:border-token-border-xheavy [&amp;:has(textarea:focus)]:shadow-[0_2px_6px_rgba(0,0,0,.05)] flex flex-col w-full flex-grow relative border dark:text-white rounded-2xl bg-token-main-surface-primary border-token-border-medium\">\r\n<div data-grammarly-part=\"button\">\r\n<div>\r\n<div>\r\n<div class=\"amkYk\">\r\n<div>\r\n<div class=\"ptGJG\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</form></div>\r\n</div>\r\n</div>', 1, NULL),
(49, 'moove_gdpr_third_party_header_scripts', '', 1, NULL),
(50, 'moove_gdpr_third_party_body_scripts', '', 1, NULL),
(51, 'moove_gdpr_third_party_footer_scripts', '', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint UNSIGNED NOT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint UNSIGNED NOT NULL,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost', 'yes'),
(2, 'home', 'http://localhost', 'yes'),
(3, 'blogname', 'Projeto Init', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'matheus@dzigual.com.br', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:97:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=2&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:9:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:33:\"classic-editor/classic-editor.php\";i:2;s:36:\"contact-form-7/wp-contact-form-7.php\";i:3;s:29:\"easy-wp-smtp/easy-wp-smtp.php\";i:4;s:37:\"gdpr-cookie-compliance/moove-gdpr.php\";i:6;s:39:\"masks-form-fields/masks-form-fields.php\";i:7;s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";i:9;s:21:\"safe-svg/safe-svg.php\";i:12;s:41:\"wordpress-importer/wordpress-importer.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'boilerplate', 'yes'),
(41, 'stylesheet', 'boilerplate', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '56657', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:0:{}', 'yes'),
(77, 'widget_text', 'a:0:{}', 'yes'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:2:{s:24:\"wordpress-seo/wp-seo.php\";s:14:\"__return_false\";s:27:\"redirection/redirection.php\";a:2:{i:0;s:17:\"Redirection_Admin\";i:1;s:16:\"plugin_uninstall\";}}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '2', 'yes'),
(82, 'page_on_front', '2', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1731182653', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'wp_attachment_pages_enabled', '0', 'yes'),
(100, 'initial_db_version', '56657', 'yes'),
(101, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:65:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:15:\"manage_security\";b:1;s:23:\"wf2fa_activate_2fa_self\";b:1;s:25:\"wf2fa_activate_2fa_others\";b:1;s:21:\"wf2fa_manage_settings\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(102, 'fresh_site', '1', 'yes'),
(103, 'user_count', '1', 'no'),
(104, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(106, 'cron', 'a:14:{i:1721680786;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1721681023;a:1:{s:29:\"rsssl_every_five_minutes_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:18:\"rsssl_five_minutes\";s:4:\"args\";a:0:{}s:8:\"interval\";i:300;}}}i:1721682254;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1721685823;a:1:{s:28:\"rsssl_every_three_hours_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:23:\"rsssl_every_three_hours\";s:4:\"args\";a:0:{}s:8:\"interval\";i:10800;}}}i:1721696623;a:1:{s:20:\"wp_stream_auto_purge\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1721721854;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1721721896;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1721739097;a:1:{s:27:\"acf_update_site_health_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1721739823;a:2:{s:21:\"rsssl_every_week_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:12:\"rsssl_weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:20:\"rsssl_every_day_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:11:\"rsssl_daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1721765054;a:2:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1721765185;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1721765255;a:1:{s:13:\"wpseo-reindex\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1722283496;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(120, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(122, 'recovery_keys', 'a:0:{}', 'yes'),
(136, 'can_compress_scripts', '0', 'yes'),
(150, 'theme_mods_twentytwentyfour', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1715630683;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(151, 'current_theme', 'Boilerplate', 'yes'),
(152, 'theme_mods_boilerplate', 'a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}}', 'yes'),
(153, 'theme_switched', '', 'yes'),
(154, 'recently_activated', 'a:5:{s:27:\"maintenance/maintenance.php\";i:1719925533;s:27:\"redirection/redirection.php\";i:1719925533;s:17:\"stream/stream.php\";i:1719925533;s:23:\"wordfence/wordfence.php\";i:1719925533;s:24:\"wordpress-seo/wp-seo.php\";i:1719925533;}', 'yes'),
(162, 'finished_updating_comment_type', '1', 'yes'),
(167, 'acf_first_activated_version', '6.2.7', 'yes'),
(168, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.9.6\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1715630853;s:7:\"version\";s:5:\"5.9.4\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(169, 'action_scheduler_hybrid_store_demarkation', '6', 'yes'),
(170, 'schema-ActionScheduler_StoreSchema', '7.0.1715630853', 'yes'),
(171, 'schema-ActionScheduler_LoggerSchema', '3.0.1715630853', 'yes'),
(172, 'easy_wp_smtp_initial_version', '2.3.0', 'no'),
(173, 'easy_wp_smtp_version', '2.3.0', 'no'),
(174, 'easy_wp_smtp', 'a:3:{s:4:\"mail\";a:5:{s:10:\"from_email\";s:22:\"matheus@dzigual.com.br\";s:9:\"from_name\";s:12:\"Projeto Init\";s:6:\"mailer\";s:4:\"mail\";s:16:\"from_email_force\";b:1;s:15:\"from_name_force\";b:0;}s:4:\"smtp\";a:2:{s:7:\"autotls\";b:1;s:4:\"auth\";b:1;}s:7:\"general\";a:2:{s:28:\"domain_check_allowed_domains\";s:9:\"localhost\";s:29:\"summary_report_email_disabled\";b:0;}}', 'no'),
(175, 'easy_wp_smtp_activated_time', '1715630853', 'no'),
(176, 'easy_wp_smtp_activated', 'a:1:{s:4:\"lite\";i:1715630853;}', 'yes'),
(179, 'yoast_migrations_free', 'a:1:{s:7:\"version\";s:4:\"23.0\";}', 'yes'),
(180, 'wpseo', 'a:108:{s:8:\"tracking\";b:0;s:16:\"toggled_tracking\";b:0;s:22:\"license_server_version\";b:0;s:15:\"ms_defaults_set\";b:0;s:40:\"ignore_search_engines_discouraged_notice\";b:0;s:19:\"indexing_first_time\";b:1;s:16:\"indexing_started\";b:0;s:15:\"indexing_reason\";s:13:\"first_install\";s:29:\"indexables_indexing_completed\";b:1;s:13:\"index_now_key\";s:0:\"\";s:7:\"version\";s:4:\"23.0\";s:16:\"previous_version\";s:4:\"22.6\";s:20:\"disableadvanced_meta\";b:1;s:30:\"enable_headless_rest_endpoints\";b:1;s:17:\"ryte_indexability\";b:0;s:11:\"baiduverify\";s:0:\"\";s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:9:\"site_type\";s:0:\"\";s:20:\"has_multiple_authors\";s:0:\"\";s:16:\"environment_type\";s:0:\"\";s:23:\"content_analysis_active\";b:1;s:23:\"keyword_analysis_active\";b:1;s:34:\"inclusive_language_analysis_active\";b:0;s:21:\"enable_admin_bar_menu\";b:1;s:26:\"enable_cornerstone_content\";b:1;s:18:\"enable_xml_sitemap\";b:1;s:24:\"enable_text_link_counter\";b:1;s:16:\"enable_index_now\";b:1;s:19:\"enable_ai_generator\";b:1;s:22:\"ai_enabled_pre_default\";b:0;s:22:\"show_onboarding_notice\";b:1;s:18:\"first_activated_on\";i:1715630855;s:13:\"myyoast-oauth\";b:0;s:26:\"semrush_integration_active\";b:1;s:14:\"semrush_tokens\";a:0:{}s:20:\"semrush_country_code\";s:2:\"us\";s:19:\"permalink_structure\";s:36:\"/%year%/%monthnum%/%day%/%postname%/\";s:8:\"home_url\";s:16:\"http://localhost\";s:18:\"dynamic_permalinks\";b:0;s:17:\"category_base_url\";s:0:\"\";s:12:\"tag_base_url\";s:0:\"\";s:21:\"custom_taxonomy_slugs\";a:0:{}s:29:\"enable_enhanced_slack_sharing\";b:1;s:25:\"zapier_integration_active\";b:0;s:19:\"zapier_subscription\";a:0:{}s:14:\"zapier_api_key\";s:0:\"\";s:23:\"enable_metabox_insights\";b:1;s:23:\"enable_link_suggestions\";b:1;s:26:\"algolia_integration_active\";b:0;s:14:\"import_cursors\";a:0:{}s:13:\"workouts_data\";a:1:{s:13:\"configuration\";a:1:{s:13:\"finishedSteps\";a:0:{}}}s:28:\"configuration_finished_steps\";a:0:{}s:36:\"dismiss_configuration_workout_notice\";b:0;s:34:\"dismiss_premium_deactivated_notice\";b:0;s:19:\"importing_completed\";a:0:{}s:26:\"wincher_integration_active\";b:1;s:14:\"wincher_tokens\";a:0:{}s:36:\"wincher_automatically_add_keyphrases\";b:0;s:18:\"wincher_website_id\";s:0:\"\";s:18:\"first_time_install\";b:1;s:34:\"should_redirect_after_install_free\";b:0;s:34:\"activation_redirect_timestamp_free\";i:1715630856;s:18:\"remove_feed_global\";b:0;s:27:\"remove_feed_global_comments\";b:0;s:25:\"remove_feed_post_comments\";b:0;s:19:\"remove_feed_authors\";b:0;s:22:\"remove_feed_categories\";b:0;s:16:\"remove_feed_tags\";b:0;s:29:\"remove_feed_custom_taxonomies\";b:0;s:22:\"remove_feed_post_types\";b:0;s:18:\"remove_feed_search\";b:0;s:21:\"remove_atom_rdf_feeds\";b:0;s:17:\"remove_shortlinks\";b:0;s:21:\"remove_rest_api_links\";b:0;s:20:\"remove_rsd_wlw_links\";b:0;s:19:\"remove_oembed_links\";b:0;s:16:\"remove_generator\";b:0;s:20:\"remove_emoji_scripts\";b:0;s:24:\"remove_powered_by_header\";b:0;s:22:\"remove_pingback_header\";b:0;s:28:\"clean_campaign_tracking_urls\";b:0;s:16:\"clean_permalinks\";b:0;s:32:\"clean_permalinks_extra_variables\";s:0:\"\";s:14:\"search_cleanup\";b:0;s:20:\"search_cleanup_emoji\";b:0;s:23:\"search_cleanup_patterns\";b:0;s:22:\"search_character_limit\";i:50;s:20:\"deny_search_crawling\";b:0;s:21:\"deny_wp_json_crawling\";b:0;s:20:\"deny_adsbot_crawling\";b:0;s:19:\"deny_ccbot_crawling\";b:0;s:29:\"deny_google_extended_crawling\";b:0;s:20:\"deny_gptbot_crawling\";b:0;s:27:\"redirect_search_pretty_urls\";b:0;s:29:\"least_readability_ignore_list\";a:0:{}s:27:\"least_seo_score_ignore_list\";a:0:{}s:23:\"most_linked_ignore_list\";a:0:{}s:24:\"least_linked_ignore_list\";a:0:{}s:28:\"indexables_page_reading_list\";a:5:{i:0;b:0;i:1;b:0;i:2;b:0;i:3;b:0;i:4;b:0;}s:25:\"indexables_overview_state\";s:21:\"dashboard-not-visited\";s:28:\"last_known_public_post_types\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:28:\"last_known_public_taxonomies\";a:3:{i:0;s:8:\"category\";i:1;s:8:\"post_tag\";i:2;s:11:\"post_format\";}s:23:\"last_known_no_unindexed\";a:4:{s:40:\"wpseo_total_unindexed_post_type_archives\";i:1719924579;s:31:\"wpseo_unindexed_post_link_count\";i:1719924579;s:31:\"wpseo_unindexed_term_link_count\";i:1719924579;s:35:\"wpseo_total_unindexed_general_items\";i:1719924579;}s:14:\"new_post_types\";a:0:{}s:14:\"new_taxonomies\";a:0:{}s:34:\"show_new_content_type_notification\";b:0;}', 'yes'),
(181, 'wpseo_titles', 'a:157:{s:17:\"forcerewritetitle\";b:0;s:9:\"separator\";s:7:\"sc-dash\";s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Author at %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:63:\"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:35:\"Page not found %%sep%% %%sitename%%\";s:25:\"social-title-author-wpseo\";s:8:\"%%name%%\";s:26:\"social-title-archive-wpseo\";s:8:\"%%date%%\";s:31:\"social-description-author-wpseo\";s:0:\"\";s:32:\"social-description-archive-wpseo\";s:0:\"\";s:29:\"social-image-url-author-wpseo\";s:0:\"\";s:30:\"social-image-url-archive-wpseo\";s:0:\"\";s:28:\"social-image-id-author-wpseo\";i:0;s:29:\"social-image-id-archive-wpseo\";i:0;s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:53:\"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:0;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:1;s:20:\"breadcrumbs-404crumb\";s:25:\"Error 404: Page not found\";s:29:\"breadcrumbs-display-blog-page\";b:1;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:12:\"Archives for\";s:18:\"breadcrumbs-enable\";b:1;s:16:\"breadcrumbs-home\";s:4:\"Home\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:16:\"You searched for\";s:15:\"breadcrumbs-sep\";s:2:\"»\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:11:\"person_logo\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:22:\"company_alternate_name\";s:0:\"\";s:17:\"company_or_person\";s:7:\"company\";s:25:\"company_or_person_user_id\";b:0;s:17:\"stripcategorybase\";b:0;s:26:\"open_graph_frontpage_title\";s:12:\"%%sitename%%\";s:25:\"open_graph_frontpage_desc\";s:0:\"\";s:26:\"open_graph_frontpage_image\";s:0:\"\";s:24:\"publishing_principles_id\";i:0;s:25:\"ownership_funding_info_id\";i:0;s:29:\"actionable_feedback_policy_id\";i:0;s:21:\"corrections_policy_id\";i:0;s:16:\"ethics_policy_id\";i:0;s:19:\"diversity_policy_id\";i:0;s:28:\"diversity_staffing_report_id\";i:0;s:15:\"org-description\";s:0:\"\";s:9:\"org-email\";s:0:\"\";s:9:\"org-phone\";s:0:\"\";s:14:\"org-legal-name\";s:0:\"\";s:17:\"org-founding-date\";s:0:\"\";s:20:\"org-number-employees\";s:0:\"\";s:10:\"org-vat-id\";s:0:\"\";s:10:\"org-tax-id\";s:0:\"\";s:7:\"org-iso\";s:0:\"\";s:8:\"org-duns\";s:0:\"\";s:11:\"org-leicode\";s:0:\"\";s:9:\"org-naics\";s:0:\"\";s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:23:\"display-metabox-pt-post\";b:1;s:23:\"post_types-post-maintax\";i:0;s:21:\"schema-page-type-post\";s:7:\"WebPage\";s:24:\"schema-article-type-post\";s:7:\"Article\";s:17:\"social-title-post\";s:9:\"%%title%%\";s:23:\"social-description-post\";s:0:\"\";s:21:\"social-image-url-post\";s:0:\"\";s:20:\"social-image-id-post\";i:0;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:23:\"display-metabox-pt-page\";b:1;s:23:\"post_types-page-maintax\";i:0;s:21:\"schema-page-type-page\";s:7:\"WebPage\";s:24:\"schema-article-type-page\";s:4:\"None\";s:17:\"social-title-page\";s:9:\"%%title%%\";s:23:\"social-description-page\";s:0:\"\";s:21:\"social-image-url-page\";s:0:\"\";s:20:\"social-image-id-page\";i:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:1;s:29:\"post_types-attachment-maintax\";i:0;s:27:\"schema-page-type-attachment\";s:7:\"WebPage\";s:30:\"schema-article-type-attachment\";s:4:\"None\";s:10:\"title-case\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-case\";s:0:\"\";s:12:\"noindex-case\";b:0;s:23:\"display-metabox-pt-case\";b:1;s:23:\"post_types-case-maintax\";i:0;s:21:\"schema-page-type-case\";s:7:\"WebPage\";s:24:\"schema-article-type-case\";s:4:\"None\";s:17:\"social-title-case\";s:9:\"%%title%%\";s:23:\"social-description-case\";s:0:\"\";s:21:\"social-image-url-case\";s:0:\"\";s:20:\"social-image-id-case\";i:0;s:20:\"title-ptarchive-case\";s:51:\"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%\";s:23:\"metadesc-ptarchive-case\";s:0:\"\";s:22:\"bctitle-ptarchive-case\";s:0:\"\";s:22:\"noindex-ptarchive-case\";b:0;s:27:\"social-title-ptarchive-case\";s:21:\"%%pt_plural%% Archive\";s:33:\"social-description-ptarchive-case\";s:0:\"\";s:31:\"social-image-url-ptarchive-case\";s:0:\"\";s:30:\"social-image-id-ptarchive-case\";i:0;s:18:\"title-tax-category\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:0;s:25:\"social-title-tax-category\";s:23:\"%%term_title%% Archives\";s:31:\"social-description-tax-category\";s:0:\"\";s:29:\"social-image-url-tax-category\";s:0:\"\";s:28:\"social-image-id-tax-category\";i:0;s:26:\"taxonomy-category-ptparent\";i:0;s:18:\"title-tax-post_tag\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:0;s:25:\"social-title-tax-post_tag\";s:23:\"%%term_title%% Archives\";s:31:\"social-description-tax-post_tag\";s:0:\"\";s:29:\"social-image-url-tax-post_tag\";s:0:\"\";s:28:\"social-image-id-tax-post_tag\";i:0;s:26:\"taxonomy-post_tag-ptparent\";i:0;s:21:\"title-tax-post_format\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:1;s:23:\"noindex-tax-post_format\";b:1;s:28:\"social-title-tax-post_format\";s:23:\"%%term_title%% Archives\";s:34:\"social-description-tax-post_format\";s:0:\"\";s:32:\"social-image-url-tax-post_format\";s:0:\"\";s:31:\"social-image-id-tax-post_format\";i:0;s:29:\"taxonomy-post_format-ptparent\";i:0;s:19:\"title-tax-tipo_case\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:22:\"metadesc-tax-tipo_case\";s:0:\"\";s:29:\"display-metabox-tax-tipo_case\";b:1;s:21:\"noindex-tax-tipo_case\";b:0;s:26:\"social-title-tax-tipo_case\";s:23:\"%%term_title%% Archives\";s:32:\"social-description-tax-tipo_case\";s:0:\"\";s:30:\"social-image-url-tax-tipo_case\";s:0:\"\";s:29:\"social-image-id-tax-tipo_case\";i:0;s:27:\"taxonomy-tipo_case-ptparent\";i:0;s:14:\"person_logo_id\";i:0;s:15:\"company_logo_id\";i:0;s:17:\"company_logo_meta\";b:0;s:16:\"person_logo_meta\";b:0;s:29:\"open_graph_frontpage_image_id\";i:0;}', 'yes'),
(182, 'wpseo_social', 'a:20:{s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:19:\"og_default_image_id\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:21:\"og_frontpage_image_id\";s:0:\"\";s:9:\"opengraph\";b:1;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:0:\"\";s:13:\"wikipedia_url\";s:0:\"\";s:17:\"other_social_urls\";a:0:{}s:12:\"mastodon_url\";s:0:\"\";}', 'yes'),
(183, 'action_scheduler_lock_async-request-runner', '669ec35b453512.92537113|1721680791', 'no'),
(187, 'acf_version', '6.3.3', 'yes'),
(188, 'easy_wp_smtp_deprecated_options_migration_version', '1', 'yes'),
(189, 'easy_wp_smtp_migration_version', '1', 'yes'),
(190, 'easy_wp_smtp_debug_events_db_version', '1', 'yes'),
(207, 'easy_wp_smtp_user_feedback_notice', 'a:2:{s:4:\"time\";i:1715630856;s:9:\"dismissed\";b:0;}', 'yes'),
(220, 'moove_gdpr_plugin_settings', '', 'yes'),
(236, 'easy_wp_smtp_debug', 'a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}', 'no'),
(237, 'easy_wp_smtp_lite_sent_email_counter', '3', 'yes'),
(238, 'easy_wp_smtp_lite_weekly_sent_email_counter', 'a:3:{i:21;i:1;i:27;i:1;i:29;i:1;}', 'yes'),
(264, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:21:\"HTTPS request failed.\";}}', 'yes'),
(265, '_transient_health-check-site-status-result', '{\"good\":14,\"recommended\":8,\"critical\":1}', 'yes'),
(285, 'WPLANG', 'pt_BR', 'yes'),
(286, 'new_admin_email', 'matheus@dzigual.com.br', 'yes'),
(336, 'gdpr_cc_db_created', '1', 'yes'),
(384, 'auto_update_plugins', 'a:14:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";i:2;s:29:\"easy-wp-smtp/easy-wp-smtp.php\";i:3;s:33:\"classic-editor/classic-editor.php\";i:4;s:37:\"gdpr-cookie-compliance/moove-gdpr.php\";i:5;s:39:\"masks-form-fields/masks-form-fields.php\";i:6;s:21:\"safe-svg/safe-svg.php\";i:7;s:24:\"wordpress-seo/wp-seo.php\";i:8;s:40:\"wordpress-seo-premium/wp-seo-premium.php\";i:9;s:25:\"wpseo-video/video-seo.php\";i:10;s:25:\"wpseo-local/local-seo.php\";i:11;s:39:\"wpseo-woocommerce/wpseo-woocommerce.php\";i:12;s:25:\"wpseo-news/wpseo-news.php\";i:13;s:57:\"acf-content-analysis-for-yoast-seo/yoast-acf-analysis.php\";}', 'no'),
(394, 'acf_pro_license', 'YToyOntzOjM6ImtleSI7czo3MjoiYjNKa1pYSmZhV1E5TlRNd05EQjhkSGx3WlQxa1pYWmxiRzl3WlhKOFpHRjBaVDB5TURFMUxUQXpMVEk0SURJek9qTTJPakE0IjtzOjM6InVybCI7czoxNjoiaHR0cDovL2xvY2FsaG9zdCI7fQ==', 'yes'),
(395, 'acf_pro_license_status', 'a:11:{s:6:\"status\";s:6:\"active\";s:7:\"created\";i:0;s:6:\"expiry\";i:0;s:4:\"name\";s:9:\"Developer\";s:8:\"lifetime\";b:1;s:8:\"refunded\";b:0;s:17:\"view_licenses_url\";s:62:\"https://www.advancedcustomfields.com/my-account/view-licenses/\";s:23:\"manage_subscription_url\";s:0:\"\";s:9:\"error_msg\";s:0:\"\";s:10:\"next_check\";i:1721691475;s:16:\"legacy_multisite\";b:1;}', 'yes'),
(401, 'acf_site_health', '{\"version\":\"6.3.3\",\"plugin_type\":\"PRO\",\"activated\":true,\"activated_url\":\"http:\\/\\/localhost\",\"license_type\":\"Developer\",\"license_status\":\"active\",\"subscription_expires\":\"\",\"wp_version\":\"6.4.3\",\"mysql_version\":\"8.4.0\",\"is_multisite\":false,\"active_theme\":{\"name\":\"Boilerplate\",\"version\":\"1.0.0\",\"theme_uri\":\"\",\"stylesheet\":false},\"active_plugins\":{\"advanced-custom-fields-pro\\/acf.php\":{\"name\":\"Advanced Custom Fields PRO\",\"version\":\"6.3.3\",\"plugin_uri\":\"https:\\/\\/www.advancedcustomfields.com\"},\"classic-editor\\/classic-editor.php\":{\"name\":\"Classic Editor\",\"version\":\"1.6.3\",\"plugin_uri\":\"https:\\/\\/wordpress.org\\/plugins\\/classic-editor\\/\"},\"contact-form-7\\/wp-contact-form-7.php\":{\"name\":\"Contact Form 7\",\"version\":\"5.9.6\",\"plugin_uri\":\"https:\\/\\/contactform7.com\\/\"},\"easy-wp-smtp\\/easy-wp-smtp.php\":{\"name\":\"Easy WP SMTP\",\"version\":\"2.3.1\",\"plugin_uri\":\"https:\\/\\/easywpsmtp.com\\/\"},\"gdpr-cookie-compliance\\/moove-gdpr.php\":{\"name\":\"GDPR Cookie Compliance\",\"version\":\"4.15.1\",\"plugin_uri\":\"https:\\/\\/wordpress.org\\/plugins\\/gdpr-cookie-compliance\\/\"},\"masks-form-fields\\/masks-form-fields.php\":{\"name\":\"Masks Form Fields\",\"version\":\"1.11.1\",\"plugin_uri\":\"https:\\/\\/ivanpetermann.com\\/masks-form-fields\\/\"},\"really-simple-ssl\\/rlrsssl-really-simple-ssl.php\":{\"name\":\"Really Simple SSL\",\"version\":\"8.1.5\",\"plugin_uri\":\"https:\\/\\/really-simple-ssl.com\"},\"safe-svg\\/safe-svg.php\":{\"name\":\"Safe SVG\",\"version\":\"2.2.5\",\"plugin_uri\":\"https:\\/\\/wordpress.org\\/plugins\\/safe-svg\\/\"},\"wordpress-importer\\/wordpress-importer.php\":{\"name\":\"WordPress Importer\",\"version\":\"0.8.2\",\"plugin_uri\":\"https:\\/\\/wordpress.org\\/plugins\\/wordpress-importer\\/\"}},\"ui_field_groups\":\"0\",\"php_field_groups\":\"0\",\"json_field_groups\":\"0\",\"rest_field_groups\":\"0\",\"number_of_fields_by_type\":[],\"number_of_third_party_fields_by_type\":[],\"post_types_enabled\":true,\"ui_post_types\":\"4\",\"json_post_types\":\"0\",\"ui_taxonomies\":\"3\",\"json_taxonomies\":\"0\",\"ui_options_pages_enabled\":true,\"ui_options_pages\":\"0\",\"json_options_pages\":\"0\",\"php_options_pages\":\"3\",\"rest_api_format\":\"light\",\"registered_acf_blocks\":\"0\",\"blocks_per_api_version\":[],\"blocks_per_acf_block_version\":[],\"blocks_using_post_meta\":\"0\",\"preload_blocks\":true,\"admin_ui_enabled\":true,\"field_type-modal_enabled\":true,\"field_settings_tabs_enabled\":false,\"shortcode_enabled\":true,\"registered_acf_forms\":\"0\",\"json_save_paths\":1,\"json_load_paths\":1,\"last_updated\":1721417282}', 'no'),
(420, 'rsssl_show_onboarding', '1', 'no'),
(423, 'redirection_options', 'a:33:{s:7:\"support\";b:0;s:5:\"token\";s:32:\"65edf5886f46ae9b93d23083435910b0\";s:12:\"monitor_post\";i:0;s:13:\"monitor_types\";a:0:{}s:19:\"associated_redirect\";s:0:\"\";s:11:\"auto_target\";s:0:\"\";s:15:\"expire_redirect\";i:7;s:10:\"expire_404\";i:7;s:12:\"log_external\";b:0;s:10:\"log_header\";b:0;s:10:\"track_hits\";b:1;s:7:\"modules\";a:0:{}s:10:\"newsletter\";b:0;s:14:\"redirect_cache\";i:1;s:10:\"ip_logging\";i:0;s:10:\"ip_headers\";a:0:{}s:8:\"ip_proxy\";a:0:{}s:13:\"last_group_id\";i:0;s:8:\"rest_api\";i:0;s:5:\"https\";b:0;s:7:\"headers\";a:0:{}s:8:\"database\";s:0:\"\";s:8:\"relocate\";s:0:\"\";s:16:\"preferred_domain\";s:0:\"\";s:7:\"aliases\";a:0:{}s:10:\"permalinks\";a:0:{}s:9:\"cache_key\";i:0;s:13:\"plugin_update\";s:6:\"prompt\";s:13:\"update_notice\";i:0;s:10:\"flag_query\";s:5:\"exact\";s:9:\"flag_case\";b:1;s:13:\"flag_trailing\";b:1;s:10:\"flag_regex\";b:0;}', 'yes'),
(424, 'wp_stream_db', '4.0.0', 'no'),
(426, 'wfls_last_role_change', '1719925416', 'no'),
(427, 'wordfence_version', '7.11.6', 'yes'),
(428, 'wordfence_case', '1', 'yes'),
(429, 'wordfence_installed', '1', 'yes'),
(430, 'wordfenceActivated', '0', 'yes'),
(431, 'wf_plugin_act_error', '', 'yes'),
(436, 'rsssl_options', 'a:1:{s:12:\"site_has_ssl\";s:0:\"\";}', 'yes'),
(439, 'rsssl_current_version', '8.1.5', 'no'),
(447, 'rsssl_wp_version_detected', 'found', 'no'),
(448, 'rsssl_port_check_2082', 'fail', 'no'),
(450, 'maintenance_meta', 'a:4:{s:13:\"first_version\";s:4:\"4.06\";s:13:\"first_install\";i:1719925427;s:11:\"old_version\";b:0;s:20:\"hide_welcome_pointer\";b:1;}', 'yes'),
(451, 'mtnc_db_version', '2', 'yes'),
(452, 'maintenance_options', 'a:26:{s:5:\"state\";b:1;s:10:\"page_title\";s:30:\"Site is undergoing maintenance\";s:7:\"heading\";s:22:\"Maintenance mode is on\";s:11:\"description\";s:57:\"Site will be available soon. Thank you for your patience!\";s:11:\"footer_text\";s:24:\"&copy; Projeto Init 2024\";s:14:\"show_some_love\";s:0:\"\";s:10:\"logo_width\";i:220;s:11:\"logo_height\";s:0:\"\";s:4:\"logo\";s:0:\"\";s:11:\"retina_logo\";s:0:\"\";s:7:\"body_bg\";s:1:\"7\";s:17:\"bg_image_portrait\";s:0:\"\";s:13:\"preloader_img\";s:0:\"\";s:13:\"body_bg_color\";s:7:\"#111111\";s:17:\"controls_bg_color\";s:7:\"#111111\";s:10:\"font_color\";s:7:\"#ffffff\";s:16:\"body_font_family\";s:9:\"Open Sans\";s:16:\"body_font_subset\";s:5:\"Latin\";s:7:\"is_blur\";b:0;s:14:\"blur_intensity\";i:5;s:11:\"503_enabled\";b:0;s:15:\"gg_analytics_id\";s:0:\"\";s:8:\"is_login\";b:1;s:10:\"custom_css\";s:0:\"\";s:13:\"exclude_pages\";s:0:\"\";s:16:\"default_settings\";b:1;}', 'yes'),
(454, 'rsssl_port_check_8443', 'fail', 'no'),
(455, 'rsssl_port_check_2222', 'fail', 'no'),
(459, 'rsssl_6_notice_dismissed', '1', 'no'),
(464, 'rsssl_last_tested_http_method', '7', 'no'),
(465, 'rsssl_http_methods_allowed', 'a:2:{s:11:\"not-allowed\";a:5:{i:0;s:3:\"GET\";i:1;s:4:\"POST\";i:2;s:3:\"PUT\";i:3;s:4:\"HEAD\";i:4;s:7:\"OPTIONS\";}s:7:\"allowed\";a:2:{i:0;s:7:\"CONNECT\";i:1;s:5:\"TRACE\";}}', 'no'),
(467, 'rsssl_ajax_fallback_active', '1719925441', 'no'),
(478, 'action_scheduler_migration_status', 'complete', 'yes'),
(572, '_site_transient_timeout_php_check_38979a08dcd71638878b7b4419751271', '1722022078', 'no'),
(573, '_site_transient_php_check_38979a08dcd71638878b7b4419751271', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:3:\"7.0\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(574, '_transient_timeout_rsssl_can_use_curl_headers_check', '1722022079', 'no'),
(575, '_transient_rsssl_can_use_curl_headers_check', 'a:7:{i:0;s:25:\"Upgrade Insecure Requests\";i:1;s:16:\"X-XSS protection\";i:2;s:22:\"X-Content Type Options\";i:3;s:15:\"Referrer-Policy\";i:4;s:15:\"X-Frame-Options\";i:5;s:18:\"Permissions-Policy\";i:6;s:30:\"HTTP Strict Transport Security\";}', 'no'),
(576, '_transient_timeout_acf_pro_validating_license', '1721681568', 'no'),
(577, '_transient_acf_pro_validating_license', '1', 'no'),
(580, '_transient_timeout_acf_plugin_updates', '1721853475', 'no'),
(581, '_transient_acf_plugin_updates', 'a:5:{s:7:\"plugins\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";a:12:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"6.3.4\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:3:\"6.6\";s:7:\"package\";s:345:\"https://connect.advancedcustomfields.com/v2/plugins/download?version=6.3.4&token=eyJwIjoicHJvIiwiayI6ImIzSmtaWEpmYVdROU5UTXdOREI4ZEhsd1pUMWtaWFpsYkc5d1pYSjhaR0YwWlQweU1ERTFMVEF6TFRJNElESXpPak0yT2pBNCIsIndwX3VybCI6Imh0dHA6XC9cL2xvY2FsaG9zdCIsIndwX3ZlcnNpb24iOiI2LjQuMyIsIndwX211bHRpc2l0ZSI6MCwicGhwX3ZlcnNpb24iOiI4LjAuMzAiLCJibG9ja19jb3VudCI6MH0=\";s:5:\"icons\";a:1:{s:7:\"default\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=3079482\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:8:\"requires\";s:3:\"6.0\";s:12:\"requires_php\";s:3:\"7.4\";s:12:\"release_date\";s:8:\"20240718\";s:13:\"license_valid\";b:1;}}s:9:\"no_update\";a:0:{}s:10:\"expiration\";i:172800;s:6:\"status\";i:1;s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.3.3\";}}', 'no'),
(582, '_site_transient_timeout_theme_roots', '1721682480', 'no'),
(583, '_site_transient_theme_roots', 'a:1:{s:11:\"boilerplate\";s:7:\"/themes\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(585, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:5:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:63:\"https://downloads.wordpress.org/release/pt_BR/wordpress-6.6.zip\";s:6:\"locale\";s:5:\"pt_BR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:63:\"https://downloads.wordpress.org/release/pt_BR/wordpress-6.6.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"6.6\";s:7:\"version\";s:3:\"6.6\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.6.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.6.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-6.6-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.6-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"6.6\";s:7:\"version\";s:3:\"6.6\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.6.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-6.6.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-6.6-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.6-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"6.6\";s:7:\"version\";s:3:\"6.6\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.5.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.5.5.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.5.5-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.5.5-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.5.5\";s:7:\"version\";s:5:\"6.5.5\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:4;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.5.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.4.5-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.4.5-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.4.5-partial-3.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.4.5-rollback-3.zip\";}s:7:\"current\";s:5:\"6.4.5\";s:7:\"version\";s:5:\"6.4.5\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:5:\"6.4.3\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1721680681;s:15:\"version_checked\";s:5:\"6.4.3\";s:12:\"translations\";a:0:{}}', 'no'),
(586, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1721680682;s:7:\"checked\";a:1:{s:11:\"boilerplate\";s:5:\"1.0.0\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(587, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1721680682;s:8:\"response\";a:4:{s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:5:\"1.6.4\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";s:6:\"tested\";s:3:\"6.6\";s:12:\"requires_php\";s:5:\"5.2.4\";s:16:\"requires_plugins\";a:0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.9.7\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.9.7.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";s:3:\"svg\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.3\";s:6:\"tested\";s:3:\"6.6\";s:12:\"requires_php\";s:3:\"7.4\";s:16:\"requires_plugins\";a:0:{}}s:37:\"gdpr-cookie-compliance/moove-gdpr.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:36:\"w.org/plugins/gdpr-cookie-compliance\";s:4:\"slug\";s:22:\"gdpr-cookie-compliance\";s:6:\"plugin\";s:37:\"gdpr-cookie-compliance/moove-gdpr.php\";s:11:\"new_version\";s:6:\"4.15.2\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/gdpr-cookie-compliance/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/gdpr-cookie-compliance.4.15.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/gdpr-cookie-compliance/assets/icon-256x256.png?rev=2376316\";s:2:\"1x\";s:75:\"https://ps.w.org/gdpr-cookie-compliance/assets/icon-128x128.png?rev=2376316\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/gdpr-cookie-compliance/assets/banner-1544x500.png?rev=3024937\";s:2:\"1x\";s:77:\"https://ps.w.org/gdpr-cookie-compliance/assets/banner-772x250.png?rev=3024937\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.5\";s:6:\"tested\";s:3:\"6.6\";s:12:\"requires_php\";s:3:\"5.6\";s:16:\"requires_plugins\";a:0:{}}s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":12:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"6.3.4\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:3:\"6.6\";s:7:\"package\";s:345:\"https://connect.advancedcustomfields.com/v2/plugins/download?version=6.3.4&token=eyJwIjoicHJvIiwiayI6ImIzSmtaWEpmYVdROU5UTXdOREI4ZEhsd1pUMWtaWFpsYkc5d1pYSjhaR0YwWlQweU1ERTFMVEF6TFRJNElESXpPak0yT2pBNCIsIndwX3VybCI6Imh0dHA6XC9cL2xvY2FsaG9zdCIsIndwX3ZlcnNpb24iOiI2LjQuMyIsIndwX211bHRpc2l0ZSI6MCwicGhwX3ZlcnNpb24iOiI4LjAuMzAiLCJibG9ja19jb3VudCI6MH0=\";s:5:\"icons\";a:1:{s:7:\"default\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=3079482\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:8:\"requires\";s:3:\"6.0\";s:12:\"requires_php\";s:3:\"7.4\";s:12:\"release_date\";s:8:\"20240718\";s:13:\"license_valid\";b:1;}}s:12:\"translations\";a:8:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:14:\"contact-form-7\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"5.9.6\";s:7:\"updated\";s:19:\"2023-10-27 10:58:15\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/plugin/contact-form-7/5.9.6/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:12:\"easy-wp-smtp\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"2.3.1\";s:7:\"updated\";s:19:\"2024-07-22 13:47:07\";s:7:\"package\";s:79:\"https://downloads.wordpress.org/translation/plugin/easy-wp-smtp/2.3.1/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:2;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:17:\"masks-form-fields\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:4:\"1.10\";s:7:\"updated\";s:19:\"2020-08-12 13:56:50\";s:7:\"package\";s:83:\"https://downloads.wordpress.org/translation/plugin/masks-form-fields/1.10/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:3;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:17:\"really-simple-ssl\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"8.1.5\";s:7:\"updated\";s:19:\"2023-06-27 07:26:15\";s:7:\"package\";s:84:\"https://downloads.wordpress.org/translation/plugin/really-simple-ssl/8.1.5/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:4;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:11:\"redirection\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2024-01-26 13:44:08\";s:7:\"package\";s:78:\"https://downloads.wordpress.org/translation/plugin/redirection/5.4.2/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:5;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:9:\"wordfence\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:6:\"7.11.6\";s:7:\"updated\";s:19:\"2024-02-05 16:13:28\";s:7:\"package\";s:77:\"https://downloads.wordpress.org/translation/plugin/wordfence/7.11.6/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:6;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:18:\"wordpress-importer\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"0.8.2\";s:7:\"updated\";s:19:\"2020-04-10 06:32:15\";s:7:\"package\";s:85:\"https://downloads.wordpress.org/translation/plugin/wordpress-importer/0.8.2/pt_BR.zip\";s:10:\"autoupdate\";b:1;}i:7;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:13:\"wordpress-seo\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:4:\"23.0\";s:7:\"updated\";s:19:\"2024-04-16 08:20:57\";s:7:\"package\";s:79:\"https://downloads.wordpress.org/translation/plugin/wordpress-seo/23.0/pt_BR.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:10:{s:29:\"easy-wp-smtp/easy-wp-smtp.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:26:\"w.org/plugins/easy-wp-smtp\";s:4:\"slug\";s:12:\"easy-wp-smtp\";s:6:\"plugin\";s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:11:\"new_version\";s:5:\"2.3.1\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/easy-wp-smtp/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/easy-wp-smtp.2.3.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/easy-wp-smtp/assets/icon-256x256.png?rev=2865102\";s:2:\"1x\";s:65:\"https://ps.w.org/easy-wp-smtp/assets/icon-128x128.png?rev=2865102\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/easy-wp-smtp/assets/banner-1544x500.png?rev=2865102\";s:2:\"1x\";s:67:\"https://ps.w.org/easy-wp-smtp/assets/banner-772x250.png?rev=2865102\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.2\";}s:27:\"maintenance/maintenance.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/maintenance\";s:4:\"slug\";s:11:\"maintenance\";s:6:\"plugin\";s:27:\"maintenance/maintenance.php\";s:11:\"new_version\";s:4:\"4.12\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/maintenance/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/maintenance.4.12.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/maintenance/assets/icon-256x256.png?rev=2689583\";s:2:\"1x\";s:64:\"https://ps.w.org/maintenance/assets/icon-128x128.png?rev=2689583\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/maintenance/assets/banner-772x250.png?rev=1637471\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.0\";}s:39:\"masks-form-fields/masks-form-fields.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:31:\"w.org/plugins/masks-form-fields\";s:4:\"slug\";s:17:\"masks-form-fields\";s:6:\"plugin\";s:39:\"masks-form-fields/masks-form-fields.php\";s:11:\"new_version\";s:6:\"1.11.1\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/masks-form-fields/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/masks-form-fields.1.11.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/masks-form-fields/assets/icon-256x256.png?rev=1530096\";s:2:\"1x\";s:70:\"https://ps.w.org/masks-form-fields/assets/icon-128x128.png?rev=1530096\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/masks-form-fields/assets/banner-772x250.png?rev=1530096\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.5\";}s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:31:\"w.org/plugins/really-simple-ssl\";s:4:\"slug\";s:17:\"really-simple-ssl\";s:6:\"plugin\";s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";s:11:\"new_version\";s:5:\"8.1.5\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/really-simple-ssl/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/really-simple-ssl.8.1.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/really-simple-ssl/assets/icon-256x256.png?rev=2839720\";s:2:\"1x\";s:70:\"https://ps.w.org/really-simple-ssl/assets/icon-128x128.png?rev=2839720\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/really-simple-ssl/assets/banner-1544x500.png?rev=3100992\";s:2:\"1x\";s:72:\"https://ps.w.org/really-simple-ssl/assets/banner-772x250.png?rev=3100992\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.9\";}s:27:\"redirection/redirection.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/redirection\";s:4:\"slug\";s:11:\"redirection\";s:6:\"plugin\";s:27:\"redirection/redirection.php\";s:11:\"new_version\";s:5:\"5.4.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/redirection/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/redirection.5.4.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/redirection/assets/icon-256x256.jpg?rev=983639\";s:2:\"1x\";s:63:\"https://ps.w.org/redirection/assets/icon-128x128.jpg?rev=983640\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/redirection/assets/banner-1544x500.jpg?rev=983641\";s:2:\"1x\";s:65:\"https://ps.w.org/redirection/assets/banner-772x250.jpg?rev=983642\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.9\";}s:21:\"safe-svg/safe-svg.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:22:\"w.org/plugins/safe-svg\";s:4:\"slug\";s:8:\"safe-svg\";s:6:\"plugin\";s:21:\"safe-svg/safe-svg.php\";s:11:\"new_version\";s:5:\"2.2.5\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/safe-svg/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/safe-svg.2.2.5.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:53:\"https://ps.w.org/safe-svg/assets/icon.svg?rev=2779013\";s:3:\"svg\";s:53:\"https://ps.w.org/safe-svg/assets/icon.svg?rev=2779013\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/safe-svg/assets/banner-1544x500.png?rev=2683939\";s:2:\"1x\";s:63:\"https://ps.w.org/safe-svg/assets/banner-772x250.png?rev=2683939\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.7\";}s:17:\"stream/stream.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:20:\"w.org/plugins/stream\";s:4:\"slug\";s:6:\"stream\";s:6:\"plugin\";s:17:\"stream/stream.php\";s:11:\"new_version\";s:5:\"4.0.0\";s:3:\"url\";s:37:\"https://wordpress.org/plugins/stream/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/stream.4.0.0.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:51:\"https://ps.w.org/stream/assets/icon.svg?rev=2109965\";s:3:\"svg\";s:51:\"https://ps.w.org/stream/assets/icon.svg?rev=2109965\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:62:\"https://ps.w.org/stream/assets/banner-1544x500.png?rev=2109965\";s:2:\"1x\";s:61:\"https://ps.w.org/stream/assets/banner-772x250.png?rev=2109965\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.5\";}s:23:\"wordfence/wordfence.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:23:\"w.org/plugins/wordfence\";s:4:\"slug\";s:9:\"wordfence\";s:6:\"plugin\";s:23:\"wordfence/wordfence.php\";s:11:\"new_version\";s:6:\"7.11.6\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/wordfence/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/wordfence.7.11.6.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";s:3:\"svg\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/wordfence/assets/banner-1544x500.jpg?rev=2124102\";s:2:\"1x\";s:64:\"https://ps.w.org/wordfence/assets/banner-772x250.jpg?rev=2124102\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.9\";}s:41:\"wordpress-importer/wordpress-importer.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:32:\"w.org/plugins/wordpress-importer\";s:4:\"slug\";s:18:\"wordpress-importer\";s:6:\"plugin\";s:41:\"wordpress-importer/wordpress-importer.php\";s:11:\"new_version\";s:5:\"0.8.2\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/wordpress-importer/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/wordpress-importer.0.8.2.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=2791650\";s:3:\"svg\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=2791650\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-importer/assets/banner-772x250.png?rev=547654\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.2\";}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:4:\"23.0\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/wordpress-seo.23.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.gif?rev=3112542\";s:2:\"1x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-128x128.gif?rev=3112542\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=2643727\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=2643727\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=2643727\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=2643727\";}s:8:\"requires\";s:3:\"6.4\";}}s:7:\"checked\";a:14:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.3.3\";s:33:\"classic-editor/classic-editor.php\";s:5:\"1.6.3\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.9.6\";s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:5:\"2.3.1\";s:37:\"gdpr-cookie-compliance/moove-gdpr.php\";s:6:\"4.15.1\";s:27:\"maintenance/maintenance.php\";s:4:\"4.12\";s:39:\"masks-form-fields/masks-form-fields.php\";s:6:\"1.11.1\";s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";s:5:\"8.1.5\";s:27:\"redirection/redirection.php\";s:5:\"5.4.2\";s:21:\"safe-svg/safe-svg.php\";s:5:\"2.2.5\";s:17:\"stream/stream.php\";s:5:\"4.0.0\";s:23:\"wordfence/wordfence.php\";s:6:\"7.11.6\";s:41:\"wordpress-importer/wordpress-importer.php\";s:5:\"0.8.2\";s:24:\"wordpress-seo/wp-seo.php\";s:4:\"23.0\";}}', 'no'),
(588, '_site_transient_timeout_available_translations', '1721691488', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(589, '_site_transient_available_translations', 'a:131:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-05-13 15:59:22\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"am\";a:8:{s:8:\"language\";s:2:\"am\";s:7:\"version\";s:5:\"6.0.8\";s:7:\"updated\";s:19:\"2022-09-29 20:43:49\";s:12:\"english_name\";s:7:\"Amharic\";s:11:\"native_name\";s:12:\"አማርኛ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.0.8/am.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"am\";i:2;s:3:\"amh\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"ቀጥል\";}}s:3:\"arg\";a:8:{s:8:\"language\";s:3:\"arg\";s:7:\"version\";s:8:\"6.2-beta\";s:7:\"updated\";s:19:\"2022-09-22 16:46:56\";s:12:\"english_name\";s:9:\"Aragonese\";s:11:\"native_name\";s:9:\"Aragonés\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/6.2-beta/arg.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"an\";i:2;s:3:\"arg\";i:3;s:3:\"arg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continar\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-13 12:49:38\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"متابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:6:\"4.8.24\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.24/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-10-19 09:22:30\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-01-19 08:58:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.4.3/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:6:\"4.9.25\";s:7:\"updated\";s:19:\"2019-10-29 07:54:22\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.9.25/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-07 20:18:03\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-20 15:12:22\";s:12:\"english_name\";s:20:\"Bengali (Bangladesh)\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:28:\"চালিয়ে যান\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-10-30 03:24:38\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:33:\"མུ་མཐུད་དུ།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"6.2.6\";s:7:\"updated\";s:19:\"2023-02-22 20:45:53\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.2.6/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-17 08:06:22\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-05 18:59:01\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-01 14:45:04\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-11 13:58:40\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-04-04 17:11:00\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-11-08 18:40:48\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/6.4.3/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-11-08 18:40:24\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-04-04 17:11:19\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/6.4.3/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_AT\";a:8:{s:8:\"language\";s:5:\"de_AT\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-01 07:57:24\";s:12:\"english_name\";s:16:\"German (Austria)\";s:11:\"native_name\";s:21:\"Deutsch (Österreich)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/de_AT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dsb\";a:8:{s:8:\"language\";s:3:\"dsb\";s:7:\"version\";s:5:\"6.2.6\";s:7:\"updated\";s:19:\"2022-07-16 12:13:09\";s:12:\"english_name\";s:13:\"Lower Sorbian\";s:11:\"native_name\";s:16:\"Dolnoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2.6/dsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"dsb\";i:3;s:3:\"dsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Dalej\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-05 11:30:47\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-01-30 17:36:08\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-23 01:49:45\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-10 16:46:25\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-25 06:37:33\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-08-28 15:58:51\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-29 21:55:55\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-12 14:01:59\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-11-08 20:42:04\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-01-31 03:32:51\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-10-16 16:00:04\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_EC\";a:8:{s:8:\"language\";s:5:\"es_EC\";s:7:\"version\";s:5:\"6.2.6\";s:7:\"updated\";s:19:\"2023-04-21 13:32:10\";s:12:\"english_name\";s:17:\"Spanish (Ecuador)\";s:11:\"native_name\";s:19:\"Español de Ecuador\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.2.6/es_EC.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_DO\";a:8:{s:8:\"language\";s:5:\"es_DO\";s:7:\"version\";s:5:\"5.8.9\";s:7:\"updated\";s:19:\"2021-10-08 14:32:50\";s:12:\"english_name\";s:28:\"Spanish (Dominican Republic)\";s:11:\"native_name\";s:33:\"Español de República Dominicana\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.9/es_DO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"5.8.9\";s:7:\"updated\";s:19:\"2021-10-04 20:53:18\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.9/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-06-14 16:02:22\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_UY\";a:8:{s:8:\"language\";s:5:\"es_UY\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-31 18:33:26\";s:12:\"english_name\";s:17:\"Spanish (Uruguay)\";s:11:\"native_name\";s:19:\"Español de Uruguay\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/es_UY.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PR\";a:8:{s:8:\"language\";s:5:\"es_PR\";s:7:\"version\";s:6:\"5.4.15\";s:7:\"updated\";s:19:\"2020-04-29 15:36:59\";s:12:\"english_name\";s:21:\"Spanish (Puerto Rico)\";s:11:\"native_name\";s:23:\"Español de Puerto Rico\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.4.15/es_PR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:6:\"5.2.20\";s:7:\"updated\";s:19:\"2019-03-02 06:35:01\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.2.20/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-18 19:36:30\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-17 18:41:12\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-10-05 10:16:58\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-01-12 17:31:37\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-15 06:10:53\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"fa_AF\";a:8:{s:8:\"language\";s:5:\"fa_AF\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-11 12:20:17\";s:12:\"english_name\";s:21:\"Persian (Afghanistan)\";s:11:\"native_name\";s:31:\"(فارسی (افغانستان\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/fa_AF.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-04-03 15:37:00\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-01 23:56:53\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-11-29 13:35:45\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-29 08:00:23\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:6:\"4.8.24\";s:7:\"updated\";s:19:\"2023-04-30 13:56:46\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.24/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"fy\";a:8:{s:8:\"language\";s:2:\"fy\";s:7:\"version\";s:5:\"6.2.6\";s:7:\"updated\";s:19:\"2022-12-25 12:53:23\";s:12:\"english_name\";s:7:\"Frisian\";s:11:\"native_name\";s:5:\"Frysk\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.2.6/fy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fy\";i:2;s:3:\"fry\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Trochgean\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-13 00:00:51\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-01 06:52:39\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ચાલુ રાખો\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:6:\"4.4.32\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.4.32/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"6.2.6\";s:7:\"updated\";s:19:\"2024-05-04 18:39:24\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.2.6/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-25 08:05:38\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"जारी रखें\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-04-02 17:13:56\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:3:\"hsb\";a:8:{s:8:\"language\";s:3:\"hsb\";s:7:\"version\";s:5:\"6.2.6\";s:7:\"updated\";s:19:\"2023-02-22 17:37:32\";s:12:\"english_name\";s:13:\"Upper Sorbian\";s:11:\"native_name\";s:17:\"Hornjoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2.6/hsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"hsb\";i:3;s:3:\"hsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:4:\"Dale\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-01-22 12:40:26\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-01 12:30:59\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.9.25\";s:7:\"updated\";s:19:\"2018-12-11 10:40:02\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.25/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-04-09 13:38:50\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-03 13:53:06\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"次へ\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:6:\"4.9.25\";s:7:\"updated\";s:19:\"2019-02-16 23:58:56\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.25/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-23 06:35:46\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"6.2.6\";s:7:\"updated\";s:19:\"2023-07-05 11:40:39\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.2.6/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:6:\"4.9.25\";s:7:\"updated\";s:19:\"2018-07-10 11:35:44\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.25/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:6:\"5.2.20\";s:7:\"updated\";s:19:\"2019-06-10 16:18:28\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.2.20/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:2:\"kn\";a:8:{s:8:\"language\";s:2:\"kn\";s:7:\"version\";s:5:\"6.1.6\";s:7:\"updated\";s:19:\"2022-10-20 17:15:28\";s:12:\"english_name\";s:7:\"Kannada\";s:11:\"native_name\";s:15:\"ಕನ್ನಡ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.1.6/kn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kn\";i:2;s:3:\"kan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"ಮುಂದುವರಿಸು\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-10-19 07:05:28\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-09 09:24:08\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.4.3/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:3:\"kir\";a:8:{s:8:\"language\";s:3:\"kir\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-01-30 17:48:58\";s:12:\"english_name\";s:6:\"Kyrgyz\";s:11:\"native_name\";s:16:\"Кыргызча\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.4.3/kir.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ky\";i:2;s:3:\"kir\";i:3;s:3:\"kir\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Улантуу\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-15 12:14:45\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-04-03 13:08:59\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"6.0.8\";s:7:\"updated\";s:19:\"2022-10-01 09:23:52\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.0.8/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-23 19:36:11\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-01-28 08:03:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-19 14:16:42\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:6:\"5.5.14\";s:7:\"updated\";s:19:\"2022-03-11 13:52:22\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.5.14/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.2.37\";s:7:\"updated\";s:19:\"2017-12-26 11:57:10\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.37/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-18 07:19:21\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-24 13:40:33\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-24 08:15:12\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-18 15:34:57\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-10-14 13:34:08\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/6.4.3/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-18 10:59:16\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:6:\"4.8.24\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.24/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:15:\"Panjabi (India)\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-05 20:19:54\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.3.33\";s:7:\"updated\";s:19:\"2015-12-02 21:41:29\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.3.33/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-07 10:22:34\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-07 10:24:39\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/6.4.3/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-03 14:03:53\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_AO\";a:8:{s:8:\"language\";s:5:\"pt_AO\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2023-08-21 12:17:05\";s:12:\"english_name\";s:19:\"Portuguese (Angola)\";s:11:\"native_name\";s:20:\"Português de Angola\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/pt_AO.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-04-07 08:41:53\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-04-02 20:32:18\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:3:\"snd\";a:8:{s:8:\"language\";s:3:\"snd\";s:7:\"version\";s:6:\"5.4.15\";s:7:\"updated\";s:19:\"2020-07-07 01:53:37\";s:12:\"english_name\";s:6:\"Sindhi\";s:11:\"native_name\";s:8:\"سنڌي\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/5.4.15/snd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"sd\";i:2;s:3:\"snd\";i:3;s:3:\"snd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"اڳتي هلو\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-06 05:36:48\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:3:\"skr\";a:8:{s:8:\"language\";s:3:\"skr\";s:7:\"version\";s:5:\"6.4.2\";s:7:\"updated\";s:19:\"2023-11-12 10:29:16\";s:12:\"english_name\";s:7:\"Saraiki\";s:11:\"native_name\";s:14:\"سرائیکی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/6.4.2/skr.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"skr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"جاری رکھو\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-14 12:47:33\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-28 19:14:34\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-01-05 20:51:57\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-12 21:39:28\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"sw\";a:8:{s:8:\"language\";s:2:\"sw\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-02-16 11:09:57\";s:12:\"english_name\";s:7:\"Swahili\";s:11:\"native_name\";s:9:\"Kiswahili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/sw.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sw\";i:2;s:3:\"swa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Endelea\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:5:\"ta_LK\";a:8:{s:8:\"language\";s:5:\"ta_LK\";s:7:\"version\";s:6:\"4.2.37\";s:7:\"updated\";s:19:\"2015-12-03 01:07:44\";s:12:\"english_name\";s:17:\"Tamil (Sri Lanka)\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.37/ta_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"தொடர்க\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"5.8.9\";s:7:\"updated\";s:19:\"2022-06-08 04:30:30\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.9/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:6:\"4.8.24\";s:7:\"updated\";s:19:\"2017-09-30 09:04:29\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.24/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-11 09:10:19\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-31 21:34:33\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-06 18:52:07\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.4.3/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:6:\"5.4.15\";s:7:\"updated\";s:19:\"2020-04-09 11:17:33\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.4.15/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-28 12:02:22\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"6.2.6\";s:7:\"updated\";s:19:\"2023-07-15 15:30:50\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/6.2.6/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-01-31 01:18:24\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"6.2.6\";s:7:\"updated\";s:19:\"2022-07-15 15:25:03\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:12:\"香港中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.2.6/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"6.4.3\";s:7:\"updated\";s:19:\"2024-03-29 13:45:26\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.4.3/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(590, '_transient_timeout_rsssl_certinfo', '1721767091', 'no'),
(591, '_transient_rsssl_certinfo', 'no-response', 'no'),
(592, '_transient_timeout_rsssl_admin_users', '1721684291', 'no'),
(593, '_transient_rsssl_admin_users', 'a:1:{i:0;O:7:\"WP_User\":8:{s:4:\"data\";O:8:\"stdClass\":10:{s:2:\"ID\";s:1:\"1\";s:10:\"user_login\";s:5:\"admin\";s:9:\"user_pass\";s:34:\"$P$BLRJAL1o1g.E1ha0/l4NiPGAUf30q./\";s:13:\"user_nicename\";s:5:\"admin\";s:10:\"user_email\";s:22:\"matheus@dzigual.com.br\";s:8:\"user_url\";s:16:\"http://localhost\";s:15:\"user_registered\";s:19:\"2024-05-13 20:04:14\";s:19:\"user_activation_key\";s:0:\"\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:5:\"admin\";}s:2:\"ID\";i:1;s:4:\"caps\";a:1:{s:13:\"administrator\";b:1;}s:7:\"cap_key\";s:15:\"wp_capabilities\";s:5:\"roles\";a:1:{i:0;s:13:\"administrator\";}s:7:\"allcaps\";a:66:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:15:\"manage_security\";b:1;s:23:\"wf2fa_activate_2fa_self\";b:1;s:25:\"wf2fa_activate_2fa_others\";b:1;s:21:\"wf2fa_manage_settings\";b:1;s:13:\"administrator\";b:1;}s:6:\"filter\";N;s:16:\"\0WP_User\0site_id\";i:1;}}', 'no'),
(594, '_transient_timeout_rsssl_admin_user_count', '1721684291', 'no'),
(595, '_transient_rsssl_admin_user_count', '1', 'no'),
(596, '_transient_timeout_rsssl_code_execution_allowed_status', '1721767091', 'no'),
(597, '_transient_rsssl_code_execution_allowed_status', 'allowed', 'no'),
(598, 'rsssl_plusone_count', '3', 'yes'),
(599, '_site_transient_timeout_browser_5f4591689f71924dbd1e95e47aec4ed7', '1722285492', 'no'),
(600, '_site_transient_browser_5f4591689f71924dbd1e95e47aec4ed7', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"126.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(601, 'rsssl_admin_notices', 'a:0:{}', 'yes'),
(602, '_transient_timeout_action_scheduler_last_pastdue_actions_check', '1721702292', 'no'),
(603, '_transient_action_scheduler_last_pastdue_actions_check', '1721680692', 'no'),
(604, '_site_transient_timeout_community-events-343e65632639fd90f95a81dd0a994cde', '1721723893', 'no'),
(605, '_site_transient_community-events-343e65632639fd90f95a81dd0a994cde', 'a:4:{s:9:\"sandboxed\";b:0;s:5:\"error\";N;s:8:\"location\";a:1:{s:2:\"ip\";s:10:\"172.26.0.0\";}s:6:\"events\";a:0:{}}', 'no'),
(606, '_transient_timeout_feed_b85365aa61afaf3d4189819a6f57c4c4', '1721723893', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(607, '_transient_feed_b85365aa61afaf3d4189819a6f57c4c4', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:52:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n\n \n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:8:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Blog – WordPress.org Brasil\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"https://br.wordpress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 16 Jul 2024 18:35:55 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"pt-BR\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://wordpress.org/?v=6.7-alpha-58778\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:5:\"image\";a:1:{i:0;a:6:{s:4:\"data\";s:11:\"\n	\n	\n	\n	\n	\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:5:{s:3:\"url\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"https://s.w.org/favicon.ico?2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Blog – WordPress.org Brasil\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"https://br.wordpress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:5:\"width\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"32\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:6:\"height\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"32\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:26:\"WordPress 6.6 “Dorsey”\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://br.wordpress.org/2024/07/16/wordpress-6-6-dorsey/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 16 Jul 2024 18:35:54 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3088\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:352:\"Diga olá ao WordPress 6.6 “Dorsey”, em homenagem ao lendário líder da Big Band americana, Tommy Dorsey. Reconhecida por seu trombone e composições de tom suaves, a música de Dorsey cativou o público com sua profundidade emocional e energia vibrante. Deixe seu coração cantar e balançar para as notas profundas do som da Big Band [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:58325:\"\n<figure class=\"wp-block-image size-large\"><a href=\"https://br.wordpress.org/files/2024/07/Release-Edition-Inline-Image-1.png\"><img fetchpriority=\"high\" decoding=\"async\" width=\"1024\" height=\"683\" src=\"https://br.wordpress.org/files/2024/07/Release-Edition-Inline-Image-1-1024x683.png\" alt=\"\" class=\"wp-image-3089\" srcset=\"https://br.wordpress.org/files/2024/07/Release-Edition-Inline-Image-1-1024x683.png 1024w, https://br.wordpress.org/files/2024/07/Release-Edition-Inline-Image-1-300x200.png 300w, https://br.wordpress.org/files/2024/07/Release-Edition-Inline-Image-1-768x512.png 768w, https://br.wordpress.org/files/2024/07/Release-Edition-Inline-Image-1-1536x1024.png 1536w, https://br.wordpress.org/files/2024/07/Release-Edition-Inline-Image-1-2048x1365.png 2048w\" sizes=\"(max-width: 1024px) 100vw, 1024px\" /></a></figure>\n\n\n\n<p>Diga olá ao WordPress 6.6 “Dorsey”, em homenagem ao lendário líder da Big Band americana, Tommy Dorsey. Reconhecida por seu trombone e composições de tom suaves, a música de Dorsey cativou o público com sua profundidade emocional e energia vibrante.</p>\n\n\n\n<p>Deixe seu coração cantar e balançar para as notas profundas do som da <a href=\"https://open.spotify.com/playlist/37i9dQZF1DZ06evO2TT3Ge?si=d9872e46371c4ed7\" target=\"_blank\" rel=\"noreferrer noopener\">Big Band de Dorsey</a> enquanto você explora os novos recursos e aprimoramentos do WordPress 6.6.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Olá, WordPress 6.6!</h2>\n\n\n\n<p>O WordPress 6.6 cumpre a promessa de uma web melhor, trazendo estilo, delicadeza e um conjunto de possibilidades criativas para a experiência de construção do seu site. Esta versão ajuda você a fazer mais com facilidade, colocando ferramentas aprimoradas na ponta dos dedos e dando-lhe um poder sem precedentes nos bastidores. Você encontrará mais maneiras de criar elementos de design bonitos e coerentes em seu site, um novo layout para visualizações de página rápida no editor de sites e a segurança de reversões para atualizações automáticas de plugins com falha, entre muitos outros destaques.</p>\n\n\n\n<p>Além dos novos recursos, “Dorsey” continua a oferecer o desempenho e os ganhos de acessibilidade que você pode esperar de cada versão do WordPress. Explore o que o WordPress 6.6 tem para oferecer e prepare-se para deixar seus recursos levarem seus sites a novos patamares.</p>\n\n\n\n<div class=\"wp-block-buttons is-layout-flex wp-block-buttons-is-layout-flex\">\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link wp-element-button\" href=\"https://wordpress.org/wordpress-6.6.zip\">Baixar o WordPress 6.6 &#8220;Dorsey&#8221;</a></div>\n</div>\n\n\n\n<h2 class=\"wp-block-heading\">O que há de novo</h2>\n\n\n\n<h3 class=\"wp-block-heading\">Adicione mais opções de design para temas de blocos</h3>\n\n\n\n<p>Crie conjuntos de cores ou de fonte para multiplicar combinações de design em um tema. Esses conjuntos oferecem possibilidades de design mais amplas, permitindo a variedade visual dentro das diretrizes de estilo do site.</p>\n\n\n\n<figure class=\"wp-block-image\"><img decoding=\"async\" src=\"https://lh7-us.googleusercontent.com/docsz/AD_4nXc7Mg7QzTwFiR7NDQLj6p5m4eddq6MtscZYzTh5QeGqB2sLP3T_t2Io2cqA5QuSixyze9ZVWqsDF9ZD7VscWn0TWA6lCG0OgZ4o5Ar_8MgQta8B3vu3VzJQHYREY9NxUb9J8e3BFESmcnbRwg7g6GuFfguU?key=EV-htfbHG-kjLl6r6s-uKA\" alt=\"\" /></figure>\n\n\n\n<h3 class=\"wp-block-heading\">Simplifique o fluxo de trabalho com um novo layout para páginas no editor de sites</h3>\n\n\n\n<p>Veja todas as suas páginas e uma prévia de qualquer página selecionada com o novo layout lado a lado no editor do site.</p>\n\n\n\n<figure class=\"wp-block-image\"><img decoding=\"async\" src=\"https://lh7-us.googleusercontent.com/docsz/AD_4nXfdAh-2XaS_6bdw8YcDZMRpkT0O6oWezPzZT3FzKjoWcxhM4ofivJli8eDRs1pO60wJ7F6YjQblSDop_O8MXQKwRlb_-g8CsFPPVb7hY3vEgIBPLb3tDyrvZZhSZL6Zp-ntXQdB2-ixFVoWaY-Empv3hZQ-?key=EV-htfbHG-kjLl6r6s-uKA\" alt=\"\" /></figure>\n\n\n\n<h3 class=\"wp-block-heading\">Atualize automaticamente seus plugins com tranquilidade</h3>\n\n\n\n<p>Aproveite a conveniência das atualizações automáticas de plugins com a segurança de poder reverter se algo der errado. Este recurso oferece ao seu site um novo nível de segurança e funcionalidade aprimorada à medida que se torna disponível e quase nenhum tempo ou largura de banda é gasto para que isso aconteça.</p>\n\n\n\n<figure class=\"wp-block-image\"><img decoding=\"async\" src=\"https://lh7-us.googleusercontent.com/docsz/AD_4nXc3cOWzosH9yiEDJrkmndXXX4QShj-vVMJJslAlgxCT74ugbYJuRPszdUi2rrCt8fnmZm1fTdJ3DTkKxYh5ImN4b6lvyBI3bsf5nvzWSBtexeldhPGyjYZM4Me1eUzfq9bAzlzlwxVqI5Hf_i9y1NGvKEdc?key=EV-htfbHG-kjLl6r6s-uKA\" alt=\"\" /></figure>\n\n\n\n<h3 class=\"wp-block-heading\">Personalize o conteúdo em padrões sincronizados</h3>\n\n\n\n<p>Faça alterações de conteúdo em cada instância de um padrão sincronizado, mantendo um estilo consistente em todo o lugar. Defina essas substituições para blocos de cabeçalho, parágrafo, botão e imagem quando colocado em um padrão sincronizado.</p>\n\n\n\n<figure class=\"wp-block-image\"><img decoding=\"async\" src=\"https://lh7-us.googleusercontent.com/docsz/AD_4nXdH_at4lSW3-Slznfn7HTOEp11xKp889JaLIj-JY5zATJbqZhNPM5MIVZzhn7J2gGhqRbkIzjGMhkFzfQFXfLpxoXu2MXDcPMCXaACaucFHph4dMrd8jHCqFckpk0HtJhEI_cWHTRDR0343_Ut06sgNgaOw?key=EV-htfbHG-kjLl6r6s-uKA\" alt=\"\" /></figure>\n\n\n\n<h3 class=\"wp-block-heading\">Desempenho</h3>\n\n\n\n<p>O WordPress 6.6 apresenta atualizações importantes, como remover chamadas redundantes no <code>WP_Theme_JSON</code>, desativar a carga automática para as opções do banco de dados e eliminar dependências desnecessárias. Outros destaques incluem as adições de pós-carregamento, uma nova diretiva <code>data-wp-on-async</code>, e modelos no editor que carregam aproximadamente 35% mais rápido no geral.</p>\n\n\n\n<h3 class=\"wp-block-heading\">A acessibilidade</h3>\n\n\n\n<p>Esta versão inclui 58 correções de acessibilidade e melhorias. Estes se concentram em aspectos fundamentais da experiência do WordPress, particularmente o componente de visualizações de dados que alimentam a nova experiência de edição de sites e áreas como o Inserter, que fornecem uma maneira fundamental de interagir com blocos e padrões.</p>\n\n\n\n<h3 class=\"wp-block-heading\">E muito mais</h3>\n\n\n\n<p>Visite a <a href=\"https://wordpress.org/download/releases/6-6/\">vitrine de recursos</a> para uma visão geral completa de todos os novos recursos e aprimoramentos do WordPress 6.6.</p>\n\n\n\n<div class=\"wp-block-buttons is-layout-flex wp-block-buttons-is-layout-flex\">\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link wp-element-button\" href=\"https://wordpress.org/download/releases/6-6/\">Veja o que há de novo</a></div>\n</div>\n\n\n\n<h2 class=\"wp-block-heading\">Saiba mais sobre o WordPress 6.6</h2>\n\n\n\n<p>Explore o <a href=\"https://learn.wordpress.org/\">Learn WordPress</a> para vídeos rápidos, <a href=\"https://learn.wordpress.org/social-learning/\">workshops on-line</a> e outros recursos gratuitos para aumentar seus conhecimentos e habilidades do WordPress.</p>\n\n\n\n<p>O <a href=\"https://make.wordpress.org/core/2024/06/25/wordpress-6-6-field-guide/\">Guia de Campo do WordPress 6.6</a> contém informações técnicas detalhadas e <a href=\"https://make.wordpress.org/core/tag/dev-notes-6-6/\">notas para desenvolvedores</a> para ajudá-lo a construir com o WordPress e tirar o máximo proveito desta versão. Não se esqueça de assinar o <a href=\"https://developer.wordpress.org/news/\">blog do desenvolvedor</a> para atualizações, tutoriais e outros conteúdos úteis do WordPress para desenvolvedores.</p>\n\n\n\n<p>Para obter informações sobre instalação, alterações de arquivo, correções e outras atualizações, leia as <a href=\"https://wordpress.org/documentation/wordpress-version/version-6-6/\">notas da versão 6.6</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">O esquadrão da versão 6.6</h2>\n\n\n\n<p>Cada lançamento vem para você de uma equipe dedicada de colaboradores entusiasmados que ajudam a manter as coisas no caminho certo e se movendo suavemente. A equipe que liderou o 6.6 é um grupo multifuncional de colaboradores que estão sempre prontos para defender ideias, remover bloqueadores e resolver problemas.</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li>Líder do lançamento: <a href=\"https://profiles.wordpress.org/matt/\">Matt Mullenweg</a></li>\n\n\n\n<li>Coordenação do lançamento: <a href=\"https://profiles.wordpress.org/meher/\">Meher Bala</a></li>\n\n\n\n<li>Líder de tecnologia principal: <a href=\"https://profiles.wordpress.org/audrasjb/\">Jb Audras</a></li>\n\n\n\n<li>Líderes técnicos do editor: <a href=\"https://profiles.wordpress.org/ellatrix/\">Ella van Durpe</a>, <a href=\"https://profiles.wordpress.org/vcanales/\">Vicente Canales</a></li>\n\n\n\n<li>Principais líderes da triagem: <a href=\"https://profiles.wordpress.org/oglekler/\">Olga Gleckler</a>, <a href=\"https://profiles.wordpress.org/nhrrob/\">Nazmul Hasan Robin</a></li>\n\n\n\n<li>Líderes de triage do editor: <a href=\"https://profiles.wordpress.org/fabiankaegy/\">Fabian Kogy</a>, <a href=\"https://profiles.wordpress.org/colorful-tones/\">Damon Cook</a></li>\n\n\n\n<li>Artigos principais: <a href=\"https://profiles.wordpress.org/juanmaguitar/\">JuanMa Garrido</a>, <a href=\"https://profiles.wordpress.org/jdy68/\">Jenny Dupuy</a>, <a href=\"https://profiles.wordpress.org/josepmoran/\">Josep Morán</a></li>\n\n\n\n<li>Líder de marketing e comunicações: <a href=\"https://profiles.wordpress.org/marybaum/\">Mary Baum</a></li>\n\n\n\n<li>Líder de teste: <a href=\"https://profiles.wordpress.org/annezazu/\">Anne McCarthy</a></li>\n\n\n\n<li>Líder de design: <a href=\"https://profiles.wordpress.org/richtabor/\">Rich Tabor</a></li>\n\n\n\n<li>Líder de desempenho: <a href=\"https://profiles.wordpress.org/adamsilverstein/\">Adam Silverstein</a></li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">Agradecimento aos colaboradores</h2>\n\n\n\n<p>A missão do WordPress é <a href=\"https://wordpress.org/about/\">democratizar a publicação</a> e incorporar as <a href=\"https://opensource.org/osd-annotated\">liberdades que vêm com código aberto</a>. Uma comunidade global e diversificada de pessoas que colaboram para fortalecer o software suporta esse esforço.</p>\n\n\n\n<p>O WordPress 6.6 reflete os esforços incansáveis e a paixão de mais de 630 colaboradores em pelo menos 51 países. Este lançamento também recebeu mais de 150 colaboradores pela primeira vez!</p>\n\n\n\n<p>Sua colaboração proporcionou mais de 1.900 melhorias e correções, garantindo uma versão estável para todos – um testemunho do poder e da capacidade da comunidade de código aberto do WordPress.</p>\n\n\n\n<p class=\"is-style-wporg-props-long alignfull\"><a href=\"https://profiles.wordpress.org/benniledl/\">!Benni</a> · <a href=\"https://profiles.wordpress.org/1naveengiri/\">1naveengiri</a> · <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a> · <a href=\"https://profiles.wordpress.org/aaronrobertshaw/\">Aaron Robertshaw</a> · <a href=\"https://profiles.wordpress.org/aatanasov/\">aatanasov</a> · <a href=\"https://profiles.wordpress.org/abditsori/\">abditsori</a> · <a href=\"https://profiles.wordpress.org/webcommsat/\">Abha Thakor</a> · <a href=\"https://profiles.wordpress.org/abhi3315/\">abhi3315</a> · <a href=\"https://profiles.wordpress.org/abhijitrakas/\">Abhijit Rakas</a> · <a href=\"https://profiles.wordpress.org/abitofmind/\">abitofmind</a> · <a href=\"https://profiles.wordpress.org/kawauso/\">Adam Harley (Kawauso)</a> · <a href=\"https://profiles.wordpress.org/adamsilverstein/\">Adam Silverstein</a> · <a href=\"https://profiles.wordpress.org/adeltahri/\">Adel Tahri</a> · <a href=\"https://profiles.wordpress.org/adrianduffell/\">adrianduffell</a> · <a href=\"https://profiles.wordpress.org/aezazshekh/\">Aezaz Shekh</a> · <a href=\"https://profiles.wordpress.org/chaion07/\">Ahmed Kabir Chaion</a> · <a href=\"https://profiles.wordpress.org/ajfleming/\">ajfleming</a> · <a href=\"https://profiles.wordpress.org/ajitbohra/\">Ajit Bohra</a> · <a href=\"https://profiles.wordpress.org/akashdhawade/\">Akash Dhawade</a> · <a href=\"https://profiles.wordpress.org/wildworks/\">Aki Hamano</a> · <a href=\"https://profiles.wordpress.org/atachibana/\">Akira Tachibana</a> · <a href=\"https://profiles.wordpress.org/akmelias/\">akmelias</a> · <a href=\"https://profiles.wordpress.org/alanfuller/\">Alan Fuller</a> · <a href=\"https://profiles.wordpress.org/aljullu/\">Albert Juh&#233; Lluveras</a> · <a href=\"https://profiles.wordpress.org/alesflex/\">alesflex</a> · <a href=\"https://profiles.wordpress.org/xknown/\">Alex Concha</a> · <a href=\"https://profiles.wordpress.org/cawa-93/\">Alex Kozack</a> · <a href=\"https://profiles.wordpress.org/ajlende/\">Alex Lende</a> · <a href=\"https://profiles.wordpress.org/alexstine/\">Alex Stine</a> · <a href=\"https://profiles.wordpress.org/alexandrebuffet/\">Alexandre Buffet</a> · <a href=\"https://profiles.wordpress.org/alexminza/\">alexminza</a> · <a href=\"https://profiles.wordpress.org/firewatch/\">allilevine</a> · <a href=\"https://profiles.wordpress.org/mrfoxtalbot/\">Alvaro G&#243;mez</a> · <a href=\"https://profiles.wordpress.org/amanias1977/\">amanias1977</a> · <a href=\"https://profiles.wordpress.org/alh0319/\">Amber Hinds</a> · <a href=\"https://profiles.wordpress.org/amirthepiper/\">Amir Abbas</a> · <a href=\"https://profiles.wordpress.org/amisiewicz/\">amisiewicz</a> · <a href=\"https://profiles.wordpress.org/amitraj2203/\">Amit Raj</a> · <a href=\"https://profiles.wordpress.org/anamarijapapic/\">Anamarija Papić</a> · <a href=\"https://profiles.wordpress.org/anlino/\">Anders Nor&#233;n</a> · <a href=\"https://profiles.wordpress.org/andr3ribeiro/\">Andre Ribeiro</a> · <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a> · <a href=\"https://profiles.wordpress.org/awetz583/\">Andrea Roenning</a> · <a href=\"https://profiles.wordpress.org/andraganescu/\">Andrei Draganescu</a> · <a href=\"https://profiles.wordpress.org/euthelup/\">Andrei Lupu</a> · <a href=\"https://profiles.wordpress.org/andrewhayward/\">Andrew Hayward</a> · <a href=\"https://profiles.wordpress.org/l1nuxjedi/\">Andrew Hutchings</a> · <a href=\"https://profiles.wordpress.org/nacin/\">Andrew Nacin</a> · <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a> · <a href=\"https://profiles.wordpress.org/andrewserong/\">Andrew Serong</a> · <a href=\"https://profiles.wordpress.org/oandregal/\">André Maneiro</a> · <a href=\"https://profiles.wordpress.org/afragen/\">Andy Fragen</a> · <a href=\"https://profiles.wordpress.org/aneeshd16/\">Aneesh Devasthale</a> · <a href=\"https://profiles.wordpress.org/angelasjin/\">Angela Jin</a> · <a href=\"https://profiles.wordpress.org/anilvaza/\">Anil Vaza</a> · <a href=\"https://profiles.wordpress.org/ankit-k-gupta/\">Ankit K Gupta</a> · <a href=\"https://profiles.wordpress.org/ankitmaru/\">Ankit Panchal</a> · <a href=\"https://profiles.wordpress.org/annezazu/\">Anne McCarthy</a> · <a href=\"https://profiles.wordpress.org/antpb/\">Anthony Burchell</a> · <a href=\"https://profiles.wordpress.org/antonvlasenko/\">Anton Vlasenko</a> · <a href=\"https://profiles.wordpress.org/aristath/\">Ari Stathopoulos</a> · <a href=\"https://profiles.wordpress.org/artemiosans/\">Artemio Morales</a> · <a href=\"https://profiles.wordpress.org/arthur791004/\">Arthur Chu</a> · <a href=\"https://profiles.wordpress.org/artpi/\">Artur Piszek</a> · <a href=\"https://profiles.wordpress.org/dextorlobo/\">Arun Sharma</a> · <a href=\"https://profiles.wordpress.org/ideag/\">Arunas Liuiza</a> · <a href=\"https://profiles.wordpress.org/asheshmagar/\">Ashesh Magar</a> · <a href=\"https://profiles.wordpress.org/imasikur22/\">Asiqur Rahman</a> · <a href=\"https://profiles.wordpress.org/mohonchandra/\">Asish Chandra Mohon</a> · <a href=\"https://profiles.wordpress.org/aslamdoctor/\">Aslam Doctor</a> · <a href=\"https://profiles.wordpress.org/alisongodar/\">asmittle</a> · <a href=\"https://profiles.wordpress.org/aurooba/\">Aurooba Ahmed</a> · <a href=\"https://profiles.wordpress.org/ayeshrajans/\">Ayesh Karunaratne</a> · <a href=\"https://profiles.wordpress.org/balub/\">Balu B</a> · <a href=\"https://profiles.wordpress.org/bangank36/\">bangank36</a> · <a href=\"https://profiles.wordpress.org/bartkalisz/\">Bart Kalisz</a> · <a href=\"https://profiles.wordpress.org/beafialho/\">Beatriz Fialho</a> · <a href=\"https://profiles.wordpress.org/beaulebens/\">Beau Lebens</a> · <a href=\"https://profiles.wordpress.org/scruffian/\">Ben Dwyer</a> · <a href=\"https://profiles.wordpress.org/benlk/\">Ben Keith</a> · <a href=\"https://profiles.wordpress.org/britner/\">Ben Ritner - Kadence WP</a> · <a href=\"https://profiles.wordpress.org/benjaminpick/\">Benjamin Pick</a> · <a href=\"https://profiles.wordpress.org/benjamin_zekavica/\">Benjamin Zekavica</a> · <a href=\"https://profiles.wordpress.org/benjpw/\">benjpw</a> · <a href=\"https://profiles.wordpress.org/bernhard-reiter/\">bernhard-reiter</a> · <a href=\"https://profiles.wordpress.org/bph/\">Birgit Pauli-Haack</a> · <a href=\"https://profiles.wordpress.org/bissy/\">bissy</a> · <a href=\"https://profiles.wordpress.org/oldrup/\">Bjarne Oldrup</a> · <a href=\"https://profiles.wordpress.org/blackbam/\">Blackbam</a> · <a href=\"https://profiles.wordpress.org/blockify/\">Blockify</a> · <a href=\"https://profiles.wordpress.org/bnewboldbsky/\">bnewboldbsky</a> · <a href=\"https://profiles.wordpress.org/bjorsch/\">Brad Jorsch</a> · <a href=\"https://profiles.wordpress.org/bgoewert/\">Brennan Goewert</a> · <a href=\"https://profiles.wordpress.org/ironprogrammer/\">Brian Alexander</a> · <a href=\"https://profiles.wordpress.org/bacoords/\">Brian Coords</a> · <a href=\"https://profiles.wordpress.org/bgardner/\">Brian Gardner</a> · <a href=\"https://profiles.wordpress.org/bgosnell/\">Brian Gosnell</a> · <a href=\"https://profiles.wordpress.org/masteradhoc/\">Brian Haas</a> · <a href=\"https://profiles.wordpress.org/bridgetwillard/\">Bridget Willard</a> · <a href=\"https://profiles.wordpress.org/brookemk/\">Brooke</a> · <a href=\"https://profiles.wordpress.org/freibergergarcia/\">Bruno Freiberger Garcia</a> · <a href=\"https://profiles.wordpress.org/burnuser/\">burnuser</a> · <a href=\"https://profiles.wordpress.org/icaleb/\">Caleb Burks</a> · <a href=\"https://profiles.wordpress.org/stringpiggy/\">Candy</a> · <a href=\"https://profiles.wordpress.org/cbravobernal/\">Carlos Bravo</a> · <a href=\"https://profiles.wordpress.org/carlosgprim/\">Carlos G. P.</a> · <a href=\"https://profiles.wordpress.org/poena/\">Carolina Nymark</a> · <a href=\"https://profiles.wordpress.org/cbirdsong/\">cbirdsong</a> · <a href=\"https://profiles.wordpress.org/shireling/\">Chad Chadbourne</a> · <a href=\"https://profiles.wordpress.org/caercam/\">Charlie Merland</a> · <a href=\"https://profiles.wordpress.org/cbringmann/\">Chloe Bringmann</a> · <a href=\"https://profiles.wordpress.org/chouby/\">Chouby</a> · <a href=\"https://profiles.wordpress.org/jazzs3quence/\">Chris Reynolds</a> · <a href=\"https://profiles.wordpress.org/chrisdotdotdot/\">chrisdotdotdot</a> · <a href=\"https://profiles.wordpress.org/christopherplus/\">Christopher</a> · <a href=\"https://profiles.wordpress.org/costdev/\">Colin Stewart</a> · <a href=\"https://profiles.wordpress.org/colind/\">ColinD</a> · <a href=\"https://profiles.wordpress.org/colle/\">colle</a> · <a href=\"https://profiles.wordpress.org/comecaramelos/\">comecaramelos</a> · <a href=\"https://profiles.wordpress.org/cotobago/\">Constantine Vasilyev</a> · <a href=\"https://profiles.wordpress.org/cookiesfordevo/\">CookiesForDevo</a> · <a href=\"https://profiles.wordpress.org/coreymckrill/\">Corey McKrill</a> · <a href=\"https://profiles.wordpress.org/craigfrancis/\">Craig Francis</a> · <a href=\"https://profiles.wordpress.org/crazytonyli/\">crazytonyli</a> · <a href=\"https://profiles.wordpress.org/cwhitmore/\">Cullen Whitmore</a> · <a href=\"https://profiles.wordpress.org/curdin/\">Curdin Krummenacher</a> · <a href=\"https://profiles.wordpress.org/cyrus11/\">cyrus11</a> · <a href=\"https://profiles.wordpress.org/daledupreez/\">Dale du Preez</a> · <a href=\"https://profiles.wordpress.org/colorful tones/\">Damon Cook</a> · <a href=\"https://profiles.wordpress.org/colorful-tones/\">Damon Cook</a> · <a href=\"https://profiles.wordpress.org/dansoschin/\">Dan Soschin</a> · <a href=\"https://profiles.wordpress.org/daniguardiola/\">Dani Guardiola</a> · <a href=\"https://profiles.wordpress.org/talldanwp/\">Daniel Richards</a> · <a href=\"https://profiles.wordpress.org/darerodz/\">darerodz</a> · <a href=\"https://profiles.wordpress.org/nerrad/\">Darren Ethier (nerrad)</a> · <a href=\"https://profiles.wordpress.org/darshitrajyaguru97/\">Darshit Rajyaguru</a> · <a href=\"https://profiles.wordpress.org/dav4/\">dav4</a> · <a href=\"https://profiles.wordpress.org/davecpage/\">Dave Page</a> · <a href=\"https://profiles.wordpress.org/diggeddy/\">David</a> · <a href=\"https://profiles.wordpress.org/davidakennedy/\">David A. Kennedy</a> · <a href=\"https://profiles.wordpress.org/davidbaumwald/\">David Baumwald</a> · <a href=\"https://profiles.wordpress.org/davidbinda/\">David Biňovec</a> · <a href=\"https://profiles.wordpress.org/davidabowman/\">David Bowman</a> · <a href=\"https://profiles.wordpress.org/dpcalhoun/\">David Calhoun</a> · <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a> · <a href=\"https://profiles.wordpress.org/dkjensen/\">David Jensen</a> · <a href=\"https://profiles.wordpress.org/justlevine/\">David Levine</a> · <a href=\"https://profiles.wordpress.org/daviedr/\">David Rozando</a> · <a href=\"https://profiles.wordpress.org/get_dave/\">David Smith</a> · <a href=\"https://profiles.wordpress.org/davideferre/\">davideferre</a> · <a href=\"https://profiles.wordpress.org/rxnlabs/\">De\'Yont&#233; W.</a> · <a href=\"https://profiles.wordpress.org/dsas/\">Dean Sas</a> · <a href=\"https://profiles.wordpress.org/deeppatel8950/\">Deep Patel</a> · <a href=\"https://profiles.wordpress.org/deepakvijayan/\">Deepak Vijayan</a> · <a href=\"https://profiles.wordpress.org/dingo_d/\">Denis Žoljom</a> · <a href=\"https://profiles.wordpress.org/dmsnell/\">Dennis Snell</a> · <a href=\"https://profiles.wordpress.org/derekblank/\">Derek Blank</a> · <a href=\"https://profiles.wordpress.org/dernin/\">Devin Curtis</a> · <a href=\"https://profiles.wordpress.org/dharm1025/\">Dharmesh Patel</a> · <a href=\"https://profiles.wordpress.org/dhrumilk/\">Dhrumil Kumbhani</a> · <a href=\"https://profiles.wordpress.org/dhruval04/\">Dhruval Shah</a> · <a href=\"https://profiles.wordpress.org/dhruvang21/\">dhruvang21</a> · <a href=\"https://profiles.wordpress.org/dhruvkb/\">dhruvkb</a> · <a href=\"https://profiles.wordpress.org/diedeexterkate/\">DiedeExterkate</a> · <a href=\"https://profiles.wordpress.org/dilipbheda/\">Dilip Bheda</a> · <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a> · <a href=\"https://profiles.wordpress.org/itsjustdj/\">DJ</a> · <a href=\"https://profiles.wordpress.org/djzone/\">DjZoNe</a> · <a href=\"https://profiles.wordpress.org/ocean90/\">Dominik Schilling</a> · <a href=\"https://profiles.wordpress.org/drewapicture/\">Drew Jaynes</a> · <a href=\"https://profiles.wordpress.org/drrxbracho/\">drrxbracho</a> · <a href=\"https://profiles.wordpress.org/elrae/\">Earle Davies</a> · <a href=\"https://profiles.wordpress.org/talksina/\">Elena Brescacin</a> · <a href=\"https://profiles.wordpress.org/ellatrix/\">Ella van Durpe</a> · <a href=\"https://profiles.wordpress.org/manooweb/\">Emmanuel Hesry</a> · <a href=\"https://profiles.wordpress.org/enej/\">Enej Bajgorić</a> · <a href=\"https://profiles.wordpress.org/garridinsi/\">Eneko Garrido</a> · <a href=\"https://profiles.wordpress.org/enodekciw/\">enodekciw</a> · <a href=\"https://profiles.wordpress.org/lopo/\">Enrico Battocchi</a> · <a href=\"https://profiles.wordpress.org/enricosorcinelli/\">Enrico Sorcinelli</a> · <a href=\"https://profiles.wordpress.org/kebbet/\">Erik</a> · <a href=\"https://profiles.wordpress.org/estelaris/\">Estela Rueda</a> · <a href=\"https://profiles.wordpress.org/evanltd/\">evanltd</a> · <a href=\"https://profiles.wordpress.org/fabiankaegy/\">Fabian Kägy</a> · <a href=\"https://profiles.wordpress.org/gaambo/\">Fabian Todt</a> · <a href=\"https://profiles.wordpress.org/faisal03/\">Faisal Alvi</a> · <a href=\"https://profiles.wordpress.org/fanly/\">Fanly</a> · <a href=\"https://profiles.wordpress.org/iamfarhan09/\">Farhan Ahmed</a> · <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a> · <a href=\"https://profiles.wordpress.org/flabernardez/\">Flavia Bern&#225;rdez Rodr&#237;guez</a> · <a href=\"https://profiles.wordpress.org/mista-flo/\">Florian TIAR</a> · <a href=\"https://profiles.wordpress.org/f-j-kaiser/\">Franz Josef Kaiser</a> · <a href=\"https://profiles.wordpress.org/lunule/\">Gabor Lippert</a> · <a href=\"https://profiles.wordpress.org/galbaras/\">Gal Baras</a> · <a href=\"https://profiles.wordpress.org/voldemortensen/\">Garth Mortensen</a> · <a href=\"https://profiles.wordpress.org/garyj/\">Gary Jones</a> · <a href=\"https://profiles.wordpress.org/mamaduka/\">George Mamadashvili</a> · <a href=\"https://profiles.wordpress.org/georgestephanis/\">George Stephanis</a> · <a href=\"https://profiles.wordpress.org/geriux/\">Gerardo Pacheco</a> · <a href=\"https://profiles.wordpress.org/glendaviesnz/\">Glen Davies</a> · <a href=\"https://profiles.wordpress.org/blepoxp/\">Glenn Ansley</a> · <a href=\"https://profiles.wordpress.org/grantmkin/\">Grant M. Kinney</a> · <a href=\"https://profiles.wordpress.org/gziolo/\">Greg Ziółkowski</a> · <a href=\"https://profiles.wordpress.org/wido/\">Guido Scialfa</a> · <a href=\"https://profiles.wordpress.org/priethor/\">H&#233;ctor Prieto</a> · <a href=\"https://profiles.wordpress.org/hakre/\">hakre</a> · <a href=\"https://profiles.wordpress.org/hanneslsm/\">hanneslsm</a> · <a href=\"https://profiles.wordpress.org/hage/\">Hans-Gerd Gerhards</a> · <a href=\"https://profiles.wordpress.org/haritpanchal/\">Harit Panchal</a> · <a href=\"https://profiles.wordpress.org/harshgajipara/\">Harsh Gajipara</a> · <a href=\"https://profiles.wordpress.org/hazdiego/\">Haz</a> · <a href=\"https://profiles.wordpress.org/heinperu/\">heinvv</a> · <a href=\"https://profiles.wordpress.org/helgatheviking/\">HelgaTheViking</a> · <a href=\"https://profiles.wordpress.org/hinnerk/\">Hinnerk Altenburg</a> · <a href=\"https://profiles.wordpress.org/hbhalodia/\">Hit Bhalodia</a> · <a href=\"https://profiles.wordpress.org/hitendra-chopda/\">Hitendra Chopda</a> · <a href=\"https://profiles.wordpress.org/humanify/\">humanify</a> · <a href=\"https://profiles.wordpress.org/huubl/\">huubl</a> · <a href=\"https://profiles.wordpress.org/huzaifaalmesbah/\">Huzaifa Al Mesbah</a> · <a href=\"https://profiles.wordpress.org/ianbelanger/\">Ian Belanger</a> · <a href=\"https://profiles.wordpress.org/ignatiusjeroe/\">ignatiusjeroe</a> · <a href=\"https://profiles.wordpress.org/imranhasanraaz/\">Imran</a> · <a href=\"https://profiles.wordpress.org/inwerpsel/\">inwerpsel</a> · <a href=\"https://profiles.wordpress.org/ipstenu/\">Ipstenu (Mika Epstein)</a> · <a href=\"https://profiles.wordpress.org/isabel_brison/\">Isabel Brison</a> · <a href=\"https://profiles.wordpress.org/itpathsolutions/\">IT Path Solutions</a> · <a href=\"https://profiles.wordpress.org/ivanottinger/\">ivanottinger</a> · <a href=\"https://profiles.wordpress.org/weijland/\">Jaap Weijland</a> · <a href=\"https://profiles.wordpress.org/jpstevens/\">Jack Stevens</a> · <a href=\"https://profiles.wordpress.org/jaclync/\">jaclync</a> · <a href=\"https://profiles.wordpress.org/jameskoster/\">James Koster</a> · <a href=\"https://profiles.wordpress.org/jwgoedert/\">James Wesley Goedert</a> · <a href=\"https://profiles.wordpress.org/xhemals/\">Jamie Speller</a> · <a href=\"https://profiles.wordpress.org/janboddez/\">Jan Boddez</a> · <a href=\"https://profiles.wordpress.org/jtolleouw/\">Jansen Tolle</a> · <a href=\"https://profiles.wordpress.org/janthiel/\">janthiel</a> · <a href=\"https://profiles.wordpress.org/jsnajdr/\">Jarda Snajdr</a> · <a href=\"https://profiles.wordpress.org/szopserwis/\">Jarek Mazurczak</a> · <a href=\"https://profiles.wordpress.org/jpolakovic/\">Jaroslav \"Dero\" Polakovic</a> · <a href=\"https://profiles.wordpress.org/jason_the_adams/\">Jason Adams</a> · <a href=\"https://profiles.wordpress.org/pbking/\">Jason Crist</a> · <a href=\"https://profiles.wordpress.org/jsnjohnston/\">Jason Johnston</a> · <a href=\"https://profiles.wordpress.org/madtownlems/\">Jason LeMahieu (MadtownLems)</a> · <a href=\"https://profiles.wordpress.org/javiercasares/\">Javier Casares</a> · <a href=\"https://profiles.wordpress.org/jayanthparthsarathy/\">jayanthparthsarathy</a> · <a href=\"https://profiles.wordpress.org/jdekhtiar/\">jdekhtiar</a> · <a href=\"https://profiles.wordpress.org/audrasjb/\">Jean-Baptiste Audras</a> · <a href=\"https://profiles.wordpress.org/krokodok/\">Jeff Chi</a> · <a href=\"https://profiles.wordpress.org/jffng/\">Jeff Ong</a> · <a href=\"https://profiles.wordpress.org/jeffpaul/\">Jeffrey Paul</a> · <a href=\"https://profiles.wordpress.org/jeflopodev/\">jeflopo</a> · <a href=\"https://profiles.wordpress.org/jdy68/\">Jenny Dupuy</a> · <a href=\"https://profiles.wordpress.org/jeremyfelt/\">Jeremy Felt</a> · <a href=\"https://profiles.wordpress.org/jeherve/\">Jeremy Herve</a> · <a href=\"https://profiles.wordpress.org/jpry/\">Jeremy Pry</a> · <a href=\"https://profiles.wordpress.org/jeryj/\">Jerry Jones</a> · <a href=\"https://profiles.wordpress.org/amieiro/\">Jes&#250;s Amieiro</a> · <a href=\"https://profiles.wordpress.org/onmauitime/\">Jess</a> · <a href=\"https://profiles.wordpress.org/luminuu/\">Jessica Lyschik</a> · <a href=\"https://profiles.wordpress.org/jhned/\">jhned</a> · <a href=\"https://profiles.wordpress.org/jigar-bhanushali/\">Jigar Bhanushali</a> · <a href=\"https://profiles.wordpress.org/jipmoors/\">Jip Moors</a> · <a href=\"https://profiles.wordpress.org/jivedig/\">JiveDig</a> · <a href=\"https://profiles.wordpress.org/joedolson/\">Joe Dolson</a> · <a href=\"https://profiles.wordpress.org/joemcgill/\">Joe McGill</a> · <a href=\"https://profiles.wordpress.org/joen/\">Joen Asmussen</a> · <a href=\"https://profiles.wordpress.org/timse201/\">Johannes J&#252;lg</a> · <a href=\"https://profiles.wordpress.org/johnbillion/\">John Blackbourn</a> · <a href=\"https://profiles.wordpress.org/johnillo/\">John Espiritu</a> · <a href=\"https://profiles.wordpress.org/johnny5/\">John Godley</a> · <a href=\"https://profiles.wordpress.org/bitmachina/\">John Hooks</a> · <a href=\"https://profiles.wordpress.org/johnjamesjacoby/\">John James Jacoby</a> · <a href=\"https://profiles.wordpress.org/jonsurrell/\">Jon Surrell</a> · <a href=\"https://profiles.wordpress.org/jon092/\">jon092</a> · <a href=\"https://profiles.wordpress.org/jaruzek/\">Jonathan</a> · <a href=\"https://profiles.wordpress.org/psykro/\">Jonathan Bossenger</a> · <a href=\"https://profiles.wordpress.org/desrosj/\">Jonathan Desrosiers</a> · <a href=\"https://profiles.wordpress.org/n2erjo00/\">Joni Erkkil&#228;</a> · <a href=\"https://profiles.wordpress.org/spacedmonkey/\">Jonny Harris</a> · <a href=\"https://profiles.wordpress.org/jordesign/\">jordesign</a> · <a href=\"https://profiles.wordpress.org/jorgefilipecosta/\">Jorge Costa</a> · <a href=\"https://profiles.wordpress.org/josevarghese/\">Jose Varghese</a> · <a href=\"https://profiles.wordpress.org/josepmoran/\">Josep Morán</a> · <a href=\"https://profiles.wordpress.org/josephscott/\">Joseph Scott</a> · <a href=\"https://profiles.wordpress.org/verygoode/\">Joshua Goode</a> · <a href=\"https://profiles.wordpress.org/jossnaz/\">Jossnaz</a> · <a href=\"https://profiles.wordpress.org/juanfra/\">Juan Aldasoro</a> · <a href=\"https://profiles.wordpress.org/juanmaguitar/\">JuanMa Garrido</a> · <a href=\"https://profiles.wordpress.org/jules/\">jules</a> · <a href=\"https://profiles.wordpress.org/juliemoynat/\">Julie Moynat</a> · <a href=\"https://profiles.wordpress.org/jrf/\">Juliette Reinders Folmer</a> · <a href=\"https://profiles.wordpress.org/juliobox/\">Julio Potier</a> · <a href=\"https://profiles.wordpress.org/greenshady/\">Justin Tadlock</a> · <a href=\"https://profiles.wordpress.org/justnorris/\">justnorris</a> · <a href=\"https://profiles.wordpress.org/jyolsna/\">Jyolsna J E</a> · <a href=\"https://profiles.wordpress.org/kadamwhite/\">K. Adam White</a> · <a href=\"https://profiles.wordpress.org/kafleg/\">KafleG</a> · <a href=\"https://profiles.wordpress.org/kevin940726/\">Kai Hao</a> · <a href=\"https://profiles.wordpress.org/kajalgohel/\">Kajal Gohel</a> · <a href=\"https://profiles.wordpress.org/kamran8176/\">kamran8176</a> · <a href=\"https://profiles.wordpress.org/kapilpaul/\">Kapil Paul</a> · <a href=\"https://profiles.wordpress.org/karlijnbk/\">Karlijn Bok</a> · <a href=\"https://profiles.wordpress.org/karolmanijak/\">Karol Manijak</a> · <a href=\"https://profiles.wordpress.org/thekt12/\">Karthik Thayyil</a> · <a href=\"https://profiles.wordpress.org/zoonini/\">Kathryn Presner</a> · <a href=\"https://profiles.wordpress.org/kellenmace/\">Kellen Mace</a> · <a href=\"https://profiles.wordpress.org/ryelle/\">Kelly Choyce-Dwan</a> · <a href=\"https://profiles.wordpress.org/keoshi/\">keoshi</a> · <a href=\"https://profiles.wordpress.org/kevinwhoffman/\">Kevin Hoffman</a> · <a href=\"https://profiles.wordpress.org/khokansardar/\">Khokan Sardar</a> · <a href=\"https://profiles.wordpress.org/killua99/\">killua99</a> · <a href=\"https://profiles.wordpress.org/kirasong/\">Kira Schroder</a> · <a href=\"https://profiles.wordpress.org/kitchin/\">kitchin</a> · <a href=\"https://profiles.wordpress.org/ixkaito/\">Kite</a> · <a href=\"https://profiles.wordpress.org/kjellr/\">Kjell Reigstad</a> · <a href=\"https://profiles.wordpress.org/kkmuffme/\">kkmuffme</a> · <a href=\"https://profiles.wordpress.org/kmvan/\">kmvan</a> · <a href=\"https://profiles.wordpress.org/kovshenin/\">Konstantin Kovshenin</a> · <a href=\"https://profiles.wordpress.org/kristastevens/\">kristastevens</a> · <a href=\"https://profiles.wordpress.org/kristenfisher427/\">kristenfisher427</a> · <a href=\"https://profiles.wordpress.org/krupajnanda/\">Krupa Nanda</a> · <a href=\"https://profiles.wordpress.org/krupalpanchal/\">Krupal Panchal</a> · <a href=\"https://profiles.wordpress.org/kushang78/\">Kushang Tailor</a> · <a href=\"https://profiles.wordpress.org/kyleak/\">kyleak</a> · <a href=\"https://profiles.wordpress.org/mlaetitia/\">Lae</a> · <a href=\"https://profiles.wordpress.org/lanresmith/\">Lanre Smith</a> · <a href=\"https://profiles.wordpress.org/lgersman/\">Lars Gersmann</a> · <a href=\"https://profiles.wordpress.org/newyorkerlaura/\">Laura Byrne</a> · <a href=\"https://profiles.wordpress.org/laurelfulford/\">laurelfulford</a> · <a href=\"https://profiles.wordpress.org/oncecoupled/\">Lauren</a> · <a href=\"https://profiles.wordpress.org/laurlittle/\">Lauren Stein</a> · <a href=\"https://profiles.wordpress.org/peexy/\">Laurent Naudier</a> · <a href=\"https://profiles.wordpress.org/leemon/\">leemon</a> · <a href=\"https://profiles.wordpress.org/0mirka00/\">Lena Morita</a> · <a href=\"https://profiles.wordpress.org/leonidasmilossis/\">Leonidas Milosis</a> · <a href=\"https://profiles.wordpress.org/rudlinkon/\">Linkon Miyan</a> · <a href=\"https://profiles.wordpress.org/liviopv/\">liviopv</a> · <a href=\"https://profiles.wordpress.org/louiswol94/\">Louis Wolmarans</a> · <a href=\"https://profiles.wordpress.org/thelovekesh/\">Lovekesh Kumar</a> · <a href=\"https://profiles.wordpress.org/luboslives/\">luboslives</a> · <a href=\"https://profiles.wordpress.org/gigitux/\">Luigi Teschio</a> · <a href=\"https://profiles.wordpress.org/lardsax/\">Luis</a> · <a href=\"https://profiles.wordpress.org/interdevel/\">Luis Molina (interdevel)</a> · <a href=\"https://profiles.wordpress.org/luisherranz/\">luisherranz</a> · <a href=\"https://profiles.wordpress.org/lyonmuller/\">Lyon M&#252;ller</a> · <a href=\"https://profiles.wordpress.org/pagelab/\">M&#225;rcio Duarte</a> · <a href=\"https://profiles.wordpress.org/madhudollu/\">Madhu Dollu</a> · <a href=\"https://profiles.wordpress.org/onemaggie/\">Maggie Cabrera</a> · <a href=\"https://profiles.wordpress.org/mai21/\">Mai</a> · <a href=\"https://profiles.wordpress.org/makdiahussain/\">Makdia Hussain</a> · <a href=\"https://profiles.wordpress.org/manfcarlo/\">manfcarlo</a> · <a href=\"https://profiles.wordpress.org/manojmaharrshi/\">Manoj Maharrshi</a> · <a href=\"https://profiles.wordpress.org/mdxfr/\">Marc</a> · <a href=\"https://profiles.wordpress.org/marc4/\">Marc Armengou</a> · <a href=\"https://profiles.wordpress.org/fullofcaffeine/\">Marcelo de Moraes Serpa</a> · <a href=\"https://profiles.wordpress.org/mciampini/\">Marco Ciampini</a> · <a href=\"https://profiles.wordpress.org/pereirinha/\">Marco Pereirinha</a> · <a href=\"https://profiles.wordpress.org/marherumr/\">marherumr</a> · <a href=\"https://profiles.wordpress.org/chaton666/\">Marie Comet</a> · <a href=\"https://profiles.wordpress.org/tyxla/\">Marin Atanasov</a> · <a href=\"https://profiles.wordpress.org/santosguillamot/\">Mario Santos</a> · <a href=\"https://profiles.wordpress.org/clorith/\">Marius L. J.</a> · <a href=\"https://profiles.wordpress.org/markhowellsmead/\">Mark Howells-Mead</a> · <a href=\"https://profiles.wordpress.org/markjaquith/\">Mark Jaquith</a> · <a href=\"https://profiles.wordpress.org/markjszymanski/\">Mark Szymanski</a> · <a href=\"https://profiles.wordpress.org/mapk/\">Mark Uraine</a> · <a href=\"https://profiles.wordpress.org/mhkuu/\">Martijn van der Klis</a> · <a href=\"https://profiles.wordpress.org/marybaum/\">Mary Baum</a> · <a href=\"https://profiles.wordpress.org/mat-lipe/\">Mat Lipe</a> · <a href=\"https://profiles.wordpress.org/imath/\">Mathieu Viet</a> · <a href=\"https://profiles.wordpress.org/mmaattiiaass/\">Matias Benedetto</a> · <a href=\"https://profiles.wordpress.org/matveb/\">Matias Ventura</a> · <a href=\"https://profiles.wordpress.org/webdevmattcrom/\">Matt Cromwell</a> · <a href=\"https://profiles.wordpress.org/mattmm/\">Matt Medeiros</a> · <a href=\"https://profiles.wordpress.org/matt/\">Matt Mullenweg</a> · <a href=\"https://profiles.wordpress.org/mattormeeple/\">Matt Sherman</a> · <a href=\"https://profiles.wordpress.org/hmbashar/\">Md Abul Bashar</a> · <a href=\"https://profiles.wordpress.org/devsahadat/\">Md Sahadat Husain</a> · <a href=\"https://profiles.wordpress.org/tofajjal02/\">Md Tofajjal Hossen</a> · <a href=\"https://profiles.wordpress.org/mdnesarmridha/\">MD.NESAR MRIDHA</a> · <a href=\"https://profiles.wordpress.org/immeet94/\">Meet Makadia</a> · <a href=\"https://profiles.wordpress.org/meetmehta1205/\">Meet Mehta</a> · <a href=\"https://profiles.wordpress.org/megane9988/\">megane9988</a> · <a href=\"https://profiles.wordpress.org/meher/\">Meher Bala</a> · <a href=\"https://profiles.wordpress.org/hrkhal/\">Michael James Ilett</a> · <a href=\"https://profiles.wordpress.org/czapla/\">Michal Czaplinski</a> · <a href=\"https://profiles.wordpress.org/mcsf/\">Miguel Fonseca</a> · <a href=\"https://profiles.wordpress.org/miguelsansegundo/\">miguelsansegundo</a> · <a href=\"https://profiles.wordpress.org/misulicus/\">Mihai Joldis</a> · <a href=\"https://profiles.wordpress.org/miikkamakela/\">Miikka</a> · <a href=\"https://profiles.wordpress.org/simison/\">Mikael Korpela</a> · <a href=\"https://profiles.wordpress.org/mikehend/\">Mike Henderson</a> · <a href=\"https://profiles.wordpress.org/mmcalister/\">Mike McAlister</a> · <a href=\"https://profiles.wordpress.org/mikeybinns/\">Mikey Binns</a> · <a href=\"https://profiles.wordpress.org/multidots1896/\">Minal Diwan</a> · <a href=\"https://profiles.wordpress.org/illuminea/\">Miriam Schwab</a> · <a href=\"https://profiles.wordpress.org/presents111/\">miya</a> · <a href=\"https://profiles.wordpress.org/mkismy/\">mkismy</a> · <a href=\"https://profiles.wordpress.org/mohitdadhich10/\">Mohit Dadhich</a> · <a href=\"https://profiles.wordpress.org/monzuralam/\">Monzur Alam</a> · <a href=\"https://profiles.wordpress.org/jucaduca/\">Morais Junior</a> · <a href=\"https://profiles.wordpress.org/mrwweb/\">mrwweb</a> · <a href=\"https://profiles.wordpress.org/devmuhib/\">Muhibul Haque</a> · <a href=\"https://profiles.wordpress.org/mujuonly/\">mujuonly</a> · <a href=\"https://profiles.wordpress.org/mukesh27/\">Mukesh Panchal</a> · <a href=\"https://profiles.wordpress.org/musannifzahir/\">Musannif Zahir</a> · <a href=\"https://profiles.wordpress.org/amustaque97/\">Mustaque Ahmed</a> · <a href=\"https://profiles.wordpress.org/myhro/\">myhro</a> · <a href=\"https://profiles.wordpress.org/mykolashlyakhtun/\">mykolashlyakhtun</a> · <a href=\"https://profiles.wordpress.org/nsinelnikov/\">Mykyta Synelnikov</a> · <a href=\"https://profiles.wordpress.org/assassinateur/\">Nadir Seghir</a> · <a href=\"https://profiles.wordpress.org/naeemhaque/\">Naeem Haque</a> · <a href=\"https://profiles.wordpress.org/namithjawahar/\">Namith Jawahar</a> · <a href=\"https://profiles.wordpress.org/narenin/\">Narendra Sishodiya</a> · <a href=\"https://profiles.wordpress.org/nareshbheda/\">Naresh Bheda</a> · <a href=\"https://profiles.wordpress.org/nateinaction/\">Nate Gay</a> · <a href=\"https://profiles.wordpress.org/nhrrob/\">Nazmul Hasan Robin</a> · <a href=\"https://profiles.wordpress.org/nazmul111/\">Nazmul Hosen</a> · <a href=\"https://profiles.wordpress.org/ndiego/\">Nick Diego</a> · <a href=\"https://profiles.wordpress.org/nicmare/\">nicmare</a> · <a href=\"https://profiles.wordpress.org/nico23/\">Nico</a> · <a href=\"https://profiles.wordpress.org/niktat/\">Nicolas Tatarchenko</a> · <a href=\"https://profiles.wordpress.org/nicolefurlan/\">Nicole Furlan</a> · <a href=\"https://profiles.wordpress.org/bgnicolepaschen/\">Nicole Paschen Caylor</a> · <a href=\"https://profiles.wordpress.org/nicomollet/\">nicomollet</a> · <a href=\"https://profiles.wordpress.org/nidhidhandhukiya/\">nidhidhandhukiya</a> · <a href=\"https://profiles.wordpress.org/nielslange/\">Niels Lange</a> · <a href=\"https://profiles.wordpress.org/nihar007/\">Nihar Ranjan Das</a> · <a href=\"https://profiles.wordpress.org/ntsekouras/\">Nik Tsekouras</a> · <a href=\"https://profiles.wordpress.org/nilovelez/\">Nilo Velez</a> · <a href=\"https://profiles.wordpress.org/niravsherasiya7707/\">Nirav Sherasiya</a> · <a href=\"https://profiles.wordpress.org/nithi22/\">Nithin John</a> · <a href=\"https://profiles.wordpress.org/nithins53/\">Nithin SreeRaj</a> · <a href=\"https://profiles.wordpress.org/nkeller15/\">nkeller15</a> · <a href=\"https://profiles.wordpress.org/nosilver4u/\">nosilver4u</a> · <a href=\"https://profiles.wordpress.org/obliviousharmony/\">obliviousharmony</a> · <a href=\"https://profiles.wordpress.org/ohia/\">Ohia ᚛ᚈᚐᚂᚐᚋᚆ᚜</a> · <a href=\"https://profiles.wordpress.org/okat/\">okat</a> · <a href=\"https://profiles.wordpress.org/dargus/\">Old account</a> · <a href=\"https://profiles.wordpress.org/oglekler/\">Olga Gleckler</a> · <a href=\"https://profiles.wordpress.org/domainsupport/\">Oliver Campion</a> · <a href=\"https://profiles.wordpress.org/webgarten/\">Oliver Schmid</a> · <a href=\"https://profiles.wordpress.org/olliejones/\">OllieJones</a> · <a href=\"https://profiles.wordpress.org/alshakero/\">Omar Alshaker</a> · <a href=\"https://profiles.wordpress.org/paaljoachim/\">Paal Joachim Romdahl</a> · <a href=\"https://profiles.wordpress.org/pablohoneyhoney/\">Pablo Honey</a> · <a href=\"https://profiles.wordpress.org/pls78/\">Paolo L. Scala</a> · <a href=\"https://profiles.wordpress.org/swissspidy/\">Pascal Birchler</a> · <a href=\"https://profiles.wordpress.org/patricia70/\">Patricia BT</a> · <a href=\"https://profiles.wordpress.org/pbearne/\">Paul Bearne</a> · <a href=\"https://profiles.wordpress.org/pauldewouters/\">Paul de Wouters</a> · <a href=\"https://profiles.wordpress.org/paulkevan/\">Paul Kevan</a> · <a href=\"https://profiles.wordpress.org/paulwilde/\">Paul Wilde</a> · <a href=\"https://profiles.wordpress.org/pavanpatil1/\">Pavan Patil</a> · <a href=\"https://profiles.wordpress.org/pavelevap/\">pavelevap</a> · <a href=\"https://profiles.wordpress.org/pedromendonca/\">Pedro Mendon&#231;a</a> · <a href=\"https://profiles.wordpress.org/peiche/\">peiche</a> · <a href=\"https://profiles.wordpress.org/pers/\">Per S&#248;derlind</a> · <a href=\"https://profiles.wordpress.org/perryrylance/\">perryrylance</a> · <a href=\"https://profiles.wordpress.org/provenself/\">Peter Rubin</a> · <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a> · <a href=\"https://profiles.wordpress.org/petitphp/\">petitphp</a> · <a href=\"https://profiles.wordpress.org/mr2p/\">Phi Phan</a> · <a href=\"https://profiles.wordpress.org/nekojonez/\">Pieterjan Deneys</a> · <a href=\"https://profiles.wordpress.org/wppinar/\">Pinar</a> · <a href=\"https://profiles.wordpress.org/pitamdey/\">Pitam Dey</a> · <a href=\"https://profiles.wordpress.org/pkuliga/\">pkuliga</a> · <a href=\"https://profiles.wordpress.org/pooja1210/\">Pooja N Muchandikar</a> · <a href=\"https://profiles.wordpress.org/povilasstaskus/\">Povilas Sta&#353;kus</a> · <a href=\"https://profiles.wordpress.org/praful2111/\">Praful Patel</a> · <a href=\"https://profiles.wordpress.org/pranitdugad/\">Pranit Dugad</a> · <a href=\"https://profiles.wordpress.org/prasadkarmalkar/\">Prasad Karmalkar</a> · <a href=\"https://profiles.wordpress.org/pmbaldha/\">Prashant Baldha</a> · <a href=\"https://profiles.wordpress.org/pratiklondhe/\">Pratik Londhe</a> · <a href=\"https://profiles.wordpress.org/freewebmentor/\">Prem Tiwari</a> · <a href=\"https://profiles.wordpress.org/presskopp/\">Presskopp</a> · <a href=\"https://profiles.wordpress.org/presstoke/\">presstoke</a> · <a href=\"https://profiles.wordpress.org/printsachen1/\">printsachen1</a> · <a href=\"https://profiles.wordpress.org/priyanshii5/\">Priyanshii Vijayvargiya</a> · <a href=\"https://profiles.wordpress.org/prottoysarkar/\">Prottoy Sarkar Argho</a> · <a href=\"https://profiles.wordpress.org/quietnoise/\">QuietNoise</a> · <a href=\"https://profiles.wordpress.org/rachelbaker/\">Rachel Baker</a> · <a href=\"https://profiles.wordpress.org/rafaelgalani/\">Rafael Galani</a> · <a href=\"https://profiles.wordpress.org/rafaucau/\">Rafał Całka</a> · <a href=\"https://profiles.wordpress.org/lamarajan/\">Rajan Lama</a> · <a href=\"https://profiles.wordpress.org/rajinsharwar/\">Rajin Sharwar</a> · <a href=\"https://profiles.wordpress.org/rahmohn/\">Ramon Ahnert</a> · <a href=\"https://profiles.wordpress.org/rcorrales/\">Ramon Corrales</a> · <a href=\"https://profiles.wordpress.org/ramonopoly/\">Ramon James</a> · <a href=\"https://profiles.wordpress.org/ravipatel/\">Ravikumar Patel</a> · <a href=\"https://profiles.wordpress.org/ravinderk/\">Ravinder Kumar</a> · <a href=\"https://profiles.wordpress.org/rejaulalomkhan/\">Rejaul Alom Khan</a> · <a href=\"https://profiles.wordpress.org/defries/\">Remkus de Vries</a> · <a href=\"https://profiles.wordpress.org/tabrisrp/\">Remy Perona</a> · <a href=\"https://profiles.wordpress.org/renishsurani/\">renishsurani</a> · <a href=\"https://profiles.wordpress.org/retrofox/\">retrofox</a> · <a href=\"https://profiles.wordpress.org/youknowriad/\">Riad Benguella</a> · <a href=\"https://profiles.wordpress.org/rdcoll/\">Rich Collier</a> · <a href=\"https://profiles.wordpress.org/richtabor/\">Rich Tabor</a> · <a href=\"https://profiles.wordpress.org/rockfire/\">Richard Korthuis</a> · <a href=\"https://profiles.wordpress.org/richardevs/\">richardevs</a> · <a href=\"https://profiles.wordpress.org/rcreators/\">Rishi Mehta</a> · <a href=\"https://profiles.wordpress.org/noisysocks/\">Robert Anderson</a> · <a href=\"https://profiles.wordpress.org/robertghetau/\">Robert Ghetau</a> · <a href=\"https://profiles.wordpress.org/littlerchicken/\">Robin Cornett</a> · <a href=\"https://profiles.wordpress.org/rodionov201/\">rodionov201</a> · <a href=\"https://profiles.wordpress.org/kreppar/\">Rodrigo Arias</a> · <a href=\"https://profiles.wordpress.org/rodrigosprimo/\">Rodrigo Primo</a> · <a href=\"https://profiles.wordpress.org/rogermedia/\">Roger</a> · <a href=\"https://profiles.wordpress.org/rolfsiebers/\">Rolf Siebers</a> · <a href=\"https://profiles.wordpress.org/roytanck/\">Roy Tanck</a> · <a href=\"https://profiles.wordpress.org/rmccue/\">Ryan McCue</a> · <a href=\"https://profiles.wordpress.org/ryancurban/\">Ryan Urban</a> · <a href=\"https://profiles.wordpress.org/welcher/\">Ryan Welcher</a> · <a href=\"https://profiles.wordpress.org/sebastienserre/\">S&#233;bastien SERRE</a> · <a href=\"https://profiles.wordpress.org/sergiomdgomes/\">S&#233;rgio Gomes</a> · <a href=\"https://profiles.wordpress.org/soean/\">S&#246;ren W&#252;nsch</a> · <a href=\"https://profiles.wordpress.org/s0what/\">s0what</a> · <a href=\"https://profiles.wordpress.org/sagarprajapati/\">Sagar Prajapati</a> · <a href=\"https://profiles.wordpress.org/sahilthakur02/\">sahilthakur02</a> · <a href=\"https://profiles.wordpress.org/sakibmd/\">Sakib Mohammed</a> · <a href=\"https://profiles.wordpress.org/salcode/\">Sal Ferrarello</a> · <a href=\"https://profiles.wordpress.org/xronn/\">Sam Berry</a> · <a href=\"https://profiles.wordpress.org/samanthaxmunoz/\">Sam Brockway</a> · <a href=\"https://profiles.wordpress.org/samiamnot/\">samiamnot</a> · <a href=\"https://profiles.wordpress.org/viralsampat/\">Sampat Viral</a> · <a href=\"https://profiles.wordpress.org/kim88/\">Samuel R&#252;egger</a> · <a href=\"https://profiles.wordpress.org/samuelsidler/\">Samuel Sidler</a> · <a href=\"https://profiles.wordpress.org/sannevndrmeulen/\">Sanne van der Meulen</a> · <a href=\"https://profiles.wordpress.org/mikachan/\">Sarah Norris</a> · <a href=\"https://profiles.wordpress.org/sarkarripon/\">Sarkar Ripon</a> · <a href=\"https://profiles.wordpress.org/smetzdev/\">Sascha Metz</a> · <a href=\"https://profiles.wordpress.org/sauliusv/\">Saulius Vikerta</a> · <a href=\"https://profiles.wordpress.org/saxonfletcher/\">Saxon Fletcher</a> · <a href=\"https://profiles.wordpress.org/saxonafletcher/\">Saxon Fletcher</a> · <a href=\"https://profiles.wordpress.org/scribu/\">scribu</a> · <a href=\"https://profiles.wordpress.org/script2see/\">script2see</a> · <a href=\"https://profiles.wordpress.org/sean212/\">Sean Fisher</a> · <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a> · <a href=\"https://profiles.wordpress.org/flexseth/\">Seth Miller</a> · <a href=\"https://profiles.wordpress.org/smrubenstein/\">Seth Rubenstein</a> · <a href=\"https://profiles.wordpress.org/shailu25/\">Shail Mehta</a> · <a href=\"https://profiles.wordpress.org/sh4lin/\">Shalin Shah</a> · <a href=\"https://profiles.wordpress.org/cafenoirdesign/\">Shannon Smith</a> · <a href=\"https://profiles.wordpress.org/shaunandrews/\">shaunandrews</a> · <a href=\"https://profiles.wordpress.org/sheulyshila/\">sheulyshila</a> · <a href=\"https://profiles.wordpress.org/shital-patel/\">Shital Marakana</a> · <a href=\"https://profiles.wordpress.org/shivapoudel/\">Shiva Poudel</a> · <a href=\"https://profiles.wordpress.org/shivashankerbhatta/\">Shiva Shanker Bhatta</a> · <a href=\"https://profiles.wordpress.org/shreyash3087/\">Shreyash Srivastava</a> · <a href=\"https://profiles.wordpress.org/shub07/\">Shubham Kumar Bansal</a> · <a href=\"https://profiles.wordpress.org/shuvomohajan/\">Shuvo Mohajan</a> · <a href=\"https://profiles.wordpress.org/nomnom99/\">Siddharth Thevaril</a> · <a href=\"https://profiles.wordpress.org/siliconforks/\">siliconforks</a> · <a href=\"https://profiles.wordpress.org/simo_m/\">Simone Maranzana</a> · <a href=\"https://profiles.wordpress.org/siobhyb/\">Siobhan</a> · <a href=\"https://profiles.wordpress.org/sirzooro/\">sirzooro</a> · <a href=\"https://profiles.wordpress.org/sjnbham/\">SJNBham</a> · <a href=\"https://profiles.wordpress.org/snehapatil02/\">Sneha Patil</a> · <a href=\"https://profiles.wordpress.org/spencerfinnell/\">Spencer Finnell</a> · <a href=\"https://profiles.wordpress.org/ryokuhi/\">Stefano Minoia</a> · <a href=\"https://profiles.wordpress.org/sabernhardt/\">Stephen Bernhardt</a> · <a href=\"https://profiles.wordpress.org/stephenbrook/\">Stephen Brook</a> · <a href=\"https://profiles.wordpress.org/netweb/\">Stephen Edgar</a> · <a href=\"https://profiles.wordpress.org/stephenmiracle/\">stephenmiracle</a> · <a href=\"https://profiles.wordpress.org/stevejonesdev/\">Steve Jones</a> · <a href=\"https://profiles.wordpress.org/steveblum/\">steveblum</a> · <a href=\"https://profiles.wordpress.org/strangehill/\">strangehill</a> · <a href=\"https://profiles.wordpress.org/strarsis/\">strarsis</a> · <a href=\"https://profiles.wordpress.org/sudipatel007/\">Sudip Dadhaniya</a> · <a href=\"https://profiles.wordpress.org/sumitbagthariya16/\">Sumit Bagthariya</a> · <a href=\"https://profiles.wordpress.org/sumitsingh/\">Sumit Singh</a> · <a href=\"https://profiles.wordpress.org/sunil25393/\">SunilPrajapati</a> · <a href=\"https://profiles.wordpress.org/suascat_wp/\">Suwash</a> · <a href=\"https://profiles.wordpress.org/syamraj24/\">syamraj24</a> · <a href=\"https://profiles.wordpress.org/cybr/\">Sybre Waaijer</a> · <a href=\"https://profiles.wordpress.org/smub/\">Syed Balkhi</a> · <a href=\"https://profiles.wordpress.org/tahmidulkarim/\">Tahmid ul Karim</a> · <a href=\"https://profiles.wordpress.org/iamtakashi/\">Takashi Irie</a> · <a href=\"https://profiles.wordpress.org/inc2734/\">Takashi Kitajima</a> · <a href=\"https://profiles.wordpress.org/karmatosed/\">Tammie Lister</a> · <a href=\"https://profiles.wordpress.org/taylorgorman/\">Taylor Gorman</a> · <a href=\"https://profiles.wordpress.org/edent/\">Terence Eden</a> · <a href=\"https://profiles.wordpress.org/teresagobble/\">Teresa Gobble</a> · <a href=\"https://profiles.wordpress.org/thakordarshil/\">Thakor Darshil</a> · <a href=\"https://profiles.wordpress.org/thelmachido/\">thelmachido a11n</a> · <a href=\"https://profiles.wordpress.org/thijso/\">Thijs</a> · <a href=\"https://profiles.wordpress.org/thirumani02/\">Thirumani Guhan</a> · <a href=\"https://profiles.wordpress.org/kraftner/\">Thomas Kr&#228;ftner</a> · <a href=\"https://profiles.wordpress.org/tillkruess/\">Till Kr&#252;ss</a> · <a href=\"https://profiles.wordpress.org/tb1909/\">Tim Brath&#228;rig</a> · <a href=\"https://profiles.wordpress.org/timnicholson/\">Tim Nicholson</a> · <a href=\"https://profiles.wordpress.org/tnolte/\">Tim Nolte</a> · <a href=\"https://profiles.wordpress.org/timotijhof/\">Timo Tijhof</a> · <a href=\"https://profiles.wordpress.org/timothyblynjacobs/\">Timothy Jacobs</a> · <a href=\"https://profiles.wordpress.org/tmatsuur/\">tmatsuur</a> · <a href=\"https://profiles.wordpress.org/tobiasbg/\">TobiasBg</a> · <a href=\"https://profiles.wordpress.org/tobifjellner/\">tobifjellner (Tor-Bjorn Fjellner)</a> · <a href=\"https://profiles.wordpress.org/tomjcafferkey/\">Tom Cafferkey</a> · <a href=\"https://profiles.wordpress.org/tomalec/\">Tomek</a> · <a href=\"https://profiles.wordpress.org/tomepajk/\">tomepajk</a> · <a href=\"https://profiles.wordpress.org/shimotomoki/\">Tomoki Shimomura</a> · <a href=\"https://profiles.wordpress.org/tomxygen/\">tomxygen</a> · <a href=\"https://profiles.wordpress.org/skithund/\">Toni Viemer&#246;</a> · <a href=\"https://profiles.wordpress.org/starbuck/\">Tony G</a> · <a href=\"https://profiles.wordpress.org/hellofromtonya/\">Tonya Mork</a> · <a href=\"https://profiles.wordpress.org/toro_unit/\">Toro_Unit (Hiroshi Urabe)</a> · <a href=\"https://profiles.wordpress.org/zodiac1978/\">Torsten Landsiedel</a> · <a href=\"https://profiles.wordpress.org/truptikanzariya/\">Trupti Kanzariya</a> · <a href=\"https://profiles.wordpress.org/tunetheweb/\">tunetheweb</a> · <a href=\"https://profiles.wordpress.org/twstokes/\">twstokes</a> · <a href=\"https://profiles.wordpress.org/tybor/\">tybor</a> · <a href=\"https://profiles.wordpress.org/ugyensupport/\">Ugyen Dorji</a> · <a href=\"https://profiles.wordpress.org/umesh84/\">Umesh Gupta</a> · <a href=\"https://profiles.wordpress.org/up1512001/\">up1512001</a> · <a href=\"https://profiles.wordpress.org/vcanales/\">Vicente Canales</a> · <a href=\"https://profiles.wordpress.org/szepeviktor/\">Viktor Sz&#233;pe</a> · <a href=\"https://profiles.wordpress.org/vineet2003/\">Vinit</a> · <a href=\"https://profiles.wordpress.org/vinita29/\">Vinita Tandulkar</a> · <a href=\"https://profiles.wordpress.org/vipulgupta003/\">Vipul Gupta</a> · <a href=\"https://profiles.wordpress.org/ashokrane/\">Vishal Kothari</a> · <a href=\"https://profiles.wordpress.org/vivekawsm/\">vivekawsm</a> · <a href=\"https://profiles.wordpress.org/webmandesign/\">WebMan Design &#124; Oliver Juhas</a> · <a href=\"https://profiles.wordpress.org/websitegenii/\">websitegenii</a> · <a href=\"https://profiles.wordpress.org/wesatintellitonic/\">wesatintellitonic</a> · <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a> · <a href=\"https://profiles.wordpress.org/whaze/\">whaze</a> · <a href=\"https://profiles.wordpress.org/skorasaurus/\">Will Skora</a> · <a href=\"https://profiles.wordpress.org/earnjam/\">William Earnhardt</a> · <a href=\"https://profiles.wordpress.org/nestea29950/\">WilliamG</a> · <a href=\"https://profiles.wordpress.org/wojtekn/\">Wojtek Naruniec</a> · <a href=\"https://profiles.wordpress.org/yagniksangani/\">Yagnik Sangani</a> · <a href=\"https://profiles.wordpress.org/yankiara/\">yankiara</a> · <a href=\"https://profiles.wordpress.org/collet/\">Yann</a> · <a href=\"https://profiles.wordpress.org/yguyon/\">Yannis Guyon</a> · <a href=\"https://profiles.wordpress.org/fierevere/\">Yui</a> · <a href=\"https://profiles.wordpress.org/yukinobu/\">Yukinobu Asakawa</a> · <a href=\"https://profiles.wordpress.org/yuvrajsinh2211/\">Yuvrajsinh Sisodiya</a> · <a href=\"https://profiles.wordpress.org/zackkrida/\">Zack Krida</a> · <a href=\"https://profiles.wordpress.org/zafarkamal/\">Zafar Kamal</a> · <a href=\"https://profiles.wordpress.org/zieladam/\">zieladam</a> · <a href=\"https://profiles.wordpress.org/zkarj/\">zkarj</a> · <a href=\"https://profiles.wordpress.org/zunaid321/\">Zunaid Amin</a></p>\n\n\n\n<p>Mais de 60 localidades traduziram 90% ou mais do WordPress 6.6 para seu idioma. Os tradutores da comunidade estão trabalhando duro para garantir que mais traduções estejam a caminho. Agradecemos a todos que ajudam a disponibilizar o WordPress em 200 idiomas.</p>\n\n\n\n<p>Por último, mas não menos importante, agradecemos aos voluntários que contribuem com os fóruns de suporte respondendo a perguntas de usuários do WordPress em todo o mundo.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Envolva-se</h2>\n\n\n\n<p>A participação no WordPress vai muito além da codificação, e aprender mais e se envolver é fácil. Descubra as equipes que se reúnem para <a href=\"https://make.wordpress.org/\">fazer o WordPress</a> e use <a href=\"https://make.wordpress.org/contribute/\">esta ferramenta interativa</a> para ajudá-lo a decidir qual é o certo para você.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3088\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"WordPress 6.6 Release Candidate 3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:70:\"https://br.wordpress.org/2024/07/10/wordpress-6-6-release-candidate-3/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 10 Jul 2024 20:31:58 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3086\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:334:\"O terceiro release candidate (RC3) para WordPress 6.6 está pronto para baixar e testar! Esta versão do software WordPress está em desenvolvimento. Por favor, não instale, execute ou teste esta versão do WordPress em sites de produção ou de missão crítica. Em vez disso, avalie o RC3 em um servidor de teste ou em um [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:9428:\"\n<p>O terceiro release candidate (RC3) para WordPress 6.6 está pronto para baixar e testar!</p>\n\n\n\n<p><strong>Esta versão do software WordPress está em desenvolvimento</strong>. <strong>Por favor, não instale, execute ou teste esta versão do WordPress em sites de produção ou de missão crítica.</strong> Em vez disso, avalie o RC3 em um servidor de teste ou em um ambiente local.</p>\n\n\n\n<p>Alcançar esta fase do ciclo de lançamento é um marco importante. Embora os release candidate sejam considerados prontos para lançamento, os testes continuam vitais para garantir que tudo no WordPress 6.6 seja o melhor possível.</p>\n\n\n\n<p>Você pode testar o WordPress 6.6 RC3 de quatro maneiras:</p>\n\n\n\n<figure class=\"wp-block-table\"><table class=\"has-fixed-layout\"><tbody><tr><th>Plugin</th><td>Instale e ative o plugin <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> em uma instalação do WordPress. (Selecione o canal “Bleeding edge” e o fluxo “Beta/RC Only”).</td></tr><tr><th>Baixe diretamente</th><td>Baixe a <a href=\"https://wordpress.org/wordpress-6.6-RC3.zip\">versão RC3 (zip)</a> e instale em um site WordPress.</td></tr><tr><th>Linha de comando</th><td>Use este comando <a href=\"https://make.wordpress.org/cli/\">WP-CLI:</a><br><code>wp core update --version=6.6-RC3</code></td></tr><tr><th>WordPress Playground</th><td>Use uma <a href=\"https://playground.wordpress.net/#%7B%20%22preferredVersions%22:%20%7B%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20%7D,%20%22features%22:%20%7B%20%22networking%22:%20true%20%7D,%20%22steps%22:%20[%20%7B%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20%7D,%20%22options%22:%20%7B%20%22activate%22:%20false%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D%20]%20%7D\">instância 6.6 RC3 no WordPress Playground</a> (disponível dentro de 35 minutos após o lançamento estar pronto) para testar o software diretamente no seu navegador sem a necessidade de um site ou configuração separada.</td></tr></tbody></table></figure>\n\n\n\n<p>A meta atual para o lançamento do WordPress 6.6 é <strong>16 de julho de 2024</strong>. Obtenha uma visão geral do <a href=\"https://make.wordpress.org/core/6-6/\">ciclo de lançamento da versão 6.6</a> e confira o <a href=\"https://make.wordpress.org/core/\">blog Make WordPress Core</a> para <a href=\"https://make.wordpress.org/core/tag/6-6/\">posts relacionados a versão 6.6</a> na próxima semana para obter mais detalhes.</p>\n\n\n\n<h2 class=\"wp-block-heading\">O que há no WordPress 6.6 RC3?</h2>\n\n\n\n<p>Graças aos seus testes e a muitos outros colaboradores até agora, esta versão inclui oito correções de erros para o editor e <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=06%2F25%2F2024..07%2F01%2F2024&amp;milestone=6.6&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">18 tíquetes para o núcleo do WordPress</a>.</p>\n\n\n\n<p>Obtenha uma recapitulação dos recursos destacados do WordPress 6.6 no <a href=\"https://br.wordpress.org/2024/06/05/wordpress-6-6-beta-1/\">anúncio da versão Beta 1.</a> Para obter mais informações técnicas relacionadas a problemas resolvidos desde a versão RC2, você pode navegar pelos seguintes links:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/wp/6.6?since=2024-07-02&amp;until=2024-07-09\">Tíquetes do GitHub para a versão 6.6</a> desde 2 de julho</li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=06%2F25%2F2024..07%2F01%2F2024&amp;milestone=6.6&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">Tíquetes fechados do Trac</a> desde 2 de julho</li>\n</ul>\n\n\n\n<p>Quer olhar mais profundamente para os detalhes e notas técnicas para esta versão? Você pode querer fazer sua primeira parada <a href=\"https://make.wordpress.org/core/2024/06/25/wordpress-6-6-field-guide/\">O Guia de Campo do WordPress 6.6</a>. Então, confira esta lista:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li><a href=\"https://make.wordpress.org/core/2024/06/20/roster-of-design-tools-per-block-wordpress-6-6-edition/\">Listagem de ferramentas de design por bloco (edição WordPress 6.6)</a>.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/tag/dev-notes+6-6/\">Todas as notas para desenvolvedor relacionadas a versão 6.6</a>.</li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">Como contribuir?</h2>\n\n\n\n<p>O WordPress é um software de código aberto possibilitado pela comunidade de pessoas que colaboram e contribuem para o seu desenvolvimento. Os recursos abaixo descrevem uma variedade de maneiras pelas quais você pode ajudar, independentemente de sua experiência técnica.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Envolva-se nos testes</h3>\n\n\n\n<p>Testar problemas é fundamental para garantir que o WordPress seja performante e estável. Também é uma maneira significativa de qualquer pessoa contribuir. <a href=\"https://make.wordpress.org/test/2024/06/03/help-test-wordpress-6-6/\">Este guia detalhado</a> irá orientá-lo através de recursos de teste no WordPress 6.6. Para aqueles que estão começando a testar, sigam <a href=\"https://make.wordpress.org/test/2024/06/03/help-test-wordpress-6-6/\">este guia de testes geral</a> para obter mais detalhes sobre como começar.</p>\n\n\n\n<p>Se você encontrar um problema, informe-o na <a href=\"https://wordpress.org/support/forum/alphabeta/\">área Alpha / Beta</a> dos fóruns de suporte ou diretamente ao <a href=\"https://core.trac.wordpress.org/newticket\">WordPress Trac</a> se você estiver confortável escrevendo um relatório de erros reprodutível. Você também pode verificar seu problema em relação a uma lista de <a href=\"https://core.trac.wordpress.org/tickets/major\">erros conhecidos</a>.</p>\n\n\n\n<p>Curioso sobre os testes de lançamentos em geral? Acompanhe as <a href=\"https://make.wordpress.org/test/\">iniciativas de teste</a> no <a href=\"https://make.wordpress.org/test/\">Make WordPress Core</a> e junte-se ao <a href=\"https://wordpress.slack.com/messages/core-test/\">canal #core-test</a> no <a href=\"https://wordpress.slack.com/\">Slack do WordPress</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Atualize seu tema ou plugin</h3>\n\n\n\n<p>Para autores de plugins e temas, seus produtos desempenham um papel fundamental na extensão da funcionalidade e valor do WordPress para todos os usuários.</p>\n\n\n\n<p>Agradecemos por continuar a testar seus temas e plugins com as versões beta do WordPress 6.6. Com o RC3, você vai querer concluir seus testes e atualizar a versão <em>“Tested up to”</em> no <a href=\"https://developer.wordpress.org/plugins/wordpress-org/how-your-readme-txt-works/\">arquivo readme</a> do seu <a href=\"https://developer.wordpress.org/plugins/wordpress-org/how-your-readme-txt-works/\">plugin</a> para a versão 6.6.</p>\n\n\n\n<p>Se você encontrar problemas de compatibilidade, publique informações detalhadas no <a href=\"https://wordpress.org/support/forum/alphabeta/\">fórum de suporte</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Traduza o WordPress</h2>\n\n\n\n<p><a href=\"https://translate.wordpress.org/projects/wp/dev/pt-br/default/\">Ajude-nos a traduzir o WordPress para o português!</a>&nbsp;O lançamento dessa versão também significa que&nbsp;<a href=\"https://make.wordpress.org/polyglots/handbook/glossary/#hard-freeze\">novas strings para a tradução</a>&nbsp;da versão 6.6 serão evitadas.</p>\n\n\n\n<p class=\"has-text-align-right\"><em>Agradecemos a <a href=\"https://profiles.wordpress.org/meher/\">@meher</a> e <a href=\"https://profiles.wordpress.org/audrasjb/\">@audrasjb</a> pela revisão.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3086\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"WordPress 6.6 Release Candidate 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:70:\"https://br.wordpress.org/2024/07/03/wordpress-6-6-release-candidate-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 03 Jul 2024 12:02:14 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3081\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:333:\"O segundo release candidate (RC2) para WordPress 6.6 está pronto para baixar e testar! Esta versão do software WordPress está em desenvolvimento. Por favor, não instale, execute ou teste esta versão do WordPress em sites de produção ou de missão crítica. Em vez disso, avalie o RC2 em um servidor de teste ou em um [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:10977:\"\n<p>O segundo release candidate (RC2) para WordPress 6.6 está pronto para baixar e testar!</p>\n\n\n\n<p><strong>Esta versão do software WordPress está em desenvolvimento</strong>. <strong>Por favor, não instale, execute ou teste esta versão do WordPress em sites de produção ou de missão crítica.</strong> Em vez disso, avalie o RC2 em um servidor de teste ou em um ambiente local.</p>\n\n\n\n<p>Alcançar esta fase do ciclo de lançamento é um marco importante. Embora os release candidate sejam considerados prontos para lançamento, os testes continuam vitais para garantir que tudo no WordPress 6.6 seja o melhor possível.</p>\n\n\n\n<p>Você pode testar o WordPress 6.6 RC2 de quatro maneiras:</p>\n\n\n\n<figure class=\"wp-block-table\"><table class=\"has-fixed-layout\"><tbody><tr><th>Plugin</th><td>Instale e ative o plugin <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> em uma instalação do WordPress. (Selecione o canal “Bleeding edge” e o fluxo “Beta/RC Only”).</td></tr><tr><th>Baixe diretamente</th><td>Baixe a <a href=\"https://wordpress.org/wordpress-6.6-RC2.zip\">versão RC2 (zip)</a> e instale em um site WordPress.</td></tr><tr><th>Linha de comando</th><td>Use este comando <a href=\"https://make.wordpress.org/cli/\">WP-CLI:</a><br><code>wp core update --version=6.6-RC2</code></td></tr><tr><th>WordPress Playground</th><td>Use uma <a href=\"https://playground.wordpress.net/#%7B%20%22preferredVersions%22:%20%7B%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20%7D,%20%22features%22:%20%7B%20%22networking%22:%20true%20%7D,%20%22steps%22:%20[%20%7B%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20%7D,%20%22options%22:%20%7B%20%22activate%22:%20false%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D%20]%20%7D\">instância 6.6 RC2 no WordPress Playground</a> (disponível dentro de 35 minutos após o lançamento estar pronto) para testar o software diretamente no seu navegador sem a necessidade de um site ou configuração separada.</td></tr></tbody></table></figure>\n\n\n\n<p>A meta atual para o lançamento do WordPress 6.6 é <strong>16 de julho de 2024</strong>. Obtenha uma visão geral do <a href=\"https://make.wordpress.org/core/6-6/\">ciclo de lançamento da versão 6.6</a> e confira o <a href=\"https://make.wordpress.org/core/\">blog Make WordPress Core</a> para <a href=\"https://make.wordpress.org/core/tag/6-6/\">posts relacionados a versão 6.6</a> nas próximas semanas para obter mais detalhes.</p>\n\n\n\n<h2 class=\"wp-block-heading\">O que há no WordPress 6.6 RC2?</h2>\n\n\n\n<p>Graças aos seus testes e a muitos outros colaboradores até agora, esta versão inclui mais de 19 correções de erros para o editor e mais de <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=06%2F25%2F2024..07%2F01%2F2024&amp;milestone=6.6&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">20 tíquetes para o núcleo do WordPress</a>.</p>\n\n\n\n<p>Obtenha uma recapitulação dos recursos destacados do WordPress 6.6 no <a href=\"https://br.wordpress.org/2024/06/05/wordpress-6-6-beta-1/\">anúncio da versão Beta 1.</a> Para obter mais informações técnicas relacionadas a problemas resolvidos desde a versão Beta 3, você pode navegar pelos seguintes links:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/wp/6.6?since=2024-06-24&amp;until=2024-06-30\">Tíquetes do GitHub para a versão 6.6</a> desde 25 de junho.</li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=06%2F25%2F2024..07%2F01%2F2024&amp;milestone=6.6&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">Tíquetes fechados do Trac</a> desde 25 de junho.</li>\n</ul>\n\n\n\n<p>Quer olhar mais profundamente para os detalhes e notas técnicas para esta versão? Você pode começar conferindo o <a href=\"https://make.wordpress.org/core/2024/06/25/wordpress-6-6-field-guide/\">O Guia de Campo do WordPress 6.6</a>. Então, confira esta lista:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li><a href=\"https://make.wordpress.org/core/2024/06/20/roster-of-design-tools-per-block-wordpress-6-6-edition/\">Listagem de ferramentas de design por bloco (edição WordPress 6.6)</a>.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/07/01/hallway-hangout-section-styles-and-other-block-style-variation-updates/\">Videoconferência: estilos de seção e outras atualizações de variação de estilo de bloco</a>.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/07/01/recap-hallway-hangout-exploring-grid-layouts/\">Recapitulação da Videoconferência: Explorando Layouts de Grade</a>.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/06/28/editing-custom-fields-from-connected-blocks/\">Editando campos personalizados de blocos conectados</a>.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/06/28/updates-to-the-interactivity-api-in-6-6/\">Atualizações para a API de Interatividade na versão 6.6</a>.</li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/tag/dev-notes+6-6/\">Todas as notas para desenvolvedor relacionadas a versão 6.6</a>.</li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">Como contribuir?</h2>\n\n\n\n<p>O WordPress é um software de código aberto possibilitado pela comunidade de pessoas que colaboram e contribuem para o seu desenvolvimento. Os recursos abaixo descrevem uma variedade de maneiras pelas quais você pode ajudar, independentemente de sua experiência técnica.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Envolva-se nos testes</h3>\n\n\n\n<p>Testar problemas é fundamental para garantir que o WordPress seja performante e estável. Também é uma maneira significativa de qualquer pessoa contribuir. <a href=\"https://make.wordpress.org/test/2024/06/03/help-test-wordpress-6-6/\">Este guia detalhado</a> irá orientá-lo através de recursos de teste no WordPress 6.6. Para aqueles que estão começando a testar, sigam <a href=\"https://make.wordpress.org/test/2024/06/03/help-test-wordpress-6-6/\">este guia de testes geral</a> para obter mais detalhes sobre como começar.</p>\n\n\n\n<p>Se você encontrar um problema, informe-o na <a href=\"https://wordpress.org/support/forum/alphabeta/\">área Alpha / Beta</a> dos fóruns de suporte ou diretamente ao <a href=\"https://core.trac.wordpress.org/newticket\">WordPress Trac</a> se você estiver confortável escrevendo um relatório de erros reprodutível. Você também pode verificar seu problema em relação a uma lista de <a href=\"https://core.trac.wordpress.org/tickets/major\">erros conhecidos</a>.</p>\n\n\n\n<p>Curioso sobre os testes de lançamentos em geral? Acompanhe as <a href=\"https://make.wordpress.org/test/\">iniciativas de teste</a> no <a href=\"https://make.wordpress.org/test/\">Make WordPress Core</a> e junte-se ao <a href=\"https://wordpress.slack.com/messages/core-test/\">canal #core-test</a> no <a href=\"https://wordpress.slack.com/\">Slack do WordPress</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">A recompensa de vulnerabilidade dobra durante as versões Beta/RC</h3>\n\n\n\n<p>Durante a fase de lançamento do WordPress 6.6, a <a href=\"https://make.wordpress.org/security/2024/06/04/wordpress-6-6-is-coming/\">recompensa monetária por relatar novas vulnerabilidades de segurança não lançadas é dobrada</a>. Siga as práticas de divulgação responsável, conforme detalhado nas práticas e políticas de segurança do projeto descritas na <a href=\"https://hackerone.com/wordpress\">página do HackerOne</a> e no <a href=\"https://wordpress.org/about/security/\">white paper de segurança</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Atualize seu tema ou plugin</h3>\n\n\n\n<p>Para autores de plugins e temas, seus produtos desempenham um papel fundamental na extensão da funcionalidade e valor do WordPress para todos os usuários.</p>\n\n\n\n<p>Agradecemos por continuar a testar seus temas e plugins com as versões beta do WordPress 6.6. Com o RC2, você vai querer concluir seus testes e atualizar a versão <em>“Tested up to”</em> no <a href=\"https://developer.wordpress.org/plugins/wordpress-org/how-your-readme-txt-works/\">arquivo readme</a> do seu <a href=\"https://developer.wordpress.org/plugins/wordpress-org/how-your-readme-txt-works/\">plugin</a> para a versão 6.6.</p>\n\n\n\n<p>Se você encontrar problemas de compatibilidade, publique informações detalhadas no <a href=\"https://wordpress.org/support/forum/alphabeta/\">fórum de suporte</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Traduza o WordPress</h2>\n\n\n\n<p><a href=\"https://translate.wordpress.org/projects/wp/dev/pt-br/default/\">Ajude-nos a traduzir o WordPress para o português!</a>&nbsp;O lançamento dessa versão também significa que&nbsp;<a href=\"https://make.wordpress.org/polyglots/handbook/glossary/#hard-freeze\">novas strings para a tradução</a>&nbsp;da versão 6.6 serão evitadas.</p>\n\n\n\n<p class=\"has-text-align-right\"><em>Agradecemos a <a href=\"https://profiles.wordpress.org/juanmaguitar/\">@juanmaguitar</a>, <a href=\"https://profiles.wordpress.org/meher/\">@meher</a>, <a href=\"https://profiles.wordpress.org/desrosj/\">@desrosj</a></em> e<em> <a href=\"https://profiles.wordpress.org/atachibana/\">@atachibana</a> pela revisão.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3081\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"WordPress 6.6 Release Candidate 1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:70:\"https://br.wordpress.org/2024/06/25/wordpress-6-6-release-candidate-1/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 25 Jun 2024 17:56:24 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3072\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:334:\"O primeiro release candidate (RC1) para WordPress 6.6 está pronto para baixar e testar! Esta versão do software WordPress está em desenvolvimento. Por favor, não instale, execute ou teste esta versão do WordPress em sites de produção ou de missão crítica. Em vez disso, avalie o RC1 em um servidor de teste ou em um [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:13450:\"\n<p>O primeiro release candidate (RC1) para WordPress 6.6 está pronto para baixar e testar!</p>\n\n\n\n<p><strong>Esta versão do software WordPress está em desenvolvimento</strong>. <strong>Por favor, não instale, execute ou teste esta versão do WordPress em sites de produção ou de missão crítica.</strong> Em vez disso, avalie o RC1 em um servidor de teste ou em um ambiente local.</p>\n\n\n\n<p>Alcançar esta fase do ciclo de lançamento é um marco importante. Embora os release candidates sejam considerados prontos para lançamento, os testes continuam vitais para garantir que tudo no WordPress 6.6 seja o melhor possível.</p>\n\n\n\n<p>Você pode testar o WordPress 6.6 RC1 de quatro maneiras:</p>\n\n\n\n<figure class=\"wp-block-table\"><table class=\"has-fixed-layout\"><tbody><tr><th>Plugin</th><td>Instale e ative o plugin <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> em uma instalação do WordPress. (Selecione o canal “Bleeding edge” e o fluxo “Beta/RC Only”).</td></tr><tr><th>Baixar diretamente</th><td>Baixe a <a href=\"https://wordpress.org/wordpress-6.6-RC1.zip\">versão RC1 (zip)</a> e instale-a em um site WordPress.</td></tr><tr><th>Linha de comando</th><td>Use este comando <a href=\"https://make.wordpress.org/cli/\">WP-CLI:</a><br><code>wp core update --version=6.6-RC1</code></td></tr><tr><th>WordPress Playground</th><td>Use a <a href=\"https://playground.wordpress.net/#%7B%20%22preferredVersions%22:%20%7B%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20%7D,%20%22features%22:%20%7B%20%22networking%22:%20true%20%7D,%20%22steps%22:%20[%20%7B%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20%7D,%20%22options%22:%20%7B%20%22activate%22:%20false%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D%20]%20%7D\">instância</a> <a href=\"https://playground.wordpress.net/#%7B%20%22preferredVersions%22:%20%7B%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20%7D,%20%22features%22:%20%7B%20%22networking%22:%20true%20%7D,%20%22steps%22:%20[%20%7B%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22importFile%22,%20%22file%22:%20%7B%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20%7D,%20%22options%22:%20%7B%20%22activate%22:%20false%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D,%20%7B%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20%7B%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20%7D,%20%22progress%22:%20%7B%20%22weight%22:%202%20%7D%20%7D%20]%20%7D\">6.6 RC1 do WordPress Playground</a> (disponível dentro de 35 minutos após o lançamento estar pronto) para testar o software diretamente no seu navegador sem a necessidade de um site ou configuração separada.</td></tr></tbody></table></figure>\n\n\n\n<p>A meta atual para a versão final do WordPress 6.6 é <strong>16 de julho de 2024</strong>. Obtenha uma visão geral do <a href=\"https://make.wordpress.org/core/6-6/\">ciclo de lançamento da versão 6.6</a> e confira o <a href=\"https://make.wordpress.org/core/\">blog Make WordPress Core</a> para <a href=\"https://make.wordpress.org/core/tag/6-6/\">posts relacionados a versão 6.6 </a> nas próximas semanas para obter mais detalhes.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Duas notas sobre as mudanças no período RC</h2>\n\n\n\n<p><strong>Congelamento de strings para traduções:</strong> de agora até 16 de julho, há um <a href=\"https://make.wordpress.org/polyglots/handbook/glossary/#hard-freeze\">congelamento de strings</a>. Nenhuma string pode mudar e nenhuma nova cadeia pode ser confirmada. Isso é para dar as equipes de tradução um tempo para traduzir o WordPress 6.6 em tantos idiomas quanto possível antes do lançamento final.</p>\n\n\n\n<p><strong>Revisão de 2 contribuidores:</strong> Contribuições de código no período das versões RC requerem revisão de dois colaboradores em cada submissão. Como as versões RCs devem estar prontos para publicação, apenas as principais correções devem ser adicionadas ao núcleo.</p>\n\n\n\n<h2 class=\"wp-block-heading\">O que há no WordPress 6.6 RC1?</h2>\n\n\n\n<p>Graças aos seus testes e muitos outros colaboradores até agora, esta versão inclui mais de 40 correções de erros para o editor e mais de <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=02%2F27%2F2024..03%2F05%2F2024&amp;milestone=6.5&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">40 tíquetes para o núcleo do WordPress</a>.</p>\n\n\n\n<p>Obtenha uma recapitulação dos recursos destacados do WordPress 6.6 no <a href=\"https://br.wordpress.org/2024/06/19/wordpress-6-6-beta-3/\">anúncio da versão Beta 1.</a> Para obter mais informações técnicas relacionadas a problemas resolvidos desde a versão Beta 3, você pode navegar pelos seguintes links:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/wp/6.6?since=2024-06-18&amp;until=2024-06-24\">Tíquetes do GitHub para a versão 6.6</a> desde 18 de junho.</li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=06%2F18%2F24..06%2F24%2F2024&amp;milestone=6.6&amp;max=1000&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">Tíquetes fechados do Trac</a> desde 18 de junho.</li>\n</ul>\n\n\n\n<p>Quer olhar mais profundamente para os detalhes e notas técnicas para esta versão? Estes posts recentes cobrem algumas das atualizações mais recentes:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li><a href=\"https://make.wordpress.org/core/2024/06/21/wordpress-6-6-css-specificity/\">Especificidade de CSS no WordPress 6.6</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/06/20/site-wide-background-images-in-wordpress-6-6/\">Imagens de fundo em todo o site no WordPress 6.6</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/06/24/section-styles/\">Estilos de Seção</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/06/20/roster-of-design-tools-per-block-wordpress-6-6-edition/\">Ferramentas de design por bloco no WordPress 6.6</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/2024/06/25/wordpress-6-6-field-guide/\">Guia do WordPress 6.6</a></li>\n\n\n\n<li><a href=\"https://make.wordpress.org/core/tag/dev-notes-6-6/\">Todas as notas de desenvolvedor relacionadas a versão 6.6</a></li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">Como contribuir?</h2>\n\n\n\n<p>O WordPress é um software de código aberto possibilitado pela comunidade de pessoas que colaboram e contribuem para o seu desenvolvimento. Os recursos abaixo descrevem uma variedade de maneiras pelas quais você pode ajudar, independentemente de sua experiência técnica.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Envolva-se nos testes</h3>\n\n\n\n<p>Testar problemas é fundamental para garantir que o WordPress seja performante e estável. Também é uma maneira significativa de qualquer pessoa contribuir. <a href=\"https://wordpress.org/news/2024/06/wordpress-6-6-beta-3/\">Este guia detalhado</a> irá orientá-lo através de recursos de teste no WordPress 6.6. Para aqueles que estão começando a testar, sigam <a href=\"https://wordpress.org/news/2024/06/wordpress-6-6-beta-1/\">este guia de testes geral</a> para obter mais detalhes sobre como começar.</p>\n\n\n\n<p>Se você encontrar um problema, informe-o na <a href=\"https://wordpress.org/support/forum/alphabeta/\">área Alpha / Beta</a> dos fóruns de suporte ou diretamente ao <a href=\"https://core.trac.wordpress.org/newticket\">WordPress Trac</a> se você estiver confortável escrevendo um relatório de erros reprodutível. Você também pode verificar seu problema em relação a uma lista de <a href=\"https://core.trac.wordpress.org/tickets/major\">erros conhecidos</a>.</p>\n\n\n\n<p>Curioso sobre os testes de lançamentos em geral? Acompanhe as <a href=\"https://make.wordpress.org/test/\">iniciativas de teste</a> no <a href=\"https://make.wordpress.org/test/\">Make WordPress Core</a> e junte-se ao <a href=\"https://wordpress.slack.com/messages/core-test/\">canal #core-test</a> no <a href=\"https://wordpress.slack.com/\">Slack do WordPress</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">A recompensa de vulnerabilidade dobra durante as versões Beta/RC</h3>\n\n\n\n<p>Durante a fase de lançamento do WordPress 6.6, a <a href=\"https://make.wordpress.org/security/2024/06/04/wordpress-6-6-is-coming/\">recompensa monetária por relatar novas vulnerabilidades de segurança não lançadas é dobrada</a>. Siga as práticas de divulgação responsável, conforme detalhado nas práticas e políticas de segurança do projeto descritas na <a href=\"https://hackerone.com/wordpress\">página do HackerOne</a> e no <a href=\"https://wordpress.org/about/security/\">white paper de segurança</a>.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Atualize seu tema ou plugin</h3>\n\n\n\n<p>Para autores de plugins e temas, seus produtos desempenham um papel fundamental na extensão da funcionalidade e valor do WordPress para todos os usuários.</p>\n\n\n\n<p>Agradecemos por continuar a testar seus temas e plugins com as versões beta do WordPress 6.6. Com o RC1, você vai querer concluir seus testes e atualizar a versão <em>“Tested up to”</em> no <a href=\"https://developer.wordpress.org/plugins/wordpress-org/how-your-readme-txt-works/\">arquivo readme</a> do seu <a href=\"https://developer.wordpress.org/plugins/wordpress-org/how-your-readme-txt-works/\">plugin</a> para a versão 6.6.</p>\n\n\n\n<p>Se você encontrar problemas de compatibilidade, publique informações detalhadas no <a href=\"https://wordpress.org/support/forum/alphabeta/\">fórum de suporte</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Traduza o WordPress</h2>\n\n\n\n<p><a href=\"https://translate.wordpress.org/projects/wp/dev/pt-br/default/\">Ajude-nos a traduzir o WordPress para o português!</a>&nbsp;O lançamento dessa versão também significa que&nbsp;<a href=\"https://make.wordpress.org/polyglots/handbook/glossary/#hard-freeze\">novas strings para a tradução</a>&nbsp;da versão 6.6 serão evitadas.</p>\n\n\n\n<p class=\"has-text-align-right\"><em>Agradecemos a <a href=\"https://profiles.wordpress.org/meher/\">@meher</a>, <a href=\"https://profiles.wordpress.org/audrasjb/\">@audrasjb</a> por colaborar com este post.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3072\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:47:\"WordPress 6.5.5 – Atualização de segurança\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://br.wordpress.org/2024/06/25/wordpress-6-5-5-atualizacao-de-seguranca/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 25 Jun 2024 12:16:51 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3069\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:390:\"O WordPress 6.5.5 já está disponível! Esta versão apresenta três correções de segurança. Como esta é uma versão de segurança, é recomendável que você atualize seus sites imediatamente. Esta versão também inclui 3 correções de erros no núcleo. Você pode baixar o WordPress 6.5.5 no WordPress.org ou visitar seu Painel WordPress, clicar em “Atualizações” e [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:5369:\"\n<p>O WordPress 6.5.5 já está disponível!</p>\n\n\n\n<p>Esta versão apresenta três correções de segurança. Como esta é uma versão de segurança, <strong>é recomendável que você atualize seus sites imediatamente. </strong>Esta versão também inclui <a href=\"https://core.trac.wordpress.org/query?component=!Build%2FTest+Tools&amp;milestone=6.5.5&amp;col=id&amp;col=summary&amp;col=owner&amp;col=type&amp;col=status&amp;col=priority&amp;col=component&amp;order=priority\">3 correções de erros</a> no núcleo.</p>\n\n\n\n<p>Você pode <a href=\"https://wordpress.org/wordpress-6.5.5.zip\">baixar o WordPress 6.5.5 no WordPress.org</a> ou visitar seu Painel WordPress, clicar em “Atualizações” e clicar em “Atualizar agora”. Se você tiver sites que suportam atualizações automáticas em segundo plano, o processo de atualização será iniciado automaticamente.</p>\n\n\n\n<p>O WordPress 6.5.5 é uma versão de ciclo curto. O próximo grande lançamento será a versão 6.6, que está prevista para 16 de julho de 2024.</p>\n\n\n\n<p>Para mais informações sobre o WordPress 6.5.5, visite o <a href=\"https://wordpress.org/documentation/wordpress-version/version-6-5-5/\">site HelpHub</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Atualizações de segurança incluídas nesta versão</h2>\n\n\n\n<p>A equipe de segurança gostaria de agradecer às seguintes pessoas por <a href=\"https://hackerone.com/wordpress?type=team\">relatar vulnerabilidades de forma responsável</a> e permitir que elas sejam corrigidas nesta versão:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li>Uma vulnerabilidade de cross-site scripting (XSS) que afeta a API HTML relatada por Dennis Snell do time de núcleo do WordPress, juntamente com Alex Concha e Grzegorz (Greg) Ziókowski da equipe de segurança do WordPress.</li>\n\n\n\n<li>Uma vulnerabilidade de scripts entre sites (XSS) que afeta o bloco de partes de temas reportado independentemente por Rafie Muhammad da Patchstack e durante uma auditoria de segurança de terceiros.</li>\n\n\n\n<li>Um problema de encaminhamento que afeta sites hospedados no Windows relatados de forma independente por Rafie M &amp; Edouard L de Patchstack, David Fifield, <a href=\"https://hackerone.com/x89\">x89</a>, <a href=\"https://hackerone.com/apple502j\">apple502j</a> e <a href=\"https://hackerone.com/mishre\">mishre</a>.</li>\n</ul>\n\n\n\n<h2 class=\"wp-block-heading\">Agradecimento aos colaboradores</h2>\n\n\n\n<p>Este lançamento foi liderado por <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>.</p>\n\n\n\n<p>O WordPress 6.5.5 não teria sido possível sem as contribuições das pessoas a seguir. Suas contribuições para fornecer correções de manutenção em uma versão estável é uma prova do poder e capacidade da comunidade WordPress.</p>\n\n\n\n<p><a href=\"https://profiles.wordpress.org/jorbin\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/xknown\">Alex Concha</a>, <a href=\"https://profiles.wordpress.org/azaozz\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/bernhard-reiter\">bernhard-reiter</a>, <a href=\"https://profiles.wordpress.org/costdev\">Colin Stewart</a>, <a href=\"https://profiles.wordpress.org/davidbaumwald/\">David Baumwald</a>, <a href=\"https://profiles.wordpress.org/dmsnell\">Dennis Snell</a>, <a href=\"https://profiles.wordpress.org/grantmkin\">Grant M. Kinney</a>, <a href=\"https://profiles.wordpress.org/gziolo\">Greg Ziółkowski</a>, <a href=\"https://profiles.wordpress.org/audrasjb\">Jb Audras</a>, <a href=\"https://profiles.wordpress.org/desrosj\">Jonathan Desrosiers</a>, <a href=\"https://profiles.wordpress.org/matveb\">Matias Ventura</a>, <a href=\"https://profiles.wordpress.org/mcsf\">Miguel Fonseca</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rajinsharwar\">Rajin Sharwar</a>, <a href=\"https://profiles.wordpress.org/coffee2code\">Scott Reilly</a> e <a href=\"https://profiles.wordpress.org/hellofromTonya\">Tonya Mork</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Como contribuir</h2>\n\n\n\n<p>Para se envolver no desenvolvimento do núcleo do WordPress, dirija-se ao Trac, <a href=\"https://core.trac.wordpress.org/report/6\">escolha um ticket</a> e participe da conversa nos canais <a href=\"https://wordpress.slack.com/archives/C02RQBWTW\">#core</a> e <a href=\"https://wordpress.slack.com/archives/C06U06K50Q5\">#6-6-release-leads</a>. Precisa de ajuda? Confira o <a href=\"https://make.wordpress.org/core/handbook/\">Manual do colaborador do núcleo</a>.</p>\n\n\n\n<p><em>Testando o WordPress 6.6? O quarto beta já está disponível (<a href=\"https://wordpress.org/wordpress-6.6-beta4.zip\">zip</a>) e contém essas correções de segurança. Para mais informações sobre a versão 6.6, confira o <a href=\"https://br.wordpress.org/2024/06/19/wordpress-6-6-beta-3/\">anúncio da versão beta 3.</a> Saiba mais sobre os <a href=\"https://make.wordpress.org/test/2024/06/03/help-test-wordpress-6-6/\">testes no WordPress 6.6 aqui</a>.</em></p>\n\n\n\n<p class=\"has-text-align-right\">Agradecemos a <a href=\"https://profiles.wordpress.org/paulkevan/\">Paul Kevan</a>, <a href=\"https://profiles.wordpress.org/ehtis/\">Ehtisham Siddiqui</a>, <a href=\"https://profiles.wordpress.org/xknown/\">Alex Concha</a>, <a href=\"https://profiles.wordpress.org/hellofromTonya\">Tonya Mork</a> e <a href=\"https://profiles.wordpress.org/angelasjin/\">Angela Jin</a> pela revisão.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3069\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 6.6 Beta 3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://br.wordpress.org/2024/06/19/wordpress-6-6-beta-3/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 19 Jun 2024 11:14:22 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3066\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:334:\"O WordPress 6.6 Beta 3 já está disponível. Esta versão beta do software WordPress está em desenvolvimento. Por favor, não instale, execute ou teste esta versão do WordPress em produção ou sites de missão crítica, você corre o risco de resultados inesperados se o fizer. Em vez disso, instale o Beta 3 em locais e [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:7941:\"\n<p>O WordPress 6.6 Beta 3 já está disponível.</p>\n\n\n\n<p id=\"block-79834dd4-c99a-477a-b722-091806a32976\"><strong>Esta versão beta do software WordPress está em desenvolvimento. </strong>Por favor, não instale, execute ou teste esta versão do WordPress em produção ou sites de missão crítica, você corre o risco de resultados inesperados se o fizer.</p>\n\n\n\n<p id=\"block-79834dd4-c99a-477a-b722-091806a32976\">Em vez disso, instale o Beta 3 em locais e ambientes de teste usando qualquer uma dessas quatro maneiras:</p>\n\n\n\n<figure class=\"wp-block-table\"><table class=\"has-fixed-layout\"><tbody><tr><th class=\"has-text-align-center\" data-align=\"center\">Plugin</th><td>Instale e ative o plugin <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> em uma instalação do WordPress. (Selecione o canal “Bleeding edge” e o fluxo “Beta/RC Only”).</td></tr><tr><th class=\"has-text-align-center\" data-align=\"center\">Baixe diretamente</th><td>Baixe a <a href=\"https://wordpress.org/wordpress-6.6-beta3.zip\">versão Beta 3 (zip)</a> e instale-a em um site WordPress.</td></tr><tr><th class=\"has-text-align-center\" data-align=\"center\">Linha de comando</th><td>Use o comando do <a href=\"https://make.wordpress.org/cli/\">WP-CLI</a>:<br><code>wp core update --version=6.6-beta3</code></td></tr><tr><th class=\"has-text-align-center\" data-align=\"center\">WordPress Playground</th><td>Use uma <a href=\"https://playground.wordpress.net/#{%20%22preferredVersions%22:%20{%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20},%20%22features%22:%20{%20%22networking%22:%20true%20},%20%22steps%22:%20[%20{%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20}%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20},%20%22options%22:%20{%20%22activate%22:%20false%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20}%20]%20}\">instância da versão 6.6 Beta 3 no WordPress Playground</a> para testar o software diretamente no seu navegador. Esta pode ser a maneira mais fácil, sem sites separados, sem configuração. Basta clicar e utilizar!</td></tr></tbody></table></figure>\n\n\n\n<p>A data de lançamento final programada para o WordPress 6.6 é <strong>16 de julho de 2024</strong>. Sua ajuda para testar as versões Beta e RC nas próximas quatro semanas é vital para garantir que a versão final seja tudo o que deve ser: estável, poderosa e intuitiva.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Se você encontrar um problema</h2>\n\n\n\n<p>Se você se deparar com um problema, por favor, compartilhe-o na <a href=\"https://wordpress.org/support/forum/alphabeta/\">área Alpha/Beta</a> dos fóruns de suporte. Se você estiver confortável em enviar um relatório de erros reprodutível, você pode fazê-lo <a href=\"https://core.trac.wordpress.org/newticket\">através do WordPress Trac</a>. Você também pode verificar seu problema em relação a uma lista de <a href=\"https://core.trac.wordpress.org/tickets/major\">erros conhecidos</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">A recompensa da vulnerabilidade duplica no período beta</h2>\n\n\n\n<p>A comunidade WordPress patrocina uma <a href=\"https://make.wordpress.org/security/2024/06/04/wordpress-6-6-is-coming/\">recompensa monetária por relatar novas vulnerabilidades de segurança inéditas.</a> Essa recompensa dobra durante o período entre o Beta 1 em 4 de junho e o Release Candidate final (RC) que acontecerá em 9 de julho. Por favor, siga as práticas de divulgação responsável do projeto detalhadas nesta <a href=\"https://hackerone.com/wordpress\">página do HackerOne</a> e neste <a href=\"https://wordpress.org/about/security/\">white paper de segurança</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">O trabalho continua</h2>\n\n\n\n<p><strong>Acompanhe o que há de novo na versão 6.6:</strong> <a href=\"https://br.wordpress.org/2024/06/05/wordpress-6-6-beta-1/\">confira o anúncio da versão Beta 1 para os destaques.</a></p>\n\n\n\n<p>Esta versão contempla mais de 50 atualizações para o editor, desde a versão Beta 2, incluindo 39 <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=06%2F11%2F2024..06%2F16%2[…]id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">tíquetes para o núcleo do WordPress</a>:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/trunk?since=2024-06-08&amp;until=2024-06-16\">Tíquetes do GitHub para a versão 6.6</a> desde 11 de junho.</li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?changetime=06%2F11%2F2024..06%2F16%2F2024&amp;resolution=fixed&amp;milestone=6.6&amp;max=1000&amp;col=id&amp;col=summary&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=status&amp;col=priority&amp;order=milestone\">Tíquetes fechados do Trac</a> desde 11 de junho.</li>\n</ul>\n\n\n\n<p>O ciclo Beta é focado na correção dos erros encontrados no testes da comunidade.</p>\n\n\n\n<p><strong>Você desenvolve temas?</strong> O feedback dos testes já provocou uma mudança na maneira como você oferece variações de estilo para seus usuários.</p>\n\n\n\n<p>Na versão Beta 1, se você criou variações de estilo predefinidas para o seu tema, ele gerou automaticamente um conjunto completo de opções de cores e tipos, que seus usuários poderiam misturar e combinar nas diferentes variações.</p>\n\n\n\n<p><a href=\"https://github.com/WordPress/gutenberg/pull/62469/commits/83f62ca81ff89b9d395863f6e9b7e82cec76d1b3\">No Beta 3, seu tema não gera mais essas opções automaticamente, você as gera.</a> Assim, você pode apresentar um conjunto mais simples de opções, com curadoria para orientar os esforços dos usuários para resultados mais agradáveis. <a href=\"https://github.com/WordPress/gutenberg/issues/62285\" target=\"_blank\" rel=\"noreferrer noopener\">Para mais informações sobre a lógica, veja essa discussão.</a></p>\n\n\n\n<p>Agradecemos novamente por esta contribuição muito importante para o WordPress!</p>\n\n\n\n<p class=\"has-text-align-right\"><em>Agradecemos a <a href=\"https://profiles.wordpress.org/meher/\">@meher</a>, <a href=\"https://profiles.wordpress.org/rmartinezduque/\">@rmartinezduque</a></em>, <a href=\"https://profiles.wordpress.org/atachibana/\">@a<em>tachibana</em></a> e<em> <a href=\"https://profiles.wordpress.org/mobarak/\">@mobarak</a> pela colaboração e revisão.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3066\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 6.6 Beta 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://br.wordpress.org/2024/06/12/wordpress-6-6-beta-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 12 Jun 2024 11:52:39 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3061\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:334:\"O WordPress 6.6 Beta 2 já está disponível. Esta versão beta do software WordPress está em desenvolvimento. Por favor, não instale, execute ou teste esta versão do WordPress em produção ou sites de missão crítica, você corre o risco de resultados inesperados se o fizer. Em vez disso, instale o Beta 2 em locais e [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:7062:\"\n<p>O WordPress 6.6 Beta 2 já está disponível.</p>\n\n\n\n<p id=\"block-79834dd4-c99a-477a-b722-091806a32976\"><strong>Esta versão beta do software WordPress está em desenvolvimento. </strong>Por favor, não instale, execute ou teste esta versão do WordPress em produção ou sites de missão crítica, você corre o risco de resultados inesperados se o fizer.</p>\n\n\n\n<p id=\"block-79834dd4-c99a-477a-b722-091806a32976\">Em vez disso, instale o Beta 2 em locais e ambientes de teste usando qualquer uma dessas quatro maneiras:</p>\n\n\n\n<figure class=\"wp-block-table\"><table class=\"has-fixed-layout\"><tbody><tr><th>Plugin</th><td>Instale e ative o plugin <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> em uma instalação do WordPress. (Selecione o canal “Bleeding edge” e o fluxo “Beta/RC Only”).</td></tr><tr><th>Baixe diretamente</th><td>Baixe a <a href=\"https://wordpress.org/wordpress-6.6-beta2.zip\">versão Beta 2 (zip)</a> e instale-a em um site WordPress.</td></tr><tr><th>Linha de comando</th><td>Use o comando do <a href=\"https://make.wordpress.org/cli/\">WP-CLI</a>:<br><code>wp core update --version=6.6-beta2</code></td></tr><tr><th>WordPress Playground</th><td>Use uma <a href=\"https://playground.wordpress.net/#{%20%22preferredVersions%22:%20{%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20},%20%22features%22:%20{%20%22networking%22:%20true%20},%20%22steps%22:%20[%20{%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20}%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20},%20%22options%22:%20{%20%22activate%22:%20false%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20}%20]%20}\">instância da versão 6.6 Beta 2 no WordPress Playground</a> para testar o software diretamente no seu navegador. Esta pode ser a maneira mais fácil, sem sites separados, sem configuração. Basta clicar e utilizar!</td></tr></tbody></table></figure>\n\n\n\n<p>A data de lançamento final programada para o WordPress 6.6 é <strong>16 de julho de 2024</strong>. Sua ajuda para testar as versões Beta e RC nas próximas cinco semanas é vital para garantir que a versão final seja tudo o que deve ser: estável, poderosa e intuitiva.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Se você encontrar um problema</h2>\n\n\n\n<p>Se você se deparar com um problema, por favor, compartilhe-o na <a href=\"https://wordpress.org/support/forum/alphabeta/\">área Alpha/Beta</a> dos fóruns de suporte. Se você estiver confortável em enviar um relatório de erros reprodutível, você pode fazê-lo <a href=\"https://core.trac.wordpress.org/newticket\">através do WordPress Trac</a>. Você também pode verificar seu problema em relação a uma lista de <a href=\"https://core.trac.wordpress.org/tickets/major\">erros conhecidos</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">A recompensa da vulnerabilidade duplica no período beta</h2>\n\n\n\n<p>A comunidade WordPress patrocina uma <a href=\"https://make.wordpress.org/security/2024/06/04/wordpress-6-6-is-coming/\">recompensa monetária por relatar novas vulnerabilidades de segurança inéditas.</a> Essa recompensa dobra durante o período entre o Beta 1 em 4 de junho e o Release Candidate final (RC) que acontecerá em 9 de julho. Por favor, siga as práticas de divulgação responsável do projeto detalhadas nesta <a href=\"https://hackerone.com/wordpress\">página do HackerOne</a> e neste <a href=\"https://wordpress.org/about/security/\">white paper de segurança</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">O trabalho continua</h2>\n\n\n\n<p><strong>Acompanhe o que há de novo na versão 6.6:</strong> <a href=\"https://br.wordpress.org/2024/06/05/wordpress-6-6-beta-1/\">confira o anúncio da versão Beta 1 para mais detalhes.</a></p>\n\n\n\n<p>Esta versão contempla mais de 50 atualizações para o editor, desde a versão Beta 1, incluindo mais de 40 <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;changetime=02%2F14%2F2024..02%2F19%2F2024&amp;milestone=6.5&amp;col=id&amp;col=milestone&amp;col=owner&amp;col=type&amp;col=priority&amp;order=id\">tíquetes para núcleo do WordPress</a>:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li><a href=\"https://github.com/WordPress/gutenberg/commits/trunk?since=2024-06-04&amp;until=2024-06-07&amp;before=c7f51bdbe10bec0c0ab7f987a3f01caaa717c1db+70\">Tíquetes do GitHub para a versão 6.6</a> desde 4 de junho.</li>\n\n\n\n<li><a href=\"https://core.trac.wordpress.org/query?changetime=06%2F04%2F2024..06%2F11%2F2024&amp;resolution=fixed&amp;milestone=6.6&amp;max=1000&amp;col=id&amp;col=summary&amp;col=type&amp;col=milestone&amp;col=owner&amp;col=status&amp;col=priority&amp;order=priority\">Tíquetes fechados do Trac</a> desde 4 de junho.</li>\n</ul>\n\n\n\n<p>O ciclo Beta é focado na correção dos erros encontrados no testes da comunidade. Agradecemos novamente por estas contribuições de vital importância para o WordPress!</p>\n\n\n\n<p class=\"has-text-align-right\"><em>Agradecemos a <a href=\"https://profiles.wordpress.org/priethor/\">@priethor</a>, <a href=\"https://profiles.wordpress.org/dansoschin/\">@dansoschin</a>, <a href=\"https://profiles.wordpress.org/davidb/\">@davidb</a>, <a href=\"https://profiles.wordpress.org/atachibana/\">@atachibana</a>, <a href=\"https://profiles.wordpress.org/meher/\">@meher</a>, <a href=\"https://profiles.wordpress.org/webcommsat/\">@webcommsat</a> e <a href=\"https://profiles.wordpress.org/juanmaguitar/\">@juanmaguitar</a> pela revisão e colaboração.</em></p>\n\n\n\n<p></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3061\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"WordPress 6.5.4 – Atualização de manutenção\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:78:\"https://br.wordpress.org/2024/06/07/wordpress-6-5-4-atualizacao-de-manutencao/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 07 Jun 2024 11:45:54 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3055\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:358:\"O WordPress 6.5.4 já está disponível!Esta versão possui 5 correções de erros do núcleo. Você pode revisar um resumo das atualizações de manutenção nesta versão lendo o anúncio do release candidate. O WordPress 6.5.4 é uma versão de ciclo curto. O próximo grande lançamento será a versão 6.6 prevista para julho de 2024. Se você [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:7519:\"\n<p><strong>O WordPress 6.5.4 já está disponível!</strong><br>Esta versão possui <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=6.5.4&amp;group=status&amp;col=id&amp;col=summary&amp;col=owner&amp;col=type&amp;col=priority&amp;col=component&amp;col=version&amp;col=keywords&amp;order=priority\">5 correções de erros do núcleo</a>. Você pode revisar um resumo das atualizações de manutenção nesta versão lendo o <a href=\"https://make.wordpress.org/core/2024/05/30/wordpress-6-5-4-rc1-is-now-available/\">anúncio do release candidate</a>.</p>\n\n\n\n<p>O WordPress 6.5.4 é uma versão de ciclo curto. O próximo grande lançamento será a <a href=\"https://make.wordpress.org/core/6-6/\">versão 6.6</a> prevista para julho de 2024.</p>\n\n\n\n<p>Se você tiver sites que suportam atualizações automáticas em segundo plano, o processo de atualização será iniciado automaticamente.</p>\n\n\n\n<p>Você pode <a href=\"https://wordpress.org/wordpress-6.5.4.zip\">baixar o WordPress 6.5.4 do WordPress.org</a> ou visitar seu Painel do WordPress, clicar em “Atualizações” e clicar em “Atualizar agora”.</p>\n\n\n\n<p>Para mais informações sobre esta versão, visite <a href=\"https://wordpress.org/support/wordpress-version/version-6-5-4\">o site HelpHub</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Agradecimento aos colaboradores</h2>\n\n\n\n<p>Este lançamento foi liderado por <a href=\"https://profiles.wordpress.org/hellofromTonya\">Tonya Mork</a>, <a href=\"https://profiles.wordpress.org/costdev\">Colin Stewart</a> e <a href=\"https://profiles.wordpress.org/jorbin\">Aaron Jorbin</a>.</p>\n\n\n\n<p>O WordPress 6.5.4 não teria sido possível sem as contribuições das pessoas a seguir. Suas contribuições para fornecer correções de manutenção em uma versão estável é uma prova do poder e capacidade da comunidade WordPress.</p>\n\n\n\n<p><a href=\"https://profiles.wordpress.org/jorbin\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/adamsilverstein\">Adam Silverstein</a>, <a href=\"https://profiles.wordpress.org/adrianduffell\">adrianduffell</a>, <a href=\"https://profiles.wordpress.org/wildworks\">Aki Hamano</a>, <a href=\"https://profiles.wordpress.org/alanfuller\">Alan Fuller</a>, <a href=\"https://profiles.wordpress.org/anlino\">Anders Norén</a>, <a href=\"https://profiles.wordpress.org/oandregal\">André</a>, <a href=\"https://profiles.wordpress.org/afercia\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/azaozz\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/andrewserong\">Andrew Serong</a>, <a href=\"https://profiles.wordpress.org/afragen\">Andy Fragen</a>, <a href=\"https://profiles.wordpress.org/annezazu\">annezazu</a>, <a href=\"https://profiles.wordpress.org/dextorlobo\">Arun Sharma</a>, <a href=\"https://profiles.wordpress.org/aslamdoctor\">Aslam Doctor</a>, <a href=\"https://profiles.wordpress.org/benlk\">Ben Keith</a>, <a href=\"https://profiles.wordpress.org/britner\">Ben Ritner – Kadence WP</a>, <a href=\"https://profiles.wordpress.org/bernhard-reiter\">bernhard-reiter</a>, <a href=\"https://profiles.wordpress.org/ironprogrammer\">Brian Alexander</a>, <a href=\"https://profiles.wordpress.org/poena\">Carolina Nymark</a>, <a href=\"https://profiles.wordpress.org/costdev\">Colin Stewart</a>, <a href=\"https://profiles.wordpress.org/CookiesForDevo\">CookiesForDevo</a>, <a href=\"https://profiles.wordpress.org/colorful-tones\">Damon Cook</a>, <a href=\"https://profiles.wordpress.org/talldanwp\">Daniel Richards</a>, <a href=\"https://profiles.wordpress.org/darerodz\">darerodz</a>, <a href=\"https://profiles.wordpress.org/davecpage\">Dave Page</a>, <a href=\"https://profiles.wordpress.org/davidbaumwald\">David Baumwald</a>, <a href=\"https://profiles.wordpress.org/justlevine\">David Levine</a>, <a href=\"https://profiles.wordpress.org/DrewAPicture\">Drew Jaynes</a>, <a href=\"https://profiles.wordpress.org/ellatrix\">Ella</a>, <a href=\"https://profiles.wordpress.org/kebbet\">Erik</a>, <a href=\"https://profiles.wordpress.org/evanltd\">evanltd</a>, <a href=\"https://profiles.wordpress.org/flixos90\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/mamaduka\">George Mamadashvili</a>, <a href=\"https://profiles.wordpress.org/grantmkin\">Grant M. Kinney</a>, <a href=\"https://profiles.wordpress.org/gziolo\">Greg Ziółkowski</a>, <a href=\"https://profiles.wordpress.org/isabel_brison\">Isabel Brison</a>, <a href=\"https://profiles.wordpress.org/macmanx\">James Huff</a>, <a href=\"https://profiles.wordpress.org/jason_the_adams\">Jason Adams</a>, <a href=\"https://profiles.wordpress.org/audrasjb\">Jb Audras</a>, <a href=\"https://profiles.wordpress.org/JeffPaul\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/jeherve\">Jeremy Herve</a>, <a href=\"https://profiles.wordpress.org/luminuu\">Jessica Lyschik</a>, <a href=\"https://profiles.wordpress.org/joedolson\">Joe Dolson</a>, <a href=\"https://profiles.wordpress.org/joemcgill\">Joe McGill</a>, <a href=\"https://profiles.wordpress.org/jordesign\">jordesign</a>, <a href=\"https://profiles.wordpress.org/jorgefilipecosta\">Jorge Costa</a>, <a href=\"https://profiles.wordpress.org/verygoode\">Joshua Goode</a>, <a href=\"https://profiles.wordpress.org/kevin940726\">Kai Hao</a>, <a href=\"https://profiles.wordpress.org/kevinwhoffman\">Kevin Hoffman</a>, <a href=\"https://profiles.wordpress.org/khokansardar\">Khokan Sardar</a>, <a href=\"https://profiles.wordpress.org/luisherranz\">luisherranz</a>, <a href=\"https://profiles.wordpress.org/mmaattiiaass\">Matias Benedetto</a>, <a href=\"https://profiles.wordpress.org/webdevmattcrom\">Matt Cromwell</a>, <a href=\"https://profiles.wordpress.org/devsahadat\">Md Sahadat Husain</a>, <a href=\"https://profiles.wordpress.org/mukesh27\">Mukesh Panchal</a>, <a href=\"https://profiles.wordpress.org/narenin\">Narendra Sishodiya</a>, <a href=\"https://profiles.wordpress.org/ntsekouras\">Nik Tsekouras</a>, <a href=\"https://profiles.wordpress.org/swissspidy\">Pascal Birchler</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/ramonopoly\">ramonopoly</a>, <a href=\"https://profiles.wordpress.org/roytanck\">Roy Tanck</a>, <a href=\"https://profiles.wordpress.org/salcode\">Sal Ferrarello</a>, <a href=\"https://profiles.wordpress.org/mikachan\">Sarah Norris</a>, <a href=\"https://profiles.wordpress.org/SergeyBiryukov\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/sabernhardt\">Stephen Bernhardt</a>, <a href=\"https://profiles.wordpress.org/stevejonesdev\">Steve Jones</a>, <a href=\"https://profiles.wordpress.org/tomjcafferkey\">Tom Cafferkey</a>, <a href=\"https://profiles.wordpress.org/nestea29950\">WilliamG</a> e <a href=\"https://profiles.wordpress.org/yguyon\">Yannis Guyon</a></p>\n\n\n\n<h2 class=\"wp-block-heading\">Como contribuir</h2>\n\n\n\n<p>Para se envolver no desenvolvimento do núcleo do WordPress, dirija-se ao Trac, <a href=\"https://core.trac.wordpress.org/report/6\">escolha um ticket</a> e participe da conversa nos canais <a href=\"https://wordpress.slack.com/archives/C02RQBWTW\">#core</a> e <a href=\"https://wordpress.slack.com/archives/C06U06K50Q5\">#6-6-release-leads</a>. Precisa de ajuda? Confira o <a href=\"https://make.wordpress.org/core/handbook/\">Manual do colaborador do núcleo</a>.</p>\n\n\n\n<p class=\"has-text-align-right\"><em>Agradecemos a <a href=\"https://profiles.wordpress.org/afragen/\">@afragen</a>, <a href=\"https://profiles.wordpress.org/hellofromtonya/\">@hellofromtonya</a> e </em><a href=\"https://profiles.wordpress.org/angelasjin/\">@<em>angelasjin</em></a><em> pela revisão.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3055\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 6.6 Beta 1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://br.wordpress.org/2024/06/05/wordpress-6-6-beta-1/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 05 Jun 2024 12:23:47 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3048\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:334:\"O WordPress 6.6 Beta 1 já está disponível. Esta versão beta do software WordPress está em desenvolvimento. Por favor, não instale, execute ou teste esta versão do WordPress em produção ou sites de missão crítica, você corre o risco de resultados inesperados se o fizer. Em vez disso, instale o Beta 1 em locais e [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:16288:\"\n<p>O WordPress 6.6 Beta 1 já está disponível.</p>\n\n\n\n<p><strong>Esta versão beta do software WordPress está em desenvolvimento. </strong>Por favor, não instale, execute ou teste esta versão do WordPress em produção ou sites de missão crítica, você corre o risco de resultados inesperados se o fizer.</p>\n\n\n\n<p>Em vez disso, instale o Beta 1 em locais e ambientes de teste com qualquer uma dessas quatro maneiras:</p>\n\n\n\n<figure class=\"wp-block-table\"><table class=\"has-fixed-layout\"><tbody><tr><th>Plugin</th><td>Instale e ative o plugin <a href=\"https://wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> em uma instalação do WordPress. (Selecione o canal “Bleeding edge” e o fluxo “Beta/RC Only”).</td></tr><tr><th>Baixe diretamente</th><td>Baixe a <a href=\"https://wordpress.org/wordpress-6.6-beta1.zip\">versão Beta 1 (zip)</a> e instale-a em um site WordPress.</td></tr><tr><th>Linha de comando</th><td>Use este comando <a href=\"https://make.wordpress.org/cli/\">WP-CLI:</a><br><code>wp core update --version=6.6-beta1</code></td></tr><tr><th>WordPress Playground</th><td>Use uma <a href=\"https://playground.wordpress.net/#{%20%22preferredVersions%22:%20{%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20},%20%22features%22:%20{%20%22networking%22:%20true%20},%20%22steps%22:%20[%20{%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20}%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20},%20%22options%22:%20{%20%22activate%22:%20false%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20}%20]%20}\">instância</a> <a href=\"https://playground.wordpress.net/#{%20%22preferredVersions%22:%20{%20%22php%22:%20%228.0%22,%20%22wp%22:%20%22beta%22%20},%20%22features%22:%20{%20%22networking%22:%20true%20},%20%22steps%22:%20[%20{%20%22step%22:%20%22login%22,%20%22username%22:%20%22admin%22,%20%22password%22:%20%22password%22%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/wpaccessibility/a11y-theme-unit-test/master/a11y-theme-unit-test-data.xml%22%20}%20},%20{%20%22step%22:%20%22importFile%22,%20%22file%22:%20{%20%22resource%22:%20%22url%22,%20%22url%22:%20%22https://raw.githubusercontent.com/WordPress/theme-test-data/master/themeunittestdata.wordpress.xml%22%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22query-monitor%22%20},%20%22options%22:%20{%20%22activate%22:%20false%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22create-block-theme%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22debug-bar%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22health-check%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22test-reports%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20},%20{%20%22step%22:%20%22installPlugin%22,%20%22pluginZipFile%22:%20{%20%22resource%22:%20%22wordpress.org/plugins%22,%20%22slug%22:%20%22user-switching%22%20},%20%22progress%22:%20{%20%22weight%22:%202%20}%20}%20]%20}\">6.6 Beta 1 do WordPress Playground</a> para testar o software diretamente no seu navegador. Esta pode ser a maneira mais fácil de sempre, sem sites separados, sem configuração. Basta clicar e ir!</td></tr></tbody></table></figure>\n\n\n\n<p>A data de lançamento final programada para o WordPress 6.6 é <strong>16 de julho de 2024</strong>. Sua ajuda para testar as versões Beta e RC nas próximas seis semanas é vital para garantir que a versão final seja tudo o que deve ser: estável, poderosa e intuitiva.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Qual a importância do seu teste?</h2>\n\n\n\n<p><strong>Os recursos nesta versão Beta podem ser alterados ou removidos entre agora e a versão final.</strong> A atenção inicial de testadores como você é fundamental para encontrar e relatar possíveis erros, problemas de usabilidade ou problemas de compatibilidade para garantir que os desenvolvedores possam resolvê-los antes da versão final. Você não precisa de nenhuma experiência de contribuição, e esta é uma maneira fantástica de começar sua história como colaborador do WordPress!</p>\n\n\n\n<h2 class=\"wp-block-heading\">Se você encontrar um problema</h2>\n\n\n\n<p>Se você se deparar com um problema, por favor, compartilhe-o na <a href=\"https://wordpress.org/support/forum/alphabeta/\">área Alpha/Beta</a> dos fóruns de suporte. Se você estiver confortável em enviar um relatório de erros reprodutível, você pode fazê-lo <a href=\"https://core.trac.wordpress.org/newticket\">através do WordPress Trac</a>. Você também pode verificar seu problema em relação a uma lista de <a href=\"https://core.trac.wordpress.org/tickets/major\">erros conhecidos</a>.</p>\n\n\n\n<p>Quer saber mais sobre testes em geral e como começar? Siga as <a href=\"https://make.wordpress.org/test/\">iniciativas de teste em Make Core</a> e junte-se ao <a href=\"https://wordpress.slack.com/messages/core-test/\">canal de teste</a> central no <a href=\"https://wordpress.slack.com/\">Making WordPress Slack</a>.</p>\n\n\n\n<p>Como todas as versões desde a 5.0 em 2018, o WordPress 6.6 integrará uma série de novos recursos dos últimos lançamentos do plugin Gutenberg. Saiba mais sobre as atualizações do Gutenberg desde o WordPress 6.5 nos posts em <a href=\"https://make.wordpress.org/core/tag/gutenberg-new/\">What&#8217;s New in Gutenberg</a> para as versões <a href=\"https://make.wordpress.org/core/2024/02/28/whats-new-in-gutenberg-17-8-28-february/\">17.8</a>, <a href=\"https://make.wordpress.org/core/2024/03/13/whats-new-in-gutenberg-17-9-13-march/\">17.9</a>, <a href=\"https://make.wordpress.org/core/2024/03/27/whats-new-in-gutenberg-18-0-27-march/\">18.0</a>, <a href=\"https://make.wordpress.org/core/2024/04/24/whats-new-in-gutenberg-18-2-24-april/\">18.1</a>, <a href=\"https://make.wordpress.org/core/2024/05/08/whats-new-in-gutenberg-18-3-8-may/\">18.2 e</a> <a href=\"https://make.wordpress.org/core/2024/05/23/whats-new-in-gutenberg-18-4-22-may/\">18.4</a>. A versão final também incluirá o Gutenberg 18.5. O post do WordPress Beta 2 será vinculado a isso.</p>\n\n\n\n<p>O WordPress 6.6 Beta 1 contém 97 melhorias e 101 correções para o editor, em um total de cerca de 206 <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=6.6&amp;group=component&amp;max=500&amp;col=id&amp;col=summary&amp;col=owner&amp;col=type&amp;col=priority&amp;col=component&amp;col=version&amp;order=priority\">tíquetes para o núcleo WordPress 6.6</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">A recompensa da vulnerabilidade duplica no período beta</h2>\n\n\n\n<p>A comunidade WordPress patrocina uma <a href=\"https://make.wordpress.org/security/2024/06/04/wordpress-6-6-is-coming/\">recompensa monetária por relatar novas vulnerabilidades de segurança inéditas.</a> Essa recompensa dobra durante o período entre o Beta 1 em 4 de junho e o Release Candidate final (RC) que acontecerá em 25 de junho. Por favor, siga as práticas de divulgação responsável do projeto detalhadas nesta <a href=\"https://hackerone.com/wordpress\">página do HackerOne</a> e neste <a href=\"https://wordpress.org/about/security/\">white paper de segurança</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">O que há de novo no WordPress 6.6?</h2>\n\n\n\n<p>O segundo grande lançamento deste ano é sobre polimento e refinamento. Os recursos que chegaram nos últimos lançamentos têm nova flexibilidade e fluxos mais suaves, e alguns novos truques. E, claro, existem alguns recursos novos.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Visualizações de dados atualizações</h3>\n\n\n\n<p>Parte da estruturação para a fase 3, as visualizações de dados obtêm uma experiência nova e aprimorada de trabalhar com informações no editor do site. Um novo layout consolida padrões e partes de modelo, leva você a visualizações gerais de gerenciamento em menos cliques e embala em uma ampla gama de refinamentos.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Substituições em padrões sincronizados</h3>\n\n\n\n<p>E se você pudesse manter a <em>aparência</em> de um padrão sincronizado <em>e sentir</em> em todos os lugares que ele aparece, mantendo-o na marca, mas tivesse <em>conteúdo</em> diferente em todos os lugares que aparece?</p>\n\n\n\n<p>Por exemplo, talvez você esteja construindo um padrão para receitas. Idealmente, você quer manter o design geral do cartão de receita consistente em cada post que terá uma receita. Mas a receita em si – os ingredientes, os passos, notas especiais sobre a técnica – será diferente a cada vez.</p>\n\n\n\n<p>E talvez, no futuro, outras pessoas possam precisar mudar o design do padrão de receita. Seria bom saber que eles podem fazer isso, e que o conteúdo em receitas existentes ficará exatamente onde está.</p>\n\n\n\n<p>Na versão 6.6, você pode fazer tudo isso acontecer, e substitui-se em padrões sincronizados são a maneira como você faz isso.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Ver todos os blocos</h3>\n\n\n\n<p>Até agora, quando você tinha um bloco selecionado e, em seguida, abriu para Inserir novo bloco, você só via os blocos que você foi autorizado a adicionar ao bloco selecionado. Onde estavam todos os outros?</p>\n\n\n\n<p>Em 6.6, quando você tem um bloco selecionado, você obtém duas listas. Primeiro, há a lista de blocos que você pode inserir no bloco selecionado. Então você obtém uma lista com todos os outros blocos. Assim, você pode ter uma ideia do que você pode usar no bloco selecionado e quais outros blocos você poderia usar em outra área. Na verdade, se você selecionar um bloco a partir dessa segunda lista, o WordPress 6.6 irá adicioná-lo abaixo do seu bloco, para usar em qualquer coisa que você construir em seguida.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Um novo fluxo de publicação</h3>\n\n\n\n<p>A versão 6.6 aproxima os editores de posts e sites mais do que nunca. Então, se você está escrevendo para um post no editor de posts ou uma página no editor de sites, sua experiência será praticamente a mesma.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Variações de estilo</h3>\n\n\n\n<p>Se um tema de bloco vem com variações de estilo, o WordPress 6.6 expande muito suas opções de design diretamente, sem instalar ou configurar uma única coisa. O tema puxa as paletas de cores e os conjuntos de estilo tipográfico de suas variações instaladas para permitir que você misture e combine para um mundo inteiro de expressão criativa expandida.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Estilos de seção</h3>\n\n\n\n<p>Você constrói temas? Agora você pode definir opções de estilo para seções separadas de vários blocos, incluindo blocos internos.</p>\n\n\n\n<p>Em seguida, seus usuários podem aplicar essas variações de estilo de bloco a grupos inteiros de blocos, criando efetivamente seções de marca que podem fazer curadoria em um site.</p>\n\n\n\n<h4 class=\"wp-block-heading\">Uma nota sobre a especificidade de CSS</h4>\n\n\n\n<p>Para tornar mais fácil para suas variações substituírem os estilos CSS globais, esses estilos agora vêm envoltos em <code>:root</code>. Isso limita a sua especificidade. <a href=\"https://github.com/WordPress/gutenberg/discussions/61810\">Para mais detalhes, leia a discussão completa sobre o recurso no GitHub.</a></p>\n\n\n\n<h3 class=\"wp-block-heading\">Um layout nativo da grade</h3>\n\n\n\n<p>A grade é uma nova variação para o bloco do grupo, que permite organizar os blocos de dentro como uma grade. Se você estiver usando um plugin para isso, agora você pode fazer suas grades nativamente.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Melhor gestão de padrões em temas clássicos</h3>\n\n\n\n<p>Você ouviu bem: você pode fazer tudo com padrões em temas clássicos que você pode em um tema de bloco. Você pode ver todos os padrões disponíveis para você em uma única visualização e inserir um padrão escolhido.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Margens negativas</h3>\n\n\n\n<p>Eles estão aqui: valores de margem negativa, para que você possa fazer objetos sobrepostos em seu design. Você só pode definir uma margem negativa digitando um número negativo real, sem usar o controle deslizante. Isso é para impedir que as pessoas adicionem valores negativos que não pretendiam.</p>\n\n\n\n<h3 class=\"wp-block-heading\">Reverter automaticamente as atualizações</h3>\n\n\n\n<p>Agora você pode ter a conveniência de definir todos os seus plugins para atualizar automaticamente e a paz interior que você obtém ao saber que se algo der errado, o WordPress 6.6 fará uma reversão automaticamente.</p>\n\n\n\n<p><strong><em>Este post <strong><em>reflete as últimas mudanças</em></strong> a partir de 4 de junho de 2024.</em></strong></p>\n\n\n\n<p><strong>Novamente, os recursos neste primeiro beta podem mudar, com base no que os testadores como você encontram.</strong></p>\n\n\n\n<p>Obtenha uma visão geral do <a href=\"https://make.wordpress.org/core/6-6/\">ciclo de lançamento 6.6</a> e verifique o <a href=\"https://make.wordpress.org/core/\">blog Make WordPress Core</a> para <a href=\"https://make.wordpress.org/core/tag/6-6/\">postagens relacionadas a versão 6.6 </a> nas próximas semanas para obter mais detalhes.</p>\n\n\n\n<p><em>Agradecemos a <a href=\"https://profiles.wordpress.org/meher/\">@meher</a>, <a href=\"https://profiles.wordpress.org/audrasjb/\">@audrasjb</a>, <a href=\"https://profiles.wordpress.org/fabiankaegy/\">@fabiankaegy</a>, <a href=\"https://profiles.wordpress.org/colorful-tones/\">@colorful-tones</a>, </em><a href=\"https://profiles.wordpress.org/davidbaumwald/\">@davidbaumwald</a>,<em> <a href=\"https://profiles.wordpress.org/dansoschin/\">@dansoschin</a>, <a href=\"https://profiles.wordpress.org/desrosj/\">@desrosj</a>, <a href=\"https://profiles.wordpress.org/atachibana/\">@atachibana</a>, <a href=\"https://profiles.wordpress.org/ehtis/\">@ehtis</a>, <a href=\"https://profiles.wordpress.org/adamsilverstein/\">@adamsilverstein</a>, <a href=\"https://profiles.wordpress.org/joedolson/\">@joedolson</a> e <a href=\"https://profiles.wordpress.org/webcommsat/\">@webcommsat</a> pela revisão e colaboração com este post!</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3048\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:60:\"\n		\n		\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:6:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"WordPress 6.5.3 – Atualização de manutenção\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:78:\"https://br.wordpress.org/2024/05/08/wordpress-6-5-3-atualizacao-de-manutencao/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 08 May 2024 12:23:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:12:\"Lançamentos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:3:\"6.5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://br.wordpress.org/?p=3039\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:353:\"Esta versão apresenta 12 correções de erros no núcleo e 9 correções de erros para o editor de blocos. Você pode revisar um resumo das atualizações de manutenção nesta versão lendo o anúncio do release candidate (em inglês). WordPress 6.5.3 é uma versão de ciclo curto. O próximo grande lançamento será a versão 6.6 prevista [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Andre Ribeiro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:7522:\"\n<p>Esta versão apresenta <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=6.5.3&amp;group=status&amp;col=id&amp;col=summary&amp;col=owner&amp;col=type&amp;col=priority&amp;col=component&amp;col=version&amp;col=keywords&amp;order=priority\">12 correções de erros no núcleo</a> e <a href=\"https://github.com/WordPress/gutenberg/pull/61299\">9 correções de erros para o editor de blocos</a>. Você pode revisar um resumo das atualizações de manutenção nesta versão lendo o <a href=\"https://make.wordpress.org/core/2024/05/02/wordpress-6-5-3-rc1-is-now-available/\">anúncio do release candidate (em inglês)</a>.</p>\n\n\n\n<p>WordPress 6.5.3 é uma versão de ciclo curto. O próximo grande lançamento será a <a href=\"https://make.wordpress.org/core/6-6/\">versão 6.6</a> prevista para julho de 2024.</p>\n\n\n\n<p>Se você tiver sites que suportam atualizações automáticas em segundo plano, o processo de atualização será iniciado automaticamente.</p>\n\n\n\n<p>Você pode <a href=\"https://wordpress.org/wordpress-6.5.3.zip\">baixar o WordPress 6.5.3 diretamente</a> ou visitar seu Painel WordPress, clicar em “Atualizações” e clicar em “Atualizar agora”.</p>\n\n\n\n<p>Para mais informações sobre esta versão, visite <a href=\"https://wordpress.org/support/wordpress-version/version-6-5-3\">o site HelpHub</a>.</p>\n\n\n\n<h2 class=\"wp-block-heading\">Agradecemos os colaboradores do WordPress</h2>\n\n\n\n<p>Este lançamento foi liderado por <a href=\"https://profiles.wordpress.org/jorbin\">Aaron Jorbin</a> e <a href=\"https://profiles.wordpress.org/grantmkin/\">Grant M. &#8211; Kinney</a>.</p>\n\n\n\n<p>O WordPress 6.5.3 não teria sido possível sem as contribuições das pessoas a seguir. Sua coordenação assíncrona para fornecer correções de manutenção em uma versão estável é uma prova do poder e capacidade da comunidade WordPress.</p>\n\n\n\n<p><a href=\"https://profiles.wordpress.org/jorbin\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/adamsilverstein\">Adam Silverstein</a>, <a href=\"https://profiles.wordpress.org/adrianduffell\">adrianduffell</a>, <a href=\"https://profiles.wordpress.org/wildworks\">Aki Hamano</a>, <a href=\"https://profiles.wordpress.org/alanfuller\">Alan Fuller</a>, <a href=\"https://profiles.wordpress.org/anlino\">Anders Norén</a>, <a href=\"https://profiles.wordpress.org/oandregal\">André</a>, <a href=\"https://profiles.wordpress.org/afercia\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/azaozz\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/andrewserong\">Andrew Serong</a>, <a href=\"https://profiles.wordpress.org/afragen\">Andy Fragen</a>, <a href=\"https://profiles.wordpress.org/annezazu\">annezazu</a>, <a href=\"https://profiles.wordpress.org/dextorlobo\">Arun Sharma</a>, <a href=\"https://profiles.wordpress.org/aslamdoctor\">Aslam Doctor</a>, <a href=\"https://profiles.wordpress.org/benlk\">Ben Keith</a>, <a href=\"https://profiles.wordpress.org/britner\">Ben Ritner – Kadence WP</a>, <a href=\"https://profiles.wordpress.org/bernhard-reiter\">bernhard-reiter</a>, <a href=\"https://profiles.wordpress.org/ironprogrammer\">Brian Alexander</a>, <a href=\"https://profiles.wordpress.org/poena\">Carolina Nymark</a>, <a href=\"https://profiles.wordpress.org/costdev\">Colin Stewart</a>, <a href=\"https://profiles.wordpress.org/CookiesForDevo\">CookiesForDevo</a>, <a href=\"https://profiles.wordpress.org/colorful-tones\">Damon Cook</a>, <a href=\"https://profiles.wordpress.org/talldanwp\">Daniel Richards</a>, <a href=\"https://profiles.wordpress.org/darerodz\">darerodz</a>, <a href=\"https://profiles.wordpress.org/davecpage\">Dave Page</a>, <a href=\"https://profiles.wordpress.org/davidbaumwald\">David Baumwald</a>, <a href=\"https://profiles.wordpress.org/justlevine\">David Levine</a>, <a href=\"https://profiles.wordpress.org/DrewAPicture\">Drew Jaynes</a>, <a href=\"https://profiles.wordpress.org/ellatrix\">Ella</a>, <a href=\"https://profiles.wordpress.org/kebbet\">Erik</a>, <a href=\"https://profiles.wordpress.org/evanltd\">evanltd</a>, <a href=\"https://profiles.wordpress.org/flixos90\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/mamaduka\">George Mamadashvili</a>, <a href=\"https://profiles.wordpress.org/grantmkin\">Grant M. Kinney</a>, <a href=\"https://profiles.wordpress.org/gziolo\">Greg Ziółkowski</a>, <a href=\"https://profiles.wordpress.org/isabel_brison\">Isabel Brison</a>, <a href=\"https://profiles.wordpress.org/macmanx\">James Huff</a>, <a href=\"https://profiles.wordpress.org/jason_the_adams\">Jason Adams</a>, <a href=\"https://profiles.wordpress.org/audrasjb\">Jb Audras</a>, <a href=\"https://profiles.wordpress.org/JeffPaul\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/jeherve\">Jeremy Herve</a>, <a href=\"https://profiles.wordpress.org/luminuu\">Jessica Lyschik</a>, <a href=\"https://profiles.wordpress.org/joedolson\">Joe Dolson</a>, <a href=\"https://profiles.wordpress.org/joemcgill\">Joe McGill</a>, <a href=\"https://profiles.wordpress.org/jordesign\">jordesign</a>, <a href=\"https://profiles.wordpress.org/jorgefilipecosta\">Jorge Costa</a>, <a href=\"https://profiles.wordpress.org/verygoode\">Joshua Goode</a>, <a href=\"https://profiles.wordpress.org/kevin940726\">Kai Hao</a>, <a href=\"https://profiles.wordpress.org/kevinwhoffman\">Kevin Hoffman</a>, <a href=\"https://profiles.wordpress.org/khokansardar\">Khokan Sardar</a>, <a href=\"https://profiles.wordpress.org/luisherranz\">luisherranz</a>, <a href=\"https://profiles.wordpress.org/mmaattiiaass\">Matias Benedetto</a>, <a href=\"https://profiles.wordpress.org/webdevmattcrom\">Matt Cromwell</a>, <a href=\"https://profiles.wordpress.org/devsahadat\">Md Sahadat Husain</a>, <a href=\"https://profiles.wordpress.org/mukesh27\">Mukesh Panchal</a>, <a href=\"https://profiles.wordpress.org/narenin\">Narendra Sishodiya</a>, <a href=\"https://profiles.wordpress.org/ntsekouras\">Nik Tsekouras</a>, <a href=\"https://profiles.wordpress.org/swissspidy\">Pascal Birchler</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/ramonopoly\">ramonopoly</a>, <a href=\"https://profiles.wordpress.org/roytanck\">Roy Tanck</a>, <a href=\"https://profiles.wordpress.org/salcode\">Sal Ferrarello</a>, <a href=\"https://profiles.wordpress.org/mikachan\">Sarah Norris</a>, <a href=\"https://profiles.wordpress.org/SergeyBiryukov\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/sabernhardt\">Stephen Bernhardt</a>, <a href=\"https://profiles.wordpress.org/stevejonesdev\">Steve Jones</a>, <a href=\"https://profiles.wordpress.org/tomjcafferkey\">Tom Cafferkey</a>, <a href=\"https://profiles.wordpress.org/nestea29950\">WilliamG</a> e <a href=\"https://profiles.wordpress.org/yguyon\">Yannis Guyon</a></p>\n\n\n\n<h2 class=\"wp-block-heading\">Como contribuir</h2>\n\n\n\n<p>Para se envolver no desenvolvimento do núcleo do WordPress, dirija-se ao Trac, <a href=\"https://core.trac.wordpress.org/report/6\">escolha um ticket</a> e participe da conversa nos canais <a href=\"https://wordpress.slack.com/archives/C02RQBWTW\">#core</a> e <a href=\"https://wordpress.slack.com/archives/C06U06K50Q5\">#6-6-release-leads</a>. Precisa de ajuda? Confira o <a href=\"https://make.wordpress.org/core/handbook/\">Manual do colaborador do núcleo</a>.</p>\n\n\n\n<p class=\"has-text-align-right\">Agradecemos a <em><a href=\"https://wordpress.slack.com/team/UGP7D7TBP\">@grantmkin</a>, </em><a href=\"https://profiles.wordpress.org/angelasjin/\">@angelasjin</a> e <a href=\"https://profiles.wordpress.org/jeffpaul/\">@jeffpaul</a> <em>pela revisão.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:7:\"post-id\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"3039\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:35:\"https://br.wordpress.org/news/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"\n	hourly	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"\n	1	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:30:\"com-wordpress:feed-additions:1\";a:1:{s:4:\"site\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"13096052\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:48:\"WpOrg\\Requests\\Utility\\CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:11:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Mon, 22 Jul 2024 20:38:13 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:4:\"vary\";s:37:\"Accept-Encoding, accept, content-type\";s:6:\"x-olaf\";s:3:\"⛄\";s:13:\"last-modified\";s:29:\"Tue, 16 Jul 2024 18:35:55 GMT\";s:4:\"link\";s:61:\"<https://br.wordpress.org/wp-json/>; rel=\"https://api.w.org/\"\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:16:\"content-encoding\";s:2:\"br\";s:7:\"alt-svc\";s:19:\"h3=\":443\"; ma=86400\";s:4:\"x-nc\";s:9:\"HIT ord 2\";}}s:5:\"build\";s:14:\"20240212174517\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(608, '_transient_timeout_feed_mod_b85365aa61afaf3d4189819a6f57c4c4', '1721723893', 'no'),
(609, '_transient_feed_mod_b85365aa61afaf3d4189819a6f57c4c4', '1721680693', 'no'),
(610, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1721723895', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(612, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1721723895', 'no'),
(613, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1721680695', 'no'),
(614, '_transient_timeout_dash_v2_01e18dead815ce736e3b9cccfbd773a5', '1721723895', 'no'),
(615, '_transient_dash_v2_01e18dead815ce736e3b9cccfbd773a5', '<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://br.wordpress.org/2024/07/16/wordpress-6-6-dorsey/\'>WordPress 6.6 “Dorsey”</a></li><li><a class=\'rsswidget\' href=\'https://br.wordpress.org/2024/07/10/wordpress-6-6-release-candidate-3/\'>WordPress 6.6 Release Candidate 3</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2024/07/episode-84-a-wordpress-6-6-sneak-peek/\'>WordPress.org blog: WP Briefing: Episode 84: A WordPress 6.6 Sneak Peek</a></li><li><a class=\'rsswidget\' href=\'https://gutenbergtimes.com/podcast/gutenberg-changelog-104-block-themes-gutenberg-18-8/\'>Gutenberg Times: Gutenberg Changelog #104 – Block Themes, Gutenberg 18.8, WordPress 6.6</a></li><li><a class=\'rsswidget\' href=\'https://ma.tt/2024/07/jim-simons-rip/\'>Matt: Jim Simons RIP</a></li></ul></div>', 'no'),
(616, '_transient_timeout_plugin_info_gdpr-cookie-compliance', '1721723903', 'no'),
(617, '_transient_plugin_info_gdpr-cookie-compliance', 'O:8:\"stdClass\":25:{s:4:\"name\";s:101:\"GDPR Cookie Compliance &#8211; Cookie Banner, Cookie Consent, Cookie Notice &#8211; CCPA, DSGVO, RGPD\";s:4:\"slug\";s:22:\"gdpr-cookie-compliance\";s:7:\"version\";s:6:\"4.15.2\";s:6:\"author\";s:54:\"<a href=\"https://www.mooveagency.com\">Moove Agency</a>\";s:14:\"author_profile\";s:43:\"https://profiles.wordpress.org/mooveagency/\";s:8:\"requires\";s:3:\"4.5\";s:6:\"tested\";s:3:\"6.6\";s:12:\"requires_php\";s:3:\"5.6\";s:16:\"requires_plugins\";a:0:{}s:6:\"rating\";i:90;s:7:\"ratings\";a:5:{i:5;i:153;i:4;i:4;i:3;i:7;i:2;i:8;i:1;i:10;}s:11:\"num_ratings\";i:182;s:15:\"support_threads\";i:19;s:24:\"support_threads_resolved\";i:19;s:15:\"active_installs\";i:300000;s:10:\"downloaded\";i:9295882;s:12:\"last_updated\";s:22:\"2024-07-08 10:22am GMT\";s:5:\"added\";s:10:\"2018-04-18\";s:8:\"homepage\";s:53:\"https://wordpress.org/plugins/gdpr-cookie-compliance/\";s:17:\"short_description\";s:159:\"Cookie notice banner for GDPR, CCPA, CPRA, LGPD, RGPD, PECR, AAP, PIPEDA, VCDPA, CPRA, ICO, GPDP, DSGVO, BfDl, CNIL, AEPD, PDPB, DPA, PDPA, TTDSG, POP &hellip;\";s:11:\"description\";s:8956:\"<p><strong>Prepare your website for cookie consent requirements related to GDPR, CCPA, DSGVO, EU cookie law and notice requirements with this incredibly powerful, easy-to-use, well supported and 100% free WordPress plugin.</strong></p>\n<h3>Key Features</h3>\n<ul>\n<li><strong>Local Data Storage</strong> &#8211; all user data is stored locally on your website only &#8211; we do not collect or store any of your user data on our servers</li>\n<li><strong>Simple</strong> to use — install &amp; setup in seconds</li>\n<li>Give your users <strong>full control</strong> over cookies stored on their computer, including the ability for users to <strong>revoke their consent</strong>.</li>\n<li><strong>Fully customisable</strong> &#8211; upload your own logo, colours, fonts</li>\n<li><strong>Fully editable</strong> &#8211; change all text</li>\n<li>Direct integration of <strong>GTM, GA, Meta Pixel, GTM4WP</strong> and more</li>\n<li><strong>Google Consent Mode v2</strong> fully supported</li>\n<li><strong>Set the position</strong> of the Cookie Consent Banner: at the top or bottom of your pages</li>\n<li><strong>Flexible</strong> &#8211; decide which scripts will be loaded by default or only when the user gives consent</li>\n<li><strong>&#8216;Accept&#8217;</strong>, <strong>&#8216;Reject&#8217;</strong>, &#8216;Close&#8217; and &#8216;Settings&#8217; buttons &amp; you can also change their order</li>\n<li><strong>Consent expiration</strong> settings</li>\n<li>Link to <strong>Privacy Policy</strong> page</li>\n<li>Simple, beautiful &amp; intuitive user interface</li>\n<li>Choose from <strong>two unique layouts</strong></li>\n<li>Sleek animations to enhance the user experience</li>\n<li><strong>Mobile responsive</strong> design</li>\n<li><strong>SEO friendly</strong></li>\n<li>Optimized for <strong>WCAG &amp; ADA</strong> accessibility guidelines</li>\n<li>WPML, QTranslate, WP Multilang, TranslatePress and Polylang compatible, .pot file for translations included</li>\n<li><strong>CDN</strong> base URL supported</li>\n<li>Supports all major <strong>caching</strong> servers and plugins</li>\n<li>Available in <strong>19 languages</strong></li>\n<li>Optimised for PHP 7 and PHP 8</li>\n</ul>\n<h3>Premium Features Available</h3>\n<ul>\n<li><strong>Consent Log</strong> &#8211; gives you the ability to store user consent information in the event that you need to prove that consent was given</li>\n<li><strong>Geo-location</strong> &#8211; the Cookie Consent Banner can be shown to visitors from the European Union or selected countries only (ie. Canada, California etc.)</li>\n<li><strong>Google Site Kit integration</strong> &#8211; our plugin supports the Google Site Kit natively</li>\n<li><strong>Cookie wall / Full-screen layout</strong> &#8211; if enabled, the Cookie Consent Banner will be display in a full screen mode, and force users to either accept or reject cookies before they can see your content</li>\n<li><strong>Export &amp; import settings</strong> &#8211; transfer your custom settings between sites with ease</li>\n<li><strong>WordPress Multisite features</strong> &#8211; you can manage the plugin settings globally, and clone them from one site to another within your multi-site setup. You can also sync users consent between individual subsites on your multisite network</li>\n<li><strong>Accept on Scroll / Hide timer</strong> &#8211; allow users to accept cookies by scrolling down the page OR by setting a timer (ie. Hide banner after 5 seconds)</li>\n<li><strong>Renew Consent</strong> &#8211; ask users to renew their consent if there is a change in privacy or cookie policy on your site</li>\n<li><strong>iFrame Blocker</strong> &#8211; blocks users from viewing 3rd party resources (such as Youtube) until they accept cookies</li>\n<li><strong>Language Specific Scripts</strong> &#8211; insert different Tag Manager Scripts for different languages, supports WPML and other language plugins</li>\n<li><strong>Premium Shortcodes</strong> that can be added to your ‘Privacy &amp; Cookie Policy’ and allow your users to manage their consent with ease.</li>\n<li><strong>Hide Cookie Banner</strong> allows you to hide the Cookie Notice Banner on selected pages</li>\n<li><strong>Cookie Declaration</strong> allows you to declare the exact type of cookies that your site uses, including the cookie name, provider, purpose and expiration</li>\n<li><strong>Analytics</strong> &#8211; stats and charts showing you how many users accepted your cookies (all anonymous)</li>\n<li><strong>Fast Premium Support</strong> from our friendly team</li>\n<li><strong>12 months</strong> of premium updates included</li>\n</ul>\n<p><a href=\"https://www.mooveagency.com/wordpress-plugins/gdpr-cookie-compliance/\" rel=\"nofollow ugc\">Download Premium Add-on here</a></p>\n<h3>Demo Video</h3>\n<p>You can view a demo of the plugin here:</p>\n<div class=\"embed-vimeo\" style=\"text-align: center;\"><iframe loading=\"lazy\" src=\"https://player.vimeo.com/video/255655268\" width=\"750\" height=\"422\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div>\n<h3>Testimonials</h3>\n<p>★★★★★</p>\n<blockquote>\n<p>“The only free GDPR plugin that actually works.” &#8211; <a href=\"https://wordpress.org/support/topic/the-only-free-gdpr-plugin-that-actually-works/\" rel=\"ugc\">Jamie</a></p>\n</blockquote>\n<p>★★★★★</p>\n<blockquote>\n<p>“One of the best GDPR implementation for WordPress.” &#8211; <a href=\"https://wordpress.org/support/topic/one-of-the-best-gdpr-implementation-for-wordpress/\" rel=\"ugc\">webinvaders</a></p>\n</blockquote>\n<p>★★★★★</p>\n<blockquote>\n<p>“The best free solution for GDPR.” &#8211; <a href=\"https://wordpress.org/support/topic/the-best-free-solution-for-the-gdpr/\" rel=\"ugc\">Distrix</a></p>\n</blockquote>\n<p>★★★★★</p>\n<blockquote>\n<p>“Great plugin, great support. I’ve tried many, this is probably the best for multisite installations.” &#8211; <a href=\"https://wordpress.org/support/topic/great-plugin-great-support-1157/\" rel=\"ugc\">pattihis</a></p>\n</blockquote>\n<h3>Live Examples</h3>\n<ul>\n<li>You can choose to setup our cookie plugin in any way that you like. </li>\n<li>We have created the plugin with as much flexibility as possible as organisations interpret the Cookie Law and Cookie Consent Policy differently.</li>\n<li>A few examples of how you can setup our plugin in various ways are below:</li>\n</ul>\n<p><strong>OPTION A</strong><br />\nNo cookies are stored on users&#8217; computers until the user accepts cookies.<br />\n<a href=\"https://www.mooveagency.com/wordpress-plugins/gdpr-cookie-compliance/\" rel=\"nofollow ugc\">Example 1</a></p>\n<p><strong>OPTION B</strong><br />\nThe &#8216;Full-Screen / Cookie Wall&#8217; option is used (a premium feature).<br />\n<a href=\"https://www.teneo.net/\" rel=\"nofollow ugc\">Example 2</a></p>\n<p><strong>OTHER OPTIONS</strong><br />\nThere are many other settings available that you can use to create your own unique Cookie Consent Banner and satisfy the Cookie Compliance Law &#8211; our plugin is very flexible.</p>\n<h3>Custom Layout</h3>\n<ul>\n<li>You can also create your own custom front-end layout.</li>\n<li>Simply copy the &#8220;gdpr-modules&#8221; folder from the plugin directory to your theme directory. </li>\n<li>If you do this, your changes will be retained even if you update the plugin in future. </li>\n<li>Any customisation should be implemented by experienced developers only.</li>\n</ul>\n<h3>Flexible</h3>\n<p>Our cookie plugin is very flexible and especially useful in preparing your site for the following cookie law, data protection and privacy regulations:</p>\n<ul>\n<li><strong>GDPR</strong>: The General Data Protection Regulation, ePrivacy Directive, ePrivacy Regulation (European Union)</li>\n<li><strong>CCPA</strong>: The California Consumer Privacy Act (California, United States)</li>\n<li><strong>PECR</strong>: The Privacy and Electronic Communications Regulations (UK)</li>\n<li><strong>AAP</strong>: Australia&#8217;s Privacy Principles (Australia)</li>\n<li><strong>PIPEDA</strong>: The Personal Information Protection and Electronic Documents Act (Canada) </li>\n<li><strong>LGPD</strong>: The Brazilian General Data Protection Law (Brazil)</li>\n<li><strong>VCDPA, CPRA, ICO, GPDP, DSGVO, BfDl, CNIL, AEPD, PDPB, DPA, PDPA, DPA, PDPA, TTDSG, POPIA , APA, ePrivacy, COPPA, CASL, Australian Privacy Principles, The Marco Civil Privacy Act 1988</strong> and other cookie law, data protection and privacy regulations</li>\n</ul>\n<h3>About us</h3>\n<p><a href=\"https://www.mooveagency.com/\" rel=\"nofollow ugc\">Moove Agency</a> is a premium supplier of quality WordPress plugins, services and support. <a href=\"https://www.mooveagency.com/wordpress-plugins/\" rel=\"nofollow ugc\">Visit our WordPress site</a> to learn more.</p>\n<h3>Disclaimer</h3>\n<ul>\n<li>THIS PLUGIN DOES NOT MAKE YOUR WEBSITE COMPLIANT. YOU ARE RESPONSIBLE FOR ENSURING THAT ALL COOKIE LAW REQUIREMENTS ARE MET ON YOUR WEBSITE.</li>\n</ul>\n\";s:13:\"download_link\";s:72:\"https://downloads.wordpress.org/plugin/gdpr-cookie-compliance.4.15.2.zip\";s:4:\"tags\";a:5:{s:4:\"ccpa\";s:4:\"CCPA\";s:4:\"cpra\";s:4:\"CPRA\";s:5:\"dsgvo\";s:5:\"dsgvo\";s:4:\"gdpr\";s:4:\"GDPR\";s:4:\"rgpd\";s:4:\"rgpd\";}s:11:\"donate_link\";s:69:\"https://www.mooveagency.com/wordpress-plugins/gdpr-cookie-compliance/\";s:5:\"icons\";a:2:{s:2:\"1x\";s:75:\"https://ps.w.org/gdpr-cookie-compliance/assets/icon-128x128.png?rev=2376316\";s:2:\"2x\";s:75:\"https://ps.w.org/gdpr-cookie-compliance/assets/icon-256x256.png?rev=2376316\";}}', 'no'),
(619, 'rsssl_site_url_in_wpconfig_dismissed', '1', 'no');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_form', '<label> Your name\n    [text* your-name autocomplete:name] </label>\n\n<label> Your email\n    [email* your-email autocomplete:email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]'),
(4, 5, '_mail', 'a:8:{s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:38:\"[_site_title] <matheus@dzigual.com.br>\";s:4:\"body\";s:191:\"From: [your-name] [your-email]\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis is a notification that a contact form was submitted on your website ([_site_title] [_site_url]).\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(5, 5, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:38:\"[_site_title] <matheus@dzigual.com.br>\";s:4:\"body\";s:220:\"Message Body:\n[your-message]\n\n-- \nThis email is a receipt for your contact form submission on our website ([_site_title] [_site_url]) in which your email address was used. If that was not you, please ignore this message.\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(6, 5, '_messages', 'a:12:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:27:\"Please fill out this field.\";s:16:\"invalid_too_long\";s:32:\"This field has a too long input.\";s:17:\"invalid_too_short\";s:33:\"This field has a too short input.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:31:\"The uploaded file is too large.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";}'),
(7, 5, '_additional_settings', ''),
(8, 5, '_locale', 'en_US'),
(9, 5, '_hash', '08c9630a5b7a8238f7e54f7431ecfc5683af0307'),
(10, 6, '_wp_attached_file', '2024/05/icon-dz.png'),
(11, 6, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:164;s:6:\"height\";i:164;s:4:\"file\";s:19:\"2024/05/icon-dz.png\";s:8:\"filesize\";i:3342;s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"icon-dz-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:5020;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(12, 7, '_wp_attached_file', '2024/07/mt-sample-background.jpg'),
(13, 7, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:32:\"2024/07/mt-sample-background.jpg\";s:8:\"filesize\";i:217593;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint UNSIGNED NOT NULL,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2024-05-13 20:04:14', '2024-05-13 20:04:14', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2024-05-13 20:04:14', '2024-05-13 20:04:14', '', 0, 'http://localhost/?p=1', 0, 'post', '', 1),
(2, 1, '2024-05-13 20:04:14', '2024-05-13 20:04:14', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2024-05-13 20:04:14', '2024-05-13 20:04:14', '', 0, 'http://localhost/?page_id=2', 0, 'page', '', 0),
(3, 1, '2024-05-13 20:04:14', '2024-05-13 20:04:14', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2024-05-13 20:04:14', '2024-05-13 20:04:14', '', 0, 'http://localhost/?page_id=3', 0, 'page', '', 0),
(4, 1, '2024-05-13 20:04:36', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2024-05-13 20:04:36', '0000-00-00 00:00:00', '', 0, 'http://localhost/?p=4', 0, 'post', '', 0),
(5, 1, '2024-05-13 20:07:33', '2024-05-13 20:07:33', '<label> Your name\n    [text* your-name autocomplete:name] </label>\n\n<label> Your email\n    [email* your-email autocomplete:email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]\n[_site_title] \"[your-subject]\"\n[_site_title] <matheus@dzigual.com.br>\nFrom: [your-name] [your-email]\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis is a notification that a contact form was submitted on your website ([_site_title] [_site_url]).\n[_site_admin_email]\nReply-To: [your-email]\n\n0\n0\n\n[_site_title] \"[your-subject]\"\n[_site_title] <matheus@dzigual.com.br>\nMessage Body:\n[your-message]\n\n-- \nThis email is a receipt for your contact form submission on our website ([_site_title] [_site_url]) in which your email address was used. If that was not you, please ignore this message.\n[your-email]\nReply-To: [_site_admin_email]\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nPlease fill out this field.\nThis field has a too long input.\nThis field has a too short input.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe uploaded file is too large.\nThere was an error uploading the file.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2024-05-13 20:07:33', '2024-05-13 20:07:33', '', 0, 'http://localhost/?post_type=wpcf7_contact_form&p=5', 0, 'wpcf7_contact_form', '', 0),
(6, 1, '2024-05-13 20:16:06', '2024-05-13 20:16:06', '', 'icon-dz', '', 'inherit', 'open', 'closed', '', 'icon-dz', '', '', '2024-05-13 20:16:06', '2024-05-13 20:16:06', '', 0, 'http://localhost/wp-content/uploads/2024/05/icon-dz.png', 0, 'attachment', 'image/png', 0),
(7, 1, '2024-07-02 13:03:43', '2024-07-02 13:03:43', '', 'mt-sample-background', '', 'inherit', 'open', 'closed', '', 'mt-sample-background', '', '', '2024-07-02 13:03:43', '2024-07-02 13:03:43', '', 0, 'http://localhost/wp-content/uploads/2024/07/mt-sample-background.jpg', 0, 'attachment', 'image/jpeg', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_stream`
--

CREATE TABLE `wp_stream` (
  `ID` bigint UNSIGNED NOT NULL,
  `site_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `blog_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `object_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_role` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `connector` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `action` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ip` varchar(39) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_stream`
--

INSERT INTO `wp_stream` (`ID`, `site_id`, `blog_id`, `object_id`, `user_id`, `user_role`, `summary`, `created`, `connector`, `context`, `action`, `ip`) VALUES
(1, 1, 1, NULL, 1, 'administrator', '\"Maintenance\" plugin deactivated', '2024-07-02 13:05:33', 'installer', 'plugins', 'deactivated', '172.26.0.1'),
(2, 1, 1, NULL, 1, 'administrator', '\"Redirection\" plugin deactivated', '2024-07-02 13:05:33', 'installer', 'plugins', 'deactivated', '172.26.0.1'),
(3, 1, 1, NULL, 1, 'administrator', '\"Stream\" plugin deactivated', '2024-07-02 13:05:33', 'installer', 'plugins', 'deactivated', '172.26.0.1'),
(4, 1, 1, NULL, 1, 'administrator', '\"Wordfence Security\" plugin deactivated', '2024-07-02 13:05:33', 'installer', 'plugins', 'deactivated', '172.26.0.1'),
(5, 1, 1, NULL, 1, 'administrator', '\"Yoast SEO\" plugin deactivated', '2024-07-02 13:05:33', 'installer', 'plugins', 'deactivated', '172.26.0.1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_stream_meta`
--

CREATE TABLE `wp_stream_meta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `record_id` bigint UNSIGNED NOT NULL,
  `meta_key` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `meta_value` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_stream_meta`
--

INSERT INTO `wp_stream_meta` (`meta_id`, `record_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'name', 'Maintenance'),
(2, 1, 'user_meta', 'matheus@dzigual.com.br'),
(3, 1, 'user_meta', 'admin'),
(4, 1, 'user_meta', 'admin'),
(5, 1, 'user_meta', 'Administrator'),
(6, 2, 'name', 'Redirection'),
(7, 2, 'user_meta', 'matheus@dzigual.com.br'),
(8, 2, 'user_meta', 'admin'),
(9, 2, 'user_meta', 'admin'),
(10, 2, 'user_meta', 'Administrator'),
(11, 3, 'name', 'Stream'),
(12, 3, 'user_meta', 'matheus@dzigual.com.br'),
(13, 3, 'user_meta', 'admin'),
(14, 3, 'user_meta', 'admin'),
(15, 3, 'user_meta', 'Administrator'),
(16, 4, 'name', 'Wordfence Security'),
(17, 4, 'user_meta', 'matheus@dzigual.com.br'),
(18, 4, 'user_meta', 'admin'),
(19, 4, 'user_meta', 'admin'),
(20, 4, 'user_meta', 'Administrator'),
(21, 5, 'name', 'Yoast SEO'),
(22, 5, 'user_meta', 'matheus@dzigual.com.br'),
(23, 5, 'user_meta', 'admin'),
(24, 5, 'user_meta', 'admin'),
(25, 5, 'user_meta', 'Administrator');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"c26add468ed1770523b3051a1ffdf48162e708198d3622e61a41d4ee80c14327\";a:4:{s:10:\"expiration\";i:1721853491;s:2:\"ip\";s:10:\"172.26.0.1\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0\";s:5:\"login\";i:1721680691;}}'),
(17, 1, 'wp_user-settings', 'libraryContent=browse&editor=tinymce&mfold=o&posts_list_mode=list&editor_expand=on'),
(18, 1, 'wp_user-settings-time', '1716829244'),
(19, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(20, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:10:\"172.26.0.0\";}'),
(22, 1, 'gdpr_cc_dismiss_stamp', '1723579665');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint UNSIGNED NOT NULL,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BLRJAL1o1g.E1ha0/l4NiPGAUf30q./', 'admin', 'matheus@dzigual.com.br', 'http://localhost', '2024-05-13 20:04:14', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfblockediplog`
--

CREATE TABLE `wp_wfblockediplog` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `countryCode` varchar(2) NOT NULL,
  `blockCount` int UNSIGNED NOT NULL DEFAULT '0',
  `unixday` int UNSIGNED NOT NULL,
  `blockType` varchar(50) NOT NULL DEFAULT 'generic'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfblocks7`
--

CREATE TABLE `wp_wfblocks7` (
  `id` bigint UNSIGNED NOT NULL,
  `type` int UNSIGNED NOT NULL DEFAULT '0',
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `blockedTime` bigint NOT NULL,
  `reason` varchar(255) NOT NULL,
  `lastAttempt` int UNSIGNED DEFAULT '0',
  `blockedHits` int UNSIGNED DEFAULT '0',
  `expiration` bigint UNSIGNED NOT NULL DEFAULT '0',
  `parameters` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfconfig`
--

CREATE TABLE `wp_wfconfig` (
  `name` varchar(100) NOT NULL,
  `val` longblob,
  `autoload` enum('no','yes') NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `wp_wfconfig`
--

INSERT INTO `wp_wfconfig` (`name`, `val`, `autoload`) VALUES
('activatingIP', 0x3137322e32362e302e31, 'yes'),
('actUpdateInterval', 0x32, 'yes'),
('addCacheComment', 0x30, 'yes'),
('adminUserList', 0x623a303b, 'yes'),
('advancedCommentScanning', 0x31, 'yes'),
('ajaxWatcherDisabled_admin', 0x30, 'yes'),
('ajaxWatcherDisabled_front', 0x30, 'yes'),
('alertEmails', '', 'yes'),
('alertOn_adminLogin', 0x31, 'yes'),
('alertOn_block', 0x31, 'yes'),
('alertOn_breachLogin', 0x31, 'yes'),
('alertOn_firstAdminLoginOnly', 0x30, 'yes'),
('alertOn_firstNonAdminLoginOnly', 0x30, 'yes'),
('alertOn_loginLockout', 0x31, 'yes'),
('alertOn_lostPasswdForm', 0x31, 'yes'),
('alertOn_nonAdminLogin', 0x30, 'yes'),
('alertOn_scanIssues', 0x31, 'yes'),
('alertOn_severityLevel', 0x3235, 'yes'),
('alertOn_throttle', 0x30, 'yes'),
('alertOn_update', 0x30, 'yes'),
('alertOn_wafDeactivated', 0x31, 'yes'),
('alertOn_wordfenceDeactivated', 0x31, 'yes'),
('alert_maxHourly', 0x30, 'yes'),
('allowed404s', 0x2f66617669636f6e2e69636f0a2f6170706c652d746f7563682d69636f6e2a2e706e670a2f2a4032782e706e670a2f62726f77736572636f6e6669672e786d6c, 'yes'),
('allowed404s6116Migration', 0x31, 'yes'),
('allowHTTPSCaching', 0x30, 'yes'),
('allowLegacy2FA', 0x30, 'yes'),
('allowMySQLi', 0x31, 'yes'),
('allScansScheduled', 0x613a303a7b7d, 'yes'),
('apiKey', '', 'yes'),
('autoBlockScanners', 0x31, 'yes'),
('autoUpdate', 0x30, 'yes'),
('autoUpdateAttempts', 0x30, 'yes'),
('bannedURLs', '', 'yes'),
('blockCustomText', '', 'yes'),
('blockedTime', 0x333030, 'yes'),
('blocks702Migration', 0x31, 'yes'),
('cacheType', 0x64697361626c6564, 'yes'),
('cbl_action', 0x626c6f636b, 'yes'),
('cbl_bypassRedirDest', '', 'yes'),
('cbl_bypassRedirURL', '', 'yes'),
('cbl_bypassViewURL', '', 'yes'),
('cbl_cookieVal', 0x36363833666161616138336437, 'yes'),
('cbl_loggedInBlocked', '', 'yes'),
('cbl_redirURL', '', 'yes'),
('cbl_restOfSiteBlocked', 0x31, 'yes'),
('checkSpamIP', 0x31, 'yes'),
('config701Migration', 0x31, 'yes'),
('config720Migration', 0x31, 'yes'),
('dbTest', 0x613a313a7b733a353a226e6f6e6365223b733a36343a2235363336386336386137316234613762323762613537336566343266373833396538393631323433616234303831343066393233383135633233373631626662223b7d, 'no'),
('dbVersion', 0x382e342e30, 'yes'),
('debugOn', 0x30, 'yes'),
('deleteTablesOnDeact', 0x30, 'yes'),
('detectProxyNextCheck', 0x31373230353330323138, 'no'),
('detectProxyNonce', 0x37633132396139353031653630366161353533333961656364666231343562346565383362396664393966616563316466316130313735376532653333393062, 'no'),
('detectProxyRecommendation', '', 'no'),
('diagnosticsWflogsRemovalHistory', 0x5b5d, 'no'),
('disableCodeExecutionUploads', 0x30, 'yes'),
('disableConfigCaching', 0x30, 'yes'),
('disableWAFIPBlocking', 0x30, 'yes'),
('dismissAutoPrependNotice', 0x30, 'yes'),
('displayAutomaticBlocks', 0x31, 'yes'),
('displayTopLevelBlocking', 0x30, 'yes'),
('displayTopLevelLiveTraffic', 0x30, 'yes'),
('displayTopLevelOptions', 0x31, 'yes'),
('email_summary_dashboard_widget_enabled', 0x31, 'yes'),
('email_summary_enabled', 0x31, 'yes'),
('email_summary_excluded_directories', 0x77702d636f6e74656e742f63616368652c77702d636f6e74656e742f77666c6f6773, 'yes'),
('email_summary_interval', 0x7765656b6c79, 'yes'),
('enableRemoteIpLookup', 0x31, 'yes'),
('encKey', 0x33613635326633323964383133353163, 'yes'),
('fileContentsGSB6315Migration', 0x31, 'yes'),
('firewallEnabled', 0x31, 'yes'),
('hasKeyConflict', 0x30, 'yes'),
('howGetIPs', '', 'yes'),
('howGetIPs_trusted_proxies', '', 'yes'),
('howGetIPs_trusted_proxy_preset', '', 'yes'),
('isPaid', '', 'yes'),
('keyType', 0x66726565, 'yes'),
('lastBlockAggregation', 0x31373139393235343137, 'yes'),
('lastDailyCron', 0x31373139393235343338, 'yes'),
('lastNotificationID', 0x31, 'no'),
('lastPermissionsTemplateCheck', 0x31373139393235343430, 'yes'),
('liveActivityPauseEnabled', 0x31, 'yes'),
('liveTrafficEnabled', 0x30, 'yes'),
('liveTraf_displayExpandedRecords', 0x30, 'no'),
('liveTraf_ignoreIPs', '', 'yes'),
('liveTraf_ignorePublishers', 0x31, 'yes'),
('liveTraf_ignoreUA', '', 'yes'),
('liveTraf_ignoreUsers', '', 'yes'),
('liveTraf_maxAge', 0x3330, 'yes'),
('liveTraf_maxRows', 0x32303030, 'yes'),
('loginSecurityEnabled', 0x31, 'yes'),
('loginSec_blockAdminReg', 0x31, 'yes'),
('loginSec_breachPasswds', 0x61646d696e73, 'yes'),
('loginSec_breachPasswds_enabled', 0x31, 'yes'),
('loginSec_countFailMins', 0x323430, 'yes'),
('loginSec_disableApplicationPasswords', 0x31, 'yes'),
('loginSec_disableAuthorScan', 0x31, 'yes'),
('loginSec_disableOEmbedAuthor', 0x30, 'yes'),
('loginSec_enableSeparateTwoFactor', '', 'yes'),
('loginSec_lockInvalidUsers', 0x30, 'yes'),
('loginSec_lockoutMins', 0x323430, 'yes'),
('loginSec_maskLoginErrors', 0x31, 'yes'),
('loginSec_maxFailures', 0x3230, 'yes'),
('loginSec_maxForgotPasswd', 0x3230, 'yes'),
('loginSec_requireAdminTwoFactor', 0x30, 'yes'),
('loginSec_strongPasswds', 0x70756273, 'yes'),
('loginSec_strongPasswds_enabled', 0x31, 'yes'),
('loginSec_userBlacklist', '', 'yes'),
('longEncKey', 0x31623663643438613530643832356237663737663736396236656565633961626137613333386436373866333166646339343863346665633561333461656638, 'yes'),
('lowResourceScansEnabled', 0x30, 'yes'),
('manualScanType', 0x6f6e63654461696c79, 'yes'),
('max404Crawlers', 0x44495341424c4544, 'yes'),
('max404Crawlers_action', 0x7468726f74746c65, 'yes'),
('max404Humans', 0x44495341424c4544, 'yes'),
('max404Humans_action', 0x7468726f74746c65, 'yes'),
('maxExecutionTime', 0x30, 'yes'),
('maxGlobalRequests', 0x44495341424c4544, 'yes'),
('maxGlobalRequests_action', 0x7468726f74746c65, 'yes'),
('maxMem', 0x323536, 'yes'),
('maxRequestsCrawlers', 0x44495341424c4544, 'yes'),
('maxRequestsCrawlers_action', 0x7468726f74746c65, 'yes'),
('maxRequestsHumans', 0x44495341424c4544, 'yes'),
('maxRequestsHumans_action', 0x7468726f74746c65, 'yes'),
('migration636_email_summary_excluded_directories', 0x31, 'no'),
('needsNewTour_blocking', 0x31, 'yes'),
('needsNewTour_dashboard', 0x31, 'yes'),
('needsNewTour_firewall', 0x31, 'yes'),
('needsNewTour_livetraffic', 0x31, 'yes'),
('needsNewTour_loginsecurity', 0x31, 'yes'),
('needsNewTour_scan', 0x31, 'yes'),
('needsUpgradeTour_blocking', 0x30, 'yes'),
('needsUpgradeTour_dashboard', 0x30, 'yes'),
('needsUpgradeTour_firewall', 0x30, 'yes'),
('needsUpgradeTour_livetraffic', 0x30, 'yes'),
('needsUpgradeTour_loginsecurity', 0x30, 'yes'),
('needsUpgradeTour_scan', 0x30, 'yes'),
('neverBlockBG', 0x6e65766572426c6f636b5665726966696564, 'yes'),
('notification_blogHighlights', 0x31, 'yes'),
('notification_productUpdates', 0x31, 'yes'),
('notification_promotions', 0x31, 'yes'),
('notification_scanStatus', 0x31, 'yes'),
('notification_securityAlerts', 0x31, 'yes'),
('notification_updatesNeeded', 0x31, 'yes'),
('onboardingAttempt1', 0x736b6970706564, 'yes'),
('onboardingAttempt2', '', 'no'),
('onboardingAttempt3', '', 'no'),
('onboardingAttempt3Initial', 0x30, 'yes'),
('onboardingDelayedAt', 0x30, 'yes'),
('other_blockBadPOST', 0x30, 'yes'),
('other_bypassLitespeedNoabort', 0x30, 'yes'),
('other_hideWPVersion', 0x30, 'yes'),
('other_pwStrengthOnUpdate', 0x31, 'yes'),
('other_scanComments', 0x31, 'yes'),
('other_scanOutside', 0x30, 'yes'),
('other_WFNet', 0x31, 'yes'),
('previousWflogsFileList', 0x5b2247656f4c697465322d436f756e7472792e6d6d6462222c222e6874616363657373222c2274656d706c6174652e706870222c22636f6e6669672d6c6976657761662e706870222c22636f6e6669672d7472616e7369656e742e706870222c22636f6e6669672d73796e6365642e706870222c2261747461636b2d646174612e706870222c22636f6e6669672e706870222c226970732e706870222c2272756c65732e706870225d, 'yes'),
('satisfactionPromptDismissed', 0x30, 'yes'),
('satisfactionPromptInstallDate', 0x31373139393235343137, 'yes'),
('satisfactionPromptOverride', 0x31, 'yes'),
('scansEnabled_checkGSB', 0x31, 'yes'),
('scansEnabled_checkHowGetIPs', 0x31, 'yes'),
('scansEnabled_checkReadableConfig', 0x31, 'yes'),
('scansEnabled_comments', 0x31, 'yes'),
('scansEnabled_core', 0x31, 'yes'),
('scansEnabled_coreUnknown', 0x31, 'yes'),
('scansEnabled_diskSpace', 0x31, 'yes'),
('scansEnabled_fileContents', 0x31, 'yes'),
('scansEnabled_fileContentsGSB', 0x31, 'yes'),
('scansEnabled_geoipSupport', 0x31, 'yes'),
('scansEnabled_highSense', 0x30, 'yes'),
('scansEnabled_malware', 0x31, 'yes'),
('scansEnabled_oldVersions', 0x31, 'yes'),
('scansEnabled_options', 0x31, 'yes'),
('scansEnabled_passwds', 0x31, 'yes'),
('scansEnabled_plugins', 0x30, 'yes'),
('scansEnabled_posts', 0x31, 'yes'),
('scansEnabled_scanImages', 0x30, 'yes'),
('scansEnabled_suspectedFiles', 0x31, 'yes'),
('scansEnabled_suspiciousAdminUsers', 0x31, 'yes'),
('scansEnabled_suspiciousOptions', 0x31, 'yes'),
('scansEnabled_themes', 0x30, 'yes'),
('scansEnabled_wafStatus', 0x31, 'yes'),
('scansEnabled_wpscan_directoryListingEnabled', 0x31, 'yes'),
('scansEnabled_wpscan_fullPathDisclosure', 0x31, 'yes'),
('scanType', 0x7374616e64617264, 'yes'),
('scan_exclude', '', 'yes'),
('scan_force_ipv4_start', 0x30, 'yes'),
('scan_include_extra', '', 'yes'),
('scan_maxDuration', '', 'yes'),
('scan_maxIssues', 0x31303030, 'yes'),
('scan_max_resume_attempts', 0x32, 'yes'),
('schedMode', 0x6175746f, 'yes'),
('schedStartHour', 0x35, 'yes'),
('scheduledScansEnabled', 0x31, 'yes'),
('showAdminBarMenu', 0x31, 'yes'),
('spamvertizeCheck', 0x31, 'yes'),
('ssl_verify', 0x31, 'yes'),
('startScansRemotely', 0x30, 'yes'),
('supportContent', 0x7b7d, 'no'),
('supportHash', '', 'no'),
('timeoffset_wf', 0x3134, 'yes'),
('timeoffset_wf_updated', 0x31373139393235343339, 'yes'),
('totalAlertsSent', 0x31, 'yes'),
('touppBypassNextCheck', 0x30, 'yes'),
('touppPromptNeeded', 0x31, 'yes'),
('vulnerabilities_plugin', 0x613a31343a7b693a303b613a333a7b733a343a22736c7567223b733a31343a22636c61737369632d656469746f72223b733a31313a2266726f6d56657273696f6e223b733a353a22312e362e33223b733a31303a2276756c6e657261626c65223b623a303b7d693a313b613a333a7b733a343a22736c7567223b733a31343a22636f6e746163742d666f726d2d37223b733a31313a2266726f6d56657273696f6e223b733a353a22352e392e36223b733a31303a2276756c6e657261626c65223b623a303b7d693a323b613a333a7b733a343a22736c7567223b733a31323a22656173792d77702d736d7470223b733a31313a2266726f6d56657273696f6e223b733a353a22322e332e31223b733a31303a2276756c6e657261626c65223b623a303b7d693a333b613a333a7b733a343a22736c7567223b733a32323a22676470722d636f6f6b69652d636f6d706c69616e6365223b733a31313a2266726f6d56657273696f6e223b733a363a22342e31352e31223b733a31303a2276756c6e657261626c65223b623a303b7d693a343b613a333a7b733a343a22736c7567223b733a31313a226d61696e74656e616e6365223b733a31313a2266726f6d56657273696f6e223b733a343a22342e3132223b733a31303a2276756c6e657261626c65223b623a303b7d693a353b613a333a7b733a343a22736c7567223b733a31373a226d61736b732d666f726d2d6669656c6473223b733a31313a2266726f6d56657273696f6e223b733a363a22312e31312e31223b733a31303a2276756c6e657261626c65223b623a303b7d693a363b613a333a7b733a343a22736c7567223b733a31373a227265616c6c792d73696d706c652d73736c223b733a31313a2266726f6d56657273696f6e223b733a353a22382e312e35223b733a31303a2276756c6e657261626c65223b623a303b7d693a373b613a333a7b733a343a22736c7567223b733a31313a227265646972656374696f6e223b733a31313a2266726f6d56657273696f6e223b733a353a22352e342e32223b733a31303a2276756c6e657261626c65223b623a303b7d693a383b613a333a7b733a343a22736c7567223b733a383a22736166652d737667223b733a31313a2266726f6d56657273696f6e223b733a353a22322e322e35223b733a31303a2276756c6e657261626c65223b623a303b7d693a393b613a333a7b733a343a22736c7567223b733a363a2273747265616d223b733a31313a2266726f6d56657273696f6e223b733a353a22342e302e30223b733a31303a2276756c6e657261626c65223b623a303b7d693a31303b613a333a7b733a343a22736c7567223b733a393a22776f726466656e6365223b733a31313a2266726f6d56657273696f6e223b733a363a22372e31312e36223b733a31303a2276756c6e657261626c65223b623a303b7d693a31313b613a333a7b733a343a22736c7567223b733a31383a22776f726470726573732d696d706f72746572223b733a31313a2266726f6d56657273696f6e223b733a353a22302e382e32223b733a31303a2276756c6e657261626c65223b623a303b7d693a31323b613a333a7b733a343a22736c7567223b733a31333a22776f726470726573732d73656f223b733a31313a2266726f6d56657273696f6e223b733a343a2232332e30223b733a31303a2276756c6e657261626c65223b623a303b7d693a31333b613a333a7b733a343a22736c7567223b733a32363a22616476616e6365642d637573746f6d2d6669656c64732d70726f223b733a31313a2266726f6d56657273696f6e223b733a353a22362e332e33223b733a31303a2276756c6e657261626c65223b623a303b7d7d, 'no'),
('wafAlertInterval', 0x363030, 'yes'),
('wafAlertOnAttacks', 0x31, 'yes'),
('wafAlertThreshold', 0x313030, 'yes'),
('wafAlertWhitelist', '', 'yes'),
('waf_status', 0x6c6561726e696e672d6d6f6465, 'yes'),
('whitelisted', '', 'yes'),
('whitelistedServices', 0x7b7d, 'yes'),
('whitelistHash', '', 'no'),
('whitelistPresets', 0x7b7d, 'no'),
('wordfenceI18n', 0x31, 'yes'),
('wordpressPluginVersions', 0x613a31343a7b733a32363a22616476616e6365642d637573746f6d2d6669656c64732d70726f223b733a353a22362e332e33223b733a31343a22636c61737369632d656469746f72223b733a353a22312e362e33223b733a31343a22636f6e746163742d666f726d2d37223b733a353a22352e392e36223b733a31323a22656173792d77702d736d7470223b733a353a22322e332e31223b733a32323a22676470722d636f6f6b69652d636f6d706c69616e6365223b733a363a22342e31352e31223b733a31313a226d61696e74656e616e6365223b733a343a22342e3132223b733a31373a226d61736b732d666f726d2d6669656c6473223b733a363a22312e31312e31223b733a31373a227265616c6c792d73696d706c652d73736c223b733a353a22382e312e35223b733a31313a227265646972656374696f6e223b733a353a22352e342e32223b733a383a22736166652d737667223b733a353a22322e322e35223b733a363a2273747265616d223b733a353a22342e302e30223b733a393a22776f726466656e6365223b733a363a22372e31312e36223b733a31383a22776f726470726573732d696d706f72746572223b733a353a22302e382e32223b733a31333a22776f726470726573732d73656f223b733a343a2232332e30223b7d, 'yes'),
('wordpressThemeVersions', 0x613a313a7b733a31313a22626f696c6572706c617465223b733a353a22312e302e30223b7d, 'yes'),
('wordpressVersion', 0x362e342e33, 'yes'),
('wp_home_url', 0x687474703a2f2f6c6f63616c686f7374, 'yes'),
('wp_site_url', 0x687474703a2f2f6c6f63616c686f7374, 'yes');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfcrawlers`
--

CREATE TABLE `wp_wfcrawlers` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `patternSig` binary(16) NOT NULL,
  `status` char(8) NOT NULL,
  `lastUpdate` int UNSIGNED NOT NULL,
  `PTR` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wffilechanges`
--

CREATE TABLE `wp_wffilechanges` (
  `filenameHash` char(64) NOT NULL,
  `file` varchar(1000) NOT NULL,
  `md5` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wffilemods`
--

CREATE TABLE `wp_wffilemods` (
  `filenameMD5` binary(16) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `real_path` text NOT NULL,
  `knownFile` tinyint UNSIGNED NOT NULL,
  `oldMD5` binary(16) NOT NULL,
  `newMD5` binary(16) NOT NULL,
  `SHAC` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `stoppedOnSignature` varchar(255) NOT NULL DEFAULT '',
  `stoppedOnPosition` int UNSIGNED NOT NULL DEFAULT '0',
  `isSafeFile` varchar(1) NOT NULL DEFAULT '?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfhits`
--

CREATE TABLE `wp_wfhits` (
  `id` int UNSIGNED NOT NULL,
  `attackLogTime` double(17,6) UNSIGNED NOT NULL,
  `ctime` double(17,6) UNSIGNED NOT NULL,
  `IP` binary(16) DEFAULT NULL,
  `jsRun` tinyint DEFAULT '0',
  `statusCode` int NOT NULL DEFAULT '200',
  `isGoogle` tinyint NOT NULL,
  `userID` int UNSIGNED NOT NULL,
  `newVisit` tinyint UNSIGNED NOT NULL,
  `URL` text,
  `referer` text,
  `UA` text,
  `action` varchar(64) NOT NULL DEFAULT '',
  `actionDescription` text,
  `actionData` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfhoover`
--

CREATE TABLE `wp_wfhoover` (
  `id` int UNSIGNED NOT NULL,
  `owner` text,
  `host` text,
  `path` text,
  `hostKey` varbinary(124) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfissues`
--

CREATE TABLE `wp_wfissues` (
  `id` int UNSIGNED NOT NULL,
  `time` int UNSIGNED NOT NULL,
  `lastUpdated` int UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint UNSIGNED NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfknownfilelist`
--

CREATE TABLE `wp_wfknownfilelist` (
  `id` int UNSIGNED NOT NULL,
  `path` text NOT NULL,
  `wordpress_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wflivetraffichuman`
--

CREATE TABLE `wp_wflivetraffichuman` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `identifier` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `expiration` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wflocs`
--

CREATE TABLE `wp_wflocs` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ctime` int UNSIGNED NOT NULL,
  `failed` tinyint UNSIGNED NOT NULL,
  `city` varchar(255) DEFAULT '',
  `region` varchar(255) DEFAULT '',
  `countryName` varchar(255) DEFAULT '',
  `countryCode` char(2) DEFAULT '',
  `lat` float(10,7) DEFAULT '0.0000000',
  `lon` float(10,7) DEFAULT '0.0000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wflogins`
--

CREATE TABLE `wp_wflogins` (
  `id` int UNSIGNED NOT NULL,
  `hitID` int DEFAULT NULL,
  `ctime` double(17,6) UNSIGNED NOT NULL,
  `fail` tinyint UNSIGNED NOT NULL,
  `action` varchar(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userID` int UNSIGNED NOT NULL,
  `IP` binary(16) DEFAULT NULL,
  `UA` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfls_2fa_secrets`
--

CREATE TABLE `wp_wfls_2fa_secrets` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `secret` tinyblob NOT NULL,
  `recovery` blob NOT NULL,
  `ctime` int UNSIGNED NOT NULL,
  `vtime` int UNSIGNED NOT NULL,
  `mode` enum('authenticator') NOT NULL DEFAULT 'authenticator'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfls_role_counts`
--

CREATE TABLE `wp_wfls_role_counts` (
  `serialized_roles` varbinary(255) NOT NULL,
  `two_factor_inactive` tinyint(1) NOT NULL,
  `user_count` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfls_settings`
--

CREATE TABLE `wp_wfls_settings` (
  `name` varchar(191) NOT NULL DEFAULT '',
  `value` longblob,
  `autoload` enum('no','yes') NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `wp_wfls_settings`
--

INSERT INTO `wp_wfls_settings` (`name`, `value`, `autoload`) VALUES
('2fa-user-grace-period', 0x3130, 'yes'),
('allow-disabling-ntp', 0x31, 'yes'),
('allow-xml-rpc', 0x31, 'yes'),
('captcha-stats', 0x7b22636f756e7473223a5b302c302c302c302c302c302c302c302c302c302c305d2c22617667223a307d, 'yes'),
('delete-deactivation', '', 'yes'),
('disable-temporary-tables', 0x30, 'yes'),
('enable-auth-captcha', '', 'yes'),
('enable-login-history-columns', 0x31, 'yes'),
('enable-shortcode', '', 'yes'),
('enable-woocommerce-account-integration', '', 'yes'),
('enable-woocommerce-integration', '', 'yes'),
('global-notices', 0x5b5d, 'yes'),
('ip-source', '', 'yes'),
('ip-trusted-proxies', '', 'yes'),
('last-secret-refresh', 0x31373139393235343136, 'yes'),
('recaptcha-threshold', 0x302e35, 'yes'),
('remember-device', '', 'yes'),
('remember-device-duration', 0x32353932303030, 'yes'),
('require-2fa-grace-period-enabled', '', 'yes'),
('require-2fa.administrator', '', 'yes'),
('schema-version', 0x32, 'yes'),
('shared-hash-secret', 0x36623763623935616164353232653834643764353464376238326363326137666439363436616565393463346332313034343032336366383034666438326362, 'yes'),
('shared-symmetric-secret', 0x34336434303338343963336338623165366333306331363932313165346635353636633036353334343062333936313063376332623563306137336332343063, 'yes'),
('stack-ui-columns', 0x31, 'yes'),
('user-count-query-state', 0x30, 'yes'),
('whitelisted', '', 'yes'),
('xmlrpc-enabled', 0x31, 'yes');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfnotifications`
--

CREATE TABLE `wp_wfnotifications` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `new` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `category` varchar(255) NOT NULL,
  `priority` int NOT NULL DEFAULT '1000',
  `ctime` int UNSIGNED NOT NULL,
  `html` text NOT NULL,
  `links` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `wp_wfnotifications`
--

INSERT INTO `wp_wfnotifications` (`id`, `new`, `category`, `priority`, `ctime`, `html`, `links`) VALUES
('site-AEAAAAA', 1, 'wfplugin_updates', 502, 1719925439, '<a href=\"http://localhost/wp-admin/update-core.php\">An update is available for WordPress (v6.5.5)</a>', '[]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfpendingissues`
--

CREATE TABLE `wp_wfpendingissues` (
  `id` int UNSIGNED NOT NULL,
  `time` int UNSIGNED NOT NULL,
  `lastUpdated` int UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint UNSIGNED NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfreversecache`
--

CREATE TABLE `wp_wfreversecache` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `host` varchar(255) NOT NULL,
  `lastUpdate` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfsecurityevents`
--

CREATE TABLE `wp_wfsecurityevents` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `event_time` double(14,4) NOT NULL,
  `state` enum('new','sending','sent') NOT NULL DEFAULT 'new',
  `state_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfsnipcache`
--

CREATE TABLE `wp_wfsnipcache` (
  `id` int UNSIGNED NOT NULL,
  `IP` varchar(45) NOT NULL DEFAULT '',
  `expiration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `body` varchar(255) NOT NULL DEFAULT '',
  `count` int UNSIGNED NOT NULL DEFAULT '0',
  `type` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfstatus`
--

CREATE TABLE `wp_wfstatus` (
  `id` bigint UNSIGNED NOT NULL,
  `ctime` double(17,6) UNSIGNED NOT NULL,
  `level` tinyint UNSIGNED NOT NULL,
  `type` char(5) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wftrafficrates`
--

CREATE TABLE `wp_wftrafficrates` (
  `eMin` int UNSIGNED NOT NULL,
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `hitType` enum('hit','404') NOT NULL DEFAULT 'hit',
  `hits` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_wfwaffailures`
--

CREATE TABLE `wp_wfwaffailures` (
  `id` int UNSIGNED NOT NULL,
  `throwable` text NOT NULL,
  `rule_id` int UNSIGNED DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_yoast_indexable`
--

CREATE TABLE `wp_yoast_indexable` (
  `id` int UNSIGNED NOT NULL,
  `permalink` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `permalink_hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `object_id` bigint DEFAULT NULL,
  `object_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_sub_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `post_parent` bigint DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `breadcrumb_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_protected` tinyint(1) DEFAULT '0',
  `has_public_posts` tinyint(1) DEFAULT NULL,
  `number_of_pages` int UNSIGNED DEFAULT NULL,
  `canonical` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `primary_focus_keyword` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `primary_focus_keyword_score` int DEFAULT NULL,
  `readability_score` int DEFAULT NULL,
  `is_cornerstone` tinyint(1) DEFAULT '0',
  `is_robots_noindex` tinyint(1) DEFAULT '0',
  `is_robots_nofollow` tinyint(1) DEFAULT '0',
  `is_robots_noarchive` tinyint(1) DEFAULT '0',
  `is_robots_noimageindex` tinyint(1) DEFAULT '0',
  `is_robots_nosnippet` tinyint(1) DEFAULT '0',
  `twitter_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `twitter_image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `twitter_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `twitter_image_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `twitter_image_source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `open_graph_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `open_graph_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_image_source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image_meta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `link_count` int DEFAULT NULL,
  `incoming_link_count` int DEFAULT NULL,
  `prominent_words_version` int UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blog_id` bigint NOT NULL DEFAULT '1',
  `language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `region` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_page_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_article_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `has_ancestors` tinyint(1) DEFAULT '0',
  `estimated_reading_time_minutes` int DEFAULT NULL,
  `version` int DEFAULT '1',
  `object_last_modified` datetime DEFAULT NULL,
  `object_published_at` datetime DEFAULT NULL,
  `inclusive_language_score` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_yoast_indexable`
--

INSERT INTO `wp_yoast_indexable` (`id`, `permalink`, `permalink_hash`, `object_id`, `object_type`, `object_sub_type`, `author_id`, `post_parent`, `title`, `description`, `breadcrumb_title`, `post_status`, `is_public`, `is_protected`, `has_public_posts`, `number_of_pages`, `canonical`, `primary_focus_keyword`, `primary_focus_keyword_score`, `readability_score`, `is_cornerstone`, `is_robots_noindex`, `is_robots_nofollow`, `is_robots_noarchive`, `is_robots_noimageindex`, `is_robots_nosnippet`, `twitter_title`, `twitter_image`, `twitter_description`, `twitter_image_id`, `twitter_image_source`, `open_graph_title`, `open_graph_description`, `open_graph_image`, `open_graph_image_id`, `open_graph_image_source`, `open_graph_image_meta`, `link_count`, `incoming_link_count`, `prominent_words_version`, `created_at`, `updated_at`, `blog_id`, `language`, `region`, `schema_page_type`, `schema_article_type`, `has_ancestors`, `estimated_reading_time_minutes`, `version`, `object_last_modified`, `object_published_at`, `inclusive_language_score`) VALUES
(1, 'http://localhost/?page_id=3', '27:009b95274aadaedd534f46b3655d0c8d', 3, 'post', 'page', 1, 0, NULL, NULL, 'Privacy Policy', 'draft', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 22:57:25', '2024-05-22 22:57:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2024-05-13 20:04:14', '2024-05-13 20:04:14', 0),
(2, 'http://localhost/author/admin/', '30:8c5078f795c8038da24197bf3531a134', 1, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'https://1.gravatar.com/avatar/1726e81efd82281a2d10b561ffd5eaad?s=500&d=mm&r=g', NULL, NULL, 'gravatar-image', NULL, NULL, 'https://1.gravatar.com/avatar/1726e81efd82281a2d10b561ffd5eaad?s=500&d=mm&r=g', NULL, 'gravatar-image', NULL, NULL, NULL, NULL, '2024-05-22 22:57:25', '2024-05-22 22:57:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2024-05-13 20:07:33', '2024-05-13 20:04:14', NULL),
(3, 'http://localhost/', '17:c9db569cb388e160e4b86ca1ddff84d7', 2, 'post', 'page', 1, 0, NULL, NULL, 'Sample Page', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-05-22 22:57:25', '2024-07-02 13:02:49', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2024-05-13 20:04:14', '2024-05-13 20:04:14', 0),
(4, 'http://localhost/2024/05/13/hello-world/', '40:21d0d1009f0f1be675be77697662e3c3', 1, 'post', 'post', 1, 0, NULL, NULL, 'Hello world!', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2024-05-22 22:57:25', '2024-05-22 22:57:26', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2024-05-13 20:04:14', '2024-05-13 20:04:14', 0),
(5, 'http://localhost/category/uncategorized/', '40:8aaf49897e51070454a39a8ccdc2908b', 1, 'term', 'category', NULL, NULL, NULL, NULL, 'Uncategorized', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2024-05-22 22:57:25', '2024-05-22 22:57:26', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2024-05-13 20:04:14', '2024-05-13 20:04:14', NULL),
(6, NULL, NULL, NULL, 'system-page', '404', NULL, NULL, 'Page not found %%sep%% %%sitename%%', NULL, 'Error 404: Page not found', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 22:57:25', '2024-05-22 22:57:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL),
(7, NULL, NULL, NULL, 'system-page', 'search-result', NULL, NULL, 'You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 22:57:25', '2024-05-22 22:57:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL),
(8, NULL, NULL, NULL, 'date-archive', NULL, NULL, NULL, '%%date%% %%page%% %%sep%% %%sitename%%', '', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 22:57:25', '2024-05-22 22:57:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL),
(9, 'http://localhost/', '17:c9db569cb388e160e4b86ca1ddff84d7', NULL, 'home-page', NULL, NULL, NULL, '%%sitename%% %%page%% %%sep%% %%sitedesc%%', '', 'Home', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '%%sitename%%', '', '', '0', NULL, NULL, NULL, NULL, NULL, '2024-05-22 22:57:25', '2024-05-22 22:57:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2024-05-13 20:04:14', '2024-05-13 20:04:14', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_yoast_indexable_hierarchy`
--

CREATE TABLE `wp_yoast_indexable_hierarchy` (
  `indexable_id` int UNSIGNED NOT NULL,
  `ancestor_id` int UNSIGNED NOT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `blog_id` bigint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_yoast_indexable_hierarchy`
--

INSERT INTO `wp_yoast_indexable_hierarchy` (`indexable_id`, `ancestor_id`, `depth`, `blog_id`) VALUES
(1, 0, 0, 1),
(3, 0, 0, 1),
(4, 0, 0, 1),
(5, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_yoast_migrations`
--

CREATE TABLE `wp_yoast_migrations` (
  `id` int UNSIGNED NOT NULL,
  `version` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_yoast_migrations`
--

INSERT INTO `wp_yoast_migrations` (`id`, `version`) VALUES
(1, '20171228151840'),
(2, '20171228151841'),
(3, '20190529075038'),
(4, '20191011111109'),
(5, '20200408101900'),
(6, '20200420073606'),
(7, '20200428123747'),
(8, '20200428194858'),
(9, '20200429105310'),
(10, '20200430075614'),
(11, '20200430150130'),
(12, '20200507054848'),
(13, '20200513133401'),
(14, '20200609154515'),
(15, '20200616130143'),
(16, '20200617122511'),
(17, '20200702141921'),
(18, '20200728095334'),
(19, '20201202144329'),
(20, '20201216124002'),
(21, '20201216141134'),
(22, '20210817092415'),
(23, '20211020091404'),
(24, '20230417083836');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_yoast_primary_term`
--

CREATE TABLE `wp_yoast_primary_term` (
  `id` int UNSIGNED NOT NULL,
  `post_id` bigint DEFAULT NULL,
  `term_id` bigint DEFAULT NULL,
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blog_id` bigint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_yoast_seo_links`
--

CREATE TABLE `wp_yoast_seo_links` (
  `id` bigint UNSIGNED NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `target_post_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `indexable_id` int UNSIGNED DEFAULT NULL,
  `target_indexable_id` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `width` int UNSIGNED DEFAULT NULL,
  `size` int UNSIGNED DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `wp_yoast_seo_links`
--

INSERT INTO `wp_yoast_seo_links` (`id`, `url`, `post_id`, `target_post_id`, `type`, `indexable_id`, `target_indexable_id`, `height`, `width`, `size`, `language`, `region`) VALUES
(1, 'http://localhost/wp-admin/', 2, NULL, 'internal', 3, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook_status_scheduled_date_gmt` (`hook`(163),`status`,`scheduled_date_gmt`),
  ADD KEY `status_scheduled_date_gmt` (`status`,`scheduled_date_gmt`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id_status_scheduled_date_gmt` (`claim_id`,`status`,`scheduled_date_gmt`);

--
-- Índices de tabela `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Índices de tabela `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Índices de tabela `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Índices de tabela `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Índices de tabela `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Índices de tabela `wp_easywpsmtp_debug_events`
--
ALTER TABLE `wp_easywpsmtp_debug_events`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wp_easywpsmtp_tasks_meta`
--
ALTER TABLE `wp_easywpsmtp_tasks_meta`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wp_gdpr_cc_options`
--
ALTER TABLE `wp_gdpr_cc_options`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Índices de tabela `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Índices de tabela `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Índices de tabela `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Índices de tabela `wp_stream`
--
ALTER TABLE `wp_stream`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `blog_id` (`blog_id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created` (`created`),
  ADD KEY `connector` (`connector`),
  ADD KEY `context` (`context`),
  ADD KEY `action` (`action`);

--
-- Índices de tabela `wp_stream_meta`
--
ALTER TABLE `wp_stream_meta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `meta_key` (`meta_key`(191)),
  ADD KEY `meta_value` (`meta_value`(191));

--
-- Índices de tabela `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Índices de tabela `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Índices de tabela `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Índices de tabela `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Índices de tabela `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Índices de tabela `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Índices de tabela `wp_wfblockediplog`
--
ALTER TABLE `wp_wfblockediplog`
  ADD PRIMARY KEY (`IP`,`unixday`,`blockType`);

--
-- Índices de tabela `wp_wfblocks7`
--
ALTER TABLE `wp_wfblocks7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `IP` (`IP`),
  ADD KEY `expiration` (`expiration`);

--
-- Índices de tabela `wp_wfconfig`
--
ALTER TABLE `wp_wfconfig`
  ADD PRIMARY KEY (`name`);

--
-- Índices de tabela `wp_wfcrawlers`
--
ALTER TABLE `wp_wfcrawlers`
  ADD PRIMARY KEY (`IP`,`patternSig`);

--
-- Índices de tabela `wp_wffilechanges`
--
ALTER TABLE `wp_wffilechanges`
  ADD PRIMARY KEY (`filenameHash`);

--
-- Índices de tabela `wp_wffilemods`
--
ALTER TABLE `wp_wffilemods`
  ADD PRIMARY KEY (`filenameMD5`);

--
-- Índices de tabela `wp_wfhits`
--
ALTER TABLE `wp_wfhits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k1` (`ctime`),
  ADD KEY `k2` (`IP`,`ctime`),
  ADD KEY `attackLogTime` (`attackLogTime`);

--
-- Índices de tabela `wp_wfhoover`
--
ALTER TABLE `wp_wfhoover`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k2` (`hostKey`);

--
-- Índices de tabela `wp_wfissues`
--
ALTER TABLE `wp_wfissues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastUpdated` (`lastUpdated`),
  ADD KEY `status` (`status`),
  ADD KEY `ignoreP` (`ignoreP`),
  ADD KEY `ignoreC` (`ignoreC`);

--
-- Índices de tabela `wp_wfknownfilelist`
--
ALTER TABLE `wp_wfknownfilelist`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wp_wflivetraffichuman`
--
ALTER TABLE `wp_wflivetraffichuman`
  ADD PRIMARY KEY (`IP`,`identifier`),
  ADD KEY `expiration` (`expiration`);

--
-- Índices de tabela `wp_wflocs`
--
ALTER TABLE `wp_wflocs`
  ADD PRIMARY KEY (`IP`);

--
-- Índices de tabela `wp_wflogins`
--
ALTER TABLE `wp_wflogins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k1` (`IP`,`fail`),
  ADD KEY `hitID` (`hitID`);

--
-- Índices de tabela `wp_wfls_2fa_secrets`
--
ALTER TABLE `wp_wfls_2fa_secrets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `wp_wfls_role_counts`
--
ALTER TABLE `wp_wfls_role_counts`
  ADD PRIMARY KEY (`serialized_roles`,`two_factor_inactive`);

--
-- Índices de tabela `wp_wfls_settings`
--
ALTER TABLE `wp_wfls_settings`
  ADD PRIMARY KEY (`name`);

--
-- Índices de tabela `wp_wfnotifications`
--
ALTER TABLE `wp_wfnotifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wp_wfpendingissues`
--
ALTER TABLE `wp_wfpendingissues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastUpdated` (`lastUpdated`),
  ADD KEY `status` (`status`),
  ADD KEY `ignoreP` (`ignoreP`),
  ADD KEY `ignoreC` (`ignoreC`);

--
-- Índices de tabela `wp_wfreversecache`
--
ALTER TABLE `wp_wfreversecache`
  ADD PRIMARY KEY (`IP`);

--
-- Índices de tabela `wp_wfsecurityevents`
--
ALTER TABLE `wp_wfsecurityevents`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wp_wfsnipcache`
--
ALTER TABLE `wp_wfsnipcache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expiration` (`expiration`),
  ADD KEY `IP` (`IP`),
  ADD KEY `type` (`type`);

--
-- Índices de tabela `wp_wfstatus`
--
ALTER TABLE `wp_wfstatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `k1` (`ctime`),
  ADD KEY `k2` (`type`);

--
-- Índices de tabela `wp_wftrafficrates`
--
ALTER TABLE `wp_wftrafficrates`
  ADD PRIMARY KEY (`eMin`,`IP`,`hitType`);

--
-- Índices de tabela `wp_wfwaffailures`
--
ALTER TABLE `wp_wfwaffailures`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wp_yoast_indexable`
--
ALTER TABLE `wp_yoast_indexable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_type_and_sub_type` (`object_type`,`object_sub_type`),
  ADD KEY `object_id_and_type` (`object_id`,`object_type`),
  ADD KEY `permalink_hash_and_object_type` (`permalink_hash`,`object_type`),
  ADD KEY `subpages` (`post_parent`,`object_type`,`post_status`,`object_id`),
  ADD KEY `prominent_words` (`prominent_words_version`,`object_type`,`object_sub_type`,`post_status`),
  ADD KEY `published_sitemap_index` (`object_published_at`,`is_robots_noindex`,`object_type`,`object_sub_type`);

--
-- Índices de tabela `wp_yoast_indexable_hierarchy`
--
ALTER TABLE `wp_yoast_indexable_hierarchy`
  ADD PRIMARY KEY (`indexable_id`,`ancestor_id`),
  ADD KEY `indexable_id` (`indexable_id`),
  ADD KEY `ancestor_id` (`ancestor_id`),
  ADD KEY `depth` (`depth`);

--
-- Índices de tabela `wp_yoast_migrations`
--
ALTER TABLE `wp_yoast_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wp_yoast_migrations_version` (`version`);

--
-- Índices de tabela `wp_yoast_primary_term`
--
ALTER TABLE `wp_yoast_primary_term`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_taxonomy` (`post_id`,`taxonomy`),
  ADD KEY `post_term` (`post_id`,`term_id`);

--
-- Índices de tabela `wp_yoast_seo_links`
--
ALTER TABLE `wp_yoast_seo_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_direction` (`post_id`,`type`),
  ADD KEY `indexable_link_direction` (`indexable_id`,`type`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  MODIFY `action_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  MODIFY `claim_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de tabela `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  MODIFY `group_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  MODIFY `log_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `wp_easywpsmtp_debug_events`
--
ALTER TABLE `wp_easywpsmtp_debug_events`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `wp_easywpsmtp_tasks_meta`
--
ALTER TABLE `wp_easywpsmtp_tasks_meta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_gdpr_cc_options`
--
ALTER TABLE `wp_gdpr_cc_options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de tabela `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=620;

--
-- AUTO_INCREMENT de tabela `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `wp_stream`
--
ALTER TABLE `wp_stream`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `wp_stream_meta`
--
ALTER TABLE `wp_stream_meta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `wp_wfblocks7`
--
ALTER TABLE `wp_wfblocks7`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfhits`
--
ALTER TABLE `wp_wfhits`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfhoover`
--
ALTER TABLE `wp_wfhoover`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfissues`
--
ALTER TABLE `wp_wfissues`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfknownfilelist`
--
ALTER TABLE `wp_wfknownfilelist`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wflogins`
--
ALTER TABLE `wp_wflogins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfls_2fa_secrets`
--
ALTER TABLE `wp_wfls_2fa_secrets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfpendingissues`
--
ALTER TABLE `wp_wfpendingissues`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfsecurityevents`
--
ALTER TABLE `wp_wfsecurityevents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfsnipcache`
--
ALTER TABLE `wp_wfsnipcache`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfstatus`
--
ALTER TABLE `wp_wfstatus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_wfwaffailures`
--
ALTER TABLE `wp_wfwaffailures`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_yoast_indexable`
--
ALTER TABLE `wp_yoast_indexable`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `wp_yoast_migrations`
--
ALTER TABLE `wp_yoast_migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `wp_yoast_primary_term`
--
ALTER TABLE `wp_yoast_primary_term`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_yoast_seo_links`
--
ALTER TABLE `wp_yoast_seo_links`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;