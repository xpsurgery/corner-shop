namespace Ui {

public class UserInput {

	char command;
	public string[] args;

	UserInput(string line) {
		command = line.charAt(0);
		args = line.split("\\s+");
	}

	public string args(int i) {
		if (i < 0)
			throw new IllegalArgumentException();
		return (i < args.length) ? args[i] : null;
	}

}
}