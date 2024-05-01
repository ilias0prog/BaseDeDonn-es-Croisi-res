CREATE ROLE utilisateur;
CREATE ROLE Comptabilité;
CREATE ROLE Gestionnaire_RH;
CREATE ROLE responsable_animation;
CREATE ROLE Gestionnaire_vaisseaux;

GRANT SELECT ON Client  TO utilisateur;
GRANT SELECT ON Reservation TO utilisateur;
GRANT SELECT ON CEP TO utilisateur;
GRANT SELECT ON RPA TO Comptabilité;
GRANT SELECT ON Personnel, Astro_pilote TO Gestionnaire_RH; 
GRANT SELECT ON Activite TO responsable_animation;
GRANT SELECT ON Astro_pilote, Type_vai, Vaisseaux, Cabine_spatial TO Gestionnaire_vaisseaux;

 

