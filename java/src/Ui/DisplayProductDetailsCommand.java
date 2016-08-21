package Ui;

import Products.Catalogue;
import Products.Sku;

public class DisplayProductDetailsCommand implements UserCommand {

	private Catalogue catalogue;

	public DisplayProductDetailsCommand(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public void run(UserInput cmd) {
		String[] args = cmd.args;									// TODO -- error handling!
		String id = args[1];
		Sku sku = catalogue.lookup(id);								// TODO -- handle not found
		System.out.printf("%s\t%s\n\n", sku.id, sku.title);
		System.out.println(sku.description);						// TODO -- wrap free text
	}

}
