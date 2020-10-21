USE [Database 1]
GO


CREATE TABLE [dbo].[Kunde](
	[KundenNR] [int] IDENTITY(1,1) NOT NULL,
	[Nachname] [varchar](50) NULL,
	[Vorname] [varchar](50) NULL,
	[Geburtsdatum] [date] NULL,
	[Strasse] [varchar](50) NULL,
	[Hausnr] [varchar](6) NULL,
	[PLZ] [char](5) NULL,
	[Ort] [varchar](50) NULL,
	[Telefon] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Kunde] PRIMARY KEY CLUSTERED 
(
	[KundenNR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[KundenBeschränkung](
	[KundenNR] [int] NOT NULL,
	[BeschränkungID] [int] NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Beschränkung](
	[BeschränkungID] [int] IDENTITY(1,1) NOT NULL,
	[BeschränkungName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Beschränkung] PRIMARY KEY CLUSTERED 
(
	[BeschränkungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Bestellung](
	[BestellNR] [int] IDENTITY(1,1) NOT NULL,
	[KundenNR] [int] NULL,
	[Bestelldatum] [date] NULL,
	[Rechnungsbetrag] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[BestellNR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Bestellungszutat](
	[BestellNR] [int] NOT NULL,
	[RezepteID] [int] NOT NULL,
	[ZutatenNR] [int] NOT NULL,
	[Menge] [int] NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[rezepte](
	[RezepteId] [int] NOT NULL,
	[rezeptname] [nvarchar](50) NOT NULL,
	[ZutatenMenge] [int] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Ernährungskategorien](
	[KategorieID] [int] IDENTITY(1,1) NOT NULL,
	[KategorieName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[RezepteKategorie](
	[RezepteID] [int] NOT NULL,
	[KategorieID] [nchar](10) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[rezepte_zutaten](
	[rzid] [int] IDENTITY(1,1) NOT NULL,
	[RezepteId] [int] NULL,
	[ZutatenNR] [int] NULL,
	[Menge] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Zutaten](
	[ZutatenNR] [int] NOT NULL,
	[Bezeichnung] [varchar](50) NULL,
	[Einheit] [varchar](25) NULL,
	[Nettopreis] [decimal](10, 2) NULL,
	[Bestand] [int] NULL,
	[Lieferant] [int] NULL,
	[Kalorien] [int] NULL,
	[Kohlenhydrahte] [decimal](10, 2) NULL,
	[Protein] [decimal](10, 2) NULL,
	[Fett] [decimal](18, 0) NULL,
	[Ballastoffe] [decimal](18, 0) NULL,
	[Natrium] [decimal](18, 0) NULL,
	[Beschränkung] [nchar](10) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Lieferant](
	[LieferantenID] [int] NOT NULL,
	[LieferantenName] [varchar](50) NULL,
	[Strasse] [varchar](50) NULL,
	[HausNR] [varchar](6) NULL,
	[PLZ] [varchar](5) NULL,
	[Ort] [varchar](50) NULL,
	[Telefon] [varchar](25) NULL,
	[Email] [varchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ZutatenLieferer](
	[LieferantenID] [int] NOT NULL,
	[Datum] [date] NOT NULL,
	[ZutatenNR] [int] NOT NULL
) ON [PRIMARY]
GO


