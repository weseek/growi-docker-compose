growi-docker-compose with growi-unique-ogp Integration Example
=====================================================

This example enables GROWI to integrate with growi-unique-ogp
so that user will be able to generate ogp.

Install and Start
------------------

### Clone repos and copy docker-compose.override.yml

```bash
git clone https://github.com/weseek/growi-docker-compose.git growi
cd growi
cp examples/growi-unique-ogp/docker-compose.override.yml .
```

### Add environment variables to `app` container

| variables               | example values                  | description                                                                                                       |
| ----------------------- | ------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `OGP_URI`            | `https://CHANGE-HERE` | growi-unique-ogp URI<br>which can be accessed from GROWI |


1. Open `docker-compose.yml`
2. Edit `app` container's settings
  1. Set `OGP_URI`

### Start

```bash
docker-compose up
```

and access to:

* http://localhost:8088 (OGP server directly)
