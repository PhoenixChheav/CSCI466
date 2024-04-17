-- 1. remove all of the tables that will be created below
DROP TABLE Visit, Dog;

-- 2. create a table called Dog
CREATE TABLE Dog (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    BREED VARCHAR(63) NOT NULL,
    NAME VARCHAR(20),
    WEIGHT DOUBLE NOT NULL
);

-- 3. put six rows into Dog table with example data
INSERT INTO Dog (BREED, NAME, WEIGHT) VALUES
('Chow Chow', 'Chou Chou', 30.4),
('Golden Retriever', 'Charlie', 40.5),
('Huskie', 'Bear', 40),
('Poodle', 'PoPo', 40.5),
('German Shepherd', 'Tony', 45),
('Bulldog', 'Giant', 20.3);

-- 4. run the command DESCRIBE Dog
DESCRIBE Dog;

-- 5. run the command SELECT * FROM Dog
SELECT * FROM Dog;

-- 6. create a table called Visit
CREATE TABLE Visit (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DOG_ID INT,
    VISIT_DATE DATE,
    DURATION TIME,
    FOREIGN KEY (DOG_ID) REFERENCES Dog(ID) 
);

-- 7. put ten rows into the Visit table
INSERT INTO Visit (DOG_ID, VISIT_DATE, DURATION) 
VALUES 
(1, '2021-03-14', '2:50:00'),
(2, '2021-03-25', '4:00:00'),
(3, '2021-06-18', '4:00:00'),
(4, '2023-04-14', '1:50:00'),
(6, '2022-03-10', '1:50:00'),
(2, '2021-03-14', '2:50:00'),
(6, '2021-08-20', '4:00:00'),
(4, '2022-07-14', '1:50:00'),
(1, '2021-03-19', '4:00:00'),
(3, '2022-05-14', '2:50:00');

-- 8. run command DESCRIBE
DESCRIBE Visit;

-- 9. run the command select
SELECT * FROM Visit;

-- 10 ADD COLUMN VETERINARIAN BILLING
ALTER TABLE Visit ADD VETERINARIAN_BILLING DECIMAL(10,2);

-- 11. UPDATE
UPDATE Visit
  SET VETERINARIAN_BILLING = 20.00
    WHERE DURATION= '1:50:00';
UPDATE Visit
  SET VETERINARIAN_BILLING = 30.00
    WHERE DURATION= '2:50:00';
UPDATE Visit
  SET VETERINARIAN_BILLING = 50.50
    WHERE DURATION= '4:00:00';


-- 12. run the command SELECT
SELECT * FROM Visit;