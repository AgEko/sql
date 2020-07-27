USE tc1_john_kol;
-- recreate db
DROP TABLE hobbies;
DROP TABLE `ta-dylan`;
DROP TABLE tc1_john_kol.tekcampers;
CREATE TABLE tekcampers
SELECT * FROM students.tekcampers;

-- Clean table
DELETE FROM tekcampers WHERE id IN (9, 20, 26);

-- add gender 
UPDATE tekcampers set gender='F' 
WHERE id IN (1, 3, 4, 5, 10, 11, 13, 17, 27);
UPDATE tekcampers set gender='M' 
WHERE gender IS NULL;

-- add missing sudents
INSERT INTO tekcampers (first_name, last_name, gender, education)
VALUES 
('Aaron', 'White','M', 'UG'),
('Cody', 'Clark', 'M','UG'),
('Devon', 'Brewster', 'M','UG'),
('Gotham', 'Katta', 'M','BA'),
('John', 'Bozarov', 'M','BA'),
('John', 'KOL', 'M','UG'),
('Kevin', 'Keesee', 'M','UG'),
('Tyler', 'Clements', 'M','BA'),
('Vimala', 'Murphy', 'F','MA'),
('Justin', 'Cheng', 'M','UG'),
('Monica', 'Howard', 'F','UG');

-- Fix education for tekcampers x.x
UPDATE tekcampers SET education = 'UG'
WHERE id IN (7, 12, 14, 15, 19, 22, 23, 24, 25);

UPDATE tekcampers SET education = 'AA'
WHERE id IN (8, 17);

UPDATE tekcampers SET education = 'BA'
WHERE id IN (1, 4, 5, 6, 11, 16, 18, 27);


UPDATE tekcampers SET education = 'MA'
WHERE id IN (3, 13, 21);

UPDATE tekcampers SET education = 'PhD'
WHERE id = 10;

UPDATE tekcampers SET education = 'Squid'
WHERE id = 2;


-- Queries

-- SELECT * FROM tekcampers WHERE CHAR_LENGTH(last_name) > 7 ;
-- SELECT * FROM tekcampers ORDER BY first_name;
-- SELECT * FROM tekcampers ORDER BY last_name;
-- SELECT * FROM tekcampers WHERE gender = 'M';
-- SELECT * FROM tekcampers WHERE gender = 'F';
-- SELECT * FROM tekcampers WHERE education = 'MA';
-- SELECT * FROM tekcampers WHERE education = 'BA';
-- SELECT * FROM tekcampers WHERE education = 'AA';
-- SELECT * FROM tekcampers WHERE education = 'UG';


-- TA group
CREATE TABLE `ta-dylan`
SELECT * FROM tekcampers 
WHERE last_name IN ( 'Torres', 'Kim', 'Ulysse', 'Ibanez', 'Castiglione', 'Muppuru', 'Golden', 'Sieffert', 'Betts', 'Murthy', 'Radhakrishnan','KOL');
select * from `ta-dylan`;

-- Fixing id numbers
ALTER TABLE tekcampers DROP COLUMN id;
ALTER TABLE tekcampers ADD id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER TABLE `ta-dylan` DROP COLUMN id;
ALTER TABLE `ta-dylan` ADD id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

-- Adding Hobbies
CREATE TABLE hobbies (
	tekcampers_id INT NOT NULL,
	hobby VARCHAR(20),
	FOREIGN KEY (tekcampers_id) REFERENCES tekcampers(id)
);

INSERT INTO hobbies(tekcampers_id, hobby)
VALUES
(1, 'Reading'),
(2, 'Music'),
(3, 'Kid projects'),
(4, 'Biker'),
(5, 'Writing'),
(6, 'Interior design'),
(7, 'Pumping iron'),
(8, 'Vidya Games'),
(9, 'Vidya Games'), 
(10, 'Reading'),
(11, 'ESC_EatSleepCode'),
(12, 'Reading'),
(13, 'Kid projects'),
(14, 'Biker'),
(15, 'Writing'),
(16, 'Interior design'),
(17, 'Pumping iron'),
(18, 'Vidya Games'),
(19, 'Vidya Games'),
(20, 'Reading'),
(21, 'Reading'),
(22, 'Music'),
(23, 'Kid projects'),
(24, 'Biker'),
(25, 'Writing'),
(26, 'Interior design'),
(27, 'Pumping iron'),
(28, 'Vidya Games'),
(29, 'Vidya Games'),
(30, 'Reading'),
(31, 'Reading'),
(32, 'Music'),
(33, 'Kid projects'),
(34, 'Biker'),
(35, 'Writing');


-- Aggregate for TA team
SELECT hobbies.hobby, `ta-dylan`.last_name FROM hobbies INNER JOIN `ta-dylan` ON hobbies.tekcampers_id = `ta-dylan`.id;


-- bootcamp?
ALTER TABLE tekcampers ADD Bootcamp VARCHAR(20);

UPDATE tekcampers SET bootcamp = 'Trilogy Education' WHERE id IN (26,34);
UPDATE tekcampers SET bootcamp = 'Coding Dojo' WHERE id IN (6,7,11);
UPDATE tekcampers SET bootcamp = 'DevMountain' WHERE id = 16;
UPDATE tekcampers SET bootcamp = 'SMU Coding Bootcamp' WHERE id = 19;

ALTER TABLE `ta-dylan` ADD COLUMN Bootcamp VARCHAR(20);
UPDATE `ta-dylan` t1 INNER JOIN tekcampers t2 ON t1.last_name = t2.last_name SET t1.Bootcamp = t2.Bootcamp; 


-- keep
select * from `ta-dylan`;
select * from hobbies;
select * from tc1_john_kol.tekcampers;