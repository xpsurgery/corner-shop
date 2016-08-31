namespace Filestore {

	public class DataFileException : System.Exception {

		public DataFileException(string filename) : base("Could not read file " + filename)
		{
		}

	}
}