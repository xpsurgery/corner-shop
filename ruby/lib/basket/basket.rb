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
			sku = catalogue.lookup(skuId)
			if @items.include?(skuId)
				existing = @items[skuId]
				@items[skuId] = BasketItem.new(skuId, existing.title, existing.price, existing.count + numItems)
			else
				@items[skuId] = BasketItem.new(skuId, sku.title, sku.price, numItems)
			end
		end

		def checkout(warehouse)
			if @items.empty?
				$stderr.puts "Your basket is empty!"
				return
			end
			totalPrice = currentTotal / 100.0
			@items.keys.each do |sku|
				warehouse.fulfill(sku, @items[sku].count)
			end
			@items = {}
			printf("All items checked out. Total price £%5.02f\n", totalPrice)
		end

		private

		def sortedSkus
			@items.keys.sort
		end

		def currentTotal
			total = 0
			@items.values.each do |item|
				total += item.count * item.price
			end
			if total > 2000
				total -= (total/10)
			end
			total
		end

	end
end
