growi-docker-compose
=====================

Quick start [GROWI](https://github.com/weseek/growi) with docker-compose

![GROWI-x-dockercompose](https://user-images.githubusercontent.com/1638767/38307565-105956e2-384f-11e8-8534-b1128522d68d.png)

Start
------

```bash
git clone https://github.com/weseek/growi-docker-compose.git growi
cd growi
docker-compose up
```

and access to http://localhost:3000

### How to access from other than localhost

Edit `docker-compose.yml` and modify `ports` for app

#### Before

```yml
services:
  app:
    ports:
      - 127.0.0.1:3000:3000
```

#### After

```yml
services:
  app:
    ports:
      - 3000:3000
```

### For High-memory environment

If you have enough memory, increase heap size for Elasticsearch with `ES_JAVA_OPTS` value in `docker-compose.yml`.

```yml
environment:
  - "ES_JAVA_OPTS=-Xms2g -Xmx2g"
```

Upgrade
-------

```bash
# go to growi-docker-compose workdir
cd growi

# stop
docker-compose stop

# remove current container and images
docker-compose rm app
docker rmi crowiplus_app
docker rmi weseek/growi:3

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
  && yarn add \
     growi-plugin-XXX \
     growi-plugin-YYY \
  && echo "done."
# you must rebuild if install plugin at least one
RUN npm build:prod
```
    
NOTE: DISABLED Environment Variables
-------------------------------------

Followings are **unchangable**.

- PORT
- NODE_ENV

Followings are **disabled** because they are overwritten by `docker-compose.yml`

- MONGO_URI
- REDIS_URL
- PASSWORD_SEED

Change `docker-compose.yml` if you need.

Others conform to [weseek/growi](https://github.com/weseek/growi#environment-variables)


More convenient Examples
-------------------------

* [Multiple sites](https://github.com/weseek/growi-docker-compose/tree/master/examples/multi-app)
* [HTTPS(with Let's Encrypt) proxy integration](https://github.com/weseek/growi-docker-compose/tree/master/examples/https-portal)


Documentation
--------------

* [GROWI wiki](https://github.com/weseek/growi/wiki)
  * [Questions and Answers](https://github.com/weseek/growi/wiki/Questions-and-Answers)
  
  
Issues
------

If you have any problems or questions about this image, please contact us through a [GitHub issue](https://github.com/weseek/growi-docker-compose/issues).


License
---------

* The MIT License (MIT)
* See LICENSE file.
