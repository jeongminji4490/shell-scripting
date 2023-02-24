#!/bin/bash

# Text Style
TEXT_BOLD=$(tput bold)
TEXT_NORMAL=$(tput sgr0)
TEXT_COLOR_BLUE='\033[0;34m'
TEXT_COLOR_BLACK='\033[0;30m'

function returnInput {
  echo "✊🖐️👈 ${TEXT_BOLD}${TEXT_COLOR_BLUE}Rock Paper Scissors${TEXT_COLOR_BLACK} ✊🖐️👈"
  read -p "Enter what you'd like to do: " INPUT
  case $INPUT in
    Rock|rock|R|r)
      INPUT="Rock"
      ;;
    Paper|paper|P|p)
      INPUT="Paper"
      ;;
    Scissors|scissors|S|s)
      INPUT="Scissors"
      ;;
    *)
      INPUT="null"
      ;;
  esac
}

returnInput
while true; do
  if [ $INPUT != "null" ];then
    break
  else
    echo "${TEXT_BOLD}Please enter a valid input!"
    returnInput
  fi
done
    
echo "You did $INPUT"

ARRAY=("Rock" "Paper" "Scissors")

RANDOM_VALUE=${ARRAY[ $RANDOM % ${#ARRAY[@]} ]}
echo "Program did ${TEXT_BOLD}$RANDOM_VALUE${TEXT_NORMAL}"

if [ $RANDOM_VALUE = "Rock" ];then
  case $INPUT in
    Rock)
      echo "${TEXT_BOLD}This game ended in a tie 😎"
      ;;
    Paper)
      echo "${TEXT_BOLD}You are winner 😁"
      ;;
    Scissors)
      echo "${TEXT_BOLD}You are loser 🤣"
      ;;
  esac
elif [ $RANDOM_VALUE = "Paper" ];then
  case $INPUT in
    Rock)
      echo "${TEXT_BOLD}You are loser 🤣"
      ;;
    Paper)
      echo "${TEXT_BOLD}This game ended in a tie 😎"
      ;;
    Scissors)
      echo "${TEXT_BOLD}You are winner :-D"
      ;;
  esac
else 
  case $INPUT in
    Rock)
      echo "${TEXT_BOLD}You are winner 😁"
      ;;
    Paper)
      echo "${TEXT_BOLD}You are loser 🤣"
      ;;
    Scissors)
      echo "${TEXT_BOLD}This game ended in a tie 😎"
      ;;
  esac
fi
