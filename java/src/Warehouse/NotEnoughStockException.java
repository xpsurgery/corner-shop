package Warehouse;

class NotEnoughStockException extends RuntimeException {

	NotEnoughStockException(String[] skuCode, int numItems) {
		super("The warehouse does not contain " + numItems + " item(s) of product " + skuCode[2]);
	}

}
