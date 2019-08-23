-- 1 Query to show the teachers who have NULL for their department.
SELECT name
  FROM teacher
 WHERE dept IS NULL

-- 2 Query to show the teachers with a department. 
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3 Query using a different JOIN so that all teachers are listed. 
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- 4 Query using a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

-- 5 Query using COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile
  FROM teacher

--6 Query using the COALESCE function and a LEFT JOIN to print the teacher name and department name.
SELECT teacher.name, COALESCE(dept.name, 'None') AS dept
  FROM teacher LEFT JOIN dept ON teacher.dept = dept.id

-- 7 Query using COUNT to show the number of teachers and the number of mobile phones.
SELECT COUNT(*), COUNT(mobile)
  FROM teacher

-- 8 Query using COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed. 
SELECT dept.name, COUNT(teacher.name)
  FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id
 GROUP BY dept.name

-- 9 Query using CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise. 
SELECT teacher.name, CASE WHEN dept IN (1, 2)
                          THEN 'Sci'
                          ELSE 'Art' 
                          END
  FROM teacher

-- 10 Query using CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT teacher.name, CASE WHEN dept IN (1, 2)
                          THEN 'Sci'
                          WHEN dept = 3
                          THEN 'Art'
                          ELSE 'None' 
                          END
  FROM teacher