# amazon-python3-django-postgresql-installer
Use this if you want to deploy a Python 3.9 distribution with Django and PostgresSQL on an Amazon Linux 2 box

One you've created your amazon instance running Amazon Linux 2, ssh to the box and runn the following commands:

ssh -i <path to .pem file> ec2-user@<Public IPv4 DNS>

sudo yum update

sudo yum install git
