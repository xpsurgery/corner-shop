namespace Ui {

public class UserInput {

	internal char command;
	public string[] args;

	UserInput(string line) {
		command = line[0];
		args = line.Split("\\s+");
	}

	public string Args(int i) {
		if (i < 0)
			throw new IllegalArgumentException();
		return (i < args.Length) ? args[i] : null;
	}

}
}