WITH total_subs AS (
SELECT	challenge_id,
		SUM(total_submissions) AS sum_total_subs,
		SUM(total_accepted_submissions) AS sum_total_acc_subs
FROM	Submission_Stats
GROUP BY	challenge_id),

total_views AS (
SELECT	challenge_id,
		SUM(total_views) AS sum_total_views,
		SUM(total_unique_views) AS sum_total_unq_views
FROM	View_Stats
GROUP BY	challenge_id)

SELECT	C.contest_id, C.hacker_id, C.name,
		SUM(F.sum_total_subs),
		SUM(F.sum_total_acc_subs),
		SUM(G.sum_total_views),
		SUM(G.sum_total_unq_views)
FROM	Contests C
LEFT JOIN Colleges D ON C.contest_id = D.contest_id
LEFT JOIN Challenges E ON D.college_id = E.college_id
LEFT JOIN total_subs F ON E.challenge_id = F.challenge_id
LEFT JOIN total_views G ON E.challenge_id = G.challenge_id
GROUP BY C.contest_id, C.hacker_id, C.name
HAVING SUM(F.sum_total_subs) + SUM(F.sum_total_acc_subs) + SUM(G.sum_total_views) + SUM(G.sum_total_unq_views) <> 0
ORDER BY C.contest_id
