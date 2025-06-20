# This is one of the required projects to earn your certification. For this project, you will create a Bash script that enters information from World Cup games into PostgreSQL, then query the database for useful statistics.
<!-- Instructions
Follow the instructions and get all the user stories below to pass to finish the project.

You start with several files, one of them is games.csv. It contains a comma-separated list of all games of the final three rounds of the World Cup tournament since 2014; the titles are at the top. It includes the year of each game, the round of the game, the winner, their opponent, and the number of goals each team scored. You need to do three things for this project:

Part 1: Create the database

Log into the psql interactive terminal with psql --username=freecodecamp --dbname=postgres and create your database structure according to the user stories below.

Don't forget to connect to the database after you create it.

Part 2: Insert the data

Complete the insert_data.sh script to correctly insert all the data from games.csv into the database. The file is started for you. Do not modify any of the code you start with. Using the PSQL variable defined, you can make database queries like this: $($PSQL "<query_here>"). The tests have a 20 second limit, so try to make your script efficient. The less you have to query the database, the faster it will be. You can empty the rows in the tables of your database with TRUNCATE TABLE games, teams;

Part 3: Query the database

Complete the empty echo commands in the queries.sh file to produce output that matches the expected_output.txt file. The file has some starter code, and the first query is completed for you. Use the PSQL variable defined to complete rest of the queries. Note that you need to have your database filled with the correct data from the script to get the correct results from your queries. Hint: Test your queries in the psql prompt first and then add them to the script file.

Notes:
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql in a bash terminal (not the psql one). It will save the commands to rebuild your database in worldcup.sql. The file will be located where the command was entered. If it's anything inside the project folder, the file will be saved in the VM. You can rebuild the database by entering psql -U postgres < worldcup.sql in a terminal where the .sql file is.

If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the worldcup.sql file, as well as the final version of your insert_data.sh and queries.sh files, in a public repository and submit the URL to it on freeCodeCamp.org.

Complete the tasks below

You should create a database named worldcup

You should connect to your worldcup database and then create teams and games tables

Your teams table should have a team_id column that is a type of SERIAL and is the primary key, and a name column that has to be UNIQUE

Your games table should have a game_id column that is a type of SERIAL and is the primary key, a year column of type INT, and a round column of type VARCHAR

Your games table should have winner_id and opponent_id foreign key columns that each reference team_id from the teams table

Your games table should have winner_goals and opponent_goals columns that are type INT

All of your columns should have the NOT NULL constraint

Your two script (.sh) files should have executable permissions. Other tests involving these two files will fail until permissions are correct. When these permissions are enabled, the tests will take significantly longer to run

When you run your insert_data.sh script, it should add each unique team to the teams table. There should be 24 rows

When you run your insert_data.sh script, it should insert a row for each line in the games.csv file (other than the top line of the file). There should be 32 rows. Each row should have every column filled in with the appropriate info. Make sure to add the correct ID's from the teams table (you cannot hard-code the values)

