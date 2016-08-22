package Ui;

import Products.Catalogue;
import Products.Sku;

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
			System.out.printf("%s\t%s\n\n", sku.id, sku.title);
			for (String line : sku.description())
				System.out.println(line);
		}
	}

}
