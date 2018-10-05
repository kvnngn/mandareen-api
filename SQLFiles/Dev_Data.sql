-- TEST DATA
INSERT INTO `subscription` (`name`, `price`, `max_patients`)
VALUES  ('discovery', 5, 5),
        ('classic', 25, 20),
        ('mandareen', 60, 2000);

INSERT INTO `pro` (`email`, `pass`, `civ`, `firstname`, `lastname`, `city`,`zipcode`, `adeli`, `phone`, `type`, `subscription_id`, `start_sub_date`, `end_sub_date`)
VALUES  ('alex.terrieur@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Alex', 'Terrieur', 'Paris', '50', '35', '0611821800', 'Doctor', 1, CURRENT_DATE, CURRENT_DATE + INTERVAL 1 MONTH),
        ('alain.terrieur@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Alain', 'Terrieur', 'Paris', '50', '35', '0611821801', 'Doctor', 3, CURRENT_DATE , CURRENT_DATE + INTERVAL 1 MONTH),
        ('amanda.rine@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Amanda', 'Rine', 'Le Kremlin-Bicêtre', '93', '34', '0611223344', 'Psy', 2, CURRENT_DATE , CURRENT_DATE + INTERVAL 1 MONTH),
        ('victor.hugo@test.fr', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Victor', 'Hugo', 'La Mouche', '50', '1234', '0605030320', 'Psy', 1, CURRENT_DATE - INTERVAL 10 MONTH, CURRENT_DATE - INTERVAL 8 MONTH);

INSERT INTO  `patient` (`email`, `pass`, `civ`, `firstname`, `lastname`, `birthdate`)
VALUES  ('jean.ko@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Jean', 'Ko', CURRENT_DATE - INTERVAL 20 YEAR),
        ('manda.reen@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Manda', 'Rine', CURRENT_DATE - INTERVAL 18 YEAR),
        ('test.mandareen@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'M', 'Test', 'Mandareen', CURRENT_DATE + INTERVAL 1 YEAR),
        ('test.refused@gmail.com', '$2a$05$WkcMIl.lXO8Qnz./o2l4HeLssZ.OYcHDZMVzXqXBtLhQshofMRfmy', 'Mme', 'Test', 'Refused', CURRENT_DATE );

INSERT INTO `report_pro` (`content`, `patient_id`, `pro_id`)
VALUES  ('il c passé plein de truc', 1, 1),
        ('mouahahahahaahahahahahahahahahah', 2, 1),
        ('il c passé des trucs 2', 1, 1),
        ('il c encore passé des trucs', 1, 1),
        ('mouahaha2.0', 2, 1),
        ('il a mangé un BK /!\\', 3, 3);

INSERT INTO `followup` (`id`, `cares_id`, `pro_id`, `patient_id`, `status`)
VALUES  (1, 1, 1, 1, 'Accepted'),
        (2, 2, 1, 2,  'Accepted'),
        (3, 3, 1, 3,  'Notification sent'),
        (4, 3, 2, 4,  'Refused');

INSERT INTO `diary` (`id`, `content`, `patient_id`, `mood_id`)
VALUES  (1, 'oncpasencoreaquoiilsert', 1, 1),
        (2, 'meh', 3, 2),
        (3, 'En ce jour de printemps (meme si on est en été), jai FROID', 2, 4);
