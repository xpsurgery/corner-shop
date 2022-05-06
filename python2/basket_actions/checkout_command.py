class CheckoutCommand:

    def __init__(self, basket, warehouse):
        self.basket = basket
        self.warehouse = warehouse

    def run(self, cmd):
        self.basket.checkout(self.warehouse)

