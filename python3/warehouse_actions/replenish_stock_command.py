import sys
from . unknown_product_exception import UnknownProductException

class ReplenishStockCommand:

    def __init__(self, warehouse, catalogue):
        self.warehouse = warehouse
        self.catalogue = catalogue

    def run(self, cmd):
        if len(cmd.args) != 5:
            print("ERROR: Usage: r aisle loc sku num", file=sys.stderr)
            return
        if not self.catalogue.lookup(cmd.arg(3)): raise UnknownProductException(cmd.arg(3))
        sku = [cmd.arg(1), cmd.arg(2), cmd.arg(3)]
        numItems = int(cmd.arg(4))
        self.warehouse.replenish(sku, numItems)

