package Basket;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import Products.Catalogue;
import Products.Sku;
import Warehouse.Warehouse;

public class Basket {

	private Map<String, BasketItem> items;
	
	public Basket() {
		items = new HashMap<String, BasketItem>();
	}

	public void list(PrintStream out, Catalogue catalogue) {
		if (items.isEmpty()) {
			System.out.println("Your basket is empty");
			return;
		}
		for (String skuId : items.keySet()) {						// TODO -- sort by SKU
			Sku sku = catalogue.lookup(skuId);
			Integer count = items.get(skuId).count;						// TODO -- print item titles
			out.printf("%dp x%d\t%s\n", sku.price, count, sku.title);
		}															// TODO -- print total
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
		for (String sku : items.keySet())
			warehouse.fulfill(sku, items.get(sku).count);
		items = new HashMap<String, BasketItem>();
		System.out.println("All items checked out.");			// TODO -- print total
	}

}
