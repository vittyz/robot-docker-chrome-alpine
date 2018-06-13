#!/bin/sh

GEOMETRY="${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_DEPTH}"
Xvfb :99 -screen 0 $GEOMETRY &
export DISPLAY=:99

pybot "$@"

exitcode=$?
echo $exitcode > /out/result_status

chmod -R 777 /out
exit $exitcode

