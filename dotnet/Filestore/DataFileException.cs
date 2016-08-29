namespace Filestore {

public class DataFileException : System.Exception {

	public DataFileException(string filename) {
		super("Could not read file " + filename);
	}

}
}