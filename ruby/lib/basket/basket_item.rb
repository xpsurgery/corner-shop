module Basket

	class BasketItem

		attr_reader :skuId, :title, :price, :count

		def initialize(skuId, title, price, count)
			@skuId = skuId
			@title = title
			@price = price
			@count = count
		end
	end
end
