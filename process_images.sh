#!/bin/bash

# This requires ImageMagick
# Install ImageMagick -> brew install imagemagick (MacOS)

TEXT_BOLD=$(tput bold)
TEXT_NORMAL=$(tput sgr0)

echo "${TEXT_BOLD}=====Image list=====${TEXT_NORMAL}"
find . -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif"
echo ""

read -p "Select Image: " IMAGE_FILE

if find . -name $IMAGE_FILE -print -quit | grep -q "." ; then
  echo "Okay"
else
  echo "File Not Found"
  exit 1
fi

echo ""

function processingImage {
  echo "Convert Image Format : 1"
  echo "Resize Image : 2"
  echo "Rotate Image : 3"
  echo "Quit the program : 4"
  echo ""
  read -p "${TEXT_BOLD}Enter what you'd like to do: ${TEXT_NORMAL}" INPUT

  case $INPUT in
    1)
      read -p "Enter format(jpg, png, gif) what you want to change: " FORMAT
      REMOVE_EXTENSION=${IMAGE_FILE%.*}
      echo $REMOVE_EXTENSION
      NEW_IMAGE_FILE=$REMOVE_EXTENSION"."$FORMAT
      convert $IMAGE_FILE $NEW_IMAGE_FILE
      ;;
    2)
      read -p "Enter width size: " WIDTH
      read -p "Enter height size: " HEIGHT
      convert $IMAGE_FILE -resize $WIDTHx$HEIGHT $IMAGE_FILE
      ;;
    3)
      read -p "Enter degrees: " DEGREES
      convert $IMAGE_FILE -rotate $DEGREES $IMAGE_FILE
      ;;
    4)
      echo "Bye"
      exit 1
      ;;
    *)
      INPUT="null"
      ;;
  esac
}

processingImage

while true; do
  if [ $INPUT != null ]; then
    break
  else
    echo "${TEXT_BOLD}Please enter a valid input!${TEXT_NORMAL}"
    echo ""
    processingImage
  fi
done
