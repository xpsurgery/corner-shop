namespace Ui {

using BasketActions;
using CatalogueActions;
using WarehouseActions;

public class UserInterface {

	private BufferedReader instr;
	private CatalogueActions catalogueActions;
	private WarehouseActions warehouseActions;
	private BasketActions basketActions;

	public UserInterface(InputStream input, CatalogueActions catalogueActions, WarehouseActions warehouseActions, BasketActions basketActions) {
		this.catalogueActions = catalogueActions;
		this.warehouseActions = warehouseActions;
		this.basketActions = basketActions;
		instr = new BufferedReader(new InputStreamReader(input));
	}

	public void start() {
		for (;;) {
			System.out.print("shop> ");
			try {
				string line = instr.readLine();
				if (line == null) {
					System.out.println();
					return;
				}
				line = line.Trim();
				if (line.Length == 0)
					continue;
				if (line[0] == 'q')
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