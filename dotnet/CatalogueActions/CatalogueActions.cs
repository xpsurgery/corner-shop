namespace CatalogueActions {

using Products;
using Ui;

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
}