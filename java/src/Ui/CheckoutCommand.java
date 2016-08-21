package Ui;

import Basket.Basket;
import Warehouse.Warehouse;

public class CheckoutCommand {

	private Basket basket;
	private Warehouse warehouse;

	public CheckoutCommand(Basket basket, Warehouse warehouse) {
		this.basket = basket;
		this.warehouse = warehouse;
	}

	public void run(UserInput cmd) {
		basket.checkout(warehouse);
	}

}
