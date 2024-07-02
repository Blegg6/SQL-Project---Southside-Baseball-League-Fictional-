/*QUERIES TO DROP TABLES*/
DROP TABLE G7_Sponsor;


DROP TABLE G7_Player;


DROP TABLE G7_Coach;


DROP TABLE G7_Person;


DROP TABLE G7_Schedule;


DROP TABLE G7_Event;


DROP TABLE G7_Location;


DROP TABLE G7_Team;


DROP TABLE G7_League;


/*QUERIES TO CREATE TABLES AND ADD DATA*/
CREATE TABLE G7_League (
	League_ID INT NOT NULL,
	League_Name varchar (50) NOT NULL,
	League_Age_Group varchar (50) NOT NULL,
	Inactive_Reason varchar (50)

	CONSTRAINT G7_League_PK PRIMARY KEY (League_ID)
);




INSERT INTO G7_League(League_ID, League_Name, League_Age_Group, Inactive_Reason) VALUES
(1, 'Southside Baseball Crew - 10U', '10 & Under', NULL),
(2, 'Southside Baseball Crew - 11U', '11 & Under', 'Not Enough Players'),
(3, 'Southside Baseball Crew - 12U', '12 & Under', 'Not Enough Coaches'),
(4, 'Southside Baseball Crew - 13U', '13 & Under', NULL),
(5, 'Southside Baseball Crew - 14U', '14 & Under', 'League Still in Development Stage');



SELECT*
FROM G7_League;



CREATE TABLE G7_Team (
	Team_ID INT NOT NULL,
	Team_Name varchar (50) NOT NULL,
	Team_Color varchar (50) NOT NULL,
	Team_City varchar (50) NOT NULL,
	Team_State varchar (50) NOT NULL,
	Team_Zipcode INT NOT NULL,
	League_ID INT NOT NULL

	CONSTRAINT G7_Team_PK PRIMARY KEY (Team_ID),
	CONSTRAINT G7_Team_FK FOREIGN KEY (League_ID) REFERENCES G7_League (League_ID)
);



INSERT INTO G7_Team(Team_ID, Team_Name, Team_Color, Team_City, Team_State, Team_Zipcode, League_ID) VALUES
(1, 'Silver Spring Bulls', 'Orange', 'Silver Spring', 'MD', 20872, 1),
(2, 'Rockville Cardinals', 'Red', 'Rockville', 'MD', 20847, 1),
(3, 'College Park Spartans', 'Gold', 'College Park', 'MD', 20742, 1),
(4, 'Germantown Giants', 'Blue', 'Germantown', 'MD', 20874, 1),
(5, 'Gaithersburg Athletics', 'Green', 'Gaithersburg', 'MD', 20878, 4),
(6, 'Bethesda Pirates', 'Yellow', 'Bethesda', 'MD', 20810, 4),
(7, 'Clarsburg Coyotes', 'Purple', 'Clarksburg', 'MD', 26301, 4),
(8, 'Chevy Chase Diamondbacks', 'Maroon', 'Chevy Chase', 'MD', 20814, 4);



SELECT*
FROM G7_Team;



CREATE TABLE G7_Sponsor (
	Sponsor_ID INT NOT NULL,
	Sponsor_Name varchar (50) NOT NULL,
	Sponsor_Email varchar (50) NOT NULL,
	Sponsor_Street_Num INT NOT NULL,
	Sponsor_Street varchar (50) NOT NULL,
	Sponsor_City varchar (50) NOT NULL,
	Sponsor_State varchar (50) NOT NULL,
	Sponsor_Zipcode INT NOT NULL,
	Sponsor_Donation_Amount MONEY NOT NULL,
	Team_ID INT NOT NULL

	CONSTRAINT G7_Sponsor_PK PRIMARY KEY (Sponsor_ID),
	CONSTRAINT G7_Sponsor_FK FOREIGN KEY (Team_ID) REFERENCES G7_Team (Team_ID)
);



INSERT INTO G7_Sponsor(Sponsor_ID, Sponsor_Name, Sponsor_Email, Sponsor_Street_Num, 
	Sponsor_Street, Sponsor_City, Sponsor_State, Sponsor_Zipcode, Sponsor_Donation_Amount, Team_ID) VALUES
