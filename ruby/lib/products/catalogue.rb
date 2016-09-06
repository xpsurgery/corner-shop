module Products

require_relative java.io.PrintStream
require_relative java.util.ArrayList
require_relative java.util.List

require_relative Filestore.CatalogueReader

public class Catalogue
	
	public static Catalogue fromFile(CatalogueReader catalogueReader)
		List<Sku> products = new ArrayList<Sku>
		List<String[]> lines = catalogueReader.readAll
		for (String[] line : lines)
			Sku sku = new Sku(new String[] { line[0], line[1], line[2] end, line[3], line[4], Integer.parseInt(line[5]))
			products.add(sku)
		end
		return new Catalogue(products)
	end
	
	private List<Sku> products

	public Catalogue(List<Sku> products)
		this.products = products
	end

	public void list(PrintStream out)
		for (Sku sku : sortedSkus)
			out.printf("%s\t%dp\t%s\n", sku.code[2], sku.price, sku.title)
		out.println
		out.println("10% discount on orders over £20.00!")
	end

	private List<Sku> sortedSkus
		java.util.Collections.sort(products)
		return products
	end

	public Sku lookup(String id)
		for (Sku sku : products)
			if (sku.code[2].equals(id))
				return sku
		return null
	end

	public String[] lookupCode(String sku)
		for (Sku s : products)
			if (s.code[2].equals(sku))
				return s.code
		return null
	end

end
