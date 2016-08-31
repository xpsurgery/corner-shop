namespace Filestore {

using System;

	public class StockMemento {

		public string[] skuCode;
		public int count;

		public StockMemento(string aisle, string loc, string sku, string count) {
			skuCode = new string[] { aisle, loc, sku };
			try {
				this.count = int.Parse(count);
			} catch (FormatException) {
				throw new DataFormatException("Last argument must be a number: " + aisle + " " + loc + " " + sku + " " + count);
			}
		}

	}
}