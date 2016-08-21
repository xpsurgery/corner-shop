package Warehouse;

public class NotEnoughStockException extends RuntimeException {

	public NotEnoughStockException(String sku, int numItems) {
		super("The warehouse does not contain " + numItems + " item(s) of product " + sku);
	}

}
