DROP TABLE IF EXISTS `Vaisseaux`;
CREATE TABLE `Vaisseaux` (
    `Num_vai` varchar(10) NOT NULL,   /*Combien de charactères pour Num_vai ??*/
    `Date` date NOT NULL,
    `Prix_achat` float NOT NULL,
    `Etat` varchar(25) NOT NULL, /*varchar(combien ??), on peut mettre un enum ??*/

    PRIMARY KEY (`Num_vai`)
);

DROP TABLE IF EXISTS `Compagnie_assurance`;
CREATE TABLE `Compagnie_assurance` (
    `Num_interplanetaire` varchar(20) NOT NULL,
    `Nom` varchar(25) NOT NULL,

    PRIMARY KEY (`Num_interplanetaire`)
);

DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client`(
    `Ncli` varchar(8) NOT NULL,
    `Mail` varchar(50) NOT NULL,
    `Nom` varchar(25) NOT NULL,
    `Espece` varchar(20) NOT NULL,
    `Tel`  char(10) NOT NULL,

    PRIMARY KEY (`Ncli`)

    
    CONSTRAINT check_at_least_one_filled CHECK (
        (`Tel` IS NOT NULL AND `Mail` IS NULL) OR
        (`mail` IS NOT NULL AND `Tel` IS NULL)
    )
);

DROP TABLE IF EXISTS `Personnel`;
CREATE TABLE `Personnel`(
    `Matricule` varchar(10) NOT NULL,
    `Nom` varchar(25) NOT NULL,
    `Prenom` varchar(25) NOT NULL,
    `Salaire_annu` float NOT NULL,
    `Chef` varchar(10) ,
    `Astro_pilote` varchar(10) ,
    `Origine` enum('Mercure','Venus','Terre','Mars','Jupiter','Uranus','Neptune') NOT NULL,

    PRIMARY KEY(`Matricule`)

);

DROP TABLE IF EXISTS `Planete`;
CREATE TABLE `Planete`(
    `Nom` enum('Mercure','Venus','Terre','Mars','Jupiter','Uranus','Neptune') NOT NULL,
    `Nb_habit`    int NOT NULL,
    `Env_temp` varchar(30) ,
    `Env_bio`  varchar(30) ,
    PRIMARY KEY (`Nom`)
);

DROP TABLE IF EXISTS `Activite`;
CREATE TABLE `Activite` (
    `Nom` varchar(30) NOT NULL, /*later : idées d`activités ?*/
    `Duree` time NOT NULL,
    `Prix` float NOT NULL,

    PRIMARY KEY (`Nom`)
);

DROP TABLE IF EXISTS `Chef`;
CREATE TABLE `Chef`(
    `Matricule` varchar(10) NOT NULL,
    `Prime` float NOT NULL,
    PRIMARY KEY(`Matricule`),
    FOREIGN KEY (`Matricule`) REFERENCES `Personnel`(`Matricule`)
);

DROP TABLE IF EXISTS `Astro_pilote`;
Create TABLE `Astro_pilote`(
    `Matricule` varchar(10) NOT NULL,
    `Nb_heures_vol` int NOT NULL,
    `Ecole` varchar(100) NOT NULL,
    PRIMARY KEY(`Matricule`),
    FOREIGN KEY (`Matricule`) REFERENCES `Personnel`(`Matricule`)
);


DROP TABLE IF EXISTS `Type_vai`;
CREATE TABLE `Type_vai` (
    `Marque` varchar(20) NOT NULL,
    `Modèle` varchar(20) NOT NULL,
    `Num_vai` varchar(10) NOT NULL,


    PRIMARY KEY (`Num_vai`),
    FOREIGN KEY (`Num_vai`) REFERENCES `Vaisseaux`(`Num_vai`)
);

DROP TABLE IF EXISTS `Cabine_spatiale`;
CREATE TABLE `Cabine_spatiale` (
    `Code` varchar(10) NOT NULL,
    `Capacite` int NOT NULL,
    `Classe` ENUM('1','2','3','4','5'), /*Il y a 5 classes différentes*/
    `Espece` varchar(20) NOT NULL, /* suggestion : si on veut définir au préalables les espèces on peut utiliser un enum (discrimination ?) */
    `Dispo` boolean NOT NULL DEFAULT FALSE,
    `Prix_nuit` float NOT NULL,
    `Num_vai` varchar(10) NOT NULL,

    PRIMARY KEY (`Code`),
    FOREIGN KEY (`Num_vai`) REFERENCES `Vaisseaux`(`Num_vai`) /*Trigger*/
);

