package Filestore;

public class StockMemento {

	public String[] skuCode;
	public Integer count;

	public StockMemento(String aisle, String loc, String sku, String count) {
		skuCode = new String[] { aisle, loc, sku };
		try {
		this.count = Integer.parseInt(count);
	} catch (NumberFormatException e) {
		throw new DataFormatException("Last argument must be a number: " + aisle + " " + loc + " " + sku + " " + count);
	}
	}

}
