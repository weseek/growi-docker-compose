FROM weseek/growi:4
LABEL maintainer Yuki Takei <yuki@weseek.co.jp>

ENV APP_DIR /opt/growi

# install dockerize
ENV DOCKERIZE_VERSION v0.6.1
USER root
RUN apk add --no-cache --virtual .dl-deps curl \
    && curl -sL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
        | tar -xz -C /usr/local/bin \
    && apk del .dl-deps

WORKDIR ${APP_DIR}

# install plugins if necessary
# ;;
# ;; NOTE: In GROWI v3 and later,
# ;;       2 of official plugins (growi-plugin-lsx and growi-plugin-pukiwiki-like-linker)
# ;;       are now included in the 'weseek/growi' image.
# ;;       Therefore you will not need following lines except when you install third-party plugins.
# ;;
#RUN echo "install plugins" \
#  && yarn add \
#      growi-plugin-XXX \
#      growi-plugin-YYY \
#  && echo "done."
# you must rebuild if install plugin at least one
# RUN npm run build:prod
