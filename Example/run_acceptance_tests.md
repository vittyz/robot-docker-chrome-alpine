#!/usr/bin/env bash

cd `dirname $0`

docker run --rm -t --network=general \
   -v "$(pwd)":/tests \
   -v "$(pwd)/occ_result":/out \
    robot-framework \
   -V /tests/conf/test.yaml -e success  \
   -d /out "tests/test_*.robot" 


