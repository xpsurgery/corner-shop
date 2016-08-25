package CatalogueActions;

import Products.Catalogue;
import Ui.UserCommand;
import Ui.UserInput;

class ListProductsCommand implements UserCommand {

	private Catalogue catalogue;

	ListProductsCommand(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	@Override
	public void run(UserInput cmd) {
		catalogue.list(System.out);
	}														// TODO -- show which items are out of stock

}
