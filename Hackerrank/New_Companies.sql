-- Tedious solution
select c.company_code, c.founder,t1.n_lead,t2.n_senior,t3.n_manager, t4.n_employee
from 
(select company_code, founder
from company ast
group by company_code,founder
order by company_code ) c
join 
(select company_code, count(distinct(lead_manager_code)) as n_lead from employee
group by company_code 
order by company_code) t1
on c.company_code = t1.company_code
join
(select company_code, count(distinct(senior_manager_code)) as n_senior from employee
group by company_code 
order by company_code) t2
on t1.company_code = t2.company_code
join
(select company_code, count(distinct(manager_code)) as n_manager from employee
group by company_code 
order by company_code) t3
on t2.company_code = t3.company_code
join
(select company_code, count(distinct(employee_code)) as n_employee from employee
group by company_code 
order by company_code) t4
on t3.company_code = t4.company_code

-- concise solution
SELECT c.company_code, c.founder, 
COUNT(DISTINCT l.lead_manager_code), COUNT(DISTINCT s.senior_manager_code),
 COUNT(DISTINCT m.manager_code), COUNT(DISTINCT e.employee_code)
FROM Company c, Lead_Manager l, Senior_Manager s, Manager m, Employee e
WHERE c.company_code = l.company_code AND 
      l.lead_manager_code = s.lead_manager_code AND
      s.senior_manager_code = m.senior_manager_code AND
      m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder 
ORDER BY c.company_code;
