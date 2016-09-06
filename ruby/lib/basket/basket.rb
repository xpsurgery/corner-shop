package Basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Products.Catalogue;
import Products.Sku;
import Warehouse.Warehouse;

public class Basket {

	private Map<String, BasketItem> items;
	
	public Basket() {
		items = new HashMap<String, BasketItem>();
	}

	public List<BasketItem> list() {
		List<BasketItem> result = new ArrayList<BasketItem>();
		for (String sku : sortedSkus())
			result.add(items.get(sku));
		return result;
	}

	private List<String> sortedSkus() {
		List<String> skus = new ArrayList<String>(items.keySet());
		java.util.Collections.sort(skus);
		return skus;
	}

	public void add(String skuId, Catalogue catalogue, int numItems) {
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
		for (String sku : items.keySet())
			warehouse.fulfill(sku, items.get(sku).count);
		items = new HashMap<String, BasketItem>();
		System.out.printf("All items checked out. Total price £%5.02f\n", totalPrice);
	}

	private int currentTotal() {
		int total = 0;
		for (BasketItem item : items.values())
			total += item.count * item.price;
		if (total > 2000)
			total -= (total/10);
		return total;
	}

}
