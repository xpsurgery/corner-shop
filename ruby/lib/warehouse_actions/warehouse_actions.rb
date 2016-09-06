module WarehouseActions

require_relative Products.Catalogue
require_relative Ui.UserCommand
require_relative Warehouse.Warehouse

public class WarehouseActions

	private Warehouse warehouse
	private Catalogue catalogue

	public WarehouseActions(Warehouse warehouse, Catalogue catalogue)
		this.warehouse = warehouse
		this.catalogue = catalogue
	end

	public UserCommand stockReport
		return new StockReportCommand(warehouse)
	end

	public UserCommand replenishStock
		return new ReplenishStockCommand(warehouse, catalogue)
	end

end
