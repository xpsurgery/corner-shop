package Ui;

import Products.Catalogue;

public class ListProductsCommand {

	private Catalogue catalogue;

	public ListProductsCommand(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public void run(UserInput cmd) {
		catalogue.list(System.out);							// TODO -- filter/search
	}

}
