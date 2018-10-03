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

INSERT INTO `recipes` (`name`,`nb_cal`,`ingredients`,`description`)
VALUES	('Tarte minceur aux courgettes, aux tomates et au chèvre', 293,'1 pâte feuilletée;2 ou 3 courgettes;1 filet de poulet cuit;1 tomate;1/2 bûche de chèvre;gruyère râpé allégé;moutarde', 'ÉTAPE 1;Préchauffez le four à 180°C (th.6). Épluchez les courgettes et coupez-les en rondelles. Faites-les cuire à la vapeur. Piquez la pâte et badigeonnez-la de moutarde.;ÉTAPE 2;Coupez la tomate en rondelles, la demie bûche de chèvre en morceaux et le filet de poulet en tout petits morceaux. Quand les courgettes sont cuites, disposez-les sur la pâte. Ajoutez les rondelles de tomates, puis les petits cubes de poulet.;ÉTAPE 3;Disposez les morceaux de chèvre, le gruyère râpé allégé, salez et poivrez. Enfournez 30 min.'),
		('Tarte aux poireaux minceur', 282,'1 pâte brisée prête à dérouler;500 g de poireaux en rondelles;250 ml de lait demi écrémé;100 g de gruyère râpé 6% de MG;15 g de beurre;10 g de farine de blé','ÉTAPE 1;Préchauffez le four à 180°C (th.6).;ÉTAPE 2;Lavez et coupez les poireaux en rondelles.;Faites chauffer le beurre dans une cocotte et incorporez les poireaux. Laissez cuire 5 à 10 min. Saupoudrez de farine et mélangez. Versez le lait, salez et poivrez et laissez cuire 5 min.;ÉTAPE 3;Froncez la pâte dans un moule rond et versez la préparation en déposant les rondelles de poireaux et parsemez d\'emmental râpé.;ÉTAPE 4;Enfournez pendant 40 min.'),
        ('Salade de riz au surimi minceur', 179, '150 g de riz long;1 concombre;8 bâtonnets de surimi;1 poivron rouge;2 c. à soupe d\'huile d\'olive;1 c. à soupe de vinaigre de vin;10 brins de ciboulette;jus d\'un citron frais;sel, poivre', 'ÉTAPE 1;Faites cuire le riz comme indiqué sur le paquet. Égouttez-le et laissez refroidir.;ÉTAPE 2;Coupez le poivron en 2, épépinez-le et coupez-le en petits dés. Lavez le concombre et coupez-le en rondelles. Taillez les bâtonnets de surimi en cubes. Lavez et ciselez la ciboulette. Dans un saladier, mélangez tous les ingrédients de salade.;ÉTAPE 3;Préparez une vinaigrette avec l\'huile, le vinaigre, le sel et le poivre. Versez-la sur la salade et mélangez bien.;ÉTAPE 4;Gardez au frais jusqu\'au moment de servir.'),
        ('Mousse légère à la banane et aux poires', 294, '2 bananes bien mûres;2 poires;4 petits suisses;2 c. à soupe de crème double;3 c. à soupe de sucre en poudre;1 c. à soupe de jus de citron;quelques biscuits façon macarons pour la décoration', 'ÉTAPE 1;Écrasez les bananes à la fourchette avec le jus de citron pour former un jus de banane. Ajoutez les petits suisses et le sucre. Mélangez au fouet puis ajoutez la crème. Battez la mousse de bananes ou mixez-la encore quelques instants.;ÉTAPE 2;Pelez les poires et coupez-les en petits dés. Mélangez-les à la mousse légère de bananes. Mettez le tout au frais pendant 3 heures. Servez.'),
        ('Mousse au fromage blanc minceur', 257, '1 kg de fromage blanc à 0% de MG;9 feuilles de gélatine;2 c. à soupe d\'édulcorant vanille ou citron;4 blancs d\'oeufs;40 cl de nectar de fruits allégé en sucres ou coulis de fruits rouges', 'ÉTAPE 1;Mélangez dans un saladier le fromage blanc et l\'édulcorant. Mettez à tremper les feuilles de gélatine dans de l\'eau froide afin qu\'elles ramollissent. Puis faites-les fondre dans une casserole avec 3 à 4 c. à soupe d\'eau.;ÉTAPE 2;Une fois fondues, incorporez-les dans le fromage blanc édulcoré. Mélangez correctement pour que la gélatine fondue soit bien incorporée au fromage blanc. Réservez. Pendant ce temps, battez les blancs en neige bien ferme avec une pincée de sel. Puis incorporez vos blancs en neige aussitôt au mélange fromage blanc et gélatine.;ÉTAPE 3;Placez au réfrigérateur pendant 5 heures votre mousse de fromage blanc pour qu\'il soit bien ferme. Servez ensuite votre mousse dans des coupes. Nappez-le de nectar, d\'un coulis de fruits rouges, ou de jus vitaminé au choix pour le côté gourmand.');
