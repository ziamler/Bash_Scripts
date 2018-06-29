!/bin/bash

#### This script is used to clean logs more than n days older from server ####

echo "reding IP address..." >/tmp/clean_space.sh

for i in `cat discovery.txt`
do
        ssh $i 'bash -s' << EOL
        echo "logged in to server $i" >>/tmp/clean_space.sh
        echo "Now going to clean logs from $i"  >>/tmp/clean_space.sh

########find /var/log/reincarnation/ -type f -mtime +12 -name 'reincarnation.log.*' -delete
        find /var/log/discovery/ -type f -mtime +9 -name 'search-api*' -delete
        find /var/log/discovery/ -type f -mtime +9 -name 'discovery-api*' -delete

EOL

done
