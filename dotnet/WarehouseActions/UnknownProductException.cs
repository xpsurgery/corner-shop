namespace WarehouseActions {

	public class UnknownProductException : System.Exception {

		public UnknownProductException(string sku) : base("SKU code " + sku + " is not in the product catalogue.")
		{
		}

	}
}