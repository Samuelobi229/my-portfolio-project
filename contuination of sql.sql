use `parks_and _recreation`;

#  all from the table
select * from parks_and_recreation.employee_demographics;


#select employee_id, First_name, Age
select employee_id, First_name, Age from parks_and_recreation.employee_demographics;

select*
from parks_and_recreation.employee_demographics;


#<,> <=, >=, != or <>, =

#Less than <
# Fetch employee records with age below 30
select*from parks_and_recreation.employee_demographics
where age < 30;


#Less than <


# Fetch employee records with age below 30
select*from parks_and_recreation.employee_demographics
where age < 60;

# Fetch employee whose salary is above 50,000
select*from parks_and_recreation.employee_salary
where salary > 50000;

#Fetch employees whose age is above 50
select* from parks_and_recreation.employee_demographics
where age > 50;

#Less than equals to <=
# fetch employee records whose age is less than or equals 50
select* from parks_and_recreation.employee_demographics
where age <= 50;

# Greater than equals to >=
# fetch employees whose salary is 100,000 above
select* from parks_and_recreation.employee_salary
where salary >= 100000;
 
#equal to =
# Fetch male employee gender
select* from parks_and_recreation.employee_demographics
where gender = "Male";

# not equals to !=or<>
# Fetch employee whose occupation is not office manager
select* from parks_and_recreation.employee_salary
where occupation != "office manager";


# fetch employee gender that are not male
select*from parks_and_recreation.employee_demographics
where gender != "male";

# AND, OR NOT

# AND
# Fetch employees whose age is above 20 and gender is a male 
select* from parks_and_recreation.employee_demographics
where age > 20 and gender <> "female";

# fetch employee w hose occupation is office manager and salary is above 30000
select* from parks_and_recreation.employee_salary
where occupation = "office manager" and salary > 30000;


# OR
# Fetch employee records whose gender is a female or whose age is from 30 and above
select*from parks_and_recreation.employee_demographics where gender="female" or age >= 30;


# Not
# Fetch employees that are not male age is below 50
select* from parks_and_recreation.employee_demographics
where not gender ="Male" and age < 50;

# Like keyword  % (Partial match)
# Fetch employee whose firstname start with jer
select * from employee_demographics
where first_name  like "Jer%";

# Fetch employees whose firstname end with jer
select * from employee_demographics
where first_name  like "%Jer";

# Fetch employee whose firstname contains jer
select* from employee_demographics
where first_name like "%jer%";

# Fetch employee whose lastname start with lud
select* from employee_demographics
where last_name like "lud%";

# MAX, MIN, COUNT, SUM, AVG, DISTINCT

# MAX
# Fetch the age of the oldest employee in the company
select Max(age) from employee_demographics;

#MIN
# Fetch the age of the youngest employee in the company
select min(Age) from employee_demographics;

# COUNT
# Fetch the total number of employee in the company
select count(employee_id) from employee_demographics;

#SUM
# Fetch the total amount of salary paid to employee every month
select sum(salary) from employee_salary;

# AVG
# Fetch the average salary range of the employee in the company
select avg(salary) from employee_salary;

#DISTINCT
# fetch distinct gender from the employee table
select distinct gender from employee_demographics;

# GROUP BY
# Fetch the average age  of male and female 
select gender, avg(age) from employee_demographics
group by gender;

# Fetch average salary in each department
select occupation, AVG(salary) from employee_salary
group by occupation;

#ORDER BY ( FOR SORTING IN ASCENDING AND DESCENDING ORDER)
#Fetch average salary in each department sort by occupation in ascending order
select occupation, AVG(salary) from employee_salary
group by occupation
order by occupation;

#Fetch average salary in each department sort by occupation in descending order
select occupation, AVG(salary) from employee_salary
group by occupation
order by occupation desc;

#Fetch average salary in each department sort by occupation in descending order
select occupation, AVG(salary) from employee_salary
group by occupation
order by avg(salary) desc;

# LIMIT
#Fetch the highest paid employee in the company
select * from employee_salary
order by salary desc
limit 2;

# Fetch the second highest paid employee
select* from employee_salary
order by salary desc;

select*from employee_salary
where first_name = "Leslie"
order by salary desc;

# JOINS
#INNER JOINS
select* from employee_demographics;
select* from employee_salary;

# inner join employee_demographics together with employee_salary
select* from employee_demographics
inner join employee_salary
on employee_demographics.employee_id = employee_salary. employee_id;

# Left join
# left join employee_demographics together with employee_salary
select* from employee_demographics
Left join employee_salary
on employee_demographics.employee_id = employee_salary. employee_id;

# Left join
# left join employee_demographics together with employee_salary
select * from  employee_demographics
left join employee_salary
on employee_demographics.employee_id = employee_salary. employee_id;



# left join employee_salary together with employee_demographics
# on salary table only show, employee_id, occupation, salary
#on demographics table only show first_name, last_name, birth_date
select employee_salary.employee_id,employee_salary.occupation,employee_salary. salary,
employee_demographics.first_name, employee_demographics.last_name,employee_demographics.birth_date
from employee_salary
 left join employee_demographics
on employee_demographics.employee_id = employee_salary. employee_id;


# Right join
#right join employee_salary together with employee_demographics
select* from employee_salary
right join employee_demographics
on employee_demographics.employee_id = employee_salary. employee_id;

# ALAISING
select * from employee_salary as sal
right join employee_demographics as dem
on dem.employee_id=sal.employee_id;

select SAL.employee_id,SAL.occupation,SAL.salary,
dem.first_name,dem.last_name,dem.birth_date
from employee_salary as SAL
left join employee_demographics AS dem
on dem.employee_id = SAL.employee_id;

update employee_demographics
set first_name = 'judith', age ='20'
where employee_id =4;

update employee_salary
set salary = '50000', first_name = 'judith'
where employee_id =4;

# updating last_name where occupation is  assistant to the director of parks and recreation
update employee_salary
set last_name = 'Trump'
where occupation = 'Assistant to the director of parks and recreation';

update employee_demographics
set last_name = 'Trump'
where first_name = 'judith';

# delete is used to delete existing records from a record 
select* from employee_demographics;

# delete mark brendanawicz from the record
delete from employee_demographics 
where employee_id = 11;

# case statement goes through conditions and returns a value when the first condition is met( like an if-then-else statement)
select*from employee_salary;

# fetch records for case conditions if salary is >50000 'senior worker', =50000 'junior worker',else 'entry level'and end as level
select employee_salary;

# fetch records for case condition if salary is >50000'senior worker', else 'entry level' and end as level
select *,
case
when salary>50000 then 'senior worker' 
when salary = 50000 then 'junior worker'
else 'entry level'
end as level_role;

# fetch employee_id,age, birth_date with case condition if age is >40 'old', =< 'young' else 'too old'  and end as age_range

select employee_id,age,birth_date,
case
	when age <40 then 'young' 
	when age >=40 then 'old'
	else 'too old'
end as age_range
from employee_demographics;




from employee_salary;
