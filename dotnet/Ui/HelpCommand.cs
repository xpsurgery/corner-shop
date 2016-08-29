namespace Ui {

class HelpCommand : UserCommand {

	private PrintStream str;

	HelpCommand(PrintStream str) {
		this.str = str;
	}

	public void run(UserInput cmd) {
		str.println("Customer actions:");
		str.println("  a sku [num]             Add SKU to basket; num defaults to 1");
		str.println("  b                       List basket contents");
		str.println("  c                       Checkout");
		str.println("  d sku                   Show detailed product info for SKU");
		str.println("  p                       List all products");
		str.println();
		str.println("Warehouse actions:");
		str.println("  r aisle loc sku num     Replenish SKU with num additional units");
		str.println("  s                       Show stock levels");
		str.println();
		str.println("General:");
		str.println("  h                       Show this help");
		str.println("  q                       Quit");
	}

}
}