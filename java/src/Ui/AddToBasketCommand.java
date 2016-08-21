package Ui;

import Basket.Basket;

public class AddToBasketCommand {

	private Basket basket;

	public AddToBasketCommand(Basket basket) {
		this.basket = basket;
	}

	public void run(UserInput cmd) {
		String sku = cmd.args[1];										// TODO -- add more than one item
		basket.add(sku);
	}

}
