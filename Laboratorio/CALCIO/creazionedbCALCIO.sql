SET NOCOUNT ON 
SET DATEFORMAT dmy
go

create database CALCIO 
go

use CALCIO 
go

create type nome_squadra 
(
from nvarchar(20)
)
go

create table GIOCATORE
(
CF nvarchar(16) primary key,
nome nvarchar(25) not null,
squadra nome_squadra null,
ruolo nvarchar(20) not null,
)
go

create table ARBITRO
(
cod integer primary key,
CF nvarchar(16) unique not null,
nome nvarchar(25) not null,
)
go

create table SQUADRA
(
nome nome_squadra primary key,
annodifondazione integer not null,
)
go

create table PARTITA
(
squadra_casa nome_squadra not null,
squadra_ospite nome_squadra not null,
arbitro nvarchar(20) not null,
data date not null,
torneo nvarchar(25) not null,
punteggio nvarchar(7) not null,
primary key (squadra_casa, squadra_ospite, data, punteggio, torneo),
)
