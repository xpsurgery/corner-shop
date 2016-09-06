module WarehouseActions

require_relative Ui.UserCommand
require_relative Ui.UserInput
require_relative Warehouse.Warehouse

class StockReportCommand implements UserCommand

	private Warehouse warehouse

	StockReportCommand(Warehouse warehouse)
		this.warehouse = warehouse
	end

	@Override
	public void run(UserInput cmd)
		warehouse.stockReport(System.out)
	end

end
