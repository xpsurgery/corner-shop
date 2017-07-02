namespace WarehouseActions {

	using Ui;
	using Warehouse;

	class StockReportCommand : UserCommand {

		private Warehouse warehouse;

		internal StockReportCommand(Warehouse warehouse) {
			this.warehouse = warehouse;
		}

		public void Run(UserInput cmd) {
			warehouse.StockReport();
		}

	}
}