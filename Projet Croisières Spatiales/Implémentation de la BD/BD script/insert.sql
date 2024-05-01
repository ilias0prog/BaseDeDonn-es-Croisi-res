INSERT INTO Activite VALUES ('Observation des étoiles', '03:00:00', 25),
                            ('Simulateur de gravité', '01:30:00', 30),
                            ('Cuisine intergalactique', '02:30:00', 50),
                            ('Exploration spatiale', '04:00:00', 40),
                            ('Atelier de robots', '02:00:00', 35),
                            ('Danse interstellaire', '01:00:00', 20),
                            ('Méditation spatiale', '01:30:00', 15),
                            ('Projection de films', '02:00:00', 5),
                            ('Concert extraterrestre', '02:30:00', 45);

INSERT INTO Vaisseaux VALUES
    ('12345678', '2024-03-06', 250000, 'endommagé'),
    ('23456789', '2024-03-06', 300000, 'intact'),
    ('34567890', '2024-03-06', 500000, 'intact'),
    ('45678901', '2024-03-06', 400000, 'endommagé'),
    ('56789012', '2024-03-06', 350000, 'intact'),
    ('67890123', '2024-03-06', 200000, 'intact'),
    ('78901234', '2024-03-06', 150000, 'endommagé'),
    ('89012345', '2024-03-06', 50000, 'endommagé'),
    ('90123456', '2024-03-06', 450000, 'intact');

INSERT INTO Compagnie_assurance VALUES
    ('123446784','Megaassurance'),
    ('236456789','Iliassurance');

INSERT INTO Client VALUES
    ('34567899', 'jean.stur@gmail.com', 'Stur', 'Humain', '0462833229'),
    ('45678900', 'emillie.duval@yahoo.com', 'Duval', 'Alien', '0466582190'),
    ('56789015', 'chris.lapon@hotmail.com', 'Lapon', 'Humain', '0454486527'),
    ('67890122', 'tina.portman@outlook.com', 'Portman', 'Alien', '0498805125'),
    ('78901231', 'miguel.lim@aol.com', 'Lim', 'Humain', '0638525370'),
    ('89012342', 'irma.michealis@protonmail.com', 'Michealis', 'Alien','0770141508'),
    ('90123453', 'harry.macguire@icloud.com', 'Macguire', 'Humain', '0677342055'),
    ('01234567', 'stelamounth@yandex.com', 'Mounth', 'Alien', '0457685549'),
    ('10234567', 'mike.bene@live.com', 'Bene', 'Humain', '0474829248'),
    ('11234567', 'livio.johnson@zoho.com', 'Johnson', 'Alien', '0753135667'),
    ('22334455', 'laura.smith@gmail.com', 'Smith', 'Humain', '0427869210'),
    ('33445566', 'pierre.louc@yahoo.com', 'Louc', 'Alien', '0490229567'),
    ('44556677', 'sophie.dufresne@hotmail.com', 'Dufresne', 'Humain', '0465956234'),
    ('55667788', 'alex.moreau@outlook.com', 'Moreau', 'Alien', '0498765432'),
    ('66778899', 'samuel.brown@aol.com', 'Brown', 'Humain', '0467891234'),
    ('77889900', 'eva.nguyen@protonmail.com', 'Nguyen', 'Alien','0478123456'),
    ('88990011', 'oliver.puir@icloud.com', 'puir', 'Humain', '0487561234'),
    ('99001122', 'lily.chan@yandex.com', 'Chan', 'Alien', '0498234567'),
    ('00112233', 'david.peterson@live.com', 'Peterson', 'Humain', '0478956234'),
    ('11223344', 'nina.gomez@zoho.com', 'Gomez', 'Alien', '0467891234');


INSERT INTO Personnel VALUES
    ('1234567890', 'Johnson', 'Alice', 60000.00, FALSE, FALSE, 'Mercure'),
    ('2345678901', 'Smith', 'Bob', 65000.00, FALSE, TRUE, 'Venus'),
    ('3456789012', 'Brown', 'Charlie', 70000.00, TRUE, FALSE, 'Terre'),
    ('4567890123', 'Ross', 'Diana', 75000.00, FALSE, TRUE, 'Mars'),
    ('5678901234', 'Thompson', 'Emma', 80000.00, FALSE, FALSE, 'Jupiter'),
    ('6789012345', 'Dwayne', 'Franklin', 85000.00, FALSE, TRUE, 'Uranus'),
    ('7890123456', 'Kelly', 'Grace', 90000.00, TRUE, FALSE, 'Neptune'),
    ('8901234567', 'Potter', 'Harry', 95000.00, FALSE, TRUE, 'Mercure'),
    ('9012345678', 'White', 'Ivy', 100000.00, FALSE, FALSE, 'Venus'),
    ('0124456789', 'Johnson', 'Jack', 105000.00, TRUE, FALSE, 'Terre');

