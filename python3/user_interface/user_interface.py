from . user_input import UserInput
from . help_command import HelpCommand
from . unknown_command import UnknownCommand
from . usage_exception import UsageException
from warehouse_actions.unknown_product_exception import UnknownProductException

class UserInterface:

    def __init__(self, catalogueActions, warehouseActions, basketActions):
        self.catalogueActions = catalogueActions
        self.warehouseActions = warehouseActions
        self.basketActions = basketActions

    def start(self):
        while True:
            try:
                line = input("shop> ")
                line = line.strip()
                if line:
                    if line[0] == 'q': return
                    cmd = UserInput(line)
                    self.createHandler(cmd.command).run(cmd)
            except Exception as e:
                print("ERROR: " + str(e))

    def createHandler(self, command):
        if command == 'a':
            return self.basketActions.addToBasket()
        elif command == 'b':
            return self.basketActions.displayBasket()
        elif command == 'c':
            return self.basketActions.checkout()
        elif command == 'd':
            return self.catalogueActions.displayProductDetails()
        elif command == 'h':
            return HelpCommand()
        elif command == 'p':
            return self.catalogueActions.listProducts()
        elif command == 'r':
            return self.warehouseActions.replenishStock()
        elif command == 's':
            return self.warehouseActions.stockReport()
        else:
            return UnknownCommand()

