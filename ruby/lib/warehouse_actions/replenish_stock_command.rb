package WarehouseActions;

import Products.Catalogue;
import Ui.UserCommand;
import Ui.UserInput;
import Warehouse.Warehouse;

class ReplenishStockCommand implements UserCommand {

	private Warehouse warehouse;
	private Catalogue catalogue;

	ReplenishStockCommand(Warehouse warehouse, Catalogue catalogue) {
		this.warehouse = warehouse;
		this.catalogue = catalogue;
	}

	@Override
	public void run(UserInput cmd) {
		if (cmd.args.length != 5) {
			System.err.println("ERROR: Usage: r aisle loc sku num");
			return;
		}
		if (catalogue.lookup(cmd.args(3)) == null)
			throw new UnknownProductException(cmd.args(3));
		String[] sku = new String[]{ cmd.args(1), cmd.args(2), cmd.args(3) };
		try {
			int numItems = Integer.parseInt(cmd.args(4));
			warehouse.replenish(sku, numItems);
		} catch (NumberFormatException e) {
			System.err.println("ERROR: Usage: r sku numitems");
		}
	}

}
