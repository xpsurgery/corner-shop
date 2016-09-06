require_relative '../basket_actions/basket_actions'
require_relative '../catalogue_actions/catalogue_actions'
require_relative '../warehouse_actions/warehouse_actions'

module Ui

	class UserInterface

		def initialize(catalogueActions, warehouseActions, basketActions)
			@catalogueActions = catalogueActions
			@warehouseActions = warehouseActions
			@basketActions = basketActions
			# @in = BufferedReader.new(new InputStreamReader(input))
		end

		def start
			# for (;;)
			# 	System.out.print("shop> ")
			# 	begin
			# 		String line = in.readLine
			# 		if (line == null)
			# 			System.out.println
			# 			return
			# 		end
			# 		line = line.trim
			# 		if (line.equals(""))
			# 			continue
			# 		if (line.charAt(0) == 'q')
			# 			return
			# 		UserInput cmd = new UserInput(line)
			# 		createHandler(cmd.command).run(cmd)
			# 	end catch (IOException e)
			# 	end catch (RuntimeException e)
			# 		System.err.println("ERROR: " + e.getMessage)
			# 	end
			# end
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
				return new HelpCommand(System.out)
			when 'p'
				return catalogueActions.listProducts
			when 'r'
				return warehouseActions.replenishStock
			when 's'
				return warehouseActions.stockReport
			else
				return new UnknownCommand
			end
		end

	end
end
