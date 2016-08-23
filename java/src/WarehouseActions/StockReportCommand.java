package WarehouseActions;

import Ui.UserCommand;
import Ui.UserInput;
import Warehouse.Warehouse;

class StockReportCommand implements UserCommand {

	private Warehouse warehouse;

	StockReportCommand(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	@Override
	public void run(UserInput cmd) {
		warehouse.stockReport(System.out);
	}

}
