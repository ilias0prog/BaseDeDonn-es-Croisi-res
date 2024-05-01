CREATE ROLE utilisateur;
CREATE ROLE Comptabilite;
CREATE ROLE Gestionnaire_RH;
CREATE ROLE responsable_animation;
CREATE ROLE Gestionnaire_vaisseaux;

GRANT SELECT ON Client TO utilisateur;
GRANT SELECT ON Reservation TO utilisateur;
GRANT SELECT ON CEP TO utilisateur;
GRANT SELECT ON RPA TO Comptabilite;
GRANT SELECT ON Personnel TO Gestionnaire_RH;
GRANT SELECT ON Astro_pilote TO Gestionnaire_RH;
GRANT SELECT ON Activite TO responsable_animation;
GRANT SELECT ON Astro_pilote TO Gestionnaire_vaisseaux;
GRANT SELECT ON Type_vai TO Gestionnaire_vaisseaux;
GRANT SELECT ON Vaisseaux TO Gestionnaire_vaisseaux;
GRANT SELECT ON Cabine_spatiale TO Gestionnaire_vaisseaux;


 

