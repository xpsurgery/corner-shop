module Products

	class Sku #implements Comparable<Sku>

		def initialize(code, title, description, price)
			@code = code
			@title = title
			@description = description
			@price = price
		end

		def compareTo(other)
			myCode = code[0] + code[1] + code[2]
			otherCode = other.code[0] + other.code[1] + other.code[2]
			myCode.compareTo(otherCode)
		end

		def description
			result = []
			words = description.split("\\s+")
			currentLine = "  "
			words.each do |word|
				currentLine += word
				if (currentLine.length >= 60)
					result.add(currentLine)
					currentLine = "  "
				else
					currentLine += " "
				end
			end
			if (currentLine.length > 2)
				result.add(currentLine)
			end
			return result
		end
	end
end
