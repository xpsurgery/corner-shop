module Basket

	class BasketItem

		attr_reader :sku, :title, :price, :count

		def initialize(sku, title, price, count)
			@sku = sku
			@title = title
			@price = price
			@count = count
		end
	end
end
