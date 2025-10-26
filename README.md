# MIST 4610 Group Project 1

## Team Name and Members

62755 - Group 4

- Nathan Teal: [https://github.com/ntdog36/MIST\_Group4\_Project1](https://github.com/ntdog36/MIST_Group4_Project1)  
- George Zupko: [https://github.com/gvzupko/MIST_Group4_Project1](https://github.com/gvzupko/MIST_Group4_Project1)
- Kelly Stephenson: [https://github.com/kms25583-tech/MIST_Group4_Project1](https://github.com/kms25583-tech/MIST_Group4_Project1)
- Kevin Wang:  [https://github.com/kkw01911/MIST_Group4_Project1](https://github.com/kkw01911/MIST_Group4_Project1)
- Alexis Melchiorre: [https://github.com/amm-melch/MIST_Group4_Project1](https://github.com/amm-melch/MIST_Group4_Project1)

## Scenario Description
We built a data model to track the Athens, GA Olympics. Each event contains relationships to indicate all athletes involved, broadcasters, the location of the event, the sport, and other important data to represent the event as a whole. The data model is designed to be able handle a wide variety of types of events, as well as many other key factors that an organizer might want to store about the Olympics. The data model is designed for an organizer or someone within the event to be able to quickly find important data and statitcs to cater to their needs. 

## Data Model
Our model represents the structure of the Athens, GA Olympics. Our own imaginative large-scale international sporting event featuring athletes, coaches, venues, and broadcasters from around the world. 

The Country entity represents the nations that participate in the games. Each country has a name and national anthem. Multiple athletes and coaches are associated with each country. This is shown through one-to-many relationships between Country and Athlete and between Country and Coach.

The Athlete represents athletes that are competing in the Athens Olympics. The athletes entity keeps track of things such as the athletes name, age, and gender. This entity is also tied to country and sport so that we are able to track which country each athlete is from and who coaches them. The athlete entity also includes a captainID attribute, allowing the system to recognize team captains. This self-referential relationship lets one athlete be marked as the captain for other athletes within the same sport or country.

The Coach entity represents the trainers who prepare athletes for competition. Each coach is linked to a specific Sport and Country. The coach entity contains information on items such as the coach’s age, sport, and country.

The Sport entity lists all the sports featured in the Athens Olympics. Each sport can have many Events (for example, “Track” may include “100m Dash,” “Relay,” etc.), which is shown through the one-to-many relationship between Sport and Event.

The Event entity captures details about each competition, including its name, start time, type, and associated sport. Every event takes place at a specific Venue, which includes attributes such as address, capacity, and a possible parentVenueID to show sub-venues (for example, a stadium that contains multiple arenas). This is represented by a one-to-many relationship between Venue and Event.

Each Athlete participates in one or more events, and each event has many athletes competing. To represent this many-to-many relationship, we created the Participant entity. This table records which athlete competed in which event and their result from each event.

The Winner entity identifies athletes who placed in their events. It references both the Athlete and Participant tables and includes the medalType (Gold, Silver, Bronze), allowing for easy tracking of medal distributions across events.

Lastly, The model includes a Broadcaster entity, representing broadcasting companies covering the games. Each broadcaster employs multiple Announcers, who differ by years of experience and salary. Announcers are linked to specific events through the Assignment table, which records who covered which event and during what time frame. This structure allows the model to track broadcasting logistics and personnel involvement efficiently.

Overall, this data model provides a detailed, relational view of how athletes, events, countries, and broadcasters interact during the Athens Olympics, capturing the competitive, organizational, and media aspects of the games.

<img width="1233" height="701" alt="Data Model" src="https://github.com/user-attachments/assets/7bb3d4a8-b14d-4aab-8e66-9ee53abc33de" />


## Data Dictionary

### Table: **ANNOUNCER**

| Column Name | Description | Data Type | Size | Format | Key? |
| ----- | ----- | ----- | ----- | ----- | ----- |
| announcerID | Unique sequential number identifying each announcer | INT |  |  | PK |
| name | Name of the announcer | VARCHAR | 45 |  |  |
| salary | The salary amount for the announcer | INT |  |  |  |
| yrsExperience | The amount of years that the announcer has been working in announcing  | INT |  |  |  |
| broadcasterID | Indicates the broadcaster that the announcer works for  | INT |  |  | FK (ref. BROADCASTER) |

### Table: **ASSIGNMENT**

| Column Name | Description | Data Type | Size | Format | Key? |
| ----- | ----- | ----- | ----- | ----- | ----- |
| assignmentID | Unique sequential number indicating which announcer is assigned to which event and broadcast  | VARCHAR  | 45 |  | PK |
| eventID | Indicates what the event is  | INT |  |  | FK (ref.EVENT) |
| broadcasterID | Indicates which broadcaster is assigned  | INT |  |  | FK (ref.(BROADCASTER) |
| announcerID | Indicates which announcer is assigned  | INT |  |  | FK (ref.ANNOUNCER) |
| startTime | The time that the assignment starts | TIME |  | 00:00:00 |  |
| endTime | The time that the assignment ends  | TIME |  | 00:00:00 |  |

### Table: **ATHLETE** 

| Column Name | Description | Data Type | Size | Format | Key? |
| ----- | ----- | ----- | ----- | ----- | ----- |
| atheleteID | Unique sequential number identifying each athlete  | INT |  |  | PK |
| name | The athletes’s full name  | VARCHAR | 45 |  |  |
| age | The athlete’s age | INT |  |  |  |
| gender | The athlete’s gender | VARCHAR | 6 |  |  |
| countryID | Indicates which country the athlete’s from | INT |  |  | FK (ref. COUNTRY) |
| coachID | Indicates who the athlete’s coach is | INT |  |  | FK (ref. COACH) |
| captainID | Indicates which athlete is the captain and who they’re the captain of  | INT |  |  | FK (ref. ATHLETE) |

### Table: **BROADCASTER**

| Column Name | Description | Data Type | Size | Format | Key? |
| ----- | ----- | ----- | ----- | ----- | ----- |
| broadcasterID | Unique sequential number identifying each broadcaster | INT |  |  | PK |
| name | The name of the broadcast | VARCHAR | 45 |  |  |
| language | The language of the broadcast | VARCHAR | 20 |  |  |

### Table: **COACH**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| coachID | Unique sequential number identifying each coach | INT |  |  | PK |
| name | The name of the coach | VARCHAR | 45 |  |  |
| age | The age of the coach | INT |  |  |  |
| type | The type of coach (head coach/assistant) | VARCHAR | 25 |  |  |
| sportID | Indicates which sport the coach coach’s  | INT |  |  | FK (ref.SPORT) |
| countryID | Indicates which country the coach is from | INT |  |  | FK (ref.COUNTRY) |

### Table: **COUNTRY**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| countryID | Unique sequential number identifying each country | INT |  |  | PK |
| name | Name of the country | VARCHAR | 45 |  |  |
| anthem | The country’s national anthem  | VARCHAR | 45 |  |  |

### Table: **EVENT**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| eventID | Unique sequential number identifying each event | INT |  |  | PK |
| name | Name of the event  | VARCHAR | 45 |  |  |
| startTime | The time that the event starts | DATETIME |  | YYYY/MM/DD 00:00:00 |  |
| type | The type of event (prelims/finals) | VARCHAR | 10 |  |  |
| sportID | Indicates which sport this event is  | INT |  |  | FK (ref. SPORT) |
| venueID | Indicates where the event is taking place | INT |  |  | FK (ref. VENUE) |

### Table: **PARTICIPANT**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| participantID | Unique sequential number identifying the athlete who is participating in an event  | INT |  |  | PK |
| athleteID | Indicates which athlete is participating  | INT |  |  | FK (ref.ATHLETE) |
| eventID | Indicates which event is the participant is in | INT |  |  | FK(ref.EVENT) |
| result | The results of an event in which an athlete participates  | VARCHAR | 45 |  |  |

### Table: **SPORT**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| sportID | Unique sequential number identifying each sport | INT |  |  | PK |
| name | The name of the sport | VARCHAR | 45 |  |  |

### Table: **VENUE**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| venueID | Unique sequential number identifying the venue | INT |  |  | PK |
| name | The name of the venue  | VARCHAR | 45 |  |  |
| address | The address of the venue  | VARCHAR | 45 | 123 Main St |  |
| guestCapacity | The capacity of the venue  | INT |  |  |  |
| parentVenueID | Indicates the parent venue of venue | INT |  |  | FK (ref. VENUE) |

### Table: **WINNER**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| particpantID | Unique sequential number  | INT |  |  | PK, FK (ref.PARTICIPANT) |
| athleteID | The athlete who won the event  | INT |  |  | PK, FK (ref.ATHLETE) |
| medalType | The type of medal the winner received  | VARCHAR | 10 |  |  |

## Queries
<img width="713" height="513" alt="Screenshot 2025-10-26 at 6 28 44 PM" src="https://github.com/user-attachments/assets/2eb96907-a30f-459b-90ed-1ec5217da594" />

### Query #1
Query 1 lists all athletes and the country they represent, so managers can ensure each athlete is correctly registered under their respective countries. This data can later be linked to medals and other performance metrics.

    SELECT 
        Athlete.name AS Athlete_Name, 
        Country.name AS Country_Name
    FROM Athlete
    JOIN Country ON Athlete.countryID = Country.countryID;

| Athlete_Name      | Country_Name      |
| ----------------- | ----------------- |
| Caeleb Dressel    | United States of America |
| Joe Bottom        | United States of America |
| Pam Meyer         | United States of America |
| Edith Wetzel      | United States of America |
| Simon Biles       | United States of America |
| Sunisa Lee        | United States of America |
| Jade Carey        | United States of America |
| Stephen Nedoroscik | United States of America |
| Laura Kraut       | United States of America |
| Noah Lyles        | United States of America |
| Kenneth Bednark   | United States of America |
| Sydney McLaughlin-Levrone | United States of America |
| Anna Cockrell     | United States of America |
| Tatsumi Mon       | Japan             |
| Hakoro Mon        | Japan             |
| Takaaki Sugino    | Japan             |
| Toshiyuki Tanaka  | Japan             |
| Kentaro Sato      | Japan             |
| Naoko Takahashi   | Japan             |
| Glenn Hall        | Canada            |
| Justin Horton     | Canada            |
| Summer McIntosh   | Canada            |
| Ava Stewart       | Canada            |
| William Emard     | Canada            |
| Isabell Werth     | Canada            |
| Duan Asemota      | Canada            |
| Savannah Sutherland | Canada            |
| Mark Foster       | United Kingdom    |
| Rie Van Veen      | United Kingdom    |
| Dawn Fraser       | United Kingdom    |
| Max Whitlock      | United Kingdom    |
| Ben Maher         | United Kingdom    |
| Charles Dobson    | United Kingdom    |
| Jessie Knight     | United Kingdom    |
| Dayeong Lee       | South Korea       |
| Woong Hur         | South Korea       |
| Song Hu           | North Korea       |
| Ri Sol-ju         | North Korea       |
| Chang Ok An       | North Korea       |
| Kim Jong Un       | North Korea       |
| Yang Tu           | Taiwan            |
| Ye Shiwen         | Taiwan            |
| Yaquin Zhou       | Taiwan            |
| Zou Jingyuan      | Taiwan            |
| Liu Yang          | Taiwan            |
| Wong I-sheau      | Taiwan            |
| Zhenye Xie        | Taiwan            |
| Jiadie Mo         | Taiwan            |
| Jonty Skinner     | South Africa      |
| Roland Schoeman   | South Africa      |
| Nelson Mandela    | South Africa      |
| Zakithi Nene      | South Africa      |
| Zeney Geldenhuys  | South Africa      |
| César Cielo       | Brazil            |
| Mireia Belmonte   | Brazil            |
| Rebeca Andrade    | Brazil            |
| Julia Soares      | Brazil            |
| Diogo Soares      | Brazil            |
| Filipe Masetti    | Brazil            |
| Paulo Andre Camilo | Brazil            |
| Chayenne Da Silva | Brazil            |
| Mantu Debnath     | India             |
| Mahatma Gandhi    | India             |
| Dutee Chand       | India             |

### Query #2
Query 2 gets all events with their sport and venue, which helps managers coordinate event timelines so no event conflict happens.

    SELECT 
        Event.name AS Event_Name, 
        Sport.name AS Sport_Name, 
        Venue.name AS Venue_Name, 
        Event.startTime, 
        Event.type
    FROM Event
    JOIN Sport ON Event.sportID = Sport.sportID
    JOIN Venue ON Event.venueID = Venue.venueID;

| Event_Name      | Sport_Name      | Venue_Name      | startTime      | type      |
| --------------- | --------------- | --------------- | -------------- | --------- |
| Mens 50 FR      | Swim            | Pool 1          | 2025-10-23 09:15:00 | Prelim    |
| Mens 100 FR     | Swim            | Pool 1          | 2025-10-23 12:20:00 | Prelim    |
| Womens 200 FLY  | Swim            | Pool 1          | 2025-10-23 10:10:00 | Prelim    |
| Womens 400 IM   | Swim            | Pool 1          | 2025-10-23 03:10:00 | Prelim    |
| Mens 50 FR      | Swim            | Pool 2          | 2025-10-27 10:30:00 | Final     |
| Mens 100 FR     | Swim            | Pool 2          | 2025-10-27 13:30:00 | Final     |
| Womens 200 FLY  | Swim            | Pool 2          | 2025-10-27 15:30:00 | Final     |
| Womens 400 IM   | Swim            | Pool 2          | 2025-10-27 16:10:00 | Final     |
| Womens Beam     | Gymnastics      | STEG            | 2025-10-24 14:25:00 | Final     |
| Womens Vault    | Gymnastics      | STEG            | 2025-10-24 10:20:00 | Final     |
| Mens Pommel Horse | Gymnastics      | STEG            | 2025-10-25 13:15:00 | Final     |
| Mens Rings      | Gymnastics      | STEG            | 2025-10-25 09:15:00 | Final     |
| Mens 400 Meter Dash | Track           | Coco Cola Track | 2025-10-28 14:50:00 | Prelim    |
| Mens 100 Meter Dash | Track           | Coco Cola Track | 2025-10-28 11:20:00 | Prelim    |
| Mens 400 Meter Dash | Track           | Coco Cola Track | 2025-10-29 12:15:00 | Final     |
| Mens 100 Meter Dash | Track           | Coco Cola Track | 2025-10-29 12:22:00 | Final     |
| Womens 400 Meter Hurdles | Track           | Coco Cola Track | 2025-10-28 09:30:00 | Prelim    |
| Womens 400 Meter Hurdles | Track           | Coco Cola Track | 2025-10-29 10:40:00 | Final     |
| Womens 400 Meter Dash | Track           | Coco Cola Track | 2025-10-28 03:20:00 | Prelim    |
| Womens 400 Meter Dash | Track           | Coco Cola Track | 2025-10-29 14:30:00 | Final     |
| Mixed Horse Jumping | Equestrian      | Milledege Center | 2025-10-26 12:40:00 | Final     |

### Query 3
Query 3 finds all athletes who won medals and which type, which allows managers to track high-performers and their rankings.

    SELECT 
        Athlete.name AS Athlete_Name, 
        Winner.medalType AS Medal_Type
    FROM Winner
    JOIN Athlete ON Winner.athleteID = Athlete.athleteID;
| Athlete_Name      | Medal_Type      |
| ----------------- | --------------- |
| Rebeca Andrade    | Silver          |
| Rebeca Andrade    | Gold            |
| Simon Biles       | Gold            |
| Simon Biles       | Silver          |
| Sunisa Lee        | Bronze          |
| Jade Carey        | Bronze          |
| Stephen Nedoroscik | Gold            |
| Max Whitlock      | Silver          |
| Max Whitlock      | Bronze          |
| Takaaki Sugino    | Bronze          |
| Zou Jingyuan      | Gold            |
| Liu Yang          | Silver          |
| Sunisa Lee        | Gold            |
| Mahatma Gandhi    | Silver          |
| Wong I-sheau      | Bronze          |
| César Cielo       | Gold            |
| Roland Schoeman   | Silver          |
| Caeleb Dressel    | Bronze          |
| Caeleb Dressel    | Gold            |
| Glenn Hall        | Silver          |
| Glenn Hall        | Bronze          |
| Pam Meyer         | Bronze          |
| Summer McIntosh   | Silver          |
| Edith Wetzel      | Gold            |
| Summer McIntosh   | Bronze          |
| Mireia Belmonte   | Silver          |
| Ye Shiwen         | Gold            |
| Charles Dobson    | Silver          |
| Kentaro Sato      | Bronze          |
| Zakithi Nene      | Gold            |
| Noah Lyles        | Gold            |
| Kenneth Bednark   | Silver          |
| Zakithi Nene      | Bronze          |
| Sydney McLaughlin-Levrone | Gold            |
| Anna Cockrell     | Silver          |
| Naoko Takahashi   | Bronze          |
| Sydney McLaughlin-Levrone | Gold            |
| Naoko Takahashi   | Silver          |
| Dutee Chand       | Bronze          |

### Query 4
Query 4 finds the total number of athletes representing each country. This allows managers to see how many athletes represent each country ranked from highest to lowest, which can be used to compare medal efficiency.

    SELECT 
        Country.name AS Country_Name, 
        COUNT(Athlete.athleteID) AS Number_Athletes
    FROM Athlete
    JOIN Country ON Athlete.countryID = Country.countryID
    GROUP BY Country.name
    ORDER BY Number_Athletes DESC;

| Country_Name      | Number_Athletes      |
| ----------------- | -------------------- |
| United States of America | 13                   |
| Canada            | 8                    |
| Taiwan            | 8                    |
| Brazil            | 8                    |
| United Kingdom    | 7                    |
| Japan             | 6                    |
| South Africa      | 5                    |
| North Korea       | 4                    |
| India             | 3                    |
| South Korea       | 2                    |

### Query 5
Query 5 returns the top 5 countries by total medals won, which can serve as a performance benchmark and useful as data to show to the media.

    SELECT 
        Country.name AS Country_Name,
        COUNT(Winner.medalType) AS Total_Medals
    FROM Winner
    JOIN Athlete ON Winner.athleteID = Athlete.athleteID
    JOIN Country ON Athlete.countryID = Country.countryID
    GROUP BY Country.name
    ORDER BY Total_Medals DESC
    LIMIT 5;

| Country_Name      | Total_Medals      |
| ----------------- | ----------------- |
| United States of America | 15                |
| Brazil            | 4                 |
| Japan             | 4                 |
| Taiwan            | 4                 |
| Canada            | 4                 |

### Query 6
Query 6 finds athletes who are team captains and have also won medals, highlighting captains and their role in the team and can be used to identify whether a correlation exists between leadership and medal success.

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

| Captain_Name      | Medal_Num      |
| ----------------- | -------------- |
| Caeleb Dressel    | 6              |
| Summer McIntosh   | 4              |
| Mireia Belmonte   | 1              |
| Rebeca Andrade    | 4              |
| Simon Biles       | 6              |
| Sydney McLaughlin-Levrone | 6              |



### Query 7
Query 7 finds the events with the highest number of participants, so managers can better allocate staff members for certain events and use this data to improve or stop underperforming events.

    SELECT 
        Event.name AS Event_Name,
        COUNT(Participant.participantID) AS Number_Participants
    FROM Participant 
    JOIN Event ON Participant.eventID = Event.eventID
    GROUP BY Event.name
    ORDER BY Number_Participants DESC;

| Event_Name      | Number_Participants      |
| --------------- | ------------------------ |
| Womens 400 Meter Hurdles | 12                       |
| Womens 400 Meter Dash | 12                       |
| Mens 50 FR      | 11                       |
| Mens 100 FR     | 11                       |
| Womens 200 FLY  | 11                       |
| Womens 400 IM   | 11                       |
| Mens 400 Meter Dash | 11                       |
| Mens 100 Meter Dash | 11                       |
| Womens Beam     | 8                        |
| Womens Vault    | 8                        |
| Mens Pommel Horse | 8                        |
| Mens Rings      | 8                        |
| Mixed Horse Jumping | 8                        |

### Query 8
Query 8 finds the medal efficiency: medals per athlete for each country. It shows how effectively each country can convert its athlete into medal winners, thus the managers can compare medal efficiency between countries with different sizes to see which country is more efficient at converting their athletes into medal winners.

    SELECT 
        Country.name AS Country_Name,
        COUNT(DISTINCT Winner.athleteID) * 1.0 / COUNT(DISTINCT Athlete.athleteID) AS Medal_Efficiency
    FROM Country
    JOIN Athlete ON Country.countryID = Athlete.countryID
    LEFT JOIN Winner ON Athlete.athleteID = Winner.athleteID
    GROUP BY Country.name
    ORDER BY Medal_Efficiency DESC;

| Country_Name      | Medal_Efficiency      |
| ----------------- | --------------------- |
| United States of America | 0.84615               |
| India             | 0.66667               |
| Japan             | 0.50000               |
| Taiwan            | 0.50000               |
| South Africa      | 0.40000               |
| Brazil            | 0.37500               |
| United Kingdom    | 0.28571               |
| Canada            | 0.25000               |
| North Korea       | 0.00000               |
| South Korea       | 0.00000               |

### Query 9
Query 9 finds Countries with Athletes but no Medals; this would show which countries are underperforming and show where developments are needed.

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
| Country_Name      | Total_Athletes      |
| ----------------- | ------------------- |
| Canada            | 6                   |
| United Kingdom    | 5                   |
| Brazil            | 5                   |
| North Korea       | 4                   |
| Taiwan            | 4                   |
| Japan             | 3                   |
| South Africa      | 3                   |
| United States of America | 2                   |
| South Korea       | 2                   |
| India             | 1                   |

### Query 10
Query 10 shows Coaches Whose Athletes won more than 3 Medals; this highlights and recognizes great coaching talents and show which training methods are working.

    SELECT 
        Coach.name AS Coach_Name,
        COUNT(Winner.medalType) AS Total_Medals
    FROM Coach
    JOIN Athlete ON Coach.coachID = Athlete.coachID
    JOIN Winner ON Athlete.athleteID = Winner.athleteID
    GROUP BY Coach.name
    HAVING COUNT(Winner.medalType) > 3
    ORDER BY Total_Medals DESC;
| Coach_Name      | Total_Medals      |
| --------------- | ----------------- |
| Jessica Smith   | 5                 |
| Sarah Johnson   | 5                 |
| John Smith      | 4                 |
| Elieen Reagan   | 4                 |


## Database Information
Name of the database: ns_F25MIST4610_62755_Group4

Each of the queries documented here can be called using stored producedures.

CALL TP_Q1();
CALL TP_Q2();
CALL TP_Q3();
CALL TP_Q4();
CALL TP_Q5();
CALL TP_Q6();
CALL TP_Q7();
CALL TP_Q8();
CALL TP_Q9();
CALL TP_Q10();
