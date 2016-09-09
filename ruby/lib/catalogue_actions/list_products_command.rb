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
