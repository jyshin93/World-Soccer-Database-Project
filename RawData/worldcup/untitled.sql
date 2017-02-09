#List the team with the highest standing Football CLub in each big 3 European Football League
SELECT LS.Club, LL.League_Name
FROM League_standing AS LS, League_List as LL
WHERE LS.LID = LL.LID and Rank = 1;

#Which country's major football league has the highest average player height? (2014)
SELECT LN.Country, LN.League_Name
FROM League_Name AS LN, League_Squad AS LS
WHERE LN.LID = LS.LID, LS.Season = '2014';
GROUP BY LS.LID
HAVING AVG(LS.Height) >= (SELECT AVG(LS2.Height)
							FROM League_Suad AS LS2
							WHERE LS2.Season = '2014'
							GROUP BY LS2.LID);

#Which Country
CREATE VIEW AS






#all events/teams pertaining to a country
DELIMITER //
DROP PROCEDURE IF EXISTS AboutCountry //
CREATE PROCEDURE EventCountry(IN x VARCHAR(20))
BEGIN

IF (x IN (SELECT Country FROM Country_code)) THEN
    SELECT OH.Year, OH.City, CC.Country
    FROM Olympic_host as OH, Country_code as CC
    WHERE OH.Ncode = CC.NCode and CC.Country = x;
    
    SELECT *
    FROM WorldCup_host as WH
    WHERE WH.Country = x;

    SELECT LL.League_Name, LL.Year, LL.N_Teams, LL.CurChampion, LL.MostChampion
    FROM League_List as LL, Country_code as CC
    WHERE LL.NCode = CC.NCode and CC.Country = x;

ELSE
    SELECT 'Invalid Country Name' AS 'Error';
END IF;
END //
DELIMITER ;

#List all players whose nationality is a certain country
DELIMITER //
DROP PROCEDURE IF EXISTS CountryPlayer //
CREATE PROCEDURE CountryPlayer(IN x VARCHAR(20))
BEGIN
IF (x IN (SELECT Country FROM Country_code)) THEN
    SELECT DISTINCT LS.player
    FROM League_squad as LS, Country_Code as CC
    WHERE LS.Nation = CC.NCode and CC.Country = x;
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
    SELECT DISTINCT 
    FROM League_squad as LS, Country_Code as CC
    WHERE LS.Nation = CC.NCode and CC.Country = x;

END //
DELIMITER ;

#Procedure
#1. Player/Year -> Team
#2. Team Spec Year/Team -> results, rank, 
#3. 


