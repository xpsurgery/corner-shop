namespace Warehouse {

	class NotEnoughStockException : System.Exception {

		internal NotEnoughStockException(string[] skuCode, int numItems) : base("The warehouse does not contain " + numItems + " item(s) of product " + skuCode)
		{
		}

	}
}