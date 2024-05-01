DELIMITER //

CREATE TRIGGER ReserverCabineOccupee_Select BEFORE INSERT ON Reservation
FOR EACH ROW BEGIN
    DECLARE dispoCabine BOOLEAN;
    -- Si la cabine qu'on essaie de reserver est occupee, on cree une erreur ce qui annule l'insertion
    IF (NEW.Code_cabine IN (SELECT Code FROM Cabine_spatiale WHERE `Dispo` = true)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cette cabine est dejà occupee.';
    END IF;
END//

CREATE TRIGGER ReserverCabineOccupee_UPDATE BEFORE UPDATE ON Reservation
FOR EACH ROW BEGIN
    DECLARE dispoCabine BOOLEAN;
    -- Si la cabine qu'on essaie de reserver est occupee, on cree une erreur ce qui annule la mise à jour
    IF (NEW.Code_cabine IN (SELECT Code FROM Cabine_spatiale WHERE `Dispo` = TRUE)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cette cabine est dejà occupee.';
    END IF;
END//

CREATE TRIGGER ReserverCabine AFTER INSERT ON Reservation
FOR EACH ROW BEGIN
    -- Met à jour la disponibilite de la cabine automatiquement à la reservation
    UPDATE Cabine_spatiale SET Dispo=true WHERE Code=NEW.Code_cabine;
END//

CREATE TRIGGER EspeceClient BEFORE INSERT ON `Reservation`
-- Empeche un client de reserver une cabine d'une autre espèce (pour des raisons pratiques liees aux besoins des differentes espèces, aucune discrimination)
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
END//

CREATE TRIGGER ChangementDEspece BEFORE UPDATE ON Client
FOR EACH ROW 
BEGIN
    -- Si le client change d'espece alors qu'il a reserve une cabine, toutes les colonnes sont update sauf Espece
    IF NEW.Espece != OLD.Espece AND NEW.Ncli IN (SELECT Ncli FROM  Reservation) THEN
        SET NEW.Espece = OLD.Espece;
    END IF;
END//
