############################################################################################################
# Analysis:
# giving a series tasks let all these task satisfy the constraints.
# STEP 1: Change the question into CSP problem
# STEP 2: Use arc consistency during the search process
# STEP 3: Use greedy search to find the best solution
############################################################################################################
# Solutions:
# The reason of designing week_to_num and time_to_num into a dictionary is easy to find and operate
# by this designing we can use the operator // or % to get the weekday and time.
# You can also use the 24-hour timing method, or 100 even 1000.
# In my assignment, I will use 100 instead of 24. Here is the example.
# eg: let Sunday be the first day, monday is 100 * 1 + 1
#     There is 0 between both day and time easy to debug.
#     By using // operator, we can get the day is Mon.
#     By using % operator, we can get the time is 9 am.
#     in this way, we can have an Integer.
#     The first position is day and the third position is time.
#     This kind of method is same as COMP9021
############################################################################################################

import sys
from cspProblem import CSP, Constraint
from cspConsistency import Search_with_AC_from_CSP
from searchGeneric import AStarSearcher


############################################################################################################
# Notice 1:
# Change class Arc in searchProblem.py:
# Change the value of 'cost' in the function def __init__(self, from_node, to_node, cost=0, action=None) to 0.
# Without the variable 'cost' we can reduce the problem cost by 'cost' during the arrangement.
#
# Notice 2:
# Change the class dispaly in dispaly.py:
# Change the variable 'max_display_level' to 0.
# This change can help us disable the function display to print extra path.
############################################################################################################


############################################################################################################
######################################## extend CSP class ##################################################
# There is not variable called soft_constraints and soft_cost in the original source file in AIPython.
# To solve this assignment, extend the original class to a new one New_CSP can deal with the problem
# brought by the soft_constraints and soft_cost in the input files.
############################################################################################################


class New_CSP(CSP):
    def __init__(self, domains, constraints, soft_constraints, soft_cost):
        super().__init__(domains, constraints)
        self.soft_constraints = soft_constraints
        self.soft_cost = soft_cost


############################################################################################################
################################## extend Search_with_AC_from_CSP class ####################################
# Adding soft_constraints and soft_cost in Search_with_AC_from_CSP class.

class Search_with_AC_from_Cost_CSP(Search_with_AC_from_CSP):
    def __init__(self, csp):
        super().__init__(csp)
        self.cost = list()
        self.soft_cons = csp.soft_constraints
        self.soft_cost = soft_cost

