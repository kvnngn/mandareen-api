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
  `content` VARCHAR(255) NOT NULL,
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
  `ingredients` VARCHAR(255) NOT NULL,
  `description` VARCHAR(2048),
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mood` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mood_fr` VARCHAR(50) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- FK Creation
ALTER TABLE pro ADD CONSTRAINT FOREIGN KEY(subscription_id) REFERENCES subscription(id) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE report_pro ADD CONSTRAINT FOREIGN KEY(patient_id) REFERENCES patient(id) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE report_pro ADD CONSTRAINT FOREIGN KEY(pro_id) REFERENCES pro(id) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE followup ADD CONSTRAINT FOREIGN KEY(patient_id) REFERENCES patient(id) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE followup ADD CONSTRAINT FOREIGN KEY(pro_id) REFERENCES pro(id) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE followup ADD CONSTRAINT FOREIGN KEY(cares_id) REFERENCES cares(id) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE diary ADD CONSTRAINT FOREIGN KEY(patient_id) REFERENCES patient(id) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE diary ADD CONSTRAINT FOREIGN KEY(mood_id) REFERENCES mood(id) ON UPDATE CASCADE ON DELETE NO ACTION;


INSERT INTO admin (login, pass, email, firstname, lastname, type)
VALUES ('root', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'contact.mandareen@gmail.com', 'Admin', 'Mandareen', 'Super-Admin');

INSERT INTO mood (id, mood_fr)
VALUES  (1, 'joie'),
        (2, 'tristesse'),
        (3, 'colère'),
        (4, 'dégoût'),
        (5, 'peur'),
        (6, 'surprise'),
        (7, 'mépris');

INSERT INTO cares (sickness_name)
VALUES  ('Anorexie'),
        ('Boulimie'),
        ('Hyperphagie');

-- TEST DATA
INSERT INTO subscription (name, price, max_patients)
VALUES  ('discovery', 5, 5),
        ('classic', 25, 20),
        ('mandareen', 60, 2000);
