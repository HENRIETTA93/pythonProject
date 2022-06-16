# Written by Eric Martin for COMP9021


from math import sqrt


def encode(a, b):
    # Based on largest square centered on (0, 0) not containing
    # (a, b).
    half_side = max(abs(a) - 1, abs(b) - 1)
    if a == half_side + 1 and b == -half_side - 1:
        return (2 * half_side + 3) ** 2 - 1
    square_area = (2 * half_side + 1) ** 2
    if a == half_side + 1:
        return square_area + half_side + b
    if b == half_side + 1:
        return square_area + 3 * half_side  + 2 - a
    if a == -half_side - 1:
        return square_area + 5 * half_side + 4 - b
    return square_area + 7 * half_side + 6 + a

def decode(n):
    # Based on smallest square centered on (0, 0) containing
    # the pair encoded by n.
    sqrt_n_plus_one = int(sqrt(n + 1))
    # In case sqrt() approximates an integer from below.
    if sqrt_n_plus_one ** 2 < n + 1:
        sqrt_n_plus_one += 1
    half_side = sqrt_n_plus_one // 2
    side = half_side * 2 + 1
    square_area = side ** 2
    offset = square_area - n - 1
    if offset < side:
        return half_side - offset, -half_side
    if offset < 2 * side - 1:
        return -half_side, -3 * half_side + offset
    if offset < 3 * side - 2:
        return -5 * half_side + offset, half_side
    return half_side, 7 * half_side - offset
