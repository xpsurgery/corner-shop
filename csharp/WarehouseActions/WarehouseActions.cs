namespace WarehouseActions {

	using Products;
	using Ui;
	using Warehouse;

	public class WarehouseActions {

		private Warehouse warehouse;
		private Catalogue catalogue;

		public WarehouseActions(Warehouse warehouse, Catalogue catalogue) {
			this.warehouse = warehouse;
			this.catalogue = catalogue;
		}

		public UserCommand StockReport() {
			return new StockReportCommand(warehouse);
		}

		public UserCommand ReplenishStock() {
			return new ReplenishStockCommand(warehouse, catalogue);
		}

	}
}