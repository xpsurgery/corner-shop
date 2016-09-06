require_relative '../user_interface/user_command'
require_relative '../user_interface/user_input'
require_relative '../warehouse/warehouse'

module WarehouseActions

  class StockReportCommand # implements UserCommand

  	def initialize(warehouse)
  		@warehouse = warehouse
  	end

  	def run(cmd)
  		@warehouse.stockReport(System.out)
  	end

  end
end
