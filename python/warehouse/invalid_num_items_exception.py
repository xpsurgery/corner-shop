class InvalidNumItemsException(Exception):

    def __init__(self, numItems):
      super(InvalidNumItemsException, self).__init__("Please supply a number of items greater than zero")

