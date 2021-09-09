FROM weseek/growi:4
LABEL maintainer Yuki Takei <yuki@weseek.co.jp>

# install dockerize
ENV DOCKERIZE_VERSION v0.6.1
USER root
RUN apt-get update && apt-get install -y curl \
    && curl -sL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
        | tar -xz -C /usr/local/bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
