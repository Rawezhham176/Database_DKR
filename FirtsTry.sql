/*SELECT rezepte_zutaten.rid, rezepte.rezeptname, rezepte_zutaten.zid, zutaten.zname, rezepte_zutaten.zutatenmengeinML, rezepte_zutaten.zutatenmengeinG
FROM ((rezepte_zutaten
INNER JOIN rezepte ON rezepte_zutaten.rid = rezepte.rid)
INNER JOIN zutaten ON rezepte_zutaten.zid = zutaten.zid) ORDER BY rezepte_zutaten.rid;*/

/*SELECT rezeptname FROM rezepte where rezepte.Ernährungskategorie = 'Vegatarisch';*/

/*SELECT  zutaten.zname
FROM ((rezepte_zutaten
INNER JOIN rezepte ON rezepte_zutaten.rid = rezepte.rid)
INNER JOIN zutaten ON rezepte_zutaten.zid = zutaten.zid)where rezeptname ='pizza' ORDER BY rezepte_zutaten.rid;*/

/*Auswahl bzw. Ausschluss von Rezepten auf Basis von Beschränkungen*/

/*2*/

/*Auswahl eines Rezeptes nach Rezeptname*/
/*SELECT rezepte.rezeptname FROM rezepte where rezeptname = 'Pizza';*/

/*Auswahl aller Rezepte einer bestimmten Ernährungskategorie*/
/*SELECT * FROM rezepte where Ernährungskategorie = 'Vegatarisch';*/

/*Auswahl aller Rezepte, die eine gewisse Zutat enthalten*/
/*SELECT rezepte.rezeptname
FROM ((rezepte_zutaten
INNER JOIN rezepte ON rezepte_zutaten.rid = rezepte.rid)
INNER JOIN zutaten ON rezepte_zutaten.zid = zutaten.zid)where zname ='Mehl' ORDER BY rezepte_zutaten.rid;*/

/*Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden? AVG()*/


/*Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind*/
/*SELECT zutaten.zname
FROM zutaten
WHERE zutaten.zid NOT IN (SELECT rezepte_zutaten.zid FROM rezepte_zutaten)*/

/*Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten*/
/*SELECT * FROM rezepte
WHERE KalorieMenge <= 500*/

/*Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten*/
/*SELECT  DISTINCT rezepte.rezeptname
FROM ((rezepte_zutaten
INNER JOIN rezepte ON rezepte_zutaten.rid = rezepte.rid)
INNER JOIN zutaten ON rezepte_zutaten.zid = zutaten.zid)GROUP BY rezeptname HAVING COUNT(rezepte_zutaten.zid) < 5 ;*/

/*Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen*/
/*SELECT  DISTINCT rezepte.rezeptname
FROM ((rezepte_zutaten
INNER JOIN rezepte ON rezepte_zutaten.rid = rezepte.rid)
INNER JOIN zutaten ON rezepte_zutaten.zid = zutaten.zid)WHERE rezepte.Ernährungskategorie = 'Vegatarisch'
GROUP BY rezeptname HAVING COUNT(rezepte_zutaten.zid) < 5;*/