############################################################################################################
########################################## heuristic function ##############################################

    def heuristic(self, node):
        # double check the type of the node ---> dictionary
        # print(type(node))
        cost_list = set()
        for task, value in node.items():
            if not check_content_in_line(task, self.soft_cons):
                continue
            else:
                temp = set()
                # get constraints ---> except hour
                expect_time = self.soft_cons[task]
                value_to_list = list(value)
                for item in value_to_list:
                    # for key in node.keys():
                    actual_time = item[1]
                    # actual < expect ----> no cost
                    if actual_time <= expect_time:
                        temp.add(0)
                    # actual > expect ----> cost ---> cost * hour
                    elif actual_time > expect_time:
                        # cost per time -----> time * cost
                        # day ---> hour
                        delay_day_to_hour = (actual_time // 100 - expect_time // 100) * 24
                        # hour--->hour
                        delay_hour = (actual_time % 100) - (expect_time % 100)
                        total_hour = delay_hour + delay_day_to_hour
                        temp.add(self.soft_cost[task] * total_hour)
                if len(temp) == 0:
                    break
                else:
                    get_min_temp_cost = min(temp)
                    cost_list.add(get_min_temp_cost)
        # get the final cost
        sum_of_cost = sum(cost_list)
        return sum_of_cost


############################################################################################################
######################################## binary constraints ################################################
############################################################################################################
# check the order of 2 tasks. same day or before.
def binary_same_day(task1, task2):
    get_task1_day = task1[0] // 100
    get_task2_day = task2[0] // 100
    if get_task1_day != get_task2_day:
        return False
    else:
        return True


# check whether two tasks are start at the same time
def binary_same_start(task1, task2):
    if task1[0] != task2[1]:
        return False
    else:
        return True


# check whether task1 is before task2
def binary_before(task1, task2):
    if task1[1] <= task2[0]:
        return True
    else:
        return False


# check whether task1 is after task2
def binary_after(task1, task2):
    if task1[1] > task2[0]:
        return True
    else:
        return False


############################################################################################################
########################################## hard constraints ################################################
# To check different situation of two tasks
# we can write all these function in Lambda expression
# we can also use nested function to solve this problem
# nestes function:
#   def xxxxxx():
#       def yyyyyyy();
#           return yyyyyy
#        return xxxxxxx
# Can also use the previous binary constraint to replace hard constraints
# The following code will all apply Lambda function
############################################################################################################

# To make the code more clean, just using the lambda func
def hard_day(day):
    # lambda function to express
    hardday = lambda x: x[0] // 100 == day
    return hardday


def hard_time(time):
    # can also use the same way(lambda expression) as hard_day to express, e.g.
    hardtime = lambda x: x[0] % 100 == time
    return hardtime


# check whether starts before the daytime
def hard_starts_before_daytime(day, time):
    startsbefore = lambda x: x[0] <= day * 100 + time
    return startsbefore


# start before time
def hard_starts_before_time(time):
    startsbefore = lambda value: value[0] % 100 <= time
    return startsbefore


# start after daytime
def hard_starts_after_daytime(day, time):
    startsafter = lambda x: x[0] >= day * 100 + time
    return startsafter


# start after time
def hard_starts_after_time(time):
    startsafter = lambda value: value[0] % 100 >= time
    return startsafter


# end before daytime
def hard_ends_before_daytime(day, time):
    endsbefore = lambda value: value[1] <= day * 100 + time
    return endsbefore


# end before time
def hard_ends_before_time(time):
    endsbefore = lambda x: x[1] % 100 <= time
    return endsbefore


# end after daytime
def hard_ends_after_daytime(day, time):
    endsafter = lambda x: x[1] >= day * 100 + time
    return endsafter


# end after time
def hard_ends_after_time(time):
    endsafter = lambda val: val[1] % 100 >= time
    return endsafter


# start in range need 2 pairs of parameters
def hard_startsin_range(day1, time1, day2, time2):
    starts_range = lambda x: day1 * 100 + time1 <= x[0] <= day2 * 100 + time2
    return starts_range


# end in range need 2 pairs of parameters
def hard_endsin_range(day1, time1, day2, time2):
    ends_range = lambda x: day1 * 100 + time1 <= x[1] <= day2 * 100 + time2
    return ends_range


############################################################################################################
########################################## Tool Functions ##################################################
# function 1: check_content_in_line
# check content in the line or not based on the bool
# if bool is empty(default value is True), then check word in line or not
# if bool is False, them check word not in line or not.
#
# function 2: show_result
# after finishing the calculation,
# then pass the AStarSearcher object into this function
# check whether the solution is empty or not
# them traversal the dictionary and show the result
############################################################################################################


def check_content_in_line(check_word, line, bool=True):
    # boole will effect in/not in
    # this method can
    if bool:
        # check in
        if check_word in line:
            return True
        else:
            return False
    else:
        # check not in
        if check_word not in line:
            return True
        else:
            return False


# get the number of the day in dictionary
def get_day(line, week_to_num, index):
    return week_to_num[line[index]]


# get the number of the time in dictionary
def get_time(line, time_to_num, index):
    return time_to_num[line[index]]


# show the final result in the last
def show_result(solution):
    # check NULL
    if not solution:
        print('No solution')
    else:
        # start to get the value from the list and print
        solution = solution.end()
        # print(type(solution))
        for task, value in solution.items():
            # traversal the dictionary and get the value of each key
            # get the concrete weeekday for example mon, tue and wed...
            for key in week_to_num.keys():
                list_solution = list(value)[0][0]
                if week_to_num[key] != list_solution // 100:
                    continue
                else:
                    day = key

            # get the concrete time, such as 12am...
            for key in time_to_num.keys():
                list_solution = list(value)[0][0]
                if time_to_num[key] != list_solution % 100:
                    continue
                else:
                    time = key
            print(f'{task}:{day} {time}')
        result_cost = problem.heuristic(solution)
        # prevent the invalid empty line
        print(f'cost:{result_cost}')


############################################################################################################
########################################## Test Entry ######################################################
# 1.sys.argv is used to test in the terminal or CSE server
# 2.input.txt is used to test in the local IDE
# Notice: This project(assignment) is set up in Pycharm
############################################################################################################

# Test in the terminal or CSE server
filename = sys.argv[1]
# local test
# filename = 'input1.txt'
# print(filename)

############################################################################################################
########################################## Tool dictionart #################################################
# 1. using dictionary to connect the rewrite function in class
# 2. using 'input_key_words' dictionary to check whether the input is valid or not
# 3. using the 'operation_key_word' to check each line, check whether the key word in the line or not
# 4. using the 'operate_binary_constraints' to connect the previous function definition, easy to correct errors.
# 5. using the 'operate_hard_constraints' to select which kind of constraints should we use
# advantage : easy to correct errors
# disadvantage : a little bit hard to read
# There will be annotation to show which function should be chose
############################################################################################################
# set week number from 1-5, like monday to friday
week_to_num = {'mon': 1, 'tue': 2, 'wed': 3, 'thu': 4, 'fri': 5}
# The assignments question is between 9am to 5 pm
# Therefore in this dictionary you can find 9 which is the 9 work hours in a day
time_to_num = {'9am': 1, '10am': 2, '11am': 3, '12pm': 4, '1pm': 5, '2pm': 6, '3pm': 7, '4pm': 8, '5pm': 9}

# check the input
input_key_words = {0: "\n", 1: "#", 2: "task", 3: "constraint", 4: "domain"}
# check the order of the input line
operation_key_word = {0: "same", 1: "starts", 2: "ends", 3: "before", 4: "after"}
# connect the previous binary_constraints with the input key words
operate_binary_constraints = {'before': binary_before, 'after': binary_after, 'same': binary_same_day,
                              'starts': binary_same_start}
# function list to connect relative connection with the hard constraints functions
operate_hard_constraints = {1: hard_day, 2: hard_time, 3: hard_starts_before_daytime, 4: hard_starts_before_time,
                            5: hard_starts_after_daytime, 6: hard_starts_after_time, 7: hard_ends_before_daytime,
                            8: hard_ends_before_time, 9: hard_ends_after_daytime, 10: hard_ends_after_time,
                            11: hard_startsin_range, 12: hard_endsin_range}

# Initialize the domain, create a list which is used to store different value of domain
task_duration = dict()
task_domain = dict()
soft_cost = dict()
soft_constraint = dict()
hard_constraint = list()
task_list = list()

# double loop to create a list with weekday and time
domain = list()
for i in range(1, 6):
    for j in range(1, 10):
        # check the current of week_n_time when programming
        # print(week_n_time)
        week_n_time = i * 100 + j
        domain.append(week_n_time)

# I/O operation of files, get each line in the test file
# read only !
file = open(filename, 'r', encoding='utf-8')
for line in file:
    # Remove '\n' and avoid the normal annotation
    if (line == input_key_words[0]) or (line[0] == input_key_words[1]):
        continue

    # clean the input line
    # Like COMP9021 read file operation, avoid invalid space, empty line, and other punctuations
    line = line.strip().replace('\n', '').replace(',', '').replace('-', ' ').split(' ')
    # get the length of line, the following part will use this variable several times
    len_line = len(line)

    ### get task and duration
    if line[0] == input_key_words[2]:
        # test the content of line
        # print(line)
        int_duration = int(line[2])
        task_duration.setdefault(line[1], int(line[2]))
        check_set = set()
        index = 0
        # get element in domain
        while index < len(domain):
            if domain[index] % 100 + int_duration <= 9:
                check_set.add(domain[index])
            index += 1
        temp_list = [(x, x + int_duration) for x in check_set]
        task_domain[line[1]] = set(temp_list)

    # check constraints
    # key word with index 3 is constraint
    elif line[0] == input_key_words[3]:
        # operation_key_word = {0: "same", 1: "starts", 2: "ends", 3: "before", 4: "after"}
        task1 = line[1]
        task2 = line[-1]
        tuple_of_task = (task1, task2)
        # check binary_before
        if check_content_in_line(operation_key_word[3], line):
            # input a tuple in Constraint()
            # operation_keyword 3---> before--->binary_before
            hard_constraint.append(Constraint(tuple_of_task, operate_binary_constraints[operation_key_word[3]]))
        # check binary_after
        # operation_keyword 4---> after ---> binary_after
        if check_content_in_line(operation_key_word[4], line):
            hard_constraint.append(Constraint(tuple_of_task, operate_binary_constraints[operation_key_word[4]]))
        # check binary_sameday
        # operation_keyword 0---> same ---> binary_same_day
        if check_content_in_line(operation_key_word[0], line):
            hard_constraint.append(Constraint(tuple_of_task, operate_binary_constraints[operation_key_word[0]]))
        # check binary_startsat
        # operation_keyword 1---> start ---> binary_same_start
        if check_content_in_line(operation_key_word[1], line):
            hard_constraint.append(Constraint(tuple_of_task, operate_binary_constraints[operation_key_word[1]]))

    # check domain input and get soft constraints
    elif line[0] == input_key_words[4] \
            and check_content_in_line(line[-1], week_to_num, False) \
            and check_content_in_line(line[-1], time_to_num, False):
        task = line[1]
        # get day and time, then change them into integer
        day = get_day(line, week_to_num, 4)
        time = get_time(line, time_to_num, 5)
        int_temp = int(line[-1])
        change_info_2_num = day * 100 + time
        soft_cost.setdefault(task, int_temp)
        soft_constraint.setdefault(task, change_info_2_num)

    else:
        # from the pdf, the input format is
        # domain t day
        #   0    1  2
        task = line[1]
        # chenge task to tuple due to the parameter of function "Constraint"
        # The first Parameter in Constraint only accepts tuple
        tuple_task = (task,)
        # check hard_day
        if check_content_in_line(line[2], week_to_num):
            # day = get_day(line, week_to_num, 2)
            hard_constraint.append(Constraint(tuple_task, operate_hard_constraints[1](get_day(line, week_to_num, 2))))
        # check hard_time
        elif check_content_in_line(line[2], time_to_num):
            # time = get_time(line, time_to_num, 2)
            hard_constraint.append(Constraint(tuple_task, operate_hard_constraints[2](get_time(line, time_to_num, 2))))

        # Check the input line, key word 1 is 'starts' key word 2 is 'before'
        elif check_content_in_line(operation_key_word[1], line) and \
                check_content_in_line(operation_key_word[3], line):
            # domain t starts before time
            # 4: hard_starts_before_time
            if len_line == 5:
                # time = get_time(line, time_to_num, -1)
                hard_constraint.append(
                    Constraint(tuple_task, operate_hard_constraints[4](get_time(line, time_to_num, -1))))

            # domain t starts before day time
            # 3: hard_starts_before_daytime
            if len_line == 6:
                # day = get_day(line, week_to_num, -2)
                # time = get_time(line, time_to_num, -1)
                hard_constraint.append(
                    Constraint(tuple_task, operate_hard_constraints[3](get_day(line, week_to_num, -2),
                                                                       get_time(line, time_to_num, -1))))

        # Check the input line, key word 1 is 'ends' key word 2 is 'before'
        elif check_content_in_line(operation_key_word[1], line) and \
                check_content_in_line(operation_key_word[4], line):
            # domain t starts after time
            # 6: hard_starts_after_time
            if len_line == 5:
                # time = get_time(line, time_to_num, -1)
                hard_constraint.append(
                    Constraint(tuple_task, operate_hard_constraints[6](get_time(line, time_to_num, -1))))

            # domain t starts after day time
            # 5: hard_starts_after_daytime
            if len_line == 6:
                # day = get_day(line, week_to_num, -2)
                # time = get_time(line, time_to_num, -1)
                hard_constraint.append(
                    Constraint(tuple_task, operate_hard_constraints[5](get_day(line, week_to_num, -2),
                                                                       get_time(line, time_to_num, -1))))

        #
        elif check_content_in_line(operation_key_word[2], line) and \
                check_content_in_line(operation_key_word[3], line):
            # domain t ends before day time
            # 8: hard_ends_before_time
            if len_line == 5:
                # time = get_time(line, time_to_num, -1)
                hard_constraint.append(
                    Constraint(tuple_task, operate_hard_constraints[8](get_time(line, time_to_num, -1))))

            # 7: hard_ends_before_daytime
            if len_line == 6:
                # day = get_day(line, week_to_num, -2)
                # time = get_time(line, time_to_num, -1)
                hard_constraint.append(
                    Constraint(tuple_task, operate_hard_constraints[7](get_day(line, week_to_num, -2),
                                                                       get_time(line, time_to_num, -1))))
            # domain t ends before time


        # check 'ends' and 'after' in line or not
        elif check_content_in_line(operation_key_word[2], line) and \
                check_content_in_line(operation_key_word[4], line):
            # domain t ends after time
            # 10: hard_ends_after_time,
            if len_line == 5:
                # time = get_time(line, time_to_num, -1)
                hard_constraint.append(
                    Constraint(tuple_task, operate_hard_constraints[10](get_time(line, time_to_num, -1))))

            # domain t ends after day time
            # 9: hard_ends_after_daytime
            if len_line == 6:
                # day = get_day(line, week_to_num, -2)
                # time = get_time(line, time_to_num, -1)
                hard_constraint.append(
                    Constraint(tuple_task, operate_hard_constraints[9](get_day(line, week_to_num, -2),
                                                                       get_time(line, time_to_num, -1))))

        # day-time range
        else:
            # domain t starts in day time day time
            # check starts in line
            # 11: hard_startsin_range
            if check_content_in_line(operation_key_word[1], line):
                day1 = get_day(line, week_to_num, 4)
                time1 = get_time(line, time_to_num, 5)
                day2 = get_day(line, week_to_num, 6)
                time2 = get_time(line, time_to_num, 7)
                hard_constraint.append(Constraint(tuple_task, operate_hard_constraints[11](day1, time1, day2, time2)))
            # check ends in line
            # 12: hard_endsin_range
            if check_content_in_line(operation_key_word[2], line):
                day1 = get_day(line, week_to_num, 4)
                time1 = get_time(line, time_to_num, 5)
                day2 = get_day(line, week_to_num, 6)
                time2 = get_time(line, time_to_num, 7)
                hard_constraint.append(Constraint(tuple_task, operate_hard_constraints[12](day1, time1, day2, time2)))

# create object of New_CSP, which contains soft_constraint and soft cost
csp = New_CSP(task_domain, hard_constraint, soft_constraint, soft_cost)
# create the object by using the new class, which has contained the heuristic function
problem = Search_with_AC_from_Cost_CSP(csp)
solution = AStarSearcher(problem).search()

show_result(solution)
