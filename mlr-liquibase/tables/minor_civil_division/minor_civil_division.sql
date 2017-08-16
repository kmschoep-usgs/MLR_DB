create table mlr_data.minor_civil_division
(minor_civil_division_id		integer not null
,code							text
,name							text
,constraint minor_civil_division_pk
  primary key (minor_civil_division_id)
);
alter table mlr_data.minor_civil_division owner to mlr_data;