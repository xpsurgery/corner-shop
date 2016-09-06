require_relative '../products/catalogue'
require_relative '../products/sku'
require_relative '../user_interface/user_input'

module CatalogueActions

	class DisplayProductDetailsCommand

		def initialize(catalogue)
			@catalogue = catalogue
		end

		def run(cmd)
			String id = cmd.args(1)
			if (id == null || cmd.args.length != 2)
				System.err.println("ERROR: Usage: d sku")
				return
			end
			Sku sku = @catalogue.lookup(id)
			if (sku == null)
				System.err.println("ERROR: product code " + id + " not found")
			else
				System.out.printf("%s\t%s\t£%5.02f\n\n", sku.code[2], sku.title, sku.price / 100.0)
				for (String line : sku.description)
					System.out.println(line)
			end
		end

	end
end
