module BasketActions

	class CheckoutCommand

		def initialize(basket, warehouse)
			@basket = basket
			@warehouse = warehouse
		end

		def run(cmd)
			@basket.checkout(@warehouse)
		end

	end
end
