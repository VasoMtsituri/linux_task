#!/bin/bash

# Take commandline arguments as flags and declare properly
while getopts n:m: flag
do
    case "${flag}" in
        n) n_numbers=${OPTARG};;
        m) mode=${OPTARG};;
    esac
done

# function used to generate random number in range (0, n) inclusively
random() {
  local range=${1:-1}

  RAND=$(od -t uI -N 4 /dev/urandom | awk '{print $2}')
  let "RAND=$RAND%($range+1)"
}

# Declare some variables we will use then properly
NUMBERS=()
i=0
len=${#NUMBERS[@]}

# generate n unique random numbers given by random function; $1 is parsed argument denoting number of random number
# we want to generate
while [ "$len" != "$n_numbers" ]
do
  random 50

  already_have=0

  for num in ${NUMBERS[*]}
  do
    if [ "$num" == "$RAND" ]
    then
      already_have=1
    fi

  done

  if [ $already_have != 1 ]
  then
    NUMBERS[$i]=$RAND
    let i+=1
    let len+=1
  fi
done

#Checking mode in order to run program flow properly
if [ "$mode" == 1 ]
then
  for n in "${NUMBERS[@]}"
do
  echo $n
done
elif [ "$mode" == 2 ]
then
   for n in "${NUMBERS[@]}"
do
  echo $n >> numbers.txt
done
  date '+%Y/%m/%d %H:%M:%S' >> numbers.txt
else
  echo "mode isn't properly set"
fi
