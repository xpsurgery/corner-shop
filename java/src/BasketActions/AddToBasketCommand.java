package BasketActions;

import Products.Catalogue;
import Ui.UsageException;
import Ui.UserCommand;
import Ui.UserInput;
import Warehouse.Warehouse;
import Basket.Basket;

class AddToBasketCommand implements UserCommand {

	private Basket basket;
	private Warehouse warehouse;
	private Catalogue catalogue;

	AddToBasketCommand(Basket basket, Catalogue catalogue, Warehouse warehouse) {
		this.basket = basket;
		this.catalogue = catalogue;
		this.warehouse = warehouse;
	}

	@Override
	public void run(UserInput cmd) {
		if (cmd.args.length > 3 || cmd.args.length < 2) {
			System.err.println("ERROR: Usage: a sku [numitems]");
			return;
		}
		String sku = cmd.args(1);
		int numItems = 1;
		if (cmd.args.length == 3) {
			try {
				numItems = Integer.parseInt(cmd.args(2));
			} catch (NumberFormatException e) {
				throw new UsageException("The number of items must be a number greater than zero.");
			}
		}
		if (numItems <= 0)
			throw new UsageException("The number of items must be a number greater than zero.");
		String[] skuCode = catalogue.lookupCode(sku);
		if (skuCode == null)
			throw new UsageException("Product " + sku + " unknown.");
		warehouse.mustStock(skuCode, numItems);
		basket.add(sku, catalogue, numItems);
	}

}
