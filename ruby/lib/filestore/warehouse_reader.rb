module Filestore

	class WarehouseReader

		private String filename

		public WarehouseReader(String filename)
			@filename = filename
		end

		def readAll
			lines = []
			# BufferedReader br = null
			# try
			# 	br = new BufferedReader(new FileReader(filename))
			# 	String line
			# 	while ((line = br.readLine) != null)
			# 		String[] args = line.split("\\s+")
			# 		lines.add(new StockMemento(args[0], args[1], args[2], args[3]))
			# 	end
			# end catch (IOException e)
			# 	throw new DataFileException(filename)
			# end finally
			# 	try { if (br != null) br.close; end catch (IOException ex) { }
			# end
			return lines
		end

	end
end
