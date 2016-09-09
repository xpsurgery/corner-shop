require_relative './invalid_num_items_exception'
require_relative './not_enough_stock_exception'

module Warehouse

	class Warehouse

		class << self

			def from_file(warehouseReader)
				data = warehouseReader.readAll
				stock = {}
				data.each do |line|
					stock[line.sku_code] = line.count
				end
				Warehouse.new(stock)
			end

		end

		def initialize(stock)
			@stock = stock
		end

		def stock_report(out)
			@stock.keys.each do |sku_code|
				out.printf("%s %s %s   %6d\n", sku_code[0], sku_code[1], sku_code[2], @stock[sku_code])
			end
		end

		def replenish(sku_code, numItems)
			raise InvalidNumItemsException.new(numItems) if numItems <= 0
			change_stock_level(sku_code, numItems)
		end

		def fulfill(sku, numItems)
			sku_code = lookup(sku)
			must_stock(sku_code, numItems)
			change_stock_level(sku_code, -numItems)
		end

		def must_stock(sku, numItems)
			sku_code = lookup(sku[2])
			raise NotEnoughStockException.new(sku, numItems) if (sku_code.nil? || @stock[sku_code] < numItems)
		end

		private

		def lookup(sku)
			@stock.keys.each do |sku_code|										# TODO -- select
				return sku_code if sku_code[2] == sku
			end
			nil
		end

		def change_stock_level(sku_code, numItems)
			key = lookup(sku_code[2])
			if key.nil?
				@stock[sku_code] = numItems
			else
				@stock[key] = @stock[key] + numItems
			end
		end

	end
end
