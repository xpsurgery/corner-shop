package Ui;

import Warehouse.Warehouse;

class StockReportCommand implements UserCommand {

	private Warehouse warehouse;

	StockReportCommand(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public void run(UserInput cmd) {
		warehouse.stockReport(System.out);
	}

}
