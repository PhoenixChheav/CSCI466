CREATE TABLE IF NOT EXISTS KARAOKEFILE(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    VERSION VARCHAR(64),
    LYRICS VARCHAR(256),
    TRACKNUM INT,
    FOREIGN KEY(TRACKNUM) REFERENCES SONG(TRACKNUM)
);

INSERT INTO SONG (TITLE, ARTIST)
VALUES
("Dilemma", "Feature"),
("Under the Influence", "Chris Brown"),
("Umbrella", "Feature"),
("Delusional", "Chris Brown"),
("Don't Matter", "Akon"),
("Passionfruit", "Drake");

INSERT INTO CONTRIBUTOR (CONTRIBUTOR, CONTRIBUTION)
VALUES
("Nelly", "Performer"),
("Kelly Rowland", "Feature"),
("Antoine Macon", "Composer"),
("Cornell Haynes, Jr", "Composer"),
("Kenneth Gamble", "Composer"),
("Walter 'Bunny' Sigler", "Composer"),
("Bam", "Producer"),

("Chris Brown", "Performer"),
("Ayoola 'Kiddominant' Agboola", "Composer"),
("Chris Brown", "Composer"),
("David Adeleke", "Composer"),
("Tifany McKie", "Composer"),
("KDDO", "Producer"),

("Rihanna", "Performer"),
("Jay Z", "Feature"),
("C. Stewart", "Composer"),
("Terius Nash", "Composer"),
("Shawn Carter", "Composer"),
("Thaddis Laphonia Harrell", "Composer"),
("C. Stewart", "Producer"),
("Kuk Harrell", "Producer"),

("Chris Brown", "Performer"),
("Chris Brown", "Composer"),
("Dana Victoria Portalatin", "Composer"),
("Jamal Rashid", "Composer"),
("Mariah Martinez", "Composer"),
("Matthew Garcia", "Composer"),
("Domenico Randazzo", "Composer"),
("Giovani Borges-Figeuroa", "Composer"),
("Patrizio Pigliapoco", "Composer"),
("Paul Bennett", "Composer"),
("Roberto Diaz", "Composer"),
("Vassal Benford", "Composer"),
("YX", "Producer"),
("Mally Mall", "Producer"),


("Akon", "Performer"),
("Akon", "Composer"),
("Akon", "Producer"),

("Drake", "Performer"),
("Drake", "Composer"),
("Nana Rogues", "Composer"),
("Nana Rogues", "Producer")
;

INSERT INTO KARAOKEFILE (TRACKNUM, VERSION)
VALUES 
(1, "Original"),
(2, "Original"),
(3, "Original"),
(4, "Original"),
(5, "Original"),
(6, "Original"),

(7, "Official Music Video"),
(7, "Lyrics"),
(7, "Slowed"),

(8, "Official Video"),
(8, "Lyrics"),
(8, "Audio"),

(9, "Lyrics"),
(9, "Official Music Video"),
(9, "Audio"),

(10, "Lyrics"),
(10, "Official Music Video"),
(10, "Official Audio"),

(11, "Lyrics"),
(11, "Official Music Video"),
(11, "Audio"),
(11, "Official Lyric Video"),

(12, "Lyrics"),
(12, "Slowed and Reverb");

INSERT INTO CONTRIBUTEDTO (TRACKNUM, CONTRIBUTIONID)
VALUES
(7, 35),
(7, 36),
(7, 37),
(7, 38),
(7, 39),
(7, 40),
(7, 41),

(8, 42),
(8, 43),
(8, 44),
(8, 45),
(8, 46),
(8, 47),

(9, 48),
(9, 49),
(9, 50),
(9, 51),
(9, 52),
(9, 53),
(9, 54),
(9, 55),

(10, 56),
(10, 57),
(10, 58),
(10, 59),
(10, 60),
(10, 61),
(10, 62),
(10, 63),
(10, 64),
(10, 65),
(10, 66),
(10, 67),
(10, 68),
(10, 69),

(11, 70),
(11, 71),
(11, 72),

(12, 73),
(12, 74),
(12, 75),
(12, 76);