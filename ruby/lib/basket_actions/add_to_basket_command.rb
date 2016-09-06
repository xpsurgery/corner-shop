require_relative '../products/catalogue'
require_relative '../user_interface/usage_exception'
require_relative '../user_interface/user_input'
require_relative '../warehouse/warehouse'
require_relative '../basket/basket'

module BasketActions

	class AddToBasketCommand

		def initialize(basket, catalogue, warehouse)
			@basket = basket
			@catalogue = catalogue
			@warehouse = warehouse
		end

		def run(cmd)
			if (cmd.args.length > 3)
				System.err.println("ERROR: Usage: a sku [numitems]")
				return
			end
			String sku = cmd.args(1)
			int numItems = 1
			if (cmd.args.length == 3)
				begin
					numItems = Integer.parseInt(cmd.args(2))
				rescue (NumberFormatException e)
					throw new UsageException("The number of items must be a number greater than zero.")
				end
			end
			if (numItems <= 0)
				throw new UsageException("The number of items must be a number greater than zero.")
			end
			skuCode = catalogue.lookupCode(sku)
			if skuCode.nil?
				throw new UsageException("Product " + sku + " unknown.")
			end
			warehouse.mustStock(skuCode, numItems)
			basket.add(sku, catalogue, numItems)
		end

	end
end
