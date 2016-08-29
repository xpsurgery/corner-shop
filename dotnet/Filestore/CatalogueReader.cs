namespace Filestore {
	using System.Collections.Generic;

public class CatalogueReader {

	private string filename;

	public CatalogueReader(string filename) {
		this.filename = filename;
	}

	public List<string[]> readAll() {
		List<string[]> lines = new List<string[]>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(filename));
			string line;
			while ((line = br.readLine()) != null) {
				string[] args = line.split("\\^");
				lines.add(args);
			}
		} catch (IOException e) {
			throw new DataFileException(filename);
		} finally {
			try { if (br != null) br.close(); } catch (IOException ex) { }
		}
		return lines;
	}

}
}