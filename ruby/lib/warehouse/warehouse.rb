require_relative '../filestore/stock_memento'
require_relative '../filestore/warehouse_reader'

module Warehouse

	class Warehouse

		class << self

			def fromFile(warehouseReader)
				data = warehouseReader.readAll
				stock = {}
				data.each do |line|
					stock[line.sku_code] = line.count
				end
				return Warehouse.new(stock)
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
			throw InvalidNumItemsException.new(numItems) if numItems <= 0
			changeStockLevel(sku_code, numItems)
		end

		def fulfill(sku, numItems)
			sku_code = lookup(sku)
			mustStock(sku_code, numItems)
			changeStockLevel(sku_code, -numItems)
		end

		def mustStock(sku, numItems)
			sku_code = lookup(sku[2])
			if sku_code.nil? || @stock[sku_code] < numItems
				throw NotEnoughStockException.new(sku, numItems)
			end
		end

		private

		def lookup(sku)
			@stock.keys.each do | sku_code|
				if sku_code[2] == sku
					return sku_code
				end
			end
			nil
		end

		def changeStockLevel(sku_code, numItems)
			key = lookup(sku_code[2])
			if key.nil?
				@stock[sku_code] = numItems
			else
				@stock[key] = @stock[key] + numItems
			end
		end

	end
end
