#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(((RANDOM % 1000) + 1))

echo "Enter your username:" 
read USERNAME

USER_EXIST=$($PSQL "SELECT * FROM usersinfo WHERE username = '$USERNAME'")
GAMES_PLAYED=$(echo $USER_EXIST | awk -F'|' '{print $3}')
BEST_GAME=$(echo $USER_EXIST | awk -F'|' '{print $4}')

if [[ -z $USER_EXIST ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

NUMBER_OF_TRIES=0
echo "Guess the secret number between 1 and 1000: " 
read NUMBER_GUSSED
while true
do
  ((NUMBER_OF_TRIES++))
  if [[ ! $NUMBER_GUSSED =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:" 
    read NUMBER_GUSSED
  elif [[ $RANDOM_NUMBER -lt $NUMBER_GUSSED ]]
  then 
    echo "It's lower than that, guess again:" 
    read NUMBER_GUSSED
  elif [[ $RANDOM_NUMBER -gt $NUMBER_GUSSED ]]
  then
    echo "It's higher than that, guess again:" 
    read NUMBER_GUSSED
  elif [[ $RANDOM_NUMBER -eq $NUMBER_GUSSED ]]
  then
    echo "You guessed it in $NUMBER_OF_TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    break
  fi
done

if [[ -z $BEST_GAME ]] || [[ $NUMBER_OF_TRIES -lt $BEST_GAME ]]
then 
  BEST_GAME=$NUMBER_OF_TRIES
fi

if [[ -z $USER_EXIST ]]
then
  UPDATE_DATE=$($PSQL "INSERT INTO usersinfo (username, games_played, best_game) VALUES ('$USERNAME', 1, $BEST_GAME)")
else
  ((GAMES_PLAYED++))
  UPDATE_DATE=$($PSQL "UPDATE usersinfo SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username = '$USERNAME'")
fi
