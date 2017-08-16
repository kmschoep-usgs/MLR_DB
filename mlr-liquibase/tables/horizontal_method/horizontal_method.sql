create table mlr_data.horizontal_method
(horizontal_method_id		integer not null
,code							text
,name							text
,constraint horizontal_method_pk
  primary key (horizontal_method_id)
);
alter table mlr_data.horizontal_method owner to mlr_data;