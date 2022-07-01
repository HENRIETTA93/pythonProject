-- Related SQL tables:
-- (1) jobs_job;  (2) jobs_applycandidates; (3) auth_user; (4) accounts_employerprofiledetail; (5) accounts_employerprofiledetail; (6) questions_invitedcandidates
--
-- Related Foreign Keys:
-- jobs_applycandidates.id=jobs_jobs.user_id=auth_user.id=accounts_employerprofiledetail.user_id
-- questions_invitedcandidates.email = jobs_applycandidates.email


-- 1	User type composition	Job Seekers vs. Employer	Pie Chart	Overview Level	Overview (By Type)
-- 2	Fraud employer %??	Real Employer or not	Barchat -Horizontal	Overview Level	Overview (By Type)
-- 3	Subscription status composition	Free trials vs. Paid (Plan interval = Pro or Prem) vs. lost (Position limit = 0 & Plan Interval =regualr)	Pie Chart	Overview Level	Overview (By Type)
-- 4	Active days	Real Employers: Days between (Join Date and last login date) 	Barchat -Vertical	Overview Level	User Engagement (By Timeframe)
-- 5		Real Employers: Days between (Date Joined and Created date for 1st Job) 	Pie Chart or Bar Chart	Overview Level	User Engagement (By Timeframe)
-- 6		Total Active Jobs vs. Video Interview Usage	Pie Chart	Overview Level	User Engagement (By Type)
-- 7		Total Video invited Candidates vs. Recorded Video Cnadidates	Pie Chart	Overview Level	Overview (By Type)


-- 1
select
  case when is_employer = false then 'Job Seekers' else 'Employer' end as user_type , count(username)
from
  "User_Email_List"
group by
  case when is_employer = false then 'Job Seekers' else 'Employer' end;


-- 1
select 'Job Seekers' as type, JobSeekers
from
(
select count(id) as JobSeekers
from jobs_applycandidates
) t1
union
select 'Employer' as type, employer
from
(
select count(id) as employer
from accounts_employerprofiledetail
) t2 ;

-- 2
select
case when f_name is not null then 'real' else 'not real' end as type,
count(accounts_employerprofiledetail.id)
from accounts_employerprofiledetail
join auth_user on accounts_employerprofiledetail.user_id=auth_user.id
group by case when f_name is not null then 'real' else 'not real' end;


select
case when jobs_jobs.job_post=1 then 'real' else 'fraud' end as type,
count(accounts_employerprofiledetail.id)
from accounts_employerprofiledetail
join auth_user on accounts_employerprofiledetail.user_id=auth_user.id
join jobs_jobs on jobs_jobs.user_id=auth_user.id
group by case when jobs_jobs.job_post=1 then 'real' else 'fraud' end;




-- 4

select
case when active_days between 0 and 10 then '0~10'
when active_days between 11 and 20 then '11~20'
when active_days between 21 and 30 then '21~30'
when active_days between 31 and 40 then '31~40'
else '>40' end as active_days,
sum(num)
from
(
select date_part('day',auth_user.last_login-auth_user.date_joined) as active_days,
count(accounts_employerprofiledetail.id) num
from accounts_employerprofiledetail
join auth_user on accounts_employerprofiledetail.user_id=auth_user.id
join jobs_jobs on jobs_jobs.user_id=auth_user.id
where jobs_jobs.job_post=1 and date_part('day',auth_user.last_login-auth_user.date_joined) is not null
group by date_part('day',auth_user.last_login-auth_user.date_joined)
) t
group by
case when active_days between 0 and 10 then '0~10'
when active_days between 11 and 20 then '11~20'
when active_days between 21 and 30 then '21~30'
when active_days between 31 and 40 then '31~40'
else '>40' end;



-- 5

with tt AS(
  select
    date_part('day', t.first_create_job - u.date_joined) as active_days,
    count(t.id) as num
  from
    (
      select
        min(jobs_jobs.create_date) as first_create_job,
        accounts_employerprofiledetail.id
      from
        accounts_employerprofiledetail
        join auth_user on accounts_employerprofiledetail.user_id = auth_user.id
        join jobs_jobs on jobs_jobs.user_id = auth_user.id
      where
        jobs_jobs.job_post = 1
      group by
        accounts_employerprofiledetail.id
    ) t
    join auth_user u on u.id = t.id
  group by
    date_part('day', t.first_create_job - u.date_joined)
)
select
  case when active_days between 0
  and 300 then '0~300' when active_days between 301
  and 400 then '301~400' when active_days between 401
  and 500 then '401~500' when active_days between 501 and 600 then '501~600' else '>600' end as active_days,
  sum(num)
from
  tt
group by
  case when active_days between 0
  and 300 then '0~300' when active_days between 301
  and 400 then '301~400' when active_days between 401
  and 500 then '401~500' when active_days between 501 and 600 then '501~600' else '>600' end;



-- 6

select 'active' as type, sum(case when is_active ='true' then 1 else 0 end ) as num
from questions_invitedcandidates
union
select 'video_interview' as type, sum(case when current_stage  like 'Video%' then 1 else 0 end) as num
from questions_invitedcandidates;


-- 7
select
  'Total Video invited Candidates' as type,
  count(jobs_applycandidates.id) as num
from
  questions_invitedcandidates
  join jobs_applycandidates on questions_invitedcandidates.email = jobs_applycandidates.email
where
  questions_invitedcandidates.is_invited = 'true'
  and questions_invitedcandidates.current_stage like 'Video%'
union
select
  'Recorded Video Cnadidates' as type,
  count(jobs_applycandidates.id) as num
from
  questions_invitedcandidates
  join jobs_applycandidates on questions_invitedcandidates.email = jobs_applycandidates.email
where
  questions_invitedcandidates.is_recorded = 'true'
  and questions_invitedcandidates.current_stage like 'Video%';