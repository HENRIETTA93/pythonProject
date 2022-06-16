import copy
def find_inner_points(self, maze_block, visited_list):
    block = copy.deepcopy(maze_block)
    rows_len = len(block) - 2
    cols_len = len(block[0]) - 2
    areas = []
    not_include = []
    for i in range(rows_len):
        for j in range(cols_len):
            if block[i][j] not in visited_list or block[i][j] in not_include:
                continue
            if (i == 0 or i == rows_len - 1 or j == 0 or j == cols_len - 1) \
                    and block[i][j] in visited_list and block[i][j] not in not_include:
                not_include.append(block[i][j])
                # if block[i][j] in areas:
                #     for _ in areas:
                #         if _==block[i][j]:
                #             areas.remove(_)
                continue
            else:
                if i % 3 == 0 or j % 3 == 0:
                    continue
                else:
                    areas.append(block[i][j])

    for _ in not_include:
        if _ in areas:
            for a in areas:
                if a == _:
                    areas.remove(a)
    # for v in visited_list:
    #     for i in range(rows_len):
    #         for j in range(cols_len):
    #             if (i==0 or i==rows_len-1 or j==0 or j==cols_len-1) \
    #                     and block[i][j]==v:
    #                 if v in areas:
    #                     areas.remove(v)
    #                 break
    #             else:
    #                 if (i%3==0 or j%3==0) and block[i][j]==v:
    #                     continue
    #                 else:
    #                     areas.append(block[i][j])
    return int(len(areas) / 4)

    pass