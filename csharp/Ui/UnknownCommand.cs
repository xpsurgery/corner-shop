namespace Ui {

	using System;

	class UnknownCommand : UserCommand {

		public void Run(UserInput cmd) {
			Console.WriteLine("ERROR: Unknown command " + cmd.command);
			Console.WriteLine("Type h or ? for help");
		}

	}
}