(1, 'Beskin Divers', 'beskindivers@gmail.com', 100, 'Main Street', 'Ellicott City', 'MD', 21043, 500, 1),
(2, 'Booz Allen Hamilton', 'boozallen@yahoo.com', 4295, 'Roger Way', 'Elkridge', 'MD', 20875, 350, 2),
(3, 'Lockheed Martin', 'lockheedmartin@gmail.com', 6801, 'Rockledge Drive', 'Bethesda', 'MD', 20810, 750, 3),
(4, 'Macrogenics', 'macrogenics@hotmail.com', 9640, 'Medical Center Drive', 'Rockville', 'MD', 20847, 400, 4),
(5, 'Trader Joes', 'traderjoes@yahoo.com', 12268, 'Rockville Pike', 'Rockville', 'MD', 20847, 250, 5),
(6, 'Thats Amore Grill', 'thatsamoregrill@hotmail.com', 15201, 'Shady Grove Road', 'Rockville', 'MD', 20850, 375, 6),
(7, 'James Davis Construction Corporation', 'davisconstruction@yahoo.com', 12530, 'Parklawn Drive', 
	'Rockville', 'MD', 20852, 800, 7),
(8, 'Stained Glass Pub', 'stainedglasspub@gmail.com', 12510, 'Layhill Road', 'Silver Spring', 'MD', 20906, 450, 8);



SELECT*
FROM G7_Sponsor;



CREATE TABLE G7_Location (
	Location_ID INT NOT NULL,
	Location_Name varchar(50) NOT NULL,
	Location_Street_Num INT NOT NULL,
	Location_Street varchar (50) NOT NULL,
	Location_City varchar (50) NOT NULL,
	Location_State varchar (50) NOT NULL,
	Location_Zipcode INT NOT NULL,
	Field_Num INT NOT NULL

	CONSTRAINT G7_Location_PK PRIMARY KEY (Location_ID)
);



INSERT INTO G7_Location(Location_ID, Location_Name, Location_Street_Num, Location_Street, 
	Location_City, Location_State, Location_Zipcode, Field_Num) VALUES
(1, 'Rockvile Recreation Park', 5100, 'Upper Sky Way', 'Rockville', 'MD', 20847, 3),
(2, 'College Park Baseball Grounds', 1027, 'Elm Street', 'College Park', 'MD', 20742, 1),
(3, 'College Park Baseball Grounds', 1027, 'Elm Street', 'College Park', 'MD', 20742, 2),
(4, 'Damascus High School', 25921, 'Ridge Road', 'Damascus', 'MD', 20872, 1),
(5, 'Bethesba Baseball/Softball Park', 7814, 'Fieldstone Road', 'Bethesda', 'MD', 20810, 5),
(6, 'Bethesba Baseball/Softball Park', 7814, 'Fieldstone Road', 'Bethesda', 'MD', 20810, 6),
(7, 'Bethesba Baseball/Softball Park', 7814, 'Fieldstone Road', 'Bethesda', 'MD', 20810, 7),
(8, 'Poolesville High School', 17501, 'Willard Road', 'Poolesville', 'MD', 20837, 1);



SELECT*
FROM G7_Location;



CREATE TABLE G7_Event (
	Event_ID INT NOT NULL,
	Event_Type varchar (50) NOT NULL,
	Event_Date DATE NOT NULL,
	Event_Time TIME NOT NULL,
	Location_ID INT NOT NULL

	CONSTRAINT G7_Event_PK PRIMARY KEY (Event_ID),
	CONSTRAINT G7_Event_FK FOREIGN KEY (Location_ID) REFERENCES G7_Location (Location_ID)
);