INSERT INTO Chef VALUES
    ('7890123456', 2000.00),
    ('0124456789', 2500.00),
    ('3456789012', 3000.00);

INSERT INTO Astro_pilote VALUES
    ('6789012345', 500, 'Ecole des Pilotes Intergalactiques'),
    ('2345678901', 750, 'Académie Spatiale de la Galaxie'),
    ('8901234567', 1000, 'Université Stellaire de l Espace'),
    ('4567890123', 800, 'Centre de Formation Astronautique Lunaire');

INSERT INTO Type_vai VALUES
    ('SpaceX', 'Falcon 9', '12345678'),
    ('NASA', 'Orion', '23456789'),
    ('ESA', 'Ariane 5', '34567890'),
    ('Blue Origin', 'New Shepard', '45678901'),
    ('SpaceX', 'Soyouz', '56789012'),
    ('Boeing', 'Starliner', '67890123'),
    ('Virgin Galactic', 'VSS Unity', '78901234'),
    ('Rocket Lab', 'Electron', '89012345'),
    ('Rocket Lab', 'PSLV', '90123456');

INSERT INTO Cabine_spatiale VALUES
    ('CAB001', 2, '1', 'Humain', TRUE, 150.00, '12345678'),
    ('CAB002', 4, '2', 'Humain', TRUE, 100.00, '23456789'),
    ('CAB003', 1, '3', 'Alien', TRUE, 200.00, '34567890'),
    ('CAB004', 2, '4', 'Alien', TRUE, 180.00, '45678901'),
    ('CAB005', 2, '5', 'Humain', TRUE, 80.00, '56789012'),
    ('CAB006', 1, '1', 'Humain', TRUE, 160.00, '67890123'),
    ('CAB007', 3, '2', 'Alien', TRUE, 120.00, '78901234'),
    ('CAB008', 2, '3', 'Alien', TRUE, 190.00, '89012345'),
    ('CAB009', 2, '4', 'Humain', TRUE, 170.00, '90123456'),
    ('CAB010', 1, '5', 'Alien', TRUE, 70.00, '12345678'),
    ('CAB011', 1, '3', 'Humain', TRUE, 130.00, '12345678'),
    ('CAB012', 3, '2', 'Alien', TRUE, 85.00, '23456789'),
    ('CAB013', 2, '4', 'Alien', TRUE, 100.00, '56789012'),
    ('CAB014', 4, '2', 'Human', TRUE, 80.00, '45678901'),
    ('CAB015', 5, '5', 'Alien', TRUE, 230.00, '45678901'),
    ('CAB016', 2, '1', 'Human', TRUE, 120.00, '90123456'),
    ('CAB017', 1, '1', 'Alien', TRUE, 100.00, '23456789'),
    ('CAB018', 4, '5', 'Alien', TRUE, 200.00, '89012345'),
    ('CAB019', 2, '1', 'Human', TRUE, 90.00, '67890123'),
    ('CAB020', 3, '1', 'Alien', FALSE, 190.00, '56789012'),
    ('CAB021', 2, '1', 'Human', FALSE, 120.00, '78901234');



INSERT INTO Contrat VALUES
    ('CONT001', '2024-01-01', '2027-01-01', 500000.00, '12345678','123446784'),
    ('CONT002', '2024-02-01', '2025-08-07', 600000.00, '23456789', '123446784'),
    ('CONT003', '2024-03-11', '2025-03-01', 700000.00, '34567890', '236456789'),
    ('CONT004', '2024-05-01', '2025-12-01', 800000.00, '45678901', '236456789'),
    ('CONT005', '2024-07-21', '2025-05-01', 900000.00, '56789012', '236456789'),
    ('CONT006', '2024-06-01', '2025-06-01', 1000000.00, '67890123', '236456789'),
    ('CONT007', '2024-07-01', '2026-07-01', 1100000.00, '78901234', '236456789'),
    ('CONT008', '2024-12-14', '2025-08-01', 1200000.00, '89012345', '123446784'),
    ('CONT009', '2024-09-01', '2026-09-01', 1300000.00, '90123456', '123446784');

