# Randomly generates a grid of 0s and 1s and determines
# the maximum number of "spikes" in a shape.
# A shape is made up of 1s connected horizontally or vertically (it can contain holes).
# A "spike" in a shape is a 1 that is part of this shape and "sticks out"
# (has exactly one neighbour in the shape).
# Neighbours are only considered vertically or horizontally (not diagonally).


from random import seed, randrange
import sys


dim = 10


def display_grid():
    for row in grid:
        print('   ', *row)


# Returns the number of shapes we have discovered and "coloured".
# We "colour" the first shape we find by replacing all the 1s
# that make it with 2. We "colour" the second shape we find by
# replacing all the 1s that make it with 3.
def colour_shapes():
    # pass
    # Replace pass above with your code
    visited_list=[]
    visited=2
    for row in range(dim):
        for col in range(dim):
            if grid[row][col]==1:
                visits_grid(row,col,grid,visited)
                visited_list.append(visited)
                visited=visited+1
    # print("+++++++++++")
    # display_grid()
    # print(visited_list)
    return visited_list
    # pass



def max_number_of_spikes(nb_of_shapes):
    # pass
    # Replace pass above with your code
    max_spikes=0
    for shape in nb_of_shapes:
        spikes = 0
        for row in range(dim):
            for col in range(dim):
                if grid[row][col]==shape:
                    # if the point is on the four angles
                    if row==0 and col==0:
                        if grid[row+1][col]==0 or grid[row][col+1]==0:
                            spikes+=1
                    if row==dim-1 and col==0:
                        if grid[row-1][col]==0 or grid[row][col+1]==0:
                            spikes+=1
                    if row==0 and col==dim-1:
                        if grid[row+1][col]==0 or grid[row][col-1]==0:
                            spikes+=1
                    if row==dim-1 and col==dim-1:
                        if grid[row-1][col]==0 or grid[row][col-1]==0:
                            spikes+=1
                    # if the point is on the border but not the angles
                    if row>0 and row<dim-1 and col==0:
                        if grid[row-1][col]==0 and grid[row+1][col]==0 \
                            or \
                            grid[row-1][col]==0 and grid[row][col+1]==0 \
                            or \
                            grid[row+1][col]==0 and grid[row][col+1]==0:
                            spikes+=1
                    if row>0 and row<dim-1 and col==dim-1:
                        if grid[row-1][col]==0 and grid[row+1][col]==0 \
                            or \
                            grid[row-1][col]==0 and grid[row][col-1]==0 \
                            or \
                            grid[row+1][col]==0 and grid[row][col-1]==0:
                            spikes+=1
                    if col>0 and col<dim-1 and row==0:
                        if grid[row][col-1]==0 and grid[row][col+1]==0 \
                            or \
                            grid[row][col-1]==0 and grid[row+1][col]==0 \
                            or \
                            grid[row][col+1]==0 and grid[row+1][col]==0:
                            spikes+=1
                    if col>0 and col<dim-1 and row==dim-1:
                        if grid[row][col-1]==0 and grid[row][col+1]==0 \
                            or \
                            grid[row][col-1]==0 and grid[row-1][col]==0 \
                            or \
                            grid[row][col+1]==0 and grid[row-1][col]==0:
                            spikes+=1
                            pass
                    # if the point is in the area of the border
                    if row>0 and row<dim-1 and col>0 and col<dim-1:
                        if grid[row-1][col]==0 and grid[row][col-1]==0 and grid[row][col+1]==0 \
                            or \
                            grid[row+1][col]==0 and grid[row][col-1]==0 and grid[row][col+1]==0 \
                            or \
                            grid[row][col-1]==0 and grid[row-1][col]==0 and grid[row+1][col]==0 \
                            or \
                            grid[row][col+1]==0 and grid[row-1][col]==0 and grid[row+1][col]==0:
                            spikes+=1
                    max_spikes=max(max_spikes,spikes)
                    pass
    return max_spikes



# Possibly define other functions here
## define function that visits grid points
def visits_grid(row, col, grid,visited):
    grid[row][col]=visited
    if row-1>=0 and row-1<dim and col>=0 and col<dim and grid[row-1][col]==1:
        visits_grid(row-1,col,grid,visited)
    if row+1>=0 and row+1<dim and col>=0 and col<dim and grid[row+1][col]==1:
        visits_grid(row+1,col,grid, visited)
    if col-1>=0 and col-1<dim and row>=0 and row<dim and grid[row][col-1]==1:
        visits_grid(row,col-1,grid,visited)
    if col+1>=0 and col+1<dim and row>=0 and row<dim and grid[row][col+1]==1:
        visits_grid(row,col+1,grid,visited)



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
nb_of_shapes = colour_shapes()
print('The maximum number of spikes of some shape is:',
      max_number_of_spikes(nb_of_shapes)
     )

# while True:
#     try:
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
#     nb_of_shapes = colour_shapes()
#     print('The maximum number of spikes of some shape is:',
#           max_number_of_spikes(nb_of_shapes)
#           )