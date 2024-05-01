/*
Liste des Triggers à faire:
--------------------------
Disponibilité de la cabine (Update de cabine spatial, insert de cabine spatial,Update reservation)
Equ de type vaisseaaux 
Equ cabine spatial 
Coex Temps grave bio (Insert Planette,Update planette spatial)
*/


CREATE TRIGGER ReserverCabineOccupee_Select BEFORE INSERT ON Reservation
FOR EACH ROW BEGIN
    DECLARE dispoCabine BOOLEAN;
    -- Si la cabine qu'on essaie de réserver est occupée, on crée une erreur ce qui annule l'insertion
    IF (NEW.Code_cabine IN (SELECT Code FROM Cabine_spatiale WHERE `Dispo` = true)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cette cabine est déjà occupée.';
    END IF;
END;

CREATE TRIGGER ReserverCabineOccupee_UPDATE BEFORE UPDATE ON Reservation
FOR EACH ROW BEGIN
    DECLARE dispoCabine BOOLEAN;
    -- Si la cabine qu'on essaie de réserver est occupée, on crée une erreur ce qui annule la mise à jour
    IF (NEW.Code_cabine IN (SELECT Code FROM Cabine_spatiale WHERE `Dispo` = TRUE)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cette cabine est déjà occupée.';
    END IF;
END;

CREATE TRIGGER ReserverCabine AFTER INSERT ON Reservation
FOR EACH ROW BEGIN
    -- Met à jour la disponibilité de la cabine automatiquement à la réservation
    UPDATE Cabine_spatiale SET Dispo=true WHERE Code=NEW.Code_cabine;
END


CREATE TRIGGER EspeceClient BEFORE INSERT ON `Reservation`
-- Empeche un client de réserver une cabine d'une autre espèce (pour des raisons pratiques liées aux besoins des différentes espèces, aucune discrimination)
FOR EACH ROW BEGIN
    DECLARE EspeceClient,EspeceCabine varchar(20);

    SELECT Espece INTO EspeceClient
    FROM Client
    WHERE Client.NCLI = NEW.NCLI;

    SELECT Cabine_spatiale.Espece INTO EspeceCabine
    FROM Cabine_spatiale
    WHERE Code = NEW.Code_cabine;

    IF NOT (EspeceClient = EspeceCabine) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cette cabine ne convient pas à ce client';
    END IF;
END
    

--Non utuliser--

CREATE TRIGGER LibererCabineDeleteReservation AFTER DELETE ON  `Reservation`
FOR EACH ROW BEGIN
    -- Libère la cabine automatiquement à la suppression de la réservation
   UPDATE `Cabine_spatiale` SET `Dispo`=TRUE WHERE `Code_cabine`=OLD.`Code_cabine`;
END;

CREATE TRIGGER LibererCabineUpdateReservation AFTER UPDATE ON `Reservation`
FOR EACH ROW BEGIN
    -- Libère la cabine automatiquement à la suppression de la réservation
    IF NEW.`Status` =  `Annulee`
    THEN UPDATE `Cabine_spatiale` SET `Dispo`=TRUE WHERE `Code_cabine`=OLD.`Code_cabine`;

CREATE TRIGGER LibererCabineOccupee BEFORE UPDATE ON `Cabine_spatiale`
FOR EACH ROW BEGIN
    -- Si la cabine que l'on essaie de libérer (set Dispo to True) est réservée, on garde dispo à False
    -- Les autres colonnes concernées par le Update seront dont bien modifiée, seule Dispo restera inchangée
    IF NEW.`Dispo` = TRUE 
    AND NEW.`Code_cabine` IN SELECT `Code_cabine` FROM  `Reservation` 
    THEN SET NEW.`Dispo` = OLD.`Dispo`
    END IF;
END;