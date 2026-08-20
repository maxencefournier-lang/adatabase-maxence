BEGIN;

/* =========================================================
   CATEGORIES — 8 minimum
   ========================================================= */

INSERT INTO Categorie (libelle) VALUES
('Électroménager'),
('Informatique'),
('Mobilier'),
('Vêtements'),
('Livres'),
('Jouets'),
('Vaisselle'),
('Outillage');


/* =========================================================
   PERSONNES — 10 minimum
   ========================================================= */

INSERT INTO Personne (nom, prenom, telephone, adherente) VALUES
('Martin', 'Claire', '0612345678', TRUE),
('Bernard', 'Lucas', '0623456789', FALSE),
('Petit', 'Emma', '0634567890', TRUE),
('Robert', 'Hugo', '0645678901', FALSE),
('Richard', 'Chloé', '0656789012', TRUE),
('Durand', 'Louis', '0667890123', TRUE),
('Moreau', 'Léa', '0678901234', FALSE),
('Simon', 'Nathan', '0689012345', TRUE),
('Laurent', 'Manon', '0690123456', FALSE),
('Lefebvre', 'Jules', '0601234567', TRUE);


/* =========================================================
   BENEVOLES — 12 minimum
   ========================================================= */

INSERT INTO Benevole (nom, prenom, telephone, dateArrivée) VALUES
('Dubois', 'Alice', '0611111111', '2024-01-15'),
('Thomas', 'Paul', '0622222222', '2024-02-10'),
('Garcia', 'Sofia', '0633333333', '2024-03-05'),
('Roux', 'Antoine', '0644444444', '2024-04-12'),
('Fournier', 'Camille', '0655555555', '2024-05-20'),
('Girard', 'Mathieu', '0666666666', '2024-06-03'),
('Andre', 'Julie', '0677777777', '2024-07-14'),
('Mercier', 'Thomas', '0688888888', '2024-08-22'),
('Blanc', 'Sarah', '0699999999', '2024-09-18'),
('Guerin', 'Maxime', '0600000001', '2024-10-07'),
('Faure', 'Laura', '0600000002', '2024-11-11'),
('Chevalier', 'Nicolas', '0600000003', '2024-12-02');


/* =========================================================
   COMPETENCES
   ========================================================= */

INSERT INTO Competence (libelle) VALUES
('Électricité'),
('Électronique'),
('Menuiserie'),
('Couture'),
('Mécanique'),
('Petit électroménager');


/* =========================================================
   VENTES — 10 minimum
   ========================================================= */

INSERT INTO Vente (dateVente, modePaiement) VALUES
('2026-03-12', 'carte'),
('2026-03-20', 'espèces'),
('2026-04-03', 'carte'),
('2026-04-15', 'chèque'),
('2026-04-28', 'espèces'),
('2026-05-06', 'carte'),
('2026-05-18', 'carte'),
('2026-05-29', 'espèces'),
('2026-06-08', 'chèque'),
('2026-06-21', 'carte');


/* =========================================================
   DEPOTS
   ========================================================= */

INSERT INTO Depot (dateDepot, type, idpersonne) VALUES
('2026-01-05', 'boutique', 1),
('2026-01-08', 'domicile', 2),
('2026-01-15', 'boutique', 3),
('2026-01-22', 'boutique', 4),
('2026-02-03', 'domicile', 5),
('2026-02-10', 'boutique', 6),
('2026-02-18', 'domicile', 7),
('2026-03-01', 'boutique', 8),
('2026-03-12', 'boutique', 9),
('2026-03-20', 'domicile', 10),
('2026-04-02', 'boutique', 1),
('2026-04-10', 'domicile', 3);


/* =========================================================
   ATELIERS — 4 minimum
   ========================================================= */

INSERT INTO Atelier (intitule, dateDebut, duree, place) VALUES
('Réparation petit électroménager', '2026-04-10', '2h', 10),
('Initiation à la couture', '2026-04-17', '3h', 8),
('Réparation et bricolage', '2026-05-05', '3h', 12),
('Relooking de meubles', '2026-05-20', '2h30', 6);


/* =========================================================
   COMPETENCES DES BENEVOLES
   ========================================================= */

INSERT INTO competenceBenevole (idBenevole, idCompetence) VALUES
(1, 1),
(1, 6),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(6, 2),
(7, 4),
(8, 3),
(8, 5),
(9, 6),
(10, 2),
(11, 4),
(12, 1),
(12, 6);


/* =========================================================
   OBJETS — 40 minimum

   Répartition :
   - 8 arrivés
   - 7 en réparation
   - 10 en rayon
   - 10 vendus
   - 5 recyclés
   ========================================================= */

INSERT INTO Objet
(libelle, poidsKg, etatArrivee, statut, prix, idCategorie, idVente, idDepot)
VALUES

/* ---------- ARRIVES : 8 ---------- */

('Cafetière filtre', 2, 'bon état', 'arrivé', NULL, 1, NULL, 1),
('Ordinateur portable', 3, 'à réparer', 'arrivé', NULL, 2, NULL, 2),
('Chaise en bois', 6, 'bon état', 'arrivé', NULL, 3, NULL, 3),
('Manteau hiver', 2, 'bon état', 'arrivé', NULL, 4, NULL, 4),
('Collection de romans', 5, 'bon état', 'arrivé', NULL, 5, NULL, 5),
('Puzzle enfant', 1, 'bon état', 'arrivé', NULL, 6, NULL, 6),
('Service de six assiettes', 4, 'bon état', 'arrivé', NULL, 7, NULL, 7),
('Perceuse électrique', 4, 'à réparer', 'arrivé', NULL, 8, NULL, 8),

