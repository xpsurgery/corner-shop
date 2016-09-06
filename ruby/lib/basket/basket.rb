require_relative '../products/catalogue'
require_relative '../products/sku'
require_relative '../warehouse/warehouse'

module Basket

	class Basket

		def initialize
			@items = {}
		end

		def list
			sortedSkus.map {|sku| @items[sku] }
		end

		def add(skuId, catalogue, numItems)
			Sku sku = catalogue.lookup(skuId)
			if @items.containsKey(skuId)
				BasketItem existing = @items.get(skuId)
				@items[skuId] = BasketItem.new(skuId, existing.title, existing.price, existing.count + numItems)
			else
				@items[skuId] = BasketItem.new(skuId, sku.title, sku.price, numItems)
			end
		end

		def checkout(warehouse)
			if @items.empty?
				System.err.println("Your basket is empty!")
				return
			end
			double totalPrice = currentTotal / 100.0
			# for (String sku : @items.keySet)
			# 	warehouse.fulfill(sku, @items.get(sku).count)
			@items = {}
			System.out.printf("All items checked out. Total price £%5.02f\n", totalPrice)
		end

		private

		def sortedSkus
			@items.keys.sort
		end

		def currentTotal
			total = 0
			# for (BasketItem item : @items.values)
			# 	total += item.count * item.price
			if (total > 2000)
				total -= (total/10)
			end
			total
		end

	end
end
