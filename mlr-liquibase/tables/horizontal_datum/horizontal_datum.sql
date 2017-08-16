create table mlr_data.horizontal_datum
(horizontal_datum_id		integer not null
,code							text
,name							text
,constraint horizontal_datum_pk
  primary key (horizontal_datum_id)
);
alter table mlr_data.horizontal_datum owner to mlr_data;