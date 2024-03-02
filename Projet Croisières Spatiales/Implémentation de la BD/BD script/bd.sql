/*Tables dans l'ordre :
- Vaisseaux
- Croisières 
- Clients
- Activités
- (Itinéraire)
- Planètes
- Cabines 
- Personnel
- Astropilote
- Réservation
- Chef
- Assurance
- Contrat
(finalement j'ai pas fait dans cet ordre la)

ctrl f "issue" pour voir toutes les parties du code qui posent ptobleme
ctrl f "???" pour voir les éléments dont je ne suis pas sûr
ctrl f "later" = revenir plus tard
ctrl f "on update" et "on delete" = les endroits ou il faut ptt préciser le comportement de la BD
lors des updates/suppressions de lignes (cascade,...)*/



DROP TABLE IF EXISTS 'Vaisseaux';

CREATE TABLE 'Vaisseaux' (
    'Num_vai' varchar(10) NOT NULL,   /*issue : Format de l'identifiant à changer*/
    'Type' type NOT NULL/*issue : Comment créer un attribut multiple ?
    Idée de solution : type SET(https://dev.mysql.com/doc/refman/8.0/en/set.html)*/
    'Date' date NOT NULL,
    'Prix_achat' float NOT NULL,
    'Etat' varchar(25), /*varchar(combien ???)*/

    PRIMARY KEY ('Num_ai'),
    FOREIGN KEY ('Num_Contrat') REFERENCES Contrat('Num_cont') /*later: ON DELETE CASCADE*//*later : Clé étrangère ???*/
)

DROP TABLE IF EXISTS 'Contrat';
CREATE TABLE 'Contrat'  (
    'Num_cont' int AUTO_INCREMENT NOT NULL, 
    'Date_debut' date NOT  NULL,
    'Date_fin' date,
    'Prix_annuel' float NOT NULL,

    PRIMARY KEY  ('Num_cont'),
    FOREIGN KEY  ('Num_Vaisseau')  REFERENCES Vaisseaux('Num_vai') /*later: ON DELETE CASCADE*/
)


DROP TABLE IF EXISTS 'Compagnie_assurance';
CREATE TABLE 'Compagie_assurance' (
    'Num_interPlanetaire' varchar(20) NOT NULL,
    'Nom' varchar(25) NOT NULL,

    PRIMARY KEY ('Num_interPlanetaire'),
)

DROP TABLE IF EXISTS 'Cabine_spatiale';
CREATE TABLE  'Cabine_spatiale' (
    'Code' varchar(10) NOT NULL,
    'Capacite' int NOT NULL,
    'Classe'  enum(1,2,3,4,5) NOT NULL, /*Il y'a 5 classes différentes*/
    'Espece' varchar(20) NOT NULL, /*suggestion : si on veut définir au préalables les espèces on peut utiliser un enum (discrimination ?)*/
    'Dispo'  boolean NOT NULL DEFAULT FALSE,
    'Prix_nuit' float NOT NULL,
    
    PRIMARY KEY ('Code'),
    FOREIGN KEY  ('Num_Vaisseau') REFERENCES Vaisseaux('Num_vai'), /*ON UPDATE CASCADE ON DELETE RESTRICT*/
)

DROP TABLE IF EXISTS 'Reservation';
CREATE TABLE 'Reservation' (
    'Num_res' int AUTO_INCREMENT NOT NULL,
    'Moyen_pay' enum("CarteBancaire","Crypto","Stardust"), /*later : on peut imaginer différents moyens de paiement*/
    'Status' enum("Confirmee","Attente","Annulee") NOT NULL,
    'Date' date NOT NULL,

    PRIMARY KEY ('Num_res'),
    FOREIGN KEY  ('Num_Client') REFERENCES Client('Id_cli'),
    -- issue : Quelles autres clés étrangères ?
)

DROP TABLE IF EXISTS 'Client';
CREATE TABLE 'Client'(
    'NCli' varchar(8) NOT NULL,
    'Mail' varchar(25) NOT NULL,
    'Nom' varchar(25) NOT NULL,
    'Espece' varchar(20) NOT NULL,
    'tel'  char(10) NOT NULL,

    PRIMARY KEY ('NCli'),
    
    -- 
    CONSTRAINT check_at_least_one_filled CHECK (
        ('tel' IS NOT NULL AND 'Mail' IS NULL) OR
        ('mail' IS NOT NULL AND 'tel' IS NULL)
    )
)

DROP TABLE IF EXISTS 'Activite';
CREATE TABLE 'Activite' (
    'Nom' enum('piscine','cinema','ateliet_telescope','laser_game') NOT NULL, /*later : idées d'activités ?*/
    'Duree' time NOT NULL,
    'Prix' float NOT NULL

    PRIMARY KEY ('Nom')
)


DROP TABLE IF EXISTS 'Croisiere';
CREATE TABLE 'Croisiere' (
    'Titre_croisiere' varchar(30) NOT NULL,
    'Date_debut' date NOT NULL,
    'Date_fin' date NOT NULL,
    'Planete_depart' enum('Mercure','Venus','Terre','Mars','Jupiter','Uranus','Neptune') NOT NULL,
    'Planete_arrivee' enum('Mercure','Venus','Terre','Mars','Jupiter','Uranus','Neptune') NOT NULL,
    'Escales' SET('Mercure','Venus','Terre','Mars','Jupiter','Uranus','Neptune') NOT NULL,

    PRIMARY KEY ('Titre_croisiere'),
    FOREIGN KEY ('Planete_depart') REFERENCES 'Planete'('Matricule'),
    FOREIGN KEY ('Planete_arrivee') REFERENCES 'Planete'('Matricule'),
    FOREIGN KEY ('Escales') REFERENCES 'Planete'('Matricule'),
    -- Clairement cette table faudra la refaire, je sens que c'est de la merde
)

DROP TABLE IF EXISTS 'Personnel';
CREATE TABLE 'Personnel'(
/*_______________________Reprendre ici_______________________*/
)