class DataFormatException(Exception):

    def __init__(self, message):
        Exception.__init__(self, message)
        self.message = message

