crowi-plus-docker-compose
=========================

Quick start [crowi-plus](https://github.com/weseek/crowi-plus) with docker-compose

Install and Start
------------------

```bash
git clone https://github.com/weseek/crowi-plus-docker-compose.git crowi-plus
cd crowi-plus
docker-compose up
```

and access to http://localhost:3000


### For Low-memory environment

If you cannot allocate enough memory for Elasticsearch (for example when using AWS t2.micro instance),  
decrease heap size with `ES_JAVA_OPTS` value in `docker-compose.yml`.

```yml
environment:
  - "ES_JAVA_OPTS=-Xms256m -Xmx256m"
```

or just comment out these lines.

```yml
#environment:
#  - "ES_JAVA_OPTS=-Xms2g -Xmx2g"
```

Upgrade
-------

```bash
# go to crowi-plus-docker-compose workdir
cd crowi-plus

# stop
docker-compose stop

# remove current container and images
docker-compose rm app
docker rmi crowiplus_app
docker rmi weseek/crowi-plus:2

# rebuild app container image
git pull
docker-compose build

# start
docker-compose up
```

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

Following is **unchangable**.

- PORT
- NODE_ENV

Following is **disabled** because `docker-compose.yml` overwrite them.

- MONGO_URI
- REDIS_URL
- PASSWORD_SEED

Change `docker-compose.yml` if you need.

Others conform to the official.
See https://github.com/crowi/crowi


More convenient Examples
-------------------------

* [Multiple sites](https://github.com/weseek/crowi-plus-docker-compose/tree/master/examples/multi-app)
* [HTTPS(with Let's Encrypt) proxy integration](https://github.com/weseek/crowi-plus-docker-compose/tree/master/examples/https-portal)


Documentation
--------------

* [crowi-plus wiki](https://github.com/weseek/crowi-plus/wiki)
  * [Questions and Answers](https://github.com/weseek/crowi-plus/wiki/Questions-and-Answers)
  
  
Issues
------

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/weseek/crowi-plus-docker-compose/issues).


License
---------

* The MIT License (MIT)
* See LICENSE file.
