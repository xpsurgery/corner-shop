require_relative '../products/catalogue'
require_relative './display_product_details_command'
require_relative './list_products_command'

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
