FROM phusion/baseimage:latest

# Set correct environment variables.
ENV HOME /root

# Install.
RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y software-properties-common wget

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add ssh key
ADD id_rsa.pub /tmp/id_rsa.pub
RUN cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys && rm -f /tmp/id_rsa.pub
