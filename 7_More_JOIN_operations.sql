-- 1 Query to show the films where the yr is 1962 [Show id, title].
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2 Query to show year of 'Citizen Kane'.
SELECT yr 
  FROM movie
 WHERE title = 'Citizen Kane'

-- 3 Query to show all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr

-- 4 Query to show the id number of the actor 'Glenn Close'.
SELECT id
  FROM actor
 WHERE name = 'Glenn Close'

-- 5 Query to show the id of the film 'Casablanca'.
SELECT id
  FROM movie
 WHERE title = 'Casablanca'

-- 6 Query to obtain the cast list for 'Casablanca'
SELECT name
  FROM actor JOIN casting ON actor.id = casting.actorid
 WHERE movieid = (SELECT id FROM movie WHERE title = 'Casablanca')

-- 7 Query to obtain the cast list for the film 'Alien'.
SELECT name
  FROM actor JOIN casting ON actor.id = casting.actorid
 WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien')

-- 8 Query to list the films in which 'Harrison Ford' has appeared.
SELECT title
  FROM movie JOIN casting ON movie.id = casting.movieid
  JOIN actor ON actorid = actor.id
 WHERE name = 'Harrison Ford'

-- 9 Query to list the films where 'Harrison Ford' has appeared - but not in the starring role. 
SELECT title
  FROM movie JOIN casting ON movie.id = casting.movieid
  JOIN actor ON actorid = actor.id
 WHERE name = 'Harrison Ford' AND ord > 1

-- 10 Query to list the films together with the leading star for all 1962 films.
SELECT title, name
  FROM movie JOIN casting ON movie.id = casting.movieid
  JOIN actor ON actorid = actor.id
 WHERE ord = 1 AND yr = 1962

-- 11 Query to show the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies. 
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12 Query to list the film title and the leading actor for all of the films 'Julie Andrews' played in. 
SELECT title, name 
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
 WHERE ord = 1 AND movieid = ANY(
 SELECT movieid FROM casting
  WHERE actorid IN (
  SELECT actor.id FROM actor
  WHERE name='Julie Andrews'));

-- 13 Query to obtain a list, in alphabetical order, of actors who've had at least 30 starring roles. 
SELECT name
  FROM actor JOIN casting ON id = actorid
 WHERE ord = 1
 GROUP BY name
 HAVING count(*) >= 30
 ORDER BY name

-- 14 Query to list the films released in the year 1978 ordered by the number of actors in the cast, then by title. 
SELECT title, COUNT(actorid) AS actor_amount
  FROM movie JOIN casting ON id = movieid
 WHERE yr = 1978
 GROUP BY title
 ORDER BY actor_amount DESC, title

-- 15 Query to list all the people who have worked with 'Art Garfunkel'.
SELECT name
  FROM movie JOIN casting ON movie.id=movieid
  JOIN actor   ON actorid=actor.id
 WHERE name != 'Art Garfunkel' AND movieid = 
 ANY(SELECT movieid
   FROM movie JOIN casting ON movie.id = casting.movieid
   JOIN actor ON actorid = actor.id
 WHERE name = 'Art Garfunkel')

