create table mlr_data.monitoring_location_use_rel
(monitoring_location_id			integer not null
,use_id							integer not null
,rank							integer not null constraint use_rank_ck check (rank between 1 and 3)
,constraint monitoring_location_use_uk
  unique (monitoring_location_id, use_id)
);
alter table mlr_data.monitoring_location_use_rel owner to mlr_data;