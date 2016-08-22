package Basket;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import Products.Catalogue;
import Products.Sku;
import Warehouse.Warehouse;

public class Basket {

	private Map<String, Integer> items;
	
	public Basket() {
		items = new HashMap<String, Integer>();
	}

	public void list(PrintStream out, Catalogue catalogue) {
		if (items.isEmpty()) {
			System.out.println("Your basket is empty");
			return;
		}
		for (String skuId : items.keySet()) {						// TODO -- sort by SKU
			Sku sku = catalogue.lookup(skuId);
			Integer count = items.get(skuId);						// TODO -- print item titles
			out.printf("%dp x%d\t%s\n", sku.price, count, sku.title);
		}															// TODO -- print total
	}

	public void add(String sku, int numItems) {
		int current = items.containsKey(sku) ? items.get(sku) : 0;
		items.put(sku, current + numItems);
	}

	public void checkout(Warehouse warehouse) {
		if (items.isEmpty()) {
			System.err.println("Your basket is empty!");
			return;
		}
		for (String sku : items.keySet())
			warehouse.fulfill(sku, items.get(sku));
		items = new HashMap<String, Integer>();
		System.out.println("All items checked out.");			// TODO -- print total
	}

}
