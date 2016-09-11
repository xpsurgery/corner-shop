require_relative './basket_item'

module Basket

	class Basket

		def initialize
			@items = {}
		end

		def list
			sorted_skus.map {|sku| @items[sku] }
		end

		def add(sku_id, catalogue, numItems)
			sku = catalogue.lookup(sku_id)
			if @items.include?(sku_id)
				existing = @items[sku_id]
				@items[sku_id] = BasketItem.new(sku_id, existing.title, existing.price, existing.count + numItems)
			else
				@items[sku_id] = BasketItem.new(sku_id, sku.title, sku.price, numItems)
			end
		end

		def checkout(warehouse)
			if @items.empty?
				$stderr.puts "Your basket is empty!"
				return
			end
			@items.keys.each do |sku|
				warehouse.fulfill(sku, @items[sku].count)
			end
			@items = {}
			printf("All items checked out. Total price £%5.02f\n", current_total / 100.0)
		end

		private

		def sorted_skus
			@items.keys.sort
		end

		def current_total
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
