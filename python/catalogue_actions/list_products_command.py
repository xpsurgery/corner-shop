import sys

class ListProductsCommand:

    def __init__(self, catalogue):
        self.catalogue = catalogue

    def run(self, cmd):
        self.catalogue.list(sys.stdout)

