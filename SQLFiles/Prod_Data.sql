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

INSERT INTO `recipes` (`name`, `img_path`,`nb_cal`,`ingredients`,`description`)
VALUES  ('Tarte minceur aux courgettes, aux tomates et au chèvre', 'Tarte minceur aux courgettes, aux tomates et au chèvre.jpg', 293,'1 pâte feuilletée;2 ou 3 courgettes;1 filet de poulet cuit;1 tomate;1/2 bûche de chèvre;gruyère râpé allégé;moutarde', 'ÉTAPE 1;Préchauffez le four à 180°C (th.6).;Épluchez les courgettes et coupez-les en rondelles.;Faites-les cuire à la vapeur.;Piquez la pâte et badigeonnez-la de moutarde.;ÉTAPE 2;Coupez la tomate en rondelles, la demie bûche de chèvre en morceaux et le filet de poulet en tout petits morceaux.;Quand les courgettes sont cuites, disposez-les sur la pâte.;Ajoutez les rondelles de tomates, puis les petits cubes de poulet.;ÉTAPE 3;Disposez les morceaux de chèvre, le gruyère râpé allégé, salez et poivrez.;Enfournez 30 min.'),
        ('Tarte aux poireaux minceur', 'Tarte aux poireaux minceur.jpg', 282,'1 pâte brisée prête à dérouler;500 g de poireaux en rondelles;250 ml de lait demi écrémé;100 g de gruyère râpé 6% de MG;15 g de beurre;10 g de farine de blé','ÉTAPE 1;Préchauffez le four à 180°C (th.6).;;ÉTAPE 2;Lavez et coupez les poireaux en rondelles.;Faites chauffer le beurre dans une cocotte et incorporez les poireaux.;Laissez cuire 5 à 10 min.;Saupoudrez de farine et mélangez.;Versez le lait, salez et poivrez et laissez cuire 5 min.;ÉTAPE 3;Froncez la pâte dans un moule rond et versez la préparation en déposant les rondelles de poireaux et parsemez d\'emmental râpé.;ÉTAPE 4;Enfournez pendant 40 min.'),
        ('Salade de riz au surimi minceur', 'Salade de riz au surimi.jpeg', 179, '150 g de riz long;1 concombre;8 bâtonnets de surimi;1 poivron rouge;2 c. à soupe d\'huile d\'olive;1 c. à soupe de vinaigre de vin;10 brins de ciboulette;jus d\'un citron frais;sel, poivre', 'ÉTAPE 1;Faites cuire le riz comme indiqué sur le paquet.;Égouttez-le et laissez refroidir.;ÉTAPE 2;Coupez le poivron en 2, épépinez-le et coupez-le en petits dés.;Lavez le concombre et coupez-le en rondelles.;Taillez les bâtonnets de surimi en cubes.;Lavez et ciselez la ciboulette.;Dans un saladier, mélangez tous les ingrédients de salade.;ÉTAPE 3;Préparez une vinaigrette avec l\'huile, le vinaigre, le sel et le poivre.;Versez-la sur la salade et mélangez bien.;ÉTAPE 4;Gardez au frais jusqu\'au moment de servir.'),
        ('Mousse légère à la banane et aux poires', 'Mousse légère à la banane et à la poire.jpg', 294, '2 bananes bien mûres;2 poires;4 petits suisses;2 c. à soupe de crème double;3 c. à soupe de sucre en poudre;1 c. à soupe de jus de citron;quelques biscuits façon macarons pour la décoration', 'ÉTAPE 1;Écrasez les bananes à la fourchette avec le jus de citron pour former un jus de banane.;Ajoutez les petits suisses et le sucre.;Mélangez au fouet puis ajoutez la crème.;Battez la mousse de bananes ou mixez-la encore quelques instants.;ÉTAPE 2;Pelez les poires et coupez-les en petits dés.;Mélangez-les à la mousse légère de bananes.;Mettez le tout au frais pendant 3 heures.;Servez.'),
        ('Mousse au fromage blanc minceur', 'Mousse au fromage blanc minceur.jpg', 257, '1 kg de fromage blanc à 0% de MG;9 feuilles de gélatine;2 c. à soupe d\'édulcorant vanille ou citron;4 blancs d\'oeufs;40 cl de nectar de fruits allégé en sucres ou coulis de fruits rouges', 'ÉTAPE 1;Mélangez dans un saladier le fromage blanc et l\'édulcorant.;Mettez à tremper les feuilles de gélatine dans de l\'eau froide afin qu\'elles ramollissent.;Puis faites-les fondre dans une casserole avec 3 à 4 c. à soupe d\'eau.;ÉTAPE 2;Une fois fondues, incorporez-les dans le fromage blanc édulcoré.;Mélangez correctement pour que la gélatine fondue soit bien incorporée au fromage blanc.;Réservez.;Pendant ce temps, battez les blancs en neige bien ferme avec une pincée de sel.;Puis incorporez vos blancs en neige aussitôt au mélange fromage blanc et gélatine.;ÉTAPE 3;Placez au réfrigérateur pendant 5 heures votre mousse de fromage blanc pour qu\'il soit bien ferme.;Servez ensuite votre mousse dans des coupes.;Nappez-le de nectar, d\'un coulis de fruits rouges, ou de jus vitaminé au choix pour le côté gourmand.'),
        ('Escalopes de dinde à la vapeur minceur', 'Escalope de dinde vapeur.jpg', 314, '4 escalopes de dinde soit 500 g;550 g de carottes;300 g de céleri rave;15 g de beurre;Pour la sauce :;1 yaourt maigre;1 c. a soupe de jus de citron;1 c. a café de moutarde de Dijon;2 c. a soupe de fines herbes hachées;sel, poivre', 'ÉTAPE 1;Épluchez les carottes et le céleri.;Coupez-les en rondelles très fines à l\'aide d\'un robot ou d\'une mandoline (appareil plat muni au milieu d\'une lame réglable).;Mettez la moitié des légumes dans le bol d\'un cuit vapeur et posez dessus les escalopes de dinde, salez, poivrez et recouvrez du reste des légumes.;ÉTAPE 2;Salez et poivrez, parsemez de quelques noisettes de beurre, couvrez et laissez cuire 30 min.;Dans un bol, battez tous les ingrédients de la sauce et servez en saucière cette sauce bien fraîche avec le plat bien chaud.'),
        ('Salade de Farfalle minceur aux champignons, tomates et poivrons', 'Salade de farfalle aux champignons, tomates et poivrons.jpg', 178, '1 salade de feuilles mesclun;150 g de farfalles;6 champignons de Paris;2 tomates;2 poivrons rouges;6 tomates séchées (sans huile, se trouve dans les épiceries fines);30 g d’olives noires;Pour la vinaigrette :;4 c. à soupe d’huile d’olive;2 c. à soupe de vinaigre balsamique;le jus d’1 citron;sel, poivre', 'ÉTAPE 1;Commencez par porter une grande casserole d’eau salée à ébullition.;Plongez-y les pâtes et faites-les cuire le temps indiqué sur le paquet pour qu’elles soient « al dente ».;Égouttez-les et rafraîchissez-les.;Réservez-les dans une passoire pour qu’elles s’égouttent bien.;ÉTAPE 2;Lavez la salade et essorez-la.;Lavez les tomates et les champignons et coupez-les en rondelles fines.;Lavez les poivrons et videz-les.;Coupez-les en fines lamelles.;Découpez les tomates séchées en petits morceaux.;Mettez-le tout dans un saladier avec les pâtes froides.;(Si les pâtes collent, passez-les avant sous l’eau froide et égouttez-les de nouveau).;ÉTAPE 3;Préparez la vinaigrette.;Dans un bol, faites une vinaigrette avec l’huile d’olive, le vinaigre balsamique, le jus de citron, du sel et du poivre.;Versez-la sur la salade.;Mélangez bien.;Décorez avec les olives noires et servez.'),
        ('Salade minceur de pommes de terre, haricots verts, jambon', 'Salade minceur de pommes de terre, haricots verts, jambon.jpeg', 143, '500 g de pommes de terre;500 g de haricots verts;200 g d\'oignons;30 g de beurre;25 cl de bouillon de boeuf instantané;2 tranches (maxi 0,3 cm) de jambon;1 bouquet de persil;vinaigre balsamique;sel', 'ÉTAPE 1;Lavez le persil, puis ciselez-le.;Réservez dans un bol.;Ensuite pelez les pommes de terre, lavez-les.;Dans une casserole d\'eau bouillante salée, plongez-les et faites-les cuire pendant 20 min.;Égouttez-les alors et mettez-les dans un saladier.;ÉTAPE 2;Épluchez, lavez puis hachez l\'oignon.;Réservez.;Lavez vos haricots verts, équeutez-les en cassant chaque extrémité.;Réservez.;Prenez ensuite, une casserole, versez-y de l\'eau, salez-la puis à feu vif portez-la à ébullition.;ÉTAPE 3;Plongez les haricots verts dans l\'eau bouillante, puis faites-les cuire pendant 4 min.;À la fin de la cuisson, égouttez-les.;Rincez-les à l\'eau glacée pour les rafraîchir.;Puis égouttez-les à nouveau.;Rajoutez-les alors aux pommes de terre dans le saladier.;ÉTAPE 4;Déposez votre jambon sur votre planche de cuisine, puis découpez-le en lanières de 3 mm x 4 cm.;Déposez une poêle sur un feu vif et faites-y fondre le beurre.;Mettez le jambon en prenant soin de remuer, ensuite les oignons jusqu\'à ce qu\'ils deviennent transparents et laissez refroidir.;ÉTAPE 5;Arrosez le tout de 3 c. à soupe de vinaigre et mouillez avec le bouillon de bœuf que vous aurez fait tiédir.;Laissez mijoter pendant 3 min.;Mélangez les légumes dans le saladier puis parsemez de sauce (jambon-vinaigre et bouillon de bœuf dessus).;Parsemez de persil et d\'un peu de fleur de sel.'),
        ('Mousse au chocolat allégée', 'Mousse au chocolat allégé.jpg', 122, '200 g de chocolat noir;6 oeufs', 'ÉTAPE 1;Séparez les blancs des jaunes d\'oeufs.;Faites fondre le chocolat au bain-marie.;Une fois le chocolat fondu, ajoutez-le aux jaunes d\'oeufs et mélangez énergiquement jusqu\'à ce que le mélange soit homogène.;ÉTAPE 2;Montez les blancs d\'oeufs en neige bien ferme et incorporez-les délicatement au mélange jaunes d\'oeufs-chocolat.;Versez la mousse obtenue dans des verrine et réservez au frigo quelques heures avant dégustation.'),
        ('Compote de pommes allégée', 'Compote de pommes allégée.jpg', 111, '2 kg de pommes (Boskoop de préférence);2 verres d\'eau;1 pincée de cannelle;1 gousse de vanille', 'ÉTAPE 1;Épluchez les pommes, et épépinez-les.;Coupez-les en petits morceaux et mettez-les dans une grande casserole.;Ajoutez l\'eau puis laissez cuire à feu doux pendant 20 min en mélangeant de temps en temps.;Au milieu de la cuisson, ajoutez la gousse de vanille grattée.;ÉTAPE 2;Une fois les pommes cuites, mixez-les à l\'aide d\'un mixeur pour avoir une texture plus onctueuse.;ÉTAPE 3;Enfin, ajoutez une pincée de cannelle, mélangez et servez encore tiède.'),
        ('Cake léger aux framboises et fromage blanc', 'Cake léger aux framboises et fromage blanc.jpeg', 139, '150 g de framboises congelées;3 œufs;150 g de fromage blanc à 0% de MG;120 g de sucre roux;100 g de farine;100 g de maïzena;75 g de noix décortiquées;5 cl de lait;1/2 sachet de levure chimique;1 sachet sucre vanillé;1 c. à soupe de beurre', 'ÉTAPE 1;Préchauffez le four à 150°C (th.5).;Sortez les framboises du congélateur 3 heures avant et étalez-les sur une assiette.;ÉTAPE 2;Dans un saladier, à l\'aide d\'un fouet, battez les œufs avec le sucre jusqu’à blanchissement.;Tout en continuant de battre incorporez le fromage blanc puis le lait.;Mélangez bien le tout.;Cela doit être homogène et sans grumeaux.;ÉTAPE 3;Dans un autre saladier, mélangez la farine et la maïzena avec la levure chimique.;Ajoutez le mélange à la préparation et remuez pour obtenir une pâte homogène.;Incorporez les framboises préalablement dégorgée à l\'aide d\'une passoire et les noix.;Mélangez précautionneusement avec une maryse ou une spatule en bois.;Versez la préparation dans un moule à cake beurré.;Laissez cuire pendant 45 min dans un four à 180° (th.6).;Démoulez de suite à la sortie du four et laissez refroidir.'),
        ('Gateau au citron et yaourt léger', 'Gateau au citron et yaourt léger.jpg', 159, '3 oeufs;1 pot de yaourt nature 0% de MG;1 pot de sucre (à mesurer avec le pot de yaourt précédent);2 pots de maïzena;1 pot de farine;2 citron non traités;1 sachet de levure chimique;1 sachet de sucre vanillé;50 g de poudre d\'amande (facultatif)', 'ÉTAPE 1;Préchauffez votre four à th.5/6 (160°C).;Séparez les blancs des jaunes d\'oeufs.;Dans un saladier, mélangez les jaunes d\'oeufs avec le sucre et le sachet de sucre vanillé.;Mélangez jusqu\'à blanchissement.;Ajoutez la farine, la maïzena et la levure chimique à la préparation.;Mélangez à l\'aide d\'une maryse le yaourt à la préparation.;Puis, montez les blancs en neige bien ferme et incorporez-les à la préparation.;Ajoutez la poudre d\'amande (facultatif).;ÉTAPE 2;Ensuite, râpez le zeste d\'un des citrons pour avoir encore plus le goût de citron dans votre préparation.;Coupez ensuite les citrons en deux et récupérez le jus de citron.;Incorporez-le dans la préparation.;Mélangez jusqu\'à obtenir une pâte homogène.;ÉTAPE 3;Versez la pâte dans un moule préalablement beurré et fariné puis enfournez pendant 35 min à 160° (th.5/6).;Démoulez puis laissez refroidir 10 min avant de servir.');
