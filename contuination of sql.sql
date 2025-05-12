use `parks_and_recreation`;

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
select*from #Less than <
# Fetch employee records with age below 30
select*from parks_and_recreation.employee_demographics
where age < 30;.employee_demographics
where age < 60;

# greater than >
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



