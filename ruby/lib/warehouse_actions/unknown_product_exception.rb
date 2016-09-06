module WarehouseActions

  class UnknownProductException

  	def initialize(sku)
  		super("SKU code " + sku + " is not in the product catalogue.")
  	end

  end
end
