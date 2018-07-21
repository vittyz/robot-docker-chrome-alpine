#!/usr/bin/env bash

cd `dirname $0`

rm -fr occ_result/*

build=$1
round=1
result=1
while  [ $round -lt 5  ]; do


  if [ $round != "1" ]
  then
     rerun="--rerunfailed /out/output.xml --output output$round.xml"
  fi

  echo "Run Round #"$round
  echo $rerun
  echo " "

  docker run --rm -t --network=general \
     --name="robot_occ_$build" \
     -v "$(pwd)":/tests \
     -v "$(pwd)/occ_result":/out \
      robot-framework-alpine \
     -V /tests/conf/test.yaml -e success  \
     -d /out $rerun "tests/test_*.robot" 

  result=$?
  round=$(( $round + 1 ))

  if [ $result = 0 ] 
  then
     exit 0
  fi
done


echo #Merge Output


  docker run --rm --network=general \
     -v "$(pwd)":/tests \
     -v "$(pwd)/occ_result":/out \
      robot-framework-alpine \
      rebot --merge -d /out  /out/output*.xml 




