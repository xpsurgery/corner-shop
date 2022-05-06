class DataFileException(Exception):

    def __init__(self, filename, e):
        message = "Could not read file #{0}: #{1}".format(filename, e)
        Exception.__init__(self, message)
        self.message = message

