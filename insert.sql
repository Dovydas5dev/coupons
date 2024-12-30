CREATE TABLE `used_coupons` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `player_id` VARCHAR(50) NOT NULL,
    `coupon_code` VARCHAR(100) NOT NULL,
    `used_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_coupon_usage` (`player_id`, `coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
