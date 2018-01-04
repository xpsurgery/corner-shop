import sys

class UnknownCommand:

    def run(self, cmd):
        print >> sys.stderr, "ERROR: Unknown command " + cmd.command
        print >> sys.stderr, "Type h or ? for help"

