import java.io.PrintStream;

import Basket.Basket;
import Products.Catalogue;
import Ui.CommandLoop;
import Warehouse.Warehouse;

public class Application {

	public static void main(String[] args) {
		displayWelcomeMessage(System.out);
		Warehouse warehouse = new Warehouse();
		Catalogue catalogue = new Catalogue();
		Basket basket = new Basket();
		new CommandLoop(System.in, warehouse, catalogue, basket).run();
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
