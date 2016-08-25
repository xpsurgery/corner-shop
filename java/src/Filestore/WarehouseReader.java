package Filestore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WarehouseReader {

	public WarehouseReader(String filename) {
	}

	public List<StockMemento> readAll() {
		List<StockMemento> lines = new ArrayList<StockMemento>();
		lines.add(new StockMemento("01", "12", "1045", "3"));
		lines.add(new StockMemento("10", "04", "2761", "17"));
		lines.add(new StockMemento("24", "17", "5990", "50"));
		lines.add(new StockMemento("01", "01", "6000", "105"));
		return lines;
	}

}