INSERT INTO G7_Event(Event_ID, Event_Type, Event_Date, Event_Time, Location_ID) VALUES
(1, 'Game', '2023-05-01', '15:30:00', 3),
(2, 'Game', '2023-05-01', '15:30:00', 5),
(3, 'Game', '2023-05-01', '18:30:00', 3),
(4, 'Game', '2023-05-01', '18:30:00', 5),
(5, 'Practice', '2023-05-03', '17:30:00', 1),
(6, 'Practice', '2023-05-03', '16:30:00', 6),
(7, 'Practice', '2023-05-04', '16:00:00', 2),
(8, 'Practice', '2023-05-04', '17:30:00', 4),
(9, 'Practice', '2023-05-05', '15:30:00', 3),
(10, 'Practice', '2023-05-05', '16:30:00', 8),
(11, 'Practice', '2023-05-06', '16:00:00', 3),
(12, 'Practice', '2023-05-06', '17:45:00', 8),
(13, 'Game', '2023-05-08', '13:30:00', 2),
(14, 'Game', '2023-05-08', '13:30:00', 7),
(15, 'Game', '2023-05-08', '16:30:00', 2),
(16, 'Game', '2023-05-08', '16:30:00', 7),
(17, 'Practice', '2023-05-09', '18:30:00', 5),
(18, 'Practice', '2023-05-09', '16:30:00', 1),
(19, 'Practice', '2023-05-10', '17:00:00', 7),
(20, 'Practice', '2023-05-10', '15:30:00', 4),
(21, 'Practice', '2023-05-11', '15:45:00', 3),
(22, 'Practice', '2023-05-11', '16:15:00', 5),
(23, 'Practice', '2023-05-12', '17:00:00', 8),
(24, 'Practice', '2023-05-12', '16:30:00', 2),
(25, 'Game', '2023-05-15', '09:30:00', 4),
(26, 'Game', '2023-05-15', '11:30:00', 6),
(27, 'Game', '2023-05-15', '12:30:00', 4),
(28, 'Game', '2023-05-15', '14:30:00', 6),
(29, 'Practice', '2023-05-16', '18:45:00', 1),
(30, 'Practice', '2023-05-16', '16:15:00', 8),
(31, 'Practice', '2023-05-18', '16:45:00', 5),
(32, 'Practice', '2023-05-18', '15:45:00', 4),
(33, 'Practice', '2023-05-19', '17:15:00', 6),
(34, 'Practice', '2023-05-19', '16:35:00', 3),
(35, 'Practice', '2023-05-20', '17:00:00', 2),
(36, 'Practice', '2023-05-21', '16:30:00', 6);



SELECT*
FROM G7_Event;



CREATE TABLE G7_Schedule (
	Event_ID INT NOT NULL,
	Team_ID INT NOT NULL,
	Event_Outcome varchar (10)

	CONSTRAINT G7_Schedule_PK PRIMARY KEY (Event_ID, Team_ID)
);


INSERT INTO G7_Schedule(Event_ID, Team_ID, Event_Outcome) VALUES
(1, 1, 'Win'),
(1, 2, 'Loss'),
(2, 3, 'Loss'),
(2, 4, 'Win'),
(3, 5, 'Win'),
(3, 6, 'Loss'),
(4, 7, 'Win'),
(4, 8, 'Loss'),
(5, 1, NULL),
(6, 2, NULL),
(7, 3, NULL),
(8, 4, NULL),
(9, 5, NULL),
(10, 6, NULL),
(11, 7, NULL),
(12, 8, NULL),
(13, 1, 'Loss'),
(13, 3, 'Win'),
(14, 2, 'Win'),
(14, 4, 'Loss'),
(15, 5, 'Win'),
(15, 7, 'Loss'),
(16, 6, 'Loss'),
(16, 8, 'Win'),
(17, 1, NULL),
(18, 2, NULL),
(19, 3, NULL),
(20, 4, NULL),
(21, 5, NULL),
(22, 6, NULL),
(23, 7, NULL),
(24, 8, NULL),
(25, 1, 'Win'),
(25, 4, 'Loss'),
(26, 2, 'Win'),
(26, 3, 'Loss'),
(27, 5, 'Win'),
(27, 8, 'Loss'),
(28, 6, 'Win'),
(28, 7, 'Loss'),
(29, 1, NULL),
(30, 2, NULL),
(31, 3, NULL),
(32, 4, NULL),
(33, 5, NULL),
(34, 6, NULL),
(35, 7, NULL),
(36, 8, NULL);



SELECT*
FROM G7_Schedule;



CREATE TABLE G7_Person (
	Person_ID INT NOT NULL,
	Person_Fname varchar (50) NOT NULL,
	Person_Lname varchar (50) NOT NULL,
	Person_Type varchar (50) NOT NULL,
	Team_ID INT NOT NULL

	CONSTRAINT G7_Person_PK PRIMARY KEY (Person_ID),
	CONSTRAINT G7_Person_FK FOREIGN KEY (Team_ID) REFERENCES G7_Team (Team_ID)
);



