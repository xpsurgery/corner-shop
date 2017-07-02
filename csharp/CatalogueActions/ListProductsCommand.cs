namespace CatalogueActions {

	using Products;
	using Ui;

	class ListProductsCommand : UserCommand {

		private Catalogue catalogue;

		internal ListProductsCommand(Catalogue catalogue) {
			this.catalogue = catalogue;
		}

		public void Run(UserInput cmd) {
			catalogue.List();
		}

	}
}