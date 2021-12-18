-- Creating a database based on real-life statistics for a group of football players
CREATE DATABASE player_statistics;

-- Need to ensure we use the correct database
USE player_statistics;

-- Creating the first table which has 6 fields
CREATE TABLE players(
PlayerID INT PRIMARY KEY,
FirstName VARCHAR (100) NOT NULL,
SecondName VARCHAR (100) NOT NULL,
Club VARCHAR (100) NOT NULL,
Country VARCHAR (100) NOT NULL,
PlayerPosition VARCHAR (100) NOT NULL
);
EXPLAIN players;

-- MODIFYING A FIELD:
-- I want to modify the second name field because some players do not have a second name so this can be null
ALTER TABLE players
MODIFY SecondName VARCHAR (100);
EXPLAIN players;

-- Entering records for the players (10 records)
INSERT INTO players (PlayerID, FirstName, SecondName, Club, Country, PlayerPosition)
VALUES
(1, "Lionel", "Messi", "Paris Saint Germain", "Argentina", "Forward"),
(2, "Cristiano", "Ronaldo", "Manchester United", "Portugal", "Forward"),
(3, "Robert", "Lewandowski", "Bayern Munich", "Poland", "Forward"),
(4, "Romelu", "Lukaku", "Chelsea", "Belgium", "Forward"),
(5, "Karim", "Benzema", "Real Madrid", "France", "Forward"),
(6, "Kevin", "De Bruyne", "Manchester City", "Belgium", "Midfielder"),
(7, "Luka", "Modric", "Real Madrid", "Croatia", "Midfielder"),
(8, "N'Golo", "Kante", "Chelsea", "France", "Midfielder"),
(9, "Thiago", "Silva", "Chelsea", "Brazil", "Defender"),
(10, "Leonardo", "Bonucci", "Juventus", "Italy", "Midfielder"),
(11, "Kylian", "Mbappe", "Paris Saint Germain", "France", "Forward")
;
-- VIEWING THE RECORDS:
SELECT * FROM players;

-- UPDATING A RECORD:
UPDATE players
SET PlayerPosition = "Defender"
WHERE PlayerID = 10;
SELECT * FROM players;

-- DELETING A RECORD:
DELETE FROM players
where PlayerID = 11;
SELECT * FROM players;

-- RUNNING A SIMPLE QUERY (One Field/Column):
-- Performing a simple query to establish which players play for Chelsea
SELECT FirstName from players
WHERE Club = "Chelsea";

-- RUNNING A COMPLEX QUERY (More than one field/column): 
SELECT PlayerId, FirstName from players
ORDER BY PlayerID, FirstName;

-- Creating the second table which contains statistics for each player
-- As the first table is based more on fields that are storing characters, this second table is storing mainly numerical data
CREATE TABLE statistics(
EntryNumber INT NOT NULL PRIMARY KEY,
PlayerID INT NOT NULL,
MatchesPlayed INT NOT NULL,
MinutesPlayed INT NOT NULL,
MinutesPerGame INT NOT NULL,
Goals INT NOT NULL,
Assists INT NOT NULL,
Tackles INT NOT NULL,
CleanSheets INT NOT NULL
);
EXPLAIN statistics;

-- ADDING IN A FIELD:
-- An important statistic is to include how many shots each player has blocked in their career
ALTER TABLE statistics
ADD Blocks INT NOT NULL;
EXPLAIN statistics;

-- DELETING A FIELD:
-- In order to compare the players, clean sheets can sometimes be misleading so we can delete this field
ALTER TABLE statistics
DROP CleanSheets;
EXPLAIN statistics;

-- MODIFYING A FIELD:
-- The minutes per game needs to be a decimal instead of an integer because it is an average
ALTER TABLE statistics
MODIFY MinutesPerGame DECIMAL (4,2) NOT NULL;
EXPLAIN statistics;

INSERT INTO statistics (PlayerID, EntryNumber, MatchesPlayed, MinutesPlayed, MinutesPerGame, Goals, Assists, Tackles, Blocks)
VALUES
(1, 34445, 729, 59948, 82.23, 633, 256, 91, 63),
(2, 34446, 827, 67534, 81.66, 637, 184, 46, 68),
(3, 34447, 582, 47620, 81.82, 446, 95, 83, 78),
(4, 34448, 505, 38043, 75.33, 251, 74, 50, 84),
(5, 34449, 670, 47063, 70.24, 334, 141, 77, 81),
(6, 34450, 486, 36895, 75.92, 117, 168, 202, 147),
(7, 34451, 430, 33517, 77.95, 46, 70, 148, 99),
(8, 34452, 346, 27711, 80.09, 18, 21, 408, 276),
(9, 34453, 467, 39811, 85.25, 25, 8, 148, 206),
(10, 34454, 588, 50185, 85.35, 40, 10, 132, 258)
;
SELECT * FROM statistics;

-- VIEWING BOTH TABLES TO CHECK SETUP:
SELECT * FROM players;
SELECT * FROM statistics;

-- UPDATING A RECORD:
-- Need to update the assists for one of the players
UPDATE statistics
SET Assists = 89
WHERE EntryNumber = 34447;
SELECT * FROM statistics;

-- JOINING THE TWO TABLES TOGETHER:
SELECT players.PlayerID , statistics.EntryNumber
FROM players
INNER JOIN statistics
ON players.PlayerID = statistics.PlayerID;

-- RUNNING A COMPLEX QUERY TO SHOW THE RELATION BETWEEN THE TWO TABLES:
-- Performing a search to see which player has scored 633 goals
SELECT *
FROM players
INNER JOIN statistics
WHERE players.PlayerID = statistics.PlayerID and statistics.Goals = 633;

-- RETRIEVING DATA SORTED IN ASCENDING ORDER ON AN APPROPRIATE FIELD (ONE TABLE):
SELECT * FROM players
ORDER BY FirstName ASC;

-- FILTERING DATA USING COMPARISON OPERATORS ON ONE TABLE:
-- Performing a search explore which players have played in a certain range of games
SELECT * FROM statistics
WHERE MatchesPlayed between 450 and 600;