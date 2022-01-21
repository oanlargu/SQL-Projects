SELECT DISTINCT N,
                    (CASE WHEN P2 IS NOT NULL THEN 'Leaf' ELSE 
                                        (CASE WHEN P1 IS NOT NULL THEN 'Inner' ELSE 'Root' END)
                    END) as result
      FROM
            (SELECT distinct b.N, b.P AS P1, c.P as P2
            FROM BST AS b
            left join BST AS c
            ON b.P = c.N
            ) AS joined;

SELECT CASE
	WHEN P IS NULL THEN CONCAT(N, ' Root')
	WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner')
	ELSE CONCAT(N, ' Leaf')
	END
FROM BST
ORDER BY N ASC
											