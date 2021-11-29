drop view if exists Q6;
drop view if exists MatchScores;
drop view if exists TeamScores;
drop view if exists TeamsInMatches;
drop view if exists GoalsByTeamInMatch;

create view GoalsByTeamInMatch
as
select g.scoredIn as match, p.memberOf as team, count(*) as goals
from   Goals g join Players p on (p.id = g.scoredBy)
group  by g.scoredIn, p.memberOf;
;

create view TeamsInMatches
as
select i.match as match, i.team as team, t.country as country
from   Involves i join Teams t on (i.team = t.id)
;

create view TeamScores
as
select tim.match, tim.country, coalesce(gtm.goals, 0) as goals
from   TeamsInMatches tim left join GoalsByTeamInMatch gtm
        on (tim.team = gtm.team and tim.match = gtm.match)
;

create view MatchScores
as
select t1.match,
        t1.country as team1, t1.goals as goals1,
        t2.country as team2, t2.goals as goals2
from   TeamScores t1 join TeamScores t2
        on (t1.match = t2.match and t1.country < t2.country)
;

create view Q6
as
select m.city as location, m.playedOn as date,
        ms.team1, ms.goals1, ms.team2, ms.goals2
from   Matches m join MatchScores ms on (m.id = ms.match)
;