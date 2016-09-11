require_relative './display_product_details_command'
require_relative './list_products_command'

module CatalogueActions

	class CatalogueActions

		def initialize(catalogue)
			@catalogue = catalogue
		end

		def display_product_details
			DisplayProductDetailsCommand.new(@catalogue)
		end

		def list_products
			ListProductsCommand.new(@catalogue)
		end

	end
end
