namespace Filestore {
	using System.Collections.Generic;

public class WarehouseReader {

	private string filename;

	public WarehouseReader(string filename) {
		this.filename = filename;
	}

	public IList<StockMemento> readAll() {
		List<StockMemento> lines = new ArrayList<StockMemento>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(filename));
			string line;
			while ((line = br.readLine()) != null) {
				string[] args = line.Split(null);
				lines.Add(new StockMemento(args[0], args[1], args[2], args[3]));
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