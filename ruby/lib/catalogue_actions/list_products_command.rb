module CatalogueActions

require_relative Products.Catalogue
require_relative Ui.UserCommand
require_relative Ui.UserInput

class ListProductsCommand implements UserCommand

	private Catalogue catalogue

	ListProductsCommand(Catalogue catalogue)
		this.catalogue = catalogue
	end

	@Override
	public void run(UserInput cmd)
		catalogue.list(System.out)
	end

end
