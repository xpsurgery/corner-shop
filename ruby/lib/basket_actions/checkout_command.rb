module BasketActions

require_relative Basket.Basket
require_relative Ui.UserCommand
require_relative Ui.UserInput
require_relative Warehouse.Warehouse

class CheckoutCommand implements UserCommand

	private Basket basket
	private Warehouse warehouse

	CheckoutCommand(Basket basket, Warehouse warehouse)
		this.basket = basket
		this.warehouse = warehouse
	end

	@Override
	public void run(UserInput cmd)
		basket.checkout(warehouse)
	end

end
