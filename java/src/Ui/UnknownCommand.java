package Ui;

public class UnknownCommand {

	public void run(UserInput cmd) {
		System.out.println("Unknown command: " + cmd.command);
		System.out.println("Type h or ? for help");
	}

}
