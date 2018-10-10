#!/usr/bin/env bash

cd `dirname $0`

rm -fr occ_result/*

build=$1
round=1
result=1

filetest=$2

mode=$3

export filetest=${filetest:-all}
export mode=${mode:-all}

if [ $filetest = "all" ]
then 
  file="test_*.robot"
  dock="all"
else
  file=$filetest
  dock=${file/".robot"/}

fi 

if [ $mode = "mnp_fail_only" ]
then
  extra=" -e success"
fi

while  [ $round -lt 7 ]; do


  if [ $round != "1" ]
  then
     lastround=$(( $round - 1 ))
     rerun="--rerunfailed /out/output$lastround.xml"
  fi

  echo "Run Round #"$round
  echo $rerun
  echo " "

  
  docker run --rm -t --network=general \
     --name="bot_occ_"$dock"_"$build"_r"$round \
     --shm-size=4g \
     -v "$(pwd)":/tests \
     -v "$(pwd)/occ_result":/out \
     -e SCREEN_WIDTH=1280 -e SCREEN_HEIGHT=720 \
      robot-framework-alpine \
     -V /tests/conf/test.yaml  \
     $extra -d /out $rerun  --output output$round.xml "/tests/"$file

  result=$?
  round=$(( $round + 1 ))

  echo ""
  echo "Result : "$result
  echo ""
  if [ $result = 0 ] 
  then
     break 
  fi
done

result=$?

ls -al 

echo #Merge Output


docker run --rm --network=general \
     --shm-size=2g \
     -v "$(pwd)":/tests \
     -v "$(pwd)/occ_result":/out \
      robot-framework-alpine \
      rebot --merge --output /out/output.xml  /out/output*.xml 

#echo #Clear other outputs
#mv occ_result/output.xml occ_result/o.xml
#rm -f /occ_result/output*.xml
#mv occ_result/o.xml occ_result/output.xml

echo "List Output"
ls -al occ_result

exit $result

