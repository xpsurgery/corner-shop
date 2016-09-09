require 'spec_helper'
require 'shared/basket'
require 'shared/default_stock_levels'
require 'shared/replenish_stock'

{
  # 'csharp',
  'java' => 'make run',
  'ruby' => 'bin/shop.rb'
}.each do |dir, cmd|
  Dir.chdir(dir) do
    describe(dir) do
      include_examples 'basket', dir, cmd
      include_examples 'default stock levels', dir, cmd
      include_examples 'replenishing stock', dir, cmd
    end
  end
end
