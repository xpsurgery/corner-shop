module Basket

public class BasketItem

	public String skuId
	public String title
	public int price
	public int count

	public BasketItem(String skuId, String title, int price, int count)
		this.skuId = skuId
		this.title = title
		this.price = price
		this.count = count
	end
end