INSERT INTO pro (email, pass, civ, firstname, lastname, city,zipcode, adeli, phone, type, subscription_id, start_sub_date, end_sub_date)
VALUES  ('alex.terrieur@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Alex', 'Terrieur', 'Paris', '50', '35', '0611821800', 'Doctor', 1, CURRENT_DATE, CURRENT_DATE + INTERVAL 1 MONTH),
        ('alain.terrieur@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Alain', 'Terrieur', 'Paris', '50', '35', '0611821801', 'Doctor', 3, CURRENT_DATE , CURRENT_DATE + INTERVAL 1 MONTH),
        ('amanda.rine@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Amanda', 'Rine', 'Le Kremlin-Bicêtre', '93', '34', '0611223344', 'Psy', 2, CURRENT_DATE , CURRENT_DATE + INTERVAL 1 MONTH),
        ('victor.hugo@test.fr', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Victor', 'Hugo', 'La Mouche', '50', '1234', '0605030320', 'Psy', 1, CURRENT_DATE - INTERVAL 10 MONTH, CURRENT_DATE - INTERVAL 8 MONTH);

INSERT INTO  patient (email, pass, civ, firstname, lastname, birthdate)
VALUES  ('jean.ko@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Jean', 'Ko', CURRENT_DATE - INTERVAL 20 YEAR),
        ('manda.reen@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Manda', 'Rine', CURRENT_DATE - INTERVAL 18 YEAR),
        ('test.mandareen@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Test', 'Mandareen', CURRENT_DATE + INTERVAL 1 YEAR),
        ('test.refused@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Test', 'Refused', CURRENT_DATE );
INSERT INTO report_pro (content, patient_id, pro_id, creation_date)
VALUES  ('il c passé plein de truc', 1, 1, CURRENT_DATE - INTERVAL 2 MONTH),
        ('mouahahahahaahahahahahahahahahah', 2, 1, CURRENT_DATE - INTERVAL 1 MONTH),
        ('il c passé des trucs 2', 1, 1, CURRENT_DATE - INTERVAL 1 MONTH),
        ('il c encore passé des trucs', 1, 1, CURRENT_DATE),
        ('mouahaha2.0', 2, 1, CURRENT_DATE),
        ('il a mangé un BK /!\\', 3, 3, CURRENT_DATE);
INSERT INTO followup (id, cares_id, pro_id, patient_id, status)
VALUES  (1, 1, 1, 1, 'Accepted'),
        (2, 2, 1, 2,  'Accepted'),
        (3, 3, 1, 3,  'Notification sent'),
        (4, 3, 2, 4,  'Refused');

INSERT INTO diary (id, content, patient_id, mood_id)
VALUES  (1, 'oncpasencoreaquoiilsert', 1, 1),
        (2, 'meh', 3, 2),
        (3, 'En ce jour de printemps (meme si on est en été), jai FROID', 2, 4);

INSERT INTO `recipe` (`name`,`nb_cal`,`ingredients`,`description`)
VALUES  ('Tarte minceur aux courgettes, aux tomates et au chèvre', 293,'1 pâte feuilletée;2 ou 3 courgettes;1 filet de poulet cuit;1 tomate;1/2 bûche de chèvre;gruyère râpé allégé;moutarde', 'ÉTAPE 1;Préchauffez le four à 180°C (th.6). Épluchez les courgettes et coupez-les en rondelles. Faites-les cuire à la vapeur. Piquez la pâte et badigeonnez-la de moutarde.;ÉTAPE 2;Coupez la tomate en rondelles, la demie bûche de chèvre en morceaux et le filet de poulet en tout petits morceaux. Quand les courgettes sont cuites, disposez-les sur la pâte. Ajoutez les rondelles de tomates, puis les petits cubes de poulet.;ÉTAPE 3;Disposez les morceaux de chèvre, le gruyère râpé allégé, salez et poivrez. Enfournez 30 min.'),
    ('Tarte aux poireaux minceur', 282,'1 pâte brisée prête à dérouler;500 g de poireaux en rondelles;250 ml de lait demi écrémé;100 g de gruyère râpé 6% de MG;15 g de beurre;10 g de farine de blé','ÉTAPE 1;Préchauffez le four à 180°C (th.6).;ÉTAPE 2;Lavez et coupez les poireaux en rondelles.;Faites chauffer le beurre dans une cocotte et incorporez les poireaux. Laissez cuire 5 à 10 min. Saupoudrez de farine et mélangez. Versez le lait, salez et poivrez et laissez cuire 5 min.;ÉTAPE 3;Froncez la pâte dans un moule rond et versez la préparation en déposant les rondelles de poireaux et parsemez d\'emmental râpé.;ÉTAPE 4;Enfournez pendant 40 min.'),
        ('Salade de riz au surimi minceur', 179, '150 g de riz long;1 concombre;8 bâtonnets de surimi;1 poivron rouge;2 c. à soupe d\'huile d\'olive;1 c. à soupe de vinaigre de vin;10 brins de ciboulette;jus d\'un citron frais;sel, poivre', 'ÉTAPE 1;Faites cuire le riz comme indiqué sur le paquet. Égouttez-le et laissez refroidir.;ÉTAPE 2;Coupez le poivron en 2, épépinez-le et coupez-le en petits dés. Lavez le concombre et coupez-le en rondelles. Taillez les bâtonnets de surimi en cubes. Lavez et ciselez la ciboulette. Dans un saladier, mélangez tous les ingrédients de salade.;ÉTAPE 3;Préparez une vinaigrette avec l\'huile, le vinaigre, le sel et le poivre. Versez-la sur la salade et mélangez bien.;ÉTAPE 4;Gardez au frais jusqu\'au moment de servir.'),
        ('Mousse légère à la banane et aux poires', 294, '2 bananes bien mûres;2 poires;4 petits suisses;2 c. à soupe de crème double;3 c. à soupe de sucre en poudre;1 c. à soupe de jus de citron;quelques biscuits façon macarons pour la décoration', 'ÉTAPE 1;Écrasez les bananes à la fourchette avec le jus de citron pour former un jus de banane. Ajoutez les petits suisses et le sucre. Mélangez au fouet puis ajoutez la crème. Battez la mousse de bananes ou mixez-la encore quelques instants.;ÉTAPE 2;Pelez les poires et coupez-les en petits dés. Mélangez-les à la mousse légère de bananes. Mettez le tout au frais pendant 3 heures. Servez.'),
        ('Mousse au fromage blanc minceur', 257, '1 kg de fromage blanc à 0% de MG;9 feuilles de gélatine;2 c. à soupe d\'édulcorant vanille ou citron;4 blancs d\'oeufs;40 cl de nectar de fruits allégé en sucres ou coulis de fruits rouges', 'ÉTAPE 1;Mélangez dans un saladier le fromage blanc et l\'édulcorant. Mettez à tremper les feuilles de gélatine dans de l\'eau froide afin qu\'elles ramollissent. Puis faites-les fondre dans une casserole avec 3 à 4 c. à soupe d\'eau.;ÉTAPE 2;Une fois fondues, incorporez-les dans le fromage blanc édulcoré. Mélangez correctement pour que la gélatine fondue soit bien incorporée au fromage blanc. Réservez. Pendant ce temps, battez les blancs en neige bien ferme avec une pincée de sel. Puis incorporez vos blancs en neige aussitôt au mélange fromage blanc et gélatine.;ÉTAPE 3;Placez au réfrigérateur pendant 5 heures votre mousse de fromage blanc pour qu\'il soit bien ferme. Servez ensuite votre mousse dans des coupes. Nappez-le de nectar, d\'un coulis de fruits rouges, ou de jus vitaminé au choix pour le côté gourmand.');


-- FIN--