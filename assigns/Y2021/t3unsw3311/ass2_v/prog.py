#!/usr/bin/python3
# COMP3311 21T3 Ass2 ... progression check for a given student

import sys
import psycopg2
import re
from helpers import getStudent, getProgram, getStream, getLatestProgStrm, getStuCourse, getProgStrm, completedProgStrm,neededCC

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
  stuInfo = getStudent(db,zid)

  # print(stuInfo) # debug
  if not stuInfo:
    print(f"Invalid student id {zid}")
    exit()

  sid=stuInfo[0]
  sname=stuInfo[1]+", "+stuInfo[2]

  if progCode:
    progInfo = getProgram(db,progCode)
    if not progInfo:
      print(f"Invalid program code {progCode}")
      exit()
    # print(progInfo)  #debug
    pcode=progInfo[1]
    pname=progInfo[2]
  else:
    progStrmInfo=getLatestProgStrm(db,zid)
    if not progStrmInfo:
      print(f"Invalid program code {progCode}")
      exit()
    pcode=progStrmInfo[0]
    pname=progStrmInfo[1]


  if strmCode:
    strmInfo = getStream(db,strmCode)
    if not strmInfo:
      print(f"Invalid program code {strmCode}")
      exit()
    # print(strmInfo)  #debug
    scode = strmInfo[1]
    strm_name = strmInfo[2]
  else:
    progStrmInfo=getLatestProgStrm(db,zid)
    if not progStrmInfo:
      print(f"Invalid program code {strmCode}")
      exit()
    scode=progStrmInfo[2]
    strm_name=progStrmInfo[3]

  print(sid,sname)
  print(' ',pcode, pname)
  print(' ', scode, strm_name)

  # if have a program/stream
  #   show progression check on supplied program/stream
  # else
  #   show progression check on most recent program/stream enrolment
  # ... add your code here ...

  Xuoc=['A','B','C','D','HD','DN','CR','PS','XE','T','SY','EC','RC','NC']
  FAIL=['AF','FL','UF','E','F']
  # unrs (unresolved) for AS,AW,PW,NA,RD,NF,LE,PE,WD,WJ

  completed='completed'
  completed_uoc='completed_uoc'
  cursor = db.cursor()
  prog_strm_info=getProgStrm(db,pcode,scode)
  # print(prog_strm_info)
  # print(len(prog_strm_info))

  needed_cc_courses=[]
  completed_cc_courses=[]
  completed_pe_courses=[]
  completed_ge_courses=[]
  completed_fe_courses=[]

  completed_adk_courses=[]
  needed_pe_courses = []
  needed_ge_courses = []
  needed_fe_courses = []
  # completed_pe_courses = []
  # completed_ge_courses = []
  # completed_fe_courses = []
  failed_cc_courses=[]
  failed_pe_courses=[]
  failed_ge_courses=[]

  needed_pe_courses_dic={}
  needed_ge_courses_dic={}
  needed_fe_courses_dic={}
  needed_pe_courses_dic[completed] = []
  needed_ge_courses_dic[completed] = []
  needed_fe_courses_dic[completed]=[]
  needed_pe_courses_dic[completed_uoc]=0
  needed_ge_courses_dic[completed_uoc] = 0
  needed_fe_courses_dic[completed_uoc] = 0

  total_completed=0

  for reqs in prog_strm_info:
    # print(reqs)
    rule_name=reqs[3]
    defby=reqs[4]
    definations=reqs[5]
    min_req=reqs[6]
    max_req=reqs[7]
    rule_type=reqs[8]
    # print(rule_name,defby,definations,min_req,max_req,rule_type)
    if defby=='enumerated' and rule_type=='CC':
      defs_list=definations.split(",")
      for defs in defs_list:
        needed_cc_courses.append(defs)
    elif rule_type=='PE':
      needed_pe_courses_dic['rule_name']=rule_name
      needed_pe_courses_dic['min_req']=min_req
      needed_pe_courses_dic['max_req']=max_req
      needed_pe_courses.append(needed_pe_courses_dic)
      needed_pe_courses_dic = {}
      needed_pe_courses_dic[completed] = []

      needed_pe_courses_dic[completed_uoc] = 0


    elif rule_type=='GE':
      needed_ge_courses_dic['rule_name']=rule_name
      needed_ge_courses_dic['min_req']=min_req
      needed_ge_courses_dic['max_req']=max_req
      needed_ge_courses.append(needed_ge_courses_dic)
      needed_ge_courses_dic = {}
      needed_ge_courses_dic[completed] = []

      needed_ge_courses_dic[completed_uoc] = 0
    elif rule_type=='FE':
      needed_fe_courses_dic['rule_name']=rule_name
      needed_fe_courses_dic['min_req']=min_req
      needed_fe_courses_dic['max_req']=max_req
      needed_fe_courses.append(needed_fe_courses_dic)
      needed_fe_courses_dic = {}
      needed_fe_courses_dic[completed] = []
      needed_fe_courses_dic[completed_uoc] = 0
      pass



  # print()
  # print(needed_cc_courses)
  # print(needed_pe_courses)
  # print(needed_ge_courses)
  # print(needed_fe_courses)

  completedProgStrms=completedProgStrm(db,sid,pcode,scode)
  # print(completedProgStrms)
  # for cplted in completedProgStrms:
  #   rule_type = cplted[6]
  #   rule_order = cplted[7]
  #   subject = cplted[9]
  #   term = cplted[14].lower()
  #   subject_name = cplted[10]
  #   mark = cplted[11]
  #   grade = cplted[12]
  #   uoc = cplted[13]
  #   rule_name = cplted[2]
  #   if mark is None:
  #     mark = '-'
    # print(rule_type,subject,term,subject_name,mark,grade,uoc,rule_name)


  print()
  print("Completed:")
  for cplted in completedProgStrms:
    # print(cplted)
    rule_type=cplted[7]
    rule_order=cplted[8]
    subject=cplted[10]
    term=cplted[15]
    if 'S' in term:
      term=term.lower()
    subject_name=cplted[11]
    mark=cplted[12]
    grade=cplted[13]
    uoc=cplted[14]
    rule_name=cplted[3]
    if mark is None:
      mark='-'
    # print(rule_type,subject,term,subject_name,mark,grade,uoc,rule_name)
    if rule_type=='CC':
      if grade in Xuoc:
        # put into completed

        print(subject, term, '%-31s'%subject_name,'%3s' % mark, '%-2s' % grade, '%3s'%str(uoc)+'uoc', 'towards '+rule_name)
        total_completed+=int(uoc)
        completed_cc_courses.append(subject)
      elif grade in FAIL:
        print(subject, term, '%-31s'%subject_name, '%3s' %mark, '%-2s' % grade, '  fail', 'does not count')
        failed_cc_courses.append(subject)
        pass
    elif rule_type=='PE':
      if subject in completed_cc_courses or subject in failed_cc_courses or subject in completed_pe_courses:
        continue
      else:
        if grade in Xuoc:
          for dic in needed_pe_courses:
            if dic['rule_name'] == rule_name:

              # if dic['min_req'] and dic['min_req']<=dic[completed_uoc]:
              #   dic[completed].append(subject)
              #   print(subject, term, '%-31s'%subject_name, '%3s' %mark, '%-2s' % grade, '%3s'%str(0) + 'uoc', 'towards ' + rule_name)
              if dic['max_req'] and dic['max_req']<=dic[completed_uoc]:
                dic[completed].append(subject)
                print(subject, term, '%-31s' % subject_name, '%3s' % mark, '%-2s' % grade, '%3s'%str(0) + 'uoc',
                      'does not satisfy any rule')
              else:
                dic[completed].append(subject)
                dic[completed_uoc] += int(uoc)


                total_completed += int(uoc)
                if 'ADK' in rule_name:
                  completed_adk_courses.append(subject)
                  total_completed-=int(uoc)
                else:
                  completed_pe_courses.append(subject)
                  if subject in completed_adk_courses:
                    rule_name+=" + ADK Courses"
                  print(subject, term, '%-31s' % subject_name, '%3s' % mark, '%-2s' % grade, '%3s'%str(uoc) + 'uoc',
                        'towards ' + rule_name)

        elif grade in FAIL:
          print(subject, term, '%-31s' % subject_name, '%3s' % mark, '%-2s' % grade, '  fail', 'does not count')
          failed_pe_courses.append(subject)
          pass

    elif rule_type == 'GE':
      if subject in completed_cc_courses or subject in completed_pe_courses or subject in failed_cc_courses or subject in failed_pe_courses:
        continue
      else:
        if grade in Xuoc:
          for dic in needed_ge_courses:
            if dic['rule_name'] == rule_name:
              dic[completed].append(subject)
              dic[completed_uoc]+=int(uoc)
              print(subject, term, '%-31s'%subject_name, '%3s' %mark, '%-2s' % grade, '%3s'%str(uoc) + 'uoc', 'towards ' + rule_name)
              total_completed += int(uoc)
              completed_ge_courses.append(subject)
        elif grade in FAIL:
          print(subject, term, '%-31s' % subject_name, '%3s' % mark, '%-2s' % grade, '  fail', 'does not count')
          pass
    elif rule_type == 'FE':
      if subject in completed_cc_courses or subject in completed_pe_courses or subject in completed_ge_courses \
              or subject in failed_cc_courses or subject in failed_pe_courses or subject in failed_ge_courses:
        continue
      else:
        if grade in Xuoc:
          for dic in needed_fe_courses:
            if dic['rule_name'] == rule_name:
              dic[completed].append(subject)
              dic[completed_uoc] += int(uoc)
              if "Free Electives" in rule_name:
                print(subject, term, '%-31s' % subject_name, '%3s' % mark, '%-2s' % grade, '%3s'%str(uoc) + 'uoc',
                  'towards Free Electives')
                # print(subject, term, '%-31s' % subject_name, '%3s' % mark, '%-2s' % grade, '%3s'%str(uoc) + 'uoc',
                #     'towards ' + rule_name)
              total_completed += int(uoc)
        elif grade in FAIL:
          print(subject, term, '%-31s' % subject_name, '%3s' % mark, '%-2s' % grade, '  fail', 'does not count')
          pass
  print("UOC = "+str(total_completed)+" so far")

  print()


  full_cc=False
  full_pe=False
  full_ge=False
  full_fe=False
  if len(completed_cc_courses)==len(needed_cc_courses):
    full_cc=True
  for need in needed_pe_courses:
    if need['min_req'] and need[completed_uoc]>=need['min_req'] \
      or need['max_req'] and need[completed_uoc]>=need['max_req'] \
      or need['min_req'] and need['max_req'] and need['min_req']==need['max_req'] and need['min_req']==[completed_uoc]:
      full_pe=True
  for need in needed_ge_courses:
    if need['min_req'] and need[completed_uoc]>=need['min_req'] \
      or need['max_req'] and need[completed_uoc]>=need['max_req'] \
      or need['min_req'] and need['max_req'] and need['min_req']==need['max_req'] and need['min_req']==[completed_uoc]:
      full_ge=True
  for need in needed_fe_courses:
    if need['min_req'] and need[completed_uoc]>=need['min_req'] \
      or need['max_req'] and need[completed_uoc]>=need['max_req'] \
      or need['min_req'] and need['max_req'] and need['min_req']==need['max_req'] and need['min_req']==[completed_uoc]:
      full_fe=True
  if full_cc and full_pe and full_ge and full_fe:
    print("Eligible to graduate")
  else:
    print("Remaining to complete degree:")
    still_needed=[]
    has_comp=False
    for need in needed_cc_courses:
      if need not in completed_cc_courses:
        if len(need)>8:
          nds=need[1:len(need)-1].split(";")
          for nd in nds:
            if nd in completed_cc_courses:
              has_comp=True
              break
          if has_comp is False:
            still_needed.append(need)
          else:
            has_comp=False
        else:
          still_needed.append(need)
    # print(still_needed)

    ##### check needed for CC
    all_needed_CC=neededCC(db,pcode,scode)
    # print(all_needed_CC)
    tmpstr = ""
    for needcc in all_needed_CC:
      subj=needcc[9]
      subcode=needcc[10]
      subname=needcc[11]

      if subj in still_needed:
        if len(subj) ==8:
          print('-', subcode, subname)
        elif len(subj)>8:
          subjs=subj[1:len(subj)-1].split(";")
          if subcode in subjs and subjs.index(subcode)!=len(subjs)-1:
            tmpstr += "- " + subcode + " " + subname + "\n  or "
          elif subcode in subjs and subjs.index(subcode)==len(subjs)-1:
            tmpstr+=subcode+" "+ subname
            print(tmpstr)
            tmpstr=""

    #### check needed for PE
    for needpe in needed_pe_courses:
      rule_name = needpe['rule_name']
      if needpe['min_req'] and needpe[completed_uoc] < needpe['min_req'] and needpe['max_req'] is None:
        print("at least " + str(needpe['min_req'] - needpe[completed_uoc]) + " UOC courses from courses " + rule_name)
      if needpe['min_req'] and needpe['max_req'] and needpe['min_req']==needpe['max_req'] and needpe[completed_uoc] < needpe['min_req']:
        print(str(needpe['min_req'] - needpe[completed_uoc]) + " UOC from courses " + rule_name)
      if needpe['min_req'] and needpe['max_req'] and needpe['min_req']<needpe['max_req'] and needpe[completed_uoc] >= needpe['min_req'] and needpe[completed_uoc]<needpe['max_req']:
        print("between "+str(needpe[completed_uoc]-needpe['min_req'])+" and "+str(needpe['max_req'] - needpe[completed_uoc]) + " UOC from courses " + rule_name)
      if needpe['min_req'] is None and needpe['max_req'] and needpe[completed_uoc]==0:
        print("up to")
      pass

    #### check needed for GE
    for needpe in needed_ge_courses:
      rule_name = needpe['rule_name']
      # print(needpe)
      if needpe['min_req'] and needpe[completed_uoc] < needpe['min_req'] and needpe['max_req'] is None:
        print("at least " + str(needpe['min_req'] - needpe[completed_uoc]) + " UOC courses from " + rule_name)
      if needpe['min_req'] and needpe['max_req'] and needpe[completed_uoc] < needpe['min_req']:
        print(str(needpe['min_req'] - needpe[completed_uoc]) + " UOC of " + rule_name)
        pass
      pass

    #### check needed for FE
    for needfe in needed_fe_courses:
      # print(needfe)
      rule_name = needfe['rule_name']
      if "Free Electives" in rule_name:
        rule="Free Electives"
        if needfe['min_req'] and needfe[completed_uoc] < needfe['min_req'] and needfe['max_req'] is None:
          print("at least " + str(needfe['min_req'] - needfe[completed_uoc]) + " UOC of " + rule)
        if needfe['min_req'] and needfe['max_req'] and needfe[completed_uoc] < needfe['min_req']:
          print(str(needfe['min_req'] - needfe[completed_uoc]) + " UOC of " + rule)
      else:
        if needfe[completed_uoc] < needfe['min_req'] and needfe['max_req'] is None:
          print("at least " + str(needfe['min_req'] - needfe[completed_uoc]) + " UOC courses from " + rule_name)
        if needfe['min_req'] and needfe['max_req'] and needfe[completed_uoc] < needfe['min_req']:
          print(str(needfe['min_req'] - needfe[completed_uoc]) + " UOC of " + rule_name)
        pass
      pass

    # print("-----")
    # print(needed_cc_courses)
    # print(needed_pe_courses)
    # print(needed_ge_courses)
    # print(needed_fe_courses)


except Exception as err:
  print(Exception)
  print("DB error: ", err)
finally:
  if db:
    db.close()

