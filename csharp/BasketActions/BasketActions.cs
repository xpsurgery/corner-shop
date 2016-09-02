namespace BasketActions {

	using Basket;
	using Products;
	using Ui;
	using Warehouse;

	public class BasketActions {

		private Basket basket;
		private Catalogue catalogue;
		private Warehouse warehouse;

		public BasketActions(Basket basket, Catalogue catalogue, Warehouse warehouse) {
			this.basket = basket;
			this.catalogue = catalogue;
			this.warehouse = warehouse;
		}

		public UserCommand AddToBasket() {
			return new AddToBasketCommand(basket, catalogue, warehouse);
		}

		public UserCommand DisplayBasket() {
			return new DisplayBasketCommand(basket);
		}

		public UserCommand Checkout() {
			return new CheckoutCommand(basket, warehouse);
		}

	}
}