/* ---------- EN REPARATION : 7 ---------- */

('Bouilloire électrique', 2, 'à réparer', 'en réparation', NULL, 1, NULL, 9),
('Clavier mécanique', 1, 'à réparer', 'en réparation', NULL, 2, NULL, 10),
('Table basse en bois', 8, 'à réparer', 'en réparation', NULL, 3, NULL, 11),
('Machine à coudre', 7, 'à réparer', 'en réparation', NULL, 1, NULL, 12),
('Camion jouet électrique', 2, 'à réparer', 'en réparation', NULL, 6, NULL, 1),
('Lampe de bureau', 2, 'à réparer', 'en réparation', NULL, 1, NULL, 2),
('Scie sauteuse', 4, 'à réparer', 'en réparation', NULL, 8, NULL, 3),

/* ---------- EN RAYON : 10 ---------- */

('Grille-pain', 2, 'à réparer', 'en rayon', 12.00, 1, NULL, 4),
('Écran 24 pouces', 5, 'à réparer', 'en rayon', 45.00, 2, NULL, 5),
('Bibliothèque en bois', 15, 'bon état', 'en rayon', 35.00, 3, NULL, 6),
('Lot de trois chemises', 2, 'bon état', 'en rayon', 15.00, 4, NULL, 7),
('Aspirateur', 6, 'à réparer', 'en rayon', 30.00, 1, NULL, 8),
('Poupée vintage', 1, 'à réparer', 'en rayon', 14.00, 6, NULL, 9),
('Six verres à pied', 2, 'bon état', 'en rayon', 10.00, 7, NULL, 10),
('Marteau de charpentier', 1, 'bon état', 'en rayon', 8.00, 8, NULL, 11),
('Bureau en bois', 18, 'bon état', 'en rayon', 50.00, 3, NULL, 12),
('Lot de bandes dessinées', 4, 'bon état', 'en rayon', 20.00, 5, NULL, 1),

/* ---------- VENDUS : 10 ---------- */

('Micro-ondes', 12, 'à réparer', 'vendu', 40.00, 1, 1, 2),
('Souris sans fil', 1, 'bon état', 'vendu', 8.00, 2, 2, 3),
('Commode trois tiroirs', 20, 'à réparer', 'vendu', 55.00, 3, 3, 4),
('Veste en jean', 2, 'bon état', 'vendu', 18.00, 4, 4, 5),
('Dictionnaire illustré', 3, 'bon état', 'vendu', 7.00, 5, 5, 6),
('Jeu de construction', 2, 'bon état', 'vendu', 12.00, 6, 6, 7),
('Mixeur électrique', 3, 'bon état', 'vendu', 20.00, 1, 7, 8),
('Clé à molette', 1, 'bon état', 'vendu', 6.00, 8, 8, 9),
('Lot de quatre tasses', 2, 'bon état', 'vendu', 9.00, 7, 9, 10),
('Imprimante multifonction', 7, 'à réparer', 'vendu', 35.00, 2, 10, 11),

/* ---------- RECYCLES : 5 ---------- */

('Sèche-cheveux ancien', 1, 'hors service', 'recyclé', NULL, 1, NULL, 12),
('Radio réveil cassé', 2, 'hors service', 'recyclé', NULL, 1, NULL, 1),
('Chaise plastique cassée', 4, 'hors service', 'recyclé', NULL, 3, NULL, 2),
('Peluche très abîmée', 1, 'hors service', 'recyclé', NULL, 6, NULL, 3),
('Tournevis électrique HS', 2, 'hors service', 'recyclé', NULL, 8, NULL, 4);


/* =========================================================
   INSCRIPTIONS AUX ATELIERS
   ========================================================= */

INSERT INTO Inscription (idAtelier, idPersonne) VALUES

/* Atelier 1 */
(1, 1),
(1, 3),
(1, 5),
(1, 7),
(1, 9),

/* Atelier 2 */
(2, 2),
(2, 4),
(2, 6),
(2, 8),

/* Atelier 3 */
(3, 1),
(3, 2),
(3, 6),
(3, 8),
(3, 10),

/* Atelier 4 */
(4, 3),
(4, 5),
(4, 7),
(4, 9);


/* =========================================================
   REPARATIONS — 15 minimum
   ========================================================= */

INSERT INTO Reparation
(dateRepa, dureeH, resultat, idBenevole, idObjet)
VALUES

/* Objets actuellement en réparation */
('2026-03-15', '01:30:00', 'réussie', 1, 9),
('2026-03-22', '01:00:00', 'échouée', 2, 10),
('2026-04-05', '02:30:00', 'réussie', 3, 11),
('2026-04-12', '02:00:00', 'réussie', 9, 12),
('2026-04-18', '01:15:00', 'échouée', 6, 13),
('2026-04-25', '00:45:00', 'réussie', 12, 14),
('2026-05-02', '02:15:00', 'échouée', 5, 15),

/* Objets réparés puis mis en rayon */
('2026-02-10', '00:45:00', 'réussie', 1, 16),
('2026-02-18', '01:30:00', 'réussie', 2, 17),
('2026-03-05', '02:00:00', 'réussie', 9, 20),
('2026-03-14', '01:00:00', 'réussie', 6, 21),

/* Objets réparés puis vendus */
('2026-03-01', '01:30:00', 'réussie', 1, 26),
('2026-03-25', '02:15:00', 'réussie', 3, 28),
('2026-06-01', '02:00:00', 'réussie', 2, 35),

/* Objet impossible à réparer puis recyclé */
('2026-04-20', '00:50:00', 'échouée', 12, 36);


COMMIT;