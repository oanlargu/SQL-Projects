SELECT	id,
		CASE WHEN second_id = id+1 AND third_id=id+2 THEN 1 ELSE 0 END AS consequent
INTO	cte
FROM	(
			SELECT	id,
				LEAD(id) OVER (ORDER BY id) second_id,
				LEAD(id, 2) OVER (ORDER BY id) third_id
			FROM Stadium
			WHERE people >= 100
		) AS result
		

SELECT	id, visit_date, people
FROM	Stadium
WHERE	id IN(
				SELECT id
				FROM cte
				WHERE consequent = 1

				UNION

				SELECT id+1
				FROM cte
				WHERE consequent = 1

				UNION

				SELECT id+2
				FROM cte
				WHERE consequent = 1
			 )

