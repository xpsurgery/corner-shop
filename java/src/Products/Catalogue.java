package Products;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

public class Catalogue {
	
	public static Catalogue fromFile(String string) {
		return new Catalogue();
	}
	
	private List<Sku> products;

	public Catalogue() {
		products = new ArrayList<Sku>();
		products.add(new Sku(new String[] { "01", "12", "1045" }, "Finest brie, 100g", "Our French mature ripe Brie is from the Meuse Region in Eastern France. It serves three people, each 30g serving contains 81 calories. Full-flavoured, perfectly ripe with a runny centre and ready to eat immediately, this Brie is just how brie should be!", 120));			// TODO -- load from file
		products.add(new Sku(new String[] { "10", "04", "2761" }, "Raffle ticket", "Players must be 16 or over and physically located in the UK or Isle of Man", 50));
		products.add(new Sku(new String[] { "24", "17", "5990" }, "Top hat, black, large", "A soft black wool Top Hat with 4cm ribbon band and bow. Fully lined, complete with a leather band. This traditional gentlemen’s top hat is suitable for all formal events; from weddings to a day at the races.", 4699));
		products.add(new Sku(new String[] { "01", "01", "6000" }, "Phillips screwdriver, small", "Large diameter handle with soft-grip for added grip and torque. Colour coded ends for ease of selection in the toolbox. With high quality chrome vanadium steel bar moulded to the handle for added durability.", 399));
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
