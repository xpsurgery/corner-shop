from . sku import Sku

class Catalogue:

    @staticmethod
    def fromFile(catalogueReader):
        products = list(map(lambda line: Sku([line[0], line[1], line[2]], line[3], line[4], int(line[5])), catalogueReader.readAll()))
        return Catalogue(products)

    def __init__(self, products):
        self.products = products

    def list(self, out):
        for sku in self._sortedSkus():
            out.write("%s\t%dp\t%s\n" % (sku.code[2], sku.price, sku.title))
        out.write("\n10% discount on orders over $20.00!\n")

    def lookup(self, id):
        for sku in self.products:
            if sku.code[2] == id: return sku
        return None

    def lookupCode(self, sku):
        for s in self.products:
            if s.code[2] == sku: return s.code
        return None

    def _sortedSkus(self):
        return sorted(self.products, key=lambda sku: sku.code)

