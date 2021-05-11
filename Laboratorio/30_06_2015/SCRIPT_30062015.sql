-- NON MODIFICARE NULLA NEL RESTO DI QUESTO FILE
-- SE NON ISTRUITO IN PROPOSITO DAL DOCENTE

SET NOCOUNT ON
SET DATEFORMAT dmy

USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'DB30062015')  
	DROP DATABASE [DB30062015]
GO

CREATE DATABASE [DB30062015]
GO

USE [DB30062015]
GO


-- INIZIO CREAZIONE STRUTTURA

CREATE TABLE [dbo].[Persona] (
	[username] [nvarchar] (16) NOT NULL PRIMARY KEY,
	[nome] [nvarchar] (100) NOT NULL,
	[cognome] [nvarchar] (100) NOT NULL,
	[datanascita] datetime NOT NULL, 
	[email] [nvarchar] (100) NULL )
GO

CREATE TABLE [dbo].[Associazione] (
	[username] [nvarchar] (16) NOT NULL PRIMARY KEY,
	[nome] [nvarchar] (100) NOT NULL,
	[PIVA] [nvarchar] (16) NOT NULL )
GO


CREATE TABLE [dbo].[Manifestazione] (
	[cod] [int] NOT NULL PRIMARY KEY,
	[titolo] [nvarchar] (50) NOT NULL,
	[data_i] [datetime] NOT NULL,
	[data_f] [datetime] NULL,
	[luogo] [nvarchar] (50) NOT NULL,
	[organizzatore] [nvarchar] (16) NULL,
	[num_partecipanti] [int] NULL
	 )
GO



CREATE TABLE [dbo].[Staff] (
	[cod] [int] NOT NULL FOREIGN KEY REFERENCES [Manifestazione],
	[membro] [nvarchar] (16) NOT NULL FOREIGN KEY REFERENCES [Persona],
	PRIMARY KEY ([cod],[membro])
	)
GO	




INSERT INTO [Persona] values ('MAR','Marco','Gualdi','01-10-1978','mrg@hotmail.com')
INSERT INTO [Persona] values ('FABBI','Fabio','Neri','13-05-1968','fabbi@gmail.com')
INSERT INTO [Persona] values ('FRX','Frencesco','Bianchi','23-06-1977','frx@gmail.com')
INSERT INTO [Persona] values ('JLO','Angela','Rossi','11-11-1975','jlo@virgilio.it')

INSERT INTO [Persona] values ('NXT','Norberto','Vecchi','30-06-1974','nxt@gmail.com')
INSERT INTO [Persona] values ('SUX','Federico','Rossini','01-11-1979','suxfede@gmail.com')


INSERT INTO [Persona] values ('FRE','Fracesco','Neri','11-09-1974',null)
INSERT INTO [Persona] values ('JV','Giulio','Vecchi','30-08-1976','jv1976@gmail.com')
INSERT INTO [Persona] values ('VVV','Vincenzo','Rossi','01-06-1974','vvv74@gmail.com')
INSERT INTO [Persona] values ('MAX','Massimo','Verdi','02-09-1974','verdi74@libero.it')
INSERT INTO [Persona] values ('VIX','Flavio','Vecchi','01-06-1973','vix73@gmail.com')
INSERT INTO [Persona] values ('LEO','Leonardo','Trento','04-07-1975','leo@virgilio.it')
INSERT INTO [Persona] values ('JULY','Giulia','Viola','02-06-1979','july@libero.it')
INSERT INTO [Persona] values ('NOR','Antonio','Blu','07-05-1979','anto@libero.it')


INSERT INTO [Associazione] values ('Handala','Associazione Handala',                          '589TRF379LTO13')
INSERT INTO [Associazione] values ('World Peace','Associazioni per la pace nel mondo Handala','589TRF379LTO35')
INSERT INTO [Associazione] values ('Onda Pride','15 Associazioni contro la discriminiazione', '039TGB388LGO10')
INSERT INTO [Associazione] values ('UISP','Unione Italiana Sport Per Tutti',                  '938GHT209TRG30')
INSERT INTO [Associazione] values ('FCI','Federazione Ciclistica Italiana',                   '958ZHT210TRG30')
INSERT INTO [Associazione] values ('Arci','Associazione Ricreativa e Culturale Italiana',     '67TTHT201TRG30')