You should correctly complete the queries in the queries.sh file. Fill in each empty echo command to get the output of what is suggested with the command above it. Only use a single line like the first query. The output should match what is in the expected_output.txt file exactly, take note of the number of decimal places in some of the query results -->
CREATE DATABASE worldcup;
\c worldcup
CREATE TABLE teams(
team_id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE games(
game_id SERIAL PRIMARY KEY NOT NULL,
(> year INT NOT NULL,
(> round VARCHAR(50) NOT NULL,
(> winner_id INT REFERENCES teams(team_id),
(> opponent_id INT REFERENCES teams(team_id) NOT NULL,
(> winner_goals INT NOT NULL,
(> opponent_goals INT NOT NULL);

ALTER TABLE games ALTER COLUMN winner_id SET NOT NULL;
chmod +x insert_data.sh
chmod +x queries.sh
pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql


SELECT*FROM teams;
 <!-- 
 team_id |     name      
---------+---------------
     317 | France
     318 | Croatia
     319 | Belgium
     320 | England
     321 | Russia
     322 | Sweden
     323 | Brazil
     324 | Uruguay
     325 | Colombia
     326 | Switzerland
     327 | Japan
     328 | Mexico
     329 | Denmark
     330 | Spain
     331 | Portugal
     332 | Argentina
     333 | Germany
     334 | Netherlands
     335 | Costa Rica
     336 | Chile
     337 | Nigeria
     338 | Algeria
     339 | Greece
     340 | United States
(24 rows) -->



SELECT*FROM games;
 <!-- 
 game_id | year |     round     | winner_id | opponent_id | winner_goals | opponent_goals 
---------+------+---------------+-----------+-------------+--------------+----------------
      31 | 2018 | Final         |       317 |         318 |            4 |              2
      32 | 2018 | Third Place   |       319 |         320 |            2 |              0
      33 | 2018 | Semi-Final    |       318 |         320 |            2 |              1
      34 | 2018 | Semi-Final    |       317 |         319 |            1 |              0
      35 | 2018 | Quarter-Final |       318 |         321 |            3 |              2
      36 | 2018 | Quarter-Final |       320 |         322 |            2 |              0
      37 | 2018 | Quarter-Final |       319 |         323 |            2 |              1
      38 | 2018 | Quarter-Final |       317 |         324 |            2 |              0
      39 | 2018 | Eighth-Final  |       320 |         325 |            2 |              1
      40 | 2018 | Eighth-Final  |       322 |         326 |            1 |              0
      41 | 2018 | Eighth-Final  |       319 |         327 |            3 |              2
      42 | 2018 | Eighth-Final  |       323 |         328 |            2 |              0
      43 | 2018 | Eighth-Final  |       318 |         329 |            2 |              1
      44 | 2018 | Eighth-Final  |       321 |         330 |            2 |              1
      45 | 2018 | Eighth-Final  |       324 |         331 |            2 |              1
      46 | 2018 | Eighth-Final  |       317 |         332 |            4 |              3
      47 | 2014 | Final         |       333 |         332 |            1 |              0
      48 | 2014 | Third Place   |       334 |         323 |            3 |              0
      49 | 2014 | Semi-Final    |       332 |         334 |            1 |              0
      50 | 2014 | Semi-Final    |       333 |         323 |            7 |              1
      51 | 2014 | Quarter-Final |       334 |         335 |            1 |              0
      52 | 2014 | Quarter-Final |       332 |         319 |            1 |              0
      53 | 2014 | Quarter-Final |       323 |         325 |            2 |              1
      54 | 2014 | Quarter-Final |       333 |         317 |            1 |              0
      55 | 2014 | Eighth-Final  |       323 |         336 |            2 |              1
      56 | 2014 | Eighth-Final  |       325 |         324 |            2 |              0
      57 | 2014 | Eighth-Final  |       317 |         337 |            2 |              0
      58 | 2014 | Eighth-Final  |       333 |         338 |            2 |              1
      59 | 2014 | Eighth-Final  |       334 |         328 |            2 |              1
      60 | 2014 | Eighth-Final  |       335 |         339 |            2 |              1
      61 | 2014 | Eighth-Final  |       332 |         326 |            1 |              0
      62 | 2014 | Eighth-Final  |       319 |         340 |            2 |              1
(32 rows) -->
SELECT SUM(winner_goals) + SUM(opponent_goals) AS total FROM games;
 <!-- 
 total 
-------
    90
(1 row) -->
SELECT AVG(winner_goals) FROM games;
        <!-- 
        avg         
--------------------
 2.1250000000000000
(1 row) -->
SELECT ROUND(AVG(winner_goals),2) FROM games;
 <!--
  round 
-------
  2.13
(1 row) -->
SELECT AVG(winner_goals) + AVG(opponent_goals) FROM games;
<!-- 
?column?        
------------------------
 2.81250000000000000000
(1 row) -->
SELECT MAX(winner_goals) FROM games;
 <!-- 
 max 
-----
   7
(1 row) -->
SELECT COUNT(game_id) FROM games WHERE winner_goals > 2;
 <!--
  count 
-------
     6
(1 row) -->
SELECT name FROM games FULL JOIN teams ON games.winner_id=teams.team_id WHERE year = 2018 AND round='Final';
  <!-- 
  name  
--------
 France
(1 row) -->
SELECT name FROM games FULL JOIN teams ON games.winner_id=teams.team_id OR games.opponent_id=teams.team_id WHERE round='Eighth-Final' AND year = 2014;
<!-- 
name      
---------------
 Brazil
 Chile
 Uruguay
 Colombia
 France
 Nigeria
 Germany
 Algeria
 Mexico
 Netherlands
 Costa Rica
 Greece
 Switzerland
 Argentina
 Belgium
 United States
 (16 rows) -->
SELECT DISTINCT(name) FROM teams RIGHT JOIN games ON teams.team_id=games.winner_id ORDER BY name;
<!-- 
  name     
-------------
 Argentina
 Belgium
 Brazil
 Colombia
 Costa Rica
 Croatia
 England
 France
 Germany
 Netherlands
 Russia
 Sweden
 Uruguay
(13 rows) -->
SELECT year, name FROM teams RIGHT JOIN games ON teams.team_id=games.winner_id WHERE round='Final' ORDER BY year;
 <!-- year |  name   
------+---------
 2014 | Germany
 2018 | France
(2 rows) -->
SELECT name FROM teams WHERE name ILIKE 'Co%';
    name    
------------
 Colombia
 Costa Rica
(2 rows) 

./queries.sh

Total number of goals in all games from winning teams:
68

Total number of goals in all games from both teams combined:
90

Average number of goals in all games from the winning teams:
2.1250000000000000

Average number of goals in all games from the winning teams rounded to two decimal places:
2.13

Average number of goals in all games from both teams:
2.8125000000000000

Most goals scored in a single game by one team:
7

Number of games where the winning team scored more than two goals:
6

Winner of the 2018 tournament team name:
France

List of teams who played in the 2014 'Eighth-Final' round:
Algeria Argentina Belgium Brazil Chile Colombia Costa Rica France Germany Greece Mexico Netherlands Nigeria Switzerland United States Uruguay

List of unique winning team names in the whole data set:
Argentina Belgium Brazil Colombia Costa Rica Croatia England France Germany Netherlands Russia Sweden Uruguay

Year and team name of all the champions:
2014|Germany 2018|France

List of teams that start with 'Co':
Colombia Costa Rica
