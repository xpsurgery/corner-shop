require_relative '../products/catalogue'
require_relative '../user_interface/user_command'

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
