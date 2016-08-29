namespace Ui {

using BasketActions;
using CatalogueActions;
using WarehouseActions;

public class UserInterface {

	private BufferedReader in;
	private CatalogueActions catalogueActions;
	private WarehouseActions warehouseActions;
	private BasketActions basketActions;

	public UserInterface(InputStream input, CatalogueActions catalogueActions, WarehouseActions warehouseActions, BasketActions basketActions) {
		this.catalogueActions = catalogueActions;
		this.warehouseActions = warehouseActions;
		this.basketActions = basketActions;
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
				createHandler(cmd.command).run(cmd);
			} catch (IOException e) {
			} catch (RuntimeException e) {
				System.err.println("ERROR: " + e.getMessage());
			}
		}
	}

	private UserCommand createHandler(char command) {
		switch (command) {
		case 'a':
			return basketActions.addToBasket();
		case 'b':
			return basketActions.displayBasket();
		case 'c':
			return basketActions.checkout();
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
}