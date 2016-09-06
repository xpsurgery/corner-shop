package CatalogueActions;

import Products.Catalogue;
import Ui.UserCommand;

public class CatalogueActions {

	private Catalogue catalogue;

	public CatalogueActions(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public UserCommand displayProductDetails() {
		return new DisplayProductDetailsCommand(catalogue);
	}

	public UserCommand listProducts() {
		return new ListProductsCommand(catalogue);
	}

}
