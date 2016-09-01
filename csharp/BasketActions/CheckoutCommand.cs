namespace BasketActions {

	using Ui;

	class CheckoutCommand : UserCommand {

		private Basket.Basket basket;
		private Warehouse.Warehouse warehouse;

		internal CheckoutCommand(Basket.Basket basket, Warehouse.Warehouse warehouse) {
			this.basket = basket;
			this.warehouse = warehouse;
		}

		public void run(UserInput cmd) {
			basket.checkout(warehouse);
		}

	}
}