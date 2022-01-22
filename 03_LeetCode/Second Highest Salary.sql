SELECT TOP 1 LEAD(salary) OVER (ORDER BY salary DESC) AS SecondHighestSalary 
FROM (
		SELECT DISTINCT salary 
		FROM Employee_2
	 ) AS result