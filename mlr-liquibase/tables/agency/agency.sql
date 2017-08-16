create table mlr_data.agency
(agency_id		integer not null
,code							text
,name							text
,constraint agency_pk
  primary key (agency_id)
);
alter table mlr_data.agency owner to mlr_data;