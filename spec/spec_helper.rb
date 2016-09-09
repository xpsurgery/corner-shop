require 'pty'

class Shop

  def self.create(dir, opts)
    Dir.chdir(dir) do
      shop = Shop.new(opts)
      yield(shop)
      shop.close
    end
  end

  def initialize(opts)
    @echo_lines = opts[:echo_lines]
    @first_command = true
    @stdout, @stdin, @pid = PTY.spawn(opts[:command])
    get
  end

  def send(s)
    @stdin.write(s + "\n")
    reply = get
    echo_lines = @first_command ? @echo_lines : 1
    @first_command = false
    reply.split(/\r\n/)[echo_lines..-2]
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
