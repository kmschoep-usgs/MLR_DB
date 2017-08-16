create table mlr_data.hydrologic_unit
(hydrologic_unit_id		integer not null
,code							text
,name							text
,constraint hydrologic_unit_pk
  primary key (hydrologic_unit_id)
);
alter table mlr_data.hydrologic_unit owner to mlr_data;