-- Insert de la commande de Rakoto
INSERT INTO genre(nom) VALUES('Produits Laitiers');

INSERT INTO produits(nom, prix, id_genre) VALUES('Yaourt', 500, 1);

INSERT INTO clients(nom, prenom, adresse, phone, email) VALUES('Rakoto', 'Jean', '123 Rue Principale', '+261323456789', 'rakoto@exemple.com');

INSERT INTO commande(date_commande, id_client) VALUES(CURRENT_DATE, 1);

INSERT INTO contain(quantite, id_produit, id_commande) VALUES(5, 1, 1);

INSERT INTO payement(total, moyen_payement, date_payement, id_commande) VALUES (2500, 'MVola', CURRENT_DATE, 1);

-- 3-a)
SELECT count(*) AS nombre_articles
FROM produits;


-- 3-b)
SELECT genre.nom AS type_article, MIN(prix) AS prix_min, MAX(prix) AS prix_max
FROM produits INNER JOIN genre ON produits.id_genre = genre.id_genre
GROUP BY genre.nom;


-- 3-c)
SELECT c.id_commande, c.date_commande, SUM(p.total) AS prix_total_paye
FROM commande c
INNER JOIN paiement p ON c.id_commande = p.id_commande
WHERE c.id_client = (SELECT id_client FROM clients WHERE nom = 'Rakoto')
GROUP BY c.id_commande, c.date_commande;


-- 3-d)
SELECT p.nom AS nom_article, SUM(c.quantite) AS quantite_vendue
FROM produits p
INNER JOIN contenu_commande c ON p.id_produit = c.id_produit
GROUP BY p.nom
ORDER BY SUM(c.quantite) DESC;

-- 3-e)
SELECT SUM(p.total) AS montant_total_gagne
FROM paiement p
INNER JOIN commande c ON p.id_commande = c.id_commande
WHERE EXTRACT(YEAR FROM p.date_paiement) = EXTRACT(YEAR FROM CURRENT_DATE);

