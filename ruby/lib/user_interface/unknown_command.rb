module UserInterface

  class UnknownCommand < StandardError

  	def run(cmd)
  		$stderr.puts "ERROR: Unknown command #{cmd.command}"
  		$stderr.puts "Type h or ? for help"
  	end

  end
end
