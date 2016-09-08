require 'pty'

class Shop
  def initialize(cmd)
    @stdout, @stdin, @pid = PTY.spawn(cmd)
    get
  end

  def send(s)
    @stdin.write(s + "\n")
    get.split(/\r\n/)[1..-2]
  end

  def close
    put('q')
  end

  private

  def get
    buffer = ''
    buffer += @stdout.readpartial(1024) until buffer =~ /shop> $/
    buffer
  end

  def put(s)
    @stdin.write(s + "\n")
  end
end

describe('stock levels') do
  let(:shop) { Shop.new('make run') }

  example('default stock') do
    expect(shop.send('s')).to eq(['24 17 5990       50', '10 04 2761       17', '01 01 6000      105', '01 12 1045        3'])
  end

  example('replenish') do
    expect(shop.send('r 01 01 6000 20')).to eq([])
    expect(shop.send('s')).to include('01 01 6000      125')
  end

  after(:each) do
    shop.close
  end
end
