namespace Filestore {

public class DataFileException : RuntimeException {

	public DataFileException(string filename) {
		super("Could not read file " + filename);
	}

}
}