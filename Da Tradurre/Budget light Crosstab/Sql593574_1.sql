-- phpMyAdmin SQL Dump
-- version 3.4.7.1
-- http://www.phpmyadmin.net
--
-- Host: 62.149.150.169
-- Generato il: Ott 18, 2018 alle 11:47
-- Versione del server: 5.5.61
-- Versione PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Sql593574_1`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `AreaPermissionAssignments`
--

CREATE TABLE IF NOT EXISTS `AreaPermissionAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`arHandle`,`pkID`,`paID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `AreaPermissionBlockTypeAccessList`
--

CREATE TABLE IF NOT EXISTS `AreaPermissionBlockTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `AreaPermissionBlockTypeAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `AreaPermissionBlockTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`btID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Areas`
--

CREATE TABLE IF NOT EXISTS `Areas` (
  `arID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `arOverrideCollectionPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `arInheritPermissionsFromAreaOnCID` int(10) unsigned NOT NULL DEFAULT '0',
  `arIsGlobal` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arID`),
  KEY `arIsGlobal` (`arIsGlobal`),
  KEY `cID` (`cID`),
  KEY `arHandle` (`arHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Dump dei dati per la tabella `Areas`
--

INSERT INTO `Areas` (`arID`, `cID`, `arHandle`, `arOverrideCollectionPermissions`, `arInheritPermissionsFromAreaOnCID`, `arIsGlobal`) VALUES
(1, 105, 'Header', 0, 0, 0),
(2, 105, 'Column 1', 0, 0, 0),
(3, 105, 'Column 2', 0, 0, 0),
(4, 105, 'Column 3', 0, 0, 0),
(5, 105, 'Column 4', 0, 0, 0),
(6, 104, 'Primary', 0, 0, 0),
(7, 104, 'Secondary 1', 0, 0, 0),
(8, 104, 'Secondary 2', 0, 0, 0),
(9, 104, 'Secondary 3', 0, 0, 0),
(10, 104, 'Secondary 4', 0, 0, 0),
(11, 104, 'Secondary 5', 0, 0, 0),
(12, 120, 'Main', 0, 0, 0),
(13, 121, 'Main', 0, 0, 0),
(14, 122, 'Main', 0, 0, 0),
(15, 123, 'Main', 0, 0, 0),
(16, 123, 'Sidebar', 0, 0, 0),
(17, 123, 'Thumbnail Image', 0, 0, 0),
(18, 123, 'Header Image', 0, 0, 0),
(19, 124, 'Header Image', 0, 0, 0),
(20, 125, 'Header Image', 0, 0, 0),
(21, 126, 'Header Image', 0, 0, 0),
(22, 1, 'Header', 0, 0, 0),
(23, 1, 'Sidebar', 0, 0, 0),
(24, 1, 'Main', 0, 0, 0),
(25, 1, 'Header Image', 0, 0, 0),
(26, 127, 'Header', 0, 0, 0),
(27, 127, 'Sidebar', 0, 0, 0),
(28, 127, 'Main', 0, 0, 0),
(29, 127, 'Header Image', 0, 0, 0),
(30, 131, 'Header', 0, 0, 0),
(31, 131, 'Sidebar', 0, 0, 0),
(32, 131, 'Main', 0, 0, 0),
(33, 131, 'Header Image', 0, 0, 0),
(34, 130, 'Header', 0, 0, 0),
(35, 130, 'Sidebar', 0, 0, 0),
(36, 130, 'Main', 0, 0, 0),
(37, 130, 'Header Image', 0, 0, 0),
(38, 129, 'Header', 0, 0, 0),
(39, 129, 'Sidebar', 0, 0, 0),
(40, 129, 'Main', 0, 0, 0),
(41, 129, 'Header Image', 0, 0, 0),
(42, 128, 'Main', 0, 0, 0),
(43, 128, 'Sidebar', 0, 0, 0),
(44, 128, 'Header Image', 0, 0, 0),
(45, 133, 'Header Image', 0, 0, 0),
(46, 133, 'Main', 0, 0, 0),
(47, 133, 'Thumbnail Image', 0, 0, 0),
(48, 133, 'Sidebar', 0, 0, 0),
(49, 132, 'Main', 0, 0, 0),
(50, 132, 'Sidebar', 0, 0, 0),
(51, 132, 'Header Image', 0, 0, 0),
(52, 1, 'Site Name', 0, 0, 1),
(53, 1, 'Header Nav', 0, 0, 0),
(54, 1, 'Search Site', 0, 0, 0),
(55, 1, 'Footer', 0, 0, 0),
(56, 134, 'Main', 0, 0, 0),
(57, 134, 'Sidebar', 0, 0, 0),
(58, 134, 'Thumbnail Image', 0, 0, 0),
(59, 134, 'Header Image', 0, 0, 0),
(60, 128, 'Header Nav', 0, 0, 0),
(61, 128, 'Header', 0, 0, 0),
(62, 128, 'Search Site', 0, 0, 0),
(63, 128, 'Footer', 0, 0, 0),
(64, 132, 'Header Nav', 0, 0, 0),
(65, 132, 'Header', 0, 0, 0),
(66, 132, 'Search Site', 0, 0, 0),
(67, 132, 'Footer', 0, 0, 0),
(68, 134, 'Header Nav', 0, 0, 0),
(69, 134, 'Header', 0, 0, 0),
(70, 134, 'Search Site', 0, 0, 0),
(71, 134, 'Blog Post Header', 0, 0, 0),
(72, 134, 'Blog Post More', 0, 0, 0),
(73, 134, 'Blog Post Footer', 0, 0, 0),
(74, 134, 'Footer', 0, 0, 0),
(75, 127, 'Header Nav', 0, 0, 0),
(76, 127, 'Search Site', 0, 0, 0),
(77, 127, 'Footer', 0, 0, 0),
(78, 133, 'Header Nav', 0, 0, 0),
(79, 133, 'Header', 0, 0, 0),
(80, 133, 'Search Site', 0, 0, 0),
(81, 133, 'Blog Post Header', 0, 0, 0),
(82, 133, 'Blog Post More', 0, 0, 0),
(83, 133, 'Blog Post Footer', 0, 0, 0),
(84, 133, 'Footer', 0, 0, 0),
(85, 129, 'Header Nav', 0, 0, 0),
(86, 129, 'Search Site', 0, 0, 0),
(87, 129, 'Footer', 0, 0, 0),
(88, 131, 'Header Nav', 0, 0, 0),
(89, 131, 'Search Site', 0, 0, 0),
(90, 131, 'Footer', 0, 0, 0),
(91, 130, 'Header Nav', 0, 0, 0),
(92, 130, 'Search Site', 0, 0, 0),
(93, 130, 'Footer', 0, 0, 0),
(94, 116, 'Main', 0, 0, 0),
(96, 137, 'Main', 0, 0, 0),
(97, 138, 'Header Image', 0, 0, 0),
(98, 139, 'Header Image', 0, 0, 0),
(99, 139, 'Main', 0, 0, 0),
(100, 139, 'Footer', 0, 0, 0),
(101, 140, 'Header Image', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `atAddress`
--

CREATE TABLE IF NOT EXISTS `atAddress` (
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `country` varchar(4) DEFAULT NULL,
  `postal_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `atAddressCustomCountries`
--

CREATE TABLE IF NOT EXISTS `atAddressCustomCountries` (
  `atAddressCustomCountryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `country` varchar(5) NOT NULL,
  PRIMARY KEY (`atAddressCustomCountryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `atAddressSettings`
--

CREATE TABLE IF NOT EXISTS `atAddressSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akHasCustomCountries` int(1) NOT NULL DEFAULT '0',
  `akDefaultCountry` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `atBoolean`
--

CREATE TABLE IF NOT EXISTS `atBoolean` (
  `avID` int(10) unsigned NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `atBoolean`
--

INSERT INTO `atBoolean` (`avID`, `value`) VALUES
(20, 1),
(31, 1),
(34, 1),
(64, 1),
(65, 1),
(68, 1),
(69, 1),
(75, 1),
(107, 1),
(116, 1),
(117, 1),
(118, 1),
(137, 1),
(138, 1),
(139, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `atBooleanSettings`
--

CREATE TABLE IF NOT EXISTS `atBooleanSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akCheckedByDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `atBooleanSettings`
--

INSERT INTO `atBooleanSettings` (`akID`, `akCheckedByDefault`) VALUES
(5, 0),
(6, 0),
(8, 0),
(9, 0),
(10, 1),
(11, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `atDateTime`
--

CREATE TABLE IF NOT EXISTS `atDateTime` (
  `avID` int(10) unsigned NOT NULL,
  `value` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `atDateTimeSettings`
--

CREATE TABLE IF NOT EXISTS `atDateTimeSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akDateDisplayMode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `atDefault`
--

CREATE TABLE IF NOT EXISTS `atDefault` (
  `avID` int(10) unsigned NOT NULL,
  `value` longtext,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `atDefault`
--

INSERT INTO `atDefault` (`avID`, `value`) VALUES
(1, 'blog, blogging'),
(2, 'icon-book'),
(3, 'new blog, write blog, blogging'),
(4, 'icon-pencil'),
(5, 'blog drafts,composer'),
(6, 'icon-book'),
(7, 'pages, add page, delete page, copy, move, alias'),
(8, 'pages, add page, delete page, copy, move, alias'),
(9, 'icon-home'),
(10, 'pages, add page, delete page, copy, move, alias, bulk'),
(11, 'icon-road'),
(12, 'find page, search page, search, find, pages, sitemap'),
(13, 'icon-search'),
(14, 'add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute'),
(15, 'icon-picture'),
(16, 'file, file attributes, title, attribute, description, rename'),
(17, 'icon-cog'),
(18, 'files, category, categories'),
(19, 'icon-list-alt'),
(21, 'new file set'),
(22, 'icon-plus-sign'),
(23, 'users, groups, people, find, delete user, remove user, change password, password'),
(24, 'find, search, people, delete user, remove user, change password, password'),
(25, 'icon-user'),
(26, 'user, group, people, permissions, access, expire'),
(27, 'icon-globe'),
(28, 'user attributes, user data, gather data, registration data'),
(29, 'icon-cog'),
(30, 'new user, create'),
(32, 'icon-plus-sign'),
(33, 'new user group, new group, group, create'),
(35, 'icon-plus'),
(36, 'group set'),
(37, 'icon-list'),
(38, 'forms, log, error, email, mysql, exception, survey'),
(39, 'hits, pageviews, visitors, activity'),
(40, 'icon-signal'),
(41, 'forms, questions, response, data'),
(42, 'icon-briefcase'),
(43, 'questions, quiz, response'),
(44, 'icon-tasks'),
(45, 'forms, log, error, email, mysql, exception, survey, history'),
(46, 'icon-time'),
(47, 'new theme, theme, active theme, change theme, template, css'),
(48, 'icon-font'),
(49, 'theme'),
(50, 'page types'),
(51, 'custom theme, change theme, custom css, css'),
(52, 'page type defaults, global block, global area, starter, template'),
(53, 'icon-file'),
(54, 'page attributes, custom'),
(55, 'icon-cog'),
(56, 'single, page, custom, application'),
(57, 'icon-wrench'),
(58, 'add workflow, remove workflow'),
(59, 'icon-list'),
(60, 'icon-user'),
(61, 'stacks, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo'),
(62, 'icon-th'),
(63, 'icon-lock'),
(66, 'block, refresh, custom'),
(67, 'icon-wrench'),
(70, 'add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks'),
(71, 'update, upgrade'),
(72, 'concrete5.org, my account, marketplace'),
(73, 'buy theme, new theme, marketplace, template'),
(74, 'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace'),
(76, 'website name, title'),
(77, 'logo, favicon, iphone, icon, bookmark'),
(78, 'tinymce, content block, fonts, editor, tinymce, content, overlay'),
(79, 'translate, translation, internationalization, multilingual, translate'),
(80, 'timezone, profile, locale'),
(81, 'interface, quick nav, dashboard background, background image'),
(82, 'vanity, pretty url, seo, pageview, view'),
(83, 'bulk, seo, change keywords, engine, optimization, search'),
(84, 'traffic, statistics, google analytics, quant, pageviews, hits'),
(85, 'turn off statistics, tracking, statistics, pageviews, hits'),
(86, 'configure search, site search, search option'),
(87, 'cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching'),
(88, 'cache option, turn off cache, no cache, page cache, caching'),
(89, 'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old'),
(90, 'editors, hide site, offline, private, public, access'),
(91, 'file options, file manager, upload, modify'),
(92, 'security, files, media, extension, manager, upload'),
(93, 'security, actions, administrator, admin, package, marketplace, search'),
(94, 'security, lock ip, lock out, block ip, address, restrict, access'),
(95, 'security, registration'),
(96, 'antispam, block spam, security'),
(97, 'lock site, under construction, hide, hidden'),
(98, 'profile, login, redirect, specific, dashboard, administrators'),
(99, 'member profile, member page,community, forums, social, avatar'),
(100, 'signup, new user, community'),
(101, 'smtp, mail settings'),
(102, 'email server, mail settings, mail configuration, external, internal'),
(103, 'email server, mail settings, mail configuration, private message, message system, import, email, message'),
(104, 'attribute configuration'),
(105, 'attributes, sets'),
(106, 'attributes, types'),
(108, 'overrides, system info, debug, support,help'),
(109, 'errors,exceptions, develop, support, help'),
(110, 'email, logging, logs, smtp, pop, errors, mysql, errors, log'),
(111, 'security, alternate storage, hide files'),
(112, 'network, proxy server'),
(113, 'export, backup, database, sql, mysql, encryption, restore'),
(114, 'upgrade, new version, update'),
(115, 'export, database, xml, starting, points, schema, refresh, custom, tables');

-- --------------------------------------------------------

--
-- Struttura della tabella `atFile`
--

CREATE TABLE IF NOT EXISTS `atFile` (
  `avID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `atNumber`
--

CREATE TABLE IF NOT EXISTS `atNumber` (
  `avID` int(10) unsigned NOT NULL,
  `value` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `atNumber`
--

INSERT INTO `atNumber` (`avID`, `value`) VALUES
(119, '960.0000'),
(120, '212.0000'),
(121, '960.0000'),
(122, '212.0000'),
(123, '960.0000'),
(124, '212.0000'),
(125, '960.0000'),
(126, '212.0000'),
(127, '960.0000'),
(128, '212.0000'),
(129, '960.0000'),
(130, '212.0000'),
(131, '960.0000'),
(132, '212.0000'),
(133, '150.0000'),
(134, '150.0000'),
(141, '32.0000'),
(142, '32.0000'),
(143, '32.0000'),
(144, '32.0000'),
(145, '32.0000'),
(146, '32.0000'),
(147, '32.0000'),
(148, '32.0000'),
(149, '2048.0000'),
(150, '1250.0000');

-- --------------------------------------------------------

--
-- Struttura della tabella `atSelectOptions`
--

CREATE TABLE IF NOT EXISTS `atSelectOptions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `displayOrder` int(10) unsigned DEFAULT NULL,
  `isEndUserAdded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `atSelectOptions`
--

INSERT INTO `atSelectOptions` (`ID`, `akID`, `value`, `displayOrder`, `isEndUserAdded`) VALUES
(1, 14, 'composer', 0, 1),
(2, 14, 'hello', 1, 1),
(3, 14, 'world', 2, 1),
(4, 14, 'first post', 3, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `atSelectOptionsSelected`
--

CREATE TABLE IF NOT EXISTS `atSelectOptionsSelected` (
  `avID` int(10) unsigned NOT NULL,
  `atSelectOptionID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`,`atSelectOptionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `atSelectOptionsSelected`
--

INSERT INTO `atSelectOptionsSelected` (`avID`, `atSelectOptionID`) VALUES
(136, 1),
(136, 2),
(136, 3),
(136, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `atSelectSettings`
--

CREATE TABLE IF NOT EXISTS `atSelectSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akSelectAllowMultipleValues` tinyint(1) NOT NULL DEFAULT '0',
  `akSelectOptionDisplayOrder` varchar(255) NOT NULL DEFAULT 'display_asc',
  `akSelectAllowOtherValues` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `atSelectSettings`
--

INSERT INTO `atSelectSettings` (`akID`, `akSelectAllowMultipleValues`, `akSelectOptionDisplayOrder`, `akSelectAllowOtherValues`) VALUES
(14, 1, 'display_asc', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `atTextareaSettings`
--

CREATE TABLE IF NOT EXISTS `atTextareaSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akTextareaDisplayMode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `atTextareaSettings`
--

INSERT INTO `atTextareaSettings` (`akID`, `akTextareaDisplayMode`) VALUES
(2, ''),
(3, ''),
(4, ''),
(7, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `AttributeKeyCategories`
--

CREATE TABLE IF NOT EXISTS `AttributeKeyCategories` (
  `akCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akCategoryHandle` varchar(255) NOT NULL,
  `akCategoryAllowSets` smallint(4) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akCategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `AttributeKeyCategories`
--

INSERT INTO `AttributeKeyCategories` (`akCategoryID`, `akCategoryHandle`, `akCategoryAllowSets`, `pkgID`) VALUES
(1, 'collection', 1, NULL),
(2, 'user', 1, NULL),
(3, 'file', 1, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `AttributeKeys`
--

CREATE TABLE IF NOT EXISTS `AttributeKeys` (
  `akID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akHandle` varchar(255) NOT NULL,
  `akName` varchar(255) NOT NULL,
  `akIsSearchable` tinyint(1) NOT NULL DEFAULT '0',
  `akIsSearchableIndexed` tinyint(1) NOT NULL DEFAULT '0',
  `akIsAutoCreated` tinyint(1) NOT NULL DEFAULT '0',
  `akIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `akIsColumnHeader` tinyint(1) NOT NULL DEFAULT '0',
  `akIsEditable` tinyint(1) NOT NULL DEFAULT '0',
  `atID` int(10) unsigned DEFAULT NULL,
  `akCategoryID` int(10) unsigned DEFAULT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akID`),
  UNIQUE KEY `akHandle` (`akHandle`,`akCategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dump dei dati per la tabella `AttributeKeys`
--

INSERT INTO `AttributeKeys` (`akID`, `akHandle`, `akName`, `akIsSearchable`, `akIsSearchableIndexed`, `akIsAutoCreated`, `akIsInternal`, `akIsColumnHeader`, `akIsEditable`, `atID`, `akCategoryID`, `pkgID`) VALUES
(1, 'meta_title', 'Meta Title', 1, 1, 0, 0, 0, 1, 1, 1, 0),
(2, 'meta_description', 'Meta Description', 1, 1, 0, 0, 0, 1, 2, 1, 0),
(3, 'meta_keywords', 'Meta Keywords', 1, 1, 0, 0, 0, 1, 2, 1, 0),
(4, 'icon_dashboard', 'Dashboard Icon', 1, 1, 0, 1, 0, 1, 2, 1, 0),
(5, 'exclude_nav', 'Exclude From Nav', 1, 1, 0, 0, 0, 1, 3, 1, 0),
(6, 'exclude_page_list', 'Exclude From Page List', 1, 1, 0, 0, 0, 1, 3, 1, 0),
(7, 'header_extra_content', 'Header Extra Content', 1, 1, 0, 0, 0, 1, 2, 1, 0),
(8, 'exclude_search_index', 'Exclude From Search Index', 1, 1, 0, 0, 0, 1, 3, 1, 0),
(9, 'exclude_sitemapxml', 'Exclude From sitemap.xml', 1, 1, 0, 0, 0, 1, 3, 1, 0),
(10, 'profile_private_messages_enabled', 'I would like to receive private messages.', 1, 1, 0, 0, 0, 1, 3, 2, 0),
(11, 'profile_private_messages_notification_enabled', 'Send me email notifications when I receive a private message.', 1, 1, 0, 0, 0, 1, 3, 2, 0),
(12, 'width', 'Width', 1, 1, 0, 0, 0, 1, 6, 3, 0),
(13, 'height', 'Height', 1, 1, 0, 0, 0, 1, 6, 3, 0),
(14, 'tags', 'Tags', 1, 1, 0, 0, 0, 1, 8, 1, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `AttributeSetKeys`
--

CREATE TABLE IF NOT EXISTS `AttributeSetKeys` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `asID` int(10) unsigned NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`,`asID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `AttributeSetKeys`
--

INSERT INTO `AttributeSetKeys` (`akID`, `asID`, `displayOrder`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(7, 1, 4),
(5, 2, 1),
(6, 2, 2),
(8, 2, 3),
(9, 2, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `AttributeSets`
--

CREATE TABLE IF NOT EXISTS `AttributeSets` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asName` varchar(255) DEFAULT NULL,
  `asHandle` varchar(255) NOT NULL,
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `asIsLocked` int(1) NOT NULL DEFAULT '1',
  `asDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`asID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `AttributeSets`
--

INSERT INTO `AttributeSets` (`asID`, `asName`, `asHandle`, `akCategoryID`, `pkgID`, `asIsLocked`, `asDisplayOrder`) VALUES
(1, 'Page Header', 'page_header', 1, 0, 0, 0),
(2, 'Navigation and Indexing', 'navigation', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `AttributeTypeCategories`
--

CREATE TABLE IF NOT EXISTS `AttributeTypeCategories` (
  `atID` int(10) unsigned NOT NULL DEFAULT '0',
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`atID`,`akCategoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `AttributeTypeCategories`
--

INSERT INTO `AttributeTypeCategories` (`atID`, `akCategoryID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `AttributeTypes`
--

CREATE TABLE IF NOT EXISTS `AttributeTypes` (
  `atID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `atHandle` varchar(255) NOT NULL,
  `atName` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`atID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `AttributeTypes`
--

INSERT INTO `AttributeTypes` (`atID`, `atHandle`, `atName`, `pkgID`) VALUES
(1, 'text', 'Text', 0),
(2, 'textarea', 'Text Area', 0),
(3, 'boolean', 'Checkbox', 0),
(4, 'date_time', 'Date/Time', 0),
(5, 'image_file', 'Image/File', 0),
(6, 'number', 'Number', 0),
(7, 'rating', 'Rating', 0),
(8, 'select', 'Select', 0),
(9, 'address', 'Address', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `AttributeValues`
--

CREATE TABLE IF NOT EXISTS `AttributeValues` (
  `avID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `avDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uID` int(10) unsigned DEFAULT NULL,
  `atID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=151 ;

--
-- Dump dei dati per la tabella `AttributeValues`
--

INSERT INTO `AttributeValues` (`avID`, `akID`, `avDateAdded`, `uID`, `atID`) VALUES
(1, 3, '2012-11-22 16:12:21', 1, 2),
(2, 4, '2012-11-22 16:12:21', 1, 2),
(3, 3, '2012-11-22 16:12:21', 1, 2),
(4, 4, '2012-11-22 16:12:21', 1, 2),
(5, 3, '2012-11-22 16:12:21', 1, 2),
(6, 4, '2012-11-22 16:12:21', 1, 2),
(7, 3, '2012-11-22 16:12:21', 1, 2),
(8, 3, '2012-11-22 16:12:21', 1, 2),
(9, 4, '2012-11-22 16:12:21', 1, 2),
(10, 3, '2012-11-22 16:12:21', 1, 2),
(11, 4, '2012-11-22 16:12:21', 1, 2),
(12, 3, '2012-11-22 16:12:21', 1, 2),
(13, 4, '2012-11-22 16:12:21', 1, 2),
(14, 3, '2012-11-22 16:12:21', 1, 2),
(15, 4, '2012-11-22 16:12:21', 1, 2),
(16, 3, '2012-11-22 16:12:21', 1, 2),
(17, 4, '2012-11-22 16:12:21', 1, 2),
(18, 3, '2012-11-22 16:12:21', 1, 2),
(19, 4, '2012-11-22 16:12:21', 1, 2),
(20, 5, '2012-11-22 16:12:21', 1, 3),
(21, 3, '2012-11-22 16:12:21', 1, 2),
(22, 4, '2012-11-22 16:12:21', 1, 2),
(23, 3, '2012-11-22 16:12:21', 1, 2),
(24, 3, '2012-11-22 16:12:21', 1, 2),
(25, 4, '2012-11-22 16:12:21', 1, 2),
(26, 3, '2012-11-22 16:12:21', 1, 2),
(27, 4, '2012-11-22 16:12:21', 1, 2),
(28, 3, '2012-11-22 16:12:21', 1, 2),
(29, 4, '2012-11-22 16:12:21', 1, 2),
(30, 3, '2012-11-22 16:12:21', 1, 2),
(31, 5, '2012-11-22 16:12:21', 1, 3),
(32, 4, '2012-11-22 16:12:21', 1, 2),
(33, 3, '2012-11-22 16:12:21', 1, 2),
(34, 5, '2012-11-22 16:12:21', 1, 3),
(35, 4, '2012-11-22 16:12:21', 1, 2),
(36, 3, '2012-11-22 16:12:21', 1, 2),
(37, 4, '2012-11-22 16:12:21', 1, 2),
(38, 3, '2012-11-22 16:12:21', 1, 2),
(39, 3, '2012-11-22 16:12:21', 1, 2),
(40, 4, '2012-11-22 16:12:21', 1, 2),
(41, 3, '2012-11-22 16:12:21', 1, 2),
(42, 4, '2012-11-22 16:12:21', 1, 2),
(43, 3, '2012-11-22 16:12:21', 1, 2),
(44, 4, '2012-11-22 16:12:22', 1, 2),
(45, 3, '2012-11-22 16:12:22', 1, 2),
(46, 4, '2012-11-22 16:12:22', 1, 2),
(47, 3, '2012-11-22 16:12:22', 1, 2),
(48, 4, '2012-11-22 16:12:22', 1, 2),
(49, 3, '2012-11-22 16:12:22', 1, 2),
(50, 3, '2012-11-22 16:12:22', 1, 2),
(51, 3, '2012-11-22 16:12:22', 1, 2),
(52, 3, '2012-11-22 16:12:22', 1, 2),
(53, 4, '2012-11-22 16:12:22', 1, 2),
(54, 3, '2012-11-22 16:12:22', 1, 2),
(55, 4, '2012-11-22 16:12:22', 1, 2),
(56, 3, '2012-11-22 16:12:22', 1, 2),
(57, 4, '2012-11-22 16:12:22', 1, 2),
(58, 3, '2012-11-22 16:12:22', 1, 2),
(59, 4, '2012-11-22 16:12:22', 1, 2),
(60, 4, '2012-11-22 16:12:22', 1, 2),
(61, 3, '2012-11-22 16:12:22', 1, 2),
(62, 4, '2012-11-22 16:12:22', 1, 2),
(63, 4, '2012-11-22 16:12:22', 1, 2),
(64, 5, '2012-11-22 16:12:22', 1, 3),
(65, 8, '2012-11-22 16:12:22', 1, 3),
(66, 3, '2012-11-22 16:12:22', 1, 2),
(67, 4, '2012-11-22 16:12:22', 1, 2),
(68, 5, '2012-11-22 16:12:22', 1, 3),
(69, 5, '2012-11-22 16:12:22', 1, 3),
(70, 3, '2012-11-22 16:12:22', 1, 2),
(71, 3, '2012-11-22 16:12:22', 1, 2),
(72, 3, '2012-11-22 16:12:22', 1, 2),
(73, 3, '2012-11-22 16:12:22', 1, 2),
(74, 3, '2012-11-22 16:12:22', 1, 2),
(75, 5, '2012-11-22 16:12:22', 1, 3),
(76, 3, '2012-11-22 16:12:22', 1, 2),
(77, 3, '2012-11-22 16:12:22', 1, 2),
(78, 3, '2012-11-22 16:12:22', 1, 2),
(79, 3, '2012-11-22 16:12:22', 1, 2),
(80, 3, '2012-11-22 16:12:22', 1, 2),
(81, 3, '2012-11-22 16:12:22', 1, 2),
(82, 3, '2012-11-22 16:12:22', 1, 2),
(83, 3, '2012-11-22 16:12:22', 1, 2),
(84, 3, '2012-11-22 16:12:22', 1, 2),
(85, 3, '2012-11-22 16:12:22', 1, 2),
(86, 3, '2012-11-22 16:12:22', 1, 2),
(87, 3, '2012-11-22 16:12:22', 1, 2),
(88, 3, '2012-11-22 16:12:22', 1, 2),
(89, 3, '2012-11-22 16:12:22', 1, 2),
(90, 3, '2012-11-22 16:12:22', 1, 2),
(91, 3, '2012-11-22 16:12:22', 1, 2),
(92, 3, '2012-11-22 16:12:22', 1, 2),
(93, 3, '2012-11-22 16:12:22', 1, 2),
(94, 3, '2012-11-22 16:12:22', 1, 2),
(95, 3, '2012-11-22 16:12:22', 1, 2),
(96, 3, '2012-11-22 16:12:22', 1, 2),
(97, 3, '2012-11-22 16:12:22', 1, 2),
(98, 3, '2012-11-22 16:12:22', 1, 2),
(99, 3, '2012-11-22 16:12:22', 1, 2),
(100, 3, '2012-11-22 16:12:22', 1, 2),
(101, 3, '2012-11-22 16:12:22', 1, 2),
(102, 3, '2012-11-22 16:12:22', 1, 2),
(103, 3, '2012-11-22 16:12:22', 1, 2),
(104, 3, '2012-11-22 16:12:23', 1, 2),
(105, 3, '2012-11-22 16:12:23', 1, 2),
(106, 3, '2012-11-22 16:12:23', 1, 2),
(107, 8, '2012-11-22 16:12:23', 1, 3),
(108, 3, '2012-11-22 16:12:23', 1, 2),
(109, 3, '2012-11-22 16:12:23', 1, 2),
(110, 3, '2012-11-22 16:12:23', 1, 2),
(111, 3, '2012-11-22 16:12:23', 1, 2),
(112, 3, '2012-11-22 16:12:23', 1, 2),
(113, 3, '2012-11-22 16:12:23', 1, 2),
(114, 3, '2012-11-22 16:12:23', 1, 2),
(115, 3, '2012-11-22 16:12:23', 1, 2),
(116, 5, '2012-11-22 16:12:23', 1, 3),
(117, 5, '2012-11-22 16:12:23', 1, 3),
(118, 8, '2012-11-22 16:12:23', 1, 3),
(119, 12, '2012-11-22 16:12:25', 1, 6),
(120, 13, '2012-11-22 16:12:25', 1, 6),
(121, 12, '2012-11-22 16:12:25', 1, 6),
(122, 13, '2012-11-22 16:12:25', 1, 6),
(123, 12, '2012-11-22 16:12:25', 1, 6),
(124, 13, '2012-11-22 16:12:25', 1, 6),
(125, 12, '2012-11-22 16:12:25', 1, 6),
(126, 13, '2012-11-22 16:12:25', 1, 6),
(127, 12, '2012-11-22 16:12:25', 1, 6),
(128, 13, '2012-11-22 16:12:25', 1, 6),
(129, 12, '2012-11-22 16:12:25', 1, 6),
(130, 13, '2012-11-22 16:12:25', 1, 6),
(131, 12, '2012-11-22 16:12:26', 1, 6),
(132, 13, '2012-11-22 16:12:26', 1, 6),
(133, 12, '2012-11-22 16:12:26', 1, 6),
(134, 13, '2012-11-22 16:12:26', 1, 6),
(135, 14, '2012-11-22 16:12:27', 1, 8),
(136, 14, '2012-11-22 16:12:27', 1, 8),
(137, 5, '2012-11-22 16:12:28', 1, 3),
(138, 6, '2012-11-22 16:12:28', 1, 3),
(139, 8, '2012-11-22 16:12:28', 1, 3),
(140, 14, '2012-11-22 16:12:28', 1, 8),
(141, 12, '2013-05-25 11:04:47', 1, 6),
(142, 13, '2013-05-25 11:04:47', 1, 6),
(143, 12, '2013-05-25 11:04:47', 1, 6),
(144, 13, '2013-05-25 11:04:47', 1, 6),
(145, 12, '2013-05-25 11:04:48', 1, 6),
(146, 13, '2013-05-25 11:04:48', 1, 6),
(147, 12, '2013-05-25 11:04:49', 1, 6),
(148, 13, '2013-05-25 11:04:49', 1, 6),
(149, 12, '2013-06-09 10:01:26', 1, 6),
(150, 13, '2013-06-09 10:01:26', 1, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `BasicWorkflowPermissionAssignments`
--

CREATE TABLE IF NOT EXISTS `BasicWorkflowPermissionAssignments` (
  `wfID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wfID`,`pkID`,`paID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `BasicWorkflowProgressData`
--

CREATE TABLE IF NOT EXISTS `BasicWorkflowProgressData` (
  `wpID` int(10) unsigned NOT NULL DEFAULT '0',
  `uIDStarted` int(10) unsigned NOT NULL DEFAULT '0',
  `uIDCompleted` int(10) unsigned NOT NULL DEFAULT '0',
  `wpDateCompleted` datetime DEFAULT NULL,
  PRIMARY KEY (`wpID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `BlockPermissionAssignments`
--

CREATE TABLE IF NOT EXISTS `BlockPermissionAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`pkID`,`paID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `BlockRelations`
--

CREATE TABLE IF NOT EXISTS `BlockRelations` (
  `brID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `originalBID` int(10) unsigned NOT NULL DEFAULT '0',
  `relationType` varchar(50) NOT NULL,
  PRIMARY KEY (`brID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dump dei dati per la tabella `BlockRelations`
--

INSERT INTO `BlockRelations` (`brID`, `bID`, `originalBID`, `relationType`) VALUES
(1, 53, 24, 'DUPLICATE'),
(2, 54, 27, 'DUPLICATE'),
(3, 56, 53, 'DUPLICATE'),
(4, 57, 54, 'DUPLICATE'),
(5, 58, 57, 'DUPLICATE'),
(6, 60, 56, 'DUPLICATE'),
(7, 61, 26, 'DUPLICATE'),
(8, 62, 58, 'DUPLICATE'),
(9, 63, 62, 'DUPLICATE'),
(10, 64, 63, 'DUPLICATE'),
(11, 65, 64, 'DUPLICATE'),
(12, 66, 65, 'DUPLICATE'),
(13, 67, 66, 'DUPLICATE'),
(14, 68, 67, 'DUPLICATE'),
(15, 69, 68, 'DUPLICATE'),
(16, 70, 69, 'DUPLICATE'),
(17, 71, 70, 'DUPLICATE'),
(18, 76, 75, 'DUPLICATE'),
(19, 79, 76, 'DUPLICATE'),
(21, 81, 79, 'DUPLICATE'),
(22, 82, 81, 'DUPLICATE');

-- --------------------------------------------------------

--
-- Struttura della tabella `Blocks`
--

CREATE TABLE IF NOT EXISTS `Blocks` (
  `bID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bName` varchar(60) DEFAULT NULL,
  `bDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bFilename` varchar(32) DEFAULT NULL,
  `bIsActive` varchar(1) NOT NULL DEFAULT '1',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  `btCachedBlockRecord` longtext,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=84 ;

--
-- Dump dei dati per la tabella `Blocks`
--

INSERT INTO `Blocks` (`bID`, `bName`, `bDateAdded`, `bDateModified`, `bFilename`, `bIsActive`, `btID`, `uID`, `btCachedBlockRecord`) VALUES
(1, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 9, 1, NULL),
(2, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 9, 1, NULL),
(3, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 9, 1, NULL),
(4, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 9, 1, NULL),
(5, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 9, 1, NULL),
(6, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 6, 1, NULL),
(7, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 7, 1, NULL),
(8, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 5, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:25:"btDashboardNewsflowLatest";s:8:"_tableat";s:25:"btDashboardNewsflowLatest";s:6:"_where";s:5:"bID=8";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:1:"8";i:1;s:1:"A";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:1:"8";s:4:"slot";s:1:"A";}'),
(9, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 5, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:25:"btDashboardNewsflowLatest";s:8:"_tableat";s:25:"btDashboardNewsflowLatest";s:6:"_where";s:5:"bID=9";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:1:"9";i:1;s:1:"B";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:1:"9";s:4:"slot";s:1:"B";}'),
(10, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 4, 1, NULL),
(11, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 3, 1, NULL),
(12, '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', NULL, '1', 5, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:25:"btDashboardNewsflowLatest";s:8:"_tableat";s:25:"btDashboardNewsflowLatest";s:6:"_where";s:6:"bID=12";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"12";i:1;s:1:"C";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"12";s:4:"slot";s:1:"C";}'),
(13, 'Blog Content', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=13";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"13";i:1;s:34:"<p>This is my first blog post.</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"13";s:7:"content";s:34:"<p>This is my first blog post.</p>";}'),
(14, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 25, 1, 'O:11:"BlockRecord":13:{s:5:"_dbat";i:1;s:6:"_table";s:6:"btTags";s:8:"_tableat";s:6:"btTags";s:6:"_where";s:6:"bID=14";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:5:{i:0;s:2:"14";i:1;s:4:"Tags";i:2;s:3:"132";i:3;s:4:"page";i:4;s:1:"0";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"14";s:5:"title";s:4:"Tags";s:9:"targetCID";s:3:"132";s:11:"displayMode";s:4:"page";s:10:"cloudCount";s:1:"0";}'),
(15, 'Thumbnail Image', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 18, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentImage";s:8:"_tableat";s:14:"btContentImage";s:6:"_where";s:6:"bID=15";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"15";i:1;s:1:"8";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";i:5;s:0:"";i:6;s:1:"0";i:7;N;i:8;s:0:"";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"15";s:3:"fID";s:1:"8";s:10:"fOnstateID";s:1:"0";s:8:"maxWidth";s:1:"0";s:9:"maxHeight";s:1:"0";s:12:"externalLink";s:0:"";s:15:"internalLinkCID";s:1:"0";s:27:"forceImageToMatchDimensions";N;s:7:"altText";s:0:"";}'),
(16, 'Header Image', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 18, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentImage";s:8:"_tableat";s:14:"btContentImage";s:6:"_where";s:6:"bID=16";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"16";i:1;s:1:"2";i:2;s:1:"0";i:3;s:3:"960";i:4;s:3:"212";i:5;s:0:"";i:6;s:1:"0";i:7;s:1:"1";i:8;s:17:"My concrete5 Blog";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"16";s:3:"fID";s:1:"2";s:10:"fOnstateID";s:1:"0";s:8:"maxWidth";s:3:"960";s:9:"maxHeight";s:3:"212";s:12:"externalLink";s:0:"";s:15:"internalLinkCID";s:1:"0";s:27:"forceImageToMatchDimensions";s:1:"1";s:7:"altText";s:17:"My concrete5 Blog";}'),
(17, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 18, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentImage";s:8:"_tableat";s:14:"btContentImage";s:6:"_where";s:6:"bID=17";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"17";i:1;s:1:"7";i:2;s:1:"0";i:3;s:3:"960";i:4;s:3:"212";i:5;s:0:"";i:6;s:1:"0";i:7;s:1:"1";i:8;s:0:"";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"17";s:3:"fID";s:1:"7";s:10:"fOnstateID";s:1:"0";s:8:"maxWidth";s:3:"960";s:9:"maxHeight";s:3:"212";s:12:"externalLink";s:0:"";s:15:"internalLinkCID";s:1:"0";s:27:"forceImageToMatchDimensions";s:1:"1";s:7:"altText";s:0:"";}'),
(18, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 18, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentImage";s:8:"_tableat";s:14:"btContentImage";s:6:"_where";s:6:"bID=18";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"18";i:1;s:1:"6";i:2;s:1:"0";i:3;s:3:"960";i:4;s:3:"212";i:5;s:0:"";i:6;s:1:"0";i:7;s:1:"1";i:8;s:0:"";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"18";s:3:"fID";s:1:"6";s:10:"fOnstateID";s:1:"0";s:8:"maxWidth";s:3:"960";s:9:"maxHeight";s:3:"212";s:12:"externalLink";s:0:"";s:15:"internalLinkCID";s:1:"0";s:27:"forceImageToMatchDimensions";s:1:"1";s:7:"altText";s:0:"";}'),
(19, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 18, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentImage";s:8:"_tableat";s:14:"btContentImage";s:6:"_where";s:6:"bID=19";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"19";i:1;s:1:"4";i:2;s:1:"0";i:3;s:3:"960";i:4;s:3:"212";i:5;s:0:"";i:6;s:1:"0";i:7;s:1:"1";i:8;s:0:"";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"19";s:3:"fID";s:1:"4";s:10:"fOnstateID";s:1:"0";s:8:"maxWidth";s:3:"960";s:9:"maxHeight";s:3:"212";s:12:"externalLink";s:0:"";s:15:"internalLinkCID";s:1:"0";s:27:"forceImageToMatchDimensions";s:1:"1";s:7:"altText";s:0:"";}'),
(20, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 8, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:12:"btNavigation";s:8:"_tableat";s:12:"btNavigation";s:6:"_where";s:6:"bID=20";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"20";i:1;s:11:"display_asc";i:2;s:3:"top";i:3;s:1:"0";i:4;s:1:"0";i:5;s:4:"none";i:6;s:6:"enough";i:7;s:1:"0";i:8;s:1:"0";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"20";s:7:"orderBy";s:11:"display_asc";s:12:"displayPages";s:3:"top";s:15:"displayPagesCID";s:1:"0";s:23:"displayPagesIncludeSelf";s:1:"0";s:15:"displaySubPages";s:4:"none";s:20:"displaySubPageLevels";s:6:"enough";s:23:"displaySubPageLevelsNum";s:1:"0";s:23:"displayUnavailablePages";s:1:"0";}'),
(21, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=21";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"21";i:1;s:15:"<h3>Links:</h3>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"21";s:7:"content";s:15:"<h3>Links:</h3>";}'),
(22, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 8, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:12:"btNavigation";s:8:"_tableat";s:12:"btNavigation";s:6:"_where";s:6:"bID=22";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"22";i:1;s:11:"display_asc";i:2;s:12:"second_level";i:3;s:1:"0";i:4;s:1:"0";i:5;s:3:"all";i:6;s:3:"all";i:7;s:1:"0";i:8;s:1:"0";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"22";s:7:"orderBy";s:11:"display_asc";s:12:"displayPages";s:12:"second_level";s:15:"displayPagesCID";s:1:"0";s:23:"displayPagesIncludeSelf";s:1:"0";s:15:"displaySubPages";s:3:"all";s:20:"displaySubPageLevels";s:3:"all";s:23:"displaySubPageLevelsNum";s:1:"0";s:23:"displayUnavailablePages";s:1:"0";}'),
(23, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=23";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"23";i:1;s:129:"<h1><a title="Home" \n                                	href="{CCM:CID_1}"\n                                >OpenRevolution</a></h1>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"23";s:7:"content";s:129:"<h1><a title="Home" \n                                	href="{CCM:CID_1}"\n                                >OpenRevolution</a></h1>";}'),
(24, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, NULL),
(25, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=25";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"25";i:1;s:16:"<h3>Sidebar</h3>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"25";s:7:"content";s:16:"<h3>Sidebar</h3>";}'),
(26, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=26";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"26";i:1;s:343:"<p>Everything about concrete5 is completely customizable through the CMS. This is a separate area from the main content on the homepage. You can&nbsp;<a title="Move blocks in concrete5" href="http://www.concrete5.org/documentation/general-topics/blocks-and-areas" target="_blank">drag and drop blocks</a>&nbsp;like this around your layout.</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"26";s:7:"content";s:343:"<p>Everything about concrete5 is completely customizable through the CMS. This is a separate area from the main content on the homepage. You can&nbsp;<a title="Move blocks in concrete5" href="http://www.concrete5.org/documentation/general-topics/blocks-and-areas" target="_blank">drag and drop blocks</a>&nbsp;like this around your layout.</p>";}'),
(27, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, NULL),
(28, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 18, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentImage";s:8:"_tableat";s:14:"btContentImage";s:6:"_where";s:6:"bID=28";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"28";i:1;s:1:"1";i:2;s:1:"0";i:3;s:3:"960";i:4;s:3:"212";i:5;s:0:"";i:6;s:1:"0";i:7;s:1:"1";i:8;s:0:"";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"28";s:3:"fID";s:1:"1";s:10:"fOnstateID";s:1:"0";s:8:"maxWidth";s:3:"960";s:9:"maxHeight";s:3:"212";s:12:"externalLink";s:0:"";s:15:"internalLinkCID";s:1:"0";s:27:"forceImageToMatchDimensions";s:1:"1";s:7:"altText";s:0:"";}'),
(29, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=29";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"29";i:1;s:17:"<h1>About Us</h1>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"29";s:7:"content";s:17:"<h1>About Us</h1>";}'),
(30, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 2, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:18:"btCoreStackDisplay";s:8:"_tableat";s:18:"btCoreStackDisplay";s:6:"_where";s:6:"bID=30";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"30";i:1;s:3:"121";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"30";s:4:"stID";s:3:"121";}'),
(31, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=31";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"31";i:1;s:1739:"<h2>Learn More</h2>\n																<p>Visit&nbsp;<a title="concrete5 Content Management System" href="http://www.concrete5.org/" target="_blank">concrete5.org</a>&nbsp;to learn more from the&nbsp;<a title="open source content management system" href="http://www.concrete5.org/community" target="_blank">community</a>&nbsp;and the&nbsp;<a href="http://www.concrete5.org/documentation/general-topics/" target="_blank">documentation</a>. You can also browse our&nbsp;<a title="concrete5 marketplace" href="http://www.concrete5.org/marketplace/" target="_blank">marketplace</a>&nbsp;for more&nbsp;<a title="Add-ons for concrete5" href="http://www.concrete5.org/marketplace/addons/" target="_blank">add-ons</a>&nbsp;and&nbsp;<a title="Themes for concrete5" href="http://www.concrete5.org/marketplace/themes/" target="_blank">themes</a>&nbsp;to quickly build the site you really need.&nbsp;</p>\n																<h3>&nbsp;</h3>\n																<h3>Getting Help</h3>\n																<p>You can get free help in the <a href="http://www.concrete5.org/community/forums/" target="_blank">forums</a> and post for free to the&nbsp;<a href="http://www.concrete5.org/community/forums/jobs1/" target="_blank">jobs board</a>.&nbsp;</p>\n																<p>You can also pay the concrete5 team of developers to help with&nbsp;<a href="http://www.concrete5.org/services/support/" target="_blank">any problem</a>&nbsp;you run into. We offer <a href="http://www.concrete5.org/services/training/" target="_blank">training courses</a>&nbsp;and&nbsp;<a href="http://www.concrete5.org/services/hosting/" target="_blank">hosting packages</a>, just let us know <a href="http://www.concrete5.org/services/professional_services/" target="_blank">how we can help</a>.</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"31";s:7:"content";s:1739:"<h2>Learn More</h2>\n																<p>Visit&nbsp;<a title="concrete5 Content Management System" href="http://www.concrete5.org/" target="_blank">concrete5.org</a>&nbsp;to learn more from the&nbsp;<a title="open source content management system" href="http://www.concrete5.org/community" target="_blank">community</a>&nbsp;and the&nbsp;<a href="http://www.concrete5.org/documentation/general-topics/" target="_blank">documentation</a>. You can also browse our&nbsp;<a title="concrete5 marketplace" href="http://www.concrete5.org/marketplace/" target="_blank">marketplace</a>&nbsp;for more&nbsp;<a title="Add-ons for concrete5" href="http://www.concrete5.org/marketplace/addons/" target="_blank">add-ons</a>&nbsp;and&nbsp;<a title="Themes for concrete5" href="http://www.concrete5.org/marketplace/themes/" target="_blank">themes</a>&nbsp;to quickly build the site you really need.&nbsp;</p>\n																<h3>&nbsp;</h3>\n																<h3>Getting Help</h3>\n																<p>You can get free help in the <a href="http://www.concrete5.org/community/forums/" target="_blank">forums</a> and post for free to the&nbsp;<a href="http://www.concrete5.org/community/forums/jobs1/" target="_blank">jobs board</a>.&nbsp;</p>\n																<p>You can also pay the concrete5 team of developers to help with&nbsp;<a href="http://www.concrete5.org/services/support/" target="_blank">any problem</a>&nbsp;you run into. We offer <a href="http://www.concrete5.org/services/training/" target="_blank">training courses</a>&nbsp;and&nbsp;<a href="http://www.concrete5.org/services/hosting/" target="_blank">hosting packages</a>, just let us know <a href="http://www.concrete5.org/services/professional_services/" target="_blank">how we can help</a>.</p>";}'),
(32, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=32";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"32";i:1;s:18:"<h1>Guestbook</h1>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"32";s:7:"content";s:18:"<h1>Guestbook</h1>";}'),
(33, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 2, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:18:"btCoreStackDisplay";s:8:"_tableat";s:18:"btCoreStackDisplay";s:6:"_where";s:6:"bID=33";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"33";i:1;s:3:"121";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"33";s:4:"stID";s:3:"121";}'),
(34, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 16, 1, NULL),
(35, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=35";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"35";i:1;s:19:"<h1>Contact Us</h1>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"35";s:7:"content";s:19:"<h1>Contact Us</h1>";}'),
(36, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 2, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:18:"btCoreStackDisplay";s:8:"_tableat";s:18:"btCoreStackDisplay";s:6:"_where";s:6:"bID=36";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"36";i:1;s:3:"121";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"36";s:4:"stID";s:3:"121";}'),
(37, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=37";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"37";i:1;s:192:"<h2>Contact Us</h2>\n									<p>Building a form is easy to do. Learn how to <a href="http://www.concrete5.org/documentation/general-topics/add_a_form" target="_blank">add a form block</a>.</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"37";s:7:"content";s:192:"<h2>Contact Us</h2>\n									<p>Building a form is easy to do. Learn how to <a href="http://www.concrete5.org/documentation/general-topics/add_a_form" target="_blank">add a form block</a>.</p>";}'),
(38, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 14, 1, NULL),
(39, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=39";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"39";i:1;s:16:"<h1>Sitemap</h1>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"39";s:7:"content";s:16:"<h1>Sitemap</h1>";}'),
(40, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=40";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"40";i:1;s:17:"<h3>Site Map</h3>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"40";s:7:"content";s:17:"<h3>Site Map</h3>";}'),
(41, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 8, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:12:"btNavigation";s:8:"_tableat";s:12:"btNavigation";s:6:"_where";s:6:"bID=41";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"41";i:1;s:11:"display_asc";i:2;s:3:"top";i:3;s:1:"0";i:4;s:1:"0";i:5;s:3:"all";i:6;s:3:"all";i:7;s:1:"0";i:8;s:1:"0";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"41";s:7:"orderBy";s:11:"display_asc";s:12:"displayPages";s:3:"top";s:15:"displayPagesCID";s:1:"0";s:23:"displayPagesIncludeSelf";s:1:"0";s:15:"displaySubPages";s:3:"all";s:20:"displaySubPageLevels";s:3:"all";s:23:"displaySubPageLevelsNum";s:1:"0";s:23:"displayUnavailablePages";s:1:"0";}'),
(42, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 22, 1, NULL),
(43, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'blog_index_thumbnail.php', '1', 20, 1, 'O:11:"BlockRecord":23:{s:5:"_dbat";i:1;s:6:"_table";s:10:"btPageList";s:8:"_tableat";s:10:"btPageList";s:6:"_where";s:6:"bID=43";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:15:{i:0;s:2:"43";i:1;s:2:"12";i:2;s:11:"chrono_desc";i:3;s:3:"128";i:4;s:1:"0";i:5;s:1:"0";i:6;s:1:"1";i:7;s:1:"0";i:8;s:1:"4";i:9;s:1:"0";i:10;s:0:"";i:11;s:0:"";i:12;s:1:"1";i:13;s:1:"0";i:14;s:3:"128";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"43";s:3:"num";s:2:"12";s:7:"orderBy";s:11:"chrono_desc";s:9:"cParentID";s:3:"128";s:5:"cThis";s:1:"0";s:21:"includeAllDescendents";s:1:"0";s:8:"paginate";s:1:"1";s:14:"displayAliases";s:1:"0";s:4:"ctID";s:1:"4";s:3:"rss";s:1:"0";s:8:"rssTitle";s:0:"";s:14:"rssDescription";s:0:"";s:17:"truncateSummaries";s:1:"1";s:19:"displayFeaturedOnly";s:1:"0";s:13:"truncateChars";s:3:"128";}'),
(44, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=44";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"44";i:1;s:13:"<h3>Tags</h3>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"44";s:7:"content";s:13:"<h3>Tags</h3>";}'),
(45, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 25, 1, 'O:11:"BlockRecord":13:{s:5:"_dbat";i:1;s:6:"_table";s:6:"btTags";s:8:"_tableat";s:6:"btTags";s:6:"_where";s:6:"bID=45";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:5:{i:0;s:2:"45";i:1;s:0:"";i:2;s:3:"132";i:3;s:5:"cloud";i:4;s:1:"0";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"45";s:5:"title";s:0:"";s:9:"targetCID";s:3:"132";s:11:"displayMode";s:5:"cloud";s:10:"cloudCount";s:1:"0";}'),
(46, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 28, 1, 'O:11:"BlockRecord":12:{s:5:"_dbat";i:1;s:6:"_table";s:13:"btDateArchive";s:8:"_tableat";s:13:"btDateArchive";s:6:"_where";s:6:"bID=46";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:4:{i:0;s:2:"46";i:1;s:8:"Archives";i:2;s:3:"132";i:3;s:2:"12";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"46";s:5:"title";s:8:"Archives";s:9:"targetCID";s:3:"132";s:9:"numMonths";s:2:"12";}'),
(47, 'Header Image', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 18, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentImage";s:8:"_tableat";s:14:"btContentImage";s:6:"_where";s:6:"bID=47";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"47";i:1;s:1:"2";i:2;s:1:"0";i:3;s:3:"960";i:4;s:3:"212";i:5;s:0:"";i:6;s:1:"0";i:7;s:1:"1";i:8;s:17:"My concrete5 Blog";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"47";s:3:"fID";s:1:"2";s:10:"fOnstateID";s:1:"0";s:8:"maxWidth";s:3:"960";s:9:"maxHeight";s:3:"212";s:12:"externalLink";s:0:"";s:15:"internalLinkCID";s:1:"0";s:27:"forceImageToMatchDimensions";s:1:"1";s:7:"altText";s:17:"My concrete5 Blog";}'),
(48, 'Blog Content', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=48";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"48";i:1;s:66:"<p>Here is some sample content! I''m writing it using composer!</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"48";s:7:"content";s:66:"<p>Here is some sample content! I''m writing it using composer!</p>";}'),
(49, 'Thumbnail Image', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 18, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentImage";s:8:"_tableat";s:14:"btContentImage";s:6:"_where";s:6:"bID=49";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"49";i:1;s:1:"8";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";i:5;s:0:"";i:6;s:1:"0";i:7;N;i:8;s:0:"";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"49";s:3:"fID";s:1:"8";s:10:"fOnstateID";s:1:"0";s:8:"maxWidth";s:1:"0";s:9:"maxHeight";s:1:"0";s:12:"externalLink";s:0:"";s:15:"internalLinkCID";s:1:"0";s:27:"forceImageToMatchDimensions";N;s:7:"altText";s:0:"";}'),
(50, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 22, 1, NULL),
(51, '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, '1', 25, 1, 'O:11:"BlockRecord":13:{s:5:"_dbat";i:1;s:6:"_table";s:6:"btTags";s:8:"_tableat";s:6:"btTags";s:6:"_where";s:6:"bID=51";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:5:{i:0;s:2:"51";i:1;s:4:"Tags";i:2;s:3:"132";i:3;s:5:"cloud";i:4;s:1:"0";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"51";s:5:"title";s:4:"Tags";s:9:"targetCID";s:3:"132";s:11:"displayMode";s:5:"cloud";s:10:"cloudCount";s:1:"0";}'),
(52, '', '2012-11-22 16:12:27', '2012-11-22 16:12:28', NULL, '1', 28, 1, 'O:11:"BlockRecord":12:{s:5:"_dbat";i:1;s:6:"_table";s:13:"btDateArchive";s:8:"_tableat";s:13:"btDateArchive";s:6:"_where";s:6:"bID=52";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:4:{i:0;s:2:"52";i:1;s:8:"Archives";i:2;s:3:"132";i:3;s:2:"12";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"52";s:5:"title";s:8:"Archives";s:9:"targetCID";s:3:"132";s:9:"numMonths";s:2:"12";}'),
(53, '', '2012-11-22 16:57:57', '2012-11-22 16:57:57', NULL, '1', 9, 1, NULL),
(54, '', '2012-11-22 16:58:09', '2012-11-22 16:58:09', NULL, '1', 9, 1, NULL),
(55, NULL, '2013-02-18 22:23:29', '2013-02-18 22:23:29', NULL, '1', 8, 1, 'O:11:"BlockRecord":17:{s:5:"_dbat";i:1;s:6:"_table";s:12:"btNavigation";s:8:"_tableat";s:12:"btNavigation";s:6:"_where";s:6:"bID=55";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:9:{i:0;s:2:"55";i:1;s:11:"display_asc";i:2;s:3:"top";i:3;s:1:"0";i:4;s:1:"0";i:5;s:4:"none";i:6;s:6:"enough";i:7;s:1:"0";i:8;s:1:"0";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"55";s:7:"orderBy";s:11:"display_asc";s:12:"displayPages";s:3:"top";s:15:"displayPagesCID";s:1:"0";s:23:"displayPagesIncludeSelf";s:1:"0";s:15:"displaySubPages";s:4:"none";s:20:"displaySubPageLevels";s:6:"enough";s:23:"displaySubPageLevelsNum";s:1:"0";s:23:"displayUnavailablePages";s:1:"0";}'),
(56, '', '2013-02-18 22:23:56', '2013-02-18 22:23:56', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=56";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"56";i:1;s:21:"<p>Rete d''impresa</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"56";s:7:"content";s:21:"<p>Rete d''impresa</p>";}'),
(57, '', '2013-02-18 22:25:11', '2013-02-18 22:25:11', NULL, '1', 9, 1, NULL),
(58, '', '2013-04-30 11:05:21', '2013-04-30 11:05:29', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=58";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"58";i:1;s:30:"<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"58";s:7:"content";s:30:"<p>...  Coming soon ... </p>";}'),
(59, NULL, '2013-04-30 12:16:51', '2013-04-30 12:16:51', NULL, '1', 29, 1, NULL),
(60, '', '2013-05-03 08:28:40', '2013-05-03 08:28:40', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=60";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"60";i:1;s:21:"<p>Rete d''impresa</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"60";s:7:"content";s:21:"<p>Rete d''impresa</p>";}'),
(61, '', '2013-05-21 20:17:48', '2013-05-21 20:17:48', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";N;s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"61";i:1;s:0:"";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"61";s:7:"content";s:0:"";}'),
(62, '', '2013-05-22 14:25:17', '2013-05-22 14:25:56', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";N;s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"62";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"62";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(63, '', '2013-05-22 14:34:55', '2013-05-22 14:34:55', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=63";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"63";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"63";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(64, '', '2013-05-22 19:48:39', '2013-05-22 19:48:39', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=64";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"64";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"64";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(65, '', '2013-05-22 20:08:20', '2013-05-22 20:08:20', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=65";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"65";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"65";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(66, '', '2013-05-22 20:14:46', '2013-05-22 20:14:46', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=66";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"66";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"66";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(67, '', '2013-05-22 20:17:36', '2013-05-22 20:17:36', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=67";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"67";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"67";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(68, '', '2013-05-22 20:54:33', '2013-05-22 20:54:33', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=68";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"68";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"68";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(69, '', '2013-05-23 10:51:34', '2013-05-23 10:51:34', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=69";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"69";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"69";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(70, '', '2013-05-23 10:57:26', '2013-05-23 10:57:26', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=70";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"70";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"70";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(71, '', '2013-05-23 12:52:26', '2013-05-23 12:52:26', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=71";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"71";i:1;s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"71";s:7:"content";s:69:"<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>";}'),
(72, NULL, '2013-05-25 11:05:05', '2013-05-25 11:05:05', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";N;s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"72";i:1;s:285:"<p> <img src="{CCM:FID_12}" alt="twitter.png" width="32" height="32" /> <img src="{CCM:FID_11}" alt="linkedin.png" width="32" height="32" /> <img src="{CCM:FID_9}" alt="facebook.png" width="32" height="32" /> <img src="{CCM:FID_10}" alt="google.png" width="32" height="32" /> </p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"72";s:7:"content";s:285:"<p> <img src="{CCM:FID_12}" alt="twitter.png" width="32" height="32" /> <img src="{CCM:FID_11}" alt="linkedin.png" width="32" height="32" /> <img src="{CCM:FID_9}" alt="facebook.png" width="32" height="32" /> <img src="{CCM:FID_10}" alt="google.png" width="32" height="32" /> </p>";}'),
(73, NULL, '2013-05-25 11:05:35', '2013-05-25 11:05:35', NULL, '1', 2, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:18:"btCoreStackDisplay";s:8:"_tableat";s:18:"btCoreStackDisplay";s:6:"_where";N;s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"73";i:1;s:3:"137";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"73";s:4:"stID";s:3:"137";}'),
(75, NULL, '2013-11-25 22:05:28', '2013-11-25 22:05:28', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";N;s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"75";i:1;s:50:"<p style="text-align: center;">OPEN REVOLUTION</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"75";s:7:"content";s:50:"<p style="text-align: center;">OPEN REVOLUTION</p>";}'),
(76, NULL, '2013-11-25 22:06:56', '2013-11-25 22:06:56', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";N;s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"76";i:1;s:50:"<p style="text-align: center;">OPEN REVOLUTION</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"76";s:7:"content";s:50:"<p style="text-align: center;">OPEN REVOLUTION</p>";}'),
(82, 'iDempiere', '2014-01-02 18:04:20', '2014-01-02 18:04:20', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";N;s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"82";i:1;s:248:"<p style="text-align: center;"><span style="color: #ffffff;"><strong><span style="font-size: xx-large;">2014</span></strong><img src="{CCM:FID_13}" alt="964190_598234856862455_297938299_o.jpg" width="2048" height="1250" />OPEN REVOLUTION</span></p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"82";s:7:"content";s:248:"<p style="text-align: center;"><span style="color: #ffffff;"><strong><span style="font-size: xx-large;">2014</span></strong><img src="{CCM:FID_13}" alt="964190_598234856862455_297938299_o.jpg" width="2048" height="1250" />OPEN REVOLUTION</span></p>";}'),
(78, NULL, '2013-11-25 22:09:32', '2013-11-25 22:09:32', NULL, '1', 2, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:18:"btCoreStackDisplay";s:8:"_tableat";s:18:"btCoreStackDisplay";s:6:"_where";N;s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"78";i:1;s:3:"135";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"78";s:4:"stID";s:3:"135";}'),
(79, 'iDempiere', '2013-12-31 21:47:35', '2013-12-31 21:48:36', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";s:6:"bID=79";s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"79";i:1;s:50:"<p style="text-align: center;">OPEN REVOLUTION</p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"79";s:7:"content";s:50:"<p style="text-align: center;">OPEN REVOLUTION</p>";}'),
(81, 'iDempiere', '2014-01-02 18:01:06', '2014-01-02 18:02:42', NULL, '1', 9, 1, 'O:11:"BlockRecord":10:{s:5:"_dbat";i:1;s:6:"_table";s:14:"btContentLocal";s:8:"_tableat";s:14:"btContentLocal";s:6:"_where";N;s:6:"_saved";b:1;s:8:"_lasterr";b:0;s:9:"_original";a:2:{i:0;s:2:"81";i:1;s:189:"<p style="text-align: center;"><span style="color: #ffffff;">2014<img src="{CCM:FID_13}" alt="964190_598234856862455_297938299_o.jpg" width="2048" height="1250" />OPEN REVOLUTION</span></p>";}s:11:"foreignName";s:11:"blockrecord";s:3:"bID";s:2:"81";s:7:"content";s:189:"<p style="text-align: center;"><span style="color: #ffffff;">2014<img src="{CCM:FID_13}" alt="964190_598234856862455_297938299_o.jpg" width="2048" height="1250" />OPEN REVOLUTION</span></p>";}'),
(83, NULL, '2014-01-02 18:05:55', '2014-01-02 18:05:55', NULL, '1', 24, 1, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `BlockTypePermissionBlockTypeAccessList`
--

CREATE TABLE IF NOT EXISTS `BlockTypePermissionBlockTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `BlockTypePermissionBlockTypeAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `BlockTypePermissionBlockTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`btID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `BlockTypes`
--

CREATE TABLE IF NOT EXISTS `BlockTypes` (
  `btID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `btHandle` varchar(32) NOT NULL,
  `btName` varchar(128) NOT NULL,
  `btDescription` text,
  `btActiveWhenAdded` tinyint(1) NOT NULL DEFAULT '1',
  `btCopyWhenPropagate` tinyint(1) NOT NULL DEFAULT '0',
  `btIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  `btIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `btDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `btInterfaceWidth` int(10) unsigned NOT NULL DEFAULT '400',
  `btInterfaceHeight` int(10) unsigned NOT NULL DEFAULT '400',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`btID`),
  UNIQUE KEY `btHandle` (`btHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dump dei dati per la tabella `BlockTypes`
--

INSERT INTO `BlockTypes` (`btID`, `btHandle`, `btName`, `btDescription`, `btActiveWhenAdded`, `btCopyWhenPropagate`, `btIncludeAll`, `btIsInternal`, `btDisplayOrder`, `btInterfaceWidth`, `btInterfaceHeight`, `pkgID`) VALUES
(1, 'core_scrapbook_display', 'Scrapbook Display (Core)', 'Proxy block for blocks pasted through the scrapbook.', 1, 0, 0, 1, 0, 400, 400, 0),
(2, 'core_stack_display', 'Stack Display (Core)', 'Proxy block for stacks added through the UI.', 1, 0, 0, 1, 0, 400, 400, 0),
(3, 'dashboard_featured_addon', 'Dashboard Featured Add-On', 'Features an add-on from concrete5.org.', 1, 0, 0, 1, 0, 300, 100, 0),
(4, 'dashboard_featured_theme', 'Dashboard Featured Theme', 'Features a theme from concrete5.org.', 1, 0, 0, 1, 0, 300, 100, 0),
(5, 'dashboard_newsflow_latest', 'Dashboard Newsflow Latest', 'Grabs the latest newsflow data from concrete5.org.', 1, 0, 0, 1, 0, 400, 400, 0),
(6, 'dashboard_app_status', 'Dashboard App Status', 'Displays update and welcome back information on your dashboard.', 1, 0, 0, 1, 0, 400, 400, 0),
(7, 'dashboard_site_activity', 'Dashboard Site Activity', 'Displays a summary of website activity.', 1, 0, 0, 1, 0, 400, 400, 0),
(8, 'autonav', 'Auto-Nav', 'Creates navigation trees and sitemaps.', 1, 0, 0, 0, 1, 500, 350, 0),
(9, 'content', 'Content', 'HTML/WYSIWYG Editor Content.', 1, 0, 0, 0, 2, 580, 380, 0),
(10, 'date_nav', 'Date Navigation', 'A collapsible date based navigation tree', 1, 0, 0, 0, 3, 500, 350, 0),
(11, 'external_form', 'External Form', 'Include external forms in the filesystem and place them on pages.', 1, 0, 0, 0, 4, 370, 100, 0),
(12, 'file', 'File', 'Link to files stored in the asset library.', 1, 0, 0, 0, 5, 300, 250, 0),
(13, 'flash_content', 'Flash Content', 'Embeds SWF files, including flash detection.', 1, 0, 0, 0, 6, 380, 200, 0),
(14, 'form', 'Form', 'Build simple forms and surveys.', 1, 0, 0, 0, 7, 420, 430, 0),
(15, 'google_map', 'Google Map', 'Enter an address and a Google Map of that location will be placed in your page.', 1, 0, 0, 0, 8, 400, 200, 0),
(16, 'guestbook', 'Guestbook / Comments', 'Adds blog-style comments (a guestbook) to your page.', 1, 0, 1, 0, 9, 350, 480, 0),
(17, 'html', 'HTML', 'For adding HTML by hand.', 1, 0, 0, 0, 10, 600, 465, 0),
(18, 'image', 'Image', 'Adds images and onstates from the library to pages.', 1, 0, 0, 0, 11, 400, 550, 0),
(19, 'next_previous', 'Next & Previous Nav', 'Navigate through sibling pages.', 1, 0, 0, 0, 12, 430, 400, 0),
(20, 'page_list', 'Page List', 'List pages based on type, area.', 1, 0, 0, 0, 13, 500, 350, 0),
(21, 'rss_displayer', 'RSS Displayer', 'Fetch, parse and display the contents of an RSS or Atom feed.', 1, 0, 0, 0, 14, 400, 330, 0),
(22, 'search', 'Search', 'Add a search box to your site.', 1, 0, 0, 0, 15, 400, 240, 0),
(23, 'slideshow', 'Slideshow', 'Display a running loop of images.', 1, 0, 0, 0, 16, 550, 400, 0),
(24, 'survey', 'Survey', 'Provide a simple survey, along with results in a pie chart format.', 1, 0, 0, 0, 17, 420, 300, 0),
(25, 'tags', 'Tags', 'List pages based on type, area.', 1, 0, 0, 0, 18, 450, 260, 0),
(26, 'video', 'Video Player', 'Embeds uploaded video into a web page. Supports AVI, WMV, Quicktime/MPEG4 and FLV formats.', 1, 0, 0, 0, 19, 320, 220, 0),
(27, 'youtube', 'YouTube Video', 'Embeds a YouTube Video in your web page.', 1, 0, 0, 0, 20, 400, 210, 0),
(28, 'date_archive', 'Blog Date Archive', 'Displays month archive for pages', 1, 0, 0, 0, 21, 500, 350, 0),
(29, 'wave_text', 'Wave Text', 'Create text headers with a cool wave effect!', 1, 0, 0, 0, 22, 420, 380, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `btContentFile`
--

CREATE TABLE IF NOT EXISTS `btContentFile` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `fileLinkText` varchar(255) DEFAULT NULL,
  `filePassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btContentImage`
--

CREATE TABLE IF NOT EXISTS `btContentImage` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT '0',
  `fOnstateID` int(10) unsigned DEFAULT '0',
  `maxWidth` int(10) unsigned DEFAULT '0',
  `maxHeight` int(10) unsigned DEFAULT '0',
  `externalLink` varchar(255) DEFAULT NULL,
  `internalLinkCID` int(10) unsigned DEFAULT '0',
  `forceImageToMatchDimensions` int(10) unsigned DEFAULT '0',
  `altText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btContentImage`
--

INSERT INTO `btContentImage` (`bID`, `fID`, `fOnstateID`, `maxWidth`, `maxHeight`, `externalLink`, `internalLinkCID`, `forceImageToMatchDimensions`, `altText`) VALUES
(15, 8, 0, 0, 0, '', 0, NULL, ''),
(16, 2, 0, 960, 212, '', 0, 1, 'My concrete5 Blog'),
(17, 7, 0, 960, 212, '', 0, 1, ''),
(18, 6, 0, 960, 212, '', 0, 1, ''),
(19, 4, 0, 960, 212, '', 0, 1, ''),
(28, 1, 0, 960, 212, '', 0, 1, ''),
(47, 2, 0, 960, 212, '', 0, 1, 'My concrete5 Blog'),
(49, 8, 0, 0, 0, '', 0, NULL, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `btContentLocal`
--

CREATE TABLE IF NOT EXISTS `btContentLocal` (
  `bID` int(10) unsigned NOT NULL,
  `content` longtext,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btContentLocal`
--

INSERT INTO `btContentLocal` (`bID`, `content`) VALUES
(1, '	<div id="newsflow-header-first-run"><h1>Welcome to concrete5.</h1>\n						<h2>It''s easy to edit content and add pages using in-context editing.</h2></div>\n						'),
(2, '<div class="newsflow-column-first-run">\n							<h3>Building Your Own Site</h3>\n							<p>Editing with concrete5 is a breeze. Just point and click to make changes.</p>\n							<br/>\n							<p><a href="javascript:void(0)" onclick="ccm_getNewsflowByPath(''/welcome/editors'')" class="btn primary">Editor''s Guide</a></p>\n							</div>'),
(3, '<div class="newsflow-column-first-run">\n							<h3>Developing Applications</h3>\n							<p>If you’re comfortable in PHP concrete5 should be a breeze to learn. Take a few moments to understand the architecture.</p>\n							<p><a href="javascript:void(0)" onclick="ccm_getNewsflowByPath(''/welcome/developers'')" class="btn primary">Developer''s Guide</a></p>\n							</div>'),
(4, '<div class="newsflow-column-first-run">\n							<h3>Designing Websites</h3>\n							<p>Good with CSS and HTML? You can easily theme anything with concrete5.</p>\n							<br/>\n							<p><a href="javascript:void(0)" onclick="ccm_getNewsflowByPath(''/welcome/designers'')" class="btn primary">Designer''s Guide</a></p>\n							</div>'),
(5, '\n						<div class="newsflow-column-first-run">\n						<h3>Business Background</h3>\n						<p>Worried about license structures, white-labeling or why concrete5 is a good choice for your agency?</p>\n						<p><a href="javascript:void(0)" onclick="ccm_getNewsflowByPath(''/welcome/executives'')" class="btn primary">Executive''s Guide</a></p>\n						</div>'),
(13, '<p>This is my first blog post.</p>'),
(21, '<h3>Links:</h3>'),
(23, '<h1><a title="Home" \n                                	href="{CCM:CID_1}"\n                                >OpenRevolution</a></h1>'),
(24, '<h1>Welcome to concrete5 - an Open Source CMS</h1>'),
(25, '<h3>Sidebar</h3>'),
(26, '<p>Everything about concrete5 is completely customizable through the CMS. This is a separate area from the main content on the homepage. You can&nbsp;<a title="Move blocks in concrete5" href="http://www.concrete5.org/documentation/general-topics/blocks-and-areas" target="_blank">drag and drop blocks</a>&nbsp;like this around your layout.</p>'),
(27, '<h2>Welcome to concrete5!</h2>\n                                        <p>Content Management is easy with concrete5''s in-context editing. Just <a href="{CCM:CID_109}">login</a> and you can change things as you browse your site.</p>\n                                        <p>You can watch videos and learn how to:</p>\n                                        <ul>\n                                        <li><a title="In-context editing CMS" href="http://www.concrete5.org/documentation/general-topics/in-context-editing/" target="_blank">Edit</a>&nbsp;this page.</li>\n                                        <li>Add a <a title="Add a page in concrete5" href="http://www.concrete5.org/documentation/general-topics/add-a-page/" target="_blank">new page</a>.</li>\n                                        <li>Add some basic functionality, like&nbsp;<a title="Add a simple form in concrete5" href="http://www.concrete5.org/documentation/general-topics/add_a_form" target="_blank">a Form</a>.</li>\n                                        <li><a title="add-on marketplace for concrete5" href="http://www.concrete5.org/marketplace/how_to_install_add_ons_and_themes_/" target="_blank">Finding &amp; adding</a>&nbsp;more functionality and themes.</li>\n                                        </ul>\n                                        <p>We''ve taken the liberty to build out the rest of this site with some sample content that will help you learn concrete5. Wander around a bit, or click Dashboard to get to the&nbsp;<a href="{CCM:CID_6}">Sitemap</a> and quickly delete the parts you don''t want.</p>'),
(29, '<h1>About Us</h1>'),
(31, '<h2>Learn More</h2>\n																<p>Visit&nbsp;<a title="concrete5 Content Management System" href="http://www.concrete5.org/" target="_blank">concrete5.org</a>&nbsp;to learn more from the&nbsp;<a title="open source content management system" href="http://www.concrete5.org/community" target="_blank">community</a>&nbsp;and the&nbsp;<a href="http://www.concrete5.org/documentation/general-topics/" target="_blank">documentation</a>. You can also browse our&nbsp;<a title="concrete5 marketplace" href="http://www.concrete5.org/marketplace/" target="_blank">marketplace</a>&nbsp;for more&nbsp;<a title="Add-ons for concrete5" href="http://www.concrete5.org/marketplace/addons/" target="_blank">add-ons</a>&nbsp;and&nbsp;<a title="Themes for concrete5" href="http://www.concrete5.org/marketplace/themes/" target="_blank">themes</a>&nbsp;to quickly build the site you really need.&nbsp;</p>\n																<h3>&nbsp;</h3>\n																<h3>Getting Help</h3>\n																<p>You can get free help in the <a href="http://www.concrete5.org/community/forums/" target="_blank">forums</a> and post for free to the&nbsp;<a href="http://www.concrete5.org/community/forums/jobs1/" target="_blank">jobs board</a>.&nbsp;</p>\n																<p>You can also pay the concrete5 team of developers to help with&nbsp;<a href="http://www.concrete5.org/services/support/" target="_blank">any problem</a>&nbsp;you run into. We offer <a href="http://www.concrete5.org/services/training/" target="_blank">training courses</a>&nbsp;and&nbsp;<a href="http://www.concrete5.org/services/hosting/" target="_blank">hosting packages</a>, just let us know <a href="http://www.concrete5.org/services/professional_services/" target="_blank">how we can help</a>.</p>'),
(32, '<h1>Guestbook</h1>'),
(35, '<h1>Contact Us</h1>'),
(37, '<h2>Contact Us</h2>\n									<p>Building a form is easy to do. Learn how to <a href="http://www.concrete5.org/documentation/general-topics/add_a_form" target="_blank">add a form block</a>.</p>'),
(39, '<h1>Sitemap</h1>'),
(40, '<h3>Site Map</h3>'),
(44, '<h3>Tags</h3>'),
(48, '<p>Here is some sample content! I''m writing it using composer!</p>'),
(53, '<p>Rete d''impresa</p>'),
(54, '<h2>Welcome to concrete5!Content Management is easy with concrete5''s in-context editing. Just <a href="{CCM:CID_109}">login</a> and you can change things as you browse your site.</h2>\r\n<p>You can watch videos and learn how to:</p>\r\n<ul>\r\n<li><a title="In-context editing CMS" href="http://www.concrete5.org/documentation/general-topics/in-context-editing/" target="_blank">Edit</a> this page.</li>\r\n<li>Add a <a title="Add a page in concrete5" href="http://www.concrete5.org/documentation/general-topics/add-a-page/" target="_blank">new page</a>.</li>\r\n<li>Add some basic functionality, like <a title="Add a simple form in concrete5" href="http://www.concrete5.org/documentation/general-topics/add_a_form" target="_blank">a Form</a>.</li>\r\n<li><a title="add-on marketplace for concrete5" href="http://www.concrete5.org/marketplace/how_to_install_add_ons_and_themes_/" target="_blank">Finding &amp; adding</a> more functionality and themes.</li>\r\n</ul>\r\n<p>We''ve taken the liberty to build out the rest of this site with some sample content that will help you learn concrete5. Wander around a bit, or click Dashboard to get to the <a href="{CCM:CID_6}">Sitemap</a> and quickly delete the parts you don''t want.</p>'),
(56, '<p>Rete d''impresa</p>'),
(57, '<h2>Welcome to concrete5!Content Management is easy with concrete5''s in-context editing. Just <a href="{CCM:CID_109}">login</a> and you can change things as you browse your site.</h2>\r\n<p>You can watch videos and learn how to:</p>\r\n<ul>\r\n<li><a title="In-context editing CMS" href="http://www.concrete5.org/documentation/general-topics/in-context-editing/" target="_blank">Edit</a> this page.</li>\r\n<li>Add a <a title="Add a page in concrete5" href="http://www.concrete5.org/documentation/general-topics/add-a-page/" target="_blank">new page</a>.</li>\r\n<li>Add some basic functionality, like <a title="Add a simple form in concrete5" href="http://www.concrete5.org/documentation/general-topics/add_a_form" target="_blank">a Form</a>.</li>\r\n<li><a title="add-on marketplace for concrete5" href="http://www.concrete5.org/marketplace/how_to_install_add_ons_and_themes_/" target="_blank">Finding &amp; adding</a> more functionality and themes.</li>\r\n</ul>\r\n<p>We''ve taken the liberty to build out the rest of this site with some sample content that will help you learn concrete5. Wander around a bit, or click Dashboard to get to the <a href="{CCM:CID_6}">Sitemap</a> and quickly delete the parts you don''t want.</p>'),
(58, '<p>...  Coming soon ... </p>'),
(60, '<p>Rete d''impresa</p>'),
(61, ''),
(62, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(63, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(64, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(65, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(66, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(67, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(68, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(69, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(70, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(71, '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>'),
(72, '<p> <img src="{CCM:FID_12}" alt="twitter.png" width="32" height="32" /> <img src="{CCM:FID_11}" alt="linkedin.png" width="32" height="32" /> <img src="{CCM:FID_9}" alt="facebook.png" width="32" height="32" /> <img src="{CCM:FID_10}" alt="google.png" width="32" height="32" /> </p>'),
(75, '<p style="text-align: center;">OPEN REVOLUTION</p>'),
(76, '<p style="text-align: center;">OPEN REVOLUTION</p>'),
(82, '<p style="text-align: center;"><span style="color: #ffffff;"><strong><span style="font-size: xx-large;">2014</span></strong><img src="{CCM:FID_13}" alt="964190_598234856862455_297938299_o.jpg" width="2048" height="1250" />OPEN REVOLUTION</span></p>'),
(79, '<p style="text-align: center;">OPEN REVOLUTION</p>'),
(81, '<p style="text-align: center;"><span style="color: #ffffff;">2014<img src="{CCM:FID_13}" alt="964190_598234856862455_297938299_o.jpg" width="2048" height="1250" />OPEN REVOLUTION</span></p>');

-- --------------------------------------------------------

--
-- Struttura della tabella `btCoreScrapbookDisplay`
--

CREATE TABLE IF NOT EXISTS `btCoreScrapbookDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `bOriginalID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bID`),
  KEY `bOriginalID` (`bOriginalID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btCoreStackDisplay`
--

CREATE TABLE IF NOT EXISTS `btCoreStackDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `stID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btCoreStackDisplay`
--

INSERT INTO `btCoreStackDisplay` (`bID`, `stID`) VALUES
(30, 121),
(33, 121),
(36, 121),
(73, 137),
(78, 135);

-- --------------------------------------------------------

--
-- Struttura della tabella `btDashboardNewsflowLatest`
--

CREATE TABLE IF NOT EXISTS `btDashboardNewsflowLatest` (
  `bID` int(10) unsigned NOT NULL,
  `slot` varchar(1) NOT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btDashboardNewsflowLatest`
--

INSERT INTO `btDashboardNewsflowLatest` (`bID`, `slot`) VALUES
(8, 'A'),
(9, 'B'),
(12, 'C');

-- --------------------------------------------------------

--
-- Struttura della tabella `btDateArchive`
--

CREATE TABLE IF NOT EXISTS `btDateArchive` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `targetCID` int(11) DEFAULT NULL,
  `numMonths` int(11) DEFAULT '12',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btDateArchive`
--

INSERT INTO `btDateArchive` (`bID`, `title`, `targetCID`, `numMonths`) VALUES
(46, 'Archives', 132, 12),
(52, 'Archives', 132, 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `btDateNav`
--

CREATE TABLE IF NOT EXISTS `btDateNav` (
  `bID` int(10) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `cThis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ctID` smallint(5) unsigned DEFAULT NULL,
  `flatDisplay` int(11) DEFAULT '0',
  `defaultNode` varchar(64) DEFAULT 'current_page',
  `truncateTitles` int(11) DEFAULT '0',
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` int(11) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128',
  `truncateTitleChars` int(11) DEFAULT '128',
  `showDescriptions` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btExternalForm`
--

CREATE TABLE IF NOT EXISTS `btExternalForm` (
  `bID` int(10) unsigned NOT NULL,
  `filename` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btFlashContent`
--

CREATE TABLE IF NOT EXISTS `btFlashContent` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `minVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btForm`
--

CREATE TABLE IF NOT EXISTS `btForm` (
  `bID` int(10) unsigned NOT NULL,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `surveyName` varchar(255) DEFAULT NULL,
  `thankyouMsg` text,
  `notifyMeOnSubmission` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recipientEmail` varchar(255) DEFAULT NULL,
  `displayCaptcha` int(11) DEFAULT '1',
  `redirectCID` int(11) DEFAULT '0',
  `addFilesToSet` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`),
  KEY `questionSetIdForeign` (`questionSetId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btForm`
--

INSERT INTO `btForm` (`bID`, `questionSetId`, `surveyName`, `thankyouMsg`, `notifyMeOnSubmission`, `recipientEmail`, `displayCaptcha`, `redirectCID`, `addFilesToSet`) VALUES
(38, 1353597147, 'Contact Us', 'Thanks!', 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `btFormAnswers`
--

CREATE TABLE IF NOT EXISTS `btFormAnswers` (
  `aID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asID` int(10) unsigned DEFAULT '0',
  `msqID` int(10) unsigned DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `answerLong` text,
  PRIMARY KEY (`aID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `btFormAnswerSet`
--

CREATE TABLE IF NOT EXISTS `btFormAnswerSet` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`asID`),
  KEY `questionSetId` (`questionSetId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `btFormQuestions`
--

CREATE TABLE IF NOT EXISTS `btFormQuestions` (
  `qID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msqID` int(10) unsigned DEFAULT '0',
  `bID` int(10) unsigned DEFAULT '0',
  `questionSetId` int(10) unsigned DEFAULT '0',
  `question` varchar(255) DEFAULT NULL,
  `inputType` varchar(255) DEFAULT NULL,
  `options` text,
  `position` int(10) unsigned DEFAULT '1000',
  `width` int(10) unsigned DEFAULT '50',
  `height` int(10) unsigned DEFAULT '3',
  `required` int(11) DEFAULT '0',
  PRIMARY KEY (`qID`),
  KEY `questionSetId` (`questionSetId`),
  KEY `msqID` (`msqID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `btFormQuestions`
--

INSERT INTO `btFormQuestions` (`qID`, `msqID`, `bID`, `questionSetId`, `question`, `inputType`, `options`, `position`, `width`, `height`, `required`) VALUES
(5, 4, 38, 1353597147, 'Name', 'field', '', 0, 50, 3, 1),
(6, 5, 38, 1353597147, 'Email:', 'email', '', 0, 50, 3, 1),
(7, 6, 38, 1353597147, 'What are you contacting us about?', 'radios', 'Question%%Comment%%Urgent Issue%%To Say Hello%%Other', 0, 50, 3, 1),
(8, 7, 38, 1353597147, 'Message', 'text', '', 0, 50, 3, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `btGoogleMap`
--

CREATE TABLE IF NOT EXISTS `btGoogleMap` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zoom` int(8) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btGuestBook`
--

CREATE TABLE IF NOT EXISTS `btGuestBook` (
  `bID` int(10) unsigned NOT NULL,
  `requireApproval` int(11) DEFAULT '0',
  `title` varchar(100) DEFAULT 'Comments',
  `dateFormat` varchar(100) DEFAULT NULL,
  `displayGuestBookForm` int(11) DEFAULT '1',
  `displayCaptcha` int(11) DEFAULT '1',
  `authenticationRequired` int(11) DEFAULT '0',
  `notifyEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btGuestBook`
--

INSERT INTO `btGuestBook` (`bID`, `requireApproval`, `title`, `dateFormat`, `displayGuestBookForm`, `displayCaptcha`, `authenticationRequired`, `notifyEmail`) VALUES
(34, 0, 'Tell us what you think', 'M jS, Y', 1, 1, 0, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `btGuestBookEntries`
--

CREATE TABLE IF NOT EXISTS `btGuestBookEntries` (
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT '1',
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `uID` int(11) DEFAULT '0',
  `commentText` longtext,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `entryDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` int(11) DEFAULT '1',
  PRIMARY KEY (`entryID`),
  KEY `cID` (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `btNavigation`
--

CREATE TABLE IF NOT EXISTS `btNavigation` (
  `bID` int(10) unsigned NOT NULL,
  `orderBy` varchar(255) DEFAULT 'alpha_asc',
  `displayPages` varchar(255) DEFAULT 'top',
  `displayPagesCID` int(10) unsigned NOT NULL DEFAULT '1',
  `displayPagesIncludeSelf` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displaySubPages` varchar(255) DEFAULT 'none',
  `displaySubPageLevels` varchar(255) DEFAULT 'none',
  `displaySubPageLevelsNum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `displayUnavailablePages` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btNavigation`
--

INSERT INTO `btNavigation` (`bID`, `orderBy`, `displayPages`, `displayPagesCID`, `displayPagesIncludeSelf`, `displaySubPages`, `displaySubPageLevels`, `displaySubPageLevelsNum`, `displayUnavailablePages`) VALUES
(20, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0),
(22, 'display_asc', 'second_level', 0, 0, 'all', 'all', 0, 0),
(41, 'display_asc', 'top', 0, 0, 'all', 'all', 0, 0),
(55, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `btNextPrevious`
--

CREATE TABLE IF NOT EXISTS `btNextPrevious` (
  `bID` int(10) unsigned NOT NULL,
  `linkStyle` varchar(32) DEFAULT NULL,
  `nextLabel` varchar(128) DEFAULT NULL,
  `previousLabel` varchar(128) DEFAULT NULL,
  `parentLabel` varchar(128) DEFAULT NULL,
  `showArrows` int(11) DEFAULT '1',
  `loopSequence` int(11) DEFAULT '1',
  `orderBy` varchar(20) DEFAULT 'display_asc',
  `excludeSystemPages` int(11) DEFAULT '1',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btPageList`
--

CREATE TABLE IF NOT EXISTS `btPageList` (
  `bID` int(10) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL,
  `orderBy` varchar(32) DEFAULT NULL,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `cThis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `includeAllDescendents` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `paginate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayAliases` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ctID` smallint(5) unsigned DEFAULT NULL,
  `rss` int(11) DEFAULT '0',
  `rssTitle` varchar(255) DEFAULT NULL,
  `rssDescription` longtext,
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` int(11) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btPageList`
--

INSERT INTO `btPageList` (`bID`, `num`, `orderBy`, `cParentID`, `cThis`, `includeAllDescendents`, `paginate`, `displayAliases`, `ctID`, `rss`, `rssTitle`, `rssDescription`, `truncateSummaries`, `displayFeaturedOnly`, `truncateChars`) VALUES
(43, 12, 'chrono_desc', 128, 0, 0, 1, 0, 4, 0, '', '', 1, 0, 128);

-- --------------------------------------------------------

--
-- Struttura della tabella `btRssDisplay`
--

CREATE TABLE IF NOT EXISTS `btRssDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `dateFormat` varchar(100) DEFAULT NULL,
  `itemsToDisplay` int(10) unsigned DEFAULT '5',
  `showSummary` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `launchInNewWindow` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btSearch`
--

CREATE TABLE IF NOT EXISTS `btSearch` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `buttonText` varchar(128) DEFAULT NULL,
  `baseSearchPath` varchar(255) DEFAULT NULL,
  `postTo_cID` varchar(255) DEFAULT NULL,
  `resultsURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btSearch`
--

INSERT INTO `btSearch` (`bID`, `title`, `buttonText`, `baseSearchPath`, `postTo_cID`, `resultsURL`) VALUES
(42, 'Search This Site', 'Search', '', '', ''),
(50, 'Search Blog', 'Search', '/blog', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `btSlideshow`
--

CREATE TABLE IF NOT EXISTS `btSlideshow` (
  `bID` int(10) unsigned NOT NULL,
  `fsID` int(10) unsigned DEFAULT NULL,
  `playback` varchar(50) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `fadeDuration` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btSlideshowImg`
--

CREATE TABLE IF NOT EXISTS `btSlideshowImg` (
  `slideshowImgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned DEFAULT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `fadeDuration` int(10) unsigned DEFAULT NULL,
  `groupSet` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `imgHeight` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`slideshowImgId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `btSurvey`
--

CREATE TABLE IF NOT EXISTS `btSurvey` (
  `bID` int(10) unsigned NOT NULL,
  `question` varchar(255) DEFAULT '',
  `requiresRegistration` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btSurvey`
--

INSERT INTO `btSurvey` (`bID`, `question`, `requiresRegistration`) VALUES
(83, 'Open source', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `btSurveyOptions`
--

CREATE TABLE IF NOT EXISTS `btSurveyOptions` (
  `optionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(11) DEFAULT NULL,
  `optionName` varchar(255) DEFAULT NULL,
  `displayOrder` int(11) DEFAULT '0',
  PRIMARY KEY (`optionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `btSurveyOptions`
--

INSERT INTO `btSurveyOptions` (`optionID`, `bID`, `optionName`, `displayOrder`) VALUES
(1, 83, 'domanda 1', 0),
(2, 83, 'si', 1),
(3, 83, 'no', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `btSurveyResults`
--

CREATE TABLE IF NOT EXISTS `btSurveyResults` (
  `resultID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `optionID` int(10) unsigned DEFAULT '0',
  `uID` int(10) unsigned DEFAULT '0',
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `ipAddress` varchar(128) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`resultID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `btSurveyResults`
--

INSERT INTO `btSurveyResults` (`resultID`, `optionID`, `uID`, `bID`, `cID`, `ipAddress`, `timestamp`) VALUES
(1, 2, 0, 83, 1, '77.242.184.232', '2014-02-25 12:16:12'),
(2, 2, 0, 83, 1, '93.43.147.214', '2014-05-13 18:46:13'),
(3, 3, 0, 83, 1, '188.228.172.188', '2014-07-16 11:35:00'),
(4, 3, 0, 83, 1, '95.236.242.213', '2014-07-26 07:35:08'),
(5, 2, 0, 83, 1, '212.124.191.238', '2014-09-29 14:35:06'),
(6, 2, 0, 83, 1, '212.124.191.238', '2014-10-22 06:34:26');

-- --------------------------------------------------------

--
-- Struttura della tabella `btTags`
--

CREATE TABLE IF NOT EXISTS `btTags` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `targetCID` int(11) DEFAULT NULL,
  `displayMode` varchar(20) DEFAULT 'page',
  `cloudCount` int(11) DEFAULT '10',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btTags`
--

INSERT INTO `btTags` (`bID`, `title`, `targetCID`, `displayMode`, `cloudCount`) VALUES
(14, 'Tags', 132, 'page', 0),
(45, '', 132, 'cloud', 0),
(51, 'Tags', 132, 'cloud', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `btVideo`
--

CREATE TABLE IF NOT EXISTS `btVideo` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `btWaveText`
--

CREATE TABLE IF NOT EXISTS `btWaveText` (
  `bID` int(10) unsigned NOT NULL,
  `wtText` text,
  `wtPeriod` decimal(32,0) DEFAULT NULL,
  `wtAmplitude` varchar(32) DEFAULT NULL,
  `wtLetterSpace` varchar(32) DEFAULT NULL,
  `wtColor` varchar(100) DEFAULT NULL,
  `wtFormat` varchar(32) DEFAULT 'h3',
  `wtHeight` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `btWaveText`
--

INSERT INTO `btWaveText` (`bID`, `wtText`, `wtPeriod`, `wtAmplitude`, `wtLetterSpace`, `wtColor`, `wtFormat`, `wtHeight`) VALUES
(59, 'Open Revolution', '50', '20', '14', '#000000', 'h3', '50');

-- --------------------------------------------------------

--
-- Struttura della tabella `btYouTube`
--

CREATE TABLE IF NOT EXISTS `btYouTube` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `videoURL` varchar(255) DEFAULT NULL,
  `vHeight` varchar(255) DEFAULT NULL,
  `vWidth` varchar(255) DEFAULT NULL,
  `vPlayer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `CollectionAttributeValues`
--

CREATE TABLE IF NOT EXISTS `CollectionAttributeValues` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`akID`,`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `CollectionAttributeValues`
--

INSERT INTO `CollectionAttributeValues` (`cID`, `cvID`, `akID`, `avID`) VALUES
(3, 1, 3, 1),
(3, 1, 4, 2),
(4, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 3, 5),
(5, 1, 4, 6),
(6, 1, 3, 7),
(7, 1, 3, 8),
(7, 1, 4, 9),
(8, 1, 3, 10),
(8, 1, 4, 11),
(9, 1, 3, 12),
(9, 1, 4, 13),
(11, 1, 3, 14),
(11, 1, 4, 15),
(12, 1, 3, 16),
(12, 1, 4, 17),
(13, 1, 3, 18),
(13, 1, 4, 19),
(14, 1, 3, 21),
(14, 1, 4, 22),
(14, 1, 5, 20),
(15, 1, 3, 23),
(16, 1, 3, 24),
(16, 1, 4, 25),
(17, 1, 3, 26),
(17, 1, 4, 27),
(18, 1, 3, 28),
(18, 1, 4, 29),
(19, 1, 3, 30),
(19, 1, 4, 32),
(19, 1, 5, 31),
(20, 1, 3, 33),
(20, 1, 4, 35),
(20, 1, 5, 34),
(21, 1, 3, 36),
(21, 1, 4, 37),
(22, 1, 3, 38),
(23, 1, 3, 39),
(23, 1, 4, 40),
(24, 1, 3, 41),
(24, 1, 4, 42),
(25, 1, 3, 43),
(25, 1, 4, 44),
(26, 1, 3, 45),
(26, 1, 4, 46),
(28, 1, 3, 47),
(28, 1, 4, 48),
(29, 1, 3, 49),
(30, 1, 3, 50),
(31, 1, 3, 51),
(32, 1, 3, 52),
(32, 1, 4, 53),
(34, 1, 3, 54),
(34, 1, 4, 55),
(35, 1, 3, 56),
(35, 1, 4, 57),
(36, 1, 3, 58),
(37, 1, 4, 59),
(38, 1, 4, 60),
(40, 1, 3, 61),
(40, 1, 4, 62),
(41, 1, 4, 63),
(42, 1, 5, 64),
(42, 1, 8, 65),
(43, 1, 3, 66),
(43, 1, 4, 67),
(44, 1, 5, 68),
(45, 1, 5, 69),
(46, 1, 3, 70),
(47, 1, 3, 71),
(48, 1, 3, 72),
(49, 1, 3, 73),
(50, 1, 3, 74),
(51, 1, 5, 75),
(53, 1, 3, 76),
(54, 1, 3, 77),
(55, 1, 3, 78),
(56, 1, 3, 79),
(57, 1, 3, 80),
(58, 1, 3, 81),
(60, 1, 3, 82),
(61, 1, 3, 83),
(62, 1, 3, 84),
(63, 1, 3, 85),
(64, 1, 3, 86),
(66, 1, 3, 87),
(67, 1, 3, 88),
(68, 1, 3, 89),
(70, 1, 3, 90),
(71, 1, 3, 91),
(72, 1, 3, 92),
(73, 1, 3, 93),
(76, 1, 3, 94),
(77, 1, 3, 95),
(78, 1, 3, 96),
(79, 1, 3, 97),
(81, 1, 3, 98),
(82, 1, 3, 99),
(83, 1, 3, 100),
(84, 1, 3, 101),
(85, 1, 3, 102),
(86, 1, 3, 103),
(87, 1, 3, 104),
(88, 1, 3, 105),
(89, 1, 3, 106),
(90, 1, 8, 107),
(91, 1, 3, 108),
(92, 1, 3, 109),
(93, 1, 3, 110),
(94, 1, 3, 111),
(95, 1, 3, 112),
(96, 1, 3, 113),
(98, 1, 3, 114),
(99, 1, 3, 115),
(104, 1, 5, 117),
(104, 1, 8, 118),
(105, 1, 5, 116),
(128, 1, 14, 135),
(132, 1, 5, 137),
(132, 1, 6, 138),
(132, 1, 8, 139),
(132, 1, 14, 140),
(133, 1, 14, 136);

-- --------------------------------------------------------

--
-- Struttura della tabella `Collections`
--

CREATE TABLE IF NOT EXISTS `Collections` (
  `cID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cHandle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `cDateModified` (`cDateModified`),
  KEY `cDateAdded` (`cDateAdded`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=141 ;

--
-- Dump dei dati per la tabella `Collections`
--

INSERT INTO `Collections` (`cID`, `cDateAdded`, `cDateModified`, `cHandle`) VALUES
(1, '2012-11-22 16:12:13', '2014-01-02 18:06:01', 'home'),
(2, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'dashboard'),
(3, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'composer'),
(4, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'write'),
(5, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'drafts'),
(6, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'sitemap'),
(7, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'full'),
(8, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'explore'),
(9, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'search'),
(10, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'files'),
(11, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'search'),
(12, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'attributes'),
(13, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'sets'),
(14, '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'add_set'),
(15, '2012-11-22 16:12:16', '2012-11-22 16:12:17', 'users'),
(16, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'search'),
(17, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'groups'),
(18, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'attributes'),
(19, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'add'),
(20, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'add_group'),
(21, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'group_sets'),
(22, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'reports'),
(23, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'statistics'),
(24, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'forms'),
(25, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'surveys'),
(26, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'logs'),
(27, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'pages'),
(28, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'themes'),
(29, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'add'),
(30, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'inspect'),
(31, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'customize'),
(32, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'types'),
(33, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'add'),
(34, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'attributes'),
(35, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'single'),
(36, '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'workflow'),
(37, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'list'),
(38, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'me'),
(39, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'blocks'),
(40, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'stacks'),
(41, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'permissions'),
(42, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'list'),
(43, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'types'),
(44, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'extend'),
(45, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'news'),
(46, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'install'),
(47, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'update'),
(48, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'connect'),
(49, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'themes'),
(50, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'add-ons'),
(51, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'system'),
(52, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'basics'),
(53, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'site_name'),
(54, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'icons'),
(55, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'editor'),
(56, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'multilingual'),
(57, '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'timezone'),
(58, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'interface'),
(59, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'seo'),
(60, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'urls'),
(61, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'bulk_seo_tool'),
(62, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'tracking_codes'),
(63, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'statistics'),
(64, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'search_index'),
(65, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'optimization'),
(66, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'cache'),
(67, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'clear_cache'),
(68, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'jobs'),
(69, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'permissions'),
(70, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'site'),
(71, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'files'),
(72, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'file_types'),
(73, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'tasks'),
(74, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'users'),
(75, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'advanced'),
(76, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'ip_blacklist'),
(77, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'captcha'),
(78, '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'antispam'),
(79, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'maintenance_mode'),
(80, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'registration'),
(81, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'postlogin'),
(82, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'profiles'),
(83, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'public_registration'),
(84, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'mail'),
(85, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'method'),
(86, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'importers'),
(87, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'attributes'),
(88, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'sets'),
(89, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'types'),
(90, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'environment'),
(91, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'info'),
(92, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'debug'),
(93, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'logging'),
(94, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'file_storage_locations'),
(95, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'proxy'),
(96, '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'backup_restore'),
(97, '2012-11-22 16:12:20', '2012-11-22 16:12:21', 'backup'),
(98, '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'update'),
(99, '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'database'),
(100, '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'composer'),
(101, '2012-11-22 16:12:21', '2012-11-22 16:12:21', NULL),
(102, '2012-11-22 16:12:21', '2012-11-22 16:12:21', NULL),
(103, '2012-11-22 16:12:21', '2012-11-22 16:12:21', NULL),
(104, '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'home'),
(105, '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'welcome'),
(106, '2012-11-22 16:12:23', '2012-11-22 16:12:23', '!drafts'),
(107, '2012-11-22 16:12:23', '2012-11-22 16:12:23', '!trash'),
(108, '2012-11-22 16:12:23', '2012-11-22 16:12:23', '!stacks'),
(109, '2012-11-22 16:12:23', '2012-11-22 16:12:23', 'login'),
(110, '2012-11-22 16:12:23', '2012-11-22 16:12:23', 'register'),
(111, '2012-11-22 16:12:23', '2012-11-22 16:12:23', 'profile'),
(112, '2012-11-22 16:12:24', '2013-11-25 22:00:09', 'edit'),
(113, '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'avatar'),
(114, '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'messages'),
(115, '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'friends'),
(116, '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'page_not_found'),
(117, '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'page_forbidden'),
(118, '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'download_file'),
(119, '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'members'),
(120, '2012-11-22 16:12:26', '2012-11-22 16:12:26', 'header-nav'),
(121, '2012-11-22 16:12:26', '2012-11-22 16:12:26', 'side-nav'),
(122, '2012-11-22 16:12:26', '2012-11-22 16:12:26', 'site-name'),
(123, '2012-11-22 16:12:26', '2012-11-22 16:12:26', NULL),
(124, '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL),
(125, '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL),
(126, '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL),
(127, '2012-11-22 16:12:27', '2013-11-25 21:55:38', 'about'),
(128, '2012-11-22 16:12:27', '2013-11-25 21:55:44', 'blog'),
(129, '2012-11-22 16:12:27', '2013-11-25 21:55:50', 'search'),
(130, '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'contact-us'),
(131, '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'guestbook'),
(132, '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'blog-archives'),
(133, '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'hello-world'),
(134, '2012-11-22 16:59:15', '2013-11-25 22:04:54', 'test'),
(136, '2013-05-03 08:27:38', '2013-05-03 08:27:38', 'excluded'),
(137, '2013-05-21 20:42:56', '2013-05-25 11:05:09', 'linksocial'),
(138, '2013-11-12 10:36:22', '2013-11-25 22:04:50', 'test'),
(139, '2013-11-25 21:56:06', '2013-11-25 22:04:47', 'aaa'),
(140, '2013-12-31 21:46:43', '2013-12-31 21:46:43', 'custom-template');

-- --------------------------------------------------------

--
-- Struttura della tabella `CollectionSearchIndexAttributes`
--

CREATE TABLE IF NOT EXISTS `CollectionSearchIndexAttributes` (
  `cID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_meta_title` text,
  `ak_meta_description` text,
  `ak_meta_keywords` text,
  `ak_icon_dashboard` text,
  `ak_exclude_nav` tinyint(4) DEFAULT '0',
  `ak_exclude_page_list` tinyint(4) DEFAULT '0',
  `ak_header_extra_content` text,
  `ak_exclude_search_index` tinyint(4) DEFAULT '0',
  `ak_exclude_sitemapxml` tinyint(4) DEFAULT '0',
  `ak_tags` text,
  PRIMARY KEY (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `CollectionSearchIndexAttributes`
--

INSERT INTO `CollectionSearchIndexAttributes` (`cID`, `ak_meta_title`, `ak_meta_description`, `ak_meta_keywords`, `ak_icon_dashboard`, `ak_exclude_nav`, `ak_exclude_page_list`, `ak_header_extra_content`, `ak_exclude_search_index`, `ak_exclude_sitemapxml`, `ak_tags`) VALUES
(3, NULL, NULL, 'blog, blogging', 'icon-book', 0, 0, NULL, 0, 0, NULL),
(4, NULL, NULL, 'new blog, write blog, blogging', 'icon-pencil', 0, 0, NULL, 0, 0, NULL),
(5, NULL, NULL, 'blog drafts,composer', 'icon-book', 0, 0, NULL, 0, 0, NULL),
(6, NULL, NULL, 'pages, add page, delete page, copy, move, alias', NULL, 0, 0, NULL, 0, 0, NULL),
(7, NULL, NULL, 'pages, add page, delete page, copy, move, alias', 'icon-home', 0, 0, NULL, 0, 0, NULL),
(8, NULL, NULL, 'pages, add page, delete page, copy, move, alias, bulk', 'icon-road', 0, 0, NULL, 0, 0, NULL),
(9, NULL, NULL, 'find page, search page, search, find, pages, sitemap', 'icon-search', 0, 0, NULL, 0, 0, NULL),
(11, NULL, NULL, 'add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute', 'icon-picture', 0, 0, NULL, 0, 0, NULL),
(12, NULL, NULL, 'file, file attributes, title, attribute, description, rename', 'icon-cog', 0, 0, NULL, 0, 0, NULL),
(13, NULL, NULL, 'files, category, categories', 'icon-list-alt', 0, 0, NULL, 0, 0, NULL),
(14, NULL, NULL, 'new file set', 'icon-plus-sign', 1, 0, NULL, 0, 0, NULL),
(15, NULL, NULL, 'users, groups, people, find, delete user, remove user, change password, password', NULL, 0, 0, NULL, 0, 0, NULL),
(16, NULL, NULL, 'find, search, people, delete user, remove user, change password, password', 'icon-user', 0, 0, NULL, 0, 0, NULL),
(17, NULL, NULL, 'user, group, people, permissions, access, expire', 'icon-globe', 0, 0, NULL, 0, 0, NULL),
(18, NULL, NULL, 'user attributes, user data, gather data, registration data', 'icon-cog', 0, 0, NULL, 0, 0, NULL),
(19, NULL, NULL, 'new user, create', 'icon-plus-sign', 1, 0, NULL, 0, 0, NULL),
(20, NULL, NULL, 'new user group, new group, group, create', 'icon-plus', 1, 0, NULL, 0, 0, NULL),
(21, NULL, NULL, 'group set', 'icon-list', 0, 0, NULL, 0, 0, NULL),
(22, NULL, NULL, 'forms, log, error, email, mysql, exception, survey', NULL, 0, 0, NULL, 0, 0, NULL),
(23, NULL, NULL, 'hits, pageviews, visitors, activity', 'icon-signal', 0, 0, NULL, 0, 0, NULL),
(24, NULL, NULL, 'forms, questions, response, data', 'icon-briefcase', 0, 0, NULL, 0, 0, NULL),
(25, NULL, NULL, 'questions, quiz, response', 'icon-tasks', 0, 0, NULL, 0, 0, NULL),
(26, NULL, NULL, 'forms, log, error, email, mysql, exception, survey, history', 'icon-time', 0, 0, NULL, 0, 0, NULL),
(28, NULL, NULL, 'new theme, theme, active theme, change theme, template, css', 'icon-font', 0, 0, NULL, 0, 0, NULL),
(29, NULL, NULL, 'theme', NULL, 0, 0, NULL, 0, 0, NULL),
(30, NULL, NULL, 'page types', NULL, 0, 0, NULL, 0, 0, NULL),
(31, NULL, NULL, 'custom theme, change theme, custom css, css', NULL, 0, 0, NULL, 0, 0, NULL),
(32, NULL, NULL, 'page type defaults, global block, global area, starter, template', 'icon-file', 0, 0, NULL, 0, 0, NULL),
(34, NULL, NULL, 'page attributes, custom', 'icon-cog', 0, 0, NULL, 0, 0, NULL),
(35, NULL, NULL, 'single, page, custom, application', 'icon-wrench', 0, 0, NULL, 0, 0, NULL),
(36, NULL, NULL, 'add workflow, remove workflow', NULL, 0, 0, NULL, 0, 0, NULL),
(37, NULL, NULL, NULL, 'icon-list', 0, 0, NULL, 0, 0, NULL),
(38, NULL, NULL, NULL, 'icon-user', 0, 0, NULL, 0, 0, NULL),
(40, NULL, NULL, 'stacks, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo', 'icon-th', 0, 0, NULL, 0, 0, NULL),
(41, NULL, NULL, NULL, 'icon-lock', 0, 0, NULL, 0, 0, NULL),
(42, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, NULL),
(43, NULL, NULL, 'block, refresh, custom', 'icon-wrench', 0, 0, NULL, 0, 0, NULL),
(44, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL),
(45, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL),
(46, NULL, NULL, 'add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks', NULL, 0, 0, NULL, 0, 0, NULL),
(47, NULL, NULL, 'update, upgrade', NULL, 0, 0, NULL, 0, 0, NULL),
(48, NULL, NULL, 'concrete5.org, my account, marketplace', NULL, 0, 0, NULL, 0, 0, NULL),
(49, NULL, NULL, 'buy theme, new theme, marketplace, template', NULL, 0, 0, NULL, 0, 0, NULL),
(50, NULL, NULL, 'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace', NULL, 0, 0, NULL, 0, 0, NULL),
(51, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL),
(53, NULL, NULL, 'website name, title', NULL, 0, 0, NULL, 0, 0, NULL),
(54, NULL, NULL, 'logo, favicon, iphone, icon, bookmark', NULL, 0, 0, NULL, 0, 0, NULL),
(55, NULL, NULL, 'tinymce, content block, fonts, editor, tinymce, content, overlay', NULL, 0, 0, NULL, 0, 0, NULL),
(56, NULL, NULL, 'translate, translation, internationalization, multilingual, translate', NULL, 0, 0, NULL, 0, 0, NULL),
(57, NULL, NULL, 'timezone, profile, locale', NULL, 0, 0, NULL, 0, 0, NULL),
(58, NULL, NULL, 'interface, quick nav, dashboard background, background image', NULL, 0, 0, NULL, 0, 0, NULL),
(60, NULL, NULL, 'vanity, pretty url, seo, pageview, view', NULL, 0, 0, NULL, 0, 0, NULL),
(61, NULL, NULL, 'bulk, seo, change keywords, engine, optimization, search', NULL, 0, 0, NULL, 0, 0, NULL),
(62, NULL, NULL, 'traffic, statistics, google analytics, quant, pageviews, hits', NULL, 0, 0, NULL, 0, 0, NULL),
(63, NULL, NULL, 'turn off statistics, tracking, statistics, pageviews, hits', NULL, 0, 0, NULL, 0, 0, NULL),
(64, NULL, NULL, 'configure search, site search, search option', NULL, 0, 0, NULL, 0, 0, NULL),
(66, NULL, NULL, 'cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching', NULL, 0, 0, NULL, 0, 0, NULL),
(67, NULL, NULL, 'cache option, turn off cache, no cache, page cache, caching', NULL, 0, 0, NULL, 0, 0, NULL),
(68, NULL, NULL, 'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old', NULL, 0, 0, NULL, 0, 0, NULL),
(70, NULL, NULL, 'editors, hide site, offline, private, public, access', NULL, 0, 0, NULL, 0, 0, NULL),
(71, NULL, NULL, 'file options, file manager, upload, modify', NULL, 0, 0, NULL, 0, 0, NULL),
(72, NULL, NULL, 'security, files, media, extension, manager, upload', NULL, 0, 0, NULL, 0, 0, NULL),
(73, NULL, NULL, 'security, actions, administrator, admin, package, marketplace, search', NULL, 0, 0, NULL, 0, 0, NULL),
(76, NULL, NULL, 'security, lock ip, lock out, block ip, address, restrict, access', NULL, 0, 0, NULL, 0, 0, NULL),
(77, NULL, NULL, 'security, registration', NULL, 0, 0, NULL, 0, 0, NULL),
(78, NULL, NULL, 'antispam, block spam, security', NULL, 0, 0, NULL, 0, 0, NULL),
(79, NULL, NULL, 'lock site, under construction, hide, hidden', NULL, 0, 0, NULL, 0, 0, NULL),
(81, NULL, NULL, 'profile, login, redirect, specific, dashboard, administrators', NULL, 0, 0, NULL, 0, 0, NULL),
(82, NULL, NULL, 'member profile, member page,community, forums, social, avatar', NULL, 0, 0, NULL, 0, 0, NULL),
(83, NULL, NULL, 'signup, new user, community', NULL, 0, 0, NULL, 0, 0, NULL),
(84, NULL, NULL, 'smtp, mail settings', NULL, 0, 0, NULL, 0, 0, NULL),
(85, NULL, NULL, 'email server, mail settings, mail configuration, external, internal', NULL, 0, 0, NULL, 0, 0, NULL),
(86, NULL, NULL, 'email server, mail settings, mail configuration, private message, message system, import, email, message', NULL, 0, 0, NULL, 0, 0, NULL),
(87, NULL, NULL, 'attribute configuration', NULL, 0, 0, NULL, 0, 0, NULL),
(88, NULL, NULL, 'attributes, sets', NULL, 0, 0, NULL, 0, 0, NULL),
(89, NULL, NULL, 'attributes, types', NULL, 0, 0, NULL, 0, 0, NULL),
(90, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, NULL),
(91, NULL, NULL, 'overrides, system info, debug, support,help', NULL, 0, 0, NULL, 0, 0, NULL),
(92, NULL, NULL, 'errors,exceptions, develop, support, help', NULL, 0, 0, NULL, 0, 0, NULL),
(93, NULL, NULL, 'email, logging, logs, smtp, pop, errors, mysql, errors, log', NULL, 0, 0, NULL, 0, 0, NULL),
(94, NULL, NULL, 'security, alternate storage, hide files', NULL, 0, 0, NULL, 0, 0, NULL),
(95, NULL, NULL, 'network, proxy server', NULL, 0, 0, NULL, 0, 0, NULL),
(96, NULL, NULL, 'export, backup, database, sql, mysql, encryption, restore', NULL, 0, 0, NULL, 0, 0, NULL),
(98, NULL, NULL, 'upgrade, new version, update', NULL, 0, 0, NULL, 0, 0, NULL),
(99, NULL, NULL, 'export, database, xml, starting, points, schema, refresh, custom, tables', NULL, 0, 0, NULL, 0, 0, NULL),
(105, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, NULL),
(104, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, NULL),
(1, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(127, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(131, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(130, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(129, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(128, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '\n'),
(133, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '\ncomposer\nhello\nworld\nfirst post\n'),
(132, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 0, '\n'),
(134, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(137, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(138, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(139, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL),
(140, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `CollectionVersionAreaLayouts`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionAreaLayouts` (
  `cvalID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cvID` int(10) unsigned DEFAULT '0',
  `arHandle` varchar(255) DEFAULT NULL,
  `layoutID` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) DEFAULT '1000',
  `areaNameNumber` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cvalID`),
  KEY `areaLayoutsIndex` (`cID`,`cvID`,`arHandle`),
  KEY `cID` (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `CollectionVersionAreaStyles`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionAreaStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`arHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `CollectionVersionAreaStyles`
--

INSERT INTO `CollectionVersionAreaStyles` (`cID`, `cvID`, `arHandle`, `csrID`) VALUES
(1, 24, 'Main', 45),
(1, 25, 'Main', 45),
(1, 26, 'Main', 45),
(1, 27, 'Main', 45),
(1, 28, 'Main', 45);

-- --------------------------------------------------------

--
-- Struttura della tabella `CollectionVersionBlocks`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionBlocks` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `cbDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `isOriginal` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cbOverrideAreaPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `cbIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  KEY `cbIncludeAll` (`cbIncludeAll`),
  KEY `isOriginal` (`isOriginal`),
  KEY `bID` (`bID`),
  KEY `cIDcvID` (`cID`,`cvID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `CollectionVersionBlocks`
--

INSERT INTO `CollectionVersionBlocks` (`cID`, `cvID`, `bID`, `arHandle`, `cbDisplayOrder`, `isOriginal`, `cbOverrideAreaPermissions`, `cbIncludeAll`) VALUES
(105, 1, 1, 'Header', 0, 1, 0, 0),
(105, 1, 2, 'Column 1', 0, 1, 0, 0),
(105, 1, 3, 'Column 2', 0, 1, 0, 0),
(105, 1, 4, 'Column 3', 0, 1, 0, 0),
(105, 1, 5, 'Column 4', 0, 1, 0, 0),
(104, 1, 6, 'Primary', 0, 1, 0, 0),
(104, 1, 7, 'Primary', 1, 1, 0, 0),
(104, 1, 8, 'Secondary 1', 0, 1, 0, 0),
(104, 1, 9, 'Secondary 2', 0, 1, 0, 0),
(104, 1, 10, 'Secondary 3', 0, 1, 0, 0),
(104, 1, 11, 'Secondary 4', 0, 1, 0, 0),
(104, 1, 12, 'Secondary 5', 0, 1, 0, 0),
(123, 1, 13, 'Main', 0, 1, 0, 0),
(123, 1, 14, 'Sidebar', 0, 1, 0, 0),
(123, 1, 15, 'Thumbnail Image', 0, 1, 0, 0),
(123, 1, 16, 'Header Image', 0, 1, 0, 0),
(124, 1, 17, 'Header Image', 0, 1, 0, 0),
(125, 1, 18, 'Header Image', 0, 1, 0, 0),
(126, 1, 19, 'Header Image', 0, 1, 0, 0),
(120, 1, 20, 'Main', 0, 1, 0, 0),
(121, 1, 21, 'Main', 0, 1, 0, 0),
(121, 1, 22, 'Main', 1, 1, 0, 0),
(122, 1, 23, 'Main', 0, 1, 0, 0),
(1, 1, 24, 'Header', 0, 1, 0, 0),
(1, 1, 25, 'Sidebar', 0, 1, 0, 0),
(1, 1, 26, 'Sidebar', 1, 1, 0, 0),
(1, 1, 27, 'Main', 0, 1, 0, 0),
(1, 1, 28, 'Header Image', 0, 1, 0, 0),
(127, 1, 29, 'Header', 0, 1, 0, 0),
(127, 1, 30, 'Sidebar', 0, 1, 0, 0),
(127, 1, 31, 'Main', 0, 1, 0, 0),
(127, 1, 18, 'Header Image', 0, 0, 0, 0),
(131, 1, 32, 'Header', 0, 1, 0, 0),
(131, 1, 33, 'Sidebar', 0, 1, 0, 0),
(131, 1, 34, 'Main', 0, 1, 0, 1),
(131, 1, 19, 'Header Image', 0, 0, 0, 0),
(130, 1, 35, 'Header', 0, 1, 0, 0),
(130, 1, 36, 'Sidebar', 0, 1, 0, 0),
(130, 1, 37, 'Main', 0, 1, 0, 0),
(130, 1, 38, 'Main', 1, 1, 0, 0),
(130, 1, 18, 'Header Image', 0, 0, 0, 0),
(129, 1, 39, 'Header', 0, 1, 0, 0),
(129, 1, 40, 'Sidebar', 0, 1, 0, 0),
(129, 1, 41, 'Sidebar', 1, 1, 0, 0),
(129, 1, 42, 'Main', 0, 1, 0, 0),
(129, 1, 19, 'Header Image', 0, 0, 0, 0),
(128, 1, 43, 'Main', 0, 1, 0, 0),
(128, 1, 44, 'Sidebar', 0, 1, 0, 0),
(128, 1, 45, 'Sidebar', 1, 1, 0, 0),
(128, 1, 46, 'Sidebar', 2, 1, 0, 0),
(128, 1, 19, 'Header Image', 0, 0, 0, 0),
(133, 1, 47, 'Header Image', 0, 1, 0, 0),
(133, 1, 14, 'Sidebar', 0, 0, 0, 0),
(133, 1, 48, 'Main', 0, 1, 0, 0),
(133, 1, 49, 'Thumbnail Image', 0, 1, 0, 0),
(132, 1, 19, 'Header Image', 0, 0, 0, 0),
(132, 1, 50, 'Main', 0, 1, 0, 0),
(132, 1, 51, 'Sidebar', 0, 1, 0, 0),
(132, 1, 52, 'Sidebar', 1, 1, 0, 0),
(1, 2, 54, 'Main', 0, 1, 0, 0),
(1, 2, 25, 'Sidebar', 0, 0, 0, 0),
(134, 1, 13, 'Main', 0, 0, 0, 0),
(1, 2, 28, 'Header Image', 0, 0, 0, 0),
(1, 2, 26, 'Sidebar', 1, 0, 0, 0),
(1, 2, 53, 'Header', 0, 1, 0, 0),
(134, 1, 14, 'Sidebar', 0, 0, 0, 0),
(134, 1, 15, 'Thumbnail Image', 0, 0, 0, 0),
(134, 1, 16, 'Header Image', 0, 0, 0, 0),
(1, 3, 25, 'Sidebar', 0, 0, 0, 0),
(1, 3, 28, 'Header Image', 0, 0, 0, 0),
(1, 3, 57, 'Main', 0, 1, 0, 0),
(1, 4, 25, 'Sidebar', 0, 0, 0, 0),
(1, 3, 26, 'Sidebar', 1, 0, 0, 0),
(1, 3, 55, 'Sidebar', 2, 1, 0, 0),
(1, 3, 56, 'Header', 0, 1, 0, 0),
(1, 4, 28, 'Header Image', 0, 0, 0, 0),
(1, 4, 56, 'Header', 0, 0, 0, 0),
(1, 4, 59, 'Main', 1, 1, 0, 0),
(1, 4, 26, 'Sidebar', 1, 0, 0, 0),
(1, 4, 55, 'Sidebar', 2, 0, 0, 0),
(1, 4, 58, 'Main', 0, 1, 0, 0),
(1, 5, 25, 'Sidebar', 0, 0, 0, 0),
(1, 5, 28, 'Header Image', 0, 0, 0, 0),
(1, 6, 25, 'Sidebar', 0, 0, 0, 0),
(1, 5, 58, 'Main', 0, 0, 0, 0),
(1, 5, 26, 'Sidebar', 1, 0, 0, 0),
(1, 5, 59, 'Main', 1, 0, 0, 0),
(1, 5, 55, 'Sidebar', 2, 0, 0, 0),
(1, 5, 60, 'Header', 0, 1, 0, 0),
(1, 6, 28, 'Header Image', 0, 0, 0, 0),
(1, 6, 58, 'Main', 0, 0, 0, 0),
(1, 6, 60, 'Header', 0, 0, 0, 0),
(1, 6, 26, 'Sidebar', 1, 0, 0, 0),
(1, 7, 25, 'Sidebar', 0, 0, 0, 0),
(1, 6, 55, 'Sidebar', 2, 0, 0, 0),
(1, 7, 28, 'Header Image', 0, 0, 0, 0),
(1, 8, 25, 'Sidebar', 0, 0, 0, 0),
(1, 7, 60, 'Header', 0, 0, 0, 0),
(1, 7, 62, 'Main', 0, 1, 0, 0),
(1, 7, 55, 'Sidebar', 2, 0, 0, 0),
(1, 7, 61, 'Sidebar', 1, 1, 0, 0),
(1, 8, 28, 'Header Image', 0, 0, 0, 0),
(1, 8, 60, 'Header', 0, 0, 0, 0),
(1, 9, 25, 'Sidebar', 0, 0, 0, 0),
(1, 8, 61, 'Sidebar', 1, 0, 0, 0),
(1, 8, 55, 'Sidebar', 2, 0, 0, 0),
(1, 8, 63, 'Main', 0, 1, 0, 0),
(1, 9, 28, 'Header Image', 0, 0, 0, 0),
(1, 9, 60, 'Header', 0, 0, 0, 0),
(1, 9, 63, 'Main', 0, 0, 0, 0),
(1, 9, 61, 'Sidebar', 1, 0, 0, 0),
(1, 9, 55, 'Sidebar', 2, 0, 0, 0),
(1, 10, 25, 'Sidebar', 0, 0, 0, 0),
(1, 10, 28, 'Header Image', 0, 0, 0, 0),
(1, 10, 60, 'Header', 0, 0, 0, 0),
(1, 11, 25, 'Sidebar', 0, 0, 0, 0),
(1, 10, 61, 'Sidebar', 1, 0, 0, 0),
(1, 10, 55, 'Sidebar', 2, 0, 0, 0),
(1, 10, 64, 'Main', 0, 1, 0, 0),
(1, 11, 28, 'Header Image', 0, 0, 0, 0),
(1, 11, 60, 'Header', 0, 0, 0, 0),
(1, 12, 25, 'Sidebar', 0, 0, 0, 0),
(1, 11, 61, 'Sidebar', 1, 0, 0, 0),
(1, 11, 55, 'Sidebar', 2, 0, 0, 0),
(1, 11, 65, 'Main', 0, 1, 0, 0),
(1, 12, 28, 'Header Image', 0, 0, 0, 0),
(1, 12, 60, 'Header', 0, 0, 0, 0),
(1, 13, 25, 'Sidebar', 0, 0, 0, 0),
(1, 12, 61, 'Sidebar', 1, 0, 0, 0),
(1, 12, 55, 'Sidebar', 2, 0, 0, 0),
(1, 12, 66, 'Main', 0, 1, 0, 0),
(1, 13, 28, 'Header Image', 0, 0, 0, 0),
(1, 13, 60, 'Header', 0, 0, 0, 0),
(1, 13, 66, 'Main', 0, 0, 0, 0),
(1, 13, 61, 'Sidebar', 1, 0, 0, 0),
(1, 13, 55, 'Sidebar', 2, 0, 0, 0),
(1, 14, 25, 'Sidebar', 0, 0, 0, 0),
(1, 14, 28, 'Header Image', 0, 0, 0, 0),
(1, 14, 60, 'Header', 0, 0, 0, 0),
(1, 15, 25, 'Sidebar', 0, 0, 0, 0),
(1, 14, 61, 'Sidebar', 1, 0, 0, 0),
(1, 14, 55, 'Sidebar', 2, 0, 0, 0),
(1, 14, 67, 'Main', 0, 1, 0, 0),
(1, 15, 28, 'Header Image', 0, 0, 0, 0),
(1, 15, 60, 'Header', 0, 0, 0, 0),
(1, 16, 25, 'Sidebar', 0, 0, 0, 0),
(1, 15, 61, 'Sidebar', 1, 0, 0, 0),
(1, 15, 55, 'Sidebar', 2, 0, 0, 0),
(1, 15, 68, 'Main', 0, 1, 0, 0),
(1, 16, 28, 'Header Image', 0, 0, 0, 0),
(1, 16, 60, 'Header', 0, 0, 0, 0),
(1, 16, 68, 'Main', 0, 0, 0, 0),
(1, 16, 61, 'Sidebar', 1, 0, 0, 0),
(1, 16, 55, 'Sidebar', 2, 0, 0, 0),
(1, 17, 25, 'Sidebar', 0, 0, 0, 0),
(1, 17, 28, 'Header Image', 0, 0, 0, 0),
(1, 17, 60, 'Header', 0, 0, 0, 0),
(1, 18, 25, 'Sidebar', 0, 0, 0, 0),
(1, 17, 61, 'Sidebar', 1, 0, 0, 0),
(1, 17, 55, 'Sidebar', 2, 0, 0, 0),
(1, 17, 69, 'Main', 0, 1, 0, 0),
(1, 18, 28, 'Header Image', 0, 0, 0, 0),
(1, 18, 60, 'Header', 0, 0, 0, 0),
(1, 19, 25, 'Sidebar', 0, 0, 0, 0),
(1, 18, 61, 'Sidebar', 1, 0, 0, 0),
(1, 18, 55, 'Sidebar', 2, 0, 0, 0),
(1, 18, 70, 'Main', 0, 1, 0, 0),
(1, 19, 28, 'Header Image', 0, 0, 0, 0),
(1, 19, 60, 'Header', 0, 0, 0, 0),
(137, 2, 72, 'Main', 0, 1, 0, 0),
(1, 19, 61, 'Sidebar', 1, 0, 0, 0),
(1, 19, 55, 'Sidebar', 2, 0, 0, 0),
(1, 19, 71, 'Main', 0, 1, 0, 0),
(1, 20, 25, 'Sidebar', 0, 0, 0, 0),
(1, 20, 28, 'Header Image', 0, 0, 0, 0),
(1, 20, 60, 'Header', 0, 0, 0, 0),
(1, 20, 71, 'Main', 0, 0, 0, 0),
(1, 20, 61, 'Sidebar', 1, 0, 0, 0),
(1, 20, 55, 'Sidebar', 2, 0, 0, 0),
(1, 20, 73, 'Header Nav', 0, 1, 0, 0),
(138, 1, 17, 'Header Image', 0, 0, 0, 0),
(139, 1, 17, 'Header Image', 0, 0, 0, 0),
(139, 2, 17, 'Header Image', 0, 0, 0, 0),
(1, 21, 25, 'Sidebar', 0, 0, 0, 0),
(1, 21, 28, 'Header Image', 0, 0, 0, 0),
(1, 21, 60, 'Header', 0, 0, 0, 0),
(1, 21, 71, 'Main', 0, 0, 0, 0),
(1, 21, 73, 'Header Nav', 0, 0, 0, 0),
(1, 21, 61, 'Sidebar', 1, 0, 0, 0),
(1, 21, 55, 'Sidebar', 2, 0, 0, 0),
(1, 21, 75, 'Main', 1, 1, 0, 0),
(1, 22, 25, 'Sidebar', 0, 0, 0, 0),
(1, 22, 28, 'Header Image', 0, 0, 0, 0),
(1, 22, 60, 'Header', 0, 0, 0, 0),
(1, 22, 71, 'Main', 0, 0, 0, 0),
(1, 22, 73, 'Header Nav', 0, 0, 0, 0),
(1, 22, 61, 'Sidebar', 1, 0, 0, 0),
(1, 27, 25, 'Sidebar', 0, 0, 0, 0),
(1, 22, 55, 'Sidebar', 2, 0, 0, 0),
(1, 22, 76, 'Main', 1, 1, 0, 0),
(1, 22, 78, 'Footer', 0, 1, 0, 0),
(1, 23, 25, 'Sidebar', 0, 0, 0, 0),
(1, 23, 28, 'Header Image', 0, 0, 0, 0),
(1, 23, 60, 'Header', 0, 0, 0, 0),
(1, 23, 71, 'Main', 0, 0, 0, 0),
(1, 23, 73, 'Header Nav', 0, 0, 0, 0),
(1, 23, 78, 'Main', 2, 0, 0, 0),
(1, 23, 61, 'Sidebar', 1, 0, 0, 0),
(1, 23, 76, 'Main', 1, 0, 0, 0),
(1, 23, 55, 'Sidebar', 2, 0, 0, 0),
(1, 24, 25, 'Sidebar', 0, 0, 0, 0),
(1, 24, 28, 'Header Image', 0, 0, 0, 0),
(1, 24, 60, 'Header', 0, 0, 0, 0),
(1, 24, 71, 'Main', 0, 0, 0, 0),
(1, 24, 73, 'Header Nav', 0, 0, 0, 0),
(1, 24, 61, 'Sidebar', 1, 0, 0, 0),
(1, 24, 76, 'Main', 1, 0, 0, 0),
(1, 24, 55, 'Sidebar', 2, 0, 0, 0),
(1, 24, 78, 'Main', 2, 0, 0, 0),
(140, 1, 17, 'Header Image', 0, 0, 0, 0),
(1, 25, 25, 'Sidebar', 0, 0, 0, 0),
(1, 25, 28, 'Header Image', 0, 0, 0, 0),
(1, 25, 60, 'Header', 0, 0, 0, 0),
(1, 25, 71, 'Main', 0, 0, 0, 0),
(1, 25, 73, 'Header Nav', 0, 0, 0, 0),
(1, 25, 61, 'Sidebar', 1, 0, 0, 0),
(1, 26, 25, 'Sidebar', 0, 0, 0, 0),
(1, 25, 55, 'Sidebar', 2, 0, 0, 0),
(1, 25, 78, 'Main', 2, 0, 0, 0),
(1, 25, 79, 'Main', 1, 1, 0, 0),
(1, 26, 28, 'Header Image', 0, 0, 0, 0),
(1, 26, 60, 'Header', 0, 0, 0, 0),
(1, 26, 73, 'Header Nav', 0, 0, 0, 0),
(1, 26, 61, 'Sidebar', 1, 0, 0, 0),
(1, 27, 28, 'Header Image', 0, 0, 0, 0),
(1, 26, 55, 'Sidebar', 2, 0, 0, 0),
(1, 26, 78, 'Main', 2, 0, 0, 0),
(1, 26, 81, 'Main', 1, 1, 0, 0),
(1, 27, 60, 'Header', 0, 0, 0, 0),
(1, 27, 73, 'Header Nav', 0, 0, 0, 0),
(1, 27, 61, 'Sidebar', 1, 0, 0, 0),
(1, 27, 83, 'Main', 1, 1, 0, 0),
(1, 27, 55, 'Sidebar', 2, 0, 0, 0),
(1, 27, 82, 'Main', 0, 1, 0, 0),
(1, 28, 25, 'Sidebar', 0, 0, 0, 0),
(1, 28, 28, 'Header Image', 0, 0, 0, 0),
(1, 28, 60, 'Header', 0, 0, 0, 0),
(1, 28, 73, 'Header Nav', 0, 0, 0, 0),
(1, 28, 82, 'Main', 0, 0, 0, 0),
(1, 28, 61, 'Sidebar', 1, 0, 0, 0),
(1, 28, 55, 'Sidebar', 2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `CollectionVersionBlocksOutputCache`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionBlocksOutputCache` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `btCachedBlockOutput` longtext,
  `btCachedBlockOutputExpires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `CollectionVersionBlocksOutputCache`
--

INSERT INTO `CollectionVersionBlocksOutputCache` (`cID`, `cvID`, `bID`, `arHandle`, `btCachedBlockOutput`, `btCachedBlockOutputExpires`) VALUES
(1, 4, 56, 'Header', '<p>Rete d''impresa</p>', 1525328864),
(1, 4, 58, 'Main', '<p>...  Coming soon ... </p>', 1525328864),
(1, 4, 25, 'Sidebar', '<h3>Sidebar</h3>', 1525328864),
(1, 4, 26, 'Sidebar', '<p>Everything about concrete5 is completely customizable through the CMS. This is a separate area from the main content on the homepage. You can&nbsp;<a title="Move blocks in concrete5" href="http://www.concrete5.org/documentation/general-topics/blocks-and-areas" target="_blank">drag and drop blocks</a>&nbsp;like this around your layout.</p>', 1525328864),
(128, 1, 44, 'Sidebar', '<h3>Tags</h3>', 1525328872),
(1, 5, 60, 'Header', '<p>Rete d''impresa</p>', 1525328921),
(1, 5, 58, 'Main', '<p>...  Coming soon ... </p>', 1525328921),
(1, 5, 25, 'Sidebar', '<h3>Sidebar</h3>', 1525328921),
(1, 5, 26, 'Sidebar', '<p>Everything about concrete5 is completely customizable through the CMS. This is a separate area from the main content on the homepage. You can&nbsp;<a title="Move blocks in concrete5" href="http://www.concrete5.org/documentation/general-topics/blocks-and-areas" target="_blank">drag and drop blocks</a>&nbsp;like this around your layout.</p>', 1525328921),
(1, 5, 55, 'Sidebar', '<ul class="nav"><li class="nav-selected nav-path-selected"><a href="/" target="_self" class="nav-selected nav-path-selected">Home</a></li><li class=""><a href="/index.php/about/" target="_self" class="">About</a></li><li class=""><a href="/index.php/blog/" target="_self" class="">Blog</a></li><li class=""><a href="/index.php/search/" target="_self" class="">Search</a></li><li class=""><a href="/index.php/test/" target="_self" class="">test</a></li></ul>', 1368258709),
(127, 1, 29, 'Header', '<h1>About Us</h1>', 1525329632),
(127, 1, 31, 'Main', '<h2>Learn More</h2>\n																<p>Visit&nbsp;<a title="concrete5 Content Management System" href="http://www.concrete5.org/" target="_blank">concrete5.org</a>&nbsp;to learn more from the&nbsp;<a title="open source content management system" href="http://www.concrete5.org/community" target="_blank">community</a>&nbsp;and the&nbsp;<a href="http://www.concrete5.org/documentation/general-topics/" target="_blank">documentation</a>. You can also browse our&nbsp;<a title="concrete5 marketplace" href="http://www.concrete5.org/marketplace/" target="_blank">marketplace</a>&nbsp;for more&nbsp;<a title="Add-ons for concrete5" href="http://www.concrete5.org/marketplace/addons/" target="_blank">add-ons</a>&nbsp;and&nbsp;<a title="Themes for concrete5" href="http://www.concrete5.org/marketplace/themes/" target="_blank">themes</a>&nbsp;to quickly build the site you really need.&nbsp;</p>\n																<h3>&nbsp;</h3>\n																<h3>Getting Help</h3>\n																<p>You can get free help in the <a href="http://www.concrete5.org/community/forums/" target="_blank">forums</a> and post for free to the&nbsp;<a href="http://www.concrete5.org/community/forums/jobs1/" target="_blank">jobs board</a>.&nbsp;</p>\n																<p>You can also pay the concrete5 team of developers to help with&nbsp;<a href="http://www.concrete5.org/services/support/" target="_blank">any problem</a>&nbsp;you run into. We offer <a href="http://www.concrete5.org/services/training/" target="_blank">training courses</a>&nbsp;and&nbsp;<a href="http://www.concrete5.org/services/hosting/" target="_blank">hosting packages</a>, just let us know <a href="http://www.concrete5.org/services/professional_services/" target="_blank">how we can help</a>.</p>', 1525329632),
(1, 6, 60, 'Header', '<p>Rete d''impresa</p>', 1525331911),
(1, 6, 58, 'Main', '<p>...  Coming soon ... </p>', 1525331911),
(1, 6, 25, 'Sidebar', '<h3>Sidebar</h3>', 1525331911),
(1, 6, 26, 'Sidebar', '<p>Everything about concrete5 is completely customizable through the CMS. This is a separate area from the main content on the homepage. You can&nbsp;<a title="Move blocks in concrete5" href="http://www.concrete5.org/documentation/general-topics/blocks-and-areas" target="_blank">drag and drop blocks</a>&nbsp;like this around your layout.</p>', 1525331911),
(127, 1, 21, 'Main', '<h3>Links:</h3>', 1525336730),
(127, 1, 22, 'Main', '<ul class="nav"><li class=""><a href="/index.php/about/contact-us/" target="_self" class="">Contact Us</a></li><li class=""><a href="/index.php/about/guestbook/" target="_self" class="">Guestbook</a></li></ul>', 1383441537),
(130, 1, 35, 'Header', '<h1>Contact Us</h1>', 1525336739),
(130, 1, 21, 'Main', '<h3>Links:</h3>', 1525336739),
(130, 1, 22, 'Main', '<ul class="nav"><li class="nav-selected nav-path-selected"><a href="/index.php/about/contact-us/" target="_self" class="nav-selected nav-path-selected">Contact Us</a></li><li class=""><a href="/index.php/about/guestbook/" target="_self" class="">Guestbook</a></li></ul>', 1383687364),
(130, 1, 37, 'Main', '<h2>Contact Us</h2>\n									<p>Building a form is easy to do. Learn how to <a href="http://www.concrete5.org/documentation/general-topics/add_a_form" target="_blank">add a form block</a>.</p>', 1525336739),
(131, 1, 32, 'Header', '<h1>Guestbook</h1>', 1525336745),
(131, 1, 21, 'Main', '<h3>Links:</h3>', 1525336745),
(131, 1, 22, 'Main', '<ul class="nav"><li class=""><a href="/index.php/about/contact-us/" target="_self" class="">Contact Us</a></li><li class="nav-selected nav-path-selected"><a href="/index.php/about/guestbook/" target="_self" class="nav-selected nav-path-selected">Guestbook</a></li></ul>', 1374484448),
(134, 1, 13, 'Main', '<p>This is my first blog post.</p>', 1525390990),
(129, 1, 39, 'Header', '<h1>Sitemap</h1>', 1525392296),
(129, 1, 40, 'Sidebar', '<h3>Site Map</h3>', 1525392296),
(129, 1, 41, 'Sidebar', '<ul class="nav"><li class=""><a href="/" target="_self" class="">Home</a></li><li class=""><a href="/index.php/about/" target="_self" class="">About</a><ul><li class=""><a href="/index.php/about/contact-us/" target="_self" class="">Contact Us</a></li><li class=""><a href="/index.php/about/guestbook/" target="_self" class="">Guestbook</a></li></ul></li><li class=""><a href="/index.php/blog/" target="_self" class="">Blog</a><ul><li class=""><a href="/index.php/blog/hello-world/" target="_self" class="">Hello World</a></li></ul></li><li class="nav-selected nav-path-selected"><a href="/index.php/search/" target="_self" class="nav-selected nav-path-selected">Search</a></li><li class=""><a href="/index.php/test/" target="_self" class="">test</a></li></ul>', 1383432055),
(128, 1, 45, 'Sidebar', '<div class="ccm-tags-display">\n<ul class="ccm-tag-list">\n		<li >				<a href="/index.php/blog/blog-archives/?akID[14][atSelectOptionID][]=1">composer</a></li><li >				<a href="/index.php/blog/blog-archives/?akID[14][atSelectOptionID][]=2">hello</a></li><li >				<a href="/index.php/blog/blog-archives/?akID[14][atSelectOptionID][]=3">world</a></li><li >				<a href="/index.php/blog/blog-archives/?akID[14][atSelectOptionID][]=4">first post</a></li>	\n	</ul>\n	<div style="clear: both"></div>\n</div>', 1525393051),
(133, 1, 48, 'Main', '<p>Here is some sample content! I''m writing it using composer!</p>', 1525393272),
(132, 1, 51, 'Sidebar', '<div class="ccm-tags-display">\n<h4>Tags</h4><ul class="ccm-tag-list">\n		<li >				<a href="/index.php/blog/blog-archives/?akID[14][atSelectOptionID][]=1">composer</a></li><li >				<a href="/index.php/blog/blog-archives/?akID[14][atSelectOptionID][]=2">hello</a></li><li >				<a href="/index.php/blog/blog-archives/?akID[14][atSelectOptionID][]=3">world</a></li><li >				<a href="/index.php/blog/blog-archives/?akID[14][atSelectOptionID][]=4">first post</a></li>	\n	</ul>\n	<div style="clear: both"></div>\n</div>', 1525393300),
(104, 1, 6, 'Primary', '\n<h1>Welcome Back</h1>\n<br/>\n\n<p><span class="label notice">concrete5 Update</span> The latest version of concrete5 is <strong>5.6.2.1</strong>. You are currently running concrete5 version <strong>5.6.1.2</strong>. <a class="" href="/index.php/dashboard/system/backup_restore/update/">Learn more and update.</a></p>\n\n\n\n', 1388768361),
(104, 1, 8, 'Secondary 1', '<div>\n<p><img src="http://newsflow.concrete5.org/files/3013/2483/6187/deal-small.png" alt="deal-small.png" width="150" height="49" /></p>\r\n<h3>Great New Year Deals</h3>\r\n<p>Check out the Deal of the Day each day for great savings on concrete5 add-ons that will take your website to the next level. </p><div><a href="http://www.concrete5.org/marketplace/deal/?utm_source=newsflow&utm_medium=web&utm_content=0&utm_campaign=newsflow" class="btn " target="_blank">Deal of the Day</a></div>\n</div>\n\n', 1388689162),
(104, 1, 9, 'Secondary 2', '<div>\n<h3>There''s more...</h3>\r\n<p>Haven''t gotten enough news, concrete5 info, and random stuff? Don''t worry, we''ve got more. <em>(Look for new editions once a week.)</em></p><a href="javascript:void(0)" onclick="ccm_showNewsflowOffsite(306);" class="btn">Read On</a>\n\n</div>\n\n', 1388689162),
(104, 1, 10, 'Secondary 3', '<h6>Featured Theme</h6>\n	<div class="clearfix">\n	<img src="http://www.concrete5.org/files/3413/8693/4479/theme_super_mint_icon.png" width="97" height="97" style="float: left; margin-right: 10px; margin-bottom: 10px" />\n	<h3>SuperMint</h3>\n	<p>Super Mint is a professional multipurpose template for any website, it&rsquo;s fully responsive design ready to look stunning on any device.</p>\n	</div>\n	\n	<a href="javascript:void(0)" onclick="ccm_getMarketplaceItemDetails(1419)" href="http://www.concrete5.org/marketplace/themes/supermint" class="btn">Learn More</a>\n', 1388689163),
(104, 1, 11, 'Secondary 4', '<h6>Featured Add-On</h6>\n	<div class="clearfix">\n	<img src="http://www.concrete5.org/files/4413/6904/1552/bd_sport_icon.png" width="97" height="97" style="float: left; margin-right: 10px; margin-bottom: 10px" />\n	<h3>BearLeague</h3>\n	<p>Manage your sport tournaments, leagues, clubs, teams and games. Create professional sport website easily!</p>\n	</div>\n	\n	<a href="javascript:void(0)" onclick="ccm_getMarketplaceItemDetails(1361)" class="btn">Learn More</a>\n', 1388689164),
(104, 1, 12, 'Secondary 5', '<div>\n<p><img src="http://newsflow.concrete5.org/files/9813/2613/7693/TutorialsAndTips_Small.png" alt="TutorialsAndTips_Small.png" width="170" height="30" /></p>\r\n<h3>Learn concrete5</h3>\r\n<p><span>Have you ever wanted to customize the page list block or modify your theme? Learn how to do all kinds of things with concrete5!</span></p><div><a href="http://www.concrete5.org/documentation/?utm_source=newsflow&utm_medium=web&utm_content=0&utm_campaign=newsflow" class="btn " target="_blank">Learn concrete5</a></div>\n</div>\n\n	<div class="newsflow-paging-next"><a href="javascript:void(0)" onclick="ccm_showNewsflowOffsite(306)"><span></span></a></div>\n\n	<script type="text/javascript">\n	$(function() {\n		ccm_setNewsflowPagingArrowHeight();\n	});\n	</script>\n	\n', 1388689165),
(1, 21, 75, 'Main', '<p style="text-align: center;">OPEN REVOLUTION</p>', 1543179928),
(1, 6, 55, 'Sidebar', '<ul class="nav"><li class="nav-selected nav-path-selected"><a href="/" target="_self" class="nav-selected nav-path-selected">Home</a></li><li class=""><a href="/index.php/about/" target="_self" class="">About</a></li><li class=""><a href="/index.php/blog/" target="_self" class="">Blog</a></li><li class=""><a href="/index.php/search/" target="_self" class="">Search</a></li><li class=""><a href="/index.php/test/" target="_self" class="">test</a></li></ul>', 1369160429),
(1, 7, 61, 'Sidebar', '', 1526992482),
(1, 7, 60, 'Header', '<p>Rete d''impresa</p>', 1526991821),
(1, 7, 25, 'Sidebar', '<h3>Sidebar</h3>', 1526991822),
(1, 21, 71, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1543179933),
(1, 14, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527013057),
(1, 14, 61, 'Sidebar', '', 1527015260),
(1, 14, 67, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527013058),
(1, 14, 60, 'Header', '<p>Rete d''impresa</p>', 1527013057),
(1, 7, 58, 'Main', '<p>...  Coming soon ... </p>', 1526991822),
(1, 7, 62, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1526991957),
(1, 8, 60, 'Header', '<p>Rete d''impresa</p>', 1526992482),
(1, 8, 25, 'Sidebar', '<h3>Sidebar</h3>', 1526992482),
(1, 8, 61, 'Sidebar', '', 1526992547),
(1, 8, 62, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1526992482),
(1, 8, 63, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1526992495),
(1, 9, 60, 'Header', '<p>Rete d''impresa</p>', 1526992548),
(1, 9, 25, 'Sidebar', '<h3>Sidebar</h3>', 1526992548),
(1, 9, 61, 'Sidebar', '', 1527011319),
(1, 9, 63, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1526992548),
(1, 10, 60, 'Header', '<p>Rete d''impresa</p>', 1527011320),
(1, 10, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527011320),
(1, 10, 61, 'Sidebar', '', 1527012428),
(1, 10, 64, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527011320),
(1, 11, 60, 'Header', '<p>Rete d''impresa</p>', 1527012429),
(1, 11, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527012429),
(1, 11, 61, 'Sidebar', '', 1527012864),
(1, 11, 64, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527012429),
(1, 11, 65, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527012500),
(1, 12, 60, 'Header', '<p>Rete d''impresa</p>', 1527012864),
(1, 12, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527012864),
(1, 12, 61, 'Sidebar', '', 1527013002),
(1, 12, 65, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527012864),
(1, 12, 66, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527012886),
(1, 13, 60, 'Header', '<p>Rete d''impresa</p>', 1527013003),
(1, 13, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527013003),
(1, 13, 61, 'Sidebar', '', 1527013056),
(1, 13, 66, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527013003),
(1, 14, 55, 'Sidebar', '<ul class="nav"><li class="nav-selected nav-path-selected"><a href="/" target="_self" class="nav-selected nav-path-selected">Home</a></li><li class=""><a href="/index.php/about/" target="_self" class="">About</a></li><li class=""><a href="/index.php/blog/" target="_self" class="">Blog</a></li><li class=""><a href="/index.php/search/" target="_self" class="">Search</a></li><li class=""><a href="/index.php/test/" target="_self" class="">test</a></li></ul>', 1369246975),
(1, 15, 60, 'Header', '<p>Rete d''impresa</p>', 1527015260),
(1, 15, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527015260),
(1, 15, 61, 'Sidebar', '', 1527020108),
(1, 15, 67, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527015260),
(1, 15, 68, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527015274),
(1, 16, 60, 'Header', '<p>Rete d''impresa</p>', 1527020109),
(1, 16, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527020109),
(1, 16, 61, 'Sidebar', '', 1527065495),
(1, 16, 68, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527020109),
(1, 17, 60, 'Header', '<p>Rete d''impresa</p>', 1527065495),
(1, 17, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527065495),
(1, 17, 61, 'Sidebar', '', 1527065692),
(1, 17, 69, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527065496),
(1, 18, 60, 'Header', '<p>Rete d''impresa</p>', 1527065692),
(1, 18, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527065692),
(1, 18, 61, 'Sidebar', '', 1527072697),
(1, 18, 69, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527065692),
(1, 18, 70, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527065846),
(1, 19, 60, 'Header', '<p>Rete d''impresa</p>', 1527072698),
(1, 19, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527072698),
(1, 19, 61, 'Sidebar', '', 1542008001),
(1, 19, 70, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527072698),
(1, 19, 71, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527072746),
(1, 19, 55, 'Sidebar', '<ul class="nav"><li class="nav-selected nav-path-selected"><a href="/" target="_self" class="nav-selected nav-path-selected">Home</a></li><li class=""><a href="/index.php/about/" target="_self" class="">About</a></li><li class=""><a href="/index.php/blog/" target="_self" class="">Blog</a></li><li class=""><a href="/index.php/search/" target="_self" class="">Search</a></li><li class=""><a href="/index.php/test/" target="_self" class="">test</a></li></ul>', 1384241901),
(137, 2, 72, 'Main', '<p> <img src="/files/5213/6947/2689/twitter.png" alt="twitter.png" width="32" height="32" /> <img src="/files/4813/6947/2688/linkedin.png" alt="linkedin.png" width="32" height="32" /> <img src="/files/8913/6947/2687/facebook.png" alt="facebook.png" width="32" height="32" /> <img src="/files/3313/6947/2687/google.png" alt="google.png" width="32" height="32" /> </p>', 1527239106),
(40, 1, 72, 'Main', '<p> <img src="/files/5213/6947/2689/twitter.png" alt="twitter.png" width="32" height="32" /> <img src="/files/4813/6947/2688/linkedin.png" alt="linkedin.png" width="32" height="32" /> <img src="/files/8913/6947/2687/facebook.png" alt="facebook.png" width="32" height="32" /> <img src="/files/3313/6947/2687/google.png" alt="google.png" width="32" height="32" /> </p>', 1527239109),
(1, 20, 72, 'Main', '<p> <img src="/files/5213/6947/2689/twitter.png" alt="twitter.png" width="32" height="32" /> <img src="/files/4813/6947/2688/linkedin.png" alt="linkedin.png" width="32" height="32" /> <img src="/files/8913/6947/2687/facebook.png" alt="facebook.png" width="32" height="32" /> <img src="/files/3313/6947/2687/google.png" alt="google.png" width="32" height="32" /> </p>', 1527239135),
(1, 20, 60, 'Header', '<p>Rete d''impresa</p>', 1527239148),
(1, 20, 25, 'Sidebar', '<h3>Sidebar</h3>', 1527239148),
(1, 20, 61, 'Sidebar', '', 1542008808),
(1, 20, 71, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1527239149),
(1, 20, 74, 'Main', '<img border="0" class="ccm-image-block" alt="" src="/files/cache/e1a59224c70b0a51225b9f74d44b8b5d_f13.jpg"  width="700" height="427" />', 1528531356),
(1, 22, 76, 'Main', '<p style="text-align: center;">OPEN REVOLUTION</p>', 1543180017),
(135, 2, 77, 'Main', '<p>ASDasdASD</p>', 1543180132),
(40, 1, 77, 'Main', '<p>ASDasdASD</p>', 1543180135),
(1, 22, 71, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1543180143),
(1, 22, 77, 'Main', '<p>ASDasdASD</p>', 1543180172),
(1, 23, 71, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1543180213),
(1, 23, 76, 'Main', '<p style="text-align: center;">OPEN REVOLUTION</p>', 1543180213),
(1, 23, 77, 'Main', '<p>ASDasdASD</p>', 1543180213),
(1, 24, 71, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1543180606),
(1, 24, 76, 'Main', '<p style="text-align: center;">OPEN REVOLUTION</p>', 1543180606),
(1, 24, 77, 'Main', '<p>ASDasdASD</p>', 1543180606),
(1, 25, 77, 'Main', '<p>ASDasdASD</p>', 1546289300),
(1, 25, 79, 'Main', '<p style="text-align: center;">OPEN REVOLUTION</p>', 1546289255),
(1, 25, 71, 'Main', '<p>text-shadow: 2px 2px 2px #aaa;</p>\r\n<p>...  Coming soon ... </p>', 1546289300),
(1, 26, 80, 'Main', '<p><span style="font-size: xx-large;">2014</span></p>\r\n<p>Open Revolution</p>', 1546448448),
(1, 26, 81, 'Main', '<p style="text-align: center;"><span style="color: #ffffff;">2014<img src="/files/7213/7076/4886/964190_598234856862455_297938299_o.jpg" alt="964190_598234856862455_297938299_o.jpg" width="2048" height="1250" />OPEN REVOLUTION</span></p>', 1546448563),
(1, 26, 77, 'Main', '<p>ASDasdASD</p>', 1546448583),
(1, 27, 82, 'Main', '<p style="text-align: center;"><span style="color: #ffffff;"><strong><span style="font-size: xx-large;">2014</span></strong><img src="/files/7213/7076/4886/964190_598234856862455_297938299_o.jpg" alt="964190_598234856862455_297938299_o.jpg" width="2048" height="1250" />OPEN REVOLUTION</span></p>', 1546448661);

-- --------------------------------------------------------

--
-- Struttura della tabella `CollectionVersionBlockStyles`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionBlockStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `CollectionVersionBlockStyles`
--

INSERT INTO `CollectionVersionBlockStyles` (`cID`, `cvID`, `bID`, `arHandle`, `csrID`) VALUES
(127, 1, 18, 'Header Image', 0),
(131, 1, 19, 'Header Image', 0),
(130, 1, 18, 'Header Image', 0),
(129, 1, 19, 'Header Image', 0),
(128, 1, 19, 'Header Image', 0),
(133, 1, 14, 'Sidebar', 0),
(132, 1, 19, 'Header Image', 0),
(1, 2, 54, 'Main', 0),
(1, 2, 25, 'Sidebar', 0),
(134, 1, 13, 'Main', 0),
(1, 2, 28, 'Header Image', 0),
(1, 2, 26, 'Sidebar', 0),
(1, 2, 53, 'Header', 0),
(134, 1, 14, 'Sidebar', 0),
(134, 1, 15, 'Thumbnail Image', 0),
(134, 1, 16, 'Header Image', 0),
(1, 3, 25, 'Sidebar', 0),
(1, 3, 28, 'Header Image', 0),
(1, 3, 26, 'Sidebar', 0),
(1, 3, 56, 'Header', 3),
(1, 3, 57, 'Main', 8),
(1, 4, 25, 'Sidebar', 0),
(1, 4, 28, 'Header Image', 0),
(1, 4, 56, 'Header', 3),
(1, 5, 25, 'Sidebar', 0),
(1, 4, 26, 'Sidebar', 0),
(1, 4, 55, 'Sidebar', 0),
(1, 4, 58, 'Main', 8),
(1, 5, 28, 'Header Image', 0),
(1, 6, 25, 'Sidebar', 0),
(1, 5, 58, 'Main', 8),
(1, 5, 26, 'Sidebar', 0),
(1, 5, 59, 'Main', 0),
(1, 5, 55, 'Sidebar', 0),
(1, 5, 60, 'Header', 10),
(1, 6, 28, 'Header Image', 0),
(1, 6, 58, 'Main', 8),
(1, 6, 60, 'Header', 10),
(1, 6, 26, 'Sidebar', 0),
(1, 7, 25, 'Sidebar', 0),
(1, 6, 55, 'Sidebar', 0),
(1, 7, 28, 'Header Image', 0),
(1, 8, 25, 'Sidebar', 0),
(1, 7, 60, 'Header', 10),
(1, 7, 62, 'Main', 14),
(1, 7, 55, 'Sidebar', 0),
(1, 7, 61, 'Sidebar', 0),
(1, 8, 28, 'Header Image', 0),
(1, 8, 60, 'Header', 10),
(1, 9, 25, 'Sidebar', 0),
(1, 8, 61, 'Sidebar', 0),
(1, 8, 55, 'Sidebar', 0),
(1, 8, 63, 'Main', 16),
(1, 9, 28, 'Header Image', 0),
(1, 9, 60, 'Header', 10),
(1, 9, 63, 'Main', 17),
(1, 9, 61, 'Sidebar', 0),
(1, 9, 55, 'Sidebar', 0),
(1, 10, 25, 'Sidebar', 0),
(1, 10, 28, 'Header Image', 0),
(1, 10, 60, 'Header', 10),
(1, 11, 25, 'Sidebar', 0),
(1, 10, 61, 'Sidebar', 0),
(1, 10, 55, 'Sidebar', 0),
(1, 10, 64, 'Main', 20),
(1, 11, 28, 'Header Image', 0),
(1, 11, 60, 'Header', 10),
(1, 12, 25, 'Sidebar', 0),
(1, 11, 61, 'Sidebar', 0),
(1, 11, 55, 'Sidebar', 0),
(1, 11, 65, 'Main', 25),
(1, 12, 28, 'Header Image', 0),
(1, 12, 60, 'Header', 10),
(1, 13, 25, 'Sidebar', 0),
(1, 12, 61, 'Sidebar', 0),
(1, 12, 55, 'Sidebar', 0),
(1, 12, 66, 'Main', 27),
(1, 13, 28, 'Header Image', 0),
(1, 13, 60, 'Header', 10),
(1, 13, 66, 'Main', 28),
(1, 13, 61, 'Sidebar', 0),
(1, 13, 55, 'Sidebar', 0),
(1, 14, 25, 'Sidebar', 0),
(1, 14, 28, 'Header Image', 0),
(1, 14, 60, 'Header', 10),
(1, 15, 25, 'Sidebar', 0),
(1, 14, 61, 'Sidebar', 0),
(1, 14, 55, 'Sidebar', 0),
(1, 14, 67, 'Main', 29),
(1, 15, 28, 'Header Image', 0),
(1, 15, 60, 'Header', 10),
(1, 16, 25, 'Sidebar', 0),
(1, 15, 61, 'Sidebar', 0),
(1, 15, 55, 'Sidebar', 0),
(1, 15, 68, 'Main', 33),
(1, 16, 28, 'Header Image', 0),
(1, 16, 60, 'Header', 10),
(1, 16, 68, 'Main', 34),
(1, 16, 61, 'Sidebar', 0),
(1, 16, 55, 'Sidebar', 0),
(1, 17, 25, 'Sidebar', 0),
(1, 17, 28, 'Header Image', 0),
(1, 17, 60, 'Header', 10),
(1, 18, 25, 'Sidebar', 0),
(1, 17, 61, 'Sidebar', 0),
(1, 17, 55, 'Sidebar', 0),
(1, 17, 69, 'Main', 36),
(1, 18, 28, 'Header Image', 0),
(1, 18, 60, 'Header', 10),
(1, 19, 25, 'Sidebar', 0),
(1, 18, 61, 'Sidebar', 0),
(1, 18, 55, 'Sidebar', 0),
(1, 18, 70, 'Main', 40),
(1, 19, 28, 'Header Image', 0),
(1, 19, 60, 'Header', 10),
(1, 20, 25, 'Sidebar', 0),
(1, 19, 61, 'Sidebar', 0),
(1, 19, 55, 'Sidebar', 0),
(1, 19, 71, 'Main', 42),
(1, 20, 28, 'Header Image', 0),
(1, 20, 60, 'Header', 10),
(1, 20, 71, 'Main', 42),
(1, 20, 61, 'Sidebar', 0),
(1, 20, 55, 'Sidebar', 0),
(1, 20, 73, 'Header Nav', 43),
(138, 1, 17, 'Header Image', 0),
(139, 1, 17, 'Header Image', 0),
(139, 2, 17, 'Header Image', 0),
(1, 21, 25, 'Sidebar', 0),
(1, 21, 28, 'Header Image', 0),
(1, 21, 60, 'Header', 10),
(1, 21, 71, 'Main', 42),
(1, 21, 73, 'Header Nav', 43),
(1, 21, 61, 'Sidebar', 0),
(1, 21, 55, 'Sidebar', 0),
(1, 22, 25, 'Sidebar', 0),
(1, 22, 28, 'Header Image', 0),
(1, 22, 60, 'Header', 10),
(1, 22, 71, 'Main', 42),
(1, 22, 73, 'Header Nav', 43),
(1, 22, 61, 'Sidebar', 0),
(1, 24, 61, 'Sidebar', 0),
(1, 22, 55, 'Sidebar', 0),
(1, 22, 76, 'Main', 0),
(1, 24, 73, 'Header Nav', 0),
(1, 24, 71, 'Main', 42),
(1, 24, 60, 'Header', 0),
(1, 24, 28, 'Header Image', 0),
(1, 23, 71, 'Main', 42),
(1, 24, 25, 'Sidebar', 0),
(1, 24, 76, 'Main', 0),
(1, 24, 55, 'Sidebar', 0),
(1, 24, 78, 'Main', 0),
(140, 1, 17, 'Header Image', 0),
(1, 25, 25, 'Sidebar', 0),
(1, 25, 28, 'Header Image', 0),
(1, 25, 60, 'Header', 0),
(1, 25, 71, 'Main', 42),
(1, 25, 73, 'Header Nav', 0),
(1, 25, 61, 'Sidebar', 0),
(1, 25, 55, 'Sidebar', 0),
(1, 25, 78, 'Main', 0),
(1, 25, 79, 'Main', 46),
(1, 26, 25, 'Sidebar', 0),
(1, 26, 28, 'Header Image', 0),
(1, 26, 60, 'Header', 0),
(1, 27, 28, 'Header Image', 0),
(1, 26, 73, 'Header Nav', 0),
(1, 26, 61, 'Sidebar', 0),
(1, 27, 25, 'Sidebar', 0),
(1, 26, 55, 'Sidebar', 0),
(1, 26, 78, 'Main', 0),
(1, 26, 81, 'Main', 46),
(1, 27, 60, 'Header', 0),
(1, 27, 73, 'Header Nav', 0),
(1, 27, 61, 'Sidebar', 0),
(1, 28, 25, 'Sidebar', 0),
(1, 27, 55, 'Sidebar', 0),
(1, 27, 82, 'Main', 46),
(1, 28, 28, 'Header Image', 0),
(1, 28, 60, 'Header', 0),
(1, 28, 73, 'Header Nav', 0),
(1, 28, 82, 'Main', 46),
(1, 28, 61, 'Sidebar', 0),
(1, 28, 55, 'Sidebar', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `CollectionVersionRelatedEdits`
--

CREATE TABLE IF NOT EXISTS `CollectionVersionRelatedEdits` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `cRelationID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvRelationID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`cRelationID`,`cvRelationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `CollectionVersions`
--

CREATE TABLE IF NOT EXISTS `CollectionVersions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `cvName` text,
  `cvHandle` varchar(255) DEFAULT NULL,
  `cvDescription` text,
  `cvDatePublic` datetime DEFAULT NULL,
  `cvDateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cvComments` varchar(255) DEFAULT NULL,
  `cvIsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `cvIsNew` tinyint(1) NOT NULL DEFAULT '0',
  `cvAuthorUID` int(10) unsigned DEFAULT NULL,
  `cvApproverUID` int(10) unsigned DEFAULT NULL,
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvActivateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`cID`,`cvID`),
  KEY `cvIsApproved` (`cvIsApproved`),
  KEY `ctID` (`ctID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `CollectionVersions`
--

INSERT INTO `CollectionVersions` (`cID`, `cvID`, `cvName`, `cvHandle`, `cvDescription`, `cvDatePublic`, `cvDateCreated`, `cvComments`, `cvIsApproved`, `cvIsNew`, `cvAuthorUID`, `cvApproverUID`, `ptID`, `ctID`, `cvActivateDatetime`) VALUES
(1, 1, 'Home', 'home', '', '2012-11-22 16:12:13', '2012-11-22 16:12:13', 'Initial Version', 0, 0, 1, NULL, 6, 7, NULL),
(2, 1, 'Dashboard', 'dashboard', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(3, 1, 'Composer', 'composer', 'Write for your site.', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(4, 1, 'Write', 'write', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(5, 1, 'Drafts', 'drafts', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(6, 1, 'Sitemap', 'sitemap', 'Whole world at a glance.', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(7, 1, 'Full Sitemap', 'full', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(8, 1, 'Flat View', 'explore', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(9, 1, 'Page Search', 'search', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(10, 1, 'Files', 'files', 'All documents and images.', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(11, 1, 'File Manager', 'search', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(12, 1, 'Attributes', 'attributes', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(13, 1, 'File Sets', 'sets', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(14, 1, 'Add File Set', 'add_set', '', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(15, 1, 'Members', 'users', 'Add and manage the user accounts and groups on your website.', '2012-11-22 16:12:16', '2012-11-22 16:12:16', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(16, 1, 'Search Users', 'search', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(17, 1, 'User Groups', 'groups', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(18, 1, 'Attributes', 'attributes', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(19, 1, 'Add User', 'add', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(20, 1, 'Add Group', 'add_group', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(21, 1, 'Group Sets', 'group_sets', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(22, 1, 'Reports', 'reports', 'Get data from forms and logs.', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(23, 1, 'Statistics', 'statistics', 'View your site activity.', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(24, 1, 'Form Results', 'forms', 'Get submission data.', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(25, 1, 'Surveys', 'surveys', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(26, 1, 'Logs', 'logs', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(27, 1, 'Pages & Themes', 'pages', 'Reskin your site.', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(28, 1, 'Themes', 'themes', 'Reskin your site.', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(29, 1, 'Add', 'add', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(30, 1, 'Inspect', 'inspect', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(31, 1, 'Customize', 'customize', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(32, 1, 'Page Types', 'types', 'What goes in your site.', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(33, 1, 'Add Page Type', 'add', 'Add page types to your site.', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(34, 1, 'Attributes', 'attributes', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(35, 1, 'Single Pages', 'single', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(36, 1, 'Workflow', 'workflow', '', '2012-11-22 16:12:17', '2012-11-22 16:12:17', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(37, 1, 'Workflow List', 'list', '', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(38, 1, 'Waiting for Me', 'me', '', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(39, 1, 'Stacks & Blocks', 'blocks', 'Manage sitewide content and administer block types.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(40, 1, 'Stacks', 'stacks', 'Share content across your site.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(41, 1, 'Block & Stack Permissions', 'permissions', 'Control who can add blocks and stacks on your site.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(42, 1, 'Stack List', 'list', '', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(43, 1, 'Block Types', 'types', 'Manage the installed block types in your site.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(44, 1, 'Extend concrete5', 'extend', 'Connect to the concrete5 marketplace, install custom add-ons, and download updates for marketplace add-ons and themes.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(45, 1, 'Dashboard', 'news', '', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(46, 1, 'Add Functionality', 'install', 'Install add-ons & themes.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(47, 1, 'Update Add-Ons', 'update', 'Update your installed packages.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(48, 1, 'Connect to the Community', 'connect', 'Connect to the concrete5 community.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(49, 1, 'Get More Themes', 'themes', 'Download themes from concrete5.org.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(50, 1, 'Get More Add-Ons', 'add-ons', 'Download add-ons from concrete5.org.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(51, 1, 'System & Settings', 'system', 'Secure and setup your site.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(52, 1, 'Basics', 'basics', 'Basic information about your website.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(53, 1, 'Site Name', 'site_name', '', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(54, 1, 'Bookmark Icons', 'icons', 'Bookmark icon and mobile home screen icon setup.', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(55, 1, 'Rich Text Editor', 'editor', '', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(56, 1, 'Languages', 'multilingual', '', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(57, 1, 'Time Zone', 'timezone', '', '2012-11-22 16:12:18', '2012-11-22 16:12:18', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(58, 1, 'Interface Preferences', 'interface', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(59, 1, 'SEO & Statistics', 'seo', 'Enable pretty URLs, statistics and tracking codes.', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(60, 1, 'Pretty URLs', 'urls', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(61, 1, 'Bulk SEO Updater', 'bulk_seo_tool', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(62, 1, 'Tracking Codes', 'tracking_codes', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(63, 1, 'Statistics', 'statistics', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(64, 1, 'Search Index', 'search_index', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(65, 1, 'Optimization', 'optimization', 'Keep your site running well.', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(66, 1, 'Cache & Speed Settings', 'cache', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(67, 1, 'Clear Cache', 'clear_cache', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(68, 1, 'Automated Jobs', 'jobs', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(69, 1, 'Permissions & Access', 'permissions', 'Control who sees and edits your site.', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(70, 1, 'Site Access', 'site', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(71, 1, 'File Manager Permissions', 'files', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(72, 1, 'Allowed File Types', 'file_types', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(73, 1, 'Task Permissions', 'tasks', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(74, 1, 'User Permissions', 'users', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(75, 1, 'Advanced Permissions', 'advanced', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(76, 1, 'IP Blacklist', 'ip_blacklist', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(77, 1, 'Captcha Setup', 'captcha', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(78, 1, 'Spam Control', 'antispam', '', '2012-11-22 16:12:19', '2012-11-22 16:12:19', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(79, 1, 'Maintenance Mode', 'maintenance_mode', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(80, 1, 'Login & Registration', 'registration', 'Change login behaviors and setup public profiles.', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(81, 1, 'Login Destination', 'postlogin', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(82, 1, 'Public Profiles', 'profiles', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(83, 1, 'Public Registration', 'public_registration', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(84, 1, 'Email', 'mail', 'Control how your site send and processes mail.', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(85, 1, 'SMTP Method', 'method', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(86, 1, 'Email Importers', 'importers', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(87, 1, 'Attributes', 'attributes', 'Setup attributes for pages, users, files and more.', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(88, 1, 'Sets', 'sets', 'Group attributes into sets for easier organization', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(89, 1, 'Types', 'types', 'Choose which attribute types are available for different items.', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(90, 1, 'Environment', 'environment', 'Advanced settings for web developers.', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(91, 1, 'Environment Information', 'info', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(92, 1, 'Debug Settings', 'debug', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(93, 1, 'Logging Settings', 'logging', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(94, 1, 'File Storage Locations', 'file_storage_locations', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(95, 1, 'Proxy Server', 'proxy', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(96, 1, 'Backup & Restore', 'backup_restore', 'Backup or restore your website.', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(97, 1, 'Backup Database', 'backup', '', '2012-11-22 16:12:20', '2012-11-22 16:12:20', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(98, 1, 'Update concrete5', 'update', '', '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(99, 1, 'Database XML', 'database', '', '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(100, 1, 'Composer', 'composer', '', '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(101, 1, '', NULL, NULL, '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'Initial Version', 1, 0, NULL, NULL, 0, 1, NULL),
(102, 1, '', NULL, NULL, '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'Initial Version', 1, 0, NULL, NULL, 0, 2, NULL),
(103, 1, '', NULL, NULL, '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'Initial Version', 1, 0, NULL, NULL, 0, 3, NULL),
(104, 1, 'Customize Dashboard Home', 'home', '', '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'Initial Version', 1, 0, 1, NULL, 6, 2, NULL),
(105, 1, 'Welcome to concrete5', 'welcome', 'Learn about how to use concrete5, how to develop for concrete5, and get general help.', '2012-11-22 16:12:21', '2012-11-22 16:12:21', 'Initial Version', 1, 0, 1, NULL, 6, 3, NULL),
(106, 1, 'Drafts', '!drafts', '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(107, 1, 'Trash', '!trash', '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(108, 1, 'Stacks', '!stacks', '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(109, 1, 'Login', 'login', '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(110, 1, 'Register', 'register', '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(111, 1, 'Profile', 'profile', '', '2012-11-22 16:12:23', '2012-11-22 16:12:23', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(112, 1, 'Edit', 'edit', '', '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(113, 1, 'Avatar', 'avatar', '', '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(114, 1, 'Messages', 'messages', '', '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(115, 1, 'Friends', 'friends', '', '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(116, 1, 'Page Not Found', 'page_not_found', '', '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(117, 1, 'Page Forbidden', 'page_forbidden', '', '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(118, 1, 'Download File', 'download_file', '', '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(119, 1, 'Members', 'members', '', '2012-11-22 16:12:24', '2012-11-22 16:12:24', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(120, 1, 'Header Nav', 'header-nav', NULL, '2012-11-22 16:12:26', '2012-11-22 16:12:26', 'Initial Version', 1, 0, 1, NULL, 6, 1, NULL),
(121, 1, 'Side Nav', 'side-nav', NULL, '2012-11-22 16:12:26', '2012-11-22 16:12:26', 'Initial Version', 1, 0, 1, NULL, 6, 1, NULL),
(122, 1, 'Site Name', 'site-name', NULL, '2012-11-22 16:12:26', '2012-11-22 16:12:26', 'Initial Version', 1, 0, 1, NULL, 6, 1, NULL),
(123, 1, '', NULL, NULL, '2012-11-22 16:12:26', '2012-11-22 16:12:26', 'Initial Version', 1, 0, NULL, NULL, 0, 4, NULL),
(124, 1, '', NULL, NULL, '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, NULL, NULL, 0, 5, NULL),
(125, 1, '', NULL, NULL, '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, NULL, NULL, 0, 6, NULL),
(126, 1, '', NULL, NULL, '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, NULL, NULL, 0, 7, NULL),
(127, 1, 'About', 'about', '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, 1, NULL, 6, 6, NULL),
(128, 1, 'Blog', 'blog', '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, 1, NULL, 6, 7, NULL),
(129, 1, 'Search', 'search', '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, 1, NULL, 6, 7, NULL),
(130, 1, 'Contact Us', 'contact-us', '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, 1, NULL, 6, 6, NULL),
(131, 1, 'Guestbook', 'guestbook', '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, 1, NULL, 6, 7, NULL),
(132, 1, 'Blog Archives', 'blog-archives', '', '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, 1, NULL, 6, 7, NULL),
(133, 1, 'Hello World', 'hello-world', 'This is my first blog post!', '2012-11-22 16:12:27', '2012-11-22 16:12:27', 'Initial Version', 1, 0, 1, NULL, 6, 4, NULL),
(1, 2, 'Home', 'home', '', '2012-11-22 16:12:13', '2012-11-22 16:57:57', 'Version 2', 0, 0, 1, 1, 6, 7, NULL),
(134, 1, 'test', 'test', '', '2012-11-22 16:59:00', '2012-11-22 16:59:15', 'Initial Version', 1, 0, 1, 1, 6, 4, NULL),
(1, 3, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-02-18 22:23:29', 'Version 3', 0, 0, 1, 1, 6, 7, NULL),
(1, 4, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-04-30 11:05:20', 'Version 4', 0, 0, 1, 1, 6, 7, NULL),
(1, 27, 'Home', 'home', '', '2012-11-22 16:12:13', '2014-01-02 18:03:53', 'Version 27', 1, 0, 1, 1, 6, 7, NULL),
(136, 1, 'Excluded URL Word List', 'excluded', NULL, '2013-05-03 08:27:38', '2013-05-03 08:27:38', 'Initial Version', 1, 0, 1, NULL, 6, 0, NULL),
(1, 5, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-03 08:28:40', 'Version 5', 0, 0, 1, 1, 6, 7, NULL),
(1, 6, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-03 08:29:25', 'New Version 6', 0, 0, 1, 1, 6, 7, NULL),
(1, 7, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-21 20:17:48', 'Version 7', 0, 0, 1, 1, 6, 7, NULL),
(137, 1, 'LinkSocial', 'linksocial', NULL, '2013-05-21 20:42:56', '2013-05-21 20:42:56', 'Initial Version', 0, 0, 1, NULL, 6, 1, NULL),
(1, 8, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-22 14:34:42', 'Version 8', 0, 0, 1, 1, 6, 7, NULL),
(1, 9, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-22 14:35:47', 'Version 9', 0, 0, 1, 1, 6, 7, NULL),
(1, 10, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-22 19:48:39', 'Version 10', 0, 0, 1, 1, 6, 7, NULL),
(1, 11, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-22 20:07:08', 'Version 11', 0, 0, 1, 1, 6, 7, NULL),
(1, 12, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-22 20:14:23', 'Version 12', 0, 0, 1, 1, 6, 7, NULL),
(1, 13, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-22 20:16:42', 'Version 13', 0, 0, 1, 1, 6, 7, NULL),
(1, 14, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-22 20:17:36', 'Version 14', 0, 0, 1, 1, 6, 7, NULL),
(1, 15, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-22 20:54:20', 'Version 15', 0, 0, 1, 1, 6, 7, NULL),
(1, 16, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-22 22:15:08', 'Version 16', 0, 0, 1, 1, 6, 7, NULL),
(1, 17, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-23 10:51:34', 'Version 17', 0, 0, 1, 1, 6, 7, NULL),
(1, 18, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-23 10:54:51', 'Version 18', 0, 0, 1, 1, 6, 7, NULL),
(1, 19, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-23 12:51:37', 'Version 19', 0, 0, 1, 1, 6, 7, NULL),
(137, 2, 'LinkSocial', 'linksocial', NULL, '2013-05-21 20:42:56', '2013-05-25 11:05:05', 'New Version 2', 1, 0, 1, 1, 6, 1, NULL),
(1, 20, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-05-25 11:05:35', 'New Version 20', 0, 0, 1, 1, 6, 7, NULL),
(138, 1, 'test', 'test', '', '2013-11-12 10:36:00', '2013-11-12 10:36:22', 'Initial Version', 1, 0, 1, 1, 6, 5, NULL),
(1, 22, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-11-25 22:06:56', 'Version 22', 0, 0, 1, 1, 6, 7, NULL),
(139, 1, 'aaa', 'aaa', '', '2013-11-25 21:56:00', '2013-11-25 21:56:06', 'Initial Version', 0, 0, 1, 1, 6, 5, NULL),
(139, 2, 'aaa', 'aaa', '', '2013-11-25 21:56:00', '2013-11-25 22:03:00', 'Version 2', 1, 0, 1, 1, 6, 6, NULL),
(1, 21, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-11-25 22:05:28', 'Version 21', 0, 0, 1, 1, 6, 7, NULL),
(1, 28, 'Home', 'home', '', '2012-11-22 16:12:13', '2014-01-02 18:06:29', 'New Version 28', 0, 1, 1, NULL, 6, 7, NULL),
(1, 23, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-11-25 22:10:06', 'Version 23', 0, 0, 1, 1, 6, 7, NULL),
(1, 24, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-11-25 22:16:45', 'New Version 24', 0, 0, 1, 1, 6, 7, NULL),
(1, 26, 'Home', 'home', '', '2012-11-22 16:12:13', '2014-01-02 18:00:11', 'Version 26', 0, 0, 1, 1, 6, 7, NULL),
(140, 1, 'Custom Template', 'custom-template', '', '2013-12-31 21:46:00', '2013-12-31 21:46:43', 'Initial Version', 1, 0, 1, 1, 6, 5, NULL),
(1, 25, 'Home', 'home', '', '2012-11-22 16:12:13', '2013-12-31 21:47:35', 'Version 25', 0, 0, 1, 1, 6, 7, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `ComposerContentLayout`
--

CREATE TABLE IF NOT EXISTS `ComposerContentLayout` (
  `cclID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `ccFilename` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`cclID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `ComposerContentLayout`
--

INSERT INTO `ComposerContentLayout` (`cclID`, `bID`, `akID`, `displayOrder`, `ctID`, `ccFilename`) VALUES
(1, 16, 0, 1, 4, 'header.php'),
(2, 15, 0, 2, 4, 'thumbnail.php'),
(3, 13, 0, 3, 4, ''),
(4, 0, 14, 4, 4, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `ComposerDrafts`
--

CREATE TABLE IF NOT EXISTS `ComposerDrafts` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cpPublishParentID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ComposerTypes`
--

CREATE TABLE IF NOT EXISTS `ComposerTypes` (
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctComposerPublishPageMethod` varchar(64) NOT NULL DEFAULT 'CHOOSE',
  `ctComposerPublishPageTypeID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctComposerPublishPageParentID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ComposerTypes`
--

INSERT INTO `ComposerTypes` (`ctID`, `ctComposerPublishPageMethod`, `ctComposerPublishPageTypeID`, `ctComposerPublishPageParentID`) VALUES
(4, 'PARENT', 0, 128);

-- --------------------------------------------------------

--
-- Struttura della tabella `Config`
--

CREATE TABLE IF NOT EXISTS `Config` (
  `cfKey` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cfValue` longtext,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cfKey`,`uID`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `Config`
--

INSERT INTO `Config` (`cfKey`, `timestamp`, `cfValue`, `uID`, `pkgID`) VALUES
('ACCESS_ENTITY_UPDATED', '2012-11-22 15:12:25', '1353597145', 0, 0),
('SITE', '2012-11-22 15:12:28', 'OpenRevolution', 0, 0),
('SITE_APP_VERSION', '2013-05-03 06:27:38', '5.6.1.2', 0, 0),
('SITE_INSTALLED_APP_VERSION', '2012-11-22 15:12:28', '5.6.0.2', 0, 0),
('NEWSFLOW_LAST_VIEWED', '2014-01-02 16:59:20', '1388681960', 1, 0),
('APP_VERSION_LATEST', '2013-12-31 20:34:23', '5.6.2.1', 0, 0),
('ENVIRONMENT_CACHE', '2013-04-30 10:08:40', 'O:11:"Environment":7:{s:16:"\0*\0coreOverrides";a:0:{}s:15:"\0*\0corePackages";a:2:{i:0;s:11:"crimson_red";i:1;s:9:"wave_text";}s:25:"\0*\0coreOverridesByPackage";a:0:{}s:19:"\0*\0overridesScanned";b:1;s:18:"\0*\0cachedOverrides";a:0:{}s:13:"\0*\0autoLoaded";b:0;s:14:"\0*\0ignoreFiles";a:1:{i:0;s:8:"__MACOSX";}}', 0, 0),
('SEEN_INTRODUCTION', '2012-11-22 15:12:36', '1', 0, 0),
('MARKETPLACE_SITE_TOKEN', '2012-11-22 15:18:36', '956HTbUyGNav8moVXDFwDi1JUqTzVeDh9UfnMTjWBzOUKCcPlyrL0YctuV0pR38J', 0, 0),
('MARKETPLACE_SITE_URL_TOKEN', '2012-11-22 15:18:36', 'g5pcmjiub0jqdqloceiypbrg', 0, 0),
('DO_PAGE_REINDEX_CHECK', '2014-01-02 17:06:03', '0', 0, 0),
('QUICK_NAV_BOOKMARKS', '2013-04-30 09:09:04', 'O:21:"ConcreteDashboardMenu":1:{s:8:"\0*\0items";a:9:{i:0;s:25:"/dashboard/composer/write";i:1;s:26:"/dashboard/composer/drafts";i:2;s:23:"/dashboard/sitemap/full";i:3;s:25:"/dashboard/sitemap/search";i:4;s:23:"/dashboard/files/search";i:5;s:21:"/dashboard/files/sets";i:6;s:29:"/dashboard/reports/statistics";i:7;s:24:"/dashboard/reports/forms";i:8;s:24:"/dashboard/blocks/stacks";}}', 1, 0),
('CONTENTS_TXT_EDITOR_MODE', '2013-05-22 12:23:31', 'ADVANCED', 0, 0),
('CONTENTS_TXT_EDITOR_WIDTH', '2013-05-22 12:23:31', '580', 0, 0),
('CONTENTS_TXT_EDITOR_HEIGHT', '2013-05-22 12:23:31', '380', 0, 0),
('DASHBOARD_BACKGROUND_IMAGE', '2013-11-12 09:45:38', 'none', 0, 0),
('DASHBOARD_BACKGROUND_IMAGE_CUSTOM_FILE_ID', '2013-11-12 09:45:38', '0', 0, 0),
('STATISTICS_TRACK_PAGE_VIEWS', '2013-11-12 09:46:01', '1', 0, 0),
('MOBILE_THEME_ID', '2013-11-25 20:58:05', '6', 0, 0),
('SITE_DEBUG_LEVEL', '2012-11-22 15:12:24', '1', 0, 0),
('ENABLE_LOG_EMAILS', '2012-11-22 15:12:24', '1', 0, 0),
('ENABLE_LOG_ERRORS', '2012-11-22 15:12:24', '1', 0, 0),
('ENABLE_CACHE', '2012-11-22 15:12:24', '1', 0, 0),
('FULL_PAGE_CACHE_GLOBAL', '2012-11-22 15:12:24', '0', 0, 0),
('ENABLE_MARKETPLACE_SUPPORT', '2012-11-22 15:12:24', '1', 0, 0),
('ANTISPAM_LOG_SPAM', '2012-11-22 15:12:24', '1', 0, 0),
('ENABLE_OVERRIDE_CACHE', '2012-11-22 15:12:24', '1', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `CustomStylePresets`
--

CREATE TABLE IF NOT EXISTS `CustomStylePresets` (
  `cspID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cspName` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cspID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `CustomStyleRules`
--

CREATE TABLE IF NOT EXISTS `CustomStyleRules` (
  `csrID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `css_id` varchar(128) DEFAULT NULL,
  `css_class` varchar(128) DEFAULT NULL,
  `css_serialized` text,
  `css_custom` text,
  PRIMARY KEY (`csrID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dump dei dati per la tabella `CustomStyleRules`
--

INSERT INTO `CustomStyleRules` (`csrID`, `css_id`, `css_class`, `css_serialized`, `css_custom`) VALUES
(1, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:0:"";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"7";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(2, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:3:"555";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:0:"";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"7";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(3, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:3:"555";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:2:"55";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:2:"55";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"7";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(4, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:2:"55";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:0:"";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(5, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:2:"55";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:2:"55";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(6, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:2:"55";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"333";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(7, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"111";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(8, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(9, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:3:"555";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:2:"55";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:2:"55";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"7";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(10, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:3:"555";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:2:"55";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:2:"55";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(11, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'text-shadow: 2px 2px 2px #aaa;'),
(12, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'text-shadow: 0px 0px 4px white,\r\n\r\n             0px -5px 4px #FFFF33,\r\n\r\n             2px -10px 6px #FFDD33,\r\n\r\n             -2px -15px 11px #FF8800,\r\n\r\n             2px -25px 18px #FF2200'),
(13, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'text-shadow: 1px 1px 1px #fff'),
(14, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border: 1px solid #000;'),
(15, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', '#s {\r\n-moz-border-radius: 14px;\r\n-webkit-border-radius: 14px;\r\nborder-radius: 14px;\r\n-moz-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\n-webkit-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\nbox-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\n}'),
(16, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', '-moz-border-radius: 14px;\r\n-webkit-border-radius: 14px;\r\nborder-radius: 14px;\r\n-moz-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\n-webkit-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\nbox-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\n'),
(17, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', '-moz-border-radius: 14px;\r\n-webkit-border-radius: 14px;\r\nborder-radius: 14px;\r\n-moz-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\n-webkit-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\nbox-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\nbackground-color:#d0e4fe;'),
(18, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'transform:rotate(30deg);\r\n-moz-border-radius: 14px;\r\n-webkit-border-radius: 14px;\r\nborder-radius: 14px;\r\n-moz-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\n-webkit-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\nbox-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\nbackground-color:#d0e4fe;'),
(19, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'transform:rotate(30deg);'),
(20, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'animation:mymove 5s infinite;\r\n-webkit-animation:mymove 5s infinite;'),
(21, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'width:200px;\r\nheight:100px;\r\nbackground-color:yellow;\r\n/* Rotate div */\r\ntransform:rotate(7deg);\r\n-ms-transform:rotate(7deg); /* IE 9 */\r\n-webkit-transform:rotate(7deg); /* Safari and Chrome */'),
(22, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border:2px solid #a1a1a1;\r\npadding:10px 40px; \r\nbackground:#dddddd;\r\nwidth:300px;\r\nborder-radius:25px;'),
(23, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border:2px solid #a1a1a1;\r\npadding:10px 40px; \r\nbackground:#F0F8FF;\r\nwidth:300px;\r\nborder-radius:25px;'),
(24, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border:2px solid #a1a1a1;\r\npadding:10px 60px; \r\nbackground:#F0F8FF;\r\nwidth:300px;\r\nborder-radius:25px;'),
(25, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'appearance:button;\r\n-moz-appearance:button; /* Firefox */\r\n-webkit-appearance:button; /* Safari and Chrome */'),
(26, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'appearance:button;\r\n-moz-appearance:button; /* Firefox */\r\n-webkit-appearance:button; /* Safari and border:2px solid #a1a1a1;\r\npadding:10px 40px; \r\nbackground:#dddddd;\r\nwidth:300px;\r\nborder-radius:25px;Chrome */'),
(27, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'padding:10px 40px; \r\nbackground:#dddddd;\r\nwidth:300px;\r\nborder-radius:25px;Chrome */\r\nappearance:button;\r\n-moz-appearance:button; /* Firefox */\r\n-webkit-appearance:button; /* Safari and border:2px solid #a1a1a1;\r\n\r\n'),
(28, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'span.crosshair {cursor:crosshair}\r\nspan.help {cursor:help}\r\nspan.wait {cursor:wait}\r\n'),
(29, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'voice-family:male;\r\nrichness:80;\r\ncue-before:url(''beep.au'')\r\n'),
(30, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'voice-family:male;\r\nrichness:80;\r\ncue-before:url(''beep.au'')\r\nfont-size: 62.5%\r\n'),
(31, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'font-size: 62.5%\r\n'),
(32, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'font-size: 162.5%\r\n'),
(33, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'width:760px;'),
(34, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'margin: 0; padding: 0;'),
(35, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', '-moz-border-radius: 14px;\r\n-webkit-border-radius: 14px;\r\nborder-radius: 14px;\r\n-moz-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\n-webkit-box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;\r\nbox-shadow: 1px 1px 2px rgba(0, 0, 0, 0.75) inset;'),
(36, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border-radius: 15px;'),
(37, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border:2px solid #a1a1a1;\r\npadding:10px 40px; \r\nbackground:#dddddd;\r\nwidth:300px;\r\nborder-radius:25px;'),
(38, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border:2px solid #ccc;\r\npadding:10px 40px; \r\nbackground:#dddddd;\r\nwidth:300px;\r\nborder-radius:25px;'),
(39, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border:2px solid #ccc;\r\npadding:10px 40px; \r\nbackground:#dddddd;\r\nwidth:300px;\r\nborder-radius:25px;'),
(40, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border:2px solid;\r\nborder-radius:25px;'),
(41, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border:2px solid ;\r\npadding:10px 40px; \r\nbackground:#FFFAF0;\r\nwidth:300px;\r\nborder-radius:25px;\r\n'),
(42, '', '', 'a:20:{s:11:"font_family";s:5:"Arial";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:3:"222";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', 'border:2px solid #9ACD32;\r\npadding:10px 40px; \r\nbackground:#FFFFFF;\r\nwidth:300px;\r\nborder-radius:25px;\r\n'),
(43, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:5:"right";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:0:"";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(44, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:4:"-300";s:11:"padding_top";s:0:"";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(45, '', 'TEST', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:0:"";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', ''),
(46, '', '', 'a:20:{s:11:"font_family";s:7:"inherit";s:5:"color";s:0:"";s:9:"font_size";s:0:"";s:11:"line_height";s:0:"";s:10:"text_align";s:0:"";s:16:"background_color";s:0:"";s:12:"border_style";s:4:"none";s:12:"border_color";s:0:"";s:12:"border_width";s:1:"0";s:15:"border_position";s:4:"full";s:10:"margin_top";s:0:"";s:12:"margin_right";s:0:"";s:13:"margin_bottom";s:0:"";s:11:"margin_left";s:0:"";s:11:"padding_top";s:0:"";s:13:"padding_right";s:0:"";s:14:"padding_bottom";s:0:"";s:12:"padding_left";s:0:"";s:16:"background_image";s:1:"0";s:17:"background_repeat";s:9:"no-repeat";}', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `DashboardHomepage`
--

CREATE TABLE IF NOT EXISTS `DashboardHomepage` (
  `dbhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dbhModule` varchar(255) NOT NULL,
  `dbhDisplayName` varchar(255) DEFAULT NULL,
  `dbhDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbhID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `DownloadStatistics`
--

CREATE TABLE IF NOT EXISTS `DownloadStatistics` (
  `dsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fvID` int(10) unsigned NOT NULL,
  `uID` int(10) unsigned NOT NULL,
  `rcID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `FileAttributeValues`
--

CREATE TABLE IF NOT EXISTS `FileAttributeValues` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`,`akID`,`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `FileAttributeValues`
--

INSERT INTO `FileAttributeValues` (`fID`, `fvID`, `akID`, `avID`) VALUES
(9, 1, 12, 141),
(9, 1, 13, 142),
(10, 1, 12, 143),
(10, 1, 13, 144),
(11, 1, 12, 145),
(11, 1, 13, 146),
(12, 1, 12, 147),
(12, 1, 13, 148),
(13, 1, 12, 149),
(13, 1, 13, 150);

-- --------------------------------------------------------

--
-- Struttura della tabella `FilePermissionAssignments`
--

CREATE TABLE IF NOT EXISTS `FilePermissionAssignments` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`paID`,`pkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `FilePermissionFileTypes`
--

CREATE TABLE IF NOT EXISTS `FilePermissionFileTypes` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(32) NOT NULL,
  PRIMARY KEY (`fsID`,`gID`,`uID`,`extension`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `FilePermissions`
--

CREATE TABLE IF NOT EXISTS `FilePermissions` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `canRead` int(4) NOT NULL DEFAULT '0',
  `canWrite` int(4) NOT NULL DEFAULT '0',
  `canAdmin` int(4) NOT NULL DEFAULT '0',
  `canSearch` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Files`
--

CREATE TABLE IF NOT EXISTS `Files` (
  `fID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fDateAdded` datetime DEFAULT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fslID` int(10) unsigned NOT NULL DEFAULT '0',
  `ocID` int(10) unsigned NOT NULL DEFAULT '0',
  `fOverrideSetPermissions` int(1) NOT NULL DEFAULT '0',
  `fPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fID`,`uID`,`fslID`),
  KEY `fOverrideSetPermissions` (`fOverrideSetPermissions`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dump dei dati per la tabella `Files`
--

INSERT INTO `Files` (`fID`, `fDateAdded`, `uID`, `fslID`, `ocID`, `fOverrideSetPermissions`, `fPassword`) VALUES
(9, '2013-05-25 11:04:47', 1, 0, 0, 0, NULL),
(10, '2013-05-25 11:04:47', 1, 0, 0, 0, NULL),
(11, '2013-05-25 11:04:48', 1, 0, 0, 0, NULL),
(12, '2013-05-25 11:04:49', 1, 0, 0, 0, NULL),
(13, '2013-06-09 10:01:26', 1, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `FileSearchIndexAttributes`
--

CREATE TABLE IF NOT EXISTS `FileSearchIndexAttributes` (
  `fID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_width` decimal(14,4) DEFAULT '0.0000',
  `ak_height` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`fID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `FileSearchIndexAttributes`
--

INSERT INTO `FileSearchIndexAttributes` (`fID`, `ak_width`, `ak_height`) VALUES
(1, '960.0000', '212.0000'),
(2, '960.0000', '212.0000'),
(3, '960.0000', '212.0000'),
(4, '960.0000', '212.0000'),
(5, '960.0000', '212.0000'),
(6, '960.0000', '212.0000'),
(7, '960.0000', '212.0000'),
(8, '150.0000', '150.0000'),
(9, '32.0000', '32.0000'),
(10, '32.0000', '32.0000'),
(11, '32.0000', '32.0000'),
(12, '32.0000', '32.0000'),
(13, '2048.0000', '1250.0000');

-- --------------------------------------------------------

--
-- Struttura della tabella `FileSetFiles`
--

CREATE TABLE IF NOT EXISTS `FileSetFiles` (
  `fsfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fsID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fsDisplayOrder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fsfID`),
  KEY `fID` (`fID`),
  KEY `fsID` (`fsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `FileSetPermissionAssignments`
--

CREATE TABLE IF NOT EXISTS `FileSetPermissionAssignments` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fsID`,`paID`,`pkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `FileSetPermissionAssignments`
--

INSERT INTO `FileSetPermissionAssignments` (`fsID`, `paID`, `pkID`) VALUES
(0, 36, 34),
(0, 37, 35),
(0, 38, 36),
(0, 39, 37),
(0, 40, 38),
(0, 41, 39),
(0, 42, 41),
(0, 43, 40),
(0, 44, 42);

-- --------------------------------------------------------

--
-- Struttura della tabella `FileSetPermissionFileTypeAccessList`
--

CREATE TABLE IF NOT EXISTS `FileSetPermissionFileTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `FileSetPermissionFileTypeAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `FileSetPermissionFileTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(64) NOT NULL,
  PRIMARY KEY (`paID`,`peID`,`extension`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `FileSets`
--

CREATE TABLE IF NOT EXISTS `FileSets` (
  `fsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fsName` varchar(64) NOT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsType` int(4) NOT NULL,
  `fsOverrideGlobalPermissions` int(4) DEFAULT NULL,
  PRIMARY KEY (`fsID`),
  KEY `fsOverrideGlobalPermissions` (`fsOverrideGlobalPermissions`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `FileSetSavedSearches`
--

CREATE TABLE IF NOT EXISTS `FileSetSavedSearches` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsSearchRequest` text,
  `fsResultColumns` text,
  PRIMARY KEY (`fsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `FileStorageLocations`
--

CREATE TABLE IF NOT EXISTS `FileStorageLocations` (
  `fslID` int(10) unsigned NOT NULL DEFAULT '0',
  `fslName` varchar(255) NOT NULL,
  `fslDirectory` varchar(255) NOT NULL,
  PRIMARY KEY (`fslID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `FileVersionLog`
--

CREATE TABLE IF NOT EXISTS `FileVersionLog` (
  `fvlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeID` int(3) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeAttributeID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fvlID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dump dei dati per la tabella `FileVersionLog`
--

INSERT INTO `FileVersionLog` (`fvlID`, `fID`, `fvID`, `fvUpdateTypeID`, `fvUpdateTypeAttributeID`) VALUES
(18, 9, 1, 5, 13),
(17, 9, 1, 5, 12),
(20, 10, 1, 5, 13),
(19, 10, 1, 5, 12),
(22, 11, 1, 5, 13),
(21, 11, 1, 5, 12),
(24, 12, 1, 5, 13),
(23, 12, 1, 5, 12),
(26, 13, 1, 5, 13),
(25, 13, 1, 5, 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `FileVersions`
--

CREATE TABLE IF NOT EXISTS `FileVersions` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvFilename` varchar(255) NOT NULL,
  `fvPrefix` varchar(12) DEFAULT NULL,
  `fvGenericType` int(3) unsigned NOT NULL DEFAULT '0',
  `fvSize` int(20) unsigned NOT NULL DEFAULT '0',
  `fvTitle` varchar(255) DEFAULT NULL,
  `fvDescription` text,
  `fvTags` varchar(255) DEFAULT NULL,
  `fvIsApproved` int(10) unsigned NOT NULL DEFAULT '1',
  `fvDateAdded` datetime DEFAULT NULL,
  `fvApproverUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvAuthorUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvActivateDatetime` datetime DEFAULT NULL,
  `fvHasThumbnail1` int(1) NOT NULL DEFAULT '0',
  `fvHasThumbnail2` int(1) NOT NULL DEFAULT '0',
  `fvHasThumbnail3` int(1) NOT NULL DEFAULT '0',
  `fvExtension` varchar(32) DEFAULT NULL,
  `fvType` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`),
  KEY `fvExtension` (`fvType`),
  KEY `fvTitle` (`fvTitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `FileVersions`
--

INSERT INTO `FileVersions` (`fID`, `fvID`, `fvFilename`, `fvPrefix`, `fvGenericType`, `fvSize`, `fvTitle`, `fvDescription`, `fvTags`, `fvIsApproved`, `fvDateAdded`, `fvApproverUID`, `fvAuthorUID`, `fvActivateDatetime`, `fvHasThumbnail1`, `fvHasThumbnail2`, `fvHasThumbnail3`, `fvExtension`, `fvType`) VALUES
(9, 1, 'facebook.png', '891369472687', 1, 1626, 'facebook.png', '', '', 1, '2013-05-25 11:04:47', 1, 1, '2013-05-25 11:04:47', 1, 1, 0, 'png', 1),
(10, 1, 'google.png', '331369472687', 1, 2499, 'google.png', '', '', 1, '2013-05-25 11:04:47', 1, 1, '2013-05-25 11:04:47', 1, 1, 0, 'png', 1),
(11, 1, 'linkedin.png', '481369472688', 1, 1528, 'linkedin.png', '', '', 1, '2013-05-25 11:04:48', 1, 1, '2013-05-25 11:04:48', 1, 1, 0, 'png', 1),
(12, 1, 'twitter.png', '521369472689', 1, 1597, 'twitter.png', '', '', 1, '2013-05-25 11:04:49', 1, 1, '2013-05-25 11:04:49', 1, 1, 0, 'png', 1),
(13, 1, '964190_598234856862455_297938299_o.jpg', '721370764886', 1, 215279, '964190_598234856862455_297938299_o.jpg', '', '', 1, '2013-06-09 10:01:26', 1, 1, '2013-06-09 10:01:26', 1, 1, 0, 'jpg', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Groups`
--

CREATE TABLE IF NOT EXISTS `Groups` (
  `gID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gName` varchar(128) NOT NULL,
  `gDescription` varchar(255) NOT NULL,
  `gUserExpirationIsEnabled` int(1) NOT NULL DEFAULT '0',
  `gUserExpirationMethod` varchar(12) DEFAULT NULL,
  `gUserExpirationSetDateTime` datetime DEFAULT NULL,
  `gUserExpirationInterval` int(10) unsigned NOT NULL DEFAULT '0',
  `gUserExpirationAction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`gID`),
  UNIQUE KEY `gName` (`gName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `Groups`
--

INSERT INTO `Groups` (`gID`, `gName`, `gDescription`, `gUserExpirationIsEnabled`, `gUserExpirationMethod`, `gUserExpirationSetDateTime`, `gUserExpirationInterval`, `gUserExpirationAction`) VALUES
(1, 'Guest', 'The guest group represents unregistered visitors to your site.', 0, NULL, NULL, 0, NULL),
(2, 'Registered Users', 'The registered users group represents all user accounts.', 0, NULL, NULL, 0, NULL),
(3, 'Administrators', '', 0, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `GroupSetGroups`
--

CREATE TABLE IF NOT EXISTS `GroupSetGroups` (
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `gsID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gID`,`gsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `GroupSets`
--

CREATE TABLE IF NOT EXISTS `GroupSets` (
  `gsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gsName` varchar(255) DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Jobs`
--

CREATE TABLE IF NOT EXISTS `Jobs` (
  `jID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jName` varchar(100) NOT NULL,
  `jDescription` varchar(255) NOT NULL,
  `jDateInstalled` datetime DEFAULT NULL,
  `jDateLastRun` datetime DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `jLastStatusText` varchar(255) DEFAULT NULL,
  `jLastStatusCode` smallint(4) NOT NULL DEFAULT '0',
  `jStatus` varchar(14) NOT NULL DEFAULT 'ENABLED',
  `jHandle` varchar(255) NOT NULL,
  `jNotUninstallable` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `Jobs`
--

INSERT INTO `Jobs` (`jID`, `jName`, `jDescription`, `jDateInstalled`, `jDateLastRun`, `pkgID`, `jLastStatusText`, `jLastStatusCode`, `jStatus`, `jHandle`, `jNotUninstallable`) VALUES
(1, 'Index Search Engine', 'Index the site to allow searching to work quickly and accurately.', '2012-11-22 16:12:15', NULL, 0, NULL, 0, 'ENABLED', 'index_search', 1),
(2, 'Generate the sitemap.xml file', 'Generate the sitemap.xml file that search engines use to crawl your site.', '2012-11-22 16:12:15', NULL, 0, NULL, 0, 'ENABLED', 'generate_sitemap', 0),
(3, 'Process Email Posts', 'Polls an email account and grabs private messages/postings that are sent there..', '2012-11-22 16:12:15', NULL, 0, NULL, 0, 'ENABLED', 'process_email', 0),
(4, 'Remove Old Page Versions', 'Removes all except the 10 most recent page versions for each page.', '2012-11-22 16:12:15', NULL, 0, NULL, 0, 'ENABLED', 'remove_old_page_versions', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `JobsLog`
--

CREATE TABLE IF NOT EXISTS `JobsLog` (
  `jlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jID` int(10) unsigned NOT NULL,
  `jlMessage` varchar(255) NOT NULL,
  `jlTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jlError` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jlID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `LayoutPresets`
--

CREATE TABLE IF NOT EXISTS `LayoutPresets` (
  `lpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lpName` varchar(128) NOT NULL,
  `layoutID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lpID`),
  UNIQUE KEY `layoutID` (`layoutID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Layouts`
--

CREATE TABLE IF NOT EXISTS `Layouts` (
  `layoutID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout_rows` int(5) NOT NULL DEFAULT '3',
  `layout_columns` int(3) NOT NULL DEFAULT '3',
  `spacing` int(3) NOT NULL DEFAULT '3',
  `breakpoints` varchar(255) NOT NULL DEFAULT '',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layoutID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Logs`
--

CREATE TABLE IF NOT EXISTS `Logs` (
  `logID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logType` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logText` longtext,
  `logUserID` int(10) unsigned DEFAULT NULL,
  `logIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logID`),
  KEY `logType` (`logType`),
  KEY `logIsInternal` (`logIsInternal`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `Logs`
--

INSERT INTO `Logs` (`logID`, `logType`, `timestamp`, `logText`, `logUserID`, `logIsInternal`) VALUES
(1, 'sent_emails', '2013-02-09 08:01:16', '**EMAILS ARE ENABLED. THIS EMAIL WAS SENT TO mail()**\nTemplate Used: forgot_password\nTo: info@consul-net.it\nFrom: &quot;Forgot Password&quot; &lt;info@consul-net.it&gt;\nSubject: Forgot Password\nBody: \n\nDear admin,\n\nYou have requested a new password for the site OpenRevolution \n\nYour username is: admin\n\nYou may change your password at the following address:\n\nhttp://www.openrevolution.it/index.php/login/change_password/9cfzY9GPEbyQ/\n\nThanks for browsing the site!\n\n\n', NULL, 1),
(2, 'sent_emails', '2013-02-18 21:06:53', '**EMAILS ARE ENABLED. THIS EMAIL WAS SENT TO mail()**\nTemplate Used: forgot_password\nTo: info@consul-net.it\nFrom: &quot;Forgot Password&quot; &lt;info@consul-net.it&gt;\nSubject: Forgot Password\nBody: \n\nDear admin,\n\nYou have requested a new password for the site OpenRevolution \n\nYour username is: admin\n\nYou may change your password at the following address:\n\nhttp://www.openrevolution.it/index.php/login/change_password/buqHL2WrMc7X/\n\nThanks for browsing the site!\n\n\n', NULL, 1),
(3, 'sent_emails', '2013-02-24 19:47:00', '**EMAILS ARE ENABLED. THIS EMAIL WAS SENT TO mail()**\nTemplate Used: forgot_password\nTo: info@consul-net.it\nFrom: &quot;Forgot Password&quot; &lt;info@consul-net.it&gt;\nSubject: Forgot Password\nBody: \n\nDear admin,\n\nYou have requested a new password for the site OpenRevolution \n\nYour username is: admin\n\nYou may change your password at the following address:\n\nhttp://www.openrevolution.it/index.php/login/change_password/FnFLDbtK1SfA/\n\nThanks for browsing the site!\n\n\n', NULL, 1),
(4, 'exceptions', '2013-07-11 14:07:26', 'Exception Occurred: /web/htdocs/www.openrevolution.it/home/updates/concrete5.6.1.2/concrete/core/controllers/blocks/form.php:256 Oops, something is wrong with the form you posted (it doesn''t have a question set id). (0)\n\n#0 /web/htdocs/www.openrevolution.it/home/updates/concrete5.6.1.2/concrete/core/models/block.php(411): Concrete5_Controller_Block_Form-&gt;action_submit_form()\n#1 /web/htdocs/www.openrevolution.it/home/updates/concrete5.6.1.2/concrete/startup/process.php(283): Concrete5_Model_Block-&gt;passThruBlock(''submit_form'')\n#2 /web/htdocs/www.openrevolution.it/home/updates/concrete5.6.1.2/concrete/dispatcher.php(244): require(''/web/htdocs/www...'')\n#3 /web/htdocs/www.openrevolution.it/home/concrete/startup/updated_core_check.php(6): require(''/web/htdocs/www...'')\n#4 /web/htdocs/www.openrevolution.it/home/concrete/dispatcher.php(20): require(''/web/htdocs/www...'')\n#5 /web/htdocs/www.openrevolution.it/home/index.php(2): require(''/web/htdocs/www...'')\n#6 {main}\n', NULL, 1),
(5, 'exceptions', '2013-07-22 09:09:06', 'Exception Occurred: /web/htdocs/www.openrevolution.it/home/updates/concrete5.6.1.2/concrete/core/controllers/blocks/form.php:256 Oops, something is wrong with the form you posted (it doesn''t have a question set id). (0)\n\n#0 /web/htdocs/www.openrevolution.it/home/updates/concrete5.6.1.2/concrete/core/models/block.php(411): Concrete5_Controller_Block_Form-&gt;action_submit_form()\n#1 /web/htdocs/www.openrevolution.it/home/updates/concrete5.6.1.2/concrete/startup/process.php(283): Concrete5_Model_Block-&gt;passThruBlock(''submit_form'')\n#2 /web/htdocs/www.openrevolution.it/home/updates/concrete5.6.1.2/concrete/dispatcher.php(244): require(''/web/htdocs/www...'')\n#3 /web/htdocs/www.openrevolution.it/home/concrete/startup/updated_core_check.php(6): require(''/web/htdocs/www...'')\n#4 /web/htdocs/www.openrevolution.it/home/concrete/dispatcher.php(20): require(''/web/htdocs/www...'')\n#5 /web/htdocs/www.openrevolution.it/home/index.php(2): require(''/web/htdocs/www...'')\n#6 {main}\n', NULL, 1),
(6, 'sent_emails', '2013-11-12 07:39:42', '**EMAILS ARE ENABLED. THIS EMAIL WAS SENT TO mail()**\nTemplate Used: forgot_password\nTo: info@consul-net.it\nFrom: &quot;Forgot Password&quot; &lt;info@consul-net.it&gt;\nSubject: Forgot Password\nBody: \n\nDear admin,\n\nYou have requested a new password for the site OpenRevolution \n\nYour username is: admin\n\nYou may change your password at the following address:\n\nhttp://www.openrevolution.it/index.php/login/change_password/EuiP5jxTSTtY/\n\nThanks for browsing the site!\n\n\n', NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `MailImporters`
--

CREATE TABLE IF NOT EXISTS `MailImporters` (
  `miID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miHandle` varchar(64) NOT NULL,
  `miServer` varchar(255) DEFAULT NULL,
  `miUsername` varchar(255) DEFAULT NULL,
  `miPassword` varchar(255) DEFAULT NULL,
  `miEncryption` varchar(32) DEFAULT NULL,
  `miIsEnabled` int(1) NOT NULL DEFAULT '0',
  `miEmail` varchar(255) DEFAULT NULL,
  `miPort` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  `miConnectionMethod` varchar(8) DEFAULT 'POP',
  PRIMARY KEY (`miID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `MailImporters`
--

INSERT INTO `MailImporters` (`miID`, `miHandle`, `miServer`, `miUsername`, `miPassword`, `miEncryption`, `miIsEnabled`, `miEmail`, `miPort`, `pkgID`, `miConnectionMethod`) VALUES
(1, 'private_message', NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 'POP');

-- --------------------------------------------------------

--
-- Struttura della tabella `MailValidationHashes`
--

CREATE TABLE IF NOT EXISTS `MailValidationHashes` (
  `mvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miID` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `mHash` varchar(128) NOT NULL,
  `mDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `mDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`mvhID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Packages`
--

CREATE TABLE IF NOT EXISTS `Packages` (
  `pkgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkgName` varchar(255) NOT NULL,
  `pkgHandle` varchar(64) NOT NULL,
  `pkgDescription` text,
  `pkgDateInstalled` datetime NOT NULL,
  `pkgIsInstalled` tinyint(1) NOT NULL DEFAULT '1',
  `pkgVersion` varchar(32) DEFAULT NULL,
  `pkgAvailableVersion` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pkgID`),
  UNIQUE KEY `pkgHandle` (`pkgHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `Packages`
--

INSERT INTO `Packages` (`pkgID`, `pkgName`, `pkgHandle`, `pkgDescription`, `pkgDateInstalled`, `pkgIsInstalled`, `pkgVersion`, `pkgAvailableVersion`) VALUES
(1, 'Evolutium Theme', 'theme_evolutium', 'Installs the evolutium theme.', '2012-11-22 16:55:56', 1, '1.0', '1.0'),
(2, 'Wave Text', 'wave_text', 'Create text headers with a cool wave effect!', '2013-04-30 12:08:40', 1, '1.0', '1.0'),
(3, 'Long Story Short', 'theme_long_story_short', 'Installs Long Story Short theme, a simple, basic theme for single-page websites and presentations', '2013-11-12 10:12:09', 1, '1.0.3', '1.0.3');

-- --------------------------------------------------------

--
-- Struttura della tabella `PagePaths`
--

CREATE TABLE IF NOT EXISTS `PagePaths` (
  `ppID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cPath` text,
  `ppIsCanonical` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ppID`),
  KEY `cID` (`cID`),
  KEY `ppIsCanonical` (`ppIsCanonical`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=146 ;

--
-- Dump dei dati per la tabella `PagePaths`
--

INSERT INTO `PagePaths` (`ppID`, `cID`, `cPath`, `ppIsCanonical`) VALUES
(1, 2, '/dashboard', '1'),
(2, 3, '/dashboard/composer', '1'),
(3, 4, '/dashboard/composer/write', '1'),
(4, 5, '/dashboard/composer/drafts', '1'),
(5, 6, '/dashboard/sitemap', '1'),
(6, 7, '/dashboard/sitemap/full', '1'),
(7, 8, '/dashboard/sitemap/explore', '1'),
(8, 9, '/dashboard/sitemap/search', '1'),
(9, 10, '/dashboard/files', '1'),
(10, 11, '/dashboard/files/search', '1'),
(11, 12, '/dashboard/files/attributes', '1'),
(12, 13, '/dashboard/files/sets', '1'),
(13, 14, '/dashboard/files/add_set', '1'),
(14, 15, '/dashboard/users', '1'),
(15, 16, '/dashboard/users/search', '1'),
(16, 17, '/dashboard/users/groups', '1'),
(17, 18, '/dashboard/users/attributes', '1'),
(18, 19, '/dashboard/users/add', '1'),
(19, 20, '/dashboard/users/add_group', '1'),
(20, 21, '/dashboard/users/group_sets', '1'),
(21, 22, '/dashboard/reports', '1'),
(22, 23, '/dashboard/reports/statistics', '1'),
(23, 24, '/dashboard/reports/forms', '1'),
(24, 25, '/dashboard/reports/surveys', '1'),
(25, 26, '/dashboard/reports/logs', '1'),
(26, 27, '/dashboard/pages', '1'),
(27, 28, '/dashboard/pages/themes', '1'),
(28, 29, '/dashboard/pages/themes/add', '1'),
(29, 30, '/dashboard/pages/themes/inspect', '1'),
(30, 31, '/dashboard/pages/themes/customize', '1'),
(31, 32, '/dashboard/pages/types', '1'),
(32, 33, '/dashboard/pages/types/add', '1'),
(33, 34, '/dashboard/pages/attributes', '1'),
(34, 35, '/dashboard/pages/single', '1'),
(35, 36, '/dashboard/workflow', '1'),
(36, 37, '/dashboard/workflow/list', '1'),
(37, 38, '/dashboard/workflow/me', '1'),
(38, 39, '/dashboard/blocks', '1'),
(39, 40, '/dashboard/blocks/stacks', '1'),
(40, 41, '/dashboard/blocks/permissions', '1'),
(41, 42, '/dashboard/blocks/stacks/list', '1'),
(42, 43, '/dashboard/blocks/types', '1'),
(43, 44, '/dashboard/extend', '1'),
(44, 45, '/dashboard/news', '1'),
(45, 46, '/dashboard/extend/install', '1'),
(46, 47, '/dashboard/extend/update', '1'),
(47, 48, '/dashboard/extend/connect', '1'),
(48, 49, '/dashboard/extend/themes', '1'),
(49, 50, '/dashboard/extend/add-ons', '1'),
(50, 51, '/dashboard/system', '1'),
(51, 52, '/dashboard/system/basics', '1'),
(52, 53, '/dashboard/system/basics/site_name', '1'),
(53, 54, '/dashboard/system/basics/icons', '1'),
(54, 55, '/dashboard/system/basics/editor', '1'),
(55, 56, '/dashboard/system/basics/multilingual', '1'),
(56, 57, '/dashboard/system/basics/timezone', '1'),
(57, 58, '/dashboard/system/basics/interface', '1'),
(58, 59, '/dashboard/system/seo', '1'),
(59, 60, '/dashboard/system/seo/urls', '1'),
(60, 61, '/dashboard/system/seo/bulk_seo_tool', '1'),
(61, 62, '/dashboard/system/seo/tracking_codes', '1'),
(62, 63, '/dashboard/system/seo/statistics', '1'),
(63, 64, '/dashboard/system/seo/search_index', '1'),
(64, 65, '/dashboard/system/optimization', '1'),
(65, 66, '/dashboard/system/optimization/cache', '1'),
(66, 67, '/dashboard/system/optimization/clear_cache', '1'),
(67, 68, '/dashboard/system/optimization/jobs', '1'),
(68, 69, '/dashboard/system/permissions', '1'),
(69, 70, '/dashboard/system/permissions/site', '1'),
(70, 71, '/dashboard/system/permissions/files', '1'),
(71, 72, '/dashboard/system/permissions/file_types', '1'),
(72, 73, '/dashboard/system/permissions/tasks', '1'),
(73, 74, '/dashboard/system/permissions/users', '1'),
(74, 75, '/dashboard/system/permissions/advanced', '1'),
(75, 76, '/dashboard/system/permissions/ip_blacklist', '1'),
(76, 77, '/dashboard/system/permissions/captcha', '1'),
(77, 78, '/dashboard/system/permissions/antispam', '1'),
(78, 79, '/dashboard/system/permissions/maintenance_mode', '1'),
(79, 80, '/dashboard/system/registration', '1'),
(80, 81, '/dashboard/system/registration/postlogin', '1'),
(81, 82, '/dashboard/system/registration/profiles', '1'),
(82, 83, '/dashboard/system/registration/public_registration', '1'),
(83, 84, '/dashboard/system/mail', '1'),
(84, 85, '/dashboard/system/mail/method', '1'),
(85, 86, '/dashboard/system/mail/importers', '1'),
(86, 87, '/dashboard/system/attributes', '1'),
(87, 88, '/dashboard/system/attributes/sets', '1'),
(88, 89, '/dashboard/system/attributes/types', '1'),
(89, 90, '/dashboard/system/environment', '1'),
(90, 91, '/dashboard/system/environment/info', '1'),
(91, 92, '/dashboard/system/environment/debug', '1'),
(92, 93, '/dashboard/system/environment/logging', '1'),
(93, 94, '/dashboard/system/environment/file_storage_locations', '1'),
(94, 95, '/dashboard/system/environment/proxy', '1'),
(95, 96, '/dashboard/system/backup_restore', '1'),
(96, 97, '/dashboard/system/backup_restore/backup', '1'),
(97, 98, '/dashboard/system/backup_restore/update', '1'),
(98, 99, '/dashboard/system/backup_restore/database', '1'),
(99, 100, '/dashboard/pages/types/composer', '1'),
(100, 104, '/dashboard/home', '1'),
(101, 105, '/dashboard/welcome', '1'),
(102, 106, '/!drafts', '1'),
(103, 107, '/!trash', '1'),
(104, 108, '/!stacks', '1'),
(105, 109, '/login', '1'),
(106, 110, '/register', '1'),
(107, 111, '/profile', '1'),
(108, 112, '/profile/edit', '1'),
(109, 113, '/profile/avatar', '1'),
(110, 114, '/profile/messages', '1'),
(111, 115, '/profile/friends', '1'),
(112, 116, '/page_not_found', '1'),
(113, 117, '/page_forbidden', '1'),
(114, 118, '/download_file', '1'),
(115, 119, '/members', '1'),
(116, 120, '/!stacks/header-nav', '1'),
(117, 121, '/!stacks/side-nav', '1'),
(118, 122, '/!stacks/site-name', '1'),
(132, 127, '/!trash/about', '1'),
(135, 128, '/!trash/blog', '1'),
(138, 129, '/!trash/search', '1'),
(133, 130, '/!trash/about/contact-us', '1'),
(134, 131, '/!trash/about/guestbook', '1'),
(136, 132, '/!trash/blog/blog-archives', '1'),
(137, 133, '/!trash/blog/hello-world', '1'),
(143, 134, '/!trash/test1', '1'),
(128, 136, '/dashboard/system/seo/excluded', '1'),
(130, 137, '/!stacks/linksocial', '1'),
(142, 138, '/!trash/test', '1'),
(141, 139, '/!trash/aaa', '1'),
(145, 140, '/custom-template', '1');

-- --------------------------------------------------------

--
-- Struttura della tabella `PagePermissionAssignments`
--

CREATE TABLE IF NOT EXISTS `PagePermissionAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`pkID`,`paID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `PagePermissionAssignments`
--

INSERT INTO `PagePermissionAssignments` (`cID`, `pkID`, `paID`) VALUES
(1, 1, 45),
(1, 2, 46),
(1, 3, 47),
(1, 4, 48),
(1, 5, 49),
(1, 6, 50),
(1, 7, 51),
(1, 8, 52),
(1, 9, 53),
(1, 10, 54),
(1, 11, 55),
(1, 12, 56),
(1, 13, 57),
(1, 14, 58),
(1, 15, 59),
(2, 1, 18),
(2, 2, 19),
(2, 3, 24),
(2, 4, 20),
(2, 5, 21),
(2, 6, 26),
(2, 7, 28),
(2, 8, 30),
(2, 9, 27),
(2, 10, 31),
(2, 11, 32),
(2, 12, 22),
(2, 13, 25),
(2, 14, 23),
(2, 15, 29),
(42, 1, 33),
(109, 1, 34),
(110, 1, 35);

-- --------------------------------------------------------

--
-- Struttura della tabella `PagePermissionPageTypeAccessList`
--

CREATE TABLE IF NOT EXISTS `PagePermissionPageTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  `externalLink` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PagePermissionPageTypeAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `PagePermissionPageTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`ctID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PagePermissionPropertyAccessList`
--

CREATE TABLE IF NOT EXISTS `PagePermissionPropertyAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `name` int(1) unsigned DEFAULT '0',
  `publicDateTime` int(1) unsigned DEFAULT '0',
  `uID` int(1) unsigned DEFAULT '0',
  `description` int(1) unsigned DEFAULT '0',
  `paths` int(1) unsigned DEFAULT '0',
  `attributePermission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PagePermissionPropertyAttributeAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `PagePermissionPropertyAttributeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PagePermissionThemeAccessList`
--

CREATE TABLE IF NOT EXISTS `PagePermissionThemeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PagePermissionThemeAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `PagePermissionThemeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`ptID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Pages`
--

CREATE TABLE IF NOT EXISTS `Pages` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsTemplate` int(1) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  `cIsCheckedOut` tinyint(1) NOT NULL DEFAULT '0',
  `cCheckedOutUID` int(10) unsigned DEFAULT NULL,
  `cCheckedOutDatetime` datetime DEFAULT NULL,
  `cCheckedOutDatetimeLastEdit` datetime DEFAULT NULL,
  `cOverrideTemplatePermissions` tinyint(1) NOT NULL DEFAULT '1',
  `cInheritPermissionsFromCID` int(10) unsigned NOT NULL DEFAULT '0',
  `cInheritPermissionsFrom` varchar(8) NOT NULL DEFAULT 'PARENT',
  `cFilename` varchar(255) DEFAULT NULL,
  `cPointerID` int(10) unsigned NOT NULL DEFAULT '0',
  `cPointerExternalLink` varchar(255) DEFAULT NULL,
  `cPointerExternalLinkNewWindow` tinyint(1) NOT NULL DEFAULT '0',
  `cIsActive` tinyint(1) NOT NULL DEFAULT '1',
  `cChildren` int(10) unsigned NOT NULL DEFAULT '0',
  `cDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `cParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `cCacheFullPageContent` int(4) NOT NULL DEFAULT '-1',
  `cCacheFullPageContentOverrideLifetime` varchar(32) NOT NULL DEFAULT '0',
  `cCacheFullPageContentLifetimeCustom` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsSystemPage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `cParentID` (`cParentID`),
  KEY `cIsActive` (`cIsActive`),
  KEY `cCheckedOutUID` (`cCheckedOutUID`),
  KEY `uID` (`uID`),
  KEY `cPointerID` (`cPointerID`),
  KEY `cIsTemplate` (`cIsTemplate`),
  KEY `cIsSystemPage` (`cIsSystemPage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `Pages`
--

INSERT INTO `Pages` (`cID`, `cIsTemplate`, `uID`, `cIsCheckedOut`, `cCheckedOutUID`, `cCheckedOutDatetime`, `cCheckedOutDatetimeLastEdit`, `cOverrideTemplatePermissions`, `cInheritPermissionsFromCID`, `cInheritPermissionsFrom`, `cFilename`, `cPointerID`, `cPointerExternalLink`, `cPointerExternalLinkNewWindow`, `cIsActive`, `cChildren`, `cDisplayOrder`, `cParentID`, `pkgID`, `cCacheFullPageContent`, `cCacheFullPageContentOverrideLifetime`, `cCacheFullPageContentLifetimeCustom`, `cIsSystemPage`) VALUES
(1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'OVERRIDE', NULL, 0, NULL, 0, 1, 12, 0, 0, 0, -1, '0', 0, 0),
(2, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'OVERRIDE', '/dashboard/view.php', 0, NULL, 0, 1, 13, 0, 0, 0, -1, '0', 0, 1),
(3, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/composer/view.php', 0, NULL, 0, 1, 2, 0, 2, 0, -1, '0', 0, 1),
(4, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/composer/write.php', 0, NULL, 0, 1, 0, 0, 3, 0, -1, '0', 0, 1),
(5, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/composer/drafts.php', 0, NULL, 0, 1, 0, 1, 3, 0, -1, '0', 0, 1),
(6, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/view.php', 0, NULL, 0, 1, 3, 1, 2, 0, -1, '0', 0, 1),
(7, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/full.php', 0, NULL, 0, 1, 0, 0, 6, 0, -1, '0', 0, 1),
(8, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/explore.php', 0, NULL, 0, 1, 0, 1, 6, 0, -1, '0', 0, 1),
(9, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/search.php', 0, NULL, 0, 1, 0, 2, 6, 0, -1, '0', 0, 1),
(10, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/view.php', 0, NULL, 0, 1, 4, 2, 2, 0, -1, '0', 0, 1),
(11, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/search.php', 0, NULL, 0, 1, 0, 0, 10, 0, -1, '0', 0, 1),
(12, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/attributes.php', 0, NULL, 0, 1, 0, 1, 10, 0, -1, '0', 0, 1),
(13, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/sets.php', 0, NULL, 0, 1, 0, 2, 10, 0, -1, '0', 0, 1),
(14, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/add_set.php', 0, NULL, 0, 1, 0, 3, 10, 0, -1, '0', 0, 1),
(15, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/view.php', 0, NULL, 0, 1, 6, 3, 2, 0, -1, '0', 0, 1),
(16, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/search.php', 0, NULL, 0, 1, 0, 0, 15, 0, -1, '0', 0, 1),
(17, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups.php', 0, NULL, 0, 1, 0, 1, 15, 0, -1, '0', 0, 1),
(18, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/attributes.php', 0, NULL, 0, 1, 0, 2, 15, 0, -1, '0', 0, 1),
(19, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add.php', 0, NULL, 0, 1, 0, 3, 15, 0, -1, '0', 0, 1),
(20, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add_group.php', 0, NULL, 0, 1, 0, 4, 15, 0, -1, '0', 0, 1),
(21, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/group_sets.php', 0, NULL, 0, 1, 0, 5, 15, 0, -1, '0', 0, 1),
(22, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports.php', 0, NULL, 0, 1, 4, 4, 2, 0, -1, '0', 0, 1),
(23, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/statistics.php', 0, NULL, 0, 1, 0, 0, 22, 0, -1, '0', 0, 1),
(24, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/forms.php', 0, NULL, 0, 1, 0, 1, 22, 0, -1, '0', 0, 1),
(25, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/surveys.php', 0, NULL, 0, 1, 0, 2, 22, 0, -1, '0', 0, 1),
(26, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/logs.php', 0, NULL, 0, 1, 0, 3, 22, 0, -1, '0', 0, 1),
(27, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/view.php', 0, NULL, 0, 1, 4, 5, 2, 0, -1, '0', 0, 1),
(28, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/view.php', 0, NULL, 0, 1, 3, 0, 27, 0, -1, '0', 0, 1),
(29, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/add.php', 0, NULL, 0, 1, 0, 0, 28, 0, -1, '0', 0, 1),
(30, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/inspect.php', 0, NULL, 0, 1, 0, 1, 28, 0, -1, '0', 0, 1),
(31, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/customize.php', 0, NULL, 0, 1, 0, 2, 28, 0, -1, '0', 0, 1),
(32, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/view.php', 0, NULL, 0, 1, 2, 1, 27, 0, -1, '0', 0, 1),
(33, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/add.php', 0, NULL, 0, 1, 0, 0, 32, 0, -1, '0', 0, 1),
(34, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/attributes.php', 0, NULL, 0, 1, 0, 2, 27, 0, -1, '0', 0, 1),
(35, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/single.php', 0, NULL, 0, 1, 0, 3, 27, 0, -1, '0', 0, 1),
(36, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/workflow/view.php', 0, NULL, 0, 1, 2, 6, 2, 0, -1, '0', 0, 1),
(37, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/workflow/list.php', 0, NULL, 0, 1, 0, 0, 36, 0, -1, '0', 0, 1),
(38, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/workflow/me.php', 0, NULL, 0, 1, 0, 1, 36, 0, -1, '0', 0, 1),
(39, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/view.php', 0, NULL, 0, 1, 3, 7, 2, 0, -1, '0', 0, 1),
(40, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/stacks/view.php', 0, NULL, 0, 1, 1, 0, 39, 0, -1, '0', 0, 1),
(41, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/permissions.php', 0, NULL, 0, 1, 0, 1, 39, 0, -1, '0', 0, 1),
(42, 0, 1, 0, NULL, NULL, NULL, 1, 42, 'OVERRIDE', '/dashboard/blocks/stacks/list/view.php', 0, NULL, 0, 1, 0, 0, 40, 0, -1, '0', 0, 1),
(43, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/types/view.php', 0, NULL, 0, 1, 0, 2, 39, 0, -1, '0', 0, 1),
(44, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/view.php', 0, NULL, 0, 1, 5, 8, 2, 0, -1, '0', 0, 1),
(45, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/news.php', 0, NULL, 0, 1, 0, 9, 2, 0, -1, '0', 0, 1),
(46, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/install.php', 0, NULL, 0, 1, 0, 0, 44, 0, -1, '0', 0, 1),
(47, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/update.php', 0, NULL, 0, 1, 0, 1, 44, 0, -1, '0', 0, 1),
(48, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/connect.php', 0, NULL, 0, 1, 0, 2, 44, 0, -1, '0', 0, 1),
(49, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/themes.php', 0, NULL, 0, 1, 0, 3, 44, 0, -1, '0', 0, 1),
(50, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/add-ons.php', 0, NULL, 0, 1, 0, 4, 44, 0, -1, '0', 0, 1),
(51, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/view.php', 0, NULL, 0, 1, 9, 10, 2, 0, -1, '0', 0, 1),
(52, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/view.php', 0, NULL, 0, 1, 6, 0, 51, 0, -1, '0', 0, 1),
(53, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/site_name.php', 0, NULL, 0, 1, 0, 0, 52, 0, -1, '0', 0, 1),
(54, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/icons.php', 0, NULL, 0, 1, 0, 1, 52, 0, -1, '0', 0, 1),
(55, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/editor.php', 0, NULL, 0, 1, 0, 2, 52, 0, -1, '0', 0, 1),
(56, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/multilingual/view.php', 0, NULL, 0, 1, 0, 3, 52, 0, -1, '0', 0, 1),
(57, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/timezone.php', 0, NULL, 0, 1, 0, 4, 52, 0, -1, '0', 0, 1),
(58, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/interface.php', 0, NULL, 0, 1, 0, 5, 52, 0, -1, '0', 0, 1),
(59, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/view.php', 0, NULL, 0, 1, 6, 1, 51, 0, -1, '0', 0, 1),
(60, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/urls.php', 0, NULL, 0, 1, 0, 0, 59, 0, -1, '0', 0, 1),
(61, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/bulk_seo_tool.php', 0, NULL, 0, 1, 0, 1, 59, 0, -1, '0', 0, 1),
(62, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/tracking_codes.php', 0, NULL, 0, 1, 0, 2, 59, 0, -1, '0', 0, 1),
(63, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/statistics.php', 0, NULL, 0, 1, 0, 3, 59, 0, -1, '0', 0, 1),
(64, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/search_index.php', 0, NULL, 0, 1, 0, 4, 59, 0, -1, '0', 0, 1),
(65, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/view.php', 0, NULL, 0, 1, 3, 2, 51, 0, -1, '0', 0, 1),
(66, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/cache.php', 0, NULL, 0, 1, 0, 0, 65, 0, -1, '0', 0, 1),
(67, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/clear_cache.php', 0, NULL, 0, 1, 0, 1, 65, 0, -1, '0', 0, 1),
(68, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/jobs.php', 0, NULL, 0, 1, 0, 2, 65, 0, -1, '0', 0, 1),
(69, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/view.php', 0, NULL, 0, 1, 10, 3, 51, 0, -1, '0', 0, 1),
(70, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/site.php', 0, NULL, 0, 1, 0, 0, 69, 0, -1, '0', 0, 1),
(71, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/files.php', 0, NULL, 0, 1, 0, 1, 69, 0, -1, '0', 0, 1),
(72, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/file_types.php', 0, NULL, 0, 1, 0, 2, 69, 0, -1, '0', 0, 1),
(73, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/tasks.php', 0, NULL, 0, 1, 0, 3, 69, 0, -1, '0', 0, 1),
(74, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/users.php', 0, NULL, 0, 1, 0, 4, 69, 0, -1, '0', 0, 1),
(75, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/advanced.php', 0, NULL, 0, 1, 0, 5, 69, 0, -1, '0', 0, 1),
(76, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/ip_blacklist.php', 0, NULL, 0, 1, 0, 6, 69, 0, -1, '0', 0, 1),
(77, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/captcha.php', 0, NULL, 0, 1, 0, 7, 69, 0, -1, '0', 0, 1),
(78, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/antispam.php', 0, NULL, 0, 1, 0, 8, 69, 0, -1, '0', 0, 1),
(79, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/maintenance_mode.php', 0, NULL, 0, 1, 0, 9, 69, 0, -1, '0', 0, 1),
(80, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/view.php', 0, NULL, 0, 1, 3, 4, 51, 0, -1, '0', 0, 1),
(81, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/postlogin.php', 0, NULL, 0, 1, 0, 0, 80, 0, -1, '0', 0, 1),
(82, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/profiles.php', 0, NULL, 0, 1, 0, 1, 80, 0, -1, '0', 0, 1),
(83, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/public_registration.php', 0, NULL, 0, 1, 0, 2, 80, 0, -1, '0', 0, 1),
(84, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/view.php', 0, NULL, 0, 1, 2, 5, 51, 0, -1, '0', 0, 1),
(85, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/method.php', 0, NULL, 0, 1, 0, 0, 84, 0, -1, '0', 0, 1),
(86, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/importers.php', 0, NULL, 0, 1, 0, 1, 84, 0, -1, '0', 0, 1),
(87, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/view.php', 0, NULL, 0, 1, 2, 6, 51, 0, -1, '0', 0, 1),
(88, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/sets.php', 0, NULL, 0, 1, 0, 0, 87, 0, -1, '0', 0, 1),
(89, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/types.php', 0, NULL, 0, 1, 0, 1, 87, 0, -1, '0', 0, 1),
(90, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/view.php', 0, NULL, 0, 1, 5, 7, 51, 0, -1, '0', 0, 1),
(91, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/info.php', 0, NULL, 0, 1, 0, 0, 90, 0, -1, '0', 0, 1),
(92, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/debug.php', 0, NULL, 0, 1, 0, 1, 90, 0, -1, '0', 0, 1),
(93, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/logging.php', 0, NULL, 0, 1, 0, 2, 90, 0, -1, '0', 0, 1),
(94, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/file_storage_locations.php', 0, NULL, 0, 1, 0, 3, 90, 0, -1, '0', 0, 1),
(95, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/proxy.php', 0, NULL, 0, 1, 0, 4, 90, 0, -1, '0', 0, 1),
(96, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup_restore/view.php', 0, NULL, 0, 1, 3, 8, 51, 0, -1, '0', 0, 1),
(97, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup_restore/backup.php', 0, NULL, 0, 1, 0, 0, 96, 0, -1, '0', 0, 1),
(98, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup_restore/update.php', 0, NULL, 0, 1, 0, 1, 96, 0, -1, '0', 0, 1),
(99, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup_restore/database.php', 0, NULL, 0, 1, 0, 2, 96, 0, -1, '0', 0, 1),
(100, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/composer.php', 0, NULL, 0, 1, 0, 1, 32, 0, -1, '0', 0, 1),
(101, 1, NULL, 0, NULL, NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 0),
(102, 1, NULL, 0, NULL, NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 0),
(103, 1, NULL, 0, NULL, NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 0),
(104, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', NULL, 0, NULL, 0, 1, 0, 11, 2, 0, -1, '0', 0, 1),
(105, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', NULL, 0, NULL, 0, 1, 0, 12, 2, 0, -1, '0', 0, 1),
(106, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!drafts/view.php', 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 1),
(107, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!trash/view.php', 0, NULL, 0, 1, 6, 0, 0, 0, -1, '0', 0, 1),
(108, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!stacks/view.php', 0, NULL, 0, 1, 4, 0, 0, 0, -1, '0', 0, 1),
(109, 0, 1, 0, NULL, NULL, NULL, 1, 109, 'OVERRIDE', '/login.php', 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 1),
(110, 0, 1, 0, NULL, NULL, NULL, 1, 110, 'OVERRIDE', '/register.php', 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 1),
(111, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/profile/view.php', 0, NULL, 0, 1, 4, 0, 1, 0, -1, '0', 0, 1),
(112, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/profile/edit.php', 0, NULL, 0, 1, 0, 0, 111, 0, -1, '0', 0, 1),
(113, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/profile/avatar.php', 0, NULL, 0, 1, 0, 1, 111, 0, -1, '0', 0, 1),
(114, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/profile/messages.php', 0, NULL, 0, 1, 0, 2, 111, 0, -1, '0', 0, 1),
(115, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/profile/friends.php', 0, NULL, 0, 1, 0, 3, 111, 0, -1, '0', 0, 1),
(116, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/page_not_found.php', 0, NULL, 0, 1, 0, 1, 0, 0, -1, '0', 0, 1),
(117, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/page_forbidden.php', 0, NULL, 0, 1, 0, 1, 0, 0, -1, '0', 0, 1),
(118, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/download_file.php', 0, NULL, 0, 1, 0, 1, 1, 0, -1, '0', 0, 1),
(119, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/members.php', 0, NULL, 0, 1, 0, 2, 1, 0, -1, '0', 0, 1),
(120, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 108, 0, -1, '0', 0, 1),
(121, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 108, 0, -1, '0', 0, 1),
(122, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 108, 0, -1, '0', 0, 1),
(123, 1, NULL, 0, NULL, NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 0),
(124, 1, NULL, 0, NULL, NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 0),
(125, 1, NULL, 0, NULL, NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 0),
(126, 1, NULL, 0, NULL, NULL, NULL, 1, 0, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, -1, '0', 0, 0),
(127, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 2, 0, 107, 0, -1, '0', 0, 1),
(128, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 2, 1, 107, 0, -1, '0', 0, 1),
(129, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 2, 107, 0, -1, '0', 0, 1),
(130, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 127, 0, -1, '0', 0, 1),
(131, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 127, 0, -1, '0', 0, 1),
(132, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 128, 0, -1, '0', 0, 1),
(133, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 128, 0, -1, '0', 0, 1),
(136, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/excluded.php', 0, NULL, 0, 1, 0, 5, 59, 0, -1, '0', 0, 1),
(134, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 5, 107, 0, -1, '0', 0, 1),
(137, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 4, 108, 0, -1, '0', 0, 1),
(138, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 4, 107, 0, -1, '0', 0, 1),
(139, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 3, 107, 0, -1, '0', 0, 1),
(140, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 3, 1, 0, -1, '0', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `PageSearchIndex`
--

CREATE TABLE IF NOT EXISTS `PageSearchIndex` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `cName` varchar(255) DEFAULT NULL,
  `cDescription` text,
  `cPath` text,
  `cDatePublic` datetime DEFAULT NULL,
  `cDateLastIndexed` datetime DEFAULT NULL,
  `cDateLastSitemapped` datetime DEFAULT NULL,
  `cRequiresReindex` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `cDateLastIndexed` (`cDateLastIndexed`),
  KEY `cDateLastSitemapped` (`cDateLastSitemapped`),
  KEY `cRequiresReindex` (`cRequiresReindex`),
  FULLTEXT KEY `cName` (`cName`),
  FULLTEXT KEY `cDescription` (`cDescription`),
  FULLTEXT KEY `content` (`content`),
  FULLTEXT KEY `content2` (`cName`,`cDescription`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `PageSearchIndex`
--

INSERT INTO `PageSearchIndex` (`cID`, `content`, `cName`, `cDescription`, `cPath`, `cDatePublic`, `cDateLastIndexed`, `cDateLastSitemapped`, `cRequiresReindex`) VALUES
(3, '', 'Composer', 'Write for your site.', '/dashboard/composer', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(4, '', 'Write', '', '/dashboard/composer/write', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(5, '', 'Drafts', '', '/dashboard/composer/drafts', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(6, '', 'Sitemap', 'Whole world at a glance.', '/dashboard/sitemap', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(7, '', 'Full Sitemap', '', '/dashboard/sitemap/full', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(8, '', 'Flat View', '', '/dashboard/sitemap/explore', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(9, '', 'Page Search', '', '/dashboard/sitemap/search', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(11, '', 'File Manager', '', '/dashboard/files/search', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(12, '', 'Attributes', '', '/dashboard/files/attributes', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(13, '', 'File Sets', '', '/dashboard/files/sets', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(14, '', 'Add File Set', '', '/dashboard/files/add_set', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(15, '', 'Members', 'Add and manage the user accounts and groups on your website.', '/dashboard/users', '2012-11-22 16:12:16', '2012-11-22 16:12:21', NULL, 0),
(16, '', 'Search Users', '', '/dashboard/users/search', '2012-11-22 16:12:17', '2012-11-22 16:12:21', NULL, 0),
(17, '', 'User Groups', '', '/dashboard/users/groups', '2012-11-22 16:12:17', '2012-11-22 16:12:21', NULL, 0),
(18, '', 'Attributes', '', '/dashboard/users/attributes', '2012-11-22 16:12:17', '2012-11-22 16:12:21', NULL, 0),
(19, '', 'Add User', '', '/dashboard/users/add', '2012-11-22 16:12:17', '2012-11-22 16:12:21', NULL, 0),
(20, '', 'Add Group', '', '/dashboard/users/add_group', '2012-11-22 16:12:17', '2012-11-22 16:12:21', NULL, 0),
(21, '', 'Group Sets', '', '/dashboard/users/group_sets', '2012-11-22 16:12:17', '2012-11-22 16:12:21', NULL, 0),
(22, '', 'Reports', 'Get data from forms and logs.', '/dashboard/reports', '2012-11-22 16:12:17', '2012-11-22 16:12:21', NULL, 0),
(23, '', 'Statistics', 'View your site activity.', '/dashboard/reports/statistics', '2012-11-22 16:12:17', '2012-11-22 16:12:21', NULL, 0),
(24, '', 'Form Results', 'Get submission data.', '/dashboard/reports/forms', '2012-11-22 16:12:17', '2012-11-22 16:12:21', NULL, 0),
(25, '', 'Surveys', '', '/dashboard/reports/surveys', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(26, '', 'Logs', '', '/dashboard/reports/logs', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(28, '', 'Themes', 'Reskin your site.', '/dashboard/pages/themes', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(29, '', 'Add', '', '/dashboard/pages/themes/add', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(30, '', 'Inspect', '', '/dashboard/pages/themes/inspect', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(31, '', 'Customize', '', '/dashboard/pages/themes/customize', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(32, '', 'Page Types', 'What goes in your site.', '/dashboard/pages/types', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(34, '', 'Attributes', '', '/dashboard/pages/attributes', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(35, '', 'Single Pages', '', '/dashboard/pages/single', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(36, '', 'Workflow', '', '/dashboard/workflow', '2012-11-22 16:12:17', '2012-11-22 16:12:22', NULL, 0),
(37, '', 'Workflow List', '', '/dashboard/workflow/list', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(38, '', 'Waiting for Me', '', '/dashboard/workflow/me', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(40, '', 'Stacks', 'Share content across your site.', '/dashboard/blocks/stacks', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(41, '', 'Block & Stack Permissions', 'Control who can add blocks and stacks on your site.', '/dashboard/blocks/permissions', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(42, '', 'Stack List', '', '/dashboard/blocks/stacks/list', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(43, '', 'Block Types', 'Manage the installed block types in your site.', '/dashboard/blocks/types', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(44, '', 'Extend concrete5', 'Connect to the concrete5 marketplace, install custom add-ons, and download updates for marketplace add-ons and themes.', '/dashboard/extend', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(45, '', 'Dashboard', '', '/dashboard/news', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(46, '', 'Add Functionality', 'Install add-ons & themes.', '/dashboard/extend/install', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(47, '', 'Update Add-Ons', 'Update your installed packages.', '/dashboard/extend/update', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(48, '', 'Connect to the Community', 'Connect to the concrete5 community.', '/dashboard/extend/connect', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(49, '', 'Get More Themes', 'Download themes from concrete5.org.', '/dashboard/extend/themes', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(50, '', 'Get More Add-Ons', 'Download add-ons from concrete5.org.', '/dashboard/extend/add-ons', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(51, '', 'System & Settings', 'Secure and setup your site.', '/dashboard/system', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(53, '', 'Site Name', '', '/dashboard/system/basics/site_name', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(54, '', 'Bookmark Icons', 'Bookmark icon and mobile home screen icon setup.', '/dashboard/system/basics/icons', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(55, '', 'Rich Text Editor', '', '/dashboard/system/basics/editor', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(56, '', 'Languages', '', '/dashboard/system/basics/multilingual', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(57, '', 'Time Zone', '', '/dashboard/system/basics/timezone', '2012-11-22 16:12:18', '2012-11-22 16:12:22', NULL, 0),
(58, '', 'Interface Preferences', '', '/dashboard/system/basics/interface', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(60, '', 'Pretty URLs', '', '/dashboard/system/seo/urls', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(61, '', 'Bulk SEO Updater', '', '/dashboard/system/seo/bulk_seo_tool', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(62, '', 'Tracking Codes', '', '/dashboard/system/seo/tracking_codes', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(63, '', 'Statistics', '', '/dashboard/system/seo/statistics', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(64, '', 'Search Index', '', '/dashboard/system/seo/search_index', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(66, '', 'Cache & Speed Settings', '', '/dashboard/system/optimization/cache', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(67, '', 'Clear Cache', '', '/dashboard/system/optimization/clear_cache', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(68, '', 'Automated Jobs', '', '/dashboard/system/optimization/jobs', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(70, '', 'Site Access', '', '/dashboard/system/permissions/site', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(71, '', 'File Manager Permissions', '', '/dashboard/system/permissions/files', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(72, '', 'Allowed File Types', '', '/dashboard/system/permissions/file_types', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(73, '', 'Task Permissions', '', '/dashboard/system/permissions/tasks', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(76, '', 'IP Blacklist', '', '/dashboard/system/permissions/ip_blacklist', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(77, '', 'Captcha Setup', '', '/dashboard/system/permissions/captcha', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(78, '', 'Spam Control', '', '/dashboard/system/permissions/antispam', '2012-11-22 16:12:19', '2012-11-22 16:12:22', NULL, 0),
(79, '', 'Maintenance Mode', '', '/dashboard/system/permissions/maintenance_mode', '2012-11-22 16:12:20', '2012-11-22 16:12:22', NULL, 0),
(81, '', 'Login Destination', '', '/dashboard/system/registration/postlogin', '2012-11-22 16:12:20', '2012-11-22 16:12:22', NULL, 0),
(82, '', 'Public Profiles', '', '/dashboard/system/registration/profiles', '2012-11-22 16:12:20', '2012-11-22 16:12:22', NULL, 0),
(83, '', 'Public Registration', '', '/dashboard/system/registration/public_registration', '2012-11-22 16:12:20', '2012-11-22 16:12:22', NULL, 0),
(84, '', 'Email', 'Control how your site send and processes mail.', '/dashboard/system/mail', '2012-11-22 16:12:20', '2012-11-22 16:12:22', NULL, 0),
(85, '', 'SMTP Method', '', '/dashboard/system/mail/method', '2012-11-22 16:12:20', '2012-11-22 16:12:22', NULL, 0),
(86, '', 'Email Importers', '', '/dashboard/system/mail/importers', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(87, '', 'Attributes', 'Setup attributes for pages, users, files and more.', '/dashboard/system/attributes', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(88, '', 'Sets', 'Group attributes into sets for easier organization', '/dashboard/system/attributes/sets', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(89, '', 'Types', 'Choose which attribute types are available for different items.', '/dashboard/system/attributes/types', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(90, '', 'Environment', 'Advanced settings for web developers.', '/dashboard/system/environment', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(91, '', 'Environment Information', '', '/dashboard/system/environment/info', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(92, '', 'Debug Settings', '', '/dashboard/system/environment/debug', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(93, '', 'Logging Settings', '', '/dashboard/system/environment/logging', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(94, '', 'File Storage Locations', '', '/dashboard/system/environment/file_storage_locations', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(95, '', 'Proxy Server', '', '/dashboard/system/environment/proxy', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(96, '', 'Backup & Restore', 'Backup or restore your website.', '/dashboard/system/backup_restore', '2012-11-22 16:12:20', '2012-11-22 16:12:23', NULL, 0),
(98, '', 'Update concrete5', '', '/dashboard/system/backup_restore/update', '2012-11-22 16:12:21', '2012-11-22 16:12:23', NULL, 0),
(99, '', 'Database XML', '', '/dashboard/system/backup_restore/database', '2012-11-22 16:12:21', '2012-11-22 16:12:23', NULL, 0),
(105, '	Welcome to concrete5.\n						It''s easy to edit content and add pages using in-context editing. \n						 \n							Building Your Own Site\n							 Editing with concrete5 is a breeze. Just point and click to make changes. \n							 \n							 Editor''s Guide \n							  \n							Developing Applications\n							 If you’re comfortable in PHP concrete5 should be a breeze to learn. Take a few moments to understand the architecture. \n							 Developer''s Guide \n							  \n							Designing Websites\n							 Good with CSS and HTML? You can easily theme anything with concrete5. \n							 \n							 Designer''s Guide \n							  \n						\n						Business Background\n						 Worried about license structures, white-labeling or why concrete5 is a good choice for your agency? \n						 Executive''s Guide \n						  ', 'Welcome to concrete5', 'Learn about how to use concrete5, how to develop for concrete5, and get general help.', '/dashboard/welcome', '2012-11-22 16:12:21', '2012-11-22 16:12:23', NULL, 0),
(104, '', 'Customize Dashboard Home', '', '/dashboard/home', '2012-11-22 16:12:21', '2012-11-22 16:12:23', NULL, 0),
(1, 'Sidebar  Rete d''impresa  2014OPEN REVOLUTION  ', 'Home', '', NULL, '2012-11-22 16:12:13', '2014-01-02 18:06:02', NULL, 0),
(137, '        ', 'LinkSocial', NULL, '/!stacks/linksocial', '2013-05-21 20:42:56', '2013-05-25 11:05:11', NULL, 0),
(138, '', 'test', '', '/test1', '2013-11-12 10:36:00', '2013-11-12 10:36:24', NULL, 0),
(139, '', 'aaa', '', '/aaa', '2013-11-25 21:56:00', '2013-11-25 22:03:06', NULL, 0),
(140, '', 'Custom Template', '', '/custom-template', '2013-12-31 21:46:00', '2013-12-31 21:46:45', NULL, 0),
(127, 'About Us Learn More\n																 Visit&nbsp;concrete5.org&nbsp;to learn more from the&nbsp;community&nbsp;and the&nbsp;documentation. You can also browse our&nbsp;marketplace&nbsp;for more&nbsp;add-ons&nbsp;and&nbsp;themes&nbsp;to quickly build the site you really need.&nbsp; \n																&nbsp;\n																Getting Help\n																 You can get free help in the forums and post for free to the&nbsp;jobs board.&nbsp; \n																 You can also pay the concrete5 team of developers to help with&nbsp;any problem&nbsp;you run into. We offer training courses&nbsp;and&nbsp;hosting packages, just let us know how we can help.  ', 'About', '', '/about', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, 0),
(131, 'Guestbook ', 'Guestbook', '', '/about/guestbook', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, 0),
(130, 'Contact Us Contact Us\n									 Building a form is easy to do. Learn how to add a form block.  ', 'Contact Us', '', '/about/contact-us', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, 0),
(129, 'Sitemap Site Map ', 'Search', '', '/search', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, 0),
(128, 'Tags ', 'Blog', '', '/blog', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, 0),
(133, ' Here is some sample content! I''m writing it using composer!  ', 'Hello World', 'This is my first blog post!', '/blog/hello-world', '2012-11-22 16:12:27', '2012-11-22 16:12:27', NULL, 0),
(132, '', 'Blog Archives', '', '/blog/blog-archives', '2012-11-22 16:12:27', '2012-11-22 16:12:28', NULL, 0),
(134, ' This is my first blog post.  ', 'test', '', '/test', '2012-11-22 16:59:00', '2012-11-22 16:59:20', NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `PageStatistics`
--

CREATE TABLE IF NOT EXISTS `PageStatistics` (
  `pstID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pstID`),
  KEY `cID` (`cID`),
  KEY `date` (`date`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1669 ;

--
-- Dump dei dati per la tabella `PageStatistics`
--

INSERT INTO `PageStatistics` (`pstID`, `cID`, `date`, `timestamp`, `uID`) VALUES
(1, 1, '2012-11-22', '2012-11-22 15:12:35', 1),
(2, 105, '2012-11-22', '2012-11-22 15:12:51', 1),
(3, 109, '2012-11-22', '2012-11-22 15:13:20', 1),
(4, 1, '2012-11-22', '2012-11-22 15:13:21', 0),
(5, 1, '2012-11-22', '2012-11-22 15:13:30', 0),
(6, 109, '2012-11-22', '2012-11-22 15:17:31', 0),
(7, 109, '2012-11-22', '2012-11-22 15:17:35', 0),
(8, 1, '2012-11-22', '2012-11-22 15:17:37', 1),
(9, 2, '2012-11-22', '2012-11-22 15:17:46', 1),
(10, 46, '2012-11-22', '2012-11-22 15:17:49', 1),
(11, 48, '2012-11-22', '2012-11-22 15:17:53', 1),
(12, 48, '2012-11-22', '2012-11-22 15:18:35', 1),
(13, 48, '2012-11-22', '2012-11-22 15:18:35', 1),
(14, 47, '2012-11-22', '2012-11-22 15:18:43', 1),
(15, 2, '2012-11-22', '2012-11-22 15:18:56', 1),
(16, 50, '2012-11-22', '2012-11-22 15:19:04', 1),
(17, 49, '2012-11-22', '2012-11-22 15:19:11', 1),
(18, 49, '2012-11-22', '2012-11-22 15:52:32', 1),
(19, 49, '2012-11-22', '2012-11-22 15:52:50', 1),
(20, 49, '2012-11-22', '2012-11-22 15:53:01', 1),
(21, 49, '2012-11-22', '2012-11-22 15:53:27', 1),
(22, 49, '2012-11-22', '2012-11-22 15:55:43', 1),
(23, 49, '2012-11-22', '2012-11-22 15:55:46', 1),
(24, 46, '2012-11-22', '2012-11-22 15:55:52', 1),
(25, 46, '2012-11-22', '2012-11-22 15:55:55', 1),
(26, 46, '2012-11-22', '2012-11-22 15:55:55', 1),
(27, 46, '2012-11-22', '2012-11-22 15:56:06', 1),
(28, 46, '2012-11-22', '2012-11-22 15:56:12', 1),
(29, 2, '2012-11-22', '2012-11-22 15:56:27', 1),
(30, 28, '2012-11-22', '2012-11-22 15:56:30', 1),
(31, 28, '2012-11-22', '2012-11-22 15:56:37', 1),
(32, 28, '2012-11-22', '2012-11-22 15:56:41', 1),
(33, 109, '2012-11-22', '2012-11-22 15:56:44', 1),
(34, 1, '2012-11-22', '2012-11-22 15:56:45', 0),
(35, 109, '2012-11-22', '2012-11-22 15:57:04', 0),
(36, 109, '2012-11-22', '2012-11-22 15:57:08', 0),
(37, 1, '2012-11-22', '2012-11-22 15:57:10', 1),
(38, 1, '2012-11-22', '2012-11-22 15:57:22', 1),
(39, 1, '2012-11-22', '2012-11-22 15:58:14', 1),
(40, 1, '2012-11-22', '2012-11-22 15:58:44', 1),
(41, 1, '2012-11-22', '2012-11-22 15:58:49', 1),
(42, 2, '2012-11-22', '2012-11-22 15:58:52', 1),
(43, 7, '2012-11-22', '2012-11-22 15:58:55', 1),
(44, 6, '2012-11-22', '2012-11-22 15:59:14', 1),
(45, 7, '2012-11-22', '2012-11-22 15:59:15', 1),
(46, 1, '2012-11-22', '2012-11-22 15:59:18', 1),
(47, 109, '2012-11-22', '2012-11-22 15:59:39', 1),
(48, 1, '2012-11-22', '2012-11-22 15:59:39', 0),
(49, 1, '2012-11-24', '2012-11-24 05:42:20', 0),
(50, 1, '2012-11-24', '2012-11-24 05:48:08', 0),
(51, 109, '2012-11-24', '2012-11-24 06:49:21', 0),
(52, 1, '2012-11-27', '2012-11-27 12:35:08', 0),
(53, 1, '2012-11-28', '2012-11-28 15:16:57', 0),
(54, 1, '2012-11-29', '2012-11-29 11:38:43', 0),
(55, 1, '2012-11-29', '2012-11-29 20:14:58', 0),
(56, 1, '2012-11-30', '2012-11-30 14:19:22', 0),
(57, 1, '2012-12-03', '2012-12-03 14:01:19', 0),
(58, 1, '2012-12-07', '2012-12-06 23:41:47', 0),
(59, 1, '2012-12-10', '2012-12-10 14:28:48', 0),
(60, 1, '2012-12-16', '2012-12-16 14:46:52', 0),
(61, 109, '2012-12-23', '2012-12-23 10:29:45', 0),
(62, 1, '2012-12-26', '2012-12-26 05:01:28', 0),
(63, 1, '2012-12-27', '2012-12-27 15:27:00', 0),
(64, 1, '2012-12-27', '2012-12-27 18:53:50', 0),
(65, 1, '2012-12-29', '2012-12-29 07:37:32', 0),
(66, 1, '2013-01-08', '2013-01-08 07:59:23', 0),
(67, 1, '2013-01-08', '2013-01-08 16:20:55', 0),
(68, 1, '2013-01-09', '2013-01-09 16:25:53', 0),
(69, 109, '2013-01-11', '2013-01-11 12:38:15', 0),
(70, 1, '2013-01-11', '2013-01-11 15:09:03', 0),
(71, 1, '2013-01-21', '2013-01-21 02:05:45', 0),
(72, 1, '2013-01-21', '2013-01-21 17:48:13', 0),
(73, 109, '2013-01-30', '2013-01-30 00:57:19', 0),
(74, 1, '2013-01-30', '2013-01-30 04:24:00', 0),
(75, 1, '2013-02-01', '2013-02-01 02:57:18', 0),
(76, 1, '2013-02-05', '2013-02-05 22:00:04', 0),
(77, 1, '2013-02-06', '2013-02-06 10:13:53', 0),
(78, 109, '2013-02-06', '2013-02-06 10:14:07', 0),
(79, 109, '2013-02-06', '2013-02-06 10:14:17', 0),
(80, 1, '2013-02-07', '2013-02-07 16:02:56', 0),
(81, 109, '2013-02-07', '2013-02-07 16:03:06', 0),
(82, 1, '2013-02-07', '2013-02-07 16:03:12', 0),
(83, 1, '2013-02-07', '2013-02-07 21:49:46', 0),
(84, 1, '2013-02-09', '2013-02-09 08:00:31', 0),
(85, 109, '2013-02-09', '2013-02-09 08:00:43', 0),
(86, 109, '2013-02-09', '2013-02-09 08:00:57', 0),
(87, 109, '2013-02-09', '2013-02-09 08:01:10', 0),
(88, 109, '2013-02-09', '2013-02-09 08:01:16', 0),
(89, 109, '2013-02-09', '2013-02-09 08:01:17', 0),
(90, 109, '2013-02-09', '2013-02-09 08:03:24', 0),
(91, 109, '2013-02-09', '2013-02-09 08:03:36', 0),
(92, 1, '2013-02-09', '2013-02-09 08:03:38', 1),
(93, 104, '2013-02-09', '2013-02-09 08:03:44', 1),
(94, 104, '2013-02-09', '2013-02-09 08:04:06', 1),
(95, 109, '2013-02-09', '2013-02-09 08:08:16', 1),
(96, 1, '2013-02-09', '2013-02-09 08:08:17', 0),
(97, 109, '2013-02-09', '2013-02-09 08:08:19', 0),
(98, 109, '2013-02-09', '2013-02-09 08:08:23', 0),
(99, 1, '2013-02-09', '2013-02-09 08:08:23', 1),
(100, 1, '2013-02-09', '2013-02-09 08:08:27', 1),
(101, 1, '2013-02-09', '2013-02-09 08:08:34', 1),
(102, 2, '2013-02-09', '2013-02-09 08:08:40', 1),
(103, 2, '2013-02-09', '2013-02-09 08:08:41', 1),
(104, 28, '2013-02-09', '2013-02-09 08:08:48', 1),
(105, 31, '2013-02-09', '2013-02-09 08:08:57', 1),
(106, 31, '2013-02-09', '2013-02-09 08:09:13', 1),
(107, 31, '2013-02-09', '2013-02-09 08:09:13', 1),
(108, 27, '2013-02-09', '2013-02-09 08:09:21', 1),
(109, 28, '2013-02-09', '2013-02-09 08:09:21', 1),
(110, 28, '2013-02-09', '2013-02-09 08:09:33', 1),
(111, 28, '2013-02-09', '2013-02-09 08:09:36', 1),
(112, 109, '2013-02-09', '2013-02-09 08:09:42', 1),
(113, 1, '2013-02-09', '2013-02-09 08:09:42', 0),
(114, 109, '2013-02-09', '2013-02-09 08:09:59', 0),
(115, 109, '2013-02-09', '2013-02-09 08:10:01', 0),
(116, 1, '2013-02-09', '2013-02-09 08:10:03', 1),
(117, 1, '2013-02-09', '2013-02-09 08:10:07', 1),
(118, 109, '2013-02-10', '2013-02-10 09:29:37', 1),
(119, 1, '2013-02-10', '2013-02-10 09:29:39', 0),
(120, 1, '2013-02-11', '2013-02-11 19:06:40', 0),
(121, 1, '2013-02-14', '2013-02-14 04:31:07', 0),
(122, 1, '2013-02-14', '2013-02-14 04:45:07', 0),
(123, 109, '2013-02-16', '2013-02-16 14:38:05', 0),
(124, 1, '2013-02-16', '2013-02-16 17:31:16', 0),
(125, 1, '2013-02-18', '2013-02-18 13:51:19', 0),
(126, 109, '2013-02-18', '2013-02-18 14:40:19', 0),
(127, 1, '2013-02-18', '2013-02-18 14:40:27', 0),
(128, 1, '2013-02-18', '2013-02-18 21:05:37', 0),
(129, 109, '2013-02-18', '2013-02-18 21:06:02', 0),
(130, 109, '2013-02-18', '2013-02-18 21:06:12', 0),
(131, 109, '2013-02-18', '2013-02-18 21:06:18', 0),
(132, 109, '2013-02-18', '2013-02-18 21:06:24', 0),
(133, 109, '2013-02-18', '2013-02-18 21:06:37', 0),
(134, 109, '2013-02-18', '2013-02-18 21:06:52', 0),
(135, 109, '2013-02-18', '2013-02-18 21:06:53', 0),
(136, 109, '2013-02-18', '2013-02-18 21:15:30', 0),
(137, 109, '2013-02-18', '2013-02-18 21:15:40', 0),
(138, 1, '2013-02-18', '2013-02-18 21:15:42', 1),
(139, 104, '2013-02-18', '2013-02-18 21:15:46', 1),
(140, 109, '2013-02-18', '2013-02-18 21:16:06', 1),
(141, 1, '2013-02-18', '2013-02-18 21:16:08', 0),
(142, 109, '2013-02-18', '2013-02-18 21:16:19', 0),
(143, 2, '2013-02-18', '2013-02-18 21:16:19', 1),
(144, 28, '2013-02-18', '2013-02-18 21:16:31', 1),
(145, 31, '2013-02-18', '2013-02-18 21:17:08', 1),
(146, 2, '2013-02-18', '2013-02-18 21:17:21', 1),
(147, 2, '2013-02-18', '2013-02-18 21:17:22', 1),
(148, 28, '2013-02-18', '2013-02-18 21:17:24', 1),
(149, 49, '2013-02-18', '2013-02-18 21:21:03', 1),
(150, 49, '2013-02-18', '2013-02-18 21:21:11', 1),
(151, 28, '2013-02-18', '2013-02-18 21:21:59', 1),
(152, 28, '2013-02-18', '2013-02-18 21:22:15', 1),
(153, 28, '2013-02-18', '2013-02-18 21:22:19', 1),
(154, 109, '2013-02-18', '2013-02-18 21:22:23', 1),
(155, 1, '2013-02-18', '2013-02-18 21:22:24', 0),
(156, 109, '2013-02-18', '2013-02-18 21:22:33', 0),
(157, 109, '2013-02-18', '2013-02-18 21:22:38', 0),
(158, 1, '2013-02-18', '2013-02-18 21:22:41', 1),
(159, 1, '2013-02-18', '2013-02-18 21:22:57', 1),
(160, 1, '2013-02-18', '2013-02-18 21:23:56', 1),
(161, 1, '2013-02-18', '2013-02-18 21:23:57', 1),
(162, 1, '2013-02-18', '2013-02-18 21:24:38', 1),
(163, 1, '2013-02-18', '2013-02-18 21:24:38', 1),
(164, 1, '2013-02-18', '2013-02-18 21:24:58', 1),
(165, 1, '2013-02-18', '2013-02-18 21:24:59', 1),
(166, 1, '2013-02-18', '2013-02-18 21:25:11', 1),
(167, 1, '2013-02-18', '2013-02-18 21:25:12', 1),
(168, 1, '2013-02-18', '2013-02-18 21:25:23', 1),
(169, 1, '2013-02-18', '2013-02-18 21:25:24', 1),
(170, 1, '2013-02-18', '2013-02-18 21:25:32', 1),
(171, 1, '2013-02-18', '2013-02-18 21:25:53', 1),
(172, 1, '2013-02-18', '2013-02-18 21:25:53', 1),
(173, 1, '2013-02-18', '2013-02-18 21:26:15', 1),
(174, 1, '2013-02-18', '2013-02-18 21:26:15', 1),
(175, 1, '2013-02-18', '2013-02-18 21:26:26', 1),
(176, 1, '2013-02-18', '2013-02-18 21:26:27', 1),
(177, 109, '2013-02-18', '2013-02-18 21:26:31', 1),
(178, 1, '2013-02-18', '2013-02-18 21:26:31', 0),
(179, 109, '2013-02-18', '2013-02-18 21:26:31', 0),
(180, 1, '2013-02-18', '2013-02-18 21:26:32', 0),
(181, 109, '2013-02-18', '2013-02-18 21:26:42', 0),
(182, 109, '2013-02-18', '2013-02-18 21:26:47', 0),
(183, 1, '2013-02-18', '2013-02-18 21:26:47', 1),
(184, 1, '2013-02-18', '2013-02-18 21:26:54', 1),
(185, 1, '2013-02-18', '2013-02-18 21:26:59', 1),
(186, 109, '2013-02-18', '2013-02-18 21:27:02', 1),
(187, 1, '2013-02-18', '2013-02-18 21:27:03', 0),
(188, 1, '2013-02-18', '2013-02-18 21:31:33', 0),
(189, 128, '2013-02-18', '2013-02-18 21:31:36', 0),
(190, 132, '2013-02-18', '2013-02-18 21:31:42', 0),
(191, 1, '2013-02-18', '2013-02-18 21:31:45', 0),
(192, 134, '2013-02-18', '2013-02-18 21:31:47', 0),
(193, 1, '2013-02-18', '2013-02-18 21:31:51', 0),
(194, 1, '2013-02-18', '2013-02-18 21:31:53', 0),
(195, 127, '2013-02-18', '2013-02-18 21:31:56', 0),
(196, 1, '2013-02-18', '2013-02-18 21:32:00', 0),
(197, 128, '2013-02-18', '2013-02-18 21:32:04', 0),
(198, 133, '2013-02-18', '2013-02-18 21:32:07', 0),
(199, 132, '2013-02-18', '2013-02-18 21:32:10', 0),
(200, 1, '2013-02-18', '2013-02-18 21:32:15', 0),
(201, 1, '2013-02-18', '2013-02-18 21:32:18', 0),
(202, 1, '2013-02-18', '2013-02-18 21:33:09', 0),
(203, 1, '2013-02-18', '2013-02-18 21:33:14', 0),
(204, 109, '2013-02-18', '2013-02-18 21:34:25', 0),
(205, 109, '2013-02-18', '2013-02-18 21:34:31', 0),
(206, 1, '2013-02-18', '2013-02-18 21:34:31', 1),
(207, 50, '2013-02-18', '2013-02-18 21:34:35', 1),
(208, 50, '2013-02-18', '2013-02-18 21:34:54', 1),
(209, 50, '2013-02-18', '2013-02-18 21:35:22', 1),
(210, 50, '2013-02-18', '2013-02-18 21:36:05', 1),
(211, 50, '2013-02-18', '2013-02-18 21:36:16', 1),
(212, 1, '2013-02-18', '2013-02-18 22:08:10', 1),
(213, 1, '2013-02-19', '2013-02-19 07:36:45', 0),
(214, 127, '2013-02-19', '2013-02-19 07:37:12', 0),
(215, 1, '2013-02-19', '2013-02-19 07:37:40', 1),
(216, 109, '2013-02-19', '2013-02-19 07:37:44', 1),
(217, 1, '2013-02-19', '2013-02-19 07:37:44', 0),
(218, 127, '2013-02-19', '2013-02-19 07:37:47', 0),
(219, 1, '2013-02-19', '2013-02-19 07:37:50', 0),
(220, 128, '2013-02-19', '2013-02-19 07:37:52', 0),
(221, 1, '2013-02-19', '2013-02-19 07:37:55', 0),
(222, 1, '2013-02-22', '2013-02-22 14:03:50', 0),
(223, 1, '2013-02-23', '2013-02-23 20:04:52', 0),
(224, 1, '2013-02-23', '2013-02-23 20:10:53', 0),
(225, 1, '2013-02-23', '2013-02-23 20:44:25', 0),
(226, 1, '2013-02-24', '2013-02-24 13:42:27', 0),
(227, 128, '2013-02-24', '2013-02-24 14:46:51', 0),
(228, 134, '2013-02-24', '2013-02-24 15:06:31', 0),
(229, 127, '2013-02-24', '2013-02-24 15:23:25', 0),
(230, 129, '2013-02-24', '2013-02-24 15:49:12', 0),
(231, 133, '2013-02-24', '2013-02-24 15:56:58', 0),
(232, 131, '2013-02-24', '2013-02-24 16:04:04', 0),
(233, 130, '2013-02-24', '2013-02-24 16:22:10', 0),
(234, 132, '2013-02-24', '2013-02-24 16:34:32', 0),
(235, 132, '2013-02-24', '2013-02-24 16:53:39', 0),
(236, 132, '2013-02-24', '2013-02-24 17:08:56', 0),
(237, 132, '2013-02-24', '2013-02-24 17:17:23', 0),
(238, 132, '2013-02-24', '2013-02-24 17:28:01', 0),
(239, 132, '2013-02-24', '2013-02-24 17:43:31', 0),
(240, 132, '2013-02-24', '2013-02-24 18:36:08', 0),
(241, 132, '2013-02-24', '2013-02-24 19:01:20', 0),
(242, 109, '2013-02-24', '2013-02-24 19:44:27', 0),
(243, 109, '2013-02-24', '2013-02-24 19:45:55', 0),
(244, 109, '2013-02-24', '2013-02-24 19:46:02', 0),
(245, 109, '2013-02-24', '2013-02-24 19:46:14', 0),
(246, 109, '2013-02-24', '2013-02-24 19:46:49', 0),
(247, 109, '2013-02-24', '2013-02-24 19:47:00', 0),
(248, 109, '2013-02-24', '2013-02-24 19:47:03', 0),
(249, 109, '2013-02-24', '2013-02-24 19:47:18', 0),
(250, 109, '2013-02-24', '2013-02-24 19:47:26', 0),
(251, 1, '2013-03-05', '2013-03-05 14:03:34', 0),
(252, 1, '2013-03-06', '2013-03-06 04:02:46', 0),
(253, 109, '2013-03-06', '2013-03-06 12:33:09', 0),
(254, 128, '2013-03-06', '2013-03-06 17:44:25', 0),
(255, 132, '2013-03-06', '2013-03-06 17:50:16', 0),
(256, 132, '2013-03-09', '2013-03-08 23:20:09', 0),
(257, 134, '2013-03-09', '2013-03-09 10:03:44', 0),
(258, 127, '2013-03-09', '2013-03-09 10:34:40', 0),
(259, 129, '2013-03-12', '2013-03-12 14:54:57', 0),
(260, 1, '2013-03-12', '2013-03-12 20:52:35', 0),
(261, 1, '2013-03-16', '2013-03-16 09:39:21', 0),
(262, 1, '2013-03-16', '2013-03-16 16:01:42', 0),
(263, 109, '2013-03-16', '2013-03-16 16:02:42', 0),
(264, 109, '2013-03-16', '2013-03-16 16:02:45', 0),
(265, 109, '2013-03-16', '2013-03-16 16:02:55', 0),
(266, 1, '2013-03-16', '2013-03-16 16:02:57', 1),
(267, 104, '2013-03-16', '2013-03-16 16:03:00', 1),
(268, 1, '2013-03-16', '2013-03-16 16:27:33', 1),
(269, 133, '2013-03-20', '2013-03-20 18:30:14', 0),
(270, 109, '2013-03-20', '2013-03-20 18:30:18', 0),
(271, 131, '2013-03-22', '2013-03-22 14:22:48', 0),
(272, 109, '2013-03-22', '2013-03-22 14:23:03', 0),
(273, 131, '2013-03-22', '2013-03-22 14:23:15', 0),
(274, 109, '2013-03-22', '2013-03-22 14:23:17', 0),
(275, 131, '2013-03-22', '2013-03-22 14:23:24', 0),
(276, 109, '2013-03-22', '2013-03-22 14:23:25', 0),
(277, 131, '2013-03-22', '2013-03-22 14:23:26', 0),
(278, 109, '2013-03-22', '2013-03-22 14:23:27', 0),
(279, 131, '2013-03-22', '2013-03-22 14:23:48', 0),
(280, 109, '2013-03-22', '2013-03-22 14:23:49', 0),
(281, 131, '2013-03-22', '2013-03-22 14:24:29', 0),
(282, 109, '2013-03-22', '2013-03-22 14:24:30', 0),
(283, 131, '2013-03-22', '2013-03-22 14:25:32', 0),
(284, 109, '2013-03-22', '2013-03-22 14:25:33', 0),
(285, 128, '2013-03-23', '2013-03-23 00:41:41', 0),
(286, 1, '2013-03-23', '2013-03-23 12:38:56', 0),
(287, 133, '2013-03-23', '2013-03-23 15:15:35', 0),
(288, 131, '2013-03-23', '2013-03-23 15:17:16', 0),
(289, 130, '2013-03-23', '2013-03-23 15:42:19', 0),
(290, 134, '2013-03-26', '2013-03-26 01:09:55', 0),
(291, 127, '2013-03-26', '2013-03-26 01:22:52', 0),
(292, 109, '2013-03-26', '2013-03-26 11:46:36', 0),
(293, 129, '2013-03-26', '2013-03-26 16:04:33', 0),
(294, 1, '2013-03-26', '2013-03-26 16:05:33', 0),
(295, 128, '2013-03-26', '2013-03-26 16:33:45', 0),
(296, 1, '2013-03-27', '2013-03-27 12:20:00', 0),
(297, 1, '2013-03-29', '2013-03-29 19:58:25', 0),
(298, 1, '2013-04-02', '2013-04-02 14:36:22', 0),
(299, 134, '2013-04-02', '2013-04-02 14:36:54', 0),
(300, 1, '2013-04-02', '2013-04-02 14:36:58', 0),
(301, 1, '2013-04-08', '2013-04-08 13:49:40', 0),
(302, 1, '2013-04-09', '2013-04-09 14:16:01', 0),
(303, 1, '2013-04-09', '2013-04-09 15:08:42', 0),
(304, 127, '2013-04-09', '2013-04-09 15:08:44', 0),
(305, 1, '2013-04-12', '2013-04-11 22:00:36', 0),
(306, 128, '2013-04-13', '2013-04-13 20:45:04', 0),
(307, 1, '2013-04-13', '2013-04-13 20:45:19', 0),
(308, 133, '2013-04-13', '2013-04-13 20:45:21', 0),
(309, 132, '2013-04-13', '2013-04-13 20:45:22', 0),
(310, 132, '2013-04-13', '2013-04-13 20:45:23', 0),
(311, 132, '2013-04-13', '2013-04-13 20:45:23', 0),
(312, 132, '2013-04-13', '2013-04-13 20:45:23', 0),
(313, 132, '2013-04-13', '2013-04-13 20:45:24', 0),
(314, 132, '2013-04-13', '2013-04-13 20:45:24', 0),
(315, 132, '2013-04-13', '2013-04-13 20:45:25', 0),
(316, 132, '2013-04-13', '2013-04-13 20:45:26', 0),
(317, 132, '2013-04-13', '2013-04-13 20:45:26', 0),
(318, 132, '2013-04-13', '2013-04-13 20:45:27', 0),
(319, 109, '2013-04-13', '2013-04-13 20:45:27', 0),
(320, 128, '2013-04-15', '2013-04-14 22:35:15', 0),
(321, 1, '2013-04-15', '2013-04-14 22:35:29', 0),
(322, 133, '2013-04-15', '2013-04-14 22:35:30', 0),
(323, 132, '2013-04-15', '2013-04-14 22:35:31', 0),
(324, 132, '2013-04-15', '2013-04-14 22:35:33', 0),
(325, 132, '2013-04-15', '2013-04-14 22:35:34', 0),
(326, 132, '2013-04-15', '2013-04-14 22:35:35', 0),
(327, 132, '2013-04-15', '2013-04-14 22:35:36', 0),
(328, 132, '2013-04-15', '2013-04-14 22:35:36', 0),
(329, 132, '2013-04-15', '2013-04-14 22:35:37', 0),
(330, 132, '2013-04-15', '2013-04-14 22:35:37', 0),
(331, 132, '2013-04-15', '2013-04-14 22:35:38', 0),
(332, 132, '2013-04-15', '2013-04-14 22:35:38', 0),
(333, 109, '2013-04-15', '2013-04-14 22:35:39', 0),
(334, 134, '2013-04-15', '2013-04-15 02:55:28', 0),
(335, 127, '2013-04-15', '2013-04-15 03:07:44', 0),
(336, 109, '2013-04-15', '2013-04-15 03:17:36', 0),
(337, 129, '2013-04-15', '2013-04-15 03:33:09', 0),
(338, 128, '2013-04-15', '2013-04-15 04:05:29', 0),
(339, 132, '2013-04-15', '2013-04-15 04:30:38', 0),
(340, 128, '2013-04-16', '2013-04-16 00:02:47', 0),
(341, 1, '2013-04-16', '2013-04-16 00:03:01', 0),
(342, 133, '2013-04-16', '2013-04-16 00:03:03', 0),
(343, 132, '2013-04-16', '2013-04-16 00:03:04', 0),
(344, 132, '2013-04-16', '2013-04-16 00:03:05', 0),
(345, 132, '2013-04-16', '2013-04-16 00:03:06', 0),
(346, 132, '2013-04-16', '2013-04-16 00:03:07', 0),
(347, 132, '2013-04-16', '2013-04-16 00:03:07', 0),
(348, 132, '2013-04-16', '2013-04-16 00:03:08', 0),
(349, 132, '2013-04-16', '2013-04-16 00:03:08', 0),
(350, 132, '2013-04-16', '2013-04-16 00:03:09', 0),
(351, 132, '2013-04-16', '2013-04-16 00:03:09', 0),
(352, 132, '2013-04-16', '2013-04-16 00:03:10', 0),
(353, 109, '2013-04-16', '2013-04-16 00:03:11', 0),
(354, 1, '2013-04-17', '2013-04-17 15:31:25', 0),
(355, 128, '2013-04-17', '2013-04-17 16:30:23', 0),
(356, 1, '2013-04-18', '2013-04-17 23:05:17', 0),
(357, 1, '2013-04-20', '2013-04-19 22:36:00', 0),
(358, 1, '2013-04-24', '2013-04-24 07:41:36', 0),
(359, 128, '2013-04-28', '2013-04-28 21:10:57', 0),
(360, 1, '2013-04-28', '2013-04-28 21:11:15', 0),
(361, 133, '2013-04-28', '2013-04-28 21:11:17', 0),
(362, 132, '2013-04-28', '2013-04-28 21:11:18', 0),
(363, 132, '2013-04-28', '2013-04-28 21:11:19', 0),
(364, 132, '2013-04-28', '2013-04-28 21:11:20', 0),
(365, 132, '2013-04-28', '2013-04-28 21:11:20', 0),
(366, 132, '2013-04-28', '2013-04-28 21:11:21', 0),
(367, 132, '2013-04-28', '2013-04-28 21:11:22', 0),
(368, 132, '2013-04-28', '2013-04-28 21:11:23', 0),
(369, 132, '2013-04-28', '2013-04-28 21:11:23', 0),
(370, 132, '2013-04-28', '2013-04-28 21:11:24', 0),
(371, 132, '2013-04-28', '2013-04-28 21:11:24', 0),
(372, 109, '2013-04-28', '2013-04-28 21:11:25', 0),
(373, 1, '2013-04-29', '2013-04-29 12:29:00', 0),
(374, 109, '2013-04-29', '2013-04-29 12:49:11', 0),
(375, 109, '2013-04-29', '2013-04-29 12:49:25', 0),
(376, 109, '2013-04-29', '2013-04-29 12:49:30', 0),
(377, 1, '2013-04-29', '2013-04-29 12:49:32', 1),
(378, 104, '2013-04-29', '2013-04-29 12:49:35', 1),
(379, 109, '2013-04-29', '2013-04-29 12:49:45', 1),
(380, 1, '2013-04-29', '2013-04-29 12:49:46', 0),
(381, 109, '2013-04-29', '2013-04-29 12:49:53', 0),
(382, 109, '2013-04-29', '2013-04-29 12:49:59', 0),
(383, 1, '2013-04-29', '2013-04-29 12:49:59', 1),
(384, 1, '2013-04-29', '2013-04-29 15:23:59', 1),
(385, 1, '2013-04-29', '2013-04-29 20:22:08', 0),
(386, 2, '2013-04-30', '2013-04-30 09:08:53', 1),
(387, 40, '2013-04-30', '2013-04-30 09:09:01', 1),
(388, 40, '2013-04-30', '2013-04-30 09:09:12', 1),
(389, 40, '2013-04-30', '2013-04-30 09:09:13', 1),
(390, 40, '2013-04-30', '2013-04-30 09:09:16', 1),
(391, 1, '2013-04-30', '2013-04-30 09:11:28', 1),
(392, 46, '2013-04-30', '2013-04-30 09:12:03', 1),
(393, 46, '2013-04-30', '2013-04-30 09:12:19', 1),
(394, 46, '2013-04-30', '2013-04-30 09:32:54', 1),
(395, 50, '2013-04-30', '2013-04-30 09:33:10', 1),
(396, 50, '2013-04-30', '2013-04-30 09:33:19', 1),
(397, 50, '2013-04-30', '2013-04-30 09:33:28', 1),
(398, 50, '2013-04-30', '2013-04-30 09:33:32', 1),
(399, 50, '2013-04-30', '2013-04-30 09:33:39', 1),
(400, 50, '2013-04-30', '2013-04-30 09:35:25', 1),
(401, 2, '2013-04-30', '2013-04-30 09:35:45', 1),
(402, 1, '2013-04-30', '2013-04-30 09:35:51', 1),
(403, 2, '2013-04-30', '2013-04-30 09:36:32', 1),
(404, 50, '2013-04-30', '2013-04-30 09:36:35', 1),
(405, 2, '2013-04-30', '2013-04-30 09:59:00', 1),
(406, 1, '2013-04-30', '2013-04-30 09:59:06', 1),
(407, 2, '2013-04-30', '2013-04-30 09:59:14', 1),
(408, 44, '2013-04-30', '2013-04-30 09:59:23', 1),
(409, 46, '2013-04-30', '2013-04-30 09:59:23', 1),
(410, 46, '2013-04-30', '2013-04-30 09:59:32', 1),
(411, 46, '2013-04-30', '2013-04-30 10:00:24', 1),
(412, 46, '2013-04-30', '2013-04-30 10:00:41', 1),
(413, 46, '2013-04-30', '2013-04-30 10:01:02', 1),
(414, 46, '2013-04-30', '2013-04-30 10:04:02', 1),
(415, 46, '2013-04-30', '2013-04-30 10:04:15', 1),
(416, 47, '2013-04-30', '2013-04-30 10:04:27', 1),
(417, 50, '2013-04-30', '2013-04-30 10:04:35', 1),
(418, 2, '2013-04-30', '2013-04-30 10:04:43', 1),
(419, 46, '2013-04-30', '2013-04-30 10:04:48', 1),
(420, 46, '2013-04-30', '2013-04-30 10:06:18', 1),
(421, 109, '2013-04-30', '2013-04-30 10:06:30', 1),
(422, 1, '2013-04-30', '2013-04-30 10:06:32', 0),
(423, 109, '2013-04-30', '2013-04-30 10:06:39', 0),
(424, 109, '2013-04-30', '2013-04-30 10:06:41', 0),
(425, 109, '2013-04-30', '2013-04-30 10:06:47', 0),
(426, 1, '2013-04-30', '2013-04-30 10:06:47', 1),
(427, 2, '2013-04-30', '2013-04-30 10:06:52', 1),
(428, 44, '2013-04-30', '2013-04-30 10:07:02', 1),
(429, 46, '2013-04-30', '2013-04-30 10:07:02', 1),
(430, 50, '2013-04-30', '2013-04-30 10:07:19', 1),
(431, 50, '2013-04-30', '2013-04-30 10:07:25', 1),
(432, 2, '2013-04-30', '2013-04-30 10:07:41', 1),
(433, 50, '2013-04-30', '2013-04-30 10:07:45', 1),
(434, 2, '2013-04-30', '2013-04-30 10:07:49', 1),
(435, 46, '2013-04-30', '2013-04-30 10:07:52', 1),
(436, 46, '2013-04-30', '2013-04-30 10:07:56', 1),
(437, 46, '2013-04-30', '2013-04-30 10:08:35', 1),
(438, 46, '2013-04-30', '2013-04-30 10:08:40', 1),
(439, 46, '2013-04-30', '2013-04-30 10:08:40', 1),
(440, 46, '2013-04-30', '2013-04-30 10:08:53', 1),
(441, 46, '2013-04-30', '2013-04-30 10:08:59', 1),
(442, 1, '2013-04-30', '2013-04-30 10:16:12', 1),
(443, 1, '2013-04-30', '2013-04-30 10:16:19', 1),
(444, 1, '2013-04-30', '2013-04-30 10:16:57', 1),
(445, 109, '2013-04-30', '2013-04-30 10:17:03', 1),
(446, 1, '2013-04-30', '2013-04-30 10:17:03', 0),
(447, 109, '2013-04-30', '2013-04-30 10:17:23', 0),
(448, 109, '2013-04-30', '2013-04-30 10:17:25', 0),
(449, 109, '2013-04-30', '2013-04-30 10:17:30', 0),
(450, 1, '2013-04-30', '2013-04-30 10:17:30', 1),
(451, 1, '2013-04-30', '2013-04-30 12:05:54', 1),
(452, 1, '2013-05-02', '2013-05-01 22:03:09', 0),
(453, 1, '2013-05-02', '2013-05-02 07:45:03', 0),
(454, 1, '2013-05-02', '2013-05-02 09:10:45', 0),
(455, 1, '2013-05-02', '2013-05-02 09:37:27', 1),
(456, 104, '2013-05-02', '2013-05-02 09:37:33', 1),
(457, 1, '2013-05-03', '2013-05-03 06:07:14', 1),
(458, 2, '2013-05-03', '2013-05-03 06:24:28', 1),
(459, 51, '2013-05-03', '2013-05-03 06:24:39', 1),
(460, 98, '2013-05-03', '2013-05-03 06:27:32', 1),
(461, 98, '2013-05-03', '2013-05-03 06:27:35', 1),
(462, 1, '2013-05-03', '2013-05-03 06:27:43', 1),
(463, 1, '2013-05-03', '2013-05-03 06:27:47', 1),
(464, 128, '2013-05-03', '2013-05-03 06:27:51', 1),
(465, 132, '2013-05-03', '2013-05-03 06:27:54', 1),
(466, 132, '2013-05-03', '2013-05-03 06:27:56', 1),
(467, 132, '2013-05-03', '2013-05-03 06:27:58', 1),
(468, 132, '2013-05-03', '2013-05-03 06:28:05', 1),
(469, 1, '2013-05-03', '2013-05-03 06:28:07', 1),
(470, 1, '2013-05-03', '2013-05-03 06:28:10', 1),
(471, 1, '2013-05-03', '2013-05-03 06:28:40', 1),
(472, 1, '2013-05-03', '2013-05-03 06:28:41', 1),
(473, 1, '2013-05-03', '2013-05-03 06:29:03', 1),
(474, 1, '2013-05-03', '2013-05-03 06:29:04', 1),
(475, 1, '2013-05-03', '2013-05-03 06:29:09', 1),
(476, 1, '2013-05-03', '2013-05-03 06:29:17', 1),
(477, 1, '2013-05-03', '2013-05-03 06:29:18', 1),
(478, 1, '2013-05-03', '2013-05-03 06:29:20', 1),
(479, 1, '2013-05-03', '2013-05-03 06:40:25', 0),
(480, 1, '2013-05-03', '2013-05-03 06:40:29', 0),
(481, 127, '2013-05-03', '2013-05-03 06:40:31', 0),
(482, 1, '2013-05-03', '2013-05-03 07:18:30', 1),
(483, 109, '2013-05-03', '2013-05-03 08:24:58', 1),
(484, 1, '2013-05-03', '2013-05-03 08:24:58', 0),
(485, 109, '2013-05-03', '2013-05-03 08:25:23', 0),
(486, 109, '2013-05-03', '2013-05-03 08:25:26', 0),
(487, 109, '2013-05-03', '2013-05-03 08:25:30', 0),
(488, 109, '2013-05-03', '2013-05-03 08:25:36', 0),
(489, 109, '2013-05-03', '2013-05-03 08:25:41', 0),
(490, 1, '2013-05-03', '2013-05-03 08:25:42', 1),
(491, 49, '2013-05-03', '2013-05-03 08:25:58', 1),
(492, 46, '2013-05-03', '2013-05-03 08:26:05', 1),
(493, 51, '2013-05-03', '2013-05-03 08:26:27', 1),
(494, 2, '2013-05-03', '2013-05-03 08:27:01', 1),
(495, 28, '2013-05-03', '2013-05-03 08:27:04', 1),
(496, 28, '2013-05-03', '2013-05-03 08:27:12', 1),
(497, 28, '2013-05-03', '2013-05-03 08:27:15', 1),
(498, 109, '2013-05-03', '2013-05-03 08:27:18', 1),
(499, 1, '2013-05-03', '2013-05-03 08:27:18', 0),
(500, 1, '2013-05-03', '2013-05-03 08:28:38', 0),
(501, 109, '2013-05-03', '2013-05-03 08:29:59', 0),
(502, 109, '2013-05-03', '2013-05-03 08:30:06', 0),
(503, 1, '2013-05-03', '2013-05-03 08:30:07', 1),
(504, 2, '2013-05-03', '2013-05-03 08:30:16', 1),
(505, 28, '2013-05-03', '2013-05-03 08:30:20', 1),
(506, 28, '2013-05-03', '2013-05-03 08:30:39', 1),
(507, 28, '2013-05-03', '2013-05-03 08:30:42', 1),
(508, 109, '2013-05-03', '2013-05-03 08:30:44', 1),
(509, 1, '2013-05-03', '2013-05-03 08:30:45', 0),
(510, 127, '2013-05-03', '2013-05-03 08:38:49', 0),
(511, 130, '2013-05-03', '2013-05-03 08:38:57', 0),
(512, 131, '2013-05-03', '2013-05-03 08:39:04', 0),
(513, 134, '2013-05-04', '2013-05-03 23:43:08', 0),
(514, 127, '2013-05-04', '2013-05-03 23:48:03', 0),
(515, 109, '2013-05-04', '2013-05-03 23:52:08', 0),
(516, 129, '2013-05-04', '2013-05-04 00:04:55', 0),
(517, 128, '2013-05-04', '2013-05-04 00:17:31', 0),
(518, 133, '2013-05-04', '2013-05-04 00:21:12', 0),
(519, 132, '2013-05-04', '2013-05-04 00:21:39', 0),
(520, 130, '2013-05-04', '2013-05-04 07:05:02', 0),
(521, 131, '2013-05-04', '2013-05-04 07:07:09', 0),
(522, 1, '2013-05-04', '2013-05-04 07:36:55', 0),
(523, 1, '2013-05-06', '2013-05-06 14:00:54', 0),
(524, 131, '2013-05-06', '2013-05-06 14:51:41', 0),
(525, 1, '2013-05-06', '2013-05-06 20:17:08', 0),
(526, 130, '2013-05-07', '2013-05-07 01:13:18', 0),
(527, 131, '2013-05-08', '2013-05-08 11:05:46', 0),
(528, 1, '2013-05-09', '2013-05-09 10:54:40', 0),
(529, 131, '2013-05-10', '2013-05-10 07:21:18', 0),
(530, 1, '2013-05-10', '2013-05-10 15:46:37', 0),
(531, 109, '2013-05-10', '2013-05-10 15:47:17', 0),
(532, 109, '2013-05-10', '2013-05-10 15:47:23', 0),
(533, 109, '2013-05-10', '2013-05-10 15:52:58', 0),
(534, 109, '2013-05-10', '2013-05-10 15:53:05', 0),
(535, 109, '2013-05-10', '2013-05-10 15:54:07', 0),
(536, 109, '2013-05-10', '2013-05-10 16:22:38', 0),
(537, 133, '2013-05-10', '2013-05-10 17:46:52', 0),
(538, 109, '2013-05-11', '2013-05-11 07:21:52', 0),
(539, 1, '2013-05-11', '2013-05-11 07:46:47', 0),
(540, 109, '2013-05-11', '2013-05-11 07:47:09', 0),
(541, 109, '2013-05-11', '2013-05-11 08:37:53', 0),
(542, 109, '2013-05-11', '2013-05-11 08:38:02', 0),
(543, 1, '2013-05-11', '2013-05-11 08:38:04', 1),
(544, 104, '2013-05-11', '2013-05-11 08:38:51', 1),
(545, 109, '2013-05-11', '2013-05-11 09:05:58', 1),
(546, 1, '2013-05-11', '2013-05-11 09:05:59', 1),
(547, 1, '2013-05-11', '2013-05-11 09:06:51', 1),
(548, 1, '2013-05-11', '2013-05-11 09:10:10', 1),
(549, 131, '2013-05-12', '2013-05-12 06:21:36', 0),
(550, 130, '2013-05-12', '2013-05-12 17:26:01', 0),
(551, 1, '2013-05-13', '2013-05-13 17:53:38', 0),
(552, 1, '2013-05-16', '2013-05-16 06:02:55', 1),
(553, 104, '2013-05-16', '2013-05-16 06:03:01', 1),
(554, 1, '2013-05-18', '2013-05-18 21:40:56', 0),
(555, 1, '2013-05-21', '2013-05-21 18:15:26', 0),
(556, 109, '2013-05-21', '2013-05-21 18:16:21', 0),
(557, 109, '2013-05-21', '2013-05-21 18:16:46', 0),
(558, 109, '2013-05-21', '2013-05-21 18:16:57', 0),
(559, 1, '2013-05-21', '2013-05-21 18:16:59', 1),
(560, 104, '2013-05-21', '2013-05-21 18:17:03', 1),
(561, 1, '2013-05-21', '2013-05-21 18:17:35', 1),
(562, 40, '2013-05-21', '2013-05-21 18:42:40', 1),
(563, 40, '2013-05-21', '2013-05-21 18:42:56', 1),
(564, 40, '2013-05-21', '2013-05-21 18:42:56', 1),
(565, 40, '2013-05-21', '2013-05-21 18:42:59', 1),
(566, 118, '2013-05-21', '2013-05-21 18:43:08', 1),
(567, 118, '2013-05-21', '2013-05-21 18:43:08', 1),
(568, 118, '2013-05-21', '2013-05-21 18:43:08', 1),
(569, 118, '2013-05-21', '2013-05-21 18:43:08', 1),
(570, 2, '2013-05-21', '2013-05-21 18:59:54', 1),
(571, 11, '2013-05-21', '2013-05-21 19:01:55', 1),
(572, 55, '2013-05-22', '2013-05-22 12:23:23', 1),
(573, 55, '2013-05-22', '2013-05-22 12:23:30', 1),
(574, 55, '2013-05-22', '2013-05-22 12:23:30', 1),
(575, 1, '2013-05-22', '2013-05-22 12:23:39', 1),
(576, 1, '2013-05-22', '2013-05-22 12:27:04', 1),
(577, 1, '2013-05-22', '2013-05-22 12:27:05', 1),
(578, 1, '2013-05-22', '2013-05-22 12:31:34', 1),
(579, 1, '2013-05-22', '2013-05-22 12:31:42', 1),
(580, 1, '2013-05-22', '2013-05-22 12:31:42', 1),
(581, 1, '2013-05-22', '2013-05-22 12:32:18', 1),
(582, 1, '2013-05-22', '2013-05-22 12:32:18', 1),
(583, 1, '2013-05-22', '2013-05-22 12:33:56', 1),
(584, 1, '2013-05-22', '2013-05-22 12:33:56', 1),
(585, 1, '2013-05-22', '2013-05-22 12:34:05', 1),
(586, 1, '2013-05-22', '2013-05-22 12:34:10', 1),
(587, 1, '2013-05-22', '2013-05-22 12:34:41', 1),
(588, 1, '2013-05-22', '2013-05-22 12:34:41', 1),
(589, 1, '2013-05-22', '2013-05-22 12:34:54', 1),
(590, 1, '2013-05-22', '2013-05-22 12:34:54', 1),
(591, 1, '2013-05-22', '2013-05-22 12:35:00', 1),
(592, 1, '2013-05-22', '2013-05-22 12:35:34', 1),
(593, 1, '2013-05-22', '2013-05-22 12:35:46', 1),
(594, 1, '2013-05-22', '2013-05-22 12:35:47', 1),
(595, 1, '2013-05-22', '2013-05-22 12:35:55', 1),
(596, 1, '2013-05-22', '2013-05-22 17:48:19', 1),
(597, 1, '2013-05-22', '2013-05-22 17:48:38', 1),
(598, 1, '2013-05-22', '2013-05-22 17:48:38', 1),
(599, 1, '2013-05-22', '2013-05-22 17:48:55', 1),
(600, 1, '2013-05-22', '2013-05-22 17:48:56', 1),
(601, 1, '2013-05-22', '2013-05-22 18:04:01', 1),
(602, 1, '2013-05-22', '2013-05-22 18:04:14', 1),
(603, 1, '2013-05-22', '2013-05-22 18:04:14', 1),
(604, 1, '2013-05-22', '2013-05-22 18:04:19', 1),
(605, 1, '2013-05-22', '2013-05-22 18:04:26', 1),
(606, 1, '2013-05-22', '2013-05-22 18:07:07', 1),
(607, 1, '2013-05-22', '2013-05-22 18:07:07', 1),
(608, 1, '2013-05-22', '2013-05-22 18:08:18', 1),
(609, 1, '2013-05-22', '2013-05-22 18:08:19', 1),
(610, 1, '2013-05-22', '2013-05-22 18:08:58', 1),
(611, 1, '2013-05-22', '2013-05-22 18:08:59', 1),
(612, 1, '2013-05-22', '2013-05-22 18:09:21', 1),
(613, 1, '2013-05-22', '2013-05-22 18:09:22', 1),
(614, 1, '2013-05-22', '2013-05-22 18:13:46', 1),
(615, 1, '2013-05-22', '2013-05-22 18:13:46', 1),
(616, 1, '2013-05-22', '2013-05-22 18:13:51', 1),
(617, 1, '2013-05-22', '2013-05-22 18:14:06', 1),
(618, 1, '2013-05-22', '2013-05-22 18:14:22', 1),
(619, 1, '2013-05-22', '2013-05-22 18:14:23', 1),
(620, 1, '2013-05-22', '2013-05-22 18:14:44', 1),
(621, 1, '2013-05-22', '2013-05-22 18:14:45', 1),
(622, 1, '2013-05-22', '2013-05-22 18:14:55', 1),
(623, 1, '2013-05-22', '2013-05-22 18:15:06', 1),
(624, 1, '2013-05-22', '2013-05-22 18:16:42', 1),
(625, 1, '2013-05-22', '2013-05-22 18:16:43', 1),
(626, 1, '2013-05-22', '2013-05-22 18:16:53', 1),
(627, 1, '2013-05-22', '2013-05-22 18:17:09', 1),
(628, 104, '2013-05-22', '2013-05-22 18:17:11', 1),
(629, 1, '2013-05-22', '2013-05-22 18:17:36', 1),
(630, 1, '2013-05-22', '2013-05-22 18:17:36', 1),
(631, 1, '2013-05-22', '2013-05-22 18:17:44', 1),
(632, 109, '2013-05-22', '2013-05-22 18:17:52', 1),
(633, 1, '2013-05-22', '2013-05-22 18:17:54', 0),
(634, 1, '2013-05-22', '2013-05-22 18:17:59', 0),
(635, 109, '2013-05-22', '2013-05-22 18:53:44', 0),
(636, 109, '2013-05-22', '2013-05-22 18:53:50', 0),
(637, 109, '2013-05-22', '2013-05-22 18:54:00', 0),
(638, 1, '2013-05-22', '2013-05-22 18:54:03', 1),
(639, 1, '2013-05-22', '2013-05-22 18:54:08', 1),
(640, 1, '2013-05-22', '2013-05-22 18:54:20', 1),
(641, 1, '2013-05-22', '2013-05-22 18:54:20', 1),
(642, 1, '2013-05-22', '2013-05-22 18:54:33', 1),
(643, 1, '2013-05-22', '2013-05-22 18:54:34', 1),
(644, 1, '2013-05-22', '2013-05-22 18:54:46', 1),
(645, 1, '2013-05-22', '2013-05-22 18:54:47', 1),
(646, 1, '2013-05-22', '2013-05-22 20:13:17', 1),
(647, 1, '2013-05-22', '2013-05-22 20:13:18', 1),
(648, 1, '2013-05-22', '2013-05-22 20:13:27', 1),
(649, 1, '2013-05-22', '2013-05-22 20:13:39', 1),
(650, 1, '2013-05-22', '2013-05-22 20:15:08', 1),
(651, 1, '2013-05-22', '2013-05-22 20:15:09', 1),
(652, 1, '2013-05-22', '2013-05-22 20:15:15', 1),
(653, 1, '2013-05-22', '2013-05-22 20:15:21', 1),
(654, 1, '2013-05-23', '2013-05-23 08:51:34', 1),
(655, 1, '2013-05-23', '2013-05-23 08:51:35', 1),
(656, 1, '2013-05-23', '2013-05-23 08:54:12', 1),
(657, 1, '2013-05-23', '2013-05-23 08:54:13', 1),
(658, 1, '2013-05-23', '2013-05-23 08:54:19', 1),
(659, 1, '2013-05-23', '2013-05-23 08:54:22', 1),
(660, 1, '2013-05-23', '2013-05-23 08:54:51', 1),
(661, 1, '2013-05-23', '2013-05-23 08:54:51', 1),
(662, 1, '2013-05-23', '2013-05-23 08:57:26', 1),
(663, 1, '2013-05-23', '2013-05-23 08:57:26', 1),
(664, 1, '2013-05-23', '2013-05-23 10:39:53', 1),
(665, 1, '2013-05-23', '2013-05-23 10:39:53', 1),
(666, 1, '2013-05-23', '2013-05-23 10:49:23', 1),
(667, 1, '2013-05-23', '2013-05-23 10:49:24', 1),
(668, 1, '2013-05-23', '2013-05-23 10:49:33', 1),
(669, 1, '2013-05-23', '2013-05-23 10:49:39', 1),
(670, 1, '2013-05-23', '2013-05-23 10:51:36', 1),
(671, 1, '2013-05-23', '2013-05-23 10:51:37', 1),
(672, 1, '2013-05-23', '2013-05-23 10:52:25', 1),
(673, 1, '2013-05-23', '2013-05-23 10:52:25', 1),
(674, 1, '2013-05-23', '2013-05-23 10:52:31', 1),
(675, 1, '2013-05-23', '2013-05-23 10:52:55', 1),
(676, 1, '2013-05-24', '2013-05-24 19:55:02', 0),
(677, 1, '2013-05-25', '2013-05-25 00:11:12', 0),
(678, 109, '2013-05-25', '2013-05-25 09:03:06', 0),
(679, 109, '2013-05-25', '2013-05-25 09:03:08', 0),
(680, 109, '2013-05-25', '2013-05-25 09:03:15', 0),
(681, 1, '2013-05-25', '2013-05-25 09:03:16', 1),
(682, 104, '2013-05-25', '2013-05-25 09:03:18', 1),
(683, 2, '2013-05-25', '2013-05-25 09:03:31', 1),
(684, 2, '2013-05-25', '2013-05-25 09:03:32', 1),
(685, 40, '2013-05-25', '2013-05-25 09:03:50', 1),
(686, 40, '2013-05-25', '2013-05-25 09:03:54', 1),
(687, 118, '2013-05-25', '2013-05-25 09:04:57', 1),
(688, 118, '2013-05-25', '2013-05-25 09:04:57', 1),
(689, 118, '2013-05-25', '2013-05-25 09:04:57', 1),
(690, 118, '2013-05-25', '2013-05-25 09:04:57', 1),
(691, 118, '2013-05-25', '2013-05-25 09:05:05', 1),
(692, 118, '2013-05-25', '2013-05-25 09:05:05', 1),
(693, 118, '2013-05-25', '2013-05-25 09:05:06', 1),
(694, 118, '2013-05-25', '2013-05-25 09:05:06', 1),
(695, 137, '2013-05-25', '2013-05-25 09:05:08', 1),
(696, 40, '2013-05-25', '2013-05-25 09:05:09', 1),
(697, 1, '2013-05-25', '2013-05-25 09:05:16', 1),
(698, 1, '2013-05-25', '2013-05-25 09:05:20', 1),
(699, 1, '2013-05-25', '2013-05-25 09:05:48', 1),
(700, 1, '2013-05-25', '2013-05-25 09:05:48', 1),
(701, 1, '2013-05-25', '2013-05-25 09:06:15', 1),
(702, 134, '2013-05-25', '2013-05-25 09:28:37', 0),
(703, 40, '2013-05-25', '2013-05-25 09:37:10', 1),
(704, 1, '2013-05-25', '2013-05-25 09:48:44', 0),
(705, 1, '2013-05-25', '2013-05-25 09:50:01', 0),
(706, 129, '2013-05-25', '2013-05-25 10:41:43', 0),
(707, 128, '2013-05-25', '2013-05-25 11:02:37', 0),
(708, 127, '2013-05-25', '2013-05-25 11:25:14', 0),
(709, 109, '2013-05-25', '2013-05-25 11:33:19', 0),
(710, 109, '2013-05-25', '2013-05-25 14:38:47', 1),
(711, 1, '2013-05-25', '2013-05-25 14:38:47', 0),
(712, 109, '2013-05-25', '2013-05-25 14:39:13', 0),
(713, 1, '2013-05-25', '2013-05-25 14:39:14', 0),
(714, 109, '2013-05-25', '2013-05-25 15:07:20', 0),
(715, 1, '2013-05-25', '2013-05-25 15:07:20', 0),
(716, 1, '2013-05-25', '2013-05-25 19:57:15', 0),
(717, 1, '2013-05-26', '2013-05-26 14:36:18', 0),
(718, 1, '2013-05-26', '2013-05-26 15:55:15', 0),
(719, 1, '2013-05-27', '2013-05-27 10:19:03', 0),
(720, 1, '2013-05-30', '2013-05-30 07:15:17', 0),
(721, 128, '2013-05-30', '2013-05-30 07:15:20', 0),
(722, 134, '2013-05-30', '2013-05-30 07:15:21', 0),
(723, 133, '2013-05-30', '2013-05-30 07:15:22', 0),
(724, 132, '2013-05-30', '2013-05-30 07:15:23', 0),
(725, 1, '2013-06-04', '2013-06-04 07:26:07', 0),
(726, 1, '2013-06-04', '2013-06-04 12:43:08', 0),
(727, 1, '2013-06-05', '2013-06-05 06:25:38', 0),
(728, 127, '2013-06-05', '2013-06-05 06:29:25', 0),
(729, 131, '2013-06-05', '2013-06-05 06:29:27', 0),
(730, 1, '2013-06-05', '2013-06-05 06:29:33', 0),
(731, 1, '2013-06-05', '2013-06-05 18:14:15', 0),
(732, 1, '2013-06-06', '2013-06-06 01:00:31', 0),
(733, 1, '2013-06-07', '2013-06-07 17:06:21', 0),
(734, 128, '2013-06-08', '2013-06-08 16:47:28', 0),
(735, 132, '2013-06-08', '2013-06-08 17:28:51', 0),
(736, 134, '2013-06-08', '2013-06-08 20:41:54', 0),
(737, 129, '2013-06-08', '2013-06-08 21:50:36', 0),
(738, 109, '2013-06-09', '2013-06-09 07:59:40', 0),
(739, 109, '2013-06-09', '2013-06-09 07:59:43', 0),
(740, 109, '2013-06-09', '2013-06-09 07:59:52', 0),
(741, 109, '2013-06-09', '2013-06-09 07:59:58', 0),
(742, 1, '2013-06-09', '2013-06-09 07:59:59', 1),
(743, 104, '2013-06-09', '2013-06-09 08:00:01', 1),
(744, 11, '2013-06-09', '2013-06-09 08:00:28', 1),
(745, 1, '2013-06-09', '2013-06-09 08:01:37', 1),
(746, 1, '2013-06-09', '2013-06-09 08:02:52', 1),
(747, 1, '2013-06-09', '2013-06-09 08:02:52', 1),
(748, 1, '2013-06-09', '2013-06-09 09:14:08', 1),
(749, 2, '2013-06-09', '2013-06-09 15:07:38', 1),
(750, 7, '2013-06-09', '2013-06-09 15:07:41', 1),
(751, 134, '2013-06-09', '2013-06-09 15:07:46', 1),
(752, 134, '2013-06-09', '2013-06-09 15:07:54', 1),
(753, 7, '2013-06-09', '2013-06-09 15:08:08', 1),
(754, 132, '2013-06-10', '2013-06-10 03:10:26', 0),
(755, 109, '2013-06-10', '2013-06-10 09:47:19', 1),
(756, 1, '2013-06-10', '2013-06-10 09:47:19', 0),
(757, 109, '2013-06-10', '2013-06-10 09:47:22', 0),
(758, 1, '2013-06-10', '2013-06-10 09:47:23', 0),
(759, 1, '2013-06-10', '2013-06-10 10:22:57', 0),
(760, 1, '2013-06-10', '2013-06-10 17:36:48', 0),
(761, 1, '2013-06-13', '2013-06-13 12:24:35', 0),
(762, 128, '2013-06-13', '2013-06-13 12:24:38', 0),
(763, 132, '2013-06-13', '2013-06-13 12:24:40', 0),
(764, 132, '2013-06-13', '2013-06-13 12:24:42', 0),
(765, 134, '2013-06-13', '2013-06-13 12:24:44', 0),
(766, 127, '2013-06-16', '2013-06-16 07:55:07', 0),
(767, 109, '2013-06-16', '2013-06-16 08:02:19', 0),
(768, 1, '2013-06-16', '2013-06-16 08:08:41', 0),
(769, 128, '2013-06-16', '2013-06-16 11:31:11', 0),
(770, 1, '2013-06-16', '2013-06-16 11:42:03', 0),
(771, 127, '2013-06-17', '2013-06-17 02:19:45', 0),
(772, 1, '2013-06-17', '2013-06-17 02:19:46', 0),
(773, 130, '2013-06-17', '2013-06-17 02:19:46', 0),
(774, 131, '2013-06-17', '2013-06-17 21:08:38', 0),
(775, 130, '2013-06-17', '2013-06-17 21:29:46', 0),
(776, 1, '2013-06-18', '2013-06-18 01:35:09', 0),
(777, 1, '2013-06-19', '2013-06-19 17:14:51', 0),
(778, 1, '2013-06-21', '2013-06-21 18:55:27', 0),
(779, 1, '2013-06-29', '2013-06-29 12:12:16', 0),
(780, 1, '2013-06-30', '2013-06-30 00:28:12', 0),
(781, 134, '2013-06-30', '2013-06-30 05:10:00', 0),
(782, 129, '2013-06-30', '2013-06-30 06:00:24', 0),
(783, 128, '2013-06-30', '2013-06-30 06:45:15', 0),
(784, 132, '2013-06-30', '2013-06-30 06:53:13', 0),
(785, 127, '2013-06-30', '2013-06-30 07:40:23', 0),
(786, 109, '2013-06-30', '2013-06-30 08:11:46', 0),
(787, 129, '2013-06-30', '2013-06-30 11:43:46', 0),
(788, 1, '2013-07-01', '2013-07-01 10:14:01', 0),
(789, 1, '2013-07-01', '2013-07-01 10:14:56', 0),
(790, 128, '2013-07-01', '2013-07-01 10:15:09', 0),
(791, 134, '2013-07-01', '2013-07-01 10:15:39', 0),
(792, 127, '2013-07-01', '2013-07-01 10:15:57', 0),
(793, 109, '2013-07-01', '2013-07-01 10:15:58', 0),
(794, 131, '2013-07-01', '2013-07-01 10:15:59', 0),
(795, 133, '2013-07-01', '2013-07-01 10:16:00', 0),
(796, 130, '2013-07-01', '2013-07-01 10:16:04', 0),
(797, 132, '2013-07-01', '2013-07-01 10:30:34', 0),
(798, 132, '2013-07-01', '2013-07-01 10:31:29', 0),
(799, 132, '2013-07-01', '2013-07-01 10:33:43', 0),
(800, 132, '2013-07-01', '2013-07-01 10:34:58', 0),
(801, 132, '2013-07-01', '2013-07-01 10:35:36', 0),
(802, 132, '2013-07-01', '2013-07-01 10:35:57', 0),
(803, 132, '2013-07-01', '2013-07-01 10:36:44', 0),
(804, 132, '2013-07-01', '2013-07-01 10:36:44', 0),
(805, 132, '2013-07-01', '2013-07-01 10:36:45', 0),
(806, 132, '2013-07-01', '2013-07-01 10:36:51', 0),
(807, 132, '2013-07-01', '2013-07-01 10:37:05', 0),
(808, 132, '2013-07-01', '2013-07-01 10:37:14', 0),
(809, 132, '2013-07-01', '2013-07-01 10:37:39', 0),
(810, 1, '2013-07-01', '2013-07-01 13:56:43', 0),
(811, 129, '2013-07-01', '2013-07-01 19:07:11', 0),
(812, 1, '2013-07-08', '2013-07-08 17:02:16', 0),
(813, 127, '2013-07-09', '2013-07-09 01:24:06', 0),
(814, 1, '2013-07-09', '2013-07-09 01:24:07', 0),
(815, 130, '2013-07-09', '2013-07-09 01:24:07', 0),
(816, 1, '2013-07-09', '2013-07-09 19:58:23', 0),
(817, 133, '2013-07-10', '2013-07-10 07:50:22', 0),
(818, 130, '2013-07-10', '2013-07-10 09:08:34', 0),
(819, 1, '2013-07-11', '2013-07-11 03:10:03', 0),
(820, 130, '2013-07-11', '2013-07-11 14:07:23', 0),
(821, 130, '2013-07-11', '2013-07-11 14:07:24', 0),
(822, 130, '2013-07-11', '2013-07-11 14:07:25', 0),
(823, 130, '2013-07-11', '2013-07-11 14:07:26', 0),
(824, 1, '2013-07-11', '2013-07-11 14:07:27', 0),
(825, 131, '2013-07-11', '2013-07-11 14:07:27', 0),
(826, 109, '2013-07-11', '2013-07-11 14:07:28', 0),
(827, 1, '2013-07-12', '2013-07-12 03:44:14', 0),
(828, 1, '2013-07-12', '2013-07-12 07:41:03', 0),
(829, 128, '2013-07-16', '2013-07-16 06:39:54', 0),
(830, 134, '2013-07-16', '2013-07-16 08:04:37', 0),
(831, 127, '2013-07-16', '2013-07-16 08:43:40', 0),
(832, 109, '2013-07-16', '2013-07-16 10:00:58', 0),
(833, 129, '2013-07-16', '2013-07-16 10:38:39', 0),
(834, 1, '2013-07-16', '2013-07-16 11:09:55', 0),
(835, 129, '2013-07-17', '2013-07-17 15:53:58', 0),
(836, 1, '2013-07-19', '2013-07-18 22:45:19', 0),
(837, 129, '2013-07-19', '2013-07-18 22:45:22', 0),
(838, 133, '2013-07-19', '2013-07-18 22:45:24', 0),
(839, 109, '2013-07-19', '2013-07-18 22:45:24', 0),
(840, 127, '2013-07-19', '2013-07-18 22:45:25', 0),
(841, 127, '2013-07-19', '2013-07-19 04:59:32', 0),
(842, 1, '2013-07-19', '2013-07-19 04:59:33', 0),
(843, 130, '2013-07-19', '2013-07-19 04:59:34', 0),
(844, 130, '2013-07-22', '2013-07-22 09:09:00', 0),
(845, 130, '2013-07-22', '2013-07-22 09:09:03', 0),
(846, 130, '2013-07-22', '2013-07-22 09:09:04', 0),
(847, 130, '2013-07-22', '2013-07-22 09:09:06', 0),
(848, 1, '2013-07-22', '2013-07-22 09:09:07', 0),
(849, 131, '2013-07-22', '2013-07-22 09:09:07', 0),
(850, 109, '2013-07-22', '2013-07-22 09:09:09', 0),
(851, 1, '2013-07-24', '2013-07-24 20:21:55', 0),
(852, 1, '2013-07-26', '2013-07-26 10:29:15', 0),
(853, 1, '2013-07-29', '2013-07-29 12:22:04', 0),
(854, 133, '2013-07-31', '2013-07-31 12:39:30', 0),
(855, 1, '2013-08-03', '2013-08-03 15:29:10', 0),
(856, 128, '2013-08-03', '2013-08-03 20:13:07', 0),
(857, 132, '2013-08-03', '2013-08-03 20:22:32', 0),
(858, 109, '2013-08-03', '2013-08-03 20:34:32', 0),
(859, 134, '2013-08-03', '2013-08-03 21:46:23', 0),
(860, 127, '2013-08-04', '2013-08-03 22:50:51', 0),
(861, 129, '2013-08-04', '2013-08-04 00:34:25', 0),
(862, 134, '2013-08-04', '2013-08-04 05:12:42', 0),
(863, 129, '2013-08-05', '2013-08-05 07:20:04', 0),
(864, 1, '2013-08-06', '2013-08-06 00:53:32', 0),
(865, 1, '2013-08-11', '2013-08-11 07:44:12', 0),
(866, 1, '2013-08-16', '2013-08-16 21:34:25', 0),
(867, 1, '2013-08-18', '2013-08-18 04:52:27', 0),
(868, 1, '2013-08-18', '2013-08-18 07:37:41', 0),
(869, 109, '2013-08-18', '2013-08-18 07:37:42', 0),
(870, 134, '2013-08-18', '2013-08-18 07:37:44', 0),
(871, 128, '2013-08-18', '2013-08-18 07:37:45', 0),
(872, 132, '2013-08-18', '2013-08-18 07:37:46', 0),
(873, 128, '2013-08-21', '2013-08-21 21:00:45', 0),
(874, 134, '2013-08-22', '2013-08-21 22:26:28', 0),
(875, 109, '2013-08-22', '2013-08-21 23:57:00', 0),
(876, 127, '2013-08-22', '2013-08-22 00:32:16', 0),
(877, 129, '2013-08-22', '2013-08-22 01:11:15', 0),
(878, 1, '2013-08-22', '2013-08-22 02:40:34', 0),
(879, 1, '2013-08-22', '2013-08-22 09:07:05', 0),
(880, 1, '2013-08-23', '2013-08-23 05:37:40', 0),
(881, 1, '2013-08-23', '2013-08-23 17:20:26', 0),
(882, 1, '2013-08-24', '2013-08-24 18:55:55', 0),
(883, 1, '2013-08-25', '2013-08-25 10:27:21', 0),
(884, 1, '2013-08-25', '2013-08-25 20:52:49', 0),
(885, 1, '2013-08-25', '2013-08-25 21:14:11', 0),
(886, 1, '2013-08-25', '2013-08-25 21:17:52', 0),
(887, 1, '2013-08-26', '2013-08-26 21:52:34', 0),
(888, 1, '2013-08-26', '2013-08-26 21:56:57', 0),
(889, 1, '2013-08-27', '2013-08-27 02:05:54', 0),
(890, 133, '2013-08-29', '2013-08-29 18:16:05', 0),
(891, 1, '2013-08-31', '2013-08-30 22:49:42', 0),
(892, 1, '2013-09-01', '2013-09-01 20:54:55', 0),
(893, 1, '2013-09-02', '2013-09-02 17:59:09', 0),
(894, 133, '2013-09-05', '2013-09-05 11:23:54', 0),
(895, 1, '2013-09-05', '2013-09-05 11:23:56', 0),
(896, 1, '2013-09-07', '2013-09-07 19:31:18', 0),
(897, 128, '2013-09-07', '2013-09-07 19:33:17', 0),
(898, 132, '2013-09-07', '2013-09-07 19:33:27', 0),
(899, 132, '2013-09-07', '2013-09-07 19:33:31', 0),
(900, 128, '2013-09-10', '2013-09-10 15:22:09', 0),
(901, 132, '2013-09-10', '2013-09-10 15:41:39', 0),
(902, 1, '2013-09-10', '2013-09-10 17:26:36', 0),
(903, 134, '2013-09-10', '2013-09-10 18:46:39', 0),
(904, 129, '2013-09-10', '2013-09-10 20:21:54', 0),
(905, 133, '2013-09-11', '2013-09-10 23:23:19', 0),
(906, 109, '2013-09-11', '2013-09-10 23:50:41', 0),
(907, 127, '2013-09-11', '2013-09-11 01:19:02', 0),
(908, 1, '2013-09-11', '2013-09-11 19:28:00', 0),
(909, 1, '2013-09-12', '2013-09-11 22:13:50', 0),
(910, 1, '2013-09-12', '2013-09-12 09:10:06', 0),
(911, 1, '2013-09-13', '2013-09-13 14:51:37', 0),
(912, 1, '2013-09-15', '2013-09-15 01:46:22', 0),
(913, 1, '2013-09-16', '2013-09-16 02:47:57', 0),
(914, 1, '2013-09-18', '2013-09-18 08:53:23', 0),
(915, 1, '2013-09-18', '2013-09-18 09:09:28', 0),
(916, 1, '2013-09-20', '2013-09-20 00:28:49', 0),
(917, 1, '2013-09-20', '2013-09-20 11:54:41', 0),
(918, 1, '2013-09-22', '2013-09-22 14:12:19', 0),
(919, 127, '2013-09-22', '2013-09-22 14:12:22', 0),
(920, 134, '2013-09-22', '2013-09-22 14:12:24', 0),
(921, 129, '2013-09-22', '2013-09-22 14:12:26', 0),
(922, 130, '2013-09-22', '2013-09-22 14:12:28', 0),
(923, 1, '2013-09-23', '2013-09-23 20:55:56', 0),
(924, 1, '2013-09-24', '2013-09-24 10:41:38', 0),
(925, 1, '2013-09-24', '2013-09-24 15:19:03', 0),
(926, 130, '2013-09-24', '2013-09-24 17:42:00', 0),
(927, 1, '2013-09-24', '2013-09-24 18:32:29', 0),
(928, 133, '2013-09-25', '2013-09-25 16:34:15', 0),
(929, 109, '2013-09-26', '2013-09-26 17:02:57', 0),
(930, 109, '2013-09-26', '2013-09-26 17:03:17', 0),
(931, 128, '2013-09-29', '2013-09-29 02:52:41', 0),
(932, 132, '2013-09-29', '2013-09-29 03:01:36', 0),
(933, 132, '2013-09-29', '2013-09-29 03:01:53', 0),
(934, 132, '2013-09-29', '2013-09-29 03:02:03', 0),
(935, 132, '2013-09-29', '2013-09-29 03:21:50', 0),
(936, 132, '2013-09-29', '2013-09-29 03:42:04', 0),
(937, 132, '2013-09-29', '2013-09-29 04:02:27', 0),
(938, 132, '2013-09-29', '2013-09-29 04:21:09', 0),
(939, 132, '2013-09-29', '2013-09-29 04:42:00', 0),
(940, 1, '2013-09-29', '2013-09-29 04:53:45', 0),
(941, 134, '2013-09-29', '2013-09-29 06:24:19', 0),
(942, 129, '2013-09-29', '2013-09-29 07:19:19', 0),
(943, 109, '2013-09-29', '2013-09-29 08:24:58', 0),
(944, 127, '2013-09-29', '2013-09-29 09:39:30', 0),
(945, 1, '2013-10-03', '2013-10-03 14:17:06', 0),
(946, 1, '2013-10-06', '2013-10-05 22:14:30', 0),
(947, 1, '2013-10-07', '2013-10-07 10:43:02', 0),
(948, 1, '2013-10-07', '2013-10-07 17:42:23', 0),
(949, 1, '2013-10-08', '2013-10-08 14:47:45', 0),
(950, 1, '2013-10-09', '2013-10-09 07:01:49', 0),
(951, 130, '2013-10-09', '2013-10-09 07:12:31', 0),
(952, 1, '2013-10-11', '2013-10-11 20:36:38', 0),
(953, 1, '2013-10-13', '2013-10-13 13:00:12', 0),
(954, 1, '2013-10-14', '2013-10-14 13:33:45', 0),
(955, 1, '2013-10-15', '2013-10-15 01:38:27', 0),
(956, 128, '2013-10-15', '2013-10-15 12:40:26', 0),
(957, 132, '2013-10-15', '2013-10-15 13:41:22', 0),
(958, 1, '2013-10-15', '2013-10-15 13:47:58', 0),
(959, 134, '2013-10-15', '2013-10-15 14:56:59', 0),
(960, 129, '2013-10-15', '2013-10-15 15:26:24', 0),
(961, 109, '2013-10-15', '2013-10-15 16:27:26', 0),
(962, 127, '2013-10-15', '2013-10-15 17:18:07', 0),
(963, 132, '2013-10-15', '2013-10-15 17:40:57', 0),
(964, 128, '2013-10-16', '2013-10-15 22:42:13', 0),
(965, 1, '2013-10-17', '2013-10-17 20:39:26', 0),
(966, 1, '2013-10-20', '2013-10-20 00:03:36', 0),
(967, 1, '2013-10-20', '2013-10-20 00:03:37', 0),
(968, 1, '2013-10-20', '2013-10-20 00:03:44', 0),
(969, 1, '2013-10-20', '2013-10-20 00:03:50', 0),
(970, 1, '2013-10-20', '2013-10-20 00:03:52', 0),
(971, 1, '2013-10-20', '2013-10-20 02:11:45', 0),
(972, 1, '2013-10-20', '2013-10-20 02:12:14', 0),
(973, 1, '2013-10-24', '2013-10-24 08:54:07', 0),
(974, 1, '2013-10-24', '2013-10-24 08:54:13', 0),
(975, 1, '2013-10-24', '2013-10-24 09:06:36', 0),
(976, 1, '2013-10-24', '2013-10-24 09:06:40', 0),
(977, 130, '2013-10-24', '2013-10-24 19:58:47', 0),
(978, 1, '2013-10-26', '2013-10-26 03:07:00', 0),
(979, 1, '2013-10-26', '2013-10-26 10:13:50', 0),
(980, 109, '2013-10-28', '2013-10-28 02:05:18', 0),
(981, 1, '2013-10-29', '2013-10-29 19:29:36', 0),
(982, 1, '2013-10-30', '2013-10-30 10:47:02', 0),
(983, 1, '2013-10-30', '2013-10-30 15:31:49', 0),
(984, 1, '2013-10-30', '2013-10-30 15:31:49', 0),
(985, 1, '2013-10-30', '2013-10-30 15:31:50', 0),
(986, 1, '2013-10-30', '2013-10-30 15:31:50', 0),
(987, 1, '2013-10-30', '2013-10-30 22:32:32', 0),
(988, 1, '2013-10-30', '2013-10-30 22:32:32', 0),
(989, 1, '2013-10-30', '2013-10-30 22:32:33', 0),
(990, 1, '2013-10-30', '2013-10-30 22:32:34', 0),
(991, 1, '2013-10-30', '2013-10-30 22:49:21', 0),
(992, 1, '2013-10-30', '2013-10-30 22:49:21', 0),
(993, 1, '2013-10-30', '2013-10-30 22:49:22', 0),
(994, 1, '2013-10-30', '2013-10-30 22:49:22', 0),
(995, 1, '2013-10-31', '2013-10-31 06:34:43', 0),
(996, 1, '2013-10-31', '2013-10-31 06:34:43', 0),
(997, 1, '2013-10-31', '2013-10-31 06:34:44', 0),
(998, 1, '2013-10-31', '2013-10-31 06:34:44', 0),
(999, 1, '2013-10-31', '2013-10-31 06:37:57', 0),
(1000, 1, '2013-10-31', '2013-10-31 06:37:57', 0),
(1001, 1, '2013-10-31', '2013-10-31 06:37:57', 0),
(1002, 1, '2013-10-31', '2013-10-31 06:37:57', 0),
(1003, 1, '2013-11-01', '2013-11-01 19:35:18', 0),
(1004, 128, '2013-11-02', '2013-11-02 18:44:48', 0),
(1005, 132, '2013-11-02', '2013-11-02 18:55:20', 0),
(1006, 1, '2013-11-02', '2013-11-02 20:00:28', 0),
(1007, 134, '2013-11-02', '2013-11-02 21:19:38', 0),
(1008, 129, '2013-11-02', '2013-11-02 22:35:54', 0),
(1009, 109, '2013-11-03', '2013-11-02 23:39:46', 0),
(1010, 127, '2013-11-03', '2013-11-03 01:13:55', 0),
(1011, 1, '2013-11-03', '2013-11-03 03:59:58', 0),
(1012, 1, '2013-11-04', '2013-11-04 15:32:19', 0),
(1013, 130, '2013-11-05', '2013-11-05 21:31:00', 0),
(1014, 1, '2013-11-12', '2013-11-12 07:19:25', 0),
(1015, 1, '2013-11-12', '2013-11-12 07:19:41', 0),
(1016, 109, '2013-11-12', '2013-11-12 07:32:24', 0),
(1017, 109, '2013-11-12', '2013-11-12 07:32:30', 0),
(1018, 109, '2013-11-12', '2013-11-12 07:32:36', 0),
(1019, 109, '2013-11-12', '2013-11-12 07:32:43', 0),
(1020, 1, '2013-11-12', '2013-11-12 07:33:21', 0),
(1021, 109, '2013-11-12', '2013-11-12 07:33:25', 0);
INSERT INTO `PageStatistics` (`pstID`, `cID`, `date`, `timestamp`, `uID`) VALUES
(1022, 109, '2013-11-12', '2013-11-12 07:33:31', 0),
(1023, 109, '2013-11-12', '2013-11-12 07:33:55', 0),
(1024, 109, '2013-11-12', '2013-11-12 07:39:30', 0),
(1025, 109, '2013-11-12', '2013-11-12 07:39:42', 0),
(1026, 109, '2013-11-12', '2013-11-12 07:39:42', 0),
(1027, 109, '2013-11-12', '2013-11-12 07:41:49', 0),
(1028, 109, '2013-11-12', '2013-11-12 07:41:56', 0),
(1029, 109, '2013-11-12', '2013-11-12 07:42:06', 0),
(1030, 1, '2013-11-12', '2013-11-12 07:42:07', 1),
(1031, 104, '2013-11-12', '2013-11-12 07:42:16', 1),
(1032, 2, '2013-11-12', '2013-11-12 07:45:12', 1),
(1033, 49, '2013-11-12', '2013-11-12 07:45:17', 1),
(1034, 49, '2013-11-12', '2013-11-12 07:45:31', 1),
(1035, 109, '2013-11-12', '2013-11-12 07:46:47', 1),
(1036, 1, '2013-11-12', '2013-11-12 07:46:48', 1),
(1037, 46, '2013-11-12', '2013-11-12 08:12:11', 1),
(1038, 46, '2013-11-12', '2013-11-12 08:12:24', 1),
(1039, 47, '2013-11-12', '2013-11-12 08:12:35', 1),
(1040, 46, '2013-11-12', '2013-11-12 08:12:41', 1),
(1041, 46, '2013-11-12', '2013-11-12 08:13:05', 1),
(1042, 46, '2013-11-12', '2013-11-12 08:13:41', 1),
(1043, 2, '2013-11-12', '2013-11-12 08:13:51', 1),
(1044, 49, '2013-11-12', '2013-11-12 08:13:58', 1),
(1045, 2, '2013-11-12', '2013-11-12 09:09:38', 1),
(1046, 47, '2013-11-12', '2013-11-12 09:10:30', 1),
(1047, 46, '2013-11-12', '2013-11-12 09:10:36', 1),
(1048, 2, '2013-11-12', '2013-11-12 09:10:47', 1),
(1049, 28, '2013-11-12', '2013-11-12 09:10:51', 1),
(1050, 50, '2013-11-12', '2013-11-12 09:11:05', 1),
(1051, 28, '2013-11-12', '2013-11-12 09:11:47', 1),
(1052, 47, '2013-11-12', '2013-11-12 09:11:54', 1),
(1053, 2, '2013-11-12', '2013-11-12 09:11:58', 1),
(1054, 46, '2013-11-12', '2013-11-12 09:12:01', 1),
(1055, 46, '2013-11-12', '2013-11-12 09:12:09', 1),
(1056, 46, '2013-11-12', '2013-11-12 09:12:10', 1),
(1057, 2, '2013-11-12', '2013-11-12 09:12:18', 1),
(1058, 28, '2013-11-12', '2013-11-12 09:12:22', 1),
(1059, 28, '2013-11-12', '2013-11-12 09:12:26', 1),
(1060, 28, '2013-11-12', '2013-11-12 09:12:29', 1),
(1061, 2, '2013-11-12', '2013-11-12 09:13:33', 1),
(1062, 109, '2013-11-12', '2013-11-12 09:13:36', 1),
(1063, 1, '2013-11-12', '2013-11-12 09:13:37', 0),
(1064, 1, '2013-11-12', '2013-11-12 09:13:45', 0),
(1065, 1, '2013-11-12', '2013-11-12 09:13:51', 0),
(1066, 1, '2013-11-12', '2013-11-12 09:14:28', 0),
(1067, 109, '2013-11-12', '2013-11-12 09:14:40', 0),
(1068, 109, '2013-11-12', '2013-11-12 09:14:45', 0),
(1069, 2, '2013-11-12', '2013-11-12 09:14:46', 1),
(1070, 7, '2013-11-12', '2013-11-12 09:14:50', 1),
(1071, 1, '2013-11-12', '2013-11-12 09:35:39', 0),
(1072, 2, '2013-11-12', '2013-11-12 09:35:47', 1),
(1073, 7, '2013-11-12', '2013-11-12 09:36:07', 1),
(1074, 6, '2013-11-12', '2013-11-12 09:36:23', 1),
(1075, 7, '2013-11-12', '2013-11-12 09:36:23', 1),
(1076, 1, '2013-11-12', '2013-11-12 09:36:53', 0),
(1077, 1, '2013-11-12', '2013-11-12 09:37:03', 0),
(1078, 2, '2013-11-12', '2013-11-12 09:37:19', 1),
(1079, 28, '2013-11-12', '2013-11-12 09:37:24', 1),
(1080, 31, '2013-11-12', '2013-11-12 09:37:28', 1),
(1081, 1, '2013-11-12', '2013-11-12 09:37:45', 1),
(1082, 1, '2013-11-12', '2013-11-12 09:37:53', 0),
(1083, 1, '2013-11-12', '2013-11-12 09:38:18', 0),
(1084, 1, '2013-11-12', '2013-11-12 09:41:02', 1),
(1085, 1, '2013-11-12', '2013-11-12 09:41:05', 0),
(1086, 1, '2013-11-12', '2013-11-12 09:41:14', 1),
(1087, 1, '2013-11-12', '2013-11-12 09:44:34', 0),
(1088, 2, '2013-11-12', '2013-11-12 09:44:39', 1),
(1089, 2, '2013-11-12', '2013-11-12 09:44:40', 1),
(1090, 40, '2013-11-12', '2013-11-12 09:44:55', 1),
(1091, 40, '2013-11-12', '2013-11-12 09:44:59', 1),
(1092, 2, '2013-11-12', '2013-11-12 09:45:06', 1),
(1093, 51, '2013-11-12', '2013-11-12 09:45:16', 1),
(1094, 58, '2013-11-12', '2013-11-12 09:45:33', 1),
(1095, 58, '2013-11-12', '2013-11-12 09:45:38', 1),
(1096, 58, '2013-11-12', '2013-11-12 09:45:38', 1),
(1097, 51, '2013-11-12', '2013-11-12 09:45:45', 1),
(1098, 63, '2013-11-12', '2013-11-12 09:45:57', 1),
(1099, 63, '2013-11-12', '2013-11-12 09:46:00', 1),
(1100, 63, '2013-11-12', '2013-11-12 09:46:01', 1),
(1101, 51, '2013-11-12', '2013-11-12 09:46:06', 1),
(1102, 2, '2013-11-12', '2013-11-12 09:46:25', 1),
(1103, 28, '2013-11-12', '2013-11-12 09:46:31', 1),
(1104, 1, '2013-11-12', '2013-11-12 14:05:20', 0),
(1105, 1, '2013-11-13', '2013-11-13 11:45:23', 0),
(1106, 1, '2013-11-15', '2013-11-15 09:58:45', 0),
(1107, 1, '2013-11-19', '2013-11-19 00:51:04', 0),
(1108, 128, '2013-11-19', '2013-11-19 19:50:23', 0),
(1109, 1, '2013-11-19', '2013-11-19 22:03:11', 0),
(1110, 134, '2013-11-19', '2013-11-19 22:45:41', 0),
(1111, 129, '2013-11-20', '2013-11-19 23:39:23', 0),
(1112, 109, '2013-11-20', '2013-11-20 00:36:19', 0),
(1113, 127, '2013-11-20', '2013-11-20 01:59:05', 0),
(1114, 1, '2013-11-22', '2013-11-22 12:03:35', 0),
(1115, 1, '2013-11-24', '2013-11-24 00:47:58', 0),
(1116, 1, '2013-11-25', '2013-11-25 20:54:28', 1),
(1117, 104, '2013-11-25', '2013-11-25 20:54:34', 1),
(1118, 7, '2013-11-25', '2013-11-25 20:55:00', 1),
(1119, 6, '2013-11-25', '2013-11-25 20:56:07', 1),
(1120, 7, '2013-11-25', '2013-11-25 20:56:07', 1),
(1121, 139, '2013-11-25', '2013-11-25 20:56:19', 1),
(1122, 1, '2013-11-25', '2013-11-25 20:56:25', 1),
(1123, 28, '2013-11-25', '2013-11-25 20:56:39', 1),
(1124, 31, '2013-11-25', '2013-11-25 20:56:47', 1),
(1125, 31, '2013-11-25', '2013-11-25 20:56:54', 1),
(1126, 31, '2013-11-25', '2013-11-25 20:56:54', 1),
(1127, 2, '2013-11-25', '2013-11-25 20:57:10', 1),
(1128, 28, '2013-11-25', '2013-11-25 20:57:19', 1),
(1129, 30, '2013-11-25', '2013-11-25 20:57:26', 1),
(1130, 28, '2013-11-25', '2013-11-25 20:57:49', 1),
(1131, 28, '2013-11-25', '2013-11-25 20:58:06', 1),
(1132, 28, '2013-11-25', '2013-11-25 20:58:06', 1),
(1133, 1, '2013-11-25', '2013-11-25 20:58:24', 0),
(1134, 1, '2013-11-25', '2013-11-25 20:58:32', 0),
(1135, 7, '2013-11-25', '2013-11-25 20:58:38', 1),
(1136, 1, '2013-11-25', '2013-11-25 20:58:43', 1),
(1137, 1, '2013-11-25', '2013-11-25 20:58:48', 1),
(1138, 2, '2013-11-25', '2013-11-25 20:59:44', 1),
(1139, 35, '2013-11-25', '2013-11-25 20:59:49', 1),
(1140, 35, '2013-11-25', '2013-11-25 21:00:09', 1),
(1141, 35, '2013-11-25', '2013-11-25 21:00:10', 1),
(1142, 35, '2013-11-25', '2013-11-25 21:00:23', 1),
(1143, 35, '2013-11-25', '2013-11-25 21:00:24', 1),
(1144, 7, '2013-11-25', '2013-11-25 21:00:35', 1),
(1145, 139, '2013-11-25', '2013-11-25 21:00:43', 1),
(1146, 139, '2013-11-25', '2013-11-25 21:00:55', 1),
(1147, 139, '2013-11-25', '2013-11-25 21:03:01', 1),
(1148, 139, '2013-11-25', '2013-11-25 21:03:05', 1),
(1149, 1, '2013-11-25', '2013-11-25 21:03:09', 0),
(1150, 1, '2013-11-25', '2013-11-25 21:03:11', 0),
(1151, 1, '2013-11-25', '2013-11-25 21:03:13', 0),
(1152, 7, '2013-11-25', '2013-11-25 21:04:42', 1),
(1153, 1, '2013-11-25', '2013-11-25 21:04:57', 1),
(1154, 1, '2013-11-25', '2013-11-25 21:05:00', 1),
(1155, 1, '2013-11-25', '2013-11-25 21:05:33', 1),
(1156, 1, '2013-11-25', '2013-11-25 21:05:36', 0),
(1157, 1, '2013-11-25', '2013-11-25 21:05:50', 1),
(1158, 118, '2013-11-25', '2013-11-25 21:06:48', 1),
(1159, 2, '2013-11-25', '2013-11-25 21:08:02', 1),
(1160, 7, '2013-11-25', '2013-11-25 21:08:04', 1),
(1161, 2, '2013-11-25', '2013-11-25 21:08:20', 1),
(1162, 40, '2013-11-25', '2013-11-25 21:08:28', 1),
(1163, 40, '2013-11-25', '2013-11-25 21:08:34', 1),
(1164, 135, '2013-11-25', '2013-11-25 21:08:55', 1),
(1165, 40, '2013-11-25', '2013-11-25 21:08:55', 1),
(1166, 2, '2013-11-25', '2013-11-25 21:08:58', 1),
(1167, 7, '2013-11-25', '2013-11-25 21:09:00', 1),
(1168, 1, '2013-11-25', '2013-11-25 21:09:03', 1),
(1169, 1, '2013-11-25', '2013-11-25 21:09:06', 1),
(1170, 1, '2013-11-25', '2013-11-25 21:09:41', 1),
(1171, 1, '2013-11-25', '2013-11-25 21:09:51', 1),
(1172, 1, '2013-11-25', '2013-11-25 21:10:13', 1),
(1173, 1, '2013-11-25', '2013-11-25 21:10:28', 1),
(1174, 40, '2013-11-25', '2013-11-25 21:10:33', 1),
(1175, 1, '2013-11-25', '2013-11-25 21:10:38', 1),
(1176, 2, '2013-11-25', '2013-11-25 21:11:48', 1),
(1177, 34, '2013-11-25', '2013-11-25 21:11:53', 1),
(1178, 34, '2013-11-25', '2013-11-25 21:11:57', 1),
(1179, 2, '2013-11-25', '2013-11-25 21:12:06', 1),
(1180, 8, '2013-11-25', '2013-11-25 21:12:11', 1),
(1181, 2, '2013-11-25', '2013-11-25 21:12:14', 1),
(1182, 32, '2013-11-25', '2013-11-25 21:12:24', 1),
(1183, 32, '2013-11-25', '2013-11-25 21:12:29', 1),
(1184, 2, '2013-11-25', '2013-11-25 21:12:40', 1),
(1185, 37, '2013-11-25', '2013-11-25 21:12:53', 1),
(1186, 2, '2013-11-25', '2013-11-25 21:12:56', 1),
(1187, 51, '2013-11-25', '2013-11-25 21:13:02', 1),
(1188, 91, '2013-11-25', '2013-11-25 21:13:28', 1),
(1189, 91, '2013-11-25', '2013-11-25 21:13:29', 1),
(1190, 53, '2013-11-25', '2013-11-25 21:13:54', 1),
(1191, 58, '2013-11-25', '2013-11-25 21:14:02', 1),
(1192, 54, '2013-11-25', '2013-11-25 21:14:04', 1),
(1193, 21, '2013-11-25', '2013-11-25 21:14:49', 1),
(1194, 18, '2013-11-25', '2013-11-25 21:14:51', 1),
(1195, 109, '2013-11-25', '2013-11-25 21:15:24', 1),
(1196, 7, '2013-11-25', '2013-11-25 21:15:57', 1),
(1197, 1, '2013-11-25', '2013-11-25 21:16:04', 1),
(1198, 1, '2013-11-25', '2013-11-25 21:16:47', 1),
(1199, 1, '2013-11-25', '2013-11-25 21:16:52', 1),
(1200, 109, '2013-11-25', '2013-11-25 21:17:06', 1),
(1201, 1, '2013-11-25', '2013-11-25 21:17:06', 0),
(1202, 1, '2013-11-25', '2013-11-25 21:17:25', 0),
(1203, 1, '2013-11-25', '2013-11-25 21:22:56', 0),
(1204, 1, '2013-11-25', '2013-11-25 21:22:58', 0),
(1205, 1, '2013-11-25', '2013-11-25 21:22:59', 0),
(1206, 109, '2013-11-25', '2013-11-25 21:23:06', 0),
(1207, 109, '2013-11-25', '2013-11-25 21:23:10', 0),
(1208, 109, '2013-11-25', '2013-11-25 21:23:20', 0),
(1209, 109, '2013-11-25', '2013-11-25 21:23:30', 0),
(1210, 109, '2013-11-25', '2013-11-25 21:23:35', 0),
(1211, 1, '2013-11-25', '2013-11-25 21:23:43', 0),
(1212, 1, '2013-11-25', '2013-11-25 21:23:58', 0),
(1213, 1, '2013-11-25', '2013-11-25 21:24:07', 0),
(1214, 109, '2013-11-25', '2013-11-25 21:24:17', 0),
(1215, 109, '2013-11-25', '2013-11-25 21:24:27', 0),
(1216, 109, '2013-11-25', '2013-11-25 21:24:37', 0),
(1217, 1, '2013-11-25', '2013-11-25 21:24:38', 1),
(1218, 1, '2013-11-25', '2013-11-25 21:36:32', 0),
(1219, 1, '2013-11-25', '2013-11-25 21:53:07', 0),
(1220, 1, '2013-11-26', '2013-11-26 22:18:56', 0),
(1221, 1, '2013-11-26', '2013-11-26 22:18:56', 0),
(1222, 1, '2013-11-26', '2013-11-26 22:18:56', 0),
(1223, 1, '2013-11-26', '2013-11-26 22:38:31', 0),
(1224, 1, '2013-11-27', '2013-11-27 12:41:41', 1),
(1225, 104, '2013-11-27', '2013-11-27 12:41:45', 1),
(1226, 1, '2013-11-27', '2013-11-27 12:41:50', 1),
(1227, 1, '2013-12-02', '2013-12-01 23:06:59', 0),
(1228, 1, '2013-12-05', '2013-12-05 08:13:47', 1),
(1229, 104, '2013-12-05', '2013-12-05 08:13:52', 1),
(1230, 2, '2013-12-05', '2013-12-05 08:15:32', 1),
(1231, 1, '2013-12-07', '2013-12-07 02:40:06', 0),
(1232, 1, '2013-12-07', '2013-12-07 04:45:58', 0),
(1233, 1, '2013-12-09', '2013-12-09 06:30:15', 0),
(1234, 1, '2013-12-09', '2013-12-09 16:04:03', 0),
(1235, 1, '2013-12-16', '2013-12-16 05:24:44', 0),
(1236, 1, '2013-12-17', '2013-12-17 13:17:08', 0),
(1237, 1, '2013-12-17', '2013-12-17 13:17:09', 0),
(1238, 1, '2013-12-18', '2013-12-18 20:08:25', 0),
(1239, 1, '2013-12-20', '2013-12-20 01:00:21', 0),
(1240, 1, '2013-12-21', '2013-12-20 23:59:37', 0),
(1241, 1, '2013-12-22', '2013-12-22 00:01:32', 0),
(1242, 1, '2013-12-23', '2013-12-23 17:24:37', 0),
(1243, 2, '2013-12-29', '2013-12-29 09:11:34', 1),
(1244, 104, '2013-12-29', '2013-12-29 09:11:47', 1),
(1245, 1, '2013-12-29', '2013-12-29 09:13:29', 1),
(1246, 1, '2013-12-31', '2013-12-31 20:34:15', 1),
(1247, 104, '2013-12-31', '2013-12-31 20:34:20', 1),
(1248, 1, '2013-12-31', '2013-12-31 20:34:41', 1),
(1249, 2, '2013-12-31', '2013-12-31 20:41:12', 1),
(1250, 1, '2013-12-31', '2013-12-31 20:41:48', 0),
(1251, 28, '2013-12-31', '2013-12-31 20:42:05', 1),
(1252, 31, '2013-12-31', '2013-12-31 20:42:10', 1),
(1253, 31, '2013-12-31', '2013-12-31 20:43:23', 1),
(1254, 31, '2013-12-31', '2013-12-31 20:43:23', 1),
(1255, 1, '2013-12-31', '2013-12-31 20:43:25', 0),
(1256, 30, '2013-12-31', '2013-12-31 20:43:36', 1),
(1257, 28, '2013-12-31', '2013-12-31 20:43:36', 1),
(1258, 1, '2013-12-31', '2013-12-31 20:45:08', 1),
(1259, 2, '2013-12-31', '2013-12-31 20:45:10', 1),
(1260, 40, '2013-12-31', '2013-12-31 20:45:30', 1),
(1261, 1, '2013-12-31', '2013-12-31 20:45:38', 1),
(1262, 1, '2013-12-31', '2013-12-31 20:45:42', 1),
(1263, 2, '2013-12-31', '2013-12-31 20:46:03', 1),
(1264, 7, '2013-12-31', '2013-12-31 20:46:06', 1),
(1265, 6, '2013-12-31', '2013-12-31 20:46:44', 1),
(1266, 7, '2013-12-31', '2013-12-31 20:46:44', 1),
(1267, 1, '2013-12-31', '2013-12-31 20:46:48', 1),
(1268, 1, '2013-12-31', '2013-12-31 20:46:50', 1),
(1269, 55, '2013-12-31', '2013-12-31 20:47:01', 1),
(1270, 1, '2013-12-31', '2013-12-31 20:47:43', 0),
(1271, 1, '2013-12-31', '2013-12-31 20:47:48', 0),
(1272, 1, '2013-12-31', '2013-12-31 20:48:19', 1),
(1273, 1, '2013-12-31', '2013-12-31 20:48:20', 1),
(1274, 1, '2013-12-31', '2013-12-31 20:48:42', 0),
(1275, 1, '2013-12-31', '2013-12-31 20:48:49', 0),
(1276, 1, '2013-12-31', '2013-12-31 20:49:00', 0),
(1277, 1, '2013-12-31', '2013-12-31 20:49:10', 1),
(1278, 1, '2013-12-31', '2013-12-31 20:49:14', 1),
(1279, 109, '2013-12-31', '2013-12-31 20:49:16', 1),
(1280, 1, '2013-12-31', '2013-12-31 20:49:16', 0),
(1281, 1, '2013-12-31', '2013-12-31 20:49:18', 0),
(1282, 1, '2013-12-31', '2013-12-31 20:49:25', 0),
(1283, 1, '2014-01-01', '2014-01-01 08:08:11', 0),
(1284, 1, '2014-01-01', '2014-01-01 16:47:39', 0),
(1285, 1, '2014-01-01', '2014-01-01 16:50:01', 0),
(1286, 1, '2014-01-02', '2014-01-02 16:58:24', 0),
(1287, 109, '2014-01-02', '2014-01-02 16:58:44', 0),
(1288, 109, '2014-01-02', '2014-01-02 16:58:47', 0),
(1289, 109, '2014-01-02', '2014-01-02 16:59:02', 0),
(1290, 109, '2014-01-02', '2014-01-02 16:59:09', 0),
(1291, 109, '2014-01-02', '2014-01-02 16:59:13', 0),
(1292, 109, '2014-01-02', '2014-01-02 16:59:16', 0),
(1293, 1, '2014-01-02', '2014-01-02 16:59:18', 1),
(1294, 104, '2014-01-02', '2014-01-02 16:59:19', 1),
(1295, 1, '2014-01-02', '2014-01-02 16:59:31', 1),
(1296, 118, '2014-01-02', '2014-01-02 17:02:00', 1),
(1297, 118, '2014-01-02', '2014-01-02 17:02:05', 1),
(1298, 118, '2014-01-02', '2014-01-02 17:02:13', 1),
(1299, 118, '2014-01-02', '2014-01-02 17:02:20', 1),
(1300, 118, '2014-01-02', '2014-01-02 17:02:41', 1),
(1301, 118, '2014-01-02', '2014-01-02 17:02:42', 1),
(1302, 1, '2014-01-02', '2014-01-02 17:03:03', 1),
(1303, 1, '2014-01-02', '2014-01-02 17:03:24', 1),
(1304, 40, '2014-01-02', '2014-01-02 17:03:32', 1),
(1305, 40, '2014-01-02', '2014-01-02 17:03:43', 1),
(1306, 40, '2014-01-02', '2014-01-02 17:03:43', 1),
(1307, 1, '2014-01-02', '2014-01-02 17:03:46', 1),
(1308, 118, '2014-01-02', '2014-01-02 17:04:07', 1),
(1309, 118, '2014-01-02', '2014-01-02 17:04:20', 1),
(1310, 1, '2014-01-02', '2014-01-02 17:06:01', 1),
(1311, 1, '2014-01-02', '2014-01-02 17:06:24', 1),
(1312, 109, '2014-01-02', '2014-01-02 17:09:54', 1),
(1313, 1, '2014-01-02', '2014-01-02 17:09:54', 0),
(1314, 1, '2014-01-03', '2014-01-03 13:52:03', 0),
(1315, 1, '2014-01-05', '2014-01-05 00:17:01', 0),
(1316, 1, '2014-01-05', '2014-01-05 05:01:06', 0),
(1317, 1, '2014-01-09', '2014-01-09 17:40:15', 0),
(1318, 1, '2014-01-12', '2014-01-12 08:11:47', 0),
(1319, 1, '2014-01-12', '2014-01-12 08:11:47', 0),
(1320, 1, '2014-01-12', '2014-01-12 08:12:34', 0),
(1321, 1, '2014-01-12', '2014-01-12 08:12:36', 0),
(1322, 1, '2014-01-12', '2014-01-12 12:47:05', 0),
(1323, 1, '2014-01-13', '2014-01-13 13:56:10', 0),
(1324, 1, '2014-01-14', '2014-01-13 23:20:51', 0),
(1325, 1, '2014-01-14', '2014-01-13 23:20:53', 0),
(1326, 1, '2014-01-14', '2014-01-13 23:20:53', 0),
(1327, 1, '2014-01-15', '2014-01-15 07:11:13', 0),
(1328, 1, '2014-01-15', '2014-01-15 14:09:28', 0),
(1329, 1, '2014-01-18', '2014-01-18 03:18:40', 0),
(1330, 1, '2014-01-22', '2014-01-22 14:20:19', 0),
(1331, 1, '2014-01-24', '2014-01-24 01:04:48', 0),
(1332, 1, '2014-01-24', '2014-01-24 13:15:51', 0),
(1333, 1, '2014-01-24', '2014-01-24 13:17:54', 0),
(1334, 1, '2014-01-24', '2014-01-24 17:50:49', 0),
(1335, 1, '2014-01-24', '2014-01-24 17:51:27', 0),
(1336, 1, '2014-01-24', '2014-01-24 17:52:31', 0),
(1337, 1, '2014-01-24', '2014-01-24 17:52:36', 0),
(1338, 1, '2014-01-24', '2014-01-24 17:52:38', 0),
(1339, 1, '2014-01-25', '2014-01-25 20:35:43', 0),
(1340, 1, '2014-01-25', '2014-01-25 20:35:44', 0),
(1341, 1, '2014-01-26', '2014-01-25 23:15:04', 0),
(1342, 1, '2014-01-26', '2014-01-26 11:58:29', 0),
(1343, 1, '2014-01-29', '2014-01-29 16:19:32', 0),
(1344, 1, '2014-01-29', '2014-01-29 16:19:32', 0),
(1345, 1, '2014-01-31', '2014-01-31 02:04:58', 0),
(1346, 1, '2014-02-03', '2014-02-03 09:17:53', 0),
(1347, 1, '2014-02-09', '2014-02-09 06:05:37', 0),
(1348, 1, '2014-02-09', '2014-02-09 07:02:35', 0),
(1349, 1, '2014-02-09', '2014-02-09 16:30:29', 0),
(1350, 1, '2014-02-11', '2014-02-11 10:31:00', 0),
(1351, 1, '2014-02-13', '2014-02-13 04:10:05', 0),
(1352, 1, '2014-02-14', '2014-02-14 15:38:12', 0),
(1353, 1, '2014-02-15', '2014-02-15 00:27:14', 0),
(1354, 1, '2014-02-21', '2014-02-21 13:08:05', 0),
(1355, 1, '2014-02-22', '2014-02-22 08:21:04', 0),
(1356, 1, '2014-02-25', '2014-02-25 04:35:08', 0),
(1357, 1, '2014-02-25', '2014-02-25 12:15:33', 0),
(1358, 1, '2014-02-25', '2014-02-25 12:16:12', 0),
(1359, 1, '2014-02-25', '2014-02-25 12:16:31', 0),
(1360, 1, '2014-02-25', '2014-02-25 12:17:19', 0),
(1361, 1, '2014-02-25', '2014-02-25 12:17:20', 0),
(1362, 1, '2014-02-26', '2014-02-26 05:33:09', 0),
(1363, 1, '2014-03-03', '2014-03-03 04:48:40', 0),
(1364, 1, '2014-03-06', '2014-03-06 06:40:10', 0),
(1365, 1, '2014-03-09', '2014-03-09 22:53:07', 0),
(1366, 1, '2014-03-10', '2014-03-10 18:42:09', 0),
(1367, 1, '2014-03-11', '2014-03-11 03:10:36', 0),
(1368, 1, '2014-03-12', '2014-03-12 00:16:44', 0),
(1369, 1, '2014-03-13', '2014-03-13 16:01:34', 0),
(1370, 1, '2014-03-13', '2014-03-13 16:01:34', 0),
(1371, 1, '2014-03-14', '2014-03-14 05:27:13', 0),
(1372, 1, '2014-03-21', '2014-03-21 08:46:23', 0),
(1373, 1, '2014-03-24', '2014-03-24 05:40:53', 0),
(1374, 1, '2014-03-24', '2014-03-24 12:04:11', 0),
(1375, 1, '2014-03-28', '2014-03-28 04:21:15', 0),
(1376, 1, '2014-03-31', '2014-03-31 20:24:49', 0),
(1377, 1, '2014-04-01', '2014-03-31 23:21:51', 0),
(1378, 1, '2014-04-08', '2014-04-08 06:13:39', 0),
(1379, 1, '2014-04-11', '2014-04-11 14:13:02', 0),
(1380, 1, '2014-04-11', '2014-04-11 19:15:47', 0),
(1381, 1, '2014-04-14', '2014-04-14 18:24:04', 0),
(1382, 1, '2014-04-16', '2014-04-16 18:19:53', 0),
(1383, 1, '2014-04-19', '2014-04-19 12:20:45', 0),
(1384, 1, '2014-04-19', '2014-04-19 15:03:00', 0),
(1385, 1, '2014-04-20', '2014-04-19 22:34:01', 0),
(1386, 1, '2014-04-21', '2014-04-20 23:01:37', 0),
(1387, 1, '2014-04-23', '2014-04-23 21:01:26', 0),
(1388, 1, '2014-04-26', '2014-04-26 09:15:48', 0),
(1389, 1, '2014-05-01', '2014-05-01 07:36:25', 0),
(1390, 1, '2014-05-03', '2014-05-03 05:21:04', 0),
(1391, 1, '2014-05-03', '2014-05-03 14:00:47', 0),
(1392, 1, '2014-05-03', '2014-05-03 19:46:56', 0),
(1393, 1, '2014-05-04', '2014-05-04 17:33:03', 0),
(1394, 109, '2014-05-05', '2014-05-05 18:13:22', 0),
(1395, 1, '2014-05-05', '2014-05-05 18:49:11', 0),
(1396, 1, '2014-05-07', '2014-05-07 13:08:30', 0),
(1397, 1, '2014-05-11', '2014-05-10 22:46:11', 0),
(1398, 1, '2014-05-11', '2014-05-11 20:16:50', 0),
(1399, 1, '2014-05-13', '2014-05-13 18:45:56', 0),
(1400, 1, '2014-05-13', '2014-05-13 18:45:56', 0),
(1401, 1, '2014-05-13', '2014-05-13 18:46:14', 0),
(1402, 1, '2014-05-13', '2014-05-13 18:46:25', 0),
(1403, 1, '2014-05-14', '2014-05-14 04:49:41', 0),
(1404, 1, '2014-05-15', '2014-05-15 20:58:04', 0),
(1405, 1, '2014-05-16', '2014-05-16 17:50:36', 0),
(1406, 1, '2014-05-19', '2014-05-19 07:45:37', 0),
(1407, 1, '2014-05-19', '2014-05-19 17:54:53', 0),
(1408, 1, '2014-05-22', '2014-05-22 19:30:32', 0),
(1409, 1, '2014-05-22', '2014-05-22 19:30:35', 0),
(1410, 1, '2014-05-24', '2014-05-24 07:02:23', 0),
(1411, 1, '2014-05-26', '2014-05-25 22:03:32', 0),
(1412, 1, '2014-05-27', '2014-05-27 10:20:41', 0),
(1413, 1, '2014-05-27', '2014-05-27 10:46:42', 0),
(1414, 1, '2014-05-27', '2014-05-27 20:28:59', 0),
(1415, 1, '2014-06-02', '2014-06-02 21:05:56', 0),
(1416, 1, '2014-06-03', '2014-06-03 03:13:02', 0),
(1417, 1, '2014-06-03', '2014-06-03 21:06:15', 0),
(1418, 1, '2014-06-04', '2014-06-04 10:16:27', 0),
(1419, 1, '2014-06-04', '2014-06-04 10:16:27', 0),
(1420, 1, '2014-06-06', '2014-06-06 14:27:38', 0),
(1421, 1, '2014-06-08', '2014-06-08 21:13:48', 0),
(1422, 1, '2014-06-10', '2014-06-09 23:11:20', 0),
(1423, 109, '2014-06-13', '2014-06-13 17:40:26', 0),
(1424, 1, '2014-06-16', '2014-06-16 00:17:42', 0),
(1425, 1, '2014-06-16', '2014-06-16 07:11:21', 0),
(1426, 1, '2014-06-17', '2014-06-16 23:26:03', 0),
(1427, 1, '2014-06-17', '2014-06-17 19:06:04', 0),
(1428, 1, '2014-06-18', '2014-06-18 06:09:30', 0),
(1429, 1, '2014-06-18', '2014-06-18 12:07:11', 0),
(1430, 1, '2014-06-19', '2014-06-19 00:22:44', 0),
(1431, 1, '2014-06-19', '2014-06-19 11:00:48', 0),
(1432, 1, '2014-06-21', '2014-06-20 22:49:10', 0),
(1433, 1, '2014-06-24', '2014-06-23 23:32:59', 0),
(1434, 1, '2014-06-24', '2014-06-23 23:32:59', 0),
(1435, 1, '2014-06-24', '2014-06-23 23:33:52', 0),
(1436, 1, '2014-06-24', '2014-06-24 10:33:01', 0),
(1437, 109, '2014-06-24', '2014-06-24 15:22:28', 0),
(1438, 1, '2014-06-25', '2014-06-24 22:10:45', 0),
(1439, 1, '2014-07-02', '2014-07-02 07:14:08', 0),
(1440, 1, '2014-07-03', '2014-07-03 00:09:04', 0),
(1441, 1, '2014-07-03', '2014-07-03 12:25:26', 0),
(1442, 1, '2014-07-08', '2014-07-08 21:09:00', 0),
(1443, 109, '2014-07-09', '2014-07-08 22:55:50', 0),
(1444, 1, '2014-07-10', '2014-07-09 23:04:05', 0),
(1445, 1, '2014-07-11', '2014-07-11 00:37:25', 0),
(1446, 1, '2014-07-11', '2014-07-11 00:42:17', 0),
(1447, 1, '2014-07-11', '2014-07-11 05:03:24', 0),
(1448, 1, '2014-07-11', '2014-07-11 18:16:45', 0),
(1449, 1, '2014-07-12', '2014-07-12 15:07:06', 0),
(1450, 1, '2014-07-13', '2014-07-13 11:10:32', 0),
(1451, 1, '2014-07-13', '2014-07-13 20:07:33', 0),
(1452, 1, '2014-07-14', '2014-07-14 21:12:18', 0),
(1453, 1, '2014-07-16', '2014-07-16 03:11:18', 0),
(1454, 1, '2014-07-16', '2014-07-16 03:11:18', 0),
(1455, 1, '2014-07-16', '2014-07-16 03:11:18', 0),
(1456, 1, '2014-07-16', '2014-07-16 03:11:19', 0),
(1457, 1, '2014-07-16', '2014-07-16 11:34:47', 0),
(1458, 1, '2014-07-16', '2014-07-16 11:35:00', 0),
(1459, 1, '2014-07-16', '2014-07-16 11:35:16', 0),
(1460, 1, '2014-07-17', '2014-07-17 18:56:26', 0),
(1461, 1, '2014-07-18', '2014-07-18 06:46:03', 0),
(1462, 1, '2014-07-18', '2014-07-18 07:23:26', 0),
(1463, 1, '2014-07-18', '2014-07-18 21:31:25', 0),
(1464, 1, '2014-07-19', '2014-07-18 22:41:28', 0),
(1465, 1, '2014-07-19', '2014-07-19 11:23:42', 0),
(1466, 1, '2014-07-20', '2014-07-20 21:03:17', 0),
(1467, 1, '2014-07-21', '2014-07-21 20:02:44', 0),
(1468, 1, '2014-07-22', '2014-07-22 09:49:38', 0),
(1469, 1, '2014-07-22', '2014-07-22 10:04:11', 0),
(1470, 1, '2014-07-24', '2014-07-23 22:59:21', 0),
(1471, 1, '2014-07-24', '2014-07-24 12:04:35', 0),
(1472, 1, '2014-07-26', '2014-07-26 07:33:55', 0),
(1473, 1, '2014-07-26', '2014-07-26 07:34:50', 0),
(1474, 1, '2014-07-26', '2014-07-26 07:35:09', 0),
(1475, 1, '2014-07-26', '2014-07-26 20:58:27', 0),
(1476, 1, '2014-07-29', '2014-07-29 21:48:22', 0),
(1477, 1, '2014-07-31', '2014-07-31 18:13:40', 0),
(1478, 1, '2014-08-02', '2014-08-02 08:31:52', 0),
(1479, 1, '2014-08-03', '2014-08-03 10:21:03', 0),
(1480, 1, '2014-08-04', '2014-08-03 22:26:47', 0),
(1481, 1, '2014-08-04', '2014-08-03 22:53:32', 0),
(1482, 1, '2014-08-05', '2014-08-05 21:00:25', 0),
(1483, 1, '2014-08-07', '2014-08-07 19:34:23', 0),
(1484, 1, '2014-08-08', '2014-08-08 17:04:17', 0),
(1485, 1, '2014-08-12', '2014-08-12 10:57:37', 0),
(1486, 1, '2014-08-13', '2014-08-13 02:33:29', 0),
(1487, 1, '2014-08-13', '2014-08-13 08:44:11', 0),
(1488, 1, '2014-08-13', '2014-08-13 11:10:38', 0),
(1489, 1, '2014-08-13', '2014-08-13 14:42:43', 0),
(1490, 1, '2014-08-14', '2014-08-14 11:31:55', 0),
(1491, 1, '2014-08-16', '2014-08-16 05:54:23', 0),
(1492, 1, '2014-08-18', '2014-08-18 08:13:20', 0),
(1493, 1, '2014-08-18', '2014-08-18 08:13:44', 0),
(1494, 1, '2014-08-18', '2014-08-18 08:14:24', 0),
(1495, 1, '2014-08-20', '2014-08-19 22:09:25', 0),
(1496, 1, '2014-08-20', '2014-08-19 23:08:15', 0),
(1497, 1, '2014-08-23', '2014-08-23 02:46:39', 0),
(1498, 1, '2014-08-23', '2014-08-23 07:46:55', 0),
(1499, 1, '2014-08-23', '2014-08-23 12:05:58', 0),
(1500, 1, '2014-08-23', '2014-08-23 14:10:56', 0),
(1501, 1, '2014-08-24', '2014-08-24 03:43:19', 0),
(1502, 1, '2014-08-24', '2014-08-24 08:17:20', 0),
(1503, 1, '2014-08-24', '2014-08-24 09:07:19', 0),
(1504, 1, '2014-08-24', '2014-08-24 12:23:24', 0),
(1505, 1, '2014-08-24', '2014-08-24 17:08:40', 0),
(1506, 1, '2014-08-25', '2014-08-25 08:44:09', 0),
(1507, 1, '2014-08-25', '2014-08-25 14:34:38', 0),
(1508, 1, '2014-08-26', '2014-08-26 08:45:33', 0),
(1509, 1, '2014-08-28', '2014-08-28 14:52:07', 0),
(1510, 1, '2014-08-28', '2014-08-28 16:09:37', 0),
(1511, 1, '2014-08-28', '2014-08-28 16:30:02', 0),
(1512, 1, '2014-08-30', '2014-08-30 18:01:20', 0),
(1513, 1, '2014-08-31', '2014-08-31 00:04:54', 0),
(1514, 1, '2014-08-31', '2014-08-31 09:46:22', 0),
(1515, 1, '2014-08-31', '2014-08-31 15:24:43', 0),
(1516, 1, '2014-08-31', '2014-08-31 18:58:55', 0),
(1517, 1, '2014-09-01', '2014-09-01 02:51:43', 0),
(1518, 1, '2014-09-01', '2014-09-01 02:51:45', 0),
(1519, 1, '2014-09-01', '2014-09-01 10:49:27', 0),
(1520, 1, '2014-09-01', '2014-09-01 17:03:19', 0),
(1521, 1, '2014-09-03', '2014-09-03 06:28:30', 0),
(1522, 1, '2014-09-03', '2014-09-03 06:28:50', 0),
(1523, 1, '2014-09-04', '2014-09-04 15:39:55', 0),
(1524, 1, '2014-09-07', '2014-09-07 13:03:27', 0),
(1525, 1, '2014-09-11', '2014-09-11 08:30:43', 0),
(1526, 1, '2014-09-11', '2014-09-11 20:45:36', 0),
(1527, 1, '2014-09-12', '2014-09-12 01:43:17', 0),
(1528, 1, '2014-09-12', '2014-09-12 05:48:09', 0),
(1529, 1, '2014-09-12', '2014-09-12 06:48:46', 0),
(1530, 1, '2014-09-13', '2014-09-13 01:42:22', 0),
(1531, 109, '2014-09-14', '2014-09-14 21:11:54', 0),
(1532, 1, '2014-09-17', '2014-09-17 05:08:23', 0),
(1533, 1, '2014-09-17', '2014-09-17 18:16:45', 0),
(1534, 109, '2014-09-20', '2014-09-20 01:31:01', 0),
(1535, 1, '2014-09-20', '2014-09-20 03:38:44', 0),
(1536, 1, '2014-09-21', '2014-09-21 07:00:30', 0),
(1537, 1, '2014-09-21', '2014-09-21 07:01:37', 0),
(1538, 1, '2014-09-22', '2014-09-22 12:03:08', 0),
(1539, 1, '2014-09-22', '2014-09-22 16:34:54', 0),
(1540, 1, '2014-09-23', '2014-09-22 22:25:47', 0),
(1541, 1, '2014-09-23', '2014-09-23 18:11:10', 0),
(1542, 1, '2014-09-24', '2014-09-23 22:07:42', 0),
(1543, 1, '2014-09-24', '2014-09-24 02:05:33', 0),
(1544, 1, '2014-09-24', '2014-09-24 06:06:35', 0),
(1545, 1, '2014-09-24', '2014-09-24 11:38:48', 0),
(1546, 1, '2014-09-24', '2014-09-24 18:55:35', 0),
(1547, 1, '2014-09-25', '2014-09-25 11:13:10', 0),
(1548, 1, '2014-09-26', '2014-09-25 23:32:32', 0),
(1549, 1, '2014-09-29', '2014-09-29 14:34:46', 0),
(1550, 1, '2014-09-29', '2014-09-29 14:35:06', 0),
(1551, 1, '2014-09-29', '2014-09-29 16:59:52', 0),
(1552, 1, '2014-09-29', '2014-09-29 18:32:35', 0),
(1553, 1, '2014-09-30', '2014-09-30 10:19:38', 0),
(1554, 1, '2014-10-01', '2014-10-01 04:02:37', 0),
(1555, 1, '2014-10-01', '2014-10-01 04:02:38', 0),
(1556, 1, '2014-10-01', '2014-10-01 20:25:36', 0),
(1557, 1, '2014-10-03', '2014-10-02 22:16:23', 0),
(1558, 1, '2014-10-03', '2014-10-02 22:16:45', 0),
(1559, 1, '2014-10-03', '2014-10-02 22:16:46', 0),
(1560, 1, '2014-10-03', '2014-10-02 22:54:25', 0),
(1561, 1, '2014-10-03', '2014-10-03 01:50:07', 0),
(1562, 1, '2014-10-03', '2014-10-03 01:51:33', 0),
(1563, 1, '2014-10-04', '2014-10-04 17:55:44', 0),
(1564, 1, '2014-10-04', '2014-10-04 18:26:04', 0),
(1565, 1, '2014-10-05', '2014-10-05 04:34:33', 0),
(1566, 1, '2014-10-06', '2014-10-06 12:37:59', 0),
(1567, 1, '2014-10-06', '2014-10-06 19:42:39', 0),
(1568, 1, '2014-10-07', '2014-10-07 07:40:57', 0),
(1569, 1, '2014-10-07', '2014-10-07 07:41:04', 0),
(1570, 1, '2014-10-07', '2014-10-07 07:41:06', 0),
(1571, 1, '2014-10-07', '2014-10-07 21:53:58', 0),
(1572, 1, '2014-10-08', '2014-10-08 15:07:19', 0),
(1573, 1, '2014-10-08', '2014-10-08 19:33:10', 0),
(1574, 1, '2014-10-09', '2014-10-09 11:02:20', 0),
(1575, 1, '2014-10-09', '2014-10-09 15:07:56', 0),
(1576, 1, '2014-10-09', '2014-10-09 15:42:53', 0),
(1577, 1, '2014-10-09', '2014-10-09 15:43:24', 0),
(1578, 1, '2014-10-10', '2014-10-10 09:01:22', 0),
(1579, 1, '2014-10-10', '2014-10-10 09:27:42', 0),
(1580, 1, '2014-10-10', '2014-10-10 10:39:58', 0),
(1581, 1, '2014-10-10', '2014-10-10 13:29:24', 0),
(1582, 1, '2014-10-10', '2014-10-10 14:06:14', 0),
(1583, 1, '2014-10-12', '2014-10-12 17:45:08', 0),
(1584, 1, '2014-10-13', '2014-10-13 04:14:06', 0),
(1585, 1, '2014-10-13', '2014-10-13 16:41:24', 0),
(1586, 1, '2014-10-14', '2014-10-14 19:35:22', 0),
(1587, 1, '2014-10-15', '2014-10-14 23:55:22', 0),
(1588, 1, '2014-10-15', '2014-10-14 23:55:39', 0),
(1589, 1, '2014-10-15', '2014-10-15 00:04:15', 0),
(1590, 1, '2014-10-15', '2014-10-15 04:40:00', 0),
(1591, 1, '2014-10-15', '2014-10-15 10:13:56', 0),
(1592, 1, '2014-10-15', '2014-10-15 10:42:02', 0),
(1593, 1, '2014-10-15', '2014-10-15 13:36:20', 0),
(1594, 1, '2014-10-17', '2014-10-17 08:32:53', 0),
(1595, 1, '2014-10-17', '2014-10-17 09:56:49', 0),
(1596, 1, '2014-10-17', '2014-10-17 10:12:57', 0),
(1597, 1, '2014-10-17', '2014-10-17 14:09:09', 0),
(1598, 1, '2014-10-18', '2014-10-17 22:01:18', 0),
(1599, 1, '2014-10-18', '2014-10-18 00:56:56', 0),
(1600, 1, '2014-10-18', '2014-10-18 15:24:26', 0),
(1601, 1, '2014-10-19', '2014-10-19 08:34:13', 0),
(1602, 1, '2014-10-19', '2014-10-19 19:15:56', 0),
(1603, 1, '2014-10-20', '2014-10-20 01:01:08', 0),
(1604, 1, '2014-10-20', '2014-10-20 02:36:43', 0),
(1605, 1, '2014-10-20', '2014-10-20 17:13:00', 0),
(1606, 1, '2014-10-20', '2014-10-20 17:13:18', 0),
(1607, 1, '2014-10-21', '2014-10-20 22:09:29', 0),
(1608, 1, '2014-10-21', '2014-10-20 22:10:46', 0),
(1609, 1, '2014-10-21', '2014-10-21 09:18:56', 0),
(1610, 1, '2014-10-21', '2014-10-21 10:33:19', 0),
(1611, 1, '2014-10-22', '2014-10-22 06:34:13', 0),
(1612, 1, '2014-10-22', '2014-10-22 06:34:26', 0),
(1613, 1, '2014-10-22', '2014-10-22 16:12:37', 0),
(1614, 1, '2014-10-23', '2014-10-23 08:19:28', 0),
(1615, 1, '2014-10-23', '2014-10-23 11:01:03', 0),
(1616, 1, '2014-10-23', '2014-10-23 19:02:32', 0),
(1617, 1, '2014-10-24', '2014-10-24 03:08:24', 0),
(1618, 1, '2014-10-24', '2014-10-24 19:49:30', 0),
(1619, 1, '2014-10-24', '2014-10-24 19:49:38', 0),
(1620, 1, '2014-10-25', '2014-10-25 02:25:05', 0),
(1621, 1, '2014-10-25', '2014-10-25 07:40:47', 0),
(1622, 1, '2014-10-25', '2014-10-25 13:05:34', 0),
(1623, 1, '2014-10-25', '2014-10-25 15:08:58', 0),
(1624, 1, '2014-10-26', '2014-10-26 11:26:24', 0),
(1625, 1, '2014-10-26', '2014-10-26 15:04:49', 0),
(1626, 1, '2014-10-27', '2014-10-27 02:17:19', 0),
(1627, 1, '2014-10-27', '2014-10-27 04:32:55', 0),
(1628, 1, '2014-10-27', '2014-10-27 07:17:52', 0),
(1629, 1, '2014-10-27', '2014-10-27 10:33:55', 0),
(1630, 1, '2014-10-27', '2014-10-27 17:56:18', 0),
(1631, 1, '2014-10-27', '2014-10-27 18:04:24', 0),
(1632, 1, '2014-10-28', '2014-10-28 09:05:13', 0),
(1633, 1, '2014-10-28', '2014-10-28 22:46:26', 0),
(1634, 1, '2014-10-28', '2014-10-28 22:46:29', 0),
(1635, 1, '2014-10-29', '2014-10-28 23:46:11', 0),
(1636, 1, '2014-10-29', '2014-10-29 20:30:12', 0),
(1637, 1, '2014-10-30', '2014-10-30 15:55:37', 0),
(1638, 1, '2014-10-30', '2014-10-30 18:17:19', 0),
(1639, 1, '2014-10-30', '2014-10-30 20:28:02', 0),
(1640, 1, '2014-10-31', '2014-10-31 06:48:01', 0),
(1641, 1, '2014-10-31', '2014-10-31 14:30:58', 0),
(1642, 1, '2014-10-31', '2014-10-31 14:51:17', 0),
(1643, 1, '2014-10-31', '2014-10-31 16:10:25', 0),
(1644, 1, '2014-11-01', '2014-11-01 00:03:30', 0),
(1645, 1, '2014-11-01', '2014-11-01 02:50:38', 0),
(1646, 1, '2014-11-01', '2014-11-01 03:28:57', 0),
(1647, 1, '2014-11-01', '2014-11-01 11:10:02', 0),
(1648, 1, '2014-11-01', '2014-11-01 14:11:58', 0),
(1649, 1, '2014-11-01', '2014-11-01 22:39:00', 0),
(1650, 1, '2014-11-02', '2014-11-02 02:29:00', 0),
(1651, 1, '2014-11-02', '2014-11-02 03:41:33', 0),
(1652, 1, '2014-11-02', '2014-11-02 05:01:04', 0),
(1653, 1, '2014-11-03', '2014-11-03 00:31:29', 0),
(1654, 1, '2014-11-03', '2014-11-03 05:21:12', 0),
(1655, 1, '2014-11-03', '2014-11-03 05:21:17', 0),
(1656, 1, '2014-11-03', '2014-11-03 12:40:24', 0),
(1657, 1, '2014-11-03', '2014-11-03 16:17:13', 0),
(1658, 1, '2014-11-03', '2014-11-03 21:22:15', 0),
(1659, 1, '2014-11-04', '2014-11-04 17:02:19', 0),
(1660, 1, '2014-11-04', '2014-11-04 20:49:09', 0),
(1661, 1, '2014-11-04', '2014-11-04 22:10:03', 0),
(1662, 1, '2014-11-05', '2014-11-05 02:44:04', 0),
(1663, 1, '2014-11-05', '2014-11-05 09:17:50', 0),
(1664, 1, '2014-11-05', '2014-11-05 11:16:01', 0),
(1665, 1, '2014-11-05', '2014-11-05 19:19:41', 0),
(1666, 1, '2014-11-05', '2014-11-05 19:19:46', 0),
(1667, 1, '2014-11-05', '2014-11-05 20:14:06', 0),
(1668, 1, '2014-11-11', '2014-11-11 11:57:41', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `PageThemes`
--

CREATE TABLE IF NOT EXISTS `PageThemes` (
  `ptID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptHandle` varchar(64) NOT NULL,
  `ptName` varchar(255) DEFAULT NULL,
  `ptDescription` text,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ptID`),
  UNIQUE KEY `ptHandle` (`ptHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `PageThemes`
--

INSERT INTO `PageThemes` (`ptID`, `ptHandle`, `ptName`, `ptDescription`, `pkgID`) VALUES
(1, 'default', 'Plain Yogurt', 'Plain Yogurt is concrete5''s default theme.', 0),
(2, 'greensalad', 'Green Salad Theme', 'This is concrete5''s Green Salad site theme.', 0),
(3, 'dark_chocolate', 'Dark Chocolate', 'Dark Chocolate is concrete5''s default theme in black.', 0),
(4, 'greek_yogurt', 'Greek Yogurt', 'An elegant theme for concrete5.', 0),
(5, 'evolutium', 'Evolutium', 'A Simple and Elegant theme for Business/Corporate, Showcasing and Portfolio.', 1),
(6, 'long_story_short', 'Long Story Short', 'A simple, basic theme for single-page websites and presentations.', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `PageThemeStyles`
--

CREATE TABLE IF NOT EXISTS `PageThemeStyles` (
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptsHandle` varchar(128) NOT NULL,
  `ptsValue` longtext,
  `ptsType` varchar(32) NOT NULL,
  PRIMARY KEY (`ptID`,`ptsHandle`,`ptsType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `PageThemeStyles`
--

INSERT INTO `PageThemeStyles` (`ptID`, `ptsHandle`, `ptsValue`, `ptsType`) VALUES
(3, 'background', 'background-color:#000;', '1'),
(3, 'header_logo', 'color:#777;', '1'),
(3, 'miscellaneous', '', '20'),
(3, 'body', 'font:normal normal 13px Arial;', '10'),
(3, 'body', 'color:#777777;', '1'),
(3, 'link', 'color:#614F3F;', '1'),
(3, 'link_hover', 'color:#81613F;', '1'),
(6, 'link', 'color:#171729;', '1'),
(6, 'link_hover', 'color:#08c;', '1'),
(6, 'footer', 'color:#848c94;', '1'),
(6, 'footer_link', 'color:#64717D;', '1'),
(6, 'footer_link_hover', 'color:#64717D;', '1'),
(6, 'background', 'background-color:#1f1111;', '1'),
(6, 'body', 'color:#222;', '1'),
(6, 'footer_background', 'background-color:#140b0b;', '1');

-- --------------------------------------------------------

--
-- Struttura della tabella `PageTypeAttributes`
--

CREATE TABLE IF NOT EXISTS `PageTypeAttributes` (
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`,`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PageTypes`
--

CREATE TABLE IF NOT EXISTS `PageTypes` (
  `ctID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctHandle` varchar(32) NOT NULL,
  `ctIcon` varchar(128) DEFAULT NULL,
  `ctName` varchar(90) NOT NULL,
  `ctIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`),
  UNIQUE KEY `ctHandle` (`ctHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `PageTypes`
--

INSERT INTO `PageTypes` (`ctID`, `ctHandle`, `ctIcon`, `ctName`, `ctIsInternal`, `pkgID`) VALUES
(1, 'core_stack', 'main.png', 'Stack', 1, 0),
(2, 'dashboard_primary_five', 'main.png', 'Dashboard Primary + Five', 1, 0),
(3, 'dashboard_header_four_col', 'main.png', 'Dashboard Header + Four Column', 1, 0),
(4, 'blog_entry', 'template1.png', 'Blog Entry', 0, 0),
(5, 'full', 'main.png', 'Full', 0, 0),
(6, 'left_sidebar', 'template1.png', 'Left Sidebar', 0, 0),
(7, 'right_sidebar', 'right_sidebar.png', 'Right Sidebar', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `PageWorkflowProgress`
--

CREATE TABLE IF NOT EXISTS `PageWorkflowProgress` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `wpID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`wpID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAccess`
--

CREATE TABLE IF NOT EXISTS `PermissionAccess` (
  `paID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paIsInUse` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`),
  KEY `paID_peID` (`paID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dump dei dati per la tabella `PermissionAccess`
--

INSERT INTO `PermissionAccess` (`paID`, `paIsInUse`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAccessEntities`
--

CREATE TABLE IF NOT EXISTS `PermissionAccessEntities` (
  `peID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `petID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`peID`),
  KEY `petID` (`petID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `PermissionAccessEntities`
--

INSERT INTO `PermissionAccessEntities` (`peID`, `petID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 5),
(5, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAccessEntityGroups`
--

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityGroups` (
  `pegID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pegID`),
  KEY `gID` (`gID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `PermissionAccessEntityGroups`
--

INSERT INTO `PermissionAccessEntityGroups` (`pegID`, `peID`, `gID`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAccessEntityGroupSets`
--

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityGroupSets` (
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gsID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`peID`,`gsID`),
  KEY `gsID` (`gsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAccessEntityTypeCategories`
--

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityTypeCategories` (
  `petID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petID`,`pkCategoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `PermissionAccessEntityTypeCategories`
--

INSERT INTO `PermissionAccessEntityTypeCategories` (`petID`, `pkCategoryID`) VALUES
(1, 1),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(2, 1),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(3, 1),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(4, 1),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(5, 1),
(6, 6),
(6, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAccessEntityTypes`
--

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityTypes` (
  `petID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `petHandle` varchar(255) NOT NULL,
  `petName` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`petID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `PermissionAccessEntityTypes`
--

INSERT INTO `PermissionAccessEntityTypes` (`petID`, `petHandle`, `petName`, `pkgID`) VALUES
(1, 'group', 'Group', 0),
(2, 'user', 'User', 0),
(3, 'group_set', 'Group Set', 0),
(4, 'group_combination', 'Group Combination', 0),
(5, 'page_owner', 'Page Owner', 0),
(6, 'file_uploader', 'File Uploader', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAccessEntityUsers`
--

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityUsers` (
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`peID`,`uID`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAccessList`
--

CREATE TABLE IF NOT EXISTS `PermissionAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `pdID` int(10) unsigned NOT NULL DEFAULT '0',
  `accessType` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`),
  KEY `accessType` (`accessType`),
  KEY `peID` (`peID`),
  KEY `peID_accessType` (`peID`,`accessType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `PermissionAccessList`
--

INSERT INTO `PermissionAccessList` (`paID`, `peID`, `pdID`, `accessType`) VALUES
(1, 1, 0, 10),
(2, 1, 0, 10),
(3, 1, 0, 10),
(4, 1, 0, 10),
(5, 1, 0, 10),
(6, 1, 0, 10),
(7, 1, 0, 10),
(8, 1, 0, 10),
(9, 1, 0, 10),
(10, 1, 0, 10),
(11, 1, 0, 10),
(12, 1, 0, 10),
(13, 1, 0, 10),
(14, 1, 0, 10),
(15, 1, 0, 10),
(16, 1, 0, 10),
(17, 1, 0, 10),
(18, 1, 0, 10),
(19, 1, 0, 10),
(20, 1, 0, 10),
(21, 1, 0, 10),
(22, 1, 0, 10),
(23, 1, 0, 10),
(24, 1, 0, 10),
(25, 1, 0, 10),
(26, 1, 0, 10),
(27, 1, 0, 10),
(28, 1, 0, 10),
(29, 1, 0, 10),
(30, 1, 0, 10),
(31, 1, 0, 10),
(32, 1, 0, 10),
(33, 2, 0, 10),
(34, 2, 0, 10),
(34, 3, 0, 10),
(35, 2, 0, 10),
(36, 2, 0, 10),
(36, 1, 0, 10),
(37, 1, 0, 10),
(38, 1, 0, 10),
(39, 1, 0, 10),
(40, 1, 0, 10),
(41, 1, 0, 10),
(42, 1, 0, 10),
(43, 1, 0, 10),
(44, 1, 0, 10),
(45, 2, 0, 10),
(46, 1, 0, 10),
(47, 1, 0, 10),
(48, 1, 0, 10),
(49, 1, 0, 10),
(50, 1, 0, 10),
(51, 1, 0, 10),
(52, 1, 0, 10),
(53, 1, 0, 10),
(54, 1, 0, 10),
(55, 1, 0, 10),
(56, 1, 0, 10),
(57, 1, 0, 10),
(58, 1, 0, 10),
(59, 1, 0, 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAccessWorkflows`
--

CREATE TABLE IF NOT EXISTS `PermissionAccessWorkflows` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `wfID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`wfID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionAssignments`
--

CREATE TABLE IF NOT EXISTS `PermissionAssignments` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`pkID`),
  KEY `pkID` (`pkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `PermissionAssignments`
--

INSERT INTO `PermissionAssignments` (`paID`, `pkID`) VALUES
(1, 16),
(2, 17),
(3, 54),
(4, 55),
(5, 56),
(6, 57),
(7, 59),
(8, 60),
(9, 61),
(10, 62),
(11, 63),
(12, 65),
(13, 66),
(14, 67),
(15, 68),
(16, 69),
(17, 70);

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionDurationObjects`
--

CREATE TABLE IF NOT EXISTS `PermissionDurationObjects` (
  `pdID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pdObject` text,
  PRIMARY KEY (`pdID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionKeyCategories`
--

CREATE TABLE IF NOT EXISTS `PermissionKeyCategories` (
  `pkCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkCategoryHandle` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pkCategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dump dei dati per la tabella `PermissionKeyCategories`
--

INSERT INTO `PermissionKeyCategories` (`pkCategoryID`, `pkCategoryHandle`, `pkgID`) VALUES
(1, 'page', NULL),
(2, 'single_page', NULL),
(3, 'stack', NULL),
(4, 'composer_page', NULL),
(5, 'user', NULL),
(6, 'file_set', NULL),
(7, 'file', NULL),
(8, 'area', NULL),
(9, 'block_type', NULL),
(10, 'block', NULL),
(11, 'admin', NULL),
(12, 'sitemap', NULL),
(13, 'marketplace_newsflow', NULL),
(14, 'basic_workflow', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `PermissionKeys`
--

CREATE TABLE IF NOT EXISTS `PermissionKeys` (
  `pkID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkHandle` varchar(255) NOT NULL,
  `pkName` varchar(255) NOT NULL,
  `pkCanTriggerWorkflow` int(1) NOT NULL DEFAULT '0',
  `pkHasCustomClass` int(1) NOT NULL DEFAULT '0',
  `pkDescription` varchar(255) DEFAULT NULL,
  `pkCategoryID` int(10) unsigned DEFAULT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pkID`),
  UNIQUE KEY `akHandle` (`pkHandle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Dump dei dati per la tabella `PermissionKeys`
--

INSERT INTO `PermissionKeys` (`pkID`, `pkHandle`, `pkName`, `pkCanTriggerWorkflow`, `pkHasCustomClass`, `pkDescription`, `pkCategoryID`, `pkgID`) VALUES
(1, 'view_page', 'View', 0, 0, 'Can see a page exists and read its content.', 1, 0),
(2, 'view_page_versions', 'View Versions', 0, 0, 'Can view the page versions dialog and read past versions of a page.', 1, 0),
(3, 'preview_page_as_user', 'Preview Page As User', 0, 0, 'Ability to see what this page will look like at a specific time in the future as a specific user.', 1, 0),
(4, 'edit_page_properties', 'Edit Properties', 0, 1, 'Ability to change anything in the Page Properties menu.', 1, 0),
(5, 'edit_page_contents', 'Edit Contents', 0, 0, 'Ability to make edits to at least some of the content in the page. You can lock down different block areas and specific blocks by clicking Permissions on them as well. ', 1, 0),
(6, 'edit_page_speed_settings', 'Edit Speed Settings', 0, 0, 'Ability to change caching settings.', 1, 0),
(7, 'edit_page_theme', 'Change Theme', 0, 1, 'Ability to change just the theme for this page.', 1, 0),
(8, 'edit_page_type', 'Change Page Type', 0, 0, 'Ability to change just the page type for this page, also check out Theme permissions.', 1, 0),
(9, 'edit_page_permissions', 'Edit Permissions', 1, 0, 'Ability to change permissions for this page. Warning: by granting this a user could give themselves more access.', 1, 0),
(10, 'delete_page', 'Delete', 1, 0, 'Ability to move this page to the site''s Trash.', 1, 0),
(11, 'delete_page_versions', 'Delete Versions', 1, 0, 'Ability to remove old versions of this page.', 1, 0),
(12, 'approve_page_versions', 'Approve Changes', 1, 0, 'Can publish an unapproved version of the page.', 1, 0),
(13, 'add_subpage', 'Add Sub-Page', 0, 1, 'Can add a page beneath the current page.', 1, 0),
(14, 'move_or_copy_page', 'Move or Copy Page', 1, 0, 'Can move or copy this page to another location.', 1, 0),
(15, 'schedule_page_contents_guest_access', 'Schedule Guest Access', 0, 0, 'Can control scheduled guest access to this page.', 1, 0),
(16, 'add_block', 'Add Block', 0, 1, 'Can add a block to any area on the site. If someone is added here they can add blocks to any area (unless that area has permissions that override these global permissions.)', 9, 0),
(17, 'add_stack', 'Add Stack', 0, 0, 'Can add a stack or block from a stack to any area on the site. If someone is added here they can add stacks to any area (unless that area has permissions that override these global permissions.)', 9, 0),
(18, 'view_area', 'View Area', 0, 0, 'Can view the area and its contents.', 8, 0),
(19, 'edit_area_contents', 'Edit Area Contents', 0, 0, 'Can edit blocks within this area.', 8, 0),
(20, 'add_block_to_area', 'Add Block to Area', 0, 1, 'Can add blocks to this area. This setting overrides the global Add Block permission for this area.', 8, 0),
(21, 'add_stack_to_area', 'Add Stack to Area', 0, 0, 'Can add stacks to this area. This setting overrides the global Add Stack permission for this area.', 8, 0),
(22, 'add_layout_to_area', 'Add Layouts to Area', 0, 0, 'Controls whether users get the ability to add layouts to a particular area.', 8, 0),
(23, 'edit_area_design', 'Edit Area Design', 0, 0, 'Controls whether users see design controls and can modify an area''s custom CSS.', 8, 0),
(24, 'edit_area_permissions', 'Edit Area Permissions', 0, 0, 'Controls whether users can access the permissions on an area. Custom area permissions could override those of the page.', 8, 0),
(25, 'delete_area_contents', 'Delete Area Contents', 0, 0, 'Controls whether users can delete blocks from this area.', 8, 0),
(26, 'schedule_area_contents_guest_access', 'Schedule Guest Access', 0, 0, 'Controls whether users can schedule guest access permissions on blocks in this area. Guest Access is a shortcut for granting permissions just to the Guest Group.', 8, 0),
(27, 'view_block', 'View Block', 0, 0, 'Controls whether users can view this block in the page.', 10, 0),
(28, 'edit_block', 'Edit Block', 0, 0, 'Controls whether users can edit this block. This overrides any area or page permissions.', 10, 0),
(29, 'edit_block_custom_template', 'Change Custom Template', 0, 0, 'Controls whether users can change the custom template on this block. This overrides any area or page permissions.', 10, 0),
(30, 'delete_block', 'Delete Block', 0, 0, 'Controls whether users can delete this block. This overrides any area or page permissions.', 10, 0),
(31, 'edit_block_design', 'Edit Design', 0, 0, 'Controls whether users can set custom design properties or CSS on this block.', 10, 0),
(32, 'edit_block_permissions', 'Edit Permissions', 0, 0, 'Controls whether users can change permissions on this block, potentially granting themselves or others greater access.', 10, 0),
(33, 'schedule_guest_access', 'Schedule Guest Access', 0, 0, 'Controls whether users can schedule guest access permissions on this block. Guest Access is a shortcut for granting permissions just to the Guest Group.', 10, 0),
(34, 'view_file_set_file', 'View Files', 0, 0, 'Can view and download files in the site.', 6, 0),
(35, 'search_file_set', 'Search Files in File Manager', 0, 0, 'Can access the file manager', 6, 0),
(36, 'edit_file_set_file_properties', 'Edit File Properties', 0, 0, 'Can edit a file''s properties.', 6, 0),
(37, 'edit_file_set_file_contents', 'Edit File Contents', 0, 0, 'Can edit or replace files in set.', 6, 0),
(38, 'copy_file_set_files', 'Copy File', 0, 0, 'Can copy files in file set.', 6, 0),
(39, 'edit_file_set_permissions', 'Edit File Access', 0, 0, 'Can edit access to file sets.', 6, 0),
(40, 'delete_file_set', 'Delete File Set', 0, 0, '', 6, 0),
(41, 'delete_file_set_files', 'Delete File', 0, 0, 'Can delete files in set.', 6, 0),
(42, 'add_file', 'Add File', 0, 1, 'Can add files to set.', 6, 0),
(43, 'view_file', 'View Files', 0, 0, 'Can view and download files.', 7, 0),
(44, 'view_file_in_file_manager', 'View File in File Manager', 0, 0, 'Can access the File Manager.', 7, 0),
(45, 'edit_file_properties', 'Edit File Properties', 0, 0, 'Can edit a file''s properties.', 7, 0),
(46, 'edit_file_contents', 'Edit File Contents', 0, 0, 'Can edit or replace files.', 7, 0),
(47, 'copy_file', 'Copy File', 0, 0, 'Can copy file.', 7, 0),
(48, 'edit_file_permissions', 'Edit File Access', 0, 0, 'Can edit access to file.', 7, 0),
(49, 'delete_file', 'Delete File', 0, 0, 'Can delete file.', 7, 0),
(50, 'approve_basic_workflow_action', 'Approve or Deny', 0, 0, 'Grant ability to approve workflow.', 14, 0),
(51, 'notify_on_basic_workflow_entry', 'Notify on Entry', 0, 0, 'Notify approvers that a change has entered the workflow.', 14, 0),
(52, 'notify_on_basic_workflow_approve', 'Notify on Approve', 0, 0, 'Notify approvers that a change has been approved.', 14, 0),
(53, 'notify_on_basic_workflow_deny', 'Notify on Deny', 0, 0, 'Notify approvers that a change has been denied.', 14, 0),
(54, 'access_user_search', 'Access User Search', 0, 1, '', 5, 0),
(55, 'edit_user_properties', 'Edit User Details', 0, 1, NULL, 5, 0),
(56, 'view_user_attributes', 'View User Attributes', 0, 1, NULL, 5, 0),
(57, 'activate_user', 'Activate/Deactivate User', 0, 0, NULL, 5, 0),
(58, 'sudo', 'Sign in as User', 0, 0, NULL, 5, 0),
(59, 'delete_user', 'Delete User', 0, 0, NULL, 5, 0),
(60, 'access_group_search', 'Access Group Search', 0, 0, '', 5, 0),
(61, 'edit_groups', 'Edit Groups', 0, 0, '', 5, 0),
(62, 'assign_user_groups', 'Assign Groups to User', 0, 1, '', 5, 0),
(63, 'backup', 'Perform Backups', 0, 0, NULL, 11, 0),
(64, 'access_task_permissions', 'Access Task Permissions', 0, 0, NULL, 11, 0),
(65, 'access_sitemap', 'Access Sitemap', 0, 0, NULL, 12, 0),
(66, 'access_page_defaults', 'Access Page Type Defaults', 0, 0, NULL, 11, 0),
(67, 'empty_trash', 'Empty Trash', 0, 0, NULL, 11, 0),
(68, 'uninstall_packages', 'Uninstall Packages', 0, 0, NULL, 13, 0),
(69, 'install_packages', 'Install Packages', 0, 0, NULL, 13, 0),
(70, 'view_newsflow', 'View Newsflow', 0, 0, NULL, 13, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `PileContents`
--

CREATE TABLE IF NOT EXISTS `PileContents` (
  `pcID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemType` varchar(64) NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pcID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Piles`
--

CREATE TABLE IF NOT EXISTS `Piles` (
  `pID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(64) NOT NULL,
  PRIMARY KEY (`pID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `SignupRequests`
--

CREATE TABLE IF NOT EXISTS `SignupRequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipFrom` int(10) unsigned NOT NULL DEFAULT '0',
  `date_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_ipFrom` (`ipFrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Stacks`
--

CREATE TABLE IF NOT EXISTS `Stacks` (
  `stID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stName` varchar(255) NOT NULL,
  `stType` int(1) unsigned NOT NULL DEFAULT '0',
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stID`),
  KEY `stType` (`stType`),
  KEY `stName` (`stName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `Stacks`
--

INSERT INTO `Stacks` (`stID`, `stName`, `stType`, `cID`) VALUES
(1, 'Header Nav', 20, 120),
(2, 'Side Nav', 0, 121),
(3, 'Site Name', 20, 122),
(5, 'LinkSocial', 0, 137);

-- --------------------------------------------------------

--
-- Struttura della tabella `SystemAntispamLibraries`
--

CREATE TABLE IF NOT EXISTS `SystemAntispamLibraries` (
  `saslHandle` varchar(64) NOT NULL,
  `saslName` varchar(255) DEFAULT NULL,
  `saslIsActive` int(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`saslHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `SystemCaptchaLibraries`
--

CREATE TABLE IF NOT EXISTS `SystemCaptchaLibraries` (
  `sclHandle` varchar(64) NOT NULL,
  `sclName` varchar(255) DEFAULT NULL,
  `sclIsActive` int(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sclHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `SystemCaptchaLibraries`
--

INSERT INTO `SystemCaptchaLibraries` (`sclHandle`, `sclName`, `sclIsActive`, `pkgID`) VALUES
('securimage', 'SecurImage (Default)', 1, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `SystemNotifications`
--

CREATE TABLE IF NOT EXISTS `SystemNotifications` (
  `snID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `snTypeID` int(3) unsigned NOT NULL DEFAULT '0',
  `snURL` text,
  `snURL2` text,
  `snDateTime` datetime NOT NULL,
  `snIsArchived` int(1) NOT NULL DEFAULT '0',
  `snIsNew` int(1) NOT NULL DEFAULT '0',
  `snTitle` varchar(255) DEFAULT NULL,
  `snDescription` text,
  `snBody` text,
  PRIMARY KEY (`snID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `SystemNotifications`
--

INSERT INTO `SystemNotifications` (`snID`, `snTypeID`, `snURL`, `snURL2`, `snDateTime`, `snIsArchived`, `snIsNew`, `snTitle`, `snDescription`, `snBody`) VALUES
(1, 10, '/index.php/dashboard/system/backup_restore/update/', NULL, '2013-04-29 14:49:39', 0, 1, 'A new version of concrete5 is now available.', '', '\n	\n	<h2>Performance Improvement Update</h2>\n	\n	<p>\n	Version 5.6.1 introduces a completely revampled caching system, and should dramatically improve performance on your concrete5 sites. It also fixes a number of bugs and is highly recommended for all users of concrete5.\n	</p>\n	<p>\n	As always, backup your data and site before running the upgrade live.\n	</p>			\n\n	<h3>What''s new in 5.6.1</h3>\n	\n	<ul>\n	<li>Removed much of the cache library and rewrote calls to dramatically improve performance.</li>\n	<li>Completely new page caching library.</li>\n	<li>Many bug fixes and stability improvements.</li>\n	</ul>\n	\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-1/" target="_blank">Full 5.6.1 Release Notes</a></h3>\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-1-1-release-notes/" target="_blank">Full 5.6.1.1 Release Notes</a></h3>\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-1-2-release-notes/" target="_blank">Full 5.6.1.2 Release Notes</a></h3>\n\n\n\n	'),
(2, 10, '/index.php/dashboard/system/backup_restore/update/', NULL, '2013-05-02 11:37:37', 0, 1, 'A new version of concrete5 is now available.', '', '\n	\n	<h2>Performance Improvement Update</h2>\n	\n	<p>\n	Version 5.6.1 introduces a completely revampled caching system, and should dramatically improve performance on your concrete5 sites. It also fixes a number of bugs and is highly recommended for all users of concrete5.\n	</p>\n	<p>\n	As always, backup your data and site before running the upgrade live.\n	</p>			\n\n	<h3>What''s new in 5.6.1</h3>\n	\n	<ul>\n	<li>Removed much of the cache library and rewrote calls to dramatically improve performance.</li>\n	<li>Completely new page caching library.</li>\n	<li>Many bug fixes and stability improvements.</li>\n	</ul>\n	\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-1/" target="_blank">Full 5.6.1 Release Notes</a></h3>\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-1-1-release-notes/" target="_blank">Full 5.6.1.1 Release Notes</a></h3>\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-1-2-release-notes/" target="_blank">Full 5.6.1.2 Release Notes</a></h3>\n\n\n\n	'),
(3, 10, '/index.php/dashboard/system/backup_restore/update/', NULL, '2013-11-12 08:42:19', 0, 1, 'A new version of concrete5 is now available.', '', '\n\n	<h2>Huge Maintenance Update</h2>\n	\n	<p>\n	Version 5.6.2 and 5.6.2.1 introduce a lot of bug fixes and a few feature improvements, including automated jobs, permissions bug fixes, lots of translation fixes, and more.\n	They are highly recommended for all users of concrete5.\n	</p>\n	<p>\n	As always, backup your data and site before running the upgrade live.\n	</p>			\n\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-release-notes/" target="_blank">Full 5.6.2 Release Notes</a></h3>\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-1-release-notes/" target="_blank">Full 5.6.2.1 Release Notes</a></h3>\n\n\n\n	'),
(4, 10, '/index.php/dashboard/system/backup_restore/update/', NULL, '2013-11-25 21:54:37', 0, 1, 'A new version of concrete5 is now available.', '', '\n\n	<h2>Huge Maintenance Update</h2>\n	\n	<p>\n	Version 5.6.2 and 5.6.2.1 introduce a lot of bug fixes and a few feature improvements, including automated jobs, permissions bug fixes, lots of translation fixes, and more.\n	They are highly recommended for all users of concrete5.\n	</p>\n	<p>\n	As always, backup your data and site before running the upgrade live.\n	</p>			\n\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-release-notes/" target="_blank">Full 5.6.2 Release Notes</a></h3>\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-1-release-notes/" target="_blank">Full 5.6.2.1 Release Notes</a></h3>\n\n\n\n	'),
(5, 10, '/index.php/dashboard/system/backup_restore/update/', NULL, '2013-12-05 09:13:56', 0, 1, 'A new version of concrete5 is now available.', '', '\n\n	<h2>Huge Maintenance Update</h2>\n	\n	<p>\n	Version 5.6.2 and 5.6.2.1 introduce a lot of bug fixes and a few feature improvements, including automated jobs, permissions bug fixes, lots of translation fixes, and more.\n	They are highly recommended for all users of concrete5.\n	</p>\n	<p>\n	As always, backup your data and site before running the upgrade live.\n	</p>			\n\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-release-notes/" target="_blank">Full 5.6.2 Release Notes</a></h3>\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-1-release-notes/" target="_blank">Full 5.6.2.1 Release Notes</a></h3>\n\n\n\n	'),
(6, 10, '/index.php/dashboard/system/backup_restore/update/', NULL, '2013-12-29 10:11:50', 0, 1, 'A new version of concrete5 is now available.', '', '\n\n	<h2>Huge Maintenance Update</h2>\n	\n	<p>\n	Version 5.6.2 and 5.6.2.1 introduce a lot of bug fixes and a few feature improvements, including automated jobs, permissions bug fixes, lots of translation fixes, and more.\n	They are highly recommended for all users of concrete5.\n	</p>\n	<p>\n	As always, backup your data and site before running the upgrade live.\n	</p>			\n\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-release-notes/" target="_blank">Full 5.6.2 Release Notes</a></h3>\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-1-release-notes/" target="_blank">Full 5.6.2.1 Release Notes</a></h3>\n\n\n\n	'),
(7, 10, '/index.php/dashboard/system/backup_restore/update/', NULL, '2013-12-31 21:34:23', 0, 1, 'A new version of concrete5 is now available.', '', '\n\n	<h2>Huge Maintenance Update</h2>\n	\n	<p>\n	Version 5.6.2 and 5.6.2.1 introduce a lot of bug fixes and a few feature improvements, including automated jobs, permissions bug fixes, lots of translation fixes, and more.\n	They are highly recommended for all users of concrete5.\n	</p>\n	<p>\n	As always, backup your data and site before running the upgrade live.\n	</p>			\n\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-release-notes/" target="_blank">Full 5.6.2 Release Notes</a></h3>\n	<h3><a href="http://www.concrete5.org/documentation/background/version_history/5-6-2-1-release-notes/" target="_blank">Full 5.6.2.1 Release Notes</a></h3>\n\n\n\n	');

-- --------------------------------------------------------

--
-- Struttura della tabella `UserAttributeKeys`
--

CREATE TABLE IF NOT EXISTS `UserAttributeKeys` (
  `akID` int(10) unsigned NOT NULL,
  `uakProfileDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakMemberListDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakProfileEdit` tinyint(1) NOT NULL DEFAULT '1',
  `uakProfileEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEdit` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned DEFAULT '0',
  `uakIsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `UserAttributeKeys`
--

INSERT INTO `UserAttributeKeys` (`akID`, `uakProfileDisplay`, `uakMemberListDisplay`, `uakProfileEdit`, `uakProfileEditRequired`, `uakRegisterEdit`, `uakRegisterEditRequired`, `displayOrder`, `uakIsActive`) VALUES
(10, 0, 0, 1, 0, 1, 0, 1, 1),
(11, 0, 0, 1, 0, 1, 0, 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `UserAttributeValues`
--

CREATE TABLE IF NOT EXISTS `UserAttributeValues` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uID`,`akID`,`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserBannedIPs`
--

CREATE TABLE IF NOT EXISTS `UserBannedIPs` (
  `ipFrom` int(10) unsigned NOT NULL DEFAULT '0',
  `ipTo` int(10) unsigned NOT NULL DEFAULT '0',
  `banCode` int(1) unsigned NOT NULL DEFAULT '1',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `isManual` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipFrom`,`ipTo`),
  KEY `ipFrom` (`ipFrom`),
  KEY `ipTo` (`ipTo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserGroups`
--

CREATE TABLE IF NOT EXISTS `UserGroups` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `ugEntered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uID`,`gID`),
  KEY `uID` (`uID`),
  KEY `gID` (`gID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserOpenIDs`
--

CREATE TABLE IF NOT EXISTS `UserOpenIDs` (
  `uID` int(10) unsigned NOT NULL,
  `uOpenID` varchar(255) NOT NULL,
  PRIMARY KEY (`uOpenID`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPermissionAssignGroupAccessList`
--

CREATE TABLE IF NOT EXISTS `UserPermissionAssignGroupAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPermissionAssignGroupAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `UserPermissionAssignGroupAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`gID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPermissionEditPropertyAccessList`
--

CREATE TABLE IF NOT EXISTS `UserPermissionEditPropertyAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `uName` int(1) unsigned DEFAULT '0',
  `uEmail` int(1) unsigned DEFAULT '0',
  `uPassword` int(1) unsigned DEFAULT '0',
  `uAvatar` int(1) unsigned DEFAULT '0',
  `uTimezone` int(1) unsigned DEFAULT '0',
  `uDefaultLanguage` int(1) unsigned DEFAULT '0',
  `attributePermission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPermissionEditPropertyAttributeAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `UserPermissionEditPropertyAttributeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPermissionUserSearchAccessList`
--

CREATE TABLE IF NOT EXISTS `UserPermissionUserSearchAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPermissionUserSearchAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `UserPermissionUserSearchAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`gID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPermissionViewAttributeAccessList`
--

CREATE TABLE IF NOT EXISTS `UserPermissionViewAttributeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPermissionViewAttributeAccessListCustom`
--

CREATE TABLE IF NOT EXISTS `UserPermissionViewAttributeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPrivateMessages`
--

CREATE TABLE IF NOT EXISTS `UserPrivateMessages` (
  `msgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgDateCreated` datetime NOT NULL,
  `msgSubject` varchar(255) NOT NULL,
  `msgBody` text,
  `uToID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserPrivateMessagesTo`
--

CREATE TABLE IF NOT EXISTS `UserPrivateMessagesTo` (
  `msgID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgMailboxID` int(11) NOT NULL,
  `msgIsNew` int(1) NOT NULL DEFAULT '0',
  `msgIsUnread` int(1) NOT NULL DEFAULT '0',
  `msgIsReplied` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`,`uID`,`uAuthorID`),
  KEY `uID` (`uID`),
  KEY `uAuthorID` (`uAuthorID`),
  KEY `msgFolderID` (`msgMailboxID`),
  KEY `msgIsNew` (`msgIsNew`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `uID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uName` varchar(64) NOT NULL,
  `uEmail` varchar(64) NOT NULL,
  `uPassword` varchar(255) NOT NULL,
  `uIsActive` varchar(1) NOT NULL DEFAULT '0',
  `uIsValidated` tinyint(4) NOT NULL DEFAULT '-1',
  `uIsFullRecord` tinyint(1) NOT NULL DEFAULT '1',
  `uDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uHasAvatar` tinyint(1) NOT NULL DEFAULT '0',
  `uLastOnline` int(10) unsigned NOT NULL DEFAULT '0',
  `uLastLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `uLastIP` bigint(10) NOT NULL DEFAULT '0',
  `uPreviousLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `uNumLogins` int(10) unsigned NOT NULL DEFAULT '0',
  `uTimezone` varchar(255) DEFAULT NULL,
  `uDefaultLanguage` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uID`),
  UNIQUE KEY `uName` (`uName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `Users`
--

INSERT INTO `Users` (`uID`, `uName`, `uEmail`, `uPassword`, `uIsActive`, `uIsValidated`, `uIsFullRecord`, `uDateAdded`, `uHasAvatar`, `uLastOnline`, `uLastLogin`, `uLastIP`, `uPreviousLogin`, `uNumLogins`, `uTimezone`, `uDefaultLanguage`) VALUES
(1, 'admin', 'info@consul-net.it', '990428d18bfd1e60eb88ce3503d9169c', '1', -1, 1, '2012-11-22 16:12:11', 0, 1388682594, 1388681956, 1328114865, 1385414677, 29, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `UserSearchIndexAttributes`
--

CREATE TABLE IF NOT EXISTS `UserSearchIndexAttributes` (
  `uID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_profile_private_messages_enabled` tinyint(4) DEFAULT '0',
  `ak_profile_private_messages_notification_enabled` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `UsersFriends`
--

CREATE TABLE IF NOT EXISTS `UsersFriends` (
  `ufID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `friendUID` int(10) unsigned DEFAULT NULL,
  `uDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ufID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `UserValidationHashes`
--

CREATE TABLE IF NOT EXISTS `UserValidationHashes` (
  `uvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `uHash` varchar(64) NOT NULL,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `uDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `uDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uvhID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `WorkflowProgress`
--

CREATE TABLE IF NOT EXISTS `WorkflowProgress` (
  `wpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wpCategoryID` int(10) unsigned DEFAULT NULL,
  `wfID` int(10) unsigned NOT NULL DEFAULT '0',
  `wpApproved` tinyint(1) NOT NULL DEFAULT '0',
  `wpDateAdded` datetime DEFAULT NULL,
  `wpDateLastAction` datetime DEFAULT NULL,
  `wpCurrentStatus` int(10) NOT NULL DEFAULT '0',
  `wrID` int(1) NOT NULL DEFAULT '0',
  `wpIsCompleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wpID`),
  KEY `wrID` (`wrID`),
  KEY `wpIsCompleted` (`wpIsCompleted`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `WorkflowProgressCategories`
--

CREATE TABLE IF NOT EXISTS `WorkflowProgressCategories` (
  `wpCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wpCategoryHandle` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`wpCategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `WorkflowProgressCategories`
--

INSERT INTO `WorkflowProgressCategories` (`wpCategoryID`, `wpCategoryHandle`, `pkgID`) VALUES
(1, 'page', NULL),
(2, 'file', NULL),
(3, 'user', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `WorkflowProgressHistory`
--

CREATE TABLE IF NOT EXISTS `WorkflowProgressHistory` (
  `wphID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wpID` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `object` text,
  PRIMARY KEY (`wphID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dump dei dati per la tabella `WorkflowProgressHistory`
--

INSERT INTO `WorkflowProgressHistory` (`wphID`, `wpID`, `timestamp`, `object`) VALUES
(1, 1, '2012-11-22 15:58:14', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"2";s:4:"wrID";s:1:"1";}'),
(2, 2, '2012-11-22 15:59:14', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"134";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"2";}'),
(3, 3, '2013-02-18 21:26:58', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"3";s:4:"wrID";s:1:"3";}'),
(4, 4, '2013-04-30 10:16:56', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"4";s:4:"wrID";s:1:"4";}'),
(5, 5, '2013-05-03 06:29:09', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"5";s:4:"wrID";s:1:"5";}'),
(6, 6, '2013-05-11 09:06:50', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"6";s:4:"wrID";s:1:"6";}'),
(7, 7, '2013-05-11 09:10:09', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"6";s:4:"wrID";s:1:"7";}'),
(8, 8, '2013-05-22 12:34:04', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"7";s:4:"wrID";s:1:"8";}'),
(9, 9, '2013-05-22 12:35:00', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"8";s:4:"wrID";s:1:"9";}'),
(10, 10, '2013-05-22 12:35:55', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"9";s:4:"wrID";s:2:"10";}'),
(11, 11, '2013-05-22 18:04:19', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"10";s:4:"wrID";s:2:"11";}'),
(12, 12, '2013-05-22 18:13:51', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"11";s:4:"wrID";s:2:"12";}'),
(13, 13, '2013-05-22 18:14:55', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"12";s:4:"wrID";s:2:"13";}'),
(14, 14, '2013-05-22 18:16:52', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"13";s:4:"wrID";s:2:"14";}'),
(15, 15, '2013-05-22 18:17:43', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"14";s:4:"wrID";s:2:"15";}'),
(16, 16, '2013-05-22 20:13:27', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"15";s:4:"wrID";s:2:"16";}'),
(17, 17, '2013-05-22 20:15:15', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"16";s:4:"wrID";s:2:"17";}'),
(18, 18, '2013-05-23 08:54:18', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"17";s:4:"wrID";s:2:"18";}'),
(19, 19, '2013-05-23 10:49:33', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"18";s:4:"wrID";s:2:"19";}'),
(20, 20, '2013-05-23 10:52:31', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"19";s:4:"wrID";s:2:"20";}'),
(21, 21, '2013-05-25 09:05:08', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"137";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"21";}'),
(22, 22, '2013-11-12 09:36:22', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"138";s:4:"cvID";s:1:"1";s:4:"wrID";s:2:"22";}'),
(23, 23, '2013-11-12 09:41:02', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"20";s:4:"wrID";s:2:"23";}'),
(24, 24, '2013-11-25 20:55:38', 'O:29:"DeletePagePageWorkflowRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"10";s:3:"cID";s:3:"127";s:4:"wrID";s:2:"24";}'),
(25, 25, '2013-11-25 20:55:44', 'O:29:"DeletePagePageWorkflowRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"10";s:3:"cID";s:3:"128";s:4:"wrID";s:2:"25";}'),
(26, 26, '2013-11-25 20:55:50', 'O:29:"DeletePagePageWorkflowRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"10";s:3:"cID";s:3:"129";s:4:"wrID";s:2:"26";}'),
(27, 27, '2013-11-25 20:56:07', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"139";s:4:"cvID";s:1:"1";s:4:"wrID";s:2:"27";}'),
(28, 28, '2013-11-25 21:03:05', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"139";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"28";}'),
(29, 29, '2013-11-25 21:04:47', 'O:29:"DeletePagePageWorkflowRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"10";s:3:"cID";s:3:"139";s:4:"wrID";s:2:"29";}'),
(30, 30, '2013-11-25 21:04:51', 'O:29:"DeletePagePageWorkflowRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"10";s:3:"cID";s:3:"138";s:4:"wrID";s:2:"30";}'),
(31, 31, '2013-11-25 21:04:55', 'O:29:"DeletePagePageWorkflowRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"10";s:3:"cID";s:3:"134";s:4:"wrID";s:2:"31";}'),
(32, 32, '2013-11-25 21:05:33', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"21";s:4:"wrID";s:2:"32";}'),
(33, 33, '2013-11-25 21:08:54', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"135";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"33";}'),
(34, 34, '2013-11-25 21:09:41', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"22";s:4:"wrID";s:2:"34";}'),
(35, 35, '2013-11-25 21:10:13', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"23";s:4:"wrID";s:2:"35";}'),
(36, 36, '2013-11-25 21:16:52', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"24";s:4:"wrID";s:2:"36";}'),
(37, 37, '2013-12-31 20:46:43', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"140";s:4:"cvID";s:1:"1";s:4:"wrID";s:2:"37";}'),
(38, 38, '2013-12-31 20:49:10', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"25";s:4:"wrID";s:2:"38";}'),
(39, 39, '2014-01-02 17:03:02', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"26";s:4:"wrID";s:2:"39";}'),
(40, 40, '2014-01-02 17:06:01', 'O:30:"ApprovePagePageWorkflowRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"27";s:4:"wrID";s:2:"40";}');

-- --------------------------------------------------------

--
-- Struttura della tabella `WorkflowRequestObjects`
--

CREATE TABLE IF NOT EXISTS `WorkflowRequestObjects` (
  `wrID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wrObject` text,
  PRIMARY KEY (`wrID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Workflows`
--

CREATE TABLE IF NOT EXISTS `Workflows` (
  `wfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wfName` varchar(255) DEFAULT NULL,
  `wftID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wfID`),
  UNIQUE KEY `wfName` (`wfName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `WorkflowTypes`
--

CREATE TABLE IF NOT EXISTS `WorkflowTypes` (
  `wftID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wftHandle` varchar(64) NOT NULL,
  `wftName` varchar(128) NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wftID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `WorkflowTypes`
--

INSERT INTO `WorkflowTypes` (`wftID`, `wftHandle`, `wftName`, `pkgID`) VALUES
(1, 'basic', 'Basic Workflow', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
