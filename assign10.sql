--USE Z1966108;

-- create supplier table
CREATE TABLE IF NOT EXISTS S (
    S CHAR(2) PRIMARY KEY,
    SNAME VARCHAR(30) NOT NULL,
    STATUS INT NOT NULL,
    CITY VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS P(
    P CHAR(2) PRIMARY KEY,
    PNAME VARCHAR(30) NOT NULL,
    COLOR VARCHAR(15) NOT NULL,
    WEIGHT DOUBLE NOT NULL
);

CREATE TABLE IF NOT EXISTS SP(
    S CHAR(2) ,
    P CHAR(2),
    QTY INT NOT NULL,
    FOREIGN KEY(S) REFERENCES S(S),
    FOREIGN KEY(P) REFERENCES P(P),
    PRIMARY KEY (S,P)
);

INSERT INTO S(S, SNAME, STATUS, CITY) VALUES
('S1', 'Smith', 20, 'London'),
('S2', 'Jones', 10, 'Paris'),
('S3', 'Blake', 30, 'Paris'),
('S4', 'Clark', 20, 'London'),
('S5', 'Adams', 30, 'Athen');

INSERT INTO P(P, PNAME, COLOR, WEIGHT) VALUES
('P1', 'Nut', 'Red', 12),
('P2', 'Bolt', 'Green', 17),
('P3', 'Screw', 'Blue', 17),
('P4', 'Screw', 'Red', 14),
('P5', 'Cam', 'Blue', 12),
('P6', 'Cog', 'Red', 19);

INSERT INTO SP(S, P, QTY) VALUES
('S1', 'P1', 300),
('S1', 'P2', 200),
('S1', 'P3', 400),
('S1', 'P4', 200),
('S1', 'P5', 100),
('S1', 'P6', 100),
('S2', 'P1', 300),
('S2', 'P2', 400),
('S3', 'P2', 200),
('S4', 'P2', 200),
('S4', 'P4', 300),
('S4', 'P5', 400);

-- DESCRIBE SUPPLIER;
SELECT * FROM S;
-- DESCRIBE PART;
SELECT * FROM P;
-- DESCRIBE SP;
SELECT * FROM SP;

-- SELECT S, STATUS
--   FROM SUPPLIER
--   WHERE CITY = 'Paris';

-- SELECT P FROM SP;

-- SELECT DISTINCT P
--   FROM SP;