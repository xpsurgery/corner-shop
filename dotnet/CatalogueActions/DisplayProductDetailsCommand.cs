namespace CatalogueActions {

using Products;
using Ui;

class DisplayProductDetailsCommand : UserCommand {

	private Catalogue catalogue;

	internal DisplayProductDetailsCommand(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public void run(UserInput cmd) {
		string id = cmd.Args(1);
		if (id == null || cmd.args.Length != 2) {
			System.err.println("ERROR: Usage: d sku");
			return;
		}
		Sku sku = catalogue.lookup(id);
		if (sku == null)
			System.err.println("ERROR: product code " + id + " not found");
		else {
			System.out.printf("%s\t%s\t£%5.02f\n\n", sku.code[2], sku.title, sku.price / 100.0);
			foreach (string line in sku.description())
				System.out.println(line);
		}
	}

}
}