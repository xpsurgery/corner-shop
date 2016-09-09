module CatalogueActions

	class DisplayProductDetailsCommand

		def initialize(catalogue)
			@catalogue = catalogue
		end

		def run(cmd)
			id = cmd.arg(1)
			if id.nil? || cmd.args.length != 2
				$stderr.puts "ERROR: Usage: d sku"
				return
			end
			sku = @catalogue.lookup(id)
			if sku.nil?
				$stderr.puts "ERROR: product code #{id} not found"
			else
				printf("%s\t%s\t£%5.02f\n\n", sku.code[2], sku.title, sku.price / 100.0)
				sku.description.each do |line|
					puts line
				end
			end
		end

	end
end
