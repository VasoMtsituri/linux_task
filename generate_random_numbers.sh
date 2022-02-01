#!/bin/bash

# function used to generate random number in range (0, n) inclusively
random() {
  local range=${1:-1}

  RAND=$(od -t uI -N 4 /dev/urandom | awk '{print $2}')
  let "RAND=$RAND%($range+1)"
}

# Declare some variables we will use then properly
NAME=()
i=0
len=${#NAME[@]}
PREVIOUS_NUMBER=-1

# generate n unique random numbers given by random function; $1 is parsed argument denoting number of random number
# we want to generate
while [ $len != $1 ]
do
  random 50
  if [ $PREVIOUS_NUMBER != $RAND ]
  then
    NAME[$i]=$RAND
    PREVIOUS_NUMBER=$RAND
    let i+=1
    let len+=1
  fi
done

#Checking mode in order to run program flow properly
if [ $2 == 1 ]
then
  for n in "${NAME[@]}"
do
  echo $n
done
elif [ $2 == 2 ]
then
   for n in "${NAME[@]}"
do
  echo $n >> numbers.txt
done
  echo date '+%Y/%m/%d %H:%M:%S' >> numbers.txt
else
  echo "mode isn't properly set"
fi
