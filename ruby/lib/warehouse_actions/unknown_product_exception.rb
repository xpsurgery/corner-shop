module WarehouseActions

  class UnknownProductException < StandardError

  	def initialize(sku)
  		super("SKU code " + sku + " is not in the product catalogue.")
  	end

  end
end
