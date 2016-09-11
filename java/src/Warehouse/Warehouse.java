package Warehouse;

import java.io.PrintStream;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import Filestore.StockMemento;
import Filestore.WarehouseReader;

public class Warehouse {

	public static Warehouse fromFile(WarehouseReader warehouseReader) {
		List<StockMemento> data = warehouseReader.readAll();
		Map<String[], Integer> stock = new HashMap<String[], Integer>();
		for (StockMemento line : data)
			stock.put(line.skuCode, line.count);
		return new Warehouse(stock);
	}

	private Map<String[], Integer> stock;

	public Warehouse(Map<String[], Integer> stock) {
		this.stock = stock;
	}

	public void stockReport(PrintStream out) {
		Comparator<String[]> comp = new Comparator<String[]>() {
			public int compare(String[] a, String[] b) {
				return (a[0]+a[1]+a[2]).compareTo(b[0]+b[1]+b[2]);
			}
		};
		SortedSet<String[]> keys = new TreeSet<String[]>(comp);
		keys.addAll(stock.keySet());
		for (String[] skuCode : keys)
			out.printf("%s %s %s   %6d\n", skuCode[0], skuCode[1], skuCode[2], stock.get(skuCode));
	}

	public void replenish(String[] skuCode, int numItems) {
		if (numItems <= 0)
			throw new InvalidNumItemsException(numItems);
		changeStockLevel(skuCode, numItems);
	}

	public void fulfill(String sku, Integer numItems) {
		String[] skuCode = lookup(sku);
		mustStock(skuCode, numItems);
		changeStockLevel(skuCode, -numItems);
	}

	public void mustStock(String[] sku, int numItems) {
		String[] skuCode = lookup(sku[2]);
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
