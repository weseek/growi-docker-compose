FROM weseek/crowi-plus:1.0.0-RC6

ENV APP_DIR /opt/crowi-plus

# install dockerize
RUN apk add --no-cache curl
ENV DOCKERIZE_VERSION v0.3.0
RUN curl -SL wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
      | tar -xz -C /usr/local/bin dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR ${APP_DIR}

# install plugins if necessary
RUN echo "install plugins" \
#  && npm install --save \
#      crowi-plugin-lsx \
#      crowi-plugin-pukiwiki-like-linker \
  && echo "done."

CMD npm run build:prod:docker
