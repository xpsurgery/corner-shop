require 'spec_helper'
Dir['./spec/shared/**/*.rb'].sort.each { |f| require f }

[ 'csharp', 'java', 'ruby' ].each do |dir|
  Dir.chdir(dir) do
    shopkeeper = Shopkeeper.new(dir)
    describe(dir) do
      include_examples 'basket', shopkeeper
      include_examples 'add to basket', shopkeeper
      include_examples 'default stock levels', shopkeeper
      include_examples 'replenishing stock', shopkeeper
    end
  end
end
