# Projet SQL — Gestion d'une ressourcerie

## Présentation

Ce projet contient une base PostgreSQL permettant de gérer une ressourcerie : objets, dépôts, ventes, réparations, bénévoles, compétences, ateliers et inscriptions.

La base utilise notamment les tables `Vente`, `Categorie`, `Personne`, `Benevole`, `Competence`, `Depot`, `Atelier`, `competenceBenevole`, `Objet`, `Inscription` et `Reparation`.

Le jeu de données contient au minimum 8 catégories, 10 personnes, 12 bénévoles, 40 objets, 15 réparations, 10 ventes ainsi que 4 ateliers et leurs inscriptions.

## Prérequis

- PostgreSQL
- Beekeeper Studio
- Une base de données PostgreSQL
- Docker

## Fichiers

```text
projet/
├── migration_up.sql
├── migration_down.sql
├── seed.sql
├── requetes.sql
└── README.md
```

- `migration_up.sql` crée les enums et les tables.
- `migration_down.sql` supprime les tables et les enums.
- `seed.sql` ajoute les données de test.
- `requetes.sql` contient les questions métier traitées.

## Utilisation avec Beekeeper Studio

Après avoir ouvert une connexion PostgreSQL dans Beekeeper Studio, exécuter :

```text
migration_up.sql → seed.sql → requetes.sql
```

Pour tester les migrations :

```text
migration_up.sql → migration_down.sql → migration_up.sql
```

Le test doit se terminer sans erreur. Après le dernier `up`, il est possible de relancer `seed.sql`.

## Requêtes réalisées

### 1. Objets reçus le mois dernier et poids total

```sql
SELECT COUNT(idobjet) AS nombre_objet, SUM(poidskg) AS poids
FROM objet;
```

Dans sa version actuelle, cette requête compte tous les objets de la table, sans filtre sur le mois dernier.

### 2. Objets actuellement en rayon

```sql
SELECT
    libelle,
    dateMiseRayon,
    CURRENT_DATE - dateMiseRayon AS jours_en_rayon
FROM Objet
WHERE statut = 'en rayon'
ORDER BY dateMiseRayon;
```

### 3. Catégorie qui se vend le mieux

```sql
SELECT categorie.libelle, COUNT(*) AS nombre_ventes
FROM objet
JOIN categorie ON objet.idcategorie = categorie.idcategorie
WHERE objet.statut = 'vendu'
GROUP BY categorie.libelle
ORDER BY nombre_ventes DESC;
```

### 3. Catégorie qui rapporte le plus

```sql
SELECT categorie.libelle, SUM(objet.prix) AS chiffre_affaire
FROM objet
JOIN categorie ON objet.idcategorie = categorie.idcategorie
WHERE objet.statut = 'vendu'
GROUP BY categorie.libelle
ORDER BY chiffre_affaire DESC;
```

### 4. Heures de bénévolat consacrées aux réparations cette année

```sql
SELECT SUM(dureeh) AS heure_benevola_reparation
FROM reparation;
```

Dans sa version actuelle, cette requête additionne toutes les durées, sans filtre sur l'année en cours.

### 6. Personnes ayant effectué plus de trois dépôts

```sql
SELECT
    personne.prenom,
    personne.nom,
    COUNT(depot.idDepot) AS nombre_depots
FROM Personne
JOIN Depot ON personne.idPersonne = depot.idpersonne
GROUP BY personne.idPersonne, personne.prenom, personne.nom
HAVING COUNT(depot.idDepot) > 3;
```

### 7. Poids total détourné de la déchetterie

```sql
SELECT SUM(poidsKg) AS poids_total
FROM Objet
WHERE NOT statut = 'recyclé';
```

### 9. Bénévoles ayant la compétence « Électricité »

```sql
SELECT
    benevole.prenom,
    benevole.nom
FROM benevole
JOIN competencebenevole
    ON benevole.idBenevole = competencebenevole.idBenevole
JOIN Competence
    ON competencebenevole.idCompetence = competence.idCompetence
WHERE competence.libelle = 'Électricité';
```

Cette requête trouve les bénévoles compétents en électricité, mais elle ne peut pas vérifier leur disponibilité.

## Questions non traitées

Je n'ai pas répondu aux questions suivantes :

- question 5 : taux de réussite des réparations ;
- question 8 : taux de présence réelle aux ateliers ;
- question 10 : objets en rayon depuis plus de six mois.

## Limites du modèle

- La table `Inscription` enregistre les inscriptions, mais pas la présence réelle aux ateliers.
- Les compétences des bénévoles sont enregistrées, mais pas leurs disponibilités.

Le modèle ne permet donc pas de répondre complètement aux questions sur la présence réelle et la disponibilité des bénévoles.
