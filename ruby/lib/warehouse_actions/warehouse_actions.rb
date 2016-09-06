require_relative '../products/catalogue'
require_relative '../warehouse/warehouse'

module WarehouseActions

	public class WarehouseActions

		def initialize(warehouse, catalogue)
			@warehouse = warehouse
			@catalogue = catalogue
		end

		def stockReport
			StockReportCommand.new(@warehouse)
		end

		def replenishStock
			ReplenishStockCommand.new(@warehouse, @catalogue)
		end

	end
end
