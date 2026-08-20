1 /* Combien d'objets avons-nous reçus le mois dernier, et quel poids total ? */

SELECT COUNT(idobjet) AS nombre_objet, SUM(poidskg) AS poids
FROM objet

2 /* Quels objets sont actuellement en rayon, et depuis combien de temps ? */

SELECT
    libelle,
    dateMiseRayon,
    CURRENT_DATE - dateMiseRayon AS jours_en_rayon
FROM Objet
WHERE statut = 'en rayon'
ORDER BY dateMiseRayon;

3 Quelle catégorie se vend le mieux ? Laquelle rapporte le plus ?

catégorie qui se vend le mieux :

SELECT categorie.libelle, COUNT(*) AS nombre_ventes
FROM objet
JOIN categorie ON objet.idcategorie = categorie.idcategorie
WHERE objet.statut = 'vendu'
GROUP BY categorie.libelle
ORDER BY nombre_ventes DESC;

catégorie qui rapporte le plus :

SELECT categorie.libelle, SUM(objet.prix) AS chiffre_affaire
FROM objet
JOIN categorie ON objet.idcategorie = categorie.idcategorie
WHERE objet.statut = 'vendu'
GROUP BY categorie.libelle
ORDER BY chiffre_affaire DESC;

4 /* Combien d'heures de bénévolat ont été consacrées à la réparation cette année ? */

SELECT SUM(dureeh) AS heure_benevola_reparation
FROM reparation

/*5 Quel est le taux de réussite des réparations, par bénévole et globalement ?*/

/*6 Quelles personnes nous ont fait plus de trois dépôts ?*/

SELECT
    personne.prenom,
    personne.nom,
    COUNT(depot.idDepot) AS nombre_depots
FROM Personne
JOIN Depot ON personne.idPersonne = depot.idpersonne
GROUP BY personne.idPersonne, personne.prenom, personne.nom
HAVING COUNT(depot.idDepot) > 3;

/*7 Quel poids total avons-nous détourné de la déchetterie (tout ce qui n'est pas recyclé) ?*/

SELECT SUM(poidsKg) AS poids_total
FROM Objet
WHERE NOT statut = 'recyclé';

/*8 Quel est le taux de présence réelle sur nos ateliers ?*/


/*9 Quels bénévoles ont la compétence « électricité » et sont disponibles pour animer un atelier ?*/

SELECT prenom, nom
FROM benevole
JOIN competencebenevole
    ON benevole.idBenevole = competencebenevole.idBenevole
JOIN Competence
    ON competencebenevole.idCompetence = competence.idCompetence
WHERE competence.libelle = 'Électricité';

/*10 Quels objets sont en rayon depuis plus de six mois et devraient être sortis ?*/

