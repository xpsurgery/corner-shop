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
			if cmd.args.length > 3
				$stderr.puts "ERROR: Usage: a sku [numitems]"
				return
			end
			sku = cmd.arg(1)
			numItems = 1
			if cmd.args.length == 3
				begin
					numItems = Integer(cmd.arg(2))
				rescue ArgumentError
					throw new UsageException("The number of items must be a number greater than zero.")
				end
			end
			if numItems <= 0
				throw UsageException.new("The number of items must be a number greater than zero.")
			end
			skuCode = @catalogue.lookupCode(sku)
			throw UsageException.new("Product " + sku + " unknown.") if skuCode.nil?
			@warehouse.mustStock(skuCode, numItems)
			@basket.add(sku, @catalogue, numItems)
		end

	end
end
