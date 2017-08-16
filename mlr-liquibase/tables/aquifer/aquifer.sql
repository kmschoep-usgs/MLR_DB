create table mlr_data.aquifer
(aquifer_id		integer not null
,code							text
,name							text
,constraint aquifer_pk
  primary key (aquifer_id)
);
alter table mlr_data.aquifer owner to mlr_data;