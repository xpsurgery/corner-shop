require_relative '../products/catalogue'
require_relative '../user_interface/user_input'
require_relative '../warehouse/warehouse'

module WarehouseActions

	class ReplenishStockCommand

		def initialize(warehouse, catalogue)
			@warehouse = warehouse
			@catalogue = catalogue
		end

		def run(cmd)
			if (cmd.args.length != 5)
				System.err.println("ERROR: Usage: r aisle loc sku num")
				return
			end
			if (@catalogue.lookup(cmd.args(3)) == null)
				throw new UnknownProductException(cmd.args(3))
			end
			sku = [cmd.args(1), cmd.args(2), cmd.args(3)]
			begin
				int numItems = Integer.parseInt(cmd.args(4))
				@warehouse.replenish(sku, numItems)
			rescue (NumberFormatException e)
				System.err.println("ERROR: Usage: r sku numitems")
			end
		end

	end
end
