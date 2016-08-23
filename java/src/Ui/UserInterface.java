package Ui;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import Basket.Basket;
import Products.Catalogue;
import Warehouse.Warehouse;
import WarehouseActions.WarehouseActions;
import CatalogueActions.CatalogueActions;

public class UserInterface {

	private BufferedReader in;
	private Warehouse warehouse;
	private Catalogue catalogue;
	private Basket basket;
	private CatalogueActions catalogueActions;
	private WarehouseActions warehouseActions;

	public UserInterface(InputStream input, Warehouse warehouse, Catalogue catalogue, Basket basket, CatalogueActions catalogueActions, WarehouseActions warehouseActions) {
		this.warehouse = warehouse;
		this.catalogue = catalogue;
		this.basket = basket;
		this.catalogueActions = catalogueActions;
		this.warehouseActions = warehouseActions;
		in = new BufferedReader(new InputStreamReader(input));
	}

	public void start() {
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
				System.err.println("ERROR: " + e.getMessage());
			}
		}
	}

	private UserCommand createHandler(Catalogue catalogue, Warehouse warehouse, Basket basket, char command) {
		switch (command) {																// TODO -- price changes
		case 'a':
			return new AddToBasketCommand(basket, catalogue, warehouse);
		case 'b':
			return new DisplayBasketCommand(basket);
		case 'c':
			return new CheckoutCommand(basket, warehouse);
		case 'd':
			return catalogueActions.displayProductDetails();
		case 'h':
			return new HelpCommand(System.out);
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
