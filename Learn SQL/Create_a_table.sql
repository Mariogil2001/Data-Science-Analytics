/*
Create a Table

In this project, you will create your own friends table and add/delete data from it!
*/
/*
Create a table named friends with three columns:

    id that stores INTEGER
    name that stores TEXT
    birthday that stores DATE

*/
CREATE TABLE friends (
   id INTEGER,
   name TEXT,
   birthday DATE
);

-- Beneath your current code, add Ororo Munroe to friends
INSERT INTO friends (id, name, birthday)
VALUES(1, 'Ororo Munroe','1940-05-30');

--Add two of your friends to the table.
INSERT INTO friends (id,name, birthday)
VALUES (2,'Pepito palotero','2000-10-04');

INSERT INTO friends (id, name, birthday)
VALUES (3, 'Rojito abuelito','1910-01-15');

--Ororo Munroe just realized that she can control the weather and decided to change her name. Her new name is “Storm”.
UPDATE friends
SET name = 'Storm'
WHERE id = 1;

--Add a new column named email.
ALTER TABLE friends
ADD COLUMN email TEXT;

--Update the email address for everyone in your table.
UPDATE friends
SET email = 'storm@codeacademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'pepito@codeacademy.com'
WHERE id = 2;

UPDATE friends
SET email = 'abu@codeacademy.com'
WHERE id = 3;

--Wait, Storm is fictional… Remove her from friends.
DELETE FROM friends
WHERE id = 1;

--Let’s take a look at the result one last time:
SELECT *  FROM friends;