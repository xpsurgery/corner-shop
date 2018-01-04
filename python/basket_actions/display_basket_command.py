class DisplayBasketCommand:

    def __init__(self, basket):
        self.basket = basket

    def run(self, cmd):
        items = self.basket.list()
        if not items:
            print "Your basket is empty"
            return
        for item in items:
            leader = "$%8.02f %5dx     " % (item.price / 100.0, item.count)
            poss_len = len(leader) + len(item.title)
            title = item.title[0:60-len(leader)-3]+"..." if poss_len > 60 else item.title
            print leader + title
        total = self._basketTotal(items)
        if total > 2000:
            discount = total/10
            print "$%8.02f            10%% discount" % (discount / -100.0)
            total -= discount
        print "---------------"
        print "$%8.02f total\n" % (total / 100.0)

    def _basketTotal(self, items):
        total = 0
        for item in items:
            total += item.price * item.count
        return total

