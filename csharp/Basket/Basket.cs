namespace Basket {

	using System;
	using Products;
	using Warehouse;
	using System.Collections.Generic;
	using System.Linq;

	public class Basket {

		private IDictionary<string, BasketItem> items;
		
		public Basket() {
			items = new Dictionary<string, BasketItem>();
		}

		public IList<BasketItem> List() {
			var result = new List<BasketItem>();
			foreach (string sku in SortedSkus())
				result.Add(items[sku]);
			return result;
		}

		private IList<string> SortedSkus() {
			return items.Keys.OrderBy(k => k).ToList();
		}

		public void Add(string skuId, Catalogue catalogue, int numItems) {
			var sku = catalogue.Lookup(skuId);
			if (items.ContainsKey(skuId)) {
				var existing = items[skuId];
				items.Add(skuId, new BasketItem(skuId, existing.title, existing.price, existing.count + numItems));
			} else {
				items.Add(skuId, new BasketItem(skuId, sku.title, sku.price, numItems));
			}
		}

		public void Checkout(Warehouse warehouse) {
			if (items.Count == 0) {
				Console.WriteLine("Your basket is empty!");
				return;
			}
			double totalPrice = CurrentTotal() / 100.0;
			foreach (string sku in items.Keys)
				warehouse.Fulfill(sku, items[sku].count);
			items = new Dictionary<string, BasketItem>();
			Console.WriteLine("All items checked out. Total price £{0,5:F2}", totalPrice);
		}

		private int CurrentTotal() {
			var total = 0;
			foreach (BasketItem item in items.Values)
				total += item.count * item.price;
			if (total > 2000)
				total -= (total/10);
			return total;
		}

	}
}