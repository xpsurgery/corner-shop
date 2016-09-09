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
			if cmd.args.length > 3 || cmd.args.length < 2
				$stderr.puts "ERROR: Usage: a sku [numitems]"
				return
			end
			sku = cmd.arg(1)
			num_items = 1
			if cmd.args.length == 3
				begin
					num_items = Integer(cmd.arg(2))
				rescue ArgumentError
					raise UserInterface::UsageException.new("The number of items must be a number greater than zero.")
				end
			end
			if num_items <= 0
				raise UserInterface::UsageException.new("The number of items must be a number greater than zero.")
			end
			skuCode = @catalogue.lookup_code(sku)
			raise UserInterface::UsageException.new("Product " + sku + " unknown.") if skuCode.nil?
			@warehouse.must_stock(skuCode, num_items)
			@basket.add(sku, @catalogue, num_items)
		end

	end
end
