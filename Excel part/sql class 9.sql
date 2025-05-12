select* from presidential_details_csv;

# check distinct value of each colunm
-- select distinct id from presidential_details_csv;
select distinct `S.No.` from presidential_details_csv;
select distinct president from presidential_details_csv;# casing and spacing problem
select distinct prior from presidential_details_csv; # remove funny symbol
select distinct party from presidential_details_csv; # demorcatic,whig,demorcatic-republicans and republicans wrong spelling
select distinct vice from presidential_details_csv; #Trim values
select distinct salary from presidential_details_csv;
select distinct `date updated` from presidential_details_csv; # format column to sql date
select distinct `date created` from presidential_details_csv; # format column to sql date


# proper case for pressident column
select concat(
upper(left(president,1)),
lower(substring(president,2))
)
from presidential_details_csv;

#proper case for president column
select concat(
upper(left(substring_index(president, ' ', 1), 1)),
lower(substring(substring_index(president, ' ', 1), 2)),
' ',
upper(left(substring_index(president, ' ', -1), 1)),
lower(substring(substring_index(president, ' ', -1), 2)))
As proper_name
FROM presidential_details_csv;

# create a duplicate copy of the original data set
create table presidential
select*from presidential_details_csv;



select* from presidential;

# update the president column with the proper case values
 update presidential
set president= concat(
upper(left(substring_index(president, ' ', 1), 1)),
lower(substring(substring_index(president, ' ', 1), 2)),
' ',
upper(left(substring_index(president, ' ', -1), 1)),
lower(substring(substring_index(president, ' ', -1), 2)));



# trim the president column
select trim(president) from presidential;

# update the president column with the trimmed values
update presidential
set president = trim(president);

# remove symbols from prior column
select replace(prior,"â€“", " ") from presidential;

# update prior with the replacing â€“ with 
update presidential
set prior = replace(prior,"â€“", "-");

select* from presidential;
#replace demorcatic with democratic
select replace(party, 'Demorcatic', 'Democratic') from presidential;
update presidential
set party = replace(party, 'Demorcatic', 'Democratic');


# replace republiccans with republican
select replace(party, 'Republicans', 'Republican') from presidential;
update presidential
set party = replace(party, 'Republicans', 'Republicans');

#eplace  'Whig   April 4, 1841  â€“  September 13, 1841' with whig
update presidential
set party = replace (party, 'Whig   April 4, 1841  â€“  September 13, 1841', 'whig');


# Trim vice
update presidential
set vice = trim(vice);

select* from presidential;

select distinct `date created` from presidential;

# str to date (convert a string to date)
select str_to_date("3/4/2012", "%m/%d/%Y") sql_date;

# convert 'saturday, Febuary 1, 2020' into sql date
select str_to_date ("Saturday, February 1, 2020", "%W, %M  %e, %Y");

select
case
	when `date created` like "%/%" then str_to_date(`date created`, "%m/%d/%Y")
    when `date created` like "%,%" then str_to_date(`date created`, "%W, %M %e,%Y")
    end date_created
    from presidential;


select * from presidential;


update presidential
set `date updated` =
case
	when `date updated` like "%/%" then str_to_date(`date updated`, "%m/%d/%Y")
    when `date updated` like "%,%" then str_to_date(`date updated`, "%W, %M %e,%Y")
    end;


update presidential
set `date created` =
case
	when `date created` like "%/%" then str_to_date(`date created`, "%m/%d/%Y")
    when `date created` like "%,%" then str_to_date(`date created`, "%W, %M %e,%Y")
    end;
--     
-- # drop S.No column
-- alter table presidential
-- drop column `S.No.`;

select* from presidential;


select*from presidential
 where
president is null
or prior is null
or vice is null
or salary is null
or `date updated` is null
or party is null
or `date created`is null; 

# extract month from date
select month(`date updated`) from presidential;

#

