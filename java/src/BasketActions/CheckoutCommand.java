package BasketActions;

import Basket.Basket;
import Ui.UserCommand;
import Ui.UserInput;
import Warehouse.Warehouse;

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
