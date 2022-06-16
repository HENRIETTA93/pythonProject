# Randomly fills an array of size 10x10 with 0s and 1s, and outputs the size of
# the largest parallelogram with horizontal sides.
# A parallelogram consists of a line with at least 2 consecutive 1s,
# with below at least one line with the same number of consecutive 1s,
# all those lines being aligned vertically in which case the parallelogram
# is actually a rectangle, e.g.
#      111
#      111
#      111
#      111
# or consecutive lines moved to the left by one position, e.g.
#      111
#     111
#    111
#   111
# or consecutive lines moved to the right by one position, e.g.
#      111
#       111
#        111
#         111
# The size is the number of 1s in the parallelogram. In the above examples, the size is 12.

from random import seed, randrange
import sys

dim = 10


def display_grid():
    for row in grid:
        print('   ', *row)


def size_of_largest_parallelogram():
    # REPLACE PASS ABOVE WITH YOUR CODE
    # row = dim - 1

    computational_stub = [[0 for _ in range(dim)]
                          for _ in range(dim)
                          ]

    computational_left_stub = [[0 for _ in range(dim)]
                               for _ in range(dim)
                               ]
    computational_right_stub = [[0 for _ in range(dim)]
                                for _ in range(dim)
                                ]
    for row in reversed(range(dim)):
        for col in range(dim):
            stub = 0
            rowi = row
            while rowi <= row and rowi >= 0 and grid[rowi][col] != 0:
                stub += 1
                rowi -= 1
            if stub<=1:
                stub=0
            computational_stub[row][col] = stub

            rowl=row
            coll=col
            left=0
            while rowl<=row and rowl>=0 and \
                    coll>=0 and coll<dim and \
                    grid[rowl][coll]!=0:
                left+=1
                rowl-=1
                coll-=1
            if left<=1:
                left=0
            computational_left_stub[row][col] =left

            rowr = row
            colr = col
            right = 0
            while rowr <= row and rowr >= 0 and \
                    colr >= 0 and colr < dim and \
                    grid[rowr][colr] != 0:
                right += 1
                rowr -= 1
                colr += 1
            if right <= 1:
                right = 0
            computational_right_stub[row][col] = right

    # print(("-------mid---------"))
    # for _ in computational_stub:
    #     print('  ', *_)
    #
    # print(("--------left--------"))
    # for _ in computational_left_stub:
    #     print('  ',*_)
    # print(("--------right--------"))
    # for _ in computational_right_stub:
    #     print('  ',*_)
        pass


    max_mid_area = compute(computational_stub)
    max_left_area=compute(computational_left_stub)
    max_right_area=compute(computational_right_stub)
    max_area=max(max_mid_area,max_right_area,max_left_area)
    # print("max_mid_area:",max_mid_area)
    # print("max_left_area:", max_left_area)
    # print("max_right_area:", max_right_area)

    return max_area

# POSSIBLY DEFINE OTHER FUNCTIONS
def compute(stub):
    row = dim - 1
    col = 0

    area_stub = [[0 for _ in range(dim)]
                 for _ in range(dim)
                 ]
    while row >= 0:
        for col in range(dim):
            colj = col
            width = 0
            height = stub[row][col]
            areas=[]
            while colj >= col and colj < dim and stub[row][colj] > 1:
                width += 1
                height = min(height, stub[row][colj])
                if width<=1:
                    areas.append(0)
                else:
                    areas.append(width*height)
                colj += 1
            # if width <= 1:
            #     width = 0
            if len(areas)>0:
                area_stub[row][col] = max(areas)
            else:
                area_stub[row][col]=0
        row -= 1

    max_area = 0
    for row in area_stub:
        new_row = row
        new_row.append(max_area)
        max_area = max(new_row)

    # for _ in area_stub:
    #     print('  ',*_)
    return max_area







try:

    for_seed, density = (int(x) for x in input('Enter two integers, the second '
                                               'one being strictly positive: '
                                               ).split()
                         )
    if density <= 0:
        raise ValueError
except ValueError:
    print('Incorrect input, giving up.')
    sys.exit()

seed(for_seed)
grid = [[int(randrange(density) != 0) for _ in range(dim)]
        for _ in range(dim)
        ]
print('Here is the grid that has been generated:')
display_grid()

size = size_of_largest_parallelogram()
if size:
    print('The largest parallelogram with horizontal sides '
          f'has a size of {size}.'
          )
else:
    print('There is no parallelogram with horizontal sides.')

# while True:
#     try:
#
#         for_seed, density = (int(x) for x in input('Enter two integers, the second '
#                                                    'one being strictly positive: '
#                                                    ).split()
#                              )
#         if density <= 0:
#             raise ValueError
#     except ValueError:
#         print('Incorrect input, giving up.')
#         sys.exit()
#
#     seed(for_seed)
#     grid = [[int(randrange(density) != 0) for _ in range(dim)]
#             for _ in range(dim)
#             ]
#     print('Here is the grid that has been generated:')
#     display_grid()
#     print("*******************************")
#     size = size_of_largest_parallelogram()
#     if size:
#         print('The largest parallelogram with horizontal sides '
#               f'has a size of {size}.'
#               )
#     else:
#         print('There is no parallelogram with horizontal sides.')
