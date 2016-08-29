namespace Filestore {

public class StockMemento {

	public string[] skuCode;
	public Integer count;

	public StockMemento(string aisle, string loc, string sku, string count) {
		skuCode = new string[] { aisle, loc, sku };
		try {
		this.count = Integer.parseInt(count);
	} catch (NumberFormatException e) {
		throw new DataFormatException("Last argument must be a number: " + aisle + " " + loc + " " + sku + " " + count);
	}
	}

}
}