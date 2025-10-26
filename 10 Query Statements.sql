#Producure 1
CREATE PROCEDURE TP_Q1()
SELECT 
   Athlete.name AS Athlete_Name, 
   Country.name AS Country_Name
FROM Athlete
JOIN Country ON Athlete.countryID = Country.countryID;

#Producure 2
CREATE PROCEDURE TP_Q2()
SELECT 
    Event.name AS Event_Name, 
    Sport.name AS Sport_Name, 
    Venue.name AS Venue_Name, 
    Event.startTime, 
    Event.type
FROM Event
JOIN Sport ON Event.sportID = Sport.sportID
JOIN Venue ON Event.venueID = Venue.venueID;

#Producure 3
CREATE PROCEDURE TP_Q3()
SELECT 
    Athlete.name AS Athlete_Name, 
    Winner.medalType AS Medal_Type
FROM Winner
JOIN Athlete ON Winner.athleteID = Athlete.athleteID;

#Producure 4
CREATE PROCEDURE TP_Q4()
SELECT 
    Country.name AS Country_Name, 
    COUNT(Athlete.athleteID) AS Number_Athletes
FROM Athlete
JOIN Country ON Athlete.countryID = Country.countryID
GROUP BY Country.name
ORDER BY Number_Athletes DESC;

#Producure 5
CREATE PROCEDURE TP_Q5()
SELECT 
    Country.name AS Country_Name,
    COUNT(Winner.medalType) AS Total_Medals
FROM Winner
JOIN Athlete ON Winner.athleteID = Athlete.athleteID
JOIN Country ON Athlete.countryID = Country.countryID
GROUP BY Country.name
ORDER BY Total_Medals DESC
LIMIT 5;

#Producure 6
CREATE PROCEDURE TP_Q6()
WITH
captain AS (SELECT * FROM Athlete),
sub AS (SELECT * FROM Athlete)
SELECT 
    captain.name AS "Captain_Name",
    COUNT(Winner.athleteID) AS "Medal_Num"
FROM captain
JOIN sub ON sub.captainID = captain.athleteID
JOIN Winner ON captain.athleteID = Winner.athleteID
GROUP BY captain.name;

#Producure 7
CREATE PROCEDURE TP_Q7()
SELECT 
    Event.name AS Event_Name,
    COUNT(Participant.participantID) AS Number_Participants
FROM Participant 
JOIN Event ON Participant.eventID = Event.eventID
GROUP BY Event.name
ORDER BY Number_Participants DESC;

#Producure 8
CREATE PROCEDURE TP_Q8()
SELECT 
    Country.name AS Country_Name,
    COUNT(DISTINCT Winner.athleteID) * 1.0 / COUNT(DISTINCT Athlete.athleteID) AS Medal_Efficiency
FROM Country
JOIN Athlete ON Country.countryID = Athlete.countryID
LEFT JOIN Winner ON Athlete.athleteID = Winner.athleteID
GROUP BY Country.name
ORDER BY Medal_Efficiency DESC;

#Producure 9
CREATE PROCEDURE TP_Q9()
SELECT 
    Country.name AS Country_Name,
    COUNT(Athlete.athleteID) AS Total_Athletes
FROM Country
JOIN Athlete ON Country.countryID = Athlete.countryID
WHERE NOT EXISTS (
    SELECT *
    FROM Winner
    WHERE Winner.athleteID = Athlete.athleteID)
GROUP BY Country.name
ORDER BY Total_Athletes DESC;

#Producure 10
CREATE PROCEDURE TP_Q10()
SELECT 
    Coach.name AS Coach_Name,
    COUNT(Winner.medalType) AS Total_Medals
FROM Coach
JOIN Athlete ON Coach.coachID = Athlete.coachID
JOIN Winner ON Athlete.athleteID = Winner.athleteID
GROUP BY Coach.name
HAVING COUNT(Winner.medalType) > 3
ORDER BY Total_Medals DESC;