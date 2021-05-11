use BDATI

select *
from S
where (SNome like '% Rossi') OR (SNome like 'Rossi %')

select *
from S
where SNome like 'Mari_ Rossi'

select *
from C
where Cnome like '%Fisica%'

select *
from S
where(Citta ='MO' or Citta is null)

select *
from S
order by ACorso desc, Citta

select *
from S
order by Citta, Acorso desc

select top 1 *
from S
where Citta = 'MO'
order by SNome


create table STUDENTIBUONIVOTI(
matr varchar(5) primary key
)

insert into STUDENTIBUONIVOTI 
select distinct matr
from E
where voto >= 28

create table studentiprimoanno(
matr varchar(5) primary key,
nome varchar(20),
citta char(2)
)
insert into studentiprimoanno
select distinct matr, Snome, citta
from S
where Acorso=1

--ESEMPI DI JOIN

--1 prodotto cartesiano tra corsi e docenti
select *
from C,D

--2 join tra corsi e docenti
SELECT *
FROM C JOIN D ON C.cd=D.cd

--3 per ogni esame visualizzare il nome dello studente, codice del coroso dell'esame sostenuto, voto e nome del corso 
select distinct S.SNome, C.CC, E.Voto, C.CNome
from S,E,C
where (E.Matr=S.Matr) And (E.CC=c.CC)

--4 selezionare per ogni esame di un corso di fisica sostenuto da uno studente di MO, voto, nome studente e nome del docente del corso 
select e.Voto, S.SNome,c.CNome, D.CNome--,S.citta
from S,E,C,D
where (c.CNome like '%Fisica%') and (c.CD=d.CD) and (e.Matr=s.Matr) and (s.Citta='MO')

--5 matricola, nome e citta degli studenti che hanno sostenuto almeno un esame
select distinct s.Matr, s.SNome, s.Citta
from S, E
where e.Matr=s.Matr

--6 matricola e nome degli studenti che hanno sostenuto almeno un esame del corso di fisica
select distinct S.SNome, C.CC, E.Voto, C.CNome
from S,E,C
where (E.Matr=S.Matr) And (E.CC=c.CC) and (c.CNome like '%Fisica%')

--8 nome degli studenti che hanno ottenuto almeno un voto >= 28
select Snome
from s join e on (s.Matr= e.Matr)
where e.Voto>=28

--OUTER JOIN
--1 combinazione di studenti e docenti nella stessa città inclusi gli studenti/docenti che risiedono in unca città che no ha corrispondenza in docenti/studenti
select *
from S full join D on (s.Citta=d.Citta)
