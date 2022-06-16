# IMPORT ANY REQUIRED MODULE
import copy
import math
class MazeError(Exception):
    def __init__(self, message):
        self.message = message


class Maze:
    file_content=""
    maze_name=""
    maze_block=[]
    pillars=[]
    walls=[]

    def __init__(self, filename):
        # REPLACE PASS ABOVE WITH YOUR CODE

        self.maze_name=filename[0:-4]
        self.maze_block=[]
        self.pillars = []
        self.walls=[]
        file=open(filename,'r')
        self.file_content = file.read()
        self.get_input()

    # POSSIBLY DEFINE OTHER METHODS
    def get_file_content(self):
        return self.file_content

    def get_input(self):
        file_content=self.file_content
        file_content=file_content.replace(' ','')
        contents=file_content.split("\n")
        is_maze=True
        maze=[]
        rows_num=0
        for _ in contents:
            if _!='':
                rows_num+=1

        cols_num = 0
        for _ in contents:
            if _!='':
                cols_num=len(_)
                break
        for _ in contents:
            clen=len(_)
            if _=='':
                continue
            if cols_num!=clen:
                is_maze=False
                raise MazeError("Incorrect input.")
            else:
                maze_cols=[]
                for m in _:
                    if int(m) not in [0,1,2,3]:
                        is_maze=False
                        raise MazeError("Incorrect input.")
                    maze_cols.append(int(m))
                maze.append(maze_cols)

        m_last_line=maze[-1]
        for m in m_last_line:
            if m==2 or m==3:
                is_maze = False
                raise MazeError("Input does not represent a maze")

        for m in maze:
            if m[-1] == 1 or m[-1] == 3:
                is_maze = False
                raise MazeError("Input does not represent a maze")

        if rows_num<=1 or rows_num>41 or cols_num<=1 or cols_num>31:
            is_maze=False
            raise MazeError("Incorrect input")
        if is_maze:
            return maze

    def trans_maze_orgi01block(self,maze):
        rows_len=len(maze)
        cols_len=len(maze[0])
        block = [[0 for i in range(cols_len * 3)] for i in range(rows_len * 3)]

        for i in range(rows_len):
            for j in range(cols_len):
                if maze[i][j]==1:
                    for r in range(i*3,i*3 + 3):
                        for c in range(j*3,j*3+3):
                            if r==i*3:
                                block[r][c]=1

                elif maze[i][j]==2:
                    for r in range(i*3,i*3+3):
                        for c in range(j*3,j*3+3):
                            if c==j*3:
                                block[r][c]=1
                elif maze[i][j]==3:
                    for r in range(i*3,i*3+3):
                        for c in range(j*3,j*3+3):
                            if r==i*3 or c==j*3:
                                block[r][c]=1

        # for bl in block:
        #     print(bl)
        return block


    def trans_maze_block(self,maze_block):
        block=copy.deepcopy(maze_block)
        for i in range(len(maze_block)):
            for j in range(len(maze_block[0])):
                if i>=0 and j>0 and j%3==0 and maze_block[i][j-1]==1:
                    block[i][j]=1
                elif i>0 and j>=0 and i%3==0 and maze_block[i-1][j]==1:
                    block[i][j]=1
        self.maze_block=block
        # for bl in block:
        #     print(bl)
        return block
        pass

    def adv_maze_block(self,maze_block):
        block=copy.deepcopy(maze_block)
        rows_len=len(maze_block)-2
        cols_len=len(maze_block)-2


        for i in range(len(maze_block)):
            for j in range(len(maze_block[0])):
                if i>=0 and j>0 and j%3==1 and maze_block[i][j-1]==1:
                    block[i][j]=1
                if i>0 and j>=0 and i%3==1 and maze_block[i-1][j]==1:
                    block[i][j]=1
                if i>0 and j>0 and i%3==1 and maze_block[i-1][j-1]==1:
                    block[i][j]=1
        # for i in range(rows_len):
        #     for j in range(cols_len):
        #         if j+1<cols_len and maze_block[i][j]==1:
        #             block[i][j+1]=1
        #
        # for j in range(cols_len):
        #     for i in range(rows_len):
        #         if i+1<rows_len and maze_block[i][j]==1:
        #             block[i+1][j]=1

        # for b in block:
        #     print(b)
        return block
        pass

    ####analyse maze steps####
    def visited_points(self,row,col,block, visited,flag):
        rows_len=len(block)-2
        cols_len=len(block[0])-2
        block[row][col]=visited
        self.walls.append((row,col))

        if row-1>=0 and row-1<rows_len and col>=0 and col<cols_len and block[row-1][col]==flag:
            self.visited_points(row-1,col,block,visited,flag)
        if row+1>=0 and row+1<rows_len and col>=0 and col<cols_len and block[row+1][col]==flag:
            self.visited_points(row+1,col,block,visited,flag)
        if col-1>=0 and col-1<cols_len and row>=0 and row<rows_len and block[row][col-1]==flag:
            self.visited_points(row,col-1,block,visited,flag)
        if col+1>=0 and col+1<cols_len and row>=0 and row<rows_len and block[row][col+1]==flag:
            self.visited_points(row,col+1,block,visited,flag)
        pass


    def find_sets_walls(self,maze_block):
        block=copy.deepcopy(maze_block)
        visited=2
        count=0
        for i in range(len(block)-2):
            for j in range(len(block[0])-2):
                if block[i][j]==1:
                    self.visited_points(i, j, block, visited,1)
                    visited = visited + 1
                    count+=1
        return count
        pass

    def find_gates(self,maze_block):
        count = 0
        top = 0
        left = 0
        right = len(maze_block[0]) - 2
        bottom = len(maze_block) - 2

        while left < len(maze_block[0]) - 2:
            if maze_block[top][left] == 0 and left % 3 != 0:
                count += 1
            left += 1

        left = 0
        while left < len(maze_block[0]) - 2:
            if maze_block[bottom-1][left] == 0 and left % 3 != 0:
                count += 1
            left += 1

        left = 0
        top = 1
        while top < bottom - 1:
            if maze_block[top][left] == 0 and top % 3 != 0:
                count += 1
            top += 1
        top = 1
        while top < bottom - 1:
            if maze_block[top][right-1] == 0 and top % 3 != 0:
                count += 1
            top += 1
        return int(count / 2)
        pass

    def find_inner_points(self, maze_block, visited_list):
        block=copy.deepcopy(maze_block)
        rows_len=len(block)-2
        cols_len=len(block[0])-2
        counted=[]
        not_counted=[]
        areas=0
        inners = []
        for v in visited_list:
            it=0
            ib=rows_len-1
            j=0
            while j<cols_len:
                if block[it][j] in visited_list and block[it][j] not in not_counted:
                    not_counted.append(block[it][j])
                if block[ib][j] in visited_list and block[ib][j] not in not_counted:
                    not_counted.append(block[ib][j])
                j+=1

            i=0
            jl=0
            jr=cols_len-1
            while i<rows_len:
                if block[i][jl] in visited_list and block[i][jl] not in not_counted:
                    not_counted.append(block[i][jl])
                if block[i][jr] in visited_list and block[i][jr] not in not_counted:
                    not_counted.append(block[i][jr])
                i+=1
        counted=list(set(visited_list)-set(not_counted))
        # print(counted)



        for i in range(rows_len):
            for j in range(cols_len):
                if block[i][j] in counted:
                    inners.append((i,j))
                    if i%3!=0 and j%3!=0:
                        areas+=1
        return int(areas/4), counted,inners


    def find_paths(self,maze_block,visited_list, counted,pillars):
        block=copy.deepcopy(maze_block)
        with_gates=list(set(visited_list)-set(counted))
        gate_out={}
        paths=0
        # only considering sides
        rows_len=len(maze_block)
        cols_len=len(maze_block[0])

        # top and bottom
        ti=0
        bi=rows_len-3
        bbi=int(rows_len/3)-1
        j=0
        while j<cols_len-2:
            if j%3!=0 and block[ti][j] in with_gates:
                orig_loc=int(math.floor(j/3))
                if block[ti][j] not in gate_out.keys():
                    gate_out[block[ti][j]]=[(ti,orig_loc)]
                else:
                    gate_out_list=gate_out[block[ti][j]]
                    if (ti,orig_loc) not in gate_out_list:
                        gate_out[block[ti][j]].append((ti,orig_loc))

            if j%3!=0 and block[bi][j] in with_gates:
                orig_loc=int(math.floor(j/3))
                if block[bi][j] not in gate_out.keys():
                    gate_out[block[bi][j]]=[(bbi,orig_loc)]
                else:
                    gate_out_list=gate_out[block[bi][j]]
                    if (bbi,orig_loc) not in gate_out_list:
                        gate_out[block[bi][j]].append((bbi,orig_loc))
            j+=1

        # left and right
        jl= 0
        jr=cols_len-3
        jrr = int(cols_len/3)-1
        i = 0
        while i<rows_len-2:
            if i % 3 != 0 and block[i][jl] in with_gates:
                orig_loc = int(math.floor(i / 3))
                if block[i][jl] not in gate_out.keys():
                    gate_out[block[i][jl]] = [(orig_loc, jl)]
                else:
                    gate_out_list = gate_out[block[i][jl]]
                    if (orig_loc,jl) not in gate_out_list:
                        gate_out[block[i][jl]].append((orig_loc,jl))

            if i % 3 != 0 and block[i][jr] in with_gates:
                orig_loc = int(math.floor(i / 3))
                if block[i][jr] not in gate_out.keys():
                    gate_out[block[i][jr]] = [(orig_loc, jrr)]
                else:
                    gate_out_list = gate_out[block[i][jr]]
                    if (orig_loc,jrr) not in gate_out_list:
                        gate_out[block[i][jr]].append((orig_loc,jrr))
            i += 1

        # print(gate_out)
        for key_gate in gate_out.keys():
            if len(gate_out[key_gate])==2 \
                and self.is_only_one_path(maze_block,gate_out[key_gate][0],pillars,rows_len-2,cols_len-2):
                paths+=1
            if len(gate_out[key_gate])==1 and gate_out[key_gate][0]==(0,0) and (0,0) in pillars:
                paths+=1
        return paths

    # def find_accessible_culdesacs(self,maze_block, inner_points):
    #     block=copy.deepcopy(maze_block)
    #     rows_len=len(block)-2
    #     cols_len=len(block[0])-2
    #     count=0
    #     culdesacs=[]
    #     for i in range(rows_len):
    #         for j in range(cols_len):
    #             if block[i][j]!=1 and i-1>=0 and i+1<rows_len and j-1>=0 and j+1<cols_len:
    #                 if (block[i-1][j]==1 and block[i+1][j]==1 and block[i][j-1]==1 \
    #                     or \
    #                     block[i-1][j]==1 and block[i+1][j]==1 and block[i][j+1]==1 \
    #                     or \
    #                     block[i][j-1]==1 and block[i][j+1]==1 and block[i-1][j]==1 \
    #                     or \
    #                     block[i][j-1]==1 and block[i][j+1]==1 and block[i+1][j]==1) \
    #                         and block[i][j] not in culdesacs:
    #                     culdesacs.append(block[i][j])
    #                     count+=1
    #                 if block[i-1][j]==1 and block[i+1][j]==1 and block[i][j-1]==1 and block[i][j+1]==1:
    #                     count-=1
    #
    #     return len(list(set(culdesacs)-set(inner_points))),count
    #     pass

    def find_accessible_culdesacs(self,maze_block,inners):
        block=copy.deepcopy(maze_block)
        rows_len = len(maze_block) - 2
        cols_len = len(maze_block[0]) - 2
        cul=[]
        not_cul=[]
        for i in range(rows_len):
            for j in range(cols_len):
                if (i, j) not in inners:
                    if self.is_culdesacs(block,i,j):
                        self.set_culdesacs(i,j,i,j, block,cul,not_cul)
        # print(cul)
        # print(not_cul)
        # print(len(cul)-len(not_cul))
        return len(cul)-len(not_cul)


    def is_culdesacs(self,maze_block,i,j):
        rows_len = len(maze_block) - 2
        cols_len = len(maze_block[0]) - 2

        if maze_block[i][j] == 0 and i + 1 < rows_len and i - 1 >= 0 and j + 1 < cols_len \
                and maze_block[i + 1][j] == 1 and maze_block[i - 1][j] == 1 and maze_block[i][j + 1] == 1:
            if j == 0 or j - 1 >= 0 and maze_block[i][j - 1] == 0:
                return True

        elif maze_block[i][j] == 0 and i + 1 < rows_len and i - 1 >= 0 and j - 1 >= 0 \
                and maze_block[i + 1][j] == 1 and maze_block[i - 1][j] == 1 and maze_block[i][j - 1] == 1:
            if j == cols_len - 1 or j + 1 < cols_len and maze_block[i][j + 1] == 0:
                return True

        elif maze_block[i][j] == 0 and i + 1 < rows_len and j - 1 >= 0 and j + 1 < cols_len \
                and maze_block[i + 1][j] == 1 and maze_block[i][j - 1] == 1 and maze_block[i][j + 1] == 1:
            if i == 0 or i - 1 >= 0 and maze_block[i - 1][j] == 0:
                return True
        elif maze_block[i][j] == 0 and i - 1 >= 0 and j - 1 >= 0 and j + 1 < cols_len \
                and maze_block[i - 1][j] == 1 and maze_block[i][j - 1] == 1 and maze_block[i][j + 1] == 1:
            if i == rows_len - 1 or i + 1 < rows_len and maze_block[i + 1][j] == 0:
                return True

    def set_culdesacs(self,i,j,li,lj,maze_block, cul, not_cul):
        rows_len=len(maze_block)-2
        cols_len=len(maze_block[0])-2

        if maze_block[i][j]==0 and i+1<rows_len and i-1>=0 and j+1<cols_len \
            and maze_block[i+1][j]==1 and maze_block[i-1][j]==1 and maze_block[i][j+1]==1:
            if j==0:
                maze_block[i][j]=1
                cul.append((i,j))
            elif j-1>=0 and maze_block[i][j-1]==0:
                maze_block[i][j] = 1
                if (i+1,j) in cul:
                    not_cul.append((i+1,j))
                if (i-1,j) in cul:
                    not_cul.append((i-1,j))
                if (i,j+1) in cul:
                    not_cul.append((i,j+1))
                self.set_culdesacs(i,j-1,i,j,maze_block,cul, not_cul)

        elif maze_block[i][j]==0 and i+1<rows_len and i-1>=0 and j-1>=0\
            and maze_block[i+1][j]==1 and maze_block[i-1][j]==1 and maze_block[i][j-1]==1:
            if j==cols_len-1:
                maze_block[i][j]=1
                cul.append((i,j))
            elif j+1<cols_len and maze_block[i][j+1]==0:
                maze_block[i][j]=1
                if (i+1,j) in cul:
                    not_cul.append((i+1,j))
                if (i-1,j) in cul:
                    not_cul.append((i-1,j))
                if (i,j-1) in cul:
                    not_cul.append((i,j-1))
                self.set_culdesacs(i,j+1,i,j,maze_block,cul, not_cul)

        elif maze_block[i][j]==0 and i+1<rows_len and j-1>=0 and j+1<cols_len \
            and maze_block[i+1][j]==1 and maze_block[i][j-1]==1 and maze_block[i][j+1]==1:
            if i==0:
                maze_block[i][j]=1
                cul.append((i,j))
            elif i-1>=0 and maze_block[i-1][j]==0:
                maze_block[i][j] = 1
                if (i + 1, j) in cul:
                    not_cul.append((i + 1, j))
                if (i, j+1) in cul:
                    not_cul.append((i, j+1))
                if (i, j - 1) in cul:
                    not_cul.append((i, j - 1))
                self.set_culdesacs(i-1,j, i, j, maze_block, cul, not_cul)
        elif maze_block[i][j]==0 and i-1>=0 and j-1>=0 and j+1<cols_len \
            and maze_block[i-1][j]==1 and maze_block[i][j-1]==1 and maze_block[i][j+1]==1:
            if i==rows_len-1:
                maze_block[i][j]=1
                cul.append((i,j))
            elif i+1<rows_len and maze_block[i+1][j]==0:
                maze_block[i][j] = 1
                if (i - 1, j) in cul:
                    not_cul.append((i - 1, j))
                if (i, j+1) in cul:
                    not_cul.append((i, j+1))
                if (i, j - 1) in cul:
                    not_cul.append((i, j - 1))
                self.set_culdesacs(i+1,j, i, j, maze_block, cul, not_cul)
        else:
            if (li,lj) not in cul:
                cul.append((li,lj))



    def get_continued_areas(self,maze_block):
        block = copy.deepcopy(maze_block)
        visited = 2
        visited_list=[]
        for i in range(len(block) - 2):
            for j in range(len(block[0]) - 2):
                if block[i][j] == 0:
                    self.visited_points(i, j, block, visited, 0)
                    visited_list.append(visited)
                    visited = visited + 1
        return block,visited_list

    def find_accessible_areas(self,maze_block):
        block=copy.deepcopy(maze_block)
        visited=2
        count=0
        for i in range(len(block)-2):
            for j in range(len(block[0])-2):
                if block[i][j]==0:
                    self.visited_points(i, j, block, visited,0)
                    visited = visited + 1
                    count+=1
        return count
        pass
    def find_pillers(self,maze_block):
        block = copy.deepcopy(maze_block)
        rows_len=len(block)-2
        cols_len=len(block[0])-2
        count=0
        pillers=[]
        for i in range(len(block)-2):
            for j in range(len(block[0])-2):
                if i%3!=0 or j%3!=0:
                    continue
                lj_2=j-2
                rj_2=j+2
                lj_1=j-1
                rj_1=j+1
                ti_2=i-2
                bi_2=i+2
                ti_1=i-1
                bi_1=i+1
                # (0,0) bottom and right 1,2
                if i==0 and j==0 and block[i][j]==0:
                    if bi_2>=0 and bi_2<rows_len and block[bi_2][j]==0 \
                        and bi_1>=0 and bi_1<rows_len and block[bi_1][j]==0 \
                        and rj_2>=0 and rj_2<cols_len and block[i][rj_2]==0 \
                        and rj_1>=0 and rj_1<cols_len and block[i][rj_1]==0 \
                        and block[bi_1][rj_1]==0 and block[bi_2][rj_2]==0:
                        pillers.append((i,j))
                        count+=1
                # (0,cols_len-1) bottom and left 1,2
                elif i==0 and j==cols_len-1 and block[i][j]==0:
                    if bi_2>=0 and bi_2<rows_len and block[bi_2][j]==0 \
                        and bi_1>=0 and bi_1<rows_len and block[bi_1][j]==0 \
                        and lj_2>=0 and lj_2<cols_len and block[i][lj_2]==0 \
                        and lj_1>=0 and lj_1<cols_len and block[i][lj_1]==0 \
                        and block[bi_1][lj_1]==0 and block[bi_2][lj_2]==0:
                        pillers.append((i,j))
                        count+=1
                # (rows_len-1,0) top and right 1,2
                elif i==rows_len-1 and j==0 and block[i][j]==0:
                    if ti_2>=0 and ti_2<rows_len and block[ti_2][j]==0 \
                        and ti_1>=0 and ti_1<rows_len and block[ti_1][j]==0 \
                        and rj_2>=0 and rj_2<cols_len and block[i][rj_2]==0 \
                        and rj_1>=0 and rj_1<cols_len and block[i][rj_1]==0 \
                        and block[ti_1][rj_1]==0 and block[ti_2][rj_2]==0:
                        pillers.append((i,j))
                        count+=1
                # (rows_len-1,cols_len-1) top and left 1,2
                elif i==rows_len-1 and j==cols_len-1 and block[i][j]==0:
                    if ti_2>=0 and ti_2<rows_len and block[ti_2][j]==0 \
                        and ti_1>=0 and ti_1<rows_len and block[ti_1][j]==0 \
                        and lj_2>=0 and lj_2<cols_len and block[i][lj_2]==0 \
                        and lj_1>=0 and lj_1<cols_len and block[i][lj_1]==0 \
                        and block[ti_1][lj_1]==0 and block[ti_2][lj_2]==0:
                        pillers.append((i,j))
                        count+=1
                # (0,j) bottom right, and left 1,2
                elif i==0 and j!=0 and j!=cols_len-1 and block[i][j]==0:
                    if bi_2>=0 and bi_2<rows_len and block[bi_2][j]==0 \
                        and bi_1>=0 and bi_1<rows_len and block[bi_1][j]==0 \
                        and rj_2>=0 and rj_2<cols_len and block[i][rj_2]==0 \
                        and rj_1>=0 and rj_1<cols_len and block[i][rj_1]==0 \
                        and lj_2>=0 and lj_2<cols_len and block[i][lj_2]==0 \
                        and lj_1>=0 and lj_1<cols_len and block[i][lj_1]==0 \
                        and block[bi_1][rj_1] == 0 and block[bi_2][rj_2] == 0 \
                        and block[bi_1][lj_1] == 0 and block[bi_2][lj_2] == 0:
                        pillers.append((i,j))
                        count+=1
                # (rows_len-1,j) top right, and left 1,2
                elif i==rows_len-1 and j!=0 and j!=cols_len-1 and block[i][j]==0:
                    if ti_2>=0 and ti_2<rows_len and block[ti_2][j]==0 \
                        and ti_1>=0 and ti_1<rows_len and block[ti_1][j]==0 \
                        and rj_2>=0 and rj_2<cols_len and block[i][rj_2]==0 \
                        and rj_1>=0 and rj_1<cols_len and block[i][rj_1]==0 \
                        and lj_2>=0 and lj_2<cols_len and block[i][lj_2]==0 \
                        and lj_1>=0 and lj_1<cols_len and block[i][lj_1]==0 \
                        and block[ti_1][rj_1] == 0 and block[ti_2][rj_2] == 0 \
                        and block[ti_1][lj_1] == 0 and block[ti_2][lj_2] == 0:
                        pillers.append((i,j))
                        count+=1
                #(i,0) top, bottom, right 1,2
                elif i!=0 and i!=rows_len-1 and j==0 and block[i][j]==0:
                    if ti_2>=0 and ti_2<rows_len and block[ti_2][j]==0 \
                        and ti_1>=0 and ti_1<rows_len and block[ti_1][j]==0 \
                        and bi_2>=0 and bi_2<rows_len and block[bi_2][j]==0 \
                        and bi_1>=0 and bi_1<rows_len and block[bi_1][j]==0 \
                        and rj_2 >= 0 and rj_2 < cols_len and block[i][rj_2] == 0 \
                        and rj_1 >= 0 and rj_1 < cols_len and block[i][rj_1] == 0 \
                        and block[ti_1][rj_1] == 0 and block[ti_2][rj_2] == 0 \
                        and block[bi_1][rj_1] == 0 and block[bi_2][rj_2] == 0:
                        pillers.append((i,j))
                        count+=1
                # (i,cols_len-1) top, bottom, left 1,2
                elif i!=0 and i!=rows_len-1 and j==cols_len-1 and block[i][j]==0:
                    if ti_2 >= 0 and ti_2 < rows_len and block[ti_2][j] == 0 \
                        and ti_1 >= 0 and ti_1 < rows_len and block[ti_1][j] == 0 \
                        and bi_2 >= 0 and bi_2 < rows_len and block[bi_2][j] == 0 \
                        and bi_1 >= 0 and bi_1 < rows_len and block[bi_1][j] == 0 \
                        and lj_2 >= 0 and lj_2 < cols_len and block[i][lj_2] == 0 \
                        and lj_1 >= 0 and lj_1 < cols_len and block[i][lj_1] == 0 \
                        and block[ti_1][lj_1] == 0 and block[ti_2][lj_2] == 0 \
                        and block[bi_1][lj_1] == 0 and block[bi_2][lj_2] == 0:
                        pillers.append((i,j))
                        count+=1
                # (i,j) top, bottom, right,left 1,2
                else:
                    if ti_2 >= 0 and ti_2 < rows_len and block[ti_2][j] == 0 \
                        and ti_1 >= 0 and ti_1 < rows_len and block[ti_1][j] == 0 \
                        and bi_2 >= 0 and bi_2 < rows_len and block[bi_2][j] == 0 \
                        and bi_1 >= 0 and bi_1 < rows_len and block[bi_1][j] == 0 \
                        and lj_2 >= 0 and lj_2 < cols_len and block[i][lj_2] == 0 \
                        and lj_1 >= 0 and lj_1 < cols_len and block[i][lj_1] == 0 \
                        and rj_2 >= 0 and rj_2 < cols_len and block[i][rj_2] == 0 \
                        and rj_1 >= 0 and rj_1 < cols_len and block[i][rj_1] == 0 \
                        and block[ti_1][rj_1] == 0 and block[ti_2][rj_2] == 0 \
                        and block[bi_1][rj_1] == 0 and block[bi_2][rj_2] == 0 \
                        and block[ti_1][lj_1] == 0 and block[ti_2][lj_2] == 0 \
                        and block[bi_1][lj_1] == 0 and block[bi_2][lj_2] == 0:
                            pillers.append((i, j))
                            count+=1
        return count,pillers

    def is_only_one_path(self,maze_block, from_point,pillars,rows_len,cols_len ):
        for (i, j) in pillars:
            if i==0 or j==0 or i==rows_len-1 or j==cols_len-1:
                continue
            else:
                from_row=from_point[0]*3+1
                from_col =from_point[1]* 3 + 1
                if int((rows_len+2)/3-1) == from_point[0]:
                    from_row=from_point[0]*3
                # elif from_point[0]<rows_len:
                #     from_row=from_point[0]*3+1

                if int((cols_len+2)/3)-1== from_point[1]:
                    from_col=from_point[1]*3

                if maze_block[i][j]==maze_block[from_row][from_col]:
                    return False
        return True


    def analyse(self):
        # REPLACE PASS ABOVE WITH YOUR CODE
        orig_maze=self.get_input()
        orig_maze_block=self.trans_maze_orgi01block(orig_maze)
        maze_block=self.trans_maze_block(orig_maze_block)
        ## compute the number of gates
        gates=self.find_gates(maze_block)
        if gates==0:
            print("The maze has no gate.")
        elif gates==1:
            print("The maze has a single gate.")
        else:
            print("The maze has "+str(gates)+" gates.")
        pass
        ## compute the number of sets of walls
        sets_of_walls=self.find_sets_walls(maze_block)

        if sets_of_walls==0:
            print("The maze has no wall.")
        elif sets_of_walls==1:
            print("The maze has walls that are all connected.")
        else:
            print("The maze has "+str(sets_of_walls)+" sets of walls that are all connected.")

        # for c in maze_block:
        #     print(c)
        # print("--------------------")
        continued_block, visited_list=self.get_continued_areas(maze_block)
        # for c in continued_block:
        #     print(c)
        # print(visited_list)

        inner_points,inner_counted,inners=self.find_inner_points(continued_block,visited_list)

        if inner_points==0:
            print("The maze has no inaccessible inner point.")
        elif inner_points==1:
            print("The maze has a unique inaccessible inner point.")
        else:
            print("The maze has "+str(inner_points)+" inaccessible inner points.")
        # print(inners)

        all_areas=self.find_accessible_areas(maze_block)
        accessible_areas=all_areas-len(inner_counted)
        if accessible_areas==0:
            print("The maze has no accessible area.")
        elif accessible_areas==1:
            print("The maze has a unique accessible area.")
        else:
            print("The maze has "+str(accessible_areas)+" accessible areas.")
        # print(accessible_areas,accessible_areas-len(inner_counted))


        advanced_continued_block=self.adv_maze_block(maze_block)
        # culdesacs,count=self.find_accessible_culdesacs(advanced_continued_block,inner_counted)
        # print(culdesacs,count)

        culdesacs=self.find_accessible_culdesacs(advanced_continued_block,inners)
        if culdesacs==0:
            print("The maze has no accessible cul-de-sac.")
        elif culdesacs==1:
            print("The maze has accessible cul-de-sacs that are all connected.")
        else:
            print("The maze has "+str(culdesacs)+" sets of accessible cul-de-sacs that are all connected.")
        piller_count, pillers=self.find_pillers(maze_block)

        paths=self.find_paths(continued_block,visited_list,inner_counted,pillers)
        if paths == 0:
            print("The maze has no entry-exit path with no intersection not to cul-de-sacs.")
        elif paths  == 1:
            print("The maze has a unique entry-exit path with no intersection not to cul-de-sacs.")
        else:
            print("The maze has " + str(paths) + " entry-exit paths with no intersections not to cul-de-sacs.")


        for piller in pillers:
            self.pillars.append((int(piller[0]/3),int(piller[1]/3)))

        # print(self.pillars)
        # print(pillers)


    def display(self):
        # self.analyse()

        orig_maze = self.get_input()
        orig_maze_block = self.trans_maze_orgi01block(orig_maze)
        maze_block = self.trans_maze_block(orig_maze_block)
        ## compute the number of gates
        gates = self.find_gates(maze_block)

        ## compute the number of sets of walls
        sets_of_walls = self.find_sets_walls(maze_block)


        continued_block, visited_list = self.get_continued_areas(maze_block)


        inner_points, inner_counted, inners = self.find_inner_points(continued_block, visited_list)


        all_areas = self.find_accessible_areas(maze_block)
        accessible_areas = all_areas - len(inner_counted)

        # print(accessible_areas,accessible_areas-len(inner_counted))

        advanced_continued_block = self.adv_maze_block(maze_block)
        # culdesacs,count=self.find_accessible_culdesacs(advanced_continued_block,inner_counted)
        # print(culdesacs,count)

        culdesacs = self.find_accessible_culdesacs(advanced_continued_block, inners)
        piller_count, pillers = self.find_pillers(maze_block)

        paths = self.find_paths(continued_block, visited_list, inner_counted, pillers)

        for piller in pillers:
            self.pillars.append((int(piller[0] / 3), int(piller[1] / 3)))


        filename = self.maze_name + ".tex"
        f = open(filename, "w")
        f.write("\\documentclass[10pt]{article}\n")
        f.write("\\usepackage{tikz}\n")
        f.write("\\usetikzlibrary{shapes.misc}\n")
        f.write("\\usepackage[margin=0cm]{geometry}\n")
        f.write("\\pagestyle{empty}\n")
        f.write("\\tikzstyle{every node}=[cross out, draw, red]\n")
        f.write("\n")
        f.write("\\begin{document}\n")
        f.write("\n")
        f.write("\\vspace*{\\fill}\n")
        f.write("\\begin{center}\n")
        f.write("\\begin{tikzpicture}[x=0.5cm, y=-0.5cm, ultra thick, blue]\n")

        # Walls
        f.write("% Walls\n")
        # print("walls",self.walls)
        wall_wall=[]
        for wall in self.walls:
            if wall[0]%3==0 and wall[1]%3==0 and self.maze_block[wall[0]][wall[1]]==1:
                wall_wall.append((int(wall[1]/3),int(wall[0]/3)))

        y_wall={}
        x_wall={}
        for wall in wall_wall:
            y=wall[1]
            x=wall[0]
            if y not in y_wall.keys():
                y_wall[y]=[wall]
            else:
                y_wall[y].append(wall)
                y_wall[y].sort()
            if x not in x_wall.keys():
                x_wall[x]=[wall]
            else:
                x_wall[x].append(wall)
                x_wall[x].sort()


        for y in y_wall.keys():
            point_pairs=y_wall[y]
            y_wall_not_included = []
            for pair in point_pairs:
                if self.maze_block[pair[1]*3][pair[0]*3]==1:
                    if pair[0]*3!=0 and pair[0]*3!=len(self.maze_block[0])-3:
                        if self.maze_block[pair[1]*3][pair[0]*3-1]==0 and self.maze_block[pair[1]*3][pair[0]*3+1]==0:
                            y_wall_not_included.append(pair)
                    if pair[0]*3==0:
                        if self.maze_block[pair[1]*3][pair[0]*3+1]==0:
                            y_wall_not_included.append(pair)
                    if pair[0]*3==len(self.maze_block[0])-3:
                        if self.maze_block[pair[1] * 3][pair[0] * 3 - 1] == 0:
                            y_wall_not_included.append(pair)

            y_wall[y]=list(set(point_pairs)-set(y_wall_not_included))
            y_wall[y].sort()
        for x in x_wall.keys():
            point_pairs=x_wall[x]
            x_wall_not_included = []
            for pair in point_pairs:
                if self.maze_block[pair[1]*3][pair[0]*3]==1:
                    if pair[1]*3!=0 and pair[1]*3!=len(self.maze_block)-3:
                        if self.maze_block[pair[1]*3-1][pair[0]*3]==0 and self.maze_block[pair[1]*3+1][pair[0]*3]==0:
                            x_wall_not_included.append(pair)
                    if pair[1]*3==0:
                        if self.maze_block[pair[1]*3+1][pair[0]*3]==0:
                            x_wall_not_included.append(pair)
                    if pair[1]*3==len(self.maze_block)-3:
                        if self.maze_block[pair[1] * 3-1][pair[0] * 3] == 0:
                            x_wall_not_included.append(pair)

            x_wall[x]=list(set(point_pairs)-set(x_wall_not_included))
            x_wall[x].sort()
        # print(x_wall)

        y_wall_keys=list(y_wall.keys())
        y_wall_keys.sort()
        for ykey in y_wall_keys:
            walls_pairs=y_wall[ykey]
            draw="    \\draw "
            begin_wall=walls_pairs[0]
            wall_path=[begin_wall]
            for wall in walls_pairs:
                if wall!=begin_wall:
                    if self.is_wally_connected(wall_path[-1], wall):
                        wall_path.append(wall)
                    else:
                        f.write(draw+str(wall_path[0]).replace(' ','')+" -- "+str(wall_path[-1]).replace(' ','')+";\n")
                        wall_path=[]
                        wall_path.append(wall)
            f.write(draw + str(wall_path[0]).replace(' ','') + " -- " + str(wall_path[-1]).replace(' ','') + ";\n")

        x_wall_keys = list(x_wall.keys())
        x_wall_keys.sort()
        for xkey in x_wall_keys:
            walls_pairs=x_wall[xkey]
            draw="    \\draw "
            begin_wall=walls_pairs[0]
            wall_path=[begin_wall]
            for wall in walls_pairs:
                if wall!=begin_wall:
                    if self.is_wallx_connected(wall_path[-1], wall):
                        wall_path.append(wall)
                    else:
                        f.write(draw+str(wall_path[0]).replace(' ','')+" -- "+str(wall_path[-1]).replace(' ','')+";\n")
                        wall_path=[]
                        wall_path.append(wall)
            f.write(draw + str(wall_path[0]).replace(' ','') + " -- " + str(wall_path[-1]).replace(' ','') + ";\n")

        #Pillars
        f.write("% Pillars\n")

        for pillar in self.pillars:
            f.write("    \\fill[green] ("+str(pillar[1])+","+str(pillar[0])+") circle(0.2);\n")

        f.write("% Inner points in accessible cul-de-sacs\n")

        f.write("% Entry-exit paths without intersections\n")


        f.write("\\end{tikzpicture}\n")
        f.write("\\end{center}\n")
        f.write("\\vspace*{\\fill}\n")
        f.write("\\vspace*{\\fill}\n")
        f.write("\n")
        f.write("\\end{document}\n")

    def is_wally_connected(self,wall1,wall2):
        x1=wall1[1]
        y1=wall1[0]

        x2=wall2[1]
        y2=wall2[0]

        if self.maze_block[x1*3][y1*3+1]==1 and self.maze_block[x1*3][y1*3+2]==1 and x2==x1 and y2*3==y1*3+3:
            return True
        return False
    def is_wallx_connected(self,wall1,wall2):
        x1=wall1[1]
        y1=wall1[0]

        x2=wall2[1]
        y2=wall2[0]

        if self.maze_block[x1*3+1][y1*3]==1 and self.maze_block[x1*3+2][y1*3]==1 and y2==y1 and x2*3==x1*3+3:
            return True
        return False




