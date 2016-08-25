package WarehouseActions;

import Ui.UserCommand;
import Ui.UserInput;
import Warehouse.Warehouse;

class ReplenishStockCommand implements UserCommand {

	private Warehouse warehouse;

	ReplenishStockCommand(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	@Override
	public void run(UserInput cmd) {
		if (cmd.args.length != 5) {
			System.err.println("ERROR: Usage: r aisle loc sku num");
			return;
		}
		String[] sku = new String[]{ cmd.args(1), cmd.args(2), cmd.args(3) };
		try {
			int numItems = Integer.parseInt(cmd.args(4));
			warehouse.replenish(sku, numItems);
		} catch (NumberFormatException e) {
			System.err.println("ERROR: Usage: r sku numitems");
		}
	}

}
