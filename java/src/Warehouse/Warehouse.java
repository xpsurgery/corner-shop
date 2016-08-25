package Warehouse;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Warehouse {

	private Map<String[], Integer> stock;

	public Warehouse() {
		stock = new HashMap<String[], Integer>();
		stock.put(new String[] { "01", "12", "1045" }, 3);					// TODO -- read from file
		stock.put(new String[] { "10", "04", "2761" }, 17);
		stock.put(new String[] { "24", "17", "5990" }, 50);
		stock.put(new String[] { "01", "01", "6000" }, 105);
	}

	public void stockReport(PrintStream out) {
		for (String[] skuCode : stock.keySet())
			out.printf("%s %s %s   %6d\n", skuCode[0], skuCode[1], skuCode[2], stock.get(skuCode));
	}

	public void replenish(String[] skuCode, int numItems) {
		if (numItems <= 0)
			throw new InvalidNumItemsException(numItems);
		changeStockLevel(skuCode, numItems);
	}

	public void fulfill(String sku, Integer numItems) {
		mustStock(sku, numItems);
		changeStockLevel(lookup(sku), -numItems);
	}

	public void mustStock(String sku, int numItems) {
		String[] skuCode = lookup(sku);
		if (skuCode == null || stock.get(skuCode) < numItems)
			throw new NotEnoughStockException(sku, numItems);
	}

	private String[] lookup(String sku) {
		for (String[] skuCode : stock.keySet()) {
			if (skuCode[2].equals(sku))
				return skuCode;
		}
		return null;
	}

	private void changeStockLevel(String[] skuCode, int numItems) {
		String[] key = lookup(skuCode[2]);
		if (key == null)
			stock.put(skuCode, numItems);
		else
			stock.put(key, stock.get(key) + numItems);
	}

}
