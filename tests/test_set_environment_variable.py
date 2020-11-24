import os

os.environ['TESTING_VARIABLE_SETUP'] = 'The variable exist now in the OS env'

#once the script finishes and the shell is closed this change reverts, so system or parent process
#won't be able to evalutate: echo $TESTING_VARIABLE_SETUP
