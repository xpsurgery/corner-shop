shared_examples('add to basket') do |shopkeeper|

  describe('adding to basket') do

    example('reports usage errors') do
      shopkeeper.open do |shop|
        expect(shop.send('a')).to eq(['ERROR: Usage: a sku [numitems]'])
        expect(shop.send('a 6000 -1')).to eq(['ERROR: The number of items must be a number greater than zero.'])
        expect(shop.send('a 6000 2 4')).to eq(['ERROR: Usage: a sku [numitems]'])
        expect(shop.send('a 6000 999999')).to eq(['ERROR: The warehouse does not contain 999999 item(s) of product 6000'])
        expect(shop.send('a 3333')).to eq(['ERROR: Product 3333 unknown.'])
      end
    end

  end

end
