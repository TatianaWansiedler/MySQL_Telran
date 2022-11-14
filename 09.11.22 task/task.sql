-- 
-- 1. Вывести имя, фамилию, зарплату, должность и минимальную зарплату для этой должности для всех сотрудников
select 
     t1.first_name,
     t1.last_name,
     t1.salary,
     t2.min_salary,
     t2.job_title
 from hr.employees t1
 inner join  hr.jobs t2
 on t1.job_id = t2.job_id;
 
 
  -- 2. Вывести имя, фамилию, должность, департамент и название города, где находится департамент.
 
 select 
     t1.first_name,
     t1.last_name,
     t2.job_title,
     t3.department_name,
     t4.city
 from hr.employees t1
 inner join hr.jobs t2
 on t1.job_id = t2.job_id
 inner join hr.departments t3
 on t1.department_id = t3.department_id
 inner join hr.locations t4
 on t3.location_id = t4.location_id;
 
 -- 3. Вывести имя, фамилию, зарплату, должность, минимальную и максимальную зарплату для 
-- этой должности только тех сотрудников, у которых зарплата равняется либо минимальной зарплате, либо максимальной.
 
select 
     t1.first_name,
     t1.last_name,
     t1.salary,
     t2.job_title,
     t2.min_salary,
     t2.max_salary
 from hr.employees t1
 left join hr.jobs t2
 on t1.job_id = t2.job_id
 where t1.salary in (t2.min_salary,t2.max_salary);
 
  -- 4. Вывести названия департаментов, улицу в которой он находится и название города, которые находятся в штатах/провинции.
 
 select 
     t1.department_name,
     t2.street_address,
     t2.city
 from hr.departments t1
 inner join hr.locations t2
 on t1.location_id = t2.location_id
 where t2.state_province is not null; 
 
  -- 5. Вывести имя, фамилию, зарплату тех работников, которые зарабатывают больше, чем Den Raphaely. (Self join)
  
select 
     t1.first_name,
     t1.last_name,
     t1.salary
 from hr.employees t1, hr.employees t2
 where t1.salary > t2.salary and (t2.first_name = 'Den' and t2.last_name='Raphaely');
 
 
 -- 6. Вывести название департамента и название города, в котором он находится.

select 
 t1.department_name,
 t2.city
 from hr.departments t1
 inner join hr.locations t2
 on t1.location_id = t2.location_id;
 
 -- 7. Оставить только те города, в которых есть департаменты.
select distinct
 t1.city
 from hr.locations t1
 left join hr.departments t2
 on t1.location_id = t2.location_id
 where t2.department_id is not null;
 
-- 8. Вывести название тех городов, в которых нет департаментов.

 select distinct
 t1.city
 from hr.locations t1
 left join hr.departments t2
 on t1.location_id = t2.location_id
 where t2.department_id is null;
 
-- 9. Вывести имя, фамилию, должность и название департамента только тех работников, которые
-- находятся в Великобритании.
select
    t1.first_name,
    t1.last_name, 
    t2.job_title, 
    t3.department_name
from hr.employees t1
inner join hr.jobs t2
on t1.job_id = t2.job_id
inner join hr.departments t3
on t1.department_id = t3.department_id inner join hr.locations t4
on t3.location_id = t4.location_id
where t4.country_id = 'UK';

-- 10. Вывести имя, фамилию и department_id тех работников, которые работают в том же
-- департаменте с Luis Popp. (Self join)
select 
    t1.first_name, 
    t1.last_name, 
    t1.department_id
from hr.employees t1, hr.employees t2
where t1.department_id = t2.department_id and (t2.first_name = 'Luis' and t2.last_name='Popp');
 
 