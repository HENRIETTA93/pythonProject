def encode(n):
    numbers = fibonacci_numbers_up_to_n(n)
    bits = ['0'] * len(numbers) + ['1']
    remainder = n
    for i in range(len(numbers) - 1, -len(numbers), -1):
        if remainder == 0:
            break
        if remainder >= numbers[i]:
            bits[i] = '1'
            remainder -= numbers[i]
    return ''.join(bits)

def decode(code):
    if len(code) < 2 or code[-2 :] != '11':
        return 0
    previous_bit_set = False
    previous = 1
    current = 1
    n = 0
    for bit in (int(c) for c in code[: -1]):
        if bit:
            if previous_bit_set:
                return 0
            previous_bit_set = True
            n += current
        else:
            previous_bit_set = False            
        previous, current = current, previous + current
    return n

def fibonacci_numbers_up_to_n(n):
    previous = 1
    current = 1
    numbers = []
    while current <= n:
        numbers.append(current)
        previous, current = current, previous + current
    return numbers
