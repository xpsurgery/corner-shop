class StockMemento:

    def __init__(self, aisle, loc, sku, count):
        self.skuCode = [aisle, loc, sku]
        try:
            self.count = int(count)
        except:
            raise DataFormatException("Last argument must be a number: " + aisle + " " + loc + " " + sku + " " + count)

