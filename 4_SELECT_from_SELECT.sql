-- 1 Query to list each country name where the population is larger than that of 'Russia'. 
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2 Query to show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
  FROM world
 WHERE continent = 'Europe' AND gdp/population > 
(SELECT gdp/population FROM world WHERE name = 'United Kingdom')

-- 3 Query to show the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent
  FROM world
 WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') 
 OR continent =  (SELECT continent FROM world WHERE name = 'Australia') 
 ORDER BY name

-- 4 Query to show which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population 
  FROM world
 WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
 AND population < (SELECT population FROM world WHERE name = 'Poland')

-- 5 Query to show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name, CONCAT(ROUND(100 * population/(SELECT population FROM world WHERE name = 'Germany'), 0), '%')
  FROM world
 WHERE continent = 'Europe'

-- 6 Query to show countries with a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values) 
SELECT name 
  FROM world
 WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0)

-- 7 Query to show the largest country (by area) in each continent, show the continent, the name and the area
 SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

-- 8 Query to show each continent and the name of the country that comes first alphabetically.
SELECT continent, name
  FROM world as x
 WHERE name <= 
  ALL(SELECT name FROM world as y
  WHERE x.continent = y.continent)

-- 9 Query to show the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population. 
SELECT name, continent, population
  FROM world as x
 WHERE 25000000 > ALL(SELECT population FROM world as y WHERE x.continent = y.continent AND population > 0)

-- 10 Query to show countries that have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent
  FROM world as x
 WHERE population > ALL(SELECT population * 3 FROM world as y WHERE x.continent = y.continent AND  y.name != x.name)