INSERT INTO G7_Person(Person_ID, Person_Fname, Person_Lname, Person_Type, Team_ID) VALUES
(1, 'Jake', 'Craw', 'Player', 1),
(2, 'Adam', 'Craw', 'Player', 1),
(3, 'Tom', 'Craw', 'Coach', 1),
(4, 'Joseph', 'Wofford', 'Player', 1),
(5, 'Steven', 'Wofford', 'Coach', 1),
(6, 'Peter', 'Emery', 'Player', 1),
(7, 'John', 'Chalfont', 'Player', 1),
(8, 'Nathan', 'Sweet', 'Player', 1),
(9, 'Christian', 'Sweet', 'Player', 1),
(10, 'Jack', 'Goulet', 'Player', 1),
(11, 'Jacob', 'Singleton', 'Player', 1),
(12, 'Vincent', 'Schiavoni', 'Player', 2),
(13, 'Nate', 'Schiavoni', 'Coach', 2),
(14, 'Dylan', 'Juskus', 'Player', 2),
(15, 'Andrew', 'Bielat', 'Player', 2),
(16, 'Patrick', 'Kearny', 'Player', 2),
(17, 'Chris', 'Hildreth', 'Player', 2),
(18, 'James', 'Hildreth', 'Coach', 2),
(19, 'Phil', 'Targonski', 'Player', 2),
(20, 'Neil', 'Caruso', 'Player', 2),
(21, 'Matthew', 'Von Neida', 'Player', 2),
(22, 'Leo', 'Simon', 'Player', 2),
(23, 'Liam', 'Smith', 'Player', 3),
(24, 'Noah', 'Smith', 'Coach', 3),
(25, 'Oliver', 'Johnson', 'Player', 3),
(26, 'Elijah', 'Williams', 'Player', 3),
(27, 'William', 'Brown', 'Player', 3),
(28, 'Henry', 'Brown', 'Coach', 3),
(29, 'Lucas', 'Jones', 'Player', 3),
(30, 'Ben', 'Miller', 'Player', 3),
(31, 'Theo', 'Davis', 'Player', 3),
(32, 'Mateo', 'Rodriguez', 'Player', 3),
(33, 'Daniel', 'Martinez', 'Player', 3),
(34, 'Jack', 'Anderson', 'Player', 4),
(35, 'Michael', 'Thomas', 'Player', 4),
(36, 'Alex', 'Taylor', 'Player', 4),
(37, 'Tim', 'Moore', 'Player', 4),
(38, 'Owen', 'Jackson', 'Player', 4),
(39, 'Asher', 'Jackson', 'Coach', 4),
(40, 'Sam', 'Lee', 'Player', 4),
(41, 'Ethan', 'Thompson', 'Player', 4),
(42, 'Jackson', 'White', 'Player', 4),
(43, 'Mason', 'Sanchez', 'Player', 4),
(44, 'Hudson', 'Sanchez', 'Coach', 4),
(45, 'Luca', 'Anderson', 'Player', 5),
(46, 'Aiden', 'Lee', 'Player', 5),
(47, 'David', 'Lewis', 'Player', 5),
(48, 'Logan', 'Walker', 'Player', 5),
(49, 'Luke', 'Allen', 'Player', 5),
(50, 'Brian', 'Allen', 'Coach', 5),
(51, 'Steve', 'Bennett', 'Player', 5),
(52, 'Gabriel', 'Scott', 'Player', 5),
(53, 'Wyatt', 'Torres', 'Player', 5),
(54, 'Maverick', 'Hill', 'Player', 5),
(55, 'Isaac', 'Hill', 'Coach', 5),
(56, 'Anthony', 'Green', 'Player', 6),
(57, 'Jayden', 'Baker', 'Player', 6),
(58, 'Carter', 'Hal', 'Player', 6),
(59, 'Charles', 'Hall', 'Coach', 6),
(60, 'Lincoln', 'Mitchell', 'Player', 6),
(61, 'Miles', 'Roberts', 'Player', 6),
(62, 'Kai', 'Carter', 'Player', 6),
(63, 'Josh', 'Phillips', 'Player', 6),
(64, 'Angel', 'Hernendez', 'Player', 6),
(65, 'Adrian', 'Hernendez', 'Coach', 6),
(66, 'Roman', 'Turner', 'Player', 6),
(67, 'Cameron', 'Parker', 'Player', 7),
(68, 'Nolan', 'Cruz', 'Player', 7),
(69, 'Eli', 'Cruz', 'Coach', 7),
(70, 'Ryan', 'Edwards', 'Player', 7),
(71, 'Brooks', 'Stewart', 'Player', 7),
(72, 'Axel', 'Morris', 'Player', 7),
(73, 'Walker', 'Morris', 'Coach', 7),
(74, 'Easton', 'Murphy', 'Player', 7),
(75, 'Robert', 'Ortiz', 'Player', 7),
(76, 'Landon', 'Peterson', 'Player', 7),
(77, 'Beau', 'Howard', 'Player', 7),
(78, 'Jordan', 'Cook', 'Player', 8),
(79, 'Colton', 'Reed', 'Player', 8),
(80, 'Jeremy', 'Kelly', 'Player', 8),
(81, 'Parker', 'Ward', 'Player', 8),
(82, 'Rowan', 'Chavez', 'Player', 8),
(83, 'Hunter', 'James', 'Player', 8),
(84, 'Damian', 'James', 'Coach', 8),
(85, 'Austin', 'Kibler', 'Player', 8),
(86, 'Brett', 'Kibler', 'Player', 8),
(87, 'Todd', 'Kibler', 'Coach', 8),
(88, 'Zachary', 'Cohen', 'Player', 8);



