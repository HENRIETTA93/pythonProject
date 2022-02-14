

select s.id, sj.code, t.code, sj.name,ce.mark, ce.grade,sj.uoc
from students s join course_enrolments ce on s.id=ce.student
join courses c on c.id=ce.course
join terms t on t.id=c.term
join subjects sj on sj.id=c.subject
where s.id=5124159;


select s.id, sj.code, t.code, sj.name,ce.mark, ce.grade,sj.uoc
from students s join course_enrolments ce on s.id=ce.student
join courses c on c.id=ce.course
join terms t on t.id=c.term
join subjects sj on sj.id=c.subject
where s.id=5123788;


select s.id, sj.code, t.code, sj.name,ce.mark, ce.grade,sj.uoc
from students s join course_enrolments ce on s.id=ce.student
join courses c on c.id=ce.course
join terms t on t.id=c.term
join subjects sj on sj.id=c.subject
where s.id=5143550;


python trans.py 5124159
python trans.py 5123788

python trans.py 5143550
python trans.py 5124862
python trans.py 5146401
python trans.py 5159189


select p.code, o.longname
from programs p join orgunits o on p.offeredby=o.id
where p.code=3707

select p.code, o.longname
from programs p join orgunits o on p.offeredby=o.id
where (p.code::text)='3707';

-- select pr.*, r.*
-- from program_rules pr join rules r on pr.rule=r.id
-- where pr.program=3707;
--
-- select *
-- from programs p
-- where p.id=3707;


select pr.program, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req,r.max_req
from program_rules pr join rules r on pr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
where pr.program=3707;

/*
 program |   id   |        name         |  type   |   defby    |                                                              definition                                                              | min_req
---------+--------+---------------------+---------+------------+--------------------------------------------------------------------------------------------------------------------------------------+--------
    3707 | 352648 | BE(Hons) Streams    | stream  | enumerated | AEROAH,BINFAH,CEICAH,CEICDH,COMPBH,CVENAH,CVENBH,ELECAH,ELECCH,GMATDH,MANFBH,MECHAH,MINEAH,MTRNAH,PETRAH,SENGAH,SOLAAH,SOLABH,TELEAH |       1
    3707 | 352649 | Industrial Training | subject | enumerated | ENGG4999                                                                                                                             |
    3707 | 352650 | General Education   | subject | pattern    | GEN#####                                                                                                                             |      12
(3 行记录)

 program |   id   |        name         |  type   |   defby    |                                                              definition                                                              | min_req
 | max_req
---------+--------+---------------------+---------+------------+--------------------------------------------------------------------------------------------------------------------------------------+--------
-+---------
    3707 | 352648 | BE(Hons) Streams    | stream  | enumerated | AEROAH,BINFAH,CEICAH,CEICDH,COMPBH,CVENAH,CVENBH,ELECAH,ELECCH,GMATDH,MANFBH,MECHAH,MINEAH,MTRNAH,PETRAH,SENGAH,SOLAAH,SOLABH,TELEAH |       1
 |       1
    3707 | 352649 | Industrial Training | subject | enumerated | ENGG4999                                                                                                                             |
 |
    3707 | 352650 | General Education   | subject | pattern    | GEN#####                                                                                                                             |      12
 |      12
(3 行记录)

*/

select pr.program, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req,r.max_req
from program_rules pr join rules r on pr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
where pr.program=3778;
/*

 program |   id   |          name          |  type   |   defby    |                       definition                        | min_req | max_req
---------+--------+------------------------+---------+------------+---------------------------------------------------------+---------+---------
    3778 | 352651 | Comp Sci Majors        | stream  | enumerated | COMPA1,COMPD1,COMPE1,COMPI1,COMPJ1,COMPN1,COMPS1,COMPY1 |       1 |       1
    3778 | 352652 | Foundational Computing | subject | enumerated | COMP1511,COMP1521,COMP1531,COMP2511,COMP2521            |         |
    3778 | 352653 | Comp Sci Maths         | subject | enumerated | MATH1081,{MATH1131;MATH1141},{MATH1231;MATH1241}        |         |
    3778 | 352654 | Comp Sci Advanced Core | subject | enumerated | {COMP3121;COMP3821},COMP3900,COMP4920                   |         |
    3778 | 352655 | General Education      | subject | pattern    | GEN#####                                                |      12 |      12
(5 行记录)


 */



select s.code, o.longname
from streams s join orgunits o on s.offeredby=o.id
where s.code='COMPAS';

