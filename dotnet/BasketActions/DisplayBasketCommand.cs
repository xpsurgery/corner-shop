namespace BasketActions
{
    using Ui;
    using Basket;
	using System.Collections.Generic;

    class DisplayBasketCommand : UserCommand {

	private Basket basket;

	internal DisplayBasketCommand(Basket basket) {
		this.basket = basket;
	}

	public void run(UserInput cmd) {
		List<BasketItem> items = basket.list();
		if (items.Count == 0) {
			System.out.println("Your basket is empty");
			return;
		}
		foreach (BasketItem item in items) {
			string leader = string.format("£%8.02f %5dx     ", item.price / 100.0, item.count);
			int possLen = leader.Length + item.title.Length;
			string title = (possLen > 60) ? item.title.Substring(0, 60-leader.Length-3)+"..." : item.title;
			System.out.println(leader + title);
		}
		int total = basketTotal(items);
		if (total > 2000) {
			int discount = total/10;
			System.out.printf("£%8.02f            10%% discount\n", discount / -100.0);
			total -= discount;
		}
		System.out.println("---------------");
		System.out.printf("£%8.02f total\n", total / 100.0);
	}

	private int basketTotal(List<BasketItem> items) {
		int total = 0;
		foreach (BasketItem item in items)
			total += item.price * item.count;
		return total;
	}

}
}