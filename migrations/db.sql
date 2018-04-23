CREATE TABLE IF NOT EXISTS `admin`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `login` VARCHAR(20) NOT NULL,
    `pass` VARCHAR(200) NOT NULL,
    `firstname` VARCHAR(100) NOT NULL,
    `lastname` VARCHAR(100) NOT NULL,
    `type` ENUM('Commercial', 'Admin', 'Super-Admin') NOT NULL,
    `creation_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    UNIQUE KEY `login`(`login`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS `pro` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(100) NOT NULL,
    `pass` VARCHAR(200) NOT NULL,
    `civ` ENUM('M', 'Mme') NOT NULL,
    `firstname` VARCHAR(100) NOT NULL,
    `lastname` VARCHAR(100) NOT NULL,
    `city` VARCHAR(150) NOT NULL,
    `phone` VARCHAR(15) NOT NULL,
    `type` ENUM('Vendeur de BK', 'Doctor') NOT NULL,
    `subscription_id` int,
    `start_sub_date` date,
    `end_sub_date` date,
    `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    UNIQUE KEY email(`email`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `report_pro` (
`id` INT NOT NULL AUTO_INCREMENT,
`content` VARCHAR(255) DEFAULT NULL,
`patient_id` INT NOT NULL,
`pro_id` INT NOT NULL,
`creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `patient` (
`id` INT NOT NULL AUTO_INCREMENT,
`email` VARCHAR(100) NOT NULL,
`pass` VARCHAR(200) NOT NULL,
`civ` ENUM('M', 'Mme') NOT NULL,
`firstname` VARCHAR(100) NOT NULL,
`lastname` VARCHAR(100) NOT NULL,
`creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
`birthdate` DATE NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `subscription` (
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`price` DECIMAL(15,2) NOT NULL,
`max_patients` INT NOT NULL,
`creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cares` (
`id` INT NOT NULL AUTO_INCREMENT,
`sickness_name` VARCHAR(100) NOT NULL,
`creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `followup` (
`id` INT NOT NULL AUTO_INCREMENT,
`cares_id` INT NOT NULL,
`pro_id` INT NOT NULL,
`patient_id` INT NOT NULL,
`status` ENUM('Accepted', 'Refused', 'Notification sent'),
`creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `diary` (
`id` INT NOT NULL AUTO_INCREMENT,
`content` VARCHAR(50) NOT NULL,
`patient_id` INT NOT NULL,
`creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

INSERT INTO `admin` (`login`, `pass`, `firstname`, `lastname`, `type`)
VALUES ('root', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Admin', 'Mandareen', 'Super-Admin');
