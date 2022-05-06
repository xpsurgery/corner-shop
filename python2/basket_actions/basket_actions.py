from add_to_basket_command import AddToBasketCommand
from checkout_command import CheckoutCommand
from display_basket_command import DisplayBasketCommand

class BasketActions:

    def __init__(self, basket, catalogue, warehouse):
        self.basket = basket
        self.catalogue = catalogue
        self.warehouse = warehouse

    def addToBasket(self):
        return AddToBasketCommand(self.basket, self.catalogue, self.warehouse)

    def displayBasket(self):
        return DisplayBasketCommand(self.basket)

    def checkout(self):
        return CheckoutCommand(self.basket, self.warehouse)

