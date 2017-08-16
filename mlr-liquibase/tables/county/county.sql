create table mlr_data.county
(county_id		integer not null
,code							text
,name							text
,constraint county_pk
  primary key (county_id)
);
alter table mlr_data.county owner to mlr_data;