select s.code, o.longname
from streams s join orgunits o on s.offeredby=o.id
where s.code='COMPA1';


select s.code, o.longname
from streams s join orgunits o on s.offeredby=o.id
where s.code='COMPSS';


select s.code,sr.stream, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
where s.code='COMPAS';

/*
  code  | stream |   id   |             name              |  type   |   defby    |                                    definition                                    | min_req | max_req
--------+--------+--------+-------------------------------+---------+------------+----------------------------------------------------------------------------------+---------+---------
 COMPAS |      2 | 352667 | COMPAS Core                   | subject | enumerated | {COMP9414;COMP9814}                                                              |         |
 COMPAS |      2 | 352668 | COMPAS Electives              | subject | enumerated | COMP4418,COMP9318,COMP9417,COMP9418,COMP9434,COMP9444,COMP9491,COMP9517,MATH5836 |      18 |      18
 COMPAS |      2 | 352669 | COMPAS Disciplinary Electives | subject | pattern    | BINF6###,BINF9###,COMP4###,COMP6###,COMP9##,GSOE92###                            |         |       6
(3 行记录)


 */
select s.code,sr.stream, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
where s.code='COMPA1';
/*

  code  | stream |   id   |            name            |  type   |  defby  |                          definition                           | min_req | max_req
--------+--------+--------+----------------------------+---------+---------+---------------------------------------------------------------+---------+---------
 COMPA1 |      1 | 352665 | COMPA1 Computing Electives | subject | pattern | ENGG2600,ENG3600,ENGG4600,COMP3###,COMP4###,COMP6###,COMP9### |      30 |
 COMPA1 |      1 | 352666 | COMPA1 Free Electives      | subject | pattern | FREE####                                                      |      36 |
(2 行记录)

 */

select s.code,sr.stream, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
where s.code='COMPSS';
/*

  code  | stream |   id   |               name                |  type   |   defby    |                      definition                       | min_req | max_req
--------+--------+--------+-----------------------------------+---------+------------+-------------------------------------------------------+---------+---------
 COMPSS |     16 | 352710 | COMPSS Algos/Stats Electives      | subject | enumerated | COMP4141,COMP6741,MATH5845,MATH5855,MATH5905,MATH5960 |       6 |      12
 COMPSS |     16 | 352711 | COMPSS Databases Electives        | subject | enumerated | COMP9313,COMP9315,COMP9318,COMP9319,COMP9321          |       6 |      12
 COMPSS |     16 | 352712 | COMPSS Machine Learning Electives | subject | enumerated | COMP4418,COMP6714,COMP9417,MATH5836,COMP9444          |       6 |      12
 COMPSS |     16 | 352713 | COMPSS Disciplinary Electives     | subject | pattern    | BINF6###,BINF9###,COMP4###,COMP6###,COMP9##,GSOE92### |         |       6
(4 行记录)

 */

python rules.py 3707
python rules.py 3778
python rules.py COMPAS
python rules.py COMPA1
python rules.py COMPSS


--Q3

select s.id, sj.code, t.code, sj.name, ce.mark, ce.grade, sj.uoc
from students s join course_enrolments ce on s.id=ce.student
join courses c on c.id=ce.course
join terms t on t.id=c.term
join subjects sj on sj.id=c.subject
where s.id=5197273
order by t.code, sj.code;


select s.id, sj.code, t.code, sj.name, ce.mark, ce.grade, sj.uoc
from students s join course_enrolments ce on s.id=ce.student
join courses c on c.id=ce.course
join terms t on t.id=c.term
join subjects sj on sj.id=c.subject
where s.id=5197273
order by t.code, sj.code;

select s.id, p.code, p.name, p.uoc
from students s join degrees_awarded da on s.id=da.student
join programs p on p.id=da.program
where s.id=5197273

select pr.program, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req,r.max_req
from program_rules pr join rules r on pr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
where pr.program=3707;


select s.code,sr.stream, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
where s.code='SENGAH';

COMP1511
ENGG1000
MATH1131
COMP1521
MATH1231
PHYS1121
COMP1531
ELEC1111
COMP2521
COMP3231
COMP2511
COMP3222


MATH2069,MATH2099
{PHYS1221;PHYS1231},
ELEC2133,ELEC2134
DESN2000
,,,,                                     |         |
{;MATH1141},{;MATH1241},                       |         |
{;PHYS1131},,          |         |
{;DESN1000},                                                    |         |
COMP3211,,,COMP3601,COMP4601,COMP4920,COMP4951,COMP4952,COMP4953 |         |
ENGG2600,ENGG3060,ENGG3600,ENGG4600,COMP3###,COMP4###,COMP6###,COMP9###

