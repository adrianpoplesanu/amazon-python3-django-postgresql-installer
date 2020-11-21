import sys
from utils import bcolors


class ConfigParser(object):
    CONFIG_PATH = 'config.properties'

    def __init__(self, path=None):
        if path:
            self.CONFIG_PATH = path

    def read_file(self):
        print bcolors.OKCYAN + 'loading configs' + bcolors.ENDC
        filename = open(self.CONFIG_PATH)
        lines = filename.readlines()
        configs = {}
        for line in lines:
            if line[0] != '[':
                k = line.split('=')[0].strip()
                v = line.split('=')[1].strip()
                configs[k] = v
        return configs

    def get_properties(self):
        configs = {}

        try:
            configs = self.read_file()
        except Exception, e:
            print e
            print bcolors.FAIL + 'ERROR: The config.properties file is invalid' + bcolors.ENDC
            sys.exit(1)
    
        if not configs:
            print bcolors.FAIL + 'ERROR: Configs can not be empty' + bcolors.ENDC
            sys.exit(1)

        print bcolors.OKGREEN + 'configs loaded succesful' + bcolors.ENDC

        for k, v in configs.iteritems():
            print bcolors.WARNING + '  ' + k + '=' + v + bcolors.ENDC

        return configs
