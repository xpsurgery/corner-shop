require_relative './add_to_basket_command'
require_relative './checkout_command'
require_relative './display_basket_command'

module BasketActions

	class BasketActions

		def initialize(basket, catalogue, warehouse)
			@basket = basket
			@catalogue = catalogue
			@warehouse = warehouse
		end

		def add_to_basket
			AddToBasketCommand.new(@basket, @catalogue, @warehouse)
		end

		def display_basket
			DisplayBasketCommand.new(@basket)
		end

		def checkout
			CheckoutCommand.new(@basket, @warehouse)
		end

	end
end
