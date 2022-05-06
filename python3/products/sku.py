class Sku:

    def __init__(self, code, title, description, price):
        self.code = code
        self.title = title
        self.description = description
        self.price = price

    def compare(self, other):
        myCode = code[0] + code[1] + code[2]
        otherCode = other.code[0] + other.code[1] + other.code[2]
        return -1 if myCode < otherCode else (1 if myCode > otherCode else 0)

    def formatDescription(self):
        result = []
        words = self.description.split()
        currentLine = "  "
        for word in words:
            currentLine += word
            if len(currentLine) >= 60:
                result.append(currentLine)
                currentLine = "  "
            else:
                currentLine += " "
        if len(currentLine) > 2:
            result.append(currentLine)
        return result

