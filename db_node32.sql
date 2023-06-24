-- -------------------------------------------------------------
-- TablePlus 5.3.8(500)
--
-- https://tableplus.com/
--
-- Database: db_node32
-- Generation Time: 2023-06-18 21:51:12.2640
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(150) NOT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `code_order` varchar(100) NOT NULL,
  `arr_sub_id` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) NOT NULL,
  `sub_price` float NOT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Pizza', 'pizza.jpg', 9.99, 'Delicious pizza with tomato sauce and mozzarella cheese', 1),
(2, 'Taco', 'taco.jpg', 4.99, 'Spicy taco with ground beef and salsa', 2),
(3, 'Kung Pao Chicken', 'kungpaochicken.jpg', 12.99, 'Spicy Chinese dish with chicken and peanuts', 3),
(4, 'Butter Chicken', 'butterchicken.jpg', 11.99, 'Creamy Indian dish with chicken and tomato sauce', 4),
(5, 'Sushi', 'sushi.jpg', 14.99, 'Assorted sushi rolls with soy sauce and wasabi', 5),
(6, 'Lasagna', 'lasagna.jpg', 10.99, 'Classic Italian dish with layers of pasta, meat, and cheese', 1),
(7, 'Burrito', 'burrito.jpg', 7.99, 'Large flour tortilla filled with rice, beans, and meat', 2),
(8, 'Chow Mein', 'chowmein.jpg', 9.99, 'Stir-fried Chinese noodles with vegetables and meat', 3),
(9, 'Naan', 'naan.jpg', 2.99, 'Soft Indian bread baked in a tandoor oven', 4),
(10, 'Tempura', 'tempura.jpg', 8.99, 'Japanese dish with battered and deep-fried seafood and vegetables', 5);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Italian'),
(2, 'Mexican'),
(3, 'Chinese'),
(4, 'Indian'),
(5, 'Japanese');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2022-01-01 00:00:00'),
(1, 4, '2022-01-13 00:00:00'),
(1, 5, '2022-01-14 00:00:00'),
(2, 1, '2022-01-10 00:00:00'),
(2, 2, '2022-01-02 00:00:00'),
(2, 3, '2022-01-12 00:00:00'),
(2, 4, '2022-01-18 00:00:00'),
(3, 2, '2022-01-11 00:00:00'),
(3, 3, '2022-01-17 00:00:00'),
(3, 5, '2022-01-03 00:00:00'),
(4, 2, '2022-01-15 00:00:00'),
(4, 3, '2022-01-04 00:00:00'),
(4, 5, '2022-01-20 00:00:00'),
(5, 1, '2022-01-19 00:00:00'),
(5, 2, '2022-01-05 00:00:00'),
(5, 3, '2022-01-16 00:00:00'),
(5, 4, '2022-01-08 00:00:00'),
(6, 3, '2022-01-06 00:00:00'),
(7, 4, '2022-01-07 00:00:00'),
(9, 1, '2022-01-09 00:00:00');

INSERT INTO `orders` (`order_id`, `amount`, `code_order`, `arr_sub_id`, `user_id`, `food_id`) VALUES
(1, 1, 'ABC123', '1,2,3', 1, 1),
(2, 2, 'DEF456', '4,5,6', 2, 2),
(3, 3, 'GHI789', '7,8,9', 3, 3),
(4, 4, 'JKL012', '10,11,12', 4, 4),
(5, 5, 'MNO345', '1,2,3', 5, 5),
(6, 6, 'PQR678', '4,5,6', 6, 6),
(7, 2, 'STU901', '7,8,9', 7, 7),
(8, 3, 'VWX234', '10,11,12', 6, 8),
(9, 1, 'YZA567', '1,2,3', 9, 9),
(10, 2, 'BCD890', '4,5,6', 3, 10),
(11, 1, 'EFG123', '7,8,9', 1, 1),
(12, 2, 'HIJ456', '10,11,12', 2, 2),
(13, 3, 'KLM789', '1,2,3', 3, 3),
(14, 4, 'NOP012', '4,5,6', 4, 4),
(15, 5, 'QRS345', '7,8,9', 8, 5),
(16, 3, 'TUV678', '10,11,12', 6, 6),
(17, 2, 'WXY901', '1,2,3', 7, 7),
(18, 4, 'ZAB234', '4,5,6', 2, 8),
(19, 2, 'CDE567', '7,8,9', 9, 9),
(20, 1, 'FGH890', '10,11,12', 3, 7);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2022-01-01 00:00:00'),
(2, 2, 4, '2022-01-02 00:00:00'),
(3, 2, 3, '2022-01-03 00:00:00'),
(3, 4, 4, '2023-06-17 17:22:01'),
(4, 3, 2, '2022-01-04 00:00:00'),
(5, 5, 1, '2022-01-05 00:00:00'),
(6, 1, 5, '2022-01-06 00:00:00'),
(7, 3, 4, '2022-01-07 00:00:00'),
(8, 2, 3, '2022-01-08 00:00:00'),
(9, 3, 2, '2022-01-09 00:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Restaurant 1', 'image1.jpg', 'Description 1'),
(2, 'Restaurant 2', 'image2.jpg', 'Description 2'),
(3, 'Restaurant 3', 'image3.jpg', 'Description 3'),
(4, 'Restaurant 4', 'image4.jpg', 'Description 4'),
(5, 'Restaurant 5', 'image5.jpg', 'Description 5');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Pepperoni', 1.99, 1),
(2, 'Mushroom', 2.99, 1),
(3, 'Beef', 3.99, 2),
(4, 'Chicken', 2.99, 2),
(5, 'Shrimp', 2.99, 3),
(6, 'Tofu', 3.99, 3),
(7, 'Garlic Naan', 2.99, 4),
(8, 'Butter Naan', 1.99, 4),
(9, 'California Roll', 4.99, 5),
(10, 'Spicy Tuna Roll', 5.99, 5),
(11, 'subfood 6', 1.99, 6),
(12, 'subfood 7', 2.99, 7),
(13, 'subfood 8', 3.99, 8),
(14, 'subfood 9', 2.99, 9),
(15, 'subfood 10', 1.99, 10);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'johndoe@example.com', 'password123'),
(2, 'Jane Smith', 'janesmith@example.com', 'password456'),
(3, 'Bob Johnson', 'bobjohnson@example.com', 'password789'),
(4, 'Alice Lee', 'alicelee@example.com', 'passwordabc'),
(5, 'Tom Wilson', 'tomwilson@example.com', 'passworddef'),
(6, 'Sara Brown', 'sarabrown@example.com', 'passwordghi'),
(7, 'Mike Davis', 'mikedavis@example.com', 'passwordjkl'),
(8, 'Emily Taylor', 'emilytaylor@example.com', 'passwordmno'),
(9, 'David Clark', 'davidclark@example.com', 'passwordpqr'),
(10, 'Amy Adams', 'amyadams@example.com', 'passwordstu');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;