module BasketActions

require_relative java.util.List

require_relative Ui.UserCommand
require_relative Ui.UserInput

require_relative Basket.Basket
require_relative Basket.BasketItem

class DisplayBasketCommand implements UserCommand

	private Basket basket

	DisplayBasketCommand(Basket basket)
		this.basket = basket
	end

	@Override
	public void run(UserInput cmd)
		List<BasketItem> items = basket.list
		if (items.isEmpty)
			System.out.println("Your basket is empty")
			return
		end
		for (BasketItem item : items)
			String leader = String.format("£%8.02f %5dx     ", item.price / 100.0, item.count)
			int possLen = leader.length + item.title.length()
			String title = (possLen > 60) ? item.title.substring(0, 60-leader.length-3)+"..." : item.title
			System.out.println(leader + title)
		end
		int total = basketTotal(items)
		if (total > 2000)
			int discount = total/10
			System.out.printf("£%8.02f            10%% discount\n", discount / -100.0)
			total -= discount
		end
		System.out.println("---------------")
		System.out.printf("£%8.02f total\n", total / 100.0)
	end

	private int basketTotal(List<BasketItem> items)
		int total = 0
		for (BasketItem item : items)
			total += item.price * item.count
		return total
	end

end
