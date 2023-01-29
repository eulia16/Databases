CREATE DATABASE record_company;
USE record_company;

 -- How to create tables and columns

CREATE TABLE bands (
 -- Id is the primary key of the table bands
 id int NOT NULL AUTO_INCREMENT,
 name Varchar(255) NOT NULL,
  -- Always define a primary key and make it not null
 PRIMARY KEY (id)
);

CREATE TABLE albums (
id int NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
release_year int,
band_id int NOT NULL,
PRIMARY KEY (id),
 -- we must tell the foreign key what table it references and the column it references
FOREIGN KEY (band_id) REFERENCES bands(id)
);

 -- How to insert data into the database
INSERT INTO bands (name) 
VALUES ('Iron Maiden');

INSERT INTO bands (name)
VALUES ('DEUCE'), ('Avernge Sevenfoild'), ('Anchor');

 -- To query the data, use the SELECT command
 -- * command means selecting all the columns from a table
 SELECT * FROM bands;
 
 -- To put a limit on the amount of data retieved from a table, use LIMIT command
 
 SELECT * FROM bands LIMIT 2;
 
 -- to get specific columns instead of all the columns, specify the column names after SELECT statement
 
 SELECT name FROM bands;
 
 -- to change the name of a specific column to make it more readable 
 -- to 'change' the name of multiple columns, just use a comma
 -- this is commonly known as alias'
 
 SELECT id AS 'ID', name AS 'Band Name'
 FROM bands;
 
 -- To order statements(alphabetically) using select, do this
 
 SELECT * FROM bands ORDER BY name;
 
 -- To do this is DEscending order(reverse alphabetical) do this

SELECT * FROM bands ORDER BY name DESC;

INSERT INTO albums (name, release_year, band_id)
VALUES ('The Number of the beast', '1985', 1),
	   ('Power Slave','1984',1),
       ('Nightmare','2018',2),
       ('Nightmare','2010',3),
       ('Test Album', NULL, 3);

SELECT * from albums;
       
-- Get all the names from albums object
SELECT name FROM albums;

-- to get all DISTINCT values from albums, use DISTINCT command
SELECT DISTINCT name FROM albums;

-- To change values in the tables, use SET command in relation w/ Where to update in the correct places
UPDATE albums 
SET release_year = 1982
WHERE id = 1;

SELECT * FROM albums
WHERE release_year <2000;

-- % signs signify any amt of characters/integers before or after the string you are searching
/*
This is another way to comment, only this is a multiline comment,
****The WHERE command is very powerful and has many applications****
You can also use the OR command to specify a different specification on where to update
*/
-- These are different ways to use the WHERE statement and its many capabilities
SELECT * FROM albums
WHERE name LIKE '%er%';

SELECT * FROM albums
WHERE name Like '%er%' OR band_id = 2;

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 and 2018;

SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums
WHERE id = 5;

SELECT * FROM albums;

-- This is now discussing JOINS 

SELECT * FROM bands
JOIN albums ON bands.id = albums.band_id;
-- This statement is the same as an INNER JOIN
/*
There are three main types of joins in SQL, them being INNER JOIN, LEFT JOIN and RIGHT JOIN

INNER JOIN matches tables together with values that only return values that match, i.e. the statement above 
It only shows values where the id on the left(bands.id) has a correlating value and matches the value 
on the right(albums.band_id)

LEFT JOIN This will list all of the bands that don't have any albums and the ones that do, So 
Left join lists all of the values from the left side even if they dont have matching values on the
right side(in this case it would name all of the bands even if they didn't have any matching values
*/

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id;

/*
RIGHT JOIN Joins all the values from the albums even if they don't have a correlating band,
This would return all of the albums even if they did not have a band associated w/ them
*/

SELECT * FROM bands
RIGHT JOIN albums ON bands.id = albums.band_id;

-- Used to take the average of a column, must specify table name
SELECT AVG(release_year) FROM albums;

-- Can use many other aggregate functions i.e. SUM(to take sum) COUNT(it counts the # of rows counts idiot), etc.
SELECT SUM(release_year) FROM albums;






