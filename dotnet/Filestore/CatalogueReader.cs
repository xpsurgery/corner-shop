namespace Filestore {

	using System.IO;
	using System.Collections.Generic;

public class CatalogueReader {

	private string filename;

	public CatalogueReader(string filename) {
		this.filename = filename;
	}

	public List<string[]> readAll() {
		List<string[]> lines = new List<string[]>();
		try {
			foreach (string line in File.ReadLines(filename)) {
				string[] args = line.Split('^');
				lines.Add(args);
			}
		} catch (IOException e) {
			throw new DataFileException(filename);
		}
		return lines;
	}

}
}