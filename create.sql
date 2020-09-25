USE [krautundrueben]

GO

/****** Object:  Table [dbo].[Rezepte_Zutaten]    Script Date: 25.09.2020 10:24:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rezepte_Zutaten]') AND type in (N'U'))
DROP TABLE [dbo].[Rezepte_Zutaten]
GO

/****** Object:  Table [dbo].[Rezepte_Zutaten]    Script Date: 25.09.2020 10:24:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rezepte_Zutaten](
	[rzid] [int] IDENTITY(1,1) NOT NULL,
	[rid] [int] NULL,
	[zid] [int] NULL,
	[zutatenmenge] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Zutaten]    Script Date: 25.09.2020 10:24:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zutaten]') AND type in (N'U'))
DROP TABLE [dbo].[Zutaten]
GO

/****** Object:  Table [dbo].[Zutaten]    Script Date: 25.09.2020 10:24:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Zutaten](
	[zid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[Kalorien] [varchar](50) NULL,
	[Kilojoule] [varchar](50) NULL,
	[Proteine] [varchar](50) NULL,
	[Kohlenhydrahte] [varchar](50) NULL,
	[Fett] [varchar](50) NULL,
	[gesaettigteFettsaeuren] [varchar](50) NULL,
	[Balaststoffe] [varchar](50) NULL,
	[Natrium] [varchar](50) NULL,
	[Allergene] [varchar](50) NULL
) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Kunde]') AND type in (N'U'))
DROP TABLE [dbo].[Kunde]
GO

/****** Object:  Table [dbo].[Kunde]    Script Date: 25.09.2020 10:24:09 ******/
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rezepte]') AND type in (N'U'))
DROP TABLE [dbo].[Rezepte]
GO

/****** Object:  Table [dbo].[Rezepte]    Script Date: 25.09.2020 10:23:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rezepte](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[rezeptname] [nvarchar](50) NOT NULL,
	[Ernaerungskategorien] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


