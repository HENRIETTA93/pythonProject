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

    #   ???????????????program???stream????????????????????????????????????rules???????????????
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
        0 as uoc_satisfied, -- ???????????????uoc???????????????????????????0,
        '' as course_satisfied -- ?????????????????????????????????????????????'', 
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

    # ??????????????????????????????????????????????????????????????????????????????
    # program_rules ?????????????????????list?????????????????????????????????????????????????????????
    # ?????????
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
        0 as uoc_satisfied, -- ???????????????uoc???????????????????????????0,
        '' as course_satisfied -- ?????????????????????????????????????????????'', 
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

    # ??????????????????????????????????????????????????????????????????????????????
    # stream_rules ?????????????????????list?????????????????????????????????????????????????????????
    # ????????? COMPAS?????????????????????
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

    # ?????????????????????????????????????????????????????????
    rules = {"program": program_rules, "stream": stream_rules}

    # ????????????????????????????????????????????????transcript???
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
    # ???????????????????????????????????????
    for course in transcript:
        course_code, term, course_name, mark, grade, uoc = course
        # ?????????????????????????????????????????????
        rules_satisfied = []
        # ???????????????pass???
        if grade in grade_for_rules:
            # ????????????????????????????????????
            statisfy_CC = False
            satisfy_PE = False
            satisfy_GE = False

            # ??????????????????CC ?????????????????? ?????????
            # ??????program???CC
            # program_CC = [rule for rule in rules["program"] if rule["rule_type"] == 'CC']
            program_CC = []
            for rule in rules["program"]:
                if rule["rule_type"] == 'CC':
                    program_CC.append(rule)

            if len(program_CC) != 0:
                # ?????????program??????????????????
                for CC_rule in program_CC:
                    # CC_rules[7] = "COMP1511,COMP1521,COMP1531"
                    # "COMP1511" in "COMP1511,COMP1521,COMP1531"
                    # ?????????????????????????????????
                    if course_code in CC_rule["definition"]:
                        # ????????????
                        rules_satisfied.append(CC_rule["rule_name"])
                        # ????????????
                        CC_rule["uoc_satisfied"] += uoc
                        if CC_rule["course_satisfied"] == '':
                            CC_rule["course_satisfied"] = course_code
                        else:
                            CC_rule["course_satisfied"] = CC_rule["course_satisfied"] + ',' + course_code

                        # ??????for loop
                        # ??????????????????program CC????????????????????????????????????
                        statisfy_CC = True
                        break

                # ????????????????????????program?????????CC
                if not statisfy_CC:
                    stream_CC = [rule for rule in rules["stream"] if rule["rule_type"] == 'CC']
                    if len(stream_CC) != 0:
                        for CC_rule in stream_CC:
                            if course_code in CC_rule["definition"]:
                                # ????????????
                                rules_satisfied.append(CC_rule["rule_name"])
                                # ????????????
                                CC_rule["uoc_satisfied"] += uoc
                                if CC_rule["course_satisfied"] == '':
                                    CC_rule["course_satisfied"] = course_code
                                else:
                                    CC_rule["course_satisfied"] = CC_rule["course_satisfied"] + ',' + course_code
                                # ??????????????????CC??????????????????????????????????????????????????????
                                statisfy_CC = True
                                break

            # ????????????CC??????????????? statisfy_CC == False
            # ???????????????PE ?????????????????? ?????????
            # ??????????????????program?????????stream
            # ?????????????????????????????????Electives???????????????????????????????????????????????????
            # ??????uoc_satisfied???min_req, max_req

            # tips: ?????????????????????pattern = "COMP3###", ??????????????????
            # pattern = re.sub('#', '.', pattern) # "COMP3###" -> "COMP3...", ???.??? ?????? ????????????
            # "COMP3..." ???match??? ?????????COMP3?????????????????????????????????????????????
            # re.match("COMP3...", "COMP3311") # ??????True
            # re.match("COMP3...", "COMP4920") # ??????False

            # ?????????????????????PE?????? statisfy_PE == False
            # ?????????????????????GE general education??????

            # ??????GE???????????? statisfy_GE == False
            # ?????????????????????FE free elective

            # ????????????????????????ADK ??????

        # ?????????????????????????????????????????????????????????
        print(course_code, rules_satisfied)

    # ???????????????????????????
    # ???????????????????????????????????????
    for r in rules["program"]:
        print(r)
    for r in rules["stream"]:
        print(r)

    #   ???????????????????????????????????????????????????
    #   ?????????
    #     ??????stream???core course?????????program???core course
    #     ??????stream???PE?????????program???PE
    #     ??????FE
    #     ?????????general education

    #   ????????????????????????
    #   ??????????????????????????????????????????uoc??????
    #     ????????????CC?????????
    #       definition = "COMP1511,COMP1521,COMP1531"
    #       courses_satisfied = "COMP1511,COMP1521"
    #       for course in definition.split(','):
    #         if course not in courses_satisfied:
    #           ??????????????????
    #           ????????????

    #    ????????????elective??????
    #      ??????uoc_satisfied, min_req, max_req?????????????????????uoc??????










except Exception as err:
    print("DB error: ", err)
finally:
    if db:
        db.close()