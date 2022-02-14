#!/usr/bin/python3
# COMP3311 21T3 Ass2 ... progression check for a given student

import sys
import psycopg2
import re
from helpers import getStudent, getProgram, getStream

# define any local helper functions here

### set up some globals

usage = f"Usage: {sys.argv[0]} zID [Program Stream]"
db = None

### process command-line args

argc = len(sys.argv)
if argc < 2:
    print(usage)
    exit(1)
zid = sys.argv[1]
if zid[0] == 'z':
    zid = zid[1:8]
digits = re.compile("^\d{7}$")
if not digits.match(zid):
    print("Invalid student ID")
    exit(1)

progCode = None
strmCode = None

if argc == 4:
    progCode = sys.argv[2]
    strmCode = sys.argv[3]

# manipulate database

try:
    # db = psycopg2.connect("dbname=mymyunsw")
    db = psycopg2.connect("host=192.168.7.100 dbname=mymyunsw user=postgres port=5432 password=1234")
    stuInfo = getStudent(db, zid)
    # print(stuInfo) # debug
    if not stuInfo:
        print(f"Invalid student id {zid}")
        exit()

    if progCode:
        progInfo = getProgram(db, progCode)
        if not progInfo:
            print(f"Invalid program code {progCode}")
            exit()
        # print(progInfo)  #debug

    if strmCode:
        strmInfo = getStream(db, strmCode)
        if not strmInfo:
            print(f"Invalid program code {strmCode}")
            exit()
        # print(strmInfo)  #debug

    # if have a program/stream
    #   show progression check on supplied program/stream
    # else
    #   show progression check on most recent program/stream enrolment
    # ... add your code here ...

    cursor = db.cursor()
    if progCode is None and strmCode is None:
        # first get the student's latest enrolment term
        latest_term_query = """
      select max(terms.code)
      from program_enrolments pe 
      join terms on (pe.term = terms.id)
      where pe.student = %s
    """
        cursor.execute(latest_term_query, [zid])
        latest_term = cursor.fetchone()[0]

        latest_program_query = """
      select 
          programs.code as program,
          streams.code as stream,
          streams.id as s_id,
          programs.id as p_id
      from program_enrolments pe
      join programs on (pe.program = programs.id)
      join stream_enrolments se on (se.partof = pe.id)
      join streams on (se.stream = streams.id)
      join terms on (pe.term = terms.id)
      where pe.student = %s and terms.code = %s
      order by pe.student, terms.code
    """
        cursor.execute(latest_program_query, [zid, latest_term])
        latest_programs = cursor.fetchone()
        # print(latest_programs)
        # extract only the program and stream code
        progression_check_target = [(latest_programs[2], latest_programs[3])]

        progCode = latest_programs[0]
        strmCode = latest_programs[1]
        progInfo = getProgram(db, latest_programs[0])
        strmInfo = getStream(db, latest_programs[1])
    else:
        progression_check_target = [(progInfo[0], strmInfo[0])]

    #   拿到了目标program与stream，就把相对应的课程需求（rules）取回来，
    program_rules_query = """
    select 
        program_rules.program as program_id,
        rules.name as rule_name,
        rules.type as rule_type,
        rules.min_req,
        rules.max_req,
        aog.type as aog_type,
        aog.defby,
        aog.definition,
        0 as uoc_satisfied, -- 储存有多少uoc已被满足，初始值是0,
        '' as course_satisfied -- 储存有什么课已被满足，初始值是'', 
    from program_rules 
    join rules on (program_rules.rule = rules.id)
    join academic_object_groups aog on (rules.ao_group = aog.id)
    where program_rules.program = %s
  """
    cursor.execute(program_rules_query, [progInfo[0]])
    p_rules = cursor.fetchall()
    # print(program_rules)
    keys = ["program_id", "rule_name", "rule_type", "min_req", "max_req", "aog_type", "defby", "definition",
            "uoc_satisfied", "courses_satisfied"]
    program_rules = [dict(zip(keys, r)) for r in p_rules]

    # 我们要这样的一种字典结构，方便我们去更新需求满足程度
    # program_rules 是一个大的列表list，里面包含了一项项需求，以字典形式储存
    # 比如：
    # program_rules = [
    #   {
    #     "program_id": 3778,
    #     "rule_name": "Foundational Computing",
    #     "rule_type": "CC",
    #     "min_req": None,
    #     "max_req": None,
    #     "aog_type": "subjects",
    #     "defby": "enumarate",
    #     "definition": "COMP1511,COMP1521,COMP1531,COMP2511,COMP2521",
    #     "uoc_satisfied": 0,
    #     "courses_satisfied": '',
    #   }, {} , {}...
    # ]

    stream_rules_query = """
    select 
        stream_rules.stream as stream_id,
        rules.name as rule_name,
        rules.type as rule_type,
        rules.min_req,
        rules.max_req,
        aog.type as aog_type,
        aog.defby,
        aog.definition,
        0 as uoc_satisfied, -- 储存有多少uoc已被满足，初始值是0,
        '' as course_satisfied -- 储存有什么课已被满足，初始值是'', 
    from streams
    join stream_rules on (streams.id = stream_rules.stream)
    join rules on (stream_rules.rule = rules.id)
    join academic_object_groups aog on (rules.ao_group = aog.id)
    where stream_rules.stream = %s
  """
    cursor.execute(stream_rules_query, [strmInfo[0]])
    s_rules = cursor.fetchall()
    # print(stream_rules)
    keys = ["stream_id", "rule_name", "rule_type", "min_req", "max_req", "aog_type", "defby", "definition",
            "uoc_satisfied", "courses_satisfied"]
    stream_rules = [dict(zip(keys, r)) for r in s_rules]

    # 我们要这样的一种字典结构，方便我们去更新需求满足程度
    # stream_rules 是一个大的列表list，里面包含了一项项需求，以字典形式储存
    # 比如： COMPAS里面有一项需求
    # stream_rules = [
    #   {
    #     "stream_id": 2,
    #     "rule_name": "COMPAS Electives",
    #     "rule_type": "PE",
    #     "min_req": 18,
    #     "max_req": 18,
    #     "aog_type": "subjects",
    #     "defby": "enumarate",
    #     "definition": "COMP4418,COMP9318,COMP9417,COMP9418,COMP9434,COMP9444,COMP9491,COMP9517,MATH5836",
    #     "uoc_satisfied": 0,
    #     "courses_satisfied": '',
    #   }, {} , {}...
    # ]

    # 最后把两种不同的规则整合，并分清楚来源
    rules = {"program": program_rules, "stream": stream_rules}

    # 现在就去拿学生上过的科目的成绩（transcript）
    transcript_query = """
    select
        subjects.code as subject_code, 
        terms.code as term,  
        subjects.name as subject_name,
        ce.mark, 
        ce.grade, 
        subjects.uoc
    from course_enrolments ce
    join courses on (ce.course = courses.id)
    join subjects on (courses.subject = subjects.id)
    join terms on (courses.term = terms.id)
    where ce.student = %s
    order by terms.code, subjects.code;
  """
    cursor.execute(transcript_query, [zid])
    transcript = cursor.fetchall()

    grade_for_rules = ['A', 'A+', 'A-', 'B', 'B+', 'B-', 'C', 'C+', 'C-', 'D', 'D+', 'D-', 'HD', 'DN', 'CR', 'PS', 'XE',
                       'T', 'SY', 'EC', 'NC']
    # 一门一门课看，满足什么需求
    for course in transcript:
        course_code, term, course_name, mark, grade, uoc = course
        # 创建列表储存这门课所满足的需求
        rules_satisfied = []
        # 如果这门课pass了
        if grade in grade_for_rules:
            # 就要看这门课满足什么规则
            statisfy_CC = False
            satisfy_PE = False
            satisfy_GE = False

            # 首先看有什么CC 核心课程需求 被满足
            # 先看program的CC
            # program_CC = [rule for rule in rules["program"] if rule["rule_type"] == 'CC']
            program_CC = []
            for rule in rules["program"]:
                if rule["rule_type"] == 'CC':
                    program_CC.append(rule)

            if len(program_CC) != 0:
                # 一项项program的核心课程看
                for CC_rule in program_CC:
                    # CC_rules[7] = "COMP1511,COMP1521,COMP1531"
                    # "COMP1511" in "COMP1511,COMP1521,COMP1531"
                    # 如果这门课满足这个需求
                    if course_code in CC_rule["definition"]:
                        # 更新课程
                        rules_satisfied.append(CC_rule["rule_name"])
                        # 更新需求
                        CC_rule["uoc_satisfied"] += uoc
                        if CC_rule["course_satisfied"] == '':
                            CC_rule["course_satisfied"] = course_code
                        else:
                            CC_rule["course_satisfied"] = CC_rule["course_satisfied"] + ',' + course_code

                        # 停止for loop
                        # 不用再继续看program CC了，因为已经找到了满足的
                        statisfy_CC = True
                        break

                # 如果科目没有满足program里面的CC
                if not statisfy_CC:
                    stream_CC = [rule for rule in rules["stream"] if rule["rule_type"] == 'CC']
                    if len(stream_CC) != 0:
                        for CC_rule in stream_CC:
                            if course_code in CC_rule["definition"]:
                                # 更新课程
                                rules_satisfied.append(CC_rule["rule_name"])
                                # 更新需求
                                CC_rule["uoc_satisfied"] += uoc
                                if CC_rule["course_satisfied"] == '':
                                    CC_rule["course_satisfied"] = course_code
                                else:
                                    CC_rule["course_satisfied"] = CC_rule["course_satisfied"] + ',' + course_code
                                # 不用再看其他CC需求了，因为已经有核心课程需求被满足
                                statisfy_CC = True
                                break

            # 如果没有CC需求被满足 statisfy_CC == False
            # 再看有什么PE 选修课程需求 被满足
            # 一样结构先看program，再看stream
            # 在判断课程是否满足一项Electives时，还要查看这项需求是否已经被满足
            # 对比uoc_satisfied与min_req, max_req

            # tips: 如果拿到了一个pattern = "COMP3###", 如何进行对比
            # pattern = re.sub('#', '.', pattern) # "COMP3###" -> "COMP3...", ‘.’ 代表 任何字符
            # "COMP3..." 能match到 任何以COMP3开头，后面跟着三个字符的字符串
            # re.match("COMP3...", "COMP3311") # 会是True
            # re.match("COMP3...", "COMP4920") # 会是False

            # 如果不满足任何PE需求 statisfy_PE == False
            # 再看是不是满足GE general education需求

            # 如果GE也不满足 statisfy_GE == False
            # 再看是不是满足FE free elective

            # 最后看有没有满足ADK 课程

        # 查完一轮后你可以输出看看满足了什么需求
        print(course_code, rules_satisfied)

    # 全部课程查看完毕后
    # 相对应的需求也会被更新完毕
    for r in rules["program"]:
        print(r)
    for r in rules["stream"]:
        print(r)

    #   然后现在来看还有什么需求没有被满足
    #   顺序：
    #     先看stream的core course，再看program的core course
    #     再看stream的PE，再看program的PE
    #     再看FE
    #     最后看general education

    #   拿到一项需求后，
    #   然后把还没上的课或者还剩多少uoc输出
    #     比如对于CC需求：
    #       definition = "COMP1511,COMP1521,COMP1531"
    #       courses_satisfied = "COMP1511,COMP1521"
    #       for course in definition.split(','):
    #         if course not in courses_satisfied:
    #           拿到课程名字
    #           输出课程

    #    比如对于elective类型
    #      对比uoc_satisfied, min_req, max_req去判断还有多少uoc剩下










except Exception as err:
    print("DB error: ", err)
finally:
    if db:
        db.close()