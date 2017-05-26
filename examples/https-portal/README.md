crowi-plus-docker-compose with HTTPS proxy Example
===================================================

This example enables the execution of crowi-plus with nginx proxy server that configured to using Let's Encrypt.

Install and Start
------------------

### clone repos and copy docker-compose.override.yml

```bash
git clone https://github.com/weseek/crowi-plus-docker-compose.git crowi-plus
cd crowi-plus
cp examples/https-portal/docker-compose.override.yml .
```

### Start

```bash
docker-compose up
```

and access to:

* https://example.com

