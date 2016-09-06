module Filestore

  class DataFileException < StandardError

  	def initialize(filename, e)
  		super("Could not read file #{filename}: #{e}")
  	end

  end
end
