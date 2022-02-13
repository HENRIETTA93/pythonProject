-- COMP3311 21T3 Ass2 ... extra database definitions
-- add any views or functions you need into this file
-- note: it must load without error into a freshly created mymyunsw database
-- you must submit this even if you add nothing to it

drop type recordtype cascade ;
create type recordtype as
    (
        code text,
        strm_prog integer,
        rid integer,
        rule_name text,
        defby text,
        definition text,
        min_req integer,
        max_req integer,
        type varchar(4),
        rule_order integer
    );
create or replace function fn_q3(_pcode integer, _scode text)
returns setof recordtype
as $$
declare
    rec recordtype;
begin
    for rec in
        select pr.program :: text as code,2 as strm_prog,r.id as rid,  r.name rule_name, aog.defby, aog.definition, r.min_req,r.max_req, r.type,
                (
                case when r.type='CC' then 1
                when r.type='PE' then 2
                when r.type='GE' then 3
                when r.type='FE' then 4
                end
                    ) as rule_order
        from program_rules pr join rules r on pr.rule=r.id
        join academic_object_groups aog on aog.id=r.ao_group
        where aog.type='subject' and pr.program=_pcode
        union
        select s.code, 1 as strm_prog, r.id as rid,  r.name rule_name,aog.defby,  aog.definition, r.min_req, r.max_req, r.type,
                 (
                case when r.type='CC' then 1
                when r.type='PE' then 2
                when r.type='GE' then 3
                when r.type='FE' then 4
                end
                    ) as rule_order
        from stream_rules sr join rules r on sr.rule=r.id
        join academic_object_groups aog on aog.id=r.ao_group
        join streams s on s.id=sr.stream
        where  aog.type='subject' and s.code=_scode
    loop
        return next rec;
    end loop;
end;
$$ language plpgsql
;

-- select * from fn_q3(3707,'COMPBH');
-- select * from fn_q3(8543,'COMPSS');
-- select * from fn_q3(3707,'SENGAH');
-- select * from fn_q3(3778,'COMPA1');


-- select pr.program :: text as code,2 as strm_prog,  r.name rule_name, aog.defby, aog.definition, r.min_req,r.max_req, r.type
-- from program_rules pr join rules r on pr.rule=r.id
-- join academic_object_groups aog on aog.id=r.ao_group
-- where aog.type='subject' and pr.program=3707
-- union
-- select s.code, 1 as strm_prog, r.name rule_name,aog.defby,  aog.definition, r.min_req, r.max_req, r.type
-- from stream_rules sr join rules r on sr.rule=r.id
-- join academic_object_groups aog on aog.id=r.ao_group
-- join streams s on s.id=sr.stream
-- where  aog.type='subject' and s.code='COMPBH';

