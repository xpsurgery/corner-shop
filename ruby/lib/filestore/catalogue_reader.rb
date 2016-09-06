module Filestore

	class CatalogueReader

		def initialize(filename)
			@filename = filename
		end

		def readAll
			lines = []
			# BufferedReader br = null
			# try
			# 	br = new BufferedReader(new FileReader(filename))
			# 	String line
			# 	while ((line = br.readLine) != null)
			# 		String[] args = line.split("\\^")
			# 		lines.add(args)
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
