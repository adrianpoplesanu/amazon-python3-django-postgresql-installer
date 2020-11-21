echo "    _      _     _                  ";
echo "   /_\  __| |_ _(_)__ _ _ _ _  _ ___";
echo "  / _ \/ _\` | '_| / _\` | ' \ || (_-<";
echo " /_/ \_\__,_|_| |_\__,_|_||_\_,_/__/";
echo "                                    ";

echo "Adrianus installer 2o2o" ;
echo "This will install a Python 3.9 distribution, Django, PostgreSQL and create and deploy a new project on an Amazon Linux 2 instance"

echo ;

echo "WARNING: Prior to running this command make sure you've ran:" ;
echo "sudo yum update" ;

python tests/test_config_parser.py ;
