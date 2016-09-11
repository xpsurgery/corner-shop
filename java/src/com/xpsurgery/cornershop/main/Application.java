package com.xpsurgery.cornershop.main;

import java.io.PrintStream;

import com.xpsurgery.cornershop.basket.Basket;
import com.xpsurgery.cornershop.basketActions.BasketActions;
import com.xpsurgery.cornershop.catalogueActions.CatalogueActions;
import com.xpsurgery.cornershop.filestore.CatalogueReader;
import com.xpsurgery.cornershop.filestore.WarehouseReader;
import com.xpsurgery.cornershop.products.Catalogue;
import com.xpsurgery.cornershop.ui.UserInterface;
import com.xpsurgery.cornershop.warehouse.Warehouse;
import com.xpsurgery.cornershop.warehouseActions.WarehouseActions;

public class Application {

	public static void main(String[] args) {
		displayWelcomeMessage(System.out);
		Warehouse warehouse = Warehouse.fromFile(new WarehouseReader("../warehouse.dat"));
		Catalogue catalogue = Catalogue.fromFile(new CatalogueReader("../catalogue.dat"));
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
