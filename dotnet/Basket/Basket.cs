using java.util.ArrayList;
using java.util.HashMap;
using java.util.List;
using java.util.Map;

using Products.Catalogue;
using Products.Sku;
using Warehouse.Warehouse;

namespace Basket {

public class Basket {

	private Map<string, BasketItem> items;
	
	public Basket() {
		items = new HashMap<string, BasketItem>();
	}

	public List<BasketItem> list() {
		List<BasketItem> result = new ArrayList<BasketItem>();
		foreach (string sku in sortedSkus())
			result.add(items.get(sku));
		return result;
	}

	private List<string> sortedSkus() {
		List<string> skus = new ArrayList<string>(items.keySet());
		java.util.Collections.sort(skus);
		return skus;
	}

	public void add(string skuId, Catalogue catalogue, int numItems) {
		Sku sku = catalogue.lookup(skuId);
		if (items.containsKey(skuId)) {
			BasketItem existing = items.get(skuId);
			items.put(skuId, new BasketItem(skuId, existing.title, existing.price, existing.count + numItems));
		} else {
			items.put(skuId, new BasketItem(skuId, sku.title, sku.price, numItems));
		}
	}

	public void checkout(Warehouse warehouse) {
		if (items.isEmpty()) {
			System.err.println("Your basket is empty!");
			return;
		}
		double totalPrice = currentTotal() / 100.0;
		foreach (string sku in items.keySet())
			warehouse.fulfill(sku, items.get(sku).count);
		items = new HashMap<string, BasketItem>();
		System.out.printf("All items checked out. Total price £%5.02f\n", totalPrice);
	}

	private int currentTotal() {
		int total = 0;
		foreach (BasketItem item in items.values())
			total += item.count * item.price;
		if (total > 2000)
			total -= (total/10);
		return total;
	}

}
}