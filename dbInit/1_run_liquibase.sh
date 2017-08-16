#!/bin/bash 
# Restart postgres to make sure we can connect
pg_ctl -D "$PGDATA" -m fast -o "$LOCALONLY" -w restart

# create the mlr project user and database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	create role mlr with login createrole password '${MLR_PASSWORD}';
	alter database mlr owner to mlr;
EOSQL

${LIQUIBASE_HOME}/liquibase \
--defaultsFile=${LIQUIBASE_HOME}/liquibase.properties \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/changeLog.yml \
--logLevel=debug \
update \
-DMLR_DATA_PASSWORD=${MLR_DATA_PASSWORD} -DMLR_USER_PASSWORD=${MLR_USER_PASSWORD} > ${LIQUIBASE_HOME}/liquibase.log