SELECT*
FROM G7_Person;



CREATE TABLE G7_Player (
	Person_ID INT NOT NULL,
	Player_Age INT NOT NULL,
	Player_Number INT NOT NULL,
	Player_Position varchar(50) NOT NULL,
	Dues_Status varchar (50) NOT NULL

	CONSTRAINT G7_Player_PK PRIMARY KEY (Person_ID),
	CONSTRAINT G7_Player_FK FOREIGN KEY (Person_ID) REFERENCES G7_Person (Person_ID)
);



INSERT INTO G7_Player(Person_ID, Player_Age, Player_Number, Player_Position, Dues_Status) VALUES
(1, 10, 7, 'Outfield/Pitcher', 'Paid'),
(2, 10, 11, 'Shortstop', 'Paid'),
(4, 10, 3, 'First Base', 'Paid'),
(6, 10, 21, 'Outfield', 'Not Paid'),
(7, 10, 33, 'Outfield', 'Paid'),
(8, 10, 14, 'Second Base', 'Paid'),
(9, 10, 8, 'Outfield/Pitcher', 'Not Paid'),
(10, 10, 4, 'Third Base', 'Not Paid'),
(11, 10, 42, 'Catcher/Pitcher', 'Not Paid'),
(12, 10, 18, 'Third Base', 'Paid'),
(14, 10, 6, 'Second Base', 'Not Paid'),
(15, 10, 1, 'First Base/Pitcher', 'Paid'),
(16, 10, 10, 'Outfield/Pitcher', 'Not Paid'),
(17, 10, 7, 'Outfield', 'Paid'),
(19, 10, 26, 'Shortstop', 'Paid'),
(20, 10, 47, 'Catcher', 'Paid'),
(21, 10, 20, 'Outfield', 'Paid'),
(22, 10, 61, 'Catcher/Pitcher', 'Not Paid'),
(23, 10, 0, 'First Base', 'Paid'),
(25, 10, 37, 'Third Base', 'Paid'),
(26, 10, 11, 'First Base/Pitcher', 'Paid'),
(27, 10, 25, 'Outfield/Pitcher', 'Not Paid'),
(29, 10, 16, 'Outfield', 'Paid'),
(30, 10, 5, 'Catcher', 'Paid'),
(31, 10, 6, 'Shortstop', 'Paid'),
(32, 10, 40, 'Second Base', 'Paid'),
(33, 10, 31, 'Outfield', 'Paid'),
(34, 10, 18, 'Second Base', 'Paid'),
(35, 10, 21, 'First Base', 'Paid'),
(36, 10, 50, 'Shortstop/Pitcher', 'Paid'),
(37, 10, 2, 'Outfield/Pitcher', 'Not Paid'),
(38, 10, 90, 'Outfield', 'Paid'),
(40, 10, 27, 'Outfield', 'Paid'),
(41, 10, 5, 'Catcher', 'Paid'),
(42, 10, 9, 'Third Base', 'Paid'),
(43, 10, 19, 'First Base/Pitcher', 'Paid'),
(45, 13, 4, 'Outfield', 'Not Paid'),
(46, 13, 33, 'Shortstop/Pitcher', 'Not Paid'),
(47, 13, 21, 'Shortstop', 'Paid'),
(48, 13, 16, 'Outfield/Pitcher', 'Not Paid'),
(49, 13, 63, 'Outfield', 'Paid'),
(51, 13, 44, 'Second Base', 'Paid'),
(52, 13, 3, 'Catcher', 'Paid'),
(53, 13, 70, 'Third Base', 'Paid'),
(54, 13, 12, 'First Base/Pitcher', 'Paid'),
(56, 13, 10, 'Shortstop', 'Paid'),
(57, 13, 31, 'First Base', 'Paid'),
(58, 13, 29, 'Outfield', 'Not Paid'),
(60, 13, 30, 'Outfield', 'Paid'),
(61, 13, 14, 'Second Base', 'Paid'),
(62, 13, 8, 'Outfield/Pitcher', 'Not Paid'),
(63, 13, 41, 'Third Base', 'Paid'),
(64, 13, 4, 'Catcher/Pitcher', 'Paid'),
(66, 13, 14, 'Catcher/Pitcher', 'Not Paid'),
(67, 13, 50, 'Second Base', 'Paid'),
(68, 13, 15, 'First Base', 'Paid'),
(70, 13, 2, 'Outfield', 'Paid'),
(71, 13, 6, 'Outfield/Pitcher', 'Paid'),
(72, 13, 7, 'Second Base/Pitcher', 'Paid'),
(74, 13, 35, 'Outfield/Pitcher', 'Not Paid'),
(75, 13, 22, 'Third Base', 'Paid'),
(76, 13, 26, 'Catcher/Pitcher', 'Paid'),
(77, 13, 1, 'Shortstop', 'Paid'),
(78, 13, 0, 'Third Base', 'Paid'),
(79, 13, 10, 'Second Base', 'Paid'),
(80, 13, 16, 'Outfield', 'Paid'),
(81, 13, 4, 'Outfield/Pitcher', 'Not Paid'),
(82, 13, 31, 'Shortstop/Pitcher', 'Paid'),
(83, 13, 17, 'Outfield', 'Not Paid'),
(85, 13, 9, 'Third Base/Pitcher', 'Paid'),
(86, 13, 2, 'Catcher', 'Paid'),
(88, 13, 14, 'First Base', 'Not Paid');



