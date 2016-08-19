import java.io.PrintStream;

import Ui.CommandLoop;

public class Application {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		displayWelcomeMessage(System.out);
		new CommandLoop(System.in).run();
		System.exit(0);
	}

	private static void displayWelcomeMessage(PrintStream out) {
		out.println("Welcome to our little corner shop!");
		out.println();
		out.println("For help, type 'h' or 'help' or '?'");
		out.println();
	}

}
