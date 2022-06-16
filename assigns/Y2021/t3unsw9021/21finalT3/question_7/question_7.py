# COMP9021 21T3 - Rachid Hamadi
# Final Exam Question 7

from random import seed, randrange

def area(for_seed, sparsity, i, j):
    '''
    You can assume that i and j are both between 0 and 9 included.
    i is the row number (indexed from top to bottom),
    j is the column number (indexed from left to right)
    of the displayed grid.
    
    >>> area(0, 1, 5, 5)
    The grid is:
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    The area of the largest empty region of the grid
    containing the point (5, 5) is: 0
    >>> area(0, 1000, 5, 5)
    The grid is:
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    The area of the largest empty region of the grid
    containing the point (5, 5) is: 100
    >>> area(0, 3, 6, 2)
    The grid is:
    0 0 1 0 0 0 0 0 0 0
    0 1 0 1 0 1 1 0 0 0
    0 0 1 0 1 0 1 0 0 0
    0 1 0 0 0 0 0 1 0 0
    0 0 0 1 0 1 1 0 0 0
    0 0 1 0 0 0 1 0 0 0
    1 1 0 1 1 1 0 0 1 1
    0 0 0 1 0 0 0 0 1 0
    0 0 1 0 0 0 0 0 1 0
    0 0 0 1 0 1 1 1 1 0
    The area of the largest empty region of the grid
    containing the point (6, 2) is: 9
    >>> area(0, 2, 9, 5)
    The grid is:
    0 0 1 0 0 0 0 0 0 1
    1 0 1 1 0 1 0 1 1 0
    0 1 0 0 0 1 0 0 0 1
    1 1 0 1 0 0 1 0 1 1
    1 1 1 0 1 1 0 0 1 0
    0 1 0 1 0 0 1 0 0 1
    0 1 1 1 1 0 0 1 1 1
    1 1 1 0 0 1 1 0 0 0
    0 0 1 0 1 0 0 1 1 1
    0 1 1 0 1 0 0 1 1 1
    The area of the largest empty region of the grid
    containing the point (9, 5) is: 4
    >>> area(0, 2, 2, 7)
    The grid is:
    0 0 1 0 0 0 0 0 0 1
    1 0 1 1 0 1 0 1 1 0
    0 1 0 0 0 1 0 0 0 1
    1 1 0 1 0 0 1 0 1 1
    1 1 1 0 1 1 0 0 1 0
    0 1 0 1 0 0 1 0 0 1
    0 1 1 1 1 0 0 1 1 1
    1 1 1 0 0 1 1 0 0 0
    0 0 1 0 1 0 0 1 1 1
    0 1 1 0 1 0 0 1 1 1
    The area of the largest empty region of the grid
    containing the point (2, 7) is: 22
    >>> area(0, 4, 2, 7)
    The grid is:
    0 0 1 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 1 1 0
    0 1 0 0 0 0 0 0 0 1
    1 1 0 1 0 0 0 0 1 0
    0 0 0 0 1 1 0 0 1 0
    0 1 0 0 0 0 1 0 0 0
    0 0 0 0 1 0 0 1 1 0
    0 1 1 0 0 0 0 0 0 0
    0 0 1 0 1 0 0 0 0 1
    0 1 0 0 0 0 0 1 1 0
    The area of the largest empty region of the grid
    containing the point (2, 7) is: 73
    '''
    
    seed(for_seed)
    grid = [[int(randrange(sparsity) == 0) for _ in range(10)]
                for _ in range(10)
           ]
    print('The grid is:')
    for row in grid:
        print(*row)

    
    # ADD YOUR CODE HERE (A PRINT STATEMENT AT THE END IS NEEDED)
    area=0
    if grid[i][j]!=0:
        area=0
    else:
        visited_grid_from(i,j,grid,2)
        # print(grid)
        for row in range(len(grid)):
            for col in range(len(grid[0])):
                if grid[row][col]==2:
                    area+=1


    print('The area of the largest empty region of the grid')
    print(f'containing the point ({i}, {j}) is: {area}', end = '')
# POSSIBLY DEFINE OTHER FUNCTIONS
def visited_grid_from(i,j,grid,k):
    grid[i][j]=k
    h_grid=len(grid)
    l_grid=len(grid[0])
    if i+1<h_grid and j>=0 and j<l_grid and grid[i+1][j]==0:
        visited_grid_from(i + 1, j, grid,k)
    if i-1>=0 and j>=0 and j<l_grid and grid[i-1][j]==0:
        visited_grid_from(i -1, j, grid,k)
    if i>=0 and i<h_grid and j+1<l_grid and grid[i][j+1]==0:
        visited_grid_from(i,j+1,grid,k)
    if i>=0 and i<h_grid and j-1>=0 and grid[i][j-1]==0:
        visited_grid_from(i,j-1,grid,k)





if __name__ == '__main__':
    import doctest
    doctest.testmod()
    # area(0,4,2,7)

