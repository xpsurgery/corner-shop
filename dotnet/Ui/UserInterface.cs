namespace Ui {

using System;
using System.IO;
using BasketActions;
using CatalogueActions;
using WarehouseActions;

public class UserInterface {

	private CatalogueActions catalogueActions;
	private WarehouseActions warehouseActions;
	private BasketActions basketActions;

	public UserInterface(CatalogueActions catalogueActions, WarehouseActions warehouseActions, BasketActions basketActions) {
		this.catalogueActions = catalogueActions;
		this.warehouseActions = warehouseActions;
		this.basketActions = basketActions;
	}

	public void start() {
		for (;;) {
			Console.Write("shop> ");
			try {
				string line = Console.ReadLine();
				if (line == null) {
					Console.WriteLine();
					return;
				}
				line = line.Trim();
				if (line.Length == 0)
					continue;
				if (line[0] == 'q')
					return;
				UserInput cmd = new UserInput(line);
				createHandler(cmd.command).run(cmd);
			} catch (IOException e) {
			} catch (Exception e) {
				Console.WriteLine("ERROR: " + e.Message);
			}
		}
	}

	private UserCommand createHandler(char command) {
		switch (command) {
		case 'a':
			return basketActions.addToBasket();
		case 'b':
			return basketActions.displayBasket();
		case 'c':
			return basketActions.checkout();
		case 'd':
			return catalogueActions.displayProductDetails();
		case 'h':
			return new HelpCommand();
		case 'p':
			return catalogueActions.listProducts();
		case 'r':
			return warehouseActions.replenishStock();
		case 's':
			return warehouseActions.stockReport();
		default:
			return new UnknownCommand();
		}
	}

}
}