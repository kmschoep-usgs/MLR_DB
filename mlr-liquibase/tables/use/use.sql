create table mlr_data.use
(use_id		integer not null
,code							text
,name							text
,use_type						text constraint use_type_ck check (use_type in ('water','site'))
,constraint use_pk
  primary key (use_id)
);
alter table mlr_data.use owner to mlr_data;