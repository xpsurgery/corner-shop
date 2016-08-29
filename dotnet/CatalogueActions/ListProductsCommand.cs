using Products.Catalogue;
using Ui.UserCommand;
using Ui.UserInput;

namespace CatalogueActions {

class ListProductsCommand : UserCommand {

	private Catalogue catalogue;

	ListProductsCommand(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public void run(UserInput cmd) {
		catalogue.list(System.out);
	}

}
}