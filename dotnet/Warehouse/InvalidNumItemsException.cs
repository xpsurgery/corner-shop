namespace Warehouse {

class InvalidNumItemsException : System.Exception {

	InvalidNumItemsException(int numItems) {
		super("Please supply a number of items greater than zero");
	}

}
}