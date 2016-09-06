require_relative '../products/catalogue'

module CatalogueActions

	class CatalogueActions

		def initialize(catalogue)
			@catalogue = catalogue
		end

		def displayProductDetails
			DisplayProductDetailsCommand.new(@catalogue)
		end

		def listProducts
			ListProductsCommand.new(@catalogue)
		end

	end
end
