#!/bin/sh
su -c "/opt/zimbra/bin/zmcontrol start" zimbra

tail -f /var/log/zimbra.log

trap "su -c \"/opt/zimbra/bin/zmcontrol stop\" zimbra" SIGINT SIGTERM EXIT
