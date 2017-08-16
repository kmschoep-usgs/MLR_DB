create table mlr_data.monitoring_location_type
(monitoring_location_type_id		integer not null
,code							text
,name							text
,constraint monitoring_location_type_pk
  primary key (monitoring_location_type_id)
);
alter table mlr_data.monitoring_location_type owner to mlr_data;