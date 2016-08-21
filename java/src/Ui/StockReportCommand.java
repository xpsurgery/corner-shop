package Ui;

import Warehouse.Warehouse;

public class StockReportCommand {

	private Warehouse warehouse;

	public StockReportCommand(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public void run(UserInput cmd) {
		warehouse.stockReport(System.out);
	}

}
