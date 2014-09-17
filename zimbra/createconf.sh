#!/bin/sh

cp -f config.defaults config.install

hostname=''
defaultHostname=`cat /etc/hostname`
while [ "$hostname" = "" ]
do
    read -p "Please provide hostname: [$defaultHostname] " hostname
    if [ "$hostname" = "" ]; then hostname=$defaultHostname; fi
done

password=''
while [ "$password" = "" ]
do
    read -p "Please provide password: " password
done

sed -i "s/XHOSTNAMEX/$hostname/" config.install
sed -i "s/XPASSWORDADMINX/$password/" config.install
sed -i "s/XPASSWORDX/`date +%N | sha1sum | cut -c-8`/" config.install
sed -i "s/XPASSWORD2X/`date +%N | sha1sum | cut -c-8`/" config.install
sed -i "s/XRANDOMX/`date +%N | sha1sum | cut -c-8`/" config.install
sed -i "s/XRANDOM2X/`date +%N | sha1sum | cut -c-8`/" config.install
sed -i "s/XRANDOM3X/`date +%N | sha1sum | cut -c-8`/" config.install
sed -i "s/XRANDOMPASSWORDX/`date +%N | sha1sum | cut -c-8`/" config.install
