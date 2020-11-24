#!/bin/bash
sudo su postgres<<EOSU
whoami
cd /var/lib/pgsql
/usr/pgsql-12/bin/pg_ctl -D /var/lib/pgsql/12/data/ -l logfile start
psql -c "create database aaa1;"
psql -c "CREATE USER django WITH PASSWORD 'django';"
psql -c "GRANT ALL PRIVILEGES ON DATABASE aaa1 TO django;"
EOSU

whoami
