namespace CatalogueActions {

using System;
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
			Console.WriteLine("ERROR: Usage: d sku");
			return;
		}
		Sku sku = catalogue.lookup(id);
		if (sku == null)
			Console.WriteLine("ERROR: product code " + id + " not found");
		else {
			Console.WriteLine("{0}\t{1}\t£{2,5:F2}", sku.code[2], sku.title, sku.price / 100.0);
			Console.WriteLine();
			foreach (string line in sku.Description())
				Console.WriteLine(line);
		}
	}

}
}