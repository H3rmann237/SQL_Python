def lister_aeroports_par_ville(cur):
    affichage = cur.execute("""
        SELECT * FROM Aeroports ORDER BY ville
    """)
    return affichage

def lister_vols_programmes(cur):
    affichage = cur.execute("""
        SELECT numero_vol, date_vol, statut 
        FROM Vols 
        WHERE statut = 'Programme'
    """)
    return affichage

def lister_passagers_du_vol(cur):
    cur.execute("""
        SELECT id_vol 
        FROM Vols 
        WHERE numero_vol = ?
    """,("CM101",))
    ligne = cur.fetchone()
    ligne_vol = ligne[0]
    affichage = cur.execute("""
        SELECT nom, prenom
        FROM Passagers 
        WHERE id_vol = ?
    """,(ligne_vol,))
    return affichage

def lister_passagers_avec_numero_vol(cur):
    affichage = cur.execute("""
        SELECT p.nom, p.prenom, v.numero_vol
        FROM Passagers as p
        INNER JOIN Vols as v
        ON v.id_vol = p.id_vol
    """)
    return affichage

def lister_vols_avec_villes(cur):
    affichage = cur.execute("""
        SELECT v.numero_vol, ad.ville, aa.ville
        FROM Vols as v
        INNER JOIN Aeroports as ad
        ON ad.id_aeroport = v.id_depart
        INNER JOIN Aeroports as aa
        ON aa.id_aeroport = v.id_arrivee
    """)
    return affichage

def lister_passagers_du_vol_jointure(cur):
    affichage = cur.execute("""
        SELECT p.nom, p.prenom, v.numero_vol
        FROM Passagers as p
        INNER JOIN Vols as v
        ON p.id_vol = v.id_vol
        WHERE v.numero_vol = ?
    """,("CM101",))
    return affichage

def lister_vols_avec_passagers(cur):
    affichage = cur.execute("""
        SELECT  v.numero_vol, p.nom, p.prenom
        FROM Vols as v
        LEFT JOIN Passagers as p
        ON p.id_vol = v.id_vol
    """)
    return affichage