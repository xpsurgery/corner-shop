package Ui;

import Basket.Basket;

class DisplayBasketCommand implements UserCommand {

	private Basket basket;

	DisplayBasketCommand(Basket basket) {
		this.basket = basket;
	}

	public void run(UserInput cmd) {
		basket.list(System.out);
	}

}
