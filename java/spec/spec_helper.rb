require 'pty'

class Shop

  def self.create
    shop = Shop.new('make run')
    yield(shop)
    shop.close
  end

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
