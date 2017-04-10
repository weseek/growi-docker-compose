FROM weseek/crowi-plus:1.0.1

ENV APP_DIR /opt/crowi-plus

# install dockerize
ENV DOCKERIZE_VERSION v0.3.0
RUN apk add --no-cache --virtual .dl-deps curl \
    && curl -SL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
        | tar -xz -C /usr/local/bin \
    && apk del .dl-deps

WORKDIR ${APP_DIR}

# Corresponds to `FILE_UPLOAD=local`
RUN mkdir -p /data/uploads \
    && ln -s /data/uploads $APP_DIR/public/uploads

# install plugins if necessary
RUN echo "install plugins" \
#  && npm install --save \
#      crowi-plugin-lsx \
#      crowi-plugin-pukiwiki-like-linker \
  && echo "done."
# you must rebuild if install plugin at least one
# RUN npm run build:prod
