from stock_memento import StockMemento

class WarehouseReader:

    def __init__(self, filename):
        self.filename = filename

    def read_all(self):
        lines = []
        try:
            fp = open(self.filename)
            for i, line in enumerate(fp):
                args = line.split()
                lines.append(StockMemento(args[0], args[1], args[2], args[3]))
        except IOError as e:
            raise DataFileException(self.filename, e)
        finally:
            fp.close()
        return lines

