namespace Warehouse {

class InvalidNumItemsException : System.Exception {

	internal InvalidNumItemsException(int numItems) {
		super("Please supply a number of items greater than zero");
	}

}
}