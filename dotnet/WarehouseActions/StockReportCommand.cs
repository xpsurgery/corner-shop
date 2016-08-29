namespace WarehouseActions {

using Ui;
using Warehouse;

class StockReportCommand : UserCommand {

	private Warehouse warehouse;

	internal StockReportCommand(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public void run(UserInput cmd) {
		warehouse.stockReport(System.out);
	}

}
}