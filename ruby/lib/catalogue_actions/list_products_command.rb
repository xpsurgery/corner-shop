require_relative '../products/catalogue'
require_relative '../user_interface/user_input'

module CatalogueActions

  class ListProductsCommand

  	def initialize(catalogue)
  		@catalogue = catalogue
  	end

  	def run(cmd)
  		@catalogue.list($stdout)
  	end

  end
end
