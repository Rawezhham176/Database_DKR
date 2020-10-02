SELECT rezepte.rezeptname
FROM ((rezepte_zutaten
INNER JOIN rezepte ON rezepte_zutaten.rid = rezepte.rid)
INNER JOIN zutaten ON rezepte_zutaten.zid = zutaten.zid)GROUP BY rezeptname HAVING COUNT(rezepte_zutaten.zid) <= 90 ;