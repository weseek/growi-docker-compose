crowi-plus-docker-compose
=========================

Quick start crowi-plus with docker-compose

Usage
-----

```
git clone https://github.com/weseek/crowi-plus-docker-compose.git crowi-plus
cd crowi-plus
docker-compose up
```

and access to http://localhost:3000


How to install plugins
-----------------------

edit `Dockerfile` and activate commented out lines.

### Example

```dockerfile
# install plugins if necessary
RUN echo "install plugins" \
  && npm install --save \
     crowi-plugin-lsx \
     crowi-plugin-pukiwiki-like-linker \
  && echo "done."
# you must rebuild if install plugin at least one
RUN npm build:prod
```

NOTE: DISABLED Environment Variables
-------------------------------------

Following is **disabled** because `docker-compose.yml` overwrites them.

- PORT
- NODE_ENV
- MONGO_URI
- REDIS_URL

Change `docker-compose.yml` if you need.

Others conform to the official.
See https://github.com/crowi/crowi