python prog.py 5197273 3707 COMPBH
python prog.py 5123788 8543 COMPSS
python prog.py 5198386 3707 SENGAH


['GSOE9820', 'COMP9021', 'COMP9024', 'COMP9311', 'COMP9331', '{COMP9900;COMP9991}', 'COMP4121', 'COMP4161', 'COMP4418', 'COMP6714', 'COMP9153', 'COMP9242', 'COMP9243', 'COMP9315', 'COMP9318', 'COMP9319',
 'COMP9323', 'COMP9334', 'COMP9336', 'COMP9417', 'COMP9418', 'COMP9434', 'COMP9444', 'COMP9517', 'COMP9992', 'COMP9993']
[]
['GSOE9820', 'COMP9021', 'COMP9024', 'COMP9311', 'COMP9331', '{COMP9900;COMP9991}', 'COMP4121', 'COMP4161', 'COMP4418', 'COMP6714', 'COMP9153', 'COMP9242', 'COMP9243', 'COMP9315', 'COMP9318', 'COMP9319',
 'COMP9323', 'COMP9334', 'COMP9336', 'COMP9417', 'COMP9418', 'COMP9434', 'COMP9444', 'COMP9517', 'COMP9992', 'COMP9993', 'COMP4141', 'COMP6741', 'MATH5845', 'MATH5855', 'MATH5905', 'MATH5960', 'COMP9313'
, 'COMP9315', 'COMP9318', 'COMP9319', 'COMP9321', 'COMP4418', 'COMP6714', 'COMP9417', 'MATH5836', 'COMP9444']
['BINF6###,BINF9###,COMP4###,COMP6###,COMP9###,GSOE92##']


select pe.program, s.code
from program_enrolments pe join terms t on pe.term=t.id
join stream_enrolments se on se.partof=pe.id
join streams s on se.stream=s.id
where pe.student=5123788
and t.starting=(
    select max(t1.starting)
    from program_enrolments pe1 join terms t1 on pe1.term=t1.id
    where pe1.student=5123788
    );

 program |  code
---------+--------
    8543 | COMPSS

select pe.program, s.code
from program_enrolments pe join terms t on pe.term=t.id
join stream_enrolments se on se.partof=pe.id
join streams s on se.stream=s.id
where pe.student=5198386
and t.starting=(
    select max(t1.starting)
    from program_enrolments pe1 join terms t1 on pe1.term=t1.id
    where pe1.student=5198386
    );


 program |  code
---------+--------
    3707 | SENGAH

select pe.program,  p.name, s.code, s.name
from program_enrolments pe join terms t on pe.term=t.id
join stream_enrolments se on se.partof=pe.id
join streams s on se.stream=s.id
join programs p on pe.program=p.id
where pe.student=5135945
and t.starting=(
    select max(t1.starting)
    from program_enrolments pe1 join terms t1 on pe1.term=t1.id
    where pe1.student=5135945
    );

 program |  code
---------+--------
    3778 | COMPA1


select s.code, t.code,s.name, ce.mark, ce.grade, s.uoc
from subjects s join courses c on c.subject=s.id
join course_enrolments ce on ce.course=c.id
join terms t on t.id=c.term
where s.code='COMP1521'
and ce.student=5198386;

   code   | code |           name            | mark | grade | uoc
----------+------+---------------------------+------+-------+-----
 COMP1531 | 17s2 | Software Eng Fundamentals |   94 | HD    |   6


select s.code,sr.stream, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
where s.code='SENGAH';


select pr.program::text as code, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req,r.max_req
from program_rules pr join rules r on pr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
where aog.type='subject' and pr.program=3707

union
select s.code, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
where  aog.type='subject' and s.code='SENGAH';


select pr.program::text as code, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req,r.max_req
from program_rules pr join rules r on pr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
where aog.type='subject' and aog.defby='enumerated' and pr.program=3707

union
select s.code, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
where  aog.type='subject' and aog.defby='enumerated' and s.code='SENGAH';


select pr.program::text as code, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req,r.max_req,r.type
from program_rules pr join rules r on pr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
where aog.type='subject' and pr.program=3707
union
select s.code, r.id, r.name, aog.type, aog.defby, aog.definition, r.min_req, r.max_req, r.type
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
where  aog.type='subject' and s.code='COMPBH';



