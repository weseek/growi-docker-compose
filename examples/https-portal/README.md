growi-docker-compose with HTTPS proxy Example
==============================================

This example enables the execution of GROWI with nginx proxy server that configured to using Let's Encrypt.

Install and Start
------------------

### Clone repos and copy docker-compose.override.yml

```bash
git clone https://github.com/weseek/growi-docker-compose.git growi
cd growi
cp examples/https-portal/docker-compose.override.yml .
```

### Start

```bash
docker-compose up
```

and access to:

* https://example.com

