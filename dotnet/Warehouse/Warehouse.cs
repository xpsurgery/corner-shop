namespace Warehouse {

using Filestore;
using System.Collections.Generic;

public class Warehouse {
	
	public static Warehouse fromFile(WarehouseReader warehouseReader) {
		List<StockMemento> data = warehouseReader.readAll();
		IDictionary<string[], Integer> stock = new Dictionary<string[], Integer>();
		foreach (StockMemento line in data)
			stock.Add(line.skuCode, line.count);
		return new Warehouse(stock);
	}

	private IDictionary<string[], Integer> stock;

	public Warehouse(IDictionary<string[], Integer> stock) {
		this.stock = stock;
	}

	public void stockReport(PrintStream str) {
		foreach (string[] skuCode in stock.Keys)
			str.printf("%s %s %s   %6d\n", skuCode[0], skuCode[1], skuCode[2], stock.get(skuCode));
	}

	public void replenish(string[] skuCode, int numItems) {
		if (numItems <= 0)
			throw new InvalidNumItemsException(numItems);
		changeStockLevel(skuCode, numItems);
	}

	public void fulfill(string sku, Integer numItems) {
		string[] skuCode = lookup(sku);
		mustStock(skuCode, numItems);
		changeStockLevel(skuCode, -numItems);
	}

	public void mustStock(string[] sku, int numItems) {
		string[] skuCode = lookup(sku[2]);
		if (skuCode == null || stock[skuCode] < numItems)
			throw new NotEnoughStockException(sku, numItems);
	}

	private string[] lookup(string sku) {
		foreach (string[] skuCode in stock.Keys) {
			if (skuCode[2] == sku)
				return skuCode;
		}
		return null;
	}

	private void changeStockLevel(string[] skuCode, int numItems) {
		string[] key = lookup(skuCode[2]);
		if (key == null)
			stock.Add(skuCode, numItems);
		else
			stock.Add(key, stock[key] + numItems);
	}

}
}