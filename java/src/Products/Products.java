package Products;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

public class Products {
	
	private List<Sku> products;

	public Products() {
		products = new ArrayList<Sku>();
		products.add(new Sku("1045", "Finest brie, 100g", 120));
		products.add(new Sku("2761", "Philips screwdriver, small", 399));
		products.add(new Sku("5990", "Raffle ticket", 50));
		products.add(new Sku("6000", "Top hat, black, large", 4699));
	}

	public void list(PrintStream out) {
		for (Sku sku : products) {
			out.printf("%s\t%dp\t%s\n", sku.id, sku.price, sku.title);
		}
	}

}
