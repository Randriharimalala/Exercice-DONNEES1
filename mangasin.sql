create database magasin_online;

\c magasin_online;

create table clients(
    id_client serial primary key ,
    nom varchar(100),
    prenom varchar(100),
    adresse varchar(100),
    phone varchar(18),
    email varchar(50)
);

create table commande(
    id_commande serial primary key,
    date_commande date,
    id_client serial references clients(id_client)
);

create table contain(
    quantite int ,
    id_produit serial references produits(id_produit),
    id_commande serial references commande(id_commande)
);

create table produits(
    id_produit serial primary key ,
    nom varchar(100),
    prix int,
    id_genre serial references genre(id_genre)
);

create table genre(
    id_genre serial primary key ,
    nom varchar(100)
);

create table payement(
    id_payement serial primary key ,
    total int ,
    moyen_payment varchar(100),
    date_payement date,
    id_commande serial references commande(id_commande)
);
