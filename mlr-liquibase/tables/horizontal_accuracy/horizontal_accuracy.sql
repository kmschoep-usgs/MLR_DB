create table mlr_data.horizontal_accuracy
(horizontal_accuracy_id		integer not null
,code							text
,name							text
,constraint horizontal_accuracy_pk
  primary key (horizontal_accuracy_id)
);
alter table mlr_data.horizontal_accuracy owner to mlr_data;