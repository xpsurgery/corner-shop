namespace Warehouse {

class NotEnoughStockException : RuntimeException {

	NotEnoughStockException(string[] skuCode, int numItems) {
		super("The warehouse does not contain " + numItems + " item(s) of product " + skuCode);
	}

}
}