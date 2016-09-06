module WarehouseActions

  class UnknownProductException # extends RuntimeException

  	def initialize(sku)
  		super("SKU code " + sku + " is not in the product catalogue.")
  	end

  end
end
