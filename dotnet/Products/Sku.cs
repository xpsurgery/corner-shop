namespace Products {
	using System.Collections.Generic;

public class Sku {

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

	public IList<string> Description() {
		IList<string> result = new List<string>();
		string[] words = description.Split(null);
		string currentLine = "  ";
		foreach (string word in words) {
			currentLine += word;
			if (currentLine.Length >= 60) {
				result.Add(currentLine);
				currentLine = "  ";
			} else {
				currentLine += " ";
			}
		}
		if (currentLine.Length > 2)
			result.Add(currentLine);
		return result;
	}
}
}