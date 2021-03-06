CREATE TABLE IF NOT EXISTS `admin`(
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
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
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `name` VARCHAR(50) NOT NULL,
  `price` DECIMAL(15,2) NOT NULL,
  `max_patients` INT NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `subs_pro`(
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `pro_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `sub_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `pending` ENUM('Yes', 'No') NOT NULL DEFAULT 'Yes',
  `date_sub_start` DATE NOT NULL,
  `date_sub_end` DATE NOT NULL,
  `creation_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS `pro` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
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
  `subscription_id` VARCHAR(100) DEFAULT 'default_value',
  `start_sub_date` DATE,
  `end_sub_date` DATE,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`id`),
  UNIQUE KEY email(`email`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `patient` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `email` VARCHAR(100) NOT NULL,
  `pass` VARCHAR(200) NOT NULL,
  `civ` ENUM('M', 'Mme') NOT NULL,
  `firstname` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `birthdate` DATE NOT NULL,
  `nb_sleep` INT,
  `nb_cal` INT,
  `nb_sport` INT,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cares` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `sickness_name` VARCHAR(100) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `report_pro` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `content` VARCHAR(255) DEFAULT NULL,
  `patient_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `pro_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `followup` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `cares_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `pro_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `patient_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `status` ENUM('Accepted', 'Refused', 'Notification sent'),
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `diary` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `content` VARCHAR(100) NOT NULL,
  `patient_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `mood_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `recipes` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `name` VARCHAR(255) NOT NULL,
  `nb_cal` INTEGER NOT NULL,
  `ingredients` VARCHAR(1024) NOT NULL,
  `description` VARCHAR(2048),
  `image` LONGBLOB NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mood` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `mood_fr` VARCHAR(50) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `stats` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `id_patient` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `report_date` DATE NOT NULL,
  `app_time` TIME,
  `recipe_time` TIME,
  `diary_time` TIME,
  `music_genre` VARCHAR(255),
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `devices` (
  `id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `token` VARCHAR(255) NOT NULL,
  `platform` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `uuid` VARCHAR(45) NOT NULL,
  `patient_id` VARCHAR(100) NOT NULL DEFAULT 'default_value',
  `app_version` VARCHAR(255) NOT NULL,
  `version` VARCHAR(255) NOT NULL,
  `mod_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
