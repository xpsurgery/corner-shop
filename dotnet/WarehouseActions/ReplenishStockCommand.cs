namespace WarehouseActions {

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

	public void run(UserInput cmd) {
		if (cmd.args.Length != 5) {
			System.err.println("ERROR: Usage: r aisle loc sku num");
			return;
		}
		if (catalogue.lookup(cmd.Args(3)) == null)
			throw new UnknownProductException(cmd.Args(3));
		string[] sku = new string[]{ cmd.Args(1), cmd.Args(2), cmd.Args(3) };
		try {
			int numItems = Integer.parseInt(cmd.Args(4));
			warehouse.replenish(sku, numItems);
		} catch (NumberFormatException e) {
			System.err.println("ERROR: Usage: r sku numitems");
		}
	}

}
}