select s.code, r.name,  aog.definition, r.min_req, r.max_req, r.type,
       sj.code, sj.name, ce.mark, ce.grade, sj.uoc, t.code
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
join subjects sj on aog.definition like concat('%',sj.code,'%')
join courses c on c.subject=sj.id
join course_enrolments ce on ce.course=c.id
join terms t on t.id=c.term
where  aog.type='subject' and aog.defby='enumerated' and s.code='COMPBH'
and ce.student=5197273

union
select s.code, r.name as rule_name,  aog.definition, r.min_req, r.max_req, r.type,
       sj.code as subject, sj.name as subject_name, ce.mark, ce.grade, sj.uoc, t.code as term
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
join subjects sj on aog.definition like concat('%',sj.code,'%') or aog.definition like concat('%',substring(sj.code,1,5),'###','%')
join courses c on c.subject=sj.id
join course_enrolments ce on ce.course=c.id
join terms t on t.id=c.term
where  aog.type='subject' and aog.defby='pattern' and r.type='PE' and s.code='COMPBH'
and ce.student=5197273;

select s.code, r.name as rule_name,  aog.definition, r.min_req, r.max_req, r.type,
       sj.code as subject, sj.name as subject_name, ce.mark, ce.grade, sj.uoc, t.code as term
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
join subjects sj on aog.definition like concat('%',sj.code,'%') or aog.definition like concat('%',substring(sj.code,1,3),'###','%')
join courses c on c.subject=sj.id
join course_enrolments ce on ce.course=c.id
join terms t on t.id=c.term
where  aog.type='subject' and aog.defby='pattern' and r.type='GE' and s.code='COMPBH'
and ce.student=5197273


select s.code, r.name as rule_name,  aog.definition, r.min_req, r.max_req, r.type,
       sj.code as subject, sj.name as subject_name, ce.mark, ce.grade, sj.uoc, t.code as term
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
join subjects sj on aog.definition like concat('%',sj.code,'%') or aog.definition like concat('%',substring(sj.code,1,5),'###','%')
join courses c on c.subject=sj.id
join course_enrolments ce on ce.course=c.id
join terms t on t.id=c.term
where  aog.type='subject' and aog.defby='pattern' and r.type='PE' and s.code='COMPBH'
and ce.student=5197273;


select s.code stream, r.name rule_name,  aog.definition, r.min_req, r.max_req, r.type,
       sj.code subject, sj.name subject_name, ce.mark, ce.grade, sj.uoc, t.code term
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
join subjects sj on aog.definition like concat('%',sj.code,'%')
join courses c on c.subject=sj.id
join course_enrolments ce on ce.course=c.id
join terms t on t.id=c.term
where  aog.type='subject' and aog.defby='enumerated' and s.code='COMPBH'
and ce.student=5197273;

create or replace view v2
as

select pr.program :: text as code,2 as strm_prog,  r.name rule_name, aog.defby, aog.definition, r.min_req,r.max_req, r.type
from program_rules pr join rules r on pr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
where aog.type='subject' and pr.program=3707
union
select s.code, 1 as strm_prog, r.name rule_name,aog.defby,  aog.definition, r.min_req, r.max_req, r.type
from stream_rules sr join rules r on sr.rule=r.id
join academic_object_groups aog on aog.id=r.ao_group
join streams s on s.id=sr.stream
where  aog.type='subject' and s.code='COMPBH';




mymyunsw=# select * from v2;
  code  |           rule_name            |   defby    |                                    definition                                    | min_req | max_req | type
--------+--------------------------------+------------+----------------------------------------------------------------------------------+---------+---------+------
 COMPBH | COMPBH Design                  | enumerated | {ENGG1000;DESN1000},DESN2000                                                     |         |         | CC
 COMPBH | COMPBH Maths                   | enumerated | {MATH1131;MATH1141},{MATH1231;MATH1241},MATH2069,MATH2099                        |         |         | CC
 COMPBH | COMPBH Computing Electives     | pattern    | ENGG2600,ENGG3060,ENGG3600,ENGG4600,COMP3###,COMP4###,COMP6###,COMP9###          |      36 |         | PE
 3707   | Industrial Training            | enumerated | ENGG4999                                                                         |         |         | CC
 COMPBH | COMPBH Advanced Core           | enumerated | COMP3211,COMP3222,COMP3231,COMP3601,COMP4601,COMP4920,COMP4951,COMP4952,COMP4953 |         |         | CC
 COMPBH | COMPBH Physics and Electronics | enumerated | {PHYS1121;PHYS1131},{PHYS1221;PHYS1231},ELEC1111,ELEC2133,ELEC2134               |         |         | CC
 COMPBH | Foundational Computing         | enumerated | COMP1511,COMP1521,COMP1531,COMP2511,COMP2521                                     |         |         | CC
 3707   | General Education              | pattern    | GEN#####                                                                         |      12 |      12 | GE
