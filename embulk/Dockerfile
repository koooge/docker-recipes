# Usage:
# build: `docker build --no-cache -t someone/embulk .`
# run: `docker run -d --rm --name some-embulk -t someone/embulk`
# stop: `docker stop some-embulk`
# remove: `docker rmi someone/embulk`

FROM openjdk:8

RUN curl --create-dirs -o /usr/local/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar" && \
    chmod +x /usr/local/bin/embulk

COPY ./docker-entrypoint.sh /
COPY ./config.yml /

RUN apt-get update && apt-get install -y --no-install-recommends cron locales && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    update-locale LANG="en_US.UTF-8"
  
RUN echo '*/5 * * * * root /docker-entrypoint.sh' >> /etc/crontab

CMD ["cron", "-f"]
