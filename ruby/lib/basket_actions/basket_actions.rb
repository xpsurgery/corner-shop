require_relative '../basket/basket'
require_relative '../products/catalogue'
require_relative '../warehouse/warehouse'

module BasketActions

	class BasketActions

		def initialize(basket, catalogue, warehouse)
			@basket = basket
			@catalogue = catalogue
			@warehouse = warehouse
		end

		def addToBasket
			AddToBasketCommand.new(basket, catalogue, warehouse)
		end

		def displayBasket
			DisplayBasketCommand.new(basket)
		end

		def checkout
			CheckoutCommand.new(basket, warehouse)
		end

	end
end
