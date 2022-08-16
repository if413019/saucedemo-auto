def get_float_value_of_currency(currency):
    return float(''.join(c for c in currency if (c.isdigit() or c == '.')))
