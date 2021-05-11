USE DB_2019_06_11

--1.Selezionare i porti di arrivo delle traversate che sono partite dal porto con sigla OLB
SELECT TRAVERSATA.PORTOARRIVO
FROM TRAVERSATA
WHERE TRAVERSATA.PORTOPARTENZA LIKE 'OLB'

--2. Selezionare le città di arrivo delle traversate che sono partite dal porto con sigla OLB
SELECT PORTO.CITTA
FROM TRAVERSATA JOIN PORTO ON (TRAVERSATA.PORTOARRIVO=PORTO.CODP)
WHERE TRAVERSATA.PORTOPARTENZA LIKE 'OLB'

--3. Selezionare le città di arrivo delle traversate che sono partiti dal porto dalla città di Olbia
SELECT P2.CITTA
FROM (TRAVERSATA JOIN PORTO AS P1 ON (TRAVERSATA.PORTOPARTENZA = P1.CODP)) JOIN PORTO AS P2 ON (PORTOARRIVO=P2.CODP)
WHERE P1.CITTA LIKE 'Olbia'


--4. Selezionare tutti i traghetti che sono partiti dal porto dalla città di Olbia
select TRAGHETTO.*
FROM (TRAVERSATA JOIN PORTO ON (TRAVERSATA.PORTOPARTENZA = PORTO.CODP)) JOIN TRAGHETTO ON (TRAVERSATA.CODT = TRAGHETTO.CODT)
WHERE PORTO.CITTA LIKE 'Olbia'

--OPPURE
SELECT TRAGHETTO.*
FROM TRAGHETTO, TRAVERSATA, PORTO
WHERE ((PORTO.CITTA LIKE 'Olbia') 
and (PORTO.CODP=TRAVERSATA.PORTOPARTENZA) 
AND (TRAVERSATA.CODT=TRAGHETTO.CODT))

--5. Selezionare tutti i tipi di traghetti che sono partiti dal porto dalla città di Olbia ad agosto 2019
select TRAGHETTO.*
FROM (TRAVERSATA JOIN PORTO ON (TRAVERSATA.PORTOPARTENZA = PORTO.CODP)) JOIN TRAGHETTO ON (TRAVERSATA.CODT = TRAGHETTO.CODT)
WHERE PORTO.CITTA LIKE 'Olbia'
AND ((datepart(month, TRAVERSATA.DATAORAPARTENZA) = 8) and
(datepart(year, TRAVERSATA.DATAORAPARTENZA) = 2019))

--6. Selezionare le città da cui porti è partito almeno un traghetto
SELECT DISTINCT PORTO.CITTA
FROM TRAVERSATA JOIN PORTO ON (TRAVERSATA.PORTOPARTENZA = PORTO.CODP)

--7. Selezionare le città da cui porti è partito almeno un traghetto con capienza maggiore di 150
SELECT DISTINCT PORTO.CITTA
FROM (TRAVERSATA JOIN PORTO ON (TRAVERSATA.PORTOPARTENZA = PORTO.CODP)) JOIN TRAGHETTO ON (TRAVERSATA.CODT=TRAGHETTO.CODT)
WHERE TRAGHETTO.CAPIENZA >= 150

--8. Selezionare le città da cui porti è partito almeno un traghetto con un biglietto prenotato a nome Mario Rossi
SELECT DISTINCT PORTO.CITTA
FROM (TRAVERSATA JOIN PORTO ON (TRAVERSATA.PORTOPARTENZA = PORTO.CODP)) JOIN TRAGHETTO ON (TRAVERSATA.CODT=TRAGHETTO.CODT) JOIN BIGLIETTO ON (TRAGHETTO.CODT = BIGLIETTO.CODT)
WHERE BIGLIETTO.NOME LIKE 'Mario'
and BIGLIETTO.COGNOME LIKE 'Rossi'

--9. Selezionare nome e cognome delle persone che hanno comprato un biglietto per un traghetto prenotato anche da Mario Rossi
Select distinct B1.nome, B1.cognome
from BIGLIETTO B2 JOIN BIGLIETTO B1 ON (B1.CODT=B2.CODT AND B1.DATAORAPARTENZA=B2.DATAORAPARTENZA)
where B2.nome='MARIO' and B2.cognome='ROSSI'
and not(B1.nome=B2.nome and B1.cognome=B2.cognome)

--10. Selezionare per ogni citta i dati dei traghetti che sono partiti dal porto di quella città, comprese le città dal cui porti non sono partiti traghetti
select DISTINCT  PORTO.CITTA, TRAGHETTO.*
FROM (PORTO LEFT JOIN TRAVERSATA ON (TRAVERSATA.PORTOPARTENZA = PORTO.CODP)) LEFT JOIN TRAGHETTO ON (TRAVERSATA.CODT = TRAGHETTO.CODT)

--11. Selezionare per ogni citta i dati dei traghetti che sono partiti dal porto di quella città, comprese le città dal cui porti non sono partiti traghetti e i traghetti che non sono partiti da alcuna città
select DISTINCT  PORTO.CITTA, TRAGHETTO.*
FROM (PORTO LEFT JOIN TRAVERSATA ON (TRAVERSATA.PORTOPARTENZA = PORTO.CODP)) FULL JOIN TRAGHETTO ON (TRAVERSATA.CODT = TRAGHETTO.CODT)

--2.1. Implementare il vincolo: una traversata non può avere lo stesso porto di arrivo e di partenza.
ALTER TABLE TRAVERSATA
ADD CONSTRAINT CHECK_PORTO_ARRIVO_PARTENZA CHECK (PORTOPARTENZA <> PORTOARRIVO)

--2.2 In tabella BIGLIETTO inserire il vincolo che un passeggero (identificato con nome e cognome) non possa comprare due volte un biglietto per la stessa traversata.
ALTER TABLE BIGLIETTO
ADD CONSTRAINT AK_NOME_COGNOME_CODT_DATAORAPARTENZA 
UNIQUE (NOME, COGNOME, CODT, DATAORAPARTENZA)

--2.3. In tabella TRAVERSATA inserire il valore della durata del viaggio (calcolata come differenza tra dataoraarrivo e dataorapartenza).
ALTER TABLE TRAVERSATA
ADD DURATA AS DATEDIFF(MINUTE, DATAORAPARTENZA, DATAORAARRIVO)