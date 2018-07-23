#!/usr/bin/env bash

cd `dirname $0`

#rm occ_result/*

export round=$1

if [ $round != "" ]
then

   $rerun="--rerunfailed /out/output.xml --output output$round.xml"

fi

docker run --rm -t --network=general \
   -v "$(pwd)":/tests \
   -v "$(pwd)/occ_result":/out \
    robot-framework \
   -V /tests/conf/test.yaml -e success  \
   -d /out "tests/test_*.robot" 


