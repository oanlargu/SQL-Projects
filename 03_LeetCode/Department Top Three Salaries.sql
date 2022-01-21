select Department, Employee, Salary
from (
	select	d.name as Department, e.name as Employee, e.salary as Salary,
			dense_rank() over (partition by departmentId order by salary desc) as rank_
	from employee e
	left join department d
	on e.departmentId = d.id
	 ) as result
where rank_ in (1,2,3)