module Warehouse

  class InvalidNumItemsException < StandardError

    def initialize(numItems)
      super("Please supply a number of items greater than zero")
    end

  end
end
