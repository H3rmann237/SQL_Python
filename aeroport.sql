-- EXERCICE D'APPLICATION : GESTION DES VOLS AU CAMEROUN
-- Environnement : SQLite (DB Browser for SQLite ou sqlite3).
-- Exécuter ce script dans une nouvelle base gestion_aeroports.db.
-- Le script crée et remplit les tables. Les questions sont à la fin.
-- Les vols, passagers et adresses électroniques sont fictifs.

/* ÉNONCÉ
Une agence de voyages souhaite mettre en place une base de données pour gérer
les vols entre plusieurs aéroports du Cameroun et les passagers inscrits sur
ces vols.

Un aéroport est caractérisé par un identifiant unique, un nom et une ville.
Par exemple, l'aéroport de Douala se trouve dans la ville de Douala et
l'aéroport de Yaoundé-Nsimalen se trouve à Yaoundé.

Un vol est caractérisé par un identifiant unique, un numéro de vol unique,
une date et un statut : « Programme », « Retarde » ou « Annule ».
Chaque vol part d'un seul aéroport et arrive dans un seul autre aéroport.
Un aéroport peut être le point de départ ou d'arrivée de plusieurs vols.

Un passager est caractérisé par un identifiant unique, un nom, un prénom
et une adresse électronique unique. Pour simplifier cette application,
chaque passager est inscrit sur un seul vol. Un vol peut accueillir plusieurs
passagers ou ne recevoir encore aucune inscription.

La base de données contient exactement trois tables : Aeroports, Vols
et Passagers.
*/

-- 1. PRÉPARATION DES TABLES ET DES DONNÉES
-- Dans SQLite, les clés étrangères doivent être activées à chaque connexion.
PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

CREATE TABLE Aeroports (
    id_aeroport INTEGER PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    ville VARCHAR(50) NOT NULL
);

CREATE TABLE Vols (
    id_vol INTEGER PRIMARY KEY,
    numero_vol VARCHAR(10) NOT NULL UNIQUE,
    id_depart INTEGER NOT NULL,
    id_arrivee INTEGER NOT NULL,
    date_vol DATE NOT NULL,
    statut VARCHAR(20) NOT NULL
        CHECK (statut IN ('Programme', 'Retarde', 'Annule')),
    FOREIGN KEY (id_depart) REFERENCES Aeroports(id_aeroport),
    FOREIGN KEY (id_arrivee) REFERENCES Aeroports(id_aeroport),
    CHECK (id_depart <> id_arrivee)
);

CREATE TABLE Passagers (
    id_passager INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    id_vol INTEGER NOT NULL,
    FOREIGN KEY (id_vol) REFERENCES Vols(id_vol)
);

INSERT INTO Aeroports (id_aeroport, nom, ville) VALUES
    (1, 'Aéroport de Douala', 'Douala'),
    (2, 'Aéroport de Yaoundé-Nsimalen', 'Yaoundé'),
    (3, 'Aéroport de Garoua', 'Garoua'),
    (4, 'Aéroport de Maroua-Salak', 'Maroua'),
    (5, 'Aéroport de Bafoussam', 'Bafoussam');

INSERT INTO Vols
    (id_vol, numero_vol, id_depart, id_arrivee, date_vol, statut)
VALUES
    (1, 'CM101', 1, 2, '2026-11-15', 'Programme'),
    (2, 'CM102', 2, 3, '2026-11-15', 'Retarde'),
    (3, 'CM103', 3, 1, '2026-11-16', 'Programme'),
    (4, 'CM104', 1, 4, '2026-11-16', 'Programme'),
    (5, 'CM105', 4, 2, '2026-11-17', 'Programme'),
    (6, 'CM106', 2, 1, '2026-11-17', 'Annule');

INSERT INTO Passagers (id_passager, nom, prenom, email, id_vol) VALUES
    (1, 'Njoya', 'Amina', 'amina@example.com', 1),
    (2, 'Fonkou', 'Paul', 'paul@example.com', 1),
    (3, 'Abena', 'Carine', 'carine@example.com', 2),
    (4, 'Oumarou', 'Ibrahim', 'ibrahim@example.com', 2),
    (5, 'Manga', 'Rose', 'rose@example.com', 3),
    (6, 'Tchoumi', 'Eric', 'eric@example.com', 4),
    (7, 'Bello', 'Mariam', 'mariam@example.com', 4),
    (8, 'Etoa', 'Daniel', 'daniel@example.com', 6);

COMMIT;

-- 2. TRAVAIL DEMANDÉ : CONSULTATIONS ET JOINTURES
-- Écrire chaque requête sous la question correspondante, puis l'exécuter.
-- La création et l'insertion sont déjà réalisées par le script ci-dessus.

-- Question 1 : Afficher tous les aéroports par ordre alphabétique des villes.
-- Votre requête :


-- Question 2 : Afficher les vols dont le statut est « Programme ».
-- Votre requête :


-- Question 3 : Afficher les passagers du vol CM101.
-- Votre requête :


-- Question 4 : Afficher le nom et le prénom de chaque passager
-- avec le numéro de son vol.
-- Votre requête :


-- Question 5 : Afficher chaque vol avec sa ville de départ
-- et sa ville d'arrivée.
-- Indication : utiliser deux jointures vers Aeroports avec deux alias.
-- Votre requête :


-- Question 6 : Afficher les passagers dont le vol part de Douala.
-- Votre requête :


-- Question 7 : Afficher les passagers inscrits sur un vol retardé.
-- Votre requête :


-- Question 8 : Afficher tous les vols avec leurs passagers,
-- y compris les vols sans passager.
-- Votre requête :


-- Question 9 : Afficher uniquement les vols sans passager.
-- Votre requête :
