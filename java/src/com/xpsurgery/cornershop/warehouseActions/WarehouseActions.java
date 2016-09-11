package com.xpsurgery.cornershop.warehouseActions;

import com.xpsurgery.cornershop.products.Catalogue;
import com.xpsurgery.cornershop.ui.UserCommand;
import com.xpsurgery.cornershop.warehouse.Warehouse;

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