SELECT*
FROM G7_Player;



CREATE TABLE G7_Coach (
	Person_ID INT NOT NULL,
	Coach_Type varchar (50) NOT NULL,
	Coach_Training varchar (50) NOT NULL

	CONSTRAINT G7_Coach_PK PRIMARY KEY (Person_ID),
	CONSTRAINT G7_Coach_FK FOREIGN KEY (Person_ID) REFERENCES G7_Person (Person_ID)
);



INSERT INTO G7_Coach(Person_ID, Coach_Type, Coach_Training) VALUES
(3, 'Head', 'Complete'),
(5, 'Assistant', 'Complete'),
(13,'Assistant', 'Incomplete'),
(18, 'Head', 'Complete'),
(24, 'Head', 'Complete'),
(28, 'Assistant', 'Incomplete'),
(39, 'Assistant', 'Complete'),
(44, 'Head', 'Incomplete'),
(50, 'Head', 'Complete'),
(55, 'Assistant', 'Complete'),
(59, 'Assistant', 'Incomplete'),
(65, 'Head', 'Incomplete'),
(69, 'Head', 'Complete'),
(73, 'Assistant', 'Complete'),
(84, 'Assistant', 'Incomplete'),
(87, 'Head', 'Complete');



SELECT*
FROM G7_Coach;