DROP TABLE IF EXISTS `Contrat`;
CREATE TABLE `Contrat`  (
    `Num_cont` varchar(10) NOT NULL,
    `Date_debut` date NOT  NULL,
    `Date_fin` date NOT NULL,
    `Prix_annuel` float NOT NULL,
    `Num_vai` varchar(10) NOT NULL,
    `Num_interplanétaire` varchar(20) NOT NULL,

    PRIMARY KEY  (`Num_cont`),
    KEY `Contrat` (`Num_vai`),
    FOREIGN KEY (`Num_vai`) REFERENCES `Vaisseaux` (`Num_vai`), /*later: ON DELETE CASCADE*/
   FOREIGN KEY (`Num_interplanétaire`) REFERENCES `Compagnie_assurance` (`Num_interplanetaire`)
);



DROP TABLE IF EXISTS `Reservation`;
CREATE TABLE `Reservation` (
    `Num_res` varchar(10) NOT NULL,
    `Moyen_pay` enum('CarteBancaire','Crypto','Stardust'), /*later : on peut imaginer différents moyens de paiement*/
    `Status` enum('Confirmee','Attente','Annulee') NOT NULL,
    `Date` date NOT NULL,
    `Ncli` varchar(8) NOT NULL,
    `Code_cabine` varchar(10) NOT NULL,
    `Nom_acti` varchar(30) NOT NULL,

    PRIMARY KEY (`Num_res`),
    KEY `Reservation` (`Ncli`),/*Trigger*/
    FOREIGN KEY  (`Ncli`) REFERENCES `Client`( `Ncli`),
    FOREIGN KEY  (`Code_cabine`) REFERENCES  `Cabine_spatiale`(`Code`),
    FOREIGN KEY (`Nom_acti`) REFERENCES `Activite`(`Nom`)
    -- issue : Quelles autres clés étrangères ?
);



DROP TABLE IF EXISTS `Croisiere`;
CREATE TABLE `Croisiere` (
    `Titre` varchar(30) NOT NULL,
    `Date_debut` date NOT NULL,
    `Date_fin` date NOT NULL,
    `Planete_depart` enum('Mercure','Venus','Terre','Mars','Jupiter','Uranus','Neptune') NOT NULL,
    `Planete_arrivee` enum('Mercure','Venus','Terre','Mars','Jupiter','Uranus','Neptune') NOT NULL,
    `Chef` varchar(10) NOT NULL,
    `Pilote` varchar(10) NOT NULL,
    `Num_vai` varchar(10) NOT NULL,
    PRIMARY KEY (`Titre`),
    KEY `Croisiere_1` (`Pilote`),
    KEY `Croisiere_2` (`Chef`),
    KEY `Croisiere_3` (`Num_vai`),
    FOREIGN KEY (`Planete_depart`) REFERENCES `Planete`(`Nom`),
    FOREIGN KEY (`Planete_arrivee`) REFERENCES `Planete`(`Nom`),
    FOREIGN KEY (`Pilote`) REFERENCES `Astro_pilote`(`Matricule`),
    FOREIGN KEY (`Chef`) REFERENCES `Chef`(`Matricule`),
    FOREIGN KEY (`Num_vai`) REFERENCES `Vaisseaux`(`Num_vai`)

    -- Clairement cette table faudra la refaire, je sens que c`est de la merde
);



DROP TABLE IF EXISTS `Escale`;
CREATE TABLE `Escale`(
    `Planete` enum('Mercure','Venus','Terre','Mars','Jupiter','Uranus','Neptune') NOT NULL,
    `Titre_croisiere` varchar(30) NOT NULL,
    PRIMARY KEY(`Planete`,`Titre_croisiere`),
    FOREIGN KEY (`Planete`) REFERENCES `Planete`(`Nom`),
    FOREIGN KEY (`Titre_croisiere`) REFERENCES `Croisiere`(`Titre`)
);

/*_______________________Reprendre ici_______________________*/

