package Basket;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import Warehouse.Warehouse;

public class Basket {

	private Map<String, Integer> items;
	
	public Basket() {
		items = new HashMap<String, Integer>();
	}

	public void list(PrintStream out) {
		if (items.isEmpty()) {
			System.out.println("Your basket is empty");
			return;
		}
		for (String sku : items.keySet())						// TODO -- sort by SKU
			out.printf("%s\t%6d\n", sku, items.get(sku));		// TODO -- validate SKU exists
	}

	public void add(String sku) {
		int current = 0;
		if (items.containsKey(sku))
			current = items.get(sku);
		items.put(sku, current+1);								// TODO -- check stock levels
	}

	public void checkout(Warehouse warehouse) {
		for (String sku : items.keySet())
			warehouse.fulfill(sku, items.get(sku));
		items = new HashMap<String, Integer>();
	}

}
