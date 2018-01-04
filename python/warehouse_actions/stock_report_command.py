import sys

class StockReportCommand:

    def __init__(self, warehouse):
        self.warehouse = warehouse

    def run(self, cmd):
        self.warehouse.stock_report(sys.stdout)

