create view CEP(Titre,Debut,Fin,Planete_depart,Planete_arrivee,Escales,Nom_Chef,Prenom_Chef,Nom_Pilote,Prenom_Pilote)
as select Croisiere.Titre , Croisiere.Date_debut, Croisiere.Date_fin, Croisiere.Planete_depart, Croisiere.Planete_arrivee, group_concat(Escale.Planete), chef.Nom as Nom_Chef, chef.Prenom as Prenom_Chef, pilote.Nom as Nom_Pilote, pilote.Prenom as Prenom_Pilote
from Croisiere
LEFT JOIN Escale ON Croisiere.Titre = Escale.Titre_croisiere
join Personnel chef ON Croisiere.Chef = chef.Matricule
join Personnel pilote ON Croisiere.Pilote = pilote.Matricule
group by Croisiere.Titre, Croisiere.Date_debut, Croisiere.Date_fin, Croisiere.Planete_depart, Croisiere.Planete_arrivee, chef.Nom, chef.Prenom, pilote.Nom, pilote.Prenom