CREATE DATABASE worldcup;

CREATE TABLE teams(
team_id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE games(
game_id SERIAL PRIMARY KEY NOT NULL,
year INT NOT NULL,
round VARCHAR(50) NOT NULL,
winner_id INT REFERENCES teams(team_id),
opponent_id INT REFERENCES teams(team_id) NOT NULL,
winner_goals INT NOT NULL,
opponent_goals INT NOT NULL);

ALTER TABLE games ALTER COLUMN winner_id SET NOT NULL;
SELECT SUM(winner_goals) + SUM(opponent_goals) AS total FROM games;
SELECT AVG(winner_goals) FROM games;
SELECT ROUND(AVG(winner_goals),2) FROM games;
SELECT AVG(winner_goals) + AVG(opponent_goals) FROM games;
SELECT MAX(winner_goals) FROM games;
SELECT COUNT(game_id) FROM games WHERE winner_goals > 2;
SELECT name FROM games FULL JOIN teams ON games.winner_id=teams.team_id WHERE year = 2018 AND round='Final';
SELECT name FROM games FULL JOIN teams ON games.winner_id=teams.team_id OR games.opponent_id=teams.team_id WHERE round='Eighth-Final' AND year = 2014;
SELECT DISTINCT(name) FROM teams RIGHT JOIN games ON teams.team_id=games.winner_id ORDER BY name;
SELECT year, name FROM teams RIGHT JOIN games ON teams.team_id=games.winner_id WHERE round='Final' ORDER BY year;
SELECT name FROM teams WHERE name ILIKE 'Co%';
