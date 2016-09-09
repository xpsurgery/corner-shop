module Warehouse

  class NotEnoughStockException < StandardError

  	def initialize(sku_code, num_items)
  		super("The warehouse does not contain #{num_items} item(s) of product #{sku_code[2]}")
  	end

  end
end
