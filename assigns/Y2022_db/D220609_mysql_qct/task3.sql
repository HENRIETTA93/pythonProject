
-- Insert (1 mark)
-- Write an INSERT command to insert a row into badge table. The badge is called ‘Summer Rain’ and the
-- description should be ‘Beach, sun and holidays’.



insert into badge(badgeName, badgeDescription) values('Summer Rain','Beach, sun and holidays');




-- Delete (1 mark)
-- Write a DELETE command to remove all the rows from the player progress table for which progress is
-- complete.

delete from playerprogress where progress='complete';

-- Update (1 mark)
-- Write an UPDATE comment to change the address of all players with the last name ‘Halpin’ who live at ‘1800
-- Zelda Street, Linkburb’ to ’72 Evergreen Terrace, Springfield’.

update player set streetNumber=72,  streetName='Evergreen Terrace', suburb='Springfield'
where lastName ='Halpin' and streetNumber=1800 and streetName='Zelda Street' and suburb='Linkburb';

-- Create Index (1 mark)
-- Currently the database only contains a small number of records. However, the data contained within it is
-- expected to grow significantly in the future. Creating indexes on commonly searched columns is a way
-- performance issues can be minimized. Write a command to create an index on story column of the quest
-- table.

create index idx_story on quest(story(20));

-- Create view – 2 marks
-- Write a command to create a view which lists the firstname, lastname, and account creation date of all
-- players that have started a quest but are currently inactive.

create view vw_inactive_players
as
select pl.firstName, pl.lastName, pl.creationDateTime
from player pl
join playerprogress pp on pl.username=pp.username
join quest q on q.advanceQuestID=pp.questID
where pp.progress='inactive';
