#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clears any leftover data in tables to make sure they're clean
echo $($PSQL "TRUNCATE games, teams")

# Import data to tables
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]] #checks that we're not on the header row
  then
    # Teams first since I'll create the WINNER_ID and OPPONENT_ID variables with the ID that gets set for the games table
    # Need to check both Winners and Opponents since it's possible to have a team that never wins or never loses
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER == "INSERT 0 1" ]]
      then echo Inserted $WINNER into teams table
      fi
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi
  
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
      then echo Inserted $OPPONENT into teams table
      fi
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi

    # Games
    INSERT_GAME=$($PSQL "
      INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
      VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
      if [[ $INSERT_GAME == "INSERT 0 1" ]]
      then echo Game inserted successfully
      fi
  fi
done
    
