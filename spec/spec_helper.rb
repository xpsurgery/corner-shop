require 'pty'

class Shop

  def initialize
    @stdout, @stdin, @pid = PTY.spawn('make run')
    read__all_command_output
  end

  def send(s)
    put(s)
    all_lines = read__all_command_output.split(/\r\n/)
    echo_lines = all_lines[1] =~ /^\e\[\?1h\e=/ ? 2 : 1      # dotnet echoes the input twice!
    all_lines[echo_lines..-2]
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
  def initialize(dir)
    @dir = dir
  end

  def open
    Dir.chdir(@dir) do
      shop = Shop.new
      yield(shop)
      shop.close
    end
  end
end
