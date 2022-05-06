import sys

class UnknownCommand:

    def run(self, cmd):
        print("ERROR: Unknown command " + cmd.command, file=sys.stderr)
        print("Type h or ? for help", file=sys.stderr)

