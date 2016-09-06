module Ui

require_relative java.io.BufferedReader
require_relative java.io.IOException
require_relative java.io.InputStream
require_relative java.io.InputStreamReader

require_relative BasketActions.BasketActions
require_relative CatalogueActions.CatalogueActions
require_relative WarehouseActions.WarehouseActions

public class UserInterface

	private BufferedReader in
	private CatalogueActions catalogueActions
	private WarehouseActions warehouseActions
	private BasketActions basketActions

	public UserInterface(InputStream input, CatalogueActions catalogueActions, WarehouseActions warehouseActions, BasketActions basketActions)
		this.catalogueActions = catalogueActions
		this.warehouseActions = warehouseActions
		this.basketActions = basketActions
		in = new BufferedReader(new InputStreamReader(input))
	end

	public void start
		for (;;)
			System.out.print("shop> ")
			try
				String line = in.readLine
				if (line == null)
					System.out.println
					return
				end
				line = line.trim
				if (line.equals(""))
					continue
				if (line.charAt(0) == 'q')
					return
				UserInput cmd = new UserInput(line)
				createHandler(cmd.command).run(cmd)
			end catch (IOException e)
			end catch (RuntimeException e)
				System.err.println("ERROR: " + e.getMessage)
			end
		end
	end

	private UserCommand createHandler(char command)
		switch (command)
		case 'a':
			return basketActions.addToBasket
		case 'b':
			return basketActions.displayBasket
		case 'c':
			return basketActions.checkout
		case 'd':
			return catalogueActions.displayProductDetails
		case 'h':
			return new HelpCommand(System.out)
		case 'p':
			return catalogueActions.listProducts
		case 'r':
			return warehouseActions.replenishStock
		case 's':
			return warehouseActions.stockReport
		default:
			return new UnknownCommand
		end
	end

end
