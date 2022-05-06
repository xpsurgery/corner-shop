class NotEnoughStockException(Exception):

    def __init__(self, skuCode, numItems):
        msg = "The warehouse does not contain %d item(s) of product %s" % (numItems, skuCode[2])
        super(NotEnoughStockException, self).__init__(msg)

