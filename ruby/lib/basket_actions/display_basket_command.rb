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
				leader = sprintf("£%8.02f %5dx     ", item.price / 100.0, item.count)
				poss_len = leader.length + item.title.length
				title = (poss_len > 60) ? item.title[0, 60-leader.length-3]+"..." : item.title
				puts leader + title
			end
			total = basket_total(items)
			if total > 2000
				discount = total/10
				printf("£%8.02f            10%% discount\n", discount / -100.0)
				total -= discount
			end
			puts "---------------"
			printf("£%8.02f total\n", total / 100.0)
		end

		private

		def basket_total(items)
			total = 0
			items.each do |item|																# TODO -- inject
				total += item.price * item.count
			end
			total
		end

	end
end
