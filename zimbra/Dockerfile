FROM docker.hurpeau.com/base
MAINTAINER Christophe Hurpeau <christophe@hurpeau.com>

# http://pawankumar83.wordpress.com/2010/09/20/automating-zimbra-installs/
# https://github.com/ecc12/docker/blob/master/zimbra/Dockerfile

RUN mkdir /tmp/zcs && cd /tmp/zcs && wget -O- http://files2.zimbra.com/downloads/8.5.0_GA/zcs-8.5.0_GA_3042.UBUNTU14_64.20140828191919.tgz | tar xz

RUN apt-get update && apt-get install -y libgmp10 libperl5.18 libaio1 unzip pax sysstat sqlite3 rsync

# add generated config file
ADD config.install /tmp/zcs/config.install

RUN echo '127.0.0.1 ' `cat /tmp/zcs/config.install | head -1 | cut -c10-` >> /etc/hosts \
            && cd /tmp/zcs/zcs-8.5.0_GA_3042.UBUNTU14_64.20140828191919/ && ./install.sh -s ../config.install

RUN mv /opt/zimbra /opt/.zimbra
VOLUME ["/opt/zimbra"]

EXPOSE 22
EXPOSE 25
EXPOSE 456
EXPOSE 587
EXPOSE 110
EXPOSE 143
EXPOSE 993
EXPOSE 995
EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 8443
EXPOSE 7071

# https://github.com/phusion/baseimage-docker#running-scripts-during-container-startup

RUN mkdir -p /etc/my_init.d
ADD start.sh /etc/my_init.d/start.sh
ADD zimbra.sh /etc/service/zimbra/run

#
# See all changed conf : zmlocalconfig -n
#
#

