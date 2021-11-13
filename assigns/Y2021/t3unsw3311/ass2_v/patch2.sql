-- add missing ENGG1000 to SENGAH Workshops/Design rule
update academic_object_groups
set definition='ENGG1000,DESN2000,SENG2011,SENG2021,SENG3011'
where id = 686014;

-- fix buggy pattern in some a_o_groups
update academic_object_groups
set definition = replace(definition,'COMP9##,','COMP9###,')
where definition like '%COMP9##,%';
