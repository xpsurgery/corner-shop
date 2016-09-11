package com.xpsurgery.cornershop.catalogueActions;

import com.xpsurgery.cornershop.products.Catalogue;
import com.xpsurgery.cornershop.ui.UserCommand;
import com.xpsurgery.cornershop.ui.UserInput;

class ListProductsCommand implements UserCommand {

	private Catalogue catalogue;

	ListProductsCommand(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	@Override
	public void run(UserInput cmd) {
		catalogue.list(System.out);
	}

}
