from connexion import ouvrir_connexion
from affichage import afficher_resultat
from requetes import lister_vols_avec_passagers

try :
    conn = ouvrir_connexion("gestion_aeroports.db")
    cur = conn.cursor()
    resultat = lister_vols_avec_passagers(cur)
    afficher_resultat(cur)
    # print("BD ouvert")
    cur.close()
finally :
    conn.close()