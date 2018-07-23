#!/bin/sh

GEOMETRY="${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_DEPTH}"
Xvfb :99 -screen 0 $GEOMETRY &
export DISPLAY=:99

if [ $1 = "sh" ]
then
   sh
   exit 0;
fi

if [ $1 = "rebot" ]
then
   echo "REBOT"
   "$@"
#   cp *.html /out
else
   pybot "$@"
fi 

exitcode=$?
echo $exitcode > /out/result_status

chmod -R 777 /out
exit $exitcode





