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

INSERT INTO League_list VALUES ('a001', 'Bundesliga', 'GER', '1963', '18', 'Bayern Munchen', 'Bayern Munchen'); 
INSERT INTO League_list VALUES ('a002', 'Premier League', 'ENG', '1992', '20', 'Leicester City', 'Manchester United'); 
INSERT INTO League_list VALUES ('a003', 'La Liga', 'ESP', '1929', '20', 'Barcelona', 'Real Madrid'); 