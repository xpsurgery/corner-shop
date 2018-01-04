from display_product_details_command import DisplayProductDetailsCommand
from list_products_command import ListProductsCommand

class CatalogueActions:

    def __init__(self, catalogue):
        self.catalogue = catalogue

    def display_product_details(self):
        return DisplayProductDetailsCommand(self.catalogue)

    def list_products(self):
        return ListProductsCommand(self.catalogue)