(8 行记录)

create or replace view v3 as select code, rule_name, defby, min_req,max_req, type, regexp_split_to_table(definition,',') as definition from v2;

mymyunsw=# select * from v3;
  code  |           rule_name            |   defby    | min_req | max_req | type | regexp_split_to_table
--------+--------------------------------+------------+---------+---------+------+-----------------------
 COMPBH | COMPBH Design                  | enumerated |         |         | CC   | {ENGG1000;DESN1000}
 COMPBH | COMPBH Design                  | enumerated |         |         | CC   | DESN2000
 COMPBH | COMPBH Maths                   | enumerated |         |         | CC   | {MATH1131;MATH1141}
 COMPBH | COMPBH Maths                   | enumerated |         |         | CC   | {MATH1231;MATH1241}
 COMPBH | COMPBH Maths                   | enumerated |         |         | CC   | MATH2069
 COMPBH | COMPBH Maths                   | enumerated |         |         | CC   | MATH2099
 COMPBH | COMPBH Computing Electives     | pattern    |      36 |         | PE   | ENGG2600
 COMPBH | COMPBH Computing Electives     | pattern    |      36 |         | PE   | ENGG3060
 COMPBH | COMPBH Computing Electives     | pattern    |      36 |         | PE   | ENGG3600
 COMPBH | COMPBH Computing Electives     | pattern    |      36 |         | PE   | ENGG4600
 COMPBH | COMPBH Computing Electives     | pattern    |      36 |         | PE   | COMP3###
 COMPBH | COMPBH Computing Electives     | pattern    |      36 |         | PE   | COMP4###
 COMPBH | COMPBH Computing Electives     | pattern    |      36 |         | PE   | COMP6###
 COMPBH | COMPBH Computing Electives     | pattern    |      36 |         | PE   | COMP9###
 3707   | Industrial Training            | enumerated |         |         | CC   | ENGG4999
 COMPBH | COMPBH Advanced Core           | enumerated |         |         | CC   | COMP3211
 COMPBH | COMPBH Advanced Core           | enumerated |         |         | CC   | COMP3222
 COMPBH | COMPBH Advanced Core           | enumerated |         |         | CC   | COMP3231
 COMPBH | COMPBH Advanced Core           | enumerated |         |         | CC   | COMP3601
 COMPBH | COMPBH Advanced Core           | enumerated |         |         | CC   | COMP4601
 COMPBH | COMPBH Advanced Core           | enumerated |         |         | CC   | COMP4920
 COMPBH | COMPBH Advanced Core           | enumerated |         |         | CC   | COMP4951
 COMPBH | COMPBH Advanced Core           | enumerated |         |         | CC   | COMP4952
 COMPBH | COMPBH Advanced Core           | enumerated |         |         | CC   | COMP4953
 COMPBH | COMPBH Physics and Electronics | enumerated |         |         | CC   | {PHYS1121;PHYS1131}
 COMPBH | COMPBH Physics and Electronics | enumerated |         |         | CC   | {PHYS1221;PHYS1231}
 COMPBH | COMPBH Physics and Electronics | enumerated |         |         | CC   | ELEC1111
 COMPBH | COMPBH Physics and Electronics | enumerated |         |         | CC   | ELEC2133
 COMPBH | COMPBH Physics and Electronics | enumerated |         |         | CC   | ELEC2134
 COMPBH | Foundational Computing         | enumerated |         |         | CC   | COMP1511
 COMPBH | Foundational Computing         | enumerated |         |         | CC   | COMP1521
 COMPBH | Foundational Computing         | enumerated |         |         | CC   | COMP1531
 COMPBH | Foundational Computing         | enumerated |         |         | CC   | COMP2511
 COMPBH | Foundational Computing         | enumerated |         |         | CC   | COMP2521
 3707   | General Education              | pattern    |      12 |      12 | GE   | GEN#####
(35 行记录)


select
from v3
join subjects sj on v3.definition=sj.code and v3.defby='enumerated'
join courses c on c.subject=sj.id
join course_enrolments ce on ce.course=c.id
join terms t on t.id=c.term

