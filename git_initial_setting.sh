#!/bin/bash

cd "YOUR DIRECTORY PATH"

git init
echo "git init..."

printf "Enter your git repository url: "
read REPO
git remote add origin $REPO

printf "Enter your git id: "
read GITHUB_ID
git config user.name $GITHUB_ID

printf "Enter your git email: "
read GITHUB_EMAIL
git config user.email $GITHUB_EMAIL

echo "Select options"
echo "If you want to add all files, enter '1'"
echo "if you want to add specific files, enter '2'"
printf "Enter: "
read ADD_TYPE

if [ $(value) -eq 1 ];then
  git add .
else 
  git status
  echo ""
  read -p "Enter files what you want to add in one line: " file
  git add $file
fi

git branch -M main

printf "Enter your commit message: "
read COMMIT_MESSAGE
git commit -m $COMMIT_MESSAGE

git push -u origin main

