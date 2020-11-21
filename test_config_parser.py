import sys

def read_config():
    print 'loading configs'
    filename = open('config.properties')
    lines = filename.readlines()
    configs = {}
    for line in lines:
        if line[0] != '[':
            k = line.split('=')[0].strip()
            v = line.split('=')[1].strip()
            configs[k] = v
    return configs

if __name__ == '__main__':
    configs = {}
    try:
        configs = read_config()
    except:
        print 'ERROR: The config.properties file is invalid'
        sys.exit(1)
    
    if not configs:
        print 'ERROR: Configs can not be empty'
        sys.exit(1)

    print 'configs loaded succesful'

    for k, v in configs.iteritems():
        print k, '=', v
