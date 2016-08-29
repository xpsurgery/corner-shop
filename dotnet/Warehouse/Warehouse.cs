namespace Warehouse {

using System;
using Filestore;
using System.Collections.Generic;

public class Warehouse {
	
	public static Warehouse fromFile(WarehouseReader warehouseReader) {
		var data = warehouseReader.readAll();
		var stock = new Dictionary<string[], int>();
		foreach (StockMemento line in data)
			stock.Add(line.skuCode, line.count);
		return new Warehouse(stock);
	}

	private IDictionary<string[], int> stock;

	public Warehouse(IDictionary<string[], int> stock) {
		this.stock = stock;
	}

	public void stockReport() {
		foreach (string[] skuCode in stock.Keys)
			Console.Write("%s %s %s   %6d\n", skuCode[0], skuCode[1], skuCode[2], stock.get(skuCode));
	}

	public void replenish(string[] skuCode, int numItems) {
		if (numItems <= 0)
			throw new InvalidNumItemsException(numItems);
		changeStockLevel(skuCode, numItems);
	}

	public void fulfill(string sku, int numItems) {
		var skuCode = lookup(sku);
		mustStock(skuCode, numItems);
		changeStockLevel(skuCode, -numItems);
	}

	public void mustStock(string[] sku, int numItems) {
		var skuCode = lookup(sku[2]);
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
		var key = lookup(skuCode[2]);
		if (key == null)
			stock.Add(skuCode, numItems);
		else
			stock.Add(key, stock[key] + numItems);
	}

}
}