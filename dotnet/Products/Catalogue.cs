namespace Products {

using Filestore;
using System.Collections.Generic;

public class Catalogue {
	
	public static Catalogue fromFile(CatalogueReader catalogueReader) {
		List<Sku> products = new List<Sku>();
		List<string[]> lines = catalogueReader.readAll();
		foreach (string[] line in lines) {
			Sku sku = new Sku(new string[] { line[0], line[1], line[2] }, line[3], line[4], Integer.parseInt(line[5]));
			products.add(sku);
		}
		return new Catalogue(products);
	}
	
	private List<Sku> products;

	public Catalogue(List<Sku> products) {
		this.products = products;
	}

	public void list(PrintStream str) {
		foreach (Sku sku in sortedSkus())
			str.printf("%s\t%dp\t%s\n", sku.code[2], sku.price, sku.title);
		str.println();
		str.println("10% discount on orders over £20.00!");
	}

	private List<Sku> sortedSkus() {
		java.util.Collections.sort(products);
		return products;
	}

	public Sku lookup(string id) {
		foreach (Sku sku in products)
			if (sku.code[2] == id)
				return sku;
		return null;
	}

	public string[] lookupCode(string sku) {
		foreach (Sku s in products)
			if (s.code[2] == sku)
				return s.code;
		return null;
	}

}
}