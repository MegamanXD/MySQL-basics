# Join 2 tables
SELECT scores.student_id, tests.date, scores.score, tests.maxscore
FROM tests, scores
WHERE date = '2014-08-25'
AND tests.test_id = scores.test_id;

# Join 3 tables
SELECT CONCAT(students.first_name, " ", students.last_name) AS Name,
tests.date, scores.score, tests.maxscore
FROM tests, scores, students
WHERE date = '2014-08-25'
AND tests.test_id = scores.test_id
AND scores.student_id = students.student_id;

# Left join
# Display all info from 1 table, even if the other table doesn’t have a match)
SELECT students.student_id,
CONCAT(students.first_name, " ", students.last_name) AS Name,
COUNT(absences.date) AS Absences
FROM students LEFT JOIN absences
ON students.student_id = absences.student_id
GROUP BY students.student_id;

# Inner join
# Pull all data from both tables and display them
SELECT students.first_name, students.last_name, scores.test_id, scores.score
FROM students INNER JOIN scores
ON students.student_id=scores.student_id
WHERE scores.score <= 15
ORDER BY scores.test_id;

