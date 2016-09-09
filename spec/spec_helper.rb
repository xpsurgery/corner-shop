require 'pty'

class Shop

  def initialize(opts)
    @echo_lines = opts[:echo_lines]
    @first_command = true
    @stdout, @stdin, @pid = PTY.spawn(opts[:command])
    read__all_command_output
  end

  def send(s)
    put(s)
    echo_lines = @first_command ? @echo_lines : 1
    @first_command = false
    read__all_command_output.split(/\r\n/)[echo_lines..-2]
  end

  def close
    put('q')
  end

  private

  def read__all_command_output
    buffer = ''
    buffer += @stdout.readpartial(1024) until buffer =~ /shop> $/
    buffer
  end

  def put(s)
    @stdin.write(s + "\n")
  end
end

class Shopkeeper
  def initialize(dir, opts)
    @dir = dir
    @opts = opts
  end

  def open
    Dir.chdir(@dir) do
      shop = Shop.new(@opts)
      yield(shop)
      shop.close
    end
  end
end
