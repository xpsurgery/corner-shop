require_relative './help_command'
require_relative './unknown_command'
require_relative './user_input'

module UserInterface

	class UserInterface

		def initialize(catalogue_actions, warehouse_actions, basket_actions)
			@catalogue_actions = catalogue_actions
			@warehouse_actions = warehouse_actions
			@basket_actions = basket_actions
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
				return @basket_actions.add_to_basket
			when 'b'
				return @basket_actions.display_basket
			when 'c'
				return @basket_actions.checkout
			when 'd'
				return @catalogue_actions.display_product_details
			when 'h'
				return HelpCommand.new
			when 'p'
				return @catalogue_actions.list_products
			when 'r'
				return @warehouse_actions.replenish_stock
			when 's'
				return @warehouse_actions.stock_report
			else
				return UnknownCommand.new
			end
		end

	end
end
