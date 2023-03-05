#!/bin/bash

echo ""
read -p "Set timer (seconds): " TIMER

for (( i=$TIMER; i>0; i--)); do
  sleep 1 &
  printf "  $i \r"
  wait
done

echo "DONE"
