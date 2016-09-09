require 'spec_helper'
require 'shared/basket'
require 'shared/default_stock_levels'
require 'shared/replenish_stock'

[
  # 'csharp',
  'java',
  # 'ruby'
].each do |dir|
  Dir.chdir(dir) do
    describe(dir) do
      include_examples 'basket', dir, 'make run'
      include_examples 'default stock levels', dir, 'make run'
      include_examples 'replenishing stock', dir, 'make run'
    end
  end
end
