using Basket.Basket;
using Products.Catalogue;
using Ui.UserCommand;
using Warehouse.Warehouse;

namespace BasketActions {

public class BasketActions {

	private Basket basket;
	private Catalogue catalogue;
	private Warehouse warehouse;

	public BasketActions(Basket basket, Catalogue catalogue, Warehouse warehouse) {
		this.basket = basket;
		this.catalogue = catalogue;
		this.warehouse = warehouse;
	}

	public UserCommand addToBasket() {
		return new AddToBasketCommand(basket, catalogue, warehouse);
	}

	public UserCommand displayBasket() {
		return new DisplayBasketCommand(basket);
	}

	public UserCommand checkout() {
		return new CheckoutCommand(basket, warehouse);
	}

}
}