# MIST 4610 Group Project 1

## Team Name and Members

62775 - Group 4

- Nathan Teal: [https://github.com/ntdog36/MIST\_Group4\_Project1](https://github.com/ntdog36/MIST_Group4_Project1)  
- George Zupko: [https://github.com/gvzupko/MIST_Group4_Project1](https://github.com/gvzupko/MIST_Group4_Project1)
- Kelly Stephenson:  
- Kevin Wang:  
- Alexis Melchiorre:

## Scenario Description
We are building a data model to track the Athens Olympics. Each event contains relationships to indicate all athletes involved, broadcasters, the location of the event, the sport, and other important data to represent the event as a whole. The data model is designed to be able handle a wide variety of types of events, as well as many other key factors that an organizer might want to store about the Olympics. 

## Data Model
<img width="1235" height="703" alt="Data Model" src="https://github.com/user-attachments/assets/90b2310c-96c1-479e-840d-61b84f5d2c7c" />

## Data Dictionary

### Table: **ANNOUNCER**

| Column Name | Description | Data Type | Size | Format | Key? |
| ----- | ----- | ----- | ----- | ----- | ----- |
| announcerID | Unique sequential number identifying each announcer | INT |  |  | PK |
| name | Name of the announcer | Text | 45 |  |  |
| salary | The salary amount for the announcer | INT |  |  |  |
| yrsExperience | The amount of years that the announcer has been working in announcing  | INT |  |  |  |
| broadcasterID | Indicates the broadcaster that the announcer works for  | INT |  |  | FK (ref. BROADCASTER) |

### Table: **ASSIGNMENT**

| Column Name | Description | Data Type | Size | Format | Key? |
| ----- | ----- | ----- | ----- | ----- | ----- |
| assignmentID | Unique sequential number indicating which announcer is assigned to which event and broadcast  | Text  |  |  | PK |
| eventID | Indicates what the event is  | INT |  |  | FK (ref.EVENT) |
| broadcasterID | Indicates which broadcaster is assigned  | INT |  |  | FK (ref.(BROADCASTER) |
| announcerID | Indicates which announcer is assigned  | INT |  |  | FK (ref.ANNOUNCER) |
| startTime | The time that the assignment starts | DATETIME |  |  |  |
| endTime | The time that the assignment ends  | DATETIME |  |  |  |

### Table: **ATHLETE** 

| Column Name | Description | Data Type | Size | Format | Key? |
| ----- | ----- | ----- | ----- | ----- | ----- |
| atheleteID | Unique sequential number identifying each athlete  | INT |  |  | PK |
| name | The athletes’s full name  | Text | 45 |  |  |
| age | The athlete’s age | INT |  |  |  |
| gender | The athlete’s gender | Text | 6 |  |  |
| countryID | Indicates which country the athlete’s from | INT |  |  | FK (ref. COUNTRY) |
| coachID | Indicates who the athlete’s coach is | INT |  |  | FK (ref. COACH) |
| captainID | Indicates which athlete is the captain and who they’re the captain of  | INT |  |  | FK (ref. ATHLETE) |

### Table: **BROADCASTER**

| Column Name | Description | Data Type | Size | Format | Key? |
| ----- | ----- | ----- | ----- | ----- | ----- |
| broadcasterID | Unique sequential number identifying each broadcaster | INT |  |  | PK |
| name | The name of the broadcast | TEXT | 45 |  |  |
| language | The language of the broadcast | TEXT | 20 |  |  |

### Table: **COACH**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| coachID | Unique sequential number identifying each coach | INT |  |  | PK |
| name | The name of the coach | Text | 45 |  |  |
| age | The age of the coach | INT |  |  |  |
| type | The type of coach (head coach/assistant) | Text | 25 |  |  |
| sportID | Indicates which sport the coach coach’s  | INT |  |  | FK (ref.SPORT) |
| countryID | Indicates which country the coach is from | INT |  |  | FK (ref.COUNTRY) |

### Table: **COUNTRY**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| countryID | Unique sequential number identifying each country | INT |  |  | PK |
| name | Name of the country | Text | 45 |  |  |
| anthem | The country’s national anthem  | Text | 45 |  |  |

### Table: **EVENT**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| eventID | Unique sequential number identifying each event | INT |  |  | PK |
| name | Name of the event  | Text | 45 |  |  |
| startTime | The time that the event starts | DATETIME |  | YYYY/MM/DD |  |
| type | The type of event (prelims/finals) | Text | 10 |  |  |
| sportID | Indicates which sport this event is  | INT |  |  | FK (ref. SPORT) |
| venueID | Indicates where the event is taking place | INT |  |  | FK (ref. VENUE) |

### Table: **PARTICIPANT**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| participantID | Unique sequential number identifying the athlete who is participating in an event  | INT |  |  | PK |
| athleteID | Indicates which athlete is participating  | INT |  |  | FK (ref.ATHLETE) |
| eventID | Indicates which event is the participant is in | INT |  |  | FK(ref.EVENT) |
| result | The results of an event in which an athlete participates  | TEXT | 45 |  |  |

### Table: **SPORT**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| sportID | Unique sequential number identifying each sport | INT |  |  | PK |
| name | The name of the sport | Text | 45 |  |  |

### Table: **VENUE**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| venueID | Unique sequential number identifying the venue | INT |  |  | PK |
| name | The name of the venue  | Text | 45 |  |  |
| address | The address of the venue  | Text | 45 | \!\!\!\!\!\! |  |
| guestCapacity | The capacity of the venue  | INT |  |  |  |
| parentVenueID | Indicates the parent venue of venue | INT |  |  | FK (ref. VENUE) |

### Table: **WINNER**

| Column Name | Description | Data Type | Size | Format | Key? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| particpantID | Unique sequential number  | INT |  |  | PK, FK (ref.PARTICIPANT) |
| athleteID | The athlete who won the event  | INT |  |  | PK, FK (ref.ATHLETE) |
| medalType | The type of medal the winner received  | TEXT | 10 |  |  |

## Queries

## Database Information
