select*from employee_demographics;
select*from employee_salary;

# Remove a colunm(s) from a table 
# remove first_name and last_name columns from employee_salary
alter table employee_salary
drop column first_name,
drop column last_name;

select*from employee_demographics;
select*from employee_salary;

# what is  the average salary of the male gender
#with left join

select avg(sal.salary) Average_male_salary from employee_demographics dem
left join employee_salary sal
on dem.employee_id=sal.employee_id
where dem.gender="male";

# average salary by gender
select*from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

select gender,avg(salary) from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id
group by gender;

# subquery
#what is the salary of the male gender
select avg(salary) from employee_salary
where employee_id in (
select employee_id from employee_demographics where gender = "male");

# Remove a colunm(s) from a table 
# remove first_name and last_name columns from employee_salary
alter table employee_salary
drop column first_name,
drop column last_name;

# subquery
#what is the avg salary base on gender
select avg(salary) from employee_salary
from employee_demographics where gender = "male");


select gender, avg(sal.salary) average_salary from employee_demographics dem
 join employee_salary sal
on dem.employee_id=sal.employee_id
group by gender;


# using SUBQUERY
select gender,
avg((select salary from employee_salary sal where sal.employee_id=dem.employee_id))
As average_salary
From employee_demographics dem
group by gender;

# WIINDOWS FUNCTIONS












# SUBQUERY




# WINDOWS FUNCTIONS ROW_NUMBER, RANK, DENSE RANK

select gender, avg(salary) Over(partition by gender)
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

#Running total salary based on gender
select dem.employee_id,gender, salary,sum(salary) Over(partition by gender order by dem.employee_id)running_total
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

# Row number
select dem.employee_id,gender, salary,sum(salary) over(),
row_number() over() from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

select dem.employee_id,gender, salary,sum(salary) over(),
row_number() over(partition by gender ) from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

select dem.employee_id,gender, salary,sum(salary) over(),
row_number() over(partition by gender order by salary desc) from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

select dem.employee_id,gender, salary,
rank() over()ranking
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

select dem.employee_id,gender, salary,
rank() over(order by salary desc)ranking
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;

#dense rank
select dem.employee_id,gender, salary,
row_number() over(order by salary desc) row_num,
rank() over(order by salary desc)ranking,
dense_rank () over(order by salary desc) dense_rank_num
from employee_demographics dem
left join employee_salary sal
on sal.employee_id = dem.employee_id;