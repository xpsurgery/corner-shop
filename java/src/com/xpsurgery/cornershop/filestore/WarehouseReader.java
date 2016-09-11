package com.xpsurgery.cornershop.filestore;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class WarehouseReader {

	private String filename;

	public WarehouseReader(String filename) {
		this.filename = filename;
	}

	public List<StockMemento> readAll() {
		List<StockMemento> lines = new ArrayList<StockMemento>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(filename));
			String line;
			while ((line = br.readLine()) != null) {
				String[] args = line.split("\\s+");
				lines.add(new StockMemento(args[0], args[1], args[2], args[3]));
			}
		} catch (IOException e) {
			throw new DataFileException(filename);
		} finally {
			try { if (br != null) br.close(); } catch (IOException ex) { }
		}
		return lines;
	}

}
