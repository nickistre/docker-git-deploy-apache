FROM debian:latest
MAINTAINER Nicholas Istre <nicholas.istre@e-hps.com>

# Use as base for deploying apache-based projects


ENV GITURL="" \
    PRIVATEKEY=""

# The following are relative to the root of the git repo.
ENV WEBROOT="" \
    SETUP_EXEC="" \
    SETUP_EXEC_ARGS=""

RUN apt-get update -y && apt-get dist-upgrade -y

RUN apt-get install -y apache2
RUN a2dissite 000-default.conf

RUN apt-get install -y git ssh-client

EXPOSE 80

COPY apache-foreground.sh /usr/local/sbin/apache-foreground
COPY deploy.sh /usr/local/sbin/deploy

COPY update-template.sh /usr/local/bin/update-template

COPY deploy.conf.template /etc/apache2/sites-available/deploy.conf.template

WORKDIR /var/www
CMD /usr/local/sbin/deploy && /usr/local/sbin/apache-foreground