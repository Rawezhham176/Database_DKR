/*
1.Speicherung von Rezepten bestehend aus mehreren Zutaten
2.Speicherung von Ernährungskategorien
3.Speicherung von Beschränkungen/ Allergenen
4.Zusammenstellung von Zutaten entsprechend eines Rezepts*/

/*5.Auswahl von Rezepten entsprechend vorgegebener Ernährungskategorien*/
/*SELECT rezepte.RezepteId, rezepte.rezeptname FROM ((rezepte left join RezepteKategorie RK on rezepte.RezepteId=RK.RezepteID) 
inner join Ernährungskategorien  ER on ER.KategorieID= RK.KategorieID) where ER.KategorieName = 'Vegatarisch'*/

/*6.Auswahl bzw. Ausschluss von Rezepten auf Basis von Beschränkungen*/
/*Select R.rezeptname, B.BeschränkungName from (((rezepte R inner join rezepte_zutaten RZ on R.RezepteId=RZ.RezepteId) inner join Zutaten Z on RZ.ZutatenNR=Z.ZutatenNR)
inner join Beschränkung B on B.BeschränkungName=Z.Beschränkung) where Z.Beschränkung = 'Weizen'*/

/*7.Zugriffskontrolle personenbezogener Daten*/

/*2*/

/*1.Auswahl eines Rezeptes nach Rezeptname*/
/*SELECT R.RezepteId, R.rezeptname, Z.ZutatenNR , Z.Bezeichnung, Z.Einheit, Z.Kalorien, Z.Nettopreis, Z.Kohlenhydrahte, Z.Beschränkung
FROM ((rezepte R inner join rezepte_zutaten RZ on R.RezepteId=RZ.RezepteId) inner join Zutaten Z on 
Z.ZutatenNR=RZ.ZutatenNR) where rezeptname = 'Pizza';*/

/*2.Auswahl aller Rezepte einer bestimmten Ernährungskategorie*/
/*SELECT R.rezeptname, ER.KategorieName FROM ((rezepte R inner join RezepteKategorie RK on R.RezepteId=RK.RezepteId) inner join  Ernährungskategorien ER
on RK.KategorieID=ER.KategorieID) where ER.KategorieName = 'Vegatarisch'; */

/*3.Auswahl aller Rezepte, die eine gewisse Zutat enthalten*/
/*SELECT R.rezeptname, Z.Bezeichnung
FROM ((rezepte_zutaten
INNER JOIN rezepte R ON rezepte_zutaten.RezepteId = R.RezepteId)
INNER JOIN Zutaten Z ON rezepte_zutaten.ZutatenNR = Z.ZutatenNR)where Z.Bezeichnung ='Mehl';*/

/*4.Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden? AVG()*/
/*Select K.KundenNR, B.BestellNR, B.Bestelldatum, AVG(Z.Kalorien) AS DKalorien, AVG(Z.Ballastoffe) AS DBallastoffe, AVG(Z.Fett) AS DFett, 
AVG(Z.Kohlenhydrahte) AS DKohlenhydrate, AVG(Z.Natrium) AS DNatrium, AVG(Z.Protein) AS DProtein
From (((Kunde K inner join Bestellung B on K.KundenNR=B.KundenNR) inner join Bestellungszutat BZ on B.BestellNR=BZ.BestellNR)
inner join Zutaten Z on Z.ZutatenNR=BZ.ZutatenNR)
Group by K.KundenNR, B.BestellNR, B.Bestelldatum*/

/*5.Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind*/
/*SELECT Zutaten.Bezeichnung
FROM Zutaten
WHERE Zutaten.ZutatenNR NOT IN (SELECT rezepte_zutaten.ZutatenNR FROM rezepte_zutaten)*/

/*6.Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten*/
/*SELECT DISTINCT R.rezeptname, R.ZutatenMenge, SUM(Z.Kalorien) AS Kalorien
FROM ((rezepte R inner join rezepte_zutaten RZ on R.RezepteId=RZ.RezepteId) inner join Zutaten Z on Z.ZutatenNR=RZ.ZutatenNR)
Group by  R.rezeptname, R.ZutatenMenge
Having SUM(Z.Kalorien) <= 500;*/

/*7.Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten*/
/*SELECT  R.rezeptname
FROM rezepte_zutaten RZ
INNER JOIN rezepte R ON RZ.RezepteId = R.RezepteId GROUP BY rezeptname HAVING COUNT(RZ.ZutatenNR) < 5 ;*/

/*8.Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen*/
/*SELECT R.rezeptname
FROM (((rezepte_zutaten RZ
INNER JOIN rezepte R ON RZ.RezepteId=R.RezepteId)
INNER JOIN RezepteKategorie RK ON RZ.RezepteId=RK.RezepteId)
INNER JOIN Ernährungskategorien EK on EK.KategorieID=RK.KategorieID)
WHERE EK.KategorieName = 'Vegatarisch'
GROUP BY rezeptname HAVING COUNT(RZ.ZutatenNR) < 5;*/

/*9.Erstellen Sie mindestens drei weitere Abfragen*/

/*A. Auswahl aller Zutaten die zu einem Rezept gehören*/
/*SELECT Z.Bezeichnung, RZ.Menge
FROM ((rezepte_zutaten RZ
INNER JOIN rezepte R ON RZ.RezepteId=R.RezepteId)
INNER JOIN Zutaten Z ON RZ.ZutatenNR=Z.ZutatenNR)
where R.rezeptname ='pizza';*/

/*B. Auswahl der Lieferanten mit deren Lieferungenn*/
/*Select DISTINCT Z.Bezeichnung, L.LieferantenName , ZL.Datum
From (((Lieferant L inner join ZutatenLieferer ZL on L.LieferantenID=ZL.LieferantenID) inner join Zutaten Z on ZL.ZutatenNR=Z.ZutatenNR) 
inner join Bestellungszutat BZ on BZ.ZutatenNR=Z.ZutatenNR) where Z.Bezeichnung = 'Zwiebel'*/

/*C.Auswahl der Kunde, die einen gewisse Zutat bestellt haben*/
/*Select DISTINCT K.KundenNR, K.Nachname, B.Bestelldatum, B.Rechnungsbetrag,
Case When B.Rechnungsbetrag Between 0 AND 10 Then 'Nicht so gute Kunde'
When B.Rechnungsbetrag Between 10 AND 20 Then 'Langsam kommt er voran'
When B.Rechnungsbetrag Between 20 AND 30 Then 'Er braucht mehr Angebote'
When B.Rechnungsbetrag > 30 Then 'Er bekommt einen Zutat geschenkt' 
End AS KundeBewertung 
From Kunde K inner join Bestellung B on K.KundenNR=B.KundenNR Order By K.KundenNR*/

/* Drei Stored Procedure*/

/*1.Auswahl aller Rezepte, die eine bestimmte Anzahl an Zutaten enthalten*/
/*Exec RezepteZutatZahl @Zahl = 10*/

/*2.Auswahl aller Rezpte, die eine gewisse Zutat enthalten*/
/*Exec SelectRezepteNamenNachZutat @Bezeichnung = 'Mehl'*/

/*3.Das Löschen ein bestimmter Kunde*/
/*Exec KundeLöschen @KundenNR = 2012*/