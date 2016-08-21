package Ui;

import Basket.Basket;
import Warehouse.Warehouse;

class CheckoutCommand implements UserCommand {

	private Basket basket;
	private Warehouse warehouse;

	CheckoutCommand(Basket basket, Warehouse warehouse) {
		this.basket = basket;
		this.warehouse = warehouse;
	}

	public void run(UserInput cmd) {
		basket.checkout(warehouse);
	}

}
