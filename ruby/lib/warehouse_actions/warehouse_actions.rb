package WarehouseActions;

import Products.Catalogue;
import Ui.UserCommand;
import Warehouse.Warehouse;

public class WarehouseActions {

	private Warehouse warehouse;
	private Catalogue catalogue;

	public WarehouseActions(Warehouse warehouse, Catalogue catalogue) {
		this.warehouse = warehouse;
		this.catalogue = catalogue;
	}

	public UserCommand stockReport() {
		return new StockReportCommand(warehouse);
	}

	public UserCommand replenishStock() {
		return new ReplenishStockCommand(warehouse, catalogue);
	}

}
