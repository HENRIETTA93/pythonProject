
while True:
    try:
        N = int(input('Enter a natural number: '))
        if N < 0:
            raise ValueError
        break
    except ValueError:
        print('Incorrect input, try again')
pascal_triangle = [[1] * (n + 1) for n in range(N + 1)]
for n in range(2, N + 1):
    for k in range(1, n // 2 + 1):
        pascal_triangle[n][k] = pascal_triangle[n - 1][k - 1]\
                                + pascal_triangle[n - 1][k]
    for k in range(1, (n + 1) // 2):
        pascal_triangle[n][n - k] = pascal_triangle[n][k]
width = len(str(pascal_triangle[N][N // 2]))
for n in range(N + 1):
    print(' ' * width * (N - n), end = '')
    print((' ' * width).join(f'{pascal_triangle[n][k]:{width}}'
                                  for k in range(n + 1))
         )
