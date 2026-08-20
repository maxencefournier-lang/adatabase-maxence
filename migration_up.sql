/* Enum */

CREATE TYPE type_depot AS ENUM ('boutique', 'domicile');
CREATE TYPE etat_arrivee AS ENUM ('bon état', 'à réparer', 'hors service');
CREATE TYPE statut_objet AS ENUM ('arrivé', 'en réparation', 'en rayon', 'vendu', 'recyclé');
CREATE TYPE resultat_reparation AS ENUM ('réussie', 'échouée');
CREATE TYPE moyen_paiement AS ENUM ('espèces', 'carte', 'chèque');

/* Niveau 0 */

CREATE TABLE Vente (
  idVente SERIAL PRIMARY KEY,
  dateVente DATE NOT NULL,
  modePaiement moyen_paiement NOT NULL
);

CREATE TABLE Categorie (
  idCategorie SERIAL PRIMARY KEY,
  libelle VARCHAR(50) NOT NULL
);

CREATE TABLE Personne (
  idPersonne SERIAL PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  telephone VARCHAR(20) NOT NULL,
  adherente BOOLEAN
);

CREATE TABLE Benevole (
  idBenevole SERIAL PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  telephone VARCHAR(20) NOT NULL,
  dateArrivée DATE NOT NULL
);

CREATE TABLE Competence (
  idCompetence SERIAL PRIMARY KEY,
  libelle VARCHAR(50) NOT NULL
);


/* Niveau 1 */

CREATE TABLE Depot (
  idDepot SERIAL PRIMARY KEY,
  dateDepot DATE NOT NULL,
  type type_depot NOT NULL,
  idpersonne INTEGER REFERENCES Personne(idPersonne)
);

CREATE TABLE Atelier (
  idAtelier SERIAL PRIMARY KEY,
  intitule VARCHAR(50),
  dateDebut DATE,
  duree VARCHAR(10),
  place INTEGER NOT NULL
);

CREATE TABLE competenceBenevole (
  idBenevole INTEGER REFERENCES Benevole(idBenevole),
  idCompetence INTEGER REFERENCES Competence(idCompetence)
);

/* Niveau 2 */

CREATE TABLE Objet (
  idObjet SERIAL PRIMARY KEY,
  libelle VARCHAR(50) NOT NULL,
  poidsKg INTEGER NOT NULL,
  etatArrivee etat_arrivee NOT NULL,
  statut statut_objet NOT NULL,
  prix NUMERIC(10, 2),
  idCategorie INTEGER REFERENCES Categorie(idCategorie),
  idVente INTEGER REFERENCES Vente(idVente),
  idDepot INTEGER REFERENCES DEpot(idDepot)
  /*idReparation INTEGER REFERENCES Reparation(idReparation)*/
);

CREATE TABLE Inscription (
  idAtelier INTEGER REFERENCES Atelier(idAtelier),
  idPersonne INTEGER REFERENCES Personne(idPersonne)
);

/* Niveau 3 */

CREATE TABLE Reparation (
  idReparation SERIAL PRIMARY KEY,
  dateRepa DATE,
  dureeH TIME,
  resultat resultat_reparation NOT NULL,
  idBenevole INTEGER REFERENCES Benevole(idBenevole),
  idObjet INTEGER REFERENCES Objet(idObjet)
);