	select	personel.company_code,
			c.founder, personel.lm, personel.sm, personel.m, personel.e
	from (
		select c.company_code,
				COUNT(distinct lm.lead_manager_code) as lm,
				COUNT(distinct sm.senior_manager_code) as sm,
				COUNT(distinct m.manager_code) as m,
				COUNT(distinct e.employee_code) as e
		from company c
		join lead_manager lm
		on c.company_code = lm.company_code
		join senior_manager sm
		on c.company_code = sm.company_code
		join manager m
		on c.company_code = m.company_code
		join employee e
		on c.company_code = e.company_code
		group by c.company_code
		) as personel
	join company c
	on personel.company_code = c.company_code
	order by LEFT(personel.company_code,1), SUBSTRING(personel.company_code,2,LEN(personel.company_code)-1)