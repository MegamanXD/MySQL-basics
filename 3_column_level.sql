# Create
INSERT INTO students VALUES ('Andy', 'Brennan', 'abrennan@aol.com', '281 4th St', 'Jacksonville', 'NC', 28540, '792-223-8902', "1960-12-27", 'M', NOW(), 3.50, NULL),
                           ('Harry', 'Truman', 'htruman@aol.com', '202 South St', 'Vancouver', 'WA', 98660, '792-223-9810', "1946-1-24", 'M', NOW(), 3.50, NULL),
                           ('Shelly', 'Johnson', 'sjohnson@aol.com', '9 Pond Rd', 'Sparks', 'NV', 89431, '792-223-6734', "1970-12-12", 'F', NOW(), 3.50, NULL),
                           ('Bobby', 'Briggs', 'bbriggs@aol.com', '14 12th St', 'San Diego', 'CA', 92101, '792-223-6178', "1967-5-24", 'M', NOW(), 3.50, NULL),
                           ('Donna', 'Hayward', 'dhayward@aol.com', '120 16th St', 'Davenport', 'IA', 52801, '792-223-2001', "1970-3-24", 'F', NOW(), 3.50, NULL),
                           ('Audrey', 'Horne', 'ahorne@aol.com', '342 19th St', 'Detroit', 'MI', 48222, '792-223-2001', "1965-2-1", 'F', NOW(), 3.50, NULL),
                           ('James', 'Hurley', 'jhurley@aol.com', '2578 Cliff St', 'Queens', 'NY', 11427, '792-223-1890', "1967-1-2", 'M', NOW(), 3.50, NULL),
                           ('Lucy', 'Moran', 'lmoran@aol.com', '178 Dover St', 'Hollywood', 'CA', 90078, '792-223-9678', "1954-11-27", 'F', NOW(), 3.50, NULL),
                           ('Tommy', 'Hill', 'thill@aol.com', '672 High Plains', 'Tucson', 'AZ', 85701, '792-223-1115', "1951-12-21", 'M', NOW(), 3.50, NULL),
                           ('Andy', 'Brennan', 'abrennan@aol.com', '281 4th St', 'Jacksonville', 'NC', 28540, '792-223-8902', "1960-12-27", 'M', NOW(), 3.50, NULL);
SELECT * FROM students;

INSERT INTO classes VALUES ('English', NULL),
                         ('Speech', NULL),
                         ('Literature', NULL),
                         ('Algebra', NULL),
                         ('Geometry', NULL),
                         ('Trigonometry', NULL),
                         ('Calculus', NULL),
                         ('Earth Science', NULL),
                         ('Biology', NULL),
                         ('Chemistry', NULL),
                         ('Physics', NULL),
                         ('History', NULL),
                         ('Art', NULL),
                         ('Gym', NULL);
SELECT * FROM classes;

ALTER TABLE tests ADD maxscore INT NOT NULL AFTER type;
INSERT INTO tests VALUES ('2014-8-25', 'Q', 15, 1, NULL),
                        ('2014-8-27', 'Q', 15, 1, NULL),
                        ('2014-8-29', 'T', 30, 1, NULL),
                        ('2014-8-29', 'T', 30, 2, NULL),
                        ('2014-8-27', 'Q', 15, 4, NULL),
                        ('2014-8-29', 'T', 30, 4, NULL);
SELECT * FROM tests;

INSERT INTO scores VALUES (1, 1, 15),
                         (1, 2, 14),
                         (1, 3, 28),
                         (1, 4, 29),
                         (1, 5, 15),
                         (1, 6, 27),
                         (2, 1, 15),
                         (2, 2, 14),
                         (2, 3, 26),
                         (2, 4, 28),
                         (2, 5, 14),
                         (2, 6, 26),
                         (3, 1, 14),
                         (3, 2, 14),
                         (3, 3, 26),
                         (3, 4, 26),
                         (3, 5, 13),
                         (3, 6, 26),
                         (4, 1, 15),
                         (4, 2, 14),
                         (4, 3, 27),
                         (4, 4, 27),
                         (4, 5, 15),
                         (4, 6, 27),
                         (5, 1, 14),
                         (5, 2, 13),
                         (5, 3, 26),
                         (5, 4, 27),
                         (5, 5, 13),
                         (5, 6, 27),
                         (6, 1, 13),
                         (6, 2, 13),
                         # Missed this day (6, 3, 24),
                         (6, 4, 26),
                         (6, 5, 13),
                         (6, 6, 26),
                         (7, 1, 13),
                         (7, 2, 13),
                         (7, 3, 25),
                         (7, 4, 27),
                         (7, 5, 13),
                         # Missed this day (7, 6, 27),
                         (8, 1, 14),
                         # Missed this day (8, 2, 13),
                         (8, 3, 26),
                         (8, 4, 23),
                         (8, 5, 12),
                         (8, 6, 24),
                         (9, 1, 15),
                         (9, 2, 13),
                         (9, 3, 28),
                         (9, 4, 27),
                         (9, 5, 14),
                         (9, 6, 27),
                         (10, 1, 15),
                         (10, 2, 13),
                         (10, 3, 26),
                         (10, 4, 27),
                         (10, 5, 12),
                         (10, 6, 22);
SELECT * FROM scores;

INSERT INTO absences VALUES (6, '2014-08-29'),
                           (7, '2014-08-29'),
                           (8, '2014-08-27');
SELECT * FROM absences;

# Read
    # SELECT vs SELECT DISTINCT
SELECT first_name FROM students;
SELECT DISTINCT first_name FROM students;

    # SELECT with other functions
SELECT CONCAT(first_name, " ", last_name) AS 'Name',
       CONCAT(city, ", ", state) AS 'Hometown'
FROM students;

    # SELECT with more details
SELECT first_name, last_name, state FROM students
ORDER BY state DESC, last_name ASC
LIMIT 5, 10;

    # SELECT with more details
SELECT state, COUNT(state) AS 'people' FROM students
GROUP BY state
HAVING state LIKE '%a'
ORDER BY state ASC
LIMIT 5;

# Update
    # Rename + change data type
ALTER TABLE scores
CHANGE event_id test_id INT UNSIGNED NOT NULL;

    # Add new column
ALTER TABLE absences
    ADD COLUMN test_taken CHAR(1) NOT NULL DEFAULT 'F'
    AFTER student_id;

    # Change data type only
ALTER TABLE absences
MODIFY COLUMN test_taken ENUM('T','F') NOT NULL DEFAULT 'F';

    # Change data with specific conditions
UPDATE scores
SET score=25
WHERE student_id=4 AND test_id=3;
SELECT * FROM scores;

# Delete
    # Delete specific columns
ALTER TABLE tests ADD (d VARCHAR(10),e INT);
SELECT * FROM tests;

ALTER TABLE tests DROP e, DROP d;
SELECT * FROM tests;

    # Delete specific data from a specific column
DELETE FROM absences
WHERE student_id = 6;
SELECT * FROM absences;