from user_interface.usage_exception import UsageException

class AddToBasketCommand:

    def __init__(self, basket, catalogue, warehouse):
        self.basket = basket
        self.catalogue = catalogue
        self.warehouse = warehouse

    def run(self, cmd):
        if len(cmd.args) > 3 or len(cmd.args) < 2:
            print "ERROR: Usage: a sku [numitems]"
            return
        sku = cmd.arg(1)
        num_items = 1
        if len(cmd.args) == 3:
            try:
                num_items = int(cmd.arg(2))
            except:
                raise UsageException("The number of items must be a number greater than zero.")
        if num_items <= 0:
            raise UsageException("The number of items must be a number greater than zero.")
        sku_code = self.catalogue.lookup_code(sku)
        if not sku_code:
            raise UsageException("Product " + sku + " unknown.")
        self.warehouse.must_stock(sku_code, num_items)
        self.basket.add(sku, self.catalogue, num_items)

