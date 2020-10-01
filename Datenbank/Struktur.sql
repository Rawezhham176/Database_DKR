USE [krautundrueben]
GO

/****** Object:  Table [dbo].[Bestellung]    Script Date: 01.10.2020 19:22:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bestellung]') AND type in (N'U'))
DROP TABLE [dbo].[Bestellung]
GO

/****** Object:  Table [dbo].[Bestellung]    Script Date: 01.10.2020 19:22:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bestellung](
	[BestellNR] [int] IDENTITY(1,1) NOT NULL,
	[KundenNR] [int] NULL,
	[Bestelldatum] [timestamp] NULL,
	[Rechnungsbetrag] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[BestellNR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Kunde]    Script Date: 01.10.2020 19:22:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Kunde]') AND type in (N'U'))
DROP TABLE [dbo].[Kunde]
GO

/****** Object:  Table [dbo].[Kunde]    Script Date: 01.10.2020 19:22:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kunde](
	[KundenNR] [int] NULL,
	[Nachname] [varchar](50) NULL,
	[Vorname] [varchar](50) NULL,
	[Geburtsdatum] [date] NULL,
	[Strasse] [varchar](50) NULL,
	[Hausnr] [varchar](6) NULL,
	[PLZ] [char](5) NULL,
	[Ort] [varchar](50) NULL,
	[Telefon] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Allergene] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezepte]    Script Date: 01.10.2020 19:22:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rezepte]') AND type in (N'U'))
DROP TABLE [dbo].[Rezepte]
GO

/****** Object:  Table [dbo].[Rezepte]    Script Date: 01.10.2020 19:22:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rezepte](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[rezeptname] [nvarchar](50) NOT NULL,
	[Ernaerungskategorien] [nvarchar](50) NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Rezepte_Zutaten]    Script Date: 01.10.2020 19:23:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rezepte_Zutaten]') AND type in (N'U'))
DROP TABLE [dbo].[Rezepte_Zutaten]
GO

/****** Object:  Table [dbo].[Rezepte_Zutaten]    Script Date: 01.10.2020 19:23:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rezepte_Zutaten](
	[rzid] [int] IDENTITY(1,1) NOT NULL,
	[rid] [int] NULL,
	[zid] [int] NULL,
	[zutatenmenge] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zutaten]    Script Date: 01.10.2020 19:23:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zutaten]') AND type in (N'U'))
DROP TABLE [dbo].[Zutaten]
GO

/****** Object:  Table [dbo].[Zutaten]    Script Date: 01.10.2020 19:23:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Zutaten](
	[zid] [int] IDENTITY(1,1) NOT NULL,
	[Zutatenname] [varchar](50) NOT NULL,
	[Kalorien] [float] NULL,
	[Kilojoule] [float] NULL,
	[Proteine] [float] NULL,
	[Kohlenhydrahte] [float] NULL,
	[Fett] [float] NULL,
	[gesaettigteFettsaeuren] [float] NULL,
	[Balaststoffe] [float] NULL,
	[Natrium] [float] NULL,
	[Allergene] [varchar](50) NULL
) ON [PRIMARY]
GO

