package Warehouse;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

public class Warehouse {
	
	private Map<String, Integer> stock;

	public Warehouse() {
		stock = new HashMap<String, Integer>();
		stock.put("1045", 3);
		stock.put("2761", 17);
		stock.put("5990", 50);
		stock.put("6000", 105);
	}

	public void stockReport(PrintStream out) {
		for (String sku : stock.keySet())
			out.printf("%s\t%6d\n", sku, stock.get(sku));
	}

	public void replenish(String sku, int numItems) {
		if (!stock.containsKey(sku))				// TODO -- defensive checks
			stock.put(sku, 0);
		int existing = stock.get(sku);
		stock.put(sku, existing + numItems);
	}

}
