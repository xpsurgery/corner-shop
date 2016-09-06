module Filestore

require_relative java.io.BufferedReader
require_relative java.io.FileReader
require_relative java.io.IOException
require_relative java.util.ArrayList
require_relative java.util.List

public class WarehouseReader

	private String filename

	public WarehouseReader(String filename)
		this.filename = filename
	end

	public List<StockMemento> readAll
		List<StockMemento> lines = new ArrayList<StockMemento>
		BufferedReader br = null
		try
			br = new BufferedReader(new FileReader(filename))
			String line
			while ((line = br.readLine) != null)
				String[] args = line.split("\\s+")
				lines.add(new StockMemento(args[0], args[1], args[2], args[3]))
			end
		end catch (IOException e)
			throw new DataFileException(filename)
		end finally
			try { if (br != null) br.close; end catch (IOException ex) { }
		end
		return lines
	end

end
