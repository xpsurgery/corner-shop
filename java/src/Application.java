import java.io.PrintStream;

import Basket.Basket;
import BasketActions.BasketActions;
import CatalogueActions.CatalogueActions;
import Products.Catalogue;
import Ui.UserInterface;
import Warehouse.Warehouse;
import WarehouseActions.WarehouseActions;

public class Application {

	public static void main(String[] args) {
		displayWelcomeMessage(System.out);
		Warehouse warehouse = new Warehouse();
		Catalogue catalogue = new Catalogue();
		Basket basket = new Basket();
		new UserInterface(System.in, new CatalogueActions(catalogue), new WarehouseActions(warehouse), new BasketActions(basket, catalogue, warehouse)).start();
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
