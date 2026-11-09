# def afficher_resultat(cur):
#     for nom, ville in cur.fetchall():
#         print(f"aeroprts : {nom} - ville : {ville} ")

# def afficher_resultat(cur):
#     for numero_vol, date_vol, statut in cur.fetchall():
#         print(f"numero_vol: {numero_vol} - date vol: {date_vol} - statut: {statut}")

# def afficher_resultat(cur):
#     for nom, prenom in cur.fetchall():
#         print(f"nom: {nom} - prenom: {prenom}")

# def afficher_resultat(cur):
#     for nom, prenom, numero_vol in cur.fetchall():
#         print(f"nom: {nom} - prenom: {prenom} - numero vol: {numero_vol}")

# def afficher_resultat(cur):
#     for numero_vol, ville_depart, ville_arrivee in cur.fetchall():
#         print(f"numero vol: {numero_vol} - ville depart: {ville_depart} - ville arrivee: {ville_arrivee}")

def afficher_resultat(cur):
    for numero_vol, nom, prenom in cur.fetchall():
        if nom is None :
            print(f"numero vol: {numero_vol} - Aucun passagers")
        else :
            print(f"numero vol: {numero_vol} - nom: {nom} - prenom: {prenom}")
            