# t1=Maze("maze_t1.txt")
# t1.analyse()
# maze1=Maze("labyrinth.txt")
# maze=maze1.get_input()
# print(maze)
# block=maze1.trans_maze_orgi01block(maze)

print("----------------------------------------------")

print("----------------------------------------------")
print("expample1=Maze('example1.txt')")
expample1=Maze("example1.txt")
expample1.analyse()

print("----------------------------------------------")
print("expample2=Maze('example2.txt')")
expample2=Maze("example2.txt")
expample2.analyse()

print("----------------------------------------------")
print("expample3=Maze('example3.txt')")
expample3=Maze("example3.txt")
expample3.analyse()

print("----------------------------------------------")
print("expample4=Maze('example4.txt')")
expample4=Maze("example4.txt")
expample4.analyse()

print("----------------------------------------------")
print("maze1=Maze('maze_1.txt')")
maze1=Maze("maze_1.txt")
maze1.analyse()
maze1.display()

print("----------------------------------------------")
print("maze2=Maze('maze_2.txt')")
maze2=Maze("maze_2.txt")
maze2.analyse()
maze2.display()
print("----------------------------------------------")
print("labyrinth=Maze('labyrinth.txt')")
labyrinth=Maze("labyrinth.txt")
labyrinth.analyse()
labyrinth.display()
print("----------------------------------------------")
print("BiggestMaze=Maze('BiggestMaze.txt')")
biggest_maze=Maze("BiggestMaze.txt")
biggest_maze.analyse()
biggest_maze.display()




# m1=Maze("incorrect_input_1.txt")
# m2=Maze("incorrect_input_2.txt")
# m3=Maze("not_a_maze_1.txt")
# m4=Maze("not_a_maze_2.txt")



