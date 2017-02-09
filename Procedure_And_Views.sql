-- 1. Best Ranking
DROP VIEW Best_Rank;
CREATE VIEW Best_Rank AS
SELECT S.Club, MIN(S.Rank) AS Best_Rank, 
MIN(S.Season) AS Season
FROM League_standing S
GROUP BY S.Club;

--2. Most Winning Team
DROP VIEW Most_Winning;
CREATE VIEW Most_Winning AS
SELECT MAX(L.League_name) AS League, MAX(T.Club) AS Club,
MAX(T.Win) AS Winning_Number
From League_list L,
(
	SELECT SS.LID, SS.Club, Count(SS.Club) AS Win 
	FROM League_standing SS
	WHERE SS.Rank = 1 
	GROUP BY SS.Club, SS.LID
) AS T
WHERE T.LID = L.LID 
GROUP BY T.LID;

--3. Game Result With Expected Result (1 - Win, 2 - Lost, 3 - Draw)
DROP VIEW Game_Result;
CREATE VIEW Game_Result AS
SELECT Season, LID, Home_T,
	CASE WHEN (Home_S - Away_S) > 0 THEN 1 
	WHEN (Home_S - Away_S) < 0 THEN 2
	ELSE 3 END AS H_Result,
	CASE WHEN (Home_ES - Away_ES) > 0 THEN 1 
	WHEN (Home_ES - Away_ES) < 0 THEN 2
	ELSE 3 END AS H_E_Result,
	Away_T,
	CASE WHEN (Away_S - Home_S) > 0 THEN 1 
	WHEN (Away_S - Home_S) < 0 THEN 2
	ELSE 3 END AS A_Result,
	CASE WHEN (Away_ES - Home_ES) > 0 THEN 1 
	WHEN (Away_ES - Home_ES) < 0 THEN 2
	ELSE 3 END AS A_E_Result
FROM League_games;

-- 4. Unexpected Wins(We can get most unexpected wins by season and leagues)
DROP VIEW Unexpected_Home_Wins;
CREATE VIEW Unexpected_Home_Wins AS
SELECT GG.Season, L.League_name, GG.Home_T, 
Count(GG.H_Result) AS Unexpected_Wins
FROM Game_Result GG, League_list L
WHERE GG.H_Result < GG.H_E_Result AND GG.H_Result <> 2 
AND GG.LID = L.LID
GROUP BY GG.Home_T, GG.Season, L.League_name
ORDER BY L.League_name, GG.Season, Unexpected_Wins DESC;

DROP VIEW Unexpected_Away_Wins;
CREATE VIEW Unexpected_Away_Wins AS
SELECT GG.Season, L.League_name, GG.Home_T, Count(GG.A_Result) AS Unexpected_Wins
FROM Game_Result GG, League_list L
WHERE GG.A_Result < GG.A_E_Result and GG.A_Result <> 2 and GG.LID = L.LID
GROUP BY GG.Home_T, GG.Season, L.League_name
ORDER BY L.League_name, GG.Season, Unexpected_Wins DESC;

--5. Player won both Worldcup and League at least once
DROP VIEW WorldCup_League_Winning_Player;
CREATE VIEW WorldCup_League_Winning_Player As
SELECT DISTINCT T1.Country, T.Team, T.Player
FROM 
(
	SELECT C.Country, S.Player
	FROM Country_code C, WorldCup_win W, WorldCup_squad S 
	WHERE C.Country = W.Winner 
	AND C.NCode = S.Nation and W.Year = S.Year
) AS T1,
(
	SELECT LS.Team, LS.Player
	FROM League_squad LS, League_standing R
	WHERE R.Rank = 1 AND R.Club = LS.Team 
	AND R.Season = LS.Season AND R.LID = LS.LID
)AS T
WHERE T.Player = T1.Player
ORDER BY T.Player;

