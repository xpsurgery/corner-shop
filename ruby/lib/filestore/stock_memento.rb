module Filestore

public class StockMemento

	public String[] skuCode
	public Integer count

	public StockMemento(String aisle, String loc, String sku, String count)
		skuCode = new String[] { aisle, loc, sku end
		try
		this.count = Integer.parseInt(count)
	end catch (NumberFormatException e)
		throw new DataFormatException("Last argument must be a number: " + aisle + " " + loc + " " + sku + " " + count)
	end
	end

end
end
