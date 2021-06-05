
create database testricorsione;
go

set nocount on;
go

use testricorsione;
go

create table figlio_genitore(
figlio varchar(20),
genitore varchar(20),
);
go

insert into figlio_genitore values ('gabriele', 'silvia');
insert into figlio_genitore values('gabriele', 'riccardo');
insert into figlio_genitore values('riccardo', 'tommaso');
insert into figlio_genitore values('riccardo', 'elena');
insert into figlio_genitore values('elena','giulia');
insert into figlio_genitore values('giulia','franco');
insert into figlio_genitore values('chiara', 'marta');
insert into figlio_genitore values('chiara', 'giorgio');
insert into figlio_genitore values('simone', 'marta');
insert into figlio_genitore values('simone', 'giorgio');
insert into figlio_genitore values('giorgio', 'franco');
insert into figlio_genitore values('franco', NULL);

with persona_avo (persona, avo, livello) 
as((select fg.figlio, FG.genitore, 1
	from figlio_genitore fg
	where fg.genitore IS NULL)
UNION ALL
	(SELECT FG.FIGLIO, FG.genitore, PA.livello+1
	FROM PERSONA_AVO PA, figlio_genitore FG
	WHERE PA.PERSONA = FG.GENITORE)
)
SELECT *
FROM persona_avo PA
GO

with persona_avo (persona, avo, livello) 
as((select fg.figlio, FG.genitore, 1
	from figlio_genitore fg)
UNION ALL
	(SELECT FG.FIGLIO, PA.avo, PA.livello+1
	FROM PERSONA_AVO PA, figlio_genitore FG
	WHERE PA.PERSONA = FG.GENITORE
	AND PA.AVO IS NOT NULL)
)
SELECT DISTINCT PA.*
FROM persona_avo PA
--WHERE PA.PERSONA='GABRIELE'
ORDER BY LIVELLO
GO

CREATE TABLE DISTANZE(
partenza varchar(40),
destinazione varchar(40),
distanza int,
);
go

insert into distanze values('massa finalese', 'finale emilia', 7);
insert into distanze values('massa finalese','mirandola', 15);
insert into distanze values('finale emilia', 'modena', 40);
insert into distanze values('mirandola','bologna',50);
insert into distanze values('mirandola','rimini',150);
insert into distanze values('bologna', 'roma', 700);

with percorso (partenza, destinazione, km_tot)
as(	(select d.partenza, d.destinazione, d.distanza
	from distanze d
	where d.distanza<=160)
union all
	(select d.partenza, p.destinazione, km_tot+d.distanza
	from percorso p, distanze d
	where km_tot+d.distanza<=600
	and p.partenza = d.destinazione)
)
select *
from percorso



