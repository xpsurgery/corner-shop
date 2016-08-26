package Products;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import Filestore.CatalogueReader;

public class Catalogue {
	
	public static Catalogue fromFile(CatalogueReader catalogueReader) {
		List<Sku> products = new ArrayList<Sku>();
		List<String[]> lines = catalogueReader.readAll();
		for (String[] line : lines) {
			Sku sku = new Sku(new String[] { line[0], line[1], line[2] }, line[3], line[4], Integer.parseInt(line[5]));
			products.add(sku);
		}
		return new Catalogue(products);
	}
	
	private List<Sku> products;

	public Catalogue(List<Sku> products) {
		this.products = products;
	}

	public void list(PrintStream out) {
		for (Sku sku : sortedSkus())
			out.printf("%s\t%dp\t%s\n", sku.code[2], sku.price, sku.title);
		out.println();
		out.println("10% discount on orders over £20.00!");
	}

	private List<Sku> sortedSkus() {
		java.util.Collections.sort(products);
		return products;
	}

	public Sku lookup(String id) {
		for (Sku sku : products)
			if (sku.code[2].equals(id))
				return sku;
		return null;
	}

	public String[] lookupCode(String sku) {
		for (Sku s : products)
			if (s.code[2].equals(sku))
				return s.code;
		return null;
	}

}
