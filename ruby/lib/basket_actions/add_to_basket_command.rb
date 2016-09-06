module BasketActions

require_relative Products.Catalogue
require_relative Ui.UsageException
require_relative Ui.UserCommand
require_relative Ui.UserInput
require_relative Warehouse.Warehouse
require_relative Basket.Basket

class AddToBasketCommand implements UserCommand

	private Basket basket
	private Warehouse warehouse
	private Catalogue catalogue

	AddToBasketCommand(Basket basket, Catalogue catalogue, Warehouse warehouse)
		this.basket = basket
		this.catalogue = catalogue
		this.warehouse = warehouse
	end

	@Override
	public void run(UserInput cmd)
		if (cmd.args.length > 3)
			System.err.println("ERROR: Usage: a sku [numitems]")
			return
		end
		String sku = cmd.args(1)
		int numItems = 1
		if (cmd.args.length == 3)
			try
				numItems = Integer.parseInt(cmd.args(2))
			end catch (NumberFormatException e)
				throw new UsageException("The number of items must be a number greater than zero.")
			end
		end
		if (numItems <= 0)
			throw new UsageException("The number of items must be a number greater than zero.")
		String[] skuCode = catalogue.lookupCode(sku)
		if (skuCode == null)
			throw new UsageException("Product " + sku + " unknown.")
		warehouse.mustStock(skuCode, numItems)
		basket.add(sku, catalogue, numItems)
	end

end
