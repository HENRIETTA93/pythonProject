-- fix pattern bugs in some ao_group definitions
update academic_object_groups
set definition = replace(definition, 'GSOE92###', 'GSOE92##')
where definition like '%GSOE92###';
