-- TEST DATA
INSERT INTO `subscription` (`name`, `price`, `max_patients`)
VALUES  ('discovery', 5, 5),
        ('classic', 25, 20),
        ('mandareen', 60, 2000);

INSERT INTO `pro` (`email`, `pass`, `civ`, `firstname`, `lastname`, `city`,`zipcode`, `adeli`, `phone`, `type`, `subscription_id`, `start_sub_date`, `end_sub_date`)
VALUES  ('alex.terrieur@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Alex', 'Terrieur', 'Paris', '50', '35', '0611821800', 'Doctor', NULL, CURRENT_DATE, CURRENT_DATE + INTERVAL 1 MONTH),
        ('alain.terrieur@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Alain', 'Terrieur', 'Paris', '50', '35', '0611821801', 'Doctor', NULL, CURRENT_DATE , CURRENT_DATE + INTERVAL 1 MONTH),
        ('amanda.rine@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Amanda', 'Rine', 'Le Kremlin-Bicêtre', '93', '34', '0611223344', 'Psy', NULL, CURRENT_DATE , CURRENT_DATE + INTERVAL 1 MONTH),
        ('victor.hugo@test.fr', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Victor', 'Hugo', 'La Mouche', '50', '1234', '0605030320', 'Psy', NULL, CURRENT_DATE - INTERVAL 10 MONTH, CURRENT_DATE - INTERVAL 8 MONTH);

INSERT INTO  `patient` (`email`, `pass`, `civ`, `firstname`, `lastname`, `birthdate`)
VALUES  ('jean.ko@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Jean', 'Ko', CURRENT_DATE - INTERVAL 20 YEAR),
        ('manda.reen@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Manda', 'Rine', CURRENT_DATE - INTERVAL 18 YEAR),
        ('test.mandareen@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Test', 'Mandareen', CURRENT_DATE + INTERVAL 1 YEAR),
        ('test.refused@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Test', 'Refused', CURRENT_DATE );
-- report pro test
INSERT INTO `report_pro` (`content`, `patient_id`, `pro_id`)
SELECT 'il c passé plein de truc',
		(SELECT `id` FROM `patient` where `email` = 'jean.ko@gmail.com'),
		`id`
FROM `pro`
WHERE `email` = 'alex.terrieur@gmail.com';
INSERT INTO `report_pro` (`content`, `patient_id`, `pro_id`)
SELECT 'mouahahahahaahahahahahahahahahah',
		(SELECT `id` FROM `patient` where `email` = 'manda.reen@gmail.com'),
		`id`
FROM `pro`
WHERE `email` = 'alex.terrieur@gmail.com';
INSERT INTO `report_pro` (`content`, `patient_id`, `pro_id`)
SELECT 'il c passé des trucs 2',
		(SELECT `id` FROM `patient` where `email` = 'jean.ko@gmail.com'),
		`id`
FROM `pro`
WHERE `email` = 'alex.terrieur@gmail.com';
INSERT INTO `report_pro` (`content`, `patient_id`, `pro_id`)
SELECT 'il c encore passé des trucs',
		(SELECT `id` FROM `patient` where `email` = 'jean.ko@gmail.com'),
		`id`
FROM `pro`
WHERE `email` = 'alex.terrieur@gmail.com';
INSERT INTO `report_pro` (`content`, `patient_id`, `pro_id`)
SELECT 'mouahaha2.0',
		(SELECT `id` FROM `patient` where `email` = 'manda.reen@gmail.com'),
		`id`
FROM `pro`
WHERE `email` = 'alex.terrieur@gmail.com';
INSERT INTO `report_pro` (`content`, `patient_id`, `pro_id`)
SELECT 'il a mangé un BK',
		(SELECT `id` FROM `patient` where `email` = 'test.mandareen@gmail.com'),
		`id`
FROM `pro`
WHERE `email` = 'amanda.rine@gmail.com';

INSERT INTO `diary` (`content`, `patient_id`, `mood_id`)
SELECT 'il c passé plein de truc',
		`id`,
		(SELECT `id` FROM `mood` where `mood_fr` = 'joie')
FROM `patient`
WHERE `email` = 'jean.ko@gmail.com';

INSERT INTO `diary` (`content`, `patient_id`, `mood_id`)
SELECT 'il c passé plein de truc',
		`id`,
		(SELECT `id` FROM `mood` where `mood_fr` = 'tristesse')
FROM `patient`
WHERE `email` = 'test.mandareen@gmail.com';

INSERT INTO `diary` (`content`, `patient_id`, `mood_id`)
SELECT 'il c passé plein de truc',
		`id`,
		(SELECT `id` FROM `mood` where `mood_fr` = 'dégoût')
FROM `patient`
WHERE `email` = 'manda.reen@gmail.com';
