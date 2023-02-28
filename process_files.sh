
#!/bin/bash

read -p "Enter the file name what you want to search: " FILE_NAME
FILE_NAME_FOR_SEARCH="${FILE_NAME}*"

echo "\n"

echo "========FILE LIST========"
find . -name $FILE_NAME_FOR_SEARCH

echo "\n"

read -p "Enter the file name what you want to work: " FILE_NAME

echo "========================="

echo "\n"
echo "A: View file content"
echo "B: Change file name"
echo "C: Modify file content"
echo "\n"

read -p "What do you want?" VAR

case $VAR in
  "A")
    cat $FILE_NAME
    ;;
  "B")
    read -p "Enter the new file name: " NEW_FILE_NAME
    mv $FILE_NAME $NEW_FILE_NAME
    ;;
  "C")
    vim $FILE_NAME
    ;;
  *)
    echo "Invalid Input!"
    ;;
esac
