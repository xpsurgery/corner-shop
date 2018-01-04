#! /usr/bin/env python

import sys
from basket.basket import Basket
from basket_actions.basket_actions import BasketActions
from catalogue_actions.catalogue_actions import CatalogueActions
from filestore.catalogue_reader import CatalogueReader
from filestore.warehouse_reader import WarehouseReader
from products.catalogue import Catalogue
from user_interface.user_interface import UserInterface
from warehouse.warehouse import Warehouse
from warehouse_actions.warehouse_actions import WarehouseActions

class Application:

    def main(self):
        self.displayWelcomeMessage()
        warehouse = Warehouse.fromFile(WarehouseReader("../warehouse.dat"))
        catalogue = Catalogue.from_file(CatalogueReader("../catalogue.dat"))
        basket = Basket()
        catalogueActions = CatalogueActions(catalogue)
        warehouseActions = WarehouseActions(warehouse, catalogue)
        basketActions = BasketActions(basket, catalogue, warehouse)
        UserInterface(catalogueActions, warehouseActions, basketActions).start()
        self.displayGoodbyeMessage()
        sys.exit()

    def displayGoodbyeMessage(self):
        print
        print "Goodbye. Thanks for your custom!"
        print

    def displayWelcomeMessage(self):
        print "Welcome to our little corner shop!"
        print
        print "For help, type 'h' or 'help' or '?'"
        print

Application().main()

