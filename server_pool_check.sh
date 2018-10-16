#!/bin/bash
/usr/sbin/jtop > /tmp/jtop
count_internal=`cat /tmp/jtop | awk {'print $7'} | grep 'MOBAPI_' | grep 'MOBAPI_INT' | wc -l`
count_old=`cat /tmp/jtop | awk {'print $7'} | grep 'MOBAPI_' | grep 'MOBAPI_OLD' | wc -l`
if [ $count_internal -lt 4 ]; then
   echo "There are only $count_internal servers are in the mobapi pool! Please check on priority" | mutt -s " Mobapi server pool check alert" -- sysad.india@jabong.com
elif [ $count_old -lt 1 ]; then
echo "ok"
#   echo "There are only $count_old servers are in the pool! Please check on priority" | mutt -s "Mobapi servers pool check alert" -- sysad.india@jabong.com
fi
