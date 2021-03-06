require_relative './data_file_exception'
require_relative './stock_memento'

module Filestore

	class WarehouseReader

		def initialize(filename)
			@filename = filename
		end

		def read_all
			lines = []
			begin
				File.foreach(@filename) do |line|
					args = line.split(/\s+/)
					lines << StockMemento.new(args[0], args[1], args[2], args[3])
				end
			rescue Exception => e
				raise DataFileException.new(@filename, e)
			end
			lines
		end

	end
end
