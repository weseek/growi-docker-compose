crowi-plus-docker-compose
=========================

Quick start crowi-plus with docker-compose

Install and Start
------------------

```bash
git clone https://github.com/weseek/crowi-plus-docker-compose.git crowi-plus
cd crowi-plus
docker-compose up
```

and access to http://localhost:3000


Upgrade
-------

```bash
# go to crowi-plus-docker-compose workdir
cd crowi-plus

# stop
docker-compose stop

# rebuild app container image
git pull
docker rm crowiplus_app_1
docker rmi crowiplus_app
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

Following is **disabled** because `docker-compose.yml` overwrites them.

- PORT
- NODE_ENV
- MONGO_URI
- REDIS_URL

Change `docker-compose.yml` if you need.

Others conform to the official.
See https://github.com/crowi/crowi


Multiple sites
--------------

See [the example](https://github.com/weseek/crowi-plus-docker-compose/tree/master/examples/multi-app).


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
