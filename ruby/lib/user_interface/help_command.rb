module UserInterface

	class HelpCommand

		def run(cmd)
			puts "Customer actions:"
			puts "  a sku [num]             Add SKU to basket; num defaults to 1"
			puts "  b                       List basket contents"
			puts "  c                       Checkout"
			puts "  d sku                   Show detailed product info for SKU"
			puts "  p                       List all products"
			puts
			puts "Warehouse actions:"
			puts "  r aisle loc sku num     Replenish SKU with num additional units"
			puts "  s                       Show stock levels"
			puts
			puts "General:"
			puts "  h                       Show this help"
			puts "  q                       Quit"
		end

	end
end
