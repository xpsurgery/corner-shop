require 'spec_helper'
Dir['./spec/shared/**/*.rb'].sort.each { |f| require f }

{
  'csharp' => {
    echo_lines: 2
  },
  'java' => {
    echo_lines: 1
  },
  'ruby' => {
    echo_lines: 1
  }
}.each do |dir, opts|
  Dir.chdir(dir) do
    shopkeeper = Shopkeeper.new(dir, opts)
    describe(dir) do
      include_examples 'basket', shopkeeper
      include_examples 'add to basket', shopkeeper
      include_examples 'default stock levels', shopkeeper
      include_examples 'replenishing stock', shopkeeper
    end
  end
end
