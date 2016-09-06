require_relative '../basket/basket'
require_relative '../products/catalogue'
require_relative '../warehouse/warehouse'

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

		def addToBasket
			AddToBasketCommand.new(@basket, @catalogue, @warehouse)
		end

		def displayBasket
			DisplayBasketCommand.new(@basket)
		end

		def checkout
			CheckoutCommand.new(@basket, @warehouse)
		end

	end
end
