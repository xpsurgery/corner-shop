module CatalogueActions

require_relative Products.Catalogue
require_relative Ui.UserCommand

public class CatalogueActions

	private Catalogue catalogue

	public CatalogueActions(Catalogue catalogue)
		this.catalogue = catalogue
	end

	public UserCommand displayProductDetails
		return new DisplayProductDetailsCommand(catalogue)
	end

	public UserCommand listProducts
		return new ListProductsCommand(catalogue)
	end

end
