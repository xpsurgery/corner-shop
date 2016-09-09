require 'spec_helper'
Dir["./spec/shared/**/*.rb"].sort.each { |f| require f}

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
    shopkeeper = Shopkeeper.new(dir, opts)
    describe(dir) do
      include_examples 'basket', shopkeeper
      include_examples 'add to basket', shopkeeper
      include_examples 'default stock levels', shopkeeper
      include_examples 'replenishing stock', shopkeeper
    end
  end
end
