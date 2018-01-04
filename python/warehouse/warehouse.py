from invalid_num_items_exception import InvalidNumItemsException
from not_enough_stock_exception import NotEnoughStockException

class Warehouse:

    @staticmethod
    def fromFile(warehouse_reader):
        data = warehouse_reader.read_all()
        stock = {}
        for line in data:
            stock[tuple(line.sku_code)] = line.count
        return Warehouse(stock)

    def __init__(self, stock):
        self.stock = stock

    def stock_report(self, out):
        for skuCode in sorted(self.stock.keys()):
            out.write("%s %s %s   %6d\n" % (skuCode[0], skuCode[1], skuCode[2], self.stock[skuCode]))

    def replenish(self, skuCode, numItems):
        if numItems <= 0: raise InvalidNumItemsException(numItems)
        self._changeStockLevel(skuCode, numItems)

    def fulfill(self, sku, numItems):
        skuCode = self._lookup(sku)
        self.must_stock(skuCode, numItems)
        self._changeStockLevel(skuCode, -numItems)

    def must_stock(self, sku, numItems):
        skuCode = self._lookup(sku[2])
        if not skuCode or self.stock[skuCode] < numItems: raise NotEnoughStockException(sku, numItems)

    def _lookup(self, sku):
        for skuCode in self.stock.keys():
            if skuCode[2] == sku: return skuCode
        return None

    def _changeStockLevel(self, skuCode, numItems):
        key = self._lookup(skuCode[2])
        if key:
            self.stock[key] = self.stock[key] + numItems
        else:
            self.stock[skuCode] = numItems

