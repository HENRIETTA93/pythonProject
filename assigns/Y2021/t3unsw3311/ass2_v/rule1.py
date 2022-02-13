#!/usr/bin/python3
# COMP3311 21T3 Ass2 ... print list of rules for a program or stream

import sys
import psycopg2
import re
from helpers import getProgram, getStream, getSubject

# define any local helper functions here
# ...

### set up some globals

usage = f"Usage: {sys.argv[0]} (ProgramCode|StreamCode)"
db = None

### process command-line args

argc = len(sys.argv)
if argc < 2:
    print(usage)
    exit(1)
code = sys.argv[1]
if len(code) == 4:
    codeOf = "program"
elif len(code) == 6:
    codeOf = "stream"

try:
    # db = psycopg2.connect("dbname=mymyunsw")
    db = psycopg2.connect("host=192.168.7.100 dbname=mymyunsw user=postgres port=5432 password=1234")
    if codeOf == "program":
        progInfo = getProgram(db, code)
        if not progInfo:
            print(f"Invalid program code {code}")
            exit()
        # print(progInfo)  #debug
        # List the rules for Program

        pcode = progInfo[1]
        pname = progInfo[2] + ","
        puoc = str(progInfo[3]) + " UOC,"
        pyear = str(round(progInfo[6] / 12, 1)) + " years"
        print(pcode, pname, puoc, pyear)

        # ... add your code here ...
        query_prog = """
        select p.code, o.longname
        from programs p 
        join orgunits o on (p.offeredby = o.id)
        where p.code = %s
    """
        cursor = db.cursor()
        cursor.execute(query_prog, [pcode])
        result_prog = cursor.fetchone()
        print("- offered by " + result_prog[1])
        print("Academic Requirements:")

        pid = progInfo[0]
        query_prog_rules = """
        select pr.program, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req
        from program_rules pr
        join rules r on (pr.rule = r.id)
        join academic_object_groups aog on (r.ao_group = aog.id)
        where pr.program = %s
    """
        cursor.execute(query_prog_rules, [pcode])
        result_prog_rules = cursor.fetchall()

        for r in result_prog_rules:
            rule_name = r[1]
            aog_type = r[2]
            aog_defby = r[3]
            aog_definition = r[4]
            min_req = r[5]
            max_req = r[6]
            number_rule_str = ''

            if min_req is not None and max_req is not None:

                if min_req == max_req:
                    number_rule_str = str(min_req)
                else:
                    number_rule_str = 'between ' + str(min_req) + ' and ' + str(max_req)
            elif min_req is not None and max_req is None:
                number_rule_str = 'at least ' + str(min_req)
            elif min_req is None and max_req is not None:
                number_rule_str = "up to " + str(max_req)
            else:
                number_rule_str = "all"

            if aog_type == 'stream' and aog_defby == 'enumerated':
                streams_definitions = aog_definition.split(',')
                number_rule_str = str(number_rule_str) + ' stream(s)' + ' from ' + rule_name
                print(number_rule_str)

                for sd in streams_definitions:
                    sd_info = getStream(db, sd)
                    if sd_info is not None:
                        print('-', sd, sd_info[2])
                    else:
                        print('-', sd, '???')

            if aog_type == 'subject' and aog_defby == 'enumerated':
                subjects_definitions = aog_definition.split(',')
                if number_rule_str != 'all':
                    number_rule_str = number_rule_str + " UOC"
                number_rule_str = str(number_rule_str) + ' courses' + ' from ' + rule_name
                subjects_definitions_len = len(subjects_definitions)
                if subjects_definitions_len == 1:
                    number_rule_str = rule_name
                print(number_rule_str)

                for sd in subjects_definitions:
                    if sd.count(";") > 0:
                        sd = sd[1: len(sd) - 1]
                        sdd = sd.split(";")
                        s_info = "or"
                        for s in sdd:
                            sd_info = getSubject(db, s)
                            if sd_info is not None:
                                s_info = s_info + s + " " + sd_info[2] + "\n  or "
                            else:
                                s_info = s_info + s + " ??? or"
                        s_info = s_info[2:len(s_info) - 6]
                        print("-", s_info)
                    else:
                        sd_info = getSubject(db, sd)
                        if sd_info is not None:
                            print('-', sd, sd_info[2])
                        else:
                            print('-', sd, '???')

            if aog_type == 'subject' and aog_defby == 'pattern':
                if "at least" in number_rule_str:
                    number_rule_str = str(number_rule_str) + " UOC of " + rule_name
                elif "up to" in number_rule_str:
                    number_rule_str = str(number_rule_str) + "UOC courses from" + code + " " + rule_name
                print(number_rule_str)

                sj_patterns = aog_definition.split(",")
                if len(sj_patterns) > 1:
                    print('-', 'courses matching', aog_definition)


    elif codeOf == "stream":
        strmInfo = getStream(db, code)
        if not strmInfo:
            print(f"Invalid stream code {code}")
            exit()

        # print(strmInfo)  #debug
        # List the rules for Stream

        scode = strmInfo[1]
        sname = strmInfo[2]
        print(scode, sname)
        # ... add your code here ...
        query_prog = """
            select s.code, o.longname 
            from streams s 
            join orgunits o on (s.offeredby = o.id)
            where s.code = %s
        """
        cursor = db.cursor()
        cursor.execute(query_prog, [scode])

        result_prog = cursor.fetchone()
        print("- offered by " + result_prog[1])
        print("Academic Requirements:")

        query_strm_rules = """
            select s.code, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req
            from stream_rules sr 
            join rules r on (sr.rule = r.id)
            join academic_object_groups aog on (aog.id = r.ao_group)
            join streams s on (s.id = sr.stream)
            where s.code = %s
        """
        cursor.execute(query_strm_rules, [scode])
        result_strm_rules = cursor.fetchall()
        for r in result_strm_rules:
            rule_name = r[1]
            aog_type = r[2]
            aog_defby = r[3]
            aog_definition = r[4]
            min_req = r[5]
            max_req = r[6]
            # print(r)
            number_rule_str = ''

            if min_req is not None and max_req is not None:
                if min_req == max_req:
                    number_rule_str = str(min_req)
                else:
                    number_rule_str = 'between ' + str(min_req) + ' and ' + str(max_req)
            elif min_req is not None and max_req is None:
                number_rule_str = "at least " + str(min_req)
            elif min_req is None and max_req is not None:
                number_rule_str = "up to " + str(max_req)
            else:
                number_rule_str = "all"

            if aog_type == 'stream' and aog_defby == 'enumerated':
                streams_definitions = aog_definition.split(',')
                number_rule_str = str(number_rule_str) + ' stream(s)' + ' from ' + rule_name
                print(number_rule_str)

                for sd in streams_definitions:
                    sd_info = getStream(db, sd)
                    if sd_info is not None:
                        print('-', sd, sd_info[2])
                    else:
                        print('-', sd, '???')

            if aog_type == 'subject' and aog_defby == 'enumerated':
                subjects_definitions = aog_definition.split(',')
                if number_rule_str != 'all':
                    number_rule_str += " UOC"
                number_rule_str = str(number_rule_str) + ' courses' + ' from ' + rule_name
                subjects_definitions_len = len(subjects_definitions)
                if subjects_definitions_len == 1:
                    number_rule_str = rule_name
                print(number_rule_str)

                for sd in subjects_definitions:
                    if sd.count(";") > 0:
                        sd = sd[1:len(sd) - 1]
                        sdd = sd.split(";")
                        s_info = "or"
                        for s in sdd:
                            sd_info = getSubject(db, s)
                            if sd_info is not None:
                                s_info = s_info + s + " " + sd_info[2] + "\n  or "
                            else:
                                s_info = s_info + s + " ??? or"
                        s_info = s_info[2:len(s_info) - 6]
                        print("-", s_info)
                    else:
                        sd_info = getSubject(db, sd)
                        if sd_info is not None:
                            print('-', sd, sd_info[2])
                        else:
                            print('-', sd, '???')

            if aog_type == 'subject' and aog_defby == 'pattern':
                if "at least" in number_rule_str:
                    number_rule_str = str(number_rule_str) + " UOC of " + rule_name
                elif "up to" in number_rule_str:
                    number_rule_str = str(number_rule_str) + "UOC courses from" + code + " " + rule_name
                print(number_rule_str)

                sj_patterns = aog_definition.split(",")
                if len(sj_patterns) > 1:
                    print('-', 'courses matching', aog_definition)



except Exception as err:
    print(err)
finally:
    if db:
        db.close()

