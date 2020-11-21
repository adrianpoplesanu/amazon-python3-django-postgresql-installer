from utils.config import ConfigParser

def build_config_output():
    config = ConfigParser()
    data = config.get_properties()
    filename = open('output/properties.py', 'w')
    filename.write('properties = ' + str(data))

if __name__ == '__main__':
    build_config_output()
