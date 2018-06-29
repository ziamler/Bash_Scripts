#!/bin/bash

DT=`date +%d-%m-%Y-%H:%M`
hostname=`hostname`
SPACE=`df -h | grep -i /data | head -1 | awk {'print $5'} | cut -d '%' -f1`
if [ $SPACE -ge 80 ]; then

AKA=/data/home/akamai
cd $AKA
find . -name "*.gz" -mtime +3 -delete

PUSH=/data/home/dapshare/crm/push_devices_merge
cd $PUSH
find . -name "*.csv" -mtime +4 -delete

PUSH1=/data/home/bob/Customer
cd $PUSH1
find . -name "*.csv" -mtime +10 -delete

PUSH2=/data/home/bob/Orderexport
cd $PUSH2
find . -name "*.zip" -mtime +60 -delete

fi
