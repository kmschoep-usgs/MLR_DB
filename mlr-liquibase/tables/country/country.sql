create table mlr_data.country
(country_id		integer not null
,code							text
,name							text
,constraint country_pk
  primary key (country_id)
);
alter table mlr_data.country owner to mlr_data;