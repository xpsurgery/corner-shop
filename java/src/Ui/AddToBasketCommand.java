package Ui;

import Warehouse.Warehouse;
import Basket.Basket;

public class AddToBasketCommand implements UserCommand {

	private Basket basket;
	private Warehouse warehouse;

	public AddToBasketCommand(Basket basket, Warehouse warehouse) {
		this.basket = basket;
		this.warehouse = warehouse;
	}

	public void run(UserInput cmd) {
		String sku = cmd.args[1];										// TODO -- add more than one item
		warehouse.mustStock(sku, 1);
		basket.add(sku);
	}

}
