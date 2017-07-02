namespace CatalogueActions {

	using Products;
	using Ui;

	public class CatalogueActions {

		private Catalogue catalogue;

		public CatalogueActions(Catalogue catalogue) {
			this.catalogue = catalogue;
		}

		public UserCommand DisplayProductDetails() {
			return new DisplayProductDetailsCommand(catalogue);
		}

		public UserCommand ListProducts() {
			return new ListProductsCommand(catalogue);
		}

	}
}