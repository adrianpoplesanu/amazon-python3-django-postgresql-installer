import os, sys

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import config

def run_test():
    c = config.Config('/Users/adrianpoplesanu/Documents/git-projects/amazon-python3-django-postgresql-installer/config.properties')
    c.get_properties()

if __name__ == '__main__':
    run_test()
