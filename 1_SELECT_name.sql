-- 1 Query to find the country that start with 'Y'
SELECT name FROM world
  WHERE name LIKE 'Y%'

-- 2 Query to find the countries that end with 'y'
SELECT name FROM world
  WHERE name LIKE '%y'

-- 3 Query to find the countries that contain the letter 'x'
SELECT name FROM world
  WHERE name LIKE '%x%'

-- 4 Query to find the countries that end with 'land'
SELECT name FROM world
  WHERE name LIKE '%land'

-- 5 Query to find the countries that start with 'C' and end with 'ia'
SELECT name FROM world
  WHERE name LIKE 'C%ia'

-- 6 Query to find the country that has 'oo' in the name
SELECT name FROM world
  WHERE name LIKE '%oo%'

-- 7 Query to find the countries that have three or more a in the name
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

-- 8 Query to find the countries that have "t" as the second character
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

-- 9 Query to find the countries that have two "o" characters separated by two others
SELECT name FROM world
 WHERE name LIKE '%o__o%'

-- 10 Query to find the countries that have exactly four characters
SELECT name FROM world
 WHERE name LIKE '____'

-- 11 Query to find the country where the name is the capital city
SELECT name
  FROM world
 WHERE name = capital

-- 12 Query to find the country where the capital is the country plus "City"
SELECT name
  FROM world
 WHERE capital = concat(name, ' City')

-- 13 Query to find the capital and the name where the capital includes the name of the country
SELECT capital, name 
  FROM world
 WHERE capital LIKE concat('%', name, '%');

-- 14 Query to find the capital and the name where the capital is an extension of name of the country
SELECT capital, name
  FROM world
 WHERE capital LIKE concat(name, '%') AND name != capital

-- 15 Query to find the name and the extension where the capital is an extension of name of the country
SELECT name, REPLACE(capital, name, '') as Extentsion
  FROM world
 WHERE capital LIKE concat(name, '%') AND name != capital