#!/bin/bash 

# Restart postgres to make sure we can connect
pg_ctl -D "$PGDATA" -m fast -o "$LOCALONLY" -w restart

# superuser scripts
${LIQUIBASE_HOME}/liquibase \
--defaultsFile=${LIQUIBASE_HOME}/postgres.properties \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/postgres/changeLog.yml \
--logLevel=warning \
update \
-DMLR_PASSWORD=${MLR_PASSWORD} > ${LIQUIBASE_HOME}/liquibaseSuperuser.log

# application database create scripts
${LIQUIBASE_HOME}/liquibase \
--defaultsFile=${LIQUIBASE_HOME}/databaseCreate.properties \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/database/changeLog.yml \
--logLevel=warning \
update > ${LIQUIBASE_HOME}/liquibaseDatabaseCreate.log
#Create Roles
${LIQUIBASE_HOME}/liquibase \
--defaultsFile=${LIQUIBASE_HOME}/liquibase.properties \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/roles/changeLog.yml \
--logLevel=warning \
update \
-DMLR_DATA_PASSWORD=${MLR_DATA_PASSWORD} -DMLR_USER_PASSWORD=${MLR_USER_PASSWORD} > ${LIQUIBASE_HOME}/liquibase.log

#Create Tables
${LIQUIBASE_HOME}/liquibase \
--defaultsFile=${LIQUIBASE_HOME}/liquibase.properties \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/changeLog.yml \
--logLevel=warning \
update \
> ${LIQUIBASE_HOME}/liquibase.log

#Create Data
${LIQUIBASE_HOME}/liquibase \
--defaultsFile=${LIQUIBASE_HOME}/liquibase.properties \
--classpath=${LIQUIBASE_HOME}/lib/postgresql-${POSTGRES_JDBC_VERSION}.jar \
--changeLogFile=${LIQUIBASE_HOME}/mlr-liquibase/data/changeLog.yml \
--logLevel=warning \
update \
> ${LIQUIBASE_HOME}/liquibase.log
