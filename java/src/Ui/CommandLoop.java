package Ui;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;

import Basket.Basket;
import Products.Catalogue;
import Products.Sku;
import Warehouse.Warehouse;

public class CommandLoop {

	private BufferedReader in;

	public CommandLoop(InputStream input) {
		in = new BufferedReader(new InputStreamReader(input));
	}

	public void run() {
		Catalogue catalogue = new Catalogue();
		Warehouse warehouse = new Warehouse();
		Basket basket = new Basket();
		for (;;) {
			System.out.print("shop> ");
			try {
				String line = in.readLine();
				if (line == null)
					break;
				if (line.equals(""))
					continue;
				char command = line.charAt(0);
				switch (command) {
				case 'a':
					addToBasket(basket, line);
					break;
				case 'b':
					basket.list(System.out);
					break;
				case 'c':
					checkout(basket, warehouse);
					break;
				case 'd':
					showDescription(catalogue, line);
					break;
				case 'h':
					printHelp(System.out);
					break;
				case 'p':
					catalogue.list(System.out);							// TODO -- filter/search
					break;
				case 'q':
					return;
				case 'r':
					replenish(warehouse, line);
					break;
				case 's':
					warehouse.stockReport(System.out);
					break;
				default:
					System.out.println("Type h or ? for help");
					break;
				}
			} catch (IOException e) {
			}
		}
		System.out.println();
	}

	private void checkout(Basket basket, Warehouse warehouse) {
		basket.checkout(warehouse);
	}

	private void addToBasket(Basket basket, String line) {
		String[] args = line.split(" ");					// TODO -- error handling!
		String sku = args[1];								// TODO -- add more than one item
		basket.add(sku);
	}

	private void replenish(Warehouse warehouse, String line) {
		String[] args = line.split(" ");					// TODO -- error handling!
		String sku = args[1];
		int numItems = Integer.parseInt(args[2]);
		warehouse.replenish(sku, numItems);
	}

	private void showDescription(Catalogue catalogue, String line) {
		String[] args = line.split(" ");							// TODO -- error handling!
		String id = args[1];
		Sku sku = catalogue.lookup(id);								// TODO -- handle not found
		System.out.printf("%s\t%s\n\n", sku.id, sku.title);
		System.out.println(sku.description);						// TODO -- wrap free text
	}

	private static void printHelp(PrintStream out) {
		out.println("a sku [num]   Add SKU to basket; num defaults to 1");
		out.println("b             List basket contents");
		out.println("c             Checkout");
		out.println("d sku         Show detailed product info for SKU");
		out.println("h             Show this help");
		out.println("p [filter]    List products (matching filter)");
		out.println("q             Quit");
		out.println("r sku num     Replenish SKU with num additional units");
		out.println("s             Show stock levels");
	}

}
