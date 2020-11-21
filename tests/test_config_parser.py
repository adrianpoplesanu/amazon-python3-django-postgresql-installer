import os, sys

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from utils.config import ConfigParser

def run_test():
    c = ConfigParser()
    c.get_properties()

if __name__ == '__main__':
    run_test()
