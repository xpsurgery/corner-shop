module Products

	class Sku

		attr_reader :code, :title, :price

		def initialize(code, title, description, price)
			@code = code
			@title = title
			@description = description
			@price = price
		end

		def <=>(other)
			myCode = code[0] + code[1] + code[2]
			otherCode = other.code[0] + other.code[1] + other.code[2]
			myCode <=> otherCode
		end

		def description
			result = []
			words = @description.split(/\s+/)
			current_line = "  "
			words.each do |word|
				current_line += word
				if current_line.length >= 60
					result << current_line
					current_line = "  "
				else
					current_line += " "
				end
			end
			if current_line.length > 2
				result << current_line
			end
			result
		end
	end
end
