namespace BasketActions
{
	using System;
    using Ui;
    using Basket;
	using System.Collections.Generic;

    class DisplayBasketCommand : UserCommand {

	private Basket basket;

	internal DisplayBasketCommand(Basket basket) {
		this.basket = basket;
	}

	public void run(UserInput cmd) {
		IList<BasketItem> items = basket.list();
		if (items.Count == 0) {
			Console.WriteLine("Your basket is empty");
			return;
		}
		foreach (BasketItem item in items) {
			string leader = string.Format("£{0,8:F2} {1,5:D}x     ", item.price / 100.0, item.count);
			int possLen = leader.Length + item.title.Length;
			string title = (possLen > 60) ? item.title.Substring(0, 60-leader.Length-3)+"..." : item.title;
			Console.WriteLine(leader + title);
		}
		int total = basketTotal(items);
		if (total > 2000) {
			int discount = total/10;
			Console.WriteLine("£{0,8:F2}            10% discount", discount / -100.0);
			total -= discount;
		}
		Console.WriteLine("---------------");
		Console.WriteLine("£{0,8:F2} total", total / 100.0);
	}

	private int basketTotal(IList<BasketItem> items) {
		int total = 0;
		foreach (BasketItem item in items)
			total += item.price * item.count;
		return total;
	}

}
}