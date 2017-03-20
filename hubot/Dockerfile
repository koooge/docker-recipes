FROM buildpack-deps:jessie

MAINTAINER koooge

#ENV http_proxy http://:@:8080/
#ENV https_proxy https://:@:8080/
#ENV ftp_proxy ftp://:@:8080/

# verify gpg and sha256: http://nodejs.org/dist/v0.10.30/SHASUMS256.txt.asc
# gpg: aka "Timothy J Fontaine (Work) <tj.fontaine@joyent.com>"
# gpg: aka "Julien Gilli <jgilli@fastmail.fm>"
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys 7937DFD2AB06298B2293C3187D33FF9D0246406D 114F43EE0176B71C7BC219DD50A3051F888C628D

ENV NODE_VERSION 0.12.0
ENV NPM_VERSION 2.5.0

RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
	&& curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
	&& gpg --verify SHASUMS256.txt.asc \
	&& grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
	&& tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
	&& rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
#	&& npm -g config set proxy http://:@:8080/ \
#	&& npm -g config set https-proxy http://:@:8080/ \
	&& npm install -g npm@"$NPM_VERSION" \
	&& npm cache clear

RUN passwd -d root
RUN apt-get update
#RUN apt-get -y install sudo
RUN apt-get -y install vim
RUN npm install -g yo generator-hubot
RUN useradd -m hubot

USER hubot
RUN mkdir /home/hubot/hubot
WORKDIR /home/hubot/hubot

RUN npm install hubot-irc --save
RUN yes | yo hubot --defaults
RUN npm install

RUN npm install hubot-gohan -save
RUN npm install hubot-rss-reader -save
RUN npm install coffee-script@">=1.9" -save

RUN npm install iconv -save

ADD hubot /home/hubot/hubot
ADD kogedev /home/hubot/koge_dev

##CMD [ "bin/hubot", "-a", "irc", "--name", "kogebot" ]
