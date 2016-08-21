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
				UserInput cmd = new UserInput(line);
				switch (cmd.command) {
				case 'a':
					new AddToBasketCommand(basket).run(cmd);
					break;
				case 'b':
					new DisplayBasketCommand(basket).run(cmd);
					break;
				case 'c':
					new CheckoutCommand(basket, warehouse).run(cmd);
					break;
				case 'd':
					new DisplayProductDetailsCommand(catalogue).run(cmd);
					break;
				case 'h':
					new HelpCommand(System.out).run(cmd);
					break;
				case 'p':
					new ListProductsCommand(catalogue).run(cmd);
					break;
				case 'q':
					return;
				case 'r':
					new ReplenishStockCommand(warehouse).run(cmd);
					break;
				case 's':
					new StockReportCommand(warehouse).run(cmd);
					break;
				default:
					new UnknownCommand().run(cmd);
					break;
				}
			} catch (IOException e) {
			}
		}
		System.out.println();
	}

}
