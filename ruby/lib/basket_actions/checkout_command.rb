require_relative '../basket/basket'
require_relative '../user_interface/user_input'
require_relative '../warehouse/warehouse'

module BasketActions

	class CheckoutCommand

		def initialize(basket, warehouse)
			@basket = basket
			@warehouse = warehouse
		end

		def run(cmd)
			basket.checkout(warehouse)
		end

	end
end
