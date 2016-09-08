require_relative './spec_helper'

describe('basket') do

  example('is initially empty') do
    Shop.create do |shop|
      expect(shop.send('b')).to eq(['Your basket is empty'])
    end
  end

  example('lists items added') do
    Shop.create do |shop|
      expect(shop.send('a 1045')).to be_empty
      expect(shop.send('b')[0]).to include('1.20     1x     Finest brie, 100g')
      expect(shop.send('b')[2]).to include('1.20 total')
    end
  end

end
