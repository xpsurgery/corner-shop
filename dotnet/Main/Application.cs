using java.io.PrintStream;

using Basket.Basket;
using BasketActions.BasketActions;
using CatalogueActions.CatalogueActions;
using Filestore.CatalogueReader;
using Filestore.WarehouseReader;
using Products.Catalogue;
using Ui.UserInterface;
using Warehouse.Warehouse;
using WarehouseActions.WarehouseActions;

namespace Main {

public class Application {

	public static void main(string[] args) {
		displayWelcomeMessage(System.out);
		Warehouse warehouse = Warehouse.fromFile(new WarehouseReader("./warehouse.dat"));
		Catalogue catalogue = Catalogue.fromFile(new CatalogueReader("./catalogue.dat"));
		Basket basket = new Basket();
		CatalogueActions catalogueActions = new CatalogueActions(catalogue);
		WarehouseActions warehouseActions = new WarehouseActions(warehouse, catalogue);
		BasketActions basketActions = new BasketActions(basket, catalogue, warehouse);
		new UserInterface(System.in, catalogueActions, warehouseActions, basketActions).start();
		displayGoodbyeMessage();
		System.exit(0);
	}

	private static void displayGoodbyeMessage() {
		System.out.println();
		System.out.println("Goodbye. Thanks for your custom!");
		System.out.println();
	}

	private static void displayWelcomeMessage(PrintStream out) {
		out.println("Welcome to our little corner shop!");
		out.println();
		out.println("For help, type 'h' or 'help' or '?'");
		out.println();
	}

}
}