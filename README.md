# amazon-python3-django-postgresql-installer
Use this if you want to deploy a Python 3.9 distribution with Django and PostgresSQL on an Amazon Linux 2 box

One you've created your amazon instance running Amazon Linux 2, ssh to the box and runn the following commands:

ssh -i <path to .pem file> ec2-user@<Public IPv4 DNS>

sudo yum update

sudo yum install git

mkdir installation

cd installation/

git clone https://github.com/adrianpoplesanu/amazon-python3-django-postgresql-installer.git

cd amazon-python3-django-postgresql-installer/

edit config.properties

./deploy_framework.sh

IMPORTANT!!! Stopping the Amazon instance and starting a new one raises these two issues:
- the postgres process is not started on the new one, FIX: follow ./deply_framework and run . postres_start.sh
- the public hostname changes so ALLOWED_HOSTS from settings.py needs to be updated
