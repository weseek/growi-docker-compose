FROM weseek/crowi-plus:1.0.0-RC6

ENV APP_DIR /opt/crowi-plus

WORKDIR ${APP_DIR}

# install plugins if necessary
RUN echo "install plugins" \
#  && npm install --save \
#      crowi-plugin-lsx \
#      crowi-plugin-pukiwiki-like-linker \
  && echo "done."

RUN npm run build:prod
