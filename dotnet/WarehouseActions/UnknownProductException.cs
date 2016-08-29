namespace WarehouseActions {

public class UnknownProductException : RuntimeException {

	public UnknownProductException(string sku) {
		super("SKU code " + sku + " is not in the product catalogue.");
	}

}
}