import sqlite3

def ouvrir_connexion(chemin_db):
    conn = sqlite3.connect(chemin_db)
    return conn