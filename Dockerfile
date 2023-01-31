# syntax = docker/dockerfile:1.4
FROM debian:stable-slim as fetch-dockerize

# install dockerize
ENV DOCKERIZE_VERSION v0.6.1
RUN apt-get update && apt-get install -y curl \
    && curl -sL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
        | tar -xz -C /usr/local/bin

ARG version=5
FROM weseek/growi:${version}
LABEL maintainer Yuki Takei <yuki@weseek.co.jp>

# install dockerize
ENV DOCKERIZE_VERSION v0.6.1

COPY --from=fetch-dockerize --link /usr/local/bin/dockerize /usr/local/bin/dockerize
