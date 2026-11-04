-- DROP IF Orphan: table definitions (17 tables).
-- Team schema from the DROP IF Orphan capstone. Run against a new, empty database.
-- This script does not drop or create a database.

CREATE TABLE `store_info` (
    `store_id` INT NOT NULL PRIMARY KEY,
    `store_name` VARCHAR(100) NOT NULL,
    `store_address` VARCHAR(100) NOT NULL,
    `store_email` VARCHAR(100) NOT NULL,
    `store_phone` CHAR(10) NOT NULL
);

CREATE TABLE `store_hours` (
    `store_id` INT NOT NULL,
    `days_of_week` TINYINT NOT NULL,
    `opening_hours` TIME NULL,
    `closing_hours` TIME NULL,

    PRIMARY KEY (`store_id`, `days_of_week`),

    FOREIGN KEY (`store_id`) REFERENCES `store_info` (`store_id`) ON DELETE CASCADE
);

CREATE TABLE `employees` (
    `employee_id` INT NOT NULL PRIMARY KEY,
    `employee_name` VARCHAR(50) NOT NULL,
    `employee_email` VARCHAR(50) NOT NULL UNIQUE,
    `employee_phone` VARCHAR(20) NOT NULL UNIQUE,
    `salary` DECIMAL(6, 2) NOT NULL,
    `hire_date` DATE NOT NULL,
    `store_id` INT NOT NULL,
    `position` VARCHAR(50) NOT NULL,

    FOREIGN KEY (`store_id`) REFERENCES `store_info` (`store_id`) ON DELETE RESTRICT
);

CREATE TABLE `tables` (
    `table_id` INT NOT NULL PRIMARY KEY,
    `table_price_per_hour` DECIMAL(5, 2) NOT NULL,
    `pricing_rules_id` INT NULL,
    `store_id` INT NOT NULL,

    FOREIGN KEY (`store_id`) REFERENCES `store_info` (`store_id`) ON DELETE CASCADE
);

CREATE TABLE `pricing_rules` (
    `pricing_rules_id` INT NOT NULL PRIMARY KEY,
    `days_of_week` VARCHAR(20) NOT NULL,
    `start_time` TIME NOT NULL,
    `end_time` TIME NOT NULL,
    `modifier` DECIMAL(4, 2) NOT NULL,
    `peak_hours` TIME NULL
);

ALTER TABLE `tables`
ADD FOREIGN KEY (`pricing_rules_id`) REFERENCES
                `pricing_rules` (`pricing_rules_id`) ON DELETE SET NULL;

CREATE TABLE `features` (
    `feature_id` INT NOT NULL PRIMARY KEY,
    `feature_name` VARCHAR(50),
    `price_per_hour` DECIMAL(5, 2) NOT NULL
);

CREATE TABLE `table_features` (
    `table_feature_id` INT NOT NULL PRIMARY KEY,
    `table_id` INT NOT NULL,
    `feature_id` INT NOT NULL,
    `value_numerical` INT NOT NULL,

    UNIQUE KEY (`table_id`, `feature_id`),

    FOREIGN KEY (`table_id`) REFERENCES `tables` (`table_id`) ON DELETE CASCADE,
    FOREIGN KEY (`feature_id`) REFERENCES `features` (`feature_id`) ON DELETE CASCADE
);

CREATE TABLE `customers` (
    `customer_id` INT NOT NULL PRIMARY KEY,
    `customer_name` VARCHAR(50) NOT NULL,
    `customer_email` VARCHAR(50) NOT NULL UNIQUE,
    `date_registered` DATETIME NOT NULL
);

CREATE TABLE `transactions` (
    `transaction_id` INT NOT NULL PRIMARY KEY,
    `transaction_date` DATETIME NOT NULL,
    `employee_id` INT NOT NULL,
    `transaction_total` DECIMAL(8,2) NOT NULL,
    `customer_id` INT NOT NULL,

    FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
);

CREATE TABLE `reservations` (
    `reservation_id` INT NOT NULL PRIMARY KEY,
    `customer_id` INT NOT NULL,
    `num_guests` INT NOT NULL,
    `reservation_date_time` DATETIME NOT NULL,
    `num_tables` INT NOT NULL,
    `transaction_id` INT,

    FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
    FOREIGN KEY (`transaction_id`) REFERENCES
                `transactions` (`transaction_id`) ON DELETE SET NULL
);

CREATE TABLE `table_reservations` (
    `table_reservations_id` INT NOT NULL PRIMARY KEY,
    `reservation_id` INT NOT NULL,
    `table_id` INT NOT NULL,
    `reservation_start` DATETIME NOT NULL,
    `reservation_end` DATETIME NOT NULL,

    FOREIGN KEY (`reservation_id`) REFERENCES
                `reservations` (`reservation_id`) ON DELETE CASCADE,
    FOREIGN KEY (`table_id`) REFERENCES `tables` (`table_id`) ON DELETE RESTRICT
);

CREATE TABLE `categories` (
    `category_id` INT NOT NULL PRIMARY KEY,
    `category_name` VARCHAR(50) NOT NULL
);

CREATE TABLE `products` (
    `product_id` INT NOT NULL PRIMARY KEY,
    `product_name` VARCHAR(100) NOT NULL,
    `price` DECIMAL(5, 2) NOT NULL,
    `category_id` INT NOT NULL,

    FOREIGN KEY (`category_id`) REFERENCES
                `categories` (`category_id`) ON DELETE CASCADE
);

CREATE TABLE `attributes` (
    `attribute_id` INT NOT NULL PRIMARY KEY,
    `attribute_name` VARCHAR(50) NOT NULL
);

CREATE TABLE `product_attributes` (
    `product_id` INT NOT NULL,
    `attribute_id` INT NOT NULL,
    `value_numerical` INT NULL,
    `value_categorical` VARCHAR(50) NULL,

    PRIMARY KEY (`product_id`, `attribute_id`),

    FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
    FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`attribute_id`) ON DELETE CASCADE
);

CREATE TABLE `inventory` (
    `inventory_id` INT NOT NULL PRIMARY KEY,
    `product_id` INT NOT NULL,
    `stock` INT NOT NULL,
    `store_id` INT NOT NULL,

    UNIQUE (`product_id`, `store_id`),

    FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT,
    FOREIGN KEY (`store_id`) REFERENCES `store_info` (`store_id`) ON DELETE CASCADE
);

CREATE TABLE `transaction_records` (
    `transaction_id` INT NOT NULL,
    `inventory_id` INT NOT NULL,
    `item_quantity` INT NOT NULL,
    `returned_quantity` INT NOT NULL,
    PRIMARY KEY (
        `transaction_id`,
        `inventory_id`
    ),
    FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON DELETE CASCADE,
    FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE CASCADE
);

