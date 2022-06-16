
from collections import deque


def grid_if_valid_and_solvable_8_puzzle(grid):
    if len(grid) != 3:
        return
    grid = [tile for row in grid for tile in row]
    try:
        grid[grid.index(None)] = 0
    except ValueError:
        pass
    if sorted(grid) != list(range(9)):
        return
    if sum(1 for i in range(8) for j in range(i + 1, 9)
                                   if grid[i] and grid[j] and grid[i] > grid[j]
          ) % 2:
        return
    return grid


def validate_8_puzzle(grid):
    if grid_if_valid_and_solvable_8_puzzle(grid):
        print('This is a valid eight puzzle, and it is solvable.')
    else:
        print('This is an invalid or unsolvable eight puzzle.')
    
def solve_8_puzzle(grid):
    grid = grid_if_valid_and_solvable_8_puzzle(grid)
    if not grid:
        return
    empty_cell = grid.index(0)
    grid[empty_cell] = ''
    grid = tuple(grid)
    # 0 1 2
    # 3 4 5
    # 6 7 8
    neighbouring_cells = {0: {1, 3}, 1: {0, 2, 4}, 2: {1, 5},
                          3: {0, 4, 6}, 4: {1, 3, 5, 7}, 5: {2, 4, 8},
                          6: {3, 7}, 7: {4, 6, 8}, 8: {5, 7}
                         }
    target_grid = tuple(range(1, 9)) + ('',)
    seen_grids = {grid}
    games_queue = deque([[(grid, empty_cell)]])
    while True:
        game = games_queue.popleft()
        grid, empty_cell = game[-1]
        if grid == target_grid:
            break
        for new_empty_cell in neighbouring_cells[empty_cell]:
            new_grid = list(grid)
            new_grid[empty_cell], new_grid[new_empty_cell] =\
                    new_grid[new_empty_cell], new_grid[empty_cell]
            new_grid = tuple(new_grid)
            if new_grid not in seen_grids:
                new_game = game + [(new_grid, new_empty_cell)]
                games_queue.append(new_game)
                seen_grids.add(new_grid)
    print('Here is the preferred minimal solution:')
    for grid, _ in game:
        print()
        for i in range(9):
            print(f'{grid[i]:3}', end='\n' if i % 3 == 2 else '')
