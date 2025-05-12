# STRING FUNCTIONS
# Concat, Length,Right,left,LTRIM,RTRIM,Trim,Replace,Locate,substring,upper,lower

#CONCAT
select concat(" I LOVE"," ", "sql") concatenate_i_love_sql;

#create a new column callled fullname from the employees firstname and lastname
select concat(first_name," ",last_name) full_name from employee_demographics;


#LENGTH
select length("I LOVE CHELSEA FOOTBALL CLUB") string_length;

# FETCH THE LENGTH OF THE FIRST_NAME OF ALL EMPLOYEES
select first_name, length(first_name) fistname_length from employee_demographics;

#RIGHT
select right("i love sql",4);

# fetch the last three letter of all employees lastname
select LEFT (last_name,3) `last 3 letter` from employee_demographics;

select left("i love sql",4);

# LTRIM (REMOVE UNWANTED SPACING FROM THE LEFT HAND SIDE)
select ltrim("    i  love   sql    ") `i love sql`;


# RTRIM (REMOVE UNWANTED SPACING FROM THE LEFT HAND SIDE)
select rtrim("  i  love   sql    ") ;


# TRIM (REMOVE UNWANTED SPACING FROM THE LEFT and right HAND SIDE)
select trim("  i  love   sql    ") ;


# regex_replace ( regular expression replace)
 

SELECT 
  TRIM(
    REPLACE(
        REPLACE("       i love       sql     ", '    ', ' '), 
      '   ', ' ') 
  ) AS cleaned_text;

  # REPLACE (TO REMOVE A STRING AND REPLACE WITH ANOTHER)
select REPLACE ("I LOVE MANCHESTER UNITED", "MANCHESTER UNITED", "CHELSEA") replace_string;


select replace(first_name,"es", "ho") from employee_demographics;

# LOCATE
# locate( To find the position of a character in a string)
select locate("d", "I love data analysis") match_position;

# a code that convert " Ajayi-tobi"to Ajayi tobi
select replace("ajayi-tobi", '-', ' ')`new name`;

# SUBSTRING(TO REMOVE SOME PART OF A STRING)
select substring("I LOVE SQL",3,4) substring; 

#convert all employee lastname to uppercase in employee demographics table
select last_name, upper(last_name) from employee_demographics;

#Lower (convert all employee lastname to lowercase in an employee demographics table)
select last_name,lower(last_name) from employee_demographics;

#UPPER (convert all employee lastname to uppercase in an employee demographics table)
select last_name,upper(last_name) from employee_demographics;

# proper
select concat(upper(LEFT('john',1)), lower(substring('john',2)));
#OR
select concat(concat(upper(left('john',1)), LOWER(SUBSTRING('john',2))),
' ',
concat(upper(right('doe',1)), lower(substring("doe",2))))





