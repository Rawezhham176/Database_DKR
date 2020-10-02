SELECT rezepte_zutaten.rid, rezepte.rezeptname,
 Rezepte.Ernaerungskategorien,
 Zutaten.Zutatenname,rezepte_zutaten.zutatenmenge,
 rezepte_zutaten.zutatenmenge * Zutaten.Kalorien AS KCAL,
 rezepte_zutaten.zutatenmenge * Zutaten.Kilojoule AS KJ,
 rezepte_zutaten.zutatenmenge * Zutaten.Proteine AS Proteine,
 rezepte_zutaten.zutatenmenge * Zutaten.Proteine AS Kohlenhydrahte,
 rezepte_zutaten.zutatenmenge * Zutaten.Fett AS Fett,
 rezepte_zutaten.zutatenmenge * Zutaten.Balaststoffe AS Balaststoffe
FROM (
(rezepte_zutaten
INNER JOIN rezepte ON rezepte_zutaten.rid = rezepte.rid)
INNER JOIN zutaten ON rezepte_zutaten.zid = zutaten.zid)
/* Nach Rezept filtern */ 
WHERE Rezepte.rezeptname LIKE '%Burger%'
/* Sortieren nach RezeptNummer */ 
ORDER BY rezepte_zutaten.rid;
