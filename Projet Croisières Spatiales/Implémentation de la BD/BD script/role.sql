CREATE ROLE utilisateur;
CREATE ROLE comptable;
CREATE ROLE boss;
CREATE ROLE Gestionnaire_RH;
CREATE ROLE responsable_animation;
CREATE ROLE Gestionnaire_vaisseaux;

GRANT SELECT ON Client  TO utilisateur;
GRANT SELECT ON Reservation TO utilisateur;
GRANT SELECT ON CEP TO utilisateur;
"faudrais une vue pour donner les privileges au comptable"
GRANT SELECT, UPDATE ON Personnel, Astro_pilote TO Gestionnaire_RH; 
GRANT SELECT, UPDATE on Activite to responsable_animation;
GRANT SELECT on Astro_pilote, Type_vai, Vaisseaux, Cabine_spatial to Gestionnaire_vaisseaux;
GRANT SELECT on ALL TABLES to Patron;
 

