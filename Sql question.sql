use `parks_and_recreation`;



# Fetch movie released in usa with rating PG or PG-13
select * from 2016_movies 
where country= 'usa' and rating like "%PG%";


# Fetch how many movies where produced in each country
select country,count(*)from 2016_movies
group by country;

# Fetch movies had a budget greater than $5000000 but grossed less than $2,000,000
select*from 2016_movies 
where budget> 5000000 and `Gross Revenue`<2000000;

# Fetch Average IMDB Score for each genre
select genre, avg(`IMDb Score (1-10)`)
from 2016_movies
group by genre
order by 2 desc;

# Fetch List of  movies in English with an IMDb score above 7.0
select 'tittle' from 2016_movies
where Language = "english"and `IMDb Score (1-10)`> 7.0;

# Fetch the total gross revenue by movie rating (G, PG, R, etc.)?
select Rating, sum( `Gross revenue`) from 2016_movies
group by Rating;

# Fetch  movies that are in black and white and belong to the drama genre
select 'tittle' from 2016_movies
where 'colour/B&W'= 'b&w' and genre = 'drama';


# Fetch  the average duration of movies by language?

select language, avg (`Duration (min)`) from 2016_movies
group by Language
order by 2 desc;

# Fetch  all movies directed by someone with fewer than 10 Facebook likes.
select * from 2016_movies
where `Director FB Likes` <10;

# Average budget per director
select 'director name', Avg(budget)
from 2016_movies
group by `Director name`;



# update is used to modify existing records
select* from employee_demographics;

update employee_demographics
set first_name = 'judith', age ='20'
where employee_id =4;