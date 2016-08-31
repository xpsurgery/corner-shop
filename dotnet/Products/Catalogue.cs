namespace Products {

using System;
using Filestore;
using System.Collections.Generic;
using System.Linq;

public class Catalogue {
	
	public static Catalogue fromFile(CatalogueReader catalogueReader) {
		var products = new List<Sku>();
		var lines = catalogueReader.readAll();
		foreach (string[] line in lines) {
			var sku = new Sku(new string[] { line[0], line[1], line[2] }, line[3], line[4], int.Parse(line[5]));
			products.Add(sku);
		}
		return new Catalogue(products);
	}
	
	private IList<Sku> products;

	public Catalogue(IList<Sku> products) {
		this.products = products;
	}

	public void list() {
		foreach (Sku sku in sortedSkus())
			Console.WriteLine("{0}\t{1}p\t{2}", sku.code[2], sku.price, sku.title);
		Console.WriteLine();
		Console.WriteLine("10% discount on orders over £20.00!");
	}

	private IList<Sku> sortedSkus() {
		return products.OrderBy(p => p.code[2]).ToList();
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