DELETE FROM [Manifestazione]

INSERT INTO [Manifestazione] values (1,'CITTA IN BICI','30-04-2015',null,'Milano','FCI',200)
INSERT INTO [Manifestazione] values (2,'Mediterraneo Antirazzista','26-05-2015','16-06-2015','Milano','Handala',2500)
INSERT INTO [Manifestazione] values (3,'Marcia per la pace','19-05-2014',null,'Perugia','World Peace',7000)
INSERT INTO [Manifestazione] values (4,'Gay Pride','27-06-2015',null,'Milano','Onda Pride',10000)
INSERT INTO [Manifestazione] values (5,'Gay Pride','27-06-2015',null,'Napoli','Onda Pride',5000)
INSERT INTO [Manifestazione] values (6,'Gay Pride','27-06-2015',null,'Bologna','Onda Pride',6000)
INSERT INTO [Manifestazione] values (8,'SPORT IN ROSA','18-08-2015','25-08-2015','Roma','UISP',null)
INSERT INTO [Manifestazione] values (9,'A TUTTO SPORT','12-08-2015',null,'Roma','FCI', null)
INSERT INTO [Manifestazione] values (10,'SPORT IN ROSA','29-07-2015',null,'Milano','UISP', null)
INSERT INTO [Manifestazione] values (11,'Mediterraneo Antirazzista','30-08-2015','10-09-2015','Bologna','Handala',100)
INSERT INTO [Manifestazione] values (12,'Mediterraneo Antirazzista','19-07-2015','2-08-2015','Napoli','Handala',200)



INSERT INTO [Staff] values (1,'MAR')
INSERT INTO [Staff] values (1,'JLO')
INSERT INTO [Staff] values (1,'FABBI')
INSERT INTO [Staff] values (1,'FRE')
INSERT INTO [Staff] values (1,'JV')
INSERT INTO [Staff] values (1,'VVV')


INSERT INTO [Staff] values (2,'MAX')
INSERT INTO [Staff] values (2,'VIX')
INSERT INTO [Staff] values (2,'LEO')
INSERT INTO [Staff] values (2,'JULY')
INSERT INTO [Staff] values (2,'VVV')


INSERT INTO [Staff] values (3,'MAR')
INSERT INTO [Staff] values (3,'JLO')
INSERT INTO [Staff] values (3,'FABBI')
INSERT INTO [Staff] values (3,'FRE')
INSERT INTO [Staff] values (3,'JV')
INSERT INTO [Staff] values (3,'VVV')
INSERT INTO [Staff] values (3,'JULY')
INSERT INTO [Staff] values (3,'LEO')
INSERT INTO [Staff] values (3,'NOR')


INSERT INTO [Staff] values (4,'MAR')
INSERT INTO [Staff] values (4,'JLO')
INSERT INTO [Staff] values (4,'FABBI')
INSERT INTO [Staff] values (4,'FRE')
INSERT INTO [Staff] values (4,'JV')
INSERT INTO [Staff] values (4,'VVV')


INSERT INTO [Staff] values (5,'MAX')
INSERT INTO [Staff] values (5,'VIX')
INSERT INTO [Staff] values (5,'LEO')
INSERT INTO [Staff] values (5,'JULY')
INSERT INTO [Staff] values (5,'VVV')

INSERT INTO [Staff] values (6,'MAX')
INSERT INTO [Staff] values (6,'FRX')
INSERT INTO [Staff] values (6,'VIX')
INSERT INTO [Staff] values (6,'LEO')
INSERT INTO [Staff] values (6,'JULY')
INSERT INTO [Staff] values (6,'VVV')



