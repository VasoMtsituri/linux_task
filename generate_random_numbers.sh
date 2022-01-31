#!/bin/bash
# TODO: Need to know flags and their meanings
# bash script, which generates 10 random numbers within range (1,50)

random() {
  local range=${1:-1}

  RAND=$(od -t uI -N 4 /dev/urandom | awk '{print $2}')
  let "RAND=$RAND%($range+1)"
}

n=10
while [ $((n -= 1)) -ge "0" ]; do
  random 50
  echo "$RAND"
done
