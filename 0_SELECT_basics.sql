-- 1 Query to show the population of 'Germany'
SELECT population FROM world
  WHERE name = 'Germany'

-- 2 Query to show the name and population for 'Sweden', 'Norway' and 'Denmark'
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3 Query to show name and area between 200,000 and 250,000 sq km.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000