package CatalogueActions;

import Products.Catalogue;
import Products.Sku;
import Ui.UserCommand;
import Ui.UserInput;

class DisplayProductDetailsCommand implements UserCommand {

	private Catalogue catalogue;

	DisplayProductDetailsCommand(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public void run(UserInput cmd) {
		String id = cmd.args(1);
		if (id == null || cmd.args.length != 2) {
			System.err.println("ERROR: Usage: d sku");
			return;
		}
		Sku sku = catalogue.lookup(id);
		if (sku == null)
			System.err.println("ERROR: product code " + id + " not found");
		else {
			System.out.printf("%s\t%s\t£%5.02f\n\n", sku.code[2], sku.title, sku.price / 100.0);
			for (String line : sku.description())
				System.out.println(line);
		}
	}

}
