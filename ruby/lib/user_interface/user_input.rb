module UserInterface

	class UserInput

		attr_reader :command, :args

		def initialize(line)
			@command = line[0]
			@args = line.split(/\s+/)
		end

		def arg(i)
			raise IllegalArgumentException.new if i < 0
			return (i < args.length) ? args[i] : nil
		end

	end
end
