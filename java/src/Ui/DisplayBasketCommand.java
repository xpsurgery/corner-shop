package Ui;

import Basket.Basket;

public class DisplayBasketCommand implements UserCommand {

	private Basket basket;

	public DisplayBasketCommand(Basket basket) {
		this.basket = basket;
	}

	public void run(UserInput cmd) {
		basket.list(System.out);
	}

}
