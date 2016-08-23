package Warehouse;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Warehouse {
	
	private Map<String, Integer> stock;

	public Warehouse() {
		stock = new HashMap<String, Integer>();
		stock.put("0020/1045", 3);								// TODO -- read from file
		stock.put("1034/2761", 17);
		stock.put("2477/5990", 50);
		stock.put("3000/6000", 105);
	}

	public void stockReport(PrintStream out) {
		for (String sku : sortedSkus())
			out.printf("%s\t%6d\n", sku, stock.get(sku));
	}

	private List<String> sortedSkus() {
		List<String> skus = new ArrayList<String>(stock.keySet());
		java.util.Collections.sort(skus);
		return skus;
	}

	public void replenish(String sku, int numItems) {
		if (numItems <= 0)
			throw new InvalidNumItemsException(numItems);
		changeStockLevel(sku, numItems);
	}

	private void changeStockLevel(String sku, int numItems) {
		int existing = stock.containsKey(sku) ? stock.get(sku) : 0;
		stock.put(sku, existing + numItems);
	}

	public void fulfill(String sku, Integer numItems) {
		mustStock(sku, numItems);
		changeStockLevel(sku, -numItems);
	}

	public void mustStock(String sku, int numItems) {
		if (stock.containsKey(sku) && stock.get(sku) >= numItems)
			return;
		throw new NotEnoughStockException(sku, numItems);
	}

}
