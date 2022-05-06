from . display_product_details_command import DisplayProductDetailsCommand
from . list_products_command import ListProductsCommand

class CatalogueActions:

    def __init__(self, catalogue):
        self.catalogue = catalogue

    def displayProductDetails(self):
        return DisplayProductDetailsCommand(self.catalogue)

    def listProducts(self):
        return ListProductsCommand(self.catalogue)

