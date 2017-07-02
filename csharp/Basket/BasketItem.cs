namespace Basket {

public class BasketItem {

	public string skuId;
	public string title;
	public int price;
	public int count;

	public BasketItem(string skuId, string title, int price, int count) {
		this.skuId = skuId;
		this.title = title;
		this.price = price;
		this.count = count;
	}
}
}