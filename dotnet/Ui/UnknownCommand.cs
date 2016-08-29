namespace Ui {

class UnknownCommand : UserCommand {

	public void run(UserInput cmd) {
		System.err.println("ERROR: Unknown command " + cmd.command);
		System.err.println("Type h or ? for help");
	}

}
}