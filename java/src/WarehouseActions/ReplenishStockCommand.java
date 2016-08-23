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
		if (cmd.args.length != 3) {
			System.err.println("ERROR: Usage: r sku num");
			return;
		}
		String sku = cmd.args(1);
		try {
			int numItems = Integer.parseInt(cmd.args[2]);
			warehouse.replenish(sku, numItems);
		} catch (NumberFormatException e) {
			System.err.println("ERROR: Usage: r sku numitems");
		}
	}

}
