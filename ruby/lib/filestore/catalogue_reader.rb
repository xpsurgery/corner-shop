module Filestore

require_relative java.io.BufferedReader
require_relative java.io.FileReader
require_relative java.io.IOException
require_relative java.util.ArrayList
require_relative java.util.List

public class CatalogueReader

	private String filename

	public CatalogueReader(String filename)
		this.filename = filename
	end

	public List<String[]> readAll
		List<String[]> lines = new ArrayList<String[]>
		BufferedReader br = null
		try
			br = new BufferedReader(new FileReader(filename))
			String line
			while ((line = br.readLine) != null)
				String[] args = line.split("\\^")
				lines.add(args)
			end
		end catch (IOException e)
			throw new DataFileException(filename)
		end finally
			try { if (br != null) br.close; end catch (IOException ex) { }
		end
		return lines
	end

end
