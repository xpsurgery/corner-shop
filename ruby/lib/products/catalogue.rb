require_relative '../filestore/catalogue_reader'

module Products

	class Catalogue

		class << self

			def fromFile(catalogueReader)
				products = []
				lines = catalogueReader.readAll
				lines.each do |line|
					Sku sku = Sku.new([ line[0], line[1], line[2] ], line[3], line[4], Integer.parseInt(line[5]))
					products.add(sku)
				end
				return Catalogue.new(products)
			end

		end

		def initialize(products)
			@products = products
		end

		def list(out)
			sortedSkus.each do |sku|
				out.printf("%s\t%dp\t%s\n", sku.code[2], sku.price, sku.title)
			end
			out.println
			out.println("10% discount on orders over £20.00!")
		end

		def lookup(id)
			@products.each do |sku|
				if (sku.code[2].equals(id))
					return sku
				end
			end
			nil
		end

		def lookupCode(sku)
			@products.each do |s|
				if (s.code[2].equals(sku))
					return s.code
				end
			end
			nil
		end

		private

		def sortedSkus
			@products.sort
		end

	end
end
