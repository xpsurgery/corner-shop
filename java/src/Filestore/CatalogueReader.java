package Filestore;

import java.util.ArrayList;
import java.util.List;

import Products.Sku;

public class CatalogueReader {

	public CatalogueReader(String filename) {
	}

	public List<String[]> readAll() {
		List<String[]> lines = new ArrayList<String[]>();
		lines.add(new String[]{ "01", "12", "1045", "Finest brie, 100g", "Our French mature ripe Brie is from the Meuse Region in Eastern France. It serves three people, each 30g serving contains 81 calories. Full-flavoured, perfectly ripe with a runny centre and ready to eat immediately, this Brie is just how brie should be!", "120" });
		lines.add(new String[]{ "10", "04", "2761", "Raffle ticket", "Players must be 16 or over and physically located in the UK or Isle of Man", "50" });
		lines.add(new String[]{ "24", "17", "5990", "Top hat, black, large", "A soft black wool Top Hat with 4cm ribbon band and bow. Fully lined, complete with a leather band. This traditional gentlemen’s top hat is suitable for all formal events; from weddings to a day at the races.", "4699" });
		lines.add(new String[]{ "01", "01", "6000", "Phillips screwdriver, small", "Large diameter handle with soft-grip for added grip and torque. Colour coded ends for ease of selection in the toolbox. With high quality chrome vanadium steel bar moulded to the handle for added durability.", "399" });
		return lines;
	}

}