--6. Winning Odds
DROP VIEW Home_Winning_Odds;
CREATE VIEW Home_Winning_Odds AS
SELECT DISTINCT GG.Home_T, CONCAT(FORMAT((T.num / T3.Tot) * 100,2), '%') AS Win,
CONCAT(FORMAT((T1.num / T3.Tot) * 100,2), '%') AS Draw,
CONCAT(FORMAT((T2.num / T3.Tot) * 100,2), '%') AS Lose
FROM Game_Result GG,
(
	SELECT G.Home_T, COUNT(Home_T) AS num
	FROM Game_Result G
	WHERE H_Result = 1
	GROUP BY G.Home_T
) AS T,
(
	SELECT G.Home_T, COUNT(Home_T) AS num
	FROM Game_Result G
	WHERE H_Result = 2
	GROUP BY G.Home_T
) AS T1,
(
	SELECT G.Home_T, COUNT(Home_T) AS num
	FROM Game_Result G
	WHERE H_Result = 3
	GROUP BY G.Home_T
) AS T2,
(
	SELECT G.Home_T, COUNT(Home_T) AS Tot
	FROM Game_Result G
	GROUP BY G.Home_T
) AS T3
WHERE T.Home_T = GG.Home_T AND T.Home_T = T3.Home_T 
AND T1.Home_T = T3.Home_T AND T2.Home_T = T3.Home_T;

DROP VIEW Away_Winning_Odds;
CREATE VIEW Away_Winning_Odds AS
SELECT DISTINCT GG.Away_T, CONCAT(FORMAT((T.num / T3.Tot) * 100,2), '%') AS Win,
CONCAT(FORMAT((T1.num / T3.Tot) * 100,2), '%') AS Draw,
CONCAT(FORMAT((T2.num / T3.Tot) * 100,2), '%') AS Lose
FROM Game_Result GG,
(
	SELECT G.Away_T, COUNT(Away_T) AS num
	FROM Game_Result G
	WHERE A_Result = 1
	GROUP BY G.Away_T
) AS T,
(
	SELECT G.Away_T, COUNT(Away_T) AS num
	FROM Game_Result G
	WHERE A_Result = 2
	GROUP BY G.Away_T
) AS T1,
(
	SELECT G.Away_T, COUNT(Away_T) AS num
	FROM Game_Result G
	WHERE A_Result = 3
	GROUP BY G.Away_T
) AS T2,
(
	SELECT G.Away_T, COUNT(Away_T) AS Tot
	FROM Game_Result G
	GROUP BY G.Away_T
) AS T3
WHERE T.Away_T = GG.Away_T AND T.Away_T = T3.Away_T AND T1.Away_T = T3.Away_T AND T2.Away_T = T3.Away_T;

#############
--PROCEDURE
#############
--1. Game History Between Two Team
DELIMITER //
DROP PROCEDURE IF EXISTS Game_History; //
CREATE PROCEDURE Game_History(IN Team1 VARCHAR(100), IN Team2 VARCHAR(100))
BEGIN
IF (Team1 IN (SELECT Club FROM Clubs) AND Team2 IN (SELECT Club FROM Clubs)) THEN
    SELECT L.Season, L.Home_T, L.Away_T, L.Home_S, L.Away_S
	FROM League_games L
	WHERE (L.Home_T = Team1 AND L.Away_T = Team2) 
	OR (L.Away_T = Team1 AND L.Home_T = Team2);
ELSEIF (Team1 IN (SELECT Club FROM Clubs) AND Team2 IN (SELECT Club_original FROM Club_original)) THEN
	SELECT DISTINCT L.Season, L.Home_T, L.Away_T, L.Home_S, L.Away_S
	FROM League_games L,
	(
		SELECT C.Club
		FROM Club_original O, Clubs C
		WHERE O.Club_original = Team2 AND O.TID = C.TID
	) AS T
	WHERE (L.Home_T = Team1 AND L.Away_T = T.Club) 
	OR (L.Away_T = Team1 AND L.Home_T = T.Club);
ELSEIF (Team2 IN (SELECT Club FROM Clubs) AND Team1 IN (SELECT Club_original FROM Club_original)) THEN
	SELECT DISTINCT L.Season, L.Home_T, L.Away_T, L.Home_S, L.Away_S
	FROM League_games L, 
	(
		SELECT C.Club
		FROM Club_original O, Clubs C
		WHERE O.Club_original = Team1 AND O.TID = C.TID
	) AS T
	WHERE (L.Home_T = T.Club AND L.Away_T = Team2) 
	OR (L.Away_T = T.Club AND L.Home_T = Team2);
ELSEIF (Team2 IN (SELECT Club_original FROM Club_original) AND Team1 IN (SELECT Club_original FROM Club_original)) THEN
	SELECT DISTINCT L.Season, L.Home_T, L.Away_T, L.Home_S, L.Away_S
	FROM League_games L, 
	(
		SELECT C.Club
		FROM Club_original O, Clubs C
		WHERE O.Club_original = Team1 AND O.TID = C.TID
	) AS T,
	(
		SELECT C.Club
		FROM Club_original O, Clubs C
		WHERE O.Club_original = Team2 AND O.TID = C.TID
	) AS T2
	WHERE (L.Home_T = T.Club AND L.Away_T = T2.Club) 
	OR (L.Away_T = T.Club AND L.Home_T = T2.Club);
