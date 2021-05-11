use DB30062015
go

--Inserire il vincolo che l'organizzatore di una Manifestazione faccia riferimento ad una Associazione. (punti 3)
alter table Manifestazione 
add constraint FK_organizzatore_associazione 
foreign key (organizzatore) references associazione (username)
go

--Inserire il vincolo che data di inizio di una Manifestazione sia precedente alla data di fine (quando definita). (punti 3)
alter table Manifestazione
ADD CONSTRAINT Datai_minore_dataf 
CHECK (data_i < data_f)
go

--Inserire il vincolo che garantisca che non si possano tenere due manifestazioni con lo stesso nome, nella stessa data (considerare la data di inizio), nello stesso luogo. (punti 3)
alter table Manifestazione
add constraint vincolo_es3
unique (data_i, luogo, titolo)
go

--Inserire un vincolo sulla tabella Persona che verifichi che le persone siano maggiorenni
alter table Persone
add constraint check_maggiorenni
check 

--Inserire un controllo nella tabella Associazione sul campo PIVA che verifichi che il primo carattere sia un numero
alter table Associazione
add constraint check_piva
check (PIVA like '[0-9]%')
go