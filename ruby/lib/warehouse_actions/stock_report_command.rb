module WarehouseActions

  class StockReportCommand

  	def initialize(warehouse)
  		@warehouse = warehouse
  	end

  	def run(cmd)
  		@warehouse.stock_report($stdout)
  	end

  end
end
