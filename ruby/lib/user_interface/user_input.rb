module Ui

public class UserInput

	char command
	public String[] args

	UserInput(String line)
		command = line.charAt(0)
		args = line.split("\\s+")
	end

	public String args(int i)
		if (i < 0)
			throw new IllegalArgumentException
		return (i < args.length) ? args[i] : null
	end

end
