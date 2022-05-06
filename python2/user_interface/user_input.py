class UserInput:

    def __init__(self, line):
        self.command = line[0]
        self.args = line.split()

    def arg(self, i):
        if i < 0: raise IllegalArgumentException()
        return self.args[i] if i < len(self.args) else None

