shared_examples('replenishing stock') do |dir, opts|

  describe('replenishing stock') do

    example('replenish adds to the stock') do
      Shop.create(dir, opts) do |shop|
        expect(shop.send('r 01 01 6000 20')).to eq([])
        expect(shop.send('s')).to include('01 01 6000      125')
      end
    end

    example('replenish errors are reported') do
      Shop.create(dir, opts) do |shop|
        expect(shop.send('r')).to eq(['ERROR: Usage: r aisle loc sku num'])
        expect(shop.send('r 01')).to eq(['ERROR: Usage: r aisle loc sku num'])
        expect(shop.send('r 01 01')).to eq(['ERROR: Usage: r aisle loc sku num'])
        expect(shop.send('r 01 01 6000')).to eq(['ERROR: Usage: r aisle loc sku num'])
      end
    end

  end

end
