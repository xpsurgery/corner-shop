require_relative '../products/catalogue'
require_relative '../user_interface/user_input'
require_relative '../warehouse/warehouse'
require_relative './unknown_product_exception'

module WarehouseActions

	class ReplenishStockCommand

		def initialize(warehouse, catalogue)
			@warehouse = warehouse
			@catalogue = catalogue
		end

		def run(cmd)
			if cmd.args.length != 5
				$stderr.puts "ERROR: Usage: r aisle loc sku num"
				return
			end
			if @catalogue.lookup(cmd.arg(3)).nil?
				throw UnknownProductException.new(cmd.arg(3))
			end
			sku = [cmd.arg(1), cmd.arg(2), cmd.arg(3)]
			begin
				numItems = Integer(cmd.arg(4))
				@warehouse.replenish(sku, numItems)
			rescue ArgumentError
				$stderr.puts "ERROR: Usage: r sku numitems"
			end
		end

	end
end
