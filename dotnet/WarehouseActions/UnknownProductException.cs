namespace WarehouseActions {

public class UnknownProductException : System.Exception {

	public UnknownProductException(string sku) {
		super("SKU code " + sku + " is not in the product catalogue.");
	}

}
}