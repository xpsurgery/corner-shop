package Filestore;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CatalogueReader {

	private String filename;

	public CatalogueReader(String filename) {
		this.filename = filename;
	}

	public List<String[]> readAll() {
		List<String[]> lines = new ArrayList<String[]>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(filename));
			String line;
			while ((line = br.readLine()) != null) {
				String[] args = line.split("\\^");
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
