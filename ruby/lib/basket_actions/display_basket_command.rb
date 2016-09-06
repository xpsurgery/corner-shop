require_relative '../user_interface/user_input'
require_relative '../basket/basket'
require_relative '../basket/basket_item'

module BasketActions

	class DisplayBasketCommand

		def initialize(basket)
			@basket = basket
		end

		def run(cmd)
			items = @basket.list
			if items.empty?
				puts "Your basket is empty"
				return
			end
			items.each do |item|
				leader = String.format("£%8.02f %5dx     ", item.price / 100.0, item.count)
				possLen = leader.length + item.title.length()
				title = (possLen > 60) ? item.title.substring(0, 60-leader.length-3)+"..." : item.title
				puts leader + title
			end
			total = basketTotal(items)
			if total > 2000
				discount = total/10
				System.out.printf("£%8.02f            10%% discount\n", discount / -100.0)
				total -= discount
			end
			puts "---------------"
			System.out.printf("£%8.02f total\n", total / 100.0)
		end

		private

		def basketTotal(items)
			total = 0
			items.each do |item|
				total += item.price * item.count
			end
			return total
		end

	end
end
