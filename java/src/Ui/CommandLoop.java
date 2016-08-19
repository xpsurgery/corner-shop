package Ui;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;

public class CommandLoop {

	private BufferedReader in;

	public CommandLoop(InputStream input) {
		in = new BufferedReader(new InputStreamReader(input));
	}

	public void run() {
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

}
