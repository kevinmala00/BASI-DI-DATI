use DB12042018
go

--In tabella Fornisce inserire il vincolo che l�anno sia un valore compreso tra 2000 e 2050.
alter table Fornisce
add constraint Range_anno
check (anno >= 2000),
check (anno <= 2050)
go

--In tabella Fornitore inserire come chiave alternativa titolo e citt�
alter table Fornitore
add constraint AK_titolo_citta
unique (nomefornitore, citta)
go

--Inserire un vincolo che garantisca che la citt� di un fornitore sia una delle citt� in tabella citt�.
alter table Fornitore
add constraint FK_fornitore_citta
foreign key (citta) references citta (sigla)
go