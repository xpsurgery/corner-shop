namespace Ui {

	using System;

class HelpCommand : UserCommand {

	public void run(UserInput cmd) {
		Console.WriteLine("Customer actions:");
		Console.WriteLine("  a sku [num]             Add SKU to basket; num defaults to 1");
		Console.WriteLine("  b                       List basket contents");
		Console.WriteLine("  c                       Checkout");
		Console.WriteLine("  d sku                   Show detailed product info for SKU");
		Console.WriteLine("  p                       List all products");
		Console.WriteLine();
		Console.WriteLine("Warehouse actions:");
		Console.WriteLine("  r aisle loc sku num     Replenish SKU with num additional units");
		Console.WriteLine("  s                       Show stock levels");
		Console.WriteLine();
		Console.WriteLine("General:");
		Console.WriteLine("  h                       Show this help");
		Console.WriteLine("  q                       Quit");
	}

}
}