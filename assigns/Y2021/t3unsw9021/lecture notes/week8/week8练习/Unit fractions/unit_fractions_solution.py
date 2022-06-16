
from math import gcd


def reduce(numerator, denominator):
    the_gcd = gcd(numerator, denominator)
    return numerator // the_gcd, denominator // the_gcd

def subtract(numerator, denominator, unit_denominator):
    numerator = numerator * unit_denominator - denominator
    denominator *= unit_denominator
    return reduce(numerator, denominator)

def fibonacci_decomposition(N, D):
    print(f'{N}/{D} = ', end='')
    numerator, denominator = reduce(N, D)
    numerator %= denominator
    if not numerator:
        print(N // D)
        return
    if N > D:
        print(f'{N // D} + ', end='')
    decomposition = []
    while denominator % numerator:
        unit_denominator = denominator // numerator + 1
        decomposition.append(unit_denominator)
        numerator, denominator =\
                subtract(numerator, denominator, unit_denominator)
    decomposition.append(denominator)
    print(' + '.join(f'1/{unit_denominator}'
                         for unit_denominator in decomposition
                    )
         )

def shortest_length_decompositions(N, D):
    numerator, denominator = reduce(N, D)
    numerator %= denominator
    if not numerator:
        print(f'{N}/{D} = {N // D}')
        return
    length = 1
    while True:
        decompositions = fixed_length_decompositions(length, numerator,
                                                     denominator, 2
                                                    )
        if decompositions:
            for decomposition in decompositions:
                print(f'{N}/{D} = ', end='')
                if N > D:
                    print(f'{N // D} + ', end='')
                print(' + '.join(f'1/{unit_denominator}'
                                     for unit_denominator in decomposition
                                )
                     )
            return
        length += 1

def fixed_length_decompositions(length, N, D, minimum):
    if length == 1:
        if N == 1:
            return [[D]]
        return
    decompositions = []
    # Since we want N / D to be a sum of length many distinct terms,
    # the largest one being 1 / unit_denominator,
    # 1 / unit_denominator * length should be greater than N / D,
    # which is equivalent to unit_denominator < D * length / N,
    # which, since N and D are relatively prime, is equivalent to:
    #   - unit_denominator < D * length // N if N does not divide
    #     length;
    #   - unit_denominator < (D * length // N) + 1 if N divides length.   
    upper_bound = D * length // N
    if length % N:
        upper_bound += 1
    # 1 / unit_denominator should be smaller than N / D,
    # which is equivalent to unit_denominator > D / N,
    # which is equivalent to unit_denominator > D // N.   
    for unit_denominator in range(max(D // N + 1, minimum), upper_bound):
        numerator, denominator = subtract(N, D, unit_denominator)
        further_decompositions =\
                fixed_length_decompositions(length - 1, numerator, denominator,
                                            unit_denominator + 1
                                           )
        if further_decompositions:
            for decomposition in further_decompositions:
                decompositions.append([unit_denominator] + decomposition)
    return decompositions
