namespace Filestore {

	using System.IO;
	using System.Collections.Generic;

public class WarehouseReader {

	private string filename;

	public WarehouseReader(string filename) {
		this.filename = filename;
	}

	public IList<StockMemento> readAll() {
		IList<StockMemento> lines = new List<StockMemento>();
		try {
			foreach (string line in File.ReadLines(filename)) {
				string[] args = line.Split(null);
				lines.Add(new StockMemento(args[0], args[1], args[2], args[3]));
			}
		} catch (IOException) {
			throw new DataFileException(filename);
		}
		return lines;
	}

}
}