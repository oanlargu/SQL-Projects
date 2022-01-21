Select list.company_code, cm.founder, list.lm_count, list.sm_count, list.m_count, list.e_count
From
        (
        SELECT c.company_code as company_code,
               count(distinct lm.lead_manager_code) as lm_count,
               count(distinct sm.senior_manager_code) as sm_count,
               count(distinct m.manager_code) as m_count,
               count(distinct e.employee_code) as e_count
        From company c
        left join lead_manager lm
        on c.company_code = lm.company_code

        left join senior_manager sm
        on c.company_code = sm.company_code

        left join manager m
        on c.company_code = m.company_code

        left join employee e
        on c.company_code = e.company_code
        group by c.company_code
        ) AS list
join company as cm
on list.company_code = cm.company_code
order by LEFT(list.company_code, 1), CAST(RIGHT(list.company_code, LEN(list.company_code)-1) as integer)

