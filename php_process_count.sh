#/bin/bash
count=`ps -ef | grep php-fpm | wc -l`
if [ $count -ge 200 ]; then
  echo "PHP Process Count on `hostname` is $count" | mutt -s "Alert: PHP Process Count is Critical on `hostname`" -- sysad.india@jabong.com noc.india@jabong.com
fi
