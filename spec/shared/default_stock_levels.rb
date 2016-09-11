shared_examples('default stock levels') do |shopkeeper|

  describe('default stock levels') do

    example('match those in the file') do
      shopkeeper.open do |shop|
        expect(shop.send('s')).to eq(['01 01 6000      105', '01 12 1045        3', '10 04 2761       17', '24 17 5990       50'])
      end
    end

  end

end
