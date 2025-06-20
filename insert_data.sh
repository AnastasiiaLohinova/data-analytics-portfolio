#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "TRUNCATE teams, games;"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != year ]]
then
# get team_id_win
TEAM_ID_WIN=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
# if not found
if [[ -z $TEAM_ID_WIN ]]
then
# insert name_win
INSERT_NAME_WIN_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
echo "Inserted into teams: $WINNER"
TEAM_ID_WIN=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
fi
TEAM_ID_OPP=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
if [[ -z $TEAM_ID_OPP ]]
then
# insert name_opp
INSERT_NAME_OPP_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
echo "Inserted into teams: $OPPONENT"
fi
TEAM_ID_OPP=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
 # insert game_id
$PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID_WIN, $TEAM_ID_OPP, $WINNER_GOALS, $OPPONENT_GOALS);"
echo "Inserted into games: $YEAR $ROUND $WINNER $OPPONENT"
fi
done