require 'spec_helper'
require 'shared/basket'
require 'shared/default_stock_levels'
require 'shared/replenish_stock'

{
  'csharp' => {
    command: 'dotnet run',
    echo_lines: 2
  },
  'java' => {
    command: 'make run',
    echo_lines: 1
  },
  'ruby' => {
    command: 'bin/shop.rb',
    echo_lines: 1
  }
}.each do |dir, opts|
  Dir.chdir(dir) do
    describe(dir) do
      include_examples 'basket', dir, opts
      include_examples 'default stock levels', dir, opts
      include_examples 'replenishing stock', dir, opts
    end
  end
end
