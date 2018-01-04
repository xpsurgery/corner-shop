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

    def description(self):
        result = []
        words = self.description.split()
        current_line = "  "
        for word in words:
            current_line += word
            if current_line.length >= 60:
                result << current_line
                current_line = "  "
            else:
                current_line += " "
        if current_line.length > 2:
            result.append(current_line)
        return result

