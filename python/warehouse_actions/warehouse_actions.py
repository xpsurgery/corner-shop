from stock_report_command import StockReportCommand
from replenish_stock_command import ReplenishStockCommand

class WarehouseActions:

    def __init__(self, warehouse, catalogue):
        self.warehouse = warehouse
        self.catalogue = catalogue

    def stock_report(self):
        return StockReportCommand(self.warehouse)

    def replenish_stock(self):
        return ReplenishStockCommand(self.warehouse, self.catalogue)

