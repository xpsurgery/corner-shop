package Ui;

import Warehouse.Warehouse;

public class ReplenishStockCommand implements UserCommand {

	private Warehouse warehouse;

	public ReplenishStockCommand(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public void run(UserInput cmd) {
		String sku = cmd.args[1];							// TODO -- error handling!
		int numItems = Integer.parseInt(cmd.args[2]);
		warehouse.replenish(sku, numItems);
	}

}
