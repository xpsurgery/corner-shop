#! /usr/bin/env ruby

require_relative '../lib/basket/basket'
require_relative '../lib/basket_actions/basket_actions'
require_relative '../lib/catalogue_actions/catalogue_actions'
require_relative '../lib/filestore/catalogue_reader'
require_relative '../lib/filestore/warehouse_reader'
require_relative '../lib/products/catalogue'
require_relative '../lib/user_interface/user_interface'
require_relative '../lib/warehouse/warehouse'
require_relative '../lib/warehouse_actions/warehouse_actions'

class Application

	class << self

		def main(args)
			displayWelcomeMessage
			warehouse = Warehouse::Warehouse.from_file(Filestore::WarehouseReader.new("../warehouse.dat"))
			catalogue = Products::Catalogue.from_file(Filestore::CatalogueReader.new("../catalogue.dat"))
			basket = Basket::Basket.new
			catalogueActions = CatalogueActions::CatalogueActions.new(catalogue)
			warehouseActions = WarehouseActions::WarehouseActions.new(warehouse, catalogue)
			basketActions = BasketActions::BasketActions.new(basket, catalogue, warehouse)
			UserInterface::UserInterface.new(catalogueActions, warehouseActions, basketActions).start
			displayGoodbyeMessage
			exit 0
		end

		private

		def displayGoodbyeMessage
			puts
			puts "Goodbye. Thanks for your custom!"
			puts
		end

		def displayWelcomeMessage
			puts "Welcome to our little corner shop!"
			puts
			puts "For help, type 'h' or 'help' or '?'"
			puts
		end
	end

end

Application.main $*
