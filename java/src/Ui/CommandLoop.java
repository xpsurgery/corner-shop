package Ui;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import Basket.Basket;
import Products.Catalogue;
import Warehouse.Warehouse;

public class CommandLoop {

	private BufferedReader in;
	private Warehouse warehouse;
	private Catalogue catalogue;
	private Basket basket;

	public CommandLoop(InputStream input, Warehouse warehouse, Catalogue catalogue, Basket basket) {
		this.warehouse = warehouse;
		this.catalogue = catalogue;
		this.basket = basket;
		in = new BufferedReader(new InputStreamReader(input));
	}

	public void run() {
		for (;;) {
			System.out.print("shop> ");
			try {
				String line = in.readLine();
				if (line == null) {
					System.out.println();
					return;
				}
				line = line.trim();
				if (line.equals(""))
					continue;
				if (line.charAt(0) == 'q')
					return;
				UserInput cmd = new UserInput(line);
				createHandler(catalogue, warehouse, basket, cmd.command).run(cmd);
			} catch (IOException e) {
			} catch (RuntimeException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	private UserCommand createHandler(Catalogue catalogue, Warehouse warehouse, Basket basket, char command) {
		switch (command) {
		case 'a':
			return new AddToBasketCommand(basket, warehouse);
		case 'b':
			return new DisplayBasketCommand(basket);
		case 'c':
			return new CheckoutCommand(basket, warehouse);
		case 'd':
			return new DisplayProductDetailsCommand(catalogue);
		case 'h':
			return new HelpCommand(System.out);
		case 'p':
			return new ListProductsCommand(catalogue);
		case 'r':
			return new ReplenishStockCommand(warehouse);
		case 's':
			return new StockReportCommand(warehouse);
		default:
			return new UnknownCommand();
		}
	}

}
