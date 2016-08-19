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
				if (command.equals("b"))
					System.out.println("Your basket is empty");
				else if (command.equals("h"))
					printHelp(System.out);
			} catch (IOException e) {
			}
		}
		System.out.println();
	}

	private static void printHelp(PrintStream out) {
		out.println("a sku [num]   Add SKU to basket; num defaults to 1");
		out.println("b             List basket contents");
		out.println("c             Checkout");
		out.println("d sku         Show detailed product info for SKU");
		out.println("h             Show this help");
		out.println("p [filter]    List products (matching filter)");
		out.println("q             Quit");
		out.println("r sku num     Replenish SKU with num additional units");
		out.println("s             Show stock levels");
	}

	private static void displayWelcomeMessage(PrintStream out) {
		out.println("Welcome to our little corner shop!");
		out.println();
		out.println("For help, type 'h' or 'help' or '?'");
		out.println();
	}

}
