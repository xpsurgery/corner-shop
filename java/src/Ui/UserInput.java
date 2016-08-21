package Ui;

public class UserInput {

	public char command;
	public String[] args;

	public UserInput(String line) {
		command = line.charAt(0);
		args = line.split(" ");								// TODO -- ignore multiple spaces
															// TODO -- allow tabs
															// TODO -- omit the command itself
	}

}
