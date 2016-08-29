package Ui;

import java.io.PrintStream;

class HelpCommand implements UserCommand {

	private PrintStream out;

	HelpCommand(PrintStream out) {
		this.out = out;
	}

	public void run(UserInput cmd) {
		out.println("Customer actions:");
		out.println("  a sku [num]             Add SKU to basket; num defaults to 1");
		out.println("  b                       List basket contents");
		out.println("  c                       Checkout");
		out.println("  d sku                   Show detailed product info for SKU");
		out.println("  p                       List all products");
		out.println();
		out.println("Warehouse actions:");
		out.println("  r aisle loc sku num     Replenish SKU with num additional units");
		out.println("  s                       Show stock levels");
		out.println();
		out.println("General:");
		out.println("  h                       Show this help");
		out.println("  q                       Quit");
	}

}
