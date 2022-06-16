
while True:
    try:
        height = int(input('Enter a strictly positive integer: '))
        if height <= 0:
            raise ValueError
        break
    except ValueError:
        print('Incorrect input, try again.')
A_code = ord('A')
c = A_code
for i in range(1, height + 1):
    # Displays spaces on the left
    print(' ' * (height - i), end='')
    # Displays letters before middle column
    for _ in range(1, i):
        print(chr(c), end='')
        # Code of next letter
        c = (c - A_code + 1) % 26 + A_code
    # Displays middle column
    print(chr(c), end='')
    # Displays letters after middle column
    for _ in range(1, i):
        # Code of previous letter
        c = (c - A_code - 1) % 26 + A_code
        print(chr(c), end='')
    print()
    # Code of first letter to be input on next line
    c = ((1 + i) * i // 2) % 26 + A_code
