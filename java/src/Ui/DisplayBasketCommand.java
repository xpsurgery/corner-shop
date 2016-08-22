package Ui;

import Basket.Basket;
import Products.Catalogue;

class DisplayBasketCommand implements UserCommand {

	private Basket basket;
	private Catalogue catalogue;

	DisplayBasketCommand(Basket basket, Catalogue catalogue) {
		this.basket = basket;
		this.catalogue = catalogue;
	}

	public void run(UserInput cmd) {
		basket.list(System.out, catalogue);
	}

}
