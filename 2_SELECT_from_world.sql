-- 1 Query to show the name, continent and population of all countries.
SELECT name, continent, population FROM world;

-- 2 Query to show the name for the countries that have a population of at least 200 million.
SELECT name FROM world
WHERE population > 200000000;

-- 3 Query to show name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population as 'Per Capita GDP'
  FROM world
 WHERE population > 200000000;

-- 4 Query to show  the name and population in millions for the countries of the continent 'South America'.
 SELECT name, population/1000000 AS 'Pop. in Millions'
  FROM world
 WHERE continent = 'South America';

-- 5 Query to show the name and population for France, Germany, Italy.
 SELECT name, population
  FROM world
 WHERE name IN ('France', 'Germany', 'Italy');

-- 6 Query to show the countries which have a name that includes the word 'United'.
 SELECT name 
  FROM world
 WHERE name LIKE '%United%';

-- 7 Query to show the countries that are big by area or big by population. Show name, population and area.
 SELECT name, population, area
  FROM world
 WHERE area > 3000000 OR population > 250000000;

-- 8 Query to show the countries that are big by area or big by population but not both.
 SELECT name, population, area
  FROM world
 WHERE area > 3000000 XOR population > 250000000;

-- 9 Query to show population for South America in millions and GDP in billions both to 2 decimal places.
 SELECT name, ROUND(population/1000000, 2) AS Population, ROUND(gdp/1000000000, 2) AS GDP
  FROM world
 WHERE continent = 'South America';

-- 10 Query to show name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round to nearest 1000.
 SELECT name, ROUND(gdp/population, -3) as 'Per Capita GDP'
  FROM world
 WHERE gdp >= 1000000000000;

-- 11 Query to show the name and capital where the name and the capital have the same number of characters.
 SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);

-- 12 Query to show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
 SELECT name, capital
  FROM world
 WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital;

-- 13 Query to show find the country that has all the vowels and no spaces in its name.
 SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';
