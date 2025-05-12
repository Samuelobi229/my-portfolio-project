USE `parks_and_recreation` ;
SELECT * FROM walmartsales;

# check distinct values of each column
SELECT DISTINCT `Invoice ID` FROM walmart;
SELECT DISTINCT Branch FROM walmart; 
SELECT DISTINCT City FROM walmart; 
SELECT DISTINCT `Customer type` FROM walmart; 
SELECT DISTINCT Gender FROM walmart; 
SELECT DISTINCT `Product line` FROM walmart; #To remove casing problems and trim if there is any
SELECT DISTINCT `Unit price` FROM walmart; 
SELECT DISTINCT Quantity FROM walmart ; 
SELECT DISTINCT `Tax 5%` FROM walmart; 
SELECT DISTINCT Total FROM walmart;
SELECT DISTINCT `Date` FROM walmart; #format date to sql format
SELECT DISTINCT `Time` FROM walmart; 
SELECT DISTINCT Payment FROM walmart; #proper
SELECT DISTINCT cogs FROM walmart; 
SELECT DISTINCT `gross margin percentage` FROM walmart;
SELECT DISTINCT `gross income` FROM walmart; 
SELECT DISTINCT rating FROM walmart;

CREATE TABLE walmart SELECT * FROM walmartsales;

SELECT * FROM walmart;


SELECT trim(concat(upper(LEFT(`product line`, 1)), lower(substring(`product line`,2)))) FROM walmart ;

UPDATE walmart
SET `product line` = trim(concat(upper(LEFT(`product line`, 1)), lower(substring(`product line`,2))));

SELECT * FROM walmart;

SELECT CONCAT (
UPPER (LEFT(SUBSTRING_INDEX(`product line`,' ', 1), 1)), 
LOWER (SUBSTRING(SUBSTRING_INDEX(`product line`,' ', 1), 2)),
' and ',
UPPER (LEFT (SUBSTRING_INDEX(`product line`,' ', -1), 1)), 
LOWER (SUBSTRING(SUBSTRING_INDEX(`product line`,' ', -1), 2)))AS proper 
FROM walmart;

UPDATE walmart	
SET `product line` = CONCAT (
UPPER (LEFT(SUBSTRING_INDEX(`product line`,' ', 1), 1)), 
LOWER (SUBSTRING(SUBSTRING_INDEX(`product line`,' ', 1), 2)),
' and ',
UPPER (LEFT (SUBSTRING_INDEX(`product line`,' ', -1), 1)), 
LOWER (SUBSTRING(SUBSTRING_INDEX(`product line`,' ', -1), 2)));

SELECT * FROM walmart;

SELECT REPLACE(`product line`, "ion and","ion")FROM walmart;

UPDATE walmart
SET `product line` = REPLACE(`product line`, "ion and","ion");

SELECT * FROM walmart;

SELECT REPLACE(`product line`, "ic and","ic")FROM walmart;


SELECT REPLACE(payment, " c", " C") FROM walmart;

UPDATE walmart
SET payment=REPLACE(payment, " c", " C");

UPDATE walmart 
SET payment= REPLACE(`product line`, "Electronic and","Electronic");

SELECT REPLACE(payment, "Ew", "E-w") FROM walmart;

UPDATE walmart
SET payment=REPLACE(payment, "E-w", "E-W");



SELECT * FROM walmart;


 SELECT STR_TO_DATE(`Date`, '%m/%d/%Y') AS 'Dater' FROM walmart;


UPDATE walmart
SET `date` = str_to_date(`date`, "%m/%d/%Y") ;

SELECT * FROM walmart;

#• What is the most selling product line?
SELECT  `Product line`,sum(quantity)`sum of quantity` 
FROM walmart GROUP BY `Product line`
ORDER BY `sum of quantity` DESC LIMIT 1;  #----------------------------------------------------------------Question 1
#Conclusion:The most popular selling product line is Sports and Travel

SELECT month(`date`)`Month` FROM walmart;

ALTER TABLE walmart
ADD COLUMN `Month`  Varchar(20);#-----------------------------------------------------------------------Adding a column month


UPDATE walmart
SET `month`=  month(`date`);#----------------------------------------------------------------------updating the column with the month formular

select month,
case	
	when `month` = 1 then 'January'	
	when `month`=2 then 'February'
	when `month`=3 then 'March'
    when `month`=4 then 'April'
    when `month`=5 then 'May'
    when `month`=6 then 'June'
    when `month`=7 then 'July'
    when `month`=8 then 'August'
    when `month`=9 then 'September'
    when `month`=10 then 'October'
    when `month`=11 then 'November'
    when `month`=12 then 'December'
	end `month of the year`
    from walmart;

update walmart
set month=
case	
	when `month`=1 then 'January'	
	when `month`=2 then 'February'
	when `month`=3 then 'March'
    when `month`=4 then 'April'
    when `month`=5 then 'May'
    when `month`=6 then 'June'
    when `month`=7 then 'July'
    when `month`=8 then 'August'
    when `month`=9 then 'September'
    when `month`=10 then 'October'
    when `month`=11 then 'November'
    when `month`=12 then 'December'
	end ;
select*from walmart;

ALTER TABLE walmart
ADD COLUMN `Gross Profit`  INT(2);#-----------------------------------------------------------------------Adding a column Gross Profit


ALTER TABLE walmart
ADD COLUMN `Gross Revenue` VARCHAR(6);#-----------------------------------------------------------------------Adding a column Gross Revenue

SELECT* FROM walmart;

#• What month had the largest COGS?
SELECT  `month`,sum(cogs) `sum cog` 
FROM walmart GROUP BY month
ORDER BY `sum cog` DESC LIMIT 1; #-----------------------question 2 
#Conclusion: february had the largest Cost Of goods sold
 
SELECT  (`unit price`*quantity) FROM walmart; 
 UPDATE walmart
 SET `gross revenue`=(`unit price`*quantity);#-----------------------------------------------inputting deta INTo gross revenue

select(`gross revenue`-cogs) from walmart;

 update walmart
 set `gross profit`=(`gross revenue`-cogs);
# • What is the city with the largest revenue?---------------------------------------------------------Question 3 question
 SELECT city, sum(`gross revenue`)`total GR`
 FROM walmart GROUP BY city 
 ORDER BY `total GR` DESC LIMIT 1 ;
 #Conclusion:Naypyitaw is the city with the largest revenue
 
SELECT * FROM walmart;

#• What is the most common product line by gender?------------------------------------------------------ question 4 
with `alias of inside table` as (
    SELECT 
        gender,
        `product line`,
        COUNT(*) `number of sales`,
        ROW_NUMBER() OVER(PARTITION BY gender ORDER BY COUNT(*) DESC)  `Row number`
    FROM walmart
  GROUP BY gender, `product line`
)
SELECT gender, `product line`, `number of sales`
FROM `alias of inside table`
where `row number` = 1;
#Conclusion: The most common product by male is Sports and Travel same for female 


#• Which of the customer types brings the most revenue? ---------------------------------------------------------------question 5 answer
SELECT `customer type`, sum(`gross revenue`) `sum of revenue`
FROM walmart  GROUP BY `customer type` 
ORDER BY `sum of revenue` desc
LIMIT 1;
#conclusion: The Customer Type that brings the most revenue is Member
