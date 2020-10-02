SELECT Rezepte.rezeptname
FROM ((rezepte_zutaten
INNER JOIN rezepte ON rezepte_zutaten.rid = rezepte.rid)
INNER JOIN zutaten ON rezepte_zutaten.zid = zutaten.zid) GROUP BY Rezepte.rid, Rezepte.rezeptname HAVING COUNT(rezepte_zutaten.zid) <=  
/* Anzahl der Zutaten */
8;