create table mlr_data.national_aquifer
(national_aquifer_id		integer not null
,code							text
,name							text
,constraint national_aquifer_pk
  primary key (national_aquifer_id)
);
alter table mlr_data.national_aquifer owner to mlr_data;