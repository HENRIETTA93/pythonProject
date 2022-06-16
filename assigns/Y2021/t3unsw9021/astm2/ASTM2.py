
# IMPORT ANY REQUIRED MODULE
import copy as cp

class MazeError(Exception):
    def __init__(self, message):
        self.message = message


class Maze:
    maze=[]
    maze_info=[]
    filename=''
    inner_points=[]
    gates=[]
    coloured_maze=[]
    colours=[]
    pillers=[]
    def __init__(self, filename):
        self.filename=filename.split('.')[0]
        f=open(filename,'r')
        maze_str=f.read()
        f.close()
        self.maze=[]
        self.maze_info=[]
        self.inner_points=[]
        self.gates=[]
        self.colours=[]
        self.coloured_maze=[]
        self.pillers=[]
        maze_strs=maze_str.split('\n')
        for m_line in maze_strs:
            m_line=m_line.strip()
            if m_line!='':
                line = []
                for m in m_line:
                    if m != ' ':
                        line.append(int(m))
                self.maze.append(line)
        self.check_maze()
        # print(self.maze)
    def __del__(self):
        self.maze = []
        self.maze_info = []



    # POSSIBLY DEFINE OTHER METHODS
    def check_maze(self):
        first_col=len(self.maze[0])
        for m_line in self.maze:
            if len(m_line)!=first_col:
                raise MazeError('Incorrect input.')
            else:
                for m in m_line:
                    if m !=0 and m!=1 and m!=2 and m!=3:
                        raise MazeError('Incorrect input.')
        if len(self.maze)<=1 or len(self.maze)>41 or len(self.maze[0])<=1 or len(self.maze[0])>31:
            raise MazeError('Incorrect input.')

        for m in self.maze[-1]:
            if m==2 or m==3:
                raise MazeError("Input does not represent a maze.")
        for m_line in self.maze:
            if m_line[-1]==3 or m_line[-1]==1:
                raise MazeError("Input does not represent a maze")

            pass
    def maze_to_2_2(self):
        self.maze_info=[]
        height=len(self.maze)
        width=len(self.maze[0])
        maze_all_01s=[[0 for _ in range(width*2)] for _ in range(height*2)]

        for i in range(height*2):
            for j in range(width*2):
                oi=int(i/2)
                oj=int(j/2)
                xi=int(i%2)
                xj=int(j%2)
                if self.maze[oi][oj]==1:
                    if xi==0:
                        maze_all_01s[i][j]=1
                elif self.maze[oi][oj]==2:
                    if xj==0:
                        maze_all_01s[i][j]=1
                elif self.maze[oi][oj]==3:
                    if xi==0 or xj==0:
                        maze_all_01s[i][j]=1

        for i in range(len(maze_all_01s)):
            for j in range(len(maze_all_01s[0])):
                if i%2==0 and j%2==0:
                    if i-1>=0 and maze_all_01s[i-1][j]==1:
                        maze_all_01s[i][j]=1
                    if j-1>=0 and maze_all_01s[i][j-1]==1:
                        maze_all_01s[i][j]=1
        # for _ in maze_all_01s:
        #     print(_)
        self.maze_info=maze_all_01s
        pass


    def get_gates(self):
        maze_all_01s=self.maze_info
        gate_count=0
        for j in range(len(maze_all_01s[0])-1):
            if j%2==1 and maze_all_01s[0][j]==0:
                self.gates.append((0,j))
                gate_count+=1
            if j%2==1 and maze_all_01s[len(maze_all_01s)-2][j]==0:
                self.gates.append((len(maze_all_01s)-2, j))
                gate_count+=1
        for i in range(len(maze_all_01s)-1):
            if i%2==1 and maze_all_01s[i][0]==0:
                self.gates.append((i,0))
                gate_count+=1
            if i%2==1 and maze_all_01s[i][len(maze_all_01s[0])-2]==0:
                self.gates.append((i, len(maze_all_01s[0])-2))
                gate_count+=1
        return gate_count

    def get_sets_walls(self):
        sets_walls_num=0
        coloured=2
        maze_maze=cp.deepcopy(self.maze_info)
        for i in range(len(maze_maze)-1):
            for j in range(len(maze_maze[0])-1):
                if maze_maze[i][j]==1:
                    self.colours_walls(i,j,maze_maze,coloured)
                    coloured=coloured+1
        return coloured-2

    def get_nacc_acc_points(self):
        maze_maze=cp.deepcopy(self.maze_info)
        nacc_points_num=0
        coloured=2
        acc_sets=[]

        for i in range(len(maze_maze)-1):
            for j in range(len(maze_maze[0])-1):
                if maze_maze[i][j]==0:
                    self.colours_points(i,j,maze_maze,coloured)
                    self.colours.append(coloured)
                    coloured=coloured+1
        self.coloured_maze=maze_maze
        coloured=coloured-1

        for i in range(len(maze_maze) - 1):
            if maze_maze[i][0] not in acc_sets and maze_maze[i][0]!=1:
                acc_sets.append(maze_maze[i][0])
            if maze_maze[i][len(maze_maze[0])-2] not in acc_sets and maze_maze[i][len(maze_maze[0])-2]!=1:
                acc_sets.append(maze_maze[i][len(maze_maze[0])-2])
        for j in range(len(maze_maze[0])-1):
            if maze_maze[0][j] not in acc_sets and maze_maze[0][j]!=1:
                acc_sets.append(maze_maze[0][j])
            if maze_maze[len(maze_maze)-2][j] not in acc_sets and maze_maze[len(maze_maze)-2][j]!=1:
                acc_sets.append(maze_maze[len(maze_maze)-2][j])

        # print(acc_sets)
        # nacc_points_num=coloured-len(acc_sets)
        for i in range(1,len(maze_maze)-2):
            for j in range(1,len(maze_maze[0])-2):
                if maze_maze[i][j] not in acc_sets and maze_maze[i][j]!=1:
                    self.inner_points.append((i,j))
                    if i%2==1 and j%2==1:
                        nacc_points_num+=1

        return nacc_points_num,len(acc_sets)
        pass

    def get_paths(self):
        maze_maze=cp.deepcopy(self.coloured_maze)
        colour_gates={}
        height=len(maze_maze)-1
        width=len(maze_maze[0])-1
        path_num=0
        for colour in self.colours:
            colour_gates[colour]=[]
            for piller in self.pillers:
                if piller[0]!=0 and piller[0]!=height-1 and piller[1]!=0 and piller[1]!=width-1 \
                      and maze_maze[piller[0]][piller[1]]==colour and (100,100) not in colour_gates[colour]:
                    colour_gates[colour].append((100,100))

            for i in range(height):
                for j in range(width):
                    if maze_maze[i][j]==colour and (i,j) in self.gates and (100,100) not in colour_gates[colour]:
                        colour_gates[colour].append((i,j))

        for c_gate in colour_gates.keys():
            if len(colour_gates[c_gate])==2:
                path_num+=1

        # print("================")
        # print(self.pillers)
        # print(colour_gates)
        # print("================")
        return path_num

    def get_cul_de_sacs(self):
        maze_maze=cp.deepcopy(self.maze_info)

        height =len(maze_maze)-1
        width=len(maze_maze[0])-1

        stop_points=[]
        inter_points=[]

        for i in range(height):
            for j in range(width):
                if i-1>=0 and i+1<height and j-1>=0 and j+1<width\
                    and maze_maze[i-1][j]==1 and maze_maze[i+1][j]==1 and maze_maze[i][j-1]==1 \
                    and maze_maze[i][j+1]==0 and maze_maze[i][j]==0 \
                    or \
                    i-1>=0 and i+1<height and j-1>=0 and j+1<width\
                    and maze_maze[i-1][j]==1 and maze_maze[i+1][j]==1 and maze_maze[i][j+1]==1 \
                    and maze_maze[i][j-1]==0 and maze_maze[i][j]==0 \
                    or \
                    i-1>=0 and i+1<height and j-1>=0 and j+1<width \
                    and maze_maze[i-1][j]==1 and maze_maze[i][j-1]==1 and maze_maze[i][j+1]==1 \
                    and maze_maze[i+1][j]==0 and maze_maze[i][j]==0 \
                    or \
                    i - 1 >= 0 and i + 1 < height and j - 1 >= 0 and j + 1 < width \
                    and maze_maze[i+1][j]==1 and maze_maze[i][j-1]==1 and maze_maze[i][j+1]==1 \
                    and maze_maze[i-1][j]==0 and maze_maze[i][j]==0:
                        if (i, j) in self.inner_points:
                            continue
                        self.culdesacs(i,j, i,j,maze_maze,stop_points,inter_points)
        # print(stop_points)
        # print(inter_points)
        # print(len(list(set(stop_points)-set(inter_points))))
        # print(len(stop_points)-len(inter_points))
        return len(list(set(stop_points)-set(inter_points)))
        pass

    def culdesacs_way(self,i,j, maze,one_way, inter_way):
        height=len(maze)-1
        width=len(maze[0])-1


    def culdesacs(self,i, j, last_i, last_j, maze, stop_point, inter_point):

        # maze[i][j] = 1
        height=len(maze)-1
        width=len(maze[0])-1
        # i-1 i+1 j-1
        if i-1>=0 and i+1<height and j-1>=0 and j+1<width \
        and maze[i-1][j]==1 and maze[i+1][j]==1 and maze[i][j-1]==1 and maze[i][j+1]!=1:
            maze[i][j] = 1
            if (i-1, j) in stop_point:
                inter_point.append((i-1,j))
            elif (i+1,j) in stop_point:
                inter_point.append((i +1, j))
            elif (i,j-1) in stop_point:
                inter_point.append((i , j-1))
            self.culdesacs(i,j+1,i,j, maze,stop_point,inter_point)


        # i-1 i+1 j+1
        elif i-1>=0 and i+1<height and j-1>=0 and j+1<width \
        and maze[i-1][j]==1 and maze[i+1][j]==1 and maze[i][j+1]==1 and maze[i][j-1]!=1:
            maze[i][j] = 1
            if (i-1, j) in stop_point:
                inter_point.append((i-1,j))
            elif (i+1,j) in stop_point:
                inter_point.append((i+1,j))
            elif (i, j + 1) in stop_point:
                inter_point.append((i,j+1))

            self.culdesacs(i,j-1,i, j,maze,stop_point,inter_point)

        # i-1 j-1 j+1
        elif i-1>=0 and i+1<height and j-1>=0 and j+1<width \
        and maze[i-1][j]==1 and maze[i][j+1]==1 and maze[i][j-1]==1 and maze[i+1][j]!=1:
            maze[i][j] = 1
            if (i-1, j) in stop_point:
                inter_point.append((i-1,j))
            elif (i,j+1) in stop_point:
                inter_point.append((i, j+1))
            elif (i,j-1) in stop_point:
                inter_point.append((i, j-1))
            self.culdesacs(i+1,j,i,j,maze,stop_point,inter_point)

        # i+1 j-1 j+1
        elif i-1>=0 and i+1<height and j-1>=0 and j+1<width \
        and maze[i+1][j]==1 and maze[i][j+1]==1 and maze[i][j-1]==1 and maze[i-1][j]!=1:
            maze[i][j] = 1
            if (i+1, j) in stop_point:
                inter_point.append((i+1,j))
            elif (i,j+1) in stop_point:
                inter_point.append((i,j+1))
            elif (i,j-1) in stop_point:
                inter_point.append((i,j-1))
            self.culdesacs(i-1,j,i,j,maze,stop_point,inter_point)

        # i+1 i-1
        # if i-1>=0 and i+1<height and maze[i-1][j]

        else:
            if (i==0 or i==height-1) and (i,j) not in stop_point:
                stop_point.append((i,j))
            elif (j==0 or j==width-1) and (i,j) not in stop_point:
                stop_point.append((i,j))
            elif (last_i,last_j) not in stop_point:
                stop_point.append((last_i,last_j))

    def get_pillers(self):
        maze_maze=cp.deepcopy(self.maze_info)
        height=len(maze_maze)-1
        width=len(maze_maze[0])-1

        for i in range(height):
            for j in range(width):
                if i==0 and j==0 and maze_maze[i][j]==0:
                    if i+1<height and j+1<width and maze_maze[i][j+1]==0 and maze_maze[i+1][j]==0:
                        self.pillers.append((i,j))
                elif i==0 and j==width-1 and maze_maze[i][j]==0:
                    if i+1<height and j-1>=0 and maze_maze[i][j-1]==0 and maze_maze[i+1][j]==0:
                        self.pillers.append((i,j))
                elif i==height-1 and j==0 and maze_maze[i][j]==0:
                    if i-1>=0 and j+1<width and maze_maze[i][j+1]==0 and maze_maze[i-1][j]==0:
                        self.pillers.append((i,j))
                elif i==height-1 and j==width-1 and maze_maze[i][j]==0:
                    if i-1>=0 and j-1>=0 and maze_maze[i][j-1]==0 and maze_maze[i-1][j]==0:
                        self.pillers.append((i,j))

                elif i==0 and j!=0 and j!=width-1 and maze_maze[i][j]==0:
                    if i+1<height and maze_maze[i][j-1]==0 and maze_maze[i][j+1]==0 and maze_maze[i+1][j]==0:
                        self.pillers.append((i,j))
                elif i==height-1 and j!=0 and j!=width-1 and maze_maze[i][j]==0:
                    if i-1>=0 and maze_maze[i][j-1]==0 and maze_maze[i][j+1]==0 and maze_maze[i+1][j]==0:
                        self.pillers.append((i,j))

                elif j==0 and i!=0 and i!=height-1 and maze_maze[i][j]==0:
                    if j+1<width and maze_maze[i-1][j]==0 and maze_maze[i+1][j]==0 and maze_maze[i][j+1]==0:
                        self.pillers.append((i,j))
                elif j==width-1 and i!=0 and i!=height-1 and maze_maze[i][j]==0:
                    if j-1>=0 and maze_maze[i-1][j]==0 and maze_maze[i+1][j]==0 and maze_maze[i][j+1]==0:
                        self.pillers.append((i,j))
                else:
                    if maze_maze[i][j]==0 and maze_maze[i+1][j]==0 and maze_maze[i-1][j]==0 and maze_maze[i][j-1]==0 and maze_maze[i][j+1]==0 \
                            and maze_maze[i-1][j-1]==0 and maze_maze[i-1][j+1]==0 and maze_maze[i+1][j-1]==0 and maze_maze[i+1][j+1]==0:
                        self.pillers.append((i,j))
    def colours_walls(self, i,j, maze,coloured):
        height=len(maze)-1
        width=len(maze[0])-1
        maze[i][j]=coloured
        if j-1>=0 and i>=0 and i<height and maze[i][j-1]==1:
            self.colours_walls(i,j-1,maze,coloured)
        if j+1<width and i>=0 and i<height and maze[i][j+1]==1:
            self.colours_walls(i,j+1,maze,coloured)
        if i-1>=0 and j>=0 and j<width and maze[i-1][j]==1:
            self.colours_walls(i-1,j,maze,coloured)
        if i+1<height and j>=0 and j<width and maze[i+1][j]==1:
            self.colours_walls(i+1,j,maze,coloured)

    def colours_points(self, i,j, maze,coloured):
        height=len(maze)-1
        width=len(maze[0])-1
        maze[i][j]=coloured
        if j-1>=0 and i>=0 and i<height and maze[i][j-1]==0:
            self.colours_points(i,j-1,maze,coloured)
        if j+1<width and i>=0 and i<height and maze[i][j+1]==0:
            self.colours_points(i,j+1,maze,coloured)
        if i-1>=0 and j>=0 and j<width and maze[i-1][j]==0:
            self.colours_points(i-1,j,maze,coloured)
        if i+1<height and j>=0 and j<width and maze[i+1][j]==0:
            self.colours_points(i+1,j,maze,coloured)

    def analyse(self):
        self.check_maze()
        self.maze_to_2_2()

        gates_num=self.get_gates()
        if gates_num==0:
            print("The maze has no gate.")
        elif gates_num==1:
            print("The maze has a single gate.")
        elif gates_num>1:
            print("The maze has "+str(gates_num)+" gates.")
        pass

        sets_walls_num=self.get_sets_walls()
        if sets_walls_num==0:
            print("The maze has no wall.")
        elif sets_walls_num==1:
            print("The maze has walls that are all connected.")
        elif sets_walls_num>1:
            print("The maze has "+str(sets_walls_num)+" sets of walls that are all connected.")

        nacc_points_num, acc_areas_num=self.get_nacc_acc_points()

        if nacc_points_num==0:
            print("The maze has no inaccessible inner point.")
        elif nacc_points_num==1:
            print("The maze has a unique inaccessible inner point.")
        elif nacc_points_num>1:
            print("The maze has "+str(nacc_points_num)+" inaccessible inner points.")
        if acc_areas_num==0:
            print("The maze has no accessible area.")
        elif acc_areas_num==1:
            print("The maze has a unique accessible area.")
        elif acc_areas_num>1:
            print("The maze has "+str(acc_areas_num)+" accessible areas.")

        cul_de_sacs_num=self.get_cul_de_sacs()
        if cul_de_sacs_num==0:
            print('The maze has no accessible cul-de-sac.')
        elif cul_de_sacs_num==1:
            print('The maze has accessible cul-de-sacs that are all connected.')
        elif cul_de_sacs_num>1:
            print('The maze has '+str(cul_de_sacs_num)+' sets of accessible cul-de-sacs that are all connected.')

        self.get_pillers()
        path_num=self.get_paths()
        if path_num == 0:
            print("The maze has no entry-exit path with no intersection not to cul-de-sacs.")
        elif path_num  == 1:
            print("The maze has a unique entry-exit path with no intersection not to cul-de-sacs.")
        elif path_num>1:
            print("The maze has " + str(path_num) + " entry-exit paths with no intersections not to cul-de-sacs.")

        # print(self.maze_info)

        # self.get_cul_de_sacs()

        # print(self.inner_points)

        # print(self.gates)


    def display(self):

        self.check_maze()
        self.maze_to_2_2()

        gates_num = self.get_gates()

        sets_walls_num = self.get_sets_walls()

        nacc_points_num, acc_areas_num = self.get_nacc_acc_points()

        cul_de_sacs_num = self.get_cul_de_sacs()

        self.get_pillers()
        path_num = self.get_paths()

        filename=self.filename+".tex"
        f=open(filename,"w")
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
        f.write("% Walls\n")
        #Pillars
        f.write("% Pillars\n")

        for pillar in self.pillers:
            f.write("    \\fill[green] ("+str(int(pillar[1]/2))+","+str(int(pillar[0]/2))+") circle(0.2);\n")
        f.write("% Inner points in accessible cul-de-sacs\n")

        f.write("% Entry-exit paths without intersections\n")

        f.write("\\end{tikzpicture}\n")
        f.write("\\end{center}\n")
        f.write("\\vspace*{\\fill}\n")
        f.write("\\vspace*{\\fill}\n")
        f.write("\n")
        f.write("\\end{document}\n")
















print("----------------------------------------------")
print("expample1=Maze('more examples/example1.txt')")
expample1=Maze("more examples/example1.txt")
expample1.analyse()


print("----------------------------------------------")
print("expample2=Maze('more examples/example2.txt')")
expample2=Maze("more examples/example2.txt")
expample2.analyse()

print("----------------------------------------------")
print("expample3=Maze('more examples/example3.txt')")
expample3=Maze("more examples/example3.txt")
expample3.analyse()

print("----------------------------------------------")
print("expample4=Maze('more examples/example4.txt')")
expample4=Maze("more examples/example4.txt")
expample4.analyse()

print("----------------------------------------------")
print("maze1=Maze('Assignment_2/maze_1.txt')")
maze1=Maze("Assignment_2/maze_1.txt")
maze1.analyse()
maze1.display()
print("----------------------------------------------")
print("maze2=Maze('Assignment_2/maze_2.txt')")
maze2=Maze("Assignment_2/maze_2.txt")
maze2.analyse()

print("----------------------------------------------")
print("labyrinth=Maze('Assignment_2/labyrinth.txt')")
labyrinth=Maze("Assignment_2/labyrinth.txt")
labyrinth.analyse()

print("----------------------------------------------")
print("BiggestMaze=Maze('Assignment_2/BiggestMaze.txt')")
biggest_maze=Maze("Assignment_2/BiggestMaze.txt")
biggest_maze.analyse()

# m1=Maze("Incorrect and Not a Maze Test Cases/incorrect_input_1.txt")
# m2=Maze("Incorrect and Not a Maze Test Cases/incorrect_input_2.txt")
# m3=Maze("Incorrect and Not a Maze Test Cases/not_a_maze_1.txt")
# m4=Maze("Incorrect and Not a Maze Test Cases/not_a_maze_2.txt")