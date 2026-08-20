/* Niveau 3 */
DROP TABLE IF EXISTS Reparation;

/* Niveau 2 */
DROP TABLE IF EXISTS Inscription;
DROP TABLE IF EXISTS Objet;

/* Niveau 1 */
DROP TABLE IF EXISTS competenceBenevole;
DROP TABLE IF EXISTS Atelier;
DROP TABLE IF EXISTS Depot;

/* Niveau 0 */
DROP TABLE IF EXISTS Competence;
DROP TABLE IF EXISTS Benevole;
DROP TABLE IF EXISTS Personne;
DROP TABLE IF EXISTS Categorie;
DROP TABLE IF EXISTS Vente;

/* Enum */
DROP TYPE IF EXISTS resultat_reparation;
DROP TYPE IF EXISTS statut_objet;
DROP TYPE IF EXISTS etat_arrivee;
DROP TYPE IF EXISTS type_depot;
DROP TYPE IF EXISTS moyen_paiement;