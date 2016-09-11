package com.xpsurgery.cornershop.warehouseActions;

import com.xpsurgery.cornershop.ui.UserCommand;
import com.xpsurgery.cornershop.ui.UserInput;
import com.xpsurgery.cornershop.warehouse.Warehouse;

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
