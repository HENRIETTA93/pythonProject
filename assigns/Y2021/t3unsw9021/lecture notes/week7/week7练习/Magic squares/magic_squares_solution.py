
def is_magic_square(square):
    n = len(square)
    if any(len(line) != n for line in square):
        return False
    if {number for line in square for number in line} !=\
                                               set(range(1, n ** 2 + 1)):
        return False
    the_sum = n * (n ** 2 + 1) // 2
    if not_good_lines(square, the_sum):
        return False
    if not_good_lines([[square[i][j] for i in range(n)] for j in range(n)],
                      the_sum
                    ):
        return False
    if sum(square[i][i] for i in range(n)) != the_sum:
        return False
    if sum(square[i][n - 1 - i] for i in range(n)) != the_sum:
        return False
    return True

def not_good_lines(square, the_sum):
    return any(sum(line) != the_sum for line in square)

def print_square(square):
    field_width = len(str(len(square) ** 2))
    for line in square:
        print(' '.join(f'{number:{field_width}}' for number in line))

    return square

