require_relative '../user_interface/usage_exception'

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
			sku_code = @catalogue.lookup_code(sku)
			raise UserInterface::UsageException.new("Product " + sku + " unknown.") if sku_code.nil?
			@warehouse.must_stock(sku_code, num_items)
			@basket.add(sku, @catalogue, num_items)
		end

	end
end
