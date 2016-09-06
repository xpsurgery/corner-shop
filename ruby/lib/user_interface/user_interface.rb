require_relative '../basket_actions/basket_actions'
require_relative '../catalogue_actions/catalogue_actions'
require_relative '../warehouse_actions/warehouse_actions'
require_relative './user_input'
require_relative './help_command'

module UserInterface

	class UserInterface

		def initialize(catalogueActions, warehouseActions, basketActions)
			@catalogueActions = catalogueActions
			@warehouseActions = warehouseActions
			@basketActions = basketActions
		end

		def start
			while 1 do
				print "shop> "
				$stdout.flush
				begin
					String line = gets
					if line.nil?
						puts
						return
					end
					line = line.strip
					unless line.empty?
						return if line[0] == 'q'
						cmd = UserInput.new(line)
						createHandler(cmd.command).run(cmd)
					end
				rescue Exception => e
					$stderr.puts "ERROR: #{e}"
				end
			end
		end

		def createHandler(command)
			case (command)
			when 'a'
				return basketActions.addToBasket
			when 'b'
				return basketActions.displayBasket
			when 'c'
				return basketActions.checkout
			when 'd'
				return catalogueActions.displayProductDetails
			when 'h'
				return HelpCommand.new
			when 'p'
				return catalogueActions.listProducts
			when 'r'
				return warehouseActions.replenishStock
			when 's'
				return warehouseActions.stockReport
			else
				return UnknownCommand.new
			end
		end

	end
end
