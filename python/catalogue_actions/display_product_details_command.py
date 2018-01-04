import sys

class DisplayProductDetailsCommand:

    def __init__(self, catalogue):
        self.catalogue = catalogue

    def run(self, cmd):
        id = cmd.arg(1)
        if not id or len(cmd.args) != 2:
            print >> sys.stderr, "ERROR: Usage: d sku"
            return
        sku = self.catalogue.lookup(id)
        if sku:
            print "%s\t%s\t$%5.02f\n\n" % (sku.code[2], sku.title, sku.price / 100.0)
            for line in sku.description:
                print line
        else:
            print >> sys.stderr, "ERROR: product code #{id} not found"

