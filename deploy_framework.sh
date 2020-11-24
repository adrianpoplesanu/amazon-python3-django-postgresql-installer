#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
LIGHT_PURPLE='\033[1;35m'
NC='\033[0m' # No Color

INSTALATION_DIRECTORY=$(pwd)
INSTALATION_USER=$(whoami)

echo -e "${LIGHT_PURPLE}    _      _     _                  ${NC}";
echo -e "${LIGHT_PURPLE}   /_\  __| |_ _(_)__ _ _ _ _  _ ___${NC}";
echo -e "${LIGHT_PURPLE}  / _ \/ _\` | '_| / _\` | ' \ || (_-<${NC}";
echo -e "${LIGHT_PURPLE} /_/ \_\__,_|_| |_\__,_|_||_\_,_/__/${NC}";
echo -e "${LIGHT_PURPLE}                    november 2o2o   ${NC}";

echo "Adrianus Installer running" ;
echo "This will install a Python 3.9 distribution, Django, PostgreSQL and create and deploy a new project on an Amazon Linux 2 instance"

echo ;

echo "WARNING: Prior to running this command make sure you've ran:" ;
echo "sudo yum update" ;
echo ;

python load_configs.py ;

echo "Installing gcc openssl-devel bzip2-devel libffi-devel" ;

sudo yum install gcc openssl-devel bzip2-devel libffi-devel

echo -e "${GREEN}gcc openssl-devel bzip2-devel libffi-devel installed!${NC}" ;

echo "Installing PostgreSQL" ;

sh ./postgres_setup.sh

echo "PostgreSQL setup done" ;
echo "Installing..." ;

sudo yum makecache

sudo yum install postgresql12 postgresql12-server

# sudo /usr/pgsql-12/bin/postgresql-12-setup initdb

echo -e "${GREEN}PostgreSQL installed!${NC}" ;

echo "Installing Python 3.9"

sh ./python_installation.sh

echo "Creating PostgresSQL Database and Running server..."

whoami
cd $INSTALATION_DIRECTORY
sh ./postgres_start.sh

echo -e "${GREEN}PostgreSQL server is started and deployed!${NC}"

echo "Creating Django application"

cd ~
python3.9 -m venv sandbox
. sandbox/bin/activate
which python
python -m pip install Django
pip install psycopg2-binary
cd sandbox
mkdir src
cd src
django-admin startproject my_site
deactivate

#TODO: change settings.py from django installation to use postgres and accepted_hosts
#sed -i "s/$search/$replace/" ~/sandbox/src/my_site/my_site/settings.py
#sed -i "s/$search/$replace/" ~/sandbox/src/my_site/my_site/settings.py
#TODO: update the postgresql ident to md5 connection configuration
#this needs to be run with the postgres user
#sed -i "s/$search/$replace/" ~/bla bla bla/pb_hga.conf

echo "Instalation finished."
