package Products;

import java.util.ArrayList;
import java.util.List;

public class Sku implements Comparable<Sku> {

	public String title;
	public String id;
	public int price;
	private String description;

	public Sku(String id, String title, String description, int price) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.price = price;
	}

	@Override
	public int compareTo(Sku other) {
		return id.compareTo(other.id);
	}

	public List<String> description() {
		List<String> result = new ArrayList<String>();
		String[] words = description.split(" ");
		String currentLine = "  ";
		for (String word : words) {
			currentLine += word;
			if (currentLine.length() >= 60) {
				result.add(currentLine);
				currentLine = "  ";
			} else {
				currentLine += " ";
			}
		}
		if (currentLine.length() > 2)
			result.add(currentLine);
		return result;
	}
}
