module Filestore

	class CatalogueReader

		def initialize(filename)
			@filename = filename
		end

		def readAll
			lines = []
			begin
				File.foreach(@filename) do |line|
					args = line.split(/\^/)
					lines << args
				end
			rescue Exception => e
				throw DataFileException.new(filename)
			end
			lines
		end

	end
end