ELSE
    SELECT 'No such Team in database' AS 'Error';
END IF;
END //
DELIMITER ;

--2. Home vs Away Winning Odds
DELIMITER //
DROP PROCEDURE IF EXISTS Winning_Odds; //
CREATE PROCEDURE Winning_Odds(IN Team VARCHAR(100))
BEGIN
IF (Team IN (SELECT Club FROM Clubs)) THEN
    SELECT "Home", OD.Home_T AS Club_Name, OD.Win, OD.Draw, OD.Lose
    FROM Home_Winning_Odds OD
    WHERE OD.Home_T = Team
    UNION
    SELECT "Away", OD.Away_T AS Club_Name, OD.Win, OD.Draw, OD.Lose
    FROM Away_Winning_Odds OD
    WHERE OD.Away_T = Team;
ELSEIF (Team IN (SELECT Club_original FROM Club_original)) THEN
	SELECT "Home", OD.Home_T AS Club_Name, OD.Win, OD.Draw, OD.Lose
    FROM Home_Winning_Odds OD,
    (
		SELECT C.Club
		FROM Club_original O, Clubs C
		WHERE O.Club_original = Team AND O.TID = C.TID
	) AS T2
    WHERE OD.Home_T = T2.Club
    UNION
    SELECT "Away", OD.Away_T AS Club_Name, OD.Win, OD.Draw, OD.Lose
    FROM Away_Winning_Odds OD,
    (
		SELECT C.Club
		FROM Club_original O, Clubs C
		WHERE O.Club_original = Team AND O.TID = C.TID
	) AS T2
    WHERE OD.Away_T = T2.Club;
ELSE
    SELECT 'No such Team in database' AS 'Error';
END IF;
END //
DELIMITER ;

--3. Team Game History
DELIMITER //
DROP PROCEDURE IF EXISTS Individual_Club_Game_History; //
CREATE PROCEDURE Individual_Club_Game_History(IN Team VARCHAR(100))
BEGIN
IF (Team IN (SELECT Club FROM Clubs)) THEN
SELECT T.Season, T.Club, T.Against, CONCAT_WS(":", T.Score1, T.Score2) AS Score
FROM 
(
SELECT G.Season, G.Home_T AS Club, G.Away_T AS Against, G.Home_S AS Score1, G.Away_S AS Score2
FROM League_games G
WHERE G.Home_T = Team
UNION ALL
SELECT G.Season, G.Away_T AS Club, G.Home_T AS Against, G.Away_S AS Score1, G.Home_S AS Score2
FROM League_games G
WHERE G.Away_T = Team
) AS T
ORDER BY T.Season;
ELSE
SELECT 'No such Team in database' AS 'Error';
END IF;
END //

--4 Team Winning Percent
DELIMITER //
DROP PROCEDURE IF EXISTS Winning_Prediction; //
CREATE PROCEDURE Winning_Prediction(IN X VARCHAR(100), IN Y VARCHAR(100))
BEGIN
IF (X IN (SELECT Club FROM Clubs) AND Y IN (SELECT Club FROM Clubs)) THEN
SELECT T3.Team1, T3.Team2, CONCAT(FORMAT(T3.Win/COUNT(T2.Result) * 100, 2), '%') AS Team1_Win_Possibility
FROM
(
SELECT T.Team1, T.Team2, COUNT(T.RESULT) AS Win
FROM
(
SELECT G.Home_T AS Team1, G.Away_T AS Team2, G.H_Result AS Result
FROM Game_Result G
WHERE G.Home_T = X AND G.Away_T = Y
AND G.H_Result = 1
UNION ALL
SELECT G.Away_T AS Team1, G.Home_T AS Team2, G.A_Result AS Result
FROM Game_Result G
WHERE G.Away_T = X AND G.Home_T = Y
AND G.A_Result = 1
) AS T
GROUP BY T.Team1, T.Team2
) AS T3,
(
SELECT G.Home_T AS Team1, G.Away_T AS Team2, G.H_Result AS Result
FROM Game_Result G
WHERE G.Home_T = X AND G.Away_T = Y
UNION ALL
SELECT G.Away_T AS Team1, G.Home_T AS Team2, G.A_Result AS Result
FROM Game_Result G
WHERE G.Away_T = X AND G.Home_T = Y
) AS T2
GROUP BY T3.Team1, T3.Team2;
ELSE
SELECT 'No result' AS 'Error';
END IF;
END //


