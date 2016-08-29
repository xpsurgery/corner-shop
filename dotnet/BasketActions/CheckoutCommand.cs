namespace BasketActions {

class CheckoutCommand : UserCommand {

	private Basket basket;
	private Warehouse warehouse;

	CheckoutCommand(Basket basket, Warehouse warehouse) {
		this.basket = basket;
		this.warehouse = warehouse;
	}

	@Override
	public void run(UserInput cmd) {
		basket.checkout(warehouse);
	}

}
}