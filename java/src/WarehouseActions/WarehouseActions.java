package WarehouseActions;

import Ui.UserCommand;
import Warehouse.Warehouse;

public class WarehouseActions {

	private Warehouse warehouse;

	public WarehouseActions(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public UserCommand stockReport() {
		return new StockReportCommand(warehouse);
	}

	public UserCommand replenishStock() {
		return new ReplenishStockCommand(warehouse);
	}

}
