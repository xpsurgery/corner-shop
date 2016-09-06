module Filestore

	class StockMemento

		attr_reader :sku_code, :count

		def initialize(aisle, loc, sku, count)
			@sku_code = [aisle, loc, sku]
			begin
				@count = Integer(count)
			rescue ArgumentError => e
				throw new DataFormatException("Last argument must be a number: " + aisle + " " + loc + " " + sku + " " + count)
			end
		end

	end
end
