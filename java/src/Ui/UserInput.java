package Ui;

class UserInput {

	char command;
	String[] args;

	UserInput(String line) {
		command = line.charAt(0);
		args = line.split(" ");								// TODO -- ignore multiple spaces
															// TODO -- allow tabs
															// TODO -- omit the command itself
	}

}
