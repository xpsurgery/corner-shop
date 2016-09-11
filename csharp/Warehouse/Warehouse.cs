namespace Warehouse {

	using System;
	using Filestore;
	using System.Collections.Generic;

	public class Warehouse {

		public static Warehouse FromFile(WarehouseReader warehouseReader) {
			var data = warehouseReader.ReadAll();
			var stock = new Dictionary<string[], int>();
			foreach (StockMemento line in data)
				stock.Add(line.skuCode, line.count);
			return new Warehouse(stock);
		}

		private IDictionary<string[], int> stock;

		public Warehouse(IDictionary<string[], int> stock) {
			this.stock = stock;
		}

		public void StockReport() {
			var keys = new List<string[]>(stock.Keys);
			keys.Sort((a, b) => (a[0]+a[1]+a[2]).CompareTo(b[0]+b[1]+b[2]));
			foreach (string[] skuCode in keys)
				Console.WriteLine("{0} {1} {2}   {3,6:D}", skuCode[0], skuCode[1], skuCode[2], stock[skuCode]);
		}

		public void Replenish(string[] skuCode, int numItems) {
			if (numItems <= 0)
				throw new InvalidNumItemsException(numItems);
			ChangeStockLevel(skuCode, numItems);
		}

		public void Fulfill(string sku, int numItems) {
			var skuCode = Lookup(sku);
			MustStock(skuCode, numItems);
			ChangeStockLevel(skuCode, -numItems);
		}

		public void MustStock(string[] sku, int numItems) {
			var skuCode = Lookup(sku[2]);
			if (skuCode == null || stock[skuCode] < numItems)
				throw new NotEnoughStockException(sku, numItems);
		}

		private string[] Lookup(string sku) {
			foreach (string[] skuCode in stock.Keys) {
				if (skuCode[2] == sku)
					return skuCode;
			}
			return null;
		}

		private void ChangeStockLevel(string[] skuCode, int numItems) {
			var key = Lookup(skuCode[2]);
			if (key == null)
				stock.Add(skuCode, numItems);
			else
				stock[key] = stock[key] + numItems;
		}

	}
}
