class UnknownProductException(Exception):

    def __init__(self, sku):
        super(UnknownProductException, self).__init__("SKU code " + str(sku) + " is not in the product catalogue.")

