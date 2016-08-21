package Ui;

import Products.Catalogue;

class ListProductsCommand implements UserCommand {

	private Catalogue catalogue;

	ListProductsCommand(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public void run(UserInput cmd) {
		catalogue.list(System.out);							// TODO -- filter/search
	}

}
