require_relative './help_command'
require_relative './unknown_command'
require_relative './user_input'

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
				rescue StandardError => e
					$stderr.puts "ERROR: #{e}"
				end
			end
		end

		def createHandler(command)
			case (command)
			when 'a'
				return @basketActions.addToBasket
			when 'b'
				return @basketActions.displayBasket
			when 'c'
				return @basketActions.checkout
			when 'd'
				return @catalogueActions.displayProductDetails
			when 'h'
				return HelpCommand.new
			when 'p'
				return @catalogueActions.listProducts
			when 'r'
				return @warehouseActions.replenish_stock
			when 's'
				return @warehouseActions.stock_report
			else
				return UnknownCommand.new
			end
		end

	end
end
