module BasketActions

require_relative Basket.Basket
require_relative Products.Catalogue
require_relative Ui.UserCommand
require_relative Warehouse.Warehouse

public class BasketActions

	private Basket basket
	private Catalogue catalogue
	private Warehouse warehouse

	public BasketActions(Basket basket, Catalogue catalogue, Warehouse warehouse)
		this.basket = basket
		this.catalogue = catalogue
		this.warehouse = warehouse
	end

	public UserCommand addToBasket
		return new AddToBasketCommand(basket, catalogue, warehouse)
	end

	public UserCommand displayBasket
		return new DisplayBasketCommand(basket)
	end

	public UserCommand checkout
		return new CheckoutCommand(basket, warehouse)
	end

end
