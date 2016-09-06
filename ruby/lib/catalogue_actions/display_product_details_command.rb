module CatalogueActions

require_relative Products.Catalogue
require_relative Products.Sku
require_relative Ui.UserCommand
require_relative Ui.UserInput

class DisplayProductDetailsCommand implements UserCommand

	private Catalogue catalogue

	DisplayProductDetailsCommand(Catalogue catalogue)
		this.catalogue = catalogue
	end

	public void run(UserInput cmd)
		String id = cmd.args(1)
		if (id == null || cmd.args.length != 2)
			System.err.println("ERROR: Usage: d sku")
			return
		end
		Sku sku = catalogue.lookup(id)
		if (sku == null)
			System.err.println("ERROR: product code " + id + " not found")
		else
			System.out.printf("%s\t%s\t£%5.02f\n\n", sku.code[2], sku.title, sku.price / 100.0)
			for (String line : sku.description)
				System.out.println(line)
		end
	end

end
