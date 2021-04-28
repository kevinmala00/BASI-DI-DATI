--seleziona gli studenti che si chiamano Rossi (cognome Rossi)
select SNome
from S
where (SNome like '% Rossi')

--seleziona gli studenti che hanno nome che iniazia con M e cognome Rossi
select SNome
from S
where (SNome like 'M% Rossi')

--seleziona gli studenti che si chiamano Mario o Maria Rossi
select SNome
from S
where (SNome IN ('Mario Rossi','Maria Rossi'))

--seleziona esami con voto diverso da 29 30 33
select Matr, Data, CC, Voto
from E
where Voto NOT IN (29, 30, 33)

--studenti che potrebbero abitare a Modena
select SNome
from S
where Citta='MO' or Citta is NULL

--studenti ordinati in senso decrescente per anno di corso e a parità di anno di corso per città
select SNome, ACorso, Citta
from S
order by ACorso DESC, Citta

--seleziona studenti ordinati per citta e a aprità di città per anno di corso in senso decrescente
select SNome, ACorso, Citta
from S
order by Citta, ACorso DESC
