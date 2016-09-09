require_relative './sku'

module Products

	class Catalogue

		class << self

			def from_file(catalogueReader)
				products = catalogueReader.readAll.map { |line|
					Sku.new([ line[0], line[1], line[2] ], line[3], line[4], Integer(line[5]))
				}
				Catalogue.new(products)
			end

		end

		def initialize(products)
			@products = products
		end

		def list(out)
			sorted_skus.each do |sku|
				out.printf("%s\t%dp\t%s\n", sku.code[2], sku.price, sku.title)
			end
			out.puts
			out.puts "10% discount on orders over £20.00!"
		end

		def lookup(id)
			@products.each do |sku|											# TODO -- select
				return sku if sku.code[2] == id
			end
			nil
		end

		def lookup_code(sku)
			@products.each do |s|												# TODO -- select
				return s.code if s.code[2] == sku
			end
			nil
		end

		private

		def sorted_skus
			@products.sort
		end

	end
end
