class StockMemento:

    def __init__(self, aisle, loc, sku, count):
        self.sku_code = [aisle, loc, sku]
        try:
            self.count = int(count)
        except:
            raise DataFormatException("Last argument must be a number: " + aisle + " " + loc + " " + sku + " " + count)

