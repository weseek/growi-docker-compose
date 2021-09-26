FROM node:12-slim

RUN apt-get update -y && apt-get install -y python3 build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev git

RUN git clone https://github.com/weseek/unique_ogp.git

WORKDIR /unique_ogp/src

RUN ["/bin/bash", "-c", "npm install"]

ENTRYPOINT node index.js
