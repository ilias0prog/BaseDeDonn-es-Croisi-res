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
    'Espece' varchar(20) NOT NULL, 
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
    'Date' date NOT NULL
)