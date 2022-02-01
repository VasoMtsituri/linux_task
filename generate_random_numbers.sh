#!/bin/bash
# TODO: Need to know flags and their meanings
# bash script, which generates 10 random numbers within range (1,50)

random() {
  local range=${1:-1}

  RAND=$(od -t uI -N 4 /dev/urandom | awk '{print $2}')
  let "RAND=$RAND%($range+1)"
}

NAME=()
i=0
len=${#NAME[@]}
PREVIOUS_NUMBER=-1

while [ $len != 10 ]
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

for n in "${NAME[@]}"
do
  echo $n
done
