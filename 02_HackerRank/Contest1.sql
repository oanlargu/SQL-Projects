DROP TABLE IF EXISTS ranks
select distinct submission_date, count(hacker_id) OVER (partition by submission_date) as unique_hacker_count,
						first_value(hacker_id) OVER (partition by submission_date ORDER BY score DESC, hacker_id) as first_hacker_id
into ranks
from Submissions2

select r.*, h.name
from ranks r
left join Hackers2 h
on r.first_hacker_id = h.hacker_id
order by submission_date


select hacker_id, submission_id, score
from Submissions
Where submission_date = '2016-03-03'
group by hacker_id, submission_id, score
order by score DESC

DROP TABLE hackers2
CREATE TABLE hackers2
(hacker_id int,
name varchar (20))

CREATE TABLE submissions2
(submission_date date,
submission_id int,
hacker_id int,
score int)


INSERT INTO hackers2 VALUES(15758,'Rose')
INSERT INTO hackers2 VALUES(20703,'Angela')
INSERT INTO hackers2 VALUES(36396,'Frank')
INSERT INTO hackers2 VALUES(38289,'Patrick')
INSERT INTO hackers2 VALUES(44065,'Lisa')
INSERT INTO hackers2 VALUES(53473,'Kimberly')
INSERT INTO hackers2 VALUES(62529,'Bonnie')
INSERT INTO hackers2 VALUES(79722,'Michael')

select * from submissions2

INSERT INTO Submissions2 VALUES('2016-03-01',8494,207030,0)
INSERT INTO Submissions2 VALUES('2016-03-01',22403,53473,15)
INSERT INTO Submissions2 VALUES('2016-03-01',23965,79722,60)
INSERT INTO Submissions2 VALUES('2016-03-01',30173,36396,70)
INSERT INTO Submissions2 VALUES('2016-03-02',34928,20703,0)
INSERT INTO Submissions2 VALUES('2016-03-02',38740,15758,60)
INSERT INTO Submissions2 VALUES('2016-03-02',42769,79722,25)
INSERT INTO Submissions2 VALUES('2016-03-02',44364,79722,60)
INSERT INTO Submissions2 VALUES('2016-03-03',45440,20703,0)
INSERT INTO Submissions2 VALUES('2016-03-03',49050,36396,70)
INSERT INTO Submissions2 VALUES('2016-03-03',50273,79722,5)
INSERT INTO Submissions2 VALUES('2016-03-04',50344,20703,0)
INSERT INTO Submissions2 VALUES('2016-03-04',51360,44065,90)
INSERT INTO Submissions2 VALUES('2016-03-04',54404,53473,65)
INSERT INTO Submissions2 VALUES('2016-03-04',61533,79722,45)
INSERT INTO Submissions2 VALUES('2016-03-05',72852,20703,0)
INSERT INTO Submissions2 VALUES('2016-03-05',74546,38289,0)
INSERT INTO Submissions2 VALUES('2016-03-05',76487,62529,0)
INSERT INTO Submissions2 VALUES('2016-03-05',82439,36396,10)
INSERT INTO Submissions2 VALUES('2016-03-05',90006,36396,40)
INSERT INTO Submissions2 VALUES('2016-03-06',90404,20703,0)


select * from hackers2

select distinct hacker_id
from submissions2
where submission_date = '2016-03-01'
INTERSECT
select distinct hacker_id
from submissions2
where submission_date = '2016-03-02'
INTERSECT
select distinct hacker_id
from submissions2
where submission_date = '2016-03-03'
INTERSECT
select distinct hacker_id
from submissions2
where submission_date = '2016-03-04'
INTERSECT
select distinct hacker_id
from submissions2
where submission_date = '2016-03-05'
INTERSECT
select distinct hacker_id
from submissions2
where submission_date = '2016-03-06'

