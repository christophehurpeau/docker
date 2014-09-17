#!/bin/sh
ls /opt/zimbra/installed-by-docker || (
    chown zimbra. /opt/zimbra || exit 1
    rsync --delete -auEAv /opt/.zimbra/ /opt/zimbra/ || exit 1
    mv /tmp/zcs/config.install /opt/zimbra/config.install || exit 1
    /opt/zimbra/libexec/zmsetup.pl -d -c /opt/zimbra/config.install || exit 1
    touch /opt/zimbra/installed-by-docker || exit 1
)

rm -rf /opt/.zimbra
rm -rf /tmp/zcs

echo '' >> /etc/hosts
echo '127.0.0.1 ' `hostname -f` >> /etc/hosts
echo '127.0.0.1 ' `cat /opt/zimbra/config.install | head -1 | cut -c10-` >> /etc/hosts
