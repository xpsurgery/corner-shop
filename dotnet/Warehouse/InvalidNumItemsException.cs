namespace Warehouse {

class InvalidNumItemsException : RuntimeException {

	InvalidNumItemsException(int numItems) {
		super("Please supply a number of items greater than zero");
	}

}
}