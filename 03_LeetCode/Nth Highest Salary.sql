DECLARE @N as INT=2;

SELECT Id, salary
FROM   ( SELECT *, DENSE_RANK() OVER (ORDER BY salary) as rank
         FROM Employee
       ) as result
WHERE rank = @N