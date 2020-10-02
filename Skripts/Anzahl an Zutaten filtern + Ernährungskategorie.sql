SELECT Rezepte.rezeptname, Rezepte.Ernaerungskategorien
FROM ((rezepte_zutaten
INNER JOIN rezepte ON rezepte_zutaten.rid = rezepte.rid)
INNER JOIN zutaten ON rezepte_zutaten.zid = zutaten.zid) 
/* Nach Ernährungsketegorie  */
WHERE Rezepte.Ernaerungskategorien='OhneGentechnik' 
GROUP BY Rezepte.rid, Rezepte.rezeptname, Rezepte.Ernaerungskategorien HAVING COUNT(rezepte_zutaten.zid) <=  
/* Anzahl der Zutaten */
12;