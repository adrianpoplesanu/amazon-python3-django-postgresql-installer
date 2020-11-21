import sys


class Config(object):
    CONFIG_PATH = 'config.properties'

    def __init__(self, path=None):
        if path:
            self.CONFIG_PATH = path

    def read_file(self):
        print 'loading configs'
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
            print 'ERROR: The config.properties file is invalid'
            sys.exit(1)
    
        if not configs:
            print 'ERROR: Configs can not be empty'
            sys.exit(1)

        print 'configs loaded succesful'

        for k, v in configs.iteritems():
            print k, '=', v

        return configs
