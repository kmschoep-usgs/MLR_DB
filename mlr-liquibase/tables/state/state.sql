create table mlr_data.state
(state_id		integer not null
,code							text
,name							text
,constraint state_pk
  primary key (state_id)
);
alter table mlr_data.state owner to mlr_data;