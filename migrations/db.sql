CREATE TABLE IF NOT EXISTS `admin`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(20) NOT NULL,
  `pass` VARCHAR(200) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `firstname` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `type` ENUM('Commercial', 'Admin', 'Super-Admin') NOT NULL,
  `creation_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`id`),
  UNIQUE KEY `login`(`login`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS `subscription` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `price` DECIMAL(15,2) NOT NULL,
  `max_patients` INT NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `pass` VARCHAR(200) NOT NULL,
  `civ` ENUM('M', 'Mme') NOT NULL,
  `firstname` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `city` VARCHAR(150) NOT NULL,
  `zipcode` INT NOT NULL,
  `adeli` INT NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `type` ENUM('Psy', 'Doctor') NOT NULL,
  `subscription_id` INT,
  `start_sub_date` DATE,
  `end_sub_date` DATE,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`id`),
  UNIQUE KEY email(`email`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `patient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `pass` VARCHAR(200) NOT NULL,
  `civ` ENUM('M', 'Mme') NOT NULL,
  `firstname` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `birthdate` DATE NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cares` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sickness_name` VARCHAR(100) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `report_pro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(255) DEFAULT NULL,
  `patient_id` INT NOT NULL,
  `pro_id` INT NOT NULL,
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
  `mood_id` INT NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `img_path` VARCHAR(255),
  `nb_cal` INTEGER NOT NULL,
  `ingredient` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255),
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mood` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mood_fr` VARCHAR(50) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;


INSERT INTO `admin` (`login`, `pass`, `email`, `firstname`, `lastname`, `type`)
VALUES ('root', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'contact.mandareen@gmail.com', 'Admin', 'Mandareen', 'Super-Admin');

INSERT INTO `mood` (`id`, `mood_fr`)
VALUES  (1, 'joie'),
        (2, 'tristesse'),
        (3, 'colère'),
        (4, 'dégoût'),
        (5, 'peur'),
        (6, 'surprise'),
        (7, 'mépris');

INSERT INTO `cares` (`sickness_name`)
VALUES  ('Anorexie'),
        ('Boulimie'),
        ('Hyperphagie');
        