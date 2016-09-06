require_relative '../products/catalogue'
require_relative '../warehouse/warehouse'

module WarehouseActions

	class WarehouseActions

		def initialize(warehouse, catalogue)
			@warehouse = warehouse
			@catalogue = catalogue
		end

		def stock_report
			StockReportCommand.new(@warehouse)
		end

		def replenish_stock
			ReplenishStockCommand.new(@warehouse, @catalogue)
		end

	end
end
