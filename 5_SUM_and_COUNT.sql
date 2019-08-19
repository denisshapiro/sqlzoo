-- 1 Query to show the total population of the world. 
SELECT SUM(population)
  FROM world

-- 2 Query to list all the continents - just once each.
SELECT DISTINCT continent 
  FROM world

-- 3 Query to give the total GDP of Africa.
SELECT SUM(gdp)
  FROM world
 WHERE continent = 'Africa'

-- 4 Query to find how many countries have an area of at least 1000000 
SELECT count(name)
  FROM world
 WHERE area >= 1000000

-- 5 Query to find the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population)
  FROM world
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- 6 Query to show the continent and number of countries for each continent.
SELECT continent, COUNT(name)
  FROM world
 GROUP BY continent

-- 7 Query to show the continent and number of countries with populations of at least 10 million for each continent. 
SELECT continent, COUNT(name)
  FROM world
 WHERE population > 10000000
 GROUP BY continent

-- 8 Query to show the continents that have a total population of at least 100 million.
SELECT continent
  FROM world
 GROUP BY continent
 HAVING sum(population) >= 100000000