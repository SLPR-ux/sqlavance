SET NAMES utf8mb4;
DROP DATABASE IF EXISTS `commands`;
CREATE DATABASE commands;
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE commands;

CREATE TABLE client (
  idClient BIGINT PRIMARY KEY AUTO_INCREMENT,
  nom varchar(255) NOT NULL,
  prenom varchar(255) NOT NULL,
  adresse varchar(255) NOT NULL,
  email varchar(255) NOT NULL UNIQUE
);

CREATE TABLE commande (
  idCommande BIGINT PRIMARY KEY AUTO_INCREMENT,
  dateCommande datetime NOT NULL,
  montantTotal decimal(10,2) NOT NULL,
  idClient BIGINT NOT NULL,
  PRIMARY KEY (idCommande),
  FOREIGN KEY (idClient) REFERENCES client(idClient)
);

CREATE TABLE lignecommande (
  idLigneCommande BIGINT PRIMARY KEY AUTO_INCREMENT,
  idCommande BIGINT NOT NULL,
  idArticle BIGINT NOT NULL,
  quantite int(11) NOT NULL,
  PRIMARY KEY (idLigneCommande),
  FOREIGN KEY (idCommande) REFERENCES commande(idCommande)
    FOREIGN KEY (idArticle) REFERENCES article(idArticle)
);

CREATE TABLE article (
  idArticle BIGINT PRIMARY KEY AUTO_INCREMENT,
  libelle varchar(255) NOT NULL,
  prixUnitaire decimal(10,2) NOT NULL,
  stock int(11) NOT NULL
);