#!/bin/bash 
# Restart postgres to make sure we can connect
pg_ctl -D "$PGDATA" -m fast -o "$LOCALONLY" -w restart

# create the mlr project user and database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	create role mlr with login createrole password '${MLR_PASSWORD}';
	alter database mlr owner to mlr;
EOSQL

#Create Schema
${LIQUIBASE_HOME}/liquibase \
--username postgres\
--password ${POSTGRES_PASSWORD} \
--driver org.postgresql.Driver \
--url jdbc:postgresql://127.0.0.1:5432/mlr \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/postgres/changeLog.yml \
--logLevel=debug \
update \
> ${LIQUIBASE_HOME}/liquibase.log

#Create Roles
${LIQUIBASE_HOME}/liquibase \
--defaultsFile=${LIQUIBASE_HOME}/liquibase.properties \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/roles/changeLog.yml \
--logLevel=debug \
update \
-DMLR_DATA_PASSWORD=${MLR_DATA_PASSWORD} -DMLR_USER_PASSWORD=${MLR_USER_PASSWORD} > ${LIQUIBASE_HOME}/liquibase.log

#Create Tables
${LIQUIBASE_HOME}/liquibase \
--defaultsFile=${LIQUIBASE_HOME}/liquibase.properties \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/changeLog.yml \
--logLevel=debug \
update \
> ${LIQUIBASE_HOME}/liquibase.log

#Create Data
${LIQUIBASE_HOME}/liquibase \
--defaultsFile=${LIQUIBASE_HOME}/liquibase.properties \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/data/changeLog.yml \
--logLevel=debug \
update \
> ${LIQUIBASE_HOME}/liquibase.log