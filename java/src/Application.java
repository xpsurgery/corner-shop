import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Application {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("Welcome to our little corner shop!");
		System.out.println();
		System.out.println("For help, type 'h' or 'help' or '?'");
		System.out.println();
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
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
		System.exit(0);
	}

}
