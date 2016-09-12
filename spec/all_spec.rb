require_relative './spec_helper'
require_relative './shared/basket'
require_relative './shared/add_to_basket'
require_relative './shared/default_stock_levels'
require_relative './shared/replenish_stock'

shopkeeper = Shopkeeper.new
describe do
  include_examples 'basket', shopkeeper
  include_examples 'add to basket', shopkeeper
  include_examples 'default stock levels', shopkeeper
  include_examples 'replenishing stock', shopkeeper
end
