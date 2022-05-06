from user_interface.usage_exception import UsageException

class AddToBasketCommand:

    def __init__(self, basket, catalogue, warehouse):
        self.basket = basket
        self.catalogue = catalogue
        self.warehouse = warehouse

    def run(self, cmd):
        if len(cmd.args) > 3 or len(cmd.args) < 2:
            print("ERROR: Usage: a sku [numitems]")
            return
        sku = cmd.arg(1)
        numItems = 1
        if len(cmd.args) == 3:
            try:
                numItems = int(cmd.arg(2))
            except:
                raise UsageException("The number of items must be a number greater than zero.")
        if numItems <= 0:
            raise UsageException("The number of items must be a number greater than zero.")
        skuCode = self.catalogue.lookupCode(sku)
        if not skuCode:
            raise UsageException("Product " + sku + " unknown.")
        self.warehouse.mustStock(skuCode, numItems)
        self.basket.add(sku, self.catalogue, numItems)

