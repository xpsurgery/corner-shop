module WarehouseActions

require_relative Products.Catalogue
require_relative Ui.UserCommand
require_relative Ui.UserInput
require_relative Warehouse.Warehouse

class ReplenishStockCommand implements UserCommand

	private Warehouse warehouse
	private Catalogue catalogue

	ReplenishStockCommand(Warehouse warehouse, Catalogue catalogue)
		this.warehouse = warehouse
		this.catalogue = catalogue
	end

	@Override
	public void run(UserInput cmd)
		if (cmd.args.length != 5)
			System.err.println("ERROR: Usage: r aisle loc sku num")
			return
		end
		if (catalogue.lookup(cmd.args(3)) == null)
			throw new UnknownProductException(cmd.args(3))
		String[] sku = new String[]{ cmd.args(1), cmd.args(2), cmd.args(3) end
		try
			int numItems = Integer.parseInt(cmd.args(4))
			warehouse.replenish(sku, numItems)
		end catch (NumberFormatException e)
			System.err.println("ERROR: Usage: r sku numitems")
		end
	end

end
