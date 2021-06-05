--1 Inserire il vincolo che uno stesso animale in un giorno non possa fare più di una visita.
ALTER TABLE VISITA 
ADD CONSTRAINT UNA_VISITA_PER_GIORNO UNIQUE(DATA);
GO

--2 Come si può notare dallo script di creazione del Database manca la foreign key che lega la tabella Somministrazioni alla tabella Visita. Create questa foreign key.
ALTER TABLE SOMMINISTRAZIONI
ADD CONSTRAINT FK_SOMMINISTRAZIONI_VISITA FOREIGN KEY (animale, data) REFERENCES VISITA (animale, data);
GO

--4 Selezionare i farmaci che non sono mai stati somministrati ad alcun animale
SELECT F.*
FROM Farmaco F
WHERE NOT EXISTS( SELECT *
					FROM Somministrazioni S
					WHERE S.nome=F.nome);
GO

--5 Selezionare per ogni anno l'animale che ha effettuato più visite. riportare il numero di visite effettuate e i dati del suo proprietario, riportare anche eventuali parimerito
SELECT YEAR(V.DATA) AS ANNO, A.identificativo, COUNT(*) AS NUM_VISITE, P.cf
FROM VISITA V
JOIN ANIMALE A ON(V.animale=A.identificativo)
JOIN PADRONE P ON(A.cf_padrone=P.cf)
GROUP BY YEAR(V.DATA), A.identificativo, P.cf
HAVING COUNT(*)>= ALL(
						SELECT COUNT(*)
						FROM VISITA V1
						JOIN ANIMALE A1 ON(V1.animale=A1.identificativo)
						JOIN PADRONE P1 ON(A1.cf_padrone=P1.cf)
						WHERE YEAR(V.DATA)=YEAR(V1.DATA)
						GROUP BY A1.identificativo
						);
GO

select YEAR(v.data), count(*) as num_visite, a.identificativo, p.cf, p.cognome, p.nome

from Visita v join Animale a on a.identificativo = v.animale

join Padrone p on p.cf=a.cf_padrone

group by a.identificativo, p.cf, p.cognome, p.nome, YEAR(v.data)

having count(*) >= all (

		select count(*)

		from Visita v1 

		where YEAR(v1.data)=YEAR (v.data)

group by  v1.animale)