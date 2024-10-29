-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: altech-omega-andalan
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `birth_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Hallo','Buku Resep Masakan','1997-01-21','2024-10-28 12:14:31','2024-10-28 12:14:31'),(2,'Prof. Nicklaus Hand','Architecto neque quae consequatur ex a rem soluta. Saepe exercitationem ullam fuga saepe.','2006-04-29','2024-10-29 01:48:46','2024-10-29 01:48:46'),(3,'Katharina Hand MD Update','Ipsa corrupti voluptas ratione praesentium qui quod laudantium. Doloremque rerum fugit libero minima. Commodi voluptates illum dolore cupiditate id asperiores quae.','1997-01-21','2024-10-29 01:48:46','2024-10-29 05:03:30'),(4,'Mr. Gabriel Schulist','Et aspernatur vel expedita. Ea asperiores vero cumque impedit sed ut. Quis numquam voluptatum minus.','1973-05-20','2024-10-29 01:48:46','2024-10-29 01:48:46'),(5,'Laurianne Spencer Jr.','Eos deserunt molestiae recusandae odit impedit error quae distinctio. Nam eius vel natus neque natus doloremque et et. Voluptas aut quis inventore incidunt exercitationem beatae est. Iste temporibus dolorem autem totam et.','1996-06-03','2024-10-29 01:48:46','2024-10-29 01:48:46'),(6,'Hailie Turcotte','Similique non eos ut at cumque aliquam. Earum dolores non molestiae sint dolores perspiciatis et. Et voluptas aut eligendi porro aut.','2011-12-02','2024-10-29 01:48:46','2024-10-29 01:48:46'),(7,'Mallory Zboncak','Quo molestiae quia illo ut voluptatem. Voluptate et error maxime nihil magni harum. Minima cumque architecto porro laborum aperiam. Quidem et ratione a delectus alias non.','2023-02-06','2024-10-29 01:48:46','2024-10-29 01:48:46'),(8,'Lawrence Kuhlman','Ad rerum eos necessitatibus veniam esse impedit perspiciatis. Facilis quos natus debitis qui est expedita molestias ab. Sint sit autem itaque qui. Rem omnis quam fugiat qui porro tempore molestias nam.','1998-05-14','2024-10-29 01:48:46','2024-10-29 01:48:46'),(9,'Monserrat Bruen','Quod exercitationem quidem earum ipsa quos nihil. Voluptas corrupti delectus distinctio itaque. Placeat quia possimus quos quisquam quis. Suscipit dicta accusantium facere unde quam ipsam fugit.','2006-12-23','2024-10-29 01:48:46','2024-10-29 01:48:46'),(10,'Melisa Balistreri','Autem ut rerum architecto et rerum similique. Totam eum numquam dolor ut ut. Ea quis ad velit vel molestiae eos ducimus dignissimos. Atque commodi accusantium velit voluptates nihil. Blanditiis ut repellat repellendus rerum.','1984-12-16','2024-10-29 01:48:46','2024-10-29 01:48:46'),(11,'Prof. Oma Weimann DDS','Omnis perferendis fuga expedita nesciunt vel. Molestiae et doloribus sunt voluptas nihil tempore. Non ullam ullam sapiente eveniet.','2010-07-20','2024-10-29 01:48:46','2024-10-29 01:48:46'),(12,'Hallo','Buku Resep Masakan','1997-01-21','2024-10-29 05:03:43','2024-10-29 05:03:43');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `publish_date` date NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `books_author_id_foreign` (`author_id`),
  CONSTRAINT `books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'Store Book','Test','2024-01-21',1,'2024-10-29 01:27:36','2024-10-29 01:27:36'),(3,'Atque quo quasi.','Delectus et inventore id aut itaque reiciendis. Qui minima labore qui aspernatur quaerat porro tempore. Architecto magni exercitationem maxime labore vitae ex. Possimus ea repellat ea et similique iste perspiciatis. Sed repudiandae possimus libero ea molestiae incidunt excepturi.','2022-01-03',7,'2024-10-29 01:48:46','2024-10-29 01:48:46'),(4,'Qui quo aliquid ut.','Culpa fugiat non aliquid laboriosam velit saepe rerum. Molestias molestiae eius eveniet mollitia magni quasi.','1991-04-04',5,'2024-10-29 01:48:46','2024-10-29 01:48:46'),(5,'Voluptatem est et UPDATE.','Aliquam facere quis distinctio totam non. Sed sapiente et cum dolorem. Sed alias et sed ut.','2024-01-21',3,'2024-10-29 01:48:46','2024-10-29 05:05:03'),(6,'Et sequi similique qui corporis.','Culpa est velit fugit et. Incidunt repellendus iure sed ab. Sequi officiis qui est culpa ipsum sed amet.','1971-03-28',10,'2024-10-29 01:48:46','2024-10-29 01:48:46'),(7,'Fugiat dolorem ipsum.','Fuga dicta minus facere aliquam magni expedita dolor magni. Vitae illum veritatis est. Quos sunt soluta perferendis. Velit et error cum.','2018-08-14',8,'2024-10-29 01:48:46','2024-10-29 01:48:46'),(8,'Doloremque voluptatem dolores.','Eos aliquid saepe inventore impedit autem et. Vero sapiente non culpa. Quis qui explicabo sit accusamus quo odit. Et quia rerum beatae dignissimos esse.','2007-06-15',1,'2024-10-29 01:48:46','2024-10-29 01:48:46'),(9,'Repellat quia in.','Assumenda aliquam repellat molestias rerum aut. Enim veritatis delectus vitae qui. Voluptatem tenetur ratione voluptatem necessitatibus ut nihil doloribus.','1993-02-14',11,'2024-10-29 01:48:46','2024-10-29 01:48:46'),(10,'Sint praesentium autem quia.','Illum dolorem omnis doloribus porro rerum. Eos consequuntur sed omnis expedita adipisci ad mollitia. Necessitatibus harum rerum voluptatem culpa ex ut esse. Nihil dolor voluptatem dolores quos sunt nobis voluptate.','1970-05-20',5,'2024-10-29 01:48:46','2024-10-29 01:48:46'),(11,'Vel exercitationem qui.','Architecto vero qui at quam et nobis quia. Dolorem distinctio laboriosam fugiat nemo voluptatem recusandae. Aut fugit porro amet enim est error.','2022-10-23',10,'2024-10-29 01:48:46','2024-10-29 01:48:46'),(12,'Eius explicabo vitae.','Cum sequi molestiae ullam ipsam provident sequi qui. Asperiores dicta amet culpa sit delectus quia nihil. Enim quod fuga aspernatur minus magni aut ea aut.','2001-09-22',11,'2024-10-29 01:48:46','2024-10-29 01:48:46');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('author_1','O:17:\"App\\Models\\Author\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:7:\"authors\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"Hallo\";s:3:\"bio\";s:18:\"Buku Resep Masakan\";s:10:\"birth_date\";s:10:\"1997-01-21\";s:10:\"created_at\";s:19:\"2024-10-28 19:14:31\";s:10:\"updated_at\";s:19:\"2024-10-28 19:14:31\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"Hallo\";s:3:\"bio\";s:18:\"Buku Resep Masakan\";s:10:\"birth_date\";s:10:\"1997-01-21\";s:10:\"created_at\";s:19:\"2024-10-28 19:14:31\";s:10:\"updated_at\";s:19:\"2024-10-28 19:14:31\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:3:\"bio\";i:2;s:10:\"birth_date\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}',1730203436),('author_3','O:17:\"App\\Models\\Author\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:7:\"authors\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:24:\"Katharina Hand MD Update\";s:3:\"bio\";s:164:\"Ipsa corrupti voluptas ratione praesentium qui quod laudantium. Doloremque rerum fugit libero minima. Commodi voluptates illum dolore cupiditate id asperiores quae.\";s:10:\"birth_date\";s:10:\"1997-01-21\";s:10:\"created_at\";s:19:\"2024-10-29 08:48:46\";s:10:\"updated_at\";s:19:\"2024-10-29 12:03:30\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:24:\"Katharina Hand MD Update\";s:3:\"bio\";s:164:\"Ipsa corrupti voluptas ratione praesentium qui quod laudantium. Doloremque rerum fugit libero minima. Commodi voluptates illum dolore cupiditate id asperiores quae.\";s:10:\"birth_date\";s:10:\"1997-01-21\";s:10:\"created_at\";s:19:\"2024-10-29 08:48:46\";s:10:\"updated_at\";s:19:\"2024-10-29 12:03:30\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:3:\"bio\";i:2;s:10:\"birth_date\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}',1730203475),('author_with_books_3','O:17:\"App\\Models\\Author\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:7:\"authors\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:24:\"Katharina Hand MD Update\";s:3:\"bio\";s:164:\"Ipsa corrupti voluptas ratione praesentium qui quod laudantium. Doloremque rerum fugit libero minima. Commodi voluptates illum dolore cupiditate id asperiores quae.\";s:10:\"birth_date\";s:10:\"1997-01-21\";s:10:\"created_at\";s:19:\"2024-10-29 08:48:46\";s:10:\"updated_at\";s:19:\"2024-10-29 12:03:30\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:3;s:4:\"name\";s:24:\"Katharina Hand MD Update\";s:3:\"bio\";s:164:\"Ipsa corrupti voluptas ratione praesentium qui quod laudantium. Doloremque rerum fugit libero minima. Commodi voluptates illum dolore cupiditate id asperiores quae.\";s:10:\"birth_date\";s:10:\"1997-01-21\";s:10:\"created_at\";s:19:\"2024-10-29 08:48:46\";s:10:\"updated_at\";s:19:\"2024-10-29 12:03:30\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"books\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:15:\"App\\Models\\Book\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"books\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:5;s:5:\"title\";s:25:\"Voluptatem est et UPDATE.\";s:11:\"description\";s:91:\"Aliquam facere quis distinctio totam non. Sed sapiente et cum dolorem. Sed alias et sed ut.\";s:12:\"publish_date\";s:10:\"2024-01-21\";s:9:\"author_id\";i:3;s:10:\"created_at\";s:19:\"2024-10-29 08:48:46\";s:10:\"updated_at\";s:19:\"2024-10-29 12:05:03\";}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:5;s:5:\"title\";s:25:\"Voluptatem est et UPDATE.\";s:11:\"description\";s:91:\"Aliquam facere quis distinctio totam non. Sed sapiente et cum dolorem. Sed alias et sed ut.\";s:12:\"publish_date\";s:10:\"2024-01-21\";s:9:\"author_id\";i:3;s:10:\"created_at\";s:19:\"2024-10-29 08:48:46\";s:10:\"updated_at\";s:19:\"2024-10-29 12:05:03\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:4:{i:0;s:5:\"title\";i:1;s:11:\"description\";i:2;s:12:\"publish_date\";i:3;s:9:\"author_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:3:\"bio\";i:2;s:10:\"birth_date\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}',1730203568),('book_1','N;',1730192685),('book_2','O:15:\"App\\Models\\Book\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"books\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:2;s:5:\"title\";s:10:\"Store Book\";s:11:\"description\";s:4:\"Test\";s:12:\"publish_date\";s:10:\"2024-01-21\";s:9:\"author_id\";i:1;s:10:\"created_at\";s:19:\"2024-10-29 08:27:36\";s:10:\"updated_at\";s:19:\"2024-10-29 08:27:36\";}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:2;s:5:\"title\";s:10:\"Store Book\";s:11:\"description\";s:4:\"Test\";s:12:\"publish_date\";s:10:\"2024-01-21\";s:9:\"author_id\";i:1;s:10:\"created_at\";s:19:\"2024-10-29 08:27:36\";s:10:\"updated_at\";s:19:\"2024-10-29 08:27:36\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:4:{i:0;s:5:\"title\";i:1;s:11:\"description\";i:2;s:12:\"publish_date\";i:3;s:9:\"author_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}',1730192692);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_10_28_153543_create_authors_table',1),(5,'2024_10_28_154623_create_personal_access_tokens_table',1),(6,'2024_10_29_045246_create_books_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'altech-omega-andalan'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-29 19:07:33
