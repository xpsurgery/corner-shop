module Products

require_relative java.util.ArrayList
require_relative java.util.List

public class Sku implements Comparable<Sku>

	public String title
	public String[] code
	public int price
	private String description

	public Sku(String[] code, String title, String description, int price)
		this.code = code
		this.title = title
		this.description = description
		this.price = price
	end

	@Override
	public int compareTo(Sku other)
		String myCode = code[0] + code[1] + code[2]
		String otherCode = other.code[0] + other.code[1] + other.code[2]
		return myCode.compareTo(otherCode)
	end

	public List<String> description
		List<String> result = new ArrayList<String>
		String[] words = description.split("\\s+")
		String currentLine = "  "
		for (String word : words)
			currentLine += word
			if (currentLine.length >= 60)
				result.add(currentLine)
				currentLine = "  "
			end else
				currentLine += " "
			end
		end
		if (currentLine.length > 2)
			result.add(currentLine)
		return result
	end
end
