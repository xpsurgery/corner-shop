namespace BasketActions {

	using System;
	using Products;
	using Ui;
	using Warehouse;
	using Basket;

	class AddToBasketCommand : UserCommand {

		private Basket basket;
		private Warehouse warehouse;
		private Catalogue catalogue;

		internal AddToBasketCommand(Basket basket, Catalogue catalogue, Warehouse warehouse) {
			this.basket = basket;
			this.catalogue = catalogue;
			this.warehouse = warehouse;
		}

		public void Run(UserInput cmd) {
			if (cmd.args.Length > 3 || cmd.args.Length < 2) {
				Console.WriteLine("ERROR: Usage: a sku [numitems]");
				return;
			}
			string sku = cmd.Args(1);
			int numItems = 1;
			if (cmd.args.Length == 3) {
				try {
					numItems = int.Parse(cmd.Args(2));
				} catch (FormatException) {
					throw new UsageException("The number of items must be a number greater than zero.");
				}
			}
			if (numItems <= 0)
				throw new UsageException("The number of items must be a number greater than zero.");
			string[] skuCode = catalogue.LookupCode(sku);
			if (skuCode == null)
				throw new UsageException("Product " + sku + " unknown.");
			warehouse.MustStock(skuCode, numItems);
			basket.Add(sku, catalogue, numItems);
		}

	}
}
