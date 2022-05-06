import sys

class DisplayProductDetailsCommand:

    def __init__(self, catalogue):
        self.catalogue = catalogue

    def run(self, cmd):
        id = cmd.arg(1)
        if not id or len(cmd.args) != 2:
            print("ERROR: Usage: d sku", file=sys.stderr)
            return
        sku = self.catalogue.lookup(id)
        if sku:
            print("%s\t%s\t$%5.02f\n\n" % (sku.code[2], sku.title, sku.price / 100.0))
            for line in sku.formatDescription():
                print(line)
        else:
            print("ERROR: product code %s not found" % id, file=sys.stderr)

