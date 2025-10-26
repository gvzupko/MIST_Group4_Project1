# MIST 4610 Group Project 1

## Team Name and Members

62755 - Group 4

- Nathan Teal: [https://github.com/ntdog36/MIST\_Group4\_Project1](https://github.com/ntdog36/MIST_Group4_Project1)  
- George Zupko: [https://github.com/gvzupko/MIST_Group4_Project1](https://github.com/gvzupko/MIST_Group4_Project1)
- Kelly Stephenson:  @kms25583-tech
- Kevin Wang:  [https://github.com/kkw01911/MIST_Group4_Project1](https://github.com/kkw01911/MIST_Group4_Project1)
- Alexis Melchiorre:

## Scenario Description
We built a data model to track the Athens, GA Olympics. Each event contains relationships to indicate all athletes involved, broadcasters, the location of the event, the sport, and other important data to represent the event as a whole. The data model is designed to be able handle a wide variety of types of events, as well as many other key factors that an organizer might want to store about the Olympics. The data model is designed for an organizer or someone within the event to be able to quickly find important data and statitcs to cater to their needs. 

## Data Model
Our model represents the structure of the Athens, GA Olympics. Our own imaginative  large-scale international sporting event featuring athletes, coaches, venues, and broadcasters from around the world. 

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
| assignmentID | Unique sequential number indicating which announcer is assigned to which event and broadcast  | VARCHAR  |  |  | PK |
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
| address | The address of the venue  | VARCHAR | 45 | \!\!\!\!\!\! |  |
| guestCapacity | The capacity of the venue  | INT |  |  |  |
| parentVenueID | Indicates the parent venue of venue | INT |  |  | FK (ref. VENUE) |

### Table: **WINNER**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| particpantID | Unique sequential number  | INT |  |  | PK, FK (ref.PARTICIPANT) |
| athleteID | The athlete who won the event  | INT |  |  | PK, FK (ref.ATHLETE) |
| medalType | The type of medal the winner received  | VARCHAR | 10 |  |  |

## Queries

## Database Information
Name of the database: ns_F25MIST4610_62755_Group4

Each of the queries documented here can be called using stored producedures.

CALL TP_Q1();

