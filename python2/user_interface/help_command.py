class HelpCommand:

    def run(self, cmd):
        print "Customer actions:"
        print "  a sku [num]             Add SKU to basket; num defaults to 1"
        print "  b                       List basket contents"
        print "  c                       Checkout"
        print "  d sku                   Show detailed product info for SKU"
        print "  p                       List all products"
        print
        print "Warehouse actions:"
        print "  r aisle loc sku num     Replenish SKU with num additional units"
        print "  s                       Show stock levels"
        print
        print "General:"
        print "  h                       Show this help"
        print "  q                       Quit"