INSERT INTO Reservation VALUES
    ('RES001', 'CarteBancaire', 'Confirmee', '2024-01-01', '34567899', 'CAB001', 'Observation des étoiles'),
    ('RES002', 'Crypto', 'Attente', '2024-02-01', '45678900', 'CAB002', 'Simulateur de gravité'),
    ('RES003', 'Stardust', 'Confirmee', '2024-03-01', '56789015', 'CAB003', 'Cuisine intergalactique'),
    ('RES004', 'CarteBancaire', 'Confirmee', '2024-04-01', '67890122', 'CAB004', 'Exploration spatiale'),
    ('RES005', 'Crypto', 'Confirmee', '2024-05-01', '78901231', 'CAB005', 'Atelier de robots'),
    ('RES006', 'Stardust', 'Attente', '2024-06-01', '89012342', 'CAB006', 'Danse interstellaire'),
    ('RES007', 'CarteBancaire', 'Confirmee', '2024-07-01', '90123453', 'CAB007', 'Méditation spatiale'),
    ('RES008', 'Crypto', 'Attente', '2024-08-01', '01234567', 'CAB008', 'Projection de films'),
    ('RES009', 'Stardust', 'Attente', '2024-09-01', '10234567', 'CAB009', 'Concert extraterrestre'),
    ('RES010', 'CarteBancaire', 'Confirmee', '2024-10-01', '22334455', 'CAB010', 'Simulateur de gravité'),
    ('RES011', 'Crypto', 'Attente', '2024-11-01', '33445566', 'CAB011', 'Exploration spatiale'),
    ('RES012', 'Stardust', 'Confirmee', '2024-12-01', '44556677', 'CAB012', 'Méditation spatiale'),
    ('RES013', 'CarteBancaire', 'Confirmee', '2025-01-01', '55667788', 'CAB013', 'Observation des étoiles'),
    ('RES014', 'Crypto', 'Confirmee', '2025-02-01', '66778899', 'CAB014', 'Danse interstellaire'),
    ('RES015', 'Stardust', 'Attente', '2025-03-01', '77889900', 'CAB015', 'Cuisine intergalactique'),
    ('RES016', 'CarteBancaire', 'Confirmee', '2025-04-01', '88990011', 'CAB016', 'Projection de films'),
    ('RES017', 'Crypto', 'Attente', '2025-05-01', '99001122', 'CAB017', 'Simulateur de gravité'),
    ('RES018', 'Stardust', 'Attente', '2025-06-01', '00112233', 'CAB018', 'Observation des étoiles'),
    ('RES019', 'CarteBancaire', 'Attente', '2025-07-01', '11223344', 'CAB019', 'Atelier de robots');

INSERT INTO Planete VALUES
    ('Mercure', 230900, 37, 'Tropical'),
    ('Venus', 120000, 2, 'Désertique'),
    ('Terre', 780000, 15, 'Tempéré'),
    ('Mars', 500910, -10, 'Arctique'),
    ('Jupiter', 1000000, -18, 'Arctique'),
    ('Uranus', 8901923, 20, 'Tempéré'),
    ('Neptune', 391830, 29, 'Tropical');

INSERT INTO Croisiere VALUES
    ('Croisiere001', '2024-01-01', '2024-01-10', 'Terre', 'Mars', '7890123456', '2345678901', '12345678'),
    ('Croisiere002', '2024-02-03', '2024-02-10', 'Jupiter', 'Neptune', '7890123456', '2345678901', '23456789'),
    ('Croisiere003', '2024-03-01', '2024-03-10', 'Venus', 'Uranus', '0124456789','8901234567', '34567890'),
    ('Croisiere004', '2024-04-05', '2024-04-10', 'Terre', 'Jupiter', '7890123456', '4567890123', '45678901'),
    ('Croisiere005', '2024-05-01', '2024-05-10', 'Mars', 'Venus', '0124456789', '6789012345', '56789012'),
    ('Croisiere006', '2024-06-04', '2024-06-10', 'Uranus', 'Mercure', '3456789012', '6789012345', '67890123'),
    ('Croisiere007', '2024-07-01', '2024-07-15', 'Neptune', 'Terre', '3456789012', '8901234567', '78901234'),
    ('Croisiere008', '2025-01-01', '2025-01-12', 'Jupiter', 'Mars', '3456789012', '2345678901', '89012345'),
    ('Croisiere009', '2025-02-15', '2025-02-20', 'Venus', 'Uranus', '0124456789', '4567890123', '90123456');

INSERT INTO Escale VALUES
    ('Mercure', 'Croisiere001'),
    ('Venus', 'Croisiere003'),
    ('Terre', 'Croisiere002'),
    ('Mars', 'Croisiere007'),
    ('Jupiter', 'Croisiere009'),
    ('Uranus', 'Croisiere006'),
    ('Neptune', 'Croisiere004'),
    ('Terre', 'Croisiere005'),
    ('Mars', 'Croisiere009'),
    ('Jupiter', 'Croisiere005'),
    ('Neptune', 'Croisiere002');
