FROM tomcat:8-jre8
MAINTAINER koooge <koooooge@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV OPENGROK_DIR /var/opengrok

RUN apt-get update && \
    apt-get install -y --no-install-recommends locales \
    exuberant-ctags \
    subverson && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN echo "Asia/Tokyo" > /etc/timezone && \
    dpkg-reconfigure tzdata

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    update-locale LANG="en_US.UTF-8"

RUN mkdir -p $OPENGROK_DIR/etc && \
    mkdir -p $OPENGROK_DIR/data && \
    mkdir -p $OPENGROK_DIR/src

RUN wget -O - https://github.com/OpenGrok/OpenGrok/releases/download/1.0/opengrok-1.0.tar.gz | tar zxvf -
RUN mv opengrok-* /opengrok

COPY docker-entrypoint.sh /
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]

EXPOSE 8080
