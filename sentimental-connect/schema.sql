-- Create LinkedIn type database connecting people, schools and companies

CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(32),
    `year_founded` YEAR,
    PRIMARY KEY (`id`)
);


CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `sector` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`)
);


CREATE TABLE `connect_people` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `user2_id` INT UNSIGNED,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`user2_id`) REFERENCES `users`(`id`)
);


CREATE TABLE `connect_schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `start_date` DATE,
    `end_date` DATE,
    `degree` ENUM('BA', 'BSc', 'MA', 'PHD') NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`)
);


CREATE TABLE `connect_companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `company_id` INT UNSIGNED,
    `start_date` DATE,
    `end_date` DATE,
    `job_title` VARCHAR(32),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
);

