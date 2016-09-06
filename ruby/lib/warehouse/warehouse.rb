require_relative '../filestore/stock_memento'
require_relative '../filestore/warehouse_reader'

module Warehouse

	class Warehouse

		class << self

			def fromFile(warehouseReader)
				data = warehouseReader.readAll
				stock = {}
				data.each do |line|
					stock.put(line.skuCode, line.count)
				end
				return new Warehouse(stock)
			end

		end

		def initialize(stock)
			@stock = stock
		end

		def stockReport(out)
			@stock.keys.each do |skuCode|
				out.printf("%s %s %s   %6d\n", skuCode[0], skuCode[1], skuCode[2], stock.get(skuCode))
			end
		end

		def replenish(skuCode, numItems)
			if (numItems <= 0)
				throw InvalidNumItemsException.new(numItems)
			end
			changeStockLevel(skuCode, numItems)
		end

		def fulfill(sku, numItems)
			skuCode = lookup(sku)
			mustStock(skuCode, numItems)
			changeStockLevel(skuCode, -numItems)
		end

		def mustStock(sku, numItems)
			skuCode = lookup(sku[2])
			if (skuCode == null || stock.get(skuCode) < numItems)
				throw NotEnoughStockException.new(sku, numItems)
			end
		end

		private

		def lookup(sku)
			@stock.keys.each do | skuCode|
				if (skuCode[2].equals(sku))
					return skuCode
				end
			end
			nil
		end

		def changeStockLevel(skuCode, numItems)
			key = lookup(skuCode[2])
			if (key == nil)
				@stock[skuCode] = numItems
			else
				@stock[key] = @stock[key] + numItems
			end
		end

	end
end
