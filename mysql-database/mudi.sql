-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: mudi
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `ix_auth_username` (`username`,`authority`),
  CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('edu','ROLE_ADM'),('joao','ROLE_ADM');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta`
--

DROP TABLE IF EXISTS `oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `oferta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `data_da_entrega` date DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `pedido_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp77nqk9cw6q3n828hb87vqv7` (`pedido_id`),
  CONSTRAINT `FKp77nqk9cw6q3n828hb87vqv7` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta`
--

LOCK TABLES `oferta` WRITE;
/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
INSERT INTO `oferta` VALUES (2,'Novamente mais uma oferta','2021-02-12',123.00,5),(3,'Gostei muito do produto, podemos negociar?','2021-04-12',12.12,5);
/*!40000 ALTER TABLE `oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_da_entrega` date DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `nome_produto` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `url_imagem` varchar(255) DEFAULT NULL,
  `url_produto` varchar(255) DEFAULT NULL,
  `valor_negociado` decimal(19,2) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjgvb1pj32pv4ub09dofgm2eoh` (`user_username`),
  CONSTRAINT `FKjgvb1pj32pv4ub09dofgm2eoh` FOREIGN KEY (`user_username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,NULL,'O Nintendo Switch foi desenvolvido para fazer parte da sua vida, transformando-se de um console doméstico em um console portátil num piscar de olhos.','Console Nintendo Switch - Cinza (Nacional)','AGUARDANDO','https://images-na.ssl-images-amazon.com/images/I/61Gz5KlfPcL._AC_SL1457_.jpg','https://www.amazon.com.br/Console-Nintendo-Switch-Cinza-Nacional/dp/B08LF4C647',NULL,'edu'),(2,NULL,'Conheça o novo Echo Dot com relógio: nosso smart speaker com relógio. O novo design de áudio com direcionamento frontal (1 speaker de 1,6\") garante mais graves e um som completo.','Novo Echo Dot (4ª geração): Smart Speaker com Relógio e Alexa - Cor Azul','AGUARDANDO','https://images-na.ssl-images-amazon.com/images/I/612knSUBO0L._AC_SL1000_.jpg','https://www.amazon.com.br/Staging-Product-Not-Retail-Sale/dp/B085M5P9LF/',NULL,'edu'),(4,NULL,'Leve sua criatividade a um novo nível Faça esboços e pinte com mais precisão.','Wacom One CTL472 - Mesa Digitalizadora','AGUARDANDO','https://images-na.ssl-images-amazon.com/images/I/71%2BxzUu92ZL._AC_SL1500_.jpg','https://www.amazon.com.br/Mesa-Digitalizadora-One-Wacom-CTL472/dp/B0785S55QQ',NULL,'joao'),(5,NULL,'Anel de Luz LED de 16 centímetros, desenvolvido para maquiadores, fotógrafos, cinegrafistas e etc, que buscam uma ótima maneira de iluminar com perfeição.','Anel de Luz LED 16 cm + Tripé','AGUARDANDO','https://images-na.ssl-images-amazon.com/images/I/512GnIVZJtL._AC_SL1000_.jpg','https://www.amazon.com.br/Iluminador-Light-Misto-3500K-5500K/dp/B07WFC5JY8',NULL,'joao'),(6,'2021-02-03','Desenvolvido para se mover com você: com um display HD de 10,1\" que se move automaticamente, as chamadas de vídeo, as receitas e os filmes e séries estarão sempre à vista.','Novo Echo Show 10','ENTREGUE','https://images-na.ssl-images-amazon.com/images/I/61SqUYUGEdL._AC_SL1000_.jpg','https://www.amazon.com.br/Novo-Echo-Show-10/dp/B084P4Q85Q/',NULL,'edu'),(7,'2021-02-04','Fire TV com Alexa: aproveite streaming rápido e em Full HD. Inclui Controle Remoto por Voz com Alexa, com botões de ligar e desligar e volume.','\r\nNovo Fire TV Stick com Controle Remoto por Voz com Alexa','ENTREGUE','https://images-na.ssl-images-amazon.com/images/I/616dVcez%2BnL._AC_SL1000_.jpg','https://www.amazon.com.br/Fire-TV-Stick-Streaming/dp/B08C1K6LB2/',NULL,'joao');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('edu','$2a$10$65B.aKTqSeiefd9gFW.lNekfPVcbf4S7sQZGtR/FSZyfAUe8fe94e',1),('joao','$2a$10$ZXm.lZXyTM.ZLGharNjkWuq6Cea8NZ4X4KA66v.n.qUn88YNd56wy',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mudi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 15:52:35
