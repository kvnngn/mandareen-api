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
  `type` ENUM('Vendeur de BK', 'Doctor') NOT NULL,
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
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;


-- FK Creation
ALTER TABLE `pro` ADD CONSTRAINT FOREIGN KEY(`subscription_id`) REFERENCES subscription(`id`) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE `report_pro` ADD CONSTRAINT FOREIGN KEY(`patient_id`) REFERENCES patient(`id`) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE `report_pro` ADD CONSTRAINT FOREIGN KEY(`pro_id`) REFERENCES pro(`id`) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE `followup` ADD CONSTRAINT FOREIGN KEY(`patient_id`) REFERENCES patient(`id`) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE `followup` ADD CONSTRAINT FOREIGN KEY(`pro_id`) REFERENCES pro(`id`) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE `followup` ADD CONSTRAINT FOREIGN KEY(`cares_id`) REFERENCES cares(`id`) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE `diary` ADD CONSTRAINT FOREIGN KEY(`patient_id`) REFERENCES patient(`id`) ON UPDATE CASCADE ON DELETE NO ACTION;


INSERT INTO `admin` (`login`, `pass`, `email`, `firstname`, `lastname`, `type`)
VALUES ('root', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'contact.mandareen@gmail.com', 'Admin', 'Mandareen', 'Super-Admin');

-- TEST DATA
INSERT INTO `subscription` (`name`, `price`, `max_patients`)
VALUES  ('discovery', 5, 5),
        ('classic', 25, 20),
        ('mandareen', 60, 2000);

INSERT INTO `pro` (`email`, `pass`, `civ`, `firstname`, `lastname`, `city`,`zipcode`, `adeli`, `phone`, `type`, `subscription_id`, `start_sub_date`, `end_sub_date`)
VALUES  ('alex.terrieur@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Alex', 'Terrieur', 'Paris', '50', '35', '0611821800', 'Doctor', 1, CURRENT_DATE, CURRENT_DATE + INTERVAL 1 MONTH),
        ('alain.terrieur@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Alain', 'Terrieur', 'Paris', '50', '35', '0611821801', 'Doctor', 3, CURRENT_DATE , CURRENT_DATE + INTERVAL 1 MONTH),
        ('amanda.rine@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Amanda', 'Rine', 'Le Kremlin-Bicêtre', '93', '34', '0611223344', 'Vendeur de BK', 2, CURRENT_DATE , CURRENT_DATE + INTERVAL 1 MONTH),
        ('victor.hugo@test.fr', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Victor', 'Hugo', 'La Mouche', '50', '1234', '0605030320', 'Vendeur de BK', 1, CURRENT_DATE - INTERVAL 10 MONTH, CURRENT_DATE + INTERVAL 10 YEAR);

INSERT INTO  `patient` (`email`, `pass`, `civ`, `firstname`, `lastname`, `birthdate`)
VALUES  ('jean.ko@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Jean', 'Ko', CURRENT_DATE - INTERVAL 20 YEAR),
        ('manda.reen@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Manda', 'Rine', CURRENT_DATE - INTERVAL 18 YEAR),
        ('test.mandareen@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Test', 'Mandareen', CURRENT_DATE),
        ('test.refused@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Test', 'Refused', CURRENT_DATE );

INSERT INTO `cares` (`sickness_name`)
VALUES  ('g'),
        ('faim'),
        ('!');

INSERT INTO `report_pro` (`content`, `patient_id`, `pro_id`, `creation_date`)
VALUES  ('il c passé plein de truc', 1, 1, CURRENT_DATE - INTERVAL 2 MONTH),
        ('mouahahahahaahahahahahahahahahah', 2, 1, CURRENT_DATE - INTERVAL 1 MONTH),
        ('il c passé des trucs 2', 1, 1, CURRENT_DATE - INTERVAL 1 MONTH),
        ('il c encore passé des trucs', 1, 1, CURRENT_DATE),
        ('mouahaha2.0', 2, 1, CURRENT_DATE),
        ('il a mangé un BK /!\\', 3, 3, CURRENT_DATE);

INSERT INTO `followup` (`id`, `cares_id`, `pro_id`, `patient_id`, `status`)
VALUES  (1, 1, 1, 1, 'Accepted'),
        (2, 2, 1, 2,  'Accepted'),
        (3, 3, 1, 3,  'Notification sent'),
        (4, 3, 2, 4,  'Refused');

INSERT INTO `diary` (`content`, `patient_id`)
VALUES  ('oncpasencoreaquoiilsert', 1),
        ('meh', 3);