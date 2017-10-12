FROM openjdk:8-alpine

# install curl
RUN apk --update add --no-cache curl

# install embulk
RUN curl --create-dirs -o /usr/local/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar" && \
    chmod +x /usr/local/bin/embulk

# install digdag
RUN curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest" && \
    chmod +x /usr/local/bin/digdag

RUN mkdir /work
COPY config.yml /work/
COPY test.csv /work/
COPY mydag.dig /work/

WORKDIR /work

# locale setting
# RUN apt-get update && apt-get install -y --no-install-recommends locales && \
#     apt-get clean && \
#     rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
# RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
#     locale-gen && \
#     update-locale LANG="en_US.UTF-8"
  
CMD ["java", "-jar", "/usr/local/bin/digdag", "scheduler"]
