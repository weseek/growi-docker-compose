FROM weseek/growi:4
LABEL maintainer Yuki Takei <yuki@weseek.co.jp>

ENV APP_DIR /opt/growi

# install dockerize
ENV DOCKERIZE_VERSION v0.6.1
USER root
RUN apt-get update && apt-get install -y curl \
    && curl -sL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
        | tar -xz -C /usr/local/bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR ${APP_DIR}

# install plugins if necessary
# ;;
# ;; NOTE: In GROWI v4.3 and later,
# ;;       some official plugins (growi-plugin-lsx, growi-plugin-pukiwiki-like-linker and growi-plugin-attachment-refs)
# ;;       are now included in the 'weseek/growi' image.
# ;;       Therefore you will not need following lines except when you install third-party plugins.
# ;;
#RUN echo "install plugins" \
#  && npx lerna add \
#      growi-plugin-XXX \
#      --scope @growi/app \
#  && echo "done."
# you must rebuild if install plugin at least one
# RUN npm run build:prod