/*BUSINESS PURPOSE QUERIES*/
/*Query A*/
SELECT G7_Person.Person_Fname, G7_Person.Person_Lname, G7_Player.Player_Age
FROM G7_Person INNER JOIN G7_Player 
ON G7_Person.Person_ID = G7_Player.Person_ID
WHERE G7_Player.Dues_Status = 'Not Paid' AND G7_Player.Player_Age BETWEEN 10 AND 12;


/*Query B*/
SELECT G7_Person.Person_Lname, G7_Team.Team_Name, G7_Team.Team_City
FROM G7_Team JOIN G7_Person 
ON G7_Team.Team_ID = G7_Person.Team_ID
JOIN G7_Coach ON G7_Person.Person_ID = G7_Coach.Person_ID
WHERE G7_Coach.Coach_Training <> 'Complete' AND G7_Coach.Coach_Type LIKE '%Assist%';





/*Query D*/
SELECT G7_Team.Team_ID,G7_Team.Team_Name, COUNT(G7_Schedule.Event_Outcome) AS 'Total Wins'
FROM G7_Team JOIN G7_Schedule
ON G7_Team.Team_ID = G7_Schedule.Team_ID
WHERE G7_Schedule.Event_Outcome = 'Win' AND G7_Team.Team_ID IN
(SELECT G7_Team.Team_ID
FROM G7_Team JOIN G7_Sponsor ON G7_Team.Team_ID = G7_Sponsor.Team_ID
WHERE G7_Sponsor.Sponsor_Donation_Amount >= 500)
GROUP BY G7_Team.Team_ID,G7_Team.Team_Name;



/*Query E*/
SELECT G7_Team.Team_Name, COUNT(G7_Schedule.Event_Outcome) AS 'Win Total'
FROM G7_Team JOIN G7_Schedule 
ON G7_Team.Team_ID = G7_Schedule.Team_ID
WHERE G7_Schedule.Event_Outcome = 'Win'
GROUP BY G7_Team.Team_Name
HAVING COUNT(G7_Schedule.Event_Outcome) >1
ORDER BY 'Win Total' DESC;


/*Query F*/
GO
CREATE TRIGGER [dbo].[Field_Delete]
ON [dbo].[G7_Location]
INSTEAD OF DELETE
AS
BEGIN
     UPDATE G7_Location
      SET Location_Name = CONCAT('CLOSED',' ' ,'-', ' ', 'Formerly:', ' ', Location_Name    
     )
      WHERE Location_ID IN (SELECT Location_ID FROM Deleted)
END

/*QUERY TO TEST TRIGGER IN QUERY F*/
DELETE FROM G7_Location WHERE Location_Name = 'Damascus High School';
SELECT * FROM G7_Location



/*Query G1*/
SELECT G7_League.League_ID, G7_League.League_Name, COUNT(G7_Event.Event_ID) AS 'Games Played'
FROM G7_League JOIN G7_Team ON G7_League.League_ID = G7_Team.League_ID
JOIN G7_Schedule ON G7_Team.Team_ID = G7_Schedule.Team_ID
JOIN G7_Event ON G7_Schedule.Event_ID = G7_Event.Event_ID
WHERE G7_Event.Event_Type = 'Game' AND G7_Event.Event_Date BETWEEN '5/1/2023' AND '5/14/2023'
GROUP BY G7_League.League_ID, G7_League.League_Name
ORDER BY 'Games Played' DESC;


/*Query G2*/
SELECT G7_Team.Team_ID, G7_Team.Team_Name, COUNT(G7_Player.Person_ID) AS 'Unpaid Players'
FROM G7_Player JOIN G7_Person ON G7_Player.Person_ID = G7_Person.Person_ID
JOIN G7_Team ON G7_Person.Team_ID = G7_Team.Team_ID
JOIN G7_Sponsor ON G7_Team.Team_ID = G7_Sponsor.Team_ID
WHERE G7_Player.Dues_Status = 'Not Paid' AND
G7_Sponsor.Sponsor_Donation_Amount >
(SELECT AVG(G7_Sponsor.Sponsor_Donation_Amount)
FROM G7_Sponsor)
GROUP BY G7_Team.Team_ID, G7_Team.Team_Name
ORDER BY 'Unpaid Players' DESC;