#all events/teams pertaining to a country
DELIMITER //
DROP PROCEDURE IF EXISTS EventCountry //
CREATE PROCEDURE EventCountry(IN x VARCHAR(20))
BEGIN

IF (x IN (SELECT Country FROM Country_code)) THEN
    (SELECT CONCAT(OH.Year, " Summer Olympics") as Year, CONCAT_WS(",", OH.City, CC.Country) as Location, ORR.Country AS Champion
    FROM Olympic_host as OH, Country_code as CC, Olympic_record as ORR
    WHERE OH.Ncode = CC.NCode and CC.Country = x and ORR.Year = OH.Year and ORR.rank = 1)
    UNION
    (SELECT CONCAT(WH.Year, " World Cup") as Year, CONCAT_WS(",", WH.Country, WH.Continent) as Location, CONCAT("Home Team: ",WH.Performance) AS Champion
    FROM WorldCup_host as WH, Country_code AS CC
    WHERE WH.Country = CC.Country and CC.NCode = (SELECT DISTINCT NCode FROM Country_code WHERE Country = x))
    UNION
    (SELECT CONCAT("founded in ", LL.Year) AS Year, LL.League_Name as Location, LL.MostChampion AS Champion
    FROM League_list as LL, Country_code as CC
    WHERE LL.NCode = CC.NCode and CC.Country = x);

ELSE
    SELECT 'Invalid Country Name' AS 'Error';
END IF;

END //
DELIMITER ;

#List all big3 football league players whose nationality is a certain country
DELIMITER //
DROP PROCEDURE IF EXISTS CountryPlayer //
CREATE PROCEDURE CountryPlayer(IN x VARCHAR(20))
BEGIN

IF (x IN (SELECT Country FROM Country_code)) THEN
    SELECT DISTINCT LS.player, LS.Team, LS.season, LL.League_Name
    FROM League_squad as LS, Country_Code as CC, League_list as LL
    WHERE LS.Nation = CC.NCode and CC.Country = x and LS.LID = LL.LID;
ELSE
    SELECT 'Invalid Country Name' AS 'Error';
END IF;

END //
DELIMITER ;

#List all the football clubs that a certain player has played for (during the scope of this DB)
DELIMITER //
DROP PROCEDURE IF EXISTS PlayerTeamHistory //
CREATE PROCEDURE PlayerTeamHistory(IN x VARCHAR(20))
BEGIN
    SELECT DISTINCT LS.Player, LS.Season, LL.League_Name, LS.Team, LS.Num
    FROM League_squad as LS, League_list as LL
    WHERE LS.player = x and LS.LID = LL.LID;

END //
DELIMITER ;

#List the football club that a certain player played for in a certain year
DELIMITER //
DROP PROCEDURE IF EXISTS PlayerInYear //
CREATE PROCEDURE PlayerInYear(IN x VARCHAR(20), IN y VARCHAR(4))
BEGIN
    SELECT DISTINCT LS.Player, LS.Season, LL.League_Name, LS.Team, LS.Num
    FROM League_squad as LS, League_list as LL
    WHERE LS.player = x and LS.LID = LL.LID and LS.season = y;
END //
DELIMITER ;

#List the team with the highest standing Football CLub in each big 3 European Football League in a certain year
DELIMITER //
DROP PROCEDURE IF EXISTS BestInYear //
CREATE PROCEDURE BestInYear(IN x VARCHAR(4))
BEGIN
    SELECT DISTINCT LS.Club, LL.League_Name, LS.Season
	FROM League_standing AS LS, League_list as LL
	WHERE LS.LID = LL.LID and Rank = 1 and LS.Season = x
	ORDER BY LS.Season;
END //
DELIMITER ;

#List all of the games that a certain team has played
DELIMITER //
DROP PROCEDURE IF EXISTS TeamAllGame //
CREATE PROCEDURE TeamAllGame(IN x VARCHAR(30))
BEGIN
    SELECT LG.Season, LG.Mdate as Date, LG.Home_T as Home, LG.Away_T as Away, CONCAT_WS(':',LG.Home_S, LG.Away_S) as Score
    FROM League_games as LG
    WHERE Home_T = x or Away_T = x;
END //
DELIMITER ;

