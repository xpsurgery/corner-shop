class CatalogueReader:

    def __init__(self, filename):
        self.filename = filename

    def readAll(self):
        lines = []
        try:
            fp = open(self.filename)
            for i, line in enumerate(fp):
                lines.append(line.split('^'))
        except IOError as e:
            raise DataFileException(self.filename, e)
        finally:
            fp.close()
        return lines

