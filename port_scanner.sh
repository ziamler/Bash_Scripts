#!/bin/bash
filename=$1
while read ip
do
echo “*** TCP Ports Opened on $ip ***”
nmap -p- -Pn $ip -T5 | sed  -e ‘1d’ | sed  -e ‘1d’ | sed  -e ‘1d’ | sed  -e ‘1d’ | sed  -e ‘1d’ | grep -v Nmap | grep -v closed
echo “*** UDP Ports Opened on $ip ***”
nmap -p- -sU $ip -T5 | sed  -e ‘1d’ | sed  -e ‘1d’ | sed  -e ‘1d’ | sed  -e ‘1d’ | sed  -e ‘1d’ | grep -v Nmap | grep -v closed
echo “......................................”
echo
done < $filename
echo “Attached are the Open Ports for E2E Staging” | mutt -s “Open Ports for E2E Staging” -a /tmp/E2E_Stg_Port_Scan.txt  -- khushal.bisht@live.com < /dev/null
cp -a /tmp/E2E_Stg_Port_Scan.txt /tmp/E2E_Stg_Port_Scan_$(date +“%m%d%y”).txt


===========use in crontab like this======

00 07 * * 7 ./port_scanner.sh prod_ip > /tmp/Prod_Port_Scan.txt
