update academic_object_groups
set definition = replace(definition,'ENG3600','ENGG3600')
where definition like '%ENG3600%';
