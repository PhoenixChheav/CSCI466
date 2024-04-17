--1. Select database
USE BabyName;

--2. List all of the tables that are present in the database
SHOW TABLES;

--3. Show all names from your birth year. Each name must be shown only once
SELECT DISTINCT name
  FROM BabyName
  WHERE year = 2002;

--4. Show all of the columns and their types for each table in the database
SHOW COLUMNS FROM BabyName;

--5. List how many unique names there are in each place
SELECT place, COUNT(DISTINCT name) AS UniqueNameCount
  FROM BabyName
  GROUP BY place;

--6. Show all of the years (once only) where your first name appears. Some people's names may not be present in the database.
--  If your name is one of those, then use 'Chad' if you are male, or 'Staey' if you are female.
-- If you don't feel you fit into one of those, feel free to use 'Pat'.
SELECT DISTINCT year
  FROM BabyName
  WHERE name = 'Phoenix';

--7. Display the most popular male and female names from the year 1984.
SELECT name, COUNT, gender, year
FROM(
  SELECT name, COUNT, gender, year
    FROM BabyName 
    WHERE year = 1984 AND gender = 'M'
    GROUP BY name, gender ORDER BY COUNT DESC LIMIT 1
) AS NameM
UNION 
  SELECT name, COUNT, gender, year
FROM
(SELECT name, COUNT, gender, year
    FROM BabyName 
    WHERE year = 1984 AND gender = 'F'
    GROUP BY name, gender ORDER BY COUNT DESC LIMIT 1
) AS NameF;
--8. Show all the information available about names similar to your name (or the one you adopted from above),
-- sorted in alphabetical order by name, then within that, by count, and finally, by the year.
SELECT * FROM BabyName
  WHERE name LIKE 'Phoenix' ORDER BY name, count, year;
--9. Show how many unique names there were in the year 1947
SELECT DISTINCT name AS UniqueyearCount
  FROM BabyName  
  WHERE year = 1947;

--10. Show the number of rows that exist in the table
SELECT COUNT(*) AS CountRows 
  FROM BabyName;

--11. Show how many names are in the tables for each sex from the year 1971.
SELECT gender, COUNT(*) AS nameCount 
  FROM BabyName
  WHERE year = 1971
  GROUP BY gender;

--12. Show a table with a column called "First Letter that contains on row for each letter a name starts with,
-- and another column names "Frequency" that contains how many unique names begin with each of those letter.
SELECT LEFT(name, 1) AS FirstLetter, COUNT(DISTINCT name) AS Frequency 
  FROM BabyName
  GROUP BY FirstLetter;
