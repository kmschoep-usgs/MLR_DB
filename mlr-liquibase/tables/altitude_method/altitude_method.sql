create table mlr_data.altitude_method
(altitude_method_id		integer not null
,code							text
,name							text
,constraint altitude_method_pk
  primary key (altitude_method_id)
);
alter table mlr_data.altitude_method owner to mlr_data;