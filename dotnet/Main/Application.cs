package Main;

import java.io.PrintStream;

import Basket.Basket;
import BasketActions.BasketActions;
import CatalogueActions.CatalogueActions;
import Filestore.CatalogueReader;
import Filestore.WarehouseReader;
import Products.Catalogue;
import Ui.UserInterface;
import Warehouse.Warehouse;
import WarehouseActions.WarehouseActions;

public class Application {

	public static void main(String[] args) {
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
