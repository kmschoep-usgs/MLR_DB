create table mlr_data.monitoring_location_agency_rel
(monitoring_location_id			integer not null
,agency_id						integer not null
,constraint monitoring_location_agency_uk
  unique (monitoring_location_id, agency_id)
);
alter table mlr_data.monitoring_location_agency_rel owner to mlr_data;