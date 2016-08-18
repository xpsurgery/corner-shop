import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;

public class Application {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		displayWelcomeMessage(System.out);
		commandLoop(System.in);
		System.exit(0);
	}

	private static void commandLoop(InputStream input) {
		BufferedReader in = new BufferedReader(new InputStreamReader(input));
		for (;;) {
			System.out.print("shop> ");
			try {
				String command = in.readLine();
				if (command == null || command.equals("q"))
					break;
			} catch (IOException e) {
			}
		}
		System.out.println();
	}

	private static void displayWelcomeMessage(PrintStream out) {
		out.println("Welcome to our little corner shop!");
		out.println();
		out.println("For help, type 'h' or 'help' or '?'");
		out.println();
	}

}
