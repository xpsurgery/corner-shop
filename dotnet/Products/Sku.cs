using java.util.ArrayList;
using java.util.List;

namespace Products {

public class Sku : Comparable<Sku> {

	public string title;
	public string[] code;
	public int price;
	private string description;

	public Sku(string[] code, string title, string description, int price) {
		this.code = code;
		this.title = title;
		this.description = description;
		this.price = price;
	}

	@Override
	public int compareTo(Sku other) {
		string myCode = code[0] + code[1] + code[2];
		string otherCode = other.code[0] + other.code[1] + other.code[2];
		return myCode.compareTo(otherCode);
	}

	public List<string> description() {
		List<string> result = new ArrayList<string>();
		string[] words = description.split("\\s+");
		string currentLine = "  ";
		for (string word : words) {
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
}