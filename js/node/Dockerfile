#################################
## Node js 4 \
##  + bower + yeoman + gulp
#################################

## Using google as example: https://hub.docker.com/r/google/nodejs/~/dockerfile/
#FROM ubuntu:15.04
FROM debian:jessie

MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# Install prerequisites
RUN apt-get update -y && apt-get install --no-install-recommends -y -q \
    curl python build-essential git ca-certificates
ENV TERM xterm

# Install NodeJs 4
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install --yes nodejs

# Install development packages
RUN npm install --global npm@latest
RUN npm install --global bower
RUN npm install --global gulp
RUN npm install --global yo
RUN npm install -g generator-gulp-angular
# # Fix issues with gulp angular installs as non root
# RUN apt-get install -y g++ gyp
# RUN npm install -g bcrypt
# ##  The real problem is here https://github.com/socketio/socket.io/issues/2228
RUN npm cache clean

# Development user (bower and yeoman do not really work well as root...)
ENV MAINDIR /devjs
ENV HOMEDIR /home/dev
RUN mkdir -p $MAINDIR
ENV NEWUSER developer
RUN mkdir -p $HOMEDIR
RUN useradd $NEWUSER -d $HOMEDIR \
    && chown -R $NEWUSER $HOMEDIR && chown -R $NEWUSER $MAINDIR
USER $NEWUSER
WORKDIR $MAINDIR
