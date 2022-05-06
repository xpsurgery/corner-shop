from . basket_item import BasketItem

class Basket:

    def __init__(self):
        self.items = {}

    def list(self):
        return [self.items[sku] for sku in self._sortedSkus()]

    def add(self, skuId, catalogue, numItems):
        sku = catalogue.lookup(skuId)
        if skuId in self.items:
            existing = self.items[skuId]
            self.items[skuId] = BasketItem(skuId, existing.title, existing.price, existing.count + numItems)
        else:
            self.items[skuId] = BasketItem(skuId, sku.title, sku.price, numItems)

    def checkout(self, warehouse):
        if not self.items:
            print("Your basket is empty!")
            return
        for sku in self.items.keys():
            warehouse.fulfill(sku, self.items[sku].count)
        self.items = {}
        print("All items checked out. Total price $%5.02f\n" % (self._currentTotal() / 100.0))

    def _sortedSkus(self):
        return sorted(self.items.keys())

    def _currentTotal(self):
        total = 0
        for item in self.items.values():
            total += item.count * item.price
        if total > 2000:
            total -= (total/10)
        return total

