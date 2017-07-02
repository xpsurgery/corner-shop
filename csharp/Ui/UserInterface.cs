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

	public void Start() {
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
				CreateHandler(cmd.command).Run(cmd);
			} catch (IOException) {
			} catch (Exception e) {
				Console.WriteLine("ERROR: " + e.Message);
			}
		}
	}

	private UserCommand CreateHandler(char command) {
		switch (command) {
		case 'a':
			return basketActions.AddToBasket();
		case 'b':
			return basketActions.DisplayBasket();
		case 'c':
			return basketActions.Checkout();
		case 'd':
			return catalogueActions.DisplayProductDetails();
		case 'h':
			return new HelpCommand();
		case 'p':
			return catalogueActions.ListProducts();
		case 'r':
			return warehouseActions.ReplenishStock();
		case 's':
			return warehouseActions.StockReport();
		default:
			return new UnknownCommand();
		}
	}

}
}