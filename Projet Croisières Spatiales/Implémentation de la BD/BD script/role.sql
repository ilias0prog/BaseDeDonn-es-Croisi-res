CREATE ROLE utilisateur;
CREATE ROLE comptable;
CREATE ROLE boss;
CREATE ROLE travailleurs;
CREATE ROLE responsable_animation;
CREATE ROLE navigateur;

GRANT SELECT on client, reservation, cabine_spatial to utilisateur;
"faudrais une vue pour donner les privileges au comptable"
GRANT SELECT on personnel to travailleurs; 
GRANT SELECT, UPDATE on activite to responsable_animation;
GRANT SELECT on astro_pilote, Type_vai, Vaisseaux, cabine_spatial to navigateur;
GRANT SELECT on ALL TABLES to boss;
 

