DROP TABLE Clubs;
CREATE TABLE Clubs(
TID VARCHAR(10) PRIMARY KEY,
Club VARCHAR(100)
);

DROP TABLE Club_original;
CREATE TABLE Club_original(
TID VARCHAR(10) NOT NULL,
Club_original VARCHAR(100) NOT NULL
);

DROP TABLE Country_code;
CREATE TABLE Country_code(
NCode VARCHAR(10) NOT NULL,
Country VARCHAR(100) NOT NULL,
CONSTRAINT Nation_ID PRIMARY KEY(NCode, Country)
);

DROP TABLE League_games;
CREATE TABLE League_games(
LID VARCHAR(10) NOT NULL,
Season VARCHAR(10) NOT NULL,
Mdate DATE NOT NULL,
Home_T VARCHAR(100) NOT NULL,
Away_T VARCHAR(100) NOT NULL,
Home_S INTEGER,
Away_S INTEGER,
Home_ES INTEGER,
Away_ES INTEGER,
CONSTRAINT GameKey PRIMARY KEY(LID, Season, Mdate, Home_T, Away_T)
);

DROP TABLE League_list;
CREATE TABLE League_list(
LID   VARCHAR(5) PRIMARY KEY,
League_Name   VARCHAR(20),
NCode VARCHAR(10),
Year VARCHAR(4),
N_Teams VARCHAR (3),
CurChampion VARCHAR(20),
MostChampion VARCHAR(20)
);

DROP TABLE League_squad;
CREATE TABLE League_squad(
Season VARCHAR(4),
LID VARCHAR(5),
Team VARCHAR(100),
Num VARCHAR(3),
Player VARCHAR(100),
Nation VARCHAR(5),
Position VARCHAR(5),
Height VARCHAR(10),
Weight VARCHAR(10),
Date_of_Birth DATE,
CONSTRAINT squadKey PRIMARY KEY(Season, LID, Player
	,Team, Date_of_Birth, Nation)
);

DROP TABLE League_standing;
CREATE TABLE League_standing(
LID VARCHAR(5) NOT NULL,
Season VARCHAR(4) NOT NULL,
Rank VARCHAR(2),
Club VARCHAR(100) NOT NULL,
Pld INTEGER,
Win INTEGER,
Draw INTEGER,
Lost INTEGER,
GF INTEGER,
GA INTEGER,
GD INTEGER,
Points INTEGER,
CONSTRAINT standingKey PRIMARY KEY(LID, Season, Club)
);

DROP TABLE Olympic_host;
CREATE TABLE Olympic_host(
Year   VARCHAR(4) PRIMARY KEY,
City   VARCHAR(100),
NCode VARCHAR(3)
);

DROP TABLE Olympic_record;
CREATE TABLE Olympic_record(
Year   VARCHAR(4) NOT NULL,
Rank   VARCHAR(3),
Country   VARCHAR(100) NOT NULL,
NOC VARCHAR(4),
CONSTRAINT recordKey PRIMARY KEY(Year, Country)
);

DROP TABLE Olympic_squad;
CREATE TABLE Olympic_squad(
Year   VARCHAR(4) NOT NULL,
Country   VARCHAR(20) NOT NULL,
Position   VARCHAR(3),
FName VARCHAR(30) NOT NULL,
LName VARCHAR(30) NOT NULL,
Num VARCHAR(4),
Club VARCHAR(40) NOT NULL,
CONSTRAINT OsquadKey PRIMARY KEY(Year, Country,
FName, LName)
);

DROP TABLE Position_name;
CREATE TABLE Position_name(
Pos   VARCHAR(5) PRIMARY KEY,
Pos_Name   VARCHAR(10)
);

DROP TABLE WorldCup_host;
CREATE TABLE WorldCup_host(
Year   VARCHAR(4) PRIMARY KEY,
Country   VARCHAR(100),
Continent   VARCHAR(100),
Performance VARCHAR(20)
);

DROP TABLE WorldCup_squad;
CREATE TABLE WorldCup_squad(
Year  VARCHAR(4) NOT NULL,
Num  VARCHAR(3),
Player  VARCHAR(100) NOT NULL,
Nation  VARCHAR(10) NOT NULL,
Position  VARCHAR(10),
Club  VARCHAR(100) NOT NULL,
CONSTRAINT WsquadKey PRIMARY KEY(Year, Player, Nation, Club)
);

DROP TABLE WorldCup_stat;
CREATE TABLE WorldCup_stat(
Rank   VARCHAR(2) PRIMARY KEY,
Country   VARCHAR(20),
M_played   VARCHAR(3),
Won VARCHAR(3),
Tie VARCHAR(3),
Lost VARCHAR(3),
GF VARCHAR(3),
GA VARCHAR(3),
Points VARCHAR(3),
Participations VARCHAR(3),
Championships VARCHAR(2)
);

DROP TABLE WorldCup_win;
CREATE TABLE WorldCup_win(
Year   VARCHAR(4) PRIMARY KEY,
Winner   VARCHAR(100),
F_Score    VARCHAR(100),
Runner_Up   VARCHAR(100),
Third    VARCHAR(100),
SF_Score     VARCHAR(100),
Fourth VARCHAR(100),
Total_Team VARCHAR(8)
);
