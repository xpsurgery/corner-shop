package com.xpsurgery.cornershop.basketActions;

import com.xpsurgery.cornershop.basket.Basket;
import com.xpsurgery.cornershop.ui.UserCommand;
import com.xpsurgery.cornershop.ui.UserInput;
import com.xpsurgery.cornershop.warehouse.Warehouse;

class CheckoutCommand implements UserCommand {

	private Basket basket;
	private Warehouse warehouse;

	CheckoutCommand(Basket basket, Warehouse warehouse) {
		this.basket = basket;
		this.warehouse = warehouse;
	}

	@Override
	public void run(UserInput cmd) {
		basket.checkout(warehouse);
	}

}
