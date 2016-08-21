package Warehouse;

class NotEnoughStockException extends RuntimeException {

	NotEnoughStockException(String sku, int numItems) {
		super("The warehouse does not contain " + numItems + " item(s) of product " + sku);
	}

}
