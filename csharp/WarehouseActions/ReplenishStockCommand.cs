namespace WarehouseActions {

	using System;
	using Products;
	using Ui;
	using Warehouse;

	class ReplenishStockCommand : UserCommand {

		private Warehouse warehouse;
		private Catalogue catalogue;

		internal ReplenishStockCommand(Warehouse warehouse, Catalogue catalogue) {
			this.warehouse = warehouse;
			this.catalogue = catalogue;
		}

		public void Run(UserInput cmd) {
			if (cmd.args.Length != 5) {
				Console.WriteLine("ERROR: Usage: r aisle loc sku num");
				return;
			}
			if (catalogue.Lookup(cmd.Args(3)) == null)
				throw new UnknownProductException(cmd.Args(3));
			string[] sku = new string[]{ cmd.Args(1), cmd.Args(2), cmd.Args(3) };
			try {
				int numItems = int.Parse(cmd.Args(4));
				warehouse.Replenish(sku, numItems);
			} catch (FormatException) {
				Console.WriteLine("ERROR: Usage: r sku numitems");
			}
		}

	}
}