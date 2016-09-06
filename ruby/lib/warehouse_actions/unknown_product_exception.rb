module WarehouseActions

public class UnknownProductException extends RuntimeException

	public UnknownProductException(String sku)
		super("SKU code " + sku + " is not in the product catalogue.